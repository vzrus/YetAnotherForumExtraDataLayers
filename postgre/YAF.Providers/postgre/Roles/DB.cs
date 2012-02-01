/* Copyright (C) 2009 vzrus
 * http://sourceforge.net/yaf-datalayers 
 * PostgreSQL data layers for Yet Another Forum.NET
 * The code structure is based on code for MS SQL Server database for 1.9.3 
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

using System;
using System.Collections.Generic;
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
using Npgsql;

using YAF.Classes;
using YAF.Core;
using YAF.Classes.Data;
using YAF.Classes.Pattern;

namespace YAF.Providers.Roles
{
    public class YafRolesDBConnManager : MsSqlDbConnectionManager
    {
        public override string ConnectionString
        {
            get
            {
                if (YafContext.Application[PgRoleProvider.ConnStrAppKeyName] != null)
                {
                    return YafContext.Application[PgRoleProvider.ConnStrAppKeyName] as string;
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
            _dbAccess.SetConnectionManagerAdapter<YafRolesDBConnManager>();
        }
        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void __AddUserToRole( object appName, object userName, object roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_addusertorole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        /// <summary>
        /// Database Action - Create Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns></returns>
        public void __CreateRole( object appName, object roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_createrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                cmd.Parameters.Add(new NpgsqlParameter("i_newroleguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd );
            }
        }

        /// <summary>
        /// Database Action - Delete Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Status as integer</returns>
        public int __DeleteRole( object appName, object roleName, object deleteOnlyIfRoleIsEmpty)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_deleterole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_deleteonlyifroleisempty", NpgsqlTypes.NpgsqlDbType.Boolean)).Value = deleteOnlyIfRoleIsEmpty;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                NpgsqlParameter p = new NpgsqlParameter("i_returnvalue", NpgsqlTypes.NpgsqlDbType.Integer);
                p.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(p);

                _dbAccess.ExecuteNonQuery(cmd );
                if (p.Value == DBNull.Value)
                {
                    return 0;
                }
                else
                {
                    return Convert.ToInt32(cmd.Parameters["i_returnvalue"].Value);
                }
            }
        }

        /// <summary>
        /// Database Action - Find Users in Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Datatable containing User Information</returns>
        public DataTable __FindUsersInRole( object appName, object roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_findusersinrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return _dbAccess.GetData(cmd);
            }
        }

        /// <summary>
        /// Database Action - Get Roles
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleNames">Role Name</param>
        /// <returns>Database containing Role Information</returns>
        public DataTable __GetRoles( object appName, object username)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_getroles")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = username;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();
                return _dbAccess.GetData(cmd );
            }
        }

        /// <summary>
        /// Database Action - Get Role Exists
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>Database containing Role Information</returns>
        public object __GetRoleExists( object appName, object roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_exists")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                return _dbAccess.ExecuteScalar(cmd);
            }
        }

        /// <summary>
        /// Database Action - Add User to Role
        /// </summary>
        /// <param name="appName">Application Name</param>
        /// <param name="userName">User Name</param>
        /// <param name="roleName">Role Name</param>
        /// <returns>DataTable with user information</returns>
        public DataTable __IsUserInRole( object appName, object userName, object roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_isuserinrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

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
        public void __RemoveUserFromRole( object appName, string userName, string roleName)
        {
            using (NpgsqlCommand cmd = new NpgsqlCommand(MsSqlDbAccess.GetObjectName("prov_role_removeuserfromrole")))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add(new NpgsqlParameter("i_applicationname", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = appName;
                cmd.Parameters.Add(new NpgsqlParameter("i_username", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = userName;
                cmd.Parameters.Add(new NpgsqlParameter("i_rolename", NpgsqlTypes.NpgsqlDbType.Varchar)).Value = roleName;
                cmd.Parameters.Add(new NpgsqlParameter("i_newroleguid", NpgsqlTypes.NpgsqlDbType.Uuid)).Value = Guid.NewGuid();

                _dbAccess.ExecuteNonQuery(cmd );
            }

        }
    }
}
