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
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using YAF.Providers.Utils;
using YAFProviders.Utils;

namespace YAF.Providers.Profile
{
    public partial class PgProfileProvider
    {
        /// <summary>
        /// The _app name.
        /// </summary>
        private string _appName;

        public override string ApplicationName
        {
            get
            {
                return _appName;
            }
            set
            {
                _appName = value;
            }
        }

        public override SettingsPropertyValueCollection GetPropertyValues(
        SettingsContext context, SettingsPropertyCollection collection)
        {
            var settingPropertyCollection = new SettingsPropertyValueCollection();
            if (collection.Count < 1) return settingPropertyCollection;
            // unboxing fits?
            String username = context["UserName"].ToString();

            if (String.IsNullOrEmpty(username))
                return settingPropertyCollection;

            // (if) this provider doesn't support anonymous users
            if (Convert.ToBoolean(context["IsAuthenticated"]) == GeneralProviderSettings.AllowAnonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }
            
            foreach (SettingsProperty property in collection)
            {
                if (property.PropertyType.IsPrimitive || property.PropertyType == typeof(string))
                    property.SerializeAs = SettingsSerializeAs.String;
                else
                    property.SerializeAs = SettingsSerializeAs.Xml;
                settingPropertyCollection.Add(new SettingsPropertyValue(property));
            }

            // retrieve encoded profile data from the database
            try
            {
                DataTable dt = DB.Current.__GetProfiles( ApplicationName, 0, 1, username, null);
                if (dt.Rows.Count > 0)
                {
                    YAF.Providers.Profile.DB.DecodeProfileData(dt.Rows[0], settingPropertyCollection);
                }
                
                // save this collection to the cache it should be deleted as useless or in other place? 

                if (!UserProfileCache.ContainsKey(username.ToLower()))
                {
                    UserProfileCache.MergeSafe(username.ToLower(), settingPropertyCollection);
                }
            }
            catch (Exception ex)
            {
                YAF.Classes.Data.LegacyDb.eventlog_create(null, "/Profile/DB.cs SetPropertyValues method", ex);
                //throw new ProviderException("Unable to retrieve profile data.", ex);
            }
            return settingPropertyCollection;
        }

        public override void SetPropertyValues(System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyValueCollection collection)
        {
            string username = (string)context["UserName"];

            if (string.IsNullOrEmpty(username) || collection.Count < 1)
                return;

            // this provider doesn't support anonymous users
            if (!Convert.ToBoolean(context["IsAuthenticated"]))
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }

            bool itemsToSave = false;

            // First make sure we have at least one item to save
            foreach (SettingsPropertyValue pp in collection)
            {
                if (pp.IsDirty)
                {
                    itemsToSave = true;
                    break;
                }
            }

            if (!itemsToSave)
                return;

            // load the data for the configuration
            LoadFromPropertyValueCollection(collection);

            object userID = DB.Current.__GetProviderUserKey( this.ApplicationName, username);
            if (userID != null)
            {
                // start saving...
                DB.Current.__SetProfileProperties( this.ApplicationName, userID, collection, _settingsColumnsList);
                // erase from the cache
                DeleteFromProfileCacheIfExists(username.ToLower());
            }
        }

    }
    
}
