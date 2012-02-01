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

using System.Data.SqlClient;
using Autofac;
using Autofac.Core.Registration;
using YAF.Types;
using YAF.Types.Interfaces;
using YAF.Utils;

namespace YAF.Classes.Data
{
    using System;
    using System.Collections.Generic;
    using System.Configuration;
    using System.Text;
    using System.Data;
    using System.Diagnostics;
    using YAF.Classes.Pattern;
    using YAF.Utils.Helpers;
    using Npgsql;
    using System.Linq;

    /// <summary>
    /// The yaf db access for PostgreSQL.
    /// </summary>
    public class PostgreDBAccess: IDbAccess
    {
     #region Constants and Fields
        /* Ederon : 6/16/2007 - conventions */
		static private string _dbOwner;
		static private string _objectQualifier;
     
        private static string _databaseEncoding;     
        private static string _schemaName;
        private static string _databaseName;
        private static string _granteeName;
        private static string _hostName;
        private static string _withOIDs ="false";


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
        private Type _connectionManagerType = typeof(PostgreDbConnectionManager);
      

#endregion

     #region Properties

        /// <summary>
        ///   Gets Current IDbAccess -- needs to be switched to direct injection into all DB classes.
        /// </summary>
        public static IDbAccess Current
        {
            get
            {
                try 
                {
                    return ServiceLocatorAccess.CurrentServiceProvider.Get<IDbAccess>();
                }
                catch (ComponentNotRegisteredException)
                {
                    ContainerBuilder builder = new ContainerBuilder();
                    builder.RegisterType<PostgreDBAccess>().As<IDbAccess>().InstancePerDependency();
                    builder.RegisterType<PostgreDbConnectionManager>().As<IDbConnectionManager>().
                               InstancePerLifetimeScope();
                    builder.Build();
                    return ServiceLocatorAccess.CurrentServiceProvider.Get<IDbAccess>();
                }
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
                if (string.IsNullOrEmpty(_schemaName) || _schemaName =="dbo")
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
                    if (_withOIDs.Trim() == "true" || _withOIDs.Trim() == "false")
                    { _withOIDs = Config.WithOIDs; }
                }
                return _withOIDs;
            }
        }
    #endregion

     #region Public Methods

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


		/// <summary>
		/// Gets qualified object name
		/// </summary>
		/// <param name="name">Base name of an object</param>
		/// <returns>Returns qualified object name of format {databaseOwner}.{objectQualifier}name</returns>
		static public string GetObjectName( string name )
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
            connBuilder.Port = Convert.ToInt32( parm2 );
         // connBuilder.Encoding = parm3;
            connBuilder.Database = parm4;
            connBuilder.CommandTimeout = Convert.ToInt32( parm5 );
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
		/// Creates new NpgsqlCommand based on command text applying all qualifiers to the name.
		/// </summary>
		/// <param name="commandText">Command text to qualify.</param>
		/// <param name="isText">Determines whether command text is text or stored procedure.</param>
		/// <returns>New NpgsqlCommand</returns>
        static public NpgsqlCommand GetCommand(string commandText, bool isText)
		{

			return GetCommand( commandText, isText, null );
		}
        /// <summary>
        /// Creates new NpgsqlCommand based on command text applying all qualifiers to the name.
        /// </summary>
        /// <param name="commandText">Command text to qualify.</param>
        /// <param name="isText">Determines whether command text is text or stored procedure.</param>
        /// <param name="connection">Connection to use with command.</param>
        /// <returns>New NpgsqlCommand</returns>
        static public NpgsqlCommand GetCommand(string commandText, bool isText, NpgsqlConnection connection)
        {
            if (isText)
            {
                commandText = commandText.Replace("databaseOwner", DatabaseOwner);
                commandText = commandText.Replace("objectQualifier", ObjectQualifier);
                commandText = commandText.Replace("databaseSchema", SchemaName);
                NpgsqlCommand cmd = new NpgsqlCommand();

                cmd.CommandType = CommandType.Text;
                cmd.CommandText = commandText;
                cmd.Connection = connection;

                return cmd;
            }
            else
            {
                return GetCommand(commandText);
            }
        }
        /// <summary>
        /// Creates new NpgsqlCommand calling stored procedure applying all qualifiers to the name.
        /// </summary>
        /// <param name="storedProcedure">Base of stored procedure name.</param>
        /// <returns>New NpgsqlCommand</returns>
        static public NpgsqlCommand GetCommand(string storedProcedure)
        {
            return GetCommand(storedProcedure, null);
        }
        /// <summary>
        /// Creates new NpgsqlCommand calling stored procedure applying all qualifiers to the name.
        /// </summary>
        /// <param name="storedProcedure">Base of stored procedure name.</param>
        /// <param name="connection">Connection to use with command.</param>
        /// <returns>New NpgsqlCommand</returns>
        static public NpgsqlCommand GetCommand(string storedProcedure, NpgsqlConnection connection)
        {
            NpgsqlCommand cmd = new NpgsqlCommand();

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
            // apply database owner
            if (!String.IsNullOrEmpty(PostgreDBAccess.SchemaName))
            { commandText = commandText.Replace("databaseSchema", PostgreDBAccess.SchemaName); }
            else
            { commandText = commandText.Replace("databaseSchema", "public"); }
            // apply object qualifier
            if (!String.IsNullOrEmpty(PostgreDBAccess.ObjectQualifier))
            { commandText = commandText.Replace("objectQualifier_", PostgreDBAccess.ObjectQualifier); }
            else
            { commandText = commandText.Replace("objectQualifier_", "yaf_"); }
            // apply grantee name
            if (!String.IsNullOrEmpty(PostgreDBAccess.GranteeName))
            { commandText = commandText.Replace("granteeName", PostgreDBAccess.GranteeName); }
            else
            { commandText = commandText.Replace("granteeName", "public"); }
            // apply host name
            commandText = commandText.Replace("hostName", PostgreDBAccess.HostName);

            if (!String.IsNullOrEmpty(PostgreDBAccess.DatabaseOwner))
            { commandText = commandText.Replace("databaseOwner", PostgreDBAccess.DatabaseOwner); }
            else
            { commandText = commandText.Replace("databaseOwner", "yafuser"); }
            // apply OIDs setting
            if (!String.IsNullOrEmpty(PostgreDBAccess.WithOIDs))
            {
                if (PostgreDBAccess.WithOIDs.ToLower() == "true")
                {
                    commandText = commandText.Replace("withOIDs", PostgreDBAccess.WithOIDs);
                }
                else
                { commandText = commandText.Replace("withOIDs", "FALSE"); }
            }
            else
            { commandText = commandText.Replace("withOIDs", "FALSE"); }
            return commandText;
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
        public DataSet GetDataset([NotNull] IDbCommand cmd, bool transaction,[NotNull] string connectionString)
        {
            using (var qc = new QueryCounter(cmd.CommandText))
            {
                return this.GetDatasetBasic(cmd, transaction, connectionString);
            }
        }

        /// <summary>
        /// Gets data out of the database
        /// </summary>
        /// <param name="cmd">The SQL Command</param>
        /// <returns>DataTable with the results</returns>
        /// <remarks>Without transaction.</remarks>
        /// <summary>
        /// Gets data out of the database
        /// </summary>
        /// <param name="cmd">The SQL Command</param>
        /// <returns>DataTable with the results</returns>
        /// <remarks>Without transaction.</remarks>
        /// 
        public DataTable GetData(IDbCommand cmd, [NotNull] string connectionString)
        {
            return GetDataTableFromReader(cmd, false, true, connectionString);
        }
        public DataTable GetData(IDbCommand cmd, bool transaction, [NotNull] string connectionString)
        {
            return GetDataTableFromReader(cmd, transaction, true, connectionString);
        }
        public DataTable GetData(IDbCommand cmd, bool transaction, bool acceptChanges, [NotNull] string connectionString)
        {
            return GetDataTableFromReader(cmd, transaction, acceptChanges, connectionString);
        }

        /// <summary>
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
                using (NpgsqlCommand cmd = new NpgsqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = commandText;
                    return GetDataTableFromReader(cmd, transaction, connectionString);
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
         public void ExecuteNonQuery(IDbCommand cmd, [NotNull] string connectionString)
        {
            // defaults to using a transaction for non-queries
            ExecuteNonQuery(cmd, true, connectionString);
        }

         public void ExecuteNonQuery(IDbCommand cmd, bool transaction, [NotNull] string connectionString)
        {
            QueryCounter qc = new QueryCounter(cmd.CommandText);
            try
            {
                using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
                {
                    // get an open connection
                    cmd.Connection = connMan.OpenDBConnection;

                    Trace.WriteLine(cmd.ToString(), "DbAccess");

                    if (transaction)
                    {
                        // execute using a transaction
                        using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
         public int ExecuteNonQueryInt(IDbCommand cmd, [NotNull] string connectionString)
        {
            // defaults to using a transaction for non-queries
            return ExecuteNonQueryInt(cmd, true, connectionString);
        }
         public int ExecuteNonQueryInt(IDbCommand cmd, bool transaction, [NotNull] string connectionString)
        {
            QueryCounter qc = new QueryCounter(cmd.CommandText);
            try
            {
                using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
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

         public object ExecuteScalar(IDbCommand cmd, string connectionString)
        {
            // default to using a transaction for scaler commands
            return ExecuteScalar(cmd, true, connectionString);
        }
         public object ExecuteScalar(IDbCommand cmd, bool transaction, string connectionString)
        {
            QueryCounter qc = new QueryCounter(cmd.CommandText);
            try
            {
                using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
                {
                    // get an open connection
                    cmd.Connection = connMan.OpenDBConnection;
                    Trace.WriteLine(cmd.ToString(), "DbAccess");
                    if (transaction)
                    {
                        // get scalar using a transaction
                        using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
            finally
            {
                qc.Dispose();
            }
        }

        //vzrus addons - to make casts workarounds
        /// <summary>
        /// Returns DataTable from DataReader.
        /// </summary>
        /// <param name="cmd">MySql command returning selected values</param>
        /// <param name="dca">Array of DataColumn values. The correspond to select columns names in a query or sp.</param>
        /// <returns></returns>
         public DataTable GetDataTableFromReader(IDbCommand cmd, string connectionString)
        {
            return GetDataTableFromReader(cmd, false, true,connectionString);
        }
         public DataTable GetDataTableFromReader(IDbCommand cmd,
               bool transaction, string connectionString)
        {
            return GetDataTableFromReader(cmd, transaction, true, connectionString);
        }
         public DataTable GetDataTableFromReader( IDbCommand cmd,
            bool transaction, bool acceptChanges, string connectionString)
        {

            QueryCounter qc = new QueryCounter(cmd.CommandText);
            try
            {
                DataTable dt = new DataTable();

                using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
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

         public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, string connectionString)
        {
            return AddValuesToDataTableFromReader(cmd, dt, transaction, acceptChanges, firstColumnIndex, 0, connectionString);
        }
         public DataTable AddValuesToDataTableFromReader(IDbCommand cmd, DataTable dt, bool transaction, bool acceptChanges, int firstColumnIndex, int currentRow, string connectionString)
        {

            QueryCounter qc = new QueryCounter(cmd.CommandText);
            try
            {

                using (IDbConnectionManager connMan = new PostgreDbConnectionManager())
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
        #endregion

     #region Private Methods
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
         private DataSet GetDatasetBasic([NotNull] IDbCommand cmd, bool transaction, [NotNull] string connectionString)
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
     #endregion
    }

	
}
