/* Yet Another Forum.NET Firebird data layer by vzrus
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

using System.Collections.Concurrent;
using System.Web.Configuration;
using YAF.Types.Interfaces;

namespace YAF.Providers.Profile
{
    using System;
    using System.Collections.Generic;
    using System.Collections.Specialized;
    using System.Configuration;
    using System.Data;
    using System.Text;
    using System.Web.Profile;
    using YAF.Core;
    using YAF.Classes.Pattern;
    using YAF.Providers.Utils;
    using FirebirdSql.Data;
    using FirebirdSql.Data.FirebirdClient;
	/// <summary>
	/// YAF Custom Profile Provider
	/// </summary>
	public class VzfFirebirdProfileProvider : ProfileProvider
    {
        #region Constants and Fields

        static private string _connStrAppKeyName = "YafProfileConnectionString";
        private static string _connectionString;
        private string _appName, _connStrName;
		private bool _propertiesSetup = false;
        private object _propertyLock = new object();		
		private System.Collections.Generic.List<FbSettingsPropertyColumn> _settingsColumnsList = new System.Collections.Generic.List<FbSettingsPropertyColumn>();
        
        #endregion

		#region Properties
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
            return _connectionString;
        }
        set
        {
            _connectionString = value;
        }
    }
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

        private ConcurrentDictionary<string, SettingsPropertyValueCollection> _userProfileCache = null;

        /// <summary>
        /// Gets UserProfileCache.
        /// </summary>
        private ConcurrentDictionary<string, SettingsPropertyValueCollection> UserProfileCache
        {
            get
            {
                string key = this.GenerateCacheKey("UserProfileDictionary");

                return this._userProfileCache ??
                       (this._userProfileCache =
                        YafContext.Current.Get<IObjectStore>().GetOrSet(
                          key, () => new ConcurrentDictionary<string, SettingsPropertyValueCollection>()));
            }
        }
        #endregion               

		#region Overriden Public Methods

		/// <summary>
		/// Sets up the profile providers
		/// </summary>
		/// <param name="name"></param>
		/// <param name="config"></param>
		public override void Initialize( string name, NameValueCollection config )
		{
            // verify that the configuration section was properly passed
            if (config == null)
                throw new ArgumentNullException("config");


            // Connection String Name
            this._connStrName = config["connectionStringName"].ToStringDBNull();
           
            // application name
            _appName = config["applicationName"];
            if (string.IsNullOrEmpty(_appName))
                _appName = "YetAnotherForum";

            // is the connection string set?
            if (!String.IsNullOrEmpty(_connStrName))
            {
                string connStr = ConfigurationManager.ConnectionStrings[_connStrName].ConnectionString;
                ConnectionString = connStr;
                // set the app variable...
                if (YafContext.Application[_connStrAppKeyName] == null)
                {
                    YafContext.Application.Add(_connStrAppKeyName, connStr);
                }
                else
                {
                    YafContext.Application[_connStrAppKeyName] = connStr;
                }
            }

			base.Initialize( name, config );
		}

		protected void LoadFromPropertyCollection( SettingsPropertyCollection collection )
		{
			if ( !_propertiesSetup )
			{
                lock (_propertyLock)
				// clear it out just in case something is still in there...
				_settingsColumnsList.Clear();

				// validiate all the properties and populate the internal settings collection
				foreach ( SettingsProperty property in collection )
				{
					FbDbType dbType;
					int size;

					// parse custom provider data...
					GetDbTypeAndSizeFromString( property.Attributes ["CustomProviderData"].ToString(), out dbType, out size );

					// default the size to 256 if no size is specified
					if ( dbType == FbDbType.VarChar && size == -1 )
					{
						size = 256;
					}
					_settingsColumnsList.Add( new FbSettingsPropertyColumn( property, dbType, size ) );
				}

				// sync profile table structure with the DB...
                DataTable structure = FbDB.Current.GetProfileStructure(ConnectionString);

				// verify all the columns are there...
				foreach ( FbSettingsPropertyColumn column in _settingsColumnsList )
				{
					// see if this column exists
					if ( !structure.Columns.Contains( column.Settings.Name ) )
					{
						// if not, create it...
						FbDB.Current.AddProfileColumn( column.Settings.Name, column.DataType, column.Size );
					}
				}

				// it's setup now...
				_propertiesSetup = true;
			}
		}

		protected void LoadFromPropertyValueCollection( SettingsPropertyValueCollection collection )
		{
			if ( !_propertiesSetup )
			{
				// clear it out just in case something is still in there...
				_settingsColumnsList.Clear();

				// validiate all the properties and populate the internal settings collection
				foreach ( SettingsPropertyValue value in collection )
				{
					FbDbType dbType;
					int size;

					// parse custom provider data...
					GetDbTypeAndSizeFromString( value.Property.Attributes ["CustomProviderData"].ToString(), out dbType, out size );

					// default the size to 256 if no size is specified
					if ( dbType == FbDbType.VarChar && size == -1 )
					{
						size = 256;
					}
					_settingsColumnsList.Add( new FbSettingsPropertyColumn( value.Property, dbType, size ) );
				}

				// sync profile table structure with the DB...
                DataTable structure = FbDB.Current.GetProfileStructure(ConnectionString);

				// verify all the columns are there...
				foreach ( FbSettingsPropertyColumn column in _settingsColumnsList )
				{
					// see if this column exists
					if ( !structure.Columns.Contains( column.Settings.Name ) )
					{
						// if not, create it...
                        FbDB.Current.AddProfileColumn( column.Settings.Name, column.DataType, column.Size);
					}
				}

				// it's setup now...
				_propertiesSetup = true;
			}
		}

		private bool GetDbTypeAndSizeFromString( string providerData, out FbDbType dbType, out int size )
		{
			size = -1;
			dbType = FbDbType.VarChar;

			if ( String.IsNullOrEmpty( providerData ) )
			{
				return false;
			}

			// split the data
			string [] chunk = providerData.Split( new char [] { ';' } );

			// first item is the column name...            
			string columnName = chunk [0];
            // vzrus: here we replace MS SQL data types
            if (chunk[1].IndexOf("varchar") >= 0 || chunk[1].IndexOf("nvarchar") >= 0)
            { chunk[1] = "VarChar"; }
            if (chunk[1].IndexOf("int") >= 0)
            { chunk[1] = "Integer"; }
            if (chunk[1].IndexOf("DateTime") >= 0)
            { chunk[1] = "TimeStamp"; }
            if (chunk[1].IndexOf("bit") >= 0)
            { chunk[1] = "Boolean"; }
            
			// get the datatype and ignore case...
			dbType = ( FbDbType )Enum.Parse(typeof( FbDbType ), chunk [1], true );

			if ( chunk.Length > 2 )
			{
				// handle size...
				if ( !Int32.TryParse( chunk [2], out size ) )
				{
					throw new ArgumentException( "Unable to parse as integer: " + chunk [2] );
				}
			}

			return true;
		}

		public override int DeleteInactiveProfiles( ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate )
		{
			if ( authenticationOption == ProfileAuthenticationOption.Anonymous )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "NOANONYMOUS" );
			}

			// just clear the whole thing...
			ClearUserProfileCache();

            return FbDB.Current.DeleteInactiveProfiles( this.ApplicationName, userInactiveSinceDate);
		}

		public override int DeleteProfiles( string [] usernames )
		{
			if ( usernames == null || usernames.Length < 1 )
			{
				return 0;
			}

			// make single string of usernames...
			StringBuilder userNameBuilder = new StringBuilder();
			bool bFirst = true;

			for ( int i = 0; i < usernames.Length; i++ )
			{
				string username = usernames [i].Trim();

				if ( username.Length > 0 )
				{
					if ( !bFirst ) userNameBuilder.Append( "," ); else bFirst = false;
					userNameBuilder.Append( username );

					// delete this user from the cache if they are in there...
					DeleteFromProfileCacheIfExists( username.ToLower() );
				}
			}

			// call the DB...
            return FbDB.Current.DeleteProfiles( this.ApplicationName, userNameBuilder.ToString());
		}

		public override int DeleteProfiles( ProfileInfoCollection profiles )
		{
			if ( profiles == null )
			{
				ExceptionReporter.ThrowArgumentNull( "PROFILE", "PROFILESNULL" );
			}

			if ( profiles.Count < 1 )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "PROFILESEMPTY" );
			}

			string [] usernames = new string [profiles.Count];

			int index = 0;
			foreach ( ProfileInfo profile in profiles )
			{
				usernames [index++] = profile.UserName;
			}

			return DeleteProfiles( usernames );
		}

		public override ProfileInfoCollection FindInactiveProfilesByUserName( ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords )
		{
			return GetProfileAsCollection( authenticationOption, pageIndex, pageSize, usernameToMatch, userInactiveSinceDate, out totalRecords );
		}

		public override ProfileInfoCollection FindProfilesByUserName( ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords )
		{
			return GetProfileAsCollection( authenticationOption, pageIndex, pageSize, usernameToMatch, null, out totalRecords );
		}

		public override ProfileInfoCollection GetAllInactiveProfiles( ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords )
		{
			return GetProfileAsCollection( authenticationOption, pageIndex, pageSize, null, userInactiveSinceDate, out totalRecords );
		}

		public override ProfileInfoCollection GetAllProfiles( ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords )
		{
			return GetProfileAsCollection( authenticationOption, pageIndex, pageSize, null, null, out totalRecords );
		}

		public override int GetNumberOfInactiveProfiles( ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate )
		{
			if ( authenticationOption == ProfileAuthenticationOption.Anonymous )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "NOANONYMOUS" );
			}

			return FbDB.Current.GetNumberInactiveProfiles( this.ApplicationName, userInactiveSinceDate );
		}

		private ProfileInfoCollection GetProfileAsCollection( ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, object userNameToMatch, object inactiveSinceDate, out int totalRecords )
		{
			if ( authenticationOption == ProfileAuthenticationOption.Anonymous )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "NOANONYMOUS" );
			}
			if ( pageIndex < 0 )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "PAGEINDEXTOOSMALL" );
			}
			if ( pageSize < 1 )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "PAGESIZETOOSMALL" );
			}

			// get all the profiles...
			

			// create an instance for the profiles...
			ProfileInfoCollection profiles = new ProfileInfoCollection();

            DataTable allProfilesDT = FbDB.Current.GetProfiles( this.ApplicationName, pageIndex, pageSize, userNameToMatch, inactiveSinceDate); ;
			

			foreach ( DataRow profileRow in allProfilesDT.Rows )
			{
                string username = profileRow["Username"].ToString();
                DateTime lastActivity = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastActivity"]), DateTimeKind.Utc);
                DateTime lastUpdated = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastUpdated"]), DateTimeKind.Utc);

				profiles.Add( new ProfileInfo( username, false, lastActivity, lastUpdated, 0 ) );
			}

			// get the first record which is the count..
            if (allProfilesDT.Rows.Count > 0)
                totalRecords = Convert.ToInt32(allProfilesDT.Rows[0][0]);
            else
                totalRecords = 0;

			return profiles;
		}

        public override SettingsPropertyValueCollection GetPropertyValues(
        SettingsContext context, SettingsPropertyCollection collection)
        {
            SettingsPropertyValueCollection settingPropertyCollection = new SettingsPropertyValueCollection();
            if ( collection.Count < 1 )
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
            if (YAF.Classes.Config.GetConfigValueAsBool("YAF.OldProfileProvider", false))
            {
                // load the property collection (sync profile class)
                LoadFromPropertyCollection(collection);

                // see if it's cached...
                if (UserProfileCache.ContainsKey(username.ToLower()))
                {
                    // just use the cached version...
                    return UserProfileCache[username.ToLower()];
                }
                else
                {
                    // transfer properties regardless...
                    foreach (SettingsProperty prop in collection)
                    {
                        settingPropertyCollection.Add(new SettingsPropertyValue(prop));
                    }

                    // get this profile from the DB				
                    DataTable profileDT = FbDB.Current.GetProfiles( this.ApplicationName, 0, 1, username, null);

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
                    // save this collection to the cache
                    this.UserProfileCache.AddOrUpdate(username.ToLower(), (k) => settingPropertyCollection, (k, v) => settingPropertyCollection);

                }

                return settingPropertyCollection;
            }
            //End of old
            else
            {
                if (UserProfileCache.ContainsKey(username.ToLower()))
                {
                    // just use the cached version...
                    return UserProfileCache[username.ToLower()];
                }
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

                    DataTable dt = FbDB.Current.GetProfiles( this.ApplicationName, 0, 1, username, null);

                    if (dt.Rows.Count > 0)
                    {
                        YAF.Providers.Profile.FbDB.DecodeProfileData(dt.Rows[0], settingPropertyCollection);
                    }

                    // save this collection to the cache
                    this.UserProfileCache.AddOrUpdate(username.ToLower(), (k) => settingPropertyCollection, (k, v) => settingPropertyCollection);


                }
               
                return settingPropertyCollection;
            }
        }

		public override void SetPropertyValues( System.Configuration.SettingsContext context, System.Configuration.SettingsPropertyValueCollection collection )
		{
			string username = ( string ) context ["UserName"];

            if (string.IsNullOrEmpty(username) || collection.Count < 1)
            {
                return;
            }

			// this provider doesn't support anonymous users
			if ( !Convert.ToBoolean(context["IsAuthenticated"]) )
			{
				ExceptionReporter.ThrowArgument( "PROFILE", "NOANONYMOUS" );
			}

			bool itemsToSave = false;

			// First make sure we have at least one item to save
			foreach ( SettingsPropertyValue pp in collection )
			{
				if ( pp.IsDirty )
				{
					itemsToSave = true;
					break;
				}
			}

			if ( !itemsToSave )
				return;

			// load the data for the configuration
			LoadFromPropertyValueCollection( collection );

            object userID = FbDB.Current.GetProviderUserKey( this.ApplicationName, username);
			if ( userID != null )
			{
				// start saving...
                FbDB.Current.SetProfileProperties( this.ApplicationName, userID, collection, _settingsColumnsList);
				// erase from the cache
				DeleteFromProfileCacheIfExists( username.ToLower() );
			}
		}

		#endregion
        
        #region Private Methods
        private void DeleteFromProfileCacheIfExists(string key)
        {
            SettingsPropertyValueCollection collection;

            this.UserProfileCache.TryRemove(key, out collection);

        }

        private void ClearUserProfileCache()
        {
            YafContext.Current.Get<IObjectStore>().Remove(
         this.GenerateCacheKey("UserProfileDictionary"));

        }

        private string GenerateCacheKey(string name)
        {
            return String.Format("VzfFirebirdProfileProvider-{0}-{1}", name, this.ApplicationName);
        }
        #endregion
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
