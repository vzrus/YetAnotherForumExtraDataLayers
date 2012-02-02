﻿/* Yet Another Forum.NET MySQL data layer by vzrus
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



EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_ACCESSMASK','TR_AI_objQual_ACCESS_ACCESSMASKID','AccessMaskID','SEQ_objQual_ACCESSMASK_ACCESSMASKID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_ATTACHMENT','TR_AI_objQual_ATTACH_ATTACHMENTID','AttachmentID','SEQ_objQual_ATTACHMENT_ATTACHMENTID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_BANNEDIP','TR_AI_objQual_BANNEDIP_ID','ID','SEQ_objQual_bannedip_ID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_BBCODE','TR_AI_objQual_BBCODE_BBCODEID','BBCodeID','SEQ_objQual_BBCODE_BBCODEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_BOARD','TR_AI_objQual_BOARD_BOARDID','BoardID','SEQ_objQual_BOARD_BOARDID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_CATEGORY','TR_AI_objQual_CATEGORY_CATEGORYID','CategoryID','SEQ_objQual_CATEGORY_CATEGORYID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_CHECKEMAIL','TR_AI_objQual_CHEKE_CHECKEMAILID','CheckEmailID','SEQ_objQual_CHECKEMAIL_CHECKEMAILID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_CHOICE','TR_AI_objQual_CHOICE_CHOICEID','ChoiceID','SEQ_objQual_CHOICE_CHOICEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_EVENTLOG','TR_AI_objQual_EVENTLOG_EVENTLOGID','EventLogID','SEQ_objQual_EVENTLOG_EVENTLOGID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_EXTENSION','TR_AI_objQual_EXTENSION_EXTENSIONID','ExtensionID','SEQ_objQual_EXTENSION_EXTENSIONID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_FORUM','TR_AI_objQual_FORUM_FORUMID','ForumID','SEQ_objQual_FORUM_FORUMID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_GROUP','FK_objQual_GROUP_GROUPID','GroupID','SEQ_objQual_GROUP_GROUPID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_MAIL','TR_AI_objQual_MAIL_MAILID','MailID','SEQ_objQual_MAIL_MAILID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_MEDAL','TR_AI_objQual_MEDAL_MEDALID','MedalID','SEQ_objQual_MEDAL_MEDALID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_MESSAGE','TR_AI_objQual_MESSAGE_MESSAGEID','MessageID','SEQ_objQual_MESSAGE_MESSAGEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_MESSAGEREPORTEDAUDIT','TR_AI_objQual_MESSAG_LOGID','LogID','SEQ_objQual_MESSAGE_LOGID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_NNTPFORUM','TR_AI_objQual_NNTPFORUM_NNTPFORUMID','NntpForumID','SEQ_objQual_NNTPFORUM_NNTPFORUMID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_NNTPSERVER','TR_AI_objQual_NNTPSE_NNTPSERVERID','NntpServerID','SEQ_objQual_NNTPSERVER_NNTPSERVERID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_NNTPTOPIC','TR_AI_objQual_NNTPTOPIC_NNTPTOPICID','NntpTopicID','SEQ_objQual_NNTPTOPIC_NNTPTOPICID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_PMESSAGE','TR_AI_objQual_PMESSAGE_PMESSAGEID','PMessageID','SEQ_objQual_PMESSAGE_PMESSAGEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_POLL','TR_AI_objQual_POLL_POLLID','PollID','SEQ_objQual_POLL_POLLID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_POLLVOTE','TR_AI_objQual_POLLVOTE_POLLVOTEID','PollVoteID','SEQ_objQual_POLLVOTE_POLLVOTEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_RANK','TR_AI_objQual_RANK_RANKID','RankID','SEQ_objQual_RANK_RANKID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_REGISTRY','TR_AI_objQual_REGISTRY_REGISTRYID','RegistryID','SEQ_objQual_REGISTRY_REGISTRYID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_REPLACE_WORDS','TR_AI_objQual_REPLACE_WORDS_ID','ID','SEQ_objQual_REPLACE_WORDS_ID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_SMILEY','TR_AI_objQual_SMILEY_SMILEYID','SmileyID','SEQ_objQual_SMILEY_SMILEYID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_TOPIC','TR_AI_objQual_TOPIC_TOPICID','TopicID','SEQ_objQual_TOPIC_TOPICID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_USER','TR_AI_objQual_USER_USERID','UserID','SEQ_objQual_USER_USERID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_USERPMESSAGE','TR_AI_objQual_USERPM_USERPMESSAGEID','UserPMessageID','SEQ_objQual_USERPME_USERPMESSAGEID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_WATCHFORUM','TR_AI_objQual_WATCHF_WATCHFORUMID','WatchForumID','SEQ_objQual_WATCHFORUM_WATCHFORUMID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_WATCHTOPIC','TR_AI_objQual_WATCHT_WATCHTOPICID','WatchTopicID','SEQ_objQual_WATCHTOPIC_WATCHTOPICID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_ATTACHMENT','TR_AI_objQual_SBOXMESG_SBOXMESGID','SHOUTBOXMESSAGEID','SEQ_objQual_SBOXMESG_SBOXMESGID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_POLL','TR_AI_objQual_POLL_POLLID','POLLID','SEQ_objQual_POLL_POLLID','ACTIVE','BEFORE INSERT',0,1);
--GO
EXECUTE PROCEDURE DP_DROP_TRIGGER_PROC('objQual_TOPICSTATUS','TR_AI_objQual_TOPSTATUS_TOPSTID','TOPICSTATUSID','SEQ_objQual_TOPSTATUS_TOPSTID','ACTIVE','BEFORE INSERT',0,1);
--GO

