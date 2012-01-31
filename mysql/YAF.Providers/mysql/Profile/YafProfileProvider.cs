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

using System.Web.Configuration;
using YAF.Classes.Data;
using YAF.Types.Interfaces;
using YAF.Utils;


namespace YAF.Providers.Profile
{ 
  using System;
  using System.Collections.Generic;
  using System.Collections.Specialized;
  using System.Configuration;
  using System.Data;
  using System.Globalization;
  using System.Text;
  using System.Web.Profile;
  using YAF.Core;
  using YAF.Classes.Pattern;
  using YAF.Providers.Utils;
  using MySql.Data.MySqlClient;
	/// <summary>
	/// YAF Custom Profile Provider
	/// </summary>
    public class YafProfileProvider : ProfileProvider
    {
    #region Constants and Fields
    /// <summary>
    /// The conn str app key name.
    /// </summary>
        private static string _connStrAppKeyName = "YafProfileConnectionString";
        private string _appName;
        private string _connStrName;        
        private bool _propertiesSetup = false;
        private object _propertyLock = new object();
        private System.Collections.Generic.List<SettingsPropertyColumn> _settingsColumnsList = new System.Collections.Generic.List<SettingsPropertyColumn>();
    #endregion
    #region Properties
        private static string _connectionString;
    #region ProviderBase Members(Override Public Properties)
        /// <summary>
        /// Gets the Connection String App Key Name.
        /// </summary>
        public static string ConnStrAppKeyName
    {
      get
      {
        return _connStrAppKeyName;
      }
    }
        /// <summary>
        /// Gets the Connection String App Key Name.
        /// </summary>
        public static string ConnectionString
        {
            get
            {
               // string ss = ConfigurationManager.ConnectionStrings[ConnStrAppKeyName].ConnectionString;

                ProfileSection profileConfig = (ProfileSection)
                WebConfigurationManager.GetSection("system.web/profile");
                _connectionString = profileConfig.Providers["YafProfileProvider"].
                    ElementInformation.Properties["connectionStringName"].Value.ToString();
                return _connectionString;
            }
            set
            {
                _connectionString = value;
            }
        }
        /// <summary>
        /// The application name that is stored with each profile. 
        /// The profile provider uses the application name to store 
        /// profile information separately for each application. 
        /// This enables multiple ASP.NET applications to use the same 
        /// data source without a conflict if the same user = name is created 
        /// in different applications. Alternatively, multiple ASP.NET 
        /// applications can share a profile data source by specifying 
        /// the same application name.
        /// </summary>
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

        private IThreadSafeDictionary<string, SettingsPropertyValueCollection> _userProfileCache = null;

        /// <summary>
        /// Gets UserProfileCache.
        /// </summary>
        private IThreadSafeDictionary<string, SettingsPropertyValueCollection> UserProfileCache
        {
            get
            {
                string key = this.GenerateCacheKey("UserProfileDictionary");

                return this._userProfileCache ??
                       (this._userProfileCache =
                        YafContext.Current.Get<IObjectStore>().GetOrSet(
                          key, () => new ThreadSafeDictionary<string, SettingsPropertyValueCollection>()));
            }
        }

        #endregion
        #endregion

        #region SettingsProvider Members(Overriden Public Methods)
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

        /// <summary>
        /// Takes as input a  SettingsContext and a  SettingsPropertyCollection 
        /// object. The SettingsContext provides information about the user. 
        /// You can use the information as a primary key to retrieve profile 
        /// property information for the user. 
        /// Use the SettingsContext object to get the user name 
        /// and whether the user is authenticated or anonymous.
        /// </summary>
        /// <param name="context"></param>
        /// <param name="collection"></param>
        /// <returns>Return Value Type: System.Configuration..::.SettingsPropertyValueCollection
        /// A SettingsPropertyValueCollection containing the values for 
        /// the specified settings property group. </returns>
        public override SettingsPropertyValueCollection GetPropertyValues(
         SettingsContext context, SettingsPropertyCollection collection)
        {
            SettingsPropertyValueCollection settingPropertyCollection = new SettingsPropertyValueCollection();
            if (collection.Count < 1)
                return settingPropertyCollection;
            // unboxing fits?
            String username = context["UserName"].ToString();

            if (String.IsNullOrEmpty(username))
                return settingPropertyCollection;

            // (if) this provider doesn't support anonymous users
            if (Convert.ToBoolean(context["IsAuthenticated"]) == GeneralProviderSettings.AllowAnonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }

            // Migration code

            // see if it's cached...
            if (UserProfileCache.ContainsKey(username.ToLower()))
            {
                // just use the cached version...
                return UserProfileCache[username.ToLower()];
            }
            else
            {

                if (YAF.Classes.Config.GetConfigValueAsBool("YAF.OldProfileProvider", true))
                {

                    // load the property collection (sync profile class)
                    LoadFromPropertyCollection(collection);

                    // transfer properties regardless...
                    foreach (SettingsProperty prop in collection)
                    {
                        settingPropertyCollection.Add(new SettingsPropertyValue(prop));
                    }

                    // get this profile from the DB				
                    DataTable profileDT = DB.Current.GetProfiles(this.ApplicationName, 0, 1, username, null);

                    if (profileDT.Rows.Count > 0)
                    {
                        DataRow row = profileDT.Rows[0];
                        // load the data into the collection...
                        foreach (SettingsPropertyValue prop in settingPropertyCollection)
                        {
                            object val = row[prop.Name];
                            //Only initialize a SettingsPropertyValue for non-null values
                            if (!(val is DBNull || val == null))
                            {
                                prop.PropertyValue = val;
                                prop.IsDirty = false;
                                prop.Deserialized = true;
                            }
                        }
                    }
                }
                //End of old
                else
                {

                    foreach (SettingsProperty property in collection)
                    {
                        if (property.PropertyType.IsPrimitive || property.PropertyType == typeof(string))
                            property.SerializeAs = SettingsSerializeAs.String;
                        else
                            property.SerializeAs = SettingsSerializeAs.Xml;

                        settingPropertyCollection.Add(new SettingsPropertyValue(property));
                    }

                    // retrieve encoded profile data from the database

                    DataTable dt = DB.Current.GetProfiles(this.ApplicationName, 0, 1, username, null);

                    if (dt.Rows.Count > 0)
                    {
                        YAF.Providers.Profile.DB.UnpackProfileData(dt.Rows[0], settingPropertyCollection);
                    }

                }

                // save this collection to the cache
                UserProfileCache.MergeSafe(username.ToLower(), settingPropertyCollection);
                return settingPropertyCollection;
            }

        }
        /// <summary>
        /// Takes as input a  SettingsContext and a  
        /// SettingsPropertyValueCollection object.The SettingsContext 
        /// provides information about the user. You can use the information 
        /// as a primary key to retrieve profile property information for 
        /// the user. Use the SettingsContext object to get the user name 
        /// and whether the user is authenticated or anonymous. 
        /// The SettingsPropertyValueCollection contains a collection 
        /// of SettingsPropertyValue objects. Each SettingsPropertyValue 
        /// object provides the name, type, and value of the property as 
        /// well as additional information such as the default value for
        /// the property and whether the property is read-only. 
        /// The SetPropertyValues method updates the profile property 
        /// values in the data source for the specified user.
        /// Calling the method also updates the LastActivityDate and 
        /// LastUpdatedDate values for the specified user profile to the 
        /// current date and time.
        /// </summary>
        /// <param name="context">Type: System.Configuration..::.SettingsContext
        /// A SettingsContext describing the current application usage. </param>
        /// <param name="collection">Type: System.Configuration..::.SettingsPropertyValueCollection
        /// A SettingsPropertyValueCollection representing the group 
        /// of property settings to set. </param>
        /// <remarks>  ApplicationSettingsBase contains the  Save method, 
        /// which is called to persist the values of all of its settings 
        /// properties. This method enumerates through all the settings 
        /// providers associated with its settings properties, and calls 
        /// the SetPropertyValues method for each  SettingsProvider to 
        /// perform the actual serialization operation.
        /// The SetPropertyValues method should be implemented with 
        /// security in mind:
        /// *   Only fully trusted code should be allowed to update 
        /// application settings.
        /// Partially trusted code should be allowed to update 
        /// only user application settings. 
        /// Untrusted code is not typically allowed to update 
        /// application settings.
        /// *  Usage quotas should be considered to guard against 
        /// resource attacks by partially trusted applications. </remarks>
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

            object userID = DB.Current.GetProviderUserKey(this.ApplicationName, username);
            if (userID != null)
            {

                // start saving...
                DB.Current.SetProfileProperties(this.ApplicationName, userID, collection, _settingsColumnsList);
                // erase from the cache
                DeleteFromProfileCacheIfExists(username.ToLower());
            }
        }
        #endregion


        #region ProfileProvider Members(Overriden Public Methods)

        public override int DeleteProfiles(string[] usernames)
        {
            if (usernames == null || usernames.Length < 1)
            {
                return 0;
            }

            // make single string of usernames...
            StringBuilder userNameBuilder = new StringBuilder();
            bool bFirst = true;

            for (int i = 0; i < usernames.Length; i++)
            {
                string username = usernames[i].Trim();

                if (username.Length > 0)
                {
                    if (!bFirst) userNameBuilder.Append(","); else bFirst = false;
                    userNameBuilder.Append(username);

                    // delete this user from the cache if they are in there...
                    DeleteFromProfileCacheIfExists(username.ToLower());
                }
            }

            // call the DB...
            return DB.Current.DeleteProfiles(this.ApplicationName, userNameBuilder.ToString());
        }

        public override int DeleteProfiles(ProfileInfoCollection profiles)
        {
            if (profiles == null)
            {
                ExceptionReporter.ThrowArgumentNull("PROFILE", "PROFILESNULL");
            }

            if (profiles.Count < 1)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "PROFILESEMPTY");
            }

            string[] usernames = new string[profiles.Count];

            int index = 0;
            foreach (ProfileInfo profile in profiles)
            {
                usernames[index++] = profile.UserName;
            }

            return DeleteProfiles(usernames);
        }

        public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {
            if (authenticationOption == ProfileAuthenticationOption.Anonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }

            // just clear the whole thing...
            ClearUserProfileCache();

            return DB.Current.DeleteInactiveProfiles(this.ApplicationName, userInactiveSinceDate);
        }

        public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, null, null, out totalRecords);
        }

        public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, null, userInactiveSinceDate, out totalRecords);
        }

        public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, usernameToMatch, null, out totalRecords);
        }

        public override ProfileInfoCollection FindInactiveProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, usernameToMatch, userInactiveSinceDate, out totalRecords);
        }

        public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {
            if (authenticationOption == ProfileAuthenticationOption.Anonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }

            return DB.Current.GetNumberInactiveProfiles(this.ApplicationName, userInactiveSinceDate);
        }
        #endregion

        
        #region Profile Cache     

         /// <summary>
         /// The delete from profile cache if exists.
         /// </summary>
         /// <param name="key">
         /// The key to remove.
         /// </param>
         private void DeleteFromProfileCacheIfExists(string key)
         {
             UserProfileCache.RemoveSafe(key);
         }

        private void ClearUserProfileCache()
        {
            YafContext.Current.Get<IObjectStore>().Remove(
        this.GenerateCacheKey("UserProfileDictionary"));
        }

        private string GenerateCacheKey(string name)
        {
            return String.Format("YafProfileProvider-{0}-{1}", name, this.ApplicationName);
        }
        
        #endregion

        private ProfileInfoCollection GetProfileAsCollection(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, object userNameToMatch, object inactiveSinceDate, out int totalRecords)
        {
            if (authenticationOption == ProfileAuthenticationOption.Anonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }
            if (pageIndex < 0)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "PAGEINDEXTOOSMALL");
            }
            if (pageSize < 1)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "PAGESIZETOOSMALL");
            }

            // get all the profiles...
            // DataSet allProfilesDS = DB.GetProfiles(this.ApplicationName, pageIndex, pageSize, userNameToMatch, inactiveSinceDate);

            // create an instance for the profiles...
            ProfileInfoCollection profiles = new ProfileInfoCollection();

            DataTable allProfilesDT = DB.Current.GetProfiles(this.ApplicationName, pageIndex, pageSize, userNameToMatch, inactiveSinceDate);
            //DataTable profilesCountDT = allProfilesDS.Tables [1];

            foreach (DataRow profileRow in allProfilesDT.Rows)
            {
                string username = profileRow["Username"].ToString();
                DateTime lastActivity = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastActivity"]), DateTimeKind.Utc);
                DateTime lastUpdated = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastUpdated"]), DateTimeKind.Utc);

                profiles.Add(new ProfileInfo(username, false, lastActivity, lastUpdated, 0));
            }

            // get the first record which is the count...
            //totalRecords = Convert.ToInt32( profilesCountDT.Rows [0] [0] );
            // We get rid of the dataset in the future and added TotalRecords toallProfilesDT as first column
            if (allProfilesDT.Rows.Count > 0)
                totalRecords = Convert.ToInt32(allProfilesDT.Rows[0][0]);
            else totalRecords = 0;
            return profiles;
        }

        protected void LoadFromPropertyCollection(SettingsPropertyCollection collection)
        {
            if (!_propertiesSetup)
            {
                lock (_propertyLock)
                // clear it out just in case something is still in there...
                _settingsColumnsList.Clear();

                // validiate all the properties and populate the internal settings collection
                foreach (SettingsProperty property in collection)
                {
                    MySqlDbType dbType;
                    int size;

                    // parse custom provider data...
                    GetDbTypeAndSizeFromString(property.Attributes["CustomProviderData"].ToString(), out dbType, out size);

                    // default the size to 256 if no size is specified
                    if (dbType == MySqlDbType.VarChar && size == -1)
                    {
                        size = 256;
                    }
                    _settingsColumnsList.Add(new SettingsPropertyColumn(property, dbType, size));
                }

                // sync profile table structure with the DB...
                DataTable structure = DB.Current.GetProfileStructure(ConnStrAppKeyName);

                // verify all the columns are there...
                foreach (SettingsPropertyColumn column in _settingsColumnsList)
                {
                    // see if this column exists
                    if (!structure.Columns.Contains(column.Settings.Name))
                    {
                        // if not, create it...
                        DB.Current.AddProfileColumn( column.Settings.Name, column.DataType, column.Size);
                    }
                }

                // it's setup now...
                _propertiesSetup = true;
            }
        }

        protected void LoadFromPropertyValueCollection(SettingsPropertyValueCollection collection)
        {
            if (!_propertiesSetup)
            {
                // clear it out just in case something is still in there...
                _settingsColumnsList.Clear();

                // validiate all the properties and populate the internal settings collection
                foreach (SettingsPropertyValue value in collection)
                {
                    MySqlDbType dbType;
                    int size;

                    // parse custom provider data...
                    GetDbTypeAndSizeFromString(value.Property.Attributes["CustomProviderData"].ToString(), out dbType, out size);

                    // default the size to 256 if no size is specified
                    if (dbType == MySqlDbType.VarChar && size == -1)
                    {
                        size = 256;
                    }
                    _settingsColumnsList.Add(new SettingsPropertyColumn(value.Property, dbType, size));
                }

                // sync profile table structure with the DB...
                DataTable structure = DB.Current.GetProfileStructure(ConnStrAppKeyName);

                // verify all the columns are there...
                foreach (SettingsPropertyColumn column in _settingsColumnsList)
                {
                    // see if this column exists
                    if (!structure.Columns.Contains(column.Settings.Name))
                    {
                        // if not, create it...
                        DB.Current.AddProfileColumn(column.Settings.Name, column.DataType, column.Size);
                    }
                }

                // it's setup now...
                _propertiesSetup = true;
            }
        }

        private bool GetDbTypeAndSizeFromString(string providerData, out MySqlDbType dbType, out int size)
        {
            size = -1;
            dbType = MySqlDbType.VarChar;

            if (String.IsNullOrEmpty(providerData))
            {
                return false;
            }

            // split the data
            string[] chunk = providerData.Split(new char[] { ';' });

            // first item is the column name...
            string columnName = chunk[0];
            // vzrus: here we replace MS SQL data types
            if (chunk[1].IndexOf("varchar") >= 0)
            { chunk[1] = "VarChar"; }
            if (chunk[1].IndexOf("int") >= 0)
            { chunk[1] = "Int32"; }
            if (chunk[1].IndexOf("DateTime") >= 0)
            { chunk[1] = "DateTime"; }

            // get the datatype and ignore case...
            dbType = (MySqlDbType)Enum.Parse(typeof(MySqlDbType), chunk[1], true);

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

    }	
    
}

namespace YAF.Providers.Utils
{
    internal static class GeneralProviderSettings
    {

        internal static bool AllowAnonymous
        {
            get
            {
                return false;
            }

        }
    }
}

