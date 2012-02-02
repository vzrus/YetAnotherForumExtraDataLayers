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
 * as published by the Free Software Foundation;version 2 only
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



-- Source Index: IX_objQual_CATEGORY_BOARDID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_CATEGORY_BOARDID','objQual_CATEGORY','BoardID');
--GO

-- Source Index: IX_objQual_CATEGORY_NAME
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_CATEGORY_NAME','objQual_CATEGORY','Name');
--GO

-- Source Index: IX_objQual_FORUM_CATEGORYID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_FORUM_CATEGORYID','objQual_FORUM','CategoryID');
--GO

-- Source Index: IX_objQual_FORUM_FLAGS
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_FORUM_FLAGS','objQual_FORUM','Flags');
--GO

-- Source Index: IX_objQual_FORUM_PARENTID

EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_FORUM_PARENTID','objQual_FORUM','ParentID');
--GO

-- Source Index: IX_objQual_ForumAccess_ForumID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_FORUMACCESS_FORUM','objQual_FORUMACCESS','ForumID');
--GO

-- Source Index: IX_objQual_MESSAGE_FLAGS
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_MESSAGE_FLAGS','objQual_MESSAGE','Flags');
--GO

-- Source Index: IX_objQual_MESSAGE_TOPICID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_MESSAGE_TOPICID','objQual_MESSAGE','TopicID');
--GO

-- Source Index: IX_objQual_MESSAGE_USERID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_MESSAGE_USERID','objQual_MESSAGE','UserID');
--GO

-- Source Index: IX_objQual_MESSAGE_POSTED_D
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_MESSAGE_POSTED_D','objQual_MESSAGE','POSTED');
--GO

-- Source Index: IX_objQual_POLLVOTE_POLLID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_POLLVOTE_POLLID','objQual_POLLVOTE','PollID');
--GO

-- Source Index: IX_objQual_POLLVOTE_REMOTEIP
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_POLLVOTE_REMOTEIP','objQual_POLLVOTE','RemoteIP');
--GO

-- Source Index: IX_objQual_POLLVOTE_USERID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_POLLVOTE_USERID','objQual_POLLVOTE','UserID');
--GO

-- Source Index: IX_objQual_REGISTRY_NAME
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_REGISTRY_NAME','objQual_REGISTRY','BoardID,Name');
--GO


-- Source Index: IX_objQual_TOPIC_FLAGS
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_TOPIC_FLAGS','objQual_TOPIC','Flags');
--GO

-- Source Index: IX_objQual_TOPIC_FORUMID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_TOPIC_FORUMID','objQual_TOPIC','ForumID');
--GO

-- Source Index: IX_objQual_TOPIC_USERID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_TOPIC_USERID','objQual_TOPIC','UserID');
--GO



-- Source Index: IX_objQual_USER_FLAGS
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_USER_FLAGS','objQual_USER','Flags');
--GO

-- Source Index: IX_objQual_USER_NAME
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_USER_NAME','objQual_USER','Name');
--GO

-- Source Index: IX_objQual_User_ProviderUserKey
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_USER_PROVIDERUSER','objQual_USER','ProviderUserKey');
--GO

-- Source Index: IX_objQual_USERGROUP_USERID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_USERGROUP_USERID','objQual_USERGROUP','UserID');
--GO

-- Source Index: IX_objQual_UserPMessage_UserID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_USERPMESSAGE_USER','objQual_USERPMESSAGE','UserID');
--GO

--Thanks table

EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_THANKS_MESSAGEID','objQual_THANKS','MESSAGEID');
--GO

EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_THANKS_THANKSFRUSRID','objQual_THANKS','THANKSFROMUSERID');
--GO

EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_THANKS_THANKSTOUSRID','objQual_THANKS','THANKSTOUSERID');
--GO


