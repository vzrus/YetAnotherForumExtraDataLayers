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

using System.Web.Profile;
using NpgsqlTypes;
using YAF.Types.Interfaces;

namespace YAF.Providers.Profile
{
    using System;
    using System.Collections.Generic;
    using System.Collections.Specialized;
    using System.Configuration;
    using System.Data;
    using System.Text;
    using YAF.Core;
    using YAF.Classes.Pattern;
    using YAF.Providers.Utils;
    using Npgsql;
	/// <summary>
	/// YAF Custom Profile Provider
	/// </summary>
	public partial class PgProfileProvider : ProfileProvider
    {
       #region Constants and Fields

        /// <summary>
        /// The conn str app key name.
        /// </summary>
        private static string _connStrAppKeyName = "PgProfileConnectionString";
        private static string _connectionString;
 

        /// <summary>
        /// The _conn str name.
        /// </summary>
        private string _connStrName;

        /// <summary>
        /// The _properties setup.
        /// </summary>
        private bool _propertiesSetup = false;

        /// <summary>
        /// The _property lock.
        /// </summary>
        private object _propertyLock = new object();

        /// <summary>
        /// The _settings columns list.
        /// </summary>
        private List<SettingsPropertyColumn> _settingsColumnsList = new List<SettingsPropertyColumn>();

        
        #endregion

       #region Override Public Properties
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
		
		#endregion
    
       #region Common Properties
    /// <summary>
    /// Gets UserProfileCache.
    /// </summary>  
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
 
        /// <summary>
        /// The delete from profile cache if exists.
        /// </summary>
        /// <param name="key">
        /// The key to remove.
        /// </param>
        private void DeleteFromProfileCacheIfExists(string key)
        {
            this.UserProfileCache.RemoveSafe(key);
        }
        /// <summary>
        /// The clear user profile cache.
        /// </summary>
		private void ClearUserProfileCache()
		{
            YafContext.Current.Get<IObjectStore>().Remove(
       this.GenerateCacheKey("UserProfileDictionary"));
		}

		private string GenerateCacheKey( string name )
		{
			return String.Format( "PgProfileProvider-{0}-{1}", name, this.ApplicationName );
		}

		#region Overriden Public Methods


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
					NpgsqlDbType dbType;
					int size;

					// parse custom provider data...
					DB.GetDbTypeAndSizeFromString( property.Attributes ["CustomProviderData"].ToString(), out dbType, out size );

					// default the size to 256 if no size is specified
                    // default the size to 256 if no size is specified
                    if (dbType == NpgsqlDbType.Varchar && size == -1)
                    {
                        size = 256;
                    }
					_settingsColumnsList.Add( new SettingsPropertyColumn( property, dbType, size ) );
				}

				// sync profile table structure with the db...
				DataTable structure = DB.Current.__GetProfileStructure("");

				// verify all the columns are there...
				foreach ( SettingsPropertyColumn column in _settingsColumnsList )
				{
					// see if this column exists
					if ( !structure.Columns.Contains( column.Settings.Name ) )
					{
						// if not, create it...
                        DB.Current.__AddProfileColumn(   column.Settings.Name, column.DataType, column.Size);
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
					NpgsqlTypes.NpgsqlDbType dbType;
					int size;

					// parse custom provider data...
					DB.GetDbTypeAndSizeFromString( value.Property.Attributes ["CustomProviderData"].ToString(), out dbType, out size );

                    if (dbType == NpgsqlDbType.Varchar && size == -1)
                    {
                        size = 256;
                    }
					_settingsColumnsList.Add( new SettingsPropertyColumn( value.Property, dbType, size ) );
				}

				// sync profile table structure with the db...
                DataTable structure = DB.Current.__GetProfileStructure("");

				// verify all the columns are there...
				foreach ( SettingsPropertyColumn column in _settingsColumnsList )
				{
					// see if this column exists
					if ( !structure.Columns.Contains( column.Settings.Name ) )
					{
						// if not, create it...
                        DB.Current.__AddProfileColumn(   column.Settings.Name, column.DataType, column.Size);
					}
				}

				// it's setup now...
				_propertiesSetup = true;
			}
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
			//DataSet allProfilesDS = DB.GetProfiles( this.ApplicationName, pageIndex, pageSize, userNameToMatch, inactiveSinceDate );

			// create an instance for the profiles...
			var profiles = new ProfileInfoCollection();
            DataTable allProfilesDT = DB.Current.__GetProfiles(   this.ApplicationName, pageIndex, pageSize, userNameToMatch, inactiveSinceDate);
			//DataTable allProfilesDT = allProfilesDS.Tables [0];
			//DataTable profilesCountDT = allProfilesDS.Tables [1];

			foreach ( DataRow profileRow in allProfilesDT.Rows )
			{				
                string username = profileRow["Username"].ToString();
                DateTime lastActivity = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastActivity"]), DateTimeKind.Utc);
                DateTime lastUpdated = DateTime.SpecifyKind(Convert.ToDateTime(profileRow["LastUpdated"]), DateTimeKind.Utc);

				profiles.Add( new ProfileInfo( username, false, lastActivity, lastUpdated, 0 ) );
			}

			// get the first record which is the count...
            totalRecords = Convert.ToInt32(allProfilesDT.Rows[0]["TotalCount"]);

			return profiles;
		}
        

		#endregion
	}
	
   
}


