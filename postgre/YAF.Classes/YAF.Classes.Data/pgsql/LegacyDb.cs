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
using Autofac;
using NpgsqlTypes;
using YAF.Types.Handlers;

namespace YAF.Classes.Data
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.IO;
    using System.Linq;
    using System.Text;
    using System.Web.Hosting;
    using System.Web.Security;

    using YAF.Types;
    using YAF.Types.Constants;
    using YAF.Types.Interfaces;
    using YAF.Types.Objects;
    using YAF.Utils;
    using YAF.Utils.Helpers;

	using Npgsql;
   


    /// <summary>
	/// All the Database functions for YAF
	/// </summary>
	public static partial class LegacyDb
    {

		//added vzrus
		#region ConnectionStringOptions

		public static string ProviderAssemblyName
		{
			get
			{
				return "Npgsql";
			}
		}

		public static bool PasswordPlaceholderVisible
		{
			get
			{
				return true;
			}
		}
	  
		//Parameter 1
		public static string Parameter1_Name
		{
			get
			{
				return "Server";
			}
		}
		public static string Parameter1_Value
		{
			get
			{
				return "localhost";
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
				return "Port";
			}
		}
		public static string Parameter2_Value
		{
			get
			{
				return "5432";
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
				return "Encoding";
			}
		}
        [Obsolete("UTF-8 is always used.")]
		public static string Parameter3_Value
		{
			get
			{
				return "UTF-8";
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
				return "Database";
			}
		}
		public static string Parameter4_Value
		{
			get
			{
				return "yafnet";
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
				return "CommandTimeout";
			}
		}
		public static string Parameter5_Value
		{
			get
			{
				return "120";
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
				return "";
			}
		}
		public static string Parameter6_Value
		{
			get
			{
				return "";
			}
		}

		public static bool Parameter6_Visible
		{
			get
			{
				return false;
			}
		}

		//Parameter 7
		public static string Parameter7_Name
		{
			get
			{
				return "";
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
				return false;
			}
		}
		//Parameter 8
		public static string Parameter8_Name
		{
			get
			{
				return "";
			}
		}

		public static string Parameter8_Value
		{
			get
			{
				return "";
			}
		}

		public static bool Parameter8_Visible
		{
			get
			{
				return false;
			}
		}
		//Parameter 9
		public static string Parameter9_Name
		{
			get
			{
				return "";
			}
		}

		public static string Parameter9_Value
		{
			get
			{
				return "";
			}
		}

		public static bool Parameter9_Visible
		{
			get
			{
				return false;
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
				return "PreloadReader";
			}
		}

		public static bool Parameter14_Value
		{
			get
			{
				return true;
			}
		}

		public static bool Parameter14_Visible
		{
			get
			{
				return true;
			}
		}

		//Parameter 15
		public static string Parameter15_Name
		{
			get
			{
				return "SyncNotification";
			}
		}

		public static bool Parameter15_Value
		{
			get
			{
				return true;
			}
		}

		public static bool Parameter15_Visible
		{
			get
			{
				return true;
			}
		}
		//Parameter 16
		public static string Parameter16_Name
		{
			get
			{
				return "UseExtendedTypes";
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
				return true;
			}
		}

		//Parameter 17
		public static string Parameter17_Name
		{
			get
			{
				return "SSL";
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
				return true;
			}
		}

		//Parameter 18
		public static string Parameter18_Name
		{
			get
			{
				return "IntegratedSecurity";
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
				return true;
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

        /// <summary>
        /// Gets the database size
        /// </summary>
        /// <returns>integer value for database size</returns>
        public static int GetDBSize()
        {
            using (
                NpgsqlCommand cmd =
                    new NpgsqlCommand(String.Format("select pg_database_size('{0}')/1024/1024;", MsSqlDbAccess.DBName)))
            {
                cmd.CommandType = CommandType.Text;
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
                using (DataTable dt = LegacyDb.registry_list("version"))
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

        public static bool FullTextSupported = false;

		public static string FullTextScript = "postgre/fulltext.sql";

		
		#region Forum
        /// <summary>
        /// Listes all forums accessible to a user
        /// </summary>
        /// <param name="boardId">BoardID</param>
        /// <param name="userId">ID of user</param>
        /// <returns>DataTable of all accessible forums</returns>
        static public DataTable forum_listall( object boardId, object userId)
        {
            return forum_listall( boardId, userId, 0);
        }

        static public DataTable forum_listall_sorted( object boardId, object userId)
        {
            return forum_listall_sorted(boardId, userId, null, false, 0);
        }

        static public DataTable forum_listall_sorted( object boardId, object userId, int[] forumidExclusions)
        {
            return forum_listall_sorted(boardId, userId, null, false, 0);
        }



        //Here
        static public DataTable forum_listall_sorted( object boardId, object userId, int[] forumidExclusions, bool emptyFirstRow, int startAt)
        {
            using (DataTable dataTable = forum_listall(boardId, userId, startAt))
            {
                int baseForumId = 0;
                int baseCategoryId = 0;

                if (startAt != 0)
                {
                    // find the base ids...
                    foreach (DataRow dataRow in dataTable.Rows)
                    {
                        if (Convert.ToInt32(dataRow["ForumID"]) == startAt)
                        {
                            baseForumId = Convert.ToInt32(dataRow["ParentID"]);
                            baseCategoryId = Convert.ToInt32(dataRow["CategoryID"]);
                            break;
                        }
                    }
                }

                return forum_sort_list(dataTable, baseForumId, baseCategoryId, 0, forumidExclusions, emptyFirstRow);
            }
        }

        public static void activeaccess_reset()
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("activeaccess_reset"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }
        static public DataRow pageload( 
            object sessionID, 
             object boardId,
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
			int nTries = 0;
			while ( true )
			{


				try
				{
            

					DataTable dt1 = null;
					using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "pageload" ) )
					{
						cmd.CommandType = CommandType.StoredProcedure;

						cmd.Parameters.Add(new NpgsqlParameter("i_sessionid", NpgsqlDbType.Varchar)).Value = sessionID;
						cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                        cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Varchar)).Value = userKey ?? DBNull.Value; 
						cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;
						cmd.Parameters.Add(new NpgsqlParameter("i_location", NpgsqlDbType.Varchar)).Value = location;
						cmd.Parameters.Add(new NpgsqlParameter("i_forumpage", NpgsqlDbType.Varchar)).Value = forumPage;
						cmd.Parameters.Add(new NpgsqlParameter("i_browser", NpgsqlDbType.Varchar)).Value = browser;
						cmd.Parameters.Add(new NpgsqlParameter("i_platform", NpgsqlDbType.Varchar)).Value = platform;
						cmd.Parameters.Add(new NpgsqlParameter("ii_categoryid", NpgsqlDbType.Integer)).Value = categoryID;
						cmd.Parameters.Add(new NpgsqlParameter("ii_forumid", NpgsqlDbType.Integer)).Value = forumID;
						cmd.Parameters.Add(new NpgsqlParameter("ii_topicid", NpgsqlDbType.Integer)).Value = topicID;
						cmd.Parameters.Add(new NpgsqlParameter("ii_messageid", NpgsqlDbType.Integer)).Value = messageID;
                        cmd.Parameters.Add(new NpgsqlParameter("i_iscrawler", NpgsqlDbType.Boolean)).Value = isCrawler;
                        cmd.Parameters.Add(new NpgsqlParameter("i_ismobiledevice", NpgsqlDbType.Boolean)).Value = isMobileDevice;
                        cmd.Parameters.Add(new NpgsqlParameter("i_donttrack", NpgsqlDbType.Boolean)).Value = donttrack;
 
						dt1 = MsSqlDbAccess.Current.GetData(cmd, false);
						return dt1.Rows[0];

					/*   if (dt1.Columns.Count == 0) throw new ArgumentOutOfRangeException();
						using (NpgsqlCommand cmd1 = MsSqlDbAccess.GetCommand("vaccess_combo"))
						{
							cmd1.CommandType = CommandType.StoredProcedure;
							cmd1.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = dt1.Rows[0]["UserID"];
							cmd1.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = dt1.Rows[0]["ForumID"];
							//We  trigger AcceptChanges() right now as we don't need to return more rows
							return MsSqlDbAccess.Current.AddValuesToDataTableFromReader(cmd1, dt1, false, true, dt1.Columns.Count).Rows[0];
						} */

						
					}
				}
				catch ( NpgsqlException x )
				{
					if ( x.ErrorCode == 1205 && nTries < 3 )
					{
						/// Transaction (Process ID XXX) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Rerun the transaction.
					}
					else
						throw new ApplicationException( string.Format( "Sql Exception with error number {0} (Tries={1})", x.Code, nTries ), x );
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
        static public DataTable GetSearchResult( string toSearchWhat, string toSearchFromWho, SearchWhatFlags searchFromWhoMethod, SearchWhatFlags searchWhatMethod, int forumIDToStartAt, int userId, int boardId, int maxResults, bool useFullText, bool searchDisplayName)
		{
           // New access
          /*  if (toSearchWhat == "*")
            {
                toSearchWhat = string.Empty;
            }

            IEnumerable<int> forumIds = new List<int>();

            if (forumIDToStartAt != 0)
            {
                forumIds = ForumListAll(boardId, userID, forumIDToStartAt).Select(f => f.ForumID ?? 0).Distinct();
            }

            string searchSql = new SearchBuilder().BuildSearchSql(toSearchWhat, toSearchFromWho, searchFromWhoMethod, searchWhatMethod, userID, searchDisplayName, boardId, maxResults, useFullText, forumIds);

            using (SqlCommand cmd = MsSqlDbAccess.GetCommand(searchSql, true))
            {
                return MsSqlDbAccess.Current.GetData(cmd);
            } */
			

			if (toSearchWhat == "*")
				toSearchWhat = "";
			string forumIDs = "";
			string limitString = "";
			string orderString = "";

			if (forumIDToStartAt != 0)
			{
                DataTable dt = forum_listall_sorted(boardId, userId, null, false, forumIDToStartAt);
				foreach (DataRow dr in dt.Rows)
					forumIDs = forumIDs + Convert.ToInt32(dr["ForumID"]).ToString() + ",";
				forumIDs = forumIDs.Substring(0, forumIDs.Length - 1);
			}

			// fix quotes for SQL insertion...
			toSearchWhat = toSearchWhat.Replace("'", "''").Trim();
			toSearchFromWho = toSearchFromWho.Replace("'", "''").Trim();

			string searchSql = (maxResults == 0) ? "SELECT" : ("SELECT DISTINCT ");
			if (maxResults > 0)
			{ limitString += String.Format(" LIMIT {0} ", maxResults.ToString());  }

            searchSql += " a.forumid, a.topicid, a.topic, b.userid, COALESCE(c.username, b.name) as Name, c.messageid as \"MessageID\", c.posted, c.message as \"Message\", c.flags ";
			searchSql += "FROM " + (Config.SchemaName.IsSet() ? Config.SchemaName : "public") +
				"." + Config.DatabaseObjectQualifier + "topic a LEFT JOIN " +
                (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier +
                "message c ON a.topicid = c.topicid LEFT JOIN " + (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier +
                "user b ON c.userid = b.userid join " + (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier
				+ "vaccess x ON x.forumid=a.forumid ";
			searchSql += String.Format(@"WHERE x.readaccess<>0 AND x.userid={0} AND c.isapproved IS TRUE AND a.topicmovedid IS NULL AND a.isdeleted IS FALSE AND c.isdeleted IS FALSE ", userId);
			orderString += "ORDER BY a.forumid ";
			

			string[] words;
			bool bFirst;

			if (!String.IsNullOrEmpty(toSearchFromWho))
			{
				searchSql += "AND (";
				bFirst = true;                

				// generate user search sql...
				switch (searchFromWhoMethod)
				{
					case SearchWhatFlags.AllWords:
						words = toSearchFromWho.Split(' ');
						foreach (string word in words)
						{
							if (!bFirst) searchSql += " AND "; else bFirst = false;
							searchSql += string.Format(" ((c.username IS NULL AND b.name LIKE '%{0}%') OR (c.username LIKE '%{0}%'))", word);
							
							if (int.TryParse(word, out userId))
							{
								searchSql +=
								  string.Format(" (c.userid IN ({0}))", userId);
							}
							else
							{
								
								if (searchDisplayName)
								{
									searchSql +=
								  string.Format(" OR ((c.username IS NULL AND b.displayname LIKE '%{0}%') OR (c.username LIKE '%{0}%'))", word);
								}
								else
								{
									searchSql += string.Format(" OR ((c.username IS NULL AND b.name LIKE '%{0}%') OR (c.username LIKE '%{0}%'))", word);
								}
							}
						}
						break;
					case SearchWhatFlags.AnyWords:
						words = toSearchFromWho.Split(' ');
						foreach (string word in words)
						{
							if (!bFirst) searchSql += " OR "; else bFirst = false;
							searchSql += string.Format(" ((c.username IS NULL AND b.name LIKE '%{0}%') OR (c.username LIKE '%{0}%'))", word);
						}
						break;
					case SearchWhatFlags.ExactMatch:
						searchSql += string.Format(" ((c.username IS NULL AND b.name = '{0}' ) OR (c.username = '{0}' ))", toSearchFromWho);
						
						if (int.TryParse(toSearchFromWho, out userId))
						{
							searchSql +=
							  string.Format(" (c.userid IN ({0}))", userId);
						}
						else
						{
						 
							if (searchDisplayName)
							{
								searchSql += string.Format(
														  " ((c.username IS NULL AND b.displayname = '{0}') OR (c.username = '{0}'))", toSearchFromWho);
							}
							else
							{
								searchSql += string.Format(
						   " ((c.username IS NULL AND b.name = '{0}') OR (c.username = '{0}'))", toSearchFromWho);
							}
	 
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
							searchSql += string.Format("( CONTAINS (c.message, ' {0} ') OR CONTAINS (a.topic, ' {0} ' ) )", ftInner);
						}
						else
						{
							foreach (string word in words)
							{
								if (!bFirst) searchSql += " AND "; else bFirst = false;
								searchSql += String.Format("(c.message like '%{0}%' OR a.topic LIKE '%{0}%' )", word);
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
								
								if (int.TryParse(word, out userId))
								{
									searchSql +=
									  string.Format(" (c.UserID IN ({0}))", userId);
								}
								else
								{
									searchSql +=
									  string.Format(" ((c.Username IS NULL AND b.Name LIKE N'%{0}%') OR (c.Username LIKE N'%{0}%'))", word);
								}
							}
							// make final string...
							searchSql += string.Format("( CONTAINS (c.message, ' {0} ' ) OR CONTAINS (a.topic, ' {0} ' ) )", ftInner);
						}
						else
						{
							foreach (string word in words)
							{
								if (!bFirst) searchSql += " OR "; else bFirst = false;
								searchSql += String.Format("c.message LIKE '%{0}%'  OR a.topic LIKE '%{0}%' ", word);
							}
						}
						break;
					case SearchWhatFlags.ExactMatch:
						if (useFullText)
						{
							searchSql += string.Format("( CONTAINS (c.message, ' \"{0}\" ' ) OR CONTAINS (a.topic, ' \"{0}\" '  )", toSearchWhat);
						}
						else
						{
							searchSql += string.Format("c.message LIKE '%{0}%'  OR a.topic LIKE '%{0}%'  ", toSearchWhat);
						}
						break;
				}
				searchSql += ") ";
			}

			// Ederon : 6/16/2007 - forum IDs start above 0, if forum id is 0, there is no forum filtering
			if (forumIDToStartAt > 0)
			{
				searchSql += string.Format("AND a.forumid IN ({0})", forumIDs);
			}

			if (orderString != "") { orderString += ", "; }
			if (!orderString.Contains("ORDER BY"))
			{
				searchSql += " ORDER BY ";
			}

			searchSql += orderString + "c.posted DESC ";

			if (!orderString.Contains("LIMIT"))
			{
				searchSql += limitString;
			}


			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand(searchSql, true))
			{
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion

		#region DataSets

        static public void forum_list_sort_basic( DataTable listsource, DataTable list, int parentid, int currentLvl)
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
                    forum_list_sort_basic(listsource, list, (int)row["ForumID"], currentLvl + 1);
                }
            }
        }
		/// <summary>
		/// Gets a list of categories????
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <returns>DataSet with categories</returns>
        static public DataSet ds_forumadmin( object boardId)
		{
            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
			{
				using ( DataSet ds = new DataSet() )
				{
					using ( NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction( MsSqlDbAccess.IsolationLevel ) )
					{
						using (NpgsqlDataAdapter da = new NpgsqlDataAdapter(MsSqlDbAccess.GetObjectName("category_list"), connMan.DBConnection))
						{
							da.SelectCommand.Transaction = trans;

							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_CategoryID", NpgsqlDbType.Integer)).Value = DBNull.Value;                            
						
							da.SelectCommand.CommandType = CommandType.StoredProcedure;
							da.Fill( ds, MsSqlDbAccess.GetObjectName( "Category" ) );
							da.SelectCommand.CommandText = MsSqlDbAccess.GetObjectName( "forum_list" );
							da.Fill( ds, MsSqlDbAccess.GetObjectName( "ForumUnsorted" ) );
							DataTable dtForumListSorted = ds.Tables [MsSqlDbAccess.GetObjectName( "ForumUnsorted" )].Clone();
							dtForumListSorted.TableName = MsSqlDbAccess.GetObjectName( "Forum" );
							ds.Tables.Add( dtForumListSorted );
							dtForumListSorted.Dispose();
                            LegacyDb.forum_list_sort_basic( ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")], ds.Tables[MsSqlDbAccess.GetObjectName("Forum")], 0, 0);
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
		/// <param name="boardId">ID of Board</param>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
		
         static public DataTable accessmask_list(object boardId, object accessMaskID)
		{
			return accessmask_list(boardId, accessMaskID, 0);
		}
		/// <summary>
		/// Gets a list of access mask properities
		/// </summary>
		/// <param name="boardId">ID of Board</param>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
		static public DataTable accessmask_list( object boardId, object accessMaskID , object excludeFlags)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new NpgsqlParameter("i_excludeflags", NpgsqlDbType.Integer)).Value = excludeFlags; 
					  
				return MsSqlDbAccess.Current.GetData(cmd);			
				
			}
		}
        
		/// <summary>
		/// Deletes an access mask
		/// </summary>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
		static public bool accessmask_delete( object accessMaskID )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
							
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd)) != 0;
			}
		} 
		/// <summary>
		/// Saves changes to a access mask 
		/// </summary>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <param name="boardId">ID of board</param>
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
		 static public void accessmask_save(object accessMaskID, object boardId, object name, object readAccess, object postAccess, object replyAccess, object priorityAccess, object pollAccess, object voteAccess, object moderatorAccess, object editAccess, object deleteAccess, object uploadAccess, object downloadAccess, object sortOrder)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "accessmask_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_readaccess", NpgsqlDbType.Boolean)).Value = readAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_postaccess", NpgsqlDbType.Boolean)).Value = postAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_replyaccess", NpgsqlDbType.Boolean)).Value = replyAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_priorityaccess", NpgsqlDbType.Boolean)).Value = priorityAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_pollaccess", NpgsqlDbType.Boolean)).Value = pollAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_voteaccess", NpgsqlDbType.Boolean)).Value = voteAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_moderatoraccess", NpgsqlDbType.Boolean)).Value = moderatorAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_editaccess", NpgsqlDbType.Boolean)).Value = editAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_deleteaccess", NpgsqlDbType.Boolean)).Value = deleteAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_uploadaccess", NpgsqlDbType.Boolean)).Value = uploadAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_downloadaccess", NpgsqlDbType.Boolean)).Value = downloadAccess;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrder;	
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		} 
		#endregion

		#region yaf_Active
		/// <summary>
		/// Gets list of active users
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="Guests"></param>
		/// <returns>Returns a DataTable of active users</returns>    
		static public DataTable active_list( object boardId, object guests, object showCrawlers, int interval, object styledNicks )
		{
		   // if (Guests == null) { Guests = "false"; }
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "active_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlDbType.Boolean)).Value = guests;
                cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new NpgsqlParameter("i_interval", NpgsqlDbType.Integer)).Value = interval;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return MsSqlDbAccess.Current.GetData(cmd);
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
		public static DataTable active_list_user( object boardID, object userID, object Guests,  object showCrawlers, int activeTime, object styledNicks)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("active_list_user"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlDbType.Boolean)).Value = Guests;
                cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new NpgsqlParameter("i_activetime", NpgsqlDbType.Integer)).Value = activeTime;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;
   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Gets the list of active users within a certain forum
		/// </summary>
		/// <param name="forumID">forumID</param>
		/// <returns>DataTable of all ative users in a forum</returns>
		static public DataTable active_listforum( object forumID, object styledNicks )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "active_listforum" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Gets the list of active users in a topic
		/// </summary>
		/// <param name="topicID">ID of topic </param>
		/// <returns>DataTable of all users that are in a topic</returns>
		static public DataTable active_listtopic(  object topicID, object styledNicks )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "active_listtopic" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return MsSqlDbAccess.Current.GetData(cmd);
			
			}
		}

		/// <summary>
		/// Gets the activity statistics for a board
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <returns>DataRow of activity stata</returns>
		static public DataRow active_stats( object boardId )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "active_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
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
		/// <param name="boardId">boardId</param>
		/// <returns>DataTable with attachement list</returns>
        static public DataTable attachment_list( object messageID, object attachmentID, object boardId)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "attachment_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return MsSqlDbAccess.Current.GetData(cmd);
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
			using ( var cmd = MsSqlDbAccess.GetCommand( "attachment_save" ) )
			{
				byte [] fileData = null;
				if ( stream != null )
				{
					fileData = new byte [stream.Length];
					stream.Seek( 0, System.IO.SeekOrigin.Begin );
					stream.Read( fileData, 0, ( int )stream.Length );
				}
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_filename", NpgsqlDbType.Varchar)).Value = fileName;
				cmd.Parameters.Add(new NpgsqlParameter("i_bytes", NpgsqlDbType.Integer)).Value = bytes;
				cmd.Parameters.Add(new NpgsqlParameter("i_contenttype", NpgsqlDbType.Varchar)).Value = contentType;
				cmd.Parameters.Add(new NpgsqlParameter("i_filedata", NpgsqlDbType.Bytea)).Value = fileData;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		//ABOT CHANGE 16.04.04
		/// <summary>
		/// Delete attachment
		/// </summary>
		/// <param name="attachmentID">ID of attachment to delete</param>
        static public void attachment_delete( object attachmentID)
		{
            bool UseFileTable = GetBooleanRegistryValue( "UseFileTable");

			//If the files are actually saved in the Hard Drive
			if ( !UseFileTable )
			{
				using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "attachment_list" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = DBNull.Value;
					cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = DBNull.Value;

                    DataTable tbAttachments = MsSqlDbAccess.Current.GetData(cmd);
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
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "attachment_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
			//End ABOT CHANGE 16.04.04
		}


		/// <summary>
		/// Attachement dowload
		/// </summary>
		/// <param name="attachmentID">ID of attachemnt to download</param>
		static public void attachment_download( object attachmentID )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "attachment_download" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_BannedIP
		/// <summary>
		/// List of Baned IP's
		/// </summary>
		/// <param name="boardId">ID of board</param>
		/// <param name="ID">ID</param>
		/// <returns>DataTable of banned IPs</returns>
        static public DataTable bannedip_list( object boardId, object ID)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_list" ) )
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Saves baned ip in database
		/// </summary>
		/// <param name="ID">ID</param>
		/// <param name="boardId">BoardID</param>
		/// <param name="Mask">Mask</param>
        static public void bannedip_save( object ID, object boardId, object Mask, string reason, int userID)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_save" ) )
			{
				//Regex for ip
			  //  \b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_mask", NpgsqlDbType.Varchar)).Value = Mask;
				cmd.Parameters.Add(new NpgsqlParameter("i_reason", NpgsqlDbType.Varchar)).Value = reason;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Deletes Banned IP
		/// </summary>
		/// <param name="ID">ID of banned ip to delete</param>
        static public void bannedip_delete( object ID)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "bannedip_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_Board
		/// <summary>
		/// Gets a list of information about a board
		/// </summary>
		/// <param name="boardId">board id</param>
		/// <returns>DataTable</returns>
        static public DataTable board_list( object boardId)
		{
			String _systemInfo = String.Concat(" OS: ", Platform.VersionString,
				   " - Runtime: ", Platform.RuntimeName, " ", Platform.RuntimeString,
				   " - Number of processors: ", Platform.Processors,
				   " - Allocated memory:", (Platform.AllocatedMemory / 1024 / 1024).ToString(), " Mb.");
			
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_sysinfo", NpgsqlDbType.Varchar)).Value = _systemInfo;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Gets posting statistics
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="useStyledNicks">useStyledNicks</param>
		/// <returns>DataRow of Poststats</returns>
        static public DataRow board_poststats( int? boardId, bool useStyledNicks, bool showNoCountPosts)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_poststats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId; 
				cmd.Parameters.Add(new NpgsqlParameter("i_usestylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_getdefaults", NpgsqlDbType.Boolean)).Value = false;

                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
                    if (dt.Rows.Count > 0)
                    {
                        return dt.Rows[0];
                    }
				}
			}

            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("board_poststats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_usestylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_getdefaults", NpgsqlDbType.Boolean)).Value = true;

                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
                {
                    if (dt.Rows.Count > 0)
                    {
                        return dt.Rows[0];
                    }
                }
            }
		    return null;
		}

        /// <summary>
        /// Gets users statistics
        /// </summary>
        /// <param name="boardID">
        /// BoardID
        /// </param>
        /// <returns>
        /// DataRow of Poststats
        /// </returns>
        public static DataRow board_userstats(int? boardId)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("board_userstats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId; 
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
            board_resync(null);
        }
		/// <summary>
		/// Recalculates topic and post numbers and updates last post for specified board
		/// </summary>
		/// <param name="boardId">BoardID of board to do re-sync for, if null, all boards are re-synced</param>
		static public void board_resync( object boardId )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_resync" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
			   
				NpgsqlCommandBuilder cb = new NpgsqlCommandBuilder();             
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Gets statistica about number of posts etc.
		/// </summary>
		/// <returns>DataRow</returns>

        static public DataRow board_stats( object boardId)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					return dt.Rows [0];
				}
			}
		}
		/// <summary>
		/// Saves board information
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="name">Name of Board</param>
		/// <param name="allowThreaded">Boolen value, allowThreaded</param>
        static public int board_save( object boardId, object languageFile, object culture, object name, object allowThreaded)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value =  languageFile;
				cmd.Parameters.Add(new NpgsqlParameter("i_culture", NpgsqlDbType.Varchar)).Value = culture;     
				cmd.Parameters.Add(new NpgsqlParameter("i_allowthreaded", NpgsqlDbType.Boolean)).Value = allowThreaded;

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
				
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
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_create" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardname", NpgsqlDbType.Varchar)).Value = boardName;               
				cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value = languageFile;
				cmd.Parameters.Add(new NpgsqlParameter("i_culture", NpgsqlDbType.Varchar)).Value = culture;    
				cmd.Parameters.Add(new NpgsqlParameter("i_membershipappname", NpgsqlDbType.Varchar)).Value = boardMembershipName;
				cmd.Parameters.Add(new NpgsqlParameter("i_rolesappname", NpgsqlDbType.Varchar)).Value = boardRolesName;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = adminUsername;
				cmd.Parameters.Add(new NpgsqlParameter("i_useremail", NpgsqlDbType.Varchar)).Value = adminUserEmail;
				cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid)).Value = adminUserKey;
				cmd.Parameters.Add(new NpgsqlParameter("i_ishostadmin", NpgsqlDbType.Boolean)).Value = false;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_roleprefix", NpgsqlDbType.Varchar)).Value = rolePrefix;

				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));               
			}
		}
		/// <summary>
		/// Deletes a board
		/// </summary>
		/// <param name="boardId">ID of board to delete</param>
        static public void board_delete( object boardId)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "board_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
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
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "category_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = CategoryID;
							   
				return ( int )MsSqlDbAccess.Current.ExecuteScalar(cmd) != 0;
			}
		}
		/// <summary>
		/// Gets a list of forums in a category
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <param name="categoryID">categotyID</param>
		/// <returns>DataTable with a list of forums in a category</returns>
        static public DataTable category_list( object boardId, object categoryID)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "category_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Gets a list of forum categories
		/// </summary>
		/// <param name="boardId"></param>
		/// <param name="userId"></param>
		/// <param name="categoryID"></param>
		/// <returns></returns>
        static public DataTable category_listread( object boardId, object userId, object categoryID)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "category_listread" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;

                return MsSqlDbAccess.Current.GetData(cmd);
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
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "category_simplelist" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = startID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = limit;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Saves changes to a category
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="CategoryID">CategoryID so save changes to</param>
		/// <param name="Name">Name of the category</param>
		/// <param name="SortOrder">Sort Order</param>
        static public void category_save( object boardId, object categoryId, object name, object categoryImage, object sortOrder)
		{

			int sortOrderChecked = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderChecked);
			if (result) { if (sortOrderChecked >= 255) { sortOrderChecked = 0; } }
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "category_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderChecked;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryimage", NpgsqlDbType.Varchar)).Value = categoryImage;
				

			   
				
 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
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
        static public void checkemail_save( object userId, object hash, object email)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_iserid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_hash", NpgsqlDbType.Varchar)).Value = hash;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Updates a hash
		/// </summary>
		/// <param name="hash">New hash</param>
		/// <returns>DataTable with user information</returns>
        static public DataTable checkemail_update( object hash)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_update" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_hash", NpgsqlDbType.Varchar)).Value = hash;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Gets a check email entry based on email or all if no email supplied
		/// </summary>
		/// <param name="email">Associated email</param>
		/// <returns>DataTable with check email information</returns>
        static public DataTable checkemail_list( object email)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "checkemail_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion
	   
		#region yaf_Choice
		/// <summary>
		/// Saves a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public void choice_vote( object choiceID, object userId, object remoteIP)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "choice_vote" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_remoteip", NpgsqlDbType.Varchar)).Value = remoteIP;
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_EventLog
        static public void eventlog_create( object userId, object source, object description)
        {
            eventlog_create( userId, (object)source.GetType().ToString(), description, (object)0);
        }
        static public void eventlog_create( object userId, object source, object description, object type)
		{
			try
			{
				if ( userId == null ) userId = DBNull.Value;
				using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_create" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;



					cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
					cmd.Parameters.Add(new NpgsqlParameter("i_source", NpgsqlDbType.Varchar)).Value = source.ToString();
					cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Text)).Value = description.ToString();
					cmd.Parameters.Add(new NpgsqlParameter("i_type", NpgsqlDbType.Integer)).Value = type;
					
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}


        static public void eventlog_delete(int boardId)
        {
            eventlog_delete(null, boardId);
        }
        /// <summary>
        /// Deletes event log entry of given ID.
        /// </summary>
        /// <param name="eventLogID">ID of event log entry.</param>
        static public void eventlog_delete(object eventLogID)
        {
            eventlog_delete(eventLogID, null);
        }

		/// <summary>
		/// Calls underlying stroed procedure for deletion of event log entry(ies).
		/// </summary>
		/// <param name="eventLogID">When not null, only given event log entry is deleted.</param>
		/// <param name="boardId">Specifies board. It is ignored if eventLogID parameter is not null.</param>
        static public void eventlog_delete( object eventLogID, object boardId)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_eventlogid", NpgsqlDbType.Integer)).Value = eventLogID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
						
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public DataTable eventlog_list( object boardId )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "eventlog_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion yaf_EventLog

		// Admin control of file extensions - MJ Hufford
	   
		#region yaf_Extensions

        static public void extension_delete( object extensionId)
		{
			try
			{
				using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "extension_delete" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;
									  
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
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
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "extension_edit" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;

                return MsSqlDbAccess.Current.GetData(cmd);
			}

		}

        // Returns an extension list for a given Board
        static public DataTable extension_list(object boardId)
        {
            return extension_list(boardId, null);

        }

		// Used to validate a file before uploading
        static public DataTable extension_list( object boardId, object extension)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "extension_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_extension", NpgsqlDbType.Varchar)).Value = extension;

                return MsSqlDbAccess.Current.GetData(cmd);
			}

		}

		// Saves / creates extension
        static public void extension_save( object extensionId, object boardId, object extension)
		{
			try
			{
				using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "extension_save" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
					cmd.Parameters.Add(new NpgsqlParameter("i_extension", NpgsqlDbType.Varchar)).Value = extension;
					
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
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
        /// <param name="pollGroupId">
        /// The pollGroupid.
        /// </param>
        /// <param name="userId">
        /// The userid.
        /// </param>
        /// <param name="remoteIp">
        /// The remoteip.
        /// </param>
        public static DataTable pollgroup_votecheck( object pollGroupId, object userId, object remoteIp)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_votecheck"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
                cmd.Parameters.AddWithValue("i_userid", userId);
                cmd.Parameters.AddWithValue("i_remoteip", remoteIp);
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary>
		/// Checks for a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public DataTable pollvote_check( object pollid, object userid, object remoteip)
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "pollvote_check" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollid;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userid;
				cmd.Parameters.Add(new NpgsqlParameter("i_remoteip", NpgsqlDbType.Varchar)).Value = remoteip;

                return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion        
	   
		#region yaf_Forum

        /// <summary>
        /// Get the list of recently logged in users.
        /// </summary>
        /// <param name="boardID">
        /// The board ID.
        /// </param>
        /// <param name="timeSinceLastLogin">
        /// The time since last login in minutes.
        /// </param>
        /// <param name="styledNicks">
        /// The styled Nicks.
        /// </param>
        /// <returns>
        /// The list of users in Datatable format.
        /// </returns>
        public static DataTable recent_users( object boardID, int timeSinceLastLogin, object styledNicks)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("recent_users"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new NpgsqlParameter("i_timesincelastlogin", NpgsqlDbType.Integer)).Value = timeSinceLastLogin;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;
               
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }
		//ABOT NEW 16.04.04
		/// <summary>
		/// Deletes attachments out of a entire forum
		/// </summary>
		/// <param name="ForumID">ID of forum to delete all attachemnts out of</param>
		static private void forum_deleteAttachments( object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listtopics"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
												
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listSubForums"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

			    if (!(MsSqlDbAccess.Current.ExecuteScalar(cmd) is DBNull))
			        return false;
			    else
			    {
			        forum_deleteAttachments( forumID);
			        using (NpgsqlCommand cmd_new = MsSqlDbAccess.GetCommand("forum_delete"))
			        {
			            cmd_new.CommandType = CommandType.StoredProcedure;
			            cmd_new.CommandTimeout = 99999;
			            cmd_new.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

			            MsSqlDbAccess.Current.ExecuteNonQuery(cmd_new);
			        }
			        return true;
			    }
			}
		}

        public static bool forum_move([NotNull] object forumOldID, [NotNull] object forumNewID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("forum_listSubForums"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumOldID;

                if (!(MsSqlDbAccess.Current.ExecuteScalar(cmd) is DBNull))
                {
                    return false;
                }

                using (var cmd_new = MsSqlDbAccess.GetCommand("forum_move"))
                {
                    cmd_new.CommandType = CommandType.StoredProcedure;
                    cmd_new.CommandTimeout = 99999;
                    cmd.Parameters.Add(new NpgsqlParameter("i_forumoldid", NpgsqlDbType.Integer)).Value = forumOldID;
                    cmd.Parameters.Add(new NpgsqlParameter("i_forumnewid", NpgsqlDbType.Integer)).Value = forumNewID;
                   
                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd_new);
                }

                return true;
            }
        }
		/// <summary>
		/// Lists all moderated forums for a user
		/// </summary>
		/// <param name="boardId">board if of moderators</param>
		/// <param name="userId">user id</param>
		/// <returns>DataTable of moderated forums</returns>
        static public DataTable forum_listallMyModerated( object boardId, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listallmymoderated"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
					 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		//END ABOT NEW 16.04.04
		/// <summary>
		/// Gets a list of topics in a forum
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <param name="ForumID">forumID</param>
		/// <returns>DataTable with list of topics from a forum</returns>
        static public DataTable forum_list( object boardId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_list"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


		/// <summary>
		/// Lists all forums accessible to a user
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="userId">ID of user</param>
		/// <param name="startAt">startAt ID</param>
		/// <returns>DataTable of all accessible forums</returns>
        static public DataTable forum_listall( object boardId, object userId, object startAt)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listall"))
			{
				if (startAt == null) { startAt = 0; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_root", NpgsqlDbType.Integer)).Value = startAt;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


        public static IEnumerable<TypedForumListAll> ForumListAll( int boardId, int userId)
        {
            return forum_listall( boardId, userId, 0).AsEnumerable().Select(r => new TypedForumListAll(r));
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
		/// Lists forums very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
        static public DataTable forum_simplelist( int startID, int limit)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_simplelist"))
			{
				if (startID <= 0) { startID = 0; }
				if (limit <= 0) { limit = 500; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = startID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = limit;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void forum_sort_list_recursive(DataTable listSource, DataTable listDestination, int parentID, int categoryID, int currentIndent)
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
                    forum_sort_list_recursive(listSource, listDestination, (int)row["ForumID"], categoryID, currentIndent + 1);
                }
            }
        }
        static private DataTable forum_sort_list(DataTable listSource, int parentID, int categoryID, int startingIndent, int[] forumidExclusions)
        {
            return forum_sort_list(listSource, parentID, categoryID, startingIndent, forumidExclusions, true);
        }

        static public DataTable forum_sort_list(DataTable listSource, int parentID, int categoryID, int startingIndent, int[] forumidExclusions, bool emptyFirstRow)
        {
            DataTable listDestination = new DataTable();
            listDestination.TableName = "forum_sort_list";
            listDestination.Columns.Add("ForumID", typeof(String));
            listDestination.Columns.Add("Title", typeof(String));

            if (emptyFirstRow)
            {
                DataRow blankRow = listDestination.NewRow();
                blankRow["ForumID"] = string.Empty;
                blankRow["Title"] = string.Empty;
                listDestination.Rows.Add(blankRow);
            }
            // filter the forum list -- not sure if this code actually works
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

            forum_sort_list_recursive(dv.ToTable(), listDestination, parentID, categoryID, startingIndent);

            return listDestination;
        }
        /// <summary>
        /// Lists all forums within a given subcategory
        /// </summary>
        /// <param name="boardId">BoardID</param>
        /// <param name="CategoryID">CategoryID</param>
        /// <returns>DataTable with list</returns>
        static public DataTable forum_listall_fromCat(object boardId, object categoryID)
        {
            return forum_listall_fromCat(boardId, categoryID, true);
        }
		/// <summary>
		/// Lists all forums within a given subcategory
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="CategoryID">CategoryID</param>
		/// <param name="EmptyFirstRow">EmptyFirstRow</param>
		/// <returns>DataTable with list</returns>
        static public DataTable forum_listall_fromCat( object boardId, object categoryID, bool emptyFirstRow)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listall_fromCat"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;
				
				
				int intCategoryID = Convert.ToInt32(categoryID.ToString());

				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
                    return LegacyDb.forum_sort_list(dt, 0, intCategoryID, 0, null, emptyFirstRow);
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_listpath"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Lists read topics
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="UserID">UserID</param>
		/// <param name="CategoryID">CategoryID</param>
		/// <param name="parentID">ParentID</param>
		/// <returns>DataTable with list</returns>
        static public DataTable forum_listread( object boardID,
            object userID, object categoryID, object parentID, object useStyledNicks, [CanBeNull]bool findLastRead)
		{                      
		
		  //  DataTable dt1 = null;
		   // DataTable dt2 = null;

			if (categoryID == null) { categoryID = DBNull.Value; }
			if (parentID == null) { parentID = DBNull.Value; }


			using (NpgsqlCommand cmd1 = MsSqlDbAccess.GetCommand("forum_listread"))
			{
				cmd1.CommandType = CommandType.StoredProcedure;

				cmd1.Parameters.Add("i_boardid", NpgsqlDbType.Integer).Value = boardID;
				cmd1.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = userID;
				cmd1.Parameters.Add("i_categoryid", NpgsqlDbType.Integer).Value = categoryID;
				cmd1.Parameters.Add("i_parentid", NpgsqlDbType.Integer).Value = parentID;
                cmd1.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value =  useStyledNicks;
                cmd1.Parameters.Add("i_findlastunread", NpgsqlDbType.Boolean).Value = findLastRead;
   
			   // dt1 = 
				return MsSqlDbAccess.Current.GetData(cmd1, false);
				// return dt1;
			}                    
		   
/*
			//Add extra columns to data table
			int cntr = 0;
			int firstColumnIndex = dt1.Columns.Count;
			int dt1rc = dt1.Rows.Count;
			if (dt1rc != 0)
			{
				foreach (DataRow dr1 in dt1.Rows)
				{

					using (NpgsqlCommand cmd3 = MsSqlDbAccess.GetCommand("forum_listread_helper"))
					{
						cmd3.CommandType = CommandType.StoredProcedure;                      
					   
						cmd3.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = dr1["ForumID"];

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
				using (NpgsqlCommand cmd2 = MsSqlDbAccess.GetCommand("forum_listread_helper"))
				{
					cmd2.CommandType = CommandType.StoredProcedure;

					cmd2.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = 0;                    

					dt2 = MsSqlDbAccess.Current.AddValuesToDataTableFromReader(cmd2, dt1, false, true, firstColumnIndex, 0);
				}
			}

			return dt2; */    

		}

		/// <summary>
		/// Return admin view of Categories with Forums/Subforums ordered accordingly.
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="userId">UserID</param>
		/// <returns>DataSet with categories</returns>
        static public DataSet forum_moderatelist( object userId, object boardId)
		{
            using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
			{
				using (DataSet ds = new DataSet())
				{
					using (NpgsqlDataAdapter da = new NpgsqlDataAdapter(MsSqlDbAccess.GetObjectName("category_list"), connMan.OpenDBConnection))
					{
						using (NpgsqlTransaction trans = da.SelectCommand.Connection.BeginTransaction(MsSqlDbAccess.IsolationLevel))
						{
							da.SelectCommand.Transaction = trans;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = DBNull.Value;
												 
							da.SelectCommand.CommandType = CommandType.StoredProcedure;


							da.Fill(ds, MsSqlDbAccess.GetObjectName("Category"));
							da.SelectCommand.CommandText = MsSqlDbAccess.GetObjectName("forum_moderatelist");
							da.SelectCommand.Parameters.Clear();
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
													   
							da.Fill(ds, MsSqlDbAccess.GetObjectName("ForumUnsorted"));
							DataTable dtForumListSorted = ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")].Clone();
							dtForumListSorted.TableName = MsSqlDbAccess.GetObjectName("Forum");
							ds.Tables.Add(dtForumListSorted);
							dtForumListSorted.Dispose();
                            LegacyDb.forum_list_sort_basic( ds.Tables[MsSqlDbAccess.GetObjectName("ForumUnsorted")], ds.Tables[MsSqlDbAccess.GetObjectName("Forum")], 0, 0);
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

        static public DataTable forum_moderators( bool useStyledNicks)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_moderators"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
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
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary>
		/// Updates topic and post count and last topic for specified forum
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="forumID">If null, all forums in board are updated</param>
        static public void forum_resync( object boardId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_resync"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public long forum_save( object forumID, 
			object categoryID, object parentID, object name, 
			object description, object sortOrder, object locked, 
			object hidden, object isTest, object moderated, 
			object accessMaskID, object remoteURL, 
			object themeURL, 
			object imageURL,
			object styles,
	   bool dummy)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forum_save"))
			{
				if (parentID == null) { parentID = DBNull.Value; }
				if (remoteURL == null) { remoteURL = DBNull.Value; }
				if (themeURL == null) { themeURL = DBNull.Value; }
				if (accessMaskID == null) { accessMaskID = DBNull.Value; }
				int sortOrderOut = 0;
				bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
				if (result)
				{
					if (sortOrderOut >= 255) { sortOrderOut = 0; }
				}

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;
				cmd.Parameters.Add(new NpgsqlParameter("i_parentid", NpgsqlDbType.Integer)).Value = parentID;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderOut;
				cmd.Parameters.Add(new NpgsqlParameter("i_locked", NpgsqlDbType.Boolean)).Value = locked;
				cmd.Parameters.Add(new NpgsqlParameter("i_hidden", NpgsqlDbType.Boolean)).Value = hidden;
				cmd.Parameters.Add(new NpgsqlParameter("i_istest", NpgsqlDbType.Boolean)).Value = isTest;
				cmd.Parameters.Add(new NpgsqlParameter("i_moderated", NpgsqlDbType.Boolean)).Value = moderated;
				cmd.Parameters.Add(new NpgsqlParameter("i_remoteurl", NpgsqlDbType.Varchar)).Value = remoteURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_themeurl", NpgsqlDbType.Varchar)).Value = themeURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageurl", NpgsqlDbType.Varchar)).Value = imageURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_styles", NpgsqlDbType.Varchar)).Value = styles;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
				
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("SELECT " + MsSqlDbAccess.GetObjectName("forum_save_parentschecker") + "(@ForumID,@ParentID)", true))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.Add(new NpgsqlParameter("@ForumID", NpgsqlDbType.Integer)).Value =  forumID;
				cmd.Parameters.Add(new NpgsqlParameter("@ParentID", NpgsqlDbType.Integer)).Value = parentID;
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}

		}
			   

		#endregion
	   
		#region yaf_ForumAccess
        static public DataTable forumaccess_list( object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_ForumID", NpgsqlDbType.Integer)).Value = forumID;
								
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void forumaccess_save( object forumID, object groupID, object accessMaskID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
							 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public DataTable forumaccess_group( object groupID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("forumaccess_group"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
								
				return userforumaccess_sort_list(MsSqlDbAccess.Current.GetData(cmd), 0, 0, 0);
			}
		}
		#endregion
	   
		#region yaf_Group
        static public DataTable group_list( object boardId, object groupID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
							
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void group_delete( object groupID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public DataTable group_member( object boardId, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_member"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				

				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        static public long group_save( object groupID, object boardId, object name, 
			object isAdmin, object isGuest, object isStart, object isModerator,
			object accessMaskID, object pmLimit, object style, object sortOrder,
			object description,
			object usrSigChars,
			object usrSigBBCodes,
			object usrSigHTMLTags,
			object usrAlbums,
			object usrAlbumImages)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_save"))
			{
				if (accessMaskID == null) { accessMaskID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_isadmin", NpgsqlDbType.Boolean)).Value = isAdmin;
				cmd.Parameters.Add(new NpgsqlParameter("i_isguest", NpgsqlDbType.Boolean)).Value = isGuest;
				cmd.Parameters.Add(new NpgsqlParameter("i_isstart", NpgsqlDbType.Boolean)).Value = isStart;
				cmd.Parameters.Add(new NpgsqlParameter("i_ismoderator", NpgsqlDbType.Boolean)).Value = isModerator;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new NpgsqlParameter("i_pmlimit", NpgsqlDbType.Integer)).Value = pmLimit;
				cmd.Parameters.Add(new NpgsqlParameter("i_style", NpgsqlDbType.Varchar)).Value = style;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrder;
				cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsigchars", NpgsqlDbType.Integer)).Value = usrSigChars;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsigbbcodes", NpgsqlDbType.Varchar)).Value = usrSigBBCodes;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsightmltags", NpgsqlDbType.Varchar)).Value = usrSigHTMLTags;
				cmd.Parameters.Add(new NpgsqlParameter("i_usralbums", NpgsqlDbType.Integer)).Value = usrAlbums;
				cmd.Parameters.Add(new NpgsqlParameter("i_usralbumimages", NpgsqlDbType.Integer)).Value = usrAlbumImages;

				return long.Parse(MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString());
			}
		}
		#endregion
	   
		#region yaf_Mail
        static public void mail_delete( object mailID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("mail_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_mailid", NpgsqlDbType.Integer)).Value = mailID;
						   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public DataTable mail_list( object processId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("mail_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_processid", NpgsqlDbType.Integer)).Value = processId; 
							  
				return MsSqlDbAccess.Current.GetData(cmd);
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
        using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("mail_list"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new NpgsqlParameter("i_processid", NpgsqlDbType.Integer)).Value = processId;
            return MsSqlDbAccess.Current.GetData(cmd).SelectTypedList(x => new TypedMailList(x));
        }
    }

    static public void mail_createwatch( object topicID, object from, object fromName, object subject, object body, object bodyHtml, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("mail_createwatch"))
			{
				if (fromName == null) { fromName = DBNull.Value; }
				if (bodyHtml == null) { bodyHtml = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_from", NpgsqlDbType.Varchar)).Value = from;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromname", NpgsqlDbType.Varchar)).Value = fromName;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
				cmd.Parameters.Add(new NpgsqlParameter("i_body", NpgsqlDbType.Text)).Value = body;
				cmd.Parameters.Add(new NpgsqlParameter("i_bodyhtml", NpgsqlDbType.Text)).Value = bodyHtml;
				cmd.Parameters.Add(new NpgsqlParameter("i_iserid", NpgsqlDbType.Integer)).Value = userId;
							 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
    static public void mail_create( object from, object fromName, object to, object toName, object subject, object body, object bodyHtml)
		{
   

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("mail_create"))
			{
				//if (fromName == null) { fromName = DBNull.Value; }
			   // if (toName == null) { toName = DBNull.Value; }
			   // if (bodyHtml == null) { bodyHtml = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_from", NpgsqlDbType.Varchar)).Value = from;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromname", NpgsqlDbType.Varchar)).Value = fromName;
				cmd.Parameters.Add(new NpgsqlParameter("i_to", NpgsqlDbType.Varchar)).Value = to;
				cmd.Parameters.Add(new NpgsqlParameter("i_toname", NpgsqlDbType.Varchar)).Value = toName;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
				cmd.Parameters.Add(new NpgsqlParameter("i_body", NpgsqlDbType.Text)).Value = body;
				cmd.Parameters.Add(new NpgsqlParameter("i_bodyhtml", NpgsqlDbType.Text)).Value = bodyHtml;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_Message

    static public DataTable post_list( 
            object topicId, 
            object authoruserId, 
            object updateViewCount, 
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
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("post_list"))
            {
                if (updateViewCount == null) { updateViewCount = 1; }
                //if (showDeleted != false || showDeleted != true) { showDeleted = true; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new NpgsqlParameter("i_authoruserid", NpgsqlDbType.Integer)).Value = authoruserId;
				cmd.Parameters.Add(new NpgsqlParameter("i_updateviewcount", NpgsqlDbType.Smallint)).Value = updateViewCount;
				cmd.Parameters.Add(new NpgsqlParameter("i_showdeleted", NpgsqlDbType.Boolean)).Value = showDeleted;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_sinceposteddate", NpgsqlDbType.TimestampTZ)).Value = sincePostedDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_toposteddate", NpgsqlDbType.TimestampTZ)).Value = toPostedDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_sinceediteddate", NpgsqlDbType.TimestampTZ)).Value = sinceEditedDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_toediteddate", NpgsqlDbType.TimestampTZ)).Value = toEditedDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_sortposted", NpgsqlDbType.Integer)).Value = sortPosted;
                cmd.Parameters.Add(new NpgsqlParameter("i_sortedited", NpgsqlDbType.Integer)).Value = sortEdited;
                cmd.Parameters.Add(new NpgsqlParameter("i_sortposition", NpgsqlDbType.Integer)).Value = sortPosition;
                cmd.Parameters.Add(new NpgsqlParameter("i_showthanks", NpgsqlDbType.Boolean)).Value = showThanks;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageposition", NpgsqlDbType.Integer)).Value = messagePosition;
               
				return MsSqlDbAccess.Current.GetData(cmd);
				
			}
		}
    static public DataTable post_list_reverse10( object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("post_list_reverse10"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
								
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// The post_last 10 user.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="pageUserID">
		/// The page user id.
		/// </param>
		/// <returns>
		/// </returns>
		[Obsolete("Use post_alluser() instead.")]
        public static DataTable post_last10user( object boardID, object userID, object pageUserID)
		{
			// use all posts procedure to return top ten
			return post_alluser(boardID, userID, pageUserID, 10);
		}

		/// <summary>
		/// Gets all the post by a user.
		/// </summary>
		/// <param name="boardID">
		/// The board id.
		/// </param>
		/// <param name="userID">
		/// The user id.
		/// </param>
		/// <param name="pageUserID">
		/// The page user id.
		/// </param>
		/// <param name="topCount">
		/// Top count to return. Null is all.
		/// </param>
		/// <returns>
		/// </returns>
        public static DataTable post_alluser( object boardid, object userid, object pageUserID, object topCount)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("post_alluser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardid;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userid;
				cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topcount", NpgsqlDbType.Integer)).Value = topCount;               
			   
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

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
			  
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer));
				cmd.Parameters[0].Value = messageID;

			   
				DataTable dtr = MsSqlDbAccess.Current.GetData(cmd);

				for (int i = 0; i < dtr.Rows.Count; i++)
				{
                    DataRow row = dtr.Rows[i];
                    DataRow newRow = list.NewRow();
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
		static public long topic_create_by_message(object messageID, object forumId, object newTopicSubj)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_create_by_message"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = newTopicSubj;
			   
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
				//return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}

        [Obsolete("Use MessageList(int messageId) instead")]
        static public DataTable message_list( object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
								
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
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(t => new TypedMessageList(t));
            }
        }

        static public void message_delete(object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked)
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_listreported"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
		
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        /// <summary>
        /// Here we get reporters list for a reported message
        /// </summary>       
        /// <param name="MessageID">Should not be NULL</param>
        /// <returns>Returns reporters DataTable for a reported message.</returns>
        static public DataTable message_listreporters(int messageID)
        {

            return message_listreporters(messageID, null);

        }
        static public DataTable message_listreporters( int messageID, object userID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_listreporters"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		// <summary> Save reported message back to the database. </summary>
        static public void message_report( object messageID, object userId, object reportedDateTime, object reportText)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_report"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporterid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporteddate", NpgsqlDbType.Timestamp)).Value = reportedDateTime;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporttext", NpgsqlDbType.Varchar)).Value = reportText;
				

 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportcopyover( object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_reportcopyover"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportresolve( object messageFlag, object messageID, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_reportresolve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageflag", NpgsqlDbType.Integer)).Value = messageFlag;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		//BAI ADDED 30.01.2004
		// <summary> Delete message and all subsequent releated messages to that ID </summary>
        static private void message_deleteRecursively( object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool isLinked)
		{
			message_deleteRecursively(messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, isLinked, false);
		}
        static private void message_deleteRecursively( object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool isLinked, bool eraseMessages)
		{
            bool UseFileTable = GetBooleanRegistryValue( "UseFileTable");


			if (DeleteLinked)
			{
				//Delete replies
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
										
					DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);

					foreach (DataRow row in tbReplies.Rows)
						message_deleteRecursively(row["i_messageid"], isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, true, eraseMessages);
				}
			}

			//If the files are actually saved in the Hard Drive
			if (!UseFileTable)
			{
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("attachment_list"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = null;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = null;
					 
					DataTable tbAttachments = MsSqlDbAccess.Current.GetData(cmd);
					string uploadDir = HostingEnvironment.MapPath(String.Concat(BaseUrlBuilder.ServerFileRoot, YafBoardFolders.Current.Uploads));


					foreach ( DataRow row in tbAttachments.Rows )
					{
						try
						{
							string fileName = String.Format("{0}/{1}.{2}.yafupload", uploadDir, messageID, row["FileName"]);
				
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
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_delete"))
				{
					//if (eraseMessages == null) { eraseMessages = false; }
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_erasemessage", NpgsqlDbType.Boolean)).Value = eraseMessages;
							 
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				}
			}
			else
			{
				//Delete Message
				// undelete function added
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_deleteundelete"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_ismoderatorchanged", NpgsqlDbType.Boolean)).Value = isModeratorChanged;
					cmd.Parameters.Add(new NpgsqlParameter("i_deletereason", NpgsqlDbType.Varchar)).Value = deleteReason;
					cmd.Parameters.Add(new NpgsqlParameter("i_isdeleteaction", NpgsqlDbType.Integer)).Value = isDeleteAction;
				   
					MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				}
			}
		}

		// <summary> Set flag on message to approved and store in DB </summary>
        static public void message_approve( object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
							 
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 1000; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
			  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


        static public void message_update(
             
            object messageID, 
            object priority, 
            object message, 
            object description, 
            object status, 
            object styles, 
            object subject, 
            object flags, 
            object reasonOfEdit, 
            object isModeratorChanged, 
            object overrideApproval, 
            object origMessage, 
            object editedBy)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_update"))
			{
				if (overrideApproval == null) { overrideApproval = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_priority", NpgsqlDbType.Integer)).Value = priority;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
                cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
                cmd.Parameters.Add(new NpgsqlParameter("i_status", NpgsqlDbType.Varchar)).Value = status;
                cmd.Parameters.Add(new NpgsqlParameter("i_styles", NpgsqlDbType.Varchar)).Value = styles;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Text)).Value = message; 
				cmd.Parameters.Add(new NpgsqlParameter("i_reason", NpgsqlDbType.Varchar)).Value = reasonOfEdit;
				cmd.Parameters.Add(new NpgsqlParameter("i_editedby", NpgsqlDbType.Integer)).Value = editedBy;
				cmd.Parameters.Add(new NpgsqlParameter("i_ismoderatorchanged", NpgsqlDbType.Boolean)).Value = isModeratorChanged;
				cmd.Parameters.Add(new NpgsqlParameter("i_overrideapproval", NpgsqlDbType.Boolean)).Value = overrideApproval;
				cmd.Parameters.Add(new NpgsqlParameter("i_originalmessage", NpgsqlDbType.Text)).Value = origMessage;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_utctimestamp", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		// <summary> Save message to LegacyDb. </summary>
        static public bool message_save(
            [NotNull] object topicId, 
            [NotNull] object userId, 
            [NotNull] object message, 
            [NotNull] object userName, 
            [NotNull] object ip, 
            [NotNull] object posted, 
            [NotNull] object replyTo, 
            [NotNull] object flags,
            ref long messageId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_save"))
			{
				if (userName == null) { userName = DBNull.Value; }
				if (posted == null) { posted = DBNull.Value; }

			    
				NpgsqlParameter paramMessageID = new NpgsqlParameter("i_messageid", messageId);
				paramMessageID.Direction = ParameterDirection.Output;

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Text)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;
				cmd.Parameters.Add(new NpgsqlParameter("i_posted", NpgsqlDbType.Timestamp)).Value = posted;
				cmd.Parameters.Add(new NpgsqlParameter("i_replyto", NpgsqlDbType.Integer)).Value = replyTo;
				cmd.Parameters.Add(new NpgsqlParameter("i_blogpostid", NpgsqlDbType.Varchar)).Value = DBNull.Value;
                cmd.Parameters.Add(new NpgsqlParameter("i_externalmessageid", NpgsqlDbType.Varchar)).Value = DBNull.Value;
                cmd.Parameters.Add(new NpgsqlParameter("i_referencemessageid", NpgsqlDbType.Varchar)).Value = DBNull.Value;
                cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags;
							   
				cmd.Parameters.Add(paramMessageID);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				messageId = Convert.ToInt64(paramMessageID.Value);
				return true;
			}
		}
        static public DataTable message_unapproved( object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_unapproved"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumID", NpgsqlDbType.Integer)).Value = forumID;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public DataTable message_findunread( object topicID, object messageId, object lastRead, object showDeleted, object authorUserID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_findunread"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
				cmd.Parameters.Add(new NpgsqlParameter("i_lastread", NpgsqlDbType.Timestamp)).Value = lastRead;
                cmd.Parameters.Add(new NpgsqlParameter("i_showdeleted", NpgsqlDbType.Boolean)).Value = showDeleted;
                cmd.Parameters.Add(new NpgsqlParameter("i_authoruserid", NpgsqlDbType.Integer)).Value = authorUserID;
                DataTable dt = MsSqlDbAccess.Current.GetData(cmd);
				return dt;
			}
		}

		// message movind function
        static public void message_move( object messageID, object moveToTopic, bool moveAll)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_movetotopic", NpgsqlDbType.Integer)).Value = moveToTopic;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
			//moveAll=true anyway
			// it's in charge of moving answers of moved post
			if (moveAll)
			{
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				   
					DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);
					foreach (DataRow row in tbReplies.Rows)
					{
                        message_moveRecursively(row["MessageID"], moveToTopic);
					}

				}
			}
		}

		//moves answers of moved post
		static private void message_moveRecursively( object messageID, object moveToTopic)
		{
            bool UseFileTable = GetBooleanRegistryValue( "UseFileTable");

			//Delete replies
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getReplies"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				
				DataTable tbReplies = MsSqlDbAccess.Current.GetData(cmd);
				foreach (DataRow row in tbReplies.Rows)
				{
                    message_moveRecursively( row["messageID"], moveToTopic);
				}
				using (NpgsqlCommand innercmd = MsSqlDbAccess.GetCommand("message_move"))
				{
					innercmd.CommandType = CommandType.StoredProcedure;

					innercmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					innercmd.Parameters.Add(new NpgsqlParameter("i_movetotopic", NpgsqlDbType.Integer)).Value = moveToTopic;
					
					MsSqlDbAccess.Current.ExecuteNonQuery(innercmd);
				}
			}
		}



		// functions for Thanks feature

		// <summary> Checks if the message with the provided messageID is thanked 
		//           by the user with the provided UserID. if so, returns true,
		//           otherwise returns false. </summary>
        static public bool message_isThankedByUser( object userID, object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_isthankedbyuser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;               
			  
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
						   
				return Convert.ToBoolean( MsSqlDbAccess.Current.ExecuteScalar(cmd) );
			}
		}
        /// <summary>
        /// Is User Thanked the current Message
        /// </summary>
        /// <param name="messageId">
        /// The message Id.
        /// </param>
        /// <param name="userId">
        /// The user id.
        /// </param>
        /// <returns>
        /// If the User Thanked the the Current Message
        /// </returns>
        public static bool user_ThankedMessage(object messageId, object userId)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_thankedmessage"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
          
                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                int thankCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

                return thankCount > 0;
            }
        }

        public static int user_ThankFromCount([NotNull] object userId)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_thankfromcount"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                var thankCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

                return thankCount;
            }
        }
		// <summary> Return the number of times the message with the provided messageID
		//           has been thanked. </summary>
        static public int message_ThanksNumber( object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_thanksnumber"))
			{
				cmd.CommandType = CommandType.StoredProcedure;                            
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
							
				return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

		// <summary> Returns the UserIDs and UserNames who have thanked the message
		//           with the provided messageID. </summary>
        static public DataTable message_GetThanks( object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		// <summary> Retuns All the Thanks for the Message IDs which are in the 
		//           delimited string variable MessageIDs </summary>
        static public DataTable message_GetAllThanks( object messageIDs)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;           
				cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIDs;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Retuns All the message text for the Message IDs which are in the 
		/// delimited string variable MessageIDs
		/// </summary>
		/// <param name="messageIDs">
		/// The message ids.
		/// </param>
		/// <returns>
		/// </returns>
        public static DataTable message_GetTextByIds( string messageIDs)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_gettextbyids"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIDs;
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
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_getallthanks"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIdsSeparatedWithColon;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(t => new TypedAllThanks(t));
            }
        }

        static public string message_AddThanks( object fromUserID, object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_addthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			 // var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar);
			 // paramOutput.Direction = ParameterDirection.Output;                  
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
						  
				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
			  //return paramOutput.Value.ToString();                
			}
		}

        static public string message_RemoveThanks( object fromUserID, object messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_removethanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
			   
				MsSqlDbAccess.Current.ExecuteScalar(cmd);
				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
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
		/// <param name="showAll">
		/// The Show All.
		/// </param>
		/// <returns>
		/// List of all message changes. 
		/// </returns>
        public static DataTable messagehistory_list( int messageID, int daysToClean)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("messagehistory_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_daystoclean", NpgsqlDbType.Integer)).Value = daysToClean;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Returns message data based on user access rights
		/// </summary>
		/// <param name="MessageID">The Message Id.</param>
		/// <param name="UserID">The UserId.</param>
		/// <returns></returns>
        public static DataTable message_secdata( int MessageID, object pageUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("message_secdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = MessageID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;               

				return MsSqlDbAccess.Current.GetData(cmd);

			}
		}

		#endregion
	  
		#region yaf_Medal

        /// <summary>
        /// Lists given medal.
        /// </summary>
        /// <param name="medalID">ID of medal to list.</param>
        static public DataTable medal_list(object medalID)
        {
                return medal_list(null, medalID, null);
        }
        static public DataTable medal_list(object boardId, object category)
        {
            return medal_list(boardId, category, null);
        }

        /// <summary>
		/// Lists medals.
		/// </summary>
		/// <param name="boardId">ID of board of which medals to list. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to list. When specified, boardId and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to list. Must be complemented with not-null boardId parameter.</param>
        static public DataTable medal_list( object boardId, object medalID, object category)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("medal_list"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }
				if (category == null) { category = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_category", NpgsqlDbType.Varchar)).Value = category;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


		/// <summary>
		/// List users who own this medal.
		/// </summary>
		/// <param name="medalID">Medal of which owners to get.</param>
		/// <returns>List of users with their user id and usernames, who own this medal.</returns>
        static public DataTable medal_listusers( object medalID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("medal_listusers"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}




        /// <summary>
        /// Deletes given medals.
        /// </summary>
        /// <param name="boardId">ID of board of which medals to delete. Required.</param>
        /// <param name="category">Cateogry of medals to delete. Can be null. In such case this parameter is ignored.</param>
        static public void medal_delete(object boardId, object category)
        {
            medal_delete(boardId, null, category);
        }

        /// <summary>
        /// Deletes given medal.
        /// </summary>
        /// <param name="medalID">ID of medal to delete.</param>
        static public void medal_delete(object medalID)
        {
            medal_delete(null, medalID, null);
        }
		/// <summary>
		/// Deletes medals.
		/// </summary>
		/// <param name="boardId">ID of board of which medals to delete. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to delete. When specified, boardId and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to delete. Must be complemented with not-null boardId parameter.</param>
        static public void medal_delete( object boardId, object medalID, object category)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("medal_delete"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }
				if (category == null) { category = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_category", NpgsqlDbType.Varchar)).Value = category;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Saves new medal or updates existing one. 
		/// </summary>
		/// <param name="boardId">ID of a board.</param>
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
			object boardId, object medalID, object name, object description, object message, object category,
			object medalURL, object ribbonURL, object smallMedalURL, object smallRibbonURL, object smallMedalWidth,
			object smallMedalHeight, object smallRibbonWidth, object smallRibbonHeight, object sortOrder, object flags)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("medal_save"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
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

				if (flags == null) { flags = 0; }



				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Text)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Varchar)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_category", NpgsqlDbType.Varchar)).Value = category;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalurl", NpgsqlDbType.Varchar)).Value = medalURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_ribbonurl", NpgsqlDbType.Varchar)).Value = ribbonURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallmedalurl", NpgsqlDbType.Varchar)).Value = smallMedalURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallribbonurl", NpgsqlDbType.Varchar)).Value = smallRibbonURL;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallmedalwidth", NpgsqlDbType.Smallint)).Value = smallMedalWidth;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallmedalheight", NpgsqlDbType.Smallint)).Value = smallMedalHeight;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallribbonwidth", NpgsqlDbType.Smallint)).Value = smallRibbonWidth;
				cmd.Parameters.Add(new NpgsqlParameter("i_smallribbonheight", NpgsqlDbType.Smallint)).Value = smallRibbonHeight;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderOut;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags; 
							

				// command succeeded if returned value is greater than zero (number of affected rows)
				// bool rres = (MsSqlDbAccess.Current.ExecuteScalar(cmd) > 0);
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd)) > 0;

			}
		}


		/// <summary>
		/// Changes medal's sort order.
		/// </summary>
		/// <param name="boardId">ID of board.</param>
		/// <param name="medalID">ID of medal to re-sort.</param>
		/// <param name="move">Change of sort.</param>
        static public void medal_resort( object boardId, object medalID, int move)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("medal_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_move", NpgsqlDbType.Integer)).Value = move;
			  
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="groupID">ID of group of which to list medals.</param>
		/// <param name="medalID">ID of medal to list.</param>
        static public DataTable group_medal_list( object groupID, object medalID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_medal_list"))
			{
				if (groupID == null) { groupID = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
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
			object groupID, object medalID, object message,
			object hide, object onlyRibbon, object sortOrder)
		{
			int sortOrderOut = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
			if (result)
			{
				if (sortOrderOut >= 255) { sortOrderOut = 0; }
			}

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_medal_save"))
			{
				if (message == null) { message = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Varchar)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_hide", NpgsqlDbType.Boolean)).Value = hide;
				cmd.Parameters.Add(new NpgsqlParameter("i_onlyribbon", NpgsqlDbType.Boolean)).Value = onlyRibbon;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderOut;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}



		/// <summary>
		/// Deletes medal allocation to a user.
		/// </summary>
		/// <param name="userId">ID of user owning medal.</param>
		/// <param name="medalID">ID of medal.</param>
		static public void user_medal_delete(object userId, object medalID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="userId">ID of user who was given medal.</param>
		/// <param name="medalID">ID of medal to list.</param>
		static public DataTable user_medal_list(object userId, object medalID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_medal_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}


		/// <summary>
		/// Saves new or update existing user-medal allocation.
		/// </summary>
		/// <param name="userId">ID of user.</param>
		/// <param name="medalID">ID of medal.</param>
		/// <param name="message">Medal message, to override medal's default one. Can be null.</param>
		/// <param name="hide">Hide medal in user box.</param>
		/// <param name="onlyRibbon">Show only ribbon bar in user box.</param>
		/// <param name="sortOrder">Sort order in user box. Overrides medal's default sort order.</param>
		/// <param name="dateAwarded">Date when medal was awarded to a user. Is ignored when existing user-medal allocation is edited.</param>
		static public void user_medal_save(
			object userId, object medalID, object message,
			object hide, object onlyRibbon, object sortOrder, object dateAwarded)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_medal_save"))
			{
				if (message == null) { message = DBNull.Value; }
				if (dateAwarded == null) { dateAwarded = DBNull.Value; }
				if (sortOrder == null) { sortOrder = 0; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Varchar)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_hide", NpgsqlDbType.Boolean)).Value = hide;
				cmd.Parameters.Add(new NpgsqlParameter("i_onlyribbon", NpgsqlDbType.Boolean)).Value = onlyRibbon;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrder;
				cmd.Parameters.Add(new NpgsqlParameter("i_dateawarded", NpgsqlDbType.Timestamp)).Value = dateAwarded;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}


		/// <summary>
		/// Lists all medals held by user as they are to be shown in user box.
		/// </summary>
		/// <param name="userId">ID of user.</param>
		/// <returns>List of medals, ribbon bar only first.</returns>
		static public DataTable user_listmedals(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_listmedals"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		#endregion        
		
		#region yaf_NntpForum
        public static IEnumerable<TypedNntpForum> NntpForumList( int boardId, int? minutes, int? nntpForumID, bool? active)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("nntpforum_list"))
            {

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_minutes", NpgsqlDbType.Integer)).Value = minutes;
                cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
                cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(r => new TypedNntpForum(r));
            }
        }

        static public DataTable nntpforum_list( object boardId, object minutes, object nntpForumID, object active)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_list"))
			{
				if (minutes == null) { minutes = DBNull.Value; }
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }
				if (active == null) { active = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_minutes", NpgsqlDbType.Integer)).Value = minutes;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void nntpforum_update( object nntpForumID, object lastMessageNo, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_update"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_lastmessageno", NpgsqlDbType.Integer)).Value = lastMessageNo;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpforum_save( object nntpForumID, object nntpServerID, object groupName, object forumID, object active, object cutoffdate)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_save"))
			{
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;                

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupname", NpgsqlDbType.Varchar)).Value = groupName;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;
                cmd.Parameters.Add(new NpgsqlParameter("i_cutoffdate", NpgsqlDbType.Boolean)).Value = cutoffdate;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpforum_delete( object nntpForumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_NntpServer
        static public DataTable nntpserver_list( object boardId, object nntpServerID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_list"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (nntpServerID == null) { nntpServerID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
						  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void nntpserver_save( object nntpServerID, object boardId, object name, object address, object port, object userName, object userPass)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_save"))
			{
				if (nntpServerID == null) { nntpServerID = DBNull.Value; }
				if (userName == null) { userName = DBNull.Value; }
				if (userPass == null) { userPass = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_address", NpgsqlDbType.Varchar)).Value = address;
				cmd.Parameters.Add(new NpgsqlParameter("i_port", NpgsqlDbType.Integer)).Value = port;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;                
				cmd.Parameters.Add(new NpgsqlParameter("i_userpass", NpgsqlDbType.Varchar)).Value = userPass;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void nntpserver_delete( object nntpServerID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntpserver_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion        
		
		#region yaf_NntpTopic
        static public DataTable nntptopic_list( object thread)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntptopic_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_thread", NpgsqlDbType.Varchar)).Value = thread;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void nntptopic_savemessage(
            object nntpForumID, 
            object topic, 
            object body, 
            object userId, 
            object userName, 
            object ip, 
            object posted, 
            object externalMessageId, 
            object referenceMessageId)
		{
			// string newbody = body.ToString().Replace(@"&lt;br&gt;", "> ").Replace(@"&amp;lt;", "<").Replace(@"&lt;hr&gt;", "> ").Replace(@"&amp;quot;", @"""").Replace(@"&lt;", @"<").Replace(@"br&gt;", @"> ").Replace(@"&amp;gt;", @"> ").Replace(@"&gt;", "> ").Replace("&quot;", @"""").Replace("[-snip-]","(SNIP)").Replace(@"@","[dog]").Replace("_.","");
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("nntptopic_savemessage")) 
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topic", NpgsqlDbType.Varchar)).Value = topic;
				cmd.Parameters.Add(new NpgsqlParameter("i_body", NpgsqlDbType.Text)).Value = body;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;
				cmd.Parameters.Add(new NpgsqlParameter("i_posted", NpgsqlDbType.Timestamp)).Value = posted;
                cmd.Parameters.Add(new NpgsqlParameter("i_externalmessageid", NpgsqlDbType.Varchar)).Value = externalMessageId;
                cmd.Parameters.Add(new NpgsqlParameter("i_referencemessageid", NpgsqlDbType.Varchar)).Value = referenceMessageId;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion        
		
		#region yaf_PMessage
        static public DataTable pmessage_list(object userPMessageID)
        {
            return pmessage_list(null, null, userPMessageID);
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
		static public DataTable pmessage_list(object toUserID, object fromUserID, object userPMessageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_list"))
			{
				if (fromUserID == null) { fromUserID = DBNull.Value; }
				if (toUserID == null) { toUserID = DBNull.Value; }
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = toUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        /// <summary>
        /// Deletes the private message from the database as per the given parameter.  If fromOutbox is true,
        /// the message is only deleted from the user's outbox.  Otherwise, it is completely delete from the database.
        /// </summary>
        /// <param name="userPMessageID"></param>
        static public void pmessage_delete(object userPMessageID)
        {
            pmessage_delete(userPMessageID, false);
        }
		/// <summary>
		/// Deletes the private message from the database as per the given parameter.  If <paramref name="fromOutbox"/> is true,
		/// the message is only removed from the user's outbox.  Otherwise, it is completely delete from the database.
		/// </summary>
		/// <param name="pMessageID"></param>
		/// <param name="fromOutbox">If true, removes the message from the outbox.  Otherwise deletes the message completely.</param>
        static public void pmessage_delete( object userPMessageID, bool fromOutbox)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_delete"))
			{
				// if (fromOutbox != false || fromOutbox != true) { fromOutbox = false; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromoutbox", NpgsqlDbType.Boolean)).Value = fromOutbox;
				 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		
		/// <summary>
		/// Archives the private message of the given id.  Archiving moves the message from the user's inbox to his message archive.
		/// </summary>
		/// <param name="pMessageID">The ID of the private message</param>
        public static void pmessage_archive( object userPMessageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_archive"))
			{
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }
				
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public void pmessage_save( object fromUserID, object toUserID, object subject, object body, object Flags)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = toUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
				cmd.Parameters.Add(new NpgsqlParameter("i_body", NpgsqlDbType.Text)).Value = body;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = Flags;
						
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void pmessage_markread( object userPMessageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_markread"))
			{
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public DataTable pmessage_info()
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_info"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
        static public void pmessage_prune( object daysRead, object daysUnread)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pmessage_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_daysread", NpgsqlDbType.Integer)).Value = daysRead;
				cmd.Parameters.Add(new NpgsqlParameter("i_daysunread", NpgsqlDbType.Integer)).Value = daysUnread;
							   
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
        public static DataTable pollgroup_stats( int? pollGroupId)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_stats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
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
        public static int pollgroup_attach( int? pollGroupId, int? topicId, int? forumId, int? categoryId, int? boardId)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_attach"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
                cmd.Parameters.AddWithValue("i_topicid", topicId);
                cmd.Parameters.AddWithValue("i_forumid", forumId);
                cmd.Parameters.AddWithValue("i_categoryid", categoryId);
                cmd.Parameters.AddWithValue("i_boardid", boardId);
                return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
            }
        }

        static public DataTable poll_stats( int? pollId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("poll_stats"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollId;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// The method saves many questions and answers to them in a single transaction 
		/// </summary>
		/// <param name="pollList">List to hold all polls data</param>
		/// <returns>Last saved poll id.</returns>
        public static int? poll_save( List<PollSaveList> pollList)
		{
			int? currPoll;
            int? pollGroup = null;
			foreach (PollSaveList question in pollList)
			{
                StringBuilder pgStr = new StringBuilder();
                // Check if the group already exists
                    if (question.TopicId > 0)
                    {
                        pgStr.Append("select pollid  from ");
                        pgStr.Append(MsSqlDbAccess.GetObjectName("topic"));
                        pgStr.Append(" WHERE topicid = :i_topicid; ");
                    }
                    else if (question.ForumId > 0)
                    {
                        pgStr.Append("select  pollgroupid  from ");
                        pgStr.Append(MsSqlDbAccess.GetObjectName("forum"));
                        pgStr.Append(" WHERE forumid =:i_forumid");
                    }
                    else if (question.CategoryId > 0)
                    {
                        pgStr.Append("select pollgroupid  from ");
                        pgStr.Append(MsSqlDbAccess.GetObjectName("category"));
                        pgStr.Append(" WHERE categoryid = :i_categoryid");
                    }

                using (NpgsqlCommand cmdPg = MsSqlDbAccess.GetCommand(pgStr.ToString(), true))
				{    
                     // Add parameters
                    if (question.TopicId > 0)
                    {
                        cmdPg.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = question.TopicId;
                    }
                    else if (question.ForumId > 0)
                    {
                        cmdPg.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = question.ForumId;
                    }
                    else if(question.CategoryId > 0)
                    {
                        cmdPg.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = question.CategoryId;
                    }

                    object pgexist = MsSqlDbAccess.Current.ExecuteScalar(cmdPg, true);
                    if (pgexist != DBNull.Value)
                    {
                        pollGroup = Convert.ToInt32(pgexist);
                    }

				}
                // buck stops here
                    // the group doesn't exists, create a new one
                if (pollGroup == null)
			    {
			        pgStr = new StringBuilder();
                    pgStr.Append("INSERT INTO ");
                    pgStr.Append(MsSqlDbAccess.GetObjectName("pollgroupcluster"));
                    pgStr.Append("(userid,flags ) VALUES(:i_userid, :i_flags) RETURNING pollgroupid; ");
                    using (NpgsqlCommand cmdPgIns = MsSqlDbAccess.GetCommand(pgStr.ToString(), true))
                    {
                        // set poll group flags
                        int pollGroupFlags = 0;
                        if (question.IsBound)
                        {
                            pollGroupFlags = pollGroupFlags | 2;
                        }

                        // Add parameters
                        cmdPgIns.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = question.UserId;
                        cmdPgIns.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = pollGroupFlags;
                        pollGroup = (int?)MsSqlDbAccess.Current.ExecuteScalar(cmdPgIns, true);
                    }
                }

            
                
                
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("poll_save"))
				{
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.Add(new NpgsqlParameter("i_question", NpgsqlDbType.Varchar)).Value = question.Question;

					if (question.Closes > DateTime.MinValue)
					{
						cmd.Parameters.Add(new NpgsqlParameter("i_closes", NpgsqlDbType.TimestampTZ)).Value = question.Closes;
					}
					else
					{
						cmd.Parameters.Add(new NpgsqlParameter("i_closes", NpgsqlDbType.TimestampTZ)).Value = DBNull.Value;
					}
					     int pollFlags = question.IsClosedBound
                               ? 0 | 4
                                : 0;
                         pollFlags = question.AllowMultipleChoices
                                ? pollFlags | 8
                                : pollFlags;
                         pollFlags = question.ShowVoters
                                  ? pollFlags | 16
                                  : pollFlags;
                         pollFlags = question.AllowSkipVote
                                             ? pollFlags | 32
                                             : pollFlags;
                    cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = question.UserId;
                    cmd.Parameters.Add(new NpgsqlParameter("i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroup;
                    cmd.Parameters.Add(new NpgsqlParameter("i_objectpath", NpgsqlDbType.Varchar)).Value = question.QuestionObjectPath;
                    cmd.Parameters.Add(new NpgsqlParameter("i_mimetype", NpgsqlDbType.Varchar)).Value = question.QuestionMimeType;
                    cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = pollFlags;
                   

                    currPoll = (int?)MsSqlDbAccess.Current.ExecuteScalar(cmd);
				}

				
				// The cycle through question reply choices  
                int chl = question.Choice.GetUpperBound(1)+1;
                for (uint choiceCount = 0; choiceCount < chl; choiceCount++)
                {
                    if (question.Choice[0, choiceCount].Trim().Length > 0)
                    {
                        StringBuilder sbChoice = new StringBuilder();
                        sbChoice.Append("INSERT INTO ");
                        sbChoice.Append(MsSqlDbAccess.GetObjectName("choice"));
                        sbChoice.AppendFormat(
                            "(pollid,choice,votes,objectpath,mimetype) VALUES (:pollid{0}, :choice{0}, :votes{0}, :objectpath{0}, :mimetype{0}); ",
                            choiceCount);
                        using (NpgsqlCommand cmdChoice = MsSqlDbAccess.GetCommand(sbChoice.ToString(), true))
                            {
                                cmdChoice.Parameters.Add(new NpgsqlParameter(String.Format("pollid{0}", choiceCount),
                                                                  NpgsqlDbType.Integer)).Value = currPoll;
                                cmdChoice.Parameters.Add(new NpgsqlParameter(String.Format("choice{0}", choiceCount),
                                                                        NpgsqlDbType.Varchar)).Value =
                                    question.Choice[0, choiceCount];
                                cmdChoice.Parameters.Add(new NpgsqlParameter(String.Format("votes{0}", choiceCount),
                                                                        NpgsqlDbType.Integer)).Value = 0;
                                cmdChoice.Parameters.Add(new NpgsqlParameter(String.Format("objectpath{0}", choiceCount),
                                                                        NpgsqlDbType.Varchar)).Value =
                                    question.Choice[1, choiceCount].IsNotSet()
                                        ? String.Empty
                                        : question.Choice[1, choiceCount];
                                cmdChoice.Parameters.Add(new NpgsqlParameter(String.Format("mimetype{0}", choiceCount),
                                                                        NpgsqlDbType.Varchar)).Value =
                                    question.Choice[2, choiceCount].IsNotSet()
                                        ? String.Empty
                                        : question.Choice[2, choiceCount];
                                MsSqlDbAccess.Current.ExecuteNonQuery(cmdChoice, true);
                            }

                        }

                }
			    //   NpgsqlCommand cmd = new NpgsqlCommand();
				//  cmd.CommandText = paramSb.ToString() + ")" + sb.ToString();
				//   NpgsqlConnection con = MsSqlDbAccess.Current.GetConnectionManager().DBConnection;
				// con.Open();
				//  cmd.Connection = con;
				//   IDbTransaction trans = cmd.Connection.BeginTransaction();
				//    cmd.Transaction = trans;
				//    cmd.CommandText = sb.ToString();


				/* using (NpgsqlCommand cmd1 = MsSqlDbAccess.GetCommand(sb.ToString(), true))
				{


				    // Add parameters
				     cmd1.Parameters.Add(new NpgsqlParameter("question", NpgsqlDbType.Varchar));

					if (question.Closes > DateTime.MinValue)
					{
						cmd1.Parameters.Add(new NpgsqlParameter("closes", NpgsqlDbType.TimestampTZ));
					} 
				    for (uint choiceCount1 = 0; choiceCount1 < question.Choice.GetLength(0); choiceCount1++)
				    {
				        if (question.Choice[0, choiceCount1].Trim().Length > 0)
				        {
				            cmd1.Parameters.Add(new NpgsqlParameter(String.Format("choice{0}", choiceCount1),
				                                                    NpgsqlDbType.Varchar)).Value =
				                question.Choice[0, choiceCount1];
				            cmd1.Parameters.Add(new NpgsqlParameter(String.Format("votes{0}", choiceCount1),
				                                                    NpgsqlDbType.Integer)).Value = 0;
				            cmd1.Parameters.Add(new NpgsqlParameter(String.Format("objectpath{0}", choiceCount1),
				                                                    NpgsqlDbType.Varchar)).Value =
				                question.Choice[1, choiceCount1].IsNotSet() ? String.Empty : question.Choice[1, choiceCount1];
				            cmd1.Parameters.Add(new NpgsqlParameter(String.Format("mimetype{0}", choiceCount1),
				                                                    NpgsqlDbType.Varchar)).Value =
				                question.Choice[2, choiceCount1].IsNotSet() ? String.Empty : question.Choice[2, choiceCount1];
				        }
				    }
                     int? result = (int?)MsSqlDbAccess.Current.ExecuteNonQueryInt(cmd1, true);
				}
            */

                // Add pollgroup id to an object
                StringBuilder Usb = new StringBuilder();
                //cmd2.Parameters.Add(new NpgsqlParameter(":i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroup;
                if (question.TopicId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(MsSqlDbAccess.GetObjectName("topic"));
                    Usb.Append(" SET pollid = :i_pollid WHERE topicid= :i_topicid; ");
                }
                else if (question.ForumId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(MsSqlDbAccess.GetObjectName("forum"));
                    Usb.Append(" SET pollgroupid = :i_pollgroupid where forumid = :i_forumid; ");
                   
                }
                else if (question.CategoryId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(MsSqlDbAccess.GetObjectName("category"));
                    Usb.Append(" SET pollgroupid = :i_pollgroupid where categoryid = :i_categoryid; ");
                }

               
                using (NpgsqlCommand cmd2 = MsSqlDbAccess.GetCommand(Usb.ToString(), true))
                {
                    cmd2.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value =
                            pollGroup;
                    //cmd2.Parameters.Add(new NpgsqlParameter(":i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroup;
                    if (question.TopicId > 0)
                    {
                        cmd2.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value =
                                                  question.TopicId;
                    }
                    else if (question.ForumId > 0)
                    {
                        cmd2.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value =
                           question.ForumId;
                    }
                    else if (question.CategoryId > 0)
                    {
                       cmd2.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value
                     = question.CategoryId;
                    }
                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd2);
                }

				   
					/* if (ret.Value != DBNull.Value)
					 {
						 return (int?)ret.Value;
					 }*/

					//  }
					//   trans.Commit();
					//   con.Close();
                
			}

            return pollGroup;
		}


        static public void poll_update( object pollID, object question, object closes, object isBounded, bool isClosedBounded, bool allowMultipleChoices, bool showVoters, bool allowSkipVote, object questionPath, object questionMime)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("poll_update"))
			{
				if (closes == null) { closes = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollID;
				cmd.Parameters.Add(new NpgsqlParameter("i_question", NpgsqlDbType.Varchar)).Value = question;
				cmd.Parameters.Add(new NpgsqlParameter("i_closes", NpgsqlDbType.Timestamp)).Value = closes;
                cmd.Parameters.Add(new NpgsqlParameter("i_questionobjectpath", NpgsqlDbType.Varchar)).Value = questionPath;
                cmd.Parameters.Add(new NpgsqlParameter("i_questionmimetype", NpgsqlDbType.Varchar)).Value = questionMime;
                cmd.Parameters.Add(new NpgsqlParameter("i_isbounded", NpgsqlDbType.Boolean)).Value = isBounded;
                cmd.Parameters.Add(new NpgsqlParameter("i_isclosedbounded", NpgsqlDbType.Boolean)).Value = isClosedBounded;
                cmd.Parameters.Add(new NpgsqlParameter("i_allowmultiplechoices", NpgsqlDbType.Boolean)).Value = allowMultipleChoices;
                cmd.Parameters.Add(new NpgsqlParameter("i_showvoters", NpgsqlDbType.Boolean)).Value = showVoters;
                cmd.Parameters.Add(new NpgsqlParameter("i_allowskipvote", NpgsqlDbType.Boolean)).Value = allowSkipVote;
      				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public void poll_remove( object pollGroupID, object pollID, object boardId, bool removeCompletely, bool removeEverywhere)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("poll_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollID;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_removecompletely", NpgsqlDbType.Boolean)).Value = removeCompletely;
                cmd.Parameters.Add(new NpgsqlParameter("i_removeeverywhere", NpgsqlDbType.Boolean)).Value = removeEverywhere;

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
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

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
        public static void pollgroup_remove( object pollGroupID, object topicId, object forumId, object categoryId, object boardId, bool removeCompletely, bool removeEverywhere)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("pollgroup_remove"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroupID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_removecompletely", NpgsqlDbType.Boolean)).Value = removeCompletely;
                cmd.Parameters.Add(new NpgsqlParameter("i_removeeverywhere", NpgsqlDbType.Boolean)).Value = removeEverywhere;

                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }


        static public void choice_delete( object choiceID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("choice_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void choice_update( object choiceID, object choice, object path, object mime)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("choice_update"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
				cmd.Parameters.Add(new NpgsqlParameter("i_choice", NpgsqlDbType.Varchar)).Value = choice;
                cmd.Parameters.Add(new NpgsqlParameter("i_objectpath", NpgsqlDbType.Varchar)).Value =  path;
                cmd.Parameters.Add(new NpgsqlParameter("i_mimetype", NpgsqlDbType.Varchar)).Value =  mime;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void choice_add( object pollID, object choice, object path, object mime)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("choice_add"))
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollID; 
					  
				if (choice != null)
				{
					cmd.Parameters.Add(new NpgsqlParameter("i_choice", NpgsqlDbType.Varchar)).Value = choice;
								   }
				else
				{
					cmd.Parameters.Add(new NpgsqlParameter("i_choice", NpgsqlDbType.Varchar));
					cmd.Parameters[1].Value = "No input value supplied";
				}

                cmd.Parameters.Add(new NpgsqlParameter("i_objectpath", NpgsqlDbType.Varchar)).Value = path;
                cmd.Parameters.Add(new NpgsqlParameter("i_mimetype", NpgsqlDbType.Varchar)).Value = mime;
				
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd); 
			 }            
		}

		#endregion
		
		#region yaf_Rank
        static public DataTable rank_list( object boardId, object rankID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("rank_list"))
			{
				if (rankID == null) { rankID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
							  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        static public void rank_save( object rankID, object boardId, object name, 
			object isStart, object isLadder, object minPosts, object rankImage,
			object pmLimit, object style, object sortOrder,
			object description,
			object usrSigChars,
			object usrSigBBCodes,
			object usrSigHTMLTags,
			object usrAlbums,
			object usrAlbumImages)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("rank_save"))
			{
				if (rankImage == null) { rankImage = DBNull.Value; }
				if (minPosts.ToString() == "") { minPosts = 0; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_isstart", NpgsqlDbType.Boolean)).Value = isStart;
				cmd.Parameters.Add(new NpgsqlParameter("i_isladder", NpgsqlDbType.Boolean)).Value = isLadder;
				cmd.Parameters.Add(new NpgsqlParameter("i_minposts", NpgsqlDbType.Integer)).Value = minPosts;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankimage", NpgsqlDbType.Varchar)).Value = rankImage;
				cmd.Parameters.Add(new NpgsqlParameter("i_pmlimit", NpgsqlDbType.Integer)).Value = pmLimit;
				cmd.Parameters.Add(new NpgsqlParameter("i_style", NpgsqlDbType.Varchar)).Value = style;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrder;
				cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsigchars", NpgsqlDbType.Integer)).Value = usrSigChars;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsigbbcodes", NpgsqlDbType.Varchar)).Value = usrSigBBCodes;
				cmd.Parameters.Add(new NpgsqlParameter("i_usrsightmltags", NpgsqlDbType.Varchar)).Value = usrSigHTMLTags;
				cmd.Parameters.Add(new NpgsqlParameter("i_usralbums", NpgsqlDbType.Integer)).Value = usrAlbums;
				cmd.Parameters.Add(new NpgsqlParameter("i_usralbumimages", NpgsqlDbType.Integer)).Value = usrAlbumImages;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void rank_delete( object rankID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("rank_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_Smiley
        static public DataTable smiley_list( object boardId, object smileyID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_list"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
							 
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
        public static IEnumerable<TypedSmileyList> SmileyList( int boardId, int? smileyID)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(r => new TypedSmileyList(r));
            }
        }

        static public DataTable smiley_listunique( object boardId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_listunique"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void smiley_delete(object smileyID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_delete"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
											   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void smiley_save( object smileyID, object boardId, object code, object icon, object emoticon, object sortOrder, object replace)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_save"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }
				if (replace == null) { replace = 0; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_code", NpgsqlDbType.Varchar)).Value = code;
				cmd.Parameters.Add(new NpgsqlParameter("i_icon", NpgsqlDbType.Varchar)).Value = icon;
				cmd.Parameters.Add(new NpgsqlParameter("i_emoticon", NpgsqlDbType.Varchar)).Value = emoticon;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrder;
				cmd.Parameters.Add(new NpgsqlParameter("i_replace", NpgsqlDbType.Smallint)).Value = replace;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        static public void smiley_resort( object boardId, object smileyID, int move)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("smiley_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
				cmd.Parameters.Add(new NpgsqlParameter("i_move", NpgsqlDbType.Integer)).Value = move;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_BBCode
        /// <summary>
        /// The bbcode_list.
        /// </summary>
        /// <param name="boardID">
        /// The board id.
        /// </param>
        /// <param name="bbcodeID">
        /// The bbcode id.
        /// </param>
        /// <returns>
        /// </returns>
        [NotNull]
        public static IEnumerable<TypedBBCode> BBCodeList( int boardID, int? bbcodeID)
        {
            return bbcode_list(boardID, bbcodeID).AsEnumerable().Select(o => new TypedBBCode(o));
        }

        static public DataTable bbcode_list( object boardId, object bbcodeID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("bbcode_list"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_bbcodeid", NpgsqlDbType.Integer)).Value = bbcodeID;
							
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void bbcode_delete( object bbcodeID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("bbcode_delete"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_bbcodeid", NpgsqlDbType.Integer)).Value = bbcodeID;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void bbcode_save( object bbcodeID, object boardId, object name, object description, object onclickjs, object displayjs, object editjs, object displaycss, object searchregex, object replaceregex, object variables, object usemodule, object moduleclass, object execorder)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("bbcode_save"))
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

				cmd.Parameters.Add(new NpgsqlParameter("i_bbcodeid", NpgsqlDbType.Integer)).Value = bbcodeID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_onclickjs", NpgsqlDbType.Varchar)).Value = onclickjs;
				cmd.Parameters.Add(new NpgsqlParameter("i_displayjs", NpgsqlDbType.Text)).Value = displayjs;
				cmd.Parameters.Add(new NpgsqlParameter("i_editjs", NpgsqlDbType.Text)).Value = editjs;
				cmd.Parameters.Add(new NpgsqlParameter("i_displaycss", NpgsqlDbType.Text)).Value = displaycss;
				cmd.Parameters.Add(new NpgsqlParameter("i_searchregex", NpgsqlDbType.Text)).Value = searchregex;
				cmd.Parameters.Add(new NpgsqlParameter("i_replaceregex", NpgsqlDbType.Text)).Value = replaceregex;
				cmd.Parameters.Add(new NpgsqlParameter("i_variables", NpgsqlDbType.Varchar)).Value = variables;
				cmd.Parameters.Add(new NpgsqlParameter("i_usemodule", NpgsqlDbType.Boolean)).Value = Convert.ToBoolean(usemodule);
				cmd.Parameters.Add(new NpgsqlParameter("i_moduleclass", NpgsqlDbType.Varchar)).Value = moduleclass;
				cmd.Parameters.Add(new NpgsqlParameter("i_execorder", NpgsqlDbType.Integer)).Value = execorder;
			  
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
        static public DataTable registry_list( object name, object boardId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("registry_list"))
			{
				if (name == null) { name = DBNull.Value; }
				if (boardId == null) { boardId = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;


                return MsSqlDbAccess.Current.GetData(cmd);
			}
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
        /// Retrieves all the entries in the board settings registry
        /// </summary>
        /// <returns>DataTable filled will all registry entries</returns>
        static public DataTable registry_list()
        {
            return registry_list( null, null);
        }

        /// <summary>
        /// Saves a single registry entry pair to the database.
        /// </summary>
        /// <param name="Name">Unique name associated with this entry</param>
        /// <param name="Value">Value associated with this entry which can be null</param>
        static public void registry_save(object name, object value)
        {

            registry_save(name, value, DBNull.Value);

        }
		/// <summary>
		/// Saves a single registry entry pair to the database.
		/// </summary>
		/// <param name="Name">Unique name associated with this entry</param>
		/// <param name="Value">Value associated with this entry which can be null</param>
		/// <param name="BoardID">The BoardID for this entry</param>
        static public void registry_save( object name, object value, object boardId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("registry_save"))
			{
				if (value == null) { value = DBNull.Value; }
				if (boardId == null) { boardId = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_value", NpgsqlDbType.Varchar)).Value = value;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("system_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion
		
		#region yaf_Topic

		//TODO: Overloaded method for 1.9.3 FINAL comatability should be deleted beginning with v.2373
		static public int topic_prune(object forumID, object days)
		{
			int boardId = 0;
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand(String.Format("SELECT c.boardid FROM {0} f INNER JOIN {1} c ON f.categoryid=c.categoryd  WHERE forumid = @i_forumID;", MsSqlDbAccess.GetObjectName("Forum"), MsSqlDbAccess.GetObjectName("Category")), true))
			{

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
				boardId = Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}
            
			return topic_prune(boardId, forumID, days, true);

		}

        public static void topic_updatetopic(int topicId, string topic)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_updatetopic"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new NpgsqlParameter("i_topic", NpgsqlDbType.Varchar)).Value = topic;
                
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }

		static public int topic_prune(object boardId, object forumID, object days, object permDelete)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_days", NpgsqlDbType.Integer)).Value = days;
				cmd.Parameters.Add(new NpgsqlParameter("i_permdelete", NpgsqlDbType.Boolean)).Value = Convert.ToBoolean(permDelete);
							  
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
                if (sinceDate == null) { sinceDate = DBNull.Value; }

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID; ;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.Timestamp)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.Timestamp)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_showmoved", NpgsqlDbType.Boolean)).Value = showMoved;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        public static DataTable announcements_list( [NotNull] object forumID, [NotNull] object userId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [NotNull] object showMoved, [CanBeNull]bool findLastRead)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("announcements_list"))
            {
                if (userId == null) { userId = DBNull.Value; }
                if (sinceDate == null) { sinceDate = DBNull.Value; }

                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID; ;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.Timestamp)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.Timestamp)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_showmoved", NpgsqlDbType.Boolean)).Value = showMoved;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary>
		/// Lists topics very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
		static public DataTable topic_simplelist(int StartID, int Limit)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
			 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void topic_move(object topicID, object forumID, object showMoved)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_showmoved", NpgsqlDbType.Boolean)).Value = showMoved;
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public DataTable topic_announcements(object boardId, object numOfPostsToRetrieve, object pageUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_announcements"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
			  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        static public DataTable topic_latest( object boardID, object numOfPostsToRetrieve, object pageUserId, bool useStyledNicks, bool showNoCountPosts, bool findLastRead)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_latest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;
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
        public static DataTable rss_topic_latest( object boardId, object numOfPostsToRetrieve, object pageUserId, bool useStyledNicks, bool showNoCountPosts)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("rss_topic_latest"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
             
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        public static DataTable topic_active([NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_active"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.TimestampTZ)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.TimestampTZ)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        static private void topic_deleteAttachments( object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_listmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
			   
				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					foreach (DataRow row in dt.Rows)
					{
                        message_deleteRecursively( row["MessageID"], true, "", 0, true, false);
					}
				}
			}
		}

  
        static public void topic_delete( object topicID)
        {
            topic_delete( topicID, false);
        }

		static public void topic_delete(object topicID, object eraseTopic)
		{
            topic_deleteAttachments( topicID);
		  
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_delete"))
			{
				//if (op == null) { smileyID = DBNull.Value; }
				if (eraseTopic == null) { eraseTopic = 0; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_updatelastpost", NpgsqlDbType.Boolean)).Value = true;
				cmd.Parameters.Add(new NpgsqlParameter("i_erasetopic", NpgsqlDbType.Boolean)).Value = eraseTopic;
					   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public DataTable topic_findprev(object topicID)
		{
			DataTable dt;
			DataRow dr;
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_findprev"))
			{               
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
					
					dt = MsSqlDbAccess.Current.GetData(cmd);
					dr = dt.Rows[0];
					if (dt.Rows[0][0] == DBNull.Value) 
					{
						return new DataTable();
					}

					return dt;               
			}
		}
		static public DataTable topic_findnext(object topicID)
		{
			DataTable dt;
			DataRow dr;
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_findnext"))
			{ 
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
			  
				dt = MsSqlDbAccess.Current.GetData(cmd);
				dr = dt.Rows[0];
				if (dt.Rows[0][0] == DBNull.Value)             
				{
		 
					return new DataTable();
				}

				return dt;     
			}
		}
		static public void topic_lock(object topicID, object locked)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_lock"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_locked", NpgsqlDbType.Boolean)).Value = locked;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public long topic_save(
            
            object forumID, 
            object subject, 
            object status,
            object styles, 
            object description, 
            object message, 
            object userId, 
            object priority,
            object userName, 
            object ip, 
            object posted, 
            object blogPostID, 
            object flags, 
            ref long messageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
                cmd.Parameters.Add(new NpgsqlParameter("i_status", NpgsqlDbType.Varchar)).Value = status;
                cmd.Parameters.Add(new NpgsqlParameter("i_styles", NpgsqlDbType.Varchar)).Value = styles;
                cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Varchar)).Value = description;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Text)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_priority", NpgsqlDbType.Smallint)).Value = priority;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;				
				cmd.Parameters.Add(new NpgsqlParameter("i_posted", NpgsqlDbType.Timestamp)).Value = posted;
				cmd.Parameters.Add(new NpgsqlParameter("i_blogpostid", NpgsqlDbType.Varchar)).Value = blogPostID;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags; 
			   
				DataTable dt = MsSqlDbAccess.Current.GetData(cmd);
				messageID = long.Parse(dt.Rows[0]["MessageID"].ToString());
				return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}
		static public DataRow topic_info(object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_info"))
			{
				//if (op == null) { smileyID = DBNull.Value; }
				if (topicID == null) { topicID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_showdeleted", NpgsqlDbType.Boolean)).Value = false;
							   
				using (DataTable dt = MsSqlDbAccess.Current.GetData(cmd))
				{
					if (dt.Rows.Count > 0)
						return dt.Rows[0];
					else
						return null;
				}
			}
		}

        public static int topic_findduplicate(object topicName)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_findduplicate"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicname", NpgsqlDbType.Varchar)).Value = topicName;
                return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

            }
        }
        public static DataTable topic_favorite_details([NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_favorite_details"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.TimestampTZ)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.TimestampTZ)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;

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
		public static DataTable topic_favorite_list(object userID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_favorite_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_favorite_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
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
		public static void topic_favorite_add(object userID, object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_favorite_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
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
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("topic_favorite_count"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid",  NpgsqlDbType.Integer)).Value = topicId;

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
        /// <param name="pageUserId">
        /// The page user id.
        /// </param>
        /// <param name="sinceDate">
        /// The since.
        /// </param>
        /// <param name="categoryId">
        /// The category id.
        /// </param>
        /// <param name="useStyledNicks">
        /// Set to true to get color nicks for last user and topic starter.
        /// </param>
        /// <param name="findLastRead">
        /// Indicates if the Table should Countain the last Access Date
        /// </param>
        /// <returns>
        /// Returns the List with the Active Topics
        /// </returns>
        public static DataTable topic_unanswered([NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_unanswered"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.TimestampTZ)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.TimestampTZ)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;
                
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        public static DataTable topic_unread([NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topic_unread"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.TimestampTZ)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.TimestampTZ)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// Gets all topics where the pageUserid has posted
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
        /// The since.
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
        public static DataTable Topics_ByUser([NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("topics_byuser"))
            {
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_sincedate", NpgsqlDbType.TimestampTZ)).Value = sinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_todate", NpgsqlDbType.TimestampTZ)).Value = toDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;
                
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
                    cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
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
                cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
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
                cmd.Parameters.Add("i_BoardID", NpgsqlDbType.Integer).Value = boardID;
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

                    cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
                    cmd.Parameters.Add("i_BoardID", NpgsqlDbType.Integer).Value = boardID;
                    cmd.Parameters.Add("i_TopicStatusName", NpgsqlDbType.Varchar).Value = topicStatusName;
                    cmd.Parameters.Add("i_DefaultDescription", NpgsqlDbType.Varchar).Value = defaultDescription;

                    MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
                }
            }
            catch
            {
                // Ignore any errors in this method
            }
        }
		#endregion
	  
		#region yaf_ReplaceWords
		// rico : replace words / begin
		/// <summary>
		/// Gets a list of replace words
		/// </summary>
		/// <returns>DataTable with replace words</returns>
        static public DataTable replace_words_list( object boardId, object id)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("replace_words_list"))
			{
				if (id == null) { id = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		/// <summary>
		/// Saves changs to a words
		/// </summary>
		/// <param name="id">ID of bad/good word</param>
		/// <param name="badword">bad word</param>
		/// <param name="goodword">good word</param>
        static public void replace_words_save( object boardId, object id, object badword, object goodword)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("replace_words_save"))
			{
				if (id == null) { id = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;  
				cmd.Parameters.Add(new NpgsqlParameter("i_badword", NpgsqlDbType.Varchar)).Value = badword;
				cmd.Parameters.Add(new NpgsqlParameter("i_goodword", NpgsqlDbType.Varchar)).Value = goodword;
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Deletes a bad/good word
		/// </summary>
		/// <param name="ID">ID of bad/good word to delete</param>
        static public void replace_words_delete( object id)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("replace_words_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_IgnoreUser

		static public void user_addignoreduser(object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_addignoreduser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public void user_removeignoreduser(object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_removeignoreduser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public bool user_isuserignored(object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_isuserignored"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;
				cmd.Parameters.Add("result", NpgsqlDbType.Boolean);
				cmd.Parameters["result"].Direction = ParameterDirection.ReturnValue;
								
				return Convert.ToBoolean(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}
		}

		static public DataTable user_ignoredlist(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_ignoredlist"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

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
	public static DataRow user_lazydata(object userID, object boardID, bool showPendingMails, bool showPendingBuddies, bool showUnreadPMs, bool showUserAlbums, bool styledNicks)
	{
		using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_lazydata"))
		{
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
			cmd.Parameters.Add(new NpgsqlParameter("i_boardid",NpgsqlDbType.Integer)).Value =  boardID;
			cmd.Parameters.Add(new NpgsqlParameter("i_showpendingmails", NpgsqlDbType.Boolean)).Value = showPendingMails;
			cmd.Parameters.Add(new NpgsqlParameter("i_showpendingbuddies", NpgsqlDbType.Boolean)).Value = showPendingBuddies;
			cmd.Parameters.Add(new NpgsqlParameter("i_showunreadpms", NpgsqlDbType.Boolean)).Value = showUnreadPMs;
			cmd.Parameters.Add(new NpgsqlParameter("i_showuseralbums", NpgsqlDbType.Boolean)).Value = showUserAlbums;
			cmd.Parameters.Add(new NpgsqlParameter("i_showuserstyle", NpgsqlDbType.Boolean)).Value = styledNicks;
			return MsSqlDbAccess.Current.GetData(cmd).Rows[0];
		}
	}


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
		static public DataTable user_list(object boardId, object userId, object approved, object groupID, object rankID, object useStyledNicks)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
				if (approved == null) { approved = DBNull.Value; }
				if (groupID == null) { groupID = DBNull.Value; }
				if (rankID == null) { rankID = DBNull.Value; }
				if (useStyledNicks == null) { useStyledNicks = DBNull.Value; }
				


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean)).Value = approved;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
				  
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
        [NotNull]
        public static IEnumerable<TypedUserList> UserList(int boardId, int? userId, bool? approved, int? groupID, int? rankID, bool? useStyledNicks)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_list"))
            {
               // if (userId == null) { userId = DBNull.Value; }
               // if (approved == null) { approved = DBNull.Value; }
               // if (groupID == null) { groupID = DBNull.Value; }
              // if (rankID == null) { rankID = DBNull.Value; }
              //  if (useStyledNicks == null) { useStyledNicks = DBNull.Value; }

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean)).Value = approved;
                cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
                cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;           

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(x => new TypedUserList(x));
            }
        }
       
          /// <summary>
        /// The user_ list with todays birthdays.
        /// </summary>
        /// <param name="boardID">
        /// The board id.
        /// </param>
        /// <param name="useStyledNicks">
        /// Return style info.
        /// </param>
        /// <returns>
        /// The user_ list with todays birthdays.
        /// </returns>
        public static DataTable User_ListTodaysBirthdays( [NotNull] object boardID, [CanBeNull] object useStyledNicks)
        {
            // Profile columns cannot yet exist when we first are gettinng data.
            try
            {
                var sqlBuilder = new StringBuilder("SELECT up.Birthday, up.UserID, u.TimeZone, u.name as UserName,u.DisplayName, (case(:i_stylednicks) when TRUE then  COALESCE(( SELECT f.Style FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("usergroup"));
                sqlBuilder.Append(" e join ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Group"));
                sqlBuilder.Append(" f on f.groupid=e.groupid WHERE e.UserID=u.UserID AND LENGTH(f.style) > 2 ORDER BY f.sortorder LIMIT 1), r.Style) else '' end) AS Style ");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("userprofile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("user"));
                sqlBuilder.Append(" u ON u.userid = up.userid JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Rank"));
                sqlBuilder.Append(" r ON r.rankid = u.rankid where extract(day  from up.Birthday) = extract(day  from :i_currentdate) and extract(month  from up.Birthday) = extract(month  from :i_currentdate);");
                using (var cmd = MsSqlDbAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value = useStyledNicks;
                    cmd.Parameters.Add("i_currentdate", NpgsqlDbType.TimestampTZ).Value = DateTime.UtcNow;

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
                var sqlBuilder = new StringBuilder(" ");
                sqlBuilder.Append("SELECT up.*, u.Name as UserName,u.DisplayName,(case(:StyledNicks) when 1 then  COALESCE(( SELECT f.Style FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserGroup"));
                sqlBuilder.Append(" e join ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Group"));
                sqlBuilder.Append(" f on f.GroupID=e.GroupID WHERE e.UserID=u.UserID AND LEN(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), r.Style) else '' end) AS Style");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("UserProfile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("User"));
                sqlBuilder.Append(" u ON u.UserID = up.UserID JOIN ");
                sqlBuilder.Append(MsSqlDbAccess.GetObjectName("Rank"));
                sqlBuilder.AppendFormat(" r ON r.RankID = u.RankID where UserID IN ({0})  ", stIds);
                using (var cmd = MsSqlDbAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value = useStyledNicks;
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
                LegacyDb.SetProfileProperties(boardId, appname, userId, collection, spc, dirtyOnly);
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
                var cmd = new NpgsqlCommand();

                cmd.Connection = conn;

                string table = MsSqlDbAccess.GetObjectName("UserProfile");
                StringBuilder sqlCommand = new StringBuilder("SELECT 1 FROM ").Append(table);
                sqlCommand.Append(" WHERE UserID = :UserID AND ApplicationName = :ApplicationName");
                cmd.Parameters.Add("UserID",NpgsqlDbType.Integer).Value= userID;
                cmd.Parameters.Add("ApplicationName", NpgsqlDbType.Varchar).Value = appName;
                cmd.CommandText = sqlCommand.ToString();
                cmd.CommandType = CommandType.Text;

                object o = cmd.ExecuteScalar();
                int dd;

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
                        string valueParam = ":Value" + count;
                        valueStr.Append(valueParam);
                        cmd.Parameters.AddWithValue(valueParam, values[column.Settings.Name].PropertyValue);

                        if ((column.DataType != NpgsqlDbType.Timestamp) || column.Settings.Name != "LastUpdatedDate" || column.Settings.Name != "LastActivity")
                        {
                            if (count > 0)
                            {
                                setStr.Append(",");
                            }

                            setStr.Append(column.Settings.Name);
                            setStr.Append("=");
                            setStr.Append(valueParam);
                        }
                        else
                        {
                            
                        }

                        count++;
                    }
                }

                columnStr.Append(",LastUpdatedDate ");
                valueStr.Append(",:LastUpdatedDate");
                setStr.Append(",LastUpdatedDate=:LastUpdatedDate");
                cmd.Parameters.Add("LastUpdatedDate",NpgsqlDbType.TimestampTZ).Value = DateTime.UtcNow;

                // MembershipUser mu = System.Web.Security.Membership.GetUser(userID);

                columnStr.Append(",LastActivity ");
                valueStr.Append(",:LastActivity");
                setStr.Append(",LastActivity=:LastActivity");
                cmd.Parameters.Add("LastActivity", NpgsqlDbType.TimestampTZ).Value = DateTime.UtcNow; 

                columnStr.Append(",ApplicationName ");
                valueStr.Append(",:ApplicationName");
                setStr.Append(",ApplicationName=:ApplicationName");
               
                columnStr.Append(",IsAnonymous ");
                valueStr.Append(",:IsAnonymous");
                setStr.Append(",IsAnonymous=:IsAnonymous");
                cmd.Parameters.AddWithValue("IsAnonymous", 0);
                cmd.Parameters.Add("IsAnonymous", NpgsqlDbType.Boolean).Value = false; 

                columnStr.Append(",UserName ");
                valueStr.Append(",:UserName");
                setStr.Append(",UserName=:UserName");
                cmd.Parameters.Add("UserName",NpgsqlDbType.Varchar).Value = userName;
                // the user  exists. 
                sqlCommand.Clear();
                if (o != null && int.TryParse(o.ToString(), out dd))
                {
                    sqlCommand.Append("UPDATE ").Append(table).Append(" SET ").Append(setStr.ToString());
                    sqlCommand.Append(" WHERE UserID = ").Append(userID.ToString()).Append("");
                }
                else
                {
                    sqlCommand.Append("INSERT INTO ").Append(table).Append(" (UserID").Append(columnStr.ToString());
                    sqlCommand.Append(") VALUES (").Append(userID.ToString()).Append("").Append(valueStr.ToString()).Append(
                      ")");
                }
               

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
            string sql = @"SELECT * FROM {0} LIMIT 1".FormatWith(MsSqlDbAccess.GetObjectName("UserProfile"));

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
        public static void AddProfileColumn([NotNull] string name, NpgsqlDbType columnType, int size)
        {
            // get column type...
            string type = columnType.ToString();

            if (size > 0)
            {
                type += "(" + size + ")";
            }

            string sql = "ALTER TABLE {0} ADD {1} {2}".FormatWith(
              MsSqlDbAccess.GetObjectName("userprofile"), name, type);

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
        private static bool GetDbTypeAndSizeFromString(string providerData, out NpgsqlTypes.NpgsqlDbType dbType, out int size)
        {
            size = -1;
            dbType = NpgsqlTypes.NpgsqlDbType.Varchar;

            if (String.IsNullOrEmpty(providerData))
            {
                return false;
            }

            // split the data
            string[] chunk = providerData.Split(new char[] { ';' });

            // first item is the column name...
            string columnName = chunk[0];
            // vzrus addon convert values from mssql types...
            if (chunk[1].IndexOf("varchar") >= 0)
            { chunk[1] = "Varchar"; }
            if (chunk[1].IndexOf("int") >= 0)
            { chunk[1] = "Integer"; }
            if (chunk[1].IndexOf("DateTime") >= 0)
            { chunk[1] = "Timestamp"; }


            // get the datatype and ignore case...
            dbType = (NpgsqlTypes.NpgsqlDbType)Enum.Parse(typeof(NpgsqlTypes.NpgsqlDbType), chunk[1], true);

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

        static List<SettingsPropertyColumn> LoadFromPropertyValueCollection( SettingsPropertyValueCollection collection)
        {
            List<SettingsPropertyColumn> settingsColumnsList = new List<SettingsPropertyColumn>();
            // clear it out just in case something is still in there...


            // validiate all the properties and populate the internal settings collection
            foreach (SettingsPropertyValue value in collection)
            {
                NpgsqlDbType dbType;
                int size;

                // parse custom provider data...
                GetDbTypeAndSizeFromString(
                   value.Property.Attributes["CustomProviderData"].ToString(), out dbType, out size);

                // default the size to 256 if no size is specified
                if (dbType == NpgsqlDbType.Varchar && size == -1)
                {
                    size = 256;
                }

                settingsColumnsList.Add(new SettingsPropertyColumn(value.Property, dbType, size));
            }

            // sync profile table structure with the db...
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
        public static DataTable admin_list( int? boardId, object useStyledNicks)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("admin_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

        /// <summary>
        /// The user_list20members.
        /// </summary>
        /// <param name="boardId">
        /// The board id.
        /// </param>
        /// <param name="userId">
        /// The user id.
        /// </param>
        /// <param name="approved">
        /// The approved.
        /// </param>
        /// <param name="groupId">
        /// The group id.
        /// </param>
        /// <param name="rankId">
        /// The rank id.
        /// </param>
        /// <param name="useStyledNicks">
        /// Return style info.
        /// </param>
        /// <param name="lastUserId">
        /// The last user Id.
        /// </param>
        /// <param name="literals">
        /// The literals.
        /// </param>
        /// <param name="exclude">
        /// The exclude.
        /// </param>
        /// <param name="beginsWith">
        /// The begins with.
        /// </param>
        /// <param name="pageIndex">
        /// The page index.
        /// </param>
        /// <param name="pageSize">
        /// The page size.
        /// </param>
        /// <returns>
        /// </returns>
        public static DataTable user_listmembers(
            object boardId,
            object userId,
            object approved,
            object groupId,
            object rankId,
            object useStyledNicks,
            object lastUserId,
            object literals,
            object exclude,
            object beginsWith,
            object pageIndex,
            object pageSize,
            object sortName,
            object sortRank,
            object sortJoined,
            object sortPosts,
            object sortLastVisit,
            object numPosts,
            object numPostCompare)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_listmembers"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean)).Value = approved;
                cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupId;
                cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankId;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_literals", NpgsqlDbType.Varchar)).Value = literals.ToString() != "\0" && literals.ToString().IsSet() ? literals : string.Empty;
                cmd.Parameters.Add(new NpgsqlParameter("i_exclude", NpgsqlDbType.Boolean)).Value = exclude;
                cmd.Parameters.Add(new NpgsqlParameter("i_beginswith", NpgsqlDbType.Boolean)).Value =  beginsWith;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_sortname", NpgsqlDbType.Integer)).Value = sortName.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_sortrank", NpgsqlDbType.Integer)).Value = sortRank.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_sortjoined", NpgsqlDbType.Integer)).Value = sortJoined.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_sortposts", NpgsqlDbType.Integer)).Value = sortPosts.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_sortlastvisit", NpgsqlDbType.Integer)).Value = sortLastVisit.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numPosts.ToType<int>();
                cmd.Parameters.Add(new NpgsqlParameter("i_numpostcopmate", NpgsqlDbType.Integer)).Value = numPostCompare.ToType<int>();

                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		/// <summary>
		/// For URL Rewriting
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
		static public DataTable user_simplelist(int StartID, int Limit)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
							 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void user_delete(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_setrole(int boardId, object providerUserKey, object role)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_setrole"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
				cmd.Parameters.Add(new NpgsqlParameter("i_role", NpgsqlDbType.Varchar)).Value = role;
						
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		// TODO: is not used anywhere? 
		static public void user_setinfo(int boardId, System.Web.Security.MembershipUser user)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("update {databaseOwner}.{objectQualifier}User set Name=i_UserName,Email=i_Email where BoardID=i_BoardID and ProviderUserKey=i_ProviderUserKey", true))
			{
				cmd.CommandType = CommandType.Text;

				cmd.Parameters.Add(new NpgsqlParameter("i_UserName", NpgsqlDbType.Varchar)).Value = user.UserName;
				cmd.Parameters.Add(new NpgsqlParameter("i_Email", NpgsqlDbType.Varchar)).Value = user.Email;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ProviderUserKey", NpgsqlDbType.Varchar)).Value = user.ProviderUserKey;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
        /// <summary>
        /// The user_setnotdirty.
        /// </summary>
        /// <param name="boardId">
        /// The board id.
        /// </param>
        /// <param name="userId">
        /// The userId key.
        /// </param>
        public static void user_setnotdirty(int boardId, int userId)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("user_setnotdirty"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }
		static public void user_migrate(object userId, object providerUserKey, object updateProvider)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_migrate"))
			{
				if (providerUserKey == null) { providerUserKey = DBNull.Value; }
				if (updateProvider == null) { updateProvider = DBNull.Value; }
				//if (date == null) { date = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey; 
				cmd.Parameters.Add(new NpgsqlParameter("i_updateprovider", NpgsqlDbType.Boolean)).Value = updateProvider;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_deleteold(object boardId, object days)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_deleteold"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_days", NpgsqlDbType.Integer)).Value = days;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_approve(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_approveall(object boardId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_approveall"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_suspend(object userId, object suspend)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_suspend"))
			{
				if (suspend == null) { suspend = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_suspend", NpgsqlDbType.Timestamp)).Value = suspend;
			   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Returns data about allowed signature tags and character limits
		/// </summary>
		/// <param name="userID">The userID</param>
		/// <param name="boardID">The boardID</param>
		/// <returns>Data Table</returns>
		public static DataTable user_getsignaturedata(object userID, object boardID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getsignaturedata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		/// <summary>
		/// Returns data about albums: allowed number of images and albums
		/// </summary>
		/// <param name="userID">The userID</param>
		/// <param name="boardID">The boardID</param>  
		public static DataTable user_getalbumsdata(object userID, object boardID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getalbumsdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				DataTable dt = MsSqlDbAccess.Current.GetData(cmd);
				return dt;
			}
		}
		static public bool user_changepassword(object userId, object oldPassword, object newPassword)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_changepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_oldpassword", NpgsqlDbType.Varchar)).Value = oldPassword;
				cmd.Parameters.Add(new NpgsqlParameter("i_newpassword", NpgsqlDbType.Varchar)).Value = newPassword;

				return (bool)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

		static public DataTable user_pmcount(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_pmcount"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
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

                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                var messageCount = (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);

                return messageCount > 0;
            }
        }
		static public void user_save(
            object userId, 
            object boardId, 
            object userName,
            object displayName, 
            object email,
            object timeZone,
            object languageFile,
            object culture,
            object themeFile,
            object useSingleSignOn,
            object textEditor,
            object overrideDefaultThemes,
            object approved,
            object pmNotification,
            object autoWatchTopics,
            object dSTUser,
            object isHidden,
            object notificationType)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_save"))
			{
				if (userName == null) { userName = DBNull.Value; }
				if (email == null) { email = DBNull.Value; }
				if (languageFile == null) { languageFile = DBNull.Value; }
				if (themeFile == null) { themeFile = DBNull.Value; }
				if (overrideDefaultThemes == null) { overrideDefaultThemes = DBNull.Value; }
				if (approved == null) { approved = DBNull.Value; }
				if (pmNotification == null) { pmNotification = DBNull.Value; }
				if (culture == null) { culture = DBNull.Value; }
				if (dSTUser == null) { dSTUser = DBNull.Value; }
				if (isHidden == null) { isHidden = DBNull.Value; }                                

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
				cmd.Parameters.Add(new NpgsqlParameter("i_timezone", NpgsqlDbType.Integer)).Value = timeZone;
				cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value = languageFile;
                cmd.Parameters.Add(new NpgsqlParameter("i_culture", NpgsqlDbType.Varchar)).Value = culture;
				cmd.Parameters.Add(new NpgsqlParameter("i_themefile", NpgsqlDbType.Varchar)).Value = themeFile;
                cmd.Parameters.Add(new NpgsqlParameter("i_usesinglesignon",  NpgsqlDbType.Boolean)).Value = useSingleSignOn; 
                cmd.Parameters.Add(new NpgsqlParameter("i_texteditor", NpgsqlDbType.Varchar)).Value = textEditor;
				cmd.Parameters.Add(new NpgsqlParameter("i_overridedefaulttheme", NpgsqlDbType.Boolean)).Value = overrideDefaultThemes;
				cmd.Parameters.Add(new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean)).Value = approved;
				cmd.Parameters.Add(new NpgsqlParameter("i_pmnotification", NpgsqlDbType.Boolean)).Value = pmNotification;
                cmd.Parameters.Add(new NpgsqlParameter("i_notificationtype", NpgsqlDbType.Integer)).Value = notificationType;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = DBNull.Value;
				cmd.Parameters.Add(new NpgsqlParameter("i_autowatchtopics", NpgsqlDbType.Boolean)).Value = autoWatchTopics;
				cmd.Parameters.Add(new NpgsqlParameter("i_dstuser", NpgsqlDbType.Boolean)).Value = dSTUser;
				cmd.Parameters.Add(new NpgsqlParameter("i_hideuser", NpgsqlDbType.Boolean)).Value = isHidden;
               

				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			   
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
              object userId,
              object pmNotification,
              object autoWatchTopics,
              object notificationType,
              object dailyDigest)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_savenotification"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pmnotification", NpgsqlDbType.Boolean)).Value = pmNotification;
                cmd.Parameters.Add(new NpgsqlParameter("i_autowatchtopics", NpgsqlDbType.Boolean)).Value = autoWatchTopics;
                cmd.Parameters.Add(new NpgsqlParameter("i_notificationtype", NpgsqlDbType.Integer)).Value = notificationType;
                cmd.Parameters.Add(new NpgsqlParameter("i_dailydigest", NpgsqlDbType.Boolean)).Value = dailyDigest;
              
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }

		static public void user_adminsave
			(object boardId, object userId, object name, object displayName, object email, object flags, object rankID)
		{

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_adminsave"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
                cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public DataTable user_emails(object boardId, object groupID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_emails"))
			{

				if (groupID == null) { groupID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
			   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public DataTable user_accessmasks(object boardId, object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_accessmasks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
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
			userforumaccess_sort_list_recursive(dv.ToTable(), listDestination, parentID, categoryID, startingIndent);
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

		static public object user_recoverpassword(object boardId, object userName, object email)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_recoverpassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
							   
				return MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}
		static public void user_savepassword(object userId, object password)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_savepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(password.ToString(), "md5");
							
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public object user_login(object boardId, object name, object password)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_login"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = password;
			   
				return MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}
		static public DataTable user_avatarimage(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_avatarimage"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
			  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		static public int user_get(int boardId, object providerUserKey)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_get"))
			{
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
							   
				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToType<int>();
				//return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        /// <summary>
        /// The UserFind.
        /// </summary>
        /// <param name="boardID">
        ///   The board id.
        /// </param>
        /// <param name="filter">
        ///   The filter.
        /// </param>
        /// <param name="userName">
        ///   The user name.
        /// </param>
        /// <param name="email">
        ///   The email.
        /// </param>
        /// <param name="displayName"></param>
        /// <param name="notificationType"></param>
        /// <param name="dailyDigest"></param>
        /// <returns>
        /// </returns>
        public static IEnumerable<TypedUserFind> UserFind(int boardId, bool filter, string userName, string email, string displayName, object notificationType, object dailyDigest)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_find"))
            {
               // if (userName == null) { userName = DBNull.Value; }
               // if (email == null) { email = DBNull.Value; }


                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_filter", NpgsqlDbType.Boolean)).Value = filter;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
                cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName;
                cmd.Parameters.Add(new NpgsqlParameter("i_notificationtype", NpgsqlDbType.Integer)).Value = notificationType;
                cmd.Parameters.Add(new NpgsqlParameter("i_dailydigest", NpgsqlDbType.Boolean)).Value = dailyDigest;

                return MsSqlDbAccess.Current.GetData(cmd).AsEnumerable().Select(u => new TypedUserFind(u));
            }
        }
		static public string user_getsignature(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getsignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				return MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();
			}
		}
		static public void user_savesignature(object userId, object signature)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_savesignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_signature", NpgsqlDbType.Text)).Value = signature;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_saveavatar(object userId, object avatar, System.IO.Stream stream, object avatarImageType)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_saveavatar"))
			{
				byte[] data = null;

				if (stream != null)
				{
					if (avatar == null) { avatar = DBNull.Value; }
					if (data == null) { data = null; }


					data = new byte[stream.Length];
					stream.Seek(0, System.IO.SeekOrigin.Begin);
					stream.Read(data, 0, (int)stream.Length);
				}
				if (avatar == null) { avatar = DBNull.Value; }
				//if (data == null) { data = new byte[](); }
				if (avatarImageType == null) { avatarImageType = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_avatar", NpgsqlDbType.Varchar)).Value = avatar;
				cmd.Parameters.Add(new NpgsqlParameter("i_avatarimage", NpgsqlDbType.Bytea)).Value = data;
				cmd.Parameters.Add(new NpgsqlParameter("i_avatarimagetype", NpgsqlDbType.Varchar)).Value = avatarImageType;
						 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void user_deleteavatar(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_deleteavatar"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

        static public bool user_register( object boardId, object userName, object password, object hash, object email, object location, object homePage, object timeZone, bool approved)
		{
			using (MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
			{
				using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(MsSqlDbAccess.IsolationLevel))
				{
					try
					{
						using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_save", connMan.OpenDBConnection))
						{
							cmd.Transaction = trans;
							cmd.CommandType = CommandType.StoredProcedure;
						  
							cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = DBNull.Value;
							cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
							cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
							cmd.Parameters.Add(new NpgsqlParameter("i_timezone", NpgsqlDbType.Integer)).Value = timeZone;
							cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value = DBNull.Value;
							cmd.Parameters.Add(new NpgsqlParameter("i_themefile", NpgsqlDbType.Varchar)).Value = DBNull.Value;
							cmd.Parameters.Add(new NpgsqlParameter("i_overridedefaulttheme", NpgsqlDbType.Boolean)).Value = false;
							cmd.Parameters.Add(new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean)).Value = approved;
							cmd.Parameters.Add(new NpgsqlParameter("i_pmnotification", NpgsqlDbType.Boolean)).Value = false;
							cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = DBNull.Value;

							cmd.ExecuteNonQuery();
						}

						trans.Commit();
					}
					catch (Exception x)
					{
						trans.Rollback();
						eventlog_create(null, "user_register in YAF.Classes.Data.LegacyDb.cs", x, EventLogTypes.Error);
						return false;
					}
				}
			}

			return true;
		}
		static public int user_aspnet( int boardId, string userName, string displayName, string email, object providerUserKey, object isApproved)
		{
			try
			{
				using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_aspnet"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
					cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                    cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName ; // ?? userName;                    
					cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
					cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
					cmd.Parameters.Add(new NpgsqlParameter("i_isapproved", NpgsqlDbType.Boolean)).Value = isApproved;
														 
					return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
				}
			}
			catch (Exception x)
			{
                LegacyDb.eventlog_create( null, "user_aspnet in YAF.Classes.Data.LegacyDb.cs", x, EventLogTypes.Error);
				return 0;
			}
		}

        /// <summary>
        /// The user_guest.
        /// </summary>
        /// <param name="boardID">
        /// The board id.
        /// </param>
        /// <returns>
        /// The user_guest.
        /// </returns>
        public static int? user_guest(object boardId)
        {
            using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_guest"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
            }
        }

		static public DataTable user_activity_rank(object boardId, object startDate, object displayNumber)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_activity_rank"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_displaynumber", NpgsqlDbType.Integer)).Value = displayNumber;
				cmd.Parameters.Add(new NpgsqlParameter("i_startdate", NpgsqlDbType.Timestamp)).Value = startDate;
						
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

		static public int user_nntp(object boardId, object userName, object email, int? timeZone)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_nntp"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
				cmd.Parameters.Add(new NpgsqlParameter("i_timezone", NpgsqlDbType.Integer)).Value = timeZone;

			  object o=MsSqlDbAccess.Current.ExecuteScalar(cmd);
			  //  if ( o != DBNull.Value)
			  //  {
					return Convert.ToInt32(o);
			  //  }
			  //  else
			   //     return -1;
				
			}
		}

		static public void user_addpoints(object userId, object points)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_addpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
						  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public void user_removepointsByTopicID(object topicID, object points)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_removepointsbytopicid"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
							 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public void user_removepoints(object userId, object points)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_removepoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public void user_setpoints(object userId, object points)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_setpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
				
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		static public int user_getpoints(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				return (int)MsSqlDbAccess.Current.ExecuteScalar(cmd);
			}
		}

	
        static public int user_getthanks_from(object userID, object pageUserId)
		{

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getthanks_from"))
			{

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
				return Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
			}
		}

		//<summary> Returns the number of times and posts that other users have thanked the 
		// user with the provided userID.
        static public int[] user_getthanks_to(object userID, object pageUserId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_getthanks_to"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				NpgsqlParameter paramThanksToNumber = new NpgsqlParameter("i_thankstonumber", NpgsqlDbType.Integer);
				paramThanksToNumber.Direction = ParameterDirection.Output;
				NpgsqlParameter paramThanksToPostsNumber = new NpgsqlParameter("i_thankstopostsnumber", NpgsqlDbType.Integer);
				paramThanksToPostsNumber.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("user_viewallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
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
            using (var cmd = MsSqlDbAccess.GetCommand("user_update_single_sign_on_status"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = userID;
                cmd.Parameters.Add("i_isfacebookuser", NpgsqlDbType.Boolean).Value = isFacebookUser;
                cmd.Parameters.Add("i_istwitteruser", NpgsqlDbType.Boolean).Value = isTwitterUser;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }


		#endregion
		
		#region yaf_UserForum
		static public DataTable userforum_list(object userId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("userforum_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
				if (forumID == null) { forumID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void userforum_delete(object userId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("userforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void userforum_save(object userId, object forumID, object accessMaskID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("userforum_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID; 
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
		
		#region yaf_UserGroup
		static public DataTable usergroup_list(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("usergroup_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void usergroup_save(object userId, object groupID, object member)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("usergroup_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_member", NpgsqlDbType.Boolean)).Value = Convert.ToBoolean(member);
							 
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		#endregion
	   
		#region yaf_WatchForum
		static public void watchforum_add(object userId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchforum_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
						  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public DataTable watchforum_list(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchforum_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							 
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public DataTable watchforum_check(object userId, object forumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchforum_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
	
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void watchforum_delete(object watchForumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_watchforumid", NpgsqlDbType.Integer)).Value = watchForumID;
			  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);

			}
		}
		#endregion

		#region yaf_WatchTopic
		static public DataTable watchtopic_list(object userId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public DataTable watchtopic_check(object userId, object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		static public void watchtopic_delete(object watchTopicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_watchtopicid", NpgsqlDbType.Integer)).Value = watchTopicID;
							  
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		static public void watchtopic_add(object userId, object topicID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("watchtopic_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				
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
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;

                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// Delete the Read Tracking
        /// </summary>
        /// <param name="trackingID">
        /// The tracking id.
        /// </param>
       /* public static void Readtopic_delete([NotNull] object userID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("readtopic_delete"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
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
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
               
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
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID; 

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
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// Delete the Read Tracking
        /// </summary>
        /// <param name="trackingID">
        /// The tracking id.
        /// </param>
       /* public static void ReadForum_delete([NotNull] object userID)
        {
            using (var cmd = MsSqlDbAccess.GetCommand("readforum_delete"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
            }
        } */

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
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

                var tableLastRead = MsSqlDbAccess.Current.ExecuteScalar(cmd);

                return tableLastRead != null && tableLastRead != DBNull.Value
                           ? (DateTime)tableLastRead
                           : DateTime.MinValue.AddYears(1902);
            }
        }
	   
		#endregion

		# region Miscelaneous vzrus addons
		#region reindex page controls
		//DB Maintenance page buttons name    
		
		
		
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

		
		public static bool btnReindexVisible
		{
			get
			{
				return true;
			}
		}      
		#endregion
        static public DataTable rsstopic_list(int forumID)
        {
            return rsstopic_list(forumID, 0, 100);
        }
        static public DataTable rsstopic_list( int forumID, int topicStart, int topicCount)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("rsstopic_list"))
			{
			  
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_start", NpgsqlDbType.Integer)).Value = topicStart;
				cmd.Parameters.Add(new NpgsqlParameter("i_count", NpgsqlDbType.Integer)).Value = topicCount;
							   
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        private static string getStatsMessage;

        static public string db_getstats_new()
		{
            try
            {
                using (var connMan = new MsSqlDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(getStats_InfoMessage);
                    using (NpgsqlCommand cmd = new NpgsqlCommand("VACUUM ANALYZE VERBOSE;", connMan.OpenDBConnection))
                    {
                        cmd.CommandType = CommandType.Text;
                        // up the command timeout...
                        cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
                        // run it...
                        cmd.ExecuteNonQuery();
                        return getStatsMessage;
                    }
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

        private static string reindexDbMessage;

        static public string db_reindex_new()
        {
            ///VACUUM ANALYZE VERBOSE;VACUUM cannot be implemeneted within function or multiline command line string 
            try
            {
                using (var connMan = new MsSqlDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(reindexDb_InfoMessage);
                    using (NpgsqlCommand cmd = new NpgsqlCommand(String.Format(
                        @"REINDEX DATABASE {0};", Config.SchemaName.IsSet() ? Config.SchemaName : "public"),
                                                                 connMan.OpenDBConnection))
                    {


                        cmd.CommandType = CommandType.Text;
                        // up the command timeout...
                        cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                        // run it...                   
                        cmd.ExecuteNonQuery();
                        return reindexDbMessage;
                    }
                }

            }
            finally
            {
                reindexDbMessage = string.Empty;
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
        private static void reindexDb_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            reindexDbMessage += "\r\n{0}".FormatWith(e.Message);
        }


        static public string db_reindex_warning()
		{
			return "Operation completed. Database tables reindexing can take a lot of time.";
		}
        static public string db_getstats_warning()
		{
			return "Operation completed. Vacuum operation blocks all database objects! If there is a lot of indexes, the database can be blocked for a long time. Choose a right timing!";
		}
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
      /*  public static string db_runsql(string sql, IDbConnectionManager connMan, bool useTransaction)
        {
            using (var command = new SqlCommand(sql, connMan.OpenDBConnection))
            {
                command.CommandTimeout = 9999;
                command.Connection = connMan.OpenDBConnection;

                return InnerRunSqlExecuteReader(command, useTransaction);
            }
        } */

     /*   public static string db_runsql( string sql, bool useTransaction)
		{
			string txtResult = "";
			var results = new System.Text.StringBuilder();

			using (NpgsqlCommand cmd = new NpgsqlCommand(sql, connMan.OpenDBConnection))
			{
				cmd.CommandTimeout = 9999;
				NpgsqlDataReader reader = null;

				using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(MsSqlDbAccess.IsolationLevel))
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
							var columnNames = new string[reader.GetSchemaTable().Rows.Count-1];
							foreach (DataRow drd in reader.GetSchemaTable().Rows)
							{
								  columnNames[gg] = drd["ColumnName"].ToString();
								  results.Append(",");
								  results.Append(drd["ColumnName"].ToString());
								  gg++;
								
							}
						 //   var columnNames = reader.GetSchemaTable().Rows.Cast<DataRow>().Select(r => r["ColumnName"].ToString()).ToList();

							
						   

							results.AppendLine();

							while (reader.Read())
							{
								results.AppendFormat(@"""{0}""", rowIndex++);

								// dump all columns...
								foreach (var col in columnNames)
								{
									results.AppendFormat(@",""{0}""", reader[col].ToString().Replace("\"", "\"\""));
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
       */

        private static string messageRunSql;
        /// <summary>
        /// The db_runsql.
        /// </summary>
        /// <param name="sql">
        /// The sql.
        /// </param>
        /// <param name="connectionManager">
        /// The conn man.
        /// </param>
        /// <param name="useTransaction">
        /// The use Transaction.
        /// </param>
        /// <returns>
        /// The db_runsql.
        /// </returns>
        public static string db_runsql_new( [NotNull] string sql, bool useTransaction)
        {

            try
            {
                using (var connMan = new MsSqlDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(runSql_InfoMessage);
                    sql = MsSqlDbAccess.GetCommandTextReplaced(sql.Trim());

                    string txtResult = "";
                    var results = new System.Text.StringBuilder();

                    using (NpgsqlCommand cmd = new NpgsqlCommand(sql, connMan.OpenDBConnection))
                    {
                        cmd.CommandTimeout = 9999;
                        NpgsqlDataReader reader = null;
                        NpgsqlTransaction trans = useTransaction ? cmd.Connection.BeginTransaction(MsSqlDbAccess.IsolationLevel)
                                                                   : null;
                     
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
                                    var columnNames = new string[reader.GetSchemaTable().Rows.Count - 1];
                                    foreach (DataRow drd in reader.GetSchemaTable().Rows)
                                    {
                                        columnNames[gg] = drd["ColumnName"].ToString();
                                        results.Append(",");
                                        results.Append(drd["ColumnName"].ToString());
                                        gg++;

                                    }
                                    //   var columnNames = reader.GetSchemaTable().Rows.Cast<DataRow>().Select(r => r["ColumnName"].ToString()).ToList();




                                    results.AppendLine();

                                    while (reader.Read())
                                    {
                                        results.AppendFormat(@"""{0}""", rowIndex++);

                                        // dump all columns...
                                        foreach (var col in columnNames)
                                        {
                                            results.AppendFormat(@",""{0}""", reader[col].ToString().Replace("\"", "\"\""));
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
        private static void runSql_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            messageRunSql = "\r\n" + e.Message;
        }

        public static bool forumpage_initdb( out string errorStr, bool debugging)
		{
			errorStr = null;
			try
			{
                using (YAF.Classes.Data.MsSqlDbConnectionManager connMan = new MsSqlDbConnectionManager())
				{                    // just attempt to open the connection to test if a DB is available.           
					NpgsqlConnection getConn = connMan.OpenDBConnection;
				}
				return true;
			}

			catch (Npgsql.NpgsqlException ex)
			{
				// unable to connect to the LegacyDb...
				if (debugging)
				{
					errorStr = "Unable to connect to the Database. Exception Message: " +
						ex.Message +
						" (" + ex.Code.ToString()
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
        public static string forumpage_validateversion( int appVersion)
		{
			string redirect = "";
            
			try
			{
                DataTable registry = LegacyDb.registry_list( "Version");

				if ((registry.Rows.Count == 0) || (Convert.ToInt32(registry.Rows[0]["Value"]) < appVersion))
				{
					// needs upgrading...
					redirect = "install/default.aspx?upgrade=" + Convert.ToInt32(registry.Rows[0]["Value"]);
				}
			}
			catch (Npgsql.NpgsqlException)
			{
				// needs to be setup...
				redirect = "install/";
			}
			return redirect;
		}
 
		public static readonly string [] _scriptList = {
														"pgsql/preinstall.sql",
                                                        "pgsql/domains.sql",
														"pgsql/tables.sql",
														"pgsql/sequences.sql",                                                        
														"pgsql/pkeys.sql",
														"pgsql/indexes.sql",
														"pgsql/fkeys.sql",                                                        
														"pgsql/triggers.sql",
														"pgsql/rules.sql",
														"pgsql/views.sql",
														"pgsql/types.sql",
														"pgsql/procedures.sql",
                                                        "pgsql/procedures1.sql",
														"pgsql/functions.sql",	
														"pgsql/providers/tables.sql",
														"pgsql/providers/pkeys.sql",
														"pgsql/providers/indexes.sql",
														"pgsql/providers/types.sql",
														"pgsql/providers/procedures.sql",
														"pgsql/postinstall.sql"
													   };
        static public string[] ScriptList
        {
            get
            {
                return _scriptList;
            }
        }
 static private bool GetBooleanRegistryValue( string name)
 {
     using (DataTable dt = LegacyDb.registry_list( name))
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
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand(tSQL, true))
			{
				cmd.CommandType = CommandType.Text;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		public static void system_initialize_executescripts(string script, string scriptFile, bool useTransactions)
		{
			script = MsSqlDbAccess.GetCommandTextReplaced(script);
		   
		   
			//Scripts separation regexp
				string[] statements = System.Text.RegularExpressions.Regex.Split(script, "(?:--GO)", System.Text.RegularExpressions.RegexOptions.IgnoreCase);

                using (var connMan = new MsSqlDbConnectionManager())
			{                          

				// use transactions...
				if (useTransactions)
				{
					using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(YAF.Classes.Data.MsSqlDbAccess.IsolationLevel))
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
									using (NpgsqlCommand cmd = new NpgsqlCommand())
									{
										cmd.Transaction = trans;
										cmd.Connection = connMan.DBConnection;
										cmd.CommandType = CommandType.Text;
										cmd.CommandText = sql.Trim();
                                        // added so command won't timeout anymore...
                                        cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);              
										cmd.ExecuteNonQuery();                                       
									}
								}
							}
							catch (Exception x)
							{
							    sql = sql0;
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
								using (NpgsqlCommand cmd = new NpgsqlCommand())
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
		/*   using (YAF.Classes.Data.IDbConnectionManager connMan = new IDbConnectionManager())
			{
				using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(YAF.Classes.Data.MsSqlDbAccess.IsolationLevel))
				{
					// select * from  pg_tables where schemaname tableowner
				  //  select * from  pg_views where schemaname viewowner
					//  select * from  pg_proc where proname like {objectQualifier} prowner(oid)
				   // select * from pg_user usesysoid <-oid
					// REVIEW : Ederon - would "{databaseOwner}.{objectQualifier}" work, might need only "{objectQualifier}"
					using (NpgsqlDataAdapter da = new NpgsqlDataAdapter("select Name, OBJECTPROPERTY(id, N'IsUserTable') AS IsUserTable,IsScalarFunction = OBJECTPROPERTY(id, N'IsScalarFunction'),IsProcedure = OBJECTPROPERTY(id, N'IsProcedure'),IsView = OBJECTPROPERTY(id, N'IsView') from dbo.sysobjects where Name like '{databaseOwner}.{objectQualifier}%'", connMan.OpenDBConnection))
					{
						da.SelectCommand.Transaction = trans;
						using (DataTable dt = new DataTable("sysobjects"))
						{
							da.Fill(dt);
							using (NpgsqlCommand cmd = connMan.DBConnection.CreateCommand())
							{
								cmd.Transaction = trans;
								cmd.CommandType = CommandType.Text;
								cmd.CommandText = "select current_user";
								string userName = (string)cmd.ExecuteScalar();

								if (bGrant)
								{
									cmd.CommandType = CommandType.Text;
									foreach (DataRow row in dt.Select("IsProcedure=1 or IsScalarFunction=1"))
									{
										cmd.CommandText = string.Format("grant execute on \"{0}\" to \"{1}\"", row["Name"], userName);
										cmd.ExecuteNonQuery();
									}
									foreach (DataRow row in dt.Select("IsUserTable=1 or IsView=1"))
									{
										cmd.CommandText = string.Format("grant select,update on \"{0}\" to \"{1}\"", row["Name"], userName);
										cmd.ExecuteNonQuery();
									}
								}
								else
								{
									cmd.CommandText = "sp_changeobjectowner";
									cmd.CommandType = CommandType.StoredProcedure;
									foreach (DataRow row in dt.Select("IsUserTable=1"))
									{
										cmd.Parameters.Clear();
										cmd.Parameters.Add(new NpgsqlParameter("i_objname", NpgsqlDbType.Varchar));
										cmd.Parameters[0].Value = row["Name"];
										cmd.Parameters.Add(new NpgsqlParameter("i_newowner", NpgsqlDbType.Varchar));
										cmd.Parameters[1].Value = MsSqlDbAccess.SchemaName;                                        
										
										try
										{
											cmd.ExecuteNonQuery();
										}
										catch (NpgsqlException)
										{
										}
									}
									foreach (DataRow row in dt.Select("IsView=1"))
									{
										cmd.Parameters.Clear();
									  
										cmd.Parameters.Add(new NpgsqlParameter("i_objname", NpgsqlDbType.Varchar));
										cmd.Parameters[0].Value = row["Name"];
										cmd.Parameters.Add(new NpgsqlParameter("i_newowner", NpgsqlDbType.Varchar));
										cmd.Parameters[1].Value = MsSqlDbAccess.SchemaName;  
										try
										{
											cmd.ExecuteNonQuery();
										}
										catch (NpgsqlException)
										{
										}
									}
								}
							}
						}
					}
					trans.Commit();
				}
			}*/

		}
        public static void system_initialize(string forumName, string timeZone, string culture, string languageFile, string forumEmail, string smtpServer, string userName, string userEmail, object providerUserKey, string rolePrefix)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("system_initialize"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = forumName;
				cmd.Parameters.Add(new NpgsqlParameter("i_timezone", NpgsqlDbType.Integer)).Value = timeZone;
				cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value = languageFile;
				cmd.Parameters.Add(new NpgsqlParameter("i_culture", NpgsqlDbType.Varchar)).Value = culture;    
				cmd.Parameters.Add(new NpgsqlParameter("i_forumemail", NpgsqlDbType.Varchar)).Value = forumEmail;
				cmd.Parameters.Add(new NpgsqlParameter("i_smtpserver", NpgsqlDbType.Varchar)).Value = smtpServer;
				cmd.Parameters.Add(new NpgsqlParameter("i_user", NpgsqlDbType.Varchar)).Value = userName;
				// vzrus:The input parameter should be implemented in the system initialize and board_create procedures, else there will be an error in create watch because the user email is missing
				cmd.Parameters.Add(new NpgsqlParameter("i_useremail", NpgsqlDbType.Varchar)).Value = userEmail;
				cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid)).Value = providerUserKey;
                cmd.Parameters.Add(new NpgsqlParameter("i_newboardguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_roleprefix", NpgsqlDbType.Varchar)).Value = rolePrefix;
				
				YAF.Classes.Data.MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
								
			}

		}
		static public void system_updateversion( int version, string name)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("system_updateversion"))
			{

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_version", NpgsqlDbType.Integer)).Value = version;
				cmd.Parameters.Add(new NpgsqlParameter("i_versionname", NpgsqlDbType.Varchar)).Value = name;
			  
				YAF.Classes.Data.MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}
		/// <summary>
		/// Returns info about all Groups and Rank styles. 
		/// Used in GroupRankStyles cache.
		/// Usage: LegendID = 1 - Select Groups, LegendID = 2 - select Ranks by Name 
		/// </summary>
        public static DataTable group_rank_style( object boardID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("group_rank_style"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				return YAF.Classes.Data.MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion

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
        public static DataTable shoutbox_getmessages( int boardId, int numberOfMessages, object useStyledNicks)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("shoutbox_getmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_numberofmessages",NpgsqlDbType.Integer)).Value = numberOfMessages;                
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
				
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}

        public static bool shoutbox_savemessage( int boardId, string message, string userName, int userID, object ip)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("shoutbox_savemessage"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Text)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_date", NpgsqlDbType.Timestamp)).Value = DBNull.Value;
				cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;
								
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);

				return true;
			}
		}

        public static Boolean shoutbox_clearmessages( int boardId)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("shoutbox_clearmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return true;
			}
		}

		#endregion

		#region Touradg Mods
		//Shinking Operation
        static public string db_shrink_warning()
		{
			return "";
		}

        public static void db_shrink()
		{
		  /*  String ShrinkSql = "DBCC SHRINKDATABASE(N'" + DBName.DBConnection.Database + "')";
			SqlConnection ShrinkConn = new SqlConnection(YAF.Classes.Config.ConnectionString);
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
		}
        private static string dbShinkMessage;
        /// <summary>
        /// The db_shrink.
        /// </summary>
        /// <param name="DBName">
        /// The db name.
        /// </param>
        public static string db_shrink_new()
        {
           /* try
            {
                using (var conn = new MsSqlDbConnectionManager())
                {
                    conn.InfoMessage += new YafDBConnInfoMessageEventHandler(dbShink_InfoMessage);
                   
                    string ShrinkSql = "DBCC SHRINKDATABASE(N'" + conn.DBConnection.Database + "')";
                    var ShrinkConn = new SqlConnection(Config.ConnectionString);
                    var ShrinkCmd = new SqlCommand(ShrinkSql, ShrinkConn);
                    ShrinkConn.Open();
                    ShrinkCmd.ExecuteNonQuery();
                    ShrinkConn.Close();
                    using (var cmd = new SqlCommand(ShrinkSql, conn.OpenDBConnection))
                    {
                        cmd.Connection = conn.DBConnection;
                        cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
                        cmd.ExecuteNonQuery();
                    }
                }
                return dbShinkMessage;
            }
            finally
            {
                dbShinkMessage = string.Empty;
            } */
            return string.Empty;

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
        private static void dbShink_InfoMessage([NotNull] object sender, [NotNull] YafDBConnInfoMessageEventArgs e)
        {
            dbShinkMessage = "\r\n" + e.Message;
        }
		//Set Recovery
		static public string db_recovery_mode_warning()
		{
			return "";
		}

		public static string db_recovery_mode_new( string dbRecoveryMode)
		{
		   /* String RecoveryMode = "ALTER DATABASE " + DBName.DBConnection.Database + " SET RECOVERY " + dbRecoveryMode;
			SqlConnection RecoveryModeConn = new SqlConnection(YAF.Classes.Config.ConnectionString);
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
        public static string[] buddy_addrequest( object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("buddy_addrequest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("i_paramoutput", NpgsqlDbType.Varchar, 128);
				var approved = new NpgsqlParameter("i_approved", NpgsqlDbType.Boolean);
				paramOutput.Direction = ParameterDirection.Output;
				approved.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid",NpgsqlDbType.Integer)).Value= FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid",NpgsqlDbType.Integer)).Value=ToUserID;
				cmd.Parameters.Add(paramOutput);
				cmd.Parameters.Add(approved);
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				return new string[] { paramOutput.Value.ToString(), approved.Value.ToString() };
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
        public static string buddy_approveRequest( object FromUserID, object ToUserID, object Mutual)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("buddy_approverequest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = ToUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_mutual", NpgsqlDbType.Boolean)).Value = Mutual;
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
        public static string buddy_denyRequest( object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("buddy_denyrequest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = ToUserID;
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
        public static string buddy_remove( object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("buddy_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("i_paramoutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value =  FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value =  ToUserID;
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
        public static DataTable buddy_list( object FromUserID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("buddy_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value =  FromUserID;
				return MsSqlDbAccess.Current.GetData(cmd);
			}
		}
		#endregion
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
        public static int album_save( object AlbumID, object UserID, object Title, object CoverImageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                if (AlbumID == null || AlbumID.ToString() == "0")
				{
					AlbumID = DBNull.Value;
				}

                if (UserID == null || UserID.ToString() == "0")
				{
					UserID = DBNull.Value;
				}                 
				
				if (Title == null || String.IsNullOrEmpty(Title.ToString()))
				{
					Title = DBNull.Value;
				}

				if (CoverImageID == null)
				{
					CoverImageID = DBNull.Value;
				}
						
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_title", NpgsqlDbType.Varchar)).Value = Title;
				cmd.Parameters.Add(new NpgsqlParameter("i_coverimageid", NpgsqlDbType.Integer)).Value = CoverImageID;


                int uu = Convert.ToInt32(MsSqlDbAccess.Current.ExecuteScalar(cmd));
				return uu;

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
        public static DataTable album_list( object UserID, object AlbumID)
		{
			if (AlbumID == null || AlbumID.ToString() == "0")
			{
				AlbumID = DBNull.Value;
			}
			if (UserID == null || UserID.ToString() == "0")
			{
				UserID = DBNull.Value;
			}
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				DataTable dt = MsSqlDbAccess.Current.GetData(cmd);
				return dt;
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		public static void album_delete( object AlbumID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
        public static string album_gettitle( object AlbumID)
		{

            if (AlbumID == null || AlbumID.ToString() == "0" )
			{
                AlbumID = DBNull.Value;
			} 

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_gettitle"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
			   // object o = MsSqlDbAccess.Current.ExecuteScalar(cmd);
				return  MsSqlDbAccess.Current.ExecuteScalar(cmd).ToString();                
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
		public static int[] album_getstats( object UserID, object AlbumID)
		{
			if (AlbumID == null || AlbumID.ToString() == "0")
			{
				AlbumID = DBNull.Value;
			}
			if (UserID == null || UserID.ToString() == "0")
			{
				UserID = DBNull.Value;
			}

			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_getstats"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID; 

				DataRow dr = MsSqlDbAccess.Current.GetData(cmd).Rows[0];
              
			    return new int[]
		  {
			Convert.ToInt32(dr["albumnumber"]), Convert.ToInt32(dr["imagenumber"])
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
        public static void album_image_save( object ImageID, object AlbumID, object Caption, object FileName, object Bytes, object ContentType)
		{
            if (AlbumID == null || AlbumID.ToString() == "0")
			{
				AlbumID = DBNull.Value;
			}
            if (ImageID == null || ImageID.ToString() == "0")
			{
				ImageID = DBNull.Value;
			}
			if (Caption == null || Caption.ToString() == "0")
			{
				Caption = DBNull.Value;
			}
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_image_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_caption", NpgsqlDbType.Varchar)).Value = Caption;
				cmd.Parameters.Add(new NpgsqlParameter("i_filename", NpgsqlDbType.Varchar)).Value = FileName;
				cmd.Parameters.Add(new NpgsqlParameter("i_bytes", NpgsqlDbType.Integer)).Value = Bytes;
				cmd.Parameters.Add(new NpgsqlParameter("i_contenttype", NpgsqlDbType.Varchar)).Value = ContentType;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				int d = 1;
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
        public static DataTable album_image_list( object AlbumID, object ImageID)
		{
            if (AlbumID == null || AlbumID.ToString() == "0")
            {
                AlbumID = DBNull.Value;
            }
            if (ImageID == null || ImageID.ToString() == "0")
            {
                ImageID = DBNull.Value;
            }
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_image_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
			  DataTable dt =MsSqlDbAccess.Current.GetData(cmd);
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0]["ImageID"] == DBNull.Value)
                    {
                        dt.Rows.RemoveAt(0);
                        dt.AcceptChanges();
                    } 
                }

			  return dt;
			}
		}

		/// <summary>
		/// Deletes the image which has the specified image id.
		/// </summary>
		/// <param name="ImageID">
		/// the image id.
		/// </param>
		public static void album_image_delete( object ImageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_image_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
			}
		}

		/// <summary>
		/// Increments the image's download times.
		/// </summary>
		/// <param name="ImageID">
		/// the image id.
		/// </param>
        public static void album_image_download( object ImageID)
		{
			using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand("album_image_download"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				MsSqlDbAccess.Current.ExecuteNonQuery(cmd);
				int s33 = 0;
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
                cmd.Parameters.Add("I_UserID", NpgsqlDbType.Integer).Value = userID;
                return MsSqlDbAccess.Current.GetData(cmd);
            }
        }

		#endregion

         public static void unencode_all_topics_subjects(Func<string,string> decodeTopicFunc)
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
              LegacyDb.topic_updatetopic( topic.TopicID.Value, decodedTopic);
          }

        }
        catch
        {
          // soft-fail...
        }
      }
    }
  }
}

