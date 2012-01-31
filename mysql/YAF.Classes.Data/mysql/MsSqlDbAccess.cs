/* Yet Another Forum.NET MySQL data layer by vzrus
 * Copyright (C) 2009-2010 vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
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
 *
 * 
 */

using MySql.Data.MySqlClient;

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

  #endregion

  /// <summary>
  /// The yaf db access for SQL Server.
  /// </summary>
  public class MsSqlDbAccess : IDbAccess
  {
    #region Constants and Fields

      static private string _dbOwner;
      static private string _objectQualifier;
      static private string _schemaName;
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
                _dbOwner = Config.SchemaName;
            }

            return _dbOwner;
        }
    }

    static public string ObjectQualifier
    {
        get
        {
            if (_objectQualifier.IsNotSet())
            {
                _objectQualifier = Config.DatabaseObjectQualifier;
            }
            if (_objectQualifier.IsNotSet())
            {
                _objectQualifier = "yaf_";
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
                _schemaName = Config.SchemaName;
            }
            if (_schemaName == null)
            {
                _schemaName =
                    new MySqlConnectionStringBuilder(new MsSqlDbConnectionManager().ConnectionString).Database;
            }
            return _schemaName ?? (_schemaName = "yafnet");
        }
        set { _schemaName = value; }
    }

    /// <summary>
    /// Gets qualified object name
    /// </summary>
    /// <param name="name">Base name of an object</param>
    /// <returns>Returns qualified object name of format {databaseName}.{objectQualifier}name</returns>
    static public string GetObjectName(string name)
    {
        return String.Format(
                        "`{0}`.`{1}{2}`",
                        SchemaName,
                        ObjectQualifier,
                        name
                        );
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
    /// Creates new MySqlCommand based on command text applying all qualifiers to the name.
    /// </summary>
    /// <param name="commandText">
    /// Command text to qualify.
    /// </param>
    /// <param name="isText">
    /// Determines whether command text is text or stored procedure.
    /// </param>
    /// <returns>
    /// New MySqlCommand
    /// </returns>
    public static MySqlCommand GetCommand([NotNull] string commandText, bool isText)
    {
      return GetCommand(commandText, isText, null);
    }

    /// <summary>
    /// Creates new MySqlCommand based on command text applying all qualifiers to the name.
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
    /// New MySqlCommand
    /// </returns>
    public static MySqlCommand GetCommand([NotNull] string commandText, bool isText, [NotNull] MySqlConnection connection)
    {
      return isText
               ? new MySqlCommand
                 {
                   CommandType = CommandType.Text, 
                   CommandText = GetCommandTextReplaced(commandText), 
                   Connection = connection
                 }
               : GetCommand(commandText);
    }

    /// <summary>
    /// Creates new MySqlCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <returns>
    /// New MySqlCommand
    /// </returns>
    [NotNull]
    public static MySqlCommand GetCommand([NotNull] string storedProcedure)
    {
      return GetCommand(storedProcedure, null);
    }

    /// <summary>
    /// Creates new MySqlCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <param name="connection">
    /// Connection to use with command.
    /// </param>
    /// <returns>
    /// New MySqlCommand
    /// </returns>
    [NotNull]
    public static MySqlCommand GetCommand([NotNull] string storedProcedure, [NotNull] MySqlConnection connection)
    {
      var cmd = new MySqlCommand
        {
          CommandType = CommandType.StoredProcedure, 
          CommandText = GetObjectName(storedProcedure), 
          Connection = connection, 
          CommandTimeout = int.Parse(Config.SqlCommandTimeout)
        };

      return cmd;
    }

    /// <summary>
    /// Gets command text replaced with {databaseOwner} and {objectQualifier}.
    /// </summary>
    /// <param name="commandText">
    /// Test to transform.
    /// </param>
    /// <returns>
    /// The get command text replaced.
    /// </returns>
    [NotNull]
    public static string GetCommandTextReplaced([NotNull] string commandText)
    {
     // commandText = commandText.Replace("{databaseOwner}", Config.DatabaseOwner);
     // commandText = commandText.Replace("{objectQualifier}", Config.DatabaseObjectQualifier);

      return commandText;
    }

    /// <summary>
    /// Creates a Connection String from the parameters.
    /// </summary>
    /// <param name="parm1">
    /// </param>
    /// <param name="parm2">
    /// </param>
    /// <param name="parm3">
    /// </param>
    /// <param name="parm4">
    /// </param>
    /// <param name="parm5">
    /// </param>
    /// <param name="parm6">
    /// </param>
    /// <param name="parm7">
    /// </param>
    /// <param name="parm8">
    /// </param>
    /// <param name="parm9">
    /// </param>
    /// <param name="parm10">
    /// </param>
    /// <param name="parm11">
    /// </param>
    /// <param name="parm12">
    /// </param>
    /// <param name="parm13">
    /// </param>
    /// <param name="parm14">
    /// </param>
    /// <param name="parm15">
    /// </param>
    /// <param name="parm16">
    /// </param>
    /// <param name="parm17">
    /// </param>
    /// <param name="parm18">
    /// </param>
    /// <param name="parm19">
    /// </param>
    /// <param name="userID">
    /// </param>
    /// <param name="userPassword">
    /// </param>
    /// <returns>
    /// The get connection string.
    /// </returns>
    public static string GetConnectionString(
           params object[] conparams)
    {
        return null;
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

        MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder
                                                       {
                                                           OldGuids = true,
                                                           AllowBatch = true,
                                                           Server = parm1,
                                                           Database = parm2,
                                                           CharacterSet = parm3,
                                                           Port = Convert.ToUInt32(parm4),
                                                           TreatTinyAsBoolean = true,
                                                           AllowUserVariables = true,
                                                           DefaultCommandTimeout = Convert.ToUInt32(parm5),
                                                           CheckParameters = parm13,
                                                           Pooling = parm14,
                                                           UseCompression = parm15,
                                                           UseAffectedRows = parm16,
                                                           PersistSecurityInfo = parm17,
                                                           UserID = userID,
                                                           Password = userPassword
                                                       };

       
        // List<MySqlParameter> conParams = new List<MySqlParameter>();
        //  conParams.Add(new MySqlParameter())



        //  connBuilder.AllowBatch = parm18;



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

    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex)
    {
        return AddValuesToDataTableFromReader(cmd, dt, transaction, acceptChanges, firstColumnIndex, 0);
    }
    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, int currentRow)
    {

        QueryCounter qc = new QueryCounter(cmd.CommandText);
        try
        {

            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
            {
                // get an open connection
                cmd.Connection = connMan.OpenDBConnection;

                if (transaction)
                {
                    // get scalar using a transaction
                    using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
                                int dd = 0;

                                foreach (DataColumn column in dt.Columns)
                                {
                                    dd = column.Ordinal;
                                    if (dd >= firstColumnIndex && dd <= dt.Columns.Count - 1)
                                    {
                                        dt.Rows[currentRow][column] = ReaderValueConverter(column, reader[column.Ordinal - firstColumnIndex]);
                                    }
                                }
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
                                    dt.Rows[currentRow][column] = ReaderValueConverter(column, reader[column.Ordinal - firstColumnIndex]);
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
        finally
        {
            qc.Dispose();
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
          bool transaction, string connectionString)
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

            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
            {
                // get an open connection
                cmd.Connection = connMan.OpenDBConnection;

                if (transaction)
                {
                    using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
                    {
                        cmd.Transaction = trans;
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
                                    dr[column] = ReaderValueConverter(column, reader[column.Ordinal]);
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
                                dr[column] = ReaderValueConverter(column, reader[column.Ordinal]);

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
      using (var qc = new QueryCounter(cmd.CommandText))
      {
        return this.ProcessUsingResultFilters(this.GetDatasetBasic(cmd, transaction).Tables[0], cmd.CommandText);
      }
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
        using (var cmd = new MySqlCommand())
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
          using (var da = new MySqlDataAdapter())
          {
            da.SelectCommand = (MySqlCommand)cmd;
            da.SelectCommand.Connection = (MySqlConnection)cmd.Connection;
            Trace.WriteLine(cmd.ToDebugString(), "DbAccess");

            // use a transaction
            if (transaction)
            {
              using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
              {
                try
                {
                  da.SelectCommand.Transaction = (MySqlTransaction)trans;
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
    /// <param name="MySqlCommand">
    /// </param>
    /// <returns>
    /// </returns>
    private DataTable ProcessUsingResultFilters([NotNull] DataTable dataTable, [NotNull] string MySqlCommand)
    {
      string commandCleaned =
        MySqlCommand.Replace("[{0}].[{1}".FormatWith(Config.DatabaseOwner, Config.DatabaseObjectQualifier), String.Empty);

      if (commandCleaned.EndsWith("]"))
      {
        // remove last character
        commandCleaned = commandCleaned.Substring(0, commandCleaned.Length - 1);
      }

      // sort filters and process each one...
      this.ResultFilterList.OrderBy(x => x.Rank).ToList().ForEach(i => i.Process(ref dataTable, commandCleaned));

      // return possibility modified dataTable
      return dataTable;
    }

    #endregion


    /// <summary>
    /// Converts values if necessary.
    /// </summary>
    /// <param name="column">DataColumn</param>
    /// <param name="readerValue"></param>
    /// <returns></returns>
    static private object ReaderValueConverter(DataColumn column, object readerValue)
    {  //It's currently implemented in the methods to make work faster
        //if (column.DataType.Name == "Guid") return GuidConverter((Guid)readerValue);
        return readerValue;
    }
    /// <summary>
    /// Here we get table structure in the most simple way - only type.
    /// </summary>
    /// <param name="reader"></param>
    /// <returns></returns>
    static private DataTable GetTableColumns(IDataReader reader)
    {
        return GetTableColumns(new DataTable(), reader);
    }
    static private DataTable GetTableColumns(DataTable dt, IDataReader reader)
    {
        return GetTableColumns(dt, reader, true);
    }
    static private DataTable GetTableColumns(DataTable dummyTable, IDataReader reader, bool convertFromUInt64ToInt32)
    {
        DataTable schemaTable = reader.GetSchemaTable();

        foreach (DataRow myField in schemaTable.Rows)
        {

            String ts = myField["DataType"].ToString();
            if ((ts == "System.UInt64" || ts == "System.Int64") && convertFromUInt64ToInt32) ts = "System.Int32";
            if (ts == "System.SByte") ts = "System.Boolean";

            if (!dummyTable.Columns.Contains(myField["ColumnName"].ToString()))
            {
                dummyTable.Columns.Add(myField["ColumnName"].ToString(), Type.GetType(ts));
                if (myField["ColumnName"].ToString().ToLowerInvariant() == "isapproved")
                {
                    string gg = ts;
                }
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
        return TableSchemaReader(dt, reader, true);
    }
    static private DataTable TableSchemaReader(DataTable dt, IDataReader reader, bool convertFromUInt64ToInt32)
    {


        DataTable schemaTable = reader.GetSchemaTable();
        foreach (DataRow myField in schemaTable.Rows)
        {
            foreach (DataColumn myColumn in schemaTable.Columns)
            {
                if (myColumn.ColumnName == "ColumnName")
                {
                    String ts = myField["DataType"].ToString();
                    if (ts == "System.UInt64" && convertFromUInt64ToInt32) ts = "System.Int32";

                    if (!dt.Columns.Contains(myField[myColumn].ToString()))
                    {

                        dt.Columns.Add(myField[myColumn].ToString(), Type.GetType(ts));
                    }
                    else
                    {
                        if (!myField[myColumn].ToString().Contains("81_18"))
                        {
                            dt.Columns.Add(myField[myColumn] + "81_18", Type.GetType(ts));
                        }
                    }
                }
            }

        }
        return dt;
    }

    public static Guid GuidConverter(Guid gd)
    {
        byte[] barr = gd.ToByteArray();
        byte[] barrOut = new byte[16];

        barrOut[0] = barr[3];
        barrOut[1] = barr[2];
        barrOut[2] = barr[1];
        barrOut[3] = barr[0];

        barrOut[4] = barr[5];
        barrOut[5] = barr[4];

        barrOut[6] = barr[7];
        barrOut[7] = barr[6];

        barrOut[8] = barr[8];
        barrOut[9] = barr[9];
        barrOut[10] = barr[10];
        barrOut[11] = barr[11];
        barrOut[12] = barr[12];
        barrOut[13] = barr[13];
        barrOut[14] = barr[14];
        barrOut[15] = barr[15];


        return new Guid(barrOut);
    }
  }
}