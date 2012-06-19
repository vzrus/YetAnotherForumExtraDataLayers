/* Yet Another Forum.NET MySQL data layer by vzrus
 * Copyright (C) 2006-2012 Vladimir Zakharov
 * https://github.com/vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
 * http://www.yetanotherforum.net/
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2
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
using System;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web;
using System.Data;
using System.Web.Security;
using NpgsqlTypes;
using YAF.Classes;
using YAF.Core;
using YAF.Classes.Pattern;
using YAF.Classes.Data;
using Npgsql;
using YAFProviders.Passthru;


namespace YAF.Providers.Profile
{
    public class YafProfileDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if (YafContext.Application[PgProfileProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[PgProfileProvider.ConnStrAppKeyName] as string;
                }

                return Config.ConnectionString;
            }
        }
    }

    public class DB
    {
        private MsSqlDbAccess _dbAccess = new MsSqlDbAccess();

        public static DB Current
        {
            get
            {
                return PageSingleton<DB>.Instance;
            }
        }

        public DB()
        {
            _dbAccess.SetConnectionManagerAdapter<YafProfileDBConnManager>();
        }
        private static int EncodeProfileData(SettingsPropertyValueCollection collection, bool isAuthenticated,
           ref string index, ref string stringData, ref byte[] binaryData)
        {
            bool itemsToSave = false;

            // first we need to determine if there are any items that need saving
            // this is an optimization
            foreach (SettingsPropertyValue value in collection)
            {
                if (!value.IsDirty) continue;
                if (value.Property.Attributes["AllowAnonymous"].Equals(false) &&
                    !isAuthenticated) continue;
                itemsToSave = true;
                break;
            }
            if (!itemsToSave) return 0;

            StringBuilder indexBuilder = new StringBuilder();
            StringBuilder stringDataBuilder = new StringBuilder();
            MemoryStream binaryBuilder = new MemoryStream();
            int count = 0;

            // ok, we have some values that need to be saved so we go back through
            foreach (SettingsPropertyValue value in collection)
            {
                // if the value has not been written to and is still using the default value
                // no need to save it
                if (value.UsingDefaultValue && !value.IsDirty) continue;

                // we don't save properties that require the user to be authenticated when the
                // current user is not authenticated.
                if (value.Property.Attributes["AllowAnonymous"].Equals(false) &&
                    !isAuthenticated) continue;

                count++;
                object propValue = value.SerializedValue;
                if ((value.Deserialized && value.PropertyValue == null) ||
                    value.SerializedValue == null)
                    indexBuilder.AppendFormat("{0}//0/-1:", value.Name);
                else if (propValue is string)
                {
                    indexBuilder.AppendFormat("{0}/0/{1}/{2}:", value.Name,
                        stringDataBuilder.Length, (propValue as string).Length);
                    stringDataBuilder.Append(propValue);
                }
                else
                {
                    byte[] binaryValue = (byte[])propValue;
                    indexBuilder.AppendFormat("{0}/1/{1}/{2}:", value.Name,
                        binaryBuilder.Position, binaryValue.Length);
                    binaryBuilder.Write(binaryValue, 0, binaryValue.Length);
                }
            }
            index = indexBuilder.ToString();
            stringData = stringDataBuilder.ToString();
            binaryData = binaryBuilder.ToArray();
            return count;
        }

        static public void DecodeProfileData(DataRow profileRow, SettingsPropertyValueCollection values)
        {
            byte[] binaryData = null;
            string indexData = null;
            string stringData = null;
            indexData = profileRow["valueindex"].ToString();
            stringData = profileRow["stringData"].ToString();
            if (profileRow["binaryData"] != DBNull.Value)
                binaryData = (byte[])profileRow["binaryData"];

            if (indexData == null) return;

            string[] indexes = indexData.Split(':');

            foreach (string index in indexes)
            {
                string[] parts = index.Split('/');
                SettingsPropertyValue value = values[parts[0]];
                if (value == null) continue;

                int pos = Int32.Parse(parts[2], CultureInfo.InvariantCulture);
                int len = Int32.Parse(parts[3], CultureInfo.InvariantCulture);
                if (len == -1)
                {
                    value.PropertyValue = null;
                    value.IsDirty = false;
                    value.Deserialized = true;
                }
                else if (parts[1].Equals("0"))
                    value.SerializedValue = stringData.Substring(pos, len);
                else
                {
                    byte[] buf = new byte[len];
                    Buffer.BlockCopy(binaryData, pos, buf, 0, len);
                    value.SerializedValue = buf;
                }
            }
        }

		 public DataTable __GetProfiles(  object appName, object pageIndex, object pageSize, object userNameToMatch, object inactiveSinceDate )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "prov_profile_getprofiles" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_ApplicationName", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_PageIndex", NpgsqlTypes.NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_PageSize", NpgsqlTypes.NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_UserNameToMatch", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = userNameToMatch;
                cmd.Parameters.Add(new NpgsqlParameter("i_InactiveSinceDate", NpgsqlTypes.NpgsqlDbType.Timestamp)).Value = inactiveSinceDate;

                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                DataTable dt = _dbAccess.GetData(cmd );				
				return dt;
			}
		}

		 public DataTable __GetProfileStructure(string connectionString)
		{
            
       
            string sql = String.Format(@"SELECT DISTINCT * FROM {0} LIMIT 1", MsSqlDbAccess.GetObjectName(@"prov_profile"));

			using ( NpgsqlCommand cmd = new NpgsqlCommand( sql ) )
			{
				cmd.CommandType = CommandType.Text;
                return _dbAccess.GetData(cmd);
			}
		}

       public void __AddProfileColumn( string Name, NpgsqlTypes.NpgsqlDbType columnType, int size)
		{
			// get column type...
			string type = columnType.ToString();

			if ( size > 0 )
			{
				type += "(" + size.ToString() + ")";
			}
           
			string sql = String.Format( @"ALTER TABLE {0} ADD  {1}  {2} ", MsSqlDbAccess.GetObjectName( "prov_profile" ), Name, type );

			using ( NpgsqlCommand cmd = new NpgsqlCommand( sql ) )
			{
				cmd.CommandType = CommandType.Text;
				_dbAccess.ExecuteNonQuery(cmd);
			}
		} 

		public object __GetProviderUserKey( object appName, object username )
		{
            if (YAF.Classes.Config.IsMojoPortal)
            {
             
                return System.Web.Security.Membership.GetUser(username.ToString(),true).ProviderUserKey;
            }
            else
            {


                DataRow row = Membership.DB.Current.__GetUser( appName.ToString(), null,
                                                              username.ToString(), false);

                if (row != null)
                {
                    return row["UserID"];
                }
            }

		    return null;
		}

		 public void __SetProfileProperties(  object appName, object userID, System.Configuration.SettingsPropertyValueCollection values, System.Collections.Generic.List<SettingsPropertyColumn> settingsColumnsList )
		{
            
            SettingsContext sc = new SettingsContext();
            sc.Add("IsAuthenticated", true);
            sc.Add("UserID", userID);
            sc.Add("ApplicationName", appName);
           
              
            __SetPropertyValues( sc, values, settingsColumnsList);
            
           
		}

		 public int __DeleteProfiles(  object appName, object userNames )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "prov_profile_deleteprofiles" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_ApplicationName", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_UserNames", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = userNames;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();


                return Convert.ToInt32(_dbAccess.ExecuteScalar(cmd));
			}
		}

		 public int __DeleteInactiveProfiles(  object appName, object inactiveSinceDate )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "prov_profile_deleteinactive" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_ApplicationName", NpgsqlDbType.Varchar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new NpgsqlParameter("i_InactiveSinceDate", NpgsqlDbType.Timestamp));
                cmd.Parameters[1].Value = inactiveSinceDate;

                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();


                return Convert.ToInt32(_dbAccess.ExecuteScalar(cmd));
			}
		}

		 public int __GetNumberInactiveProfiles(  object appName, object inactiveSinceDate )
		{
			using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "prov_profile_getnumberinactiveprofiles" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_ApplicationName", NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_InactiveSinceDate", NpgsqlDbType.Timestamp)).Value = inactiveSinceDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return Convert.ToInt32(_dbAccess.ExecuteScalar(cmd));
			}
		}

		/*
		public  void ValidateAddColumnInProfile( string columnName, NpgsqlTypes.NpgsqlDbType columnType )
		{
			NpgsqlCommand cmd = new NpgsqlCommand( sprocName );
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add( "@ApplicationName", appName );
			cmd.Parameters.Add( "@Username", username );
			cmd.Parameters.Add( "@IsUserAnonymous", isAnonymous );

			return cmd;
		}
		*/
        public  void __SetPropertyValues( SettingsContext context, SettingsPropertyValueCollection collection, System.Collections.Generic.List<SettingsPropertyColumn> settingsColumnsList)
        {
            
            bool isAuthenticated = (bool)context["IsAuthenticated"];            
            String appName = (string)context["ApplicationName"];
           // sc.Add("IsAnonymous", isAnonymous);
           // sc.Add("LastActivityDate", lastActivityDate);
            if (context["UserID"]==null) return;
            Guid userid = (Guid)context["UserID"];
            if (collection.Count < 1) return;

            string index = String.Empty;
            string stringData = String.Empty;
            byte[] binaryData = null;
            int count = EncodeProfileData(collection, isAuthenticated, ref index, ref stringData, ref binaryData);
            if (count < 1) return;

            // save the encoded profile data to the database
         
                // using (TransactionScope ts = new TransactionScope())
                //  {

                // either create a new user or fetch the existing user id
                Guid userId = SchemaManager.CreateOrFetchUserId(userid, isAuthenticated);
                bool profileExists = false;
                using (NpgsqlCommand cmd1 = MsSqlDbAccess.GetCommand(String.Format("SELECT COUNT(1) FROM {0} WHERE userid ='{1}';", YAF.Classes.Data.MsSqlDbAccess.GetObjectName("prov_Profile"), userId), true))
                {
                    profileExists = Convert.ToBoolean(_dbAccess.ExecuteScalar(cmd1));
                }

                MembershipUser mu = System.Web.Security.Membership.GetUser(userId);

                if (profileExists)
                {
                    
                    using (var cmd = MsSqlDbAccess.GetCommand(
                         String.Format(@"UPDATE {0} SET valueindex = :i_valueindex,stringdata= :i_stringData,binarydata= :i_binaryData,
                            lastupdateddate= :i_lastupdateddate,lastactivitydate= :i_lastactivitydate,username= :i_username WHERE userid = :i_userid and applicationid = :i_applicationid;", MsSqlDbAccess.GetObjectName("prov_profile")), true))
                    {
                        cmd.Parameters.Add(new NpgsqlParameter("i_valueindex", NpgsqlDbType.Varchar)).Value = index;
                        cmd.Parameters.Add(new NpgsqlParameter("i_stringData", NpgsqlDbType.Varchar)).Value = stringData;
                        cmd.Parameters.Add(new NpgsqlParameter("i_binaryData", NpgsqlDbType.Bytea)).Value = binaryData;
                        cmd.Parameters.Add(new NpgsqlParameter("i_lastupdateddate", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                        cmd.Parameters.Add(new NpgsqlParameter("i_lastactivitydate", NpgsqlDbType.TimestampTZ)).Value = mu.LastActivityDate;
                        cmd.Parameters.Add(new NpgsqlParameter("i_applicationid", NpgsqlDbType.Uuid)).Value = (Guid)GetApplicationIdFromName(appName);
                        cmd.Parameters.Add(new NpgsqlParameter("i_isanonymous", NpgsqlDbType.Boolean)).Value = false;
                        cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = mu.UserName;
                        cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Uuid)).Value = userId;

                        int res = _dbAccess.ExecuteNonQueryInt(cmd);
                        if (res == 0)
                        {
                            //Error
                        }
                    }
                }
                else
                {
                    using (NpgsqlCommand cmd = MsSqlDbAccess.GetCommand(
                       String.Format(@"INSERT INTO {0}(
                      userid,
                      valueindex,
                      stringdata,
                      binarydata,
                      lastupdateddate,
                      lastactivitydate,
                      applicationid,
                      isanonymous,
                      username) 
                       VALUES (
                     :i_userid,
                     :i_valueindex, 
                     :i_stringData,
                     :i_binaryData,
                     :i_lastupdateddate,                   
                     :i_lastactivitydate,
                     :i_applicationid,
                     :i_isanonymous,
                     :i_username) ;",
                       YAF.Classes.Data.MsSqlDbAccess.GetObjectName("prov_profile")), true))
                       {
                           cmd.Parameters.Add(new NpgsqlParameter("i_userid", NpgsqlDbType.Uuid)).Value = userId;
                           cmd.Parameters.Add(new NpgsqlParameter("i_valueindex", NpgsqlDbType.Varchar)).Value = index;
                           cmd.Parameters.Add(new NpgsqlParameter("i_stringData", NpgsqlDbType.Varchar)).Value = stringData;
                           cmd.Parameters.Add(new NpgsqlParameter("i_binaryData", NpgsqlDbType.Bytea)).Value = binaryData;
                           cmd.Parameters.Add(new NpgsqlParameter("i_lastupdateddate", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                           cmd.Parameters.Add(new NpgsqlParameter("i_lastactivitydate", NpgsqlDbType.TimestampTZ)).Value = mu.LastActivityDate;
                           cmd.Parameters.Add(new NpgsqlParameter("i_applicationid", NpgsqlDbType.Uuid)).Value = GetApplicationIdFromName( appName);
                           cmd.Parameters.Add(new NpgsqlParameter("i_isanonymous", NpgsqlDbType.Boolean)).Value = false;
                           cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = mu.UserName;

                        int res = _dbAccess.ExecuteNonQueryInt(cmd);
                        if (res == 0)
                        {
                            //Error
                        }
                    }
                }

                //   ts.Complete();
                // }

           
        }
        private object GetApplicationIdFromName( string appName )
        {
            using ( NpgsqlCommand cmd = MsSqlDbAccess.GetCommand( "prov_createapplication" ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value =  Guid.NewGuid();;
			    var appId = new NpgsqlParameter("i_applicationid", NpgsqlDbType.Uuid);
                appId.Direction = ParameterDirection.Output;
			    cmd.Parameters.Add(appId);

                return _dbAccess.ExecuteScalar(cmd);
			}
            
        }
        public static bool GetDbTypeAndSizeFromString(string providerData, out NpgsqlTypes.NpgsqlDbType dbType, out int size)
        {
            return LegacyDb.GetDbTypeAndSizeFromString(providerData, out dbType, out size);
        }
    }
}
