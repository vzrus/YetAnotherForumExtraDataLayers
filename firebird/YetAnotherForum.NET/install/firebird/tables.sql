
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
-- Source table: objQual_ACCESSMASK
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_ACCESSMASK')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_ACCESSMASK (
  ACCESSMASKID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  SORTORDER INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_ACTIVE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_ACTIVE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_ACTIVE (
  SESSIONID VARCHAR(36) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER DEFAULT 0 NOT NULL,
  IP VARCHAR(39) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  LOGIN TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  LASTACTIVE TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  LOCATION VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  FORUMID INTEGER,
  TOPICID INTEGER,
  BROWSER VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  PLATFORM VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
  FORUMPAGE VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  FLAGS INTEGER NOT NULL, 
  ISACTIVE INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 1))),
  ISGUEST INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 2))),
  ISREGISTERED INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 4))),
  ISCRAWLER INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 8))));';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_ACTIVEACCESS
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_ACTIVEACCESS')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_ACTIVEACCESS (
                   UserID			    INTEGER NOT NULL ,
		           BoardID			    INTEGER NOT NULL ,			
		           ForumID			    INTEGER,
		           IsAdmin				INTEGER DEFAULT 0 NOT NULL,
		           IsForumModerator	    INTEGER DEFAULT 0 NOT NULL,
		           IsModerator			INTEGER DEFAULT 0 NOT NULL,
		           IsGuestX			    INTEGER DEFAULT 0 NOT NULL,
		           LastActive			TIMESTAMP,
	               ReadAccess			INTEGER NOT NULL ,
	               PostAccess			INTEGER NOT NULL ,
		           ReplyAccess			INTEGER NOT NULL,
		           PriorityAccess		INTEGER NOT NULL,
		           PollAccess			INTEGER NOT NULL,
		           VoteAccess			INTEGER NOT NULL,
		           ModeratorAccess		INTEGER NOT NULL,
		           EditAccess			INTEGER NOT NULL,
		           DeleteAccess		    INTEGER NOT NULL,
		           UploadAccess		    INTEGER NOT NULL,		
		           DownloadAccess		INTEGER NOT NULL
				   );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_ATTACHMENT
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_ATTACHMENT')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_ATTACHMENT (
  ATTACHMENTID INTEGER DEFAULT 0 NOT NULL,
  MESSAGEID INTEGER DEFAULT 0 NOT NULL,
  FILENAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  BYTES INTEGER DEFAULT 0 NOT NULL,
  FILEID INTEGER,
  CONTENTTYPE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  DOWNLOADS INTEGER DEFAULT 0 NOT NULL,
  FILEDATA BLOB SUB_TYPE 0 SEGMENT SIZE 80);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_BANNEDIP
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_BANNEDIP')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_BANNEDIP (
  ID INTEGER DEFAULT 0,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  MASK VARCHAR(57) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  SINCE TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  REASON  VARCHAR(128) CHARACTER SET  UTF8 COLLATE UNICODE ,
  USERID	INTEGER);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_BBCODE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_BBCODE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_BBCODE (
  BBCODEID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  DESCRIPTION BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE ,
  ONCLICKJS BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE ,
  DISPLAYJS BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE,
  EDITJS BLOB SUB_TYPE 1 SEGMENT SIZE 20 CHARACTER SET UTF8 COLLATE UNICODE,
  DISPLAYCSS BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE,
  SEARCHREGEX BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE,
  REPLACEREGEX BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE,
  VARIABLES BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE ,
  USEMODULE BOOL,
  MODULECLASS VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  EXECORDER INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_BOARD
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_BOARD')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_BOARD (
  BOARDID                 INTEGER DEFAULT 0 NOT NULL,
  NAME                    VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  ALLOWTHREADED           BOOL DEFAULT 0 NOT NULL,
  MEMBERSHIPAPPNAME       VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  ROLESAPPNAME            VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_CATEGORY
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_CATEGORY')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_CATEGORY (
  CATEGORYID INTEGER DEFAULT 0,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  CATEGORYIMAGE VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  SORTORDER INT DEFAULT 0 NOT NULL,
  POLLGROUPID INTEGER);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_CHECKEMAIL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_CHECKEMAIL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_CHECKEMAIL (
  CHECKEMAILID INTEGER DEFAULT 0,
  USERID INTEGER DEFAULT 0 NOT NULL,
  "EMAIL" VARCHAR(128) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE ,
  CREATED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  "HASH" VARCHAR(32) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_CHOICE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_CHOICE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_CHOICE (
  CHOICEID INTEGER DEFAULT 0 NOT NULL,
  POLLID INTEGER DEFAULT 0 NOT NULL,
  CHOICE VARCHAR(255) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE,
  VOTES INTEGER DEFAULT 0 NOT NULL,
  OBJECTPATH  VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  MIMETYPE  VARCHAR(50) CHARACTER SET UTF8 COLLATE UNICODE
	);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_EVENTLOG
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_EVENTLOG')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_EVENTLOG (
  EVENTLOGID INTEGER DEFAULT 0 NOT NULL,
  EVENTTIME TIMESTAMP DEFAULT current_timestamp,
  USERID INTEGER,
  SOURCE VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  DESCRIPTION BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL,
  "TYPE" INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_EXTENSION
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_EXTENSION')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_EXTENSION (
  EXTENSIONID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 1 NOT NULL,
  EXTENSION VARCHAR(10) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_FORUM
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_FORUM')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_FORUM 
(
  FORUMID                   INTEGER DEFAULT 0,
  CATEGORYID                INTEGER DEFAULT 0 NOT NULL,
  PARENTID                  INTEGER DEFAULT NULL,
  NAME                      VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE , 
  DESCRIPTION               VARCHAR(255) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE,
  IMAGEURL                  VARCHAR(128) CHARACTER SET   UTF8 COLLATE UNICODE ,
  STYLES                    VARCHAR(255) CHARACTER SET   UTF8 COLLATE UNICODE ,
  SORTORDER                 INTEGER DEFAULT 0 NOT NULL,
  LASTPOSTED                TIMESTAMP,
  LASTTOPICID               INTEGER,
  LASTMESSAGEID             INTEGER,
  LASTUSERID                INTEGER,
  LASTUSERNAME              VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  NUMTOPICS                 INTEGER DEFAULT 0 NOT NULL,
  NUMPOSTS                  INTEGER DEFAULT 0 NOT NULL,
  REMOTEURL                 VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
  FLAGS                     INTEGER DEFAULT 0 NOT NULL,
  THEMEURL                  VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
  POLLGROUPID               INTEGER,
  USERID                    INTEGER,
  ISLOCKED  	            INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 1))),
  ISHIDDEN                  INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 2))),
  ISNOCOUNT	                INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 4))),
  ISMODERATED               INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 8)))
);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_FORUMACCESS
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_FORUMACCESS')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_FORUMACCESS (
  GROUPID INTEGER DEFAULT 0 NOT NULL,
  FORUMID INTEGER DEFAULT 0 NOT NULL,
  ACCESSMASKID INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_GROUP
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_GROUP')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_GROUP (
  GROUPID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(255) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE ,
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  PMLIMIT INTEGER DEFAULT 0 NOT NULL,
  STYLE VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  SORTORDER INTEGER DEFAULT 0 NOT NULL,
  DESCRIPTION  VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
  USRSIGCHARS  INTEGER DEFAULT 0 NOT NULL,
  USRSIGBBCODES  VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  USRSIGHTMLTAGS  VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  USRALBUMS  INTEGER DEFAULT 0 NOT NULL,
  USRALBUMIMAGES  INTEGER DEFAULT 0 NOT NULL
  ) ;';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_GROUPMEDAL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_GROUPMEDAL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_GROUPMEDAL (
  GROUPID INTEGER DEFAULT 0 NOT NULL,
  MEDALID INTEGER DEFAULT 0 NOT NULL,
  MESSAGE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  HIDE BOOL DEFAULT 0 NOT NULL,
  ONLYRIBBON BOOL DEFAULT 0 NOT NULL,
  SORTORDER INT DEFAULT 255 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_MAIL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MAIL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MAIL (
  MAILID INTEGER DEFAULT 0 NOT NULL,
  FROMUSER VARCHAR(128) CHARACTER SET  UTF8 NOT NULL COLLATE UNICODE ,
  FROMUSERNAME VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  TOUSER VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  TOUSERNAME VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  CREATED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  SUBJECT VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  BODY BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL,
  BODYHTML BLOB SUB_TYPE 1 SEGMENT SIZE 80,
  SENDTRIES INTEGER DEFAULT 0 NOT NULL,
  SENDATTEMPT TIMESTAMP,
  PROCESSID INTEGER);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_MEDAL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MEDAL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MEDAL (
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  MEDALID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  DESCRIPTION BLOB SUB_TYPE 1 SEGMENT SIZE 80 NOT NULL,
  MESSAGE VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  CATEGORY VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  MEDALURL VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  RIBBONURL VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  SMALLMEDALURL VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  SMALLRIBBONURL VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  SMALLMEDALWIDTH integer DEFAULT 0 NOT NULL,
  SMALLMEDALHEIGHT integer DEFAULT 0 NOT NULL,
  SMALLRIBBONWIDTH integer,
  SMALLRIBBONHEIGHT integer,
  SORTORDER integer DEFAULT 255 NOT NULL,
  FLAGS integer DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_MESSAGE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MESSAGE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MESSAGE (
  MESSAGEID              INTEGER DEFAULT 0 NOT NULL,
  TOPICID                INTEGER DEFAULT 0 NOT NULL,
  REPLYTO                INTEGER,
  "POSITION"             INTEGER DEFAULT 0 NOT NULL,
  INDENT                 INTEGER DEFAULT 0 NOT NULL,
  USERID                 INTEGER DEFAULT 0 NOT NULL,
  USERNAME               VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  POSTED                 TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  MESSAGE                BLOB SUB_TYPE 1 NOT NULL,  
  IP                     VARCHAR(39),
  EDITED                 TIMESTAMP,
  FLAGS                  INTEGER DEFAULT 23 NOT NULL,   
  EDITREASON             VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,  
  DELETEREASON           VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,  
  ISMODERATORCHANGED     BOOL DEFAULT 0, 
  BLOGPOSTID             VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE, 
  EXTERNALMESSAGEID      VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  REFERENCEMESSAGEID     VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  EDITEDBY               INTEGER ,
  ISDELETED	             SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 8)))	,
  ISAPPROVED             INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 16)))  
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_MESSAGEREPORTED
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MESSAGEREPORTED')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MESSAGEREPORTED (
  MESSAGEID INTEGER DEFAULT 0 NOT NULL,
  MESSAGE BLOB SUB_TYPE 1 SEGMENT SIZE 80,
  RESOLVED BOOL,
  RESOLVEDBY INTEGER,
  RESOLVEDDATE TIMESTAMP);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_MESSAGEREPORTEDAUDIT
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MESSAGEREPORTEDAUDIT')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MESSAGEREPORTEDAUDIT (
  LOGID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER,
  MESSAGEID INTEGER,
  REPORTED TIMESTAMP,
  REPORTEDNUMBER INTEGER  DEFAULT 1 NOT NULL,
  REPORTTEXT VARCHAR(4000));';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_NNTPFORUM
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_NNTPFORUM')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_NNTPFORUM (
  NNTPFORUMID INTEGER DEFAULT 0 NOT NULL,
  NNTPSERVERID INTEGER DEFAULT 0 NOT NULL,
  GROUPNAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  FORUMID INTEGER DEFAULT 0 NOT NULL,
  LASTMESSAGENO INTEGER DEFAULT 0 NOT NULL,
  LASTUPDATE TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  "ACTIVE" BOOL DEFAULT 0 NOT NULL,
  DATECUTOFF TIMESTAMP);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_NNTPSERVER
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_NNTPSERVER')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_NNTPSERVER (
  NNTPSERVERID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  ADDRESS VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  "PORT" INTEGER,
  USERNAME VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  USERPASS VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_NNTPTOPIC
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_NNTPTOPIC')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_NNTPTOPIC (
  NNTPTOPICID INTEGER DEFAULT 0 NOT NULL,
  NNTPFORUMID INTEGER DEFAULT 0 NOT NULL,
  "THREAD" VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  TOPICID INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_PMESSAGE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_PMESSAGE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_PMESSAGE (
  PMESSAGEID INTEGER DEFAULT 0 NOT NULL,
  FROMUSERID INTEGER DEFAULT 0 NOT NULL,
  CREATED TIMESTAMP DEFAULT ''current_timestamp''NOT NULL,
  SUBJECT VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  BODY BLOB SUB_TYPE 1 SEGMENT SIZE 80,
  FLAGS INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_PMESSAGE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_POLLGROUPCLUSTER')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_POLLGROUPCLUSTER (
  POLLGROUPID INTEGER NOT NULL,
  USERID INTEGER NOT NULL,
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  ISBOUND INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 2)))
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_POLL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_POLL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_POLL
 (
  POLLID               INTEGER DEFAULT 0 NOT NULL,
  QUESTION             VARCHAR(128) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE,
  CLOSES               TIMESTAMP,
  POLLGROUPID          INTEGER,
  USERID               INTEGER NOT NULL,	
  OBJECTPATH           VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  MIMETYPE             VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  FLAGS                INTEGER DEFAULT 0 NOT NULL,		
  ISCLOSEDBOUND	       INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 4))),
  ALLOWMULTIPLECHOICES INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 8))),
  SHOWVOTERS	       INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 16))),
  ALLOWSKIPVOTE        INTEGER COMPUTED BY (SIGN(BIN_AND(FLAGS, 32)))
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_POLLVOTEREFUSE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_POLLVOTEREFUSE
 (
  REFUSEID             INTEGER NOT NULL,
  POLLID               INTEGER, 
  USERID               INTEGER,	
  REMOTEIP             VARCHAR(57) CHARACTER SET UTF8 COLLATE UNICODE
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_POLLVOTE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_POLLVOTE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_POLLVOTE (
  POLLVOTEID INTEGER DEFAULT 0 NOT NULL,
  POLLID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER,
  REMOTEIP VARCHAR(39) CHARACTER SET UTF8 COLLATE UNICODE,
  CHOICEID INTEGER);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_RANK
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_RANK')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_RANK (
  RANKID INTEGER DEFAULT 0,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  MINPOSTS INTEGER,
  RANKIMAGE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  PMLIMIT INTEGER DEFAULT 0 NOT NULL,
  STYLE VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  SORTORDER INTEGER DEFAULT 0 NOT NULL,
  DESCRIPTION  VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
  USRSIGCHARS  INTEGER DEFAULT 0 NOT NULL,
  USRSIGBBCODES  VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  USRSIGHTMLTAGS  VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  USRALBUMS  INTEGER DEFAULT 0 NOT NULL,
  USRALBUMIMAGES  INTEGER DEFAULT 0 NOT NULL
  ) ;';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_REGISTRY
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_REGISTRY')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_REGISTRY (
  REGISTRYID INTEGER DEFAULT 0 NOT NULL,
  NAME VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  "VALUE" BLOB SUB_TYPE 1 SEGMENT SIZE 80,
  BOARDID INTEGER);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_REPLACE_WORDS
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_REPLACE_WORDS')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_REPLACE_WORDS (
  ID INTEGER DEFAULT 0 NOT NULL,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  BADWORD VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  GOODWORD VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_SHOUTBOXMESSAGE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_SHOUTBOXMESSAGE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_SHOUTBOXMESSAGE (
  SHOUTBOXMESSAGEID INTEGER NOT NULL,
  BOARDID INTEGER,
  GROUPID INTEGER,
  USERID INTEGER,
  USERNAME VARCHAR(128) NOT NULL,
  "MESSAGE" BLOB SUB_TYPE 1 SEGMENT SIZE 80,
  "DATE" TIMESTAMP DEFAULT current_timestamp NOT NULL,
  IP VARCHAR(39) NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_SMILEY
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_SMILEY')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_SMILEY (
  SMILEYID INTEGER DEFAULT 0,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  "CODE" VARCHAR(10) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  ICON VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  EMOTICON VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  SORTORDER INT DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_TOPIC
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TOPIC')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_TOPIC (
  TOPICID          INTEGER DEFAULT 0 NOT NULL,
  FORUMID          INTEGER DEFAULT 0 NOT NULL,
  USERID           INTEGER DEFAULT 0 NOT NULL,
  USERNAME         VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE, 
  POSTED           TIMESTAMP  DEFAULT current_timestamp NOT NULL,
  TOPIC            VARCHAR(255) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE,
  STATUS     	   VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE,
  DESCRIPTION	   VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  VIEWS            INTEGER DEFAULT 0 NOT NULL,
  "PRIORITY"       INTEGER DEFAULT 0 NOT NULL,
  POLLID           INTEGER,
  TOPICMOVEDID     INTEGER,
  LASTPOSTED       TIMESTAMP,
  LASTMESSAGEID    INTEGER,
  LASTUSERID       INTEGER,
  LASTUSERNAME     VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  NUMPOSTS         INTEGER DEFAULT 0 NOT NULL,
  FLAGS            INTEGER DEFAULT 0 NOT NULL,
  ISDELETED        SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 8))),
  ISQUESTION       SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 1024))), 
  ANSWERMESSAGEID  INTEGER,
  LASTMESSAGEFLAGS INTEGER,
  TOPICIMAGE       VARCHAR(255),
  STYLES    	   VARCHAR(255));';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_USER
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USER')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USER (
  USERID INTEGER DEFAULT 0,
  BOARDID INTEGER DEFAULT 0 NOT NULL,
  PROVIDERUSERKEY CHAR(16) CHARACTER SET OCTETS,
  NAME VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  DISPLAYNAME VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,		
  "PASSWORD" VARCHAR(32) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,
  "EMAIL" VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  JOINED TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  LASTVISIT TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  IP VARCHAR(39) CHARACTER SET UTF8 COLLATE UNICODE ,
  NUMPOSTS INTEGER DEFAULT 0 NOT NULL,
  TIMEZONE INTEGER DEFAULT 0 NOT NULL,
  AVATAR VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  SIGNATURE BLOB SUB_TYPE 1 SEGMENT SIZE 80 ,
  AVATARIMAGE BLOB SUB_TYPE 0,
  AVATARIMAGETYPE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  RANKID INTEGER NOT NULL,
  SUSPENDED TIMESTAMP,
  LANGUAGEFILE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  THEMEFILE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  USESINGLESIGNON INTEGER DEFAULT 0 NOT NULL,
  TEXTEDITOR VARCHAR(50) CHARACTER SET UTF8 COLLATE UNICODE ,
  OVERRIDEDEFAULTTHEMES BOOL DEFAULT 0 NOT NULL,
  PMNOTIFICATION BOOL DEFAULT 1 NOT NULL,
  NOTIFICATIONTYPE INTEGER DEFAULT 10 NOT NULL,	
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  POINTS INTEGER DEFAULT 0 NOT NULL,
  ISAPPROVED 	SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 2))),
  ISGUEST SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 4))),
  ISCAPTCHAEXCLUDED SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 8))),
  ISACTIVEEXCLUDED SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 16))), 
  ISDST  SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 32))),
  ISDIRTY SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 64))),
  AUTOWATCHTOPICS BOOL DEFAULT 0 NOT NULL,
  CULTURE VARCHAR(10),
  DAILYDIGEST BOOL DEFAULT 0 NOT NULL,
  ISFACEBOOKUSER BOOL DEFAULT 0 NOT NULL,
  ISTWITTERUSER BOOL DEFAULT 0 NOT NULL
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_USERFORUM
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERFORUM')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERFORUM (
  USERID INTEGER DEFAULT 0 NOT NULL,
  FORUMID INTEGER DEFAULT 0 NOT NULL,
  ACCESSMASKID INTEGER DEFAULT 0 NOT NULL,
  INVITED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  ACCEPTED BOOL DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_USERGROUP
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERGROUP')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERGROUP (
  USERID INTEGER DEFAULT 0 NOT NULL,
  GROUPID INTEGER DEFAULT 0 NOT NULL);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_USERMEDAL
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERMEDAL')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERMEDAL (
  USERID INTEGER DEFAULT 0 NOT NULL,
  MEDALID INTEGER DEFAULT 0 NOT NULL,
  MESSAGE VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE ,
  HIDE BOOL DEFAULT 0 NOT NULL,
  ONLYRIBBON BOOL DEFAULT 0 NOT NULL,
  SORTORDER INT DEFAULT 255 NOT NULL,
  DATEAWARDED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL);';
 END
--GO

EXECUTE BLOCK
AS
BEGIN  
-- Source table: objQual_IGNOREUSER
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_IGNOREUSER')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_IGNOREUSER
	(
		USERID INTEGER NOT NULL,
		IGNOREDUSERID INTEGER NOT NULL
	);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 	
-- Source table: objQual_USERPMESSAGE
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERPMESSAGE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERPMESSAGE (
  USERPMESSAGEID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER DEFAULT 0 NOT NULL,
  PMESSAGEID INTEGER DEFAULT 0 NOT NULL,
  FLAGS INTEGER DEFAULT 0 NOT NULL,
  ISREAD		SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 1))),
  ISINOUTBOX	SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 2))),
  ISARCHIVED	SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 4))),
  ISDELETED	SMALLINT COMPUTED BY (SIGN(BIN_AND(FLAGS, 8)))
  );';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_WATCHFORUM
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_WATCHFORUM')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_WATCHFORUM (
  WATCHFORUMID INTEGER DEFAULT 0,
  FORUMID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER DEFAULT 0 NOT NULL,
  CREATED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  LASTMAIL TIMESTAMP);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source table: objQual_WATCHTOPIC
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_WATCHTOPIC')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_WATCHTOPIC (
  WATCHTOPICID INTEGER DEFAULT 0,
  TOPICID INTEGER DEFAULT 0 NOT NULL,
  USERID INTEGER DEFAULT 0 NOT NULL,
  CREATED TIMESTAMP DEFAULT ''current_timestamp'' NOT NULL,
  LASTMAIL TIMESTAMP);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TMP_FLR')) THEN
EXECUTE STATEMENT 'DROP TABLE objQual_TMP_FLR;';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TMP_FLR')) THEN
EXECUTE STATEMENT 'CREATE GLOBAL TEMPORARY TABLE objQual_TMP_FLR(
 CATEGORYID INTEGER,
 CATEGORY VARCHAR(128),
 FORUMID INTEGER, 
 FORUM VARCHAR(128),
 DESCRIPTION VARCHAR(128), 
 IMAGEURL VARCHAR(128),
 STYLES VARCHAR(255),
 POLLGROUPID INTEGER,
 TOPICS INTEGER, 
 POSTS INTEGER, 
 SUBFORUMS INTEGER, 
 FLAGS INTEGER, 
 VIEWING INTEGER,
 REMOTEURL VARCHAR(255), 
 READACCESS INTEGER, 
 LASTTOPICID INTEGER,
 LASTPOSTED TIMESTAMP) ON COMMIT DELETE ROWS';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_THANKS')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_THANKS(
  THANKSID         INTEGER NOT NULL, 
  THANKSFROMUSERID INTEGER NOT NULL, 
  THANKSTOUSERID   INTEGER NOT NULL,
  MESSAGEID        INTEGER NOT NULL,
 THANKSDATE        TIMESTAMP NOT NULL);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_BUDDY')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_BUDDY(
	ID              INTEGER NOT NULL,
	FROMUSERID      INTEGER NOT NULL,
	TOUSERID        INTEGER NOT NULL,
	APPROVED        SMALLINT NOT NULL,
	REQUESTED       TIMESTAMP  NOT NULL
	);';
  END
--GO


/* YAF FavoriteTopic Table */

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_FAVORITETOPIC')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_FAVORITETOPIC(
	ID INTEGER NOT NULL,
	USERID INTEGER NOT NULL,
	TOPICID INTEGER NOT NULL
	);';
  END
--GO

/* YAF Album Tables */
EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERALBUM')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERALBUM(
	ALBUMID INTEGER NOT NULL,
	USERID INTEGER NOT NULL,
	TITLE VARCHAR(255),
	COVERIMAGEID INTEGER,
	UPDATED TIMESTAMP  NOT NULL
	);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERALBUMIMAGE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERALBUMIMAGE(
	IMAGEID INTEGER NOT NULL,
	ALBUMID INTEGER NOT NULL,
	CAPTION VARCHAR(255),	
	FILENAME VARCHAR(255) NOT NULL,	
	BYTES INTEGER NOT NULL,
	CONTENTTYPE VARCHAR(50),
	UPLOADED TIMESTAMP  NOT NULL,
	DOWNLOADS INTEGER NOT NULL
	);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_MESSAGEHISTORY')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_MESSAGEHISTORY(		
		MESSAGEID INTEGER DEFAULT 0 NOT NULL,
		MESSAGE BLOB SUB_TYPE 1 NOT NULL,
		IP VARCHAR(39) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE,
		EDITED TIMESTAMP,
		EDITEDBY INTEGER,	
		EDITREASON VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
		ISMODERATORCHANGED BOOL DEFAULT 0,
		FLAGS INTEGER DEFAULT 23 NOT NULL
	);';
  END

--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TOPICREADTRACKING')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_TOPICREADTRACKING(
		USERID INTEGER DEFAULT 0 NOT NULL,
		TOPICID INTEGER DEFAULT 0 NOT NULL,	
		LASTACCESSDATE TIMESTAMP  NOT NULL
	);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_FORUMREADTRACKING')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_FORUMREADTRACKING(
		USERID INTEGER DEFAULT 0 NOT NULL,
		FORUMID INTEGER DEFAULT 0 NOT NULL,	
		LASTACCESSDATE TIMESTAMP  NOT NULL
	);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_USERPROFILE')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_USERPROFILE(
		USERID INTEGER NOT NULL,
		LASTUPDATEDDATE TIMESTAMP NOT NULL,		
		LASTACTIVITY TIMESTAMP,
		APPLICATIONNAME VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE ,	
		ISANONYMOUS BOOL DEFAULT 0 NOT NULL,
		USERNAME VARCHAR(255) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE
	);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TOPICSTATUS')) THEN
EXECUTE STATEMENT 'CREATE TABLE objQual_TOPICSTATUS(
	    TOPICSTATUSID INTEGER NOT NULL,
		TOPICSTATUSNAME VARCHAR(128) CHARACTER SET  UTF8 NOT NULL COLLATE UNICODE ,
		BOARDID INTEGER NOT NULL,
		DEFAULTDESCRIPTION VARCHAR(128) CHARACTER SET UTF8 NOT NULL COLLATE UNICODE
	);';
  END
--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TBL')) THEN
EXECUTE STATEMENT 'CREATE global TEMPORARY TABLE objQual_TBL (
  FORUMID INTEGER, PARENTID INTEGER
);';
  END

--GO

EXECUTE BLOCK
AS
BEGIN 
IF (NOT EXISTS( SELECT FIRST 1 1 FROM 
 RDB$RELATIONS a WHERE a.RDB$RELATION_NAME='objQual_TBL1')) THEN
EXECUTE STATEMENT 'CREATE global TEMPORARY TABLE objQual_TBL1 (
  FORUMID INTEGER, PARENTID INTEGER
);';
  END
--GO

