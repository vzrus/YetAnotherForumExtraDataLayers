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
using System;
using System.Configuration.Provider;
using System.Web;
using System.Configuration;

using System.Web.Security;
using System.Data;
using Npgsql;
using NpgsqlTypes;
using YAF.Classes;
using YAF.Core;
using YAF.Classes.Data;
using YAF.Classes.Pattern;

namespace YAF.Providers.Membership
{
    public class PgMembershipDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if  (YafContext.Application[PgMembershipProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[PgMembershipProvider.ConnStrAppKeyName] as string;
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
            _dbAccess.SetConnectionManagerAdapter<PgMembershipDBConnManager>();
        }
        

        public void UpgradeMembership( int previousVersion, int newVersion)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_upgrade")))
            {
                /*
                cmd.CommandType = CommandType.StoredProcedure;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_previousversion", NpgsqlDbType.Integer)).Value = previousVersion;
                cmd.Parameters.Add(new NpgsqlParameter("i_newversion", NpgsqlDbType.Integer)).Value = newVersion;
                cmd.Parameters.Add(new NpgsqlParameter("i_utctimestamp", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                _dbAccess.ExecuteNonQuery(cmd ); */
            }

        }

        public void __ChangePassword( string appName, string username, string newPassword, string newSalt, int passwordFormat, string newPasswordAnswer)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_changepassword")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;

                // Nonstandard args

                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = newPassword;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordsalt", NpgsqlDbType.Varchar)).Value = newSalt;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordformat", NpgsqlDbType.Varchar)).Value = passwordFormat;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordanswer", NpgsqlDbType.Varchar)).Value = newPasswordAnswer;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        public void __ChangePasswordQuestionAndAnswer( string appName, string username, string passwordQuestion, string passwordAnswer)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_changepasswordquestionandanswer")))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordquestion", NpgsqlDbType.Varchar)).Value = passwordQuestion;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordanswer", NpgsqlDbType.Varchar)).Value = passwordAnswer;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd);
            }
        }

        public void __CreateUser( string appName, string username, string password, string passwordSalt, int passwordFormat, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_createuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Input Parameters
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = password;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordsalt", NpgsqlDbType.Varchar)).Value = passwordSalt;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordformat", NpgsqlDbType.Varchar)).Value = passwordFormat;
                cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordquestion", NpgsqlDbType.Varchar)).Value = passwordQuestion;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordanswer", NpgsqlDbType.Varchar)).Value = passwordAnswer;
                cmd.Parameters.Add(new NpgsqlParameter("i_isapproved", NpgsqlDbType.Boolean)).Value = isApproved;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_newuserkey", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_utctimestamp", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                // Input Output Parameters
                NpgsqlParameter paramUserKey = new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid);
                paramUserKey.Direction = ParameterDirection.InputOutput;
                paramUserKey.Value = providerUserKey;
                cmd.Parameters.Add(paramUserKey);

                //Execute
                _dbAccess.ExecuteNonQuery(cmd );
                //Retrieve Output Parameters
                providerUserKey = paramUserKey.Value;

            }
        }

        public void __DeleteUser( string appName, string username, bool deleteAllRelatedData)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_deleteuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args

                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_deleteallrelated", NpgsqlDbType.Boolean)).Value = deleteAllRelatedData;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        public DataTable __FindUsersByEmail( string appName, string emailToMatch, int pageIndex, int pageSize)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_findusersbyemail")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_emailaddress", NpgsqlDbType.Varchar)).Value = emailToMatch;
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                return _dbAccess.GetData(cmd );
            }
        }

        public DataTable __FindUsersByName( string appName, string usernameToMatch, int pageIndex, int pageSize)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_findusersbyname")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = usernameToMatch;
                //TODO:fix overflow bug                
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                if (pageSize == int.MaxValue) { pageSize = 1; }
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;

                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return _dbAccess.GetData(cmd );
            }
        }

        public DataTable __GetAllUsers( string appName, int pageIndex, int pageSize)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_getallusers")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_pageindex", NpgsqlDbType.Integer)).Value = pageIndex;
                cmd.Parameters.Add(new NpgsqlParameter("i_pagesize", NpgsqlDbType.Integer)).Value = pageSize;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                return _dbAccess.GetData(cmd );
            }
        }

        public int __GetNumberOfUsersOnline( string appName, int TimeWindow)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_getnumberofusersonline")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args

                cmd.Parameters.Add(new NpgsqlParameter("i_timewindow", NpgsqlDbType.Integer)).Value = TimeWindow;
                cmd.Parameters.Add(new NpgsqlParameter("i_currenttimeutc", NpgsqlDbType.Timestamp)).Value = DateTime.UtcNow;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                NpgsqlParameter p = new NpgsqlParameter("i_returnvalue", DbType.Int32);
                p.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(p);

                _dbAccess.ExecuteNonQuery(cmd );
                return Convert.ToInt32(cmd.Parameters["i_returnvalue"].Value);
            }
        }

        public DataRow __GetUser( string appName, object providerUserKey, string userName, bool userIsOnline)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_getuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid)).Value = providerUserKey;
                cmd.Parameters.Add(new NpgsqlParameter("i_userisonline", NpgsqlDbType.Boolean)).Value = userIsOnline;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_utctimestamp", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                using (DataTable dt = _dbAccess.GetData(cmd ))
                {
                    if (dt.Rows.Count > 0)
                    {

                        return dt.Rows[0];
                    }
                    else
                        return null;
                }
            }

        }

        public DataTable __GetUserPasswordInfo( string appName, string username, bool updateUser)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_getuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid)).Value = DBNull.Value;
                cmd.Parameters.Add(new NpgsqlParameter("i_userisonline", NpgsqlDbType.Boolean)).Value = updateUser;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_utctimestamp", NpgsqlDbType.TimestampTZ)).Value = DateTime.UtcNow;
                return _dbAccess.GetData(cmd );
            }

        }

        public DataTable __GetUserNameByEmail( string appName, string email)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_getusernamebyemail")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = email;
                cmd.Parameters.Add(new NpgsqlParameter("i_newroleguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return _dbAccess.GetData(cmd );
            }
        }


        public void __ResetPassword( string appName, string userName, string password, string passwordSalt, int passwordFormat, int maxInvalidPasswordAttempts, int passwordAttemptWindow)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_resetpassword")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_password", NpgsqlDbType.Varchar)).Value = password;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordsalt", NpgsqlDbType.Varchar)).Value = passwordSalt;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordformat", NpgsqlDbType.Varchar)).Value = passwordFormat;
                cmd.Parameters.Add(new NpgsqlParameter("i_maxinvalidattempts", NpgsqlDbType.Integer)).Value = maxInvalidPasswordAttempts;
                cmd.Parameters.Add(new NpgsqlParameter("i_passwordattemptwindow", NpgsqlDbType.Integer)).Value = passwordAttemptWindow;
                cmd.Parameters.Add(new NpgsqlParameter("i_currenttimeutc", NpgsqlDbType.Timestamp)).Value = DateTime.UtcNow;
                cmd.Parameters.Add(new NpgsqlParameter("i_newroleguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd );
            }

        }

        public void __UnlockUser( string appName, string userName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_unlockuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        public int __UpdateUser( object appName, MembershipUser user, bool requiresUniqueEmail)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_updateuser")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlDbType.Varchar)).Value = appName;
                // Nonstandard args
                cmd.Parameters.Add(new NpgsqlParameter("i_userkey", NpgsqlDbType.Uuid)).Value = user.ProviderUserKey;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlDbType.Varchar)).Value = user.UserName;
                cmd.Parameters.Add(new NpgsqlParameter("i_email", NpgsqlDbType.Varchar)).Value = user.Email;
                cmd.Parameters.Add(new NpgsqlParameter("i_comment", NpgsqlDbType.Text)).Value = user.Comment;
                cmd.Parameters.Add(new NpgsqlParameter("i_isapproved", NpgsqlDbType.Boolean)).Value = user.IsApproved;
                cmd.Parameters.Add(new NpgsqlParameter("i_lastlogin", NpgsqlDbType.Timestamp)).Value = user.LastLoginDate;
                cmd.Parameters.Add(new NpgsqlParameter("i_lastactivity", NpgsqlDbType.Timestamp)).Value = user.LastActivityDate.ToUniversalTime();
                cmd.Parameters.Add(new NpgsqlParameter("i_uniqueemail", NpgsqlDbType.Boolean)).Value = requiresUniqueEmail;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return Convert.ToInt32(_dbAccess.ExecuteScalar(cmd));
            }
        }


    }
}
