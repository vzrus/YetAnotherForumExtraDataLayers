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
namespace YAF.Providers.Profile
{
  using System.Configuration;
  using System.Data;

  /// <summary>
  /// The settings property column.
  /// </summary>
  public class SettingsPropertyColumn
  {
    #region Constants and Fields

    /// <summary>
    /// The data type.
    /// </summary>
    public NpgsqlTypes.NpgsqlDbType DataType;

    /// <summary>
    /// The settings.
    /// </summary>
    public SettingsProperty Settings;

    /// <summary>
    /// The size.
    /// </summary>
    public int Size;

    #endregion

    #region Constructors and Destructors

    /// <summary>
    /// Initializes a new instance of the <see cref="SettingsPropertyColumn"/> class.
    /// </summary>
    public SettingsPropertyColumn()
    {
      // empty for default constructor...
    }

    /// <summary>
    /// Initializes a new instance of the <see cref="SettingsPropertyColumn"/> class.
    /// </summary>
    /// <param name="settings">
    /// The settings.
    /// </param>
    /// <param name="dataType">
    /// The data type.
    /// </param>
    /// <param name="size">
    /// The size.
    /// </param>
    public SettingsPropertyColumn(SettingsProperty settings, NpgsqlTypes.NpgsqlDbType dataType, int size)
    {
      this.DataType = dataType;
      this.Settings = settings;
      this.Size = size;
    }

    #endregion
  }
}