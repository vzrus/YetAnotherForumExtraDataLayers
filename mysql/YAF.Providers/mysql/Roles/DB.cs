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

namespace YAF.Providers.Roles
{
    using System;
    //using System.Collections.Generic;
    
    
    using System.Text;
    using System.Web;
    using System.Configuration.Provider;
    using System.Configuration;
    using System.Collections;
    using System.Collections.Specialized;
    using System.Web.Security;
    using System.Text.RegularExpressions;
    using System.Security.Cryptography;
    using System.Data;
    using YAF.Types.Interfaces;
    using YAF.Types.Constants;

    using MySql.Data;
    using MySql.Data.MySqlClient;

    using YAF.Classes;
    using YAF.Core;
    using YAF.Classes.Data;
    using YAF.Classes.Pattern;
    public class MsSqlRolesDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if (YafContext.Application[YafRoleProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[YafRoleProvider.ConnStrAppKeyName] as string;
                }

                return Config.ConnectionString;
            }
        }
    }

    public class MySQLDB
    {

        private MsSqlDbAccess _msSqlDbAccess = new MsSqlDbAccess();

        public static MySQLDB Current
        {
            get
            {
                return PageSingleton<MySQLDB>.Instance;
            }
        }

        public MySQLDB()
        {
            _msSqlDbAccess.SetConnectionManagerAdapter<MsSqlRolesDBConnManager>();
        }
     
        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void AddUserToRole(string connectionString, object appName, object userName, object roleName)
        {
            using (MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_role_addusertorole" ) ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                _msSqlDbAccess.ExecuteNonQuery(cmd) ;
            }
        }

        /// <summary>
        /// Database Action - Create Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void CreateRole(string connectionString, object appName, object roleName)
        {
            using ( MySqlCommand cmd = new MySqlCommand(MsSqlDbAccess.GetObjectName( "prov_role_createrole" ) ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                _msSqlDbAccess.ExecuteNonQuery(cmd) ;
            }
        }

        /// <summary>
        /// Database Action - Delete Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Status as integer</returns>
        public int DeleteRole(string connectionString, object appName, object roleName, object deleteOnlyIfRoleIsEmpty)
        {
            using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName("prov_role_deleterole") ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                cmd.Parameters.Add( "i_DeleteOnlyIfRoleIsEmpty", MySqlDbType.Byte ).Value = deleteOnlyIfRoleIsEmpty;

                MySqlParameter p = new MySqlParameter( "i_ReturnValue", MySqlDbType.Int32 );
                p.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add( p );

                _msSqlDbAccess.ExecuteNonQuery(cmd) ;

                return Convert.ToInt32( cmd.Parameters["i_ReturnValue"].Value );
            }
        }

        /// <summary>
        /// Database Action - Find Users in Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Datatable containing User Information</returns>
        public DataTable FindUsersInRole(string connectionString, object appName, object roleName)
        {
            using (MySqlCommand cmd = new MySqlCommand(MsSqlDbAccess.GetObjectName("prov_role_findusersinrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                return _msSqlDbAccess.GetData(cmd) ;
            }
        }

        /// <summary>
        /// Database Action - Get Roles
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleNames">Role Name</param>
        /// <returns>Database containing Role Information</returns>
        public DataTable GetRoles(string connectionString, object appName, object userName)
        {
            using (MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_role_getroles" ) ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_UserName", MySqlDbType.VarChar ).Value = userName;
                return _msSqlDbAccess.GetData(cmd) ;
            }
        }

				/// <summary>
				/// Database Action - Get Role Exists
				/// </summary>
				/// <param name="appName">Application Name</param>
				/// <param name="roleName">Role Name</param>
				/// <returns>Database containing Role Information</returns>
        public object GetRoleExists(string connectionString, object appName, object roleName)
				{
					using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName( "prov_role_exists" ) ) )
					{
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.Add( "i_ApplicationName",  MySqlDbType.VarChar ).Value= appName;
                        cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
						
						return _msSqlDbAccess.ExecuteScalar(cmd) ;
					}
				}

        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>DataTable with user information</returns>
        public DataTable IsUserInRole(string connectionString, object appName, object userName, object roleName)
        {
            using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName("prov_role_isuserinrole") ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                return _msSqlDbAccess.GetData(cmd) ;
            }
        }

        /// <summary>
        /// Database Action - Remove User From Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void RemoveUserFromRole(string connectionString, object appName, string userName, string roleName)
        {
            using ( MySqlCommand cmd = new MySqlCommand( MsSqlDbAccess.GetObjectName("prov_role_removeuserfromrole") ) )
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add( "i_ApplicationName", MySqlDbType.VarChar ).Value = appName;
                cmd.Parameters.Add( "i_UserName", MySqlDbType.VarChar ).Value = userName;
                cmd.Parameters.Add( "i_RoleName", MySqlDbType.VarChar ).Value = roleName;
                _msSqlDbAccess.ExecuteNonQuery(cmd) ;
            }

        }
    }
}
