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
using System.Web;
using YAF.Types.Handlers;

namespace YAF.Classes.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Text.RegularExpressions;
    using System.Web.Hosting;
    using System.Web.Security;

    using YAF.Types;
    using YAF.Types.Constants;
    using YAF.Types.Interfaces;
    using YAF.Types.Objects;
    using YAF.Utils;
    using YAF.Utils.Helpers;

    using FirebirdSql.Data.FirebirdClient;
   
   
	/// <summary>
	/// All the Database functions for YAF
	/// </summary>
	public static partial class LegacyDb
	{
		//added vzrus
		#region ConnectionStringOptions
		public static bool PasswordPlaceholderVisible
		{
			get
			{
				return true;
			}
		}
        public static string ProviderAssemblyName
		{
			get
			{
				return "FirebirdSql.Data.FirebirdClient";
			}
		}
		//Parameter 1
        public static string Parameter1_Name
		{
			get
			{
				return "Database";
			}
		}
        public static string Parameter1_Value
		{
			get
			{
				return HttpContext.Current.Server.MapPath("~/App_Data/yafnet.fdb");
			}
		}

        public static bool Parameter1_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 2
        public static string Parameter2_Name
		{
			get
			{
				return "Dialect";
			}
		}
        public static string Parameter2_Value
		{
			get
			{
				return "3";
			}
		}

        public static bool Parameter2_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 3
        public static string Parameter3_Name
		{
			get
			{
				return "Charset";
			}
		}
        public static string Parameter3_Value
		{
			get
			{
				return "UTF8";
			}
		}

        public static bool Parameter3_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 4
        public static string Parameter4_Name
		{
			get
			{
				return "Port";
			}
		}
        public static string Parameter4_Value
		{
			get
			{
				return "3050";
			}
		}

        public static bool Parameter4_Visible
		{
			get
			{
				return true;
			}
		}
				//Parameter 5
        public static string Parameter5_Name
		{
			get
			{
				return "Server Type";
			}
		}
        public static string Parameter5_Value
		{
			get
			{
				return "0";
			}
		}

        public static bool Parameter5_Visible
		{
			get
			{
				return true;
			}
		}

		//Parameter 6
        public static string Parameter6_Name
		{
			get
			{
				return "Packet Size";
			}
		}
        public static string Parameter6_Value
		{
			get
			{
				return "8192";
			}
		}

        public static bool Parameter6_Visible
		{
			get
			{
				return true;
			}
		}

		//Parameter 7
        public static string Parameter7_Name
		{
			get
			{
				return "Role";
			}
		}
        public static string Parameter7_Value
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter7_Visible
		{
			get
			{
				return true;
			}
		}
				//Parameter 8
        public static string Parameter8_Name
		{
			get
			{
				return "ConnectionTimeout";
			}
		}

        public static string Parameter8_Value
		{
			get
			{
				return "150";
			}
		}

        public static bool Parameter8_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 9
        public static string Parameter9_Name
		{
			get
			{
				return "ConnectionLifeTime";
			}
		}

        public static string Parameter9_Value
		{
			get
			{
				return "0";
			}
		}

        public static bool Parameter9_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 10
        public static string Parameter10_Name
		{
			get
			{
				return "";
			}
		}

        public static string Parameter10_Value
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter10_Visible
		{
			get
			{
				return false;
			}
		}
		
		// Role=
		//Check boxes

		//Parameter 11 hides user password placeholder! 12 reserved for User Instance

        public static string Parameter11_Name
		{
			get
			{
				return "Use Integrated Security";
			}
		}

        public static bool Parameter11_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter11_Visible
		{
			get
			{
				return false;
			}
		}

        public static string Parameter12_Name
		{
			get
			{

				return "";
			}
		}

        public static bool Parameter12_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter12_Visible
		{
			get
			{
				return false;
			}
		}

        public static string Parameter13_Name
		{
			get
			{
				return "Pooling";
			}
		}

        public static bool Parameter13_Value
		{
			get
			{
				return true;
			}
		}

        public static bool Parameter13_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 14
        public static string Parameter14_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter14_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter14_Visible
		{
			get
			{
				return false;
			}
		}

		//Parameter 15
        public static string Parameter15_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter15_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter15_Visible
		{
			get
			{
				return false;
			}
		}
		//Parameter 16
        public static string Parameter16_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter16_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter16_Visible
		{
			get
			{
				return false;
			}
		}

		//Parameter 17
        public static string Parameter17_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter17_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter17_Visible
		{
			get
			{
				return false;
			}
		}

		//Parameter 18
        public static string Parameter18_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter18_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter18_Visible
		{
			get
			{
				return false;
			}
		}
		//Parameter 19
        public static string Parameter19_Name
		{
			get
			{
				return "";
			}
		}

        public static bool Parameter19_Value
		{
			get
			{
				return false;
			}
		}

        public static bool Parameter19_Visible
		{
			get
			{
				return false;
			}
		}
		#endregion

        #region Basic Forum Properties

	    /// <summary>
	    /// Gets the database size
	    /// </summary>
	    /// <returns>An integer value for database size</returns>
        public static int GetDBSize()
	    {
	        using (FbCommand cmd = MsSqlDbAccess.GetCommand("DB_SIZE"))
	        {
	            cmd.CommandType = CommandType.StoredProcedure;
	            cmd.Parameters.Add(new FbParameter("@I_DBNAME", FbDbType.VarChar)).Value = MsSqlDbAccess.DBName.ToUpperInvariant();

	            return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
	        }
	    }

	    public static bool GetIsForumInstalled()
	    {
	        try
	        {
                using (DataTable dt = board_list( DBNull.Value))
	            {
	                return dt.Rows.Count > 0;
	            }
	        }
	        catch
	        {
	        }
	        return false;
	    }

        public static int GetDBVersion()
	    {
	        try
	        {
	            using (DataTable dt = registry_list("version"))
	            {
	                if (dt.Rows.Count > 0)
	                {
	                    // get the version...
	                    return Convert.ToInt32(dt.Rows[0]["Value"]);
	                }
	            }
	        }
	        catch
	        {
	            // not installed...
	        }

	        return -1;
	    }

	    #endregion
		
		#region Forum
        /// <summary>
        /// The pageload method returns DataRow permissions 
        /// and other current user info for access 
        /// and representation control.
        /// </summary>
        /// <param name="sessionID">
        /// The session id.
        /// </param>
        /// <param name="boardID">
        /// The board id.
        /// </param>
        /// <param name="userKey">
        /// The user key.
        /// </param>
        /// <param name="ip">
        /// The ip.
        /// </param>
        /// <param name="location">
        /// The location.
        /// </param>
        /// <param name="forumPage">
        /// The forum page name.   
        /// </param>
        /// <param name="browser">
        /// The browser.
        /// </param>
        /// <param name="platform">
        /// The platform.
        /// </param>
        /// <param name="categoryID">
        /// The category id.
        /// </param>
        /// <param name="forumID">
        /// The forum id.
        /// </param>
        /// <param name="topicID">
        /// The topic id.
        /// </param>
        /// <param name="messageID">
        /// The message id.
        /// </param>
        /// <param name="isCrawler">
        /// The isCrawler.
        /// </param>
        /// <param name="isMobileDevice">
        /// The isMobileDevice.
        /// </param>
        /// <param name="donttrack">
        /// The donttrack.
        /// </param>
        /// <returns>
        /// Common User Info cref="DataRow"
        /// </returns>
        /// <exception cref="ApplicationException">
        /// </exception>
        static public DataRow pageload(
            
            object sessionID, 
            object boardID, 
            object userKey, 
            object ip, 
            object location, 
            object forumPage,
            object browser, 
            object platform, 
            object categoryID, 
            object forumID,	
            object topicID, 
            object messageID,
            object isCrawler,
            object isMobileDevice,
            object donttrack)
		{
			string strdonttrack = donttrack.ToString().ToLower();
			if (strdonttrack == "false") { donttrack = 0; }
			if (strdonttrack == "true") { donttrack = 1; }
            if (isMobileDevice == "false") { isMobileDevice = 0; }
            if (isCrawler == "true") { isCrawler = 1; }
            if (isCrawler == "false") { isCrawler = 0; }
            if (isMobileDevice == "true") { isMobileDevice = 1; }
			int nTries = 0;
			while ( true )
			{
				try
				{
					using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "PAGELOAD" ) )
					{
						cmd.CommandType = CommandType.StoredProcedure;

						cmd.Parameters.Add(new FbParameter("@I_SESSIONID", FbDbType.VarChar)).Value = sessionID;
						cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
						// TODO: look why guid here generated not in db
                        if (userKey != null && userKey.ToString().Length > 0)                    
						cmd.Parameters.Add(new FbParameter("@I_USERKEY", FbDbType.VarChar)).Value = new Guid(userKey.ToString()).ToString();
						else
						cmd.Parameters.Add(new FbParameter("@I_USERKEY", FbDbType.VarChar)).Value = DBNull.Value;
						cmd.Parameters.Add(new FbParameter("@I_IP", FbDbType.VarChar)).Value = ip;
						cmd.Parameters.Add(new FbParameter("@I_LOCATION", FbDbType.VarChar)).Value = location;
						cmd.Parameters.Add(new FbParameter("@I_BROWSER", FbDbType.VarChar)).Value = browser;
						cmd.Parameters.Add(new FbParameter("@I_PLATFORM", FbDbType.VarChar)).Value = platform;
						cmd.Parameters.Add(new FbParameter("@I_FORUMPAGE", FbDbType.VarChar)).Value = forumPage;
						cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryID;
						cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
						cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
						cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
                        cmd.Parameters.Add(new FbParameter("@I_ISCRAWLER", FbDbType.Boolean)).Value = isCrawler;
                        cmd.Parameters.Add(new FbParameter("@I_ISMOBILEDEVICE", FbDbType.Boolean)).Value = isMobileDevice;                       
						cmd.Parameters.Add(new FbParameter("@I_DONTTRACK", FbDbType.Boolean)).Value = donttrack;                       
						cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
             
          
						using ( DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
						{
							if ( dt.Rows.Count > 0 )
								return dt.Rows [0];
							else
								return null;
						}
					}
				}
				catch ( FbException x )
				{
					if ( x.ErrorCode == 1205 && nTries < 3 )
					{
						/// Transaction (Process ID XXX) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
					}
					else
						throw new ApplicationException( string.Format( "Sql Exception with error number {0} (Tries={1})", x.ErrorCode, nTries ), x );
				}
				++nTries;
			}
		}
		/// <summary>
		/// Returns Search results
		/// </summary>
		/// <param name="ToSearch"></param>
		/// <param name="sf">Field to search</param>
		/// <param name="sw">Search what</param>
		/// <param name="fid"></param>
		/// <param name="UserID">ID of user</param>
		/// <returns>Results</returns>
        static public DataTable GetSearchResult( string toSearchWhat, string toSearchFromWho, SearchWhatFlags searchFromWhoMethod, SearchWhatFlags searchWhatMethod, int forumIDToStartAt, int userID, int boardId, int maxResults, bool useFullText, bool searchDisplayName)
		{

            /*     if (toSearchWhat == "*")
                   {
                       toSearchWhat = string.Empty;
                   }

                   IEnumerable<int> forumIds = new List<int>();

                   if (forumIDToStartAt != 0)
                   {
                       forumIds = ForumListAll(boardId, userID, forumIDToStartAt).Select(f => f.ForumID ?? 0).Distinct();
                   }
             string searchSql = new SearchBuilder().BuildSearchSql(toSearchWhat, toSearchFromWho, searchFromWhoMethod, searchWhatMethod, userID, searchDisplayName, boardId, maxResults, useFullText, forumIds);
    
                   using (FbCommand cmd = MsSqlDbAccess.GetCommand(searchSql, true))
                   {
                       return MsSqlDbAccess.Current.GetData(cmd);
                   } 

            */
            // TODO: to move it to a class
            if (toSearchWhat == "*")
            {
                toSearchWhat = string.Empty;
            }

            IEnumerable<int> forumIds = new List<int>();

            if (forumIDToStartAt != 0)
            {
                forumIds = ForumListAll( boardId, userID, forumIDToStartAt).Select(f => f.ForumID ?? 0).Distinct();
            }

          /*  string searchSql = new SearchBuilder().BuildSearchSql(toSearchWhat, toSearchFromWho, searchFromWhoMethod, searchWhatMethod, userID, searchDisplayName, boardId, maxResults, useFullText, forumIds);

            using (FbCommand cmd = MsSqlDbAccess.GetCommand(searchSql, true))
            {
                return MsSqlDbAccess.Current.GetData(cmd);
            } */

			// if ( ToSearch.Length == 0 )
			//	return new DataTable();

			if (toSearchWhat == "*")
				toSearchWhat = "";
			string forumIDs = "";
			string limitString = "";
			string orderString = "";

			if (forumIDToStartAt != 0)
			{
                DataTable dt = forum_listall_sorted( boardId, userID, null, false, forumIDToStartAt);
				foreach (DataRow dr in dt.Rows)
					forumIDs = forumIDs + Convert.ToInt32(dr["ForumID"]).ToString() + ",";
				forumIDs = forumIDs.Substring(0, forumIDs.Length - 1);
			}

			// fix quotes for SQL insertion...
			toSearchWhat = toSearchWhat.Replace("'", "''").Trim();
			toSearchFromWho = toSearchFromWho.Replace("'", "''").Trim();

			string searchSql = (maxResults == 0) ? "SELECT" : ("SELECT ");
			if (maxResults > 0)
			{ 
			limitString += String.Format(" FIRST {0} ", maxResults.ToString());
			searchSql += limitString;
			}

			searchSql += @" a.FORUMID AS ""ForumID"", a.TOPICID AS ""TopicID"", a.TOPIC AS ""Topic"", b.USERID AS ""UserID"" , COALESCE(c.USERNAME, b.NAME) AS ""Name"", c.MESSAGEID AS ""MessageID"", c.POSTED AS ""Posted"", '' AS ""Message"", c.FLAGS AS ""Flags""";
			searchSql += " FROM "  +
				MsSqlDbAccess.GetObjectName("TOPIC") + " a LEFT JOIN " 
				+ MsSqlDbAccess.GetObjectName("MESSAGE") + @" c ON a.TOPICID = c.TOPICID LEFT JOIN "
				+  MsSqlDbAccess.GetObjectName("USER") + @" b ON c.USERID = b.USERID join "
				+ MsSqlDbAccess.GetObjectName("VACCESS") + @" x ON x.FORUMID=a.FORUMID ";
			searchSql += String.Format(@"WHERE x.READACCESS<>0 AND x.USERID={0} AND c.ISAPPROVED <> 0 AND a.TOPICMOVEDID IS NULL AND a.ISDELETED = 0 AND c.ISDELETED = 0 ", userID);
			orderString += @" ORDER BY a.FORUMID ";
			

			string[] words;
			bool bFirst;

			if (!String.IsNullOrEmpty(toSearchFromWho))
			{
				searchSql += "AND (";
				bFirst = true;
				int userId;

				// generate user search sql...
				switch (searchFromWhoMethod)
				{
					case SearchWhatFlags.AllWords:
						words = toSearchFromWho.Split(' ');
						foreach (string word in words)
						{
							if (!bFirst)
							{
								searchSql += " AND ";
							}
							else
							{
								bFirst = false;
							}
							searchSql += string.Format(@" ((c.USERNAME IS NULL AND b.NAME LIKE '%{0}%') OR (c.USERNAME LIKE '%{0}%'))", word);
							if (int.TryParse(word, out userId))
							{
								searchSql +=
								  string.Format(" (c.UserID IN ({0}))", userId);
							}
							else
							{
								if (searchDisplayName)
								{
									searchSql +=
									   string.Format(" ((c.Username IS NULL AND b.DisplayName LIKE N'%{0}%') OR (c.Username LIKE N'%{0}%'))", word);
								}
								else
								{
									searchSql +=
									 string.Format(" ((c.Username IS NULL AND b.Name LIKE N'%{0}%') OR (c.Username LIKE N'%{0}%'))", word);
								}
							   
							}
						
						}
						break;
					case SearchWhatFlags.AnyWords:
						words = toSearchFromWho.Split(' ');
						foreach (string word in words)
						{
							if (!bFirst)
							{
								searchSql += " OR ";
							}
							else
							{
								if (searchDisplayName)
								{
									searchSql += string.Format(
									  " ((c.USERNAME IS NULL AND b.DISPLAYNAME = '{0}') OR (c.Username = '{0}')", toSearchFromWho);
								}
								else
								{
									searchSql += string.Format(@" ((c.USERNAME IS NULL AND b.NAME LIKE '%{0}%') OR (c.USERNAME LIKE '%{0}%'))", word);
								}
							   
							}
							
						}
						break;
					case SearchWhatFlags.ExactMatch:
						if (int.TryParse(toSearchFromWho, out userId))
						{
							searchSql +=
							  string.Format(" (c.UserID IN ({0}))", userId);
						}
						else
						{
							searchSql += string.Format(@" ((c.USERNAME IS NULL AND b.NAME = '{0}' ) OR (c.USERNAME = '{0}' ))", toSearchFromWho);
						}
						
						break;
				}
				searchSql += ") ";
			}


			if (!String.IsNullOrEmpty(toSearchWhat))
			{
				searchSql += "AND (";
				bFirst = true;

				// generate message and topic search sql...
				switch (searchWhatMethod)
				{
					case SearchWhatFlags.AllWords:
						words = toSearchWhat.Split(' ');
						if (useFullText)
						{
							string ftInner = "";

							// make the inner FULLTEXT search
							foreach (string word in words)
							{
								if (!bFirst) ftInner += " AND "; else bFirst = false;
								ftInner += String.Format(@"""{0}""", word);
							}
							// make final string...
							searchSql += string.Format(@"( CONTAINS (c.MESSAGE, ' {0} ') OR CONTAINS (a.TOPIC, ' {0} ' ) )", ftInner);
						}
						else
						{
							foreach (string word in words)
							{
								if (!bFirst) searchSql += " AND "; else bFirst = false;
								searchSql += String.Format(@"(c.MESSAGE like '%{0}%' OR a.TOPIC LIKE '%{0}%' )", word);
							}
						}
						break;
					case SearchWhatFlags.AnyWords:
						words = toSearchWhat.Split(' ');

						if (useFullText)
						{
							string ftInner = "";

							// make the inner FULLTEXT search
							foreach (string word in words)
							{
								if (!bFirst) ftInner += " OR "; else bFirst = false;
								ftInner += String.Format(@"""{0}""", word);
							}
							// make final string...
							searchSql += string.Format(@"( CONTAINS (c.MESSAGE, ' {0} ' ) OR CONTAINS (a.TOPIC, ' {0} ' ) )", ftInner);
						}
						else
						{
							foreach (string word in words)
							{
								if (!bFirst) searchSql += " OR "; else bFirst = false;
								searchSql += String.Format(@"c.MESSAGE LIKE '%{0}%'  OR a.TOPIC LIKE '%{0}%' ", word);
							}
						}
						break;
					case SearchWhatFlags.ExactMatch:
						if (useFullText)
						{
						   // searchSql += string.Format(@"( CONTAINS (c.MESSAGE, ' \"{0}\" ' ) OR CONTAINS (a.Topic, ' \"{0}\" '  )", toSearchWhat);
						}
						else
						{
							searchSql += string.Format(@"c.MESSAGE LIKE '%{0}%'  OR a.TOPIC LIKE '%{0}%'  ", toSearchWhat);
						}
						break;
				}
				searchSql += ") ";
			}

			// Ederon : 6/16/2007 - forum IDs start above 0, if forum id is 0, there is no forum filtering
			if (forumIDToStartAt > 0)
			{
				searchSql += string.Format(@"AND a.FORUMID IN ({0})", forumIDs);
			}

			if (orderString != "") { orderString += ", "; }
			if (!orderString.Contains("ORDER BY"))
			{
				searchSql += " ORDER BY ";
			}

			searchSql += orderString + @"c.POSTED DESC ";

			


			using (FbCommand cmd = MsSqlDbAccess.GetCommand(searchSql, true))
			{
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion

		#region DataSets
		/// <summary>
		/// Gets a list of categories????
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <returns>DataSet with categories</returns>
        static public DataSet ds_forumadmin(
            [NotNull] object boardID)
		{
			using ( MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager() )
			{
				using ( DataSet ds = new DataSet() )
				{
					using ( FbTransaction trans = connMan.OpenDBConnection.BeginTransaction( MsSqlDbAccess.IsolationLevel ) )
					{
						using (FbDataAdapter da = new FbDataAdapter(MsSqlDbAccess.GetObjectName("category_list"), connMan.DBConnection))
						{
							da.SelectCommand.Transaction = trans;

							da.SelectCommand.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
							da.SelectCommand.Parameters[0].Value = boardID;

							da.SelectCommand.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
							da.SelectCommand.Parameters[1].Value = DBNull.Value;
						
							da.SelectCommand.CommandType = CommandType.StoredProcedure;
							da.Fill( ds, MsSqlDbAccess.GetObjectName( "Category" ) );
							da.SelectCommand.CommandText = MsSqlDbAccess.GetObjectName( "forum_list" );
							da.Fill( ds, MsSqlDbAccess.GetObjectName( "ForumUnsorted" ) );
							DataTable dtForumListSorted = ds.Tables [MsSqlDbAccess.GetObjectName( "ForumUnsorted" )].Clone();
							dtForumListSorted.TableName = MsSqlDbAccess.GetObjectName( "Forum" );
							ds.Tables.Add( dtForumListSorted );
							dtForumListSorted.Dispose();
                            forum_list_sort_basic( ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")], ds.Tables[MsSqlDbAccess.GetObjectName("Forum")], 0, 0);
							ds.Tables.Remove( MsSqlDbAccess.GetObjectName( "ForumUnsorted" ) );
							ds.Relations.Add( "FK_Forum_Category", ds.Tables [MsSqlDbAccess.GetObjectName( "Category" )].Columns ["CategoryID"], ds.Tables [MsSqlDbAccess.GetObjectName( "Forum" )].Columns ["CategoryID"] );
							trans.Commit();
                            
						}

						return ds;
					}
				}
			}
		}
		#endregion

		#region yaf_AccessMask
		/// <summary>
		/// Gets a list of access mask properities
		/// </summary>
		/// <param name="boardID">ID of Board</param>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
        static public DataTable accessmask_list( object boardID, object accessMaskID)
		{
            return accessmask_list( boardID, accessMaskID, 0);
		}
		/// <summary>
		/// Gets a list of access mask properities
		/// </summary>
		/// <param name="boardID">ID of Board</param>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
        static public DataTable accessmask_list( object boardID, object accessMaskID, object excludeFlags)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer));
				cmd.Parameters[1].Value = accessMaskID;
				cmd.Parameters.Add(new FbParameter("@I_EXCLUDEFLAGS", FbDbType.Integer));
				cmd.Parameters[2].Value = excludeFlags;       
				return MsSqlDbAccess.Current.GetData(cmd);			
				
			}
		}
		/// <summary>
		/// Deletes an access mask
		/// </summary>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
        static public bool accessmask_delete( object accessMaskID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer));
				cmd.Parameters[0].Value = accessMaskID;
				
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar( cmd )) != 0;
			}
		}
		/// <summary>
		/// Saves changes to a access mask 
		/// </summary>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <param name="boardID">ID of board</param>
		/// <param name="name">Name of access mask</param>
		/// <param name="readAccess">Read Access?</param>
		/// <param name="postAccess">Post Access?</param>
		/// <param name="replyAccess">Reply Access?</param>
		/// <param name="priorityAccess">Priority Access?</param>
		/// <param name="pollAccess">Poll Access?</param>
		/// <param name="voteAccess">Vote Access?</param>
		/// <param name="moderatorAccess">Moderator Access?</param>
		/// <param name="editAccess">Edit Access?</param>
		/// <param name="deleteAccess">Delete Access?</param>
		/// <param name="uploadAccess">Upload Access?</param>
		/// <param name="downloadAccess">Download Access?</param>
        static public void accessmask_save( object accessMaskID, object boardID, object name, object readAccess, object postAccess, object replyAccess, object priorityAccess, object pollAccess, object voteAccess, object moderatorAccess, object editAccess, object deleteAccess, object uploadAccess, object downloadAccess, object sortOrder)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer));
				cmd.Parameters[0].Value = accessMaskID;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[1].Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar));
				cmd.Parameters[2].Value = name;
				cmd.Parameters.Add(new FbParameter("@I_READACCESS", FbDbType.Boolean));
				cmd.Parameters[3].Value = readAccess;
				cmd.Parameters.Add(new FbParameter("@I_POSTACCESS", FbDbType.Boolean));
				cmd.Parameters[4].Value = postAccess;
				cmd.Parameters.Add(new FbParameter("@I_REPLYACCESS", FbDbType.Boolean));
				cmd.Parameters[5].Value = replyAccess;
				cmd.Parameters.Add(new FbParameter("@I_PRIORITYACCESS", FbDbType.Boolean));
				cmd.Parameters[6].Value = priorityAccess;
				cmd.Parameters.Add(new FbParameter("@I_POLLACCESS", FbDbType.Boolean));
				cmd.Parameters[7].Value = pollAccess;
				cmd.Parameters.Add(new FbParameter("@I_VOTEACCESS", FbDbType.Boolean));
				cmd.Parameters[8].Value = voteAccess;
				cmd.Parameters.Add(new FbParameter("@I_MODERATORACCESS", FbDbType.Boolean));
				cmd.Parameters[9].Value = moderatorAccess;
				cmd.Parameters.Add(new FbParameter("@I_EDITACCESS", FbDbType.Boolean));
				cmd.Parameters[10].Value = editAccess;
				cmd.Parameters.Add("@I_DELETEACCESS", FbDbType.Boolean).Value = deleteAccess;
				cmd.Parameters.Add("@I_UPLOADACCESS", FbDbType.Boolean).Value = uploadAccess;              
				cmd.Parameters.Add("@I_DOWNLOADACCESS", FbDbType.Boolean).Value = downloadAccess;
				cmd.Parameters.Add("@I_SORTORDER", FbDbType.Integer).Value = sortOrder;
							
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion

		#region yaf_Active
		/// <summary>
		/// Gets list of active users
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="Guests"></param>
		/// <returns>Returns a DataTable of active users</returns>
		///         
        static public DataTable active_list( object boardID, object Guests, object showCrawlers, int interval, object styledNicks)
		{
		   if (Guests == null) { Guests = 0; }
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "active_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
              
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_GUESTS", FbDbType.Boolean)).Value = Guests;
                cmd.Parameters.Add(new FbParameter("@I_SHOWCRAWLERS", FbDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new FbParameter("@I_INTERVAL", FbDbType.Boolean)).Value = interval;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = styledNicks;
				cmd.Parameters.Add("@I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}

		/// <summary>
		/// Gets list of active users for a specific user with access fixes to not display him forbidden locations. 
		/// </summary>
		/// <param name="boardID">
		/// BoardID
		/// </param>
		/// <param name="userID">
		/// the UserID
		/// </param>
		/// <param name="Guests">
		/// </param>
		/// <param name="activeTime">
		/// The active Time.
		/// </param>
		/// <param name="styledNicks">
		/// The styled Nicks.
		/// </param>
		/// <returns>
		/// Returns a DataTable of active users
		/// </returns>
        public static DataTable active_list_user( object boardID, object userID, object guests, object showCrawlers, int activeTime, object styledNicks)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("active_list_user"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_GUESTS", FbDbType.Boolean)).Value = guests;
                cmd.Parameters.Add(new FbParameter("@I_SHOWCRAWLERS", FbDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new FbParameter("@I_ACTIVETIME", FbDbType.Integer)).Value = activeTime;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = styledNicks;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Gets the list of active users within a certain forum
		/// </summary>
		/// <param name="forumID">forumID</param>
		/// <returns>DataTable of all ative users in a forum</returns>
        static public DataTable active_listforum( object forumID, object styledNicks)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "active_listforum" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( new FbParameter( "@I_FORUMID", FbDbType.Integer ) ).Value = forumID;               
				cmd.Parameters.Add( new FbParameter( "@I_STYLEDNICKS", FbDbType.Boolean ) ).Value = styledNicks;
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Gets the list of active users in a topic
		/// </summary>
		/// <param name="topicID">ID of topic </param>
		/// <returns>DataTable of all users that are in a topic</returns>
        static public DataTable active_listtopic( object topicID, object styledNicks)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "active_listtopic" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add( new FbParameter("@I_TOPICID", FbDbType.Integer ) ).Value = topicID;                
				cmd.Parameters.Add( new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean ) ).Value = styledNicks;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			
			}
		}

		/// <summary>
		/// Gets the activity statistics for a board
		/// </summary>
		/// <param name="boardID">boardID</param>
		/// <returns>DataRow of activity stata</returns>
        static public DataRow active_stats( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "active_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				
				using ( DataTable dt = MsSqlDbAccess.Current.GetData( cmd ) )
				{
					return dt.Rows [0];
				}
			}
		}
		#endregion

		#region yaf_Attachment
		/// <summary>
		/// Gets a list of attachments
		/// </summary>
		/// <param name="messageID">messageID</param>
		/// <param name="attachmentID">attachementID</param>
		/// <param name="boardID">boardID</param>
		/// <returns>DataTable with attachement list</returns>
        static public DataTable attachment_list( object messageID, object attachmentID, object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "attachment_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
				cmd.Parameters[0].Value = messageID;

				cmd.Parameters.Add(new FbParameter("@I_ATTACHMENTID", FbDbType.Integer));
				cmd.Parameters[1].Value = attachmentID;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[2].Value = boardID;

			
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// saves attachment
		/// </summary>
		/// <param name="messageID">messageID</param>
		/// <param name="fileName">File Name</param>
		/// <param name="bytes">number of bytes</param>
		/// <param name="contentType">type of attchment</param>
		/// <param name="stream">stream of bytes</param>
        static public void attachment_save( object messageID, object fileName, object bytes, object contentType, System.IO.Stream stream)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "attachment_save" ) )
			{
				byte [] fileData = null;
				if ( stream != null )
				{
					fileData = new byte [stream.Length];
					stream.Seek( 0, System.IO.SeekOrigin.Begin );
					stream.Read( fileData, 0, ( int )stream.Length );
				}
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
				cmd.Parameters[0].Value = messageID;

				cmd.Parameters.Add(new FbParameter("@I_FILENAME", FbDbType.VarChar));
				cmd.Parameters[1].Value = fileName;

				cmd.Parameters.Add(new FbParameter("@I_BYTES", FbDbType.Integer));
				cmd.Parameters[2].Value = bytes;

				cmd.Parameters.Add(new FbParameter("@I_CONTENTTYPE", FbDbType.VarChar));
				cmd.Parameters[3].Value = contentType;

				cmd.Parameters.Add(new FbParameter("@I_FILEDATA", FbDbType.Binary));
				cmd.Parameters[4].Value = fileData;

				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		
		/// <summary>
		/// Delete attachment
		/// </summary>
		/// <param name="attachmentID">ID of attachment to delete</param>
        static public void attachment_delete( [NotNull] object attachmentID)
		{
			bool UseFileTable = GetBooleanRegistryValue("UseFileTable");


			//If the files are actually saved in the Hard Drive
			if ( !UseFileTable )
			{
				using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "attachment_list" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = DBNull.Value;
					cmd.Parameters.Add(new FbParameter("@I_ATTACHMENTID", FbDbType.Integer)).Value = attachmentID;
					cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = DBNull.Value;
									
					DataTable tbAttachments = MsSqlDbAccess.Current.GetData( cmd );
					string uploadDir = HostingEnvironment.MapPath(String.Concat(BaseUrlBuilder.ServerFileRoot, YafBoardFolders.Current.Uploads));

					foreach ( DataRow row in tbAttachments.Rows )
					{
						try
						{
							string fileName = String.Format("{0}/{1}.{2}.yafupload", uploadDir, row["MessageID"], row["FileName"]);
						
							if ( File.Exists( fileName ) )
							{
								File.Delete( fileName );
							}
						}
						catch
						{
							// error deleting that file... 
						}
					}		
				}
			}
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "attachment_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_ATTACHMENTID", FbDbType.Integer)).Value = attachmentID;
		  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
			
		}


		/// <summary>
		/// Attachement dowload
		/// </summary>
		/// <param name="attachmentID">ID of attachemnt to download</param>
        static public void attachment_download( object attachmentID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "attachment_download" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_ATTACHMENTID", FbDbType.Integer)).Value = attachmentID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion

		#region yaf_BannedIP
		/// <summary>
		/// List of Baned IP's
		/// </summary>
		/// <param name="boardID">ID of board</param>
		/// <param name="ID">ID</param>
		/// <returns>DataTable of banned IPs</returns>
        static public DataTable bannedip_list( object boardID, object ID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer));
				cmd.Parameters[1].Value = ID;
								
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Saves baned ip in database
		/// </summary>
		/// <param name="ID">ID</param>
		/// <param name="boardID">BoardID</param>
		/// <param name="Mask">Mask</param>
        static public void bannedip_save( object ID, object boardID, object Mask, string reason, int userID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_save" ) )
			{
				//Regex for ip
			  //  \b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer)).Value = ID;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_MASK", FbDbType.VarChar)).Value = Mask;
				cmd.Parameters.Add(new FbParameter("@I_REASON", FbDbType.VarChar)).Value = reason;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;              		

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		/// <summary>
		/// Deletes Banned IP
		/// </summary>
		/// <param name="ID">ID of banned ip to delete</param>
        static public void bannedip_delete( object ID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer)).Value = ID;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion

		#region yaf_Board
		/// <summary>
		/// Gets a list of information about a board
		/// </summary>
		/// <param name="boardID">board id</param>
		/// <returns>DataTable</returns>
        static public DataTable board_list( object boardID)
		{
			String _systemInfo = String.Concat(" OS: ", Platform.VersionString,
				 " - Runtime: ", Platform.RuntimeName, " ", Platform.RuntimeString,
				 " - Number of processors: ", Platform.Processors,
				 " - Allocated memory:", (Platform.AllocatedMemory / 1024 / 1024).ToString(), " Mb.");

			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "board_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;
				cmd.Parameters.AddWithValue("@I_SYSINFO", _systemInfo);				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Gets posting statistics
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <returns>DataRow of Poststats</returns>
        static public DataRow board_poststats( int? boardId, bool useStyledNicks, bool showNoCountPosts)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "board_poststats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_SHOWNOCOUNTPOSTS", FbDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new FbParameter("@I_GETDEFAULTS", FbDbType.Boolean)).Value = 0;
				cmd.Parameters[0].Value = boardId;
				
				using ( DataTable dt = MsSqlDbAccess.Current.GetData( cmd ) )
				{
                    if (dt.Rows.Count > 0)
                    {
                        return dt.Rows[0];
                    }
				}
			}

            // vzrus - this happens at a new install only when we don't have posts or when they are not visible to a user 
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("board_poststats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_SHOWNOCOUNTPOSTS", FbDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new FbParameter("@I_GETDEFAULTS", FbDbType.Boolean)).Value = 0;
                cmd.Parameters[0].Value = boardId;

                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
                {
                    return dt.Rows[0];
                }
            }
		    return null;
		}

        /// <summary>
        /// Gets users statistics
        /// </summary>
        /// <param name="boardId">
        /// BoardID
        /// </param>
        /// <returns>
        /// DataRow of Poststats
        /// </returns>
        public static DataRow board_userstats( int? boardId)
        {
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("board_userstats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
                {
                    return dt.Rows[0];
                }
            }
        }

		/// <summary>
		/// Recalculates topic and post numbers and updates last post for all forums in all boards
		/// </summary>
        static public void board_resync()
		{
            board_resync( null);
		}

		/// <summary>
		/// Recalculates topic and post numbers and updates last post for specified board
		/// </summary>
		/// <param name="boardID">BoardID of board to do re-sync for, if null, all boards are re-synced</param>
        static public void board_resync( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "board_resync" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		/// <summary>
		/// Gets statistica about number of posts etc.
		/// </summary>
		/// <returns>DataRow</returns>
        static public DataRow board_stats()
		{
			return board_stats(  null );
		}
        static public DataRow board_stats( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "board_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;            

				return MsSqlDbAccess.Current.GetData(cmd).Rows[0];				
			}
		}
		/// <summary>
		/// Saves board information
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="name">Name of Board</param>
		/// <param name="allowThreaded">Boolen value, allowThreaded</param>
        static public int board_save( object boardID, object languageFile, object culture, object name, object allowThreaded)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "BOARD_SAVE" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;
				cmd.Parameters.Add("@I_NAME", FbDbType.VarChar).Value = name;
				cmd.Parameters.Add("@I_LANGUAGEFILE", FbDbType.VarChar).Value = languageFile;
				cmd.Parameters.Add("@I_CULTURE", FbDbType.VarChar, 10).Value = culture;
				cmd.Parameters.Add("@I_ALLOWTHREADED", FbDbType.Boolean).Value = allowThreaded;

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar( cmd ));
			
			}
		}

		/// <summary>
		/// Creates a new board
		/// </summary>
		/// <param name="adminUsername">Membership Provider User Name</param>
		/// <param name="adminUserKey">Membership Provider User Key</param>
		/// <param name="boardName">Name of new board</param>
		/// <param name="boardMembershipName">Membership Provider Application Name for new board</param>
		/// <param name="boardRolesName">Roles Provider Application Name for new board</param>
        static public int board_create( object adminUsername, object adminUserEmail, object adminUserKey, object boardName, object culture, object languageFile, object boardMembershipName, object boardRolesName, object rolePrefix)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "BOARD_CREATE" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_BOARDNAME", FbDbType.VarChar).Value = boardName;
                cmd.Parameters.Add("@I_CULTURE", FbDbType.VarChar, 10).Value = culture;
				cmd.Parameters.Add("@I_LANGUAGEFILE", FbDbType.VarChar).Value = languageFile;      
				cmd.Parameters.Add("@I_MEMBERSHIPAPPNAME", FbDbType.VarChar).Value = boardMembershipName;
				cmd.Parameters.Add("@I_ROLESAPPNAME", FbDbType.VarChar).Value = boardRolesName;
				cmd.Parameters.Add("@I_USERNAME", FbDbType.VarChar).Value = adminUsername;
				cmd.Parameters.Add("@I_USEREMAIL", FbDbType.VarChar).Value = adminUserEmail;   
				cmd.Parameters.Add("@I_USERKEY", FbDbType.VarChar).Value = adminUserKey;         
				cmd.Parameters.Add("@I_ISHOSTADMIN", FbDbType.Boolean).Value = 0;
                cmd.Parameters.Add("@I_ROLEPREFIX", FbDbType.VarChar).Value = rolePrefix;  
				cmd.Parameters.Add("@I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow;                

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
							 
			}
		}
		/// <summary>
		/// Deletes a board
		/// </summary>
		/// <param name="boardID">ID of board to delete</param>
        static public void board_delete( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "board_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion

		#region yaf_Category
		/// <summary>
		/// Deletes a category
		/// </summary>
		/// <param name="CategoryID">ID of category to delete</param>
		/// <returns>Bool value indicationg if category was deleted</returns>
        static public bool category_delete( object CategoryID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "category_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
				cmd.Parameters[0].Value = CategoryID;
				
				return ( int )MsSqlDbAccess.Current.ExecuteScalar( cmd ) != 0;
			}
		}
		/// <summary>
		/// Gets a list of forums in a category
		/// </summary>
		/// <param name="boardID">boardID</param>
		/// <param name="categoryID">categotyID</param>
		/// <returns>DataTable with a list of forums in a category</returns>
        static public DataTable category_list( object boardID, object categoryID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "category_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
				cmd.Parameters[1].Value = categoryID;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Gets a list of forum categories
		/// </summary>
		/// <param name="boardID"></param>
		/// <param name="userID"></param>
		/// <param name="categoryID"></param>
		/// <returns></returns>
        static public DataTable category_listread( object boardID, object userID, object categoryID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "category_listread" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[1].Value = userID;


				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
				cmd.Parameters[2].Value = categoryID;

				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Lists categories very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
        static public DataTable category_simplelist( int startID, int limit)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "category_simplelist" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_STARTID", FbDbType.Integer)).Value = startID;
                cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = limit;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		/// <summary>
		/// Saves changes to a category
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="CategoryID">CategoryID so save changes to</param>
		/// <param name="Name">Name of the category</param>
		/// <param name="SortOrder">Sort Order</param>
        static public void category_save( object boardID, object categoryId, object name, object categoryImage, object sortOrder)
		{

			int sortOrderChecked = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderChecked);
			if (result) { if (sortOrderChecked >= 255) { sortOrderChecked = 0; } }
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "category_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
				cmd.Parameters[1].Value = categoryId;

				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar));
				cmd.Parameters[2].Value = name;

				cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt));
				cmd.Parameters[3].Value = sortOrderChecked;
				
				cmd.Parameters.Add(new FbParameter("@I_CATEGORYIMAGE", FbDbType.VarChar));
				cmd.Parameters[4].Value = categoryImage;

			   
				
 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion

		#region yaf_CheckEmail
		/// <summary>
		/// Saves a new email into the table for verification
		/// </summary>
		/// <param name="UserID">ID of user to verify</param>
		/// <param name="Hash">Hash of user</param>
		/// <param name="Email">email of user</param>
        static public void checkemail_save( object userID, object hash, object email)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_HASH", FbDbType.VarChar)).Value = hash;
				cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = email;              
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 

				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		/// <summary>
		/// Updates a hash
		/// </summary>
		/// <param name="hash">New hash</param>
		/// <returns>DataTable with user information</returns>
        static public DataTable checkemail_update( object hash)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_update" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_HASH", FbDbType.VarChar)).Value = hash;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}

		/// <summary>
		/// Gets a check email entry based on email or all if no email supplied
		/// </summary>
		/// <param name="email">Associated email</param>
		/// <returns>DataTable with check email information</returns>
        static public DataTable checkemail_list( object email)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = email;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}

		#endregion

		#region yaf_Choice
		/// <summary>
		/// Saves a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public void choice_vote( object choiceID, object userID, object remoteIP)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "choice_vote" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_CHOICEID", FbDbType.Integer));
				cmd.Parameters[0].Value = choiceID;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[1].Value = userID;

				cmd.Parameters.Add(new FbParameter("@I_REMOTEIP", FbDbType.VarChar));
				cmd.Parameters[2].Value = remoteIP;

			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}
		#endregion
		
		#region yaf_EventLog
        static public void eventlog_create( object userID, object source, object description, object type)
		{
			try
			{
				if ( userID == null ) userID = DBNull.Value;
				using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_create" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;



					cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
					cmd.Parameters.Add(new FbParameter("@I_SOURCE", FbDbType.VarChar)).Value = source.ToString();
					cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.Text)).Value = description.ToString();
					cmd.Parameters.Add(new FbParameter("@I_TYPE", FbDbType.Integer)).Value = type;
					cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 

					MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}


        static public void eventlog_create( object userID, object source, object description)
		{
            eventlog_create( userID, (object)source.GetType().ToString(), description, (object)0);
		}

		/// <summary>
		/// Deletes all event log entries for given board.
		/// </summary>
		/// <param name="boardID">ID of board.</param>
        static public void eventlog_delete( int boardID)
		{
            eventlog_delete(null, boardID);
		}
		/// <summary>
		/// Deletes event log entry of given ID.
		/// </summary>
		/// <param name="eventLogID">ID of event log entry.</param>
        static public void eventlog_delete( object eventLogID)
		{
            eventlog_delete( eventLogID, null);
		}
		/// <summary>
		/// Calls underlying stroed procedure for deletion of event log entry(ies).
		/// </summary>
		/// <param name="eventLogID">When not null, only given event log entry is deleted.</param>
		/// <param name="boardID">Specifies board. It is ignored if eventLogID parameter is not null.</param>
        static public void eventlog_delete( object eventLogID, object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_EVENTLOGID", FbDbType.Integer)).Value = eventLogID;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
			}
		}

        static public DataTable eventlog_list( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
		#endregion yaf_EventLog

		// Admin control of file extensions - MJ Hufford
	   
		#region yaf_Extensions

        static public void extension_delete( object extensionId)
		{
			try
			{
				using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "extension_delete" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_EXTENSIONID", FbDbType.Integer));
					cmd.Parameters[0].Value = extensionId;
				   
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}

		// Get Extension record by extensionId
        static public DataTable extension_edit( object extensionId)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "extension_edit" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_EXTENSIONID", FbDbType.Integer));
				cmd.Parameters[0].Value = extensionId;

				return MsSqlDbAccess.Current.GetData( cmd );
			}

		}

		// Used to validate a file before uploading
        static public DataTable extension_list( object boardID, object extension)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "extension_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_EXTENSION", FbDbType.VarChar));
				cmd.Parameters[1].Value = extension;
								
				return MsSqlDbAccess.Current.GetData( cmd );
			}

		}

		// Returns an extension list for a given Board
        static public DataTable extension_list( object boardID)
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "extension_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_EXTENSION", FbDbType.VarChar));
				cmd.Parameters[1].Value = null;

			
				return MsSqlDbAccess.Current.GetData( cmd );
				
			}

		}

		// Saves / creates extension
        static public void extension_save( object extensionId, object boardID, object extension)
		{
			try
			{
				using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "extension_save" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_EXTENSIONID", FbDbType.Integer));
					cmd.Parameters[0].Value = extensionId;

					cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
					cmd.Parameters[1].Value = boardID;

					cmd.Parameters.Add(new FbParameter("@I_EXTENSION", FbDbType.VarChar));
					cmd.Parameters[2].Value = extension;
		  

					MsSqlDbAccess.Current.ExecuteNonQuery(cmd );
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}
		#endregion yaf_EventLog
	   
		#region yaf_PollVote
		/// <summary>
		/// Checks for a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public DataTable pollvote_check(
            object pollid, 
            object userid, 
            object remoteip )
		{
			using ( FbCommand cmd = MsSqlDbAccess.GetCommand( "pollvote_check" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_POLLID", FbDbType.Integer)).Value = pollid;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userid;
                cmd.Parameters.Add(new FbParameter("@I_REMOTEIP", FbDbType.VarChar)).Value = remoteip;
				
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}

    /// <summary>
    /// Checks for a vote in the database 
    /// </summary>
    /// <param name="pollGroupId">
    /// The pollGroupid.
    /// </param>
    /// <param name="userId">
    /// The userid.
    /// </param>
    /// <param name="remoteIp">
    /// The remoteip.
    /// </param>
        public static DataTable pollgroup_votecheck(

        object pollGroupId, 
        object userId, 
        object remoteIp)
    {
        using (FbCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_votecheck"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@I_POLLGROUPID", FbDbType.Integer).Value =  pollGroupId;
            cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value =  userId;
            cmd.Parameters.Add("@I_REMOTEIP", FbDbType.VarChar).Value =  remoteIp;
            return MsSqlDbAccess.Current.GetData(cmd);
        }
    }
		#endregion        

		#region yaf_Forum
		//ABOT NEW 16.04.04
		/// <summary>
		/// Deletes attachments out of a entire forum
		/// </summary>
		/// <param name="ForumID">ID of forum to delete all attachemnts out of</param>
        static private void forum_deleteAttachments( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listtopics"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
								
				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					foreach (DataRow row in dt.Rows)
					{
							if ( row != null && row["TopicID"] != DBNull.Value )
						{
							topic_delete( row["TopicID"], true );
						}
					}
				}
			}
		}
		//END ABOT NEW 16.04.04
		//ABOT CHANGE 16.04.04
		/// <summary>
		/// Deletes a forum
		/// </summary>
		/// <param name="ForumID">forum to delete</param>
		/// <returns>bool to indicate that forum has been deleted</returns>
        static public bool forum_delete( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listSubForums"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[0].Value = forumID;

			    if (!(MsSqlDbAccess.Current.ExecuteScalar(cmd) is DBNull))
			        return false;
			
			        forum_deleteAttachments( forumID);
			        using (var cmd_new = MsSqlDbAccess.GetCommand("forum_delete"))
			        {
			            cmd_new.CommandType = CommandType.StoredProcedure;
			            cmd_new.CommandTimeout = 99999;
			            cmd_new.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
			            cmd_new.Parameters[0].Value = forumID;

			            MsSqlDbAccess.Current.ExecuteNonQuery(cmd_new);
			        }
			        return true;
			}
		}

        /// <summary>
        /// Moves a forum
        /// </summary>
        /// <param name="ForumID">forum to delete</param>
        /// <returns>bool to indicate that forum has been deleted</returns>
        static public bool forum_move([NotNull] object forumOldID, [NotNull] object forumNewID)
        {
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listSubForums"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumOldID;

                if (!(MsSqlDbAccess.Current.ExecuteScalar(cmd) is DBNull))
                    return false;
              
                using (var cmd_new = MsSqlDbAccess.GetCommand("forum_move"))
                {
                    cmd_new.CommandType = CommandType.StoredProcedure;
                    cmd_new.CommandTimeout = 99999;
                    cmd.Parameters.Add(new FbParameter("@I_FORUMOLDID", FbDbType.Integer)).Value = forumOldID;
                    cmd.Parameters.Add(new FbParameter("@I_FORUMNEWID", FbDbType.Integer)).Value = forumNewID;

                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd_new);
                }
                return true;
            }
        }
		/// <summary>
		/// Lists all moderated forums for a user
		/// </summary>
		/// <param name="boardID">board if of moderators</param>
		/// <param name="userID">user id</param>
		/// <returns>DataTable of moderated forums</returns>
        static public DataTable forum_listallMyModerated( object boardID, object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listallmymoderated"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
	 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		//END ABOT NEW 16.04.04
		/// <summary>
		/// Gets a list of topics in a forum
		/// </summary>
		/// <param name="boardID">boardID</param>
		/// <param name="ForumID">forumID</param>
		/// <returns>DataTable with list of topics from a forum</returns>
        static public DataTable forum_list( object boardID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_list"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[1].Value = forumID;

			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Listes all forums accessible to a user
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="userID">ID of user</param>
		/// <returns>DataTable of all accessible forums</returns>
        static public DataTable forum_listall( object boardID, object userID)
		{
            return forum_listall( boardID, userID, 0);
		}

		/// <summary>
		/// Lists all forums accessible to a user
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="userID">ID of user</param>
		/// <param name="startAt">startAt ID</param>
		/// <returns>DataTable of all accessible forums</returns>
        static public DataTable forum_listall( object boardID, object userID, object startAt)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listall"))
			{
				if (startAt == null) { startAt = 0; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[1].Value = userID;

				cmd.Parameters.Add(new FbParameter("@I_ROOT", FbDbType.Integer));
				cmd.Parameters[2].Value = startAt;

			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        public static IEnumerable<TypedForumListAll> ForumListAll( int boardId, int userId)
    {
        return forum_listall( boardId, userId, 0).AsEnumerable().Select(r => new TypedForumListAll(r));
    }
         [NotNull]
        public static IEnumerable<TypedBBCode> BBCodeList( int boardID, int? bbcodeID)
         {
             return bbcode_list( boardID, bbcodeID).AsEnumerable().Select(o => new TypedBBCode(o));
         }
         public static IEnumerable<TypedForumListAll> ForumListAll( int boardId, int userId, int startForumId)
    {
        var allForums = ForumListAll( boardId, userId);

      var forumIds = new List<int>();
      var tempForumIds = new List<int>();

      forumIds.Add(startForumId);
      tempForumIds.Add(startForumId);

      while (true)
      {
        var temp = allForums.Where(f => tempForumIds.Contains(f.ParentID ?? 0));

        if (!temp.Any())
        {
          break;
        }

        // replace temp forum ids with these...
        tempForumIds = temp.Select(f => f.ForumID ?? 0).Distinct().ToList();

        // add them...
        forumIds.AddRange(tempForumIds);
      }

      // return filtered forums...
      return allForums.Where(f => forumIds.Contains(f.ForumID ?? 0)).Distinct();
    }

		/// <summary>
		/// Lists all forums within a given subcategory
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="CategoryID">CategoryID</param>
		/// <returns>DataTable with list</returns>
         static public DataTable forum_listall_fromCat( object boardID, object categoryID)
		{
            return forum_listall_fromCat( boardID, categoryID, true);
		}
		/// <summary>
		/// Lists forums very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
         static public DataTable forum_simplelist( int StartID, int Limit)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_STARTID", FbDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = Limit;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Lists all forums within a given subcategory
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="CategoryID">CategoryID</param>
		/// <param name="EmptyFirstRow">EmptyFirstRow</param>
		/// <returns>DataTable with list</returns>
         static public DataTable forum_listall_fromCat( object boardID, object categoryID, bool emptyFirstRow)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listall_fromCat"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
				cmd.Parameters[1].Value = categoryID;

				
				int intCategoryID = Convert.ToInt32(categoryID.ToString());

				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
                    return forum_sort_list( dt, 0, intCategoryID, 0, null, emptyFirstRow);
				}
			}
		}
		/// <summary>
		/// Sorry no idea what this does
		/// </summary>
		/// <param name="forumID"></param>
		/// <returns></returns>
         static public DataTable forum_listpath( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_listpath"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[0].Value = forumID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Lists read topics
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="UserID">UserID</param>
		/// <param name="CategoryID">CategoryID</param>
		/// <param name="parentID">ParentID</param>
		/// <returns>DataTable with list</returns> 
         static public DataTable forum_listread(
             
            [NotNull] object boardID, 
            [NotNull] object userID, 
            [NotNull] object categoryID, 
            [NotNull] object parentID, 
            [NotNull] object useStyledNicks,
            [NotNull] object findLastRead)
		{

			DataTable dt1 = null;
			DataTable dt2 = null;

			if (categoryID == null) { categoryID = DBNull.Value; }
			if (parentID == null) { parentID = DBNull.Value; }
		   /* using (FbCommand cmd0 = MsSqlDbAccess.GetCommand("EXECUTE BLOCK as BEGIN IF (NOT EXISTS( SELECT 1 FROM  RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TMP_FLR')) THEN EXECUTE STATEMENT 'CREATE GLOBAL TEMPORARY TABLE objQual_TMP_FLR(CATEGORYID INTEGER, CATEGORY VARCHAR(128),FORUMID INTEGER, FORUM VARCHAR(128), DESCRIPTION VARCHAR(128),TOPICS INTEGER, POSTS INTEGER, SUBFORUMS INTEGER, FLAGS INTEGER, VIEWING INTEGER,REMOTEURL VARCHAR(255), READACCESS INTEGER, LASTTOPICID INTEGER, LASTPOSTED TIMESTAMP) ON COMMIT DELETE ROWS';END",true))
			{
			   
			   MsSqlDbAccess.Current.ExecuteNonQuery(cmd0, true);
				//return dt1;
			}*/
		
			using (FbCommand cmd1 = MsSqlDbAccess.GetCommand("FORUM_LISTREAD"))
			{
				cmd1.CommandType = CommandType.StoredProcedure;

				cmd1.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;
				cmd1.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
				cmd1.Parameters.Add("@I_CATEGORYID", FbDbType.Integer).Value = categoryID;
				cmd1.Parameters.Add("@I_PARENTID", FbDbType.Integer).Value = parentID;
                cmd1.Parameters.Add("@I_STYLEDNICKS", FbDbType.Integer).Value = useStyledNicks;
                cmd1.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Boolean)).Value = findLastRead;
				cmd1.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 

				return MsSqlDbAccess.Current.GetData(cmd1, false);
				//return dt1;
			}


			//Add extra columns to data table
		   /* int cntr = 0;
			int firstColumnIndex = dt1.Columns.Count;
			int dt1rc = dt1.Rows.Count;
			if (dt1rc != 0)
			{
				foreach (DataRow dr1 in dt1.Rows)
				{

					using (FbCommand cmd3 = MsSqlDbAccess.GetCommand("FORUM_LISTREAD_HELPER"))
					{
						cmd3.CommandType = CommandType.StoredProcedure;

						cmd3.Parameters.Add("@I_FORUMID", FbDbType.Integer).Value = dr1["ForumID"];

						if (cntr != dt1rc - 1 || dt1rc == 0)
							dt2 = MsSqlDbAccess.Current.AddValuesToDataTableFromReader(cmd3, dt1, false, true, firstColumnIndex, cntr);
						else
							dt2 = MsSqlDbAccess.Current.AddValuesToDataTableFromReader(cmd3, dt1, false, false, firstColumnIndex, cntr);
					}


					cntr++;
				}
			}
			else
			{
				//We simply get rows' structure
				using (FbCommand cmd2 = MsSqlDbAccess.GetCommand("forum_listread_helper"))
				{
					cmd2.CommandType = CommandType.StoredProcedure;

					cmd2.Parameters.Add("i_forumid", FbDbType.Integer).Value = 0;

					dt2 = MsSqlDbAccess.Current.AddValuesToDataTableFromReader(cmd2, dt1, false, true, firstColumnIndex, 0);
				}
			}

			return dt2;*/

		}
		/// <summary>
		/// Return admin view of Categories with Forums/Subforums ordered accordingly.
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="userID">UserID</param>
		/// <returns>DataSet with categories</returns>
         static public DataSet forum_moderatelist( object userID, object boardID)
		{
			using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
			{
				using (DataSet ds = new DataSet())
				{
					using (FbDataAdapter da = new FbDataAdapter(MsSqlDbAccess.GetObjectName("category_list"), connMan.OpenDBConnection))
					{
						using (FbTransaction trans = da.SelectCommand.Connection.BeginTransaction(MsSqlDbAccess.IsolationLevel))
						{
							da.SelectCommand.Transaction = trans;
							da.SelectCommand.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
							da.SelectCommand.Parameters[0].Value = boardID;
							da.SelectCommand.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer));
							da.SelectCommand.Parameters[1].Value = DBNull.Value;
					 
							da.SelectCommand.CommandType = CommandType.StoredProcedure;


							da.Fill(ds, MsSqlDbAccess.GetObjectName("Category"));
							da.SelectCommand.CommandText = MsSqlDbAccess.GetObjectName("forum_moderatelist");
							da.SelectCommand.Parameters.Clear();
							da.SelectCommand.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
							da.SelectCommand.Parameters[0].Value = boardID;
							da.SelectCommand.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
							da.SelectCommand.Parameters[1].Value = userID;
						   
							da.Fill(ds, MsSqlDbAccess.GetObjectName("ForumUnsorted"));
							DataTable dtForumListSorted = ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")].Clone();
							dtForumListSorted.TableName = MsSqlDbAccess.GetObjectName("Forum");
							ds.Tables.Add(dtForumListSorted);
							dtForumListSorted.Dispose();
                            forum_list_sort_basic( ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")], ds.Tables[MsSqlDbAccess.GetObjectName("Forum")], 0, 0);
							ds.Tables.Remove(MsSqlDbAccess.GetObjectName("ForumUnsorted"));
							// vzrus: Remove here all forums with no reports. Would be better to do it in query...
							// Array to write categories numbers
							int[] categories = new int[ds.Tables[MsSqlDbAccess.GetObjectName("Forum")].Rows.Count];
							int cntr = 0;
							//We should make it before too as the colection was changed
							ds.Tables[MsSqlDbAccess.GetObjectName("Forum")].AcceptChanges();
							foreach (DataRow dr in ds.Tables[MsSqlDbAccess.GetObjectName("Forum")].Rows)
							{
								categories[cntr] = Convert.ToInt32(dr["CategoryID"]);
								if (Convert.ToInt32(dr["ReportedCount"]) == 0 && Convert.ToInt32(dr["MessageCount"]) == 0)
								{
									dr.Delete();
									categories[cntr] = 0;
								}
								cntr++;
							}
							ds.Tables[MsSqlDbAccess.GetObjectName("Forum")].AcceptChanges();

							foreach (DataRow dr in ds.Tables[MsSqlDbAccess.GetObjectName("Category")].Rows)
							{
								bool deleteMe = true;
								for (int i = 0; i < categories.Length; i++)
								{
									// We check here if the Category is missing in the array where 
									// we've written categories number for each forum
									if (categories[i] == Convert.ToInt32(dr["CategoryID"]))
									{
										deleteMe = false;
									}
								}
								if (deleteMe) dr.Delete();
							}
							ds.Tables[MsSqlDbAccess.GetObjectName("Category")].AcceptChanges(); 

							ds.Relations.Add("FK_Forum_Category", ds.Tables[MsSqlDbAccess.GetObjectName("Category")].Columns["CategoryID"], ds.Tables[MsSqlDbAccess.GetObjectName("Forum")].Columns["CategoryID"]);
							trans.Commit();
						}
						return ds;
					}
				}
			}
		}

         static public DataTable forum_moderators( object styledNicks)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_moderators"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = styledNicks;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		} 
        /// <summary>
         /// The moderators_team_list
         /// </summary>
         /// <param name="useStyledNicks">
         /// The use Styled Nicks.
         /// </param>
         /// <returns>
         ///  Returns Data Table with all Mods
         /// </returns>
         public static DataTable moderators_team_list( bool useStyledNicks)
         {
             using (var cmd = MsSqlDbAccess.GetCommand("moderators_team_list"))
             {
                 cmd.CommandType = CommandType.StoredProcedure;
                 cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                 return MsSqlDbAccess.Current.GetData(cmd);
             }
         }

		/// <summary>
		/// Updates topic and post count and last topic for all forums in specified board
		/// </summary>
		/// <param name="boardID">BoardID</param>
         static public void forum_resync( object boardID)
		{
            forum_resync( boardID, null);
		}
		/// <summary>
		/// Updates topic and post count and last topic for specified forum
		/// </summary>
		/// <param name="boardID">BoardID</param>
		/// <param name="forumID">If null, all forums in board are updated</param>
         static public void forum_resync( object boardID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_resync"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
				cmd.Parameters[0].Value = boardID;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[1].Value = forumID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

         static public long forum_save(
            [NotNull] object forumID, 
            [NotNull] object categoryID, 
            [NotNull] object parentID, 
            [NotNull] object name, 
            [NotNull] object description, 
            [NotNull] object sortOrder, 
            [NotNull] object locked, 
            [NotNull] object hidden, 
            [NotNull] object isTest, 
            [NotNull] object moderated, 
            [NotNull] object accessMaskID, 
            [NotNull] object remoteURL, 
            [NotNull] object themeURL, 
            [NotNull] object imageURL, 
            [NotNull] object styles,
                      bool dummy)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_save"))
			{
				if (parentID == null) { parentID = DBNull.Value; }
				if (remoteURL == null) { remoteURL = DBNull.Value; }
				if (themeURL == null) { themeURL = DBNull.Value; }
				if (imageURL == null) { imageURL = DBNull.Value; }
				if (styles == null) { styles = DBNull.Value; }
				if (accessMaskID == null) { accessMaskID = DBNull.Value; }
				int sortOrderOut = 0;
				bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
				if (result)
				{
					if (sortOrderOut >= 255) { sortOrderOut = 0; }
				}

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryID;
				cmd.Parameters.Add(new FbParameter("@I_PARENTID", FbDbType.Integer)).Value = parentID;
				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
				cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt)).Value = sortOrderOut;
				cmd.Parameters.Add(new FbParameter("@I_LOCKED", FbDbType.Boolean)).Value = locked;
				cmd.Parameters.Add(new FbParameter("@I_HIDDEN", FbDbType.Boolean)).Value = hidden;
				cmd.Parameters.Add(new FbParameter("@I_ISTEST", FbDbType.Boolean)).Value = isTest;
				cmd.Parameters.Add(new FbParameter("@I_MODERATED", FbDbType.Boolean)).Value = moderated;
				cmd.Parameters.Add(new FbParameter("@I_REMOTEURL", FbDbType.VarChar)).Value = remoteURL;
				cmd.Parameters.Add(new FbParameter("@I_THEMEURL", FbDbType.VarChar)).Value = themeURL;
				cmd.Parameters.Add(new FbParameter("@I_IMAGEURL", FbDbType.VarChar)).Value = imageURL;
				cmd.Parameters.Add(new FbParameter("@I_STYLES", FbDbType.VarChar)).Value = styles;
				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer)).Value = accessMaskID; 

				String resultop = MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
				if (String.IsNullOrEmpty(resultop))
				{ return 0; }
				else
				{ return long.Parse(resultop); }
			}
		}
		/// <summary>
		/// The method returns an integer value for a  found parent forum 
		/// if a forum is a parent of an existing child to avoid circular dependency
		/// while creating a new forum
		/// </summary>
		/// <param name="forumID"></param>
		/// <param name="parentID"></param>
		/// <returns>Integer value for a found dependency</returns>
         public static int forum_save_parentschecker( object forumID, object parentID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forum_save_parentschecker"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_PARENTID", FbDbType.Integer)).Value = parentID;
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}

		}


         static private DataTable forum_sort_list( DataTable listSource, int parentID, int categoryID, int startingIndent, int[] forumidExclusions)
		{
			return forum_sort_list(listSource, parentID, categoryID, startingIndent, forumidExclusions, true);
		}

         static private DataTable forum_sort_list( DataTable listSource, int parentID, int categoryID, int startingIndent, int[] forumidExclusions, bool emptyFirstRow)
		{
			DataTable listDestination = new DataTable();

			listDestination.Columns.Add("ForumID", typeof(String));
			listDestination.Columns.Add("Title", typeof(String));

			if (emptyFirstRow)
			{
				DataRow blankRow = listDestination.NewRow();
				blankRow["ForumID"] = string.Empty;
				blankRow["Title"] = string.Empty;
				listDestination.Rows.Add(blankRow);
			}
			// filter the forum list
			DataView dv = listSource.DefaultView;

			if (forumidExclusions != null && forumidExclusions.Length > 0)
			{
				string strExclusions = "";
				bool bFirst = true;

				foreach (int forumID in forumidExclusions)
				{
					if (bFirst) bFirst = false;
					else strExclusions += ",";

					strExclusions += forumID.ToString();
				}

				dv.RowFilter = string.Format("ForumID NOT IN ({0})", strExclusions);
				dv.ApplyDefaultSort = true;
			}

            forum_sort_list_recursive( dv.ToTable(), listDestination, parentID, categoryID, startingIndent);

			return listDestination;
		}

         static public DataTable forum_listall_sorted( object boardID, object userID)
		{
			return forum_listall_sorted(boardID, userID, null, false, 0);
		}

         static public DataTable forum_listall_sorted( object boardID, object userID, int[] forumidExclusions)
		{
            return forum_listall_sorted( boardID, userID, null, false, 0);
		}

         static public DataTable forum_listall_sorted( object boardID, object userID, int[] forumidExclusions, bool emptyFirstRow, int startAt)
		{
            using (DataTable dataTable = forum_listall( boardID, userID, startAt))
			{
				int baseForumId = 0;
				int baseCategoryId = 0;

				if (startAt != 0)
				{
					// find the base ids...
					foreach (DataRow dataRow in dataTable.Rows)
					{
                        if (Convert.ToInt32(dataRow["ForumID"]) == startAt && dataRow["ParentID"] != DBNull.Value &&
                dataRow["CategoryID"] != DBNull.Value)
						{
							baseForumId = Convert.ToInt32(dataRow["ParentID"]);
							baseCategoryId = Convert.ToInt32(dataRow["CategoryID"]);
							break;
						}
					}
				}

                return forum_sort_list( dataTable, baseForumId, baseCategoryId, 0, forumidExclusions, emptyFirstRow);
			}
		}

         static private void forum_list_sort_basic( DataTable listsource, DataTable list, int parentid, int currentLvl)
		{
			for (int i = 0; i < listsource.Rows.Count; i++)
			{
				DataRow row = listsource.Rows[i];
				if ((row["ParentID"]) == DBNull.Value)
					row["ParentID"] = 0;

				if ((int)row["ParentID"] == parentid)
				{
					string sIndent = "";
					int iIndent = Convert.ToInt32(currentLvl);
					for (int j = 0; j < iIndent; j++) sIndent += "--";
					row["Name"] = string.Format(" -{0} {1}", sIndent, row["Name"]);
					list.Rows.Add(row.ItemArray);
                    forum_list_sort_basic( listsource, list, (int)row["ForumID"], currentLvl + 1);
				}
			}
		}

         static private void forum_sort_list_recursive( DataTable listSource, DataTable listDestination, int parentID, int categoryID, int currentIndent)
		{
			DataRow newRow;

			foreach (DataRow row in listSource.Rows)
			{
				// see if this is a root-forum
				if (row["ParentID"] == DBNull.Value)
					row["ParentID"] = 0;

				if ((int)row["ParentID"] == parentID)
				{
					if ((int)row["CategoryID"] != categoryID)
					{
						categoryID = (int)row["CategoryID"];

						newRow = listDestination.NewRow();
						newRow["ForumID"] = -categoryID;		// Ederon : 9/4/2007
						newRow["Title"] = string.Format("{0}", row["Category"].ToString());
						listDestination.Rows.Add(newRow);
					}

					string sIndent = "";

					for (int j = 0; j < currentIndent; j++)
						sIndent += "--";

					// import the row into the destination
					newRow = listDestination.NewRow();

					newRow["ForumID"] = row["ForumID"];
					newRow["Title"] = string.Format(" -{0} {1}", sIndent, row["Forum"]);

					listDestination.Rows.Add(newRow);

					// recurse through the list...
                    forum_sort_list_recursive( listSource, listDestination, (int)row["ForumID"], categoryID, currentIndent + 1);
				}
			}
		}



		#endregion

		#region yaf_ForumAccess
         static public DataTable forumaccess_list( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[0].Value = forumID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
         static public void forumaccess_save( object forumID, object groupID, object accessMaskID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
                cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer)).Value = accessMaskID;
			 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
         static public DataTable forumaccess_group( object groupID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_group"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
				
				return userforumaccess_sort_list(MsSqlDbAccess.Current.GetData(cmd), 0, 0, 0);
			}
		}
		#endregion

		#region yaf_Group
         static public DataTable group_list(
            [NotNull] object boardID, 
            [NotNull] object groupID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
			
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
         static public void group_delete( object groupID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
         static public DataTable group_member( object boardID, object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_member"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
         static public long group_save(
            [NotNull] object groupID, 
            [NotNull] object boardID, 
            [NotNull] object name, 
            [NotNull] object isAdmin, 
            [NotNull] object isGuest, 
            [NotNull] object isStart, 
            [NotNull] object isModerator, 
            [NotNull] object accessMaskID, 
            [NotNull] object pmLimit, 
            [NotNull] object style, 
            [NotNull] object sortOrder, 
            [NotNull] object description, 
            [NotNull] object usrSigChars, 
            [NotNull] object usrSigBBCodes, 
            [NotNull] object usrSigHTMLTags, 
            [NotNull] object usrAlbums, 
            [NotNull] object usrAlbumImages
			)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_save"))
			{
				if (accessMaskID == null) { accessMaskID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
				cmd.Parameters.Add(new FbParameter("@I_ISADMIN", FbDbType.Boolean)).Value = isAdmin;
				cmd.Parameters.Add(new FbParameter("@I_ISGUEST", FbDbType.Boolean)).Value = isGuest;
				cmd.Parameters.Add(new FbParameter("@I_ISSTART", FbDbType.Boolean)).Value = isStart;
				cmd.Parameters.Add(new FbParameter("@I_ISMODERATOR", FbDbType.Boolean)).Value = isModerator;
				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new FbParameter("@I_PMLIMIT", FbDbType.Integer)).Value = pmLimit;
				cmd.Parameters.Add(new FbParameter("@I_STYLE", FbDbType.VarChar)).Value = style;
				cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.Integer)).Value = sortOrder;
				cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGCHARS", FbDbType.Integer)).Value = usrSigChars;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGBBCODES", FbDbType.VarChar)).Value = usrSigBBCodes;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGSHTMLTAGS", FbDbType.VarChar)).Value = usrSigHTMLTags;
				cmd.Parameters.Add(new FbParameter("@I_USRALBUMS", FbDbType.Integer)).Value = usrAlbums;
				cmd.Parameters.Add(new FbParameter("@I_USRALBUMIMAGES", FbDbType.Integer)).Value = usrAlbumImages;
		
				return long.Parse(MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString());
			}
		}
		#endregion

		#region yaf_Mail
         static public void mail_delete( object mailID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("mail_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MAILID", FbDbType.Integer)).Value = mailID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    /// <summary>
    /// The mail_list.
    /// </summary>
    /// <param name="processId">
    /// The process id.
    /// </param>
    /// <returns>
    /// </returns>
         public static IEnumerable<TypedMailList> MailList( long processId)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("MAIL_LIST"))
      {
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new FbParameter("@I_PROCESSID", FbDbType.Integer)).Value = processId;             
		cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;              	

        return MsSqlDbAccess.Current.GetData(cmd).SelectTypedList(x => new TypedMailList(x));
      }
    }
         static public void mail_createwatch( object topicID, object from, object fromName, object subject, object body, object bodyHtml, object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("mail_createwatch"))
			{
				if (fromName == null) { fromName = DBNull.Value; }
				if (bodyHtml == null) { bodyHtml = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new FbParameter("@I_FROM", FbDbType.VarChar)).Value = from;
				cmd.Parameters.Add(new FbParameter("@I_FROMNAME", FbDbType.VarChar)).Value = fromName;
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = subject;
				cmd.Parameters.Add(new FbParameter("@I_BODY", FbDbType.Text)).Value = body;
				cmd.Parameters.Add(new FbParameter("@I_BODYHTML", FbDbType.Text)).Value = bodyHtml;
				cmd.Parameters.Add(new FbParameter("@I_iserid", FbDbType.Integer)).Value = userID;               
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;              		

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
         static public void mail_create(
            [NotNull] object from, 
            [NotNull] object fromName, 
            [NotNull] object to, 
            [NotNull] object toName, 
            [NotNull] object subject, 
            [NotNull] object body, 
            [NotNull] object bodyHtml)
        {

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("mail_create"))
			{
				//if (fromName == null) { fromName = DBNull.Value; }
			   // if (toName == null) { toName = DBNull.Value; }
			   // if (bodyHtml == null) { bodyHtml = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FROM", FbDbType.VarChar)).Value = from;
				cmd.Parameters.Add(new FbParameter("@I_FROMNAME", FbDbType.VarChar)).Value = fromName;
				cmd.Parameters.Add(new FbParameter("@I_TO", FbDbType.VarChar)).Value = to;
				cmd.Parameters.Add(new FbParameter("@I_TONAME", FbDbType.VarChar)).Value = toName;
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = subject;
				cmd.Parameters.Add(new FbParameter("@I_BODY", FbDbType.Text)).Value = body;
				cmd.Parameters.Add(new FbParameter("@I_BODYHTML", FbDbType.Text)).Value = bodyHtml;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion

		#region yaf_Message

         static public DataTable post_list(
            [NotNull] object topicId, 
            [NotNull] object authorUserId, 
            [NotNull] object updateViewCount,
            bool showDeleted,
            bool styledNicks,
            DateTime sincePostedDate,
            DateTime toPostedDate,
            DateTime sinceEditedDate,
            DateTime toEditedDate,
            int pageIndex,
            int pageSize,
            int sortPosted,
            int sortEdited,
            int sortPosition,
            bool showThanks,
            int messagePosition)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("POST_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new FbParameter("@I_AUTHORUSERID", FbDbType.Integer)).Value = authorUserId;
				cmd.Parameters.Add(new FbParameter("@I_UPDATEVIEWCOUNT", FbDbType.SmallInt)).Value = updateViewCount ?? 0;
				cmd.Parameters.Add(new FbParameter("@I_SHOWDELETED", FbDbType.Boolean)).Value = showDeleted;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = styledNicks;
                cmd.Parameters.Add(new FbParameter("@I_SINCEPOSTEDDATE", FbDbType.TimeStamp)).Value = sincePostedDate;
                cmd.Parameters.Add(new FbParameter("@I_TOPOSTEDDATE", FbDbType.TimeStamp)).Value = toPostedDate;
                cmd.Parameters.Add(new FbParameter("@I_SINCEEDITEDDATE", FbDbType.TimeStamp)).Value = sinceEditedDate;
                cmd.Parameters.Add(new FbParameter("@I_TOEDITEDDATE", FbDbType.TimeStamp)).Value = toEditedDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_SORTPOSTED", FbDbType.Integer)).Value = sortPosted;
                cmd.Parameters.Add(new FbParameter("@I_SORTEDITED", FbDbType.Integer)).Value = sortEdited;
                cmd.Parameters.Add(new FbParameter("@I_SORTPOSITION", FbDbType.Integer)).Value = sortPosition;
                cmd.Parameters.Add(new FbParameter("@I_SHOWTHANKS", FbDbType.Boolean)).Value = showThanks;
                cmd.Parameters.Add(new FbParameter("@I_MESSAGEPOSITION", FbDbType.Integer)).Value = messagePosition;

				return MsSqlDbAccess.Current.GetData(cmd);
				
			}
		}
         static public DataTable post_list_reverse10( object topicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("post_list_reverse10"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		[Obsolete("Use post_alluser() instead.")]
         public static DataTable post_last10user(
            object boardID, 
            object userID, 
            object pageUserID)
		{
			// use all posts procedure to return top ten
            return post_alluser( boardID, userID, pageUserID, 10);
		}

        static public DataTable post_alluser(
            object boardID, 
            object userID, 
            object pageUserID, 
            object topCount)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("post_alluser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserID;
				cmd.Parameters.Add(new FbParameter("@I_TOPCOUNT", FbDbType.Integer)).Value = topCount;
		 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		// gets list of replies to message
        static public DataTable message_getRepliesList( object messageID)
		{
			DataTable list = new DataTable();


            list.Columns.Add("MessageID", typeof(int));
            list.Columns.Add("Posted", typeof(DateTime));
            list.Columns.Add("Subject", typeof(string));
            list.Columns.Add("Message", typeof(string));
            list.Columns.Add("UserID", typeof(int));
            list.Columns.Add("Flags", typeof(int));
            list.Columns.Add("UserName", typeof(string));
            list.Columns.Add("Signature", typeof(string));

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;

				DataTable dtr = MsSqlDbAccess.Current.GetData(cmd);
				for (int i = 0; i < dtr.Rows.Count; i++)
				{
					DataRow newRow = list.NewRow();
					DataRow row = dtr.Rows[i];
                    newRow["MessageID"] = row["MessageID"];
					newRow["Posted"] = row["Posted"];
					newRow["Subject"] = row["Subject"];
					newRow["Message"] = row["Message"];
					newRow["UserID"] = row["UserID"];
					newRow["Flags"] = row["Flags"];
					newRow["UserName"] = row["UserName"];
					newRow["Signature"] = row["Signature"];
					list.Rows.Add(newRow);
                    message_getRepliesList_populate( dtr, list, (int)row["MessageId"]);
				}
				return list;
			}
		}

		// gets list of nested replies to message
        static private void message_getRepliesList_populate( DataTable listsource, DataTable list, int messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
				cmd.Parameters[0].Value = messageID;

			   
				DataTable dtr = MsSqlDbAccess.Current.GetData(cmd);

				for (int i = 0; i < dtr.Rows.Count; i++)
				{
					DataRow newRow = list.NewRow();
					DataRow row = dtr.Rows[i];
                    newRow["MessageID"] = row["MessageID"];
					newRow["Posted"] = row["Posted"];
					newRow["Subject"] = row["Subject"];
					newRow["Message"] = row["Message"];
					newRow["UserID"] = row["UserID"];
					newRow["Flags"] = row["Flags"];
					newRow["UserName"] = row["UserName"];
					newRow["Signature"] = row["Signature"];
					list.Rows.Add(newRow);
                    message_getRepliesList_populate( dtr, list, (int)row["MessageId"]);
				}
			}

		}

		//creates new topic, using some parameters from message itself
        static public long topic_create_by_message(
            object messageId, 
            object forumId, 
            object newTopicSubj)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_create_by_message"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageId;
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumId;
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = newTopicSubj;               
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
				//return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}
        [Obsolete("Use MessageList(int messageId) instead")]
        static public DataTable message_list( object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    /// <summary>
    /// The message_list.
    /// </summary>
    /// <param name="messageID">
    /// The message id.
    /// </param>
    /// <returns>
    /// </returns>
        public static IEnumerable<TypedMessageList> MessageList( int messageID)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_list"))
      {
          
          cmd.CommandType = CommandType.StoredProcedure;
          cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
          
          return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(t => new TypedMessageList(t));
      }
    }

        static public void message_delete( object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked)
		{
			message_delete(messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, false);
		}
        static public void message_delete( object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool eraseMessage)
		{
            message_deleteRecursively( messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, false, eraseMessage);
		}

		// <summary> Retrieve all reported messages with the correct forumID argument. </summary>
        static public DataTable message_listreported( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_listreported"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
		 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Here we get reporters list for a reported message
		/// </summary>       
		/// <param name="MessageID">Should not be NULL</param>
		/// <returns>Returns reporters DataTable for a reported message.</returns>
        static public DataTable message_listreporters( int messageID)
		{

            return message_listreporters( messageID, null);            
		}
        static public DataTable message_listreporters( int messageID, object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("MESSAGE_LISTREPORTERS"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		// <summary> Save reported message back to the database. </summary>
        static public void message_report(
            [NotNull] object messageID, 
            [NotNull] object userID, 
            [NotNull] object reportedDateTime, 
            [NotNull] object reportText)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_report"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new FbParameter("@I_REPORTERID", FbDbType.Integer)).Value = userID;               
				cmd.Parameters.Add(new FbParameter("@I_REPORTEDDATE", FbDbType.TimeStamp)).Value = reportedDateTime;
				cmd.Parameters.Add(new FbParameter("@I_REPORTTEXT", FbDbType.VarChar)).Value = reportText;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;              		

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportcopyover( object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_reportcopyover"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportresolve(
            [NotNull] object messageFlag, 
            [NotNull] object messageID, 
            [NotNull] object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_reportresolve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEFLAG", FbDbType.Integer)).Value = messageFlag;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;               
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     
		
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		//BAI ADDED 30.01.2004
		// <summary> Delete message and all subsequent releated messages to that ID </summary>
        static private void message_deleteRecursively( object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool isLinked)
		{
            message_deleteRecursively( messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, isLinked, false);
		}
        static private void message_deleteRecursively(
            object messageID, 
            bool isModeratorChanged, 
            string deleteReason, 
            int isDeleteAction, 
            bool DeleteLinked, 
            bool isLinked, 
            bool eraseMessages)
		{
			bool UseFileTable = GetBooleanRegistryValue("UseFileTable");


			if (DeleteLinked)
			{
				//Delete replies
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
					cmd.Parameters[0].Value = messageID;

					
					DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);

					foreach (DataRow row in tbReplies.Rows)
                        message_deleteRecursively( row["MessageID"], isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, true, eraseMessages);
				}
			}

			//If the files are actually saved in the Hard Drive
			if (!UseFileTable)
			{
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("attachment_list"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
					cmd.Parameters[0].Value = messageID;

					cmd.Parameters.Add(new FbParameter("@I_ATTACHMENTID", FbDbType.Integer));
					cmd.Parameters[1].Value = null;

					cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer));
					cmd.Parameters[2].Value = null;

 
					DataTable tbAttachments = MsSqlDbAccess.Current.GetData(cmd);
					string uploadDir = HostingEnvironment.MapPath(String.Concat(BaseUrlBuilder.ServerFileRoot, YafBoardFolders.Current.Uploads));



					foreach ( DataRow row in tbAttachments.Rows )
					{
						try
						{
							string fileName = String.Format("{0}/{1}.{2}", uploadDir, messageID, row["FileName"]);
							if ( File.Exists( fileName ) )
							{
								File.Delete( fileName );
							}
						}
						catch
						{
							// error deleting that file... 
						}
					}		
						
				}
			}

			// Ederon : erase message for good
			if (eraseMessages)
			{
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_delete"))
				{
					int eraseMessagesInt = 0;
					if (eraseMessages == true)
					{ eraseMessagesInt = 1; }
					else
					{ eraseMessagesInt = 0; }

					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
					cmd.Parameters[0].Value = messageID;

					cmd.Parameters.Add(new FbParameter("@I_ERASEMESSAGE", FbDbType.Boolean));
					cmd.Parameters[1].Value = eraseMessagesInt;

		  
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				}
			}
			else
			{
				//Delete Message
				// undelete function added
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_deleteundelete"))
				{
					int isModeratorChangedInt = 0;
					if (isModeratorChanged == true)
					{ isModeratorChangedInt = 1; }
					else
					{ isModeratorChangedInt = 0; }


					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
					cmd.Parameters[0].Value = messageID;

					cmd.Parameters.Add(new FbParameter("@I_ISMODERATORCHANGED", FbDbType.Boolean));
					cmd.Parameters[1].Value = isModeratorChangedInt;

					cmd.Parameters.Add(new FbParameter("@I_DELETEREASON", FbDbType.VarChar));
					cmd.Parameters[2].Value = deleteReason;

					cmd.Parameters.Add(new FbParameter("@I_ISDELETEACTION", FbDbType.Integer));
					cmd.Parameters[3].Value = isDeleteAction;

					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				}
			}
		}

		// <summary> Set flag on message to approved and store in DB </summary>
        static public void message_approve( object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Get message topic IDs (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
        static public DataTable message_simplelist( int StartID, int Limit)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 1000; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_STARTID", FbDbType.Integer)).Value = StartID;
                cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = Limit;
				

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


        static public void message_update(
            
            [NotNull] object messageID, 
            [NotNull] object priority, 
            [NotNull] object message,
            [NotNull] object description, 
            [NotNull] object status,
            [NotNull] object styles, 
            [NotNull] object subject, 
            [NotNull] object flags, 
            [NotNull] object reasonOfEdit, 
            [NotNull] object isModeratorChanged, 
            [NotNull] object overrideApproval, 
            [NotNull] object originalMessage, 
            [NotNull] object editedBy)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_update"))
			{
				if (overrideApproval == null) { overrideApproval = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new FbParameter("@I_PRIORITY", FbDbType.Integer)).Value = priority;
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = subject;
                cmd.Parameters.Add(new FbParameter("@I_STATUS", FbDbType.VarChar)).Value = status;
                cmd.Parameters.Add(new FbParameter("@I_STYLES", FbDbType.VarChar)).Value = styles;
                cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = flags;        
				cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.Text)).Value = message;
				cmd.Parameters.Add(new FbParameter("@I_REASON", FbDbType.VarChar)).Value = reasonOfEdit;
				cmd.Parameters.Add(new FbParameter("@I_EDITEDBY", FbDbType.VarChar)).Value = editedBy;               
				cmd.Parameters.Add(new FbParameter("@I_ISMODERATORCHANGED", FbDbType.Boolean)).Value = isModeratorChanged;
				cmd.Parameters.Add(new FbParameter("@I_OVERRIDEAPPROVAL", FbDbType.Boolean)).Value = overrideApproval;
				cmd.Parameters.Add(new FbParameter("@I_ORIGINALMESSAGE", FbDbType.Text)).Value = originalMessage;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		// <summary> Save message to DB. </summary>
        static public bool message_save(
            
            [NotNull] object topicID, 
            [NotNull] object userID, 
            [NotNull] object message, 
            [NotNull] object userName, 
            [NotNull] object ip, 
            [NotNull] object posted, 
            [NotNull] object replyTo, 
            [NotNull] object flags,
            ref long messageID)
        {
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_save"))
			{
				if (userName == null) { userName = DBNull.Value; }
				if (posted == null) { posted = DBNull.Value; }

			    object externalMesageId = null;
                object referenceMesageId = null;
			   // FbParameter paramMessageID = new FbParameter("@I_MESSAGEID", messageID);
			  //  paramMessageID.Direction = ParameterDirection.Output;

				cmd.CommandType = CommandType.StoredProcedure;
                
				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.Text)).Value = message;
				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
				cmd.Parameters.Add(new FbParameter("@I_IP", FbDbType.VarChar)).Value = ip;
				cmd.Parameters.Add(new FbParameter("@I_POSTED", FbDbType.TimeStamp)).Value = posted;
				cmd.Parameters.Add(new FbParameter("@I_REPLYTO", FbDbType.Integer)).Value = replyTo;
				cmd.Parameters.Add(new FbParameter("@I_BLOGPOSTID", FbDbType.VarChar)).Value = DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_EXTERNALMESSAGEID", FbDbType.VarChar)).Value = externalMesageId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_REFERENCEMESSAGEID", FbDbType.VarChar)).Value = referenceMesageId ?? DBNull.Value;
				cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = flags;                
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     
				
			   // cmd.Parameters.Add(paramMessageID);
				messageID = Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			   // messageID = Convert.ToInt64(paramMessageID.Value);
				return true;
			}
		}
        static public DataTable message_unapproved( object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_unapproved"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public DataTable message_findunread(
            
            [NotNull] object topicID, 
            [NotNull] object messageId, 
            [NotNull] object lastRead, 
            [NotNull] object showDeleted,
            [NotNull] object authorUserID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_findunread"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new FbParameter("@I_LASTREAD", FbDbType.TimeStamp)).Value = lastRead;
                cmd.Parameters.Add(new FbParameter("@I_SHOWDELETED", FbDbType.Boolean)).Value = showDeleted;
                cmd.Parameters.Add(new FbParameter("@I_AUTHORUSERID", FbDbType.Integer)).Value = authorUserID;
                
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		// message movind function
        static public void message_move(
            
            [NotNull] object messageID, 
            [NotNull] object moveToTopic, 
            bool moveAll)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
                cmd.Parameters.Add(new FbParameter("@I_MOVETOTOPIC", FbDbType.Integer)).Value = moveToTopic;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
			//moveAll=true anyway
			// it's in charge of moving answers of moved post
			if (moveAll)
			{
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;

					DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);
					foreach (DataRow row in tbReplies.Rows)
					{
                        message_moveRecursively( row["MessageID"], moveToTopic);
					}

				}
			}
		}

		//moves answers of moved post
        static private void message_moveRecursively( object messageID, object moveToTopic)
		{
            bool UseFileTable = GetBooleanRegistryValue("UseFileTable");

			//Delete replies
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer));
				cmd.Parameters[0].Value = messageID;

				DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);
				foreach (DataRow row in tbReplies.Rows)
				{
                    message_moveRecursively( row["messageID"], moveToTopic);
				}
				using (FbCommand innercmd = MsSqlDbAccess.GetCommand("message_move"))
				{
					innercmd.CommandType = CommandType.StoredProcedure;

                    innercmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageID;
                    innercmd.Parameters.Add(new FbParameter("@I_MOVETOTOPIC", FbDbType.Integer)).Value = moveToTopic;

					MsSqlDbAccess.Current.ExecuteNonQuery(innercmd);
				}
			}
		}

		// functions for Thanks feature
		//TODO: to delete
		// <summary> Checks if the message with the provided messageID is thanked 
		//           by the user with the provided UserID. if so, returns true,
		//           otherwise returns false. </summary>
        static public bool message_isThankedByUser( object userID, object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_isthankedbyuser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				FbParameter paramOutput = new FbParameter();
				paramOutput.Direction = ParameterDirection.ReturnValue;
				cmd.Parameters.AddWithValue("I_USERID", userID);
				cmd.Parameters.AddWithValue("I_MESSAGEID", messageID);
				cmd.Parameters.Add(paramOutput);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return Convert.ToBoolean(paramOutput.Value);
			}
		}

		// <summary> Return the number of times the message with the provided messageID
		//           has been thanked. </summary>
        static public int message_ThanksNumber( object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_thanksnumber"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				FbParameter paramOutput = new FbParameter();
				paramOutput.Direction = ParameterDirection.ReturnValue;
				cmd.Parameters.Add("I_MESSAGEID", FbDbType.Integer).Value = messageID;
				cmd.Parameters.Add(paramOutput);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return Convert.ToInt32(paramOutput.Value);
			}
		}

		// <summary> Returns the UserIDs and UserNames who have thanked the message
		//           with the provided messageID. </summary>
        static public DataTable message_GetThanks( object messageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("MESSAGE_GETTHANKS"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("@I_MESSAGEID", FbDbType.Integer).Value = messageID;                
				return MsSqlDbAccess.Current.GetData( cmd );
			}
		}
        /// <summary>
        /// Retuns All the message text for the Message IDs which are in the 
        /// delimited string variable MessageIDs
        /// </summary>
        /// <param name="messageIDs">
        /// The message i ds.
        /// </param>
        /// <returns>
        /// </returns>
        public static DataTable message_GetTextByIds( string messageIDs)
        {
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_gettextbyids"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("I_MESSAGEIDS", FbDbType.VarChar).Value = messageIDs;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary> Returns All the Thanks for the Message IDs which are in the 
		/// delimited string variable MessageIDs 
        ///</summary>
        [Obsolete("Use MessageGetAllThanks(string messageIdsSeparatedWithColon) instead")]
        static public DataTable message_GetAllThanks( object MessageIDs)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_getallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("I_MESSAGEIDS", FbDbType.VarChar).Value = MessageIDs;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    /// <summary>
    /// Retuns All the Thanks for the Message IDs which are in the 
    /// delimited string variable MessageIDs
    /// </summary>
    /// <param name="messageIdsSeparatedWithColon">
    /// The message i ds.
    /// </param>
    /// <returns>
    /// </returns>
        public static IEnumerable<TypedAllThanks> MessageGetAllThanks( string messageIdsSeparatedWithColon)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_getallthanks"))
      {
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("I_MESSAGEIDS", FbDbType.VarChar).Value = messageIdsSeparatedWithColon;

        return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(t => new TypedAllThanks(t));
      }
    }

        static public string message_AddThanks( object FromUserID, object MessageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("MESSAGE_ADDTHANKS"))
			{
				cmd.CommandType = CommandType.StoredProcedure;               
				
				cmd.Parameters.Add("I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
				cmd.Parameters.Add("I_MESSAGEID", FbDbType.Integer).Value = MessageID;
				cmd.Parameters.Add("I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow;

				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();              
			}
		}

        static public string message_RemoveThanks( object FromUserID, object MessageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("MESSAGE_REMOVETHANKS"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				FbParameter paramOutput = new FbParameter("OUT_RESULT", FbDbType.VarChar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add("I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
				cmd.Parameters.Add("I_MESSAGEID", FbDbType.Integer).Value = MessageID;
				cmd.Parameters.Add(paramOutput);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return (paramOutput.Value.ToString());
			}
		}

		/// <summary>
		/// The messagehistory_list.
		/// </summary>
		/// <param name="messageID">
		/// The Message ID.
		/// </param>
		/// <param name="daysToClean">
		/// Days to clean.
		/// </param>
		/// <returns>
		/// List of all message changes. 
		/// </returns>
        public static DataTable messagehistory_list( int messageID, int daysToClean)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("MESSAGEHISTORY_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add("I_MESSAGEID", FbDbType.Integer).Value =messageID;
				cmd.Parameters.Add("I_DAYSTOCLEAN", FbDbType.Integer).Value = daysToClean;				
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;        
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Returns message data based on user access rights
		/// </summary>
		/// <param name="MessageID">The Message Id.</param>
		/// <param name="UserID">The UserId.</param>
		/// <returns></returns>
        public static DataTable message_secdata( int messageID, object pageUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("message_secdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_MESSAGEID", FbDbType.Integer).Value = messageID;
                cmd.Parameters.Add("@I_PAGEUSERID", FbDbType.Integer).Value = pageUserId;               

				return MsSqlDbAccess.Current.GetData(cmd);

			}
		}
		#endregion
	   
		#region yaf_Medal

		/// <summary>
		/// Lists given medal.
		/// </summary>
		/// <param name="medalID">ID of medal to list.</param>
        static public DataTable medal_list( object medalID)
		{
			return medal_list(null, medalID, null);
		}
		/// <summary>
		/// Lists given medals.
		/// </summary>
		/// <param name="boardID">ID of board of which medals to list. Required.</param>
		/// <param name="category">Cateogry of medals to list. Can be null. In such case this parameter is ignored.</param>
        static public DataTable medal_list( object boardID, object category)
		{
            return medal_list( boardID, null, category);
		}
		/// <summary>
		/// Lists medals.
		/// </summary>
		/// <param name="boardID">ID of board of which medals to list. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to list. When specified, boardID and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to list. Must be complemented with not-null boardID parameter.</param>
        static public DataTable medal_list( object boardID, object medalID, object category)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("medal_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORY", FbDbType.VarChar)).Value = category ?? DBNull.Value; 

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


		/// <summary>
		/// List users who own this medal.
		/// </summary>
		/// <param name="medalID">Medal of which owners to get.</param>
		/// <returns>List of users with their user id and usernames, who own this medal.</returns>
        static public DataTable medal_listusers(
            object medalID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("medal_listusers"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        /// <summary>
        /// Deletes given medal.
        /// </summary>
        /// <param name="medalID">
        /// ID of medal to delete.
        /// </param>
        public static void medal_delete( [NotNull] object medalID)
        {
            medal_delete( null, medalID, null);
        }

		/// <summary>
		/// Deletes medals.
		/// </summary>
		/// <param name="boardID">ID of board of which medals to delete. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to delete. When specified, boardID and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to delete. Must be complemented with not-null boardID parameter.</param>
        static public void medal_delete( object boardID, object medalID, object category)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORY", FbDbType.VarChar)).Value = category ?? DBNull.Value;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Saves new medal or updates existing one. 
		/// </summary>
		/// <param name="boardID">ID of a board.</param>
		/// <param name="medalID">ID of medal to update. Null if new medal is being created.</param>
		/// <param name="name">Name of medal.</param>
		/// <param name="description">Description of medal.</param>
		/// <param name="message">Defaukt message to display. Should briefly describe why was medal awarded to user.</param>
		/// <param name="category">Category of medal.</param>
		/// <param name="medalURL">URL of medal's image.</param>
		/// <param name="ribbonURL">URL of medal's ribbon bar. Can be null.</param>
		/// <param name="smallMedalURL">URL of medal's small image. This one is displayed in user box.</param>
		/// <param name="smallRibbonURL">URL of medal's small ribbon bar. This one is eventually displayed in user box. Can be null.</param>
		/// <param name="smallMedalWidth">Width of small medal's image, in pixels.</param>
		/// <param name="smallMedalHeight">Height of small medal's image, in pixels.</param>
		/// <param name="smallRibbonWidth">Width of small medal's ribbon bar image, in pixels.</param>
		/// <param name="smallRibbonHeight">Width of small medal's ribbon bar image, in pixels.</param>
		/// <param name="sortOrder">Default order of medal as it will be displayed in user box.</paramHeight
		/// <param name="flags">Medal's flags.</param>
		/// <returns>True if medal was successfully created or updated. False otherwise.</returns>
        static public bool medal_save(
            [NotNull] object boardID, 
            [NotNull] object medalID, 
            [NotNull] object name, 
            [NotNull] object description, 
            [NotNull] object message, 
            [NotNull] object category, 
            [NotNull] object medalURL, 
            [NotNull] object ribbonURL, 
            [NotNull] object smallMedalURL, 
            [NotNull] object smallRibbonURL, 
            [NotNull] object smallMedalWidth, 
            [NotNull] object smallMedalHeight, 
            [NotNull] object smallRibbonWidth, 
            [NotNull] object smallRibbonHeight, 
            [NotNull] object sortOrder, 
            [NotNull] object flags)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("medal_save"))
			{
				if (boardID == null) { boardID = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }
				if (category == null) { category = DBNull.Value; }
				if (ribbonURL == null) { ribbonURL = DBNull.Value; }
				if (smallRibbonURL == null) { smallRibbonURL = DBNull.Value; }
				if (smallRibbonWidth == null) { smallRibbonWidth = DBNull.Value; }
				if (smallRibbonHeight == null) { smallRibbonHeight = DBNull.Value; }

			   int sortOrderOut = 0;               
			   bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
			   if (result)               
			   { 
				   if (sortOrderOut >= 255) { sortOrderOut = 0; } 
			   }
			
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;
                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.Text)).Value = description;
                cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.VarChar)).Value = message;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORY", FbDbType.VarChar)).Value = category;
                cmd.Parameters.Add(new FbParameter("@I_MEDALURL", FbDbType.VarChar)).Value = medalURL;
                cmd.Parameters.Add(new FbParameter("@I_RIBBONURL", FbDbType.VarChar)).Value = ribbonURL;
                cmd.Parameters.Add(new FbParameter("@I_SMALLMEDALURL", FbDbType.VarChar)).Value = smallMedalURL;
                cmd.Parameters.Add(new FbParameter("@I_SMALLRIBBONURL", FbDbType.VarChar)).Value = smallRibbonURL;
                cmd.Parameters.Add(new FbParameter("@I_SMALLMEDALWIDTH", FbDbType.SmallInt)).Value = smallMedalWidth;
                cmd.Parameters.Add(new FbParameter("@I_SMALLMEDALHEIGHT", FbDbType.SmallInt)).Value = smallMedalHeight;
                cmd.Parameters.Add(new FbParameter("@I_SMALLRIBBONWIDTH", FbDbType.SmallInt)).Value = smallRibbonWidth;
                cmd.Parameters.Add(new FbParameter("@I_SMALLRIBBONHEIGHT", FbDbType.SmallInt)).Value = smallRibbonHeight;
                cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt)).Value = sortOrderOut;
                cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = flags ?? 0; 

				// command succeeded if returned value is greater than zero (number of affected rows)
				// bool rres = (MsSqlDbAccess.Current.ExecuteScalar(cmd) > 0);
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd)) > 0;

			}
		}


		/// <summary>
		/// Changes medal's sort order.
		/// </summary>
		/// <param name="boardID">ID of board.</param>
		/// <param name="medalID">ID of medal to re-sort.</param>
		/// <param name="move">Change of sort.</param>
        static public void medal_resort( object boardID, object medalID, int move)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("medal_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;
                cmd.Parameters.Add(new FbParameter("@I_MOVE", FbDbType.Integer)).Value = move;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Deletes medal allocation to a group.
		/// </summary>
		/// <param name="groupID">ID of group owning medal.</param>
		/// <param name="medalID">ID of medal.</param>
        static public void group_medal_delete( object groupID, object medalID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer));
				cmd.Parameters[0].Value = groupID;

				cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer));
				cmd.Parameters[1].Value = medalID;

			  

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="groupID">ID of group of which to list medals.</param>
		/// <param name="medalID">ID of medal to list.</param>
        static public DataTable group_medal_list(
            [NotNull] object groupID, 
            [NotNull] object medalID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_medal_list"))
			{
				if (groupID == null) { groupID = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


		/// <summary>
		/// Saves new or update existing group-medal allocation.
		/// </summary>
		/// <param name="groupID">ID of user group.</param>
		/// <param name="medalID">ID of medal.</param>
		/// <param name="message">Medal message, to override medal's default one. Can be null.</param>
		/// <param name="hide">Hide medal in user box.</param>
		/// <param name="onlyRibbon">Show only ribbon bar in user box.</param>
		/// <param name="sortOrder">Sort order in user box. Overrides medal's default sort order.</param>
        static public void group_medal_save(
            [NotNull] object groupID, 
            [NotNull] object medalID, 
            [NotNull] object message, 
            [NotNull] object hide, 
            [NotNull] object onlyRibbon, 
            [NotNull] object sortOrder)
		{
			int sortOrderOut = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
			if (result)
			{
				if (sortOrderOut >= 255) { sortOrderOut = 0; }
			}

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_medal_save"))
			{
				if (message == null) { message = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;
                cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.VarChar)).Value = message;
                cmd.Parameters.Add(new FbParameter("@I_HIDE", FbDbType.Boolean)).Value = hide;
                cmd.Parameters.Add(new FbParameter("@I_ONLYRIBBON", FbDbType.Boolean)).Value = onlyRibbon;
                cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt)).Value = sortOrderOut;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}



		/// <summary>
		/// Deletes medal allocation to a user.
		/// </summary>
		/// <param name="userID">ID of user owning medal.</param>
		/// <param name="medalID">ID of medal.</param>
        static public void user_medal_delete( object userID, object medalID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID ?? DBNull.Value;
	  

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="userID">ID of user who was given medal.</param>
		/// <param name="medalID">ID of medal to list.</param>
        static public DataTable user_medal_list( object userID, object medalID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_medal_list"))
			{
			
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID ?? DBNull.Value;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			   
			}
		}


		/// <summary>
		/// Saves new or update existing user-medal allocation.
		/// </summary>
		/// <param name="userID">ID of user.</param>
		/// <param name="medalID">ID of medal.</param>
		/// <param name="message">Medal message, to override medal's default one. Can be null.</param>
		/// <param name="hide">Hide medal in user box.</param>
		/// <param name="onlyRibbon">Show only ribbon bar in user box.</param>
		/// <param name="sortOrder">Sort order in user box. Overrides medal's default sort order.</param>
		/// <param name="dateAwarded">Date when medal was awarded to a user. Is ignored when existing user-medal allocation is edited.</param>
        static public void user_medal_save(
			object userID, object medalID, object message,
			object hide, object onlyRibbon, object sortOrder, object dateAwarded)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_medal_save"))
			{
				if (message == null) { message = DBNull.Value; }
				if (dateAwarded == null) { dateAwarded = DBNull.Value; }
				if (sortOrder == null) { sortOrder = 0; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_MEDALID", FbDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.VarChar)).Value = message;
				cmd.Parameters.Add(new FbParameter("@I_HIDE", FbDbType.Boolean)).Value = hide;
				cmd.Parameters.Add(new FbParameter("@I_ONLYRIBBON", FbDbType.Boolean)).Value = onlyRibbon;
				cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt)).Value = sortOrder;
				cmd.Parameters.Add(new FbParameter("@I_DATEAWARDED", FbDbType.TimeStamp)).Value = dateAwarded;               
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists all medals held by user as they are to be shown in user box.
		/// </summary>
		/// <param name="userID">ID of user.</param>
		/// <returns>List of medals, ribbon bar only first.</returns>
        static public DataTable user_listmedals(
            [NotNull]object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_listmedals"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion        

		#region yaf_NntpForum
        static public DataTable nntpforum_list( object boardID, object minutes, object nntpForumID, object active)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_list"))
			{
				if (minutes == null) { minutes = DBNull.Value; }
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }
			 

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_MINUTES", FbDbType.Integer)).Value = minutes;
				cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new FbParameter("@I_ACTIVE", FbDbType.Boolean)).Value = active;                
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

				return MsSqlDbAccess.Current.GetData(cmd,false);
			}
		}
        public static IEnumerable<TypedNntpForum> NntpForumList(
            int boardID, 
            int? minutes, 
            int? nntpForumID, 
            bool? active)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("nntpforum_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_MINUTES", FbDbType.Integer)).Value = minutes;
                cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer)).Value = nntpForumID;
                cmd.Parameters.Add(new FbParameter("@I_ACTIVE", FbDbType.Boolean)).Value = active;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(r => new TypedNntpForum(r));
            }
        }
        static public void nntpforum_update(
            [NotNull] object nntpForumID, 
            [NotNull] object lastMessageNo, 
            [NotNull] object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_update"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new FbParameter("@I_LASTMESSAGENO", FbDbType.Integer)).Value = lastMessageNo;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpforum_save(
            [NotNull] object nntpForumID, 
            [NotNull] object nntpServerID, 
            [NotNull] object groupName, 
            [NotNull] object forumID, 
            [NotNull] object active, 
            [NotNull] object datecutoff)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_save"))
			{
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;                

				cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new FbParameter("@I_NNTPSERVERID", FbDbType.Integer)).Value = nntpServerID;
				cmd.Parameters.Add(new FbParameter("@I_GROUPNAME", FbDbType.VarChar)).Value = groupName;
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_ACTIVE", FbDbType.Boolean)).Value = active;
                cmd.Parameters.Add(new FbParameter("@I_DATECUTOFF", FbDbType.TimeStamp)).Value = datecutoff;     
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpforum_delete( object nntpForumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer));
				cmd.Parameters[0].Value = nntpForumID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_NntpServer
        static public DataTable nntpserver_list(
            object boardID, 
            object nntpServerID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_list"))
			{
				if (boardID == null) { boardID = DBNull.Value; }
				if (nntpServerID == null) { nntpServerID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_NNTPSERVERID", FbDbType.Integer)).Value = nntpServerID;
		  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void nntpserver_save(
            [NotNull] object nntpServerID, 
            [NotNull] object boardID, 
            [NotNull] object name, 
            [NotNull] object address, 
            [NotNull] object port, 
            [NotNull] object userName, 
            [NotNull] object userPass)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_save"))
			{
				if (nntpServerID == null) { nntpServerID = DBNull.Value; }
				if (userName == null) { userName = DBNull.Value; }
				if (userPass == null) { userPass = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_NNTPSERVERID", FbDbType.Integer)).Value = nntpServerID;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
				cmd.Parameters.Add(new FbParameter("@I_ADDRESS", FbDbType.VarChar)).Value = address;
                cmd.Parameters.Add(new FbParameter("@I_PORT", FbDbType.Integer)).Value = port;
                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
				cmd.Parameters.Add(new FbParameter("@I_USERPASS", FbDbType.VarChar)).Value = userPass;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpserver_delete( object nntpServerID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_NNTPSERVERID", FbDbType.Integer)).Value = nntpServerID;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion        

		#region yaf_NntpTopic
        static public DataTable nntptopic_list(
            object thread)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntptopic_list"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_THREAD", FbDbType.VarChar)).Value = thread;

			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void nntptopic_savemessage(
            [NotNull] object nntpForumID, 
            [NotNull] object topic, 
            [NotNull] object body, 
            [NotNull] object userID, 
            [NotNull] object userName, 
            [NotNull] object ip, 
            [NotNull] object posted, 
            [NotNull] object externalMessageId, 
            [NotNull] object referenceMessageId)
		{
			/* String newbody = body.ToString();
			newbody = newbody.Replace(@"&amp;", "&"); 
			newbody = newbody.Replace(@"&lt;", "<");
			newbody = newbody.Replace(@"&gt;", ">");
			newbody = newbody.Replace("</unquote/>", "[quote]");
			newbody = newbody.Replace("</quote/>", "[/quote]");         
					   
			newbody = newbody.Replace("&quot;", @"""");
			newbody = newbody.Replace(@"quot;", @"'");
			newbody = newbody.Replace("[-snip-]", "(SNIP)");
			newbody = newbody.Replace(@"@I_", "[dog]");
			newbody = newbody.Replace("_.", ".");
			newbody = newbody.Replace("br", "/n");
			
			 
			newbody = newbody.Replace("&", "^^^"); */
			//string newbody = body.ToString().Replace(@"&lt;br&gt;", "> ").Replace(@"&amp;lt;", "<").Replace(@"&lt;hr&gt;", "> ").Replace(@"&amp;quot;", @"""").Replace(@"&lt;", @"<").Replace(@"br&gt;", @"> ").Replace(@"&amp;gt;", @"> ").Replace(@"&gt;", "> ").Replace("&quot;", @"""").Replace("[-snip-]", "(SNIP)").Replace(@"@I_", "[dog]").Replace("_.", "");
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("nntptopic_savemessage")) 
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_NNTPFORUMID", FbDbType.Integer)).Value = nntpForumID;
			    cmd.Parameters.Add(new FbParameter("@I_TOPIC", FbDbType.VarChar)).Value = topic;
				cmd.Parameters.Add(new FbParameter("@I_BODY", FbDbType.Text)).Value = body;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
                cmd.Parameters.Add(new FbParameter("@I_IP", FbDbType.VarChar)).Value = ip;
                cmd.Parameters.Add(new FbParameter("@I_POSTED", FbDbType.TimeStamp)).Value = posted;
                cmd.Parameters.Add(new FbParameter("@I_EXTERNALMESSAGEID", FbDbType.VarChar)).Value = externalMessageId;
                cmd.Parameters.Add(new FbParameter("@I_REFERENCEMESSAGEID", FbDbType.VarChar)).Value = referenceMessageId;
                cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion        

		#region yaf_PMessage
		/// <summary>
		/// Returns a list of private messages based on the arguments specified.
		/// If pMessageID != null, returns the PM of id pMessageId.
		/// If toUserID != null, returns the list of PMs sent to the user with the given ID.
		/// If fromUserID != null, returns the list of PMs sent by the user of the given ID.
		/// </summary>
		/// <param name="toUserID"></param>
		/// <param name="fromUserID"></param>
		/// <param name="pMessageID">The id of the private message</param>
		/// <returns></returns>
        static public DataTable pmessage_list( object toUserID, object fromUserID, object userPMessageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("PMESSAGE_LIST"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_FROMUSERID", FbDbType.Integer)).Value = fromUserID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_TOUSERID", FbDbType.Integer)).Value = toUserID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_USERPMESSAGEID", FbDbType.Integer)).Value = userPMessageID ?? DBNull.Value;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Returns a list of private messages based on the arguments specified.
		/// If pMessageID != null, returns the PM of id pMessageId.
		/// If toUserID != null, returns the list of PMs sent to the user with the given ID.
		/// If fromUserID != null, returns the list of PMs sent by the user of the given ID.
		/// </summary>
		/// <param name="toUserID"></param>
		/// <param name="fromUserID"></param>
		/// <param name="pMessageID">The id of the private message</param>
		/// <returns></returns>
        static public DataTable pmessage_list( object userPMessageID)
		{
            return pmessage_list( null, null, userPMessageID);
		}
		/// <summary>
		/// Deletes the private message from the database as per the given parameter.  If <paramref name="fromOutbox"/> is true,
		/// the message is only removed from the user's outbox.  Otherwise, it is completely delete from the database.
		/// </summary>
		/// <param name="pMessageID"></param>
		/// <param name="fromOutbox">If true, removes the message from the outbox.  Otherwise deletes the message completely.</param>
        static public void pmessage_delete(
            object userPMessageID, 
            bool fromOutbox)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERPMESSAGEID", FbDbType.Integer)).Value = userPMessageID;
                cmd.Parameters.Add(new FbParameter("@I_FROMOUTBOX", FbDbType.Boolean)).Value = fromOutbox;
 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Deletes the private message from the database as per the given parameter.  If fromOutbox is true,
		/// the message is only deleted from the user's outbox.  Otherwise, it is completely delete from the database.
		/// </summary>
		/// <param name="userPMessageID"></param>
        static public void pmessage_delete( object userPMessageID)
		{
            pmessage_delete( userPMessageID, false);
		}

		/// <summary>
		/// Archives the private message of the given id.  Archiving moves the message from the user's inbox to his message archive.
		/// </summary>
		/// <param name="pMessageID">The ID of the private message</param>
        public static void pmessage_archive(
            object userPMessageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_archive"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERPMESSAGEID", FbDbType.Integer)).Value = userPMessageID ?? DBNull.Value;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public void pmessage_save(
            object fromUserID, 
            object toUserID, 
            object subject, 
            object body, 
            object Flags)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FROMUSERID", FbDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new FbParameter("@I_TOUSERID", FbDbType.Integer)).Value = toUserID;
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = subject;
				cmd.Parameters.Add(new FbParameter("@I_BODY", FbDbType.Text)).Value = body;
				cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = Flags;               
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void pmessage_markread( object userPMessageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_markread"))
			{
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERPMESSAGEID", FbDbType.Integer)).Value = userPMessageID;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public DataTable pmessage_info()
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_info"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void pmessage_prune(
            object daysRead, 
            object daysUnread)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("pmessage_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_DAYSREAD", FbDbType.Integer)).Value = daysRead;
				cmd.Parameters.Add(new FbParameter("@I_DAYSUNREAD", FbDbType.Integer)).Value = daysUnread;                
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_Poll

            /// <summary>
    /// The pollgroup_stats.
    /// </summary>
    /// <param name="pollGroupId">
    /// The poll group id.
    /// </param>
    /// <returns>
    /// </returns>
        public static DataTable pollgroup_stats(
         int? pollGroupId)
    {
        using (FbCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_stats"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@I_POLLGROUPID", pollGroupId);
            return MsSqlDbAccess.Current.GetData(cmd);
        }
    }

    /// <summary>
    /// The pollgroup_attach.
    /// </summary>
    /// <param name="pollGroupId">
    /// The poll group id.
    /// </param>
    /// <returns>
    /// </returns>
        public static int pollgroup_attach(
        
        int? pollGroupId, 
        int? topicId, 
        int? forumId, 
        int? categoryId, 
        int? boardId)
    {
        using (FbCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_attach"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@I_POLLGROUPID", pollGroupId);
            cmd.Parameters.AddWithValue("@I_TOPICID", topicId);
            cmd.Parameters.AddWithValue("@I_FORUMID", forumId);
            cmd.Parameters.AddWithValue("@I_CATEGORYID", categoryId);
            cmd.Parameters.AddWithValue("@I_BOARDID", boardId);
            return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
        }
    }
        static public DataTable poll_stats( object pollID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("poll_stats"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_POLLID", FbDbType.Integer)).Value = pollID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// The method saves many questions and answers to them in a single transaction 
		/// </summary>
		/// <param name="pollList">List to hold all polls data</param>
		/// <returns>Last saved poll id.</returns>
        public static int? poll_save(
            [NotNull] System.Collections.Generic.List<PollSaveList> pollList)
		{

			foreach (PollSaveList question in pollList)
			{
             var sb = new System.Text.StringBuilder();
             var paramSb = new System.Text.StringBuilder("EXECUTE BLOCK ("); 
			  sb.Append(" RETURNS(OUT_POLLGROUPID INTEGER) AS  DECLARE VARIABLE OUT_POLLID INTEGER;  BEGIN ");
                            // Check if the group already exists

              if (question.CategoryId > 0)
              {

                  sb.Append("SELECT POLLGROUPID  FROM ");
                  sb.Append(MsSqlDbAccess.GetObjectName("CATEGORY"));
                  sb.Append(" WHERE CATEGORYID = :I_CATEGORYID INTO :OUT_POLLGROUPID; ");
                  paramSb.Append("I_CATEGORYID INTEGER = ?,");
              }
              if (question.ForumId > 0)
              {

                  sb.Append("SELECT POLLGROUPID  FROM ");
                  sb.Append(MsSqlDbAccess.GetObjectName("FORUM"));
                  sb.Append(" WHERE FORUMID = :I_FORUMID INTO :OUT_POLLGROUPID; ");
                  paramSb.Append("I_FORUMID INTEGER = ?,");
              }
           
            if (question.TopicId > 0)
           {
               sb.Append(" SELECT POLLID FROM ");
               sb.Append(MsSqlDbAccess.GetObjectName("TOPIC"));
               sb.Append(" WHERE TOPICID = :I_TOPICID INTO :OUT_POLLGROUPID; ");
               paramSb.Append("I_TOPICID INTEGER = ?,");
           }
           

          // if the poll group doesn't exists, create a new one
			sb.Append("IF (OUT_POLLGROUPID IS NULL) THEN BEGIN ");
            
           sb.Append("INSERT INTO ");
           sb.Append(MsSqlDbAccess.GetObjectName("POLLGROUPCLUSTER"));
           sb.AppendFormat("(POLLGROUPID, USERID, FLAGS) VALUES((SELECT NEXT VALUE FOR SEQ_{0}PGC_POLLGROUPID FROM RDB$DATABASE), :GROUPUSERID, :POLLGROUPFLAGS) RETURNING POLLGROUPID INTO :OUT_POLLGROUPID;  END ", MsSqlDbAccess.ObjectQualifier.ToUpper());

           paramSb.Append("GROUPUSERID INTEGER = ?,");
           paramSb.Append("POLLGROUPFLAGS INTEGER = ?,");
           if (question.CategoryId > 0)
           {
               sb.Append("UPDATE ");
               sb.Append(MsSqlDbAccess.GetObjectName("CATEGORY"));
               sb.Append(" SET POLLGROUPID = :OUT_POLLGROUPID WHERE CATEGORYID = :I_CATEGORYID; ");

           }
           if (question.ForumId > 0)
           {
               sb.Append("UPDATE ");
               sb.Append(MsSqlDbAccess.GetObjectName("FORUM"));
               sb.Append(" SET POLLGROUPID = :OUT_POLLGROUPID WHERE FORUMID = :I_FORUMID; ");
           }

           if (question.TopicId > 0)
           {
               sb.Append("UPDATE ");
               sb.Append(MsSqlDbAccess.GetObjectName("TOPIC"));
               sb.Append(" SET POLLID = :OUT_POLLGROUPID WHERE TOPICID = :I_TOPICID; ");
           }

                // System.Text.StringBuilder paramSb = new System.Text.StringBuilder("EXECUTE BLOCK ("); 
            // INSERT in poll
				sb.Append(" INSERT INTO ");
				sb.Append(MsSqlDbAccess.GetObjectName("POLL"));
				if (question.Closes > DateTime.MinValue)
				{

					sb.Append("(POLLID,QUESTION, USERID, CLOSES,POLLGROUPID,FLAGS");
				}
				else
				{
                    sb.Append("(POLLID,QUESTION, USERID,POLLGROUPID,FLAGS");
				}

                if (question.QuestionObjectPath.IsSet())
                {
                    sb.Append(", OBJECTPATH");
                }
                if (question.QuestionMimeType.IsSet())
                {
                    sb.Append(", MIMETYPE");
                }
                sb.Append(") VALUES(");
				
				sb.AppendFormat("(SELECT NEXT VALUE FOR SEQ_{0}POLL_POLLID FROM RDB$DATABASE),", MsSqlDbAccess.ObjectQualifier.ToUpper());
				sb.Append(":QUESTION");

                paramSb.Append(" QUESTION VARCHAR(255) = ?,");

                sb.Append(",:USERID");
                paramSb.Append("USERID INTEGER = ?,");

				if (question.Closes > DateTime.MinValue)
				{
					sb.Append(",:CLOSES");
					paramSb.Append("CLOSES TIMESTAMP = ?,");
				}
                sb.Append(",:OUT_POLLGROUPID");               

                sb.Append(",:FLAGS");
				paramSb.Append("FLAGS INTEGER = ?,");
                if (question.QuestionObjectPath.IsSet())
                {
                    sb.Append(",:QUESTIONOBJECTPATH");
                    paramSb.Append("OBJECTPATH VARCHAR(255) = ?,");
                }
                if (question.QuestionMimeType.IsSet())
                {
                    sb.Append(",:QUESTIONMIMETYPE");
                    paramSb.Append("MIMETYPE VARCHAR(50) = ?,");
                }

			    sb = new StringBuilder(sb.ToString().TrimEnd(','));
			    sb.Append(") RETURNING POLLID INTO :OUT_POLLID; ");

				// The cycle through question reply choices to create prepare statement

				// The cycle through question reply choices            
                for (uint choiceCount = 0; choiceCount < question.Choice.GetLength(0); choiceCount++)
                {
                    if (!string.IsNullOrEmpty(question.Choice[0, choiceCount]))
                    {

                        sb.Append("INSERT INTO ");
                        sb.Append(MsSqlDbAccess.GetObjectName("CHOICE"));

                        sb.Append("(CHOICEID, POLLID,CHOICE,VOTES");
                        if (question.QuestionObjectPath.IsSet())
                        {
                            sb.Append(",OBJECTPATH");
                        }
                        if (question.QuestionMimeType.IsSet())
                        {
                            sb.Append(",MIMETYPE");
                        }
                        sb.Append(") VALUES(");
                        sb.AppendFormat("(SELECT NEXT VALUE FOR SEQ_{0}CHOICE_CHOICEID FROM RDB$DATABASE),",
                                        MsSqlDbAccess.ObjectQualifier.ToUpper());
                        sb.AppendFormat(":OUT_POLLID,:CHOICE{0},:VOTES{0}", choiceCount);
                        if (question.QuestionObjectPath.IsSet())
                        {
                            sb.AppendFormat(",:CHOICEOBJECTPATH{0}", choiceCount);
                        }
                        if (question.QuestionMimeType.IsSet())
                        {
                            sb.AppendFormat(",:CHOICEMIMETYPE{0}", choiceCount);
                        }
                        sb.Append("); ");
                        paramSb.AppendFormat("CHOICE{0} VARCHAR(255) = ?,", choiceCount);
                        paramSb.AppendFormat("VOTES{0} INTEGER = ?,", choiceCount);

                        if (question.QuestionObjectPath.IsSet())
                        {
                            paramSb.AppendFormat("CHOICEOBJECTPATH{0} VARCHAR(255) = ?,", choiceCount);
                        }
                        if (question.QuestionMimeType.IsSet())
                        {
                            paramSb.AppendFormat("CHOICEMIMETYPE{0} VARCHAR(50) = ?,", choiceCount);
                        }

                    }

                }
              
			   sb.Append(" SUSPEND; END;");               
			   FbCommand cmd = new FbCommand();
			   cmd.CommandText =  paramSb.ToString().TrimEnd(',') + ") " + sb.ToString();
			   MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager();
			    FbConnection con = connMan.OpenDBConnection;
			    FbTransaction trans = con.BeginTransaction(MsSqlDbAccess.IsolationLevel);
			
			   cmd.Transaction = trans;
			  // cmd.Prepare();   
					 /* FbParameter ret = new FbParameter();
					 ret.ParameterName = "@OUT_POLLID";
					 ret.FbDbType = FbDbType.Integer;
					 ret.Direction = ParameterDirection.Output;
					 cmd.Parameters.Add(ret); */
			   object categoryId = DBNull.Value;
               object forumId = DBNull.Value;
               object topicId = DBNull.Value;
               if (question.CategoryId > 0)
               {
                   cmd.Parameters.Add(new FbParameter("I_CATEGORYID", FbDbType.Integer)).Value = question.CategoryId ??
                                                                                                 categoryId;
               }
               if (question.ForumId > 0)
               {
                   cmd.Parameters.Add(new FbParameter("I_FORUMID", FbDbType.Integer)).Value = question.ForumId ??
                                                                                              forumId;
               }
               if (question.TopicId > 0)
               {
                   cmd.Parameters.Add(new FbParameter("I_TOPICID", FbDbType.Integer)).Value = question.TopicId ??
                                                                                              topicId;
               }
			   cmd.Parameters.Add(new FbParameter("GROUPUSERID", FbDbType.Integer)).Value = question.UserId;
               int pollGroupFlags = question.IsBound
              ? 0 | 2
               : 0;
               cmd.Parameters.Add(new FbParameter("POLLGROUPFLAGS", FbDbType.Integer)).Value = pollGroupFlags;
                cmd.Parameters.Add(new FbParameter("QUESTION", FbDbType.VarChar)).Value = question.Question;
                cmd.Parameters.Add(new FbParameter("USERID", FbDbType.Integer)).Value = question.UserId;

					if (question.Closes > DateTime.MinValue)
					{
						cmd.Parameters.Add(new FbParameter("CLOSES", FbDbType.TimeStamp)).Value = question.Closes;                       
					}

            // set poll  flags
            int pollFlags = 0;
            if (question.IsClosedBound)
            {
                pollFlags = pollFlags | 4;
            }
            if (question.AllowMultipleChoices)
            {
                pollFlags = pollFlags | 8;
            }
            if (question.ShowVoters)
            {
                pollFlags = pollFlags | 16;
            }
            if (question.AllowSkipVote)
            {
                pollFlags = pollFlags | 32;
            }


            cmd.Parameters.Add(new FbParameter("FLAGS", FbDbType.Integer)).Value = pollFlags;
                   if (question.QuestionObjectPath.IsSet())
                   {
                       cmd.Parameters.Add(new FbParameter("QUESTIONOBJECTPATH", FbDbType.VarChar)).Value =
                           question.QuestionObjectPath;
                   }
                   if (question.QuestionMimeType.IsSet())
                   {
                       cmd.Parameters.Add(new FbParameter("QUESTIONMIMETYPE", FbDbType.VarChar)).Value =
                           question.QuestionMimeType;
                   }

                   for (uint choiceCount1 = 0; choiceCount1 < question.Choice.GetLength(0); choiceCount1++)
					{
						if (!string.IsNullOrEmpty(question.Choice[0,choiceCount1]))
						{              
							cmd.Parameters.Add(new FbParameter(String.Format("CHOICE{0}", choiceCount1), FbDbType.VarChar)).Value= question.Choice[0,choiceCount1];
							cmd.Parameters.Add(new FbParameter(String.Format("VOTES{0}", choiceCount1), FbDbType.Integer)).Value =  0;
                            if (question.Choice[1, choiceCount1].IsSet())
                            {
                                cmd.Parameters.Add(new FbParameter(String.Format("CHOICEOBJECTPATH{0}", choiceCount1), FbDbType.VarChar)).Value =
                            question.Choice[1, choiceCount1].IsNotSet() ? String.Empty : question.Choice[1, choiceCount1];
                            }
                            if (question.Choice[2,choiceCount1].IsSet())
                            {
                                cmd.Parameters.Add(new FbParameter(String.Format("CHOICEMIMETYPE{0}", choiceCount1), FbDbType.VarChar)).Value =
                            question.Choice[2, choiceCount1].IsNotSet() ? String.Empty : question.Choice[2, choiceCount1];
                            }
						}
					}



                // cmd.Prepare();   
				int? result = Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd, true));
				trans.Commit();
				con.Close();
				return  result;
				 
				}            
			return null;
		}

        static public void poll_update(
        
        [NotNull] object pollID,
        [NotNull] object question,
        [NotNull] object closes,
        [NotNull] object isBounded,
        bool isClosedBounded,
        bool allowMultipleChoices,
        bool showVoters,
        bool allowSkipVote,
        [NotNull] object questionPath,
        [NotNull] object questionMime)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("POLL_UPDATE"))
			{
				if (closes == null) { closes = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_POLLID", FbDbType.Integer)).Value = pollID;
				cmd.Parameters.Add(new FbParameter("@I_QUESTION", FbDbType.VarChar)).Value = question;
				cmd.Parameters.Add(new FbParameter("@I_CLOSES", FbDbType.TimeStamp)).Value = closes;
                cmd.Parameters.Add(new FbParameter("@I_QUESTIONOBJECTPATH", FbDbType.VarChar)).Value = questionPath;
                cmd.Parameters.Add(new FbParameter("@I_QUESTIONMIMETYPE", FbDbType.VarChar)).Value =  questionMime;
                cmd.Parameters.Add(new FbParameter("@I_ISBOUNDED", FbDbType.Boolean)).Value =  isBounded;
                cmd.Parameters.Add(new FbParameter("@I_ISCLOSEDBOUNDED", FbDbType.Boolean)).Value =  isClosedBounded;
                cmd.Parameters.Add(new FbParameter("@I_ALLOWMULTIPLECHOICES", FbDbType.Boolean)).Value =  allowMultipleChoices;
                cmd.Parameters.Add(new FbParameter("@I_SHOWVOTERS", FbDbType.Boolean)).Value = showVoters;
                cmd.Parameters.Add(new FbParameter("@I_ALLOWSKIPVOTE", FbDbType.Boolean)).Value = allowSkipVote;
    
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void poll_remove(
            
            object pollGroupID, object 
            pollID, object boardId, 
            bool removeCompletely, 
            bool removeEverywhere)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("poll_remove"))
			{
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_POLLGROUPID", FbDbType.Integer)).Value = pollGroupID;
                cmd.Parameters.Add(new FbParameter("@I_POLLID", FbDbType.Integer)).Value = pollID;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_REMOVECOMPLETELY",FbDbType.Boolean)).Value = removeCompletely;
                cmd.Parameters.Add(new FbParameter("@I_REMOVEEVERYWHERE",FbDbType.Boolean)).Value =removeEverywhere;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

           /// <summary>
    /// Gets a typed poll group list.
    /// </summary>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="forumId">
    /// The forum id.
    /// </param>
    /// <param name="boardId">
    /// The board id.
    /// </param>
    /// <returns>
    /// </returns>
        public static IEnumerable<TypedPollGroup> PollGroupList( int userID, int? forumId, int boardId)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("POLLGROUP_LIST"))
      {
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
        cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumId;
        cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;

        return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(r => new TypedPollGroup(r));
      }
    }

      /// <summary>
      /// The poll_remove.
      /// </summary>
      /// <param name="pollGroupID">
      /// The poll group id. The parameter should always be present. 
      /// </param>
      /// <param name="topicId">
      /// The poll id. If null all polls in a group a deleted. 
      /// </param>
      /// <param name="boardId">
      /// The BoardID id. 
      /// </param>
      /// <param name="removeCompletely">
      /// The RemoveCompletely. If true and pollID is null , all polls in a group are deleted completely, 
      /// else only one poll is deleted completely. 
      /// </param>
      /// <param name="forumId"></param>
      /// <param name="removeEverywhere"></param>
        public static void pollgroup_remove(
          
          [NotNull]object pollGroupID, 
          object topicId, 
          object forumId, 
          object categoryId, 
          object boardId, 
          bool removeCompletely, 
          bool removeEverywhere)
    {
        using (FbCommand cmd = MsSqlDbAccess.GetCommand("POLLGROUP_REMOVE"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("@I_POLLGROUPID", FbDbType.Integer)).Value =  pollGroupID;
            cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value =  topicId;
            cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value =  forumId;
            cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value =  categoryId;
            cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value =  boardId;
            cmd.Parameters.Add(new FbParameter("@I_REMOVECOMPLETELY", FbDbType.Boolean)).Value =  removeCompletely;
            cmd.Parameters.Add(new FbParameter("@I_REMOVEEVERYWHERE", FbDbType.Boolean)).Value =  removeEverywhere;
            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        }
    }

        static public void choice_delete(
          [NotNull] object choiceID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("CHOICE_DELETE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_CHOICEID", FbDbType.Integer)).Value = choiceID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void choice_update(
            [NotNull] object choiceID, 
            [NotNull] object choice, 
            [NotNull] object path, 
            [NotNull] object mime)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("CHOICE_UPDATE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_CHOICEID", FbDbType.Integer)).Value = choiceID;
				cmd.Parameters.Add(new FbParameter("@I_CHOICE", FbDbType.VarChar)).Value = choice;
                cmd.Parameters.Add(new FbParameter("@I_OBJECTPATH", FbDbType.VarChar)).Value = path;
                cmd.Parameters.Add(new FbParameter("@I_MIMETYPE", FbDbType.VarChar)).Value = mime;
    
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void choice_add(
            [NotNull] object pollId, 
            [NotNull] object choice, 
            [NotNull] object path, 
            [NotNull] object mime)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("choice_add"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_POLLID", FbDbType.Integer)).Value = pollId;
				cmd.Parameters.Add(new FbParameter("@I_CHOICE", FbDbType.VarChar)).Value = choice;
				cmd.Parameters.Add(new FbParameter("@I_OBJECTPATH", FbDbType.VarChar)).Value = path;
                cmd.Parameters.Add(new FbParameter("@I_MIMETYPE", FbDbType.VarChar)).Value = mime;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd); 
			 }            
		}

		#endregion
	   
		#region yaf_Rank
        static public DataTable rank_list(
            object boardID, 
            object rankID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("rank_list"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankID ?? DBNull.Value;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void rank_save(
            object rankID, 
            object boardID, 
            object name, 
			object isStart, 
            object isLadder, 
            object minPosts, 
            object rankImage,
			object pmlimit, 
            object style, 
            object sortOrder,
			object description,
			object usrSigChars,
			object usrSigBBCodes,
			object usrSigHTMLTags,
			object usrAlbums,
			object usrAlbumImages)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("rank_save"))
			{
			    if (minPosts.ToString() == "") { minPosts = 0; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankID;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
				cmd.Parameters.Add(new FbParameter("@I_ISSTART", FbDbType.Boolean)).Value = isStart;
				cmd.Parameters.Add(new FbParameter("@I_ISLADDER", FbDbType.Boolean)).Value = isLadder;
				cmd.Parameters.Add(new FbParameter("@I_MINPOSTS", FbDbType.Integer)).Value = minPosts;
                cmd.Parameters.Add(new FbParameter("@I_RANKIMAGE", FbDbType.VarChar)).Value = rankImage ?? DBNull.Value;
				cmd.Parameters.Add(new FbParameter("@I_PMLIMIT", FbDbType.Integer)).Value = pmlimit;
				cmd.Parameters.Add(new FbParameter("@I_STYLE", FbDbType.VarChar)).Value = style;
				cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.Integer)).Value = sortOrder;
				cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGCHARS", FbDbType.Integer)).Value = usrSigChars;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGBBCODES", FbDbType.VarChar)).Value = usrSigBBCodes;
				cmd.Parameters.Add(new FbParameter("@I_USRSIGSHTMLTAGS", FbDbType.VarChar)).Value = usrSigHTMLTags;
				cmd.Parameters.Add(new FbParameter("@I_USRALBUMS", FbDbType.Integer)).Value = usrAlbums;
				cmd.Parameters.Add(new FbParameter("@I_USRALBUMIMAGES", FbDbType.Integer)).Value = usrAlbumImages;
		
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void rank_delete(
            [NotNull]object rankID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("rank_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_Smiley
        [NotNull]


        static public DataTable smiley_list( object boardID, object smileyID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_list"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_SMILEYID", FbDbType.Integer)).Value = smileyID;
			  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        
    /// <summary>
    /// The smiley_list.
    /// </summary>
    /// <param name="boardID">
    /// The board id.
    /// </param>
    /// <param name="smileyID">
    /// The smiley id.
    /// </param>
    /// <returns>
    /// </returns>
        public static IEnumerable<TypedSmileyList> SmileyList( int boardID, int? smileyID)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_list"))
      {
       // if (smileyID == null) { smileyID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_SMILEYID", FbDbType.Integer)).Value = smileyID;

        return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(r => new TypedSmileyList(r));
      }
    }
        static public DataTable smiley_listunique( object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_listunique"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void smiley_delete( object smileyID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_delete"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_SMILEYID", FbDbType.Integer)).Value = smileyID;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void smiley_save(
            
            object smileyID, 
            object boardID, 
            object code, 
            object icon, 
            object emoticon, 
            object sortOrder, 
            object replace)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_save"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_SMILEYID", FbDbType.Integer)).Value = smileyID ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_CODE", FbDbType.VarChar)).Value = code;
                cmd.Parameters.Add(new FbParameter("@I_ICON", FbDbType.VarChar)).Value = icon;
                cmd.Parameters.Add(new FbParameter("@I_EMOTICON", FbDbType.VarChar)).Value = emoticon;
                cmd.Parameters.Add(new FbParameter("@I_SORTORDER", FbDbType.SmallInt)).Value = sortOrder;
                cmd.Parameters.Add(new FbParameter("@I_REPLACE", FbDbType.SmallInt)).Value = replace ?? 0;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void smiley_resort(
            object boardID, 
            object smileyID, 
            int move)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("smiley_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_SMILEYID", FbDbType.Integer)).Value = smileyID;
                cmd.Parameters.Add(new FbParameter("@I_MOVE", FbDbType.Integer)).Value = move;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_BBCode
        static public DataTable bbcode_list(
            [NotNull] object boardID, 
            [NotNull] object bbcodeID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("bbcode_list"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_BBCODEID", FbDbType.Integer)).Value = bbcodeID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void bbcode_delete(
            [NotNull] object bbcodeID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("bbcode_delete"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BBCODEID", FbDbType.Integer)).Value = bbcodeID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void bbcode_save(
            [NotNull] object bbcodeID, 
            [NotNull] object boardID, 
            [NotNull] object name, 
            [NotNull] object description, 
            [NotNull] object onclickjs, 
            [NotNull] object displayjs, 
            [NotNull] object editjs, 
            [NotNull] object displaycss, 
            [NotNull] object searchregex, 
            [NotNull] object replaceregex, 
            [NotNull] object variables, 
            [NotNull] object usemodule, 
            [NotNull] object moduleclass, 
            [NotNull] object execorder)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("bbcode_save"))
			{
				//My input defaults
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				if (description == null) { description = DBNull.Value; }
				if (onclickjs == null) { onclickjs = DBNull.Value; }
				if (displayjs == null) { displayjs = DBNull.Value; }
				if (editjs == null) { editjs = DBNull.Value; }
				if (displaycss == null) { displaycss = DBNull.Value; }
				if (variables == null) { variables = DBNull.Value; }
				if (usemodule == null || usemodule.ToString().Contains("false")) { usemodule = 0; }
				if (usemodule.ToString().Contains("true")) { usemodule = 1; }
				if (moduleclass == null) { moduleclass = DBNull.Value; }
				if (execorder == null) { execorder = 1; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BBCODEID", FbDbType.Integer)).Value = bbcodeID;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_ONCLICKJS", FbDbType.VarChar)).Value = onclickjs;
                cmd.Parameters.Add(new FbParameter("@I_DISPLAYJS", FbDbType.Text)).Value = displayjs;
                cmd.Parameters.Add(new FbParameter("@I_EDITJS", FbDbType.Text)).Value = editjs;
                cmd.Parameters.Add(new FbParameter("@I_DISPLAYCSS", FbDbType.Text)).Value = displaycss;
                cmd.Parameters.Add(new FbParameter("@I_SEARCHREGEX", FbDbType.Text)).Value = searchregex;
                cmd.Parameters.Add(new FbParameter("@I_REPLACEREGEX", FbDbType.Text)).Value = replaceregex;
                cmd.Parameters.Add(new FbParameter("@I_VARIABLES", FbDbType.VarChar)).Value = variables;
                cmd.Parameters.Add(new FbParameter("@I_USEMODULE", FbDbType.Boolean)).Value = Convert.ToBoolean(usemodule);
                cmd.Parameters.Add(new FbParameter("@I_MODULECLASS", FbDbType.VarChar)).Value = moduleclass;
                cmd.Parameters.Add(new FbParameter("@I_EXECORDER", FbDbType.Integer)).Value = execorder;
				


				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_Registry
		/// <summary>
		/// Retrieves entries in the board settings registry
		/// </summary>
		/// <param name="Name">Use to specify return of specific entry only. Setting this to null returns all entries.</param>
		/// <returns>DataTable filled will registry entries</returns>
        static public DataTable registry_list(
            object name, 
            object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("registry_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID ?? DBNull.Value;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        /// <summary>
        /// Retrieves all the entries in the board settings registry
        /// </summary>
        /// <returns>DataTable filled will all registry entries</returns>
        static public DataTable registry_list()
        {
            return registry_list(null, null);
        }
		/// <summary>
		/// Retrieves entries in the board settings registry
		/// </summary>
		/// <param name="Name">Use to specify return of specific entry only. Setting this to null returns all entries.</param>
		/// <returns>DataTable filled will registry entries</returns>
        static public DataTable registry_list(
            [NotNull]object name)
		{
            return registry_list( name, null);
		}

		/// <summary>
		/// Saves a single registry entry pair to the database.
		/// </summary>
		/// <param name="Name">Unique name associated with this entry</param>
		/// <param name="Value">Value associated with this entry which can be null</param>
        static public void registry_save(
            [NotNull]object name,
            [NotNull]object value)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("registry_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_VALUE", FbDbType.VarChar)).Value = value;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = DBNull.Value;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Saves a single registry entry pair to the database.
		/// </summary>
		/// <param name="Name">Unique name associated with this entry</param>
		/// <param name="Value">Value associated with this entry which can be null</param>
		/// <param name="BoardID">The BoardID for this entry</param>
        static public void registry_save(
            [NotNull]object name,
            [NotNull]object value,
            [NotNull]object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("registry_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_VALUE", FbDbType.VarChar)).Value = value;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion

		#region yaf_System
		/// <summary>
		/// Not in use anymore. Only required for old database versions.
		/// </summary>
		/// <returns></returns>
        static public DataTable system_list()
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("system_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion
	   
		#region yaf_Topic

        public static void topic_updatetopic(
              int topicId, 
              string topic)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_updatetopic"))
      {
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
        cmd.Parameters.Add(new FbParameter("@I_TOPIC", FbDbType.VarChar)).Value = topic;
        MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
      }      
    }


        static public int topic_prune(object forumID, object days)
		{
			int boardID = 0;
			using (FbCommand cmd = MsSqlDbAccess.GetCommand(String.Format(@"SELECT c.BOARDID FROM {0} f INNER JOIN {1} c ON f.CATEGORYID=c.CATEGORYID  WHERE FORUMID={2};", MsSqlDbAccess.GetObjectName("Forum"), MsSqlDbAccess.GetObjectName("Category"), forumID), true))
			{
				boardID = Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			 
			}

			return topic_prune(boardID, forumID, days, 1);
				
		}

        static public int topic_prune(
            
            object boardId, 
            object forumId, 
            object days, 
            object permDelete)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new FbParameter("@I_DAYS", FbDbType.Integer)).Value = days;
                cmd.Parameters.Add(new FbParameter("@I_PERMDELETE", FbDbType.Boolean)).Value = permDelete;

				return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

        static public DataTable topic_list(
            
            object forumID, 
            [NotNull] object userId, 
            [NotNull] object sinceDate, 
            [NotNull] object toDate, 
            [NotNull] object pageIndex, 
            [NotNull] object pageSize, 
            [NotNull] object useStyledNicks, 
            [NotNull] object showMoved, 
            [CanBeNull]bool findLastRead)
		{    

		   using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_LIST"))
			{
				
				if (userId == null) { userId = DBNull.Value; }
                if (sinceDate == null) { sinceDate = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_DATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
				cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
				cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks; 
                cmd.Parameters.Add(new FbParameter("@I_SHOWMOVED", FbDbType.Boolean)).Value = showMoved;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTUNREAD", FbDbType.Boolean)).Value = findLastRead; 

				return MsSqlDbAccess.Current.GetData(cmd,true);
			} 
		}

        public static DataTable announcements_list( [NotNull] object forumID, [NotNull] object userId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [NotNull] object showMoved, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("announcements_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new FbParameter("@I_DATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_SHOWMOVED", FbDbType.Boolean)).Value = showMoved;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTUNREAD", FbDbType.Boolean)).Value = findLastRead; 
                return MsSqlDbAccess.Current.GetData(cmd, true);
            }
        }

		/// <summary>
		/// Lists topics very simply (for URL rewriting)
		/// </summary>
		/// <param name="startId"></param>
		/// <param name="limit"></param>
		/// <returns></returns>
        static public DataTable topic_simplelist(
            int startId, 
            int limit)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_simplelist"))
			{
				if (startId <= 0) { startId = 0; }
				if (limit <= 0) { limit = 500; }

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_STARTID", FbDbType.Integer)).Value = startId;
                cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = limit;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void topic_move(object topicId, object forumId, object showMoved)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new FbParameter("@I_SHOWMOVED", FbDbType.Boolean)).Value = showMoved;
			 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public DataTable topic_announcements(
            object boardId, 
            object numOfPostsToRetrieve,
            object pageUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_announcements"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_NUMPOSTS", FbDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
			
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
	/// <summary>
	/// The topic_latest.
	/// </summary>
	/// <param name="boardId">
	/// The board id.
	/// </param>
	/// <param name="numOfPostsToRetrieve">
	/// The num of posts to retrieve.
	/// </param>
	/// <param name="userId">
	/// The user id.
	/// </param>
	/// <param name="useStyledNicks">
	/// If true returns string for userID style.
	/// </param>
	/// <returns>
	/// </returns>
        static public DataTable topic_latest(
            object boardID, 
            object numOfPostsToRetrieve, 
            object pageUserId, 
            bool useStyledNicks, 
            bool showNoCountPosts, 
            object findLastRead )
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_LATEST"))
			{
				int style = 0;
				if (useStyledNicks) style = 1;
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_NUMPOSTS", FbDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = pageUserId;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = style;
                cmd.Parameters.Add(new FbParameter("@I_SHOWNOCOUNTPOSTS", FbDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Boolean)).Value = findLastRead;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        /// <summary>
    /// The rss_topic_latest.
    /// </summary>
    /// <param name="boardID">
    /// The board id.
    /// </param>
    /// <param name="numOfPostsToRetrieve">
    /// The num of posts to retrieve.
    /// </param>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="useStyledNicks">
    /// If true returns string for userID style.
    /// </param>
    /// <returns>
    /// </returns>
        public static DataTable rss_topic_latest(
        object boardID, 
        object numOfPostsToRetrieve, 
        object userID, 
        bool useStyledNicks, 
        bool showNoCountPosts)
    {
        using (FbCommand cmd = MsSqlDbAccess.GetCommand("rss_topic_latest"))
        {
           int style = 0;
				if (useStyledNicks) style = 1;
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_NUMPOSTS", FbDbType.Integer)).Value = numOfPostsToRetrieve;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = style;
                cmd.Parameters.Add(new FbParameter("@I_SHOWNOCOUNTPOSTS", FbDbType.Boolean)).Value = showNoCountPosts;            
            return MsSqlDbAccess.Current.GetData(cmd);
        }
    }
        public static DataTable topic_active(
           [NotNull] object boardId,
           [CanBeNull] object categoryId,
           [NotNull] object pageUserId,
           [NotNull] object sinceDate,
           [NotNull] object toDate,
           [NotNull] object pageIndex,
           [NotNull] object pageSize,
           [NotNull] object useStyledNicks,
           [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_active"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new FbParameter("@I_SINCEDATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Integer)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        static private void topic_deleteAttachments(object topicId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_listmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer));
				cmd.Parameters[0].Value = topicId;

			 

				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					foreach (DataRow row in dt.Rows)
					{
                        message_deleteRecursively( row["MessageID"], true, "", 0, true, false);
					}
				}
			}
		}

        static public void topic_delete(object topicId)
		{
			topic_delete(topicId, false);
		}
		static public void topic_delete(object topicId, object eraseTopic)
		{          
			topic_deleteAttachments(topicId);
		  
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_delete"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new FbParameter("@I_ERASETOPIC", FbDbType.Boolean)).Value = eraseTopic ?? 0;
                cmd.Parameters.Add(new FbParameter("@I_UPDATELASTPOST", FbDbType.Boolean)).Value = true;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public DataTable topic_findprev(object topicId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_FINDPREV"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public DataTable topic_findnext(object topicId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_FINDNEXT"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void topic_lock(object topicId, object locked)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_lock"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
				cmd.Parameters.Add(new FbParameter("@I_LOCKED", FbDbType.Boolean)).Value = locked;      
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public long topic_save(
            
            [NotNull] object forumId, 
            [NotNull] object subject,
            [NotNull] object status,
            [NotNull] object styles,
            [NotNull] object description, 
            [NotNull] object message, 
            [NotNull] object userID, 
            [NotNull] object priority, 
            [NotNull] object userName, 
            [NotNull] object ip, 
            [NotNull] object posted, 
            [NotNull] object blogPostID, 
            [NotNull] object flags,
            ref long messageId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumId;               
				cmd.Parameters.Add(new FbParameter("@I_SUBJECT", FbDbType.VarChar)).Value = subject;
                cmd.Parameters.Add(new FbParameter("@I_STATUS", FbDbType.VarChar)).Value = status;
                cmd.Parameters.Add(new FbParameter("@I_STYLES", FbDbType.VarChar)).Value = styles;
                cmd.Parameters.Add(new FbParameter("@I_DESCRIPTION", FbDbType.VarChar)).Value = description;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.Text)).Value = message;
				cmd.Parameters.Add(new FbParameter("@I_PRIORITY", FbDbType.SmallInt)).Value = Convert.ToInt16(priority);
				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
				cmd.Parameters.Add(new FbParameter("@I_IP", FbDbType.VarChar)).Value = ip.ToString();
				cmd.Parameters.Add(new FbParameter("@I_POSTED", FbDbType.TimeStamp)).Value = posted;
				cmd.Parameters.Add(new FbParameter("@I_BLOGPOSTID", FbDbType.VarChar)).Value = blogPostID;
				cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = flags;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;                

				DataTable dt = MsSqlDbAccess.Current.GetData(cmd);
				messageId = long.Parse(dt.Rows[0]["MessageID"].ToString());
				return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}
        static public DataRow topic_info(
            
            object topicId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_info"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId ?? DBNull.Value;
				cmd.Parameters.Add(new FbParameter("@I_SHOWDELETED", FbDbType.Boolean)).Value = false;
				
				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					if (dt.Rows.Count > 0)
						return dt.Rows[0];
					else
						return null;
				}
			}
		}
     /// <summary>
    /// Get the favorite count for a topic...
    /// </summary>
    /// <param name="topicId">
    /// The topic Id.
    /// </param>
        public static int TopicFavoriteCount(int topicId)
    {
      using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_favorite_count"))
      {
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;

        return MsSqlDbAccess.Current.GetData(cmd).GetFirstRowColumnAsValue("FavoriteCount", 0);
      }
    }

	    /// <summary>
	    /// The topic_unanswered
	    /// </summary>
	    /// <param name="connectionString">
	    /// The connection string.
	    ///  </param>
	    /// <param name="boardId">
	    /// The board id.
	    /// </param>
	    /// <param name="categoryId">
	    /// The category id.
	    /// </param>
	    /// <param name="pageUserId">
	    /// The page user id.
	    /// </param>
	    /// <param name="sinceDate">
	    /// The since Date.
	    /// </param>
	    /// <param name="toDate">
	    /// The to Date.
	    /// </param> 
	    /// <param name="pageIndex">
	    /// The page Index.
	    /// </param>
	    /// <param name="pageSize">
	    /// The page Size.
	    /// </param>
	    /// <param name="useStyledNicks">
	    /// Set to true to get color nicks for last user and topic starter.
	    /// </param>
	    /// <param name="findLastRead">
	    /// Indicates if the Table should Countain the last Access Date
	    /// </param>
	    /// <returns>
	    /// Returns the List with the Topics Unanswered
	    /// </returns>
	    public static DataTable topic_unanswered(
            [NotNull] object boardId, 
            [CanBeNull] object categoryId, 
            [NotNull] object pageUserId, 
            [NotNull] object sinceDate, 
            [NotNull] object toDate, 
            [NotNull] object pageIndex, 
            [NotNull] object pageSize, 
            [NotNull] object useStyledNicks, 
            [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_unanswered"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new FbParameter("@I_SINCEDATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Integer)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        public static DataTable topic_unread(
    [NotNull] object boardId,
    [CanBeNull] object categoryId,
    [NotNull] object pageUserId,
    [NotNull] object sinceDate,
    [NotNull] object toDate,
    [NotNull] object pageIndex,
    [NotNull] object pageSize,
    [NotNull] object useStyledNicks,
    [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_unread"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new FbParameter("@I_SINCEDATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Integer)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// Gets all topics where the pageUserid has posted
        /// </summary>
        /// <param name="boardID">
        /// The board id.
        /// </param>
        /// <param name="pageUserId">
        /// The page user id.
        /// </param>
        /// <param name="since">
        /// The since.
        /// </param>
        /// <param name="categoryID">
        /// The category id.
        /// </param>
        /// <param name="useStyledNicks">
        /// Set to true to get color nicks for last user and topic starter.
        /// </param>
        /// <param name="findLastRead">
        /// Indicates if the Table should Countain the last Access Date
        /// </param>
        /// <returns>
        /// Returns the List with the User Topics
        /// </returns>
        public static DataTable Topics_ByUser(
          
            [NotNull] object boardId,
            [CanBeNull] object categoryId,
            [NotNull] object pageUserId,
            [NotNull] object sinceDate,
            [NotNull] object toDate,
            [NotNull] object pageIndex,
            [NotNull] object pageSize,
            [NotNull] object useStyledNicks,
            [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topics_byuser"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
               cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new FbParameter("@I_SINCEDATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Integer)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }
        /// <summary>
        /// Delete a topic status.
        /// </summary>
        /// <param name="topicStatusID">The topic status ID.</param>
        public static void TopicStatus_Delete( [NotNull] object topicStatusID)
        {
            try
            {
                using (var cmd = MsSqlDbAccess.GetCommand("TopicStatus_Delete"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("i_TopicStatusID", FbDbType.Integer).Value = topicStatusID;
                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
                }
            }
            catch
            {
                // Ignore any errors in this method
            }
        }

        /// <summary>
        /// Get a Topic Status by topicStatusID
        /// </summary>
        /// <param name="topicStatusID">The topic status ID.</param>
        /// <returns></returns>
        public static DataTable TopicStatus_Edit( [NotNull] object topicStatusID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("TopicStatus_Edit"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_TopicStatusID", FbDbType.Integer).Value = topicStatusID;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// List all Topics of the Current Board
        /// </summary>
        /// <param name="boardID">The board ID.</param>
        /// <returns></returns>
        public static DataTable TopicStatus_List( [NotNull] object boardID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("TopicStatus_List"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_BoardID", FbDbType.Integer).Value = boardID;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// Saves a topic status
        /// </summary>
        /// <param name="topicStatusID">The topic status ID.</param>
        /// <param name="boardID">The board ID.</param>
        /// <param name="topicStatusName">Name of the topic status.</param>
        /// <param name="defaultDescription">The default description.</param>
        public static void TopicStatus_Save( [NotNull] object topicStatusID, [NotNull] object boardID, [NotNull] object topicStatusName, [NotNull] object defaultDescription)
        {
            try
            {
                using (var cmd = MsSqlDbAccess.GetCommand("TopicStatus_Save"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("i_TopicStatusID", FbDbType.Integer).Value = topicStatusID;
                    cmd.Parameters.Add("i_BoardID", FbDbType.Integer).Value = boardID;
                    cmd.Parameters.Add("i_TopicStatusName", FbDbType.VarChar).Value = topicStatusName;
                    cmd.Parameters.Add("i_DefaultDescription", FbDbType.VarChar).Value = defaultDescription;

                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
                }
            }
            catch
            {
                // Ignore any errors in this method
            }
        }
        public static int topic_findduplicate(
            
            object topicName)
        {
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("topic_findduplicate"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_TOPICNAME", FbDbType.VarChar)).Value = topicName;
                return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
            }
        }


        public static DataTable topic_favorite_details(
          
          [NotNull] object boardId,
          [CanBeNull] object categoryId,
          [NotNull] object pageUserId,
          [NotNull] object sinceDate,
          [NotNull] object toDate,
          [NotNull] object pageIndex,
          [NotNull] object pageSize,
          [NotNull] object useStyledNicks,
          [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("TOPIC_FAVORITE_DETAILS"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_CATEGORYID", FbDbType.Integer)).Value = categoryId ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_PAGEUSERID", FbDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new FbParameter("@I_SINCEDATE", FbDbType.TimeStamp)).Value = sinceDate;
                cmd.Parameters.Add(new FbParameter("@I_TODATE", FbDbType.TimeStamp)).Value = toDate;
                cmd.Parameters.Add(new FbParameter("@I_PAGEINDEX", FbDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new FbParameter("@I_PAGESIZE", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_FINDLASTREAD", FbDbType.Integer)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary>
		/// The topic_favorite_list.
		/// </summary>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <returns>
		/// </returns>
        public static DataTable topic_favorite_list( object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_FAVORITE_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// The topic_favorite_remove.
		/// </summary>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="topicID">
		/// The topic id.
		/// </param>
        public static void topic_favorite_remove(object userID, object topicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_FAVORITE_REMOVE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value =userID;
                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// The topic_favorite_add.
		/// </summary>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="topicID">
		/// The topic id.
		/// </param>
        public static void topic_favorite_add(
            object userID, 
            object topicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("TOPIC_FAVORITE_ADD"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value =userID;
                cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		#endregion
		
		#region yaf_ReplaceWords
		// rico : replace words / begin
		/// <summary>
		/// Gets a list of replace words
		/// </summary>
		/// <returns>DataTable with replace words</returns>
        static public DataTable replace_words_list(
            [NotNull]object boardId,
            [NotNull]object id)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("replace_words_list"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer)).Value = id ?? DBNull.Value;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Saves changs to a words
		/// </summary>
		/// <param name="id">ID of bad/good word</param>
		/// <param name="badword">bad word</param>
		/// <param name="goodword">good word</param>
        static public void replace_words_save(
            object boardId, 
            object id, 
            object badword, 
            object goodword)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("replace_words_save"))
			{
			
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer)).Value = id ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@i_BADWORD", FbDbType.VarChar)).Value = badword;
                cmd.Parameters.Add(new FbParameter("@i_GOODWORD", FbDbType.VarChar)).Value = goodword;
			 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Deletes a bad/good word
		/// </summary>
		/// <param name="ID">ID of bad/good word to delete</param>
        static public void replace_words_delete(
            object id)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("replace_words_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_ID", FbDbType.Integer)).Value = id;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion

		#region IgnoreUser

        static public void user_addignoreduser(object userId, object ignoredUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_ADDIGNOREDUSER"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new FbParameter("@I_IGNOREDUSERID", FbDbType.Integer)).Value = ignoredUserId;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public void user_removeignoreduser(object userId, object ignoredUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_REMOVEIGNOREDUSER"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value =  userId;
                cmd.Parameters.Add(new FbParameter("@I_IGNOREDUSERID", FbDbType.Integer)).Value = ignoredUserId;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public bool user_isuserignored(object userId, object ignoredUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_ISUSERIGNORED"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_IGNOREDUSERID", FbDbType.Integer)).Value = ignoredUserId;

				return Convert.ToBoolean(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}
		}
        static public DataTable user_ignoredlist(object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_IGNOREDLIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = userId;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion
	   
		#region yaf_User
			/// <summary>
	/// To return a rather rarely updated active user data
	/// </summary>
	/// <param name="userID">The UserID. It is always should have a positive > 0 value.</param>
	/// <param name="styledNicks">If styles should be returned.</param>
	/// <returns>A DataRow, it should never return a null value.</returns>
        public static DataRow user_lazydata(
        object userID, 
        object boardID,
        bool showPendingMails, 
        bool showPendingBuddies, 
        bool showUnreadPMs, 
        bool showUserAlbums, 
        bool styledNicks)
	{
	int nTries = 0;
	  while (true)
	  {
		try
		{
		using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_lazydata"))
		{
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
			cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;
			cmd.Parameters.Add("@I_SHOWPENDINGEMAILS", FbDbType.Boolean).Value = showPendingMails;
			cmd.Parameters.Add("@I_SHOWPENDINGBUDDIES", FbDbType.Boolean).Value = showPendingBuddies;
			cmd.Parameters.Add("@I_SHOWUNREADPMS", FbDbType.Boolean).Value = showUnreadPMs;
			cmd.Parameters.Add("@I_SHOWUSERALBUMS", FbDbType.Boolean).Value = showUserAlbums;
			cmd.Parameters.Add("@I_SHOWUSERSTYLE", FbDbType.Boolean).Value = styledNicks;           
			return MsSqlDbAccess.Current.GetData(cmd).Rows[0];
		}
		}
		catch (FbException x)
		{
			if (x.ErrorCode == 1205 && nTries < 3)
			{
				// Transaction (Process ID XXX) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.

			}
			else
			{
				throw new ApplicationException(string.Format("Sql Exception with error number {0} (Tries={1})", x.ErrorCode, nTries), x);
			}
		}

		++nTries;
	  }
	}
       
    [NotNull]
        public static IEnumerable<TypedUserList> UserList(
      int boardID, int? userID, bool? approved, int? groupID, int? rankID, bool? useStyledNicks)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("user_list"))
        {
            	
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_APPROVED", FbDbType.Boolean)).Value = approved;
                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankID ;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
							

            return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(x => new TypedUserList(x));
        }
    }
		/// <summary>
		/// The user_list.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="approved">
		/// The approved.
		/// </param>    
		/// <returns>
		/// </returns>
    public static DataTable user_list(object boardID, object userID, object approved)
		{
            return user_list(boardID, userID, approved, null, null, false);
		}

		/// <summary>
		/// The user_list.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="approved">
		/// The approved.
		/// </param>
		/// <param name="useStyledNicks">
		/// Return style info.
		/// </param> 
		/// <returns>
		/// </returns>
    public static DataTable user_list(object boardID, object userID, object approved, object useStyledNicks)
		{
			return user_list(boardID, userID, approved, null, null, useStyledNicks);
		}

		/// <summary>
		/// The user_list.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="approved">
		/// The approved.
		/// </param>
		/// <param name="groupID">
		/// The group id.
		/// </param>
		/// <param name="rankID">
		/// The rank id.
		/// </param>
		/// <returns>
		/// </returns>

    public static DataTable user_list(object boardID, object userID, object approved, object groupID, object rankID)
		{
			return user_list(boardID, userID, approved, null, null, false);
		}
		/// <summary>
		/// The user_list.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="approved">
		/// The approved.
		/// </param>
		/// <param name="groupID">
		/// The group id.
		/// </param>
		/// <param name="rankID">
		/// The rank id.
		/// </param>
		/// <param name="useStyledNicks">
		/// Return style info.
		/// </param> 
		/// <returns>
		/// </returns>

    public static DataTable user_list(object boardID, object userID, object approved, object groupID, object rankID, object useStyledNicks)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_list"))
			{
				if (userID == null) { userID = DBNull.Value; }
			   // if (approved == null) { approved = DBNull.Value; }               
			   // if (approved.ToString().ToLower().Contains("true")) { approved = 1; }
			   // else { approved = 0; }
				if (groupID == null) { groupID = DBNull.Value; }
				if (rankID == null) { rankID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_APPROVED", FbDbType.Boolean)).Value = approved;
				cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankID;
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
							 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    public static DataTable user_listmembers(
            
            [NotNull] object boardId, 
            [NotNull] object userId, 
            [NotNull] object approved, 
            [NotNull] object groupId, 
            [NotNull] object rankId, 
            [NotNull] object useStyledNicks, 
            [NotNull] object lastUserId, 
            [NotNull] object literals, 
            [NotNull] object exclude, 
            [NotNull] object beginsWith, 
            [NotNull] object pageIndex, 
            [NotNull] object pageSize, 
            [NotNull] object sortName, 
            [NotNull] object sortRank, 
            [NotNull] object sortJoined, 
            [NotNull] object sortPosts, 
            [NotNull] object sortLastVisit, 
            [NotNull] object numPosts, 
            [NotNull] object numPostCompare)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_listmembers"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("BoardID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("UserID", FbDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new FbParameter("Approved", FbDbType.Boolean)).Value = approved;
                cmd.Parameters.Add(new FbParameter("GroupID", FbDbType.Integer)).Value = groupId;
                cmd.Parameters.Add(new FbParameter("RankID", FbDbType.Integer)).Value = rankId;
                cmd.Parameters.Add(new FbParameter("StyledNicks", FbDbType.Boolean)).Value =  useStyledNicks;
                cmd.Parameters.Add(new FbParameter("Literals", FbDbType.VarChar)).Value = literals.ToString().Replace("\0","");
                cmd.Parameters.Add(new FbParameter("Exclude", FbDbType.Boolean)).Value = exclude;
                cmd.Parameters.Add(new FbParameter("BeginsWith", FbDbType.VarChar)).Value = beginsWith;
                cmd.Parameters.Add(new FbParameter("PageIndex", FbDbType.Integer)).Value =  pageIndex;
                cmd.Parameters.Add(new FbParameter("PageSize", FbDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new FbParameter("SortName", FbDbType.Integer)).Value = sortName;
                cmd.Parameters.Add(new FbParameter("SortRank", FbDbType.Integer)).Value = sortRank;
                cmd.Parameters.Add(new FbParameter("SortJoined", FbDbType.Integer)).Value = sortJoined;
                cmd.Parameters.Add(new FbParameter("SortPosts", FbDbType.Integer)).Value = sortPosts;
                cmd.Parameters.Add(new FbParameter("SortLastVisit", FbDbType.Integer)).Value =  sortLastVisit;
                cmd.Parameters.Add(new FbParameter("NumPosts", FbDbType.Integer)).Value = numPosts;
                cmd.Parameters.Add(new FbParameter("NumPostsCompare", FbDbType.Integer)).Value = numPostCompare;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

            /// <summary>
    /// Get the user list as a typed list.
    /// </summary>
    /// <param name="boardID">
    /// The board id.
    /// </param>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="approved">
    /// The approved.
    /// </param>
    /// <param name="groupID">
    /// The group id.
    /// </param>
    /// <param name="rankID">
    /// The rank id.
    /// </param>
    /// <param name="useStyledNicks">
    /// The use styled nicks.
    /// </param>
    /// <returns>
    /// </returns>


   
		/// <summary>
		/// For URL Rewriting
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
    static public DataTable user_simplelist(int StartID, int Limit)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_STARTID", FbDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = Limit;
			  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public void user_delete(object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_setrole(int boardID, object providerUserKey, object role)
		{
		   // System.Guid guid = new System.Guid(providerUserKey.ToString());

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_setrole"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_PROVIDERUSERKEY", FbDbType.VarChar)).Value = providerUserKey;
				cmd.Parameters.Add(new FbParameter("@I_ROLE", FbDbType.VarChar)).Value = role;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_setinfo(int boardID, System.Web.Security.MembershipUser user)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("update {databaseOwner}.objQual_USER set Name=@I_USERNAME,Email=@I_EMAIL where BoardID=@I_BOARDID and ProviderUserKey=@I_PROVIDERUSERKEY", true))
			{
				cmd.CommandType = CommandType.Text;

				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = user.UserName;
				cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = user.Email;
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_PROVIDERUSERKEY", FbDbType.VarChar)).Value = user.ProviderUserKey;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_migrate(
            object userID, 
            object providerUserKey, 
            object updateProvider)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_migrate"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new FbParameter("@I_PROVIDERUSERKEY", FbDbType.VarChar)).Value = providerUserKey ?? DBNull.Value;
                cmd.Parameters.Add(new FbParameter("@I_UPDATEPROVIDER", FbDbType.Boolean)).Value = updateProvider ?? DBNull.Value;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_deleteold(
            [NotNull]object boardId,
            [NotNull]object days)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_deleteold"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_DAYS", FbDbType.Integer)).Value = days;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 
		 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_approve(object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_approveall(
            object boardId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_approveall"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_suspend(object userID, object suspend)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_suspend"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
			    cmd.Parameters.Add(new FbParameter("@I_SUSPEND", FbDbType.TimeStamp)).Value = suspend ?? DBNull.Value;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Returns data about allowed signature tags and character limits
		/// </summary>
		/// <param name="userId">The userID</param>
		/// <param name="boardId">The boardID</param>
		/// <returns>Data Table</returns>
    public static DataTable user_getsignaturedata(
            [NotNull]object userId,
            [NotNull]object boardId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_getsignaturedata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Returns data about albums: allowed number of images and albums
		/// </summary>
		/// <param name="userID">The userID</param>
		/// <param name="boardID">The boardID</param>  
    public static DataTable user_getalbumsdata(
            [NotNull]object userID,
            [NotNull]object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_getalbumsdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public bool user_changepassword(
            object userId, 
            object oldPassword, 
            object newPassword)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_changepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new FbParameter("@I_OLDPASSWORD", FbDbType.VarChar)).Value = oldPassword;
                cmd.Parameters.Add(new FbParameter("@I_NEWPASSWORD", FbDbType.VarChar)).Value = newPassword;

				return (bool)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

    static public DataTable user_pmcount(
            object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_pmcount"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public void user_save(
            [NotNull] object userID, 
            [NotNull] object boardID, 
            [NotNull] object userName, 
            [NotNull] object displayName, 
            [NotNull] object email, 
            [NotNull] object timeZone, 
            [NotNull] object languageFile, 
            [NotNull] object culture, 
            [NotNull] object themeFile, 
            [NotNull] object useSingleSignOn, 
            [NotNull] object textEditor, 
            [NotNull] object useMobileTheme, 
            [NotNull] object approved, 
            [NotNull] object pmNotification, 
            [NotNull] object autoWatchTopics, 
            [NotNull] object dSTUser, 
            [NotNull] object hideUser, 
            [NotNull] object notificationType)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_save"))
			{
				
                if (useMobileTheme == null || useMobileTheme.ToString() == "false") { useMobileTheme = 0; }
				if (useMobileTheme.ToString() == "true") { useMobileTheme = 1; }
				if (approved == null || approved.ToString() == "false") { approved = 0; }
				if (approved.ToString() == "true") { approved = 1; }
				if (pmNotification == null) { pmNotification = 1; }
				if (pmNotification.ToString() == "false") { pmNotification = 0; }
				if (pmNotification.ToString() == "true") { pmNotification = 1; }
				if (autoWatchTopics == null || autoWatchTopics.ToString() == "false") { autoWatchTopics = 0; }
				if (autoWatchTopics.ToString() == "true") { autoWatchTopics = 1; }
				if (dSTUser == null || dSTUser.ToString() == "false") { dSTUser = 0; }
				if (dSTUser.ToString() == "true") { dSTUser = 1; }
				if (hideUser == null || hideUser.ToString() == "false") { hideUser = 0; }
				if (hideUser.ToString() == "true") { hideUser = 1; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
				cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;
                cmd.Parameters.Add("@I_USERNAME", FbDbType.VarChar).Value = userName ?? DBNull.Value;
                cmd.Parameters.Add("@I_DISPLAYNAME", FbDbType.VarChar).Value = displayName ?? DBNull.Value;
                cmd.Parameters.Add("@I_EMAIL", FbDbType.VarChar).Value = email ?? DBNull.Value;
				cmd.Parameters.Add("@I_TIMEZONE", FbDbType.Integer).Value = timeZone;
                cmd.Parameters.Add("@I_LANGUAGEFILE", FbDbType.VarChar).Value = languageFile ??  DBNull.Value;
                cmd.Parameters.Add("@I_CULTURE", FbDbType.VarChar).Value = culture ?? DBNull.Value;
				cmd.Parameters.Add("@I_THEMEFILE", FbDbType.VarChar).Value = themeFile ?? DBNull.Value;
                cmd.Parameters.Add("@I_USESINGLESIGNON", FbDbType.Boolean).Value = useSingleSignOn;
                cmd.Parameters.Add("@I_TEXTEDITOR", FbDbType.VarChar).Value = textEditor;
				cmd.Parameters.Add("@I_OVERRIDEDEFAULTTHEME", FbDbType.Boolean).Value = useMobileTheme;
				cmd.Parameters.Add("@I_APPROVED", FbDbType.Boolean).Value = approved;
				cmd.Parameters.Add("@I_PMNOTIFICATION", FbDbType.Boolean).Value = pmNotification;
                cmd.Parameters.Add("@I_NOTIFICATIONTYPE", FbDbType.Integer).Value = notificationType;
                cmd.Parameters.Add("@I_AUTOWATCHTOPIC", FbDbType.Boolean).Value = autoWatchTopics;
				cmd.Parameters.Add("@I_PROVIDERUSERKEY", FbDbType.VarChar).Value  = DBNull.Value;
				cmd.Parameters.Add("@I_DSTUSER", FbDbType.Boolean).Value = dSTUser;
				cmd.Parameters.Add("@I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow;
				cmd.Parameters.Add("@I_HIDEUSER", FbDbType.Boolean).Value = hideUser;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);

				//object o = MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

        /// <summary>
        /// Saves the notification type for a user
        /// </summary>
        /// <param name="userID">
        /// The user id.
        /// </param>
        /// <param name="notificationType">
        /// The notification type.
        /// </param>
    public static void user_savenotification(
              object userID,
              object pmNotification,
              object autoWatchTopics,
              object notificationType,
              object dailyDigest)
        {
            using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_savenotification"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
                cmd.Parameters.Add("@I_PMNOTIFICATION", FbDbType.Boolean).Value = pmNotification;
                cmd.Parameters.Add("@I_NOTIFICATIONTYPE", FbDbType.Integer).Value = notificationType;
                cmd.Parameters.Add("@I_AUTOWATCHTOPIC", FbDbType.Boolean).Value = autoWatchTopics;
                cmd.Parameters.Add("@I_DAILYDIGEST", FbDbType.Boolean).Value = dailyDigest;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }

    static public void user_adminsave
			(object boardId, 
            object userId, 
            object name, 
            object displayName, 
            object email, 
            object flags, 
            object rankId)
		{

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_adminsave"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_DISPLAYNAME", FbDbType.VarChar)).Value = displayName;
				cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = email;
				cmd.Parameters.Add(new FbParameter("@I_FLAGS", FbDbType.Integer)).Value = flags;
				cmd.Parameters.Add(new FbParameter("@I_RANKID", FbDbType.Integer)).Value = rankId;
			 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public DataTable user_emails(
            object boardId, 
            object groupId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_emails"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer)).Value = groupId ?? DBNull.Value;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public DataTable user_accessmasks(
            object boardID,
            object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_accessmasks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;

				return userforumaccess_sort_list(MsSqlDbAccess.Current.GetData(cmd), 0, 0, 0);
			}
		}

		//adds some convenience while editing group's access rights (indent forums)
    static private DataTable userforumaccess_sort_list(DataTable listSource, int parentID, int categoryID, int startingIndent)
		{

			DataTable listDestination = new DataTable();

			listDestination.Columns.Add("ForumID", typeof(String));
			listDestination.Columns.Add("ForumName", typeof(String));
			//it is uset in two different procedures with different tables, 
			//so, we must add correct columns
			if (listSource.Columns.IndexOf("AccessMaskName") >= 0)
				listDestination.Columns.Add("AccessMaskName", typeof(String));
			else
			{
				listDestination.Columns.Add("BoardName", typeof(String));
				listDestination.Columns.Add("CategoryName", typeof(String));
				listDestination.Columns.Add("AccessMaskId", typeof(Int32));
			}
			DataView dv = listSource.DefaultView;
            userforumaccess_sort_list_recursive( dv.ToTable(), listDestination, parentID, categoryID, startingIndent);
			return listDestination;
		}

    static private void userforumaccess_sort_list_recursive(DataTable listSource, DataTable listDestination, int parentID, int categoryID, int currentIndent)
		{
			DataRow newRow;

			foreach (DataRow row in listSource.Rows)
			{
				// see if this is a root-forum
				if (row["ParentID"] == DBNull.Value)
					row["ParentID"] = 0;

				if ((int)row["ParentID"] == parentID)
				{
					string sIndent = "";

					for (int j = 0; j < currentIndent; j++)
						sIndent += "--";

					// import the row into the destination
					newRow = listDestination.NewRow();

					newRow["ForumID"] = row["ForumID"];
					newRow["ForumName"] = string.Format("{0} {1}", sIndent, row["ForumName"]);
					if (listDestination.Columns.IndexOf("AccessMaskName") >= 0)
						newRow["AccessMaskName"] = row["AccessMaskName"];
					else
					{
						newRow["BoardName"] = row["BoardName"];
						newRow["CategoryName"] = row["CategoryName"];
						newRow["AccessMaskId"] = row["AccessMaskId"];
					}


					listDestination.Rows.Add(newRow);

					// recurse through the list...
					userforumaccess_sort_list_recursive(listSource, listDestination, (int)row["ForumID"], categoryID, currentIndent + 1);
				}
			}
		}
    public static DataTable recent_users(
            [NotNull] object boardID, 
            int timeSinceLastLogin, 
            [NotNull] object styledNicks)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("recent_users"))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_TIMESINCELASTLOGIN", FbDbType.TimeStamp)).Value = timeSinceLastLogin;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = styledNicks;
                cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }
    static public object user_recoverpassword(
            object boardID, 
            object userName, 
            object email)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_recoverpassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
                cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = email;
				
				return MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

    static public void user_savepassword(object userID, object password)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_savepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_PASSWORD", FbDbType.VarChar)).Value = 
                    FormsAuthentication.HashPasswordForStoringInConfigFile(password.ToString(), "md5");
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public object user_login(object boardID, object name, object password)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_login"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new FbParameter("@I_NAME", FbDbType.VarChar)).Value = name;
                cmd.Parameters.Add(new FbParameter("@I_PASSWORD", FbDbType.VarChar)).Value = password;

				return MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

    static public DataTable user_avatarimage(
            object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_avatarimage"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public int user_get(
            int boardId, 
            object providerUserKey)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_get"))
			{
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_PROVIDERUSERKEY", FbDbType.VarChar)).Value = providerUserKey;
							   
				return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);               
			}
		}

    public static IEnumerable<TypedUserFind> UserFind(int boardID, bool filter, string userName, string email, string displayName, object notificationType, object dailyDigest)
    {
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_find"))
			{
				// if (userName == null) { userName = DBNull.Value; }
				// if (email == null) { email = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardID;
				cmd.Parameters.Add("@I_FILTER", FbDbType.Boolean).Value = filter;
				cmd.Parameters.Add("@I_USERNAME", FbDbType.VarChar).Value = userName;
				cmd.Parameters.Add("@I_DISPLAYNAME", FbDbType.VarChar).Value = displayName;
				cmd.Parameters.Add("@I_EMAIL", FbDbType.VarChar).Value = email;				
				cmd.Parameters.Add("@I_NOTIFICATIONTYPE", FbDbType.Integer).Value = notificationType;
                cmd.Parameters.Add("@I_DAILYDIGEST", FbDbType.Boolean).Value = dailyDigest;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(u => new TypedUserFind(u)); ;
			}
		}


    static public string user_getsignature(object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_getsignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userId;
			   
				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
			}
		}

    static public void user_savesignature(object userID, object signature)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_savesignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
				cmd.Parameters.Add("@I_SIGNATURE", FbDbType.Text).Value = signature;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_saveavatar(object userID, object avatar, System.IO.Stream stream, object avatarImageType)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_saveavatar"))
			{
				byte[] data = null;

				if (stream != null)
				{
					if (avatar == null) { avatar = DBNull.Value; }

					data = new byte[stream.Length];
					stream.Seek(0, System.IO.SeekOrigin.Begin);
					stream.Read(data, 0, (int)stream.Length);
				}
				if (avatar == null) { avatar = DBNull.Value; }
				//if (data == null) { data = new byte[](); }
				if (avatarImageType == null) { avatarImageType = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userID;
				cmd.Parameters.Add("@I_AVATAR", FbDbType.VarChar).Value = avatar;            
				cmd.Parameters.Add("@I_AVATARIMAGE", FbDbType.Binary).Value = data;          
				cmd.Parameters.Add("@I_AVATARIMAGETYPE", FbDbType.VarChar).Value = avatarImageType;
			
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_deleteavatar(
            [NotNull]object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_deleteavatar"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add("@I_USERID", FbDbType.Integer).Value = userId;                
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public int user_aspnet(
            
            int boardId, 
            string userName, 
            string displayName, 
            string email, 
            object providerUserKey, 
            object isApproved)
		{
			try
			{
				using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_aspnet"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add("@I_BOARDID", FbDbType.Integer).Value = boardId;
					cmd.Parameters.Add("@I_USERNAME", FbDbType.VarChar).Value = userName;
					cmd.Parameters.Add("@I_DISPLAYNAME", FbDbType.VarChar).Value = displayName;
					cmd.Parameters.Add("@I_EMAIL", FbDbType.VarChar).Value = email;
					cmd.Parameters.Add("@I_PROVIDERUSERKEY", FbDbType.VarChar).Value = providerUserKey;
					cmd.Parameters.Add("@I_ISAPPROVED", FbDbType.Boolean).Value = isApproved;
					cmd.Parameters.Add("@I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow;                
														
					return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
				}
			}
			catch (Exception x)
			{
                LegacyDb.eventlog_create(null, "user_aspnet in YAF.Classes.Data.DB.cs", x, EventLogTypes.Error);
				return 0;
			}
		}

    static public int? user_guest(
            [NotNull]object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_guest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				
				 return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToType<int?>();
			}
		}

    public static bool user_ThankedMessage(
            [NotNull] object messageId, 
            [NotNull] object userId)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_thankedmessage"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_MESSAGEID", FbDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;

                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                var thankCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

                return thankCount > 0;
            }
        }

    static public DataTable user_activity_rank(
            [NotNull]object boardId, 
            object startDate, 
            object displayNumber)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_activity_rank"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_STARTDATE", FbDbType.TimeStamp)).Value = startDate;
				cmd.Parameters.Add(new FbParameter("@I_DISPLAYNUMBER", FbDbType.Integer)).Value = displayNumber;
		   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

    static public int user_nntp(object boardID, object userName, object email, object timeZone)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_NNTP"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar)).Value = userName;
				cmd.Parameters.Add(new FbParameter("@I_EMAIL", FbDbType.VarChar)).Value = email;
				cmd.Parameters.Add(new FbParameter("@I_TIMEZONE", FbDbType.Integer)).Value = timeZone;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

			  object o=MsSqlDbAccess.Current.ExecuteScalar(cmd);
			  //  if ( o != DBNull.Value)
			  //  {
					return Convert.ToInt32(o);
			  //  }
			  //  else
			   //     return -1;
				
			}
		}

    static public void user_addpoints(
            object userId, 
            object points)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_addpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_POINTS", FbDbType.Integer)).Value = points;
	   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_removepointsByTopicID(object topicId, object points)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_removepointsbytopicid"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicId;
				cmd.Parameters.Add(new FbParameter("@I_POINTS", FbDbType.Integer)).Value = points;
		 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public void user_removepoints(object userId, object points)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_removepoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_POINTS", FbDbType.Integer)).Value = points;                
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
    public static void user_setnotdirty(int boardId, int userId)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_setnotdirty"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }
    static public void user_setpoints(object userId, object points)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_setpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new FbParameter("@I_POINTS", FbDbType.Integer)).Value = points;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    static public int user_getpoints(
            object userId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_getpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userId;
						
				return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

    static public int user_getthanks_from(
            object userID, 
            object pageUserId)
		{

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("USER_GETTHANKS_FROM"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add( "@I_USERID", FbDbType.Integer ).Value=userID;
                cmd.Parameters.Add( "@I_PAGEUSERID", FbDbType.Integer ).Value=pageUserId;
				return Convert.ToInt32( MsSqlDbAccess.Current.ExecuteScalar( cmd ) );
			}
		}

    static public int[] user_getthanks_to(
            object userID, 
            object pageUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_getthanks_to"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				FbParameter paramThanksToNumber = new FbParameter("@ThanksToNumber", 0);
				paramThanksToNumber.Direction = ParameterDirection.Output;
				FbParameter paramThanksToPostsNumber = new FbParameter("@ThanksToPostsNumber", 0);
				paramThanksToPostsNumber.Direction = ParameterDirection.Output;
				cmd.Parameters.Add("@I_USERID", FbDbType.Integer ).Value=userID;
                cmd.Parameters.Add("@I_PAGEUSERID", FbDbType.Integer ).Value=pageUserId;
				cmd.Parameters.Add(paramThanksToNumber);
				cmd.Parameters.Add(paramThanksToPostsNumber);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);

				int ThanksToPostsNumber, ThanksToNumber;
				if (paramThanksToNumber.Value == DBNull.Value)
				{
					ThanksToNumber = 0;
					ThanksToPostsNumber = 0;
				}
				else
				{
					ThanksToPostsNumber = Convert.ToInt32(paramThanksToPostsNumber.Value);
					ThanksToNumber = Convert.ToInt32(paramThanksToNumber.Value);
				}
				return new int[] { ThanksToNumber, ThanksToPostsNumber };
			}
		}

		/// <summary>
		/// Returns the posts which is thanked by the user + the posts which are posted by the user and 
		/// are thanked by other users.
		/// </summary>
		/// <param name="UserID">
		/// The user id.
		/// </param>
		/// <returns>
		/// </returns>
    public static DataTable user_viewallthanks(object UserID, object pageUserId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("user_viewallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("I_USERID", FbDbType.Integer).Value = UserID;
                cmd.Parameters.Add("I_PAGEUSERID", FbDbType.Integer).Value = pageUserId;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    /// <summary>
    /// Update the single Sign on Status
    /// </summary>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="isFacebookUser">
    /// The is Facebook User
    /// </param>
    /// <param name="isTwitterUser">
    /// The is Twitter User.
    /// </param>
    public static void user_update_single_sign_on_status( [NotNull] object userID, [NotNull] object isFacebookUser, [NotNull] object isTwitterUser)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("USER_UPDATE_SSN_STATUS"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("I_USERID", FbDbType.Integer).Value = userID;
            cmd.Parameters.Add("I_ISFACEBOOKUSER", FbDbType.Boolean).Value = isFacebookUser;
            cmd.Parameters.Add("I_ISTWITTERUSER", FbDbType.Boolean).Value = isTwitterUser;
            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        
        }
    }

		#endregion
		
		#region yaf_UserForum
    static public DataTable userforum_list(object userID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("userforum_list"))
			{
				if (userID == null) { userID = DBNull.Value; }
				if (forumID == null) { forumID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[1].Value = forumID;

				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public void userforum_delete(object userID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("userforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
    static public void userforum_save(object userID, object forumID, object accessMaskID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("userforum_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_ACCESSMASKID", FbDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;   
		
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	  
		#region yaf_UserGroup
    static public DataTable usergroup_list(object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("usergroup_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public void usergroup_save(object userID, object groupID, object member)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("usergroup_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;

				cmd.Parameters.Add(new FbParameter("@I_GROUPID", FbDbType.Integer));
				cmd.Parameters[1].Value = groupID;

				cmd.Parameters.Add(new FbParameter("@I_MEMBER", FbDbType.Boolean));
				cmd.Parameters[2].Value = Convert.ToBoolean(member);

			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion

		#region yaf_WatchForum
    static public void watchforum_add(object userID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchforum_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 
  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
    static public DataTable watchforum_list(object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchforum_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;


			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public DataTable watchforum_check(object userID, object forumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchforum_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer));
				cmd.Parameters[1].Value = forumID;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public void watchforum_delete(object watchForumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_WATCHFORUMID", FbDbType.Integer));
				cmd.Parameters[0].Value = watchForumID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);

			}
		}
		#endregion

		#region yaf_WatchTopic
    static public DataTable watchtopic_list(object userID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public DataTable watchtopic_check(object userID, object topicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer));
				cmd.Parameters[0].Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer));
				cmd.Parameters[1].Value = topicID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
    static public void watchtopic_delete(object watchTopicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_WATCHTOPICID", FbDbType.Integer));
				cmd.Parameters[0].Value = watchTopicID;

			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
    static public void watchtopic_add(object userID, object topicID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;                
				cmd.Parameters.Add(new FbParameter("@I_TOPICID", FbDbType.Integer)).Value = topicID;              
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow; 

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

    /// <summary>
    /// Add Or Update Read Tracking for the Current User and Topic
    /// </summary>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="topicID">
    /// The topic id.
    /// </param>
    public static void Readtopic_AddOrUpdate([NotNull] object userID, [NotNull] object topicID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readtopic_addorupdate"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;
            cmd.Parameters.Add(new FbParameter("i_topicid", FbDbType.Integer)).Value = topicID;
            cmd.Parameters.Add(new FbParameter("I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        }
    }

    /// <summary>
    /// Delete the Read Tracking
    /// </summary>
    /// <param name="trackingID">
    /// The tracking id.
    /// </param>
    /*public static void Readtopic_delete([NotNull] [NotNull] object userID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readtopic_delete"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;
            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        }
    } */

    /// <summary>
    /// Get the Global Last Read DateTime User
    /// </summary>
    /// <param name="userID">
    /// The user ID.
    /// </param>
    /// <param name="lastVisitDate">
    /// The last Visit Date of the User
    /// </param>
    /// <returns>
    /// Returns the Global Last Read DateTime
    /// </returns>
    public static DateTime? User_LastRead([NotNull] object userID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("user_lastread"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;

            var tableLastRead = MsSqlDbAccess.Current.ExecuteScalar(cmd);

            return tableLastRead.ToType<DateTime?>();
        }
    }

    /// <summary>
    /// Get the Last Read DateTime for the Current Topic and User
    /// </summary>
    /// <param name="userID">
    /// The user ID.
    /// </param>
    /// <param name="topicID">
    /// The topic ID.
    /// </param>
    /// <returns>
    /// Returns the Last Read DateTime
    /// </returns>
    public static DateTime? Readtopic_lastread([NotNull] object userID, [NotNull] object topicID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readtopic_lastread"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;
            cmd.Parameters.Add(new FbParameter("i_topicid", FbDbType.Integer)).Value = topicID;

            var tableLastRead = MsSqlDbAccess.Current.ExecuteScalar(cmd);

            return tableLastRead.ToType<DateTime?>();
        }
    }

    /// <summary>
    /// Add Or Update Read Tracking for the forum and Topic
    /// </summary>
    /// <param name="userID">
    /// The user id.
    /// </param>
    /// <param name="forumID">
    /// The forum id.
    /// </param>
    public static void ReadForum_AddOrUpdate([NotNull] object userID, [NotNull] object forumID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readforum_addorupdate"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;
            cmd.Parameters.Add(new FbParameter("i_forumid", FbDbType.Integer)).Value = forumID;
            cmd.Parameters.Add(new FbParameter("I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        }
    }

    /// <summary>
    /// Delete the Read Tracking
    /// </summary>
    /// <param name="trackingID">
    /// The tracking id.
    /// </param>
    public static void ReadForum_delete([NotNull] object trackingID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readforum_delete"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_trackingid", FbDbType.Integer)).Value = trackingID;
            MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
        }
    }

    /// <summary>
    /// Get the Last Read DateTime for the Forum and User
    /// </summary>
    /// <param name="userID">
    /// The user ID.
    /// </param>
    /// <param name="forumID">
    /// The forum ID.
    /// </param>
    /// <returns>
    /// Returns the Last Read DateTime
    /// </returns>
    public static DateTime ReadForum_lastread([NotNull] object userID, [NotNull] object forumID)
    {
        using (var cmd = MsSqlDbAccess.GetCommand("readforum_lastread"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new FbParameter("i_userid", FbDbType.Integer)).Value = userID;
            cmd.Parameters.Add(new FbParameter("i_forumid", FbDbType.Integer)).Value = forumID;

            var tableLastRead = MsSqlDbAccess.Current.ExecuteScalar(cmd);

            return tableLastRead != null && tableLastRead != DBNull.Value
                       ? (DateTime)tableLastRead
                       : DateTime.MinValue.AddYears(1902);
        }
    }
	   
		#endregion
   
		#region vzrus addons

    public static string btnGetStatsName
		{
			get
			{
				return "Recalculate YAF Table Index Statistics";
			}
		}
    public static bool btnReindexVisible
		{
			get
			{
				return true;
			}
		}
    public static string btnReindexName
		{
			get
			{
				return "Recreate YAF Tables indice";
			}
		}
		//DB Maintenance page buttons name

    public static string btnShrinkName
		{
			get
			{
				return "Shrink Database";
			}
		}
    public static string btnRecoveryModeName
		{
			get
			{
				return "Set Recovery Mode";
			}
		}
	   
		//DB Maintenance page panels visibility
    public static bool PanelGetStats
		{
			get
			{
				return true;
			}
		}
    public static bool PanelRecoveryMode
		{
			get
			{
				return true;
			}
		}
    public static bool PanelReindex
		{
			get
			{
				return true;
			}
		}
    public static bool PanelShrink
		{
			get
			{
				return true;
			}
		}
	
		#endregion

		#region reindex page controls

    static public DataTable rsstopic_list(int forumID)
		{
            return rsstopic_list( forumID, 0, 100);
		}

    static public DataTable rsstopic_list(int forumID, int start, int limit)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("rsstopic_list"))
			{
			  
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_FORUMID", FbDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new FbParameter("@I_START", FbDbType.Integer)).Value = start;
				cmd.Parameters.Add(new FbParameter("@I_LIMIT", FbDbType.Integer)).Value = limit;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static DataTable db_index_simplelist()
		{
			
			using (FbCommand cmd = MsSqlDbAccess.GetCommand(String.Format("SELECT a.RDB$INDEX_NAME FROM RDB$INDICES a WHERE a.RDB$FOREIGN_KEY IS NULL AND a.RDB$SYSTEM_FLAG=0 AND a.RDB$UNIQUE_FLAG IS NULL AND a.RDB$RELATION_NAME LIKE '%{0}%'", MsSqlDbAccess.ObjectQualifier.ToUpper()),true))
			{                            
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        private static string getStatsMessage;
        /// <summary>
        /// The db_getstats_new.
        /// </summary>
        public static string db_getstats_new()
        {
            try
            {
                using (var connMan = new MsSqlDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(getStats_InfoMessage);

                    DataTable indexList = LegacyDb.db_index_simplelist();
                    foreach (DataRow indexName in indexList.Rows)
                    {
                        using (FbCommand cmd1 = new FbCommand(String.Format("SET STATISTICS INDEX {0}", indexName[0])))
                        {
                            cmd1.CommandType = CommandType.Text;
                            // up the command timeout...
                            cmd1.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
                            // run it...
                            MsSqlDbAccess.Current.ExecuteNonQuery(cmd1, false);

                        }
                    }

                    return getStatsMessage;
                }


            }
            finally
            {
                getStatsMessage = string.Empty;
            }
        }

        /// <summary>
        /// The reindexDb_InfoMessage.
        /// </summary>
        /// <param name="sender">
        /// The sender.
        /// </param>
        /// <param name="e">
        /// The e.
        /// </param>
        private static void getStats_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            getStatsMessage += "\r\n{0}".FormatWith(e.Message);
        }
        static public void db_getstats(MsSqlDbConnectionManager conn)
		{
			DataTable indexList = LegacyDb.db_index_simplelist();            
			foreach (DataRow indexName in indexList.Rows)
			{
				using (FbCommand cmd1 = new FbCommand(String.Format("SET STATISTICS INDEX {0}", indexName[0])))
				{
					cmd1.CommandType = CommandType.Text;
					// up the command timeout...
					cmd1.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
					// run it...
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd1, false);
				}
			}
		}
        static public string db_getstats_warning()
		{
			return "Recalculate index statistics is made or in progress.";
		}
        private static string reindexDbMessage;
        static public string db_reindex_new()
		{
            DataTable indexList = LegacyDb.db_index_simplelist();
            foreach (DataRow indexName in indexList.Rows)
            {

                // using (FbCommand cmd = new FbCommand(String.Format("EXECUTE BLOCK AS BEGIN EXECUTE STATEMENT 'ALTER INDEX {0} INACTIVE'; EXECUTE STATEMENT 'ALTER INDEX {0} ACTIVE';END", indexName[0])))
                try
                {
                    using (var connMan = new  MsSqlDbConnectionManager())
                    {
                        connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(reindexDb_InfoMessage);
                        using (
                            FbCommand cmd =
                                new FbCommand(
                                    String.Format(
                                        "EXECUTE BLOCK AS BEGIN EXECUTE STATEMENT 'ALTER INDEX {0} INACTIVE'; END",
                                        indexName[0])))
                        {
                            cmd.CommandType = CommandType.Text;
                            // up the command timeout...
                            cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                            // run it...
                            MsSqlDbAccess.Current.ExecuteNonQuery(cmd, false);
                        }
                    }
                }
                finally
                {
                    
                }
            }
            string reindexDbMessageRet = reindexDbMessage;
            reindexDbMessage = string.Empty;
            return reindexDbMessageRet;
		}
        /// <summary>
        /// The reindexDb_InfoMessage.
        /// </summary>
        /// <param name="sender">
        /// The sender.
        /// </param>
        /// <param name="e">
        /// The e.
        /// </param>
        private static void reindexDb_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            reindexDbMessage += "\r\n{0}".FormatWith(e.Message);
        }
        static public string db_reindex_warning()
		{
			return "Indexes recreating.";
		}
        private static string messageRunSql;
    /// <summary>
    /// The db_runsql.
    /// </summary>
    /// <param name="sql">
    /// The sql.
    /// </param>
    /// <param name="connMan">
    /// The conn man.
    /// </param>
    /// <returns>
    /// The db_runsql.
    /// </returns>
        public static string db_runsql_new( string sql, bool useTransaction)
		{
			var results = new System.Text.StringBuilder();

            try
            {
                using (var connMan = new MsSqlDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(fb_runSql_InfoMessage);

                    using (var cmd = new FbCommand(sql, connMan.OpenDBConnection))
                    {
                        cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                        FbDataReader reader = null;

                        using (
                            FbTransaction trans = connMan.OpenDBConnection.BeginTransaction(MsSqlDbAccess.IsolationLevel))
                        {
                            try
                            {
                                cmd.Connection = connMan.DBConnection;
                                cmd.Transaction = trans;
                                reader = cmd.ExecuteReader();

                                if (reader.HasRows)
                                {
                                    int rowIndex = 1;

                                    results.Append("RowNumber");
                                    int gg = 0;
                                    var columnNames = new string[reader.GetSchemaTable().Rows.Count];
                                    foreach (DataRow drd in reader.GetSchemaTable().Rows)
                                    {
                                        columnNames[gg] = drd["ColumnName"].ToString();
                                        results.Append(",");
                                        results.Append(drd["ColumnName"].ToString());
                                        gg++;

                                    }

                                    results.AppendLine();

                                    while (reader.Read())
                                    {
                                        results.AppendFormat(@"""{0}""", rowIndex++);

                                        // dump all columns...
                                        foreach (var col in columnNames)
                                        {
                                            results.AppendFormat(@",""{0}""",
                                                                 reader[col].ToString().Replace("\"", "\"\""));
                                        }

                                        results.AppendLine();
                                    }
                                }
                                else if (reader.RecordsAffected > 0)
                                {
                                    results.AppendFormat("{0} Record(s) Affected", reader.RecordsAffected);
                                    results.AppendLine();
                                }
                                else
                                {
                                    if (messageRunSql.IsSet())
                                    {
                                        results.AppendLine(messageRunSql);
                                        results.AppendLine();
                                    }
                                    results.AppendLine("No Results Returned.");
                                }

                                reader.Close();
                                trans.Commit();
                            }
                            catch (Exception x)
                            {
                                if (reader != null)
                                {
                                    reader.Close();
                                }

                                // rollback...
                                trans.Rollback();
                                results.AppendLine();
                                results.AppendFormat("SQL ERROR: {0}", x);
                            }

                            return results.ToString();
                        }
                    }


                }
            }
            finally
            {
                messageRunSql = string.Empty;
            }

		}
        /// <summary>
        /// The runSql_InfoMessage.
        /// </summary>
        /// <param name="sender">
        /// The sender.
        /// </param>
        /// <param name="e">
        /// The e.
        /// </param>
        private static void fb_runSql_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            messageRunSql = "\r\n" + e.Message;
        }
        public static bool forumpage_initdb(
        [NotNull] out string errorStr, 
        bool debugging)
		{
			errorStr = null;
			try
			{
			   
				using (var connMan = new MsSqlDbConnectionManager())
				{                    // just attempt to open the connection to test if a DB is available.           
					FbConnection getConn = connMan.OpenDBConnection;
				}
				return true;
			}

			catch (FbException ex)
			{
				// unable to connect to the DB...
				if (debugging)
				{
					errorStr = "Unable to connect to the Database. Exception Message: " +
						ex.Message +
						" (" + ex.ErrorCode.ToString()
						+ ")";
					
				}
				else
				{
					// re-throw since we are debugging... 

					throw;
				}

				return false;
			}

		}
        public static string forumpage_validateversion(int appVersion)
		{
            string redirect = string.Empty;
			try
			{
                DataTable registry = LegacyDb.registry_list("Version");

				if ((registry.Rows.Count == 0) || (Convert.ToInt32(registry.Rows[0]["VALUE"]) < appVersion))
				{
					// needs upgrading...
					redirect = "install/default.aspx?upgrade=" + Convert.ToInt32(registry.Rows[0]["Value"]);
				}
			}
			catch (FbException)
			{
				// needs to be setup...
				redirect = "install/";
			}
			return redirect;
		}

		// MS SQL Support fulltext....
		private static bool _fullTextSupported = false;

        public static bool FullTextSupported
		{
			get
			{
				return _fullTextSupported;
			}
			set
			{
				_fullTextSupported = value;
			}
		}

		private static string _fullTextScript = "firebird/fulltext.sql";

        public static string FullTextScript
		{
			get
			{
				return _fullTextScript;
			}
			set
			{
				_fullTextScript = value;
			}
		}
	 private static readonly string [] _scriptRecreateList = { 
													   "firebird/preinstall.sql",                                                      
													   "firebird/procedures_drop.sql",
													   "firebird/functions_drop.sql",
													   "firebird/fkeys_drop.sql",                                                       
													   "firebird/triggers_drop.sql",
													   "firebird/indexes_drop.sql",
													   "firebird/ukeys_drop.sql",                                                                                                  
													   "firebird/pkeys_drop.sql",                                                                                                         
													   "firebird/views_drop.sql",
													   "firebird/providers/procedures_drop.sql", 
													   "firebird/providers/indexes_drop.sql",
													   "firebird/providers/pkeys_drop.sql", 
                                                       "firebird/exceptions_drop.sql", 
													   "firebird/domains.sql",
													   "firebird/tables.sql",
													   "firebird/pkeys.sql",                                                        
													   "firebird/indexes.sql",
													   "firebird/ukeys.sql",
													   "firebird/sequences.sql",                                                        
													   "firebird/fkeys.sql",
													   "firebird/triggers.sql",
													   "firebird/views.sql",                                              
													   "firebird/exceptions.sql",                                               
													   "firebird/functions.sql",                                                                                                                                        
													   "firebird/providers/tables.sql",
													   "firebird/providers/pkeys.sql",
													   "firebird/providers/indexes.sql",                                                       
													   "firebird/providers/procedures.sql",                                                                                                           
													   "firebird/procedures.sql",
													   "firebird/procedures1.sql", 
													   "firebird/procedures2.sql", 
													   "firebird/postinstall.sql"
													   };      
 
		private static readonly string [] _scriptList = {                                                                                                          
													   "firebird/procedures_drop.sql",
													   "firebird/providers/procedures_drop.sql",
													   "firebird/functions_drop.sql", 
													   "firebird/test_drop.sql",                                                                                                                                                                                                              
													   "firebird/views_drop.sql",
													   "firebird/exceptions_drop.sql",                                                     
													   "firebird/domains.sql",
													   "firebird/sequences.sql",
													   "firebird/tables.sql",
													   "firebird/pkeys.sql",                                                        
													   "firebird/indexes.sql",
													   "firebird/ukeys.sql",		                                                                                                    
													   "firebird/fkeys.sql",
													   "firebird/triggers.sql",
													   "firebird/views.sql",                                                  
													   "firebird/exceptions.sql",                                               
													   "firebird/functions.sql",                                                                                                                                        
													   "firebird/providers/tables.sql",
													   "firebird/providers/pkeys.sql",
													   "firebird/providers/indexes.sql",                                                       
													   "firebird/providers/procedures.sql",                                                                                                           
													   "firebird/procedures.sql",
													   "firebird/procedures1.sql",
                                                       "firebird/procedures2.sql"
													   };
        public static string[] ScriptList
		{
			get
			{
				return _scriptList;
			}
		}
        static private bool GetBooleanRegistryValue(string name)
 {
     using (DataTable dt = LegacyDb.registry_list(name))
	 {
		 foreach (DataRow dr in dt.Rows)
		 {
			 int i;
			 return int.TryParse(dr["Value"].ToString(), out i)
					 ? Convert.ToBoolean(i)
					 : Convert.ToBoolean(dr["Value"]);
		 }
	 }
	 return false;
 }
 public static void system_deleteinstallobjects()
		{
			string tSQL = "DROP FUNCTION" + MsSqlDbAccess.GetObjectName("system_initialize");
			using (FbCommand cmd = MsSqlDbAccess.GetCommand(tSQL, true))
			{
				cmd.CommandType = CommandType.Text;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
 public static void system_initialize_executescripts(
            string script, 
            string scriptFile, 
            bool useTransactions)
		{
			CreateDatabase();
			script = MsSqlDbAccess.GetCommandTextReplaced(script);
			// apply database owner
			if (!String.IsNullOrEmpty(MsSqlDbAccess.SchemaName))
			{ script = script.Replace("dbN", MsSqlDbAccess.DBName.ToUpper()); }
			else
			{ script = script.Replace("dbN", "YAFNET"); }
		  
			// apply grantee name
			if (!String.IsNullOrEmpty(MsSqlDbAccess.GranteeName))
			{ script = script.Replace("grantName", MsSqlDbAccess.GranteeName.ToUpper()); }
			else
			{ script = script.Replace("grantName", "PUBLIC");}
			// apply host name
			script = script.Replace("hostName", MsSqlDbAccess.HostName);
		  
		  
		   
			//Scripts separation regexp
				string[] statements = System.Text.RegularExpressions.Regex.Split(script, "(?:--GO)", System.Text.RegularExpressions.RegexOptions.IgnoreCase);
				// Here comes add SET ARITHABORT ON for MSSQL amd Linq class
			   // statements.Insert(0, "SET ARITHABORT ON");

			using (YAF.Classes.Data.MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
			{                          

				// use transactions...
				if (useTransactions)
				{
					using (FbTransaction trans = connMan.OpenDBConnection.BeginTransaction(YAF.Classes.Data.MsSqlDbAccess.IsolationLevel))
					{
						foreach (string sql0 in statements)
						{
							string sql = sql0.Trim();

							try
							{
								if (sql.ToLower().IndexOf("setuser") >= 0)
									continue;

								if (sql.Length > 0)
								{
									using (FbCommand cmd = new FbCommand())
									{
										cmd.Transaction = trans;
										cmd.Connection = connMan.DBConnection;
										cmd.CommandType = CommandType.Text;
										cmd.CommandText = sql.Trim();
										cmd.ExecuteNonQuery();
									}
								}
							}
							catch (Exception x)
							{
								trans.Rollback();
								throw new Exception(String.Format("FILE:\n{0}\n\nERROR:\n{2}\n\nSTATEMENT:\n{1}", scriptFile, sql, x.Message));
							}
						}
						trans.Commit();
					}
				}
				else
				{
					// don't use transactions
					foreach (string sql0 in statements)
					{
						string sql = sql0.Trim();

						try
						{
							if (sql.ToLower().IndexOf("setuser") >= 0)
								continue;

							if (sql.Length > 0)
							{
								using (FbCommand cmd = new FbCommand())
								{
									cmd.Connection = connMan.OpenDBConnection;
									cmd.CommandType = CommandType.Text;
									cmd.CommandText = sql.Trim();
									cmd.ExecuteNonQuery();
								}
							}
						}
						catch (Exception x)
						{
							throw new Exception(String.Format("FILE:\n{0}\n\nERROR:\n{2}\n\nSTATEMENT:\n{1}", scriptFile, sql, x.Message));
						}
					}
				}
			}


		}
 public static void system_initialize_fixaccess(bool bGrant)
		{
          // USED FOR UPGRADE FROM VERY OLD VERSIONS

		}
 public static void system_initialize(
            string forumName,
            string timeZone,
            string culture, 
            string languageFile, 
            string forumEmail, 
            string smtpServer, 
            string userName, 
            string userEmail, 
            object providerUserKey,
            object rolePrefix)
		{
			string gs =providerUserKey.ToString();

			using (FbCommand cmd = MsSqlDbAccess.GetCommand("SYSTEM_INITIALIZE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                // added so command won't timeout anymore...
                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
				cmd.Parameters.Add("@I_NAME", FbDbType.VarChar).Value = forumName;
				cmd.Parameters.Add("@I_TIMEZONE", FbDbType.Integer).Value = timeZone;
                cmd.Parameters.Add("@I_CULTURE", FbDbType.VarChar, 10).Value = culture;
				cmd.Parameters.Add("@I_LANGUAGEFILE", FbDbType.VarChar).Value = languageFile;
				cmd.Parameters.Add("@I_FORUMEMAIL", FbDbType.VarChar).Value = forumEmail;
				cmd.Parameters.Add("@I_SMTPSERVER", FbDbType.VarChar).Value = smtpServer;
				cmd.Parameters.Add("@I_USER", FbDbType.VarChar).Value = userName;          
				cmd.Parameters.Add("@I_USEREMAIL", FbDbType.VarChar).Value = userEmail;
				// vzrus:The input parameter should be implemented in the system initialize and board_create procedures, else there will be an error in create watch because the user email is missing
				if (gs.IsSet())
					cmd.Parameters.Add("@I_USERKEY", FbDbType.VarChar).Value = gs;
				else
					cmd.Parameters.Add("@I_USERKEY", FbDbType.VarChar).Value = DBNull.Value;
                cmd.Parameters.Add("@I_ROLEPREFIX", FbDbType.VarChar).Value = rolePrefix;  
				cmd.Parameters.Add("@I_UTCTIMESTAMP", FbDbType.TimeStamp).Value = DateTime.UtcNow; 
					  
				YAF.Classes.Data.MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			
			}           

		   
		}
 static public void system_updateversion(
            int version, 
            string name)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("SYSTEM_UPDATEVERSION"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_VERSION", FbDbType.Integer)).Value = version;
                cmd.Parameters.Add(new FbParameter("@I_VERSIONNAME", FbDbType.VarChar)).Value = name;

				YAF.Classes.Data.MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Returns info about all Groups and Rank styles. 
		/// Used in GroupRankStyles cache.
		/// Usage: LegendID = 1 - Select Groups, LegendID = 2 - select Ranks by Name 
		/// </summary>
 public static DataTable group_rank_style(object boardID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("group_rank_style"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardID;
			  
				return YAF.Classes.Data.MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion
		
		public static void CreateDatabase()
		{
		   CreateDatabase(true);
		}
		
		public static void CreateDatabase(bool embeded)
		{
			//FbConnectionStringBuilder csb = new FbConnectionStringBuilder();
		   // csb.ServerType = FbServerType.Embedded;
		   // csb.Database = @I_"C:\Documents and Settings\bob\My Documents\Projects\yaffirebird\YetAnotherForum.NET\App_Data\yafnet.fdb";
		   // csb.UserID = "SYSDBA";
		   // csb.Password = "myfirebird";

			//if (System.IO.File.Exists(csb.Database))
		   // {
				//System.IO.File.Delete(csb.Database);
							  
		  //  }
		   // FbConnection.CreateDatabase(csb.ToString());  
		}

		#region DLESKTECH_ShoutBox
		/// <summary>
		/// The shoutbox_getmessages.
		/// </summary>
		/// <param name="numberOfMessages">
		/// The number of messages.
		/// </param>
		/// <param name="useStyledNicks">
		/// Use style for user nicks in ShoutBox.
		/// </param>
		/// <returns>
		/// </returns>
        public static DataTable shoutbox_getmessages(
            int boardId, 
            int numberOfMessages, 
            object useStyledNicks)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("SHOUTBOX_GETMESSAGES"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_NUMBEROFMESSAGES", FbDbType.Integer)).Value = numberOfMessages;               
				cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        public static bool shoutbox_savemessage(
            int boardId, 
            string message, 
            string userName, 
            int userID, 
            object ip)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("SHOUTBOX_SAVEMESSAGE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.Integer)).Value = userName;
				cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_MESSAGE", FbDbType.Text)).Value = message;
				cmd.Parameters.Add(new FbParameter("@I_DATE", FbDbType.TimeStamp)).Value = DBNull.Value;
				cmd.Parameters.Add(new FbParameter("@I_IP", FbDbType.VarChar)).Value = ip;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;
                
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			   
				return true;
			}
		}

        public static Boolean shoutbox_clearmessages(
            int boardId)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("SHOUTBOX_CLEARMESSAGES"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;     
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return true;
			}
		}

		#endregion

		#region Touradg Mods
		//Shinking Operation
        static public string db_shrink_warning()
		{
			return null;
		}

        public static string db_shrink_new()
		{
			/* String ShrinkSql = "DBCC SHRINKDATABASE(N'" + DBName.DBConnection.Database + "')";
			FbConnection ShrinkConn = new FbConnection(YAF.Classes.Config.ConnectionString);
			SqlCommand ShrinkCmd = new SqlCommand(ShrinkSql, ShrinkConn);
			ShrinkConn.Open();
			ShrinkCmd.ExecuteNonQuery();
			ShrinkConn.Close();
			using (SqlCommand cmd = new SqlCommand(ShrinkSql.ToString(), DBName.OpenDBConnection))
			{
				cmd.Connection = DBName.DBConnection;
				cmd.CommandTimeout = 9999;
				cmd.ExecuteNonQuery();
			}*/
            return string.Empty;
		}
		//Set Recovery
        static public string db_recovery_mode_warning()
		{
            return string.Empty;
		}

        public static string db_recovery_mode_new( string dbRecoveryMode)
		{
			/* String RecoveryMode = "ALTER DATABASE " + DBName.DBConnection.Database + " SET RECOVERY " + dbRecoveryMode;
			 FbConnection RecoveryModeConn = new FbConnection(YAF.Classes.Config.ConnectionString);
			 SqlCommand RecoveryModeCmd = new SqlCommand(RecoveryMode, RecoveryModeConn);
			 RecoveryModeConn.Open();
			 RecoveryModeCmd.ExecuteNonQuery();
			 RecoveryModeConn.Close();
			 using (SqlCommand cmd = new SqlCommand(RecoveryMode.ToString(), DBName.OpenDBConnection))
			 {
				 cmd.Connection = DBName.DBConnection;
				 cmd.CommandTimeout = 9999;
				 cmd.ExecuteNonQuery();
			 }*/
            return string.Empty;
		}
		
		#endregion

		#region Buddy
		/// <summary>
		/// Adds a buddy request. (Should be approved later by "ToUserID")
		/// </summary>
		/// <param name="FromUserID">
		/// The from user id.
		/// </param>
		/// <param name="ToUserID">
		/// The to user id.
		/// </param>
		/// <returns>
		/// The name of the second user + Whether this request is approved or not.
		/// </returns>
        public static string[] buddy_addrequest(
            
            [NotNull] object FromUserID, 
            [NotNull] object ToUserID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("BUDDY_ADDREQUEST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			  
				cmd.Parameters.Add("@I_FROMUSERID", FbDbType.VarChar, 128).Value = FromUserID;
				cmd.Parameters.Add("@I_TOUSERID", FbDbType.VarChar, 128).Value = ToUserID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;        
				
				DataRow drow = MsSqlDbAccess.Current.GetData(cmd).Rows[0];
				return new string[] { drow["I_PARAMOUTPUT"].ToString(), drow["I_APPROVED"].ToString() };
			}
		}

		/// <summary>
		/// Approves a buddy request.
		/// </summary>
		/// <param name="FromUserID">
		/// The from user id.
		/// </param>
		/// <param name="ToUserID">
		/// The to user id.
		/// </param>
		/// <param name="Mutual">
		/// Should the requesting user (ToUserID) be added to FromUserID's buddy list too?
		/// </param>
		/// <returns>
		/// the name of the second user.
		/// </returns>
        public static string buddy_approveRequest(
            
            [NotNull] object FromUserID, 
            [NotNull] object ToUserID, 
            [NotNull] object Mutual)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("BUDDY_APPROVEREQUEST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;               
				cmd.Parameters.Add("@I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
				cmd.Parameters.Add("@I_TOUSERID", FbDbType.Integer).Value = ToUserID;
				cmd.Parameters.Add("@I_MUTUAL",FbDbType.Boolean).Value = Mutual;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;        

				var paramOutput = new FbParameter("@I_PARMOUTPUT", FbDbType.VarChar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				
				cmd.Parameters.Add(paramOutput);
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return paramOutput.Value.ToString();
			}
		}

		/// <summary>
		/// Denies a buddy request.
		/// </summary>
		/// <param name="FromUserID">
		/// The from user id.
		/// </param>
		/// <param name="ToUserID">
		/// The to user id.
		/// </param>
		/// <returns>
		/// the name of the second user.
		/// </returns>
        public static string buddy_denyRequest(object FromUserID, object ToUserID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("BUDDY_DENYREQUEST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new FbParameter("@I_PARAMOUTPUT", FbDbType.VarChar, 255);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add("@I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
                cmd.Parameters.Add("@I_TOUSERID", FbDbType.Integer).Value = ToUserID;
				cmd.Parameters.Add(paramOutput);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return paramOutput.Value.ToString();
			}
		}

		/// <summary>
		/// Removes the "ToUserID" from "FromUserID"'s buddy list.
		/// </summary>
		/// <param name="FromUserID">
		/// The from user id.
		/// </param>
		/// <param name="ToUserID">
		/// The to user id.
		/// </param>
		/// <returns>
		/// The name of the second user.
		/// </returns>
        public static string buddy_remove(object FromUserID, object ToUserID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("BUDDY_REMOVE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new FbParameter("@I_PARAMOUTPUT", FbDbType.VarChar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add("@I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
				cmd.Parameters.Add("@I_TOUSERID", FbDbType.Integer).Value = ToUserID;
				cmd.Parameters.Add(paramOutput);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return paramOutput.Value.ToString();
			}
		}
		/// <summary>
		/// Gets all the buddies of a certain user.
		/// </summary>
		/// <param name="FromUserID">
		/// The from user id.
		/// </param>
		/// <param name="JustApproved">
		/// Return only the approved users?
		/// </param>
		/// <returns>
		/// a Datatable containing the buddy list.
		/// </returns>
        public static DataTable buddy_list(object FromUserID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("BUDDY_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("@I_FROMUSERID", FbDbType.Integer).Value = FromUserID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion

        /// <summary>
        /// The activeaccess_reset.
        /// </summary>
        public static void activeaccess_reset()
        {
            using (var cmd = MsSqlDbAccess.GetCommand("activeaccess_reset"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }
        private static DataTable GetTableColumnsInfo( string tableName)
        {
            string sql = @"SELECT FIRST 1 * FROM {0}".FormatWith(MsSqlDbAccess.GetObjectName("UserProfile"));

           // using (var cmd = MsSqlDbAccess.GetCommand("DBINFO_TABLE_COLUMNS_INFO"))
            using (var cmd = MsSqlDbAccess.GetCommand(sql,true))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@I_TABLENAME", FbDbType.Integer)).Value = tableName;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

	    public static DataTable User_ListTodaysBirthdays( [NotNull] object boardID, [CanBeNull] object useStyledNicks)
        {
            // Profile columns cannot yet exist when we first are gettinng data.
            try
            {
                var sqlBuilder =
                    new StringBuilder(@"EXECUTE BLOCK (I_STYLEDNICKS BOOL = :II_STYLEDNICKS, I_UTCTIMESTAMP TIMESTAMP = :II_UTCTIMESTAMP) RETURNS (""Birthday"" TIMESTAMP, ""UserName"" VARCHAR(255), ""DisplayName"" VARCHAR(255),""Style"" VARCHAR(255) ");
                // objQual_DBINFO_TABLE_COLUMNS_INFO
                var dt = GetTableColumnsInfo( MsSqlDbAccess.GetObjectName("USERPROFILE"));
              /*  foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ActualTypeName"].ToString() == "blob")
                    {
                        string subType = dr["ActualTypeName"].ToString() == "text"
                                             ? "BLOB SUB_TYPE 1"
                                             : "BLOB SUB_TYPE 0";
                        sqlBuilder.AppendFormat("\"{0}\" {1},", dr["FieldName"], subType);
                    }
                    else
                    {
                        string subType = dr["ActualTypeName"].ToString();
                        if (dr["FieldCharacterLength"] != DBNull.Value)
                        {
                            subType = subType + "(" + dr["FieldCharacterLength"] + ")";
                        }

                        sqlBuilder.AppendFormat("\"{0}\" {1},", dr["FieldName"], subType);
                    }
                } */

                sqlBuilder = new StringBuilder();
                sqlBuilder.Append("SELECT up.Birthday, u.USERID as \"UserID\", u.Name as UserName,u.DisplayName,(case(?) when 1 then  COALESCE(( SELECT FIRST 1 f.Style FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserGroup"));
                sqlBuilder.Append(" e JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("GROUP"));
                sqlBuilder.Append(" f on f.GroupID=e.GroupID WHERE e.UserID=u.UserID AND CHAR_LENGTH(f.Style) > 2 ORDER BY f.SortOrder), r.Style) else '' end) AS Style ");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserProfile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("USER"));
                sqlBuilder.Append(" u ON u.USERID = up.USERID JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Rank"));
                sqlBuilder.Append(" r ON r.RankID = u.RankID where EXTRACT(MONTH FROM up.Birthday) = EXTRACT(MONTH FROM current_timestamp) AND EXTRACT(DAY FROM up.Birthday) = EXTRACT(DAY FROM current_timestamp)");
               
                using (var cmd = MsSqlDbAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add(new FbParameter("II_STYLEDNICKS", FbDbType.Boolean)).Value = useStyledNicks;
                   /* cmd.Parameters.Add(new FbParameter("II_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow.Date;
                    cmd.Parameters.Add(new FbParameter("II_UTCTIMESTAMP2", FbDbType.TimeStamp)).Value = DateTime.UtcNow.Date; */
                    return MsSqlDbAccess.Current.GetData(cmd);
                }
            }
            catch (Exception e)
            {
                LegacyDb.eventlog_create(null, e.Source, e.Message, EventLogTypes.Error);
            }

            return null;
        }

        /// <summary>
        /// The user_ list with todays birthdays.
        /// </summary>
        /// <param name="userIdsList">
        /// The Int array of userIds.
        /// </param>
        /// <param name="useStyledNicks">
        /// Return or not style info.
        /// </param>
        /// <returns>
        /// The user_ list profiles.
        /// </returns>
        public static DataTable User_ListProfilesByIdsList( [NotNull] int[] userIdsList, [CanBeNull] object useStyledNicks)
        {
            string stIds = userIdsList.Aggregate(string.Empty, (current, userId) => current + (',' + userId)).Trim(',');
            // Profile columns cannot yet exist when we first are gettinng data.
            try
            {
                var sqlBuilder =
                                   new StringBuilder("EXECUTE BLOCK (I_STYLEDNICKS BOOL = ?, I_UTCTIMESTAMP TIMESTAMP = ?) RETURNS (");
                // objQual_DBINFO_TABLE_COLUMNS_INFO
                var dt = GetTableColumnsInfo( MsSqlDbAccess.GetObjectName("USERPROFILE"));
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["ActualTypeName"].ToString() == "blob")
                    {
                        string subType = dr["ActualTypeName"].ToString() == "text"
                                             ? "BLOB SUB_TYPE 1"
                                             : "BLOB SUB_TYPE 0";
                        sqlBuilder.AppendFormat("\"{0}\" {1},", dr["FieldName"], subType);
                    }
                    else
                    {
                        string subType = dr["ActualTypeName"].ToString();
                        if (dr["FieldCharacterLength"] != DBNull.Value)
                        {
                            subType = subType + "(" + dr["FieldCharacterLength"] + ")";
                        }

                        sqlBuilder.AppendFormat("\"{0}\" {1},", dr["FieldName"], subType);
                    }
                }

                sqlBuilder = new StringBuilder(sqlBuilder.ToString().Trim(','));
                sqlBuilder.Append(") ");
                sqlBuilder.Append(" AS BEGIN SELECT up.*, u.Name as UserName,u.DisplayName,Style = case(?) when 1 then  COALESCE(( SELECT FIRST 1 f.Style FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserGroup"));
                sqlBuilder.Append(" e JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("GROUP"));
                sqlBuilder.Append(" f on f.GroupID=e.GroupID WHERE e.UserID=u.UserID AND LEN(f.Style) > 2 ORDER BY f.SortOrder), r.Style) else '' end ");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserProfile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("USER"));
                sqlBuilder.Append(" u ON u.USERID = up.USERID JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Rank"));
                sqlBuilder.AppendFormat(" r ON r.RankID = u.RankID where UserID IN ({0})  ", stIds);
                using (var cmd = MsSqlDbAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add("@I_STYLEDNICKS",FbDbType.Boolean).Value = useStyledNicks;
                    return MsSqlDbAccess.Current.GetData(cmd);
                }
            }
            catch (Exception e)
            {
                LegacyDb.eventlog_create(null, e.Source, e.Message, EventLogTypes.Error);
            }

            return null;
        }
        #region ProfileMirror

        /// <summary>
        /// The set property values.
        /// </summary>
        /// <param name="context">
        /// The context.
        /// </param>
        /// <param name="collection">
        /// The collection.
        /// </param>
        public static void SetPropertyValues( int boardId, string appname, int userId, SettingsPropertyValueCollection collection, bool dirtyOnly = true)
        {
            if (userId == 0 || collection.Count < 1)
            {
                return;
            }
            bool itemsToSave = true;
            if (dirtyOnly)
            {
                itemsToSave = collection.Cast<SettingsPropertyValue>().Any(pp => pp.IsDirty);
            }

            // First make sure we have at least one item to save

            if (!itemsToSave)
            {
                return;
            }

            // load the data for the configuration
            List<SettingsPropertyColumn> spc = LoadFromPropertyValueCollection(collection);

            if (spc != null && spc.Count > 0)
            {
                // start saving...
                LegacyDb.SetProfileProperties( boardId, appname, userId, collection, spc, dirtyOnly);
            }
        }
        /// <summary>
        /// The set profile properties.
        /// </summary>
        /// <param name="appName">
        /// The app name.
        /// </param>
        /// <param name="userID">
        /// The user id.
        /// </param>
        /// <param name="values">
        /// The values.
        /// </param>
        /// <param name="settingsColumnsList">
        /// The settings columns list.
        /// </param>
        public static void SetProfileProperties( [NotNull] int boardId, [NotNull] object appName, [NotNull] int userID, [NotNull] SettingsPropertyValueCollection values, [NotNull] List<SettingsPropertyColumn> settingsColumnsList, bool dirtyOnly)
        {
            string userName = string.Empty;
            var dtu = LegacyDb.UserList(boardId, userID, true, null, null, true);
            foreach (var typedUserList in dtu)
            {
                userName = typedUserList.Name;
                break;

            }
            if (userName.IsNotSet())
            {
                return;
            }
            using (var conn = new MsSqlDbConnectionManager().OpenDBConnection)
            {
                var cmd = new FbCommand();

                cmd.Connection = conn;
                bool profileExists = false;

            cmd.Parameters.AddWithValue("@UserID", userID);
            cmd.Parameters.AddWithValue("@ApplicationName", appName);
                string table = MsSqlDbAccess.GetObjectName("UserProfile");
                StringBuilder sqlCommand = new StringBuilder();
                /* StringBuilder sqlCommand = new StringBuilder("EXECUTE BLOCK AS BEGIN IF (EXISTS (SELECT 1 FROM ").Append(table);
                 sqlCommand.Append(" WHERE USERID = @UserID AND ApplicationName = @ApplicationName)) THEN "); 
               
                 cmd.Parameters.AddWithValue("@UserID", userID);
                 cmd.Parameters.AddWithValue("@ApplicationName", appName); */

                // Build up strings used in the query
                var columnStr = new StringBuilder();
                var valueStr = new StringBuilder();
                var setStr = new StringBuilder();
                int count = 0;

                foreach (SettingsPropertyColumn column in settingsColumnsList)
                {
                    // only write if it's dirty
                    if (!dirtyOnly || values[column.Settings.Name].IsDirty)
                    {
                        columnStr.Append(", ");
                        valueStr.Append(", ");
                        columnStr.Append(column.Settings.Name);
                        string valueParam = "@Value" + count;
                        valueStr.Append(valueParam);
                        cmd.Parameters.AddWithValue(valueParam, values[column.Settings.Name].PropertyValue);

                        if ((column.DataType != FbDbType.TimeStamp) || column.Settings.Name != "LastUpdatedDate" || column.Settings.Name != "LastActivity")
                        {
                            if (count > 0)
                            {
                                setStr.Append(",");
                            }

                            setStr.Append(column.Settings.Name);
                            setStr.Append("=");
                            setStr.Append(valueParam);
                        }

                        count++;
                    }
                }

                columnStr.Append(",LastUpdatedDate ");
                valueStr.Append(",@LastUpdatedDate");
                setStr.Append(",LastUpdatedDate=@LastUpdatedDate");
                cmd.Parameters.AddWithValue("@LastUpdatedDate", DateTime.UtcNow);

                // MembershipUser mu = System.Web.Security.Membership.GetUser(userID);

                columnStr.Append(",LastActivity ");
                valueStr.Append(",@LastActivity");
                setStr.Append(",LastActivity=@LastActivity");
                cmd.Parameters.AddWithValue("@LastActivity", DateTime.UtcNow);

                columnStr.Append(",ApplicationName ");
                valueStr.Append(",@ApplicationName");
                setStr.Append(",ApplicationName=@ApplicationName");
                // cmd.Parameters.AddWithValue("@ApplicationID", appId);

                columnStr.Append(",IsAnonymous ");
                valueStr.Append(",@IsAnonymous");
                setStr.Append(",IsAnonymous=@IsAnonymous");
                cmd.Parameters.AddWithValue("@IsAnonymous", 0);

                columnStr.Append(",UserName ");
                valueStr.Append(",@UserName");
                setStr.Append(",UserName=@UserName");
                cmd.Parameters.AddWithValue("@UserName", userName);
               /* if (profileExists)
                {
                    sqlCommand.Append("UPDATE ").Append(table).Append(" SET ").Append(setStr.ToString());
                    sqlCommand.Append(" WHERE UserId = ").Append(userID.ToString()).Append(";");
                }
                else
                {
                    sqlCommand.Append("INSERT INTO ").Append(table).Append(" (UserId").Append(columnStr.ToString());
                    sqlCommand.Append(") VALUES (").Append(userID.ToString()).Append("").Append(valueStr.ToString()).Append(
                      ");");
                } */

                sqlCommand.Append("UPDATE OR INSERT INTO ").Append(table).Append(" (USERID").Append(columnStr.ToString());
                sqlCommand.Append(") VALUES (@UserID").Append("").Append(valueStr.ToString()).Append(
                  ") MATCHING (USERID);");

                cmd.CommandText = sqlCommand.ToString();
                cmd.CommandType = CommandType.Text;

                cmd.ExecuteNonQuery();
            }
        }

        /// <summary>
        /// The get profile structure.
        /// </summary>
        /// <returns>
        /// </returns>
        public static DataTable GetProfileStructure()
        {
            string sql = @"SELECT FIRST 1 * FROM {0}".FormatWith(MsSqlDbAccess.GetObjectName("UserProfile"));

            using (var cmd = MsSqlDbAccess.GetCommand(sql, true))
            {
                cmd.CommandType = CommandType.Text;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// The add profile column.
        /// </summary>
        /// <param name="name">
        /// The name.
        /// </param>
        /// <param name="columnType">
        /// The column type.
        /// </param>
        /// <param name="size">
        /// The size.
        /// </param>
        public static void AddProfileColumn( [NotNull] string name, FbDbType columnType, int size)
        {
            // get column type...
            string type = columnType.ToString();

            if (size > 0)
            {
                type += "(" + size + ")";
            }

            string sql = "ALTER TABLE {0} ADD {1} {2} ".FormatWith(
              MsSqlDbAccess.GetObjectName("UserProfile"), name, type);

            using (var cmd = MsSqlDbAccess.GetCommand(sql, true))
            {
                cmd.CommandType = CommandType.Text;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }
        /// <summary>
        /// The get db type and size from string.
        /// </summary>
        /// <param name="providerData">
        /// The provider data.
        /// </param>
        /// <param name="dbType">
        /// The db type.
        /// </param>
        /// <param name="size">
        /// The size.
        /// </param>
        /// <returns>
        /// The get db type and size from string.
        /// </returns>
        /// <exception cref="ArgumentException">
        /// </exception>
        private static bool GetDbTypeAndSizeFromString(string providerData, out FbDbType dbType, out int size)
        {
            size = -1;
            dbType = FbDbType.VarChar;

            if (providerData.IsNotSet())
            {
                return false;
            }

            // split the data
            string[] chunk = providerData.Split(new[] { ';' });

            // first item is the column name...
            string columnName = chunk[0];
            // vzrus addon convert values from mssql types...
            if (chunk[1].IndexOf("varchar") >= 0)
            { chunk[1] = "VarChar"; }
            if (chunk[1].IndexOf("int") >= 0)
            { chunk[1] = "Integer"; }
            if (chunk[1].IndexOf("DateTime") >= 0)
            { chunk[1] = "TimeStamp"; }

            // get the datatype and ignore case...
            dbType = (FbDbType)Enum.Parse(typeof(FbDbType), chunk[1], true);

            if (chunk.Length > 2)
            {
                // handle size...
                if (!Int32.TryParse(chunk[2], out size))
                {
                    throw new ArgumentException("Unable to parse as integer: " + chunk[2]);
                }
            }

            return true;
        }

        public static List<SettingsPropertyColumn> LoadFromPropertyValueCollection( SettingsPropertyValueCollection collection)
        {
           List<SettingsPropertyColumn> settingsColumnsList = new List<SettingsPropertyColumn>();
                // clear it out just in case something is still in there...

                // validiate all the properties and populate the internal settings collection
                foreach (SettingsPropertyValue value in collection)
                {
                    FbDbType dbType;
                    int size;

                    // parse custom provider data...
                    GetDbTypeAndSizeFromString(value.Property.Attributes["CustomProviderData"].ToString(), out dbType, out size);

                    // default the size to 256 if no size is specified
                    if (dbType == FbDbType.VarChar && size == -1)
                    {
                        size = 256;
                    }
                    settingsColumnsList.Add(new SettingsPropertyColumn(value.Property, dbType, size));
                }

                // sync profile table structure with the FbDB...
                DataTable structure = LegacyDb.GetProfileStructure();

                // verify all the columns are there...
                foreach (SettingsPropertyColumn column in settingsColumnsList)
                {
                    // see if this column exists
                    if (!structure.Columns.Contains(column.Settings.Name))
                    {
                        // if not, create it...
                        LegacyDb.AddProfileColumn( column.Settings.Name, column.DataType, column.Size);
                    }
                }

                return settingsColumnsList;
        }

        #endregion
        public static DataTable admin_list( [NotNull] object boardId, [NotNull] object useStyledNicks)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("admin_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_BOARDID", FbDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new FbParameter("@I_STYLEDNICKS", FbDbType.Integer)).Value = useStyledNicks;
                cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		#region Album
		/// <summary>
		/// Inserts/Saves a user album.
		/// </summary>
		/// <param name="AlbumID">
		/// AlbumID of an existing Album.
		/// </param>
		/// <param name="UserID">
		/// UserID of the user who wants to create a new album.
		/// </param>
		/// <param name="Title">
		/// New Album title.
		/// </param>
		/// <param name="CoverImageID">
		/// New Cover image id.
		/// </param>
        public static int album_save(
            
            [NotNull] object albumId, 
            [NotNull] object userID, 
            [NotNull] object title, 
            [NotNull] object coverImageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_SAVE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new FbParameter("@I_ALBUMID", FbDbType.Integer)).Value = albumId;
                cmd.Parameters.Add(new FbParameter("@I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("@I_TITLE", FbDbType.VarChar)).Value = title;
				cmd.Parameters.Add(new FbParameter("@I_COVERIMAGEID", FbDbType.Integer)).Value = coverImageID;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;        

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}
		}

		/// <summary>
		/// Lists all the albums associated with the UserID or gets all the
		/// specifications for the specified album id.
		/// </summary>
		/// <param name="UserID">
		/// The user id.
		/// </param>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		/// <returns>
		/// a Datatable containing the albums.
		/// </returns>
		public static DataTable album_list(object UserID, object AlbumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("I_USERID", FbDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = AlbumID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		public static void album_delete(object AlbumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_DELETE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = AlbumID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		public static string album_gettitle(object AlbumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_GETTITLE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = AlbumID;

				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
			}
		}

		/// <summary>
		/// Get the number of albums + number of current uploaded files by the user if UserID is not null,
		/// Otherwise, it gets the number of images in the album with AlbumID.
		/// </summary>
		/// <param name="UserID">
		/// the User ID.
		/// </param>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		/// <returns></returns>
        public static int[] album_getstats([NotNull] object userID, [NotNull] object albumID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_GETSTATS"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new FbParameter("I_USERID", FbDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = albumID;

				DataRow dr = MsSqlDbAccess.Current.GetData(cmd).Rows[0];

				return new int[]
		  {
			Convert.ToInt32(dr["I_ALBUMNUMBER"]), Convert.ToInt32(dr["I_IMAGENUMBER"])
		  };
			}
		}

		/// <summary>
		/// Inserts/Saves a user image.
		/// </summary>
		/// <param name="ImageID">
		/// the image id of an existing image.
		/// </param>
		/// <param name="AlbumID">
		/// the album id for adding a new image.
		/// </param>
		/// <param name="Caption">
		/// the caption of the existing/new image.
		/// </param>
		/// <param name="FileName">
		/// the file name of the new image.
		/// </param>
		/// <param name="Bytes">
		/// the size of the new image.
		/// </param>
		/// <param name="ContentType">
		/// the content type.
		/// </param>
        public static void album_image_save(
            [NotNull] object imageID, 
            [NotNull] object albumID, 
            [NotNull] object caption, 
            [NotNull] object fileName, 
            [NotNull] object bytes, 
            [NotNull] object contentType)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_IMAGE_SAVE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("I_IMAGEID", FbDbType.Integer)).Value = imageID;
                cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = albumID;
				cmd.Parameters.Add(new FbParameter("I_CAPTION", FbDbType.VarChar)).Value = caption;
				cmd.Parameters.Add(new FbParameter("I_FILENAME", FbDbType.VarChar)).Value = fileName;
				cmd.Parameters.Add(new FbParameter("I_BYTES", FbDbType.Integer)).Value = bytes;
				cmd.Parameters.Add(new FbParameter("I_CONTENTTYPE", FbDbType.VarChar)).Value = contentType;
				cmd.Parameters.Add(new FbParameter("@I_UTCTIMESTAMP", FbDbType.TimeStamp)).Value = DateTime.UtcNow;        

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Lists all the images associated with the AlbumID or
		/// the image with the ImageID.
		/// </summary>
		/// <param name="AlbumID">
		/// the Album id.
		/// </param>
		/// <param name="ImageID">
		/// The image id.
		/// </param>
		/// <returns>
		/// a Datatable containing the image(s).
		/// </returns>
        public static DataTable album_image_list(
            [NotNull] object albumID, 
            [NotNull] object imageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_IMAGE_LIST"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("I_ALBUMID", FbDbType.Integer)).Value = albumID;
				cmd.Parameters.Add(new FbParameter("I_IMAGEID", FbDbType.Integer)).Value = imageID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Deletes the image which has the specified image id.
		/// </summary>
		/// <param name="ImageID">
		/// the image id.
		/// </param>
		public static void album_image_delete(object ImageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_IMAGE_DELETE"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("I_IMAGEID", FbDbType.Integer)).Value = ImageID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Increments the image's download times.
		/// </summary>
		/// <param name="ImageID">
		/// the image id.
		/// </param>
		public static void album_image_download(object ImageID)
		{
			using (FbCommand cmd = MsSqlDbAccess.GetCommand("ALBUM_IMAGE_DOWNLOAD"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new FbParameter("I_IMAGEID", FbDbType.Integer)).Value = ImageID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        /// <summary>
        /// Album images by users the specified user ID.
        /// </summary>
        /// <param name="userID">The user ID.</param>
        /// <returns>All Albbum Images of the User</returns>
        public static DataTable album_images_by_user([NotNull] object userID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("album_images_by_user"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("I_USERID", FbDbType.Integer).Value = userID;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }
		#endregion

    public static void unencode_all_topics_subjects(
     [NotNull]Func<string, string> decodeTopicFunc)
    {
      var topics = LegacyDb.topic_simplelist( 0, 99999999).SelectTypedList(r => new TypedTopicSimpleList(r)).ToList();
    
      foreach (var topic in topics.Where(t => t.TopicID.HasValue && t.Topic.IsSet()))
      {
          try
          {
              var decodedTopic = decodeTopicFunc(topic.Topic);

              if (!decodedTopic.Equals(topic.Topic))
              {
                  // unencode it and update.
                  topic_updatetopic( topic.TopicID.Value, decodedTopic);
              }
          }
          catch
          {
              // soft-fail...
          }
      }
    }

 /// <summary>
 /// Get the Thanks From Count for the user.
 /// </summary>
 /// <param name="userId">
 /// The user id.
 /// </param>
 /// <returns>
 /// Returns the Thank Count.
 /// </returns>
 public static int user_ThankFromCount([NotNull] object userId)
 {
     using (var cmd = MsSqlDbAccess.GetCommand("user_thankfromcount"))
     {
         cmd.CommandType = CommandType.StoredProcedure;

         cmd.Parameters.Add("i_UserID", FbDbType.Integer).Value = userId;

         cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

         var thankCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

         return thankCount;
     }
 }

 /// <summary>
 /// Checks if the User has replied tho the specifc topic.
 /// </summary>
 /// <param name="messageId">
 /// The message id.
 /// </param>
 /// <param name="userId">
 /// The user id.
 /// </param>
 /// <returns>
 /// Returns if true or not
 /// </returns>
 public static bool user_RepliedTopic([NotNull] object messageId, [NotNull] object userId)
 {
     using (var cmd = MsSqlDbAccess.GetCommand("user_repliedtopic"))
     {
         cmd.CommandType = CommandType.StoredProcedure;

         cmd.Parameters.Add("i_MessageID", FbDbType.Integer).Value = messageId;
         cmd.Parameters.Add("i_UserID", FbDbType.Integer).Value = userId;

         cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

         var messageCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

         return messageCount > 0;
     }
 }
}	
}
