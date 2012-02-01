using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using Npgsql;
using YAF.Classes.Data;
using YAF.Types.Interfaces;

namespace YAF.Classes.Data.Postgre
{

    /// <summary>
    /// The class creates accessmask_list stored procedure data access functionality.
    /// </summary>
    public sealed class accessmask_list
    {

        #region Common Properties & Fields
        private static volatile accessmask_list instance;
        private string connectionString;
        private static readonly object syncRoot = new Object();

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static accessmask_list Instance
        {
            get { return Nested.instance; }
        }
        class Nested
        {
            static Nested() { }
            internal static readonly accessmask_list
                  instance = new accessmask_list();
        }
        #endregion

        private NpgsqlCommand cmd;
        private NpgsqlParameter _boardId;
        private NpgsqlParameter _accessMaskID;
        private NpgsqlParameter _excludeFlags;

        private accessmask_list()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("accessmask_list");
            cmd.CommandType = CommandType.StoredProcedure;

            _boardId = cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlTypes.NpgsqlDbType.Integer));
            _accessMaskID = cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlTypes.NpgsqlDbType.Integer));
            _excludeFlags = cmd.Parameters.Add(new NpgsqlParameter("i_excludeflags", NpgsqlTypes.NpgsqlDbType.Integer));

        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public DataTable AccessMaskList(string connectionString, object boardId, object accessMaskID, object excludeFlags)
        {
            _boardId.Value = boardId;
            _accessMaskID.Value = accessMaskID;
            _excludeFlags.Value = excludeFlags;

            return PostgreDBAccess.Current.GetData(cmd,connectionString);
        }
    }
    /// <summary>
    /// The class creates deletes an accessmask stored procedure data access functionality.
    /// </summary>
    public sealed class accessmask_delete
    {

        #region Common Properties & Fields
        private static volatile accessmask_delete instance;
        private string connectionString;

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static accessmask_delete Instance
        {
            get { return Nested.instance; }
        }
        class Nested
        {
            static Nested() { }
            internal static readonly accessmask_delete
                  instance = new accessmask_delete();
        }
        #endregion

        private NpgsqlCommand cmd;
 
        private NpgsqlParameter _accessMaskID;
      

        private accessmask_delete()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("accessmask_delete");
            cmd.CommandType = CommandType.StoredProcedure;

            _accessMaskID = cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlTypes.NpgsqlDbType.Integer));

        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public bool AccessMaskDelete(string connectionString, object accessMaskID)
        {
            _accessMaskID.Value = accessMaskID;
            return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd,connectionString)) != 0;
      
        }
    }
    /// <summary>
    /// The class creates an accessmask stored procedure data access functionality.
    /// </summary>
    public sealed class accessmask_save
    {

        #region Common Properties & Fields
        private static volatile accessmask_save instance;
        private string connectionString;
       

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static accessmask_save Instance
        {
            get { return Nested.instance; }
        }
        class Nested
        {
            static Nested() { }
            internal static readonly accessmask_save
                  instance = new accessmask_save();
        }
        #endregion

        private NpgsqlCommand cmd;

        private NpgsqlParameter _accessMaskID;
        private NpgsqlParameter _boardId;
        private NpgsqlParameter _name;
        private NpgsqlParameter _readAccess;
        private NpgsqlParameter _postAccess;
        private NpgsqlParameter _replyAccess;
        private NpgsqlParameter _priorityAccess; 
        private NpgsqlParameter _pollAccess;
        private NpgsqlParameter _voteAccess;
        private NpgsqlParameter _moderatorAccess;
        private NpgsqlParameter _editAccess;
        private NpgsqlParameter _deleteAccess;
        private NpgsqlParameter _uploadAccess;
        private NpgsqlParameter _downloadAccess;
        private NpgsqlParameter _sortOrder;

        private accessmask_save()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("accessmask_save");
            cmd.CommandType = CommandType.StoredProcedure;

            _accessMaskID = cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlTypes.NpgsqlDbType.Integer));
            _boardId = cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlTypes.NpgsqlDbType.Integer));
            _name = cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlTypes.NpgsqlDbType.Varchar));
            _readAccess = cmd.Parameters.Add(new NpgsqlParameter("i_readaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _postAccess = cmd.Parameters.Add(new NpgsqlParameter("i_postaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _replyAccess = cmd.Parameters.Add(new NpgsqlParameter("i_replyaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _priorityAccess = cmd.Parameters.Add(new NpgsqlParameter("i_priorityaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _pollAccess = cmd.Parameters.Add(new NpgsqlParameter("i_pollaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _voteAccess = cmd.Parameters.Add(new NpgsqlParameter("i_voteaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _moderatorAccess = cmd.Parameters.Add(new NpgsqlParameter("i_moderatoraccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _editAccess = cmd.Parameters.Add(new NpgsqlParameter("i_editaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _deleteAccess = cmd.Parameters.Add(new NpgsqlParameter("i_deleteaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _uploadAccess = cmd.Parameters.Add(new NpgsqlParameter("i_uploadaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _downloadAccess = cmd.Parameters.Add(new NpgsqlParameter("i_downloadaccess", NpgsqlTypes.NpgsqlDbType.Boolean));
            _sortOrder = cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlTypes.NpgsqlDbType.Smallint));	

        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public void AccessMaskSave(string connectionString, object accessMaskID, 
            object boardId, object name, object readAccess, object postAccess, 
            object replyAccess, object priorityAccess, object pollAccess, 
            object voteAccess, object moderatorAccess, object editAccess, 
            object deleteAccess, object uploadAccess, object downloadAccess, 
            object sortOrder)
        {
            _accessMaskID.Value = accessMaskID;
            _boardId.Value = boardId;
            _name.Value = name;
            _readAccess.Value = readAccess;
            _postAccess.Value = postAccess;
            _replyAccess.Value = replyAccess;
            _priorityAccess.Value = priorityAccess; 
            _pollAccess.Value = pollAccess;
            _voteAccess.Value = voteAccess;
            _moderatorAccess.Value = moderatorAccess;
            _editAccess.Value = editAccess;
            _deleteAccess.Value = deleteAccess;
            _uploadAccess.Value = uploadAccess;
            _downloadAccess.Value = downloadAccess;
            _sortOrder.Value = sortOrder;

            PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
        }
    }
    /// <summary>
    /// The class creates active_list stored procedure data access functionality.
    /// </summary>
    public sealed class active_list
    {

        #region Common Properties & Fields
        private static volatile active_list instance;
        private string connectionString;
        private static readonly object syncRoot = new Object();

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static active_list Instance
        {
            get { return Nested.instance; }
        }
        class Nested
        {
            static Nested() { }
            internal static readonly active_list
                  instance = new active_list();
        }
        #endregion

        private NpgsqlCommand cmd;
        private NpgsqlParameter _boardId;
        private NpgsqlParameter _guests;
        private NpgsqlParameter _showCrawlers;
        private NpgsqlParameter _interval;
        private NpgsqlParameter _styledNicks;


        private active_list()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("active_list");
            cmd.CommandType = CommandType.StoredProcedure;
            _boardId = cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlTypes.NpgsqlDbType.Integer));
            _guests = cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlTypes.NpgsqlDbType.Boolean));
            _showCrawlers = cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlTypes.NpgsqlDbType.Boolean));
            _interval = cmd.Parameters.Add(new NpgsqlParameter("i_interval", NpgsqlTypes.NpgsqlDbType.Integer));
            _styledNicks = cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlTypes.NpgsqlDbType.Boolean));
        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public DataTable ActiveList(string connectionString, object boardId, object guests, object showCrawlers, int interval, object styledNicks)
        {
            _boardId.Value = boardId;
            _guests.Value = guests;
            _showCrawlers.Value = showCrawlers;
            _interval.Value = interval;
            _styledNicks.Value = styledNicks;

            return PostgreDBAccess.Current.GetData(cmd, connectionString);
        }
    }
    /// <summary>
    /// The class creates active_list_user stored procedure data access functionality.
    /// </summary>
    public sealed class active_list_user
    {

        #region Common Properties & Fields
        private static volatile active_list_user instance;
        private string connectionString;

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static active_list_user Instance
        {
            get
            {
                return active_list_user_Nested.instance_active_list_user;
            }
        }

        #endregion

        private NpgsqlCommand cmd;
        private NpgsqlParameter _boardId;
        private NpgsqlParameter _userId;
        private NpgsqlParameter _guests;
        private NpgsqlParameter _showCrawlers;
        private NpgsqlParameter _interval;
        private NpgsqlParameter _styledNicks;


        active_list_user()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("active_list_user");
            cmd.CommandType = CommandType.StoredProcedure;
            _boardId = cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlTypes.NpgsqlDbType.Integer));
            _userId = cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlTypes.NpgsqlDbType.Integer));
            _guests = cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlTypes.NpgsqlDbType.Boolean));
            _showCrawlers = cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlTypes.NpgsqlDbType.Boolean));
            _interval = cmd.Parameters.Add(new NpgsqlParameter("i_interval", NpgsqlTypes.NpgsqlDbType.Integer));
            _styledNicks = cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlTypes.NpgsqlDbType.Boolean));
        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public DataTable ActiveListUser(string connectionString, object boardId, object userId, 
            object guests, object showCrawlers, int activeTime, object styledNicks)
        {
            _boardId.Value = boardId;
            _userId.Value = userId;
            _guests.Value = guests;
            _showCrawlers.Value = showCrawlers;
            _interval.Value = activeTime;
            _styledNicks.Value = styledNicks;

            return PostgreDBAccess.Current.GetData(cmd, connectionString);
        }
        class active_list_user_Nested
        {
            static active_list_user_Nested() { }
            internal static readonly active_list_user
                  instance_active_list_user = new active_list_user();
        }
    }
    /// <summary>
    /// The class creates active_listforum stored procedure data access functionality.
    /// </summary>
    public sealed class active_listforum
    {

        #region Common Properties & Fields
        private static volatile active_listforum instance;
        private string connectionString;

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static active_listforum Instance
        {
            get
            {
                return active_listforum_Nested.instance;
            }
        }

        #endregion

        private NpgsqlCommand cmd;
        private NpgsqlParameter _forumId;
        private NpgsqlParameter _styledNicks;
   

        active_listforum()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("active_listforum");
            cmd.CommandType = CommandType.StoredProcedure;
            _forumId = cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlTypes.NpgsqlDbType.Integer));
          
            _styledNicks = cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlTypes.NpgsqlDbType.Boolean));
        }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public DataTable ActiveListForum(string connectionString, object forumID, object styledNicks)
        {
            _forumId.Value = forumID;
            _styledNicks.Value = styledNicks;

            return PostgreDBAccess.Current.GetData(cmd, connectionString);
        }
        class active_listforum_Nested
        {
            internal static readonly active_listforum
                  instance = new active_listforum();
            static active_listforum_Nested() { }
            
        }
    }
    /// <summary>
    /// The class creates active_list stored procedure data access functionality.
    /// </summary>
    public sealed class active_stats
    {

        #region Common Properties & Fields
        private static volatile active_stats instance;
        private string connectionString;

        /// <summary>
        /// An info about a user who accesses the class
        /// </summary>
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        /// <summary>
        /// A contractor without multithreading locks
        /// </summary>
        public static active_stats Instance
        {
            get { return Nested.instance; }
        }
        class Nested
        {
            static Nested() { }
            internal static readonly active_stats
                  instance = new active_stats();
        }
        #endregion

        private NpgsqlCommand cmd;
        private NpgsqlParameter _boardId;

        private active_stats()
        {
            // Common properites
            connectionString = string.Empty;
            // Specific data
            cmd = PostgreDBAccess.GetCommand("active_stats");
            cmd.CommandType = CommandType.StoredProcedure;
            _boardId = cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlTypes.NpgsqlDbType.Integer));
          }

        /// <summary>
        /// Gets a list of access mask properities
        /// </summary>
        /// <param name="boardId">ID of Board</param>
        /// <param name="accessMaskID">ID of access mask</param>
        /// <returns></returns>
        public DataRow ActiveStats(string connectionString, object boardId)
        {
            _boardId.Value = boardId;

            using (DataTable dt = PostgreDBAccess.Current.GetData(cmd, connectionString))
            {
                return dt.Rows[0];
            }
        }
    }

}
