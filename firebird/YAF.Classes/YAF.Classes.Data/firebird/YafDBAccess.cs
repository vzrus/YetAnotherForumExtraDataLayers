/* Yet Another Forum.NET
 * Copyright (C) 2003-2005 Bjørnar Henden
 * Copyright (C) 2006-2009 Jaben Cargman
 * http://www.yetanotherforum.net/
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

using System.Diagnostics;
using YAF.Types;
using YAF.Types.Interfaces;
using YAF.Utils;
using YAF.Utils.Helpers;

namespace YAF.Classes.Data
{
  using System;
  using System.Collections.Generic;
  using System.Configuration;
  using System.Data;
  using System.Linq;
  using FirebirdSql.Data.FirebirdClient;
  using YAF.Classes.Pattern;
  using System.Diagnostics.CodeAnalysis;

  /// <summary>
  /// The yaf db access for SQL Server.
  /// </summary>
    public class FbDbAccess : IDbAccess
  {
      #region Constants and Fields
      
      /// <summary>
      /// The _isolation level.
      /// </summary>
      static private IsolationLevel _isolationLevel = IsolationLevel.ReadUncommitted;
      
      private static string _dbOwner;
      private static string _objectQualifier;
      private static string _schemaName;
      private static string _databaseName;
      private static string _granteeName;
      private static string _hostName;
      private static string _databaseEncoding;
      private static string _databaseCollation;

      /// <summary>
      /// The _connection manager type.
      /// </summary>
      private Type _connectionManagerType = typeof(FbDbConnectionManager);
      
      /// <summary>
      /// Result filter list
      /// </summary>
      private IList<IDataTableResultFilter> _resultFilterList = new List<IDataTableResultFilter>();
      
      #endregion
      
      #region Properties

      /// <summary>
      ///   Gets Current IDbAccess -- needs to be switched to direct injection into all DB classes.
      /// </summary>
      public static IDbAccess Current
      {
          get
          {
              return ServiceLocatorAccess.CurrentServiceProvider.Get<IDbAccess>();
          }
      }

      /// <summary>
      /// The get connection manager.
      /// </summary>
      /// <returns>
      /// </returns>
      [CanBeNull]
      public IDbConnectionManager GetConnectionManager()
      {
          return Activator.CreateInstance(this._connectionManagerType).ToClass<IDbConnectionManager>();
      }
      [CanBeNull]
      public IDbConnectionManager GetConnectionManager(string connectionString)
      {
          return GetConnectionManager();
      }
      [CanBeNull]
      public IDbConnectionManager GetConnectionManager(int boardOrObjectId)
      {
          return GetConnectionManager();
      }

      /// <summary>
      /// Change the Connection Manager used in all DB operations.
      /// </summary>
      /// <typeparam name="TManager">
      /// </typeparam>
      public void SetConnectionManagerAdapter<TManager>()
        where TManager : IDbConnectionManager
      {
          Type newConnectionManager = typeof(TManager);

          if (typeof(IDbConnectionManager).IsAssignableFrom(newConnectionManager))
          {
              this._connectionManagerType = newConnectionManager;
          }
      }

      static public IsolationLevel IsolationLevel
      {
          get
          {
              return _isolationLevel;
          }
      }

      static public string DatabaseOwner
      {
          get
          {
              if (_dbOwner == null)
              {
                  _dbOwner = Config.DatabaseOwner;
              }

              return _dbOwner;
          }
      }

      static public string ObjectQualifier
      {
          get
          {
              if (_objectQualifier == null)
              {
                  _objectQualifier = Config.DatabaseObjectQualifier;
              }

              return _objectQualifier;
          }
      }
     
      static public string SchemaName
      {
          get
          {
              if (_schemaName == null)
              {
                  _schemaName = ConfigurationManager.AppSettings["YAF.DatabaseSchemaName"];
              }
              return _schemaName;

          }
      }
      
      static public string DatabaseEncoding
      {
          get
          {
              if (_databaseEncoding == null)
              {
                  _databaseEncoding = ConfigurationManager.AppSettings["YAF.DatabaseEncoding"];
              }
              return _databaseEncoding;

          }
      }
      
      static public string DatabaseCollation
      {
          get
          {
              if (_databaseCollation == null)
              {
                  _databaseCollation = Config.GetConfigValueAsString("YAF.DatabaseCollation");
              }

              return _databaseCollation;
          }
      }
      
      static public string GranteeName
      {
          get
          {
              if (_granteeName == null)
              {
                  _granteeName = ConfigurationManager.AppSettings["YAF.DatabaseGranteeName"];
              }
              return _granteeName;

          }
      }
      
      static public string DBName
      {
          get
          {
              string[] parmRows = Config.ConnectionString.Split(';');

              for (int i = 0; i < parmRows.Length; i++)
              {
                  string[] parmParams = parmRows[i].Split('=');
                  for (int j = 0; j < parmRows.Length; j++)
                  {
                      if (parmParams[0].Trim().ToLower() == "database")
                      {
                          string[] addrSplit = parmParams[1].Split(@"\".ToCharArray());
                          _databaseName = addrSplit[addrSplit.Length - 1].Substring(0, addrSplit[addrSplit.Length - 1].Length - 4);
                          break;
                      }
                  }
              }
              return _databaseName;



          }
      }
      
      static public string HostName
      {
          get
          {
              if (_hostName == null)
              {
                  _hostName = ConfigurationManager.AppSettings["YAF.DatabaseHostName"];
              }
              return _hostName;

          }
      }

      /// <summary>
      /// Gets the Result Filter List.
      /// </summary>
      /// <exception cref="NotImplementedException">
      /// </exception>
      public IList<IDataTableResultFilter> ResultFilterList
      {
          get
          {
              return this._resultFilterList;
          }
      }
      
      #endregion

      #region Public Methods

      /// <summary>
      /// Gets qualified object name
      /// </summary>
      /// <param name="name">Base name of an object</param>
      /// <returns>Returns qualified object name of format {databaseOwner}.{objectQualifier}name</returns>
      static public string GetObjectName(string name)
      {
          return String.Format(
                          "{0}{1}",
                          ObjectQualifier,
                          name
                          );
      }
     
      public static string GetConnectionString(
          string parm1,
          string parm2,
          string parm3,
          string parm4,
          string parm5,
          string parm6,
          string parm7,
          string parm8,
          string parm9,
          string parm10,
          bool parm11,
          bool parm12,
          bool parm13,
          bool parm14,
          bool parm15,
          bool parm16,
          bool parm17,
          bool parm18,
          bool parm19,
          string userID,
          string userPassword)
      {
          String st = parm1.Replace(@"\\", @"\");

          FbConnectionStringBuilder connBuilder =
              new FbConnectionStringBuilder("Database=" + st + ";Port=" +
                  parm4 + ";Dialect=" + parm2 + ";Charset=" + parm3 + ";UserID=" + userID + ";userPassword=" + userPassword);

          /* switch (Convert.ToInt32(parm5))
           {
               case 0:
                   connBuilder.ServerType = FbServerType.Context;
                   break;
               case 1:
                   connBuilder.ServerType = FbServerType.Default;
                   break;              
               case 2:
                   connBuilder.ServerType = FbServerType.Embedded;
                   break;
               default:
                   connBuilder.ServerType = FbServerType.Context;
                   break;
           }*/



          connBuilder.Database = parm1;
          connBuilder.ConnectionLifeTime = Convert.ToInt32(parm9);
          connBuilder.Dialect = Convert.ToInt32(parm2);
          connBuilder.Charset = parm3;
          connBuilder.Port = Convert.ToInt32(parm4);
          connBuilder.Role = parm7;
          connBuilder.ConnectionTimeout = Convert.ToInt32(parm8);
          connBuilder.Pooling = parm13;
          connBuilder.UserID = userID;
          connBuilder.Password = userPassword;

          //  connBuilder.PacketSize
          // connBuilder.ClientLibrary = "";


          return connBuilder.ConnectionString;

      }

      /// <summary>
      /// Test the DB Connection.
      /// </summary>
      /// <param name="exceptionMessage">
      /// outbound ExceptionMessage
      /// </param>
      /// <returns>
      /// true if successfully connected
      /// </returns>
      public static bool TestConnection(string connectionString, [NotNull] out string exceptionMessage)
      {
          exceptionMessage = string.Empty;
          bool success = false;

          try
          {
              using (var connection = Current.GetConnectionManager(connectionString))
              {
                  // attempt to connect to the db...
                  var conn = connection.OpenDBConnection;
              }

              // success
              success = true;
          }
          catch (Exception x)
          {
              // unable to connect...
              exceptionMessage = x.Message;
          }

          return success;
      }
      /// <summary>
      /// The get dataset.
      /// </summary>
      /// <param name="cmd">
      /// The cmd.
      /// </param>
      /// <param name="transaction">
      /// The transaction.
      /// </param>
      /// <returns>
      /// </returns>
      [NotNull]
      public DataSet GetDataset([NotNull] IDbCommand cmd, bool transaction, string connectionString)
      {
          throw new Exception("Not in use for the data layer.");
      }
      /// <summary>
      /// Creates new FbCommand based on command text applying all qualifiers to the name.
      /// </summary>
      /// <param name="commandText">Command text to qualify.</param>
      /// <param name="isText">Determines whether command text is text or stored procedure.</param>
      /// <returns>New FbCommand</returns>
      static public FbCommand GetCommand(string commandText, bool isText)
      {

          return GetCommand(commandText, isText, null);
      }
     
      /// <summary>
      /// Creates new FbCommand based on command text applying all qualifiers to the name.
      /// </summary>
      /// <param name="commandText">Command text to qualify.</param>
      /// <param name="isText">Determines whether command text is text or stored procedure.</param>
      /// <param name="connection">Connection to use with command.</param>
      /// <returns>New FbCommand</returns>
      static public FbCommand GetCommand(string commandText, bool isText, FbConnection connection)
      {
          if (isText)
          {             

              FbCommand cmd = new FbCommand();

              cmd.CommandType = CommandType.Text;
              cmd.CommandText = GetCommandTextReplaced(commandText);
              cmd.Connection = connection;

              return cmd;
          }
          else
          {
              return GetCommand(commandText);
          }
      } 
      
      /// <summary>
      /// Creates new FbCommand calling stored procedure applying all qualifiers to the name.
      /// </summary>
      /// <param name="storedProcedure">Base of stored procedure name.</param>
      /// <returns>New FbCommand</returns>
      static public FbCommand GetCommand(string storedProcedure)
      {
          return GetCommand(storedProcedure, null);
      }
      /// <summary>
      /// Creates new FbCommand calling stored procedure applying all qualifiers to the name.
      /// </summary>
      /// <param name="storedProcedure">Base of stored procedure name.</param>
      /// <param name="connection">Connection to use with command.</param>
      /// <returns>New FbCommand</returns>
      static public FbCommand GetCommand(string storedProcedure, FbConnection connection)
      {
          FbCommand cmd = new FbCommand();

          cmd.CommandType = CommandType.StoredProcedure;
          cmd.CommandText = GetObjectName(storedProcedure);
          cmd.Connection = connection;

          return cmd;
      }
       
      /// <summary>
      /// Gets command text replaced with {databaseOwner} and {objectQualifier}.
      /// </summary>
      /// <param name="commandText">Test to transform.</param>
      /// <returns></returns>
      public static string GetCommandTextReplaced(string commandText)
        {
            commandText = commandText.Replace("{databaseOwner}", DatabaseOwner);
            // apply object qualifier
            if (!String.IsNullOrEmpty(Config.DatabaseObjectQualifier))
            { commandText = commandText.Replace("objQual_", Config.DatabaseObjectQualifier.ToUpper()); }
            else
            { commandText = commandText.Replace("objQual_", "YAF_"); }
            return commandText;
        }

      /// <summary>
      /// Gets data out of the database
      /// </summary>
      /// <param name="cmd">The FbCommand</param>
      /// <returns>DataTable with the results</returns>
      /// <remarks>Without transaction.</remarks>      
      public DataTable GetData(IDbCommand cmd, string connectionString)
      {
          return GetDataTableFromReader(cmd, false, true, connectionString);
      }
      public DataTable GetData(IDbCommand cmd, bool transaction, string connectionString)
      {
          return GetDataTableFromReader(cmd, transaction, true, connectionString);
      }
      public DataTable GetData(IDbCommand cmd, bool transaction, bool acceptChanges, string connectionString)
      {
          return GetDataTableFromReader(cmd, transaction, acceptChanges, connectionString);
      }

      /// <summary>
      /// Gets data out of database using a plain text string command
      /// </summary>
      /// <param name="commandText">command text to be executed</param>
      /// <returns>DataTable with results</returns>
      /// <remarks>Without transaction.</remarks>
      /// Gets data out of database using a plain text string command
      /// </summary>
      /// <param name="commandText">command text to be executed</param>
      /// <returns>DataTable with results</returns>
      /// <remarks>Without transaction.</remarks>
      public DataTable GetData(string commandText, string connectionString)
      {
          return GetData(commandText, false, connectionString);
      }
      public DataTable GetData(string commandText, bool transaction, string connectionString)
      {
          QueryCounter qc = new QueryCounter(commandText);
          try
          {
              using (FbCommand cmd = new FbCommand())
              {
                  cmd.CommandType = CommandType.Text;
                  cmd.CommandText = commandText;
                  // return GetDatasetBasic(cmd, transaction).Tables[0];
                  return GetDataTableFromReader(cmd, transaction,connectionString);
              }
          }
          finally
          {
              qc.Dispose();
          }
      }

      /// <summary>
      /// Executes a NonQuery
      /// </summary>
      /// <param name="cmd">NonQuery to execute</param>
      /// <remarks>Without transaction</remarks>
      public void ExecuteNonQuery(IDbCommand cmd, string connectionString)
      {
          // defaults to using a transaction for non-queries
          ExecuteNonQuery(cmd, true, connectionString);
      }
      public void ExecuteNonQuery(IDbCommand cmd, bool transaction, string connectionString)
      {
          QueryCounter qc = new QueryCounter(cmd.CommandText);
          try
          {
              using (FbDbConnectionManager connMan = new FbDbConnectionManager())
              {
                  // get an open connection
                  cmd.Connection = connMan.OpenDBConnection;

                  if (transaction)
                  {
                      // execute using a transaction
                      using (FbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
                      {
                          cmd.Transaction = trans;
                          cmd.ExecuteNonQuery();
                          trans.Commit();
                      }
                  }
                  else
                  {
                      // don't use a transaction
                      cmd.ExecuteNonQuery();
                  }
              }
          }
          finally
          {
              qc.Dispose();
          }
      }
      /* public int ExecuteNonQueryInt(FbCommand cmd)
       {
           // defaults to using a transaction for non-queries
           return ExecuteNonQueryInt(cmd, true);
       }
       public int ExecuteNonQueryInt(FbCommand cmd, bool transaction)
       {
           QueryCounter qc = new QueryCounter(cmd.CommandText);
           try
           {
               using (YafDBConnManager connMan = new YafDBConnManager())
               {
                   // get an open connection
                   cmd.Connection = connMan.OpenDBConnection;

                   if (transaction)
                   {
                       int result = -1;
                       // execute using a transaction
                       using (FbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
                       {
                           cmd.Transaction = trans;
                           result = cmd.ExecuteNonQuery();
                           trans.Commit();
                           return result;
                       }
                   }
                   else
                   {
                       // don't use a transaction
                       return cmd.ExecuteNonQuery();
                   }
               }
           }
           finally
           {
               qc.Dispose();
           }
       } */
      public object ExecuteScalar(FbCommand cmd, string connectionString)
      {
          // default to using a transaction for scaler commands
          return ExecuteScalar(cmd, true, connectionString);
      }
      /// <summary>
      /// The execute scalar.
      /// </summary>
      /// <param name="cmd">
      /// The cmd.
      /// </param>
      /// <param name="transaction">
      /// The transaction.
      /// </param>
      /// <returns>
      /// The execute scalar.
      /// </returns>
      public object ExecuteScalar([NotNull] IDbCommand cmd, bool transaction, string connectionString)
      {
          using (var qc = new QueryCounter(cmd.CommandText))
          {
              using (var connectionManager = this.GetConnectionManager())
              {
                  // get an open connection
                  cmd.Connection = connectionManager.OpenDBConnection;

                  Trace.WriteLine(cmd.ToDebugString(), "DbAccess");

                  if (transaction)
                  {
                      // get scalar using a transaction
                      using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
                      {
                          cmd.Transaction = trans;
                          object results = cmd.ExecuteScalar();
                          trans.Commit();
                          return results;
                      }
                  }
                  else
                  {
                      // get scalar regular
                      return cmd.ExecuteScalar();
                  }
              }
          }
      }
     
      // vzrus addons - to make casts workarounds
      public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, string connectionString)
      {
          return AddValuesToDataTableFromReader(cmd, dt, transaction, acceptChanges, firstColumnIndex, 0, connectionString);
      }
      public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, int currentRow, string connectionString)
      {

         using (var qc = new QueryCounter(cmd.CommandText))
          {
              using (var connectionManager = this.GetConnectionManager())
              {
                  // get an open connection
                  cmd.Connection = connectionManager.OpenDBConnection;

                  Trace.WriteLine(cmd.ToDebugString(), "DbAccess");

                  if (transaction)
                  {
                      // get scalar using a transaction
                      using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
                      {

                          cmd.Transaction = trans;
                          IDataReader reader = cmd.ExecuteReader();
                          if (currentRow == 0)
                          {
                              firstColumnIndex = dt.Columns.Count;
                              // Retrieve column schema into a DataTable.                               
                              dt = GetTableColumns(dt, reader);
                          }

                          if (reader.FieldCount > 0)
                          {

                              while (reader.Read())
                              {
                                  //  for (int rc = 0; rc <= dt.Rows.Count - 1; rc++)
                                  // {
                                  int dd = 0;

                                  foreach (DataColumn column in dt.Columns)
                                  {
                                      dd = column.Ordinal;
                                      if (dd >= firstColumnIndex && dd <= dt.Columns.Count - 1)
                                      {
                                          //  dt.Rows[currentRow][column] = reader[column.Ordinal - firstColumnIndex];
                                          dt.Rows[currentRow][column] = TypeChecker(column, reader[column.Ordinal - firstColumnIndex]);
                                      }

                                  }


                                  // }

                              }

                          }
                          reader.Close();
                          trans.Commit();
                          if (acceptChanges) dt.AcceptChanges();
                          return dt;
                      }
                  }

                  else
                  {
                      // get DataReader
                      IDataReader reader = cmd.ExecuteReader();


                      if (currentRow == 0)
                      {
                          firstColumnIndex = dt.Columns.Count;
                          // Retrieve column schema into a DataTable.                         
                          dt = GetTableColumns(dt, reader);
                      }

                      if (reader.FieldCount > 0)
                      {
                          while (reader.Read())
                          {
                              int dd = 0;
                              foreach (DataColumn column in dt.Columns)
                              {
                                  dd = column.Ordinal;
                                  if (dd >= firstColumnIndex && dd <= dt.Columns.Count - 1)
                                  {
                                      // dt.Rows[currentRow][column] = GetDataTableFromReaderAddValue(dt.Rows[currentRow], column, reader[column.Ordinal - firstColumnIndex]);
                                      //  dt.Rows[currentRow][column] = reader[column.Ordinal - firstColumnIndex];
                                      dt.Rows[currentRow][column] = TypeChecker(column, reader[column.Ordinal - firstColumnIndex]);
                                  }

                              }
                          }

                      }
                      reader.Close();
                      if (acceptChanges) dt.AcceptChanges();
                      return dt;
                  }


              }
          }


        


      }

      /// <summary>
      /// Returns DataTable from DataReader.
      /// </summary>
      /// <param name="cmd">MySql command returning selected values</param>
      /// <param name="dca">Array of DataColumn values. The correspond to select columns names in a query or sp.</param>
      /// <returns></returns>     
      public DataTable GetDataTableFromReader(IDbCommand cmd, string connectionString)
      {
          return GetDataTableFromReader(cmd, false, true,  connectionString);
      }
      public DataTable GetDataTableFromReader(IDbCommand cmd,
            bool transaction, string connectionString)
      {
          return GetDataTableFromReader(cmd, transaction, true, connectionString);
      }
      public DataTable GetDataTableFromReader(IDbCommand cmd,
         bool transaction, bool acceptChanges, string connectionString)
      {

          QueryCounter qc = new QueryCounter(cmd.CommandText);
          try
          {
              DataTable dt = new DataTable();

              using (var connectionManager = this.GetConnectionManager())
              {
                  // get an open connection
                  cmd.Connection = connectionManager.OpenDBConnection;

                  Trace.WriteLine(cmd.ToDebugString(), "DbAccess");


                  if (transaction)
                  {

                      using (IDbTransaction trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
                      {

                          cmd.Transaction = trans;
                          IDataReader reader = cmd.ExecuteReader();
                          // Retrieve column schema into our DataTable.                          
                          // dt = TableSchemaReader(dt, reader);
                          dt = GetTableColumns(dt, reader);
                          if (reader.FieldCount > 0)
                          {
                              while (reader.Read())
                              {
                                  DataRow dr = dt.NewRow();

                                  foreach (DataColumn column in dt.Columns)
                                  {
                                      dr[column] = TypeChecker(column, reader[column.Ordinal]);
                                      //dr[column] = reader[column.Ordinal];                                                                                 
                                  }

                                  dt.Rows.Add(dr);
                              }
                          }
                          reader.Close();
                          trans.Commit();
                          if (acceptChanges) dt.AcceptChanges();
                          return dt;
                      }
                  }

                  else
                  {
                      // get scalar regular
                      IDataReader reader = cmd.ExecuteReader();
                      // Retrieve column schema into our DataTable.                        
                      dt = GetTableColumns(dt, reader);
                      if (reader.FieldCount > 0)
                      {
                          while (reader.Read())
                          {

                              DataRow dr = dt.NewRow();

                              foreach (DataColumn column in dt.Columns)
                              {
                                      dr[column] = TypeChecker(column, reader[column.Ordinal]);
                              }

                              dt.Rows.Add(dr);
                          }
                      }
                      reader.Close();
                      if (acceptChanges) dt.AcceptChanges();
                      return dt;
                  }


              }
          }


          finally
          {
              qc.Dispose();
          }


      }

      #endregion 

      #region Private Methods

      static private object TypeChecker(DataColumn column, object readerValue)
      {
          var o = readerValue;
        
          if (column.DataType.ToString() =="System.Boolean")
          {
              if (readerValue.ToType<int>() == 1)
              {
                  return true;
              }
              return false;
          }
          return o;
      }
      static private DataTable GetTableColumns(DataTable dummyTable, IDataReader reader)
      {
          DataTable schemaTable = reader.GetSchemaTable();

          foreach (DataRow myField in schemaTable.Rows)
          {
              String ts = myField["DataType"].ToString();
              if (ts == "System.Int16" ) ts = "System.Boolean";
              if (ts == "System.String" && (myField["ColumnSize"].ToType<int>() == 1)) ts = "System.Boolean";
              if (!dummyTable.Columns.Contains(myField["ColumnName"].ToString()))
              {
                  dummyTable.Columns.Add(myField["ColumnName"].ToString(), Type.GetType(ts));
              }
              else
              {
                  if (!myField["ColumnName"].ToString().Contains("81_18"))
                  {
                      dummyTable.Columns.Add(myField["ColumnName"].ToString() + "81_18", Type.GetType(ts));
                  }
              }

          }
          return dummyTable;
      }
      static private DataTable TableSchemaReader(DataTable dt, IDataReader reader)
      {


          DataTable schemaTable = reader.GetSchemaTable();
          foreach (DataRow myField in schemaTable.Rows)
          {
              foreach (DataColumn myColumn in schemaTable.Columns)
              {
                  if (myColumn.ColumnName == "ColumnName")
                  {
                      String ts = myField["DataType"].ToString();
                      if (ts == "System.Int16") ts = "System.Boolean";

                      if (!dt.Columns.Contains(myField[myColumn].ToString()))
                      {

                          dt.Columns.Add(myField[myColumn].ToString(), Type.GetType(ts));
                      }
                      else
                      {
                          if (!myField[myColumn].ToString().Contains("81_18"))
                          {
                              dt.Columns.Add(myField[myColumn].ToString() + "81_18", Type.GetType(ts));
                          }
                      }
                  }
              }

          }
          return dt;
      }
     
      #endregion
  }
}