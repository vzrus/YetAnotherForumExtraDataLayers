/* Yet Another Forum.NET PostgreSQL data layer by vzrus
 * Copyright (C) 2009-2010 vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
 * Copyright (C) 2003-2005 Bjørnar Henden
 * Copyright (C) 2006-2009 Jaben Cargman
 * http://www.yetanotherforum.net/
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
using VZF.Data.Postgre;
using YAF.Types.Handlers;

namespace YAF.Classes.Data.Postgre
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
        public static int GetDBSize(string connectionString)
        {
            using (
                NpgsqlCommand cmd =
                    new NpgsqlCommand(String.Format("select pg_database_size('{0}')/1024/1024;", PostgreDBAccess.DBName)))
            {
                cmd.CommandType = CommandType.Text;
                return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
            }
        }

        public static bool GetIsForumInstalled(string connectionString)
        {
            try
            {
                using (DataTable dt = board_list(connectionString, DBNull.Value))
                {
                    return dt.Rows.Count > 0;
                }
            }
            catch
            {
            }
            return false;
        }

        public static int GetDBVersion(string connectionString)
        {
            try
            {
                using (DataTable dt = LegacyDb.registry_list(connectionString,"version"))
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
        static public DataTable forum_listall(string connectionString, object boardId, object userId)
        {
            return forum_listall(connectionString, boardId, userId, 0);
        }

        static public DataTable forum_listall_sorted(string connectionString, object boardId, object userId)
        {
            return forum_listall_sorted(connectionString,boardId, userId, null, false, 0);
        }

        static public DataTable forum_listall_sorted(string connectionString, object boardId, object userId, int[] forumidExclusions)
        {
            return forum_listall_sorted(connectionString,boardId, userId, null, false, 0);
        }



        //Here
        static public DataTable forum_listall_sorted(string connectionString, object boardId, object userId, int[] forumidExclusions, bool emptyFirstRow, int startAt)
        {
            using (DataTable dataTable = forum_listall(connectionString,boardId, userId, startAt))
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

        public static void activeaccess_reset(string connectionString)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("activeaccess_reset"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }
        static public DataRow pageload(string connectionString, 
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
					using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "pageload" ) )
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
 
						dt1 = PostgreDBAccess.Current.GetData(cmd, false,connectionString);
						return dt1.Rows[0];

					/*   if (dt1.Columns.Count == 0) throw new ArgumentOutOfRangeException();
						using (NpgsqlCommand cmd1 = PostgreDBAccess.GetCommand("vaccess_combo"))
						{
							cmd1.CommandType = CommandType.StoredProcedure;
							cmd1.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = dt1.Rows[0]["UserID"];
							cmd1.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = dt1.Rows[0]["ForumID"];
							//We  trigger AcceptChanges() right now as we don't need to return more rows
							return PostgreDBAccess.Current.AddValuesToDataTableFromReader(cmd1, dt1, false, true, dt1.Columns.Count).Rows[0];
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
        static public DataTable GetSearchResult(string connectionString, string toSearchWhat, string toSearchFromWho, SearchWhatFlags searchFromWhoMethod, SearchWhatFlags searchWhatMethod, int forumIDToStartAt, int userId, int boardId, int maxResults, bool useFullText, bool searchDisplayName)
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

            using (SqlCommand cmd = PostgreDBAccess.GetCommand(searchSql, true))
            {
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            } */
			

			if (toSearchWhat == "*")
				toSearchWhat = "";
			string forumIDs = "";
			string limitString = "";
			string orderString = "";

			if (forumIDToStartAt != 0)
			{
                DataTable dt = forum_listall_sorted(connectionString,boardId, userId, null, false, forumIDToStartAt);
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
				"." + Config.DatabaseObjectQualifier + "topicselectview a LEFT JOIN " +
                (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier +
                "messageselectview c ON a.topicid = c.topicid LEFT JOIN " + (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier +
                "userselectview b ON c.userid = b.userid join " + (Config.SchemaName.IsSet() ? Config.SchemaName : "public") + "." + Config.DatabaseObjectQualifier
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


			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand(searchSql, true))
			{
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		#endregion

		#region DataSets

        static public void forum_list_sort_basic(string connectionString, DataTable listsource, DataTable list, int parentid, int currentLvl)
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
                    forum_list_sort_basic(connectionString,listsource, list, (int)row["ForumID"], currentLvl + 1);
                }
            }
        }
		/// <summary>
		/// Gets a list of categories????
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <returns>DataSet with categories</returns>
        static public DataSet ds_forumadmin(string connectionString, object boardId)
		{
            using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
			{
				using ( DataSet ds = new DataSet() )
				{
					using ( NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction( PostgreDBAccess.IsolationLevel ) )
					{
						using (NpgsqlDataAdapter da = new NpgsqlDataAdapter(PostgreDBAccess.GetObjectName("category_list"), connMan.DBConnection))
						{
							da.SelectCommand.Transaction = trans;

							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_CategoryID", NpgsqlDbType.Integer)).Value = DBNull.Value;                            
						
							da.SelectCommand.CommandType = CommandType.StoredProcedure;
							da.Fill( ds, PostgreDBAccess.GetObjectName( "Category" ) );
							da.SelectCommand.CommandText = PostgreDBAccess.GetObjectName( "forum_list" );
							da.Fill( ds, PostgreDBAccess.GetObjectName( "ForumUnsorted" ) );
							DataTable dtForumListSorted = ds.Tables [PostgreDBAccess.GetObjectName( "ForumUnsorted" )].Clone();
							dtForumListSorted.TableName = PostgreDBAccess.GetObjectName( "Forum" );
							ds.Tables.Add( dtForumListSorted );
							dtForumListSorted.Dispose();
                            LegacyDb.forum_list_sort_basic(connectionString, ds.Tables[PostgreDBAccess.GetObjectName("ForumUnsorted")], ds.Tables[PostgreDBAccess.GetObjectName("Forum")], 0, 0);
							ds.Tables.Remove( PostgreDBAccess.GetObjectName( "ForumUnsorted" ) );
							ds.Relations.Add( "FK_Forum_Category", ds.Tables [PostgreDBAccess.GetObjectName( "Category" )].Columns ["CategoryID"], ds.Tables [PostgreDBAccess.GetObjectName( "Forum" )].Columns ["CategoryID"] );
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
		
        /* static public DataTable accessmask_list(object boardId, object accessMaskID)
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
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "accessmask_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_board", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
				cmd.Parameters.Add(new NpgsqlParameter("i_excludeflags", NpgsqlDbType.Integer)).Value = excludeFlags; 
					  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);			
				
			}
		}
         */
		/// <summary>
		/// Deletes an access mask
		/// </summary>
		/// <param name="accessMaskID">ID of access mask</param>
		/// <returns></returns>
		/*static public bool accessmask_delete( object accessMaskID )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "accessmask_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
							
				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd,connectionString)) != 0;
			}
		} */
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
		/* static public void accessmask_save(object accessMaskID, object boardId, object name, object readAccess, object postAccess, object replyAccess, object priorityAccess, object pollAccess, object voteAccess, object moderatorAccess, object editAccess, object deleteAccess, object uploadAccess, object downloadAccess, object sortOrder)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "accessmask_save" ) )
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
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		} */
		#endregion

		#region yaf_Active
		/// <summary>
		/// Gets list of active users
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="Guests"></param>
		/// <returns>Returns a DataTable of active users</returns>    
		static public DataTable active_list(string connectionString, object boardId, object guests, object showCrawlers, int interval, object styledNicks )
		{
		   // if (Guests == null) { Guests = "false"; }
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "active_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlDbType.Boolean)).Value = guests;
                cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new NpgsqlParameter("i_interval", NpgsqlDbType.Integer)).Value = interval;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
		public static DataTable active_list_user(string connectionString, object boardID, object userID, object Guests,  object showCrawlers, int activeTime, object styledNicks)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("active_list_user"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_guests", NpgsqlDbType.Boolean)).Value = Guests;
                cmd.Parameters.Add(new NpgsqlParameter("i_showcrawlers", NpgsqlDbType.Boolean)).Value = showCrawlers;
				cmd.Parameters.Add(new NpgsqlParameter("i_activetime", NpgsqlDbType.Integer)).Value = activeTime;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;
   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		/// <summary>
		/// Gets the list of active users within a certain forum
		/// </summary>
		/// <param name="forumID">forumID</param>
		/// <returns>DataTable of all ative users in a forum</returns>
		static public DataTable active_listforum(string connectionString, object forumID, object styledNicks )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "active_listforum" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Gets the list of active users in a topic
		/// </summary>
		/// <param name="topicID">ID of topic </param>
		/// <returns>DataTable of all users that are in a topic</returns>
		static public DataTable active_listtopic(string connectionString,  object topicID, object styledNicks )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "active_listtopic" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			
			}
		}

		/// <summary>
		/// Gets the activity statistics for a board
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <returns>DataRow of activity stata</returns>
		static public DataRow active_stats(string connectionString, object boardId )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "active_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                using (DataTable dt = PostgreDBAccess.Current.GetData(cmd, connectionString))
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
        static public DataTable attachment_list(string connectionString, object messageID, object attachmentID, object boardId)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "attachment_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
        static public void attachment_save(string connectionString, object messageID, object fileName, object bytes, object contentType, System.IO.Stream stream)
		{
			using ( var cmd = PostgreDBAccess.GetCommand( "attachment_save" ) )
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
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		//ABOT CHANGE 16.04.04
		/// <summary>
		/// Delete attachment
		/// </summary>
		/// <param name="attachmentID">ID of attachment to delete</param>
        static public void attachment_delete(string connectionString, object attachmentID)
		{
            bool UseFileTable = GetBooleanRegistryValue(connectionString, "UseFileTable");

			//If the files are actually saved in the Hard Drive
			if ( !UseFileTable )
			{
				using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "attachment_list" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = DBNull.Value;
					cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = DBNull.Value;

                    DataTable tbAttachments = PostgreDBAccess.Current.GetData(cmd, connectionString);
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
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "attachment_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
			//End ABOT CHANGE 16.04.04
		}


		/// <summary>
		/// Attachement dowload
		/// </summary>
		/// <param name="attachmentID">ID of attachemnt to download</param>
		static public void attachment_download(string connectionString, object attachmentID )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "attachment_download" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = attachmentID;
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        static public DataTable bannedip_list(string connectionString, object boardId, object ID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "bannedip_list" ) )
			{

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Saves baned ip in database
		/// </summary>
		/// <param name="ID">ID</param>
		/// <param name="boardId">BoardID</param>
		/// <param name="Mask">Mask</param>
        static public void bannedip_save(string connectionString, object ID, object boardId, object Mask, string reason, int userID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "bannedip_save" ) )
			{
				//Regex for ip
			  //  \b(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_mask", NpgsqlDbType.Varchar)).Value = Mask;
				cmd.Parameters.Add(new NpgsqlParameter("i_reason", NpgsqlDbType.Varchar)).Value = reason;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Deletes Banned IP
		/// </summary>
		/// <param name="ID">ID of banned ip to delete</param>
        static public void bannedip_delete(string connectionString, object ID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "bannedip_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = ID;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_Board
		/// <summary>
		/// Gets a list of information about a board
		/// </summary>
		/// <param name="boardId">board id</param>
		/// <returns>DataTable</returns>
        static public DataTable board_list(string connectionString, object boardId)
		{
			String _systemInfo = String.Concat(" OS: ", Platform.VersionString,
				   " - Runtime: ", Platform.RuntimeName, " ", Platform.RuntimeString,
				   " - Number of processors: ", Platform.Processors,
				   " - Allocated memory:", (Platform.AllocatedMemory / 1024 / 1024).ToString(), " Mb.");
			
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_sysinfo", NpgsqlDbType.Varchar)).Value = _systemInfo;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}

		/// <summary>
		/// Gets posting statistics
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="useStyledNicks">useStyledNicks</param>
		/// <returns>DataRow of Poststats</returns>
        static public DataRow board_poststats(string connectionString, int? boardId, bool useStyledNicks, bool showNoCountPosts)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_poststats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId; 
				cmd.Parameters.Add(new NpgsqlParameter("i_usestylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_getdefaults", NpgsqlDbType.Boolean)).Value = false;

                using (DataTable dt = PostgreDBAccess.Current.GetData(cmd, connectionString))
				{
                    if (dt.Rows.Count > 0)
                    {
                        return dt.Rows[0];
                    }
				}
			}

            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("board_poststats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_usestylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_getdefaults", NpgsqlDbType.Boolean)).Value = true;

                using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
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
        public static DataRow board_userstats(string connectionString , int? boardId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("board_userstats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId; 
                using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
                {
                    return dt.Rows[0];
                }
            }
        }

		/// <summary>
		/// Recalculates topic and post numbers and updates last post for all forums in all boards
		/// </summary>
		/* static public void board_resync()
		{
			board_resync( null );
		} */
		/// <summary>
		/// Recalculates topic and post numbers and updates last post for specified board
		/// </summary>
		/// <param name="boardId">BoardID of board to do re-sync for, if null, all boards are re-synced</param>
		static public void board_resync(string connectionString, object boardId )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_resync" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
			   
				NpgsqlCommandBuilder cb = new NpgsqlCommandBuilder();             
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Gets statistica about number of posts etc.
		/// </summary>
		/// <returns>DataRow</returns>

        static public DataRow board_stats(string connectionString, object boardId)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_stats" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                using (DataTable dt = PostgreDBAccess.Current.GetData(cmd, connectionString))
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
        static public int board_save(string connectionString, object boardId, object languageFile, object culture, object name, object allowThreaded)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_languagefile", NpgsqlDbType.Varchar)).Value =  languageFile;
				cmd.Parameters.Add(new NpgsqlParameter("i_culture", NpgsqlDbType.Varchar)).Value = culture;     
				cmd.Parameters.Add(new NpgsqlParameter("i_allowthreaded", NpgsqlDbType.Boolean)).Value = allowThreaded;

				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
				
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
        static public int board_create(string connectionString, object adminUsername, object adminUserEmail, object adminUserKey, object boardName, object culture, object languageFile, object boardMembershipName, object boardRolesName, object rolePrefix)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_create" ) )
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

				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));               
			}
		}
		/// <summary>
		/// Deletes a board
		/// </summary>
		/// <param name="boardId">ID of board to delete</param>
        static public void board_delete(string connectionString, object boardId)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "board_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_Category
		/// <summary>
		/// Deletes a category
		/// </summary>
		/// <param name="CategoryID">ID of category to delete</param>
		/// <returns>Bool value indicationg if category was deleted</returns>
        static public bool category_delete(string connectionString, object CategoryID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "category_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = CategoryID;
							   
				return ( int )PostgreDBAccess.Current.ExecuteScalar(cmd,connectionString) != 0;
			}
		}
		/// <summary>
		/// Gets a list of forums in a category
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <param name="categoryID">categotyID</param>
		/// <returns>DataTable with a list of forums in a category</returns>
        static public DataTable category_list(string connectionString, object boardId, object categoryID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "category_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Gets a list of forum categories
		/// </summary>
		/// <param name="boardId"></param>
		/// <param name="userId"></param>
		/// <param name="categoryID"></param>
		/// <returns></returns>
        static public DataTable category_listread(string connectionString, object boardId, object userId, object categoryID)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "category_listread" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Lists categories very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
        static public DataTable category_simplelist(string connectionString, int startID, int limit)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "category_simplelist" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = startID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = limit;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Saves changes to a category
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="CategoryID">CategoryID so save changes to</param>
		/// <param name="Name">Name of the category</param>
		/// <param name="SortOrder">Sort Order</param>
        static public void category_save(string connectionString, object boardId, object categoryId, object name, object categoryImage, object sortOrder)
		{

			int sortOrderChecked = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderChecked);
			if (result) { if (sortOrderChecked >= 255) { sortOrderChecked = 0; } }
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "category_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderChecked;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryimage", NpgsqlDbType.Varchar)).Value = categoryImage;
				

			   
				
 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        static public void checkemail_save(string connectionString, object userId, object hash, object email)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "checkemail_save" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_iserid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_hash", NpgsqlDbType.Varchar)).Value = hash;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Updates a hash
		/// </summary>
		/// <param name="hash">New hash</param>
		/// <returns>DataTable with user information</returns>
        static public DataTable checkemail_update(string connectionString, object hash)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "checkemail_update" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_hash", NpgsqlDbType.Varchar)).Value = hash;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		/// <summary>
		/// Gets a check email entry based on email or all if no email supplied
		/// </summary>
		/// <param name="email">Associated email</param>
		/// <returns>DataTable with check email information</returns>
        static public DataTable checkemail_list(string connectionString, object email)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "checkemail_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}

		#endregion
	   
		#region yaf_Choice
		/// <summary>
		/// Saves a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public void choice_vote(string connectionString, object choiceID, object userId, object remoteIP)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "choice_vote" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_remoteip", NpgsqlDbType.Varchar)).Value = remoteIP;
							
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
	   
		#region yaf_EventLog
        static public void eventlog_create(string connectionString, object userId, object source, object description)
        {
            eventlog_create(connectionString, userId, (object)source.GetType().ToString(), description, (object)0);
        }
        static public void eventlog_create(string connectionString, object userId, object source, object description, object type)
		{
			try
			{
				if ( userId == null ) userId = DBNull.Value;
				using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "eventlog_create" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;



					cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
					cmd.Parameters.Add(new NpgsqlParameter("i_source", NpgsqlDbType.Varchar)).Value = source.ToString();
					cmd.Parameters.Add(new NpgsqlParameter("i_description", NpgsqlDbType.Text)).Value = description.ToString();
					cmd.Parameters.Add(new NpgsqlParameter("i_type", NpgsqlDbType.Integer)).Value = type;
					
					PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}


       

		/// <summary>
		/// Calls underlying stroed procedure for deletion of event log entry(ies).
		/// </summary>
		/// <param name="eventLogID">When not null, only given event log entry is deleted.</param>
		/// <param name="boardId">Specifies board. It is ignored if eventLogID parameter is not null.</param>
        static public void eventlog_delete(string connectionString, object eventLogID, object boardId)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "eventlog_delete" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_eventlogid", NpgsqlDbType.Integer)).Value = eventLogID;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
						
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public DataTable eventlog_list(string connectionString, object boardId )
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "eventlog_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}
		#endregion yaf_EventLog

		// Admin control of file extensions - MJ Hufford
	   
		#region yaf_Extensions

        static public void extension_delete(string connectionString, object extensionId)
		{
			try
			{
				using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "extension_delete" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;
									  
					PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				}
			}
			catch
			{
				// Ignore any errors in this method
			}
		}

		// Get Extension record by extensionId
        static public DataTable extension_edit(string connectionString, object extensionId)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "extension_edit" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}

		}



		// Used to validate a file before uploading
        static public DataTable extension_list(string connectionString, object boardId, object extension)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "extension_list" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_extension", NpgsqlDbType.Varchar)).Value = extension;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}

		}

		

		// Saves / creates extension
        static public void extension_save(string connectionString, object extensionId, object boardId, object extension)
		{
			try
			{
				using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "extension_save" ) )
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_extensionid", NpgsqlDbType.Integer)).Value = extensionId;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
					cmd.Parameters.Add(new NpgsqlParameter("i_extension", NpgsqlDbType.Varchar)).Value = extension;
					
					PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DataTable pollgroup_votecheck(string connectionString, object pollGroupId, object userId, object remoteIp)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pollgroup_votecheck"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
                cmd.Parameters.AddWithValue("i_userid", userId);
                cmd.Parameters.AddWithValue("i_remoteip", remoteIp);
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            }
        }

		/// <summary>
		/// Checks for a vote in the database
		/// </summary>
		/// <param name="choiceID">Choice of the vote</param>
        static public DataTable pollvote_check(string connectionString, object pollid, object userid, object remoteip)
		{
			using ( NpgsqlCommand cmd = PostgreDBAccess.GetCommand( "pollvote_check" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollid;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userid;
				cmd.Parameters.Add(new NpgsqlParameter("i_remoteip", NpgsqlDbType.Varchar)).Value = remoteip;

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
        public static DataTable recent_users(string connectionString, object boardID, int timeSinceLastLogin, object styledNicks)
        {
            using (var cmd = PostgreDBAccess.GetCommand("recent_users"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
                cmd.Parameters.Add(new NpgsqlParameter("i_timesincelastlogin", NpgsqlDbType.Integer)).Value = timeSinceLastLogin;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = styledNicks;
               
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            }
        }
		//ABOT NEW 16.04.04
		/// <summary>
		/// Deletes attachments out of a entire forum
		/// </summary>
		/// <param name="ForumID">ID of forum to delete all attachemnts out of</param>
		static private void forum_deleteAttachments(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listtopics"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
												
				using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
				{
					foreach (DataRow row in dt.Rows)
					{
					   if ( row != null && row["TopicID"] != DBNull.Value )
						{
							topic_delete(connectionString, row["TopicID"], true );
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
        static public bool forum_delete(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listSubForums"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

			    if (!(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString) is DBNull))
			        return false;
			    else
			    {
			        forum_deleteAttachments(connectionString, forumID);
			        using (NpgsqlCommand cmd_new = PostgreDBAccess.GetCommand("forum_delete"))
			        {
			            cmd_new.CommandType = CommandType.StoredProcedure;
			            cmd_new.CommandTimeout = 99999;
			            cmd_new.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

			            PostgreDBAccess.Current.ExecuteNonQuery(cmd_new, connectionString);
			        }
			        return true;
			    }
			}
		}

        public static bool forum_move([NotNull] string connectionString, [NotNull] object forumOldID, [NotNull] object forumNewID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("forum_listSubForums"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumOldID;

                if (!(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString) is DBNull))
                {
                    return false;
                }

                using (var cmd_new = PostgreDBAccess.GetCommand("forum_move"))
                {
                    cmd_new.CommandType = CommandType.StoredProcedure;
                    cmd_new.CommandTimeout = 99999;
                    cmd.Parameters.Add(new NpgsqlParameter("i_forumoldid", NpgsqlDbType.Integer)).Value = forumOldID;
                    cmd.Parameters.Add(new NpgsqlParameter("i_forumnewid", NpgsqlDbType.Integer)).Value = forumNewID;
                   
                    PostgreDBAccess.Current.ExecuteNonQuery(cmd_new, connectionString);
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
        static public DataTable forum_listallMyModerated(string connectionString, object boardId, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listallmymoderated"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
					 
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		//END ABOT NEW 16.04.04
		/// <summary>
		/// Gets a list of topics in a forum
		/// </summary>
		/// <param name="boardId">boardId</param>
		/// <param name="ForumID">forumID</param>
		/// <returns>DataTable with list of topics from a forum</returns>
        static public DataTable forum_list(string connectionString, object boardId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_list"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


		/// <summary>
		/// Lists all forums accessible to a user
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="userId">ID of user</param>
		/// <param name="startAt">startAt ID</param>
		/// <returns>DataTable of all accessible forums</returns>
        static public DataTable forum_listall(string connectionString, object boardId, object userId, object startAt)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listall"))
			{
				if (startAt == null) { startAt = 0; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_root", NpgsqlDbType.Integer)).Value = startAt;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


        public static IEnumerable<TypedForumListAll> ForumListAll(string connectionString, int boardId, int userId)
        {
            return forum_listall(connectionString, boardId, userId, 0).AsEnumerable().Select(r => new TypedForumListAll(r));
        }
        public static IEnumerable<TypedForumListAll> ForumListAll(string connectionString, int boardId, int userId, int startForumId)
        {
            var allForums = ForumListAll(connectionString, boardId, userId);

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
        static public DataTable forum_simplelist(string connectionString, int startID, int limit)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_simplelist"))
			{
				if (startID <= 0) { startID = 0; }
				if (limit <= 0) { limit = 500; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = startID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = limit;
			   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
		/// <param name="EmptyFirstRow">EmptyFirstRow</param>
		/// <returns>DataTable with list</returns>
        static public DataTable forum_listall_fromCat(string connectionString, object boardId, object categoryID, bool emptyFirstRow)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listall_fromCat"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryID;
				
				
				int intCategoryID = Convert.ToInt32(categoryID.ToString());

				using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
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
        static public DataTable forum_listpath(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_listpath"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        static public DataTable forum_listread(string connectionString, object boardId,
            object userId, object categoryID, object parentID, object useStyledNicks, [CanBeNull]bool findLastRead)
		{                      
		
		  //  DataTable dt1 = null;
		   // DataTable dt2 = null;

			if (categoryID == null) { categoryID = DBNull.Value; }
			if (parentID == null) { parentID = DBNull.Value; }


			using (NpgsqlCommand cmd1 = PostgreDBAccess.GetCommand("forum_listread"))
			{
				cmd1.CommandType = CommandType.StoredProcedure;

				cmd1.Parameters.Add("i_boardid", NpgsqlDbType.Integer).Value = boardId;
				cmd1.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = userId;
				cmd1.Parameters.Add("i_categoryid", NpgsqlDbType.Integer).Value = categoryID;
				cmd1.Parameters.Add("i_parentid", NpgsqlDbType.Integer).Value = parentID;
                cmd1.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value =  useStyledNicks;
                cmd1.Parameters.Add("i_findlastunread", NpgsqlDbType.Boolean).Value = findLastRead;
   
			   // dt1 = 
				return PostgreDBAccess.Current.GetData(cmd1, false, connectionString);
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

					using (NpgsqlCommand cmd3 = PostgreDBAccess.GetCommand("forum_listread_helper"))
					{
						cmd3.CommandType = CommandType.StoredProcedure;                      
					   
						cmd3.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = dr1["ForumID"];

						if (cntr != dt1rc - 1 || dt1rc == 0)
							dt2 = PostgreDBAccess.Current.AddValuesToDataTableFromReader(cmd3, dt1, false, true, firstColumnIndex, cntr);
						else
							dt2 = PostgreDBAccess.Current.AddValuesToDataTableFromReader(cmd3, dt1, false, false, firstColumnIndex, cntr);
					}


					cntr++;
				}
			}
			else
			{
				//We simply get rows' structure
				using (NpgsqlCommand cmd2 = PostgreDBAccess.GetCommand("forum_listread_helper"))
				{
					cmd2.CommandType = CommandType.StoredProcedure;

					cmd2.Parameters.Add("i_forumid", NpgsqlDbType.Integer).Value = 0;                    

					dt2 = PostgreDBAccess.Current.AddValuesToDataTableFromReader(cmd2, dt1, false, true, firstColumnIndex, 0);
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
        static public DataSet forum_moderatelist(string connectionString, object userId, object boardId)
		{
            using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
			{
				using (DataSet ds = new DataSet())
				{
					using (NpgsqlDataAdapter da = new NpgsqlDataAdapter(PostgreDBAccess.GetObjectName("category_list"), connMan.OpenDBConnection))
					{
						using (NpgsqlTransaction trans = da.SelectCommand.Connection.BeginTransaction(PostgreDBAccess.IsolationLevel))
						{
							da.SelectCommand.Transaction = trans;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = DBNull.Value;
												 
							da.SelectCommand.CommandType = CommandType.StoredProcedure;


							da.Fill(ds, PostgreDBAccess.GetObjectName("Category"));
							da.SelectCommand.CommandText = PostgreDBAccess.GetObjectName("forum_moderatelist");
							da.SelectCommand.Parameters.Clear();
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							da.SelectCommand.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
													   
							da.Fill(ds, PostgreDBAccess.GetObjectName("ForumUnsorted"));
							DataTable dtForumListSorted = ds.Tables[PostgreDBAccess.GetObjectName("ForumUnsorted")].Clone();
							dtForumListSorted.TableName = PostgreDBAccess.GetObjectName("Forum");
							ds.Tables.Add(dtForumListSorted);
							dtForumListSorted.Dispose();
                            LegacyDb.forum_list_sort_basic(connectionString, ds.Tables[PostgreDBAccess.GetObjectName("ForumUnsorted")], ds.Tables[PostgreDBAccess.GetObjectName("Forum")], 0, 0);
							ds.Tables.Remove(PostgreDBAccess.GetObjectName("ForumUnsorted"));
							// vzrus: Remove here all forums with no reports. Would be better to do it in query...
							// Array to write categories numbers
							int[] categories = new int[ds.Tables[PostgreDBAccess.GetObjectName("Forum")].Rows.Count];
							int cntr = 0;
							//We should make it before too as the colection was changed
							ds.Tables[PostgreDBAccess.GetObjectName("Forum")].AcceptChanges();
							foreach (DataRow dr in ds.Tables[PostgreDBAccess.GetObjectName("Forum")].Rows)
							{
								categories[cntr] = Convert.ToInt32(dr["CategoryID"]);
								if (Convert.ToInt32(dr["ReportedCount"]) == 0 && Convert.ToInt32(dr["MessageCount"]) == 0)
								{
									dr.Delete();
									categories[cntr] = 0;
								}
								cntr++;
							}
							ds.Tables[PostgreDBAccess.GetObjectName("Forum")].AcceptChanges();

							foreach (DataRow dr in ds.Tables[PostgreDBAccess.GetObjectName("Category")].Rows)
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
							ds.Tables[PostgreDBAccess.GetObjectName("Category")].AcceptChanges(); 

							ds.Relations.Add("FK_Forum_Category", ds.Tables[PostgreDBAccess.GetObjectName("Category")].Columns["CategoryID"], ds.Tables[PostgreDBAccess.GetObjectName("Forum")].Columns["CategoryID"]);
							trans.Commit();
						}
						return ds;
					}
				}
			}
		}

        static public DataTable forum_moderators(string connectionString, bool useStyledNicks)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_moderators"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable moderators_team_list(string connectionString, bool useStyledNicks)
        {
            using (var cmd = PostgreDBAccess.GetCommand("moderators_team_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

		/// <summary>
		/// Updates topic and post count and last topic for specified forum
		/// </summary>
		/// <param name="boardId">BoardID</param>
		/// <param name="forumID">If null, all forums in board are updated</param>
        static public void forum_resync(string connectionString, object boardId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_resync"))
			{
				if (forumID == null) { forumID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        static public long forum_save(string connectionString, object forumID, 
			object categoryID, object parentID, object name, 
			object description, object sortOrder, object locked, 
			object hidden, object isTest, object moderated, 
			object accessMaskID, object remoteURL, 
			object themeURL, 
			object imageURL,
			object styles,
	   bool dummy)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forum_save"))
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
				
				String resultop = PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString();
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
        public static int forum_save_parentschecker(string connectionString, object forumID, object parentID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("SELECT " + PostgreDBAccess.GetObjectName("forum_save_parentschecker") + "(@ForumID,@ParentID)", true))
			{
				cmd.CommandType = CommandType.Text;
				cmd.Parameters.Add(new NpgsqlParameter("@ForumID", NpgsqlDbType.Integer)).Value =  forumID;
				cmd.Parameters.Add(new NpgsqlParameter("@ParentID", NpgsqlDbType.Integer)).Value = parentID;
				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
			}

		}
			   

		#endregion
	   
		#region yaf_ForumAccess
        static public DataTable forumaccess_list(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forumaccess_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_ForumID", NpgsqlDbType.Integer)).Value = forumID;
								
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void forumaccess_save(string connectionString, object forumID, object groupID, object accessMaskID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forumaccess_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID;
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public DataTable forumaccess_group(string connectionString, object groupID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("forumaccess_group"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
								
				return userforumaccess_sort_list(PostgreDBAccess.Current.GetData(cmd,connectionString), 0, 0, 0);
			}
		}
		#endregion
	   
		#region yaf_Group
        static public DataTable group_list(string connectionString, object boardId, object groupID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
							
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void group_delete(string connectionString, object groupID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public DataTable group_member(string connectionString, object boardId, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_member"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				

				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        static public long group_save(string connectionString, object groupID, object boardId, object name, 
			object isAdmin, object isGuest, object isStart, object isModerator,
			object accessMaskID, object pmLimit, object style, object sortOrder,
			object description,
			object usrSigChars,
			object usrSigBBCodes,
			object usrSigHTMLTags,
			object usrAlbums,
			object usrAlbumImages)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_save"))
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

				return long.Parse(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString());
			}
		}
		#endregion
	   
		#region yaf_Mail
        static public void mail_delete(string connectionString, object mailID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("mail_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_mailid", NpgsqlDbType.Integer)).Value = mailID;
						   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public DataTable mail_list(string connectionString, object processId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("mail_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_processid", NpgsqlDbType.Integer)).Value = processId; 
							  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static IEnumerable<TypedMailList> MailList(string connectionString, long processId)
    {
        using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("mail_list"))
        {
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new NpgsqlParameter("i_processid", NpgsqlDbType.Integer)).Value = processId;
            return PostgreDBAccess.Current.GetData(cmd,connectionString).SelectTypedList(x => new TypedMailList(x));
        }
    }

    static public void mail_createwatch(string connectionString, object topicID, object from, object fromName, object subject, object body, object bodyHtml, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("mail_createwatch"))
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
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
    static public void mail_create(string connectionString, object from, object fromName, object to, object toName, object subject, object body, object bodyHtml)
		{
   

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("mail_create"))
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
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_Message

    static public DataTable post_list(string connectionString, 
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
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("post_list"))
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
               
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
				
			}
		}
    static public DataTable post_list_reverse10(string connectionString, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("post_list_reverse10"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
								
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable post_last10user(string connectionString, object boardID, object userID, object pageUserID)
		{
			// use all posts procedure to return top ten
			return post_alluser(connectionString,boardID, userID, pageUserID, 10);
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
        public static DataTable post_alluser(string connectionString, object boardid, object userid, object pageUserID, object topCount)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("post_alluser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardid;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userid;
				cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topcount", NpgsqlDbType.Integer)).Value = topCount;               
			   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
	   

		// gets list of replies to message
        static public DataTable message_getRepliesList(string connectionString, object messageID)
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

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
			  
				DataTable dtr = PostgreDBAccess.Current.GetData(cmd,connectionString);
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
                    message_getRepliesList_populate(connectionString, dtr, list, (int)row["MessageId"]);
				}
				return list;
			}
		}

		// gets list of nested replies to message
        static private void message_getRepliesList_populate(string connectionString, DataTable listsource, DataTable list, int messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_reply_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer));
				cmd.Parameters[0].Value = messageID;

			   
				DataTable dtr = PostgreDBAccess.Current.GetData(cmd,connectionString);

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
                    message_getRepliesList_populate(connectionString, dtr, list, (int)row["MessageId"]);
				}
			}

		}

		//creates new topic, using some parameters from message itself
		static public long topic_create_by_message(string connectionString,object messageID, object forumId, object newTopicSubj)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_create_by_message"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = newTopicSubj;
			   
				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
				//return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}

        [Obsolete("Use MessageList(int messageId) instead")]
        static public DataTable message_list(string connectionString, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
								
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static IEnumerable<TypedMessageList> MessageList(string connectionString, int messageID)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(t => new TypedMessageList(t));
            }
        }

		
        static public void message_delete(string connectionString, object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool eraseMessage)
		{
            message_deleteRecursively(connectionString, messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, false, eraseMessage);
		}

		// <summary> Retrieve all reported messages with the correct forumID argument. </summary>
        static public DataTable message_listreported(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_listreported"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
		
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


        static public DataTable message_listreporters(string connectionString, int messageID, object userID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_listreporters"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		// <summary> Save reported message back to the database. </summary>
        static public void message_report(string connectionString, object messageID, object userId, object reportedDateTime, object reportText)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_report"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporterid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporteddate", NpgsqlDbType.Timestamp)).Value = reportedDateTime;
				cmd.Parameters.Add(new NpgsqlParameter("i_reporttext", NpgsqlDbType.Varchar)).Value = reportText;
				

 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportcopyover(string connectionString, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_reportcopyover"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		// <summary> Copy current Message text over reported Message text. </summary>
        static public void message_reportresolve(string connectionString, object messageFlag, object messageID, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_reportresolve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageflag", NpgsqlDbType.Integer)).Value = messageFlag;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		//BAI ADDED 30.01.2004
		// <summary> Delete message and all subsequent releated messages to that ID </summary>
        static private void message_deleteRecursively(string connectionString, object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool isLinked)
		{
			message_deleteRecursively(connectionString,messageID, isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, isLinked, false);
		}
        static private void message_deleteRecursively(string connectionString, object messageID, bool isModeratorChanged, string deleteReason, int isDeleteAction, bool DeleteLinked, bool isLinked, bool eraseMessages)
		{
            bool UseFileTable = GetBooleanRegistryValue(connectionString, "UseFileTable");


			if (DeleteLinked)
			{
				//Delete replies
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
										
					DataTable tbReplies = PostgreDBAccess.Current.GetData(cmd,connectionString);

					foreach (DataRow row in tbReplies.Rows)
						message_deleteRecursively(connectionString,row["i_messageid"], isModeratorChanged, deleteReason, isDeleteAction, DeleteLinked, true, eraseMessages);
				}
			}

			//If the files are actually saved in the Hard Drive
			if (!UseFileTable)
			{
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("attachment_list"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_attachmentid", NpgsqlDbType.Integer)).Value = null;
					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = null;
					 
					DataTable tbAttachments = PostgreDBAccess.Current.GetData(cmd,connectionString);
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
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_delete"))
				{
					//if (eraseMessages == null) { eraseMessages = false; }
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_erasemessage", NpgsqlDbType.Boolean)).Value = eraseMessages;
							 
					PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				}
			}
			else
			{
				//Delete Message
				// undelete function added
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_deleteundelete"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					cmd.Parameters.Add(new NpgsqlParameter("i_ismoderatorchanged", NpgsqlDbType.Boolean)).Value = isModeratorChanged;
					cmd.Parameters.Add(new NpgsqlParameter("i_deletereason", NpgsqlDbType.Varchar)).Value = deleteReason;
					cmd.Parameters.Add(new NpgsqlParameter("i_isdeleteaction", NpgsqlDbType.Integer)).Value = isDeleteAction;
				   
					PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				}
			}
		}

		// <summary> Set flag on message to approved and store in DB </summary>
        static public void message_approve(string connectionString, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Get message topic IDs (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
        static public DataTable message_simplelist(string connectionString, int StartID, int Limit)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 1000; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
			  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


        static public void message_update(
            string connectionString, 
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_update"))
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

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		// <summary> Save message to LegacyDb. </summary>
        static public bool message_save(string connectionString,
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_save"))
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
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				messageId = Convert.ToInt64(paramMessageID.Value);
				return true;
			}
		}
        static public DataTable message_unapproved(string connectionString, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_unapproved"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_forumID", NpgsqlDbType.Integer)).Value = forumID;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public DataTable message_findunread(string connectionString, object topicID, object messageId, object lastRead, object showDeleted, object authorUserID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_findunread"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
				cmd.Parameters.Add(new NpgsqlParameter("i_lastread", NpgsqlDbType.Timestamp)).Value = lastRead;
                cmd.Parameters.Add(new NpgsqlParameter("i_showdeleted", NpgsqlDbType.Boolean)).Value = showDeleted;
                cmd.Parameters.Add(new NpgsqlParameter("i_authoruserid", NpgsqlDbType.Integer)).Value = authorUserID;
                DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
				return dt;
			}
		}

		// message movind function
        static public void message_move(string connectionString, object messageID, object moveToTopic, bool moveAll)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_movetotopic", NpgsqlDbType.Integer)).Value = moveToTopic;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
			//moveAll=true anyway
			// it's in charge of moving answers of moved post
			if (moveAll)
			{
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getReplies"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				   
					DataTable tbReplies = PostgreDBAccess.Current.GetData(cmd,connectionString);
					foreach (DataRow row in tbReplies.Rows)
					{
                        message_moveRecursively(connectionString,row["MessageID"], moveToTopic);
					}

				}
			}
		}

		//moves answers of moved post
		static private void message_moveRecursively(string connectionString, object messageID, object moveToTopic)
		{
            bool UseFileTable = GetBooleanRegistryValue(connectionString, "UseFileTable");

			//Delete replies
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getReplies"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				
				DataTable tbReplies = PostgreDBAccess.Current.GetData(cmd,connectionString);
				foreach (DataRow row in tbReplies.Rows)
				{
                    message_moveRecursively(connectionString, row["messageID"], moveToTopic);
				}
				using (NpgsqlCommand innercmd = PostgreDBAccess.GetCommand("message_move"))
				{
					innercmd.CommandType = CommandType.StoredProcedure;

					innercmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
					innercmd.Parameters.Add(new NpgsqlParameter("i_movetotopic", NpgsqlDbType.Integer)).Value = moveToTopic;
					
					PostgreDBAccess.Current.ExecuteNonQuery(innercmd,connectionString);
				}
			}
		}



		// functions for Thanks feature

		// <summary> Checks if the message with the provided messageID is thanked 
		//           by the user with the provided UserID. if so, returns true,
		//           otherwise returns false. </summary>
        static public bool message_isThankedByUser(string connectionString, object userID, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_isthankedbyuser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;               
			  
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
						   
				return Convert.ToBoolean( PostgreDBAccess.Current.ExecuteScalar(cmd,connectionString) );
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
        public static bool user_ThankedMessage(string connectionString,object messageId, object userId)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_thankedmessage"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
          
                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                int thankCount = (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

                return thankCount > 0;
            }
        }

        public static int user_ThankFromCount(string connectionString,[NotNull] object userId)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_thankfromcount"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                var thankCount = (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

                return thankCount;
            }
        }
		// <summary> Return the number of times the message with the provided messageID
		//           has been thanked. </summary>
        static public int message_ThanksNumber(string connectionString, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_thanksnumber"))
			{
				cmd.CommandType = CommandType.StoredProcedure;                            
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
							
				return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}

		// <summary> Returns the UserIDs and UserNames who have thanked the message
		//           with the provided messageID. </summary>
        static public DataTable message_GetThanks(string connectionString, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		// <summary> Retuns All the Thanks for the Message IDs which are in the 
		//           delimited string variable MessageIDs </summary>
        static public DataTable message_GetAllThanks(string connectionString, object messageIDs)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;           
				cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIDs;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable message_GetTextByIds(string connectionString, string messageIDs)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_gettextbyids"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIDs;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static IEnumerable<TypedAllThanks> MessageGetAllThanks(string connectionString, string messageIdsSeparatedWithColon)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_getallthanks"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_messageids", NpgsqlDbType.Text)).Value = messageIdsSeparatedWithColon;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(t => new TypedAllThanks(t));
            }
        }

        static public string message_AddThanks(string connectionString, object fromUserID, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_addthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			 // var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar);
			 // paramOutput.Direction = ParameterDirection.Output;                  
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
						  
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString();
			  //return paramOutput.Value.ToString();                
			}
		}

        static public string message_RemoveThanks(string connectionString, object fromUserID, object messageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_removethanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
			   
				PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString();
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
        public static DataTable messagehistory_list(string connectionString, int messageID, int daysToClean)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("messagehistory_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_daystoclean", NpgsqlDbType.Integer)).Value = daysToClean;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		/// <summary>
		/// Returns message data based on user access rights
		/// </summary>
		/// <param name="MessageID">The Message Id.</param>
		/// <param name="UserID">The UserId.</param>
		/// <returns></returns>
        public static DataTable message_secdata(string connectionString, int MessageID, object pageUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("message_secdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = MessageID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;               

				return PostgreDBAccess.Current.GetData(cmd,connectionString);

			}
		}

		#endregion
	  
		#region yaf_Medal

		
		/// <summary>
		/// Lists medals.
		/// </summary>
		/// <param name="boardId">ID of board of which medals to list. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to list. When specified, boardId and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to list. Must be complemented with not-null boardId parameter.</param>
        static public DataTable medal_list(string connectionString, object boardId, object medalID, object category)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("medal_list"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }
				if (category == null) { category = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_category", NpgsqlDbType.Varchar)).Value = category;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


		/// <summary>
		/// List users who own this medal.
		/// </summary>
		/// <param name="medalID">Medal of which owners to get.</param>
		/// <returns>List of users with their user id and usernames, who own this medal.</returns>
        static public DataTable medal_listusers(string connectionString, object medalID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("medal_listusers"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}


		

		/// <summary>
		/// Deletes medals.
		/// </summary>
		/// <param name="boardId">ID of board of which medals to delete. Can be null if medalID parameter is specified.</param>
		/// <param name="medalID">ID of medal to delete. When specified, boardId and category parameters are ignored.</param>
		/// <param name="category">Cateogry of medals to delete. Must be complemented with not-null boardId parameter.</param>
        static public void medal_delete(string connectionString, object boardId, object medalID, object category)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("medal_delete"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }
				if (category == null) { category = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_category", NpgsqlDbType.Varchar)).Value = category;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        static public bool medal_save(string connectionString, 
			object boardId, object medalID, object name, object description, object message, object category,
			object medalURL, object ribbonURL, object smallMedalURL, object smallRibbonURL, object smallMedalWidth,
			object smallMedalHeight, object smallRibbonWidth, object smallRibbonHeight, object sortOrder, object flags)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("medal_save"))
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
				// bool rres = (PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString) > 0);
				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString)) > 0;

			}
		}


		/// <summary>
		/// Changes medal's sort order.
		/// </summary>
		/// <param name="boardId">ID of board.</param>
		/// <param name="medalID">ID of medal to re-sort.</param>
		/// <param name="move">Change of sort.</param>
        static public void medal_resort(string connectionString, object boardId, object medalID, int move)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("medal_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_move", NpgsqlDbType.Integer)).Value = move;
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}


		/// <summary>
		/// Deletes medal allocation to a group.
		/// </summary>
		/// <param name="groupID">ID of group owning medal.</param>
		/// <param name="medalID">ID of medal.</param>
        static public void group_medal_delete(string connectionString, object groupID, object medalID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="groupID">ID of group of which to list medals.</param>
		/// <param name="medalID">ID of medal to list.</param>
        static public DataTable group_medal_list(string connectionString, object groupID, object medalID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_medal_list"))
			{
				if (groupID == null) { groupID = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        static public void group_medal_save(string connectionString,
			object groupID, object medalID, object message,
			object hide, object onlyRibbon, object sortOrder)
		{
			int sortOrderOut = 0;
			bool result = Int32.TryParse(sortOrder.ToString(), out sortOrderOut);
			if (result)
			{
				if (sortOrderOut >= 255) { sortOrderOut = 0; }
			}

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_medal_save"))
			{
				if (message == null) { message = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Varchar)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_hide", NpgsqlDbType.Boolean)).Value = hide;
				cmd.Parameters.Add(new NpgsqlParameter("i_onlyribbon", NpgsqlDbType.Boolean)).Value = onlyRibbon;
				cmd.Parameters.Add(new NpgsqlParameter("i_sortorder", NpgsqlDbType.Smallint)).Value = sortOrderOut;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}



		/// <summary>
		/// Deletes medal allocation to a user.
		/// </summary>
		/// <param name="userId">ID of user owning medal.</param>
		/// <param name="medalID">ID of medal.</param>
		static public void user_medal_delete(string connectionString,object userId, object medalID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_medal_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}


		/// <summary>
		/// Lists medal(s) assigned to the group
		/// </summary>
		/// <param name="userId">ID of user who was given medal.</param>
		/// <param name="medalID">ID of medal to list.</param>
		static public DataTable user_medal_list(string connectionString,object userId, object medalID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_medal_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
				if (medalID == null) { medalID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_medalid", NpgsqlDbType.Integer)).Value = medalID;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
		static public void user_medal_save(string connectionString,
			object userId, object medalID, object message,
			object hide, object onlyRibbon, object sortOrder, object dateAwarded)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_medal_save"))
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
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}


		/// <summary>
		/// Lists all medals held by user as they are to be shown in user box.
		/// </summary>
		/// <param name="userId">ID of user.</param>
		/// <returns>List of medals, ribbon bar only first.</returns>
		static public DataTable user_listmedals(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_listmedals"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		#endregion        
		
		#region yaf_NntpForum
        public static IEnumerable<TypedNntpForum> NntpForumList(string connectionString, int boardId, int? minutes, int? nntpForumID, bool? active)
        {
            using (var cmd = PostgreDBAccess.GetCommand("nntpforum_list"))
            {

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_minutes", NpgsqlDbType.Integer)).Value = minutes;
                cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
                cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(r => new TypedNntpForum(r));
            }
        }

        static public DataTable nntpforum_list(string connectionString, object boardId, object minutes, object nntpForumID, object active)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpforum_list"))
			{
				if (minutes == null) { minutes = DBNull.Value; }
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }
				if (active == null) { active = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_minutes", NpgsqlDbType.Integer)).Value = minutes;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;
			   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void nntpforum_update(string connectionString, object nntpForumID, object lastMessageNo, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpforum_update"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_lastmessageno", NpgsqlDbType.Integer)).Value = lastMessageNo;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void nntpforum_save(string connectionString, object nntpForumID, object nntpServerID, object groupName, object forumID, object active, object cutoffdate)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpforum_save"))
			{
				if (nntpForumID == null) { nntpForumID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;                

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupname", NpgsqlDbType.Varchar)).Value = groupName;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_active", NpgsqlDbType.Boolean)).Value = active;
                cmd.Parameters.Add(new NpgsqlParameter("i_cutoffdate", NpgsqlDbType.Boolean)).Value = cutoffdate;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void nntpforum_delete(string connectionString, object nntpForumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpforumid", NpgsqlDbType.Integer)).Value = nntpForumID;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_NntpServer
        static public DataTable nntpserver_list(string connectionString, object boardId, object nntpServerID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpserver_list"))
			{
				if (boardId == null) { boardId = DBNull.Value; }
				if (nntpServerID == null) { nntpServerID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
						  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void nntpserver_save(string connectionString, object nntpServerID, object boardId, object name, object address, object port, object userName, object userPass)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpserver_save"))
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
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void nntpserver_delete(string connectionString, object nntpServerID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntpserver_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_nntpserverid", NpgsqlDbType.Integer)).Value = nntpServerID;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion        
		
		#region yaf_NntpTopic
        static public DataTable nntptopic_list(string connectionString, object thread)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntptopic_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_thread", NpgsqlDbType.Varchar)).Value = thread;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void nntptopic_savemessage(string connectionString,
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("nntptopic_savemessage")) 
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
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
		static public DataTable pmessage_list(string connectionString,object toUserID, object fromUserID, object userPMessageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_list"))
			{
				if (fromUserID == null) { fromUserID = DBNull.Value; }
				if (toUserID == null) { toUserID = DBNull.Value; }
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = toUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		
		/// <summary>
		/// Deletes the private message from the database as per the given parameter.  If <paramref name="fromOutbox"/> is true,
		/// the message is only removed from the user's outbox.  Otherwise, it is completely delete from the database.
		/// </summary>
		/// <param name="pMessageID"></param>
		/// <param name="fromOutbox">If true, removes the message from the outbox.  Otherwise deletes the message completely.</param>
        static public void pmessage_delete(string connectionString, object userPMessageID, bool fromOutbox)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_delete"))
			{
				// if (fromOutbox != false || fromOutbox != true) { fromOutbox = false; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromoutbox", NpgsqlDbType.Boolean)).Value = fromOutbox;
				 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		
		/// <summary>
		/// Archives the private message of the given id.  Archiving moves the message from the user's inbox to his message archive.
		/// </summary>
		/// <param name="pMessageID">The ID of the private message</param>
        public static void pmessage_archive(string connectionString, object userPMessageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_archive"))
			{
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }
				
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        static public void pmessage_save(string connectionString, object fromUserID, object toUserID, object subject, object body, object Flags)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = fromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = toUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_subject", NpgsqlDbType.Varchar)).Value = subject;
				cmd.Parameters.Add(new NpgsqlParameter("i_body", NpgsqlDbType.Text)).Value = body;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = Flags;
						
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void pmessage_markread(string connectionString, object userPMessageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_markread"))
			{
				if (userPMessageID == null) { userPMessageID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userpmessageid", NpgsqlDbType.Integer)).Value = userPMessageID;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public DataTable pmessage_info(string connectionString)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_info"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
        static public void pmessage_prune(string connectionString, object daysRead, object daysUnread)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pmessage_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_daysread", NpgsqlDbType.Integer)).Value = daysRead;
				cmd.Parameters.Add(new NpgsqlParameter("i_daysunread", NpgsqlDbType.Integer)).Value = daysUnread;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DataTable pollgroup_stats(string connectionString, int? pollGroupId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pollgroup_stats"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static int pollgroup_attach(string connectionString, int? pollGroupId, int? topicId, int? forumId, int? categoryId, int? boardId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pollgroup_attach"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("i_pollgroupid", pollGroupId);
                cmd.Parameters.AddWithValue("i_topicid", topicId);
                cmd.Parameters.AddWithValue("i_forumid", forumId);
                cmd.Parameters.AddWithValue("i_categoryid", categoryId);
                cmd.Parameters.AddWithValue("i_boardid", boardId);
                return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
            }
        }

        static public DataTable poll_stats(string connectionString, int? pollId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("poll_stats"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollId;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		/// <summary>
		/// The method saves many questions and answers to them in a single transaction 
		/// </summary>
		/// <param name="pollList">List to hold all polls data</param>
		/// <returns>Last saved poll id.</returns>
        public static int? poll_save(string connectionString, List<PollSaveList> pollList)
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
                        pgStr.Append(PostgreDBAccess.GetObjectName("topic"));
                        pgStr.Append(" WHERE topicid = :i_topicid; ");
                    }
                    else if (question.ForumId > 0)
                    {
                        pgStr.Append("select  pollgroupid  from ");
                        pgStr.Append(PostgreDBAccess.GetObjectName("forum"));
                        pgStr.Append(" WHERE forumid =:i_forumid");
                    }
                    else if (question.CategoryId > 0)
                    {
                        pgStr.Append("select pollgroupid  from ");
                        pgStr.Append(PostgreDBAccess.GetObjectName("category"));
                        pgStr.Append(" WHERE categoryid = :i_categoryid");
                    }

                using (NpgsqlCommand cmdPg = PostgreDBAccess.GetCommand(pgStr.ToString(), true))
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

                    object pgexist = PostgreDBAccess.Current.ExecuteScalar(cmdPg, true,connectionString);
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
                    pgStr.Append(PostgreDBAccess.GetObjectName("pollgroupcluster"));
                    pgStr.Append("(userid,flags ) VALUES(:i_userid, :i_flags) RETURNING pollgroupid; ");
                    using (NpgsqlCommand cmdPgIns = PostgreDBAccess.GetCommand(pgStr.ToString(), true))
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
                        pollGroup = (int?)PostgreDBAccess.Current.ExecuteScalar(cmdPgIns, true,connectionString);
                    }
                }

            
                
                
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("poll_save"))
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
                   

                    currPoll = (int?)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
				}

				
				// The cycle through question reply choices  
                int chl = question.Choice.GetUpperBound(1)+1;
                for (uint choiceCount = 0; choiceCount < chl; choiceCount++)
                {
                    if (question.Choice[0, choiceCount].Trim().Length > 0)
                    {
                        StringBuilder sbChoice = new StringBuilder();
                        sbChoice.Append("INSERT INTO ");
                        sbChoice.Append(PostgreDBAccess.GetObjectName("choice"));
                        sbChoice.AppendFormat(
                            "(pollid,choice,votes,objectpath,mimetype) VALUES (:pollid{0}, :choice{0}, :votes{0}, :objectpath{0}, :mimetype{0}); ",
                            choiceCount);
                        using (NpgsqlCommand cmdChoice = PostgreDBAccess.GetCommand(sbChoice.ToString(), true))
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
                                PostgreDBAccess.Current.ExecuteNonQuery(cmdChoice, true,connectionString);
                            }

                        }

                }
			    //   NpgsqlCommand cmd = new NpgsqlCommand();
				//  cmd.CommandText = paramSb.ToString() + ")" + sb.ToString();
				//   NpgsqlConnection con = PostgreDBAccess.Current.GetConnectionManager().DBConnection;
				// con.Open();
				//  cmd.Connection = con;
				//   IDbTransaction trans = cmd.Connection.BeginTransaction();
				//    cmd.Transaction = trans;
				//    cmd.CommandText = sb.ToString();


				/* using (NpgsqlCommand cmd1 = PostgreDBAccess.GetCommand(sb.ToString(), true))
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
                     int? result = (int?)PostgreDBAccess.Current.ExecuteNonQueryInt(cmd1, true);
				}
            */

                // Add pollgroup id to an object
                StringBuilder Usb = new StringBuilder();
                //cmd2.Parameters.Add(new NpgsqlParameter(":i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroup;
                if (question.TopicId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(PostgreDBAccess.GetObjectName("topic"));
                    Usb.Append(" SET pollid = :i_pollid WHERE topicid= :i_topicid; ");
                }
                else if (question.ForumId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(PostgreDBAccess.GetObjectName("forum"));
                    Usb.Append(" SET pollgroupid = :i_pollgroupid where forumid = :i_forumid; ");
                   
                }
                else if (question.CategoryId > 0)
                {
                    Usb.Append("UPDATE ");
                    Usb.Append(PostgreDBAccess.GetObjectName("category"));
                    Usb.Append(" SET pollgroupid = :i_pollgroupid where categoryid = :i_categoryid; ");
                }

               
                using (NpgsqlCommand cmd2 = PostgreDBAccess.GetCommand(Usb.ToString(), true))
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
                    PostgreDBAccess.Current.ExecuteNonQuery(cmd2,connectionString);
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


        static public void poll_update(string connectionString, object pollID, object question, object closes, object isBounded, bool isClosedBounded, bool allowMultipleChoices, bool showVoters, bool allowSkipVote, object questionPath, object questionMime)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("poll_update"))
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
      				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        static public void poll_remove(string connectionString, object pollGroupID, object pollID, object boardId, bool removeCompletely, bool removeEverywhere)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("poll_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_pollid", NpgsqlDbType.Integer)).Value = pollID;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_removecompletely", NpgsqlDbType.Boolean)).Value = removeCompletely;
                cmd.Parameters.Add(new NpgsqlParameter("i_removeeverywhere", NpgsqlDbType.Boolean)).Value = removeEverywhere;

                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static IEnumerable<TypedPollGroup> PollGroupList(string connectionString, int userID, int? forumId, int boardId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pollgroup_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(r => new TypedPollGroup(r));
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
        public static void pollgroup_remove(string connectionString, object pollGroupID, object topicId, object forumId, object categoryId, object boardId, bool removeCompletely, bool removeEverywhere)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("pollgroup_remove"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_pollgroupid", NpgsqlDbType.Integer)).Value = pollGroupID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumId;
                cmd.Parameters.Add(new NpgsqlParameter("i_categoryid", NpgsqlDbType.Integer)).Value = categoryId;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_removecompletely", NpgsqlDbType.Boolean)).Value = removeCompletely;
                cmd.Parameters.Add(new NpgsqlParameter("i_removeeverywhere", NpgsqlDbType.Boolean)).Value = removeEverywhere;

                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }


        static public void choice_delete(string connectionString, object choiceID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("choice_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void choice_update(string connectionString, object choiceID, object choice, object path, object mime)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("choice_update"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_choiceid", NpgsqlDbType.Integer)).Value = choiceID;
				cmd.Parameters.Add(new NpgsqlParameter("i_choice", NpgsqlDbType.Varchar)).Value = choice;
                cmd.Parameters.Add(new NpgsqlParameter("i_objectpath", NpgsqlDbType.Varchar)).Value =  path;
                cmd.Parameters.Add(new NpgsqlParameter("i_mimetype", NpgsqlDbType.Varchar)).Value =  mime;

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void choice_add(string connectionString, object pollID, object choice, object path, object mime)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("choice_add"))
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
				
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString); 
			 }            
		}

		#endregion
		
		#region yaf_Rank
        static public DataTable rank_list(string connectionString, object boardId, object rankID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("rank_list"))
			{
				if (rankID == null) { rankID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
							  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        static public void rank_save(string connectionString, object rankID, object boardId, object name, 
			object isStart, object isLadder, object minPosts, object rankImage,
			object pmLimit, object style, object sortOrder,
			object description,
			object usrSigChars,
			object usrSigBBCodes,
			object usrSigHTMLTags,
			object usrAlbums,
			object usrAlbumImages)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("rank_save"))
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

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void rank_delete(string connectionString, object rankID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("rank_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_Smiley
        static public DataTable smiley_list(string connectionString, object boardId, object smileyID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_list"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
							 
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static IEnumerable<TypedSmileyList> SmileyList(string connectionString, int boardId, int? smileyID)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(r => new TypedSmileyList(r));
            }
        }

        static public DataTable smiley_listunique(string connectionString, object boardId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_listunique"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void smiley_delete(string connectionString,object smileyID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_delete"))
			{
				if (smileyID == null) { smileyID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
											   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void smiley_save(string connectionString, object smileyID, object boardId, object code, object icon, object emoticon, object sortOrder, object replace)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_save"))
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
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
        static public void smiley_resort(string connectionString, object boardId, object smileyID, int move)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("smiley_resort"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_smileyid", NpgsqlDbType.Integer)).Value = smileyID;
				cmd.Parameters.Add(new NpgsqlParameter("i_move", NpgsqlDbType.Integer)).Value = move;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static IEnumerable<TypedBBCode> BBCodeList(string connectionString, int boardID, int? bbcodeID)
        {
            return bbcode_list(connectionString,boardID, bbcodeID).AsEnumerable().Select(o => new TypedBBCode(o));
        }

        static public DataTable bbcode_list(string connectionString, object boardId, object bbcodeID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("bbcode_list"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_bbcodeid", NpgsqlDbType.Integer)).Value = bbcodeID;
							
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void bbcode_delete(string connectionString, object bbcodeID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("bbcode_delete"))
			{
				if (bbcodeID == null) { bbcodeID = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_bbcodeid", NpgsqlDbType.Integer)).Value = bbcodeID;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void bbcode_save(string connectionString, object bbcodeID, object boardId, object name, object description, object onclickjs, object displayjs, object editjs, object displaycss, object searchregex, object replaceregex, object variables, object usemodule, object moduleclass, object execorder)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("bbcode_save"))
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
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_Registry
		/// <summary>
		/// Retrieves entries in the board settings registry
		/// </summary>
		/// <param name="Name">Use to specify return of specific entry only. Setting this to null returns all entries.</param>
		/// <returns>DataTable filled will registry entries</returns>
        static public DataTable registry_list(string connectionString, object name, object boardId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("registry_list"))
			{
				if (name == null) { name = DBNull.Value; }
				if (boardId == null) { boardId = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;


                return PostgreDBAccess.Current.GetData(cmd, connectionString);
			}
		}

        /// <summary>
        /// Retrieves entries in the board settings registry
        /// </summary>
        /// <param name="Name">Use to specify return of specific entry only. Setting this to null returns all entries.</param>
        /// <returns>DataTable filled will registry entries</returns>
        static public DataTable registry_list(string connectionString,
            [NotNull]object name)
        {
            return registry_list(connectionString, name, null);
        }
        /// <summary>
        /// Retrieves all the entries in the board settings registry
        /// </summary>
        /// <returns>DataTable filled will all registry entries</returns>
        static public DataTable registry_list(string connectionString)
        {
            return registry_list(connectionString, null, null);
        }


		/// <summary>
		/// Saves a single registry entry pair to the database.
		/// </summary>
		/// <param name="Name">Unique name associated with this entry</param>
		/// <param name="Value">Value associated with this entry which can be null</param>
		/// <param name="BoardID">The BoardID for this entry</param>
        static public void registry_save(string connectionString, object name, object value, object boardId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("registry_save"))
			{
				if (value == null) { value = DBNull.Value; }
				if (boardId == null) { boardId = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_value", NpgsqlDbType.Varchar)).Value = value;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_System
		/// <summary>
		/// Not in use anymore. Only required for old database versions.
		/// </summary>
		/// <returns></returns>
		static public DataTable system_list(string connectionString)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("system_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		#endregion
		
		#region yaf_Topic

		//TODO: Overloaded method for 1.9.3 FINAL comatability should be deleted beginning with v.2373
		static public int topic_prune(string connectionString,object forumID, object days)
		{
			int boardId = 0;
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand(String.Format("SELECT c.boardid FROM {0} f INNER JOIN {1} c ON f.categoryid=c.categoryd  WHERE forumid = @i_forumID;", PostgreDBAccess.GetObjectName("Forum"), PostgreDBAccess.GetObjectName("Category")), true))
			{

				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);
				boardId = Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
			}
            
			return topic_prune(connectionString,boardId, forumID, days, true);

		}

        public static void topic_updatetopic(string connectionString,int topicId, string topic)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_updatetopic"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicId;
                cmd.Parameters.Add(new NpgsqlParameter("i_topic", NpgsqlDbType.Varchar)).Value = topic;
                
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }

		static public int topic_prune(string connectionString,object boardId, object forumID, object days, object permDelete)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_prune"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
			   
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_days", NpgsqlDbType.Integer)).Value = days;
				cmd.Parameters.Add(new NpgsqlParameter("i_permdelete", NpgsqlDbType.Boolean)).Value = Convert.ToBoolean(permDelete);
							  
				return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}

        static public DataTable topic_list(
            string connectionString,
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_list"))
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
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        public static DataTable announcements_list(string connectionString, [NotNull] object forumID, [NotNull] object userId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [NotNull] object showMoved, [CanBeNull]bool findLastRead)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("announcements_list"))
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

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

		/// <summary>
		/// Lists topics very simply (for URL rewriting)
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
		static public DataTable topic_simplelist(string connectionString,int StartID, int Limit)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
			 
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void topic_move(string connectionString,object topicID, object forumID, object showMoved)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_move"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_showmoved", NpgsqlDbType.Boolean)).Value = showMoved;
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public DataTable topic_announcements(string connectionString,object boardId, object numOfPostsToRetrieve, object pageUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_announcements"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
			  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        static public DataTable topic_latest(string connectionString, object boardId, object numOfPostsToRetrieve, object pageUserId, bool useStyledNicks, bool showNoCountPosts, bool findLastRead)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_latest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
                cmd.Parameters.Add(new NpgsqlParameter("i_findlastread", NpgsqlDbType.Boolean)).Value = findLastRead;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable rss_topic_latest(string connectionString, object boardId, object numOfPostsToRetrieve, object pageUserId, bool useStyledNicks, bool showNoCountPosts)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("rss_topic_latest"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_numposts", NpgsqlDbType.Integer)).Value = numOfPostsToRetrieve;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
                cmd.Parameters.Add(new NpgsqlParameter("i_shownocountposts", NpgsqlDbType.Boolean)).Value = showNoCountPosts;
             
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            }
        }

        public static DataTable topic_active([NotNull] string connectionString, [NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = PostgreDBAccess.GetCommand("topic_active"))
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

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

        static private void topic_deleteAttachments(string connectionString, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_listmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
			   
				using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
				{
					foreach (DataRow row in dt.Rows)
					{
                        message_deleteRecursively(connectionString, row["MessageID"], true, "", 0, true, false);
					}
				}
			}
		}

  
        static public void topic_delete(string connectionString, object topicID)
        {
            topic_delete(connectionString, topicID, false);
        }

		static public void topic_delete(string connectionString,object topicID, object eraseTopic)
		{
            topic_deleteAttachments(connectionString, topicID);
		  
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_delete"))
			{
				//if (op == null) { smileyID = DBNull.Value; }
				if (eraseTopic == null) { eraseTopic = 0; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_updatelastpost", NpgsqlDbType.Boolean)).Value = true;
				cmd.Parameters.Add(new NpgsqlParameter("i_erasetopic", NpgsqlDbType.Boolean)).Value = eraseTopic;
					   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public DataTable topic_findprev(string connectionString,object topicID)
		{
			DataTable dt;
			DataRow dr;
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_findprev"))
			{               
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
					
					dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
					dr = dt.Rows[0];
					if (dt.Rows[0][0] == DBNull.Value) 
					{
						return new DataTable();
					}

					return dt;               
			}
		}
		static public DataTable topic_findnext(string connectionString,object topicID)
		{
			DataTable dt;
			DataRow dr;
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_findnext"))
			{ 
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
			  
				dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
				dr = dt.Rows[0];
				if (dt.Rows[0][0] == DBNull.Value)             
				{
		 
					return new DataTable();
				}

				return dt;     
			}
		}
		static public void topic_lock(string connectionString,object topicID, object locked)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_lock"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_locked", NpgsqlDbType.Boolean)).Value = locked;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        static public long topic_save(
            string connectionString,
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_save"))
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
			   
				DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
				messageID = long.Parse(dt.Rows[0]["MessageID"].ToString());
				return long.Parse(dt.Rows[0]["TopicID"].ToString());
			}
		}
		static public DataRow topic_info(string connectionString,object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_info"))
			{
				//if (op == null) { smileyID = DBNull.Value; }
				if (topicID == null) { topicID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_showdeleted", NpgsqlDbType.Boolean)).Value = false;
							   
				using (DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString))
				{
					if (dt.Rows.Count > 0)
						return dt.Rows[0];
					else
						return null;
				}
			}
		}

        public static int topic_findduplicate(string connectionString,object topicName)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_findduplicate"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicname", NpgsqlDbType.Varchar)).Value = topicName;
                return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

            }
        }
        public static DataTable topic_favorite_details([NotNull] string connectionString, [NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = PostgreDBAccess.GetCommand("topic_favorite_details"))
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

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
		public static DataTable topic_favorite_list(string connectionString,object userID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_favorite_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
		public static void topic_favorite_remove(string connectionString,object userID, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_favorite_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
						 PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
		public static void topic_favorite_add(string connectionString,object userID, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_favorite_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        /// <summary>
        /// Get the favorite count for a topic...
        /// </summary>
        /// <param name="topicId">
        /// The topic Id.
        /// </param>
        public static int TopicFavoriteCount(string connectionString,int topicId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("topic_favorite_count"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid",  NpgsqlDbType.Integer)).Value = topicId;

                return PostgreDBAccess.Current.GetData(cmd,connectionString).GetFirstRowColumnAsValue("FavoriteCount", 0);
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
        public static DataTable topic_unanswered([NotNull] string connectionString, [NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = PostgreDBAccess.GetCommand("topic_unanswered"))
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
                
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

        public static DataTable topic_unread([NotNull] string connectionString, [NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = PostgreDBAccess.GetCommand("topic_unread"))
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

                return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
        public static DataTable Topics_ByUser([NotNull] string connectionString, [NotNull] object boardId, [CanBeNull] object categoryId, [NotNull] object pageUserId, [NotNull] object sinceDate, [NotNull] object toDate, [NotNull] object pageIndex, [NotNull] object pageSize, [NotNull] object useStyledNicks, [CanBeNull]bool findLastRead)
        {
            using (var cmd = PostgreDBAccess.GetCommand("topics_byuser"))
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
                
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }
        /// <summary>
        /// Delete a topic status.
        /// </summary>
        /// <param name="topicStatusID">The topic status ID.</param>
        public static void TopicStatus_Delete(string connectionString, [NotNull] object topicStatusID)
        {
            try
            {
                using (var cmd = PostgreDBAccess.GetCommand("TopicStatus_Delete"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
                    PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DataTable TopicStatus_Edit(string connectionString, [NotNull] object topicStatusID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("TopicStatus_Edit"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

        /// <summary>
        /// List all Topics of the Current Board
        /// </summary>
        /// <param name="boardID">The board ID.</param>
        /// <returns></returns>
        public static DataTable TopicStatus_List(string connectionString, [NotNull] object boardID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("TopicStatus_List"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_BoardID", NpgsqlDbType.Integer).Value = boardID;
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

        /// <summary>
        /// Saves a topic status
        /// </summary>
        /// <param name="topicStatusID">The topic status ID.</param>
        /// <param name="boardID">The board ID.</param>
        /// <param name="topicStatusName">Name of the topic status.</param>
        /// <param name="defaultDescription">The default description.</param>
        public static void TopicStatus_Save(string connectionString, [NotNull] object topicStatusID, [NotNull] object boardID, [NotNull] object topicStatusName, [NotNull] object defaultDescription)
        {
            try
            {
                using (var cmd = PostgreDBAccess.GetCommand("TopicStatus_Save"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("i_TopicStatusID", NpgsqlDbType.Integer).Value = topicStatusID;
                    cmd.Parameters.Add("i_BoardID", NpgsqlDbType.Integer).Value = boardID;
                    cmd.Parameters.Add("i_TopicStatusName", NpgsqlDbType.Varchar).Value = topicStatusName;
                    cmd.Parameters.Add("i_DefaultDescription", NpgsqlDbType.Varchar).Value = defaultDescription;

                    PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        static public DataTable replace_words_list(string connectionString, object boardId, object id)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("replace_words_list"))
			{
				if (id == null) { id = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		/// <summary>
		/// Saves changs to a words
		/// </summary>
		/// <param name="id">ID of bad/good word</param>
		/// <param name="badword">bad word</param>
		/// <param name="goodword">good word</param>
        static public void replace_words_save(string connectionString, object boardId, object id, object badword, object goodword)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("replace_words_save"))
			{
				if (id == null) { id = DBNull.Value; }
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;  
				cmd.Parameters.Add(new NpgsqlParameter("i_badword", NpgsqlDbType.Varchar)).Value = badword;
				cmd.Parameters.Add(new NpgsqlParameter("i_goodword", NpgsqlDbType.Varchar)).Value = goodword;
							
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Deletes a bad/good word
		/// </summary>
		/// <param name="ID">ID of bad/good word to delete</param>
        static public void replace_words_delete(string connectionString, object id)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("replace_words_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_id", NpgsqlDbType.Integer)).Value = id;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
	   
		#region yaf_IgnoreUser

		static public void user_addignoreduser(string connectionString,object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_addignoreduser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public void user_removeignoreduser(string connectionString,object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_removeignoreduser"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public bool user_isuserignored(string connectionString,object userId, object ignoredUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_isuserignored"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ignoreduserid", NpgsqlDbType.Integer)).Value = ignoredUserId;
				cmd.Parameters.Add("result", NpgsqlDbType.Boolean);
				cmd.Parameters["result"].Direction = ParameterDirection.ReturnValue;
								
				return Convert.ToBoolean(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
			}
		}

		static public DataTable user_ignoredlist(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_ignoredlist"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
	public static DataRow user_lazydata(string connectionString,object userID, object boardID, bool showPendingMails, bool showPendingBuddies, bool showUnreadPMs, bool showUserAlbums, bool styledNicks)
	{
		using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_lazydata"))
		{
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
			cmd.Parameters.Add(new NpgsqlParameter("i_boardid",NpgsqlDbType.Integer)).Value =  boardID;
			cmd.Parameters.Add(new NpgsqlParameter("i_showpendingmails", NpgsqlDbType.Boolean)).Value = showPendingMails;
			cmd.Parameters.Add(new NpgsqlParameter("i_showpendingbuddies", NpgsqlDbType.Boolean)).Value = showPendingBuddies;
			cmd.Parameters.Add(new NpgsqlParameter("i_showunreadpms", NpgsqlDbType.Boolean)).Value = showUnreadPMs;
			cmd.Parameters.Add(new NpgsqlParameter("i_showuseralbums", NpgsqlDbType.Boolean)).Value = showUserAlbums;
			cmd.Parameters.Add(new NpgsqlParameter("i_showuserstyle", NpgsqlDbType.Boolean)).Value = styledNicks;
			return PostgreDBAccess.Current.GetData(cmd,connectionString).Rows[0];
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
		static public DataTable user_list(string connectionString,object boardId, object userId, object approved, object groupID, object rankID, object useStyledNicks)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_list"))
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
				  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static IEnumerable<TypedUserList> UserList(string connectionString,int boardId, int? userId, bool? approved, int? groupID, int? rankID, bool? useStyledNicks)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_list"))
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

                return PostgreDBAccess.Current.GetData(cmd,connectionString).AsEnumerable().Select(x => new TypedUserList(x));
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
        public static DataTable User_ListTodaysBirthdays(string connectionString, [NotNull] object boardID, [CanBeNull] object useStyledNicks)
        {
            // Profile columns cannot yet exist when we first are gettinng data.
            try
            {
                var sqlBuilder = new StringBuilder("SELECT up.Birthday, up.UserID, u.TimeZone, u.name as UserName,u.DisplayName, (case(:i_stylednicks) when TRUE then  COALESCE(( SELECT f.Style FROM ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("usergroup"));
                sqlBuilder.Append(" e join ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("Group"));
                sqlBuilder.Append(" f on f.groupid=e.groupid WHERE e.UserID=u.UserID AND LENGTH(f.style) > 2 ORDER BY f.sortorder LIMIT 1), r.Style) else '' end) AS Style ");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("userprofile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("user"));
                sqlBuilder.Append(" u ON u.userid = up.userid JOIN ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("Rank"));
                sqlBuilder.Append(" r ON r.rankid = u.rankid where extract(day  from up.Birthday) = extract(day  from :i_currentdate) and extract(month  from up.Birthday) = extract(month  from :i_currentdate);");
                using (var cmd = PostgreDBAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value = useStyledNicks;
                    cmd.Parameters.Add("i_currentdate", NpgsqlDbType.TimestampTZ).Value = DateTime.UtcNow;

                    return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
        public static DataTable User_ListProfilesByIdsList(string connectionString, [NotNull] int[] userIdsList, [CanBeNull] object useStyledNicks)
        {
            string stIds = userIdsList.Aggregate(string.Empty, (current, userId) => current + (',' + userId)).Trim(',');
            // Profile columns cannot yet exist when we first are gettinng data.
            try
            {
                var sqlBuilder = new StringBuilder(" ");
                sqlBuilder.Append("SELECT up.*, u.Name as UserName,u.DisplayName,(case(:StyledNicks) when 1 then  COALESCE(( SELECT f.Style FROM ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("UserGroup"));
                sqlBuilder.Append(" e join ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("Group"));
                sqlBuilder.Append(" f on f.GroupID=e.GroupID WHERE e.UserID=u.UserID AND LEN(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), r.Style) else '' end) AS Style");
                sqlBuilder.Append(" FROM ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("UserProfile"));
                sqlBuilder.Append(" up JOIN ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("User"));
                sqlBuilder.Append(" u ON u.UserID = up.UserID JOIN ");
                sqlBuilder.Append(PostgreDBAccess.GetObjectName("Rank"));
                sqlBuilder.AppendFormat(" r ON r.RankID = u.RankID where UserID IN ({0})  ", stIds);
                using (var cmd = PostgreDBAccess.GetCommand(sqlBuilder.ToString(), true))
                {
                    cmd.Parameters.Add("i_stylednicks", NpgsqlDbType.Boolean).Value = useStyledNicks;
                    return PostgreDBAccess.Current.GetData(cmd, connectionString);
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
        public static void SetPropertyValues(string connectionString, int boardId, string appname, int userId, SettingsPropertyValueCollection collection, bool dirtyOnly = true)
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
            List<SettingsPropertyColumn> spc = LoadFromPropertyValueCollection(connectionString,collection);

            if (spc != null && spc.Count > 0)
            {
                // start saving...
                LegacyDb.SetProfileProperties(connectionString,boardId, appname, userId, collection, spc, dirtyOnly);
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
        public static void SetProfileProperties(string connectinString, [NotNull] int boardId, [NotNull] object appName, [NotNull] int userID, [NotNull] SettingsPropertyValueCollection values, [NotNull] List<SettingsPropertyColumn> settingsColumnsList, bool dirtyOnly)
        {
            string userName = string.Empty;
            var dtu = LegacyDb.UserList(connectinString, boardId, userID, true, null, null, true);
            foreach (var typedUserList in dtu)
            {
                userName = typedUserList.Name;
                break;

            }
            if (userName.IsNotSet())
            {
                return;
            }
            using (var conn = new PostgreDbConnectionManager().OpenDBConnection)
            {
                var cmd = new NpgsqlCommand();

                cmd.Connection = conn;

                string table = PostgreDBAccess.GetObjectName("UserProfile");
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
        public static DataTable GetProfileStructure(string connectionString)
        {
            string sql = @"SELECT * FROM {0} LIMIT 1".FormatWith(PostgreDBAccess.GetObjectName("UserProfile"));

            using (var cmd = PostgreDBAccess.GetCommand(sql, true))
            {
                cmd.CommandType = CommandType.Text;
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static void AddProfileColumn([NotNull]string connectionString, [NotNull] string name, NpgsqlDbType columnType, int size)
        {
            // get column type...
            string type = columnType.ToString();

            if (size > 0)
            {
                type += "(" + size + ")";
            }

            string sql = "ALTER TABLE {0} ADD {1} {2}".FormatWith(
              PostgreDBAccess.GetObjectName("userprofile"), name, type);

            using (var cmd = PostgreDBAccess.GetCommand(sql, true))
            {
                cmd.CommandType = CommandType.Text;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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

        static List<SettingsPropertyColumn> LoadFromPropertyValueCollection(string connectionString, SettingsPropertyValueCollection collection)
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
            DataTable structure = LegacyDb.GetProfileStructure(connectionString);

            // verify all the columns are there...
            foreach (SettingsPropertyColumn column in settingsColumnsList)
            {
                // see if this column exists
                if (!structure.Columns.Contains(column.Settings.Name))
                {
                    // if not, create it...
                    LegacyDb.AddProfileColumn(connectionString, column.Settings.Name, column.DataType, column.Size);
                }
            }
            return settingsColumnsList;
        }

        #endregion
        public static DataTable admin_list(string connectionString, int? boardId, object useStyledNicks)
        {
            using (var cmd = PostgreDBAccess.GetCommand("admin_list"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
                cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;

                return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable user_listmembers(string connectionString,
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
            using (var cmd = PostgreDBAccess.GetCommand("user_listmembers"))
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

                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            }
        }

		/// <summary>
		/// For URL Rewriting
		/// </summary>
		/// <param name="StartID"></param>
		/// <param name="Limit"></param>
		/// <returns></returns>
		static public DataTable user_simplelist(string connectionString,int StartID, int Limit)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_simplelist"))
			{
				if (StartID <= 0) { StartID = 0; }
				if (Limit <= 0) { Limit = 500; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_startid", NpgsqlDbType.Integer)).Value = StartID;
				cmd.Parameters.Add(new NpgsqlParameter("i_limit", NpgsqlDbType.Integer)).Value = Limit;
							 
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void user_delete(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_setrole(string connectionString,int boardId, object providerUserKey, object role)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_setrole"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
				cmd.Parameters.Add(new NpgsqlParameter("i_role", NpgsqlDbType.Varchar)).Value = role;
						
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		// TODO: is not used anywhere? 
		static public void user_setinfo(string connectionString,int boardId, System.Web.Security.MembershipUser user)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("update {databaseOwner}.{objectQualifier}User set Name=i_UserName,Email=i_Email where BoardID=i_BoardID and ProviderUserKey=i_ProviderUserKey", true))
			{
				cmd.CommandType = CommandType.Text;

				cmd.Parameters.Add(new NpgsqlParameter("i_UserName", NpgsqlDbType.Varchar)).Value = user.UserName;
				cmd.Parameters.Add(new NpgsqlParameter("i_Email", NpgsqlDbType.Varchar)).Value = user.Email;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_ProviderUserKey", NpgsqlDbType.Varchar)).Value = user.ProviderUserKey;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static void user_setnotdirty(string connectionString,int boardId, int userId)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_setnotdirty"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }
		static public void user_migrate(string connectionString,object userId, object providerUserKey, object updateProvider)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_migrate"))
			{
				if (providerUserKey == null) { providerUserKey = DBNull.Value; }
				if (updateProvider == null) { updateProvider = DBNull.Value; }
				//if (date == null) { date = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey; 
				cmd.Parameters.Add(new NpgsqlParameter("i_updateprovider", NpgsqlDbType.Boolean)).Value = updateProvider;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_deleteold(string connectionString,object boardId, object days)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_deleteold"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_days", NpgsqlDbType.Integer)).Value = days;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_approve(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_approve"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_approveall(string connectionString,object boardId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_approveall"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_suspend(string connectionString,object userId, object suspend)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_suspend"))
			{
				if (suspend == null) { suspend = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_suspend", NpgsqlDbType.Timestamp)).Value = suspend;
			   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Returns data about allowed signature tags and character limits
		/// </summary>
		/// <param name="userID">The userID</param>
		/// <param name="boardID">The boardID</param>
		/// <returns>Data Table</returns>
		public static DataTable user_getsignaturedata(string connectionString,object userID, object boardID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getsignaturedata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		/// <summary>
		/// Returns data about albums: allowed number of images and albums
		/// </summary>
		/// <param name="userID">The userID</param>
		/// <param name="boardID">The boardID</param>  
		public static DataTable user_getalbumsdata(string connectionString,object userID, object boardID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getalbumsdata"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
				return dt;
			}
		}
		static public bool user_changepassword(string connectionString,object userId, object oldPassword, object newPassword)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_changepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_oldpassword", NpgsqlDbType.Varchar)).Value = oldPassword;
				cmd.Parameters.Add(new NpgsqlParameter("i_newpassword", NpgsqlDbType.Varchar)).Value = newPassword;

				return (bool)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}

		static public DataTable user_pmcount(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_pmcount"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static bool user_RepliedTopic(string connectionString,[NotNull] object messageId, [NotNull] object userId)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_repliedtopic"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_messageid", NpgsqlDbType.Integer)).Value = messageId;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;

                cmd.CommandTimeout = int.Parse(Config.SqlCommandTimeout);

                var messageCount = (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

                return messageCount > 0;
            }
        }
		static public void user_save(string connectionString,
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_save"))
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
               

				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			   
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
        public static void user_savenotification(string connectionString,
              object userId,
              object pmNotification,
              object autoWatchTopics,
              object notificationType,
              object dailyDigest)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_savenotification"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
                cmd.Parameters.Add(new NpgsqlParameter("i_pmnotification", NpgsqlDbType.Boolean)).Value = pmNotification;
                cmd.Parameters.Add(new NpgsqlParameter("i_autowatchtopics", NpgsqlDbType.Boolean)).Value = autoWatchTopics;
                cmd.Parameters.Add(new NpgsqlParameter("i_notificationtype", NpgsqlDbType.Integer)).Value = notificationType;
                cmd.Parameters.Add(new NpgsqlParameter("i_dailydigest", NpgsqlDbType.Boolean)).Value = dailyDigest;
              
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }

		static public void user_adminsave
			(string connectionString,object boardId, object userId, object name, object displayName, object email, object flags, object rankID)
		{

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_adminsave"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
                cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
				cmd.Parameters.Add(new NpgsqlParameter("i_flags", NpgsqlDbType.Integer)).Value = flags;
				cmd.Parameters.Add(new NpgsqlParameter("i_rankid", NpgsqlDbType.Integer)).Value = rankID;
							
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public DataTable user_emails(string connectionString,object boardId, object groupID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_emails"))
			{

				if (groupID == null) { groupID = DBNull.Value; }

				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
			   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public DataTable user_accessmasks(string connectionString,object boardId, object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_accessmasks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
				return userforumaccess_sort_list(PostgreDBAccess.Current.GetData(cmd,connectionString), 0, 0, 0);
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

		static public object user_recoverpassword(string connectionString,object boardId, object userName, object email)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_recoverpassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
							   
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}
		static public void user_savepassword(string connectionString,object userId, object password)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_savepassword"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = FormsAuthentication.HashPasswordForStoringInConfigFile(password.ToString(), "md5");
							
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public object user_login(string connectionString,object boardId, object name, object password)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_login"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_name", NpgsqlDbType.Varchar)).Value = name;
				cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = password;
			   
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}
		static public DataTable user_avatarimage(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_avatarimage"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
			  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		static public int user_get(string connectionString,int boardId, object providerUserKey)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_get"))
			{
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
							   
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToType<int>();
				//return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable UserFind(string connectionString,int boardId, bool filter, string userName, string email, string displayName, object notificationType, object dailyDigest)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_find"))
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

                return PostgreDBAccess.Current.GetData(cmd,connectionString);
            }
        }
		static public string user_getsignature(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getsignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				return PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString();
			}
		}
		static public void user_savesignature(string connectionString,object userId, object signature)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_savesignature"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_signature", NpgsqlDbType.Text)).Value = signature;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_saveavatar(string connectionString,object userId, object avatar, System.IO.Stream stream, object avatarImageType)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_saveavatar"))
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
						 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void user_deleteavatar(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_deleteavatar"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

        static public bool user_register(string connectionString, object boardId, object userName, object password, object hash, object email, object location, object homePage, object timeZone, bool approved)
		{
			using (PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
			{
				using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(PostgreDBAccess.IsolationLevel))
				{
					try
					{
						using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_save", connMan.OpenDBConnection))
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
						eventlog_create(connectionString,null, "user_register in YAF.Classes.Data.LegacyDb.cs", x, EventLogTypes.Error);
						return false;
					}
				}
			}

			return true;
		}
		static public int user_aspnet(string connectionString, int boardId, string userName, string displayName, string email, object providerUserKey, object isApproved)
		{
			try
			{
				using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_aspnet"))
				{
					cmd.CommandType = CommandType.StoredProcedure;

					cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
					cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                    cmd.Parameters.Add(new NpgsqlParameter("i_displayname", NpgsqlDbType.Varchar)).Value = displayName ; // ?? userName;                    
					cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
					cmd.Parameters.Add(new NpgsqlParameter("i_provideruserkey", NpgsqlDbType.Varchar)).Value = providerUserKey;
					cmd.Parameters.Add(new NpgsqlParameter("i_isapproved", NpgsqlDbType.Boolean)).Value = isApproved;
														 
					return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
				}
			}
			catch (Exception x)
			{
                LegacyDb.eventlog_create(connectionString, null, "user_aspnet in YAF.Classes.Data.LegacyDb.cs", x, EventLogTypes.Error);
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
        public static int? user_guest(string connectionString,object boardId)
        {
            using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_guest"))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;

                return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
            }
        }

		static public DataTable user_activity_rank(string connectionString,object boardId, object startDate, object displayNumber)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_activity_rank"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_displaynumber", NpgsqlDbType.Integer)).Value = displayNumber;
				cmd.Parameters.Add(new NpgsqlParameter("i_startdate", NpgsqlDbType.Timestamp)).Value = startDate;
						
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

		static public int user_nntp(string connectionString,object boardId, object userName, object email, int? timeZone)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_nntp"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
				cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
				cmd.Parameters.Add(new NpgsqlParameter("i_timezone", NpgsqlDbType.Integer)).Value = timeZone;

			  object o=PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			  //  if ( o != DBNull.Value)
			  //  {
					return Convert.ToInt32(o);
			  //  }
			  //  else
			   //     return -1;
				
			}
		}

		static public void user_addpoints(string connectionString,object userId, object points)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_addpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
						  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public void user_removepointsByTopicID(string connectionString,object topicID, object points)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_removepointsbytopicid"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public void user_removepoints(string connectionString,object userId, object points)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_removepoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public void user_setpoints(string connectionString,object userId, object points)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_setpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_points", NpgsqlDbType.Integer)).Value = points;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		static public int user_getpoints(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getpoints"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							   
				return (int)PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
			}
		}

	
        static public int user_getthanks_from(string connectionString,object userID, object pageUserId)
		{

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getthanks_from"))
			{

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
				return Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString));
			}
		}

		//<summary> Returns the number of times and posts that other users have thanked the 
		// user with the provided userID.
        static public int[] user_getthanks_to(string connectionString,object userID, object pageUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_getthanks_to"))
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
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);

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
        public static DataTable user_viewallthanks(string connectionString,object UserID, object pageUserId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("user_viewallthanks"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageuserid", NpgsqlDbType.Integer)).Value = pageUserId;
                return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static void user_update_single_sign_on_status(string connectionString, [NotNull] object userID, [NotNull] object isFacebookUser, [NotNull] object isTwitterUser)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_update_single_sign_on_status"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("i_userid", NpgsqlDbType.Integer).Value = userID;
                cmd.Parameters.Add("i_isfacebookuser", NpgsqlDbType.Boolean).Value = isFacebookUser;
                cmd.Parameters.Add("i_istwitteruser", NpgsqlDbType.Boolean).Value = isTwitterUser;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }


		#endregion
		
		#region yaf_UserForum
		static public DataTable userforum_list(string connectionString,object userId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("userforum_list"))
			{
				if (userId == null) { userId = DBNull.Value; }
				if (forumID == null) { forumID = DBNull.Value; }


				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void userforum_delete(string connectionString,object userId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("userforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
							   
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void userforum_save(string connectionString,object userId, object forumID, object accessMaskID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("userforum_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_accessmaskid", NpgsqlDbType.Integer)).Value = accessMaskID; 
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
		
		#region yaf_UserGroup
		static public DataTable usergroup_list(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("usergroup_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							  
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void usergroup_save(string connectionString,object userId, object groupID, object member)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("usergroup_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_groupid", NpgsqlDbType.Integer)).Value = groupID;
				cmd.Parameters.Add(new NpgsqlParameter("i_member", NpgsqlDbType.Boolean)).Value = Convert.ToBoolean(member);
							 
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		#endregion
	   
		#region yaf_WatchForum
		static public void watchforum_add(string connectionString,object userId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchforum_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
						  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public DataTable watchforum_list(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchforum_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
							 
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public DataTable watchforum_check(string connectionString,object userId, object forumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchforum_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
	
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void watchforum_delete(string connectionString,object watchForumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchforum_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_watchforumid", NpgsqlDbType.Integer)).Value = watchForumID;
			  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);

			}
		}
		#endregion

		#region yaf_WatchTopic
		static public DataTable watchtopic_list(string connectionString,object userId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchtopic_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public DataTable watchtopic_check(string connectionString,object userId, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchtopic_check"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}
		static public void watchtopic_delete(string connectionString,object watchTopicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchtopic_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_watchtopicid", NpgsqlDbType.Integer)).Value = watchTopicID;
							  
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		static public void watchtopic_add(string connectionString,object userId, object topicID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("watchtopic_add"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userId;
				cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;
				
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static void Readtopic_AddOrUpdate([NotNull]string connectionString, [NotNull] object userID, [NotNull] object topicID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readtopic_addorupdate"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID;

                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }

        /// <summary>
        /// Delete the Read Tracking
        /// </summary>
        /// <param name="trackingID">
        /// The tracking id.
        /// </param>
       /* public static void Readtopic_delete([NotNull]string connectionString, [NotNull] object userID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readtopic_delete"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DateTime User_LastRead([NotNull]string connectionString, [NotNull] object userID, [NotNull] DateTime lastVisitDate)
        {
            using (var cmd = PostgreDBAccess.GetCommand("user_lastread"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_lastvisitdate", NpgsqlDbType.TimestampTZ)).Value = lastVisitDate;

                var tableLastRead = PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

                return tableLastRead != null ? (DateTime)tableLastRead : lastVisitDate;
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
        public static DateTime? Readtopic_lastread([NotNull]string connectionString, [NotNull] object userID, [NotNull] object topicID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readtopic_lastread"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_topicid", NpgsqlDbType.Integer)).Value = topicID; 

                var tableLastRead = PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

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
        public static void ReadForum_AddOrUpdate([NotNull]string connectionString, [NotNull] object userID, [NotNull] object forumID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readforum_addorupdate"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
            }
        }

        /// <summary>
        /// Delete the Read Tracking
        /// </summary>
        /// <param name="trackingID">
        /// The tracking id.
        /// </param>
       /* public static void ReadForum_delete([NotNull]string connectionString, [NotNull] object userID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readforum_delete"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DateTime ReadForum_lastread([NotNull]string connectionString, [NotNull] object userID, [NotNull] object forumID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("readforum_lastread"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
                cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;

                var tableLastRead = PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);

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

        static public DataTable rsstopic_list(string connectionString, int forumID, int topicStart, int topicCount)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("rsstopic_list"))
			{
			  
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_forumid", NpgsqlDbType.Integer)).Value = forumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_start", NpgsqlDbType.Integer)).Value = topicStart;
				cmd.Parameters.Add(new NpgsqlParameter("i_count", NpgsqlDbType.Integer)).Value = topicCount;
							   
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        private static string getStatsMessage;

        static public string db_getstats_new(string connectionString)
		{
            try
            {
                using (var connMan = new PostgreDbConnectionManager())
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

        static public string db_reindex_new(string connectionString)
        {
            ///VACUUM ANALYZE VERBOSE;VACUUM cannot be implemeneted within function or multiline command line string 
            try
            {
                using (var connMan = new PostgreDbConnectionManager())
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

     /*   public static string db_runsql(string connectionString, string sql, bool useTransaction)
		{
			string txtResult = "";
			var results = new System.Text.StringBuilder();

			using (NpgsqlCommand cmd = new NpgsqlCommand(sql, connMan.OpenDBConnection))
			{
				cmd.CommandTimeout = 9999;
				NpgsqlDataReader reader = null;

				using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(PostgreDBAccess.IsolationLevel))
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
        public static string db_runsql_new(string connectionString, [NotNull] string sql, bool useTransaction)
        {

            try
            {
                using (var connMan = new PostgreDbConnectionManager())
                {
                    connMan.InfoMessage += new YafDBConnInfoMessageEventHandler(runSql_InfoMessage);
                    sql = PostgreDBAccess.GetCommandTextReplaced(sql.Trim());

                    string txtResult = "";
                    var results = new System.Text.StringBuilder();

                    using (NpgsqlCommand cmd = new NpgsqlCommand(sql, connMan.OpenDBConnection))
                    {
                        cmd.CommandTimeout = 9999;
                        NpgsqlDataReader reader = null;
                        NpgsqlTransaction trans = useTransaction ? cmd.Connection.BeginTransaction(PostgreDBAccess.IsolationLevel)
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

        public static bool forumpage_initdb(string connectionString, out string errorStr, bool debugging)
		{
			errorStr = null;
			try
			{
                using (YAF.Classes.Data.PostgreDbConnectionManager connMan = new PostgreDbConnectionManager())
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
        public static string forumpage_validateversion(string connectionString, int appVersion)
		{
			string redirect = "";
            
			try
			{
                DataTable registry = LegacyDb.registry_list(connectionString, "Version");

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
 
		public static readonly string [] scriptList = {
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

 static private bool GetBooleanRegistryValue(string connectionString, string name)
 {
     using (DataTable dt = LegacyDb.registry_list(connectionString, name))
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
	   
		public static void system_deleteinstallobjects(string connectionString)
		{
			string tSQL = "DROP FUNCTION" + PostgreDBAccess.GetObjectName("system_initialize");
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand(tSQL, true))
			{
				cmd.CommandType = CommandType.Text;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		public static void system_initialize_executescripts(string connectionString,string script, string scriptFile, bool useTransactions)
		{
			script = PostgreDBAccess.GetCommandTextReplaced(script);
		   
		   
			//Scripts separation regexp
				string[] statements = System.Text.RegularExpressions.Regex.Split(script, "(?:--GO)", System.Text.RegularExpressions.RegexOptions.IgnoreCase);

                using (var connMan = new PostgreDbConnectionManager())
			{                          

				// use transactions...
				if (useTransactions)
				{
					using (NpgsqlTransaction trans = connMan.OpenDBConnection.BeginTransaction(YAF.Classes.Data.PostgreDBAccess.IsolationLevel))
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
		public static void system_initialize_fixaccess(string connectionString,bool bGrant)
		{
		/*   using (YAF.Classes.Data.IDbConnectionManager connMan = new IDbConnectionManager())
			{
				using (IDbTransaction trans = connMan.OpenDBConnection.BeginTransaction(YAF.Classes.Data.PostgreDBAccess.IsolationLevel))
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
										cmd.Parameters[1].Value = PostgreDBAccess.SchemaName;                                        
										
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
										cmd.Parameters[1].Value = PostgreDBAccess.SchemaName;  
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
        public static void system_initialize(string connectionString,string forumName, string timeZone, string culture, string languageFile, string forumEmail, string smtpServer, string userName, string userEmail, object providerUserKey, string rolePrefix)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("system_initialize"))
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
				
				YAF.Classes.Data.PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
								
			}

		}
		static public void system_updateversion(string connectionString, int version, string name)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("system_updateversion"))
			{

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_version", NpgsqlDbType.Integer)).Value = version;
				cmd.Parameters.Add(new NpgsqlParameter("i_versionname", NpgsqlDbType.Varchar)).Value = name;
			  
				YAF.Classes.Data.PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}
		/// <summary>
		/// Returns info about all Groups and Rank styles. 
		/// Used in GroupRankStyles cache.
		/// Usage: LegendID = 1 - Select Groups, LegendID = 2 - select Ranks by Name 
		/// </summary>
        public static DataTable group_rank_style(string connectionString, object boardID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("group_rank_style"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardID;
				return YAF.Classes.Data.PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static DataTable shoutbox_getmessages(string connectionString, int boardId, int numberOfMessages, object useStyledNicks)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("shoutbox_getmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_numberofmessages",NpgsqlDbType.Integer)).Value = numberOfMessages;                
				cmd.Parameters.Add(new NpgsqlParameter("i_stylednicks", NpgsqlDbType.Boolean)).Value = useStyledNicks;
				
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
			}
		}

        public static bool shoutbox_savemessage(string connectionString, int boardId, string message, string userName, int userID, object ip)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("shoutbox_savemessage"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = userID;
				cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				cmd.Parameters.Add(new NpgsqlParameter("i_message", NpgsqlDbType.Text)).Value = message;
				cmd.Parameters.Add(new NpgsqlParameter("i_date", NpgsqlDbType.Timestamp)).Value = DBNull.Value;
				cmd.Parameters.Add(new NpgsqlParameter("i_ip", NpgsqlDbType.Varchar)).Value = ip;
								
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);

				return true;
			}
		}

        public static Boolean shoutbox_clearmessages(string connectionString, int boardId)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("shoutbox_clearmessages"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_boardid", NpgsqlDbType.Integer)).Value = boardId;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				return true;
			}
		}

		#endregion

		#region Touradg Mods
		//Shinking Operation
        static public string db_shrink_warning(string connectionString)
		{
			return "";
		}

        public static void db_shrink(string connectionString)
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
        public static string db_shrink_new(string connectionString)
        {
           /* try
            {
                using (var conn = new PostgreDbConnectionManager())
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

		public static string db_recovery_mode_new(string connectionString, string dbRecoveryMode)
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
        public static string[] buddy_addrequest(string connectionString, object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("buddy_addrequest"))
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
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static string buddy_approveRequest(string connectionString, object FromUserID, object ToUserID, object Mutual)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("buddy_approverequest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = ToUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_mutual", NpgsqlDbType.Boolean)).Value = Mutual;
				cmd.Parameters.Add(paramOutput);
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static string buddy_denyRequest(string connectionString, object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("buddy_denyrequest"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("paramOutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value = FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value = ToUserID;
				cmd.Parameters.Add(paramOutput);
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static string buddy_remove(string connectionString, object FromUserID, object ToUserID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("buddy_remove"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				var paramOutput = new NpgsqlParameter("i_paramoutput", NpgsqlDbType.Varchar, 128);
				paramOutput.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value =  FromUserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_touserid", NpgsqlDbType.Integer)).Value =  ToUserID;
				cmd.Parameters.Add(paramOutput);
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DataTable buddy_list(string connectionString, object FromUserID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("buddy_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_fromuserid", NpgsqlDbType.Integer)).Value =  FromUserID;
				return PostgreDBAccess.Current.GetData(cmd,connectionString);
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
        public static int album_save(string connectionString, object AlbumID, object UserID, object Title, object CoverImageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_save"))
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


                int uu = Convert.ToInt32(PostgreDBAccess.Current.ExecuteScalar(cmd,connectionString));
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
        public static DataTable album_list(string connectionString, object UserID, object AlbumID)
		{
			if (AlbumID == null || AlbumID.ToString() == "0")
			{
				AlbumID = DBNull.Value;
			}
			if (UserID == null || UserID.ToString() == "0")
			{
				UserID = DBNull.Value;
			}
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				DataTable dt = PostgreDBAccess.Current.GetData(cmd,connectionString);
				return dt;
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
		public static void album_delete(string connectionString, object AlbumID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		/// <summary>
		/// Deletes an album and all Images in that album.
		/// </summary>
		/// <param name="AlbumID">
		/// the album id.
		/// </param>
        public static string album_gettitle(string connectionString, object AlbumID)
		{

            if (AlbumID == null || AlbumID.ToString() == "0" )
			{
                AlbumID = DBNull.Value;
			} 

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_gettitle"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
			   // object o = PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString);
				return  PostgreDBAccess.Current.ExecuteScalar(cmd, connectionString).ToString();                
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
		public static int[] album_getstats(string connectionString, object UserID, object AlbumID)
		{
			if (AlbumID == null || AlbumID.ToString() == "0")
			{
				AlbumID = DBNull.Value;
			}
			if (UserID == null || UserID.ToString() == "0")
			{
				UserID = DBNull.Value;
			}

			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_getstats"))
			{
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Integer)).Value = UserID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID; 

				DataRow dr = PostgreDBAccess.Current.GetData(cmd,connectionString).Rows[0];
              
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
        public static void album_image_save(string connectionString, object ImageID, object AlbumID, object Caption, object FileName, object Bytes, object ContentType)
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
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_image_save"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_caption", NpgsqlDbType.Varchar)).Value = Caption;
				cmd.Parameters.Add(new NpgsqlParameter("i_filename", NpgsqlDbType.Varchar)).Value = FileName;
				cmd.Parameters.Add(new NpgsqlParameter("i_bytes", NpgsqlDbType.Integer)).Value = Bytes;
				cmd.Parameters.Add(new NpgsqlParameter("i_contenttype", NpgsqlDbType.Varchar)).Value = ContentType;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
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
        public static DataTable album_image_list(string connectionString, object AlbumID, object ImageID)
		{
            if (AlbumID == null || AlbumID.ToString() == "0")
            {
                AlbumID = DBNull.Value;
            }
            if (ImageID == null || ImageID.ToString() == "0")
            {
                ImageID = DBNull.Value;
            }
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_image_list"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_albumid", NpgsqlDbType.Integer)).Value = AlbumID;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
			  DataTable dt =PostgreDBAccess.Current.GetData(cmd,connectionString);
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
		public static void album_image_delete(string connectionString, object ImageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_image_delete"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
			}
		}

		/// <summary>
		/// Increments the image's download times.
		/// </summary>
		/// <param name="ImageID">
		/// the image id.
		/// </param>
        public static void album_image_download(string connectionString, object ImageID)
		{
			using (NpgsqlCommand cmd = PostgreDBAccess.GetCommand("album_image_download"))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add(new NpgsqlParameter("i_imageid", NpgsqlDbType.Integer)).Value = ImageID;
				PostgreDBAccess.Current.ExecuteNonQuery(cmd, connectionString);
				int s33 = 0;
			}
		}

        /// <summary>
        /// Album images by users the specified user ID.
        /// </summary>
        /// <param name="userID">The user ID.</param>
        /// <returns>All Albbum Images of the User</returns>
        public static DataTable album_images_by_user([NotNull] string connectionString, [NotNull] object userID)
        {
            using (var cmd = PostgreDBAccess.GetCommand("album_images_by_user"))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("I_UserID", NpgsqlDbType.Integer).Value = userID;
                return PostgreDBAccess.Current.GetData(cmd, connectionString);
            }
        }

		#endregion

         public static void unencode_all_topics_subjects(string connectionString,Func<string,string> decodeTopicFunc)
    {
        var topics = LegacyDb.topic_simplelist(connectionString, 0, 99999999).SelectTypedList(r => new TypedTopicSimpleList(r)).ToList();

      foreach (var topic in topics.Where(t => t.TopicID.HasValue && t.Topic.IsSet()))
      {
        try
        {
          var decodedTopic = decodeTopicFunc(topic.Topic);

          if (!decodedTopic.Equals(topic.Topic))
          {
            // unencode it and update.
              LegacyDb.topic_updatetopic(connectionString, topic.TopicID.Value, decodedTopic);
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

