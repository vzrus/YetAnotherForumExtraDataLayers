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

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY001')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_ACCESSMASK ADD CONSTRAINT PRIMARY001 PRIMARY KEY (ACCESSMASKID)';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY002')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_ACTIVE ADD CONSTRAINT PRIMARY002 PRIMARY KEY (SESSIONID,BOARDID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY003')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_ATTACHMENT ADD CONSTRAINT PRIMARY003 PRIMARY KEY (ATTACHMENTID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY004')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_BANNEDIP ADD CONSTRAINT PRIMARY004 UNIQUE (ID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY005')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_BBCODE ADD CONSTRAINT PRIMARY005 PRIMARY KEY (BBCODEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_BOARDID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_BOARD ADD CONSTRAINT PK_objQual_BOARDID PRIMARY KEY (BOARDID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY007')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_CATEGORY ADD CONSTRAINT PRIMARY007 UNIQUE (CATEGORYID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY008')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_CHECKEMAIL ADD CONSTRAINT PRIMARY008 UNIQUE (CHECKEMAILID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY009')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_CHOICE ADD CONSTRAINT PRIMARY009 PRIMARY KEY (CHOICEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY010')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_EVENTLOG ADD CONSTRAINT PRIMARY010 PRIMARY KEY (EVENTLOGID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY011')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_EXTENSION ADD CONSTRAINT PRIMARY011 PRIMARY KEY (EXTENSIONID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY012')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_FORUM ADD CONSTRAINT PRIMARY012 UNIQUE (FORUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY013')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_FORUMACCESS ADD CONSTRAINT PRIMARY013 PRIMARY KEY (GROUPID,FORUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY014')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_GROUP ADD CONSTRAINT PRIMARY014 UNIQUE (GROUPID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY015')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_MAIL ADD CONSTRAINT PRIMARY015 PRIMARY KEY (MAILID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY016')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_MEDAL ADD CONSTRAINT PRIMARY016 PRIMARY KEY (MEDALID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY017')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_MESSAGE ADD CONSTRAINT PRIMARY017 PRIMARY KEY (MESSAGEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY018')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_MESSAGEREPORTEDAUDIT ADD CONSTRAINT PRIMARY018 PRIMARY KEY (LOGID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY019')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_NNTPFORUM ADD CONSTRAINT PRIMARY019 PRIMARY KEY (NNTPFORUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY020')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_NNTPSERVER ADD CONSTRAINT PRIMARY020 PRIMARY KEY (NNTPSERVERID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY021')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_NNTPTOPIC ADD CONSTRAINT PRIMARY021 PRIMARY KEY (NNTPTOPICID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY022')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_PMESSAGE ADD CONSTRAINT PRIMARY022 PRIMARY KEY (PMESSAGEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY023')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_POLL ADD CONSTRAINT PRIMARY023 PRIMARY KEY (POLLID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY024')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_POLLVOTE ADD CONSTRAINT PRIMARY024 PRIMARY KEY (POLLVOTEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY029')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_RANK ADD CONSTRAINT PRIMARY029 UNIQUE (RANKID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY030')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_REGISTRY ADD CONSTRAINT PRIMARY030 PRIMARY KEY (REGISTRYID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY031')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_REPLACE_WORDS ADD CONSTRAINT PRIMARY031 PRIMARY KEY (ID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PK_objQual_SHOUTBOXMESSAGE
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_SHOUTBOXMESSAGE')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_SHOUTBOXMESSAGE ADD CONSTRAINT PK_objQual_SHOUTBOXMESSAGE PRIMARY KEY (SHOUTBOXMESSAGEID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY032')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_SMILEY ADD CONSTRAINT PRIMARY032 UNIQUE (SMILEYID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_TOPICSTATUSID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_TOPICSTATUS ADD CONSTRAINT PK_TOPICSTATUSID PRIMARY KEY (TOPICSTATUSID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY033')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_TOPIC ADD CONSTRAINT PRIMARY033 PRIMARY KEY (TOPICID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY034')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USER ADD CONSTRAINT PRIMARY034 UNIQUE (USERID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY035')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USERFORUM ADD CONSTRAINT PRIMARY035 PRIMARY KEY (USERID,FORUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY036')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USERGROUP ADD CONSTRAINT PRIMARY036 PRIMARY KEY (USERID,GROUPID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY037')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USERPMESSAGE ADD CONSTRAINT PRIMARY037 PRIMARY KEY (USERPMESSAGEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY038')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_WATCHFORUM ADD CONSTRAINT PRIMARY038 UNIQUE (WATCHFORUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY039')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_WATCHTOPIC ADD CONSTRAINT PRIMARY039 UNIQUE (WATCHTOPICID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_IGNOREUSER_USERID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_IGNOREUSER ADD CONSTRAINT PK_objQual_IGNOREUSER_USERID PRIMARY KEY (USERID, IGNOREDUSERID);';
END
--GO


EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_THANKS_THANKSID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_THANKS ADD CONSTRAINT PK_objQual_THANKS_THANKSID PRIMARY KEY (THANKSID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_BUDDY_BUDDYID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_BUDDY ADD CONSTRAINT PK_objQual_BUDDY_BUDDYID PRIMARY KEY (ID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_FAVORITETOPIC_ID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_FAVORITETOPIC ADD CONSTRAINT PK_objQual_FAVORITETOPIC_ID PRIMARY KEY (ID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_USERALBUM_ALBUMID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USERALBUM ADD CONSTRAINT PK_objQual_USERALBUM_ALBUMID PRIMARY KEY (ALBUMID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_USRALBIMG_IMAGEID')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USERALBUMIMAGE ADD CONSTRAINT PK_objQual_USRALBIMG_IMAGEID PRIMARY KEY (IMAGEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT FIRST 1 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_POLLGROUPCLUSTER')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_POLLGROUPCLUSTER ADD CONSTRAINT PK_objQual_POLLGROUPCLUSTER PRIMARY KEY (POLLGROUPID);';
END
--GO



