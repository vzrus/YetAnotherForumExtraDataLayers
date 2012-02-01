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
    using YAF.Types.Interfaces;
    using Npgsql;

    /// <summary>
    /// YAF Custom Profile Provider
    /// </summary>
    public partial class PgProfileProvider 
    {
        public override int DeleteInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {
            if (authenticationOption == ProfileAuthenticationOption.Anonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }

            // just clear the whole thing...
            ClearUserProfileCache();

            return DB.Current.__DeleteInactiveProfiles( this.ApplicationName, userInactiveSinceDate);
        }

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
            return DB.Current.__DeleteProfiles( this.ApplicationName, userNameBuilder.ToString());
        }

        public override int DeleteProfiles(ProfileInfoCollection profiles)
        {


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

        public override ProfileInfoCollection FindInactiveProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, usernameToMatch, userInactiveSinceDate, out totalRecords);
        }

        public override ProfileInfoCollection FindProfilesByUserName(ProfileAuthenticationOption authenticationOption, string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, usernameToMatch, null, out totalRecords);
        }

        public override ProfileInfoCollection GetAllInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, null, userInactiveSinceDate, out totalRecords);
        }

        public override ProfileInfoCollection GetAllProfiles(ProfileAuthenticationOption authenticationOption, int pageIndex, int pageSize, out int totalRecords)
        {
            return GetProfileAsCollection(authenticationOption, pageIndex, pageSize, null, null, out totalRecords);
        }

        public override int GetNumberOfInactiveProfiles(ProfileAuthenticationOption authenticationOption, DateTime userInactiveSinceDate)
        {
            if (authenticationOption == ProfileAuthenticationOption.Anonymous)
            {
                ExceptionReporter.ThrowArgument("PROFILE", "NOANONYMOUS");
            }
           
            return DB.Current.__GetNumberInactiveProfiles( this.ApplicationName, userInactiveSinceDate);
        }
        //
        // GetProfileInfoFromReader
        //  Takes the current row from the OdbcDataReader
        // and populates a ProfileInfo object from the values. 
        //

        private ProfileInfo GetProfileInfoFromReader(IDataReader reader)
        {
            string username = reader.GetString(0);

            DateTime lastActivityDate = new DateTime();
            if (reader.GetValue(1) != DBNull.Value)
                lastActivityDate = reader.GetDateTime(1);

            DateTime lastUpdatedDate = new DateTime();
            if (reader.GetValue(2) != DBNull.Value)
                lastUpdatedDate = reader.GetDateTime(2);

            bool isAnonymous = reader.GetBoolean(3);

            // ProfileInfo.Size not currently implemented.
            ProfileInfo p = new ProfileInfo(username,
                isAnonymous, lastActivityDate, lastUpdatedDate, 0);

            return p;
        }

    }
}
