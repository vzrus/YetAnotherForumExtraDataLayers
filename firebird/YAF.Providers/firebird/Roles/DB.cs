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

using System;
using System.Text;
using System.Web;
using System.Configuration;
using System.Web.Security;
using System.Data;
using FirebirdSql.Data.FirebirdClient;

using YAF.Classes;
using YAF.Core;
using YAF.Classes.Data;
using YAF.Classes.Pattern;

namespace YAF.Providers.Roles
{
    public class VzfFirebirdDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if (YafContext.Application[VzfFirebirdRoleProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[VzfFirebirdRoleProvider.ConnStrAppKeyName] as string;
                }

                return Config.ConnectionString;
            }
        }
    }

    public class FbDB
    {
        private MsSqlDbAccess _dbAccess = new MsSqlDbAccess();

        public static FbDB Current
        {
            get
            {
                return PageSingleton<FbDB>.Instance;
            }
        }

        public FbDB()
        {
            _dbAccess.SetConnectionManagerAdapter<VzfFirebirdDBConnManager>();
        }

        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void AddUserToRole( object appName, object userName, object roleName)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_addusertorole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;
                
                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = userName;
                
                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[2].Value = roleName;
               
                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        /// <summary>
        /// Database Action - Create Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void CreateRole( object appName, object roleName)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_createrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = roleName;

               
                _dbAccess.ExecuteNonQuery(cmd );
                int i = 1;
            }
        }

        /// <summary>
        /// Database Action - Delete Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Status as integer</returns>
        public int DeleteRole( object appName, object roleName, object deleteOnlyIfRoleIsEmpty)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_deleterole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = roleName;

                cmd.Parameters.Add(new FbParameter("@i_deleteonlyifroleisempty", FbDbType.Boolean));
                cmd.Parameters[2].Value = deleteOnlyIfRoleIsEmpty;

                FbParameter p = new FbParameter("@i_returnvalue", FbDbType.Integer);
                p.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(p);

                _dbAccess.ExecuteNonQuery(cmd );
                if (p.Value == DBNull.Value)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(cmd.Parameters["@i_returnvalue"].Value);
                }
                }
        }

        /// <summary>
        /// Database Action - Find Users in Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Datatable containing User Information</returns>
        public DataTable FindUsersInRole( object appName, object roleName)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_findusersinrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = roleName;
                
                return _dbAccess.GetData(cmd );
            }
        }

        /// <summary>
        /// Database Action - Get Roles
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleNames">Role Name</param>
        /// <returns>Database containing Role Information</returns>
        public DataTable GetRoles( object appName, object username)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_getroles")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = username;

                
                return _dbAccess.GetData(cmd );
            }
        }

				/// <summary>
				/// Database Action - Get Role Exists
				/// </summary>
				/// <param name="appName">Application Name</param>
				/// <param name="roleName">Role Name</param>
				/// <returns>Database containing Role Information</returns>
        public object GetRoleExists( object appName, object roleName)
				{
					using ( FbCommand cmd = new FbCommand( MsSqlDbAccess.GetObjectName( "P_role_exists" ) ) )
					{
						cmd.CommandType = CommandType.StoredProcedure;
                        
                        cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                        cmd.Parameters[0].Value = appName;
                       
                        cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                        cmd.Parameters[1].Value = roleName;
						
                        return _dbAccess.ExecuteScalar(cmd );
					}
				}

        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>DataTable with user information</returns>
        public  DataTable IsUserInRole(object appName, object userName, object roleName)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_role_isuserinrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
               
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;

                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = userName;

                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[2].Value = roleName;
               
                return _dbAccess.GetData(cmd );
            }
        }

        /// <summary>
        /// Database Action - Remove User From Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void RemoveUserFromRole( object appName, string userName, string roleName)
        {
            using (FbCommand cmd = new FbCommand(MsSqlDbAccess.GetObjectName("P_ROLE_REMUSERFRROLE")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                               
                cmd.Parameters.Add(new FbParameter("@i_applicationname", FbDbType.VarChar));
                cmd.Parameters[0].Value = appName;
                
                cmd.Parameters.Add(new FbParameter("@I_USERNAME", FbDbType.VarChar));
                cmd.Parameters[1].Value = userName;

                cmd.Parameters.Add(new FbParameter("@I_ROLENAME", FbDbType.VarChar));
                cmd.Parameters[2].Value = roleName;
                
                _dbAccess.ExecuteNonQuery(cmd );
            }

        }
    }
}
