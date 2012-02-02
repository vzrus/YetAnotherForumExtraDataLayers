/* Yet Another Forum.NET MySQL data layer by vzrus
 * Copyright (C) 2006-2012 Vladimir Zakharov
 * https://github.com/vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 only
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
 *
 * http://www.yetanotherforum.net/
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License.
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

using System.Configuration;

namespace YAF.Classes.Data
{
  #region Using

  using System;
  using System.Collections.Generic;
  using System.Data;
  using System.Diagnostics;
  using System.Linq;

  using YAF.Types;
  using YAF.Types.Interfaces;
  using YAF.Utils;
  using YAF.Utils.Helpers;

  using FirebirdSql.Data.FirebirdClient;

  #endregion

  /// <summary>
  /// The yaf db access for SQL Server.
  /// </summary>
  public class MsSqlDbAccess : IDbAccess
  {
    #region Constants and Fields

    /// <summary>
    ///   Result filter list
    /// </summary>
    private readonly IList<IDataTableResultFilter> _resultFilterList = new List<IDataTableResultFilter>();

    /// <summary>
    ///   The _isolation level.
    /// </summary>
    private static IsolationLevel _isolationLevel = IsolationLevel.ReadUncommitted;

    /// <summary>
    ///   The _connection manager type.
    /// </summary>
    private Type _connectionManagerType = typeof(MsSqlDbConnectionManager);

    private static string _dbOwner;
    private static string _objectQualifier;
    private static string _schemaName;
    private static string _databaseName;
    private static string _granteeName;
    private static string _hostName;
    private static string _databaseEncoding;
    private static string _databaseCollation;

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
    ///   Gets IsolationLevel.
    /// </summary>
    public static IsolationLevel IsolationLevel
    {
      get
      {
        return _isolationLevel;
      }
    }

    /// <summary>
    ///   Gets the Result Filter List.
    /// </summary>
    /// <exception cref = "NotImplementedException">
    /// </exception>
    public IList<IDataTableResultFilter> ResultFilterList
    {
      get
      {
        return this._resultFilterList;
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

    #endregion

    #region Public Methods

    /// <summary>
    /// A method to handle custom scripts execution tags
    /// </summary>
    /// <param name="scriptChunk">
    /// Input string
    /// </param>
    /// <param name="versionSQL">
    /// SQL server version as ushort
    /// </param>
    /// <returns>
    /// Returns an empty string if condition was not and cleanedfrom tags string if was.
    /// </returns>
    [NotNull]
    public static string CleanForSQLServerVersion([NotNull] string scriptChunk, ushort versionSQL)
    {
      if (!scriptChunk.Contains("#IFSRVVER"))
      {
        return scriptChunk;
      }
      else
      {
        int indSign = scriptChunk.IndexOf("#IFSRVVER") + 9;
        string temp = scriptChunk.Substring(indSign);
        int indEnd = temp.IndexOf("#");
        int indEqual = temp.IndexOf("=");
        int indMore = temp.IndexOf(">");

        if (indEqual >= 0 && indEqual < indEnd)
        {
          ushort indVerEnd = Convert.ToUInt16(temp.Substring(indEqual + 1, indEnd - indEqual - 1).Trim());
          if (versionSQL == indVerEnd)
          {
            return scriptChunk.Substring(indEnd + indSign + 1);
          }
        }

        if (indMore >= 0 && indMore < indEnd)
        {
          ushort indVerEnd = Convert.ToUInt16(temp.Substring(indMore + 1, indEnd - indMore - 1).Trim());
          if (versionSQL > indVerEnd)
          {
            return scriptChunk.Substring(indEnd + indSign + 1);
          }
        }

        return string.Empty;
      }
    }

    /// <summary>
    /// Creates new FbCommand based on command text applying all qualifiers to the name.
    /// </summary>
    /// <param name="commandText">
    /// Command text to qualify.
    /// </param>
    /// <param name="isText">
    /// Determines whether command text is text or stored procedure.
    /// </param>
    /// <returns>
    /// New FbCommand
    /// </returns>
    public static FbCommand GetCommand([NotNull] string commandText, bool isText)
    {
      return GetCommand(commandText, isText, null);
    }

    /// <summary>
    /// Creates new FbCommand based on command text applying all qualifiers to the name.
    /// </summary>
    /// <param name="commandText">
    /// Command text to qualify.
    /// </param>
    /// <param name="isText">
    /// Determines whether command text is text or stored procedure.
    /// </param>
    /// <param name="connection">
    /// Connection to use with command.
    /// </param>
    /// <returns>
    /// New FbCommand
    /// </returns>
    public static FbCommand GetCommand([NotNull] string commandText, bool isText, [NotNull] FbConnection connection)
    {
      return isText
               ? new FbCommand
                 {
                   CommandType = CommandType.Text, 
                   CommandText = GetCommandTextReplaced(commandText), 
                   Connection = connection
                 }
               : GetCommand(commandText);
    }

    /// <summary>
    /// Creates new FbCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <returns>
    /// New FbCommand
    /// </returns>
    [NotNull]
    public static FbCommand GetCommand([NotNull] string storedProcedure)
    {
      return GetCommand(storedProcedure, null);
    }

    /// <summary>
    /// Creates new FbCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <param name="connection">
    /// Connection to use with command.
    /// </param>
    /// <returns>
    /// New FbCommand
    /// </returns>
    [NotNull]
    public static FbCommand GetCommand([NotNull] string storedProcedure, [NotNull] FbConnection connection)
    {
      var cmd = new FbCommand
        {
          CommandType = CommandType.StoredProcedure, 
          CommandText = GetObjectName(storedProcedure), 
          Connection = connection, 
          CommandTimeout = int.Parse(Config.SqlCommandTimeout)
        };

      return cmd;
    }


    [NotNull]
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
    public static bool TestConnection([NotNull] out string exceptionMessage)
    {
      exceptionMessage = string.Empty;
      bool success = false;

      try
      {
        using (var connection = Current.GetConnectionManager())
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

    #endregion

    #region Implemented Interfaces

    #region IDbAccess
    /// <summary>
    /// Executes a NonQuery
    /// </summary>
    /// <param name="cmd">NonQuery to execute</param>
    /// <remarks>Without transaction</remarks>
    public void ExecuteNonQuery(IDbCommand cmd)
    {
        // defaults to using a transaction for non-queries
        ExecuteNonQuery(cmd, true);
    }
    /// <summary>
    /// The execute non query.
    /// </summary>
    /// <param name="cmd">
    /// The cmd.
    /// </param>
    /// <param name="transaction">
    /// The transaction.
    /// </param>
    public void ExecuteNonQuery([NotNull] IDbCommand cmd, bool transaction)
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
            // execute using a transaction
            using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
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
    }
    public object ExecuteScalar(FbCommand cmd)
    {
        // default to using a transaction for scaler commands
        return ExecuteScalar(cmd, true);
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
    public object ExecuteScalar([NotNull] IDbCommand cmd, bool transaction)
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

    // vzrus addons - to make casts workarounds
    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex)
    {
        return AddValuesToDataTableFromReader(cmd, dt, transaction, acceptChanges, firstColumnIndex, 0);
    }
    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, int currentRow)
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
    public DataTable GetDataTableFromReader(IDbCommand cmd)
    {
        return GetDataTableFromReader(cmd, false, true);
    }
    public DataTable GetDataTableFromReader(IDbCommand cmd,
          bool transaction)
    {
        return GetDataTableFromReader(cmd, transaction, true);
    }
    public DataTable GetDataTableFromReader(IDbCommand cmd,
       bool transaction, bool acceptChanges)
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
    /// <summary>
    /// Gets data out of the database
    /// </summary>
    /// <param name="cmd">The FbCommand</param>
    /// <returns>DataTable with the results</returns>
    /// <remarks>Without transaction.</remarks>      
    public DataTable GetData(IDbCommand cmd)
    {
        return GetDataTableFromReader(cmd, false, true);
    }
    public DataTable GetData(IDbCommand cmd, bool transaction, bool acceptChanges)
    {
        return GetDataTableFromReader(cmd, transaction, acceptChanges);
    }
    /// <summary>
    /// The get data.
    /// </summary>
    /// <param name="cmd">
    /// The cmd.
    /// </param>
    /// <param name="transaction">
    /// The transaction.
    /// </param>
    /// <returns>
    /// </returns>
    public DataTable GetData([NotNull] IDbCommand cmd, bool transaction)
    {
        return GetDataTableFromReader(cmd, true, true);
    }

    /// <summary>
    /// The get data.
    /// </summary>
    /// <param name="commandText">
    /// The command text.
    /// </param>
    /// <param name="transaction">
    /// The transaction.
    /// </param>
    /// <returns>
    /// </returns>
    public DataTable GetData([NotNull] string commandText, bool transaction)
    {
      using (var qc = new QueryCounter(commandText))
      {
        using (var cmd = new FbCommand())
        {
          cmd.CommandType = CommandType.Text;
          cmd.CommandText = commandText;
          return this.ProcessUsingResultFilters(this.GetDatasetBasic(cmd, transaction).Tables[0], commandText);
        }
      }
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
    public DataSet GetDataset([NotNull] IDbCommand cmd, bool transaction)
    {
      using (var qc = new QueryCounter(cmd.CommandText))
      {
        return this.GetDatasetBasic(cmd, transaction);
      }
    }

    #endregion

    #endregion

    #region Methods

    /// <summary>
    /// Used internally to get data for all the other functions
    /// </summary>
    /// <param name="cmd">
    /// </param>
    /// <param name="transaction">
    /// </param>
    /// <returns>
    /// </returns>
    [NotNull]
    private DataSet GetDatasetBasic([NotNull] IDbCommand cmd, bool transaction)
    {
      using (var connectionManager = this.GetConnectionManager())
      {
        // see if an existing connection is present
        if (cmd.Connection == null)
        {
          cmd.Connection = connectionManager.OpenDBConnection;
        }
        else if (cmd.Connection != null && cmd.Connection.State != ConnectionState.Open)
        {
          cmd.Connection.Open();
        }

        // create the adapters
        using (var ds = new DataSet())
        {
          using (var da = new FbDataAdapter())
          {
            da.SelectCommand = (FbCommand)cmd;
            da.SelectCommand.Connection = (FbConnection)cmd.Connection;
            Trace.WriteLine(cmd.ToDebugString(), "DbAccess");

            // use a transaction
            if (transaction)
            {
              using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
              {
                try
                {
                  da.SelectCommand.Transaction = (FbTransaction)trans;
                  da.Fill(ds);
                }
                finally
                {
                  trans.Commit();
                }
              }
            }
            else
            {
              // no transaction
              da.Fill(ds);
            }

            // return the dataset
            return ds;
          }
        }
      }
    }

    /// <summary>
    /// Process a <see cref="DataTable"/> using Result Filters.
    /// </summary>
    /// <param name="dataTable">
    /// data table to process
    /// </param>
    /// <param name="FbCommand">
    /// </param>
    /// <returns>
    /// </returns>
    private DataTable ProcessUsingResultFilters([NotNull] DataTable dataTable, [NotNull] string FbCommand)
    {
      return dataTable;
    }

    #endregion
    #region Private Methods

    static private object TypeChecker(DataColumn column, object readerValue)
    {
        var o = readerValue;

        if (column.DataType.ToString() == "System.Boolean")
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
            if (ts == "System.Int16") ts = "System.Boolean";
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