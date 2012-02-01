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
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Text;
using YAF.Core;
using YAF.Providers.Utils;
using YAF.Utils;

namespace YAF.Providers.Profile
{
    public partial class PgProfileProvider 
    {


        /// <summary>
        /// Takes as input the name of the provider instance and 
        /// a  NameValueCollection of configuration settings. 
        /// Used to set options and property values for the provider instance, 
        /// including implementation-specific values and options specified 
        /// in the machine configuration or Web.config file.
        /// </summary>
        /// <param name="name">Type: System..::.String
        /// The friendly name of the provider. </param>
        /// <param name="config">Type: System.Collections.Specialized..::.NameValueCollection
        /// A collection of the name/value pairs representing 
        /// the provider-specific attributes specified in the configuration 
        /// for this provider. </param>
        public override void Initialize(string name, NameValueCollection config)
        {
            // verify that the configuration section was properly passed
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            // Connection String Name
            this._connStrName = config["connectionStringName"].ToStringDBNull();

            // application name
            this._appName = config["applicationName"];

            if (string.IsNullOrEmpty(this._appName))
            {
                this._appName = "YetAnotherForum";
            }

            // is the connection string set?
            if (this._connStrName.IsSet())
            {
                string connStr = ConfigurationManager.ConnectionStrings[this._connStrName].ConnectionString;

                // set the app variable...
                if (YafContext.Application[ConnStrAppKeyName] == null)
                {
                    YafContext.Application.Add(ConnStrAppKeyName, connStr);
                }
                else
                {
                    YafContext.Application[ConnStrAppKeyName] = connStr;
                }
            }

            base.Initialize(name, config);
        }
    }
}
