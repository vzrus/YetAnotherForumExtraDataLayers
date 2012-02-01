/* Yet Another Forum.NET
 * Copyright (C) 2003-2005 Bjørnar Henden
 * Copyright (C) 2006-2009 Jaben Cargman
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
using YAF.Types.Handlers;
using YAF.Types.Interfaces;

namespace YAF.Classes.Data
{
  using System;
  using System.Data;
  using Npgsql;
  using YAF.Classes.Pattern;

  
  /// <summary>
  /// Provides open/close management for DB Connections
  /// </summary>
    public class PostgreDbConnectionManager : IDbConnectionManager
  {
    /// <summary>
    /// The _connection.
    /// </summary>
    protected NpgsqlConnection _connection = null;

    /// <summary>
    /// Initializes a new instance of the <see cref="YafDBConnManager"/> class.
    /// </summary>
    public PostgreDbConnectionManager()
    {
      // just initalize it (not open)
      InitConnection();
    }

    /// <summary>
    /// Gets ConnectionString.
    /// </summary>
    public virtual string ConnectionString
    {
      get
      {
        return Config.ConnectionString;
      }
    }

    /// <summary>
    /// Gets the current DB Connection in any state.
    /// </summary>
    public NpgsqlConnection DBConnection
    {
      get
      {
        InitConnection();
        return this._connection;
      }
    }

    /// <summary>
    /// Gets an open connection to the DB. Can be called any number of times.
    /// </summary>
    public NpgsqlConnection OpenDBConnection
    {
      get
      {
        InitConnection();

        if (this._connection.State != ConnectionState.Open)
        {
          // open it up...
          this._connection.Open();
        }

        return this._connection;
      }
    }

    #region IDisposable Members

    /// <summary>
    /// The dispose.
    /// </summary>
    public virtual void Dispose()
    {
      // close and delete connection
      CloseConnection();
      this._connection = null;
    }

    #endregion

    /// <summary>
    /// The info message.
    /// </summary>
    public event YafDBConnInfoMessageEventHandler InfoMessage;

    /// <summary>
    /// The init connection.
    /// </summary>
    public void InitConnection()
    {
      if (this._connection == null)
      {
        // create the connection
        this._connection = new NpgsqlConnection();
        this._connection.Notification += new NotificationEventHandler(Connection_InfoMessage);
        this._connection.ConnectionString = ConnectionString;
      }
      else if (this._connection.State != ConnectionState.Open)
      {
        // verify the connection string is in there...
        this._connection.ConnectionString = ConnectionString;
      }
    }

    /// <summary>
    /// The close connection.
    /// </summary>
    public void CloseConnection()
    {
      if (this._connection != null && this._connection.State != ConnectionState.Closed)
      {
        this._connection.Close();
      }
    }
    /// <summary>
    /// Gets DBConnection.
    /// </summary>
    IDbConnection IDbConnectionManager.DBConnection
    {
        get
        {
            return this.DBConnection;
        }
    }

    /// <summary>
    /// Gets OpenDBConnection.
    /// </summary>
    IDbConnection IDbConnectionManager.OpenDBConnection
    {
        get
        {
            return this.OpenDBConnection;
        }
    }

    /// <summary>
    /// The connection_ info message.
    /// </summary>
    /// <param name="sender">
    /// The sender.
    /// </param>
    /// <param name="e">
    /// The e.
    /// </param>
    protected void Connection_InfoMessage(object sender, NpgsqlNotificationEventArgs e)
    {
        if (InfoMessage != null)
        {
            InfoMessage(this, new YafDBConnInfoMessageEventArgs(e.PID.ToString() + ":::" + e.Condition));
        }
    }
  }
}
