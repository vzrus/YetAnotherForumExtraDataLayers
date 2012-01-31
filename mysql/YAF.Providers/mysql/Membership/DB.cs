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


namespace YAF.Providers.Membership
{
    using System;
    using System.Web;
    using System.Web.Security;
    using System.Text.RegularExpressions;
    using System.Security.Cryptography;
    using System.Data;
    using MySql.Data.MySqlClient;
    using MySql.Data;
    using YAF.Classes;
    using YAF.Core;
    using YAF.Classes.Data;
    using YAF.Classes.Pattern;
    using YAF.Types.Interfaces;
    using YAF.Types.Constants;

    public class MsSqlMembershipDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if (YafContext.Application[YafMembershipProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[YafMembershipProvider.ConnStrAppKeyName] as string;
                }

                return Config.ConnectionString;
            }
        }
    }

	public class DB
	{
        private MsSqlDbAccess _msSqlDbAccess = new MsSqlDbAccess();

        public static DB Current
        {
            get
            {
                return PageSingleton<DB>.Instance;
            }
        }

        public DB()
        {
            _msSqlDbAccess.SetConnectionManagerAdapter<MsSqlMembershipDBConnManager>();
        }

        public void ChangePassword( string appName, string userName, string newPassword, string newSalt, int passwordFormat, string newPasswordAnswer)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_changepassword" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;               
				cmd.Parameters.Add("i_Password", MySqlDbType.VarChar ).Value = newPassword;
                cmd.Parameters.Add("i_PasswordSalt", MySqlDbType.VarChar ).Value = newSalt;
                cmd.Parameters.Add("i_PasswordFormat", MySqlDbType.VarChar ).Value = passwordFormat.ToString();
                cmd.Parameters.Add("i_PasswordAnswer", MySqlDbType.VarChar ).Value = newPasswordAnswer;
                
				_msSqlDbAccess.ExecuteNonQuery(cmd) ;
			}
		}

        public void ChangePasswordQuestionAndAnswer( string appName, string userName, string passwordQuestion, string passwordAnswer)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_changepasswordquestionandanswer" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add("i_PasswordQuestion", MySqlDbType.VarChar ).Value = passwordQuestion;
                cmd.Parameters.Add("i_PasswordAnswer", MySqlDbType.VarChar ).Value = passwordAnswer;
				_msSqlDbAccess.ExecuteNonQuery( cmd) ;
			}
		}

        public void CreateUser( string appName, string userName, string password, string passwordSalt, int passwordFormat, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_createuser" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Input Parameters
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add("i_Password", MySqlDbType.VarChar ).Value = password;
                cmd.Parameters.Add("i_PasswordSalt", MySqlDbType.VarChar ).Value = passwordSalt;
                cmd.Parameters.Add("i_PasswordFormat", MySqlDbType.VarChar ).Value = passwordFormat.ToString();
                cmd.Parameters.Add("i_Email", MySqlDbType.VarChar ).Value = email;
				cmd.Parameters.Add("i_PasswordQuestion", MySqlDbType.VarChar ).Value = passwordQuestion;
                cmd.Parameters.Add("i_PasswordAnswer", MySqlDbType.VarChar ).Value = passwordAnswer;
                cmd.Parameters.Add("i_IsApproved", MySqlDbType.Byte ).Value = isApproved;
				// Input Output Parameters
				MySqlParameter paramUserKey = new MySqlParameter( "i_UserKey", MySqlDbType.VarChar);
				paramUserKey.Direction = ParameterDirection.InputOutput;
				paramUserKey.Value = providerUserKey;
				cmd.Parameters.Add( paramUserKey );

				//Execute
				_msSqlDbAccess.ExecuteNonQuery(cmd) ;
				//Retrieve Output Parameters
				providerUserKey = paramUserKey.Value;

			}
		}

        public void DeleteUser( string appName, string userName, bool deleteAllRelatedData)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_deleteuser" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add("i_DeleteAllRelated", MySqlDbType.Byte ).Value = deleteAllRelatedData;
				_msSqlDbAccess.ExecuteNonQuery(cmd) ;
			}
		}

        public DataTable FindUsersByEmail( string appName, string emailToMatch, int pageIndex, int pageSize)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_findusersbyemail" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value = appName;
				// Nonstandard args
                cmd.Parameters.Add("i_EmailAddress", MySqlDbType.VarChar ).Value = emailToMatch;
				cmd.Parameters.Add("i_PageIndex", MySqlDbType.Int32 ).Value =  pageIndex;
                cmd.Parameters.Add("i_PageSize", MySqlDbType.Int32 ).Value = pageSize;
                MySqlParameter trecords = new MySqlParameter( "i_TotalRecords", MySqlDbType.Int32 );
                trecords.Direction = ParameterDirection.Output;
                trecords.Value = 0;
                cmd.Parameters.Add( trecords );
                return _msSqlDbAccess.GetData( cmd) ;
			}
		}

        public DataTable FindUsersByName( string appName, string usernameToMatch, int pageIndex, int pageSize)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_findusersbyname" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value = appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = usernameToMatch;
				cmd.Parameters.Add("i_PageIndex", MySqlDbType.Int32 ).Value = pageIndex;
                cmd.Parameters.Add("i_PageSize", MySqlDbType.Int32 ).Value = pageSize;

                MySqlParameter trecords = new MySqlParameter( "i_TotalRecords", MySqlDbType.Int32 );
                trecords.Direction = ParameterDirection.Output;
                trecords.Value = 0;
                cmd.Parameters.Add( trecords );
                return _msSqlDbAccess.GetData( cmd) ;
			}
		}

        public DataTable GetAllUsers( string appName, int pageIndex, int pageSize)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_getallusers" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
                cmd.Parameters.Add("i_PageIndex", MySqlDbType.Int32 ).Value = pageIndex;
                cmd.Parameters.Add("i_PageSize", MySqlDbType.Int32 ).Value = pageSize;
                MySqlParameter trecords = new MySqlParameter( "i_TotalRecords", MySqlDbType.Int32 );
                trecords.Direction = ParameterDirection.Output;
                cmd.Parameters.Add( trecords );
                return _msSqlDbAccess.GetData( cmd) ;
			}
		}

		public  int GetNumberOfUsersOnline( string appName, int TimeWindow )
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_getnumberofusersonline" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value = appName;
				// Nonstandard args
				cmd.Parameters.Add("i_TimeWindow", MySqlDbType.Timestamp ).Value =  TimeWindow;
				cmd.Parameters.Add("i_CurrentTimeUtc", MySqlDbType.Timestamp ).Value = DateTime.UtcNow;
				MySqlParameter p = new MySqlParameter( "i_ReturnValue", MySqlDbType.Int32 );
				p.Direction = ParameterDirection.ReturnValue;
				cmd.Parameters.Add( p );
				_msSqlDbAccess.ExecuteNonQuery( cmd) ;
				return (int) cmd.Parameters ["i_ReturnValue"].Value ;
			}
		}

        public DataRow GetUser( string appName, object providerUserKey, string userName, bool userIsOnline)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_getuser" ) ) )
			{
                
               
                if (providerUserKey != null)          
                {                   
                    providerUserKey = MsSqlDbAccess.GuidConverter( new Guid(providerUserKey.ToString() ) );
                }

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;               
                cmd.Parameters.Add("i_UserKey", MySqlDbType.String ).Value = providerUserKey;
				cmd.Parameters.Add("i_UserIsOnline", MySqlDbType.Byte ).Value = userIsOnline;
				using ( DataTable dt = _msSqlDbAccess.GetData( cmd)  )
				{
					if ( dt.Rows.Count > 0 )
						return dt.Rows [0];
					else
						return null;
				}
                
			}

		}

        public DataTable GetUserPasswordInfo( string appName, string userName, bool updateUser)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_getuser" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add("i_UserKey", MySqlDbType.String ).Value = DBNull.Value;
                cmd.Parameters.Add("i_UserIsOnline", MySqlDbType.Byte ).Value = updateUser;
				return _msSqlDbAccess.GetData( cmd) ;
			}

		}

        public DataTable GetUserNameByEmail( string appName, string email)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_getusernamebyemail" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value = appName;
				// Nonstandard args
				cmd.Parameters.Add("i_Email", MySqlDbType.VarChar ).Value = email ;
				return _msSqlDbAccess.GetData( cmd) ;
			}
		}

        public void ResetPassword( string appName, string userName, string password, string passwordSalt, int passwordFormat, int maxInvalidPasswordAttempts, int passwordAttemptWindow)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_resetpassword" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName;
				cmd.Parameters.Add("i_Password", MySqlDbType.VarChar ).Value = password ;
                cmd.Parameters.Add("i_PasswordSalt", MySqlDbType.VarChar ).Value = passwordSalt;
                cmd.Parameters.Add("i_PasswordFormat", MySqlDbType.VarChar ).Value = passwordFormat.ToString();
                cmd.Parameters.Add("i_MaxInvalidAttempts", MySqlDbType.Int32 ).Value = maxInvalidPasswordAttempts;
                cmd.Parameters.Add("i_PasswordAttemptWindow", MySqlDbType.Int32 ).Value = passwordAttemptWindow;
                cmd.Parameters.Add("i_CurrentTimeUtc", MySqlDbType.Timestamp ).Value = DateTime.UtcNow;

				_msSqlDbAccess.ExecuteNonQuery( cmd) ;
			}

		}

        public void UnlockUser( string appName, string userName)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_unlockuser" ) ) )
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName",  MySqlDbType.VarChar ).Value= appName ;
				// Nonstandard args
				cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = userName ;
				_msSqlDbAccess.ExecuteNonQuery( cmd) ;
			}
		}

        public int UpdateUser( object appName, MembershipUser user, bool requiresUniqueEmail)
		{
			using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_updateuser" ) ) )
			{
                object providerUserKey = null;
                if (user.ProviderUserKey != null)
                {
                    providerUserKey = MsSqlDbAccess.GuidConverter(new Guid(user.ProviderUserKey.ToString())).ToString();
                }

				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.Add("i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
				// Nonstandard args
                cmd.Parameters.Add("i_UserKey", MySqlDbType.String).Value = providerUserKey;
                cmd.Parameters.Add("i_UserName", MySqlDbType.VarChar ).Value = user.UserName;
                cmd.Parameters.Add("i_Email", MySqlDbType.VarChar ).Value = user.Email;
                cmd.Parameters.Add("i_Comment", MySqlDbType.VarChar ).Value = user.Comment;
                cmd.Parameters.Add("i_IsApproved", MySqlDbType.Byte ).Value = user.IsApproved;
                cmd.Parameters.Add("i_LastLogin", MySqlDbType.Timestamp ).Value = user.LastLoginDate;
				cmd.Parameters.Add("i_LastActivity", MySqlDbType.Timestamp ).Value = user.LastActivityDate.ToUniversalTime();
                cmd.Parameters.Add("i_UniqueEmail", MySqlDbType.Byte ).Value = requiresUniqueEmail;
				
                return (int) _msSqlDbAccess.ExecuteScalar(cmd); // Execute Scalar
			
			}
		}
      /*  public void UpgradeMembership(int previousVersion, int newVersion)
        {
            UpgradeMembership(YafMembershipProvider.ConnStrAppKeyName, previousVersion, newVersion);
        } */

	    public void UpgradeMembership( int previousVersion, int newVersion)
        {
            using (MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_upgrade" ) ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                // Nonstandard args
                cmd.Parameters.Add("i_PreviousVersion", MySqlDbType.Int32 ).Value = previousVersion;
                cmd.Parameters.Add("i_NewVersion", MySqlDbType.Int32 ).Value = newVersion;
                _msSqlDbAccess.ExecuteNonQuery( cmd) ;
            }

        }

	}
}
