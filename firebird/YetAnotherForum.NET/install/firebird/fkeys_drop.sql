﻿/* Yet Another Forum.NET Firebird data layer by vzrus
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

-- Drop all foreign keys if exist.


EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_WATCHTOPIC', 'FK_objQual_WATCHTOPIC_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_WATCHTOPIC', 'FK_objQual_WATCHTOPIC_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_WATCHFORUM', 'FK_objQual_WATCHFORUM1_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_WATCHFORUM', 'FK_objQual_WATCHFORUM1_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERFORUM', 'FK_objQual_USERFORUM_ACCM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERFORUM', 'FK_objQual_USERFORUM_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERFORUM', 'FK_objQual_USERFORUM_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_MESSAGE');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_POLL');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_TOPIC', 'FK_objQual_TOPIC_USER_2');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_NNTPTOPIC', 'FK_objQual_NNTPTOPIC_NNTPF');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_NNTPTOPIC', 'FK_objQual_NNTPTOPIC_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_NNTPFORUM', 'TR_AI_objQual_NNTPFORUM_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_NNTPFORUM', 'TR_AI_objQual_NNTPFORUM_NNTPSERV');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_MESSAGE', 'FK_objQual_MESSAGE_MESID_REPLYTO');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_MESSAGE', 'FK_objQual_MESSAGE_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_MESSAGE', 'FK_objQual_MESSAGE_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUMACCESS', 'FK_objQual_FORUMACCESS_MASK');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUMACCESS', 'FK_objQual_FORUMACCESS_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUMACCESS', 'FK_objQual_FORUMACCESS_GROUP');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUM', 'FK_objQual_FORUM_CATEGORY');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUM', 'FK_objQual_FORUM_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUM', 'FK_objQual_FORUM_MESSAGE');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUM', 'FK_objQual_FORUM_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_FORUM', 'FK_objQual_FORUM_USER');
--GO

EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ATTACHMENT', 'FK_objQual_ATTACHMENT_MESSAGE');
--GO

EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ACTIVE', 'FK_objQual_ACTIVE_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ACTIVE', 'FK_objQual_ACTIVE_FORUM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ACTIVE', 'FK_objQual_ACTIVE_TOPIC');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ACTIVE', 'FK_objQual_ACTIVE_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERPMESSAGE', 'FK_objQual_USERPMESSAGE_PM');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERPMESSAGE', 'FK_objQual_USERPMESSAGE_PMU');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERGROUP', 'FK_objQual_USERGROUP_GROUP');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USERGROUP', 'FK_objQual_USERGROUP_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_PMESSAGE', 'FK_objQual_PMESSAGE_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_EVENTLOG', 'FK_objQual_EVENTLOG_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_CHECKEMAIL', 'FK_objQual_CHECKEMAIL_USER');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USER', 'FK_objQual_USER_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_USER', 'FK_objQual_USER_RANK');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_SMILEY', 'FK_objQual_SMILEY_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_REGISTRY', 'FK_objQual_REGISTRY_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_RANK', 'FK_objQual_RANK_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_POLLVOTE', 'FK_objQual_POLLVOTE_POLL');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_CHOICE', 'FK_objQual_CHOICE_POLL');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_NNTPSERVER', 'FK_objQual_NNTPSERVER_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_GROUP', 'FK_objQual_GROUP_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_EXTENSION', 'FK_objQual_EXTENSION_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_CATEGORY', 'FK_objQual_Category_objQual_Boar');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_BBCODE', 'FK_objQual_BBCODE_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_BANNEDIP', 'FK_objQual_BANNEDIP_BOARDID');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ACCESSMASK', 'FK_objQual_ACCESSMASK_BOARD');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_EVENTLOGGROUPACCESS', 'FK_objQual_ELOGGROUPACCESS_GROUPID');
--GO
EXECUTE PROCEDURE DP_DROP_FKEY_PROC('objQual_ADMINPAGEUSERACCESS', 'FK_objQual_ADMPGUSRACCESS_USERID');
--GO



