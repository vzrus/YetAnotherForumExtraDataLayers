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

CREATE PROCEDURE DP_CHECK_OR_CREATE_TRIGGER_PROC
  (TABNAME VARCHAR(50), TRNAME VARCHAR(50), COLNAME VARCHAR(50), GENNAME VARCHAR(50),ST VARCHAR(50),TT VARCHAR(50), TP INTEGER, GO INTEGER)
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = :TRNAME
  )) THEN  
  EXECUTE STATEMENT 'CREATE TRIGGER "' || :TRNAME ||'" FOR "' 
  || :TABNAME || '"  "' || :ST  || '"  "' || :TT || '" POSITION '' || :TP   
  || '' AS BEGIN IF (NEW."' || :COLNAME  || '" = GEN_ID("' || :GENNAME || '", 1); END;';
  END;
--GO

DROP PROCEDURE DP_CHECK_OR_CREATE_TRIGGER_PROC;
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_SBOXMESG_SBOXMESGID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_SBOXMESG_SBOXMESGID FOR objQual_SHOUTBOXMESSAGE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.SHOUTBOXMESSAGEID IS NULL) THEN
  NEW.SHOUTBOXMESSAGEID = GEN_ID(SEQ_objQual_SBOXMESG_SBOXMESGID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_POLL_POLLID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_POLL_POLLID FOR objQual_POLL
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.POLLID IS NULL) THEN
  NEW.POLLID = GEN_ID(SEQ_objQual_POLL_POLLID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_TOPSTATUS_TOPSTID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_TOPSTATUS_TOPSTID FOR objQual_TOPICSTATUS
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.TOPICSTATUSID IS NULL) THEN
  NEW.TOPICSTATUSID = GEN_ID(SEQ_objQual_TOPSTATUS_TOPSTID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_TOPIC_TOPICID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_TOPIC_TOPICID FOR objQual_TOPIC
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.TOPICID IS NULL) THEN
  NEW.TOPICID = GEN_ID(SEQ_objQual_TOPIC_TOPICID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_ACCESS_ACCESSMASKID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_ACCESS_ACCESSMASKID FOR objQual_ACCESSMASK
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.ACCESSMASKID IS NULL) THEN
  NEW.ACCESSMASKID = GEN_ID(SEQ_objQual_ACCESSMASK_ACCESSMASKID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_ATTACH_ATTACHMENTID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_ATTACH_ATTACHMENTID FOR objQual_ATTACHMENT
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.ATTACHMENTID IS NULL) THEN
  NEW.ATTACHMENTID = GEN_ID(SEQ_objQual_ATTACHMENT_ATTACHMENTID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_BANNEDIP_ID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_BANNEDIP_ID FOR objQual_BANNEDIP
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.ID IS NULL) THEN
  NEW.ID = GEN_ID(SEQ_objQual_BANNEDIP_ID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_BOARD_BOARDID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_BOARD_BOARDID FOR objQual_BOARD
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.BOARDID IS NULL) THEN
  NEW.BOARDID = GEN_ID(SEQ_objQual_BOARD_BOARDID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_CATEGORY_CATEGORYID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_CATEGORY_CATEGORYID FOR objQual_CATEGORY
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.CATEGORYID IS NULL) THEN
  NEW.CATEGORYID = GEN_ID(SEQ_objQual_CATEGORY_CATEGORYID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_CHEKE_CHECKEMAILID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_CHEKE_CHECKEMAILID FOR objQual_CHECKEMAIL
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.CHECKEMAILID IS NULL) THEN
  NEW.CHECKEMAILID = GEN_ID(SEQ_objQual_CHECKEMAIL_CHECKEMAILID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_CHOICE_CHOICEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_CHOICE_CHOICEID FOR objQual_CHOICE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.CHOICEID IS NULL) THEN
  NEW.CHOICEID = GEN_ID(SEQ_objQual_CHOICE_CHOICEID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_EVENTLOG_EVENTLOGID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_EVENTLOG_EVENTLOGID FOR objQual_EVENTLOG
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.EVENTLOGID IS NULL) THEN
  NEW.EVENTLOGID = GEN_ID(SEQ_objQual_EVENTLOG_EVENTLOGID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_EXTENSION_EXTENSIONID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_EXTENSION_EXTENSIONID FOR objQual_EXTENSION
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.EXTENSIONID IS NULL) THEN
  NEW.EXTENSIONID = GEN_ID(SEQ_objQual_EXTENSION_EXTENSIONID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_MAIL_MAILID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_MAIL_MAILID FOR objQual_MAIL
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.MAILID IS NULL) THEN
  NEW.MAILID = GEN_ID(SEQ_objQual_MAIL_MAILID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_FORUM_FORUMID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_FORUM_FORUMID FOR objQual_FORUM
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.FORUMID IS NULL) THEN
  NEW.FORUMID = GEN_ID(SEQ_objQual_FORUM_FORUMID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_BBCODE_BBCODEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_BBCODE_BBCODEID FOR objQual_BBCODE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.BBCODEID IS NULL) THEN
  NEW.BBCODEID = GEN_ID(SEQ_objQual_BBCODE_BBCODEID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_MEDAL_MEDALID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_MEDAL_MEDALID FOR objQual_MEDAL
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.MEDALID IS NULL) THEN
  NEW.MEDALID = GEN_ID(SEQ_objQual_MEDAL_MEDALID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'FK_objQual_GROUP_GROUPID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER FK_objQual_GROUP_GROUPID FOR objQual_GROUP
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.GROUPID IS NULL) THEN
  NEW.GROUPID = GEN_ID(SEQ_objQual_GROUP_GROUPID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_MESSAGE_MESSAGEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_MESSAGE_MESSAGEID FOR objQual_MESSAGE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.MESSAGEID IS NULL) THEN
  NEW.MESSAGEID = GEN_ID(SEQ_objQual_MESSAGE_MESSAGEID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_MESSAG_LOGID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_MESSAG_LOGID FOR objQual_MESSAGEREPORTEDAUDIT
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.LOGID IS NULL) THEN
  NEW.LOGID = GEN_ID(SEQ_objQual_MESSAGE_LOGID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_NNTPFORUM_NNTPFORUMID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_NNTPFORUM_NNTPFORUMID FOR objQual_NNTPFORUM
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.NNTPFORUMID IS NULL) THEN
  NEW.NNTPFORUMID = GEN_ID(SEQ_objQual_NNTPFORUM_NNTPFORUMID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_NNTPSE_NNTPSERVERID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_NNTPSE_NNTPSERVERID FOR objQual_NNTPSERVER
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.NNTPSERVERID IS NULL) THEN
  NEW.NNTPSERVERID = GEN_ID(SEQ_objQual_NNTPSERVER_NNTPSERVERID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_NNTPTOPIC_NNTPTOPICID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_NNTPTOPIC_NNTPTOPICID FOR objQual_NNTPTOPIC
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.NNTPTOPICID IS NULL) THEN
  NEW.NNTPTOPICID = GEN_ID(SEQ_objQual_NNTPTOPIC_NNTPTOPICID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_PMESSAGE_PMESSAGEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_PMESSAGE_PMESSAGEID FOR objQual_PMESSAGE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.PMESSAGEID IS NULL) THEN
  NEW.PMESSAGEID = GEN_ID(SEQ_objQual_PMESSAGE_PMESSAGEID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_POLLVOTE_POLLVOTEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_POLLVOTE_POLLVOTEID FOR objQual_POLLVOTE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.POLLVOTEID IS NULL) THEN
  NEW.POLLVOTEID = GEN_ID(SEQ_objQual_POLLVOTE_POLLVOTEID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_RANK_RANKID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_RANK_RANKID FOR objQual_RANK
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.RANKID IS NULL) THEN
  NEW.RANKID = GEN_ID(SEQ_objQual_RANK_RANKID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_REGISTRY_REGISTRYID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_REGISTRY_REGISTRYID FOR objQual_REGISTRY
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.REGISTRYID IS NULL) THEN
  NEW.REGISTRYID = GEN_ID(SEQ_objQual_REGISTRY_REGISTRYID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_REPLACE_WORDS_ID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_REPLACE_WORDS_ID FOR objQual_REPLACE_WORDS
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.ID IS NULL) THEN
  NEW.ID = GEN_ID(SEQ_objQual_REPLACE_WORDS_ID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_SMILEY_SMILEYID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_SMILEY_SMILEYID FOR objQual_SMILEY
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.SMILEYID IS NULL) THEN
  NEW.SMILEYID = GEN_ID(SEQ_objQual_SMILEY_SMILEYID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_USER_USERID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_USER_USERID FOR objQual_USER
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.USERID IS NULL) THEN
  NEW.USERID = GEN_ID(SEQ_objQual_USER_USERID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_USERPM_USERPMESSAGEID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_USERPM_USERPMESSAGEID FOR objQual_USERPMESSAGE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.USERPMESSAGEID IS NULL) THEN
  NEW.USERPMESSAGEID = GEN_ID(SEQ_objQual_USERPME_USERPMESSAGEID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_WATCHF_WATCHFORUMID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_WATCHF_WATCHFORUMID FOR objQual_WATCHFORUM
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.WATCHFORUMID IS NULL) THEN
  NEW.WATCHFORUMID = GEN_ID(SEQ_objQual_WATCHFORUM_WATCHFORUMID, 1);
END;';
END
--GO


EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_WATCHT_WATCHTOPICID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_WATCHT_WATCHTOPICID FOR objQual_WATCHTOPIC
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.WATCHTOPICID IS NULL) THEN
  NEW.WATCHTOPICID = GEN_ID(SEQ_objQual_WATCHTOPIC_WATCHTOPICID, 1);
END;';
END
--GO