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

using System.Configuration;

namespace YAF.Classes.Data
{
  #region Using

  using System;
  using System.Collections.Generic;
  using System.Data;
  using Npgsql;
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

    static private string _dbOwner;
    static private string _objectQualifier;

    private static string _databaseEncoding;
    private static string _schemaName;
    private static string _databaseName;
    private static string _granteeName;
    private static string _hostName;
    private static string _withOIDs = "false";

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

    // TODO: Move it to Config
    static public string DatabaseOwner
    {
        get
        {
            if (_dbOwner == null || _dbOwner == "dbo")
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
            if (string.IsNullOrEmpty(_schemaName))
            {
                _schemaName = Config.SchemaName;
            }
            if (string.IsNullOrEmpty(_schemaName) || _schemaName == "dbo")
            {
                _schemaName = "public";
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
                _databaseEncoding = Config.DatabaseEncoding;
            }
            return _databaseEncoding;

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
                        _databaseName = parmParams[1];
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
    static public string WithOIDs
    {
        get
        {
            _withOIDs = Config.WithOIDs;
            if (string.IsNullOrEmpty(_withOIDs))
            { _withOIDs = "false"; }
            else
            {
                if (_withOIDs.Trim().ToLowerInvariant() == "true" || _withOIDs.Trim().ToLowerInvariant() == "false")
                { _withOIDs = Config.WithOIDs; }
            }
            return _withOIDs;
        }
    }

    #endregion

    #region Public Methods


    /// <summary>
    /// Creates new NpgsqlCommand based on command text applying all qualifiers to the name.
    /// </summary>
    /// <param name="commandText">
    /// Command text to qualify.
    /// </param>
    /// <param name="isText">
    /// Determines whether command text is text or stored procedure.
    /// </param>
    /// <returns>
    /// New NpgsqlCommand
    /// </returns>
    public static NpgsqlCommand GetCommand([NotNull] string commandText, bool isText)
    {
      return GetCommand(commandText, isText, null);
    }

    /// <summary>
    /// Creates new NpgsqlCommand based on command text applying all qualifiers to the name.
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
    /// New NpgsqlCommand
    /// </returns>
    public static NpgsqlCommand GetCommand([NotNull] string commandText, bool isText, [NotNull] NpgsqlConnection connection)
    {
      return isText
               ? new NpgsqlCommand
                 {
                   CommandType = CommandType.Text, 
                   CommandText = GetCommandTextReplaced(commandText), 
                   Connection = connection
                 }
               : GetCommand(commandText);
    }

    /// <summary>
    /// Creates new NpgsqlCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <returns>
    /// New NpgsqlCommand
    /// </returns>
    [NotNull]
    public static NpgsqlCommand GetCommand([NotNull] string storedProcedure)
    {
      return GetCommand(storedProcedure, null);
    }

    /// <summary>
    /// Creates new NpgsqlCommand calling stored procedure applying all qualifiers to the name.
    /// </summary>
    /// <param name="storedProcedure">
    /// Base of stored procedure name.
    /// </param>
    /// <param name="connection">
    /// Connection to use with command.
    /// </param>
    /// <returns>
    /// New NpgsqlCommand
    /// </returns>
    [NotNull]
    public static NpgsqlCommand GetCommand([NotNull] string storedProcedure, [NotNull] NpgsqlConnection connection)
    {
      var cmd = new NpgsqlCommand
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
    public static string GetCommandTextReplaced(string commandText)
    {
        // apply database owner
        if (!String.IsNullOrEmpty(MsSqlDbAccess.SchemaName))
        { commandText = commandText.Replace("databaseSchema", MsSqlDbAccess.SchemaName); }
        else
        { commandText = commandText.Replace("databaseSchema", "public"); }
        // apply object qualifier
        if (!String.IsNullOrEmpty(MsSqlDbAccess.ObjectQualifier))
        { commandText = commandText.Replace("objectQualifier_", MsSqlDbAccess.ObjectQualifier); }
        else
        { commandText = commandText.Replace("objectQualifier_", "yaf_"); }
        // apply grantee name
        if (!String.IsNullOrEmpty(MsSqlDbAccess.GranteeName))
        { commandText = commandText.Replace("granteeName", MsSqlDbAccess.GranteeName); }
        else
        { commandText = commandText.Replace("granteeName", "public"); }
        // apply host name
        commandText = commandText.Replace("hostName", MsSqlDbAccess.HostName);

        if (!String.IsNullOrEmpty(MsSqlDbAccess.DatabaseOwner))
        { commandText = commandText.Replace("databaseOwner", MsSqlDbAccess.DatabaseOwner); }
        else
        { commandText = commandText.Replace("databaseOwner", "yafuser"); }
        // apply OIDs setting
        if (!String.IsNullOrEmpty(MsSqlDbAccess.WithOIDs))
        {
            if (MsSqlDbAccess.WithOIDs.ToLower() == "true")
            {
                commandText = commandText.Replace("withOIDs", MsSqlDbAccess.WithOIDs);
            }
            else
            { commandText = commandText.Replace("withOIDs", "FALSE"); }
        }
        else
        { commandText = commandText.Replace("withOIDs", "FALSE"); }
        return commandText;
    }

    /// <summary>
    /// Gets qualified object name
    /// </summary>
    /// <param name="name">
    /// Base name of an object
    /// </param>
    /// <returns>
    /// Returns qualified object name of format {databaseOwner}.{objectQualifier}name
    /// </returns>
    static public string GetObjectName(string name)
    {
        return String.Format(
                       "{0}.{1}{2}",
                       SchemaName,
                       ObjectQualifier,
                       name
                       );
    }
    public static string GetConnectionString(
       [NotNull] string parm1,
       [NotNull] string parm2,
       [NotNull] string parm3,
       [NotNull] string parm4,
       [NotNull] string parm5,
       [NotNull] string parm6,
       [NotNull] string parm7,
       [NotNull] string parm8,
       [NotNull] string parm9,
       [NotNull] string parm10,
                 bool parm11,
                 bool parm12,
                 bool parm13,
                 bool parm14,
                 bool parm15,
                 bool parm16,
                 bool parm17,
                 bool parm18,
                 bool parm19,
       [NotNull] string userId,
       [NotNull] string userPassword)
    {

        NpgsqlConnectionStringBuilder connBuilder = new NpgsqlConnectionStringBuilder();

        connBuilder.Host = parm1;
        connBuilder.Port = Convert.ToInt32(parm2);
        // connBuilder.Encoding = parm3;
        connBuilder.Database = parm4;
        connBuilder.CommandTimeout = Convert.ToInt32(parm5);
        // connBuilder.Compatible
        // connBuilder.ConnectionLifeTime
        // connBuilder.Enlist
        // connBuilder.Protocol =ProtocolVersion.Version3
        // connBuilder.SslMode =SslMode.Allow
        // connBuilder.SearchPath
        // connBuilder.Timeout
        connBuilder.Pooling = parm13;
        connBuilder.PreloadReader = parm14;
        connBuilder.SyncNotification = parm15;
        connBuilder.UseExtendedTypes = parm16;
        connBuilder.SSL = parm17;
        connBuilder.IntegratedSecurity = parm18;
        connBuilder.UserName = userId;
        connBuilder.Password = userPassword;

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

    public int ExecuteNonQueryInt(IDbCommand cmd)
    {
        // defaults to using a transaction for non-queries
        return ExecuteNonQueryInt(cmd, true);
    }
    public int ExecuteNonQueryInt(IDbCommand cmd, bool transaction)
    {
        QueryCounter qc = new QueryCounter(cmd.CommandText);
        try
        {
            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
            {
                // get an open connection
                cmd.Connection = connMan.OpenDBConnection;
                Trace.WriteLine(cmd.ToString(), "DbAccess");
                if (transaction)
                {
                    int result = -1;
                    // execute using a transaction
                    using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
    }
    public object ExecuteScalar(IDbCommand cmd)
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

    //vzrus addons - to make casts workarounds
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

            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
            {
                // get an open connection
                cmd.Connection = connMan.OpenDBConnection;
                Trace.WriteLine(cmd.ToString(), "DbAccess");
                if (transaction)
                {

                    using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
                                // dr[column] = reader[column.Ordinal];                                               

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

    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex)
    {
        return AddValuesToDataTableFromReader(cmd, dt, transaction, acceptChanges, firstColumnIndex, 0);
    }
    public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, int currentRow)
    {

        QueryCounter qc = new QueryCounter(cmd.CommandText);
        try
        {

            using (IDbConnectionManager connMan = new MsSqlDbConnectionManager())
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
                                        // dt.Rows[currentRow][column] = GetDataTableFromReaderAddValue(dt.Rows[currentRow], column, reader[column.Ordinal - firstColumnIndex]);
                                        //  dt.Rows[currentRow][column] = reader[column.Ordinal - firstColumnIndex];
                                        dt.Rows[currentRow][column] = TypeChecker(column, reader[column.Ordinal - firstColumnIndex]);
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


        finally
        {
            qc.Dispose();
        }


    }
    public DataTable GetData(IDbCommand cmd)
    {
        return GetDataTableFromReader(cmd, false, true);
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
        using (var cmd = new NpgsqlCommand())
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
          using (var da = new NpgsqlDataAdapter())
          {
            da.SelectCommand = (NpgsqlCommand)cmd;
            da.SelectCommand.Connection = (NpgsqlConnection)cmd.Connection;
            Trace.WriteLine(cmd.ToDebugString(), "DbAccess");

            // use a transaction
            if (transaction)
            {
              using (var trans = connectionManager.OpenDBConnection.BeginTransaction(_isolationLevel))
              {
                try
                {
                  da.SelectCommand.Transaction = (NpgsqlTransaction)trans;
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
    /// Returns schema from DataReader(only column "ColumnName")
    /// </summary>
    /// <param name="reader"></param>
    /// <returns></returns>
    static private DataTable GetTableColumns(IDataReader reader)
    {
        return GetTableColumns(new DataTable(), reader);
    }
    /// <summary>
    /// Returns schema from DataReader(only column "ColumnName")
    /// </summary>
    /// <param name="dummyTable"></param>
    /// <param name="reader"></param>
    /// <returns></returns>
    static private DataTable GetTableColumns(DataTable dummyTable, IDataReader reader)
    {
        DataTable schemaTable = reader.GetSchemaTable();

        foreach (DataRow myField in schemaTable.Rows)
        {

            String ts = myField["DataType"].ToString();
            if (ts == "System.UInt64") ts = "System.Int32";
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
    /// <summary>
    /// Returns schema from DataReader(looping throught all columns)
    /// </summary>
    /// <param name="dt"></param>
    /// <param name="reader"></param>
    /// <returns></returns>
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
                    if (ts == "UInt64") ts = "System.Int32";

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
    /// <summary>
    /// Process a <see cref="DataTable"/> using Result Filters.
    /// </summary>
    /// <param name="dataTable">
    /// data table to process
    /// </param>
    /// <param name="NpgsqlCommand">
    /// </param>
    /// <returns>
    /// </returns>
    private DataTable ProcessUsingResultFilters([NotNull] DataTable dataTable, [NotNull] string NpgsqlCommand)
    {
      string commandCleaned =
        NpgsqlCommand.Replace("[{0}].[{1}".FormatWith(Config.DatabaseOwner, Config.DatabaseObjectQualifier), String.Empty);

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
    /// <summary>
    /// We check here reader values. It's noe in use for a while
    /// </summary>
    /// <param name="column"></param>
    /// <param name="readerValue"></param>
    /// <returns></returns>
    static private object TypeChecker(DataColumn column, object readerValue)
    {
        object o = readerValue;
        return o;
    }
    #endregion
  }
}