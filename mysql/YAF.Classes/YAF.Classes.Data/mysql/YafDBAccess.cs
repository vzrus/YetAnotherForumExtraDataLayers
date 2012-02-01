/* Yet Another Forum.NET MySQL data layer by vzrus
 * Copyright (C) 2006-2011 Vladimir Zakharov
 * https://github.com/vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
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

using MySql.Data.MySqlClient;
namespace YAF.Classes.Data
{
	/// <summary>
	/// Provides open/close management for DB Connections
	/// </summary>
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Diagnostics;
    using System.Linq;

    using YAF.Types;
    using YAF.Types.Interfaces;
    using YAF.Utils;
    using YAF.Utils.Helpers;
    

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
        private static IsolationLevel _isolationLevel = System.Data.IsolationLevel.ReadUncommitted;

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

        #endregion


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



		static public string DatabaseOwner
		{
			get
			{
				if ( _dbOwner == null )
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
				if ( _objectQualifier.IsNotSet() )
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
                    _schemaName = "yafnet";
                }

                return _schemaName;
            }
        }

        /// <summary>
        /// Gets command text replaced with {databaseName} and {objectQualifier}.
        /// </summary>
        /// <param name="commandText">
        /// Test to transform.
        /// </param>
        /// <returns>
        /// The get command text replaced.
        /// </returns>
        public static string GetCommandTextReplaced(string commandText)
        {
          /* commandText = commandText.Replace("{databaseName}", Config.DatabaseOwner);
           commandText = commandText.Replace("{objectQualifier}", Config.DatabaseObjectQualifier); */

            return commandText;
        }
		/// <summary>
		/// Gets qualified object name
		/// </summary>
		/// <param name="name">Base name of an object</param>
		/// <returns>Returns qualified object name of format {databaseName}.{objectQualifier}name</returns>
		static public string GetObjectName( string name )
		{
			return String.Format(
							"`{0}`.`{1}{2}`",
							SchemaName,
							ObjectQualifier,
							name
							);
		}
        public static string GetConnectionString(
           params object[] conparams )
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

            MySqlConnectionStringBuilder connBuilder = new MySqlConnectionStringBuilder();
           // List<MySqlParameter> conParams = new List<MySqlParameter>();
          //  conParams.Add(new MySqlParameter())
            connBuilder.OldGuids = true;
            connBuilder.AllowBatch = true;
            connBuilder.Server = parm1;
            connBuilder.Database = parm2;
            connBuilder.CharacterSet = parm3;            
            connBuilder.Port = Convert.ToUInt32(parm4);
            connBuilder.TreatTinyAsBoolean = true;
            connBuilder.AllowUserVariables = true;
            connBuilder.DefaultCommandTimeout = Convert.ToUInt32(parm5);
            
            connBuilder.UseProcedureBodies = parm13;

            connBuilder.Pooling = parm14;
           
            connBuilder.UseCompression = parm15;
            connBuilder.UseAffectedRows = parm16;           
            connBuilder.PersistSecurityInfo = parm17;
          //  connBuilder.AllowBatch = parm18;

            connBuilder.UserID = userID;
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
		/// Creates new SqlCommand based on command text applying all qualifiers to the name.
		/// </summary>
		/// <param name="commandText">Command text to qualify.</param>
		/// <param name="isText">Determines whether command text is text or stored procedure.</param>
		/// <returns>New SqlCommand</returns>
		static public MySqlCommand GetCommand( string commandText, bool isText )
		{

			return GetCommand( commandText, isText, null );
		}
		 /// <summary>
        /// Creates new MySqlCommand based on command text applying all qualifiers to the name.
        /// </summary>
        /// <param name="commandText">Command text to qualify.</param>
        /// <param name="isText">Determines whether command text is text or stored procedure.</param>
        /// <param name="connection">Connection to use with command.</param>
        /// <returns>New MySqlCommand</returns>
        
        static public MySqlCommand GetCommand(string commandText, bool isText, MySqlConnection connection)
        {
            if (isText)
            {                

                // commandText = commandText.Replace("{databaseName}", DatabaseOwner);
                commandText = commandText.Replace("{objectQualifier}", ObjectQualifier);
                commandText = commandText.Replace("{databaseName}", SchemaName);               

                MySqlCommand cmd = new MySqlCommand();

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
        /// Creates new MySqlCommand calling stored procedure applying all qualifiers to the name.
        /// </summary>
        /// <param name="storedProcedure">Base of stored procedure name.</param>
        /// <returns>New MySqlCommand</returns>
        static public MySqlCommand GetCommand(string storedProcedure)
        {
            return GetCommand(storedProcedure, null);
        }
        /// <summary>
        /// Creates new MySqlCommand calling stored procedure applying all qualifiers to the name.
        /// </summary>
        /// <param name="storedProcedure">Base of stored procedure name.</param>
        /// <param name="connection">Connection to use with command.</param>
        /// <returns>New MySqlCommand</returns>
        static public MySqlCommand GetCommand(string storedProcedure, MySqlConnection connection)
        {
            MySqlCommand cmd = new MySqlCommand();

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = GetObjectName(storedProcedure);
            cmd.Connection = connection;
            return cmd;
        }
        /// <summary>
        /// Gets data out of the database
        /// </summary>
        /// <param name="cmd">The SQL Command</param>
        /// <returns>DataTable with the results</returns>
        /// <remarks>Without transaction.</remarks>
        /// 
        public DataTable GetData(IDbCommand cmd)
        {
            return GetDataTableFromReader(cmd, false, true);
        }
         public DataTable GetData(IDbCommand cmd, bool transaction)
        {
            return GetDataTableFromReader(cmd, transaction, true);
        }
         public DataTable GetData(IDbCommand cmd, bool transaction, bool acceptChanges)
        {
            return GetDataTableFromReader(cmd, transaction, acceptChanges);
        }
        /// <summary>
        /// Gets data out of database using a plain text string command
        /// </summary>
        /// <param name="commandText">command text to be executed</param>
        /// <returns>DataTable with results</returns>
        /// <remarks>Without transaction.</remarks>
         public DataTable GetData(string commandText)
        {
            return GetData(commandText, false);
        }
         public DataTable GetData(string commandText, bool transaction)
        {
            QueryCounter qc = new QueryCounter(commandText);
            try
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = commandText;

                    return GetDataTableFromReader(cmd, transaction);
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
         public void ExecuteNonQuery(IDbCommand cmd)
        {
            // defaults to using a transaction for non-queries
            ExecuteNonQuery(cmd, true);
        }
         public void ExecuteNonQuery(IDbCommand cmd, bool transaction)
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
                        // execute using a transaction
                        using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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

                    if (transaction)
                    {
                        int result = -1;
                        // execute using a transaction
                        using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(_isolationLevel))
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
         public object ExecuteScalar(IDbCommand cmd, bool transaction)
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
                                dt.Columns.Add(myField[myColumn].ToString() + "81_18", Type.GetType(ts));
                            }
                        }
                    }
                }

            }
            return dt;
        }
       

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
        /// <param name="sqlCommand">
        /// </param>
        /// <returns>
        /// </returns>
        private DataTable ProcessUsingResultFilters([NotNull] DataTable dataTable, [NotNull] string sqlCommand)
        {
            string commandCleaned =
              sqlCommand.Replace("{0}.{1}".FormatWith(Config.SchemaName, Config.DatabaseObjectQualifier), String.Empty);

            
            // sort filters and process each one...
            this.ResultFilterList.OrderBy(x => x.Rank).ToList().ForEach(i => i.Process(ref dataTable, commandCleaned));

            // return possibility modified dataTable
            return dataTable;
        }

        public static Guid GuidConverter(Guid gd)
        {
            byte[] barr = gd.ToByteArray();
            byte[] barr_out = new byte[16];

            barr_out[0] = barr[3];
            barr_out[1] = barr[2];
            barr_out[2] = barr[1];
            barr_out[3] = barr[0];

            barr_out[4] = barr[5];
            barr_out[5] = barr[4];

            barr_out[6] = barr[7];
            barr_out[7] = barr[6];

            barr_out[8] = barr[8];
            barr_out[9] = barr[9];
            barr_out[10] = barr[10];
            barr_out[11] = barr[11];
            barr_out[12] = barr[12];
            barr_out[13] = barr[13];
            barr_out[14] = barr[14];
            barr_out[15] = barr[15];


            return new Guid(barr_out);
        }

        #endregion
	}


}
