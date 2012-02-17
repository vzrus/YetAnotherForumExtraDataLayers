/* Yet Another Forum.NET MySQL data layer by vzrus
  Copyright (C) 2006-2012 Vladimir Zakharov
  https://github.com/vzrus
  http://sourceforge.net/projects/yaf-datalayers/
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation; version 2 only
  General class structure is based on MS SQL Server code,
 created by YAF developers
 
  http://www.yetanotherforum.net/
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU General Public License
  as published by the Free Software Foundation;version 2 only
  of the License.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 CREATE PROCEDURE objQual_vaccess_UL(I_USERID INTEGER, I_FORUMID INTEGER)
RETURNS
(
USERID INTEGER,FORUMID INTEGER,ISADMIN INTEGER,ISGUEST INTEGER,ISFORUMMODERATOR INTEGER,
ISMODERATOR INTEGER,READACCESS INTEGER,
POSTACCESS INTEGER,REPLYACCESS INTEGER,
PRIORITYACCESS INTEGER,POLLACCESS INTEGER,
VOTEACCESS INTEGER,MODERATORACCESS INTEGER,
EDITACCESS INTEGER,DELETEACCESS INTEGER,
UPLOADACCESS INTEGER,DOWNLOADACCESS INTEGER
)
AS
DECLARE ICI_USERID INTEGER;
DECLARE ici_ForumID INTEGER;
DECLARE ici_IsAdmin INTEGER  DEFAULT 0;
DECLARE ici_IsGuest INTEGER  DEFAULT 0;
DECLARE ici_IsForumModerator INTEGER  DEFAULT 0;
DECLARE ici_IsModerator INTEGER DEFAULT 0;
DECLARE ici_ReadAccess  INTEGER DEFAULT 0;
DECLARE ici_PostAccess INTEGER DEFAULT 0;
DECLARE ici_ReplyAccess INTEGER DEFAULT 0;
DECLARE ici_PriorityAccess INTEGER DEFAULT 0;
DECLARE ici_PollAccess INTEGER DEFAULT 0;
DECLARE ici_VoteAccess INTEGER DEFAULT 0;
DECLARE ici_ModeratorAccess INTEGER DEFAULT 0;
DECLARE ici_EditAccess INTEGER DEFAULT 0;
DECLARE ici_DeleteAccess INTEGER DEFAULT 0;
DECLARE ici_UploadAccess INTEGER DEFAULT 0;
DECLARE ici_DownloadAccess INTEGER DEFAULT 0;

DECLARE out_UserID INTEGER;
DECLARE out_ForumID INTEGER;
DECLARE out_IsAdmin INTEGER DEFAULT 0;
DECLARE out_IsGuest INTEGER DEFAULT 0;
DECLARE out_IsForumModerator INTEGER DEFAULT 0;
DECLARE out_IsModerator INTEGER DEFAULT 0;
DECLARE out_ReadAccess INTEGER DEFAULT 0;
DECLARE out_PostAccess INTEGER DEFAULT 0;
DECLARE out_ReplyAccess INTEGER DEFAULT 0;
DECLARE out_PriorityAccess INTEGER DEFAULT 0;
DECLARE out_PollAccess INTEGER DEFAULT 0;
DECLARE out_VoteAccess INTEGER DEFAULT 0;
DECLARE out_ModeratorAccess INTEGER DEFAULT 0;
DECLARE out_EditAccess INTEGER DEFAULT 0;
DECLARE out_DeleteAccess INTEGER DEFAULT 0;
DECLARE out_UploadAccess INTEGER DEFAULT 0;
DECLARE out_DownloadAccess INTEGER DEFAULT 0;
BEGIN


SELECT FIRST 1
COALESCE(USERID, :I_USERID),COALESCE(FORUMID,0),COALESCE(READACCESS,0), COALESCE(POSTACCESS,0),COALESCE(REPLYACCESS,0),COALESCE(PRIORITYACCESS,0),
COALESCE(POLLACCESS,0),COALESCE(VOTEACCESS,0),COALESCE(MODERATORACCESS,0),COALESCE(EDITACCESS,0),
DELETEACCESS,UPLOADACCESS,DOWNLOADACCESS
FROM
 objQual_VACCESSFULL1  
 WHERE USERID=:I_USERID AND FORUMID = COALESCE(:I_FORUMID,0)
 INTO
:ICI_USERID,:ici_ForumID,
:ici_ReadAccess,:ici_PostAccess,:ici_ReplyAccess,:ici_PriorityAccess,
:ici_PollAccess,:ici_VoteAccess,:ici_ModeratorAccess, :ici_EditAccess,
:ici_DeleteAccess,:ici_UploadAccess, :ici_DownloadAccess; 
 
 SELECT FIRST 1 
COALESCE(USERID,:I_USERID),COALESCE(FORUMID,0),COALESCE(READACCESS,0), COALESCE(POSTACCESS,0),COALESCE(REPLYACCESS,0),COALESCE(PRIORITYACCESS,0),
COALESCE(POLLACCESS,0),COALESCE(VOTEACCESS,0),COALESCE(MODERATORACCESS,0),COALESCE(EDITACCESS,0),
COALESCE(DELETEACCESS,0),COALESCE(UPLOADACCESS,0),COALESCE(DOWNLOADACCESS,0)
FROM
 objQual_VACCESSFULL2  
 WHERE USERID=:I_USERID AND FORUMID = COALESCE(:I_FORUMID,0)
 INTO 
:out_UserID,:out_ForumID,
:out_ReadAccess,:out_PostAccess,:out_ReplyAccess,:out_PriorityAccess,
:out_PollAccess,:out_VoteAccess,:out_ModeratorAccess, :out_EditAccess,
:out_DeleteAccess,:out_UploadAccess, :out_DownloadAccess;
  
 SELECT         
	  MAX(BIN_AND(b.FLAGS, 1)),
	  MAX(BIN_AND(b.FLAGS, 2)),
	  MAX(BIN_AND(b.FLAGS, 8))      
	  FROM objQual_USERGROUP a             
		   JOIN objQual_GROUP b
			 ON b.GROUPID = a.GROUPID
			 WHERE a.USERID=:I_USERID
			  INTO  :out_IsAdmin, :out_IsGuest, :out_IsForumModerator ;
 
SELECT
(SELECT :I_USERID FROM RDB$DATABASE) AS "UserID",
(SELECT COALESCE(:I_FORUMID,0) FROM RDB$DATABASE) AS "ForumID",
(SELECT :out_IsAdmin  FROM RDB$DATABASE) AS ISADMIN,
(SELECT :out_IsGuest  FROM RDB$DATABASE)  AS ISGUEST,
(SELECT :out_IsForumModerator  FROM RDB$DATABASE)  AS "IsForumModerator",
(SELECT     COUNT(v.USERID) 
FROM          objQual_USERGROUP AS v
INNER JOIN    objQual_GROUP AS w
ON v.GROUPID = w.GROUPID
CROSS JOIN  objQual_FORUMACCESS AS x
CROSS JOIN  objQual_ACCESSMASK AS y
WHERE (v.USERID = :I_USERID)
AND (x.GROUPID = w.GROUPID)
AND (y.ACCESSMASKID = x.ACCESSMASKID)
AND (BIN_AND(y.FLAGS, 64) <> 0)) AS ISMODERATOR,
(SELECT MAXVALUE(:ici_ReadAccess,:out_ReadAccess)  FROM RDB$DATABASE) AS READACCESS,
(SELECT MAXVALUE(:ici_PostAccess,:out_PostAccess)  FROM RDB$DATABASE) AS POSTACCESS,
(SELECT MAXVALUE(:ici_ReplyAccess,:out_ReplyAccess)  FROM RDB$DATABASE) AS REPLYACCESS,
(SELECT MAXVALUE(:ici_PriorityAccess,:out_PriorityAccess) FROM RDB$DATABASE)  AS PRIORITYACCESS,
(SELECT MAXVALUE(:ici_PollAccess,:out_PollAccess)  FROM RDB$DATABASE) AS POLLACCESS,
(SELECT MAXVALUE(:ici_VoteAccess,:out_VoteAccess)  FROM RDB$DATABASE) AS VOTEACCESS,
(SELECT MAXVALUE(:ici_ModeratorAccess,:out_ModeratorAccess) FROM RDB$DATABASE)  AS MODERATORACCESS,
(SELECT MAXVALUE(:ici_EditAccess,:out_EditAccess)  FROM RDB$DATABASE) AS EDITACCESS,
(SELECT MAXVALUE(:ici_DeleteAccess,:out_DeleteAccess) FROM RDB$DATABASE)  AS DELETEACCESS,
(SELECT MAXVALUE(:ici_UploadAccess,:out_UploadAccess)  FROM RDB$DATABASE) AS UPLOADACCESS,
(SELECT MAXVALUE(:ici_DownloadAccess,:out_DownloadAccess) FROM RDB$DATABASE) AS DOWNLOADACCESS FROM RDB$DATABASE
INTO
:"UserID",:"ForumID",:"IsAdmin",:"IsGuest",:"IsForumModerator",
:"IsModerator",:"ReadAccess",
:"PostAccess",:"ReplyAccess",
:"PriorityAccess",:"PollAccess",
:"VoteAccess",:"ModeratorAccess",
:"EditAccess",:"DeleteAccess",
:"UploadAccess",:"DownloadAccess";
SUSPEND;
END;*/

CREATE PROCEDURE objQual_vaccess_ULF(I_USERID INTEGER, I_FORUMID INTEGER)
RETURNS
(
USERID INTEGER,
FORUMID INTEGER,
ISADMIN INTEGER,
ISGUEST INTEGER,
ISFORUMMODERATOR INTEGER,
ISMODERATOR INTEGER,
READACCESS INTEGER,
POSTACCESS INTEGER,
REPLYACCESS INTEGER,
PRIORITYACCESS INTEGER,
POLLACCESS INTEGER,
VOTEACCESS INTEGER,
MODERATORACCESS INTEGER,
EDITACCESS INTEGER,
DELETEACCESS INTEGER,
UPLOADACCESS INTEGER,
DOWNLOADACCESS INTEGER
)
AS
DECLARE ICI_USERID INTEGER;
DECLARE ici_ForumID INTEGER;
DECLARE ici_IsAdmin INTEGER  DEFAULT 0;
DECLARE ici_IsGuest INTEGER  DEFAULT 0;
DECLARE ici_IsForumModerator INTEGER  DEFAULT 0;
DECLARE ici_IsModerator INTEGER DEFAULT 0;
DECLARE ici_ReadAccess  INTEGER DEFAULT 0;
DECLARE ici_PostAccess INTEGER DEFAULT 0;
DECLARE ici_ReplyAccess INTEGER DEFAULT 0;
DECLARE ici_PriorityAccess INTEGER DEFAULT 0;
DECLARE ici_PollAccess INTEGER DEFAULT 0;
DECLARE ici_VoteAccess INTEGER DEFAULT 0;
DECLARE ici_ModeratorAccess INTEGER DEFAULT 0;
DECLARE ici_EditAccess INTEGER DEFAULT 0;
DECLARE ici_DeleteAccess INTEGER DEFAULT 0;
DECLARE ici_UploadAccess INTEGER DEFAULT 0;
DECLARE ici_DownloadAccess INTEGER DEFAULT 0;

DECLARE out_UserID INTEGER;
DECLARE out_ForumID INTEGER;
DECLARE out_IsAdmin INTEGER DEFAULT 0;
DECLARE out_IsGuest INTEGER DEFAULT 0;
DECLARE out_IsForumModerator INTEGER DEFAULT 0;
DECLARE out_IsModerator INTEGER DEFAULT 0;
DECLARE out_ReadAccess INTEGER DEFAULT 0;
DECLARE out_PostAccess INTEGER DEFAULT 0;
DECLARE out_ReplyAccess INTEGER DEFAULT 0;
DECLARE out_PriorityAccess INTEGER DEFAULT 0;
DECLARE out_PollAccess INTEGER DEFAULT 0;
DECLARE out_VoteAccess INTEGER DEFAULT 0;
DECLARE out_ModeratorAccess INTEGER DEFAULT 0;
DECLARE out_EditAccess INTEGER DEFAULT 0;
DECLARE out_DeleteAccess INTEGER DEFAULT 0;
DECLARE out_UploadAccess INTEGER DEFAULT 0;
DECLARE out_DownloadAccess INTEGER DEFAULT 0;
BEGIN


SELECT FIRST 1
COALESCE(USERID, :I_USERID),COALESCE(FORUMID,0),COALESCE(READACCESS,0), COALESCE(POSTACCESS,0),COALESCE(REPLYACCESS,0),COALESCE(PRIORITYACCESS,0),
COALESCE(POLLACCESS,0),COALESCE(VOTEACCESS,0),COALESCE(MODERATORACCESS,0),COALESCE(EDITACCESS,0),
DELETEACCESS,UPLOADACCESS,DOWNLOADACCESS
FROM
 objQual_VACCESSFULL1  
 WHERE USERID=:I_USERID AND FORUMID = COALESCE(:I_FORUMID,0)
 INTO
:ICI_USERID,:ici_ForumID,
:ici_ReadAccess,:ici_PostAccess,:ici_ReplyAccess,:ici_PriorityAccess,
:ici_PollAccess,:ici_VoteAccess,:ici_ModeratorAccess, :ici_EditAccess,
:ici_DeleteAccess,:ici_UploadAccess, :ici_DownloadAccess; 
 
 SELECT FIRST 1 
COALESCE(USERID,:I_USERID),COALESCE(FORUMID,0),COALESCE(READACCESS,0), 
COALESCE(POSTACCESS,0),COALESCE(REPLYACCESS,0),COALESCE(PRIORITYACCESS,0),
COALESCE(POLLACCESS,0),COALESCE(VOTEACCESS,0),COALESCE(MODERATORACCESS,0),
COALESCE(EDITACCESS,0),COALESCE(DELETEACCESS,0),COALESCE(UPLOADACCESS,0),
COALESCE(DOWNLOADACCESS,0)
FROM
 objQual_VACCESSFULL2  
 WHERE USERID=:I_USERID AND FORUMID = COALESCE(:I_FORUMID,0)
 INTO 
:out_UserID,:out_ForumID,
:out_ReadAccess,:out_PostAccess,:out_ReplyAccess,:out_PriorityAccess,
:out_PollAccess,:out_VoteAccess,:out_ModeratorAccess, :out_EditAccess,
:out_DeleteAccess,:out_UploadAccess, :out_DownloadAccess;
  
 SELECT         
	  MAX(BIN_AND(b.FLAGS, 1)),
	  MAX(BIN_AND(b.FLAGS, 2)),
	 MAX(BIN_AND(b.FLAGS, 8))      
	  FROM objQual_USERGROUP a             
		   JOIN objQual_GROUP b
			 ON b.GROUPID = a.GROUPID
			 WHERE a.USERID=:I_USERID
			  INTO  :out_IsAdmin, :out_IsGuest, :out_IsForumModerator ;
 
SELECT
(SELECT :I_USERID FROM RDB$DATABASE) AS USERID,
(SELECT COALESCE(:I_FORUMID,0) FROM RDB$DATABASE) AS FORUMID,
(SELECT :out_IsAdmin  FROM RDB$DATABASE) AS ISADMIN,
(SELECT :out_IsGuest  FROM RDB$DATABASE)  AS ISGUEST,
(SELECT :out_IsForumModerator  FROM RDB$DATABASE)  AS ISFORUMMODERATOR,
(SELECT     COUNT(v.USERID) 
FROM          objQual_USERGROUP AS v
INNER JOIN    objQual_GROUP AS w
ON v.GROUPID = w.GROUPID
CROSS JOIN  objQual_FORUMACCESS AS x
CROSS JOIN  objQual_ACCESSMASK AS y
WHERE (v.USERID = :I_USERID)
AND (x.GROUPID = w.GROUPID)
AND (y.ACCESSMASKID = x.ACCESSMASKID)
AND (BIN_AND(y.FLAGS, 64) <> 0)) AS ISMODERATOR,
(SELECT MAXVALUE(:ici_ReadAccess,:out_ReadAccess)  FROM RDB$DATABASE) AS READACCESS,
(SELECT MAXVALUE(:ici_PostAccess,:out_PostAccess)  FROM RDB$DATABASE) AS POSTACCESS,
(SELECT MAXVALUE(:ici_ReplyAccess,:out_ReplyAccess)  FROM RDB$DATABASE) AS REPLYACCESS,
(SELECT MAXVALUE(:ici_PriorityAccess,:out_PriorityAccess) FROM RDB$DATABASE)  AS PRIORITYACCESS,
(SELECT MAXVALUE(:ici_PollAccess,:out_PollAccess)  FROM RDB$DATABASE) AS POLLACCESS,
(SELECT MAXVALUE(:ici_VoteAccess,:out_VoteAccess)  FROM RDB$DATABASE) AS VOTEACCESS,
(SELECT MAXVALUE(:ici_ModeratorAccess,:out_ModeratorAccess) FROM RDB$DATABASE)  AS MODERATORACCESS,
(SELECT MAXVALUE(:ici_EditAccess,:out_EditAccess)  FROM RDB$DATABASE) AS EDITACCESS,
(SELECT MAXVALUE(:ici_DeleteAccess,:out_DeleteAccess) FROM RDB$DATABASE)  AS DELETEACCESS,
(SELECT MAXVALUE(:ici_UploadAccess,:out_UploadAccess)  FROM RDB$DATABASE) AS UPLOADACCESS,
(SELECT MAXVALUE(:ici_DownloadAccess,:out_DownloadAccess) FROM RDB$DATABASE) AS DOWNLOADACCESS FROM RDB$DATABASE
INTO
:USERID,:FORUMID,:ISADMIN,:ISGUEST,:ISFORUMMODERATOR,
:ISMODERATOR,:READACCESS,:POSTACCESS,:REPLYACCESS,
:PRIORITYACCESS,:POLLACCESS,
:VOTEACCESS,:MODERATORACCESS,
:EDITACCESS,:DELETEACCESS,
:UPLOADACCESS,:DOWNLOADACCESS;
SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_vaccess_UL(I_USERID INTEGER, I_FORUMID INTEGER)
RETURNS
(
"IsAdmin" INTEGER,
"IsForumModerator" INTEGER,
"IsModerator" INTEGER
)
AS

DECLARE out_IsAdmin INTEGER DEFAULT 0;
DECLARE out_IsForumModerator INTEGER DEFAULT 0;
DECLARE out_IsModerator INTEGER DEFAULT 0;

BEGIN
  
 SELECT         
	  SIGN(MAX(BIN_AND(b.FLAGS, 1))),     
	  SIGN(MAX(BIN_AND(b.FLAGS, 8)))      
	  FROM objQual_USERGROUP a             
		   JOIN objQual_GROUP b
			 ON b.GROUPID = a.GROUPID
			 WHERE a.USERID=:I_USERID
			  INTO  :out_IsAdmin, :out_IsForumModerator ;
 
SELECT
(SELECT :out_IsAdmin  FROM RDB$DATABASE) AS "IsAdmin",
(SELECT :out_IsForumModerator  FROM RDB$DATABASE)  AS "IsForumModerator",
(SELECT     SIGN(COUNT(v.USERID)) 
FROM          objQual_USERGROUP AS v
INNER JOIN    objQual_GROUP AS w
ON v.GROUPID = w.GROUPID
CROSS JOIN  objQual_FORUMACCESS AS x
CROSS JOIN  objQual_ACCESSMASK AS y
WHERE (v.USERID = :I_USERID)
AND (x.GROUPID = w.GROUPID)
AND (y.ACCESSMASKID = x.ACCESSMASKID)
AND (BIN_AND(y.FLAGS, 64) <> 0)) AS "IsModerator"
FROM RDB$DATABASE
INTO
:"IsAdmin",
:"IsForumModerator",
:"IsModerator";
SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_ACCESSMASK_DELETE(I_ACCESSMASKID INTEGER)
  RETURNS (I_FLAG INTEGER)
 AS
BEGIN
  I_FLAG = 1;
 IF (EXISTS (SELECT 1 FROM objQual_FORUMACCESS 
			WHERE  ACCESSMASKID = :I_ACCESSMASKID)
	OR EXISTS (SELECT 1 FROM   objQual_USERFORUM 
		   WHERE  ACCESSMASKID = :I_ACCESSMASKID)) THEN
  I_FLAG = 0;
 ELSE
	DELETE FROM objQual_ACCESSMASK 
	  WHERE       ACCESSMASKID = :I_ACCESSMASKID;
SUSPEND;
  END;
--GO 


create procedure objQual_ACCESSMASK_LIST(I_BOARDID INTEGER,I_ACCESSMASKID INTEGER,I_EXCLUDEFLAGS INTEGER) 
RETURNS
(
"AccessMaskID" INTEGER,
"BoardID" INTEGER,
"Name" VARCHAR(128) CHARACTER SET UTF8,
"Flags" INTEGER,
"SortOrder" INTEGER
)
as
begin
	if (I_ACCESSMASKID is null) THEN
		FOR select 
			a.* 
		from 
			objQual_ACCESSMASK a 
		where
			a.BOARDID = :I_BOARDID and
			BIN_AND(a.FLAGS,:I_EXCLUDEFLAGS) = 0
		order by 
			a.SORTORDER ASC
			INTO
			:"AccessMaskID" ,
			:"BoardID",
			:"Name",
			:"Flags",
			:"SortOrder"
			 DO SUSPEND;
	else
		FOR select 
			a.* 
		from 
			objQual_ACCESSMASK a 
		where
			a.BOARDID = :I_BOARDID and
			a.ACCESSMASKID = :I_ACCESSMASKID
		order by 
			a.SORTORDER ASC
			INTO
			:"AccessMaskID",
			:"BoardID",
			:"Name",
			:"Flags",
			:"SortOrder"
			DO SUSPEND;
end
--GO

create procedure objQual_ACCESSMASK_SAVE(
	I_ACCESSMASKID		INTEGER,
	I_BOARDID			INTEGER,
	I_NAME				VARCHAR(128),
	I_READACCESS		BOOL,
	I_POSTACCESS		BOOL,
	I_REPLYACCESS		BOOL,
	I_PRIORITYACCESS	BOOL,
	I_POLLACCESS		BOOL,
	I_VOTEACCESS		BOOL,
	I_MODERATORACCESS	BOOL,
	I_EDITACCESS		BOOL,
	I_DELETEACCESS		BOOL,
	I_UPLOADACCESS		BOOL,
	I_DOWNLOADACCESS	BOOL,
	I_SORTORDER         INTEGER
) 
as
declare variable I_FLAGS	INTEGER;
begin	
	
	I_FLAGS = 0;
	-- |replace-BIN_OR
	if (I_READACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 1);
	if (I_POSTACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 2);
	if (I_REPLYACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 4);
	if (I_PRIORITYACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 8);
	if (I_POLLACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 16);
	if (I_VOTEACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 32);
	if (I_MODERATORACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 64);
	if (I_EDITACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 128);
	if (I_DELETEACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 256);
	if (I_UPLOADACCESS<>0) then I_FLAGS = BIN_OR(:I_FLAGS, 512);
	if (I_DOWNLOADACCESS<>0) then I_FLAGS = BIN_OR(I_FLAGS, 1024);

	if (I_ACCESSMASKID is null) THEN
		insert INTO objQual_ACCESSMASK(ACCESSMASKID,NAME,BOARDID,FLAGS,SORTORDER)
		values((SELECT NEXT VALUE FOR SEQ_objQual_ACCESSMASK_ACCESSMASKID FROM RDB$DATABASE),:I_NAME,:I_BOARDID,:I_FLAGS,:I_SORTORDER);
	else
		update objQual_ACCESSMASK set
			NAME			= :I_NAME,
			FLAGS			= :I_FLAGS,
			SORTORDER       = :I_SORTORDER
		where ACCESSMASKID=:I_ACCESSMASKID;
end;
--GO
-- active_list is implemented

create procedure objQual_ACTIVE_LISTFORUM(I_FORUMID INTEGER, I_STYLEDNICKS BOOL)
RETURNS
(
"UserID"  INTEGER,
"UserName" VARCHAR(128),
"IsCrawler" BOOL,
"IsHidden" BOOL,
"Style"  VARCHAR(255),
"UserCount" INTEGER
)
as
begin
	for select
		a.USERID AS "UserID",		
		b.NAME AS "UserName",
		a.ISCRAWLER AS ISCRAWLER,
		b.ISACTIVEEXCLUDED AS "IsHidden",
						CASE :I_STYLEDNICKS
				  WHEN 1 THEN  (SELECT * FROM objQual_GET_USERSTYLE(a.USERID))                      
				   ELSE (SELECT '' FROM RDB$DATABASE) END,
				  /*  CASE :I_STYLEDNICKS
				  WHEN 1 THEN  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=b.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)  
		else ''	 end AS Style, */	
		COUNT(a.USERID) AS "UserCount"
	from
		objQual_ACTIVE a 
		join objQual_USER b 
		on b.USERID=a.USERID
		JOIN objQual_RANK r on r.RANKID=b.RANKID 
	where
		a.FORUMID = :I_FORUMID
	group by
		a.USERID,
		b.NAME,
		b.ISACTIVEEXCLUDED,
		b.USERID,
		r.STYLE,
		a.ISCRAWLER
	order by
		b.NAME
		INTO
		:"UserID",
:"UserName",
:"IsCrawler",
:"IsHidden",
:"Style",
:"UserCount"
DO SUSPEND;
		
end;
--GO

create procedure objQual_ACTIVE_LISTTOPIC(I_TOPICID INTEGER, I_STYLEDNICKS BOOL)
RETURNS
(
"UserID"  INTEGER,
"IsCrawler" BOOL,
"UserName" VARCHAR(128),
"IsHidden" BOOL,
"Style"  VARCHAR(255),
"UserCount" INTEGER
)
as
begin
	for select
		a.USERID AS "UserID",	
		a.ISCRAWLER AS "IsCrawler",
		b.NAME AS "UserName",		
		b.ISACTIVEEXCLUDED AS "IsHidden",
				CASE :I_STYLEDNICKS
				  WHEN 1 THEN  (SELECT * FROM objQual_GET_USERSTYLE(a.USERID))                      
				   ELSE (SELECT '' FROM RDB$DATABASE) END, 
				   /*  CASE :I_STYLEDNICKS
				  WHEN 1 THEN  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=b.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)  
		else ''	 end AS Style, */				
		COUNT(a.USERID) AS "UserCount"
	from
		objQual_ACTIVE a 
		join objQual_USER b 
		on b.USERID=a.USERID
		JOIN objQual_RANK r on r.RANKID=b.RANKID 
	where
		a.TOPICID = :I_TOPICID
	group by
		a.USERID,
		a.ISCRAWLER,
		b.NAME,
		b.ISACTIVEEXCLUDED,
		b.USERID,
		r.STYLE,
		a.ISCRAWLER
	order by
		b.NAME
		INTO
		:"UserID",
:"IsCrawler",
:"UserName",
:"IsHidden",
:"Style",
:"UserCount"
DO SUSPEND;
end;
--GO
create procedure objQual_ATTACHMENT_DELETE(I_ATTACHMENTID integer)
 as 
 begin
	delete from objQual_ATTACHMENT 
	where ATTACHMENTID=:I_ATTACHMENTID;
 end;
--GO

create procedure objQual_ATTACHMENT_DOWNLOAD(I_ATTACHMENTID integer)
as
begin
	update objQual_ATTACHMENT 
	set DOWNLOADS=DOWNLOADS+1 
	where ATTACHMENTID=:I_ATTACHMENTID;
end;

--GO
create procedure objQual_ATTACHMENT_LIST(I_MESSAGEID integer,I_ATTACHMENTID INTEGER,I_BOARDID INTEGER) 
RETURNS
(
"AttachmentID" integer,
"MessageID" integer,
"FileName" VARCHAR(255),
"Bytes" integer,
"FileID" integer,
"ContentType" VARCHAR(128),
"Downloads" integer,
"FileData" BLOB SUB_TYPE 0 SEGMENT SIZE 80,
"BoardID" integer,
"Posted" timestamp ,
"ForumID" integer,
"ForumName" VARCHAR(128),
"TopicID" integer, 
"TopicName"  VARCHAR(128)
)
as begin
	if (I_MESSAGEID is not null) THEN
		for select 
			a.*,
			e.BOARDID,			
			(SELECT null FROM RDB$DATABASE) AS "Posted",
			(SELECT null FROM RDB$DATABASE) AS "ForumID",
			(SELECT null FROM RDB$DATABASE) AS "ForumName",
			(SELECT null FROM RDB$DATABASE) AS "TopicID",
			(SELECT null FROM RDB$DATABASE) AS "TopicName"  
		from
			objQual_ATTACHMENT a
			inner join objQual_MESSAGE b on b.MESSAGEID = a.MESSAGEID
			inner join objQual_TOPIC c on c.TOPICID = b.TOPICID
			inner join objQual_FORUM d on d.FORUMID = c.FORUMID
			inner join objQual_CATEGORY e on e.CATEGORYID = d.CATEGORYID
			inner join objQual_BOARD brd on brd.BOARDID = e.BOARDID
		where
			a.MESSAGEID=:I_MESSAGEID
			INTO
			:"AttachmentID",
			:"MessageID",
			:"FileName",
			:"Bytes",
			:"FileID",
			:"ContentType",
			:"Downloads",
			:"FileData",
			:"BoardID",		
			:"Posted",
			:"ForumID",
			:"ForumName",
			:"TopicID", 
			:"TopicName"
			DO SUSPEND;
			
	else if (I_ATTACHMENTID is not null) THEN
		for select 
			a.*,
			e.BOARDID,		
			(SELECT null FROM RDB$DATABASE) AS "Posted",
			(SELECT null FROM RDB$DATABASE) AS "ForumID",
			(SELECT null FROM RDB$DATABASE) AS  "ForumName",
			(SELECT null FROM RDB$DATABASE) AS "TopicID",
			(SELECT null FROM RDB$DATABASE) AS  "TopicName"			
		from
			objQual_ATTACHMENT a
			inner join objQual_MESSAGE b on b.MESSAGEID = a.MESSAGEID
			inner join objQual_TOPIC c on c.TOPICID = b.TOPICID
			inner join objQual_FORUM d on d.FORUMID = c.FORUMID
			inner join objQual_CATEGORY e on e.CATEGORYID = d.CATEGORYID
			inner join objQual_BOARD brd on brd.BOARDID = e.BOARDID
		where 
			a.ATTACHMENTID=:I_ATTACHMENTID
			INTO
			:"AttachmentID",
			:"MessageID",
			:"FileName",
			:"Bytes",
			:"FileID",
			:"ContentType",
			:"Downloads",
			:"FileData",
			:"BoardID",			
			:"Posted",
			:"ForumID",
			:"ForumName",
			:"TopicID", 
			:"TopicName"
			DO SUSPEND;
	else
		for select 
			a.*,
			(SELECT :I_BOARDID FROM RDB$DATABASE) AS BOARDID,			
			b.POSTED AS "Posted",
			d.FORUMID AS "ForumID",
			d.NAME AS "ForumName",
			c.TOPICID AS "TopicID",
			c.TOPIC AS "TopicName"
		from 
			objQual_ATTACHMENT a
			inner join objQual_MESSAGE b on b.MESSAGEID = a.MESSAGEID
			inner join objQual_TOPIC c on c.TOPICID = b.TOPICID
			inner join objQual_FORUM d on d.FORUMID = c.FORUMID
			inner join objQual_CATEGORY e on e.CATEGORYID = d.CATEGORYID
			inner join objQual_BOARD brd on brd.BOARDID = e.BOARDID
		where
			e.BOARDID = :I_BOARDID
		order by
			d.NAME,
			c.TOPIC,
			b.POSTED
			INTO
			:"AttachmentID",
			:"MessageID",
			:"FileName",
			:"Bytes",
			:"FileID",
			:"ContentType",
			:"Downloads",
			:"FileData",
			:"BoardID",		
			:"Posted",
			:"ForumID",
			:"ForumName",
			:"TopicID", 
			:"TopicName"
			DO SUSPEND;
end;
--GO

create procedure objQual_ATTACHMENT_SAVE(I_MESSAGEID INTEGER,I_FILENAME VARCHAR(255),I_BYTES INTEGER,I_CONTENTTYPE VARCHAR(128),I_FILEDATA BLOB SUB_TYPE 0 SEGMENT SIZE 80) 
as begin
	insert into objQual_ATTACHMENT(ATTACHMENTID,MESSAGEID, FILENAME,BYTES,
	CONTENTTYPE,DOWNLOADS,FILEDATA) 
	values((SELECT NEXT VALUE FOR SEQ_objQual_ATTACHMENT_ATTACHMENTID FROM RDB$DATABASE),:I_MESSAGEID,:I_FILENAME,:I_BYTES,
	:I_CONTENTTYPE,0,:I_FileData);
end;
--GO

CREATE  PROCEDURE objQual_bannedip_delete(
I_ID INTEGER)
AS
BEGIN
DELETE FROM objQual_BANNEDIP
WHERE       "ID" = :I_ID;
END;
--GO

CREATE  PROCEDURE objQual_bannedip_list(
I_BOARDID INTEGER,
I_ID      INTEGER)
RETURNS
(
"ID" integer,
"BoardID" integer,
"Mask" VARCHAR(57),
"Since" timestamp,
"Reason" VARCHAR(128),
"UserID" integer
)
AS
DECLARE VARIABLE ici_ID INTEGER DEFAULT NULL;
BEGIN
IF (I_ID IS NOT NULL OR ici_ID>0) THEN 
 ici_ID=I_ID;
IF (ici_ID IS NULL OR ici_ID=0) THEN
FOR SELECT *
FROM   objQual_BANNEDIP
WHERE  BOARDID = :I_BOARDID
INTO
:"ID",
:"BoardID",
:"Mask",
:"Since",
:"Reason",
:"UserID"
DO SUSPEND;
ELSE
FOR SELECT *
FROM   objQual_BANNEDIP
WHERE  BOARDID = :I_BOARDID
AND "ID" = :ici_ID
INTO
:"ID",
:"BoardID",
:"Mask",
:"Since",
:"Reason",
:"UserID"
DO SUSPEND;
END;
--GO

CREATE  PROCEDURE objQual_bannedip_save(
I_ID      INTEGER,
I_BOARDID INTEGER,
I_MASK    VARCHAR(57),
I_REASON  VARCHAR(128),
I_USERID INTEGER,
I_UTCTIMESTAMP TIMESTAMP
)
AS
DECLARE VARIABLE ici_ID INTEGER;
BEGIN

IF (I_ID > 0) THEN ici_ID=I_ID;
IF (ici_ID IS NULL OR ici_ID = 0)  THEN
BEGIN
 IF (NOT EXISTS(SELECT 1 FROM objQual_BANNEDIP WHERE MASK=:I_MASK)) THEN
INSERT INTO objQual_BANNEDIP
("ID",BOARDID,
MASK,
SINCE,
REASON,
USERID)
VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_BANNEDIP_ID FROM RDB$DATABASE),:I_BOARDID,
:I_MASK,
:I_UTCTIMESTAMP,
:I_REASON,
:I_USERID
);
ELSE
EXIT;
END

ELSE IF (ici_ID > 0) THEN
UPDATE objQual_BANNEDIP
SET    MASK = :I_MASK, REASON = :I_REASON,
USERID = :I_USERID
WHERE  "ID" = :ici_ID;

END;
--GO

CREATE PROCEDURE objQual_BBCODE_DELETE
 (
	I_BBCODEID INTEGER
 )
 AS
 BEGIN
	IF (I_BBCODEID IS NOT NULL) THEN
		DELETE FROM objQual_BBCODE WHERE BBCODEID = :I_BBCODEID;
	ELSE
		DELETE FROM objQual_BBCODE; 
 END;
--GO

CREATE  PROCEDURE objQual_FORUM_UPDATESTATS(I_FORUMID INTEGER)
AS
BEGIN
		UPDATE objQual_FORUM 
		   SET 
		NUMPOSTS = (SELECT COUNT(1) FROM objQual_MESSAGE x 
							   JOIN objQual_TOPIC y 
								  ON y.TOPICID=x.TOPICID 
								   WHERE y.FORUMID = :I_FORUMID 
									 AND x.ISAPPROVED = 1 
									   AND x.ISDELETED = 0 
										 AND y.ISDELETED = 0 ),
		NUMTOPICS = (SELECT COUNT(distinct x.TOPICID) FROM objQual_TOPIC x 
							   JOIN objQual_MESSAGE y 
								  ON y.TOPICID=x.TOPICID 
								   WHERE x.FORUMID = :I_FORUMID 
									 AND y.ISAPPROVED = 1 
										 AND y.ISDELETED = 0 
										   AND x.ISDELETED = 0)
	WHERE FORUMID=:I_FORUMID;
END;
--GO
/* create procedure objQual_FORUM_UPDATELASTPOST(I_FORUMID INTEGER) as
begin
	update objQual_FORUM set
		LASTPOSTED = (select FIRST  1 y.POSTED 
		from objQual_TOPIC x 
		join objQual_MESSAGE y 
		on y.TOPICID=x.TOPICID 
		where x.FORUMID = :I_FORUMID 
		and bin_and(y.FLAGS , 24)=16 
		and x.ISDELETED = 0 
		order by y.POSTED desc),
		LASTTOPICID = (select FIRST  1 y.TOPICID 
		from objQual_TOPIC x 
		join objQual_MESSAGE y 
		on y.TOPICID=x.TOPICID where x.FORUMID = :I_FORUMID 
		and bin_and(y.FLAGS , 24)=16 and x.ISDELETED = 0
		order by y.POSTED desc),
		LASTMESSAGEID = (select FIRST  1 y.MESSAGEID 
		from objQual_TOPIC x 
		join objQual_MESSAGE y 
		on y.TOPICID=x.TOPICID where x.FORUMID = :I_FORUMID 
		and bin_and(y.FLAGS , 24)=16 and x.ISDELETED = 0
		order by y.POSTED desc),
		LASTUSERID = (select FIRST  1 y.USERID 
		from objQual_TOPIC x 
		join objQual_MESSAGE y 
		on y.TOPICID=x.TOPICID where x.FORUMID = :I_FORUMID 
		and bin_and(y.FLAGS, 24)=16 and x.ISDELETED = 0
		order by y.POSTED desc),
		LASTUSERNAME = (select FIRST  1 y.USERNAME 
		from objQual_TOPIC x 
		join objQual_MESSAGE y 
		on y.TOPICID=x.TOPICID where x.FORUMID = :I_FORUMID 
		and bin_and(y.FLAGS, 24)=16 and x.ISDELETED = 0
		order by y.POSTED desc)
	where FORUMID = :I_FORUMID;
end
 GO */
CREATE PROCEDURE objQual_FORUM_UPDATELASTPOST(I_FORUMID INTEGER)
AS
DECLARE VARIABLE ici_ParentID INTEGER;
DECLARE VARIABLE ici_tmpParent INTEGER;
DECLARE VARIABLE ici_LastPosted TIMESTAMP;
DECLARE VARIABLE ici_tmpMaxPosted3 TIMESTAMP DEFAULT NULL;

DECLARE VARIABLE ici_LastTopicID INTEGER;
DECLARE VARIABLE ici_LastMessageID INTEGER;
DECLARE VARIABLE ici_LastUserID INTEGER;
DECLARE VARIABLE ici_LastUserName varchar(128);

DECLARE VARIABLE ici_LastPostedTmp TIMESTAMP;
DECLARE VARIABLE ici_LastTopicIDTmp INTEGER;
DECLARE VARIABLE ici_LastMessageIDTmp INTEGER;
DECLARE VARIABLE ici_LastUserIDTmp INTEGER;
DECLARE VARIABLE ici_LastUserNameTmp varchar(128);
DECLARE VARIABLE ici_MaxTPosted TIMESTAMP;

BEGIN

SELECT z.PARENTID
FROM objQual_FORUM z
WHERE z.FORUMID = :I_FORUMID
INTO :ici_ParentID;


SELECT FIRST 1 DISTINCT y.POSTED,y.TOPICID,y.MESSAGEID,y.USERID,y.USERNAME
FROM
objQual_FORUM z
JOIN objQual_TOPIC x ON z.FORUMID=x.FORUMID 
JOIN objQual_MESSAGE y ON y.TOPICID=x.TOPICID
WHERE x.FORUMID = :I_FORUMID
AND BIN_AND(y.FLAGS, 24)=16
AND x.ISDELETED = 0
ORDER BY y.POSTED DESC
INTO :ici_LastPosted,:ici_LastTopicID,:ici_LastMessageID,:ici_LastUserID,:ici_LastUserName;
/*END IF; Look for it in children*/

SELECT FIRST 1 DISTINCT LASTPOSTED,
LASTTOPICID,
LASTMESSAGEID,
LASTUSERID,
LASTUSERNAME
from objQual_FORUM
WHERE PARENTID =:I_FORUMID ORDER BY LASTPOSTED DESC 
INTO 
:ici_LastPostedTmp,:ici_LastTopicIDTmp,:ici_LastMessageIDTmp,:ici_LastUserIDTmp,:ici_LastUserNameTmp;
-- END IF;

IF (ici_LastPostedTmp IS NOT NULL AND ici_LastPosted IS NOT NULL) THEN
IF (ici_LastPostedTmp > ici_LastPosted) THEN
BEGIN
ici_LastPosted=ici_LastPostedTmp;
ici_LastTopicID=ici_LastTopicIDTmp;
ici_LastMessageID=ici_LastMessageIDTmp;
ici_LastUserID=ici_LastUserIDTmp;
ici_LastUserName=ici_LastUserNameTmp;
END


IF (ici_LastPostedTmp IS NOT NULL AND ici_LastPosted IS NULL) THEN
BEGIN
ici_LastPosted=ici_LastPostedTmp;
ici_LastTopicID=ici_LastTopicIDTmp;
ici_LastMessageID=ici_LastMessageIDTmp;
ici_LastUserID=ici_LastUserIDTmp;
ici_LastUserName=ici_LastUserNameTmp;
END


IF ((ici_LastTopicID IS NOT NULL AND ici_LastPostedTmp IS NOT NULL AND (ici_LastPostedTmp <= ici_LastPosted)) OR (ici_LastTopicID IS NOT NULL AND 
ici_LastPostedTmp IS NULL)) THEN

UPDATE objQual_FORUM
   SET
		LASTPOSTED = :ici_LastPosted,
				LASTTOPICID = :ici_LastTopicID,
				LASTMESSAGEID = :ici_LastMessageID,
				LASTUSERID = :ici_LastUserID,
				LASTUSERNAME = :ici_LastUserName
 WHERE FORUMID = :I_FORUMID;


EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :I_FORUMID;



--   max value  in the current forum we compare with its peers to use in parent

IF (ici_ParentID >0)  THEN

	 -- EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS(I_FORUMID);

/* In peers to use in parent*/

SELECT  FIRST 1 MAX(LASTPOSTED)
FROM objQual_FORUM
WHERE PARENTID = :ici_ParentID
AND FORUMID != :I_FORUMID AND LASTPOSTED IS NOT NULL
INTO :ici_tmpMaxPosted3;


IF (ici_tmpMaxPosted3 IS NOT NULL AND ici_LastPosted IS NULL) THEN
ici_MaxTPosted = ici_tmpMaxPosted3;

IF
((ici_tmpMaxPosted3 IS NULL AND ici_LastPosted IS NOT NULL)
OR ((ici_tmpMaxPosted3 IS NOT NULL AND ici_LastPosted IS NOT NULL)
AND (ici_tmpMaxPosted3 <= ici_LastPosted))) THEN
ici_MaxTPosted = ici_LastPosted;

IF (ici_tmpMaxPosted3 IS NOT NULL
AND ici_LastPosted IS NOT NULL
AND ici_tmpMaxPosted3 > ici_LastPosted) THEN
ici_MaxTPosted = ici_tmpMaxPosted3; 

ici_tmpMaxPosted3 = NULL;

/* In parent themes
SELECT DISTINCTROW LastPosted
INTO ici_tmpMaxPosted3
FROM objQual_TOPIC
WHERE ForumID=ici_ParentID ORDER BY LastPosted LIMIT 1;


IF ici_tmpMaxPosted3 IS NOT NULL AND ici_MaxTPosted IS NULL THEN
SET ici_MaxTPosted = ici_tmpMaxPosted3;
END IF;

IF ici_tmpMaxPosted3 IS NOT NULL
AND ici_LastPosted IS NOT NULL
AND UNIX_TIMESTAMP(ici_tmpMaxPosted3) > UNIX_TIMESTAMP(ici_MaxTPosted) THEN
SET ici_MaxTPosted = ici_tmpMaxPosted3;
END IF; */

IF (ici_MaxTPosted IS NOT NULL) THEN
BEGIN
SELECT FIRST 1 DISTINCT  LASTPOSTED,
LASTTOPICID,
LASTMESSAGEID,
LASTUSERID,
LASTUSERNAME
FROM objQual_FORUM
WHERE LASTPOSTED =:ici_MaxTPosted ORDER BY LASTPOSTED DESC
INTO :ici_LastPosted,:ici_LastTopicID,:ici_LastMessageID,:ici_LastUserID,:ici_LastUserName;


	  UPDATE objQual_FORUM
		  SET
		LASTPOSTED = :ici_LastPosted,
				LASTTOPICID = :ici_LastTopicID,
				LASTMESSAGEID = :ici_LastMessageID,
				LASTUSERID = :ici_LastUserID,
				LASTUSERNAME = :ici_LastUserName                   
	  WHERE FORUMID = :ici_ParentID;
END
EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ParentID;



SELECT DISTINCT PARENTID 
  FROM  objQual_FORUM
  WHERE FORUMID = :ici_ParentID
  INTO  :ici_tmpParent ;


 -- Here we set new values in parents

/* WHILE (ici_tmpParent  > 0) DO
BEGIN

IF (ici_tmpParent > 0) THEN
-- 1
BEGIN

SELECT  FIRST 1 MAX(LASTPOSTED)
FROM objQual_FORUM
WHERE PARENTID = :ici_tmpParent
AND LASTPOSTED IS NOT NULL
ORDER BY LASTPOSTED DESC
INTO :ici_MaxTPosted;

IF (ici_MaxTPosted IS NOT NULL) THEN
BEGIN
SELECT   FIRST 1 DISTINCT LASTPOSTED,
LASTTOPICID,
LASTMESSAGEID,
LASTUSERID,
LASTUSERNAME
FROM objQual_FORUM
WHERE LastPosted =ici_MaxTPosted ORDER BY LastPosted DESC
INTO :ici_LastPosted,
:ici_LastTopicID,
:ici_LastMessageID,
:ici_LastUserID,
:ici_LastUserName;


		UPDATE objQual_FORUM SET
				LASTPOSTED = :ici_LastPosted,
				LASTTOPICID = :ici_LastTopicID,
				LASTMESSAGEID = :ici_LastMessageID,
				LASTUSERID = :ici_LastUserID,
				LASTUSERNAME = :ici_LastUserName
			WHERE
				FORUMID = :ici_tmpParent
		AND ((LASTPOSTED <= :ici_LastPosted)
		OR LASTPOSTED IS NULL);
		EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_tmpParent;
		  
		 SELECT DISTINCT PARENTID 
  FROM  objQual_FORUM
  WHERE FORUMID = :ici_tmpParent
  INTO  :ici_tmpParent;
-- end while
  END
  END*/
  
END;
--GO

create procedure objQual_POLLGROUP_REMOVE(I_POLLGROUPID integer, I_TOPICID integer, I_FORUMID integer, I_CATEGORYID integer, I_BOARDID intEGER, I_REMOVECOMPLETELY BOOL, I_REMOVEEVERYWHERE BOOL)
 as
 declare VARIABLE TMP intEGER;
  begin  		
	
			 -- we delete poll from the place only it persists in other places 
		 if (I_REMOVEEVERYWHERE <> 1) THEN
			 begin
				   if (I_TOPICID > 0) THEN
				   Update objQual_TOPIC set POLLID = NULL where TOPICID = :I_TOPICID;                 
                  
				   if (I_FORUMID > 0) THEN
                   Update objQual_FORUM set POLLGROUPID = NULL where FORUMID = :I_FORUMID;
              
	               if (I_CATEGORYID > 0) THEN
                   Update objQual_CATEGORY set POLLGROUPID = NULL where CATEGORYID = :I_CATEGORYID;                
		     end        
		    
	      -- we remove poll group links from all places where they are
	     if ( I_REMOVEEVERYWHERE = 1 OR I_REMOVECOMPLETELY = 1) THEN
		 begin
				   Update objQual_TOPIC set POLLID = NULL where POLLID = :I_POLLGROUPID; 
                   Update objQual_FORUM set POLLGROUPID = NULL where POLLGROUPID = :I_POLLGROUPID;
				   Update objQual_CATEGORY set POLLGROUPID = NULL where POLLGROUPID = :I_POLLGROUPID;				 
         end

		 -- simply remove all polls
	if (I_REMOVECOMPLETELY = 1 ) THEN
	begin	
	
	FOR select POLLID from objQual_POLL where POLLGROUPID =  :I_POLLGROUPID
	into :TMP
	DO
	BEGIN  
			DELETE FROM  objQual_POLLVOTE WHERE POLLID = :TMP;
			DELETE FROM  objQual_CHOICE WHERE POLLID = :TMP;			
			suspend;					
    END
	DELETE FROM  objQual_POLL WHERE POLLGROUPID = :I_POLLGROUPID;
	DELETE FROM  objQual_POLLGROUPCLUSTER WHERE POLLGROUPID = :I_POLLGROUPID;
	
	END

	-- don't remove cluster if the polls are not removed from db 
	end
--GO
 CREATE PROCEDURE objQual_TOPIC_DELETE (I_TOPICID INTEGER,I_UPDATELASTPOST BOOL,I_ERASETOPIC BOOL)
	AS
	DECLARE VARIABLE ici_ForumID INTEGER;
	DECLARE VARIABLE ici_ForumID2 INTEGER;
	DECLARE VARIABLE ici_pollID INTEGER;
	DECLARE VARIABLE ici_Deleted INTEGER;
	BEGIN
	/*SET NOCOUNT ON*/   

	SELECT FORUMID  FROM  objQual_TOPIC 
	WHERE TOPICID=:I_TOPICID
	INTO :ici_ForumID;
	
	UPDATE  objQual_TOPIC SET LASTMESSAGEID = NULL 
	WHERE TOPICID = :I_TOPICID;
	
 

  UPDATE  objQual_FORUM SET
	LASTTOPICID = NULL,
	LASTMESSAGEID = NULL,
	LASTUSERID = NULL,
	LASTUSERNAME = NULL,
	LASTPOSTED = NULL
	WHERE LASTMESSAGEID IN (SELECT MESSAGEID from  objQual_MESSAGE 
	where TOPICID = :I_TOPICID);
	
	
	
	 
	UPDATE  objQual_ACTIVE SET TOPICID = NULL WHERE TOPICID = :I_TOPICID;

-- delete messages and topics
	DELETE FROM  objQual_NNTPTOPIC WHERE TOPICID = :I_TOPICID;	
	UPDATE objQual_TOPIC SET POLLID = NULL WHERE TOPICID = :I_TOPICID AND TOPICMOVEDID IS NOT NULL;
	IF (I_ERASETOPIC = 0) THEN
	BEGIN
		UPDATE  objQual_TOPIC set FLAGS = BIN_OR(FLAGS, 8) where TOPICMOVEDID = :I_TOPICID OR TOPICID = :I_TOPICID;
		UPDATE  objQual_MESSAGE set FLAGS = BIN_OR(FLAGS, 8) where TOPICID = :I_TOPICID;
	END
	ELSE
	BEGIN
		-- remove polls	
		SELECT POLLID FROM  objQual_TOPIC 
		WHERE TOPICID = :I_TOPICID INTO :ici_pollID;
		
		IF (ici_pollID is not null) THEN
		BEGIN
			UPDATE  objQual_TOPIC SET POLLID = null WHERE TOPICID = :I_TOPICID;			
	        EXECUTE PROCEDURE objQual_POLLGROUP_REMOVE :ici_pollID, :I_TOPICID, NULL, NULL, NULL, 0, 0;
           --  RETURNING_VALUES :ICI;
		END	
	   
		DELETE FROM  objQual_TOPIC WHERE TOPICMOVEDID = :I_TOPICID;
		
		DELETE  FROM objQual_ATTACHMENT WHERE MESSAGEID 
		IN (SELECT MESSAGEID FROM  objQual_MESSAGE WHERE TOPICID = :I_TOPICID);
		DELETE  FROM objQual_MESSAGEHISTORY WHERE MESSAGEID 
		IN (SELECT MESSAGEID FROM  objQual_MESSAGE WHERE TOPICID = :I_TOPICID);
		DELETE  FROM objQual_MESSAGE WHERE TOPICID = :I_TOPICID;
		DELETE  FROM objQual_WATCHTOPIC WHERE TOPICID = :I_TOPICID;
		DELETE  FROM objQual_FAVORITETOPIC WHERE TOPICID = :I_TOPICID;
		DELETE  FROM objQual_TOPIC WHERE TOPICMOVEDID = :I_TOPICID;
		DELETE  FROM objQual_TOPIC WHERE TOPICID = :I_TOPICID;
		DELETE  FROM objQual_MESSAGEREPORTEDAUDIT WHERE MESSAGEID 
		IN (SELECT MESSAGEID FROM  objQual_MESSAGE WHERE TOPICID = :I_TOPICID); 
		DELETE  FROM objQual_MESSAGEREPORTED WHERE MESSAGEID 
		IN (SELECT MESSAGEID FROM  objQual_MESSAGE WHERE TOPICID = :I_TOPICID);
		DELETE  FROM objQual_FAVORITETOPIC  WHERE TOPICID = :I_TOPICID;
	END
	
   

	/*commit*/
	IF (I_UPDATELASTPOST<>0) THEN
		EXECUTE PROCEDURE  objQual_FORUM_UPDATELASTPOST :ici_ForumID;
	
	IF (ici_ForumID IS NOT NULL) THEN
		EXECUTE PROCEDURE  objQual_FORUM_UPDATESTATS :ici_ForumID;
END;
--GO

CREATE  PROCEDURE objQual_FORUM_DELETE(
				I_FORUMID INTEGER)
AS
DECLARE VARIABLE ici_LastTopicID INTEGER;
DECLARE VARIABLE ici_LastMessageID INTEGER;
DECLARE VARIABLE ici_LastUserID INTEGER;
DECLARE VARIABLE ici_LastUserName varchar(128);
DECLARE VARIABLE ici_ParentID INTEGER;
DECLARE VARIABLE ici_LastPosted TIMESTAMP;
DECLARE VARIABLE ici_LastTopicID_Check INTEGER;
DECLARE VARIABLE ici_LastMessageID_Check INTEGER;
DECLARE  itmpTopicID INTEGER;

BEGIN       
	  
		
/*Here we change Last things in forums */
SELECT LASTMESSAGEID
FROM objQual_FORUM
WHERE FORUMID = :I_FORUMID
INTO :ici_LastMessageID;


		UPDATE objQual_FORUM
		SET    LASTMESSAGEID = NULL,
			   LASTTOPICID = NULL
		WHERE  FORUMID = :I_FORUMID;        

		UPDATE objQual_TOPIC
		SET    LASTMESSAGEID = NULL
		WHERE  FORUMID = :I_FORUMID;

		UPDATE objQual_ACTIVE 
		SET FORUMID=NULL 
		WHERE FORUMID=:I_FORUMID;

		

	   /* DELETE  objQual_WATCHTOPIC,objQual_TOPIC
		FROM objQual_WATCHTOPIC, objQual_TOPIC
		WHERE FORUMID = :I_FORUMID
		AND objQual_WATCHTOPIC.TOPICID = objQual_TOPIC.TOPICID;

		DELETE objQual_ACTIVE, objQual_TOPIC
		FROM  objQual_ACTIVE, objQual_TOPIC
		WHERE objQual_TOPIC.FORUMID = :I_FORUMID
		AND   objQual_ACTIVE.TOPICID = objQual_TOPIC.TOPICID;

		DELETE  objQual_NNTPTOPIC, objQual_NNTPFORUM
		 FROM         objQual_NNTPTOPIC, objQual_NNTPFORUM
		 WHERE        objQual_NNTPFORUM.FORUMID = :I_FORUMID
		 AND objQual_NNTPTOPIC.NNTPFORUMID = objQual_NNTPFORUM.NNTPFORUMID; */
		 
	   DELETE  
		FROM objQual_WATCHTOPIC
		WHERE TOPICID IN (SELECT TOPICID FROM objQual_TOPIC WHERE FORUMID=:I_FORUMID);
		
	   DELETE 
		FROM  objQual_ACTIVE
		WHERE TOPICID IN ( SELECT TOPICID FROM objQual_TOPIC WHERE FORUMID = :I_FORUMID);        
		
		/*DELETE 
		FROM  objQual_TOPIC
		WHERE FORUMID = :I_FORUMID;*/   
	  
	   DELETE           FROM         objQual_NNTPTOPIC
		 WHERE        NNTPFORUMID IN 
		 (SELECT  NNTPFORUMID FROM objQual_NNTPFORUM
		 WHERE FORUMID= :I_FORUMID);     
		
	   
		DELETE FROM objQual_NNTPFORUM
		WHERE       FORUMID = :I_FORUMID;

		DELETE FROM objQual_WATCHFORUM
		WHERE       FORUMID = :I_FORUMID;
		
	   /* Delete topics, messages and attachments*/        
	  
 FOR SELECT   TOPICID
		FROM     objQual_TOPIC
		WHERE    FORUMID = :I_FORUMID
		ORDER BY TOPICID DESC
		INTO :itmpTopicID
		DO
		BEGIN
		EXECUTE PROCEDURE objQual_TOPIC_DELETE :itmpTopicID, 1, 1;        
		END  
		
  
					 
	  
		/* TopicDelete finished*/ 
	  
		DELETE FROM objQual_FORUMACCESS
		WHERE       FORUMID = :I_FORUMID;
	  
		/*Delete UserForums*/

		DELETE FROM objQual_USERFORUM
		WHERE       FORUMID = :I_FORUMID;

	   /*And after this we can delete Forum itself*/

		DELETE FROM objQual_FORUM
		WHERE       FORUMID = :I_FORUMID;
		/* Forum on update */
		SELECT PARENTID FROM  objQual_FORUM
		WHERE FORUMID = :I_FORUMID
		INTO :ici_ParentID;
		
		IF (ici_ParentID > 0) THEN
		BEGIN
		SELECT  FIRST 1 DISTINCT LASTPOSTED         
		FROM  objQual_FORUM
		WHERE PARENTID = :ici_ParentID ORDER BY LASTPOSTED DESC
		INTO :ici_LastPosted ;
		
		IF (ici_LastPosted IS NOT NULL) THEN 
		BEGIN
		SELECT  FIRST 1 DISTINCT FORUMID 
		FROM  objQual_FORUM
		WHERE LASTPOSTED = :ici_LastPosted 
		ORDER BY FORUMID DESC
		INTO :ici_ParentID;
		EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST :ici_ParentID;
		EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ParentID;
		END        
		END 
	END;
--GO

 CREATE  PROCEDURE objQual_BOARD_DELETE(
  I_BOARDID INTEGER)
  AS  
  DECLARE VARIABLE ITMP_FORUMID INTEGER;   
  BEGIN   
  FOR
   SELECT   a.FORUMID 
  FROM     objQual_FORUM a
  JOIN objQual_CATEGORY b
  ON b.CATEGORYID = a.CATEGORYID
  WHERE    b.BOARDID = :I_BOARDID
  ORDER BY a.FORUMID DESC   
  INTO :ITMP_FORUMID
  DO  
  BEGIN
	EXECUTE PROCEDURE objQual_FORUM_DELETE :ITMP_FORUMID;          
  END   
	 
	DELETE FROM objQual_FORUMACCESS
  WHERE    EXISTS (SELECT 1
  FROM   objQual_GROUP x
  WHERE  x.GROUPID = objQual_FORUMACCESS.GROUPID
  AND x.BOARDID = :I_BOARDID);
	 
	 
	 DELETE FROM objQual_FORUM
  WHERE    EXISTS (SELECT 1
  FROM   objQual_CATEGORY x
  WHERE  x.CATEGORYID = objQual_FORUM.CATEGORYID
  AND x.BOARDID = :I_BOARDID);
  DELETE FROM objQual_USERGROUP
  WHERE       EXISTS (SELECT 1
  FROM   objQual_USER x
  WHERE  x.USERID = objQual_USERGROUP.USERID
  AND x.BOARDID = :I_BOARDID);
	  DELETE FROM objQual_CATEGORY
  WHERE       BOARDID = :I_BOARDID;
	   DELETE FROM objQual_ACTIVEACCESS
  WHERE       BOARDID = :I_BOARDID;
	  DELETE FROM objQual_ACTIVE
  WHERE       BOARDID = :I_BOARDID;
	  DELETE FROM objQual_USER
  WHERE       BOARDID = :I_BOARDID;
	 DELETE FROM objQual_RANK
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_GROUP
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_ACCESSMASK
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_BBCODE
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_EXTENSION
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_SHOUTBOXMESSAGE
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_MEDAL
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_SMILEY
  WHERE       BOARDID = :I_BOARDID;
	DELETE FROM objQual_REPLACE_WORDS
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_NNTPSERVER
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_BANNEDIP
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_REGISTRY
  WHERE       BOARDID = :I_BOARDID;
  DELETE FROM objQual_BOARD
  WHERE       BOARDID = :I_BOARDID;
  END;
--GO

CREATE procedure objQual_TOPIC_MOVE(I_TOPICID INTEGER,I_FORUMID INTEGER,
I_SHOWMOVED BOOL) 
AS
DECLARE ici_OldForumID INTEGER;
BEGIN
 
	 SELECT  FORUMID FROM objQual_TOPIC 
	 WHERE TOPICID = :I_TOPICID
	 INTO :ici_OldForumID;
	 -- vzrus addon ( don't make link in the same forum)
  IF (ici_OldForumID != I_FORUMID) THEN 
  BEGIN
	 IF (I_SHOWMOVED<>0) THEN
	 BEGIN
		 -- create a moved message
		 INSERT INTO objQual_TOPIC(TOPICID,FORUMID,USERID,USERNAME,POSTED,
		 TOPIC, DESCRIPTION,STATUS, VIEWS,FLAGS,"PRIORITY",POLLID,
		 TOPICMOVEDID,LASTPOSTED,NUMPOSTS)
		 SELECT (SELECT NEXT VALUE FOR SEQ_objQual_TOPIC_TOPICID FROM RDB$DATABASE),FORUMID,
		 USERID,USERNAME,POSTED,TOPIC, DESCRIPTION,STATUS,(SELECT 0  FROM RDB$DATABASE),FLAGS,"PRIORITY",POLLID,(SELECT :I_TOPICID FROM RDB$DATABASE),LASTPOSTED, (SELECT 0 FROM RDB$DATABASE)
		 FROM objQual_TOPIC WHERE TOPICID = :I_TOPICID;
	 END
 
	-- move the topic 
	 UPDATE objQual_TOPIC SET FORUMID = :I_FORUMID WHERE TOPICID = :I_TOPICID;
 
	-- update last posts 
	 EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ici_OldForumID);
	 EXECUTE PROCEDURE  objQual_FORUM_UPDATELASTPOST(:I_FORUMID);
	 
	-- update stats 
	  EXECUTE PROCEDURE  objQual_FORUM_UPDATESTATS (:ici_OldForumID);
	  EXECUTE PROCEDURE  objQual_FORUM_UPDATESTATS (:I_FORUMID);
END     
END;
--GO 

CREATE  PROCEDURE objQual_FORUM_MOVE(
				I_FORUMOLDID INTEGER, I_FORUMNEWID INTEGER)
AS
DECLARE VARIABLE ici_LastTopicID INTEGER;
DECLARE VARIABLE ici_LastMessageID INTEGER;
DECLARE VARIABLE ici_LastUserID INTEGER;
DECLARE VARIABLE ici_LastUserName varchar(128);
DECLARE VARIABLE ici_ParentID INTEGER;
DECLARE VARIABLE ici_LastPosted TIMESTAMP;
DECLARE VARIABLE ici_LastTopicID_Check INTEGER;
DECLARE VARIABLE ici_LastMessageID_Check INTEGER;
DECLARE  itmpTopicID INTEGER;

BEGIN       
		-- Maybe an idea to use cascading foreign keys instead? Too bad they don't work on MS SQL 7.0...
	update  objQual_FORUM set LastMessageID=null,LastTopicID = NULL where FORUMID=:I_FORUMOLDID;
	update  objQual_ACTIVE set FORUMID=:I_FORUMNEWID where FORUMID=:I_FORUMOLDID;
	update  objQual_NNTPFORUM set FORUMID=:I_FORUMNEWID where FORUMID=:I_FORUMOLDID;
	update  objQual_WATCHFORUM set FORUMID=:I_FORUMNEWID where FORUMID=:I_FORUMOLDID;
	delete from objQual_FORUMREADTRACKING where FORUMID = :I_FORUMOLDID;
  
   SELECT LASTMESSAGEID
   FROM objQual_FORUM
   WHERE FORUMID = :I_FORUMOLDID
   INTO :ici_LastMessageID;
   
     FOR SELECT   TOPICID
		FROM     objQual_TOPIC
		WHERE    FORUMID = :I_FORUMOLDID
		ORDER BY TOPICID DESC
		INTO :itmpTopicID
		DO
		BEGIN
		EXECUTE PROCEDURE objQual_TOPIC_MOVE :itmpTopicID, :I_FORUMNEWID, 0;        
		END  

			/* TopicDelete finished*/ 
	  
		DELETE FROM objQual_FORUMACCESS
		WHERE       FORUMID = :I_FORUMOLDID;
	  
		/*Delete UserForums*/

		DELETE FROM objQual_USERFORUM
		WHERE       FORUMID = :I_FORUMOLDID;

		DELETE FROM objQual_FORUM
		WHERE       FORUMID = :I_FORUMOLDID;
		/* Forum on update */
		SELECT PARENTID FROM  objQual_FORUM
		WHERE FORUMID = :I_FORUMNEWID
		INTO :ici_ParentID;
		
		IF (ici_ParentID > 0) THEN
		BEGIN
		SELECT  FIRST 1 DISTINCT LASTPOSTED         
		FROM  objQual_FORUM
		WHERE PARENTID = :ici_ParentID ORDER BY LASTPOSTED DESC
		INTO :ici_LastPosted ;
		
		IF (ici_LastPosted IS NOT NULL) THEN 
		BEGIN
		SELECT  FIRST 1 DISTINCT FORUMID 
		FROM  objQual_FORUM
		WHERE LASTPOSTED = :ici_LastPosted 
		ORDER BY FORUMID DESC
		INTO :ici_ParentID;
		EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST :ici_ParentID;
		EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ParentID;
		END        
		END 

	END;
--GO
 


CREATE  PROCEDURE objQual_BOARD_STATS
	(I_BOARDID INTEGER)
	RETURNS
	(
"NumPosts" integer,
"NumTopics" integer,
"NumUsers" integer,
"BoardStart" timestamp
)
	AS
BEGIN
	IF (I_BOARDID IS NULL) THEN
		SELECT
		(SELECT COUNT(1) FROM objQual_MESSAGE where ISAPPROVED = 1 AND ISDELETED = 0) AS NUMPOSTS,
		(SELECT COUNT(1) FROM objQual_TOPIC where ISDELETED = 0) AS "NumTopics",
		(SELECT COUNT(1) FROM objQual_USER where ISAPPROVED = 1) AS "NumUsers",
		(SELECT min(JOINED) FROM objQual_USER) AS "BoardStart" FROM RDB$DATABASE
		INTO
		:"NumPosts",
		:"NumTopics",
		:"NumUsers",
		:"BoardStart";
	
	ELSE
		
		SELECT
		(SELECT COUNT(1) FROM  objQual_MESSAGE a
		JOIN objQual_TOPIC b ON a.TOPICID=b.TOPICID
		JOIN objQual_FORUM c ON b.FORUMID=c.FORUMID
		JOIN objQual_CATEGORY d ON c.CATEGORYID=d.CATEGORYID
		WHERE a.ISAPPROVED = 1 
				  AND a.ISDELETED = 0 
				  AND b.ISDELETED = 0 
				  AND d.BOARDID=:I_BOARDID) AS "NumPosts",
		(SELECT COUNT(1) FROM objQual_TOPIC a
		JOIN objQual_FORUM b ON a.FORUMID=b.FORUMID
		JOIN objQual_CATEGORY c ON b.CATEGORYID=c.CATEGORYID
		WHERE c.BOARDID=:I_BOARDID 
				  AND a.ISDELETED = 0) AS "NumTopics",
		(SELECT COUNT(1) from objQual_USER 
				WHERE ISAPPROVED = 1 
				   AND BOARDID=:I_BOARDID) AS "NumUsers",
			(SELECT MIN(JOINED) FROM objQual_USER where BOARDID=:I_BOARDID) AS "BoardStart"  
			FROM RDB$DATABASE
			INTO
		:"NumPosts",
		:"NumTopics",
		:"NumUsers",
		:"BoardStart";
	SUSPEND;
END;
--GO

CREATE  PROCEDURE objQual_CATEGORY_DELETE(
				I_CATEGORYID INTEGER)
				RETURNS(OUT_FLAG INTEGER)
				AS                
BEGIN
		
		IF (EXISTS (SELECT 1
				   FROM   objQual_FORUM
				   WHERE  CATEGORYID = :I_CATEGORYID)) THEN       
			OUT_FLAG = 0;       
		ELSE
			DELETE FROM objQual_CATEGORY
			WHERE       CATEGORYID = :I_CATEGORYID;
			 OUT_FLAG = 1;        
	   SUSPEND;
	END;
--GO

 create procedure objQual_CATEGORY_LIST(I_BOARDID INTEGER,I_CATEGORYID INTEGER) 
returns (
  "CategoryID" INTEGER,
  "BoardID" INTEGER,
  "Name" VARCHAR(128) CHARACTER SET UTF8,
  "CategoryImage" VARCHAR(255) CHARACTER SET UTF8,
  "SortOrder" INTEGER,
  "PollGroupID" INTEGER)
as
begin
	if (I_CATEGORYID is null) THEN
		FOR select * from objQual_CATEGORY 
		where BOARDID = :I_BOARDID 
		order by SORTORDER
		INTO :"CategoryID",
			 :"BoardID",
			 :"Name",
			 :"CategoryImage",
			 :"SortOrder",
			 :"PollGroupID"
			 DO
			 SUSPEND;
	else
		FOR select * from objQual_CATEGORY 
		where BOARDID = :I_BOARDID 
		and CATEGORYID = :I_CATEGORYID
		INTO :"CategoryID",
			 :"BoardID",
			 :"Name",
			 :"CategoryImage",
			 :"SortOrder",
			 :"PollGroupID"
			 DO
			 SUSPEND;
end;
--GO



CREATE  PROCEDURE objQual_CATEGORY_LISTREAD(
I_BOARDID    INTEGER,
I_USERID     INTEGER,
I_CATEGORYID INTEGER)
RETURNS
(
"CategoryID" integer,
"Name" VARCHAR(128),
"CategoryImage" VARCHAR(255)
)
AS
BEGIN
FOR SELECT   a.CATEGORYID,
a.NAME,
a.CATEGORYIMAGE
FROM     objQual_CATEGORY a
JOIN objQual_FORUM b
ON b.CATEGORYID = a.CATEGORYID
JOIN objQual_ACTIVEACCESS v
ON v.FORUMID = b.FORUMID
WHERE    a.BOARDID = :I_BOARDID
AND v.USERID = :I_USERID
AND (v.READACCESS <> 0
OR BIN_AND(b.FLAGS, 2) = 0)
AND (:I_CATEGORYID IS NULL
OR a.CATEGORYID = :I_CATEGORYID)
AND b.PARENTID IS NULL
GROUP BY a.CATEGORYID,a.NAME,a.SORTORDER,
a.CATEGORYIMAGE
ORDER BY a.SORTORDER
INTO
:"CategoryID",
:"Name",
:"CategoryImage"
DO SUSPEND;
END;
--GO



CREATE PROCEDURE objQual_CATEGORY_SAVE
(
I_BOARDID    INTEGER,
I_CATEGORYID INTEGER,
I_NAME       VARCHAR(128),
I_SORTORDER  SMALLINT,
I_CATEGORYIMAGE VARCHAR(255)
)
RETURNS ("CategoryID" INTEGER)
AS
BEGIN
IF (I_CATEGORYID > 0) THEN
BEGIN
UPDATE objQual_CATEGORY
SET    NAME = :I_NAME,
CATEGORYIMAGE = :I_CATEGORYIMAGE,
SORTORDER = :I_SORTORDER
WHERE  CATEGORYID = :I_CATEGORYID;
SELECT :I_CATEGORYID  FROM RDB$DATABASE
INTO :"CategoryID";
END
ELSE
BEGIN
SELECT NEXT VALUE FOR SEQ_objQual_CATEGORY_CATEGORYID FROM RDB$DATABASE INTO :"CategoryID";
INSERT INTO objQual_CATEGORY
(CATEGORYID,BOARDID,
NAME,
CATEGORYIMAGE,
SORTORDER)
VALUES     (:"CategoryID",:I_BOARDID,
:I_NAME,
:I_CATEGORYIMAGE,
:I_SORTORDER);
END
END;
--GO

CREATE  PROCEDURE objQual_CATEGORY_SIMPLELIST(
I_STARTID INTEGER,
I_LIMIT   INTEGER)
RETURNS ("CategoryID" INTEGER,
"Name" VARCHAR(128))
AS
BEGIN
FOR SELECT   FIRST (:I_LIMIT) 
c.CATEGORYID,
c.NAME
FROM     objQual_CATEGORY c
WHERE    c.CATEGORYID >= :I_STARTID
AND c.CATEGORYID < (:I_LIMIT+:I_STARTID)
		ORDER BY c.CATEGORYID
		INTO :"CategoryID",
			 :"Name"
			 DO SUSPEND;            
END;
--GO

CREATE PROCEDURE objQual_CHECKEMAIL_LIST
(
I_EMAIL VARCHAR(128)
)
RETURNS
(
	"CheckEmailID" integer,
	"UserID" integer,
	"Email" VARCHAR(128),
	"Created" timestamp,
	"Hash" VARCHAR(32)
)
AS
BEGIN
IF (I_EMAIL IS NULL) THEN
FOR SELECT * FROM objQual_CHECKEMAIL
INTO
	:"CheckEmailID",
	:"UserID",
	:"Email",
	:"Created",
	:"Hash"
	 DO SUSPEND;
ELSE
FOR SELECT * FROM objQual_CHECKEMAIL WHERE "EMAIL" = LOWER(:I_EMAIL)
INTO
	:"CheckEmailID",
	:"UserID",
	:"Email",
	:"Created",
	:"Hash"
	 DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_CHECKEMAIL_SAVE
(
I_USERID INTEGER,
I_HASH VARCHAR(32),
I_EMAIL VARCHAR(128),
I_UTCTIMESTAMP TIMESTAMP
)
AS
BEGIN
INSERT INTO objQual_CHECKEMAIL
(CHECKEMAILID,USERID,"EMAIL",CREATED,"HASH")
VALUES
(
(SELECT NEXT VALUE FOR SEQ_objQual_CHECKEMAIL_CHECKEMAILID 
FROM RDB$DATABASE),
:I_USERID,LOWER(:I_EMAIL),:I_UTCTIMESTAMP,:I_HASH);
END;
--GO


CREATE procedure objQual_CHECKEMAIL_UPDATE(I_HASH VARCHAR(32))
RETURNS
(
	"ProviderUserKey" VARCHAR(64),    
	"Email" VARCHAR(128)   
)
AS
DECLARE l_UserID INTEGER;
DECLARE l_CheckEmailID INTEGER;
DECLARE l_Email VARCHAR(128);
BEGIN


l_UserID = NULL;

SELECT
CHECKEMAILID,
USERID,
"EMAIL"
FROM
objQual_CHECKEMAIL
WHERE
"HASH" = :I_HASH
INTO :l_CheckEmailID,:l_UserID,:l_Email;

IF (l_UserID IS NULL) THEN
SELECT CAST(NULL AS CHAR(64)), 
CAST(NULL AS CHAR(255)) FROM RDB$DATABASE
INTO :"ProviderUserKey",:"Email";
ELSE
BEGIN
/*Update new user email*/
UPDATE objQual_USER 
SET "EMAIL" = LOWER(:l_Email), 
FLAGS = BIN_OR(FLAGS, 2)  
WHERE USERID = :l_UserID;
DELETE FROM objQual_CHECKEMAIL 
WHERE CHECKEMAILID = :l_CheckEmailID;

/*return the UserProviderKey*/
SELECT UUID_TO_CHAR(PROVIDERUSERKEY), "EMAIL" FROM objQual_USER 
WHERE USERID = :l_UserID
INTO :"ProviderUserKey",:"Email";
END
SUSPEND;
END;
--GO

/*polls*/

CREATE PROCEDURE objQual_CHOICE_ADD(
I_POLLID		INTEGER,
I_CHOICE		VARCHAR(128),
I_OBJECTPATH    VARCHAR(255),
I_MIMETYPE      VARCHAR(50)
)
AS
BEGIN

INSERT INTO objQual_CHOICE
(CHOICEID,POLLID, CHOICE, VOTES, OBJECTPATH, MIMETYPE)
VALUES
((SELECT NEXT VALUE FOR SEQ_objQual_CHOICE_CHOICEID 
FROM RDB$DATABASE),:I_POLLID, :I_CHOICE, 0, :I_OBJECTPATH, :I_MIMETYPE);

END;
--GO


CREATE procedure objQual_CHOICE_DELETE(
I_CHOICEID	INTEGER
)
AS
BEGIN
DELETE FROM objQual_CHOICE
WHERE CHOICEID = :I_CHOICEID;
END;
--GO


CREATE PROCEDURE objQual_CHOICE_UPDATE(
I_CHOICEID	INTEGER,
I_CHOICE	VARCHAR(128),
I_OBJECTPATH    VARCHAR(255),
I_MIMETYPE      VARCHAR(50)
)
AS
BEGIN

UPDATE objQual_CHOICE
SET CHOICE = :I_CHOICE,
OBJECTPATH = :I_OBJECTPATH,
MIMETYPE = :I_MIMETYPE
WHERE CHOICEID = :I_CHOICEID;
END;

--GO



CREATE PROCEDURE objQual_CHOICE_VOTE
(I_CHOICEID INTEGER,I_USERID INTEGER, I_REMOTEIP VARCHAR(39))
AS
DECLARE l_PollID INTEGER;
BEGIN

SELECT POLLID FROM objQual_CHOICE 
WHERE CHOICEID = :I_CHOICEID INTO :l_PollID;

IF (I_USERID IS NULL) THEN
BEGIN
IF (I_REMOTEIP IS NOT NULL) THEN
INSERT INTO objQual_POLLVOTE (POLLVOTEID,POLLID, USERID, REMOTEIP,CHOICEID) 
VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_POLLVOTE_POLLVOTEID 
FROM RDB$DATABASE),:l_PollID,NULL,:I_REMOTEIP,:I_CHOICEID);
END
ELSE
INSERT INTO objQual_POLLVOTE (POLLVOTEID,POLLID, USERID, REMOTEIP, CHOICEID) 
VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_POLLVOTE_POLLVOTEID 
FROM RDB$DATABASE),:l_PollID,:I_USERID,:I_REMOTEIP,:I_CHOICEID);


UPDATE objQual_CHOICE SET VOTES = VOTES + 1 
WHERE CHOICEID = :I_CHOICEID;
END;
--GO

CREATE  PROCEDURE objQual_EVENTLOG_CREATE(
I_USERID      INTEGER,
I_SOURCE      VARCHAR(128),
I_DESCRIPTION BLOB SUB_TYPE 1,
I_TYPE        INTEGER,
I_UTCTIMESTAMP TIMESTAMP)
AS
DECLARE topLogID INTEGER;
DECLARE recCount INTEGER;
BEGIN
INSERT INTO objQual_EVENTLOG
(EVENTLOGID, EVENTTIME, USERID,
SOURCE,
DESCRIPTION,
"TYPE")
VALUES     
((SELECT NEXT VALUE FOR SEQ_objQual_EVENTLOG_EVENTLOGID 
FROM RDB$DATABASE), :I_UTCTIMESTAMP,:I_USERID,
:I_SOURCE,
:I_DESCRIPTION,
:I_TYPE);
/*delete entries older than 10 days*/
DELETE FROM objQual_EVENTLOG
WHERE  DATEDIFF(DAY, :I_UTCTIMESTAMP, EVENTTIME) > 10;

	   /*or if there are more then 1000*/
	  SELECT COUNT(*)
		   FROM   objQual_EVENTLOG INTO :recCount;
		   
		IF (recCount >= 1050) THEN
			BEGIN
		  DELETE FROM objQual_EVENTLOG WHERE EVENTLOGID IN (SELECT  FIRST 100 EVENTLOGID FROM objQual_EVENTLOG ORDER BY EVENTTIME) ;             
		   
	  --     SELECT  FIRST 1 DISTINCT EVENTLOGID  FROM  objQual_EVENTLOG ORDER BY EVENTLOGID INTO :topLogID ; 
		   
	   --    DELETE FROM objQual_EVENTLOG
	   --    WHERE       EVENTLOGID BETWEEN "topLogID"  AND "topLogID"  +100;
	   END
		
	END;
--GO

CREATE  PROCEDURE objQual_EVENTLOG_DELETE
 (
	I_EVENTLOGID INTEGER, 
	I_BOARDID  INTEGER
 ) 
 AS
 BEGIN
	 /*either EventLogID or BoardID must be null, not both at the same time*/
	if (I_EVENTLOGID IS NULL) THEN 
		/* delete all events of this board*/
		DELETE FROM objQual_EVENTLOG
		WHERE
			(USERID IS NULL or
			USERID IN (SELECT USERID FROM objQual_USER WHERE BOARDID=:I_BOARDID));
	
	ELSE 
		 /*delete just one event*/
		DELETE FROM objQual_EVENTLOG WHERE EVENTLOGID=:I_EVENTLOGID;
	
 END;
--GO

CREATE PROCEDURE objQual_EXTENSION_DELETE (I_EXTENSIONID INTEGER) 
 AS
 BEGIN
	DELETE FROM objQual_EXTENSION 
	WHERE EXTENSIONID = :I_EXTENSIONID;
 END;
--GO




 CREATE PROCEDURE objQual_EXTENSION_EDIT (I_EXTENSIONID INTEGER)
 RETURNS
 (
 "ExtensionID" INTEGER,
  "BoardID" INTEGER,
  "Extension" VARCHAR(10)
 )
 AS
 BEGIN
	SELECT * 
	FROM objQual_EXTENSION 
	WHERE EXTENSIONID = :I_EXTENSIONID 
	ORDER BY EXTENSION
	INTO :"ExtensionID",
		 :"BoardID",
		 :"Extension";
		 SUSPEND;
 END;
--GO





 CREATE PROCEDURE objQual_FORUM_LISTALL_FROMCAT(I_BOARDID INTEGER,I_CATEGORYID INTEGER) 
 RETURNS
 (
"CategoryID" integer,
"Category" varchar(255),
"ForumID" integer,
"Forum" varchar(128),
"ParentID" integer
)
 AS
 BEGIN
	FOR SELECT     b.CATEGORYID, 
			   b.NAME AS "Category", 
			   a.FORUMID, 
			   a.NAME AS "Forum", 
			   a.PARENTID
	FROM         objQual_FORUM a 
		INNER JOIN
			 objQual_CATEGORY b ON b.CATEGORYID = a.CATEGORYID
		WHERE
			b.CATEGORYID=:I_CATEGORYID and
			b.BOARDID=:I_BOARDID
		ORDER BY
			b.SORTORDER,
			a.SORTORDER
			INTO
			"CategoryID",
:"Category",
:"ForumID",
:"Forum",
:"ParentID"
DO SUSPEND;
 END;
--GO


CREATE PROCEDURE objQual_FORUM_LISTALLMYMODERATED(I_BOARDID INTEGER,I_USERID INTEGER)
RETURNS
(
"CategoryID" integer,
"Category" varchar(255),
"ForumID" integer,
"Forum" varchar(128),
"Indent" integer
)
AS
BEGIN
 FOR	SELECT
		b.CATEGORYID,
		b.NAME AS "Category",
		a.FORUMID,
		a.NAME AS "Forum",
		x.INDENT
	FROM
		(SELECT
			b.FORUMID,
			(SELECT 0 FROM RDB$DATABASE) AS INDENT
		FROM
			objQual_CATEGORY a
			JOIN objQual_FORUM b ON b.CATEGORYID=a.CATEGORYID
		WHERE
			a.BOARDID=:I_BOARDID AND
			b.PARENTID IS NULL
	
		UNION
	
		SELECT
			b.FORUMID,
			(SELECT 1  FROM RDB$DATABASE) AS INDENT
		FROM
			objQual_CATEGORY a
			JOIN objQual_FORUM b on b.CATEGORYID=a.CATEGORYID
			JOIN objQual_FORUM c on c.PARENTID=b.FORUMID
		WHERE
			a.BOARDID=:I_BOARDID and
			b.PARENTID IS NULL
	
		UNION
	
		SELECT
			d.FORUMID,
			(SELECT 2 FROM RDB$DATABASE) AS INDENT 
		FROM
			objQual_CATEGORY a
			JOIN objQual_FORUM b ON b.CATEGORYID=a.CATEGORYID
			JOIN objQual_FORUM c ON c.PARENTID=b.FORUMID
			JOIN objQual_FORUM d ON d.PARENTID=c.FORUMID
		WHERE
			a.BOARDID=:I_BOARDID AND
			b.PARENTID IS NULL
		) AS x
		JOIN objQual_FORUM a ON a.FORUMID=x.FORUMID
		JOIN objQual_CATEGORY b ON b.CATEGORYID=a.CATEGORYID
		JOIN objQual_ACTIVEACCESS c ON c.FORUMID=a.FORUMID
	WHERE
		c.USERID=:I_USERID AND
		b.BOARDID=:I_BOARDID AND
		c.MODERATORACCESS>0
	ORDER BY
		b.SORTORDER,
		a.SORTORDER
		INTO
		:"CategoryID",
		:"Category",
		:"ForumID",
		:"Forum",
		:"Indent"
		DO SUSPEND;
END;
--GO
CREATE PROCEDURE objQual_FORUM_LISTSUBFORUMS(I_FORUMID INTEGER)
RETURNS ("Subforums" INTEGER)
AS
BEGIN
SELECT SUM(1) FROM objQual_FORUM WHERE PARENTID = :I_FORUMID INTO "Subforums";
SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_FORUM_LISTTOPICS(I_FORUMID INTEGER)
RETURNS
 (
"TopicID" integer,
"ForumID" integer,
"UserID"  integer,
"UserName" varchar(128),
"Posted" timestamp,
"Topic" varchar(128),
"Description" varchar(255),
"Views" integer,
"Priority" integer,
"PollID" integer,
"TopicMovedID" integer,
"LastPosted" timestamp,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" varchar(128),
"NumPosts" integer,
"Flags" integer,
"IsDeleted" BOOL,
"IsQuestion" BOOL,
"AnswerMessageID" INTEGER,
"LastMessageFlags" integer,
"TopicImage" varchar(128),
"PollGroupID" integer
)
AS
BEGIN
FOR SELECT
    TOPICID,
    FORUMID,
    USERID,
    USERNAME, 
    POSTED,
    TOPIC,
    DESCRIPTION,
    VIEWS,
   "PRIORITY",
    POLLID,
    TOPICMOVEDID,
    LASTPOSTED,
    LASTMESSAGEID,
    LASTUSERID,
    LASTUSERNAME,
    NUMPOSTS,
    FLAGS,
    ISDELETED,
    ISQUESTION, 
    ANSWERMESSAGEID,
    LASTMESSAGEFLAGS,	
    TOPICIMAGE,
	POLLID
from objQual_TOPIC
WHERE FORUMID = :I_FORUMID
INTO
:"TopicID",
:"ForumID",
:"UserID",
:"UserName",
:"Posted",
:"Topic",
:"Description",
:"Views",
:"Priority",
:"PollID",
:"TopicMovedID",
:"LastPosted",
:"LastMessageID",
:"LastUserID",
:"LastUserName",
:"NumPosts",
:"Flags",
:"IsDeleted",
:"IsQuestion",
:"AnswerMessageID",
:"LastMessageFlags",
:"TopicImage",
:"PollGroupID"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_FORUM_MODERATELIST(I_BOARDID INTEGER,I_USERID INTEGER) 
 RETURNS
 (
"ForumID" integer,
"CategoryID" integer,
"ParentID" integer,
"Name" VARCHAR(128),
"Description" VARCHAR(255),
"ImageUrl" VARCHAR(128),
"Styles"VARCHAR(255),
"SortOrder" INTEGER,
"LastPosted" timestamp,
"LastTopicID" integer,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" VARCHAR(128),
"NumTopics" integer,
"NumPosts" integer,
"RemoteURL" VARCHAR(128),
"Flags" integer,
"ThemeURL" VARCHAR(128),
"PollGroupID" integer,
"UserID" integer,
"IsLocked" integer,
"IsHidden" integer,	
"IsNoCount" integer,
"IsModerated" integer,
"MessageCount" integer,
"ReportedCount" integer
)
 AS 
 BEGIN
 
 FOR SELECT
		 b.FORUMID,
         b.CATEGORYID,
         b.PARENTID,
         b.NAME, 
         b.DESCRIPTION,
         b.IMAGEURL,
         b.STYLES,
         b.SORTORDER,
         b.LASTPOSTED,
         b.LASTTOPICID,
         b.LASTMESSAGEID,
         b.LASTUSERID,
         b.LASTUSERNAME,
         b.NUMTOPICS,
         b.NUMPOSTS,
         b.REMOTEURL,
         b.FLAGS,
         b.THEMEURL,
         b.POLLGROUPID,
         b.USERID,
         b.ISLOCKED,
         b.ISHIDDEN,
         b.ISNOCOUNT,
         b.ISMODERATED,
		(SELECT     COUNT(objQual_MESSAGE.MESSAGEID)
		FROM         objQual_MESSAGE 
				INNER JOIN  objQual_TOPIC 
				ON objQual_MESSAGE.TOPICID =objQual_TOPIC.TOPICID
		WHERE (BIN_AND(objQual_MESSAGE.FLAGS, 16)=0) 
		and (BIN_AND(objQual_MESSAGE.FLAGS, 8)=0) 
		AND (BIN_AND(objQual_TOPIC.FLAGS, 8) = 0) 
		AND (objQual_TOPIC.FORUMID=b.FORUMID)) AS "MessageCount", 
		-- here was added flag 9 if 8 then add 256	to flags
				(SELECT     count(objQual_MESSAGE.MESSAGEID)
		FROM         objQual_MESSAGE 
				INNER JOIN  objQual_TOPIC 
				ON objQual_MESSAGE.TOPICID = objQual_TOPIC.TOPICID
		WHERE (BIN_AND(objQual_MESSAGE.FLAGS, 128)=128) 
				AND (BIN_AND(objQual_MESSAGE.FLAGS, 8)=0) 
				AND (BIN_AND(objQual_TOPIC.FLAGS, 8) = 0) 
				AND (objQual_TOPIC.FORUMID=b.FORUMID)) AS "ReportedCount" 		
			FROM
		objQual_CATEGORY a 
			JOIN objQual_FORUM b 
			ON b.CATEGORYID=a.CATEGORYID
			JOIN objQual_ACTIVEACCESS c 
			ON c.FORUMID=b.FORUMID 
			WHERE
		a.BOARDID=:I_BOARDID AND
		c.MODERATORACCESS>0 AND
		c.USERID=:I_USERID
			ORDER BY
		a.SORTORDER,
		b.SORTORDER
		INTO
		:"ForumID",
		:"CategoryID",
		:"ParentID",
		:"Name",
		:"Description",
		:"ImageUrl" ,
		:"Styles",
		:"SortOrder",
		:"LastPosted",
		:"LastTopicID",
		:"LastMessageID",
		:"LastUserID",
		:"LastUserName",
		:"NumTopics",
		:"NumPosts",
		:"RemoteURL",
		:"Flags",
		:"ThemeURL",
		:"PollGroupID",
		:"UserID",
		:"IsLocked",
		:"IsHidden",	
		:"IsNoCount",
		:"IsModerated",		
		:"MessageCount",     
		:"ReportedCount"
		DO SUSPEND;
 END;
--GO

CREATE PROCEDURE objQual_FORUM_SAVE(
	I_FORUMID 		INTEGER,
	I_CATEGORYID		INTEGER,
	I_PARENTID		INTEGER,
	I_NAME			VARCHAR(128),
	I_DESCRIPTION	        VARCHAR(255),
	I_SORTORDER		SMALLINT,
	I_LOCKED			BOOL,
	I_HIDDEN			BOOL,
	I_ISTEST			BOOL,
	I_MODERATED		BOOL,
	I_REMOTEURL		varchar(128),
	I_THEMEURL		varchar(128),
	I_IMAGEURL      varchar(128),
	I_STYLES        varchar(255),
	I_ACCESSMASKID	INTEGER 
 )
 RETURNS (o_ForumID INTEGER)
 AS	
	 DECLARE l_Flags	INTEGER;
	 
BEGIN 	
	
	l_Flags = 0;
	IF (:I_LOCKED<>0) THEN l_Flags = BIN_OR(l_Flags, 1);
	IF (:I_HIDDEN<>0) THEN  l_Flags = BIN_OR(l_Flags, 2);
	IF (:I_ISTEST<>0) THEN  l_Flags = BIN_OR(l_Flags, 4);
	IF (:I_MODERATED<>0) THEN  l_Flags = BIN_OR(l_Flags, 8);
	IF (:I_FORUMID IS NULL) THEN I_FORUMID = 0;
	IF (:I_PARENTID = 0) THEN I_PARENTID = null;
  IF (:I_FORUMID>0) THEN
  UPDATE objQual_FORUM
  SET
  PARENTID=:I_PARENTID,
  NAME= :I_NAME,
  DESCRIPTION=:I_DESCRIPTION,
  SORTORDER=:I_SORTORDER,
  CATEGORYID=:I_CATEGORYID,
  REMOTEURL = :I_REMOTEURL,
  THEMEURL = :I_THEMEURL,
  FLAGS = :l_Flags,
  IMAGEURL = :I_IMAGEURL,
  STYLES = :I_STYLES
  WHERE FORUMID=:I_FORUMID;
  ELSE
  BEGIN
 
  SELECT NEXT VALUE FOR SEQ_objQual_FORUM_FORUMID FROM RDB$DATABASE INTO :I_FORUMID;
  INSERT INTO objQual_FORUM(FORUMID,PARENTID,NAME,DESCRIPTION,SORTORDER,CATEGORYID,NUMTOPICS,NUMPOSTS,REMOTEURL,THEMEURL,FLAGS, IMAGEURL,
  STYLES)
  VALUES(:I_FORUMID,:I_PARENTID,:I_NAME,:I_DESCRIPTION,:I_SORTORDER,:I_CATEGORYID,0,0,:I_REMOTEURL,:I_THEMEURL,:l_Flags,:I_IMAGEURL,:I_STYLES); 

  INSERT INTO objQual_FORUMACCESS(GROUPID,FORUMID,ACCESSMASKID)
  SELECT GROUPID,(SELECT :I_FORUMID FROM RDB$DATABASE),(SELECT :I_ACCESSMASKID FROM RDB$DATABASE)
  FROM objQual_GROUP
  WHERE BOARDID IN (SELECT BOARDID  from objQual_CATEGORY
  WHERE CATEGORYID=:I_CATEGORYID);
  END
  o_ForumID=I_FORUMID;
  SUSPEND;
  END;
--GO

CREATE PROCEDURE objQual_FORUM_SIMPLELIST(
				 I_STARTID INTEGER,
				 I_LIMIT   INTEGER)                 
RETURNS                
				 (
"ForumID" integer,
"Name" VARCHAR(128)
)
 AS
  DECLARE l_Limit INTEGER DEFAULT 500;
  DECLARE l_StartID INTEGER DEFAULT 0;
  BEGIN   
		IF (I_STARTID IS NOT NULL) THEN l_StartID =I_STARTID ;
		IF (I_LIMIT IS NOT NULL) THEN l_Limit=I_LIMIT;              
		   
		 FOR  
		 SELECT 
		   FIRST (:l_Limit) SKIP (:l_StartID)
				  f.FORUMID,
				  f.NAME
		 FROM     objQual_FORUM f
		 WHERE    f.FORUMID >= :l_StartID
		 AND f.FORUMID < (:l_StartID + :l_Limit)
		 ORDER BY f.FORUMID
		 INTO
		 :"ForumID",
		 :"Name"
		 DO       
		 SUSPEND;           
	 END;
 --GO
 
CREATE PROCEDURE objQual_FORUMACCESS_GROUP(I_GROUPID INTEGER) 
RETURNS
(
"GroupID" integer,
"ForumID" integer,
"AccessMaskID" integer,
"ForumName"  VARCHAR(128),
"CategoryName" VARCHAR(128),
"CategoryID" integer,
"ParentID" integer,
"BoardName"  VARCHAR(256)
)
AS
 BEGIN
	FOR SELECT 
		a.*,
		 b.NAME AS "ForumName",
		 c.NAME AS "CategoryName",
		 b.CATEGORYID AS "CategoryID",
		 b.PARENTID AS "ParentID",
		 brd.NAME
	FROM 
		objQual_FORUMACCESS a
		INNER JOIN objQual_FORUM b 
		on b.FORUMID=a.FORUMID
		INNER JOIN objQual_CATEGORY c 
		on c.CATEGORYID=b.CATEGORYID
		INNER JOIN objQual_BOARD brd 
		on brd.BOARDID=c.BOARDID
	WHERE 
		a.GROUPID = :I_GROUPID
	ORDER BY 
		brd.NAME,
		c.SORTORDER,
		b.SORTORDER
		INTO
		:"GroupID",
		:"ForumID",
		:"AccessMaskID",
		:"ForumName",
		:"CategoryName",
		:"CategoryID",
		:"ParentID",
		:"BoardName"
		DO SUSPEND;
 END;
--GO


CREATE  PROCEDURE objQual_FORUMACCESS_LIST(
				I_FORUMID INTEGER)
 RETURNS
  (
"GroupID" integer,
"ForumID" integer,
"AccessMaskID" integer,
"GroupName"  VARCHAR(128)
  )
AS                
BEGIN
	  FOR  SELECT a.*,
			   b.NAME AS "GroupName"
		FROM   objQual_FORUMACCESS a
			   INNER JOIN objQual_GROUP b 
			   ON b.GROUPID=a.GROUPID
		WHERE  a.FORUMID = :I_FORUMID
		INTO 
		:"GroupID",
		:"ForumID",
		:"AccessMaskID",
		:"GroupName"
		DO SUSPEND;     
END;
--GO


CREATE  PROCEDURE objQual_FORUMACCESS_SAVE(
				I_FORUMID      INTEGER,
				I_GROUPID      INTEGER,
				I_ACCESSMASKID INTEGER)
 AS
BEGIN
		UPDATE objQual_FORUMACCESS
		SET    ACCESSMASKID = :I_ACCESSMASKID
		WHERE  FORUMID = :I_FORUMID
		AND GROUPID = :I_GROUPID;
	END;
--GO

  CREATE  PROCEDURE objQual_GROUP_DELETE(
		I_GROUPID INTEGER)
		AS
		BEGIN
		DELETE FROM objQual_FORUMACCESS
		WHERE       GROUPID = :I_GROUPID;
		DELETE FROM objQual_USERGROUP
		WHERE       GROUPID = :I_GROUPID;
		DELETE FROM objQual_GROUP
		WHERE       GROUPID = :I_GROUPID;
		END;

--GO

 CREATE  PROCEDURE objQual_GROUP_LIST(
		I_BOARDID INTEGER,
		I_GROUPID INTEGER        
		)
		RETURNS
		(
"GroupID" integer,
"BoardID" integer,
"Name" VARCHAR(128),
"Flags" integer,
"PMLimit" integer,
"Style" varchar(255),
"SortOrder" integer,
"Description" varchar(128),
"UsrSigChars" integer,
"UsrSigBBCodes"  varchar(255),
"UsrSigHTMLTags" varchar(255),
"UsrAlbums" integer,
"UsrAlbumImages"  integer                 
)
		AS
		BEGIN

		IF (I_GROUPID IS NULL) THEN
		FOR SELECT *
		FROM   objQual_GROUP
		WHERE  BOARDID = :I_BOARDID ORDER BY SORTORDER
		INTO
		:"GroupID",
		:"BoardID",
		:"Name",
		:"Flags",
		:"PMLimit",
		:"Style",
		:"SortOrder",
		:"Description",
		:"UsrSigChars",
		:"UsrSigBBCodes",
		:"UsrSigHTMLTags",
		:"UsrAlbums",
		:"UsrAlbumImages"     
		DO SUSPEND;
		ELSE
		FOR SELECT *
		FROM   objQual_GROUP
		WHERE  BOARDID = :I_BOARDID
		AND GROUPID = :I_GROUPID
		INTO
		:"GroupID",
		:"BoardID",
		:"Name",
		:"Flags",
		:"PMLimit",
		:"Style",
		:"SortOrder",
		:"Description",
		:"UsrSigChars",
		:"UsrSigBBCodes",
		:"UsrSigHTMLTags",
		:"UsrAlbums",
		:"UsrAlbumImages"   
		DO SUSPEND;
		END;
--GO
CREATE PROCEDURE
 objQual_GROUP_MEDAL_DELETE
	(I_GROUPID INTEGER,
	I_MEDALID INTEGER)
	AS
 BEGIN
 
	DELETE FROM objQual_GROUPMEDAL 
	WHERE GROUPID=:I_GROUPID 
	AND MEDALID=:I_MEDALID;
 
 END;
--GO
CREATE PROCEDURE objQual_GROUP_MEDAL_LIST
	(I_GROUPID INTEGER,
	I_MEDALID INTEGER)
	RETURNS
	(
"MedalID" integer,
"BoardID" integer,
"Name" varchar(128),
"MedalURL" varchar(255),
"RibbonURL" varchar(255),
"SmallMedalURL" varchar(255),
"SmallRibbonURL" varchar(255),
"SmallMedalWidth" integer,
"SmallMedalHeight" integer,
"SmallRibbonWidth" integer,
"SmallRibbonHeight" integer,
"SortOrder" INTEGER,
"Flags" integer,
"GroupName" VARCHAR(128),
"GroupID" integer,
"Message" BLOB SUB_TYPE 1,
"MessageEx" BLOB SUB_TYPE 1,
"Hide" BOOL,
"OnlyRibbon" BOOL,
"CurrentSortOrder" smallint
)
	AS
 BEGIN
 
	FOR SELECT 
		a.MEDALID,
		a.BOARDID,
		a.NAME,
		a.MEDALURL,
		a.RIBBONURL,
		a.SMALLMEDALURL,
		a.SMALLRIBBONURL,
		a.SMALLMEDALWIDTH,
		a.SMALLMEDALHEIGHT,
		a.SMALLRIBBONWIDTH,
		a.SMALLRIBBONHEIGHT,
		b.SORTORDER,
		a.FLAGS,
		c.NAME AS "GroupName",
		b.GROUPID,
		COALESCE(b.MESSAGE,a.MESSAGE) AS "Message",
		b.MESSAGE AS "MessageEx",
		b.HIDE,
		b.ONLYRIBBON,
		b.SORTORDER AS "CurrentSortOrder"
	FROM
		objQual_MEDAL a
		INNER JOIN objQual_GROUPMEDAL b 
		ON b.MEDALID = a.MEDALID
		INNER JOIN objQual_GROUP c 
		ON  c.GROUPID = b.GROUPID
	WHERE
		(:I_GROUPID IS NULL OR b.GROUPID = :I_GROUPID) 
		AND
		(:I_MEDALID IS NULL OR b.MEDALID = :I_MEDALID)		
	ORDER BY
		c.NAME ASC,
		b.SORTORDER ASC
		INTO
		:"MedalID",
		:"BoardID",
		:"Name",
		:"MedalURL",
		:"RibbonURL",
		:"SmallMedalURL",
		:"SmallRibbonURL",
		:"SmallMedalWidth",
		:"SmallMedalHeight",
		:"SmallRibbonWidth",
		:"SmallRibbonHeight",
		:"SortOrder",
		:"Flags",
		:"GroupName",
		:"GroupID",
		:"Message",
		:"MessageEx",
		:"Hide",
		:"OnlyRibbon",
		:"CurrentSortOrder"
		DO SUSPEND;
 
END;
--GO

CREATE PROCEDURE objQual_GROUP_MEDAL_SAVE
	(I_GROUPID INTEGER,
	I_MEDALID INTEGER,
	I_MESSAGE varchar(128),
	I_HIDE BOOL,
	I_ONLYRIBBON BOOL,
	I_SORTORDER SMALLINT)
	AS
 BEGIN
 
	IF (EXISTS (SELECT 1 FROM objQual_GROUPMEDAL 
	WHERE GROUPID=:I_GROUPID AND MEDALID=:I_MEDALID)) THEN
		UPDATE objQual_GROUPMEDAL
		SET
			MESSAGE = :I_MESSAGE,
			HIDE = :I_HIDE,
			ONLYRIBBON = :I_ONLYRIBBON,
			SORTORDER = :I_SORTORDER
		WHERE
			GROUPID=:I_GROUPID and 
			MEDALID=:I_MEDALID;
	
	ELSE 
		INSERT INTO objQual_GROUPMEDAL
			(GROUPID,MEDALID,MESSAGE,HIDE,ONLYRIBBON,SORTORDER)
		VALUES
			(:I_GROUPID,:I_MEDALID,:I_MESSAGE,:I_HIDE,:I_ONLYRIBBON,:I_SORTORDER);
	
 
END;
--GO

CREATE  PROCEDURE objQual_GROUP_MEMBER(
		I_BOARDID INTEGER,
		I_USERID  INTEGER)
		RETURNS 
		(
		"GroupID" integer,
		"Name" varchar(128),
		"Member" integer
		)
		AS
		BEGIN
		FOR SELECT   
		a.GROUPID,
		a.NAME,
		(SELECT COUNT(1)
		FROM   objQual_USERGROUP x
		WHERE  x.USERID = :I_USERID
		AND x.GROUPID = a.GROUPID) AS "Member"
		FROM     objQual_GROUP a
		WHERE    a.BOARDID = :I_BOARDID
		ORDER BY a.NAME
		INTO
		:"GroupID",
		:"Name",
		:"Member"
		DO SUSPEND;
		END;
--GO

 CREATE  PROCEDURE objQual_GROUP_SAVE(
		I_GROUPID      INTEGER,
		I_BOARDID      INTEGER,
		I_NAME         VARCHAR(128),
		I_ISADMIN      BOOL,
		I_ISGUEST      BOOL,
		I_ISSTART      BOOL,
		I_ISMODERATOR  BOOL,
		I_ACCESSMASKID INTEGER, 
		I_PMLIMIT INTEGER, 
		I_STYLE VARCHAR(255), 
		I_SORTORDER INTEGER,
		I_DESCRIPTION VARCHAR(128),
		I_USRSIGCHARS INTEGER,
		I_USRSIGBBCODES VARCHAR(255),
		I_USRSIGHTMLTAGS VARCHAR(255),
		I_USRALBUMS INTEGER,
		I_USRALBUMIMAGES INTEGER)
		RETURNS (o_GroupID INTEGER)
		AS
		DECLARE VARIABLE iciFlags INTEGER DEFAULT 0;
		BEGIN

		
		iciFlags = 0;
		IF (:I_ISADMIN <> 0) THEN
		iciFlags = BIN_OR(iciFlags, 1) ;
		IF (:I_ISGUEST <> 0) THEN
		iciFlags = BIN_OR(iciFlags, 2);
		IF (:I_ISSTART <> 0) THEN
		iciFlags = BIN_OR(iciFlags, 4); 
		IF (:I_ISMODERATOR <> 0) THEN
		iciFlags = BIN_OR(iciFlags, 8); 
		IF (:I_GROUPID > 0 AND :I_GROUPID IS NOT NULL) THEN        
			UPDATE objQual_GROUP
			SET    NAME = :I_NAME,
				   FLAGS = :iciFlags,
				   PMLIMIT = :I_PMLIMIT,
				   STYLE = :I_STYLE,
				   SORTORDER = :I_SORTORDER,
				   DESCRIPTION = :I_DESCRIPTION,
				   USRSIGCHARS = :I_USRSIGCHARS,
				   USRSIGBBCODES = :I_USRSIGBBCODES,
				   USRSIGHTMLTAGS = :I_USRSIGHTMLTAGS,
				   USRALBUMS = :I_USRALBUMS,
				   USRALBUMIMAGES = :I_USRALBUMIMAGES
			WHERE  GROUPID = :I_GROUPID;        
		ELSE 
		BEGIN
			 SELECT NEXT VALUE FOR SEQ_objQual_GROUP_GROUPID 
			 FROM RDB$DATABASE INTO :I_GROUPID;  
			 INSERT INTO objQual_GROUP
					   (GROUPID,
						NAME,
						BOARDID,
						FLAGS,
						PMLIMIT,
						STYLE,
						SORTORDER,
						DESCRIPTION,
						USRSIGCHARS,
						USRSIGBBCODES,
						USRSIGHTMLTAGS,
						USRALBUMS,
						USRALBUMIMAGES)
			VALUES     (:I_GROUPID,
						:I_NAME,
						:I_BOARDID,
						:iciFlags,
						:I_PMLIMIT,
						:I_STYLE,
						:I_SORTORDER,
						:I_DESCRIPTION,
						:I_USRSIGCHARS,
						:I_USRSIGBBCODES,
						:I_USRSIGHTMLTAGS,
						:I_USRALBUMS,
						:I_USRALBUMIMAGES);            
			INSERT INTO objQual_FORUMACCESS
					   (GROUPID,
						FORUMID,
						ACCESSMASKID)
			SELECT (SELECT :I_GROUPID FROM RDB$DATABASE),
				   a.FORUMID,
				   (SELECT :I_ACCESSMASKID  FROM RDB$DATABASE)
			FROM   objQual_FORUM a
				   JOIN objQual_CATEGORY b
					 ON b.CATEGORYID = a.CATEGORYID
			WHERE  b.BOARDID = :I_BOARDID;
		 END
		 o_GroupID=I_GROUPID;
		SUSPEND;
	END;
--GO

CREATE procedure objQual_GROUP_RANK_STYLE( I_BOARDID INTEGER)
RETURNS 
("LegendID" INTEGER,"Name" VARCHAR(128), "Style"  VARCHAR(255)) 
AS
begin
FOR SELECT (SELECT 1 FROM RDB$DATABASE) AS "LegendID","NAME",STYLE FROM objQual_GROUP
WHERE BoardID = :I_BOARDID GROUP BY SORTORDER,NAME,STYLE 
UNION ALL
SELECT (SELECT 2 FROM RDB$DATABASE) AS "LegendID","NAME",STYLE FROM objQual_RANK
WHERE BoardID = :I_BOARDID GROUP BY SORTORDER,NAME,STYLE
INTO
:"LegendID",
:"Name", 
:"Style"
DO
SUSPEND;
end;
--GO

CREATE PROCEDURE objQual_MAIL_CREATE
 (
	I_FROM VARCHAR(128),
	I_FROMNAME VARCHAR(128),
	I_TO VARCHAR(128),
	I_TONAME VARCHAR(128),
	I_SUBJECT varchar(128),
	I_BODY BLOB SUB_TYPE 1,
	I_BODYHTML BLOB SUB_TYPE 1,
	I_UTCTIMESTAMP TIMESTAMP
 )
AS
 BEGIN
	INSERT INTO objQual_MAIL
		(MAILID,FROMUSER,FROMUSERNAME,TOUSER,TOUSERNAME,CREATED,SUBJECT,BODY,BODYHTML)
	VALUES
		((SELECT NEXT VALUE FOR SEQ_objQual_MAIL_MAILID FROM RDB$DATABASE),:I_FROM,:I_FROMNAME,:I_TO,:I_TONAME,:I_UTCTIMESTAMP,:I_SUBJECT,:I_BODY,:I_BODYHTML);	
 END;
--GO

create procedure objQual_MAIL_CREATEWATCH
 (
	I_TOPICID INTEGER,
	I_FROM VARCHAR(128),
	I_FROMNAME VARCHAR(128),
	I_SUBJECT varchar(128),
	I_BODY BLOB SUB_TYPE 1,
	I_BODYHTML BLOB SUB_TYPE 1,
	I_USERID INTEGER,
	I_UTCTIMESTAMP TIMESTAMP
 )
 AS
 BEGIN
	INSERT INTO objQual_MAIL(MAILID,FROMUSER,FROMUSERNAME,TOUSER,TOUSERNAME,CREATED,SUBJECT,BODY,BODYHTML)
	SELECT
	   (SELECT NEXT VALUE FOR SEQ_objQual_MAIL_MAILID FROM RDB$DATABASE),
	   (SELECT :I_FROM FROM RDB$DATABASE),
	   (SELECT :I_FROMNAME FROM RDB$DATABASE),
		b."EMAIL",
		b.NAME,
		(SELECT :I_UTCTIMESTAMP FROM RDB$DATABASE),
		(SELECT :I_SUBJECT  FROM RDB$DATABASE),
		(SELECT :I_BODY  FROM RDB$DATABASE),
		(SELECT :I_BODYHTML  FROM RDB$DATABASE) 
	FROM
		objQual_WATCHTOPIC a
		INNER JOIN objQual_USER b on b.USERID=a.USERID
	WHERE
		b.USERID <> :I_USERID AND
		a.TOPICID = :I_TOPICID AND
		(a.LASTMAIL IS NULL OR a.LASTMAIL < b.LASTVISIT);
	
	INSERT INTO objQual_MAIL(MAILID,FROMUSER,FROMUSERNAME,TOUSER,TOUSERNAME,CREATED,SUBJECT,BODY,BODYHTML)
	SELECT
		(SELECT NEXT VALUE FOR SEQ_objQual_MAIL_MAILID FROM RDB$DATABASE),
	   (SELECT :I_FROM FROM RDB$DATABASE),
	   (SELECT :I_FROMNAME FROM RDB$DATABASE),
		b."EMAIL",
		b.NAME,
		(SELECT  :I_UTCTIMESTAMP FROM RDB$DATABASE),
		(SELECT :I_SUBJECT  FROM RDB$DATABASE),
		(SELECT :I_BODY  FROM RDB$DATABASE),
		(SELECT :I_BODYHTML  FROM RDB$DATABASE) 
	FROM
		objQual_WATCHFORUM a
		INNER JOIN objQual_USER b ON b.USERID=a.USERID
		INNER JOIN objQual_TOPIC c ON c.FORUMID=a.FORUMID
	WHERE
		b.USERID <> :I_USERID AND
		c.TOPICID = :I_TOPICID AND
		(a.LASTMAIL IS NULL OR a.LASTMAIL < b.LASTVISIT) AND
		(NOT EXISTS (SELECT 1 FROM objQual_WATCHTOPIC x WHERE x.USERID=b.USERID AND x.TOPICID=c.TOPICID));
 
	UPDATE objQual_WATCHTOPIC SET LASTMAIL = :I_UTCTIMESTAMP
	WHERE TOPICID = :I_TOPICID
	AND USERID <> :I_USERID;
	
	UPDATE objQual_WATCHFORUM SET LASTMAIL = :I_UTCTIMESTAMP
	WHERE FORUMID = (SELECT FORUMID FROM objQual_TOPIC WHERE TOPICID = :I_TOPICID)
	AND USERID <> :I_USERID;
END;
--GO

CREATE PROCEDURE objQual_MAIL_DELETE(I_MAILID INTEGER)
AS
BEGIN
	DELETE FROM objQual_MAIL WHERE MAILID = :I_MAILID;
END;
--GO

CREATE PROCEDURE objQual_MAIL_LIST
(
	I_PROCESSID INTEGER, I_UTCTIMESTAMP TIMESTAMP
 )
 RETURNS
 (
"MailID" integer,
"FromUser" varchar(128),
"FromUserName" varchar(128),
"ToUser" varchar(128),
"ToUserName" varchar(128),
"Created" timestamp,
"Subject" varchar(128),
"Body" BLOB SUB_TYPE 1,
"BodyHtml" BLOB SUB_TYPE 1,
"SendTries" integer,
"SendAttempt" timestamp,
"ProcessID" integer
)
 AS
 BEGIN
 -- CREATE TEMPORARY TABLE IF NOT EXISTS tmp_table55 
 -- SELECT  FIRST 10 DISTINCT "MailID" FROM objQual_MAIL 
 -- WHERE SENDATTEMPT < current_timestamp
 -- OR SENDATTEMPT IS NULL ORDER BY "MailID";
  
	UPDATE objQual_MAIL
	SET 
		SENDTRIES = SENDTRIES + 1,
		SENDATTEMPT = DATEADD(5 MINUTE TO :I_UTCTIMESTAMP),
		PROCESSID = :I_PROCESSID
	WHERE
		MAILID IN (SELECT MAILID FROM (SELECT  FIRST 10 DISTINCT MAILID FROM objQual_MAIL 
 WHERE SENDATTEMPT < :I_UTCTIMESTAMP
  OR SENDATTEMPT IS NULL   ORDER BY SENDATTEMPT desc, CREATED desc));
		--MailID IN (SELECT MailID FROM tmp_table55);
 
	/*now select all mail reserved for this process...*/
	FOR SELECT FIRST 10 DISTINCT * FROM objQual_MAIL 
	WHERE PROCESSID = :I_PROCESSID 
	ORDER BY SENDATTEMPT desc, CREATED desc
	INTO
	:"MailID",
	:"FromUser",
	:"FromUserName",
	:"ToUser",
	:"ToUserName",
	:"Created",
	:"Subject",
	:"Body",
	:"BodyHtml",
	:"SendTries",
	:"SendAttempt",
	:"ProcessID"
DO SUSPEND;
	   --    DROP TABLE IF EXISTS tmp_table55;
 END;
--GO



CREATE PROCEDURE objQual_MEDAL_DELETE
		(I_BOARDID	INTEGER,
	I_MEDALID	INTEGER,
	I_CATEGORY	VARCHAR(128))
	AS
BEGIN
 
	IF (I_MEDALID IS NOT NULL) THEN
	BEGIN
		DELETE from objQual_GROUPMEDAL WHERE MEDALID = :I_MEDALID;
		DELETE from objQual_USERMEDAL WHERE MEDALID = :I_MEDALID; 
		DELETE from objQual_MEDAL WHERE MEDALID=:I_MEDALID;
	END
	ELSE IF (I_CATEGORY IS NOT NULL AND I_BOARDID IS NOT NULL) THEN
	BEGIN
		DELETE from objQual_GROUPMEDAL 
			WHERE MEDALID in 
			(SELECT MEDALID FROM objQual_MEDAL 
			WHERE CATEGORY=:I_CATEGORY and BOARDID=:I_BOARDID);
 
		DELETE from objQual_USERMEDAL 
			WHERE MEDALID in 
			(SELECT MEDALID FROM objQual_MEDAL 
			WHERE CATEGORY=:I_CATEGORY and BOARDID=:I_BOARDID);
 
		DELETE from objQual_MEDAL WHERE CATEGORY=:I_CATEGORY;
	END
	ELSE IF  (I_BOARDID IS NOT NULL) THEN
	BEGIN
		DELETE from objQual_GROUPMEDAL 
			WHERE MEDALID in 
			(SELECT MEDALID FROM objQual_MEDAL 
			WHERE BOARDID=:I_BOARDID);
 
		DELETE from objQual_USERMEDAL 
			WHERE MEDALID in 
			(SELECT MEDALID FROM objQual_MEDAL 
			WHERE BOARDID=:I_BOARDID);

		DELETE from objQual_MEDAL WHERE BOARDID=:I_BOARDID;
	END
 
END;
--GO

CREATE PROCEDURE objQual_MEDAL_LIST
	(I_BOARDID	INTEGER,
	I_MEDALID	INTEGER,
	I_CATEGORY	VARCHAR(128))
	RETURNS
	(
"BoardID" integer,
"MedalID" integer,
"Name" varchar(128),
"Description" BLOB SUB_TYPE 1,
"Message" varchar(128),
"Category" varchar(128),
"MedalURL" VARCHAR(255),
"RibbonURL" VARCHAR(255),
"SmallMedalURL" VARCHAR(255),
"SmallRibbonURL" VARCHAR(255),
"SmallMedalWidth" integer,
"SmallMedalHeight" integer,
"SmallRibbonWidth" integer,
"SmallRibbonHeight" integer,
"SortOrder" integer,
"Flags" integer
)
	AS
BEGIN
 
	IF (I_MEDALID IS NOT NULL) THEN
		FOR SELECT 
			* 
		FROM 
			objQual_MEDAL 
		WHERE 
			MEDALID=:I_MEDALID 
		ORDER BY 
			CATEGORY ASC, 
			SORTORDER ASC
			INTO 			
			:"BoardID",
			:"MedalID",
			:"Name",
			:"Description",
			:"Message" ,
			:"Category",
			:"MedalURL",
			:"RibbonURL",
			:"SmallMedalURL",
			:"SmallRibbonURL",
			:"SmallMedalWidth",
			:"SmallMedalHeight",
			:"SmallRibbonWidth",
			:"SmallRibbonHeight",
			:"SortOrder",
			:"Flags"
			 DO SUSPEND;
	
	ELSE IF (I_CATEGORY IS NOT NULL AND  I_BOARDID IS NOT NULL) THEN
		FOR  SELECT 
			* 
		FROM 
			objQual_MEDAL 
		WHERE 
			CATEGORY=:I_CATEGORY and BOARDID=:I_BOARDID
		ORDER BY 
			CATEGORY ASC, 
			SORTORDER ASC
			INTO
			:"BoardID",
			:"MedalID",            
			:"Name",
			:"Description",
			:"Message" ,
			:"Category",
			:"MedalURL",
			:"RibbonURL",
			:"SmallMedalURL",
			:"SmallRibbonURL",
			:"SmallMedalWidth",
			:"SmallMedalHeight",
			:"SmallRibbonWidth",
			:"SmallRibbonHeight",
			:"SortOrder",
			:"Flags"
			 DO SUSPEND;
	ELSE IF (I_BOARDID IS NOT NULL) THEN
		FOR SELECT 
			* 
		FROM 
			objQual_MEDAL 
		WHERE 
			BOARDID=:I_BOARDID
		ORDER BY 
			CATEGORY ASC, 
			SORTORDER ASC
			INTO
			:"BoardID",
			:"MedalID",            
			:"Name",
			:"Description",
			:"Message" ,
			:"Category",
			:"MedalURL",
			:"RibbonURL",
			:"SmallMedalURL",
			:"SmallRibbonURL",
			:"SmallMedalWidth",
			:"SmallMedalHeight",
			:"SmallRibbonWidth",
			:"SmallRibbonHeight",
			:"SortOrder",
			:"Flags"
			 DO SUSPEND;
	 
END;
--GO
CREATE PROCEDURE objQual_MEDAL_LISTUSERS
	(I_MEDALID	INTEGER)
	RETURNS
	(
"UserID" integer,
"Name" varchar(128)
)
	AS
  BEGIN
  FOR	SELECT
  *
  FROM (
	SELECT 
		a.USERID, a.NAME
	FROM 
		objQual_USER a
		INNER JOIN objQual_USERMEDAL b 
		ON a.USERID = b.USERID
	WHERE
		b.MEDALID=:I_MEDALID
	UNION	
 
	SELECT 
		a.USERID, a.NAME
	FROM 
		objQual_USER a
		INNER JOIN objQual_USERGROUP b ON a.USERID = b.USERID
		INNER JOIN objQual_GROUPMEDAL c ON c.GROUPID = b.GROUPID
	WHERE
		c.MEDALID=:I_MEDALID)
		INTO 
		:"UserID",
		:"Name"
		DO SUSPEND; 
 
 
END;
--GO

CREATE PROCEDURE objQual_MEDAL_RESORT
	(I_BOARDID INTEGER,I_MEDALID INTEGER,I_MOVE INTEGER)
AS
DECLARE VARIABLE i_Position INTEGER;
DECLARE VARIABLE i_FinalPosition INTEGER;
DECLARE VARIABLE I_CATEGORY VARCHAR(128);
BEGIN
	
 i_FinalPosition=i_Position+I_MOVE;
	SELECT 
		SORTORDER,
		CATEGORY        
	FROM 
		objQual_MEDAL 
	WHERE 
		BOARDID=:I_BOARDID and MEDALID=:I_MEDALID
		INTO :i_Position,:I_CATEGORY;
 
	IF (i_Position IS NOT NULL) THEN
	BEGIN
 
	IF (I_MOVE > 0) THEN
		UPDATE 
			objQual_MEDAL
		SET 
			SORTORDER=SORTORDER-1
		WHERE 
			BOARDID=:I_BOARDID and 
			CATEGORY=:I_CATEGORY and
			SORTORDER BETWEEN :i_Position AND :i_FinalPosition
						 AND SORTORDER between 1 and 255; 	
	IF (I_MOVE < 0) THEN
		UPDATE
			objQual_MEDAL
		SET
			SORTORDER=SORTORDER+1
		WHERE 
			BOARDID=:I_BOARDID AND 
			CATEGORY=:I_CATEGORY AND
			(SORTORDER BETWEEN :i_Position AND :i_FinalPosition) AND
			(SORTORDER BETWEEN 0 and 254); 	
 
	i_Position = i_Position + I_MOVE;
 
	IF (i_Position>255) THEN i_Position = 255;
	IF (i_Position<0) THEN 
	i_Position = 0; 
		 
	UPDATE objQual_MEDAL
		SET SORTORDER=:i_Position
		WHERE BOARDID=:I_BOARDID AND 
		MEDALID=:I_MEDALID;
	END
END;
--GO

CREATE PROCEDURE objQual_MEDAL_SAVE
 (	I_BOARDID INTEGER,
	I_MEDALID INTEGER,
	I_NAME varchar(128),
	I_DESCRIPTION BLOB SUB_TYPE 1,
	I_MESSAGE varchar(128),
	I_CATEGORY VARCHAR(128),
	I_MEDALURL VARCHAR(255),
	I_RIBBONURL VARCHAR(255),
	I_SMALLMEDALURL VARCHAR(255),
	I_SMALLRIBBONURL VARCHAR(255),
	I_SMALLMEDALWIDTH SMALLINT,
	I_SMALLMEDALHEIGHT SMALLINT,
	I_SMALLRIBBONWIDTH SMALLINT,
	I_SMALLRIBBONHEIGHT SMALLINT,
	I_SORTORDER SMALLINT,
	I_FLAGS INTEGER) 
		RETURNS (retcount integer) 	
	AS
	DECLARE rcount integer;
BEGIN
 
	IF (I_MEDALID IS NULL) THEN
	BEGIN 	
	SELECT NEXT VALUE FOR SEQ_objQual_MEDAL_MEDALID FROM RDB$DATABASE INTO :rcount;
		INSERT INTO objQual_MEDAL
			(BOARDID,MEDALID,NAME,DESCRIPTION,MESSAGE,CATEGORY,
			MEDALURL,RIBBONURL,SMALLMEDALURL,SMALLRIBBONURL,
			SMALLMEDALWIDTH,SMALLMEDALHEIGHT,SMALLRIBBONWIDTH,SMALLRIBBONHEIGHT,
			SORTORDER,FLAGS)
		VALUES
			(:I_BOARDID,:rcount,:I_NAME,:I_DESCRIPTION,:I_MESSAGE,:I_CATEGORY,
			:I_MEDALURL,:I_RIBBONURL,:I_SMALLMEDALURL,:I_SMALLRIBBONURL,
			:I_SMALLMEDALWIDTH,:I_SMALLMEDALHEIGHT,:I_SMALLMEDALWIDTH,:I_SMALLMEDALHEIGHT,
			:I_SORTORDER,:I_FLAGS);
	END
	ELSE 
		UPDATE objQual_MEDAL
			SET BOARDID = :I_BOARDID,
				NAME = :I_NAME,
				DESCRIPTION = :I_DESCRIPTION,
				MESSAGE = :I_MESSAGE,
				CATEGORY = :I_CATEGORY,
				MEDALURL = :I_MEDALURL,
				RIBBONURL = :I_RIBBONURL,
				SMALLMEDALURL = :I_SMALLMEDALURL,
				SMALLRIBBONURL = :I_SMALLRIBBONURL,
				SMALLMEDALWIDTH = :I_SMALLMEDALWIDTH,
				SMALLMEDALHEIGHT = :I_SMALLMEDALHEIGHT,
				SMALLRIBBONWIDTH = :I_SMALLMEDALWIDTH,
				SMALLRIBBONHEIGHT = :I_SMALLMEDALHEIGHT,
				SORTORDER = :I_SORTORDER,
				FLAGS = :I_FLAGS
		WHERE MEDALID = :I_MEDALID; 
				  
				
	 
	  retcount = ROW_COUNT;
	  SUSPEND; 
END;
--GO

CREATE PROCEDURE objQual_USER_UPGRADE(I_USERID INTEGER)
	AS
	DECLARE variable ici_RankID	INTEGER;
	DECLARE variable ICI_FLAGS	INTEGER;
	DECLARE variable ici_MinPosts INTEGER;
	DECLARE variable ici_NumPosts INTEGER;
	DECLARE variable myrowcount INTEGER;
	DECLARE variable ici_BoardId INTEGER;
	DECLARE variable ici_RankBoardID INTEGER;

	BEGIN    
	/* Get user and rank information*/
	SELECT
	b.RANKID,
	b.FLAGS,
	b.MINPOSTS,
	a.NUMPOSTS,
	a.BOARDID 
	FROM
	objQual_USER a
	INNER JOIN objQual_RANK b 
	ON b.RANKID = a.RANKID
	WHERE
	a.USERID = :I_USERID
	INTO
	:ici_RankID,
	:ICI_FLAGS,
	:ici_MinPosts,
	:ici_NumPosts,
	:ici_BoardId;

	/*If user isn't member of a ladder rank, exit*/
	if (BIN_AND(:ICI_FLAGS, 2) != 0) THEN
	BEGIN
		-- retrieve board current user's rank beling to	
	select  BOARDID
	from   objQual_RANK
	where  RANKID = :ici_RankID
	INTO :ici_RankBoardID;

	-- does user have rank from his board?
	IF (:ici_RankBoardID <> :ici_BoardId) THEN
	 begin
		-- get highest rank user can get
		select first 1
			   RANKID
		from   objQual_RANK
		where  BOARDID = :ici_BoardId
			   and BIN_AND(FLAGS, 2) = 2
			   and MinPosts <= :ici_NumPosts
		order by
			   MinPosts desc
			   INTO :ici_RankID;
	end
	else 
	begin
	/* See if user got enough posts for next ladder group */
	SELECT FIRST 1
	 RANKID        
	FROM
		objQual_RANK
	WHERE
		BIN_AND(FLAGS, 2) = 2 and
		MINPOSTS <= :ici_NumPosts and
		MINPOSTS > :ici_MinPosts
	ORDER BY
		MINPOSTS 
		INTO
		:ici_RankID;        
	end	
	IF (ROW_COUNT = 1) THEN
		UPDATE objQual_USER 
		SET RANKID = :ici_RankID 
		WHERE USERID = :I_USERID; 
	END  
END;
--GO


CREATE PROCEDURE objQual_MESSAGE_APPROVE(I_MESSAGEID INTEGER)
AS
	DECLARE VARIABLE ICI_USERID	INTEGER;
	DECLARE VARIABLE ici_ForumID	INTEGER;
	DECLARE VARIABLE ici_ParentID	INTEGER;
	DECLARE VARIABLE ici_TopicID	INTEGER;
	DECLARE VARIABLE ici_Posted	TIMESTAMP;
	DECLARE VARIABLE ici_UserName	varchar(128);
	DECLARE VARIABLE ici_NewFlag	INTEGER;
BEGIN
	
 
	SELECT 
		 a.USERID,
		 a.TOPICID,
		 b.FORUMID,
		 a.POSTED,
		 a.USERNAME,
		 a.FLAGS 		
	FROM
		objQual_MESSAGE a
		inner join objQual_TOPIC b on b.TOPICID=a.TOPICID
	WHERE
		a.MESSAGEID = :I_MESSAGEID
		INTO :ICI_USERID,:ici_TopicID,
		:ici_ForumID,:ici_Posted,:ici_UserName,:ici_NewFlag;
 
	/* update Message table, set meesage flag to approved */
	UPDATE objQual_MESSAGE 
	 SET
		FLAGS = BIN_OR(FLAGS, 16)
	WHERE MESSAGEID = :I_MESSAGEID;

	/*update User table to increase postcount*/
	IF (EXISTS(SELECT FIRST 1 1 FROM objQual_FORUM 
	WHERE FORUMID=:ici_ForumID 
	AND BIN_AND(FLAGS, 4)=0)) THEN
	BEGIN
		UPDATE objQual_USER set NUMPOSTS = NUMPOSTS + 1 
		where USERID = :ICI_USERID;
		/*upgrade user, i.e. promote rank if conditions allow it*/
		EXECUTE PROCEDURE objQual_USER_UPGRADE :ICI_USERID;
	END
	/*update Forum table with last topic/post info*/

  SELECT DISTINCT PARENTID 
  FROM  objQual_FORUM
  WHERE FORUMID = :ici_ForumID
  INTO  :ici_ParentID;  
 
	UPDATE objQual_FORUM set
		LASTPOSTED = :ici_Posted,
		LASTTOPICID = :ici_TopicID,
		LASTMESSAGEID = :I_MESSAGEID,
		LASTUSERID = :ICI_USERID ,
		LASTUSERNAME = :ici_UserName
	WHERE FORUMID = :ici_ForumID;
	
	WHILE (ici_ParentID > 0) DO
	BEGIN
		UPDATE objQual_FORUM SET
				LASTPOSTED = :ici_Posted,
				LASTTOPICID = :ici_TopicID,
				LASTMESSAGEID = :I_MESSAGEID,
				LASTUSERID = :ICI_USERID,
				LASTUSERNAME = :ici_UserName
			WHERE
				FORUMID = :ici_ParentID
		AND ((LASTPOSTED < :ici_Posted)
		OR LASTPOSTED IS NULL);         
		 SELECT DISTINCT PARENTID 
  FROM  objQual_FORUM
  WHERE FORUMID = :ici_ParentID
  INTO  :ici_ParentID;  
  END	
  

 
	/*update Topic table with info about last post in topic*/
	UPDATE objQual_TOPIC set
		LASTPOSTED = :ici_Posted,
		LASTMESSAGEID = :I_MESSAGEID,
		LASTUSERID = :ICI_USERID,
		LASTUSERNAME = :ici_UserName,
		NUMPOSTS = (select count(1) from objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID
		 and x.ISAPPROVED = 1 and x.ISDELETED = 0)
		WHERE TOPICID = :ici_TopicID;
	
	/*update forum stats*/
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ForumID; 	
END;
--GO

CREATE  PROCEDURE objQual_TOPIC_UPDATELASTPOST(
	 I_FORUMID INTEGER,
	 I_TOPICID INTEGER)
	 AS
	 DECLARE variable ICI_FORUMID INTEGER DEFAULT NULL;
	 DECLARE variable ici_TopicID INTEGER DEFAULT NULL;
	 BEGIN
	 

	 IF (I_FORUMID IS NOT NULL OR I_FORUMID >=0) THEN 
	 ICI_FORUMID = I_FORUMID;
	 IF (I_TOPICID  IS NOT NULL OR I_TOPICID  >=0) THEN 
	 ici_TopicID = I_TOPICID;

	 IF (ici_TopicID IS NOT NULL) THEN
	 UPDATE objQual_TOPIC
	 SET    
	 LASTPOSTED = (SELECT FIRST 1 DISTINCT x.POSTED
				   FROM     objQual_MESSAGE x
				   WHERE    x.TOPICID = objQual_TOPIC.TOPICID
				   AND BIN_AND(x.FLAGS, 24) = 16
				   ORDER BY POSTED DESC),
	 LASTMESSAGEID=(SELECT  FIRST 1 DISTINCT x.MESSAGEID
					FROM     objQual_MESSAGE x
					WHERE    x.TOPICID = objQual_TOPIC.TOPICID
					AND BIN_AND(x.FLAGS, 24) = 16
					ORDER BY POSTED DESC),
	 LASTUSERID=(SELECT  FIRST 1 DISTINCT x.USERID
					FROM    objQual_MESSAGE x
					WHERE    x.TOPICID = objQual_TOPIC.TOPICID
					AND BIN_AND(x.FLAGS, 24) = 16
					ORDER BY POSTED DESC) ,
	 LASTUSERNAME=(SELECT FIRST 1 DISTINCT x.USERNAME
				   FROM     objQual_MESSAGE x
				   WHERE    x.TOPICID = objQual_TOPIC.TOPICID
				   AND BIN_AND(x.FLAGS, 24) = 16
				   ORDER BY POSTED DESC) 
				   WHERE  TOPICID = :ici_TopicID;
		ELSE
		UPDATE objQual_TOPIC
		SET    LASTPOSTED=(SELECT  FIRST 1 DISTINCT x.POSTED
							 FROM     objQual_MESSAGE x
							 WHERE    x.TOPICID = objQual_TOPIC.TOPICID
							 AND BIN_AND(x.FLAGS, 24) = 16
							 ORDER BY POSTED DESC),
			   LASTMESSAGEID=(SELECT FIRST 1  DISTINCT x.MESSAGEID
								FROM     objQual_MESSAGE x
								WHERE    x.TOPICID = objQual_TOPIC.TOPICID
								AND BIN_AND(x.FLAGS, 24) = 16
								ORDER BY POSTED DESC),
			   LASTUSERID=(SELECT FIRST 1 DISTINCT  x.USERID
							 FROM     objQual_MESSAGE x
							 WHERE    x.TOPICID = objQual_TOPIC.TOPICID
							 AND BIN_AND(x.FLAGS, 24) = 16
							 ORDER BY POSTED DESC),
			   LASTUSERNAME = (SELECT FIRST 1 DISTINCT x.USERNAME
							   FROM     objQual_MESSAGE x
							   WHERE    x.TOPICID = objQual_TOPIC.TOPICID
							   AND BIN_AND(x.FLAGS, 24) = 16
							   ORDER BY POSTED DESC)
	 WHERE  TOPICMOVEDID IS NULL
	 AND (:ICI_FORUMID IS NULL
	 OR FORUMID = :ICI_FORUMID);

	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ICI_FORUMID);
	
	 END ;
  --GO
  

  CREATE  PROCEDURE objQual_MESSAGE_FINDUNREAD(
		I_TOPICID  INTEGER,
		I_MESSAGEID  INTEGER,
		I_LASTREAD TIMESTAMP,
		I_SHOWDELETED BOOL,
		I_AUTHORUSERID INTEGER)
		RETURNS (
		"MessageID" INTEGER,
		"MessagePosition" INTEGER, 
        "FirstMessageID" INTEGER)
		AS
		DECLARE	ici_one INTEGER DEFAULT 1;
		DECLARE ICI_FIRSTMESSAGEID INTEGER DEFAULT 0;
		DECLARE ici_messageid INTEGER DEFAULT -1;
		DECLARE cntrt INTEGER DEFAULT 1;
		DECLARE ici_cntr INTEGER DEFAULT 1;		
		DECLARE ici_messageposition INTEGER;

		DECLARE	icic_messageid INTEGER;
		DECLARE	icic_firstmessageid INTEGER;
		DECLARE	icic_messageposition  INTEGER;

		DECLARE	icil_messageid INTEGER;
		DECLARE	icil_firstmessageid INTEGER;
		DECLARE	icil_messageposition  INTEGER;
		BEGIN
		IF (:I_SHOWDELETED IS NULL) THEN I_SHOWDELETED = 0;
		
		 -- find first message id

		SELECT  FIRST 1 MESSAGEID
		FROM     objQual_MESSAGE
		WHERE    TOPICID = :I_TOPICID	
		ORDER BY POSTED 
		INTO :ici_firstmessageid;
		-- SUSPEND;

IF (:I_MESSAGEID > 0) THEN
BEGIN
-- loop through begining with the last message
FOR 
        SELECT MESSAGEID
        FROM     objQual_MESSAGE
        WHERE    TOPICID = :I_TOPICID	
        AND POSTED > :I_LASTREAD
		 AND ISAPPROVED = 1
			  AND (ISDELETED = 0  
			         OR ((:I_SHOWDELETED = 1 AND ISDELETED = 1) 
					 OR (:I_AUTHORUSERID > 0 AND USERID = :I_AUTHORUSERID))
				  )
        ORDER BY POSTED DESC 
		INTO
		:"MessageID"
DO
BEGIN 
    -- the messageid was already supplied, find a particular message
	
    if (I_MESSAGEID = "MessageID") then
	   BEGIN
	   "MessagePosition" = :ici_cntr;
	   "FirstMessageID"  = :ici_firstmessageid;
	   suspend;
		LEAVE;
	   END	  	
	-- count next	
	ici_cntr =  :ici_cntr + 1;
END
END
ELSE 
BEGIN
-- loop through begining with the last message
FOR 
        SELECT MESSAGEID
        FROM     objQual_MESSAGE
        WHERE    TOPICID = :I_TOPICID	
        AND POSTED > :I_LASTREAD
		 AND ISAPPROVED = 1
			  AND (ISDELETED = 0  
			         OR ((:I_SHOWDELETED = 1 AND ISDELETED = 1) 
					 OR (:I_AUTHORUSERID > 0 AND USERID = :I_AUTHORUSERID))
				  )
        ORDER BY POSTED DESC 
		INTO
		:"MessageID"
DO
BEGIN	
	   -- an unread candidate row  wecount from the last post
	         icic_messageid = :"MessageID";
			 icic_firstmessageid = :ICI_FIRSTMESSAGEID;
			 icic_messageposition = :ici_cntr;  

		  -- return last unread		
	ici_cntr =  :ici_cntr + 1;
END
END

-- simply return last post if no unread message is found

	if ("MessagePosition" is null) then
	      BEGIN
		  "MessageID" = :icic_messageid;
		  "FirstMessageID" = :icic_firstmessageid;
		  "MessagePosition" = :icic_messageposition;		  
		  if ("MessageID" is null ) then
		      BEGIN
			  select FIRST 1 m.MESSAGEID, (SELECT :ici_one  FROM RDB$DATABASE) , (SELECT :ICI_FIRSTMESSAGEID FROM RDB$DATABASE) 
			  from objQual_MESSAGE m
			  where
			  m.TOPICID = :I_TOPICID	
			  AND BIN_AND(m.FLAGS,16) = 16
			  AND (BIN_AND(m.FLAGS, 8) <> 8  
			         OR ((:i_showdeleted = 1 AND BIN_AND(m.FLAGS, 8) = 8) 
					 OR (:i_authoruserid > 0 AND m.userid = :i_authoruserid))
				  )
				  order by
				  m.POSTED DESC
				  INTO
				  :"MessageID",
				  :"MessagePosition",
				  :"FirstMessageID";
				 	 
				   
             END
			 suspend; 
	   END 
	 
	END;
--GO

CREATE PROCEDURE objQual_MESSAGE_GETREPLIES(I_MESSAGEID INTEGER) 
RETURNS ("MessageID" INTEGER)
AS
 BEGIN
	FOR SELECT MESSAGEID FROM objQual_MESSAGE 
	WHERE REPLYTO = :I_MESSAGEID
	INTO :"MessageID"
	DO SUSPEND;
 END;
--GO

CREATE PROCEDURE objQual_MESSAGE_LIST(I_MESSAGEID INTEGER)
 RETURNS
 (
"MessageID" integer,
"UserID" integer,
"Username" varchar(128),
"Message" BLOB SUB_TYPE 1,
"TopicID" integer,
"ForumID" integer,
"Topic"  varchar(255),
"Status"  varchar(255),
"Styles"  varchar(255),
"Priority"  integer,
"Description" varchar(255),
"Flags" integer,
"TopicOwnerID"  integer,
"Edited" timestamp,
"TopicFlags"  integer,
"ForumFlags"  integer,
"EditReason" varchar(128),
"Position"  integer,
"IsModeratorChanged" BOOL,
"DeleteReason" varchar(128),
"BlogPostID"   varchar(128),
"PollID"   integer,
"IP" VARCHAR(39),
"EditedBy"   integer,
"ReplyTo" integer,
"ExternalMessageId" varchar(128),
"ReferenceMessageId" varchar(128)
)
 AS 
 BEGIN
	FOR SELECT
		a.MESSAGEID,
		a.USERID,
		b.NAME AS "UserName",
		a.MESSAGE,
		c.TOPICID,
		c.FORUMID,
		c.TOPIC,
		c.STATUS,
		c.STYLES,
		c."PRIORITY",
		c."DESCRIPTION",
		a.FLAGS,
		c.USERID AS "TopicOwnerID",
		COALESCE(a.EDITED,a.POSTED) AS "Edited",
		c.FLAGS AS "TopicFlags",
		d.FLAGS AS "ForumFlags",
		a.EDITREASON,
		a."POSITION",
		a.ISMODERATORCHANGED,
		a.DELETEREASON,
		a.BLOGPOSTID,
		c.POLLID,
		a.IP,
		a.EDITEDBY,
		a.REPLYTO,
		a.EXTERNALMESSAGEID,
		a.REFERENCEMESSAGEID		
	FROM
		objQual_MESSAGE a
		INNER JOIN objQual_USER b ON b.USERID = a.USERID
		INNER JOIN objQual_TOPIC c ON c.TOPICID = a.TOPICID
		INNER JOIN objQual_FORUM d ON c.FORUMID = d.FORUMID
	WHERE
		a.MESSAGEID = :I_MESSAGEID
		INTO
		:"MessageID",
		:"UserID",
		:"Username",
		:"Message",
		:"TopicID",
		:"ForumID",
		:"Topic",
		:"Status",
		:"Styles",
		:"Priority",
		:"Description",
		:"Flags",
		:"TopicOwnerID",
		:"Edited",
		:"TopicFlags",
		:"ForumFlags",
		:"EditReason",
		:"Position" ,
		:"IsModeratorChanged",
		:"DeleteReason",
		:"BlogPostID",
		:"PollID",
		:"IP",
		:"EditedBy",
		:"ReplyTo",
		:"ExternalMessageId",
		:"ReferenceMessageId"
		DO SUSPEND;
 END;
--GO

CREATE PROCEDURE objQual_MESSAGE_LISTREPORTED(I_FORUMID INTEGER) 
 RETURNS
 (
"MessageID" integer,
"Message"  BLOB SUB_TYPE 1,
"Resolved" BOOL,
"ResolvedBy" integer,
"ResolvedDate" timestamp,
"OriginalMessage" BLOB SUB_TYPE 1,
"Flags" integer,
"IsModeratorChanged" BOOL,
"UserName" varchar(128),
"UserID" integer,
"Posted" timestamp,
"Topic" varchar(128),
"TopicID" INTEGER,
"NumberOfReports" integer
)
 AS
 DECLARE ici_PowerFlag INTEGER;
 BEGIN 
	FOR SELECT
		a.*,
		b.MESSAGE AS "OriginalMessage",
		b.FLAGS,
		COALESCE(b.ISMODERATORCHANGED,0),	
		COALESCE(b.USERNAME,d.NAME),
		b.USERID,
		b.POSTED,
		c.TOPIC,
		b.TopicID,
		(SELECT count(LOGID) 
		FROM objQual_MESSAGEREPORTEDAUDIT 
		WHERE objQual_MESSAGEREPORTEDAUDIT.MESSAGEID = a.MESSAGEID) 
		AS "NumberOfReports"
	FROM
		objQual_MESSAGEREPORTED a
	INNER JOIN
		objQual_MESSAGE b ON a.MESSAGEID = b.MESSAGEID
	INNER JOIN
		objQual_TOPIC c ON b.TOPICID = c.TOPICID
	INNER JOIN
		objQual_USER d ON b.USERID = d.USERID
	WHERE
		c.FORUMID = :I_FORUMID AND
		BIN_AND(c.FLAGS, 16)=0 AND
		BIN_AND(b.FLAGS, 8)=0 AND
		BIN_AND(c.FLAGS, 8)=0 AND
		BIN_AND(b.FLAGS, 128)=128
	ORDER BY
		b.TOPICID DESC, b.POSTED DESC
		INTO 
		:"MessageID",
		:"Message",
		:"Resolved",
		:"ResolvedBy",
		:"ResolvedDate",
		:"OriginalMessage",
		:"Flags",
		:"IsModeratorChanged",
		:"UserName",
		:"UserID",
		:"Posted",
		:"Topic",
		:"TopicID", 
		:"NumberOfReports"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_LISTREPORTERS(I_MESSAGEID integer, I_USERID integer)
 RETURNS("UserID" integer, "UserName" varchar(128),"ReportedNumber" integer,"ReportText" varchar(128))
AS
BEGIN
IF ( :I_USERID > 0 ) THEN	
	FOR SELECT b.USERID, a.NAME, b.REPORTEDNUMBER,b.REPORTTEXT
	FROM objQual_USER a,
	objQual_MESSAGEREPORTEDAUDIT b
	WHERE a.USERID = b.USERID AND b.MESSAGEID = :I_MESSAGEID AND a.USERID = :I_USERID
	INTO
	:"UserID", 
	:"UserName",
	:"ReportedNumber",
	:"ReportText"
DO SUSPEND;
ELSE
FOR SELECT b.USERID, a.NAME, b.REPORTEDNUMBER,b.REPORTTEXT
	FROM objQual_USER a,
	objQual_MESSAGEREPORTEDAUDIT b
	WHERE a.USERID = b.USERID AND b.MESSAGEID = :I_MESSAGEID
	INTO
	:"UserID", 
	:"UserName",
	:"ReportedNumber",
	:"ReportText"
DO SUSPEND;				
END;
--GO


CREATE PROCEDURE objQual_MESSAGE_MOVE (I_MESSAGEID INTEGER, I_MOVETOTOPIC INTEGER)
 
 AS
 DECLARE VARIABLE ici_Position INTEGER;
 DECLARE VARIABLE ici_ReplyToID INTEGER;
 DECLARE VARIABLE ici_ForumID2 INTEGER;
 DECLARE VARIABLE ici_OldTopicID INTEGER;
 DECLARE VARIABLE ici_OldForumID INTEGER;
 DECLARE VARIABLE ici_NewForumID	INTEGER;
 DECLARE VARIABLE ici_MessageCount INTEGER;
 DECLARE VARIABLE ici_LastMessageID INTEGER;
 DECLARE VARIABLE ici_Posted TIMESTAMP;
 BEGIN
 
	/*Find TopicID and ForumID
 SELECT b.TopicID,b.ForumID INTO ici_ForumID,ici_OldTopicID
		FROM objQual_MESSAGE a,objQual_TOPIC b WHERE a.MessageID=I_MESSAGEID and b.TopicID=a.TopicID;*/
SELECT POSTED  
FROM objQual_MESSAGE  
WHERE MESSAGEID= :I_MESSAGEID
INTO :ici_Posted;
				SELECT     FORUMID
				FROM         objQual_TOPIC
				WHERE     TOPICID = :I_MOVETOTOPIC 
				INTO :ici_NewForumID;
 
				SELECT     TOPICID
				FROM         objQual_MESSAGE
				WHERE     MESSAGEID = :I_MESSAGEID
				INTO :ici_OldTopicID;
				 
				SELECT     FORUMID
				FROM         objQual_TOPIC
				WHERE     TOPICID = :ici_OldTopicID
				INTO :ici_OldForumID;
 
			SELECT     MESSAGEID
			FROM         objQual_MESSAGE
			WHERE     ("POSITION" = 0) 
			AND (TOPICID = :I_MOVETOTOPIC)
			INTO :ici_ReplyToID;
 
			SELECT     MAX("POSITION") + 1 AS Expr1
			FROM         objQual_MESSAGE
			WHERE     (TOPICID = :I_MOVETOTOPIC) 
			and POSTED < :ici_Posted
			INTO :ici_Position;
 
		  IF (ici_Position IS NULL) THEN 
		  ici_Position = 0; 
 
 update objQual_MESSAGE SET
		"POSITION" = "POSITION"+1
	 WHERE     (TOPICID = :I_MOVETOTOPIC) 
	 and POSTED > :ici_Posted;
 
 update objQual_MESSAGE set
		"POSITION" = "POSITION"-1
	 WHERE     (TOPICID = :ici_OldTopicID) 
	 and POSTED > :ici_Posted;
 
	 /*Update LastMessageID in Topic and Forum*/
	UPDATE objQual_TOPIC set
		LASTPOSTED = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	WHERE LASTMESSAGEID = :I_MESSAGEID;
 
	UPDATE objQual_FORUM set
		LASTPOSTED = NULL,
		LASTTOPICID = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	WHERE LASTMESSAGEID = :I_MESSAGEID;

 
 UPDATE objQual_MESSAGE SET
	TOPICID = :I_MOVETOTOPIC,
	REPLYTO = :ici_ReplyToID,
	"POSITION" = :ici_Position
 WHERE  MESSAGEID = :I_MESSAGEID;
 
	 /*Delete topic if there are no more messages*/
	SELECT COUNT(1)  
	FROM objQual_MESSAGE 
	WHERE TOPICID = :ici_OldTopicID 
	and BIN_AND(FLAGS, 8)=0
	INTO :ici_MessageCount;
	IF (ici_MessageCount=0) THEN 
	EXECUTE PROCEDURE objQual_TOPIC_DELETE(:ici_OldTopicID,0,0); 
	
 
	 /*update lastpost*/
	EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST(:ici_OldForumID,:ici_OldTopicID);
	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ici_OldForumID);
	EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST(:ici_NewForumID,:I_MOVETOTOPIC);
	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ici_NewForumID);
	 /*update topic numposts*/
	UPDATE objQual_TOPIC SET
		NUMPOSTS = 
		(SELECT COUNT(1) from objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID 
		and x.ISAPPROVED = 1 and x.ISDELETED = 0)
	WHERE TOPICID = :ici_OldTopicID;
	UPDATE objQual_TOPIC set
		NUMPOSTS = (SELECT COUNT(1) 
		from objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID 
		and x.ISAPPROVED = 1 and x.ISDELETED = 0)
	WHERE TOPICID = :I_MOVETOTOPIC;
 
	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ici_NewForumID);
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS(:ici_NewForumID);
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS(:ici_OldForumID);
 
 END;
--GO

CREATE PROCEDURE objQual_MESSAGE_REPLY_LIST(I_MESSAGEID INTEGER) 
RETURNS
(
"MessageID" integer,
"Posted" timestamp,
"Subject" varchar(128),
"Message" BLOB SUB_TYPE 1,
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"Signature" BLOB SUB_TYPE 1)
AS
BEGIN
	FOR SELECT
				 a.MESSAGEID,
		a.POSTED,
		c.TOPIC AS "Subject",
		a.MESSAGE,
		a.USERID,
		a.FLAGS,
		COALESCE(a.USERNAME,b.NAME) AS "UserName",
		b.SIGNATURE
	FROM
		objQual_MESSAGE a
		INNER JOIN objQual_USER b on b.USERID = a.USERID
		INNER JOIN objQual_TOPIC c on c.TOPICID = a.TOPICID
	WHERE
		BIN_AND(a.FLAGS, 16)=16 AND
		a.REPLYTO = :I_MESSAGEID
		INTO
		:"MessageID",
		:"Posted",
		:"Subject",
		:"Message",
		:"UserID",
		:"Flags",
		:"UserName",
		:"Signature"
		DO SUSPEND;
 

END;
--GO

CREATE PROCEDURE objQual_MESSAGE_REPORT
(I_MESSAGEID INTEGER, 
I_REPORTERID INTEGER, 
I_REPORTEDDATE TIMESTAMP,
I_REPORTTEXT VARCHAR(4000),
I_UTCTIMESTAMP TIMESTAMP) 
AS
 BEGIN
	
	IF (NOT EXISTS (SELECT MESSAGEID 
	from objQual_MESSAGEREPORTEDAUDIT 
	WHERE MESSAGEID=:I_MESSAGEID AND USERID=:I_REPORTERID)) THEN
		INSERT INTO objQual_MESSAGEREPORTEDAUDIT(LOGID,MESSAGEID,USERID,REPORTED,REPORTTEXT) 
		VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_MESSAGE_LOGID FROM RDB$DATABASE),:I_MESSAGEID,:I_REPORTERID,:I_REPORTEDDATE, CAST(:I_UTCTIMESTAMP AS varchar(40)) || '??' || :I_REPORTTEXT); 
	ELSE 	  
		UPDATE objQual_MESSAGEREPORTEDAUDIT 
		SET REPORTEDNUMBER = ( CASE WHEN REPORTEDNUMBER < 2147483647 THEN  REPORTEDNUMBER + 1 ELSE REPORTEDNUMBER END ), REPORTED = :I_REPORTEDDATE, REPORTTEXT= (CASE WHEN (char_length(REPORTTEXT) + char_length(:I_REPORTTEXT ) + 255 < 4000)  THEN  REPORTTEXT || '|' ||  CAST(:I_UTCTIMESTAMP AS varchar(40)) || '??' ||  :I_REPORTTEXT ELSE REPORTTEXT END) 
		WHERE MESSAGEID = :I_MESSAGEID AND USERID = :I_REPORTERID ;	

	IF (NOT EXISTS (SELECT MESSAGEID FROM objQual_MESSAGEREPORTED 
	WHERE MESSAGEID=:I_MESSAGEID)) THEN
		INSERT INTO objQual_MESSAGEREPORTED(MESSAGEID, MESSAGE)
		SELECT 		    
			a.MESSAGEID,
			a.MESSAGE
		FROM
			objQual_MESSAGE a
		WHERE
			a.MESSAGEID = :I_MESSAGEID; 	
	/*update Message table to set message with flag Reported*/
	UPDATE objQual_MESSAGE 
	SET FLAGS = BIN_OR(FLAGS, 128) 
	WHERE MESSAGEID = :I_MESSAGEID;

 END;
--GO

CREATE PROCEDURE objQual_MESSAGE_REPORTCOPYOVER(I_MESSAGEID INTEGER)
AS
 BEGIN
	UPDATE objQual_MESSAGEREPORTED		
	SET objQual_MESSAGEREPORTED.MESSAGE = 
	(SELECT m.MESSAGE FROM objQual_MESSAGEREPORTED mr
	JOIN objQual_MESSAGE m
	ON m.MESSAGEID = mr.MESSAGEID
	WHERE mr.MESSAGEID = :I_MESSAGEID);
	
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_REPORTRESOLVE(I_MESSAGEFLAG INTEGER, I_MESSAGEID INTEGER, I_USERID INTEGER, I_UTCTIMESTAMP TIMESTAMP) 
 AS
 DECLARE VARIABLE ICI_POWERFLAG INTEGER;
 DECLARE ICI_NOTFLAG INTEGER;
 BEGIN
	ICI_POWERFLAG=POWER(2, :I_MESSAGEFLAG);
	UPDATE objQual_MESSAGEREPORTED
	SET RESOLVED = 1, 
	RESOLVEDBY = :I_USERID, 
	RESOLVEDDATE = :I_UTCTIMESTAMP
	WHERE MESSAGEID = :I_MESSAGEID; 	
	/* Remove Flag */
	ICI_NOTFLAG=BIN_XOR(:ICI_POWERFLAG,-1);
	UPDATE objQual_MESSAGE 	
	SET FLAGS = BIN_AND(FLAGS,:ICI_NOTFLAG)
	WHERE MESSAGEID = :I_MESSAGEID;
 END;
--GO

CREATE PROCEDURE objQual_MESSAGE_SAVE(
	I_TOPICID		INTEGER,
	I_USERID		INTEGER,
	I_MESSAGE		BLOB SUB_TYPE 1,
	I_USERNAME		varchar(255),
	I_IP			VARCHAR(39),
	I_POSTED		TIMESTAMP,
	I_REPLYTO		INTEGER,
	I_BLOGPOSTID	VARCHAR(128),
	I_EXTERNALMESSAGEID VARCHAR(255),
	I_REFERENCEMESSAGEID VARCHAR(255),
	I_FLAGS			INTEGER,
	I_UTCTIMESTAMP TIMESTAMP
 )
 RETURNS (I_MESSAGEID INTEGER)
 AS
		DECLARE VARIABLE ici_ForumID INTEGER;
		DECLARE VARIABLE ici_ForumFlags INTEGER;
		DECLARE VARIABLE ici_Position INTEGER;
		DECLARE VARIABLE ici_Indent INTEGER;
		DECLARE VARIABLE ici_temp INTEGER;
 BEGIN
	
	   
	IF (I_POSTED IS NULL) THEN
		I_POSTED = :I_UTCTIMESTAMP;
 
	SELECT  x.FORUMID,  y.FLAGS        
	FROM 
		objQual_TOPIC x
	INNER JOIN 
		objQual_FORUM y ON y.FORUMID=x.FORUMID
	WHERE x.TOPICID = :I_TOPICID
	INTO :ici_ForumID,:ici_ForumFlags;
 
	IF (I_REPLYTO IS NULL) THEN
			SELECT  0,0 
			FROM RDB$DATABASE         
				   INTO :ici_Position, 
						:ici_Indent;
						 -- New thread
 
	ELSE IF (I_REPLYTO<0) THEN
		-- Find post to reply to AND indent of this post 
		SELECT FIRST 1 DISTINCT  MESSAGEID, INDENT+1                
		FROM objQual_MESSAGE
		WHERE TOPICID = :I_TOPICID AND REPLYTO IS NULL
		ORDER BY POSTED
		INTO :I_REPLYTO,:ici_Indent; 
	ELSE
		-- Got reply, find indent of this post 
			SELECT INDENT+1 
			FROM objQual_MESSAGE
			WHERE MESSAGEID=:I_REPLYTO
			INTO :ici_Indent;
		 
 
	-- Find position 
	IF (I_REPLYTO IS NOT NULL) THEN
		BEGIN
		 SELECT REPLYTO,"POSITION" 
		 FROM objQual_MESSAGE WHERE MESSAGEID=:I_REPLYTO
		 INTO :ici_temp,:ici_Position ;
		BEGIN
		 IF (ici_temp IS NULL) THEN
			-- We are replying to first post 
			 SELECT MAX("POSITION")+1               
			 FROM objQual_MESSAGE 
			 WHERE TOPICID=:I_TOPICID
			 INTO :ici_Position;
 
		   ELSE
		-- Last position of replies to parent post
			 SELECT MIN("POSITION") 
			 FROM objQual_MESSAGE 
			 WHERE REPLYTO=:ici_temp AND "POSITION">:ici_Position
			 INTO :ici_Position ;
 
		-- No replies, THEN USE parent post's position+1
			 IF (ici_Position IS NULL) THEN
			 BEGIN
				 SELECT "POSITION"+1                   
				 FROM objQual_MESSAGE 
				 WHERE MESSAGEID=:I_REPLYTO
				 INTO :ici_Position;
		-- Increase position of posts after this

		 UPDATE objQual_MESSAGE 
		 SET "POSITION"="POSITION"+1 
		 WHERE TOPICID=:I_TOPICID 
		 AND "POSITION">=:ici_Position; 
			END
		 END
  END
 
	-- Add points to Users total points 
	UPDATE objQual_USER 
	SET POINTS = POINTS + 3  
	WHERE USERID = :I_USERID;       
	-- Here we set bit flag to 0
	SELECT NEXT VALUE FOR SEQ_objQual_MESSAGE_MESSAGEID FROM RDB$DATABASE INTO :I_MESSAGEID;
	INSERT INTO objQual_MESSAGE ( MESSAGEID,USERID, MESSAGE, TOPICID, POSTED, USERNAME, IP, REPLYTO, "POSITION", INDENT, FLAGS, BLOGPOSTID, EXTERNALMESSAGEID, REFERENCEMESSAGEID)
	VALUES ( :I_MESSAGEID, :I_USERID, :I_MESSAGE, :I_TOPICID, :I_POSTED, :I_USERNAME, :I_IP, :I_REPLYTO, :ici_Position, :ici_Indent, BIN_AND(:I_FLAGS,BIN_XOR(16,-1)), :I_BLOGPOSTID,:I_EXTERNALMESSAGEID,
	:I_REFERENCEMESSAGEID );
	

	IF ((BIN_AND(:I_FLAGS, 16) = 16)) THEN
	  EXECUTE PROCEDURE objQual_MESSAGE_APPROVE (:I_MESSAGEID); 
	  	  SUSPEND;
	  END;	
	
	
--GO






CREATE PROCEDURE objQual_MESSAGE_SIMPLELIST(
				I_STARTID INTEGER,
				I_LIMIT   INTEGER)
				RETURNS
				(
				 "MessageID" integer,
				 "TopicID" integer
				)
				AS        
BEGIN        

if (I_LIMIT IS NULL OR I_LIMIT=0) THEN I_LIMIT=1000;
if (I_STARTID IS NULL) THEN I_STARTID=0;    

	  FOR SELECT   FIRST (:I_LIMIT) m.MESSAGEID,
				 m.TOPICID        
		FROM     objQual_MESSAGE m
		WHERE    m.MESSAGEID >=:I_STARTID 
		AND  m.MESSAGEID <(:I_LIMIT+:I_STARTID)
		AND  m.TOPICID IS NOT NULL ORDER BY m.MESSAGEID
		INTO
		:"MessageID",
		:"TopicID"
		DO SUSPEND;        
		
	END;
--GO 


CREATE PROCEDURE objQual_MESSAGE_UNAPPROVED(I_FORUMID INTEGER)
	  RETURNS
	  (
"MessageID" integer,
"UserID" integer, 
"UserName" varchar(128),
"Posted" timestamp,
"TopicID"  integer,
"Topic" character varying(128),
"Message" BLOB SUB_TYPE 1,
"Flags" integer,
"IsModeratorChanged" BOOL
)
	  AS
	  BEGIN
	 FOR SELECT
	  b.MESSAGEID AS "MessageID",
	  b.USERID AS "UserID",
	  COALESCE(b.USERNAME,c.NAME) AS "UserName",
	  b.POSTED AS "Posted",
	  a.TOPICID AS "TopicID",
	  a.TOPIC AS "Topic",
	  b.MESSAGE AS "Message",
	  b.FLAGS AS "Flags",
	  b.ISMODERATORCHANGED AS "IsModeratorChanged"
	  FROM
	  objQual_TOPIC a
	  INNER JOIN objQual_MESSAGE b on b.TOPICID = a.TOPICID
	  INNER JOIN objQual_USER c on c.USERID = b.USERID
	  WHERE
	  a.FORUMID = :I_FORUMID AND
	  BIN_AND(b.FLAGS, 16)=0 AND
		BIN_AND(a.FLAGS, 8)=0 AND
		BIN_AND(b.FLAGS, 8)=0
	ORDER BY
		a.POSTED
		INTO
		:"MessageID",
		:"UserID", 
		:"UserName",
		:"Posted",
		:"TopicID",
		:"Topic",
		:"Message",
		:"Flags",
		:"IsModeratorChanged"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_UPDATE
(I_MESSAGEID INTEGER,
I_PRIORITY INTEGER,
I_SUBJECT varchar(128),
I_STATUS varchar(255),
I_STYLES varchar(255),
I_DESCRIPTION varchar(255),
I_FLAGS INTEGER, 
I_MESSAGE BLOB SUB_TYPE 1, 
I_REASON varchar(128), 
I_EDITEDBY INTEGER,
I_ISMODERATORCHANGED BOOL, 
I_OVERRIDEAPPROVAL BOOL,
I_ORIGINALMESSAGE BLOB SUB_TYPE 1,
I_UTCTIMESTAMP TIMESTAMP) 
AS
	 DECLARE VARIABLE ici_TopicID	INTEGER;
	 DECLARE VARIABLE ici_ForumFlags	INTEGER;
	 DECLARE VARIABLE binFlag	INTEGER;
	 DECLARE VARIABLE i_FlagNot	INTEGER;
BEGIN
	binFlag =BIN_AND(:ici_ForumFlags, 8);
	i_FlagNot=BIN_XOR(16,-1);
 -- cleare bit for PollAccess to 0
	I_FLAGS = BIN_AND(:I_FLAGS,:i_FlagNot); 	
	SELECT 
	a.TOPICID,
	c.FLAGS       
	FROM 
		objQual_MESSAGE a
		INNER JOIN objQual_TOPIC b ON b.TOPICID = a.TOPICID
		INNER JOIN objQual_FORUM c ON c.FORUMID = b.FORUMID
	WHERE 
		a.MESSAGEID = :I_MESSAGEID
		 INTO :ici_TopicID,:ici_ForumFlags;
 
	IF (:I_OVERRIDEAPPROVAL = 1 OR :binFlag =0) 
	THEN I_FLAGS = BIN_OR(:I_FLAGS, 16); 
 
 -- insert current message variant - use OriginalMessage in future 	
	insert into objQual_MESSAGEHISTORY
	   (MESSAGEID,		
		MESSAGE,
		IP,
		EDITED,
		EDITEDBY,		
		EDITREASON,
		ISMODERATORCHANGED,
		FLAGS)
	select 	 
	MESSAGEID, 
	(SELECT :I_ORIGINALMESSAGE FROM RDB$DATABASE), 
	IP , 
	COALESCE(EDITED,POSTED), 
	COALESCE(EDITEDBY,USERID), 
	EDITREASON, 
	ISMODERATORCHANGED, 
	FLAGS
	from objQual_MESSAGE where
		MESSAGEID = :I_MESSAGEID;
	
 
	UPDATE objQual_MESSAGE SET
		MESSAGE = :I_MESSAGE,		
		EDITED = :I_UTCTIMESTAMP,
		EDITEDBY = :I_EDITEDBY,
		FLAGS = :I_FLAGS,
		ISMODERATORCHANGED  = :I_ISMODERATORCHANGED,
		EDITREASON = :I_REASON
	WHERE
		MESSAGEID = :I_MESSAGEID;
 
	IF (I_PRIORITY IS NOT NULL) THEN
		UPDATE objQual_TOPIC SET
			"PRIORITY" = :I_PRIORITY
		WHERE
			TOPICID = :ici_TopicID;
	
 
	IF (NOT I_SUBJECT = '' AND I_SUBJECT IS NOT NULL) THEN
		UPDATE objQual_TOPIC SET
			TOPIC =:I_SUBJECT, DESCRIPTION = :I_DESCRIPTION,	
		STATUS = (SELECT :I_STATUS FROM RDB$DATABASE),
		STYLES = :I_STYLES
		WHERE
			TOPICID = :ici_TopicID;

	
	-- If forum is moderated, make sure last post pointers are correct
	
	IF (binFlag<>0) THEN 
	EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST null,null;
	-- EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST (ici_ForumID);
	
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_DELETE(I_MESSAGEID INTEGER, I_ERASEMESSAGE BOOL) 
AS
DECLARE VARIABLE ici_TopicID		INTEGER;
	DECLARE VARIABLE ici_ForumID		INTEGER;
	DECLARE VARIABLE ici_ForumID2	INTEGER;
	DECLARE VARIABLE ici_MessageCount	INTEGER;
	DECLARE VARIABLE ici_LastMessageID	INTEGER;
	DECLARE VARIABLE ICI_USERID		    INTEGER;
	DECLARE VARIABLE ici_LastTopicID_Check INTEGER;
	DECLARE VARIABLE ici_LastMessageID_Check INTEGER;
BEGIN
	

		
		  
	/*Find TopicID and ForumID*/
	SELECT b.TOPICID,b.FORUMID         
		FROM 
			objQual_MESSAGE a
			INNER JOIN  objQual_TOPIC b 
			ON b.TOPICID=a.TOPICID
		WHERE
			a.MESSAGEID=:I_MESSAGEID
			INTO :ici_TopicID,:ici_ForumID;
 
	/*UPDATE LastMessageID in Topic*/
	UPDATE objQual_TOPIC SET 
		LASTPOSTED = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	WHERE LASTMESSAGEID = :I_MESSAGEID;

	/*UPDATE LastMessageID in Forum*/
	UPDATE objQual_FORUM SET 
		LASTPOSTED = NULL,
		LASTTOPICID = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	WHERE LASTMESSAGEID = :I_MESSAGEID;
 
	SELECT USERID FROM objQual_MESSAGE 
	WHERE MESSAGEID = :I_MESSAGEID
	INTO :ICI_USERID;	
 
	-- should it be physically deleted or not
	IF (I_ERASEMESSAGE = 1) THEN
	BEGIN
		DELETE FROM objQual_ATTACHMENT 
		WHERE MESSAGEID = :I_MESSAGEID;
		DELETE FROM objQual_MESSAGEREPORTED 
		WHERE MESSAGEID = :I_MESSAGEID;
		DELETE FROM objQual_MESSAGEREPORTEDAUDIT 
		WHERE MESSAGEID = :I_MESSAGEID;
		DELETE FROM objQual_THANKS 
		WHERE MESSAGEID = :I_MESSAGEID; 
		DELETE FROM objQual_MESSAGEHISTORY 
		WHERE MESSAGEID = :I_MESSAGEID; 
		DELETE FROM objQual_MESSAGE 
		WHERE MESSAGEID = :I_MESSAGEID; 		
		END	
	ELSE 		
		UPDATE objQual_MESSAGE SET FLAGS = BIN_OR(FLAGS, 8)
		WHERE MESSAGEID = :I_MESSAGEID;

	
	-- UPD user post count
	UPDATE objQual_USER 
	SET NUMPOSTS = 
	(SELECT count(MESSAGEID) 
	FROM objQual_MESSAGE 
	WHERE USERID = :ICI_USERID AND ISDELETED = 0 
	AND ISAPPROVED = 1) WHERE USERID = :ICI_USERID;
	
	/* Delete topic if there are no more messages*/
	IF (NOT EXISTS (SELECT FIRST 1 1  
	FROM objQual_MESSAGE WHERE TOPICID = :ici_TopicID 
	AND BIN_AND(FLAGS, 8)=0)) THEN	
	EXECUTE PROCEDURE objQual_TOPIC_DELETE :ici_TopicID, 1, :I_ERASEMESSAGE; 
 
	/*UPDATE lastpost*/
	EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST :ici_ForumID,:ici_TopicID;
	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST :ici_ForumID;
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ForumID;
 
	/*UPDATE topic numposts*/
	UPDATE objQual_TOPIC SET
		NUMPOSTS = 
		(SELECT COUNT(1) FROM objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID 
		and x.ISAPPROVED = 1 and x.ISDELETED = 0)
		WHERE TOPICID = :ici_TopicID;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_DELETEUNDELETE
(I_MESSAGEID INTEGER, 
I_ISMODERATORCHANGED BOOL, 
I_DELETEREASON varchar(128), 
I_ISDELETEACTION INTEGER)
AS
	DECLARE VARIABLE ici_TopicID		INTEGER;
	DECLARE VARIABLE ici_ForumID		INTEGER;
	DECLARE VARIABLE ici_ForumID2       INTEGER;
	DECLARE VARIABLE ici_MessageCount	INTEGER;
	DECLARE VARIABLE ici_LastMessageID	INTEGER;
	DECLARE VARIABLE ICI_USERID		    INTEGER;
	DECLARE VARIABLE ici_LastTopicID_Check   INTEGER;
	DECLARE VARIABLE ici_LastMessageID_Check INTEGER;
	DECLARE VARIABLE i_DelAction		    INTEGER;
BEGIN 	
i_DelAction=:I_ISDELETEACTION*8;
	/*Find TopicID and ForumID*/
	SELECT b.TOPICID,b.FORUMID        
	FROM 
		objQual_MESSAGE a
		INNER JOIN objQual_TOPIC b 
		ON b.TOPICID=a.TOPICID
	WHERE 
		a.MESSAGEID=:I_MESSAGEID
		INTO :ici_TopicID,:ici_ForumID;
 
	/*Update LastMessageID in Topic and Forum*/
	UPDATE objQual_TOPIC SET
		LASTPOSTED = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	WHERE LASTMESSAGEID = :I_MESSAGEID;
 
	UPDATE objQual_FORUM 
			SET
		LASTPOSTED = NULL,
		LASTTOPICID = NULL,
		LASTMESSAGEID = NULL,
		LASTUSERID = NULL,
		LASTUSERNAME = NULL
	   WHERE LASTMESSAGEID = :I_MESSAGEID;
 /*get the userID for this message...*/ 	
	 SELECT USERID  
	 FROM objQual_MESSAGE 
	 WHERE MESSAGEID = :I_MESSAGEID
	 INTO :ICI_USERID;
 
	/* "Delete" message*/
	 UPDATE objQual_MESSAGE 
	 SET ISMODERATORCHANGED = :I_ISMODERATORCHANGED 
	 WHERE MESSAGEID = :I_MESSAGEID 
	 AND (BIN_AND(FLAGS, 8) <> :i_DelAction);
	UPDATE objQual_MESSAGE 
	SET DELETEREASON = :I_DELETEREASON 
	WHERE MESSAGEID = :I_MESSAGEID 
	AND (BIN_AND(FLAGS, 8) <> :i_DelAction);
	UPDATE objQual_MESSAGE 
	SET FLAGS = BIN_XOR(FLAGS, 8) WHERE MESSAGEID =:I_MESSAGEID 
	AND (BIN_AND(FLAGS, 8) <> :i_DelAction);
	 
	 /* update num posts for user now that the delete/undelete status has been toggled...*/
	 UPDATE objQual_USER 
	 SET NUMPOSTS = (SELECT count(MESSAGEID) 
	 FROM objQual_MESSAGE 
	 WHERE USERID = :ICI_USERID AND ISDELETED = 0 
	 AND ISAPPROVED = 1) WHERE USERID = :ICI_USERID;
 
	/* Delete topic if there are no more messages*/
	IF (NOT EXISTS (SELECT FIRST 1 1  
	FROM objQual_MESSAGE WHERE TOPICID = :ici_TopicID 
	AND BIN_AND(FLAGS, 8)=0)) THEN	
	EXECUTE PROCEDURE objQual_TOPIC_DELETE (:ici_TopicID,0,0);
	/*update lastpost*/
	EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST :ici_ForumID,:ici_TopicID;
	EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST :ici_ForumID;
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS :ici_ForumID;
	/* update topic numposts*/
	UPDATE objQual_TOPIC set
		NUMPOSTS = 
		(select count(1) from objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID 
		and x.ISAPPROVED = 1 and x.ISDELETED = 0 )
	WHERE TOPICID = :ici_TopicID;
END;
--GO

CREATE PROCEDURE objQual_NNTPFORUM_DELETE(I_NNTPFORUMID INTEGER) 
AS
BEGIN
DELETE FROM objQual_NNTPTOPIC where NNTPFORUMID = :I_NNTPFORUMID;
DELETE FROM objQual_NNTPFORUM where NNTPFORUMID = :I_NNTPFORUMID;
END;
--GO
CREATE PROCEDURE objQual_NNTPFORUM_LIST(
I_BOARDID INTEGER,
I_MINUTES INTEGER,
I_NNTPFORUMID INTEGER,
I_ACTIVE BOOL, 
I_UTCTIMESTAMP TIMESTAMP) 
RETURNS
(
"Name" VARCHAR(128),
"Address" varchar(128),
"Port" integer,
"UserName" varchar(128),
"UserPass" VARCHAR(128),
"NntpServerID" integer,
"NntpForumID" integer,
"GroupName" varchar(128),
"ForumID" integer,
"LastMessageNo" integer,
"LastUpdate" timestamp,
"Active" BOOL,
"DateCutOff" timestamp,
"ForumName" varchar(128) 
)
AS
BEGIN
	FOR SELECT
		a.NAME,
		a.ADDRESS,
		COALESCE(a."PORT",119) AS "Port",
		a.USERNAME,
		a.USERPASS,		
		a.NNTPSERVERID,
		b.NNTPFORUMID,		
		b.GROUPNAME,
		b.FORUMID,
		b.LASTMESSAGENO,
		b.LASTUPDATE,
		b."ACTIVE",
		b.DATECUTOFF,
		c.NAME AS "ForumName" 
	FROM
		objQual_NNTPSERVER a
		JOIN objQual_NNTPFORUM b 
				ON b.NNTPSERVERID = a.NNTPSERVERID
		JOIN objQual_FORUM c 
				ON c.FORUMID = b.FORUMID
	WHERE
		(:I_MINUTES IS NULL 
				 OR (EXTRACT (MINUTE  FROM  :I_UTCTIMESTAMP) - EXTRACT (MINUTE  FROM  b.LASTUPDATE))>:I_MINUTES) AND
		(:I_NNTPFORUMID IS NULL OR b.NNTPFORUMID = :I_NNTPFORUMID) AND
		a.BOARDID=:I_BOARDID AND
		(:I_ACTIVE IS NULL OR b."ACTIVE"=:I_ACTIVE)
	ORDER BY
		a.NAME,
		b.GROUPNAME
		INTO
		:"Name",
		:"Address",
		:"Port",
		:"UserName",
		:"UserPass",
		:"NntpServerID",
		:"NntpForumID",
		:"GroupName",
		:"ForumID",
		:"LastMessageNo",
		:"LastUpdate",
		:"Active",
		:"DateCutOff",
		:"ForumName"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_NNTPFORUM_SAVE(
                 I_NNTPFORUMID INTEGER,
				 I_NNTPSERVERID INTEGER,
				 I_GROUPNAME varchar(128),
				 I_FORUMID INTEGER,
				 I_ACTIVE BOOL,				 
				 I_DATECUTOFF TIMESTAMP,
				 I_UTCTIMESTAMP TIMESTAMP) 
AS
BEGIN
	IF (I_NNTPFORUMID IS NULL) THEN
		INSERT INTO objQual_NNTPFORUM(NNTPFORUMID,NNTPSERVERID,GROUPNAME,FORUMID,LASTMESSAGENO,LASTUPDATE,"ACTIVE", DATECUTOFF )
		VALUES((SELECT NEXT VALUE FOR SEQ_objQual_NNTPFORUM_NNTPFORUMID FROM RDB$DATABASE),:I_NNTPSERVERID,:I_GROUPNAME,:I_FORUMID,0,:I_UTCTIMESTAMP,:I_ACTIVE, :I_DATECUTOFF);
	ELSE
		UPDATE objQual_NNTPFORUM SET
			NNTPSERVERID = :I_NNTPSERVERID,
			GROUPNAME = :I_GROUPNAME,
			FORUMID = :I_FORUMID,
			"ACTIVE" = :I_ACTIVE,
			DATECUTOFF = :I_DATECUTOFF
		WHERE NNTPFORUMID = :I_NNTPFORUMID;
	  
END;
--GO

CREATE PROCEDURE objQual_NNTPFORUM_UPDATE(I_NNTPFORUMID INTEGER,I_LASTMESSAGENO INTEGER,I_USERID INTEGER, I_UTCTIMESTAMP TIMESTAMP) 
AS
DECLARE	ici_ForumID	INTEGER;
BEGIN 	
	
	SELECT FORUMID from objQual_NNTPFORUM 
	where NNTPFORUMID=:I_NNTPFORUMID
	INTO :ici_ForumID ;
 
	UPDATE objQual_NNTPFORUM SET
		LASTMESSAGENO = :I_LASTMESSAGENO,
		LASTUPDATE = :I_UTCTIMESTAMP
	WHERE NNTPFORUMID = :I_NNTPFORUMID;
 
	UPDATE objQual_TOPIC SET 
		NUMPOSTS = 
		(SELECT COUNT(1) FROM objQual_MESSAGE x 
		WHERE x.TOPICID=objQual_TOPIC.TOPICID 
		AND x.ISAPPROVED = 1 AND x.ISDELETED = 0)
	WHERE FORUMID=:ici_ForumID;
 
	/* EXECUTE PROCEDURE objQual_USER_UPGRADE(I_USERID) */
	EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS(:ici_ForumID);
	/* EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST ici_ForumID,null*/
END;
--GO

CREATE PROCEDURE objQual_NNTPSERVER_DELETE(I_NNTPSERVERID INTEGER) 
AS
BEGIN
	DELETE FROM objQual_NNTPTOPIC 
	WHERE NNTPFORUMID 
	IN (SELECT NNTPFORUMID FROM objQual_NNTPFORUM 
	WHERE NNTPSERVERID = :I_NNTPSERVERID);
	DELETE FROM objQual_NNTPFORUM 
	WHERE NNTPSERVERID = :I_NNTPSERVERID;
	DELETE FROM objQual_NNTPSERVER 
	WHERE NNTPSERVERID = :I_NNTPSERVERID;
END;
--GO

CREATE PROCEDURE objQual_NNTPSERVER_LIST(I_BOARDID INTEGER,I_NNTPSERVERID INTEGER)
RETURNS
(
"NntpServerID" integer,
"BoardID" integer,
"Name" VARCHAR(128),
"Address" varchar(128),
"Port" integer,
"UserName" varchar(128),
"UserPass" VARCHAR(128)
)
AS
BEGIN
	IF (I_NNTPSERVERID IS NULL) THEN
		FOR SELECT * FROM objQual_NNTPSERVER 
		WHERE BOARDID=:I_BOARDID ORDER BY NAME
		INTO
		:"NntpServerID",
		:"BoardID",
		:"Name",
		:"Address",
		:"Port",
		:"UserName",
		:"UserPass"
		DO SUSPEND;
	ELSE
		FOR SELECT * FROM objQual_NNTPSERVER 
		WHERE NNTPSERVERID=:I_NNTPSERVERID
		INTO
		:"NntpServerID",
		:"BoardID",
		:"Name",
		:"Address",
		:"Port",
		:"UserName",
		:"UserPass"
		DO SUSPEND;
		
END;
--GO

CREATE PROCEDURE objQual_NNTPSERVER_SAVE(
	I_NNTPSERVERID 	INTEGER,
	I_BOARDID	INTEGER,
	I_NAME		VARCHAR(128),
	I_ADDRESS	varchar(128),
	I_PORT		INTEGER,
	I_USERNAME	varchar(128),
	I_USERPASS	VARCHAR(128)
 )  
 AS BEGIN
	IF (I_NNTPSERVERID IS NULL) THEN
		INSERT INTO objQual_NNTPSERVER(NNTPSERVERID,NAME,BOARDID,ADDRESS,"PORT",USERNAME,USERPASS)
		VALUES((SELECT NEXT VALUE FOR SEQ_objQual_NNTPSERVER_NNTPSERVERID FROM RDB$DATABASE),:I_NAME,:I_BOARDID,:I_ADDRESS,:I_PORT,:I_USERNAME,:I_USERPASS);
	ELSE
		UPDATE objQual_NNTPSERVER SET
			NAME = :I_NAME,
			ADDRESS = :I_ADDRESS,
			"PORT" = :I_PORT,
			USERNAME = :I_USERNAME,
			USERPASS = :I_USERPASS
		WHERE NNTPSERVERID = :I_NNTPSERVERID;
	   
END;
--GO

CREATE PROCEDURE objQual_NNTPTOPIC_LIST(I_THREAD VARCHAR(64))
RETURNS
( "NntpTopicID" INTEGER,
  "NntpForumID" INTEGER,
  "Thread" CHAR(32) CHARACTER SET UTF8,
  "TopicID" INTEGER)
AS
BEGIN
	FOR SELECT
		a.*
	FROM
		objQual_NNTPTOPIC a
	WHERE
		a."THREAD" = :I_THREAD
		INTO
		:"NntpTopicID",
		:"NntpForumID",
		:"Thread",
		:"TopicID"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_ACTIVEACCESS_RESET 
 AS 
      BEGIN
      DELETE FROM objQual_ACTIVE;
      DELETE FROM objQual_ACTIVEACCESS;
	  END;
--GO

CREATE PROCEDURE objQual_NNTPTOPIC_SAVEMESSAGE(
	I_NNTPFORUMID	INTEGER,
	I_TOPIC 			VARCHAR(128),
	I_BODY 			BLOB SUB_TYPE 1,
	I_USERID 		INTEGER,
	I_USERNAME		VARCHAR(128),
	I_IP			VARCHAR(39),
	I_POSTED			TIMESTAMP,
	I_EXTERNALMESSAGEID	VARCHAR(255),
	I_REFERENCEMESSAGEID VARCHAR(255),
	I_UTCTIMESTAMP TIMESTAMP
 ) 
 AS
	DECLARE	ici_ForumID	INTEGER;
	DECLARE	ici_ParentID	INTEGER;
	DECLARE ici_TopicID	INTEGER;
	DECLARE	ici_MessageID	INTEGER;
	DECLARE ici_LastTopicID_Check INTEGER;
	DECLARE ici_LastMessageID_Check INTEGER;
	DECLARE ici_NntpTopicID INTEGER;
	DECLARE FlagDeleted BOOL DEFAULT 0;
	DECLARE FlagApproved BOOL DEFAULT 1;
	DECLARE ici_ReplyTo INTEGER;
 BEGIN
	
	SELECT FORUMID 
	FROM objQual_NNTPFORUM 
	WHERE NNTPFORUMID=:I_NNTPFORUMID
	INTO :ici_ForumID ;
		
	IF (EXISTS(SELECT FIRST 1 1 FROM objQual_MESSAGE 
	WHERE EXTERNALMESSAGEID=:I_REFERENCEMESSAGEID)) THEN 
	 	
	   			-- referenced message exists		
		SELECT TOPICID, REPLYTO  
		FROM objQual_MESSAGE
		WHERE EXTERNALMESSAGEID=:I_REFERENCEMESSAGEID 
		INTO :ici_TopicID, :ici_ReplyTo;
	

	 ELSE
	 if (NOT EXISTS(SELECT FIRST 1 1 FROM objQual_MESSAGE WHERE EXTERNALMESSAGEID=:I_EXTERNALMESSAGEID)) THEN
	 BEGIN 
	 	if (I_REFERENCEMESSAGEID IS NULL) THEN
		BEGIN
			-- thread doesn't exists
		SELECT NEXT VALUE FOR SEQ_objQual_TOPIC_TOPICID FROM RDB$DATABASE INTO :ici_TopicID;
		INSERT INTO objQual_TOPIC(TOPICID,FORUMID,USERID,USERNAME,POSTED,TOPIC,VIEWS,"PRIORITY",NUMPOSTS)
		VALUES(:ici_TopicID, :ici_ForumID,:I_USERID,:I_USERNAME,:I_POSTED,:I_TOPIC,0,0,0);
		
		SELECT NEXT VALUE FOR SEQ_objQual_NNTPTOPIC_NNTPTOPICID FROM RDB$DATABASE INTO :ici_NntpTopicID;
		INSERT INTO objQual_NNTPTOPIC(NNTPTOPICID,NNTPFORUMID,"THREAD",TOPICID)
		VALUES (:ici_NntpTopicID,:I_NNTPFORUMID,'',:ici_TopicID);
		END
		/*thread doesn't exists*/
		
	 END

	 IF (ici_TopicID IS NOT NULL) THEN
	 BEGIN
	 	 EXECUTE PROCEDURE objQual_MESSAGE_SAVE		 
		 :ici_TopicID,
		 :I_USERID, 
		 :I_BODY,
		 :I_USERNAME,
		 :I_IP,
		 :I_POSTED,
		 :ici_ReplyTo,
		 NULL,
		 :I_EXTERNALMESSAGEID,
		 :I_REFERENCEMESSAGEID,
		 17,
		 :I_UTCTIMESTAMP
		 RETURNING_VALUES :ici_MessageID;       
		
	 END	
 
	/*save message*/
	
	 
 
	/* update user */
	IF (EXISTS(SELECT 1 FROM objQual_FORUM 
	WHERE FORUMID=:ici_ForumID AND BIN_AND(FLAGS, 4)=0)) THEN 	
		UPDATE objQual_USER 
		SET NUMPOSTS=NUMPOSTS+1 WHERE USERID=:I_USERID;
	
	
	/* update topic */
	UPDATE objQual_TOPIC SET 
		LASTPOSTED		= :I_POSTED,
		LASTMESSAGEID	= :ici_MessageID,
		LASTUSERID		= :I_USERID,
		LASTUSERNAME	= :I_USERNAME,
		NUMPOSTS = NUMPOSTS + 1
	WHERE TOPICID=:ici_TopicID;
		
	UPDATE objQual_FORUM SET
		LASTPOSTED		= :I_POSTED,
		LASTTOPICID	= :ici_TopicID,
		LASTMESSAGEID	= :ici_MessageID,
		LASTUSERID		= :I_USERID,
		LASTUSERNAME	= :I_USERNAME
	WHERE FORUMID=:ici_ForumID AND (LASTPOSTED IS NULL OR LASTPOSTED < :I_POSTED);
EXECUTE PROCEDURE objQual_TOPIC_UPDATELASTPOST(:ici_ForumID,:ici_TopicID);
EXECUTE PROCEDURE objQual_FORUM_UPDATELASTPOST(:ici_ForumID);
EXECUTE PROCEDURE objQual_FORUM_UPDATESTATS(:ici_ForumID);

	/* update forum 

SELECT ParentID 
INTO ici_ParentID
FROM objQual_FORUM
WHERE ForumID = ici_ForumID;

	UPDATE objQual_FORUM SET
		LastPosted		= I_POSTED,
		LastTopicID	= ici_TopicID,
		LastMessageID	= ici_MessageID,
		LastUserID		= I_USERID,
		LastUserName	= I_USERNAME
	WHERE ForumID=ici_ForumID AND (LastPosted IS NULL OR (UNIX_TIMESTAMP(LastPosted) < UNIX_TIMESTAMP(I_POSTED)));
EXECUTE PROCEDURE objQual_topic_updatelasttopic(ici_ForumID,ici_TopicID);
EXECUTE PROCEDURE objQual_forum_updatelasttopic(ici_ForumID);
WHILE ici_ParentID > 0 DO
		UPDATE objQual_FORUM SET
				LastPosted = I_POSTED,
				LastTopicID = ici_TopicID,
				LastMessageID = ici_MessageID,
				LastUserID = I_USERID,
				LastUserName = I_USERNAME
			WHERE ForumID=ici_ForumID AND (LastPosted IS NULL OR UNIX_TIMESTAMP(LastPosted)<UNIX_TIMESTAMP(I_POSTED));    
		 SELECT DISTINCTROW ParentID INTO  ici_ParentID
  FROM  objQual_FORUM
  WHERE ForumID = ici_ParentID;  
  END WHILE; 	
END IF;*/ 
END;
--GO

CREATE PROCEDURE objQual_PMESSAGE_ARCHIVE(I_USERPMESSAGEID INTEGER) 
 AS
 BEGIN
	/* set IsArchived bit */
	UPDATE objQual_USERPMESSAGE 
	SET FLAGS = BIN_OR(FLAGS, 4) 
	WHERE USERPMESSAGEID = :I_USERPMESSAGEID 
	AND ISARCHIVED = 0;
 END;

--GO

CREATE PROCEDURE objQual_PMESSAGE_DELETE(I_USERPMESSAGEID INTEGER, I_FROMOUTBOX BOOL) 
AS
DECLARE VARIABLE ici_PMessageID INTEGER;
DECLARE VARIABLE ici_MsgCount INTEGER;
BEGIN 
	
	SELECT FIRST 1 PMESSAGEID 
	FROM objQual_USERPMESSAGE 
	where USERPMESSAGEID = :I_USERPMESSAGEID 
	ORDER BY PMESSAGEID  
	INTO :ici_PMessageID;
 
	-- set IsInOutbox bit which will remove it from the senders outbox
	/* UPDATE objQual_USERPMESSAGE SET FLAGS = BIN_XOR(FLAGS, 8) 
	WHERE USERPMESSAGEID = :I_USERPMESSAGEID;
	
	
	SELECT COUNT (USERPMESSAGEID) FROM objQual_USERPMESSAGE  
	WHERE  BIN_AND(FLAGS, 8)=0 
	INTO :ici_MsgCount;
	
	IF (ici_MsgCount = 0) THEN
	BEGIN
		DELETE FROM objQual_USERPMESSAGE WHERE PMESSAGEID = :ici_PMessageID;
		DELETE FROM objQual_PMESSAGE WHERE PMESSAGEID = :ici_PMessageID;
	END*/
	
 
IF ( I_FROMOUTBOX = 1 AND EXISTS(SELECT 1 FROM objQual_USERPMESSAGE 
WHERE USERPMESSAGEID = :I_USERPMESSAGEID AND ISINOUTBOX = 1 ) ) THEN
	BEGIN
		-- set IsInOutbox bit which will remove it from the senders outbox
		UPDATE objQual_USERPMESSAGE 
		SET FLAGS = BIN_XOR(Flags, 2) 
		WHERE USERPMESSAGEID = :I_USERPMESSAGEID;
	END
	
	IF ( I_FROMOUTBOX = 0 OR I_FROMOUTBOX IS NULL ) THEN
	BEGIN
		-- The pmessage is in archive but still is in sender outbox  
	IF ( EXISTS(SELECT (1) FROM objQual_USERPMESSAGE WHERE USERPMESSAGEID = :I_USERPMESSAGEID AND ISINOUTBOX = 1 AND ISARCHIVED = 1 AND ISDELETED = 0) ) THEN
	BEGIN
	-- Remove archive flag and set IsDeleted flag
	UPDATE objQual_USERPMESSAGE SET FLAGS = BIN_XOR(FLAGS, 4)  WHERE USERPMESSAGEID = :I_USERPMESSAGEID;	
	END
		-- set is deleted...
		UPDATE objQual_USERPMESSAGE 
		SET FLAGS = BIN_XOR(Flags, 8) 
		WHERE USERPMESSAGEID = :I_USERPMESSAGEID;
	END	
	
	-- see if there are no longer references to this PM.
	IF ( EXISTS(SELECT 1 FROM objQual_USERPMESSAGE 
	WHERE USERPMESSAGEID = :I_USERPMESSAGEID AND ISINOUTBOX = 0 AND ISDELETED = 1 ) ) THEN
	BEGIN
		-- delete
		DELETE FROM objQual_USERPMESSAGE WHERE PMESSAGEID = :ici_PMessageID;
		DELETE FROM objQual_PMESSAGE WHERE PMESSAGEID = :ici_PMessageID;
	END	
 END;
--GO

CREATE PROCEDURE objQual_PMESSAGE_INFO
RETURNS
 (
"NumRead" integer,
"NumUnread" integer,
"NumTotal" integer
)
AS
BEGIN
	FOR SELECT
		(SELECT COUNT(1) FROM objQual_USERPMESSAGE 
		WHERE ISREAD<>0 AND ISDELETED<>8) AS "NumRead",
		(SELECT COUNT(1) FROM objQual_USERPMESSAGE 
		WHERE ISREAD=0 AND ISDELETED<>8) AS "NumUnread",
		(SELECT COUNT(1) FROM objQual_USERPMESSAGE WHERE ISDELETED<>8) AS "NumTotal"
		FROM RDB$DATABASE
		INTO
		:"NumRead",
		:"NumUnread",
		:"NumTotal"
DO SUSPEND;
END;
 --GO

CREATE PROCEDURE objQual_PMESSAGE_LIST(I_FROMUSERID INTEGER,I_TOUSERID INTEGER,I_USERPMESSAGEID INTEGER) 
RETURNS
(
"PMessageID" integer,
"UserPMessageID" integer,
"FromUserID" integer,
"FromUser" varchar(128),
"ToUserID" integer,
"ToUser" varchar(128),
"Created" timestamp,
"Subject" varchar(128),
"Body" BLOB SUB_TYPE 1,
"Flags" integer,
"IsRead" BOOL,
"IsInOutbox" BOOL,
"IsArchived" BOOL,
"IsDeleted" BOOL
)
AS
BEGIN
	FOR SELECT 
	PMESSAGEID, 
	USERPMESSAGEID, 
	FROMUSERID, 
	FROMUSER, 
	TOUSERID, 
	TOUSER, 
	CREATED, 
	SUBJECT, 
	BODY, 
	FLAGS, 
	ISREAD, 
	ISINOUTBOX, 
	ISARCHIVED,
	ISDELETED
		FROM objQual_PMessageView
		WHERE	((:I_USERPMESSAGEID IS NOT NULL 
		AND USERPMESSAGEID=:I_USERPMESSAGEID) OR 
				 (:I_TOUSERID   IS NOT NULL 
				 AND TOUSERID = :I_TOUSERID) OR 
				 (:I_FROMUSERID IS NOT NULL 
				 AND FROMUSERID = :I_FROMUSERID))
		ORDER BY CREATED DESC
		INTO
		:"PMessageID",
		:"UserPMessageID",
		:"FromUserID",
		:"FromUser",
		:"ToUserID",
		:"ToUser",
		:"Created",
		:"Subject",
		:"Body",
		:"Flags",
		:"IsRead",
		:"IsInOutbox",
		:"IsArchived",
		:"IsDeleted"
DO SUSPEND;
END;
--GO
CREATE PROCEDURE objQual_PMESSAGE_MARKREAD(I_USERPMESSAGEID INTEGER)
AS
 BEGIN
	UPDATE objQual_USERPMESSAGE SET FLAGS = BIN_OR(FLAGS, 1) 
	WHERE USERPMESSAGEID = :I_USERPMESSAGEID 
	AND SIGN(BIN_AND(FLAGS, 1)) = 0;
/* IsRead */
END;
--GO


CREATE PROCEDURE objQual_PMESSAGE_SAVE(
	I_FROMUSERID	INTEGER,
	I_TOUSERID	INTEGER,
	I_SUBJECT	varchar(128),
	I_BODY		BLOB SUB_TYPE 1,
	I_FLAGS		INTEGER,
	I_UTCTIMESTAMP TIMESTAMP
	
 ) 
 AS
 DECLARE VARIABLE ici_PMessageID INTEGER;
 DECLARE VARIABLE ICI_USERID INTEGER;
BEGIN
	
	SELECT NEXT VALUE FOR SEQ_objQual_PMESSAGE_PMESSAGEID FROM RDB$DATABASE INTO :ici_PMessageID;
	INSERT INTO objQual_PMESSAGE(PMESSAGEID,FROMUSERID,CREATED,SUBJECT,BODY,FLAGS)
	VALUES(:ici_PMessageID,
	:I_FROMUSERID,:I_UTCTIMESTAMP,:I_SUBJECT,:I_BODY,:I_FLAGS);
	
	IF (I_TOUSERID = 0) THEN
	BEGIN
		INSERT INTO objQual_USERPMESSAGE(USERPMESSAGEID,USERID,PMESSAGEID,FLAGS)
		SELECT
				(SELECT NEXT VALUE FOR SEQ_objQual_USERPME_USERPMESSAGEID FROM RDB$DATABASE),
				a.USERID,
				(SELECT :ici_PMessageID FROM RDB$DATABASE),
				(SELECT 2 FROM RDB$DATABASE)	
				FROM
				objQual_USER a
				JOIN objQual_USERGROUP b 
				on b.USERID=a.USERID
				JOIN objQual_GROUP c 
				on c.GROUPID=b.GROUPID 
				WHERE
				BIN_AND(c.FLAGS, 2)=0 AND
				c.BOARDID=(SELECT BOARDID from objQual_USER x 
				WHERE  x.USERID=:I_FROMUSERID) 
				AND a.USERID<>:I_FROMUSERID
						GROUP BY a.USERID;
						
	END
	ELSE 	
		INSERT INTO objQual_USERPMESSAGE(USERPMESSAGEID,USERID,PMESSAGEID,FLAGS) 
				VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_USERPME_USERPMESSAGEID FROM RDB$DATABASE),:I_TOUSERID,:ici_PMessageID,2);
	
END;
--GO

CREATE procedure objQual_POLL_REMOVE(
	I_POLLGROUPID INTEGER, 
	I_POLLID INTEGER, 
	I_BOARDID INTEGER, 
	I_REMOVECOMPLETELY BOOL, 
	I_REMOVEEVERYWHERE BOOL
 ) 
 AS
 DECLARE VARIABLE ICI_GROUPCOUNT INTEGER;
 BEGIN
	
	if (:I_REMOVECOMPLETELY = 1) THEN
	begin
	-- delete vote records first
	DELETE FROM objQual_POLLVOTE where POLLID = :I_POLLID;
	-- delete choices 
	DELETE FROM objQual_CHOICE where POLLID = :I_POLLID;
	-- delete poll
	UPDATE objQual_POLL set POLLGROUPID = NULL where POLLID = :I_POLLID;
	DELETE FROM objQual_POLL where POLLID = :I_POLLID; 	
	if  (NOT EXISTS (SELECT first 1 1 FROM objQual_POLL where POLLGROUPID = :I_POLLGROUPID)) THEN
        begin
		           Update objQual_TOPIC set POLLID = NULL where POLLID = :I_POLLGROUPID ;  
                   Update objQual_FORUM set POLLGROUPID = NULL where POLLGROUPID = :I_POLLGROUPID;
				   Update objQual_CATEGORY set POLLGROUPID = NULL where POLLGROUPID = :I_POLLGROUPID ;     
		 
        DELETE FROM objQual_POLLGROUPCLUSTER WHERE POLLGROUPID = :I_POLLGROUPID;	
		end  	
	end
	else
	begin    
	Update objQual_POLL set POLLGROUPID = NULL where POLLID = :I_POLLID;                         
	end 
 END;
--GO


CREATE PROCEDURE objQual_POLL_STATS(
I_POLLID INTEGER)
RETURNS
(
"PollID" integer,
"Question" VARCHAR(128),
"Closes" timestamp,
"UserID" integer,
"ObjectPath" VARCHAR(255),
"MimeType" VARCHAR(50),
"QuestionObjectPath" VARCHAR(255),
"QuestionMimeType" VARCHAR(50),
"ChoiceID" integer,
"Choice" VARCHAR(128),
"Votes" integer,
"Total" integer,
"Stats" integer,
"IsBound" bool, 
"IsClosedBound" bool, 	
"AllowMultipleChoices" bool,
"ShowVoters" bool,
"AllowSkipVote" bool
)
AS
DECLARE VARIABLE iciCase INTEGER;
DECLARE VARIABLE iciCount INTEGER;
DECLARE VARIABLE iciStats INTEGER;
BEGIN

SELECT SUM(x.VOTES)
FROM   objQual_CHOICE x
WHERE  x.POLLID = :I_POLLID
INTO :iciCase;

IF (iciCase =0) THEN iciCount =1;
ELSE
iciCount =:iciCase;


FOR SELECT		
a.POLLID,
b.QUESTION,
b.CLOSES,
b.USERID,
a.OBJECTPATH,
a.MIMETYPE,
b.OBJECTPATH,
b.MIMETYPE,
a.CHOICEID,
a.CHOICE,
a.VOTES,
(SELECT :iciCase FROM RDB$DATABASE) AS "Total",
100*a.VOTES/:iciCount AS "Stats",
pg.ISBOUND, 
b.ISCLOSEDBOUND, 	
b.ALLOWMULTIPLECHOICES,
b.SHOWVOTERS,
b.ALLOWSKIPVOTE
FROM   objQual_CHOICE a
INNER JOIN
objQual_POLL b 
ON a.POLLID = b.POLLID
INNER JOIN  
objQual_POLLGROUPCLUSTER pg 
ON pg.POLLGROUPID = b.POLLGROUPID	
WHERE  b.POLLID = a.POLLID
AND b.POLLID = :I_POLLID
INTO
	:"PollID",
	:"Question",
	:"Closes",
	:"UserID",
	:"ObjectPath",
	:"MimeType",
	:"QuestionObjectPath",
	:"QuestionMimeType",
	:"ChoiceID",
	:"Choice",
	:"Votes",
	:"Total",
	:"Stats",
	:"IsBound", 
    :"IsClosedBound", 	
	:"AllowMultipleChoices",
	:"ShowVoters",
    :"AllowSkipVote"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_POLL_UPDATE(
	I_POLLID		INTEGER,
	I_QUESTION	VARCHAR(128),
	I_CLOSES 	TIMESTAMP,	
	I_QUESTIONOBJECTPATH VARCHAR(255), 
    I_QUESTIONMIMETYPE VARCHAR(50),
	I_ISBOUNDED  BOOL,
	I_ISCLOSEDBOUNDED  BOOL,
	I_ALLOWMULTIPLECHOICES BOOL,
	I_SHOWVOTERS BOOL,
	I_ALLOWSKIPVOTE BOOL
 )
 AS 
DECLARE VARIABLE ICI_PGID INTEGER;
DECLARE VARIABLE ICI_FLAGS INTEGER;
BEGIN


		update objQual_POLL
		set FLAGS	= 0 where POLLID = :I_POLLID AND FLAGS IS NULL;

		SELECT FLAGS FROM objQual_POLL		
		where POLLID = :I_POLLID
		INTO :ICI_FLAGS; 

		-- is closed bound flag
		ICI_FLAGS = (CASE				
		WHEN (:I_ISCLOSEDBOUNDED > 0 AND BIN_AND(:ICI_FLAGS,4) <> 4) THEN BIN_OR(:ICI_FLAGS,4)		
		WHEN (:I_ISCLOSEDBOUNDED <= 0 AND BIN_AND(:ICI_FLAGS,4) = 4)  THEN BIN_XOR(:ICI_FLAGS,4)
		ELSE :ICI_FLAGS END);

		-- allow multiple choices flag
		ICI_FLAGS = (CASE				
		WHEN (:I_ALLOWMULTIPLECHOICES > 0 AND BIN_AND(:ICI_FLAGS, 8) <> 8) THEN BIN_OR(:ICI_FLAGS,8)	
		WHEN (:I_ALLOWMULTIPLECHOICES <= 0 AND BIN_AND(:ICI_FLAGS, 8) = 8)  THEN BIN_XOR(:ICI_FLAGS,8)
		ELSE :ICI_FLAGS END);

		-- show who's voted for a poll flag
		ICI_FLAGS = (CASE				
		WHEN (:I_SHOWVOTERS > 0 AND BIN_AND(:ICI_FLAGS, 16) <> 16) THEN BIN_OR(:ICI_FLAGS,16)	
		WHEN (:I_SHOWVOTERS <= 0 AND BIN_AND(:ICI_FLAGS, 16) = 16)  THEN BIN_XOR(:ICI_FLAGS,16)
		ELSE :ICI_FLAGS END);

		-- allow users don't vote and see results
		ICI_FLAGS = (CASE				
		WHEN (:I_SHOWVOTERS > 0 AND BIN_AND(:ICI_FLAGS, 32) <> 32) THEN BIN_OR(:ICI_FLAGS,32)	
		WHEN (:I_SHOWVOTERS <= 0 AND BIN_AND(:ICI_FLAGS, 32) = 32)  THEN BIN_XOR(:ICI_FLAGS,32)
		ELSE :ICI_FLAGS END);		

	  update objQual_POLL
		set QUESTION	=	:I_QUESTION,
			CLOSES		=	:I_CLOSES,
			OBJECTPATH = :I_QUESTIONOBJECTPATH,
		    MIMETYPE = :I_QUESTIONMIMETYPE,
			FLAGS	= :ICI_FLAGS
		where POLLID = :I_POLLID;

      SELECT  POLLGROUPID FROM objQual_POLL
	  where POLLID = :I_POLLID
	  into :ICI_PGID;
   
	update objQual_POLLGROUPCLUSTER
		set FLAGS	= (CASE 
		WHEN (:I_ISBOUNDED > 0 AND BIN_AND(FLAGS,2) <> 2) THEN BIN_OR(Flags,2) 		
		WHEN (:I_ISBOUNDED <= 0 AND BIN_AND(FLAGS,2) = 2) THEN BIN_XOR(Flags,2) 		
		ELSE FLAGS END)		
		where POLLGROUPID = :ICI_PGID;
END;
--GO

CREATE PROCEDURE objQual_POLLGROUP_ATTACH(
                 I_POLLGROUPID INTEGER, 
				 I_TOPICID INTEGER, 
				 I_FORUMID INTEGER,				 
				 I_CATEGORYID INTEGER, 
				 I_BOARDID INTEGER)
       RETURNS
	   ("Exists" bool)
AS
DECLARE VARIABLE CURPOL INTEGER; 
BEGIN
                   -- this deletes possible polls without choices it should not normally happen
				 
				  for
				   SELECT POLLID FROM objQual_POLL 
				   WHERE POLLGROUPID IS NULL
				   INTO :CURPOL 
                  DO
				  BEGIN
				   DELETE FROM objQual_POLLVOTE WHERE POLLID = :CURPOL;
				   DELETE FROM objQual_CHOICE WHERE POLLID = :CURPOL;
				   DELETE FROM objQual_POLL WHERE POLLID = :CURPOL;
				   SUSPEND;				   
				  END	
				  
				  			   
                   IF (:CURPOL IS NOT NULL) THEN
				    BEGIN
	                   IF (:I_TOPICID > 0) THEN
				         BEGIN
				          IF (EXISTS (SELECT FIRST 1 1 FROM objQual_TOPIC 
				                        where TOPICID = :I_TOPICID  and POLLID is not null)) then
				                         begin
				                            SELECT FIRST 1 SIGN(1) FROM RDB$DATABASE INTO :"Exists";
				                         end
				            else
				              begin
				               UPDATE objQual_TOPIC set POLLID = :I_POLLGROUPID 
				                where TOPICID = :I_TOPICID; 
				              SELECT 0 FROM RDB$DATABASE INTO "Exists";
				              end
				         END              
                  
				   if (:I_FORUMID > 0) THEN
				   begin
				   if (exists (select FIRST 1 1 from objQual_FORUM 
				   where FORUMID = :I_FORUMID and POLLGROUPID is not null)) then
                   begin
				   SELECT 1 FROM RDB$DATABASE INTO "Exists";
				   end
				   else
				   begin
				   Update objQual_FORUM set POLLGROUPID = :I_POLLGROUPID 
				   where FORUMID = :I_FORUMID;
                   SELECT 0 FROM RDB$DATABASE INTO "Exists";
				   end
				   end

	               if (:I_CATEGORYID > 0) THEN
				   begin
				   if (exists (select FIRST 1 1 from objQual_CATEGORY 
				   where CATEGORYID = :I_CATEGORYID and POLLGROUPID is null)) then
                   begin
				   SELECT FIRST 1 SIGN(1) FROM RDB$DATABASE INTO "Exists";
				   end
				   else
				   begin
				   Update objQual_CATEGORY set POLLGROUPID = :I_POLLGROUPID 
				   where CATEGORYID = :I_CATEGORYID;
                   SELECT 0 FROM RDB$DATABASE INTO "Exists";
				   end
				   end
				   end
				   SELECT 1 FROM RDB$DATABASE INTO "Exists";
				   SUSPEND;
		               

END;
--GO


CREATE PROCEDURE objQual_POLLGROUP_LIST(I_USERID INTEGER, I_FORUMID INTEGER, I_BOARDID INTEGER)
RETURNS
(
"Question" varchar(255),
"PollGroupID" integer
)
AS
begin
	FOR select distinct(p.QUESTION), p.POLLGROUPID from objQual_POLL p
	LEFT JOIN 	objQual_POLLGROUPCLUSTER pgc ON pgc.POLLGROUPID = p.POLLGROUPID
	WHERE p.POLLGROUPID is not null
	-- WHERE p.Closes IS NULL OR p.Closes > GETUTCDATE()
	order by p.QUESTION asc
	into :"Question",
         :"PollGroupID"
	DO
	suspend;
end;
--GO

CREATE PROCEDURE objQual_POLLVOTE_CHECK(I_POLLID INTEGER, I_USERID INTEGER,I_REMOTEIP VARCHAR(39))
RETURNS (O_POLLVOTEID INTEGER)
AS
BEGIN
	IF (I_USERID IS NULL) THEN 
	   BEGIN
		/*check by remote IP*/
		IF (I_REMOTEIP IS NOT NULL) THEN  			
			SELECT POLLVOTEID FROM objQual_POLLVOTE
	   WHERE POLLID = :I_POLLID AND REMOTEIP = :I_REMOTEIP
	   INTO :O_POLLVOTEID;
		END
		
	ELSE
		/*check by userid or remote IP*/
		  SELECT POLLVOTEID FROM objQual_POLLVOTE
	   WHERE POLLID = :I_POLLID 
	   AND (USERID = :I_USERID OR REMOTEIP = :I_REMOTEIP)
	   INTO :O_POLLVOTEID;
	   -- we should not return even NULL row!
  IF (ROW_COUNT > 0) THEN SUSPEND;
END;
--GO

CREATE  PROCEDURE objQual_POST_ALLUSER(
				I_BOARDID    INTEGER,
				I_USERID     INTEGER,
				I_PAGEUSERID INTEGER,
				I_TOPCOUNT INTEGER)
				RETURNS
				(
"MessageID" integer,               
"Posted" timestamp,
"Subject" VARCHAR(128),
"Message" BLOB SUB_TYPE 1,
"IP"  VARCHAR(39),
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"Signature" BLOB SUB_TYPE 1,
"TopicID" integer
)
 AS               
BEGIN
		
	 FOR  SELECT FIRST (:I_TOPCOUNT) DISTINCT 
				a.MESSAGEID,
				a.POSTED,
				c.TOPIC AS "Subject",
				a.MESSAGE,
				a.IP,
				a.USERID,
				a.FLAGS,
				COALESCE(a.USERNAME,b.NAME) AS "UserName",
						b.SIGNATURE,
						c.TOPICID
		FROM     objQual_MESSAGE a
				 JOIN objQual_USER b
				   ON b.USERID = a.USERID
				 JOIN objQual_TOPIC c
				   ON c.TOPICID = a.TOPICID
				 JOIN objQual_FORUM d
				   ON d.FORUMID = c.FORUMID
				 JOIN objQual_CATEGORY e
				   ON e.CATEGORYID = d.CATEGORYID
				 JOIN objQual_ACTIVEACCESS x
				   ON x.FORUMID = d.FORUMID
		WHERE    a.USERID = :I_USERID
		AND x.USERID = :I_PAGEUSERID
		AND x.READACCESS <> 0
		AND e.BOARDID = :I_BOARDID
		AND BIN_AND(a.FLAGS, 24) = 16
		AND BIN_AND(c.FLAGS, 8) = 0
		ORDER BY a.POSTED DESC 
		INTO       
		:"MessageID",
		:"Posted",
		:"Subject",
		:"Message",
		:"IP",
		:"UserID",
		:"Flags",
		:"UserName",
		:"Signature",
		:"TopicID"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_POST_LIST
(
I_TOPICID INTEGER,
I_AUTHORUSERID INTEGER,
I_UPDATEVIEWCOUNT SMALLINT, 
I_SHOWDELETED BOOL, 
I_STYLEDNICKS BOOL,
I_SINCEPOSTEDDATE TIMESTAMP, 
I_TOPOSTEDDATE TIMESTAMP, 
I_SINCEEDITEDDATE TIMESTAMP, 
I_TOEDITEDDATE TIMESTAMP, 
I_PAGEINDEX INTEGER, 
I_PAGESIZE INTEGER, 
I_SORTPOSTED INTEGER, 
I_SORTEDITED INTEGER,
I_SORTPOSITION INTEGER,				
I_SHOWTHANKS BOOL,
I_MESSAGEPOSITION  INTEGER               
)
RETURNS
(
		"TopicID" integer,
		"Topic" varchar(255),
		"Priority" integer,
		"Description" varchar(255),
		"Status" varchar(255),
		"Styles" varchar(255),
		"PollID" integer,
		"TopicOwnerID" integer,
		"TopicFlags" integer,
		"ForumFlags" integer,
		"MessageID" integer,
		"Posted" timestamp,
		"Subject" varchar(128),
		"Message" BLOB SUB_TYPE 1,
		"UserID" integer,
		"Position" integer,
		"Indent" integer,
		"IP" VARCHAR(39),
		"Flags" integer,
		"EditReason" varchar(128) ,
		"IsModeratorChanged" BOOL,
		"IsDeleted" BOOL,
		"IsGuest" BOOL,
		"DeleteReason" varchar(128),
		"BlogPostID" varchar(255),
		"ExternalMessageId" varchar(255),
		"ReferenceMessageId" varchar(255),
		"UserName" varchar(128),
		"DisplayName" varchar(255),
		"Suspended" timestamp,
		"Joined" timestamp,
		"Avatar" varchar(128),
		"Signature" varchar(255),
		"Posts" integer,
		"Points" integer,
		"Views" integer,
		"ForumID" integer,
		"RankName" VARCHAR(128),
		"RankImage" varchar(128),		
		"Style" varchar(255),
		"Edited" timestamp,
		"HasAttachments" integer,
		"HasAvatarImage" integer,
		"TotalRows" integer,
		"PageIndex" integer
)
AS 

  DECLARE VARIABLE ici_post_totalrowsnumber INTEGER DEFAULT 0;
  DECLARE VARIABLE ici_firstselectrownum INTEGER DEFAULT 0 ;  
  DECLARE VARIABLE ici_firstselectposted TIMESTAMP;
  DECLARE VARIABLE ici_firstselectedited TIMESTAMP;
  DECLARE VARIABLE ici_floor FLOAT DEFAULT 0;
  DECLARE VARIABLE ici_ceiling FLOAT DEFAULT 0;  
  DECLARE VARIABLE ici_offset INTEGER DEFAULT 0;
  DECLARE VARIABLE ici_retcount INTEGER DEFAULT 0; 
  DECLARE VARIABLE ici_counter INTEGER DEFAULT 0;       
  DECLARE VARIABLE ici_pagecorrection INTEGER DEFAULT 0;
  DECLARE VARIABLE ici_pageshift INTEGER DEFAULT 0;
  DECLARE VARIABLE ici_sortposted INTEGER DEFAULT 0;
  DECLARE VARIABLE ici_pageindex INTEGER DEFAULT 1;
BEGIN
ici_sortposted = :I_SORTPOSTED;
ici_pageindex = :I_PAGEINDEX; 
	   IF (:I_UPDATEVIEWCOUNT>0) THEN
	   BEGIN
	   UPDATE objQual_TOPIC 
		SET VIEWS = VIEWS + 1 WHERE TOPICID = :I_TOPICID;
       END	

	   if (ici_sortposted IS NULL) THEN ici_sortposted = 0;
	   if (ici_pageindex IS NULL) THEN ici_pageindex = 0;

   if (ici_sortposted <= 0) then
   BEGIN
   ici_sortposted = 2;
   END
   /* if (ici_pageindex = 0) then
   BEGIN
   ici_pageindex = 1;
   END */
      -- find total returned count
	SELECT
		COUNT(m.MESSAGEID) 
	FROM
		objQual_MESSAGE m
	WHERE
		m.TOPICID = :I_TOPICID
		-- is approved
		AND m.ISDELETED = 0
		-- is deleted
		AND (m.ISAPPROVED = 1 
		OR ((:I_SHOWDELETED = 1 AND ISDELETED = 1) 
		OR (:I_AUTHORUSERID > 0 AND m.USERID = :I_AUTHORUSERID)))
		AND m.POSTED BETWEEN
		 :I_SINCEPOSTEDDATE AND :I_TOPOSTEDDATE
		 
	INTO 
		 :ici_post_totalrowsnumber;
   ici_pageindex = ici_pageindex + 1;
  
		
		-- select last page	
   IF (I_MESSAGEPOSITION > 0) THEN 
   BEGIN
              -- ici_pageindex = ici_pageindex - 1;
               -- round to ceiling   
               ici_ceiling = (CEILING(cast(:ici_post_totalrowsnumber AS FLOAT)/cast(i_pagesize AS FLOAT))); 
               -- round to floor
               ici_floor = (FLOOR(cast(:ici_post_totalrowsnumber AS FLOAT)/cast(i_pagesize AS FLOAT)));
               -- number of messages on the last page 
               ici_pageshift = i_messageposition - (ici_post_totalrowsnumber - CAST(ici_floor AS integer)*i_pagesize);             
		   IF (:ici_pageshift <= 0) THEN
		       BEGIN
		         ici_pageshift = 0;
		       END
               ELSE
		       BEGIN			  
		         ici_pageshift = CAST((CEILING(cast(:ici_pageshift AS FLOAT)/cast(:i_pagesize AS FLOAT))) AS iNTEGER);
		       END
  
		   ici_pageindex = CAST(:ici_ceiling AS integer) - :ici_pageshift;
		  
		   IF (:ici_ceiling != :ici_floor) THEN
		   BEGIN
		   ici_pageindex = :ici_pageindex - 1;
		   END	
		
		
		ici_firstselectrownum = (ici_pageindex)*i_pagesize + 1; 
   END   	  
   ELSE
   BEGIN
 /*  if (ici_pageindex = 0) then
   BEGIN
   ici_pageindex = 1;
   END  */
    
	ici_firstselectrownum = ((ici_pageindex-1)*i_pagesize) + 1;
	
   END  


   FOR SELECT FIRST 1
		m.POSTED,
		m.EDITED	
	FROM	
 		objQual_MESSAGE m 		
	where
		m.TOPICID = :I_TOPICID
		-- is approved
		AND m.ISAPPROVED = 1		
		-- is deleted
		AND (m.ISDELETED = 0
		OR ((:I_SHOWDELETED= 1 AND m.ISDELETED = 1) 
		OR (:I_AUTHORUSERID > 0 AND m.USERID = :I_AUTHORUSERID)))
		AND m.POSTED BETWEEN
		 :I_SINCEPOSTEDDATE AND :I_TOPOSTEDDATE
		ORDER BY 		
		(case 
        when :i_sortposition = 1 then m."POSITION" end) ASC,	
		(case 
        when :ici_sortposted = 2 then m.POSTED end) DESC,
		(case 
        when :ici_sortposted = 1 then m.POSTED end) ASC, 
		(case 
        when :i_sortedited = 2 then m.EDITED end) DESC,
		(case 
        when :i_sortedited = 1 then m.EDITED end) ASC		
		into :ici_firstselectposted, :ici_firstselectedited	
		DO
			begin
				END
	SELECT :ici_firstselectposted, :ici_firstselectedited from RDB$DATABASE
	INTO :ici_firstselectposted, :ici_firstselectedited ;
	
	FOR SELECT 
		d.TOPICID,
		d.TOPIC,
		d.PRIORITY,
		d.DESCRIPTION,
		d.STATUS,
		d.STYLES,
		d.POLLID,
		d.USERID AS TopicOwnerID,
		d.FLAGS AS "TopicFlags",
		g.FLAGS AS "ForumFlags",
		m.MESSAGEID,
		m.POSTED,
		d.TOPIC AS "Subject",
		m.MESSAGE,
		m.USERID,
		m."POSITION",
		m.INDENT,
		m.IP,
		m.FLAGS,
		m.EDITREASON,
		m.ISMODERATORCHANGED,
		m.ISDELETED,
		b.ISGUEST,
		m.DELETEREASON,
		m.BLOGPOSTID,
		m.EXTERNALMESSAGEID,
		m.REFERENCEMESSAGEID,
		COALESCE(m.USERNAME,b.NAME) AS "UserName",
		b.DISPLAYNAME,
		b.SUSPENDED,
		b.JOINED,
		b.AVATAR,
		b.SIGNATURE,
		b.NUMPOSTS AS "Posts",
		b.POINTS,
		d.VIEWS,
		d.FORUMID,
		c.NAME AS "RankName",
		c.RANKIMAGE,	
		(case(:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=b.USERID AND CHAR_LENGTH(f.STYLE) > 3 ORDER BY f.SORTORDER), c.STYLE)  
			else ''	 end), 
		COALESCE(m.EDITED,m.POSTED) AS "Edited",
		COALESCE((SELECT 1 FROM RDB$DATABASE WHERE EXISTS (SELECT FIRST 1 * FROM objQual_ATTACHMENT x 
		WHERE x.MESSAGEID=m.MESSAGEID)),0) AS "HasAttachments",
		COALESCE((SELECT 1 FROM RDB$DATABASE WHERE EXISTS (SELECT FIRST 1 * FROM objQual_USER x 
		WHERE x.USERID=b.USERID AND AVATARIMAGE IS NOT NULL)),0) AS "HasAvatarImage",
		(select :ici_post_totalrowsnumber FROM RDB$DATABASE) AS TotalRows,
		(select :ici_pageindex FROM RDB$DATABASE) AS PageIndex		
		/* 
		(SELECT COUNT(x.ATTACHMENTID) FROM objQual_ATTACHMENT x 
		WHERE x.MESSAGEID=a.MESSAGEID) AS "HasAttachments",
		(SELECT COUNT(x.USERID) FROM objQual_USER x 
		WHERE x.USERID=b.USERID AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage" */
		FROM
		objQual_MESSAGE m
		JOIN objQual_USER b ON b.USERID=m.USERID
		JOIN objQual_TOPIC d ON d.TOPICID=m.TOPICID
		JOIN objQual_FORUM g ON g.FORUMID=d.FORUMID
		JOIN objQual_CATEGORY h ON h.CATEGORYID=g.CATEGORYID
		JOIN objQual_RANK c ON c.RANKID=b.RANKID
	WHERE
	  m.TOPICID = :I_TOPICID
		-- is approved
		AND m.ISAPPROVED = 1 
		-- is deleted
		AND (m.ISDELETED = 0 
		          OR ((:I_SHOWDELETED = 1 AND m.ISDELETED = 1)
				  OR (:I_AUTHORUSERID > 0 AND m.USERID = :I_AUTHORUSERID)))
		AND (m.POSTED is null OR (m.POSTED is not null
		     AND
			 (m.POSTED >= (case 
        when :ici_sortposted = 1 then
		 :ici_firstselectposted end) 
		     OR m.POSTED <= (case 
        when :ici_sortposted = 2 then :ici_firstselectposted end) 
		     OR
			 m.POSTED >= (case 
        when :ici_sortposted = 0 then CAST('1902-01-01' as timestamp) end)))
		   )	AND
		(m.POSTED <= :i_toposteddate)	
	ORDER BY
		(case 
        when :i_sortposition = 1 then m."POSITION" end) ASC,	
		(case 
        when :ici_sortposted = 2 then m.POSTED end) DESC,
		(case 
        when :ici_sortposted = 1 then m.POSTED end) ASC, 
		(case 
        when :i_sortedited = 2 then m.EDITED end) DESC,
		(case 
        when :i_sortedited = 1 then m.EDITED end) ASC
		-- ROWS 	(:ici_firstselectrownum) TO (:I_PAGESIZE + :ici_firstselectrownum - 1)  
		INTO
		:"TopicID",
		:"Topic",
		:"Priority",
		:"Description",
		:"Status",
		:"Styles",
		:"PollID",
		:"TopicOwnerID",
		:"TopicFlags",
		:"ForumFlags",
		:"MessageID",
		:"Posted",
		:"Subject",
		:"Message",
		:"UserID",
		:"Position",
		:"Indent",
		:"IP",
		:"Flags",
		:"EditReason",
		:"IsModeratorChanged",
		:"IsDeleted",
		:"IsGuest",
		:"DeleteReason",
		:"BlogPostID",
		:"ExternalMessageId",
		:"ReferenceMessageId",
		:"UserName" ,
		:"DisplayName" ,
		:"Suspended",
		:"Joined",
		:"Avatar" ,
		:"Signature",
		:"Posts",
		:"Points",
		:"Views",
		:"ForumID",
		:"RankName",
		:"RankImage",		
		:"Style",
		:"Edited",
		:"HasAttachments",
		:"HasAvatarImage",
		:"TotalRows",
		:"PageIndex"
		DO	BEGIN
		
ici_retcount = :ici_retcount +1; 
if (:ici_retcount between  :ici_firstselectrownum and :ici_firstselectrownum + :I_PAGESIZE) then
begin
 SUSPEND;
ici_counter = :ici_counter + 1; 
end 
if (:ici_counter >= :I_PAGESIZE) then
LEAVE;		
			 
			 END			
END;
--GO

CREATE PROCEDURE objQual_POLLGROUP_STATS(
I_POLLGROUPID INTEGER)
RETURNS
(
"PollID" integer,
"PollGroupID" integer,
"Question" VARCHAR(128),
"Closes" timestamp,
"UserID" integer,
"ObjectPath" VARCHAR(255),
"MimeType" VARCHAR(50),
"QuestionObjectPath" VARCHAR(255),
"QuestionMimeType" VARCHAR(50),
"ChoiceID" integer,
"Choice" VARCHAR(128),
"Votes" integer,
"Total" integer,
"Stats" integer,
"GroupUserID" integer,
"IsBound" bool, 
"IsClosedBound" bool, 	
"AllowMultipleChoices" bool,
"ShowVoters" bool,
"AllowSkipVote" bool
)
AS
DECLARE VARIABLE iciCase INTEGER;
DECLARE VARIABLE iciCount INTEGER;
DECLARE VARIABLE iciStats INTEGER;
BEGIN

FOR SELECT		
a.POLLID,
pg.POLLGROUPID,
b.QUESTION,
b.CLOSES,
b.USERID,
a.OBJECTPATH,
a.MIMETYPE,
b.OBJECTPATH,
b.MIMETYPE,
a.CHOICEID,
a.CHOICE,
a.VOTES,
(SELECT SUM(x.VOTES)
FROM   objQual_CHOICE x
WHERE  x.POLLID = a.POLLID) AS "Total",
0 AS "Stats",
pg.USERID,
pg.ISBOUND, 
b.ISCLOSEDBOUND, 	
b.ALLOWMULTIPLECHOICES,
b.SHOWVOTERS,
b.ALLOWSKIPVOTE
FROM   objQual_CHOICE a
INNER JOIN
objQual_POLL b 
ON a.POLLID = b.POLLID
INNER JOIN  
objQual_POLLGROUPCLUSTER pg 
ON pg.POLLGROUPID = b.POLLGROUPID	
WHERE pg.POLLGROUPID = :I_POLLGROUPID
		ORDER BY pg.POLLGROUPID, a.CHOICEID
INTO  
	:"PollID",
	:"PollGroupID",
	:"Question",
	:"Closes",
	:"UserID",
	:"ObjectPath",
	:"MimeType",
	:"QuestionObjectPath",
	:"QuestionMimeType",
	:"ChoiceID",
	:"Choice",
	:"Votes",
	:"Total",
	:"Stats",
	:"GroupUserID",
	:"IsBound", 
    :"IsClosedBound", 	
	:"AllowMultipleChoices",
	:"ShowVoters",
    :"AllowSkipVote" 
DO 
BEGIN
IF ("Total" = 0) THEN 
"Stats" = 100*"Votes"/1;
ELSE
"Stats" = 100*"Votes"/"Total";
SUSPEND;
END
END;
--GO


CREATE PROCEDURE objQual_POLLGROUP_VOTECHECK(I_POLLGROUPID INTEGER, I_USERID INTEGER, I_REMOTEIP VARCHAR(39)) 
RETURNS
(
"PollID" INTEGER,
"ChoiceID" INTEGER,
"UserName" VARCHAR(255)
)
AS
BEGIN
	IF (:I_USERID IS NULL) THEN
	  BEGIN
		IF (I_REMOTEIP IS NOT NULL) THEN
		BEGIN
			-- check by remote IP
			FOR SELECT pv.POLLID, pv.CHOICEID, usr.Name as UserName
			 FROM objQual_POLLVOTE pv 
			 JOIN objQual_USER usr ON usr.USERID = pv.USERID
			 WHERE pv.POLLID IN ( SELECT POLLID FROM objQual_POLL WHERE POLLGROUPID = :I_POLLGROUPID) AND pv.REMOTEIP = :I_REMOTEIP 
			 INTO :"PollID", :"ChoiceID", :"UserName"
			DO SUSPEND;		
		END
		ELSE
		BEGIN
		-- to get structure		
		   FOR SELECT pv.POLLID, pv.CHOICEID, usr.Name as UserName 
		   FROM objQual_POLLVOTE pv 
		   JOIN objQual_USER usr ON usr.USERID = pv.USERID
		   WHERE pv.POLLID IN ( SELECT POLLID FROM objQual_POLL WHERE POLLGROUPID = :I_POLLGROUPID)
		   INTO :"PollID", :"ChoiceID", :"UserName"
		   DO SUSPEND;	
		END
	  END
	ELSE
	  BEGIN
		-- check by userid or remote IP
		FOR SELECT pv.POLLID, pv.CHOICEID, usr.Name as UserName  
		FROM objQual_POLLVOTE pv
		JOIN objQual_USER usr ON usr.USERID = pv.USERID
		WHERE pv.POLLID IN ( SELECT POLLID FROM objQual_POLL WHERE POLLGROUPID = :I_POLLGROUPID) AND (pv.USERID = :I_USERID OR pv.REMOTEIP = :I_REMOTEIP) 
		INTO :"PollID", :"ChoiceID", :"UserName"
		DO SUSPEND;	
	  END
	 
END;
--GO

CREATE PROCEDURE objQual_POST_LIST_REVERSE10(I_TOPICID INTEGER)
RETURNS
(
"Posted" timestamp,
"Subject" varchar(128),
"Message" BLOB SUB_TYPE 1,
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"Signature" BLOB SUB_TYPE 1
)
AS
BEGIN
	/*set nocount on*/
 
	FOR SELECT FIRST 10
		a.POSTED,
		d.TOPIC AS "Subject",
		a.MESSAGE,
		a.USERID,
		a.FLAGS,
		COALESCE(a.USERNAME,b.NAME) AS "UserName",
		b.SIGNATURE
	FROM
		objQual_MESSAGE a 
		inner join objQual_USER b on b.USERID = a.USERID
		inner join objQual_TOPIC d on d.TOPICID = a.TOPICID
	WHERE
		BIN_AND(a.FLAGS, 24)=16 AND
		a.TOPICID = :I_TOPICID
	ORDER BY
		a.POSTED DESC 
		INTO
		:"Posted",
		:"Subject",
		:"Message",
		:"UserID",
		:"Flags",
		:"UserName",
		:"Signature"
DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_RANK_DELETE(I_RANKID INTEGER) 
AS
BEGIN
	DELETE from objQual_RANK where RANKID = :I_RANKID;
END;
--GO

CREATE PROCEDURE objQual_RANK_LIST(I_BOARDID INTEGER,I_RANKID INTEGER) 
RETURNS
(
  "RankID" integer,
  "BoardID" integer,
  "Name" VARCHAR(128),
  "MinPosts" integer,
  "RankImage" VARCHAR(128),
  "Flags" integer,
  "PMLimit" integer,
  "Style" VARCHAR(255),
  "SortOrder" integer,
  "Description" varchar(128),
  "UsrSigChars" integer,
  "UsrSigBBCodes"  varchar(255),
  "UsrSigHTMLTags" varchar(255),
  "UsrAlbums" integer,
  "UsrAlbumImages"  integer   
  )
AS
BEGIN
	IF (I_RANKID IS NULL) THEN
	FOR	SELECT
			a.*
		FROM
			objQual_RANK a
		WHERE
			a.BOARDID=:I_BOARDID
		ORDER BY
			a.SORTORDER,
		    a.NAME
			INTO
			 :"RankID",
			 :"BoardID",
			 :"Name",
			 :"MinPosts",
			 :"RankImage",
			 :"Flags",
			 :"PMLimit",
			 :"Style",
			 :"SortOrder",
			 :"Description",
			 :"UsrSigChars",
			 :"UsrSigBBCodes",
			 :"UsrSigHTMLTags",
			 :"UsrAlbums",
			 :"UsrAlbumImages"   
	  DO SUSPEND;
	ELSE
	FOR	SELECT
			a.*
		FROM
			objQual_RANK a
		WHERE
			a.RANKID = :I_RANKID
			INTO
			 :"RankID",
			 :"BoardID",
			 :"Name",
			 :"MinPosts",
			 :"RankImage",
			 :"Flags",
			 :"PMLimit",
			 :"Style",
			 :"SortOrder",
			 :"Description",
			 :"UsrSigChars",
			 :"UsrSigBBCodes",
			 :"UsrSigHTMLTags",
			 :"UsrAlbums",
			 :"UsrAlbumImages"   
	  DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_RANK_SAVE(
	I_RANKID		INTEGER,
	I_BOARDID	INTEGER,
	I_NAME		VARCHAR(128),
	I_ISSTART	BOOL,
	I_ISLADDER	BOOL,
	I_MINPOSTS	INTEGER,
	I_RANKIMAGE	VARCHAR(128), 
	I_PMLIMIT INTEGER, 
	I_STYLE VARCHAR(255), 
	I_SORTORDER INTEGER,
	I_DESCRIPTION VARCHAR(128),
	I_USRSIGCHARS INTEGER,
	I_USRSIGBBCODES VARCHAR(255),
	I_USRSIGHTMLTAGS VARCHAR(255),
	I_USRALBUMS INTEGER,
	I_USRALBUMIMAGES INTEGER) 
 AS
 DECLARE ICI_FLAGS INTEGER DEFAULT 0;
BEGIN
	
 
	IF (I_ISLADDER=0) THEN I_MINPOSTS = NULL; 
	IF (I_ISLADDER=1 AND I_MINPOSTS IS NULL) THEN I_MINPOSTS = 0; 
	
	
	IF (I_ISSTART<>0) THEN  ICI_FLAGS = BIN_OR(ICI_FLAGS, 1); 
	IF (I_ISLADDER<>0) THEN ICI_FLAGS = BIN_OR(ICI_FLAGS, 2); 
	
	IF (I_RANKID>0) THEN
		UPDATE objQual_RANK 
		  SET
			NAME = :I_NAME,
			FLAGS = :ICI_FLAGS,
			MINPOSTS = :I_MINPOSTS,
			RANKIMAGE = :I_RANKIMAGE,
			PMLIMIT = :I_PMLIMIT,
			STYLE = :I_STYLE,
			SORTORDER = :I_SORTORDER,
			DESCRIPTION = :I_DESCRIPTION,
			USRSIGCHARS = :I_USRSIGCHARS,
			USRSIGBBCODES = :I_USRSIGBBCODES,
			USRSIGHTMLTAGS = :I_USRSIGHTMLTAGS,
			USRALBUMS = :I_USRALBUMS,
			USRALBUMIMAGES = :I_USRALBUMIMAGES
		WHERE RANKID = :I_RANKID;
	
	ELSE 
		INSERT INTO objQual_RANK(RANKID,BOARDID,NAME,FLAGS,MINPOSTS,RANKIMAGE, PMLIMIT, STYLE, SORTORDER,
						DESCRIPTION,
						USRSIGCHARS,
						USRSIGBBCODES,
						USRSIGHTMLTAGS,
						USRALBUMS,
						USRALBUMIMAGES)
		VALUES((SELECT NEXT VALUE FOR SEQ_objQual_RANK_RANKID FROM RDB$DATABASE),
						:I_BOARDID,
						:I_NAME,
						:ICI_FLAGS,
						:I_MINPOSTS,
						:I_RANKIMAGE,
						:I_PMLIMIT,
						:I_STYLE,
						:I_SORTORDER,
						:I_DESCRIPTION,
						:I_USRSIGCHARS,
						:I_USRSIGBBCODES,
						:I_USRSIGHTMLTAGS,
						:I_USRALBUMS,
						:I_USRALBUMIMAGES);            
		  
END;
--GO

CREATE PROCEDURE objQual_REPLACE_WORDS_DELETE(I_ID INTEGER)
AS
 BEGIN
	DELETE FROM objQual_REPLACE_WORDS WHERE ID = :I_ID;
 END;
--GO



CREATE PROCEDURE objQual_REPLACE_WORDS_LIST
 (
	I_BOARDID INTEGER,
	I_ID INTEGER
 )
 RETURNS
 (
	"ID" integer,
	"BoardID" integer ,
	"BadWord" varchar(255),
	"GoodWord" varchar(255)
)
 AS
 BEGIN
	IF (I_ID IS NOT NULL AND I_ID <> 0) THEN
		FOR SELECT * FROM objQual_REPLACE_WORDS 
		WHERE BOARDID = :I_BOARDID AND ID = :I_ID
		INTO
		:"ID",
		:"BoardID",
		:"BadWord",
		:"GoodWord"
		DO SUSPEND;
	ELSE
		FOR SELECT * FROM objQual_REPLACE_WORDS 
		WHERE BOARDID = :I_BOARDID
		INTO
		:"ID",
		:"BoardID",
		:"BadWord",
		:"GoodWord"
		DO SUSPEND;
		
 END;
--GO


CREATE PROCEDURE objQual_REPLACE_WORDS_SAVE
 (
	I_BOARDID INTEGER,
	I_ID INTEGER,
	i_BADWORD VARCHAR(255),
	i_GOODWORD VARCHAR(255)
 )
 AS
 BEGIN
	IF (I_ID IS NOT NULL AND I_ID <> 0) THEN 	
		UPDATE objQual_REPLACE_WORDS 
		SET BADWORD = :i_BADWORD, 
		GOODWORD = :i_GOODWORD 
		WHERE "ID" = :I_ID;		
		ELSE 	 	
		INSERT INTO objQual_REPLACE_WORDS
			(ID,BOARDID,BADWORD,GOODWORD)
		VALUES
			((SELECT NEXT VALUE FOR SEQ_objQual_REPLACE_WORDS_ID FROM RDB$DATABASE),
			:I_BOARDID,:i_BADWORD,:i_GOODWORD); 
 END;
--GO

CREATE PROCEDURE objQual_RSSTOPIC_LIST(
                 I_FORUMID integer,
				 I_START integer,
				 I_LIMIT integer)
       RETURNS(
	   "Topic" varchar(128),
	   "TopicID" integer,
	   "Name" varchar(128),
	   "LastPosted" timestamp,
	   "LastUserID" integer,
	   "LastMessageID" integer,
	   "LastMessageFlags" INTEGER,
	   "Message" varchar(4000)
	   )
	   AS
	   BEGIN
	   FOR SELECT FIRST (:I_LIMIT) SKIP (:I_START)
	       a.TOPIC,
		   a.TOPICID,
		   b.NAME,
		   COALESCE(a.LASTPOSTED,a.POSTED),
		   COALESCE(a.LastUserID, a.UserID),
		   COALESCE(a.LASTMESSAGEID,
		   (SELECT FIRST 1 m.MESSAGEID FROM objQual_MESSAGE m 
		   WHERE m.TOPICID = a.TOPICID 
		   ORDER BY m.POSTED DESC)),
		   COALESCE(a.LASTMESSAGEFLAGS,22),
		   (SELECT FIRST 1 SUBSTRING("MESSAGE" FROM 1 FOR 8000) 
		   FROM objQual_MESSAGE mes2 
		   WHERE mes2.TopicID = COALESCE(a.TopicMovedID,a.TopicID) AND mes2.IsApproved = 1 AND mes2.IsDeleted = 0 
		   ORDER BY mes2.Posted DESC)
		   FROM objQual_TOPIC a
		   JOIN objQual_FORUM b
		   ON b.FORUMID = a.FORUMID
		   WHERE a.FORUMID = :I_FORUMID
		   AND a.ISDELETED = 0 AND a.TOPICMOVEDID IS NULL 
		   ORDER BY  a.POSTED DESC
		   INTO
		   :"Topic",
		   :"TopicID",
		   :"Name",
		   :"LastPosted",
		   :"LastUserID",
		   :"LastMessageID",
		   :"LastMessageFlags",
		   :"Message"
		DO SUSPEND;
END;
--GO 

CREATE PROCEDURE objQual_SMILEY_DELETE(I_SMILEYID INTEGER)
AS
BEGIN
	IF (I_SMILEYID IS NOT NULL) THEN
		DELETE FROM objQual_SMILEY WHERE SMILEYID=:I_SMILEYID;
	ELSE
		DELETE FROM objQual_SMILEY;
	   
END;
--GO

CREATE PROCEDURE objQual_SMILEY_LIST(I_BOARDID INTEGER,I_SMILEYID INTEGER)
RETURNS
(
	"SmileyID" integer,
	"BoardID" integer,
	"Code" varchar(10),
	"Icon" VARCHAR(128),
	"Emoticon" VARCHAR(128),
	"SortOrder" INTEGER
) 	 
AS
BEGIN
IF (I_SMILEYID IS NULL) THEN
	FOR	
	SELECT 
	SMILEYID,
	BOARDID,
	CODE,
	ICON,
	EMOTICON,
	CAST(SORTORDER AS INTEGER) AS SORTORDER
	 FROM objQual_SMILEY 
		WHERE BOARDID = :I_BOARDID 
		ORDER BY SORTORDER, 
		CHAR_LENGTH("CODE") DESC
		INTO
		:"SmileyID",
		:"BoardID",
		:"Code",
		:"Icon",
		:"Emoticon",
		:"SortOrder"
	DO SUSPEND;
	ELSE
	FOR	SELECT 
	SMILEYID,
	BOARDID,
	CODE,
	ICON,
	EMOTICON,
	CAST(SORTORDER AS INTEGER) AS SORTORDER
	FROM objQual_SMILEY 
		WHERE SMILEYID = :I_SMILEYID 
		ORDER BY SORTORDER
		INTO
		:"SmileyID",
		:"BoardID",
		:"Code",
		:"Icon",
		:"Emoticon",
		:"SortOrder"
	DO SUSPEND;
	   
END;
--GO
CREATE PROCEDURE objQual_SMILEY_LISTUNIQUE(I_BOARDID INTEGER)
RETURNS
(
"Icon" VARCHAR(128), 
"Emoticon" VARCHAR(128),
"Code" varchar(10),
"SortOrder" INTEGER)
AS 
BEGIN
 FOR SELECT 
		ICON, 
		EMOTICON,
		(SELECT FIRST 1 "CODE" from objQual_SMILEY x 
		where x.ICON=objQual_SMILEY.ICON ORDER BY "CODE" ) AS "CODE",
		(SELECT FIRST 1 SORTORDER from objQual_SMILEY x 
		where x.ICON=objQual_SMILEY.ICON ORDER BY x.SORTORDER ASC) AS SORTORDER
	FROM 
		objQual_SMILEY
	WHERE
		BOARDID = :I_BOARDID
	GROUP BY
		ICON,
		EMOTICON
	ORDER BY
		SORTORDER,
		"CODE"
		INTO
		:"Icon", 
		:"Emoticon",
		:"Code",
		:"SortOrder"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_SMILEY_RESORT(I_BOARDID INTEGER,I_SMILEYID INTEGER,I_MOVE INTEGER)
AS
DECLARE ici_Position INTEGER;
DECLARE VARIABLE ici_TotalPosition INTEGER;
BEGIN
	
	
	SELECT SORTORDER FROM objQual_SMILEY 
	WHERE BOARDID=:I_BOARDID AND SMILEYID=:I_SMILEYID
	INTO :ici_Position;
	
	ici_TotalPosition=:ici_Position + :I_MOVE;
 
	IF (ici_Position IS NOT NULL) THEN
	 BEGIN
	IF (I_MOVE > 0) THEN 	
		UPDATE objQual_SMILEY
			SET SORTORDER=SORTORDER-1
			WHERE BOARDID=:I_BOARDID and 
				(SORTORDER BETWEEN :ici_Position AND :ici_TotalPosition) AND
				(SORTORDER BETWEEN 1 and 255);
	
	ELSE IF (I_MOVE < 0) THEN
		update objQual_SMILEY
			set SORTORDER=SORTORDER+1
			where BOARDID=:I_BOARDID and 
				(SORTORDER between :ici_TotalPosition and :ici_Position) and
				(SORTORDER between 0 and 254);
	
 
	ici_Position = ici_Position + I_MOVE;
 
	IF (ici_Position>255) THEN  ici_Position = 255;
	IF (ici_Position<0) THEN  ici_Position = 0; 

	UPDATE objQual_SMILEY
		SET SORTORDER=:ici_Position
		WHERE BOARDID=:I_BOARDID AND 
			SMILEYID=:I_SMILEYID;
END
END;
--GO

CREATE PROCEDURE objQual_SMILEY_SAVE
(I_SMILEYID INTEGER,I_BOARDID INTEGER,I_CODE VARCHAR(10),
I_ICON VARCHAR(128),I_EMOTICON VARCHAR(128),I_SORTORDER SMALLINT,I_REPLACE SMALLINT) 
AS
BEGIN
	IF (I_SMILEYID IS NOT NULL) THEN
		UPDATE objQual_SMILEY 
		SET "CODE" = :I_CODE, 
		ICON = :I_ICON, 
		EMOTICON = :I_EMOTICON, 
		SORTORDER = :I_SORTORDER 
		WHERE SMILEYID = :I_SMILEYID;
	
	ELSE
	BEGIN
		IF (I_REPLACE>0) THEN
			DELETE FROM objQual_SMILEY WHERE "CODE"=:I_CODE; 
				
 
		IF (NOT EXISTS(SELECT 1 from objQual_SMILEY 
							   WHERE BOARDID=:I_BOARDID AND "CODE"=:I_CODE)) THEN
			INSERT INTO objQual_SMILEY(SMILEYID,BOARDID,"CODE",ICON,EMOTICON,SORTORDER) 
			VALUES((SELECT NEXT VALUE FOR SEQ_objQual_SMILEY_SMILEYID FROM RDB$DATABASE),
			:I_BOARDID,:I_CODE,:I_ICON,:I_EMOTICON,:I_SORTORDER); 
				
	END
END;
--GO

CREATE PROCEDURE objQual_TOPIC_ANNOUNCEMENTS
 (
	I_BOARDID INTEGER,
	I_NUMPOSTS INTEGER,
	I_PAGEUSERID INTEGER
 )
 RETURNS
 (
"Topic" varchar(128),
"LastPosted" timestamp, 
"TopicID" integer,
"LastMessageID" integer
)
AS
DECLARE ici_SQL VARCHAR(1000);
 BEGIN

	
  FOR EXECUTE STATEMENT 'SELECT FIRST (' || CAST(:I_NUMPOSTS AS VARCHAR(16))|| ') DISTINCT 
   t.TOPIC, t.LASTPOSTED, t.TOPICID,t.LASTMESSAGEID FROM' ||
   ' objQual_TOPIC t 
						  INNER JOIN objQual_CATEGORY c
						  INNER JOIN objQual_FORUM f 
						  ON c.CATEGORYID = f.CATEGORYID 
						  ON t.FORUMID = f.FORUMID' ||
						  ' JOIN objQual_ACTIVEACCESS v on v.FORUMID=f.FORUMID' ||
					   ' WHERE c.BOARDID = ' || CAST(:I_BOARDID AS VARCHAR(16))
					   || ' AND v.USERID='
					   || CAST(:I_PAGEUSERID AS VARCHAR(16)) ||
					   ' AND (v.READACCESS <> 0 
					   OR BIN_AND(f.FLAGS, 2) = 0) 
					   AND BIN_AND(t.FLAGS, 8) != 8 
					   AND (t."PRIORITY" = 2) ORDER BY t.LASTPOSTED DESC'
					   INTO
					   :"Topic",
					   :"LastPosted", 
					   :"TopicID",
					   :"LastMessageID"
					   DO SUSPEND; 	

 
 END;  
 --GO
 
 CREATE PROCEDURE objQual_TOPIC_CREATE_BY_MESSAGE (
	I_MESSAGEID      INTEGER,
	I_FORUMID	INTEGER,
	I_SUBJECT	varchar(128), 
	I_UTCTIMESTAMP TIMESTAMP
	)
	RETURNS
	(
	"TopicID" INTEGER,
	"MessageID" INTEGER
	)
	AS
	DECLARE		ICI_USERID		INTEGER;
	DECLARE		ici_Posted		TIMESTAMP;
	DECLARE I_TOPICID INTEGER;
	BEGIN    

   SELECT USERID,POSTED 
   from objQual_MESSAGE 
   WHERE MESSAGEID =  :I_MESSAGEID
   INTO :ICI_USERID,:ici_Posted;   

	IF (ici_Posted IS NULL) THEN ici_Posted = :I_UTCTIMESTAMP;
	SELECT NEXT VALUE FOR SEQ_objQual_TOPIC_TOPICID FROM RDB$DATABASE INTO :I_TOPICID;
	INSERT INTO objQual_TOPIC(TOPICID, FORUMID,TOPIC,USERID,POSTED,VIEWS,"PRIORITY",POLLID,USERNAME,NUMPOSTS)
	VALUES(:I_TOPICID,:I_FORUMID,:I_SUBJECT,:ICI_USERID,:ici_Posted,0,0,null,null,0);
  
  /*EXECUTE PROCEDURE objQual_MESSAGE_SAVE (I_TOPICID,ICI_USERID,I_MESSAGE,I_USERNAME,I_IP,ici_Posted,null,null,I_FLAGS, I_MESSAGEID);*/
	SELECT :I_TOPICID ,:I_MESSAGEID FROM RDB$DATABASE 
	INTO :"TopicID",:"MessageID" ;
	SUSPEND;
	END;
--GO



CREATE PROCEDURE objQual_TOPIC_FINDNEXT(I_TOPICID INTEGER)
RETURNS
("TopicID" INTEGER)
AS
 DECLARE ici_LastPosted TIMESTAMP;
 DECLARE ici_ForumID INTEGER;
BEGIN
	
	SELECT LASTPOSTED,FORUMID  FROM objQual_TOPIC 
	WHERE TOPICID = :I_TOPICID AND TOPICMOVEDID IS NULL
	INTO :ici_LastPosted, :ici_ForumID;
	SELECT FIRST 1 TOPICID FROM objQual_TOPIC  
	WHERE LASTPOSTED >:ici_LastPosted 
	AND FORUMID = :ici_ForumID 
	AND BIN_AND(FLAGS, 8) = 0 
	AND TOPICMOVEDID IS NULL
	ORDER BY LASTPOSTED ASC INTO :"TopicID";
	IF (ROW_COUNT > 0) THEN SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_TOPIC_FINDPREV(I_TOPICID INTEGER)
RETURNS
("TopicID" INTEGER)
AS
 DECLARE ici_LastPosted TIMESTAMP;
 DECLARE ici_ForumID INTEGER;
BEGIN	
	SELECT LASTPOSTED,FORUMID  FROM objQual_TOPIC 
	WHERE TOPICID = :I_TOPICID AND TOPICMOVEDID IS NULL
	INTO :ici_LastPosted, :ici_ForumID;
	SELECT FIRST 1 TOPICID FROM objQual_TOPIC  
	WHERE LASTPOSTED < :ici_LastPosted 
	AND FORUMID = :ici_ForumID 
	AND BIN_AND(FLAGS, 8) = 0 
	AND TOPICMOVEDID IS NULL
	ORDER BY LASTPOSTED DESC 
	INTO :"TopicID";
	IF (ROW_COUNT > 0) THEN SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_TOPIC_INFO
 (
	I_TOPICID INTEGER,
	I_SHOWDELETED BOOL
 )
 RETURNS
 (
	"TopicID" integer,
	"ForumID" integer,
	"UserID" integer,
	"UserName" varchar(128),
	"Posted" timestamp,
	"Topic" varchar(128),
	"Description" varchar(255),
	"Status" varchar(255),
	"Views" integer,
	"Priority" integer,
	"PollID" integer,
	"TopicMovedID" integer,
	"LastPosted" timestamp,
	"LastMessageID" integer,
	"LastUserID" integer,
	"LastUserName" varchar(128),
	"NumPosts" integer,
	"Flags" integer,
	"IsDeleted" BOOL,
	"IsQuestion" BOOL,
	"AnswerMessageID" INTEGER,
	"LastMessageFlags" INTEGER,
	"TopicImage" varchar(128)
)
 AS
 BEGIN
	IF (I_TOPICID = 0) THEN I_TOPICID = NULL; 
 
	IF (I_TOPICID IS NULL) THEN
	BEGIN
		IF (I_SHOWDELETED = 1) THEN
		FOR	SELECT TOPICID,
                   FORUMID,
                   USERID,
                   USERNAME, 
                   POSTED,
                   TOPIC,
                   DESCRIPTION,
				   STATUS,
                   VIEWS,
                   "PRIORITY",
                   POLLID,
                   TOPICMOVEDID,
                   LASTPOSTED,
                   LASTMESSAGEID,
                   LASTUSERID,
                   LASTUSERNAME,
                   NUMPOSTS,
                   FLAGS,
                   ISDELETED,
                   ISQUESTION, 
                   ANSWERMESSAGEID,
                   LASTMESSAGEFLAGS,	
                   TOPICIMAGE
				   FROM objQual_TOPIC
			INTO
			   :"TopicID",
			   :"ForumID",
			   :"UserID",
			   :"UserName",
			   :"Posted",
			   :"Topic",
			   :"Description",
			   :"Status",
			   :"Views",
			   :"Priority",
			   :"PollID",
			   :"TopicMovedID",
			   :"LastPosted",
			   :"LastMessageID",
			   :"LastUserID",
			   :"LastUserName",
			   :"NumPosts",
			   :"Flags",
			   :"IsDeleted",              
			   :"IsQuestion" ,
			   :"AnswerMessageID",
			   :"LastMessageFlags",
			   :"TopicImage"
			   DO SUSPEND;
		ELSE
			FOR	SELECT TOPICID,
                   FORUMID,
                   USERID,
                   USERNAME, 
                   POSTED,
                   TOPIC,
                   DESCRIPTION,
                   VIEWS,
                   "PRIORITY",
                   POLLID,
                   TOPICMOVEDID,
                   LASTPOSTED,
                   LASTMESSAGEID,
                   LASTUSERID,
                   LASTUSERNAME,
                   NUMPOSTS,
                   FLAGS,
                   ISDELETED,
                   ISQUESTION, 
                   ANSWERMESSAGEID,
                   LASTMESSAGEFLAGS,	
                   TOPICIMAGE
				   FROM objQual_TOPIC WHERE BIN_AND(FLAGS,8) = 0
			INTO
			   :"TopicID",
			   :"ForumID",
			   :"UserID",
			   :"UserName",
			   :"Posted",
			   :"Topic",
			   :"Description",
			   :"Views",
			   :"Priority",
			   :"PollID",
			   :"TopicMovedID",
			   :"LastPosted",
			   :"LastMessageID",
			   :"LastUserID",
			   :"LastUserName",
			   :"NumPosts",
			   :"Flags",
			   :"IsDeleted",
			   :"IsQuestion" ,
			   :"AnswerMessageID",
			   :"LastMessageFlags",
			   :"TopicImage"
			   DO SUSPEND; 
	END 		
	ELSE
	BEGIN	
		IF (I_SHOWDELETED = 1) THEN
			 FOR	SELECT TOPICID,
                   FORUMID,
                   USERID,
                   USERNAME, 
                   POSTED,
                   TOPIC,
                   DESCRIPTION,
                   VIEWS,
                   "PRIORITY",
                   POLLID,
                   TOPICMOVEDID,
                   LASTPOSTED,
                   LASTMESSAGEID,
                   LASTUSERID,
                   LASTUSERNAME,
                   NUMPOSTS,
                   FLAGS,
                   ISDELETED,
                   ISQUESTION, 
                   ANSWERMESSAGEID,
                   LASTMESSAGEFLAGS,	
                   TOPICIMAGE
				   FROM objQual_TOPIC 
			WHERE TOPICID = :I_TOPICID
			INTO
			   :"TopicID",
			   :"ForumID",
			   :"UserID",
			   :"UserName",
			   :"Posted",
			   :"Topic",
			   :"Description",
			   :"Views",
			   :"Priority",
			   :"PollID",
			   :"TopicMovedID",
			   :"LastPosted",
			   :"LastMessageID",
			   :"LastUserID",
			   :"LastUserName",
			   :"NumPosts",
			   :"Flags",
			   :"IsDeleted",
			   :"IsQuestion" ,
			   :"AnswerMessageID",
			   :"LastMessageFlags",
			   :"TopicImage"
			   DO SUSPEND;
		ELSE
			FOR	SELECT TOPICID,
                   FORUMID,
                   USERID,
                   USERNAME, 
                   POSTED,
                   TOPIC,
                   DESCRIPTION,
                   VIEWS,
                   "PRIORITY",
                   POLLID,
                   TOPICMOVEDID,
                   LASTPOSTED,
                   LASTMESSAGEID,
                   LASTUSERID,
                   LASTUSERNAME,
                   NUMPOSTS,
                   FLAGS,
                   ISDELETED,
                   ISQUESTION, 
                   ANSWERMESSAGEID,
                   LASTMESSAGEFLAGS,	
                   TOPICIMAGE
				   FROM objQual_TOPIC 
			WHERE TOPICID = :I_TOPICID AND BIN_AND(FLAGS, 8) = 0
			INTO
			   :"TopicID",
			   :"ForumID",
			   :"UserID",
			   :"UserName",
			   :"Posted",
			   :"Topic",
			   :"Description",
			   :"Views",
			   :"Priority",
			   :"PollID",
			   :"TopicMovedID",
			   :"LastPosted",
			   :"LastMessageID",
			   :"LastUserID",
			   :"LastUserName",
			   :"NumPosts",
			   :"Flags",
			   :"IsDeleted",
			   :"IsQuestion",
			   :"AnswerMessageID",
			   :"LastMessageFlags",
			   :"TopicImage"
			   DO SUSPEND;		
	END 
		
END;
--GO

CREATE PROCEDURE objQual_TOPIC_LISTMESSAGES(I_TOPICID INTEGER)
RETURNS
(
  "MessageID" integer,
	"TopicID" integer,
	"ReplyTo" integer,
	"Position" integer,
	"Indent" integer,
	"UserID" integer,
	"UserName" VARCHAR(128),
	"Posted" timestamp,
	"Message" BLOB SUB_TYPE 1,
	"IP" VARCHAR(39),
	"Edited" timestamp,
	"Flags" integer,
	"EditReason" VARCHAR(128),
	"DeleteReason" VARCHAR(128),
	"IsModeratorChanged" BOOL,	
	"BlogPostID" VARCHAR(128),
	"ExternalMessageID" integer,
	"ReferenceMessageID" integer,
	"EditedBy" integer,
	"IsDeleted" BOOL,
	"IsApproved" BOOL
	
)
AS
BEGIN
	FOR SELECT 
	          MESSAGEID,
              TOPICID,
              REPLYTO,  
              "POSITION",
              INDENT,
              USERID,
              USERNAME,
              POSTED,
              MESSAGE,  
              IP,
              EDITED,
              FLAGS,   
              EDITREASON,  
              DELETEREASON,  
              ISMODERATORCHANGED, 
              BLOGPOSTID, 
              EXTERNALMESSAGEID,
              REFERENCEMESSAGEID,          
			  EDITEDBY,
              ISDELETED,
              ISAPPROVED	
	 FROM objQual_MESSAGE
	WHERE TOPICID = :I_TOPICID
	INTO
	:"MessageID",
	:"TopicID",
	:"ReplyTo",
	:"Position",
	:"Indent",
	:"UserID" ,
	:"UserName",
	:"Posted",
	:"Message",
	:"IP",
	:"Edited",
	:"Flags",
	:"EditReason",
	:"DeleteReason",
	:"IsModeratorChanged",	
	:"BlogPostID",
	:"ExternalMessageID",
	:"ReferenceMessageID",
	:"EditedBy",
	:"IsDeleted",
	:"IsApproved"	
	
	DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_TOPIC_LOCK(I_TOPICID INTEGER,I_LOCKED BOOL)
AS 
DECLARE tmpTopic INTEGER;
DECLARE tmpFlags INTEGER DEFAULT 0;
DECLARE negFlags INTEGER  DEFAULT 0;
BEGIN
	IF (I_LOCKED<>0) THEN
		UPDATE objQual_TOPIC 
		SET FLAGS = BIN_OR(FLAGS, 1)
		WHERE TOPICID = :I_TOPICID;
	ELSE
	BEGIN
	SELECT  	
	a.FLAGS
	FROM objQual_TOPIC a
	WHERE a.TOPICID = :I_TOPICID 
	INTO 
	:tmpFlags; 
		
	negFlags=BIN_XOR(1,-1);
	tmpFlags=BIN_AND(:tmpFlags,:negFlags); 
			
	UPDATE objQual_TOPIC
		SET FLAGS = :tmpFlags
		WHERE TOPICID = :I_TOPICID;
		
	END		
   
END;
--GO




CREATE  PROCEDURE objQual_TOPIC_PRUNE(
				I_BOARDID INTEGER,
				I_FORUMID INTEGER,
				I_DAYS    INTEGER,
				I_PERMDELETE BOOL)
				RETURNS
				("COUNT" INTEGER)              
AS       
		DECLARE  iciTopicID INTEGER;
		DECLARE  iciCount INTEGER DEFAULT 0;
		DECLARE ici_ForumID INTEGER DEFAULT NULL;        
BEGIN

 IF (I_FORUMID IS NOT NULL AND I_FORUMID >=0) THEN 
 ici_ForumID = I_FORUMID;


	 -- SET iciCount = 0;
	 IF (ici_ForumID = 0) THEN   ici_ForumID = NULL;

IF (ici_ForumID IS NOT NULL) THEN
	 FOR SELECT yt.TOPICID FROM  objQual_TOPIC yt
	 INNER JOIN
		objQual_FORUM yf
		ON
		yt.FORUMID = yf.FORUMID
		INNER JOIN
		objQual_CATEGORY yc
		ON		
		yf.CATEGORYID = yc.CATEGORYID
		WHERE 
		yc.BOARDID = :I_BOARDID AND		
		yt.FORUMID = :ici_ForumID
		AND "PRIORITY" = 0
		AND BIN_AND(yt.FLAGS, 512) = 0
		AND  current_date-CAST(yt.LASTPOSTED AS DATE) > :I_DAYS
		  
		INTO     :iciTopicID 
	 
	 DO
	 BEGIN        
	 EXECUTE PROCEDURE objQual_TOPIC_DELETE(:iciTopicID , 0, :I_PERMDELETE);
	 iciCount = iciCount + 1;
	 END
ELSE    
	 FOR SELECT TOPICID
		FROM   objQual_TOPIC
		WHERE  "PRIORITY" = 0
		AND BIN_AND(FLAGS, 512) = 0
	 AND  current_date-CAST(LASTPOSTED AS DATE) > :I_DAYS
	 INTO     :iciTopicID
	  DO
	  BEGIN
	 -- introduced to not forget ms sql changes. It's an attempt to make prune in background
	 --  WAITFOR analogue can be implemented as udf only Don't implement, as it stops all connections?          
	 EXECUTE PROCEDURE objQual_TOPIC_DELETE(:iciTopicID , 0, :I_PERMDELETE);
	 iciCount = iciCount + 1;
	 END
	 "COUNT" = iciCount;
	 SUSPEND;
	 END;
--GO

CREATE PROCEDURE objQual_TOPIC_SAVE(
	 I_FORUMID	INTEGER,
	 I_SUBJECT	VARCHAR(255),
	 I_STATUS	VARCHAR(255),
	 I_STYLES	VARCHAR(255),
	 I_DESCRIPTION	VARCHAR(255),
	 I_USERID		INTEGER,
	 I_MESSAGE	BLOB SUB_TYPE 1,
	 I_PRIORITY	SMALLINT,
	 I_USERNAME	VARCHAR(256),
	 I_IP		VARCHAR(39),
	 I_POSTED		TIMESTAMP,
	 I_BLOGPOSTID	VARCHAR(128),
	 I_FLAGS		INTEGER,
	 I_UTCTIMESTAMP TIMESTAMP
	 )
	 RETURNS
	 (
	 "TopicID" INTEGER,
	 "MessageID" INTEGER
	 )     
	 AS
	 DECLARE ici_TopicID INTEGER;
	 DECLARE ici_MessageID INTEGER DEFAULT null;
	 BEGIN
	 
	  IF (I_POSTED IS NULL) THEN
	  I_POSTED = :I_UTCTIMESTAMP; 
	
	 SELECT NEXT VALUE FOR SEQ_objQual_TOPIC_TOPICID 
	 FROM RDB$DATABASE INTO :ici_TopicID;
	 INSERT INTO objQual_TOPIC(
	 TOPICID,
	 FORUMID,
	 TOPIC,
	 USERID,
	 POSTED,
	 VIEWS,
	 "PRIORITY",
	 USERNAME,
	 NUMPOSTS,
	 DESCRIPTION, 
	 STATUS,
	 STYLES)
	 VALUES(
	 :ici_TopicID,
	 :I_FORUMID,
	 :I_SUBJECT,
	 :I_USERID,
	 :I_POSTED,
	 0,
	 :I_PRIORITY,
	 :I_USERNAME,
	 0, 
	 :I_DESCRIPTION,
	 :I_STATUS,
	 :I_STYLES);	 
	 EXECUTE PROCEDURE objQual_MESSAGE_SAVE 
	 :ici_TopicID,
	 :I_USERID,
	 :I_MESSAGE,
	 :I_USERNAME,
	 :I_IP,
	 :I_POSTED,
	 NULL,
	 :I_BLOGPOSTID, 
	 NULL,
	 NULL, 
	 :I_FLAGS, 
	 :I_UTCTIMESTAMP
	 RETURNING_VALUES :ici_MessageID;

	 SELECT   :ici_TopicID , :ici_MessageID FROM RDB$DATABASE 
	 INTO :"TopicID",:"MessageID";
	 SUSPEND;
	 END;
--GO




 CREATE PROCEDURE objQual_TOPIC_SIMPLELIST(
	I_STARTID INTEGER,
	I_LIMIT   INTEGER)
	RETURNS
	(
	"TopicID" INTEGER,
	"Topic" VARCHAR(128)
	)
AS

	BEGIN   
	FOR SELECT FIRST  (:I_LIMIT) t.TOPICID,
	t.TOPIC
	FROM     objQual_TOPIC t
	WHERE    t.TOPICID >= :I_STARTID
	AND t.TOPICID < (:I_STARTID + :I_LIMIT)
		 ORDER BY t.TOPICID
		 INTO
		 :"TopicID",
		 :"Topic"
		 DO SUSPEND;     
		 
	 END;
 --GO


/* CREATE PROCEDURE objQual_TOPIC_ACTIVE
(I_BOARDID INTEGER,I_PAGEUSERID INTEGER,I_SINCE TIMESTAMP,I_CATEGORYID INTEGER, I_STYLEDNICKS BOOL, I_FINDLASTUNREAD BOOL)
RETURNS
 (
"ForumID" integer,
"TopicID" integer,
"Posted" timestamp,
"LinkTopicID" integer,
"Subject" varchar(255),
"Status" varchar(255),
"Styles" varchar(255),
"Description" varchar(255),
"UserID" integer,
"Starter" varchar(128),
"NumPostsDeleted" integer,
"Replies" integer,
"Views" integer,
"LastPosted" timestamp,
"LastUserID" integer,
"LastUserName" varchar(128),
"LastMessageID" integer,
"LastTopicID" integer,
"TopicFlags" integer,
"FavoriteCount" integer,
"Priority" integer,
"PollID" integer,
"ForumName" varchar(128),
"TopicMovedID" integer,
"ForumFlags" integer,
"FirstMessage" varchar(128),
"StarterStyle" varchar(255),
"LastUserStyle" varchar(255),
"LastForumAccess" timestamp,
"LastTopicAccess" timestamp
)
AS
BEGIN
 FOR SELECT
		c.FORUMID,
		c.TOPICID,
		c.POSTED,
		COALESCE(c.TOPICMOVEDID,c.TOPICID) AS "LinkTopicID",
		c.TOPIC AS "Subject",
		c.STATUS,
		c.STYLES,
		c.DESCRIPTION,
		c.USERID,
		COALESCE(c.USERNAME,b.NAME) AS "Starter",
		(SELECT COUNT(1) 
					  FROM objQual_MESSAGE mes 
					  WHERE mes.TOPICID = c.TOPICID 
						AND mes.ISDELETED = 1 
						AND mes.ISAPPROVED = 1 
						AND ((:I_PAGEUSERID IS NOT NULL AND mes.USERID = :I_PAGEUSERID) 
						OR (:I_PAGEUSERID IS NULL)) ) AS "NumPostsDeleted",
		((SELECT COUNT(1) FROM objQual_MESSAGE x 
		WHERE x.TOPICID=c.TOPICID and BIN_AND(x.FLAGS, 8)=0) - 1)
				 AS "Replies",
		c.VIEWS AS "Views",
		c.LASTPOSTED AS LASTPOSTED ,
		c.LASTUSERID AS LASTUSERID,
		COALESCE(c.LASTUSERNAME,(SELECT NAME FROM objQual_USER x 
		where x.USERID=c.LASTUSERID)) AS LASTUSERNAME,
		c.LASTMESSAGEID AS LASTMESSAGEID,
		c.TOPICID AS "LastTopicID",
		c.FLAGS AS "TopicFlags",
		(SELECT COUNT(ID) as FavoriteCount FROM objQual_FAVORITETOPIC WHERE TOPICID = COALESCE(c.TOPICMOVEDID,c.TOPICID)) AS FavoriteCount,		
		c."PRIORITY",
		c.POLLID,
		d.NAME AS "ForumName",
		c.TOPICMOVEDID,
		d.FLAGS AS "ForumFlags", 
		(SELECT CAST(MESSAGE AS VARCHAR(128)) 
		FROM objQual_MESSAGE mes2 
		where mes2.TOPICID = COALESCE(c.TOPICMOVEDID,c.TOPICID) 
		AND mes2."POSITION" = 0) AS "FirstMessage",
			case(:I_STYLEDNICKS)
			when 1 then (SELECT * FROM objQual_GET_USERSTYLE(c.USERID))  
			else (SELECT '' FROM RDB$DATABASE)	 end,	
		case(:I_STYLEDNICKS)
		when 1 then  (SELECT * FROM objQual_GET_USERSTYLE(c.LASTUSERID))  
		else (SELECT '' FROM RDB$DATABASE)	 end,
		(case(:I_FINDLASTUNREAD)
		     when 1 then
		       (SELECT FIRST 1 LASTACCESSDATE FROM objQual_FORUMREADTRACKING x WHERE x.FORUMID=c.FORUMID AND x.USERID = c.USERID)
		     else (select dateadd(1 day to current_timestamp)  FROM RDB$DATABASE) end) AS "LastForumAccess",
		(case(:I_FINDLASTUNREAD)
		     when 1 then
		       (SELECT FIRST 1 LASTACCESSDATE FROM objQual_TOPICREADTRACKING y WHERE y.TOPICID=c.TOPICID AND y.USERID = c.USERID)
		     else (select dateadd(1 day to current_timestamp)  FROM RDB$DATABASE)  end) AS  "LastTopicAccess"  
	FROM
		objQual_TOPIC c
		JOIN objQual_USER b ON b.USERID=c.USERID
		JOIN objQual_FORUM d ON d.FORUMID=c.FORUMID
		JOIN objQual_ACTIVEACCESS x ON x.FORUMID=d.FORUMID
		JOIN objQual_CATEGORY cat ON cat.CATEGORYID=d.CATEGORYID		
	WHERE
		c.LASTPOSTED > :I_SINCE AND
		x.USERID = :I_PAGEUSERID AND
		x.READACCESS <> 0 AND
	cat.BOARDID = :I_BOARDID AND
	(:I_CATEGORYID IS NULL OR cat.CATEGORYID=:I_CATEGORYID) AND
	c.ISDELETED = 0
	ORDER BY	
    cat.SORTORDER,
	d.SORTORDER,
	d.NAME DESC,
	"PRIORITY" DESC,
	LASTPOSTED DESC
	INTO
	:"ForumID",
	:"TopicID",
	:"Posted",
	:"LinkTopicID",
	:"Subject",
	:"Status",
	:"Styles",
	:"Description",
	:"UserID",
	:"Starter",
	:"NumPostsDeleted",
	:"Replies",
	:"Views",
	:"LastPosted",
	:"LastUserID",
	:"LastUserName",
	:"LastMessageID",
	:"LastTopicID",
	:"TopicFlags",
	:"FavoriteCount",
	:"Priority",
	:"PollID",
	:"ForumName",
	:"TopicMovedID",
	:"ForumFlags",
	:"FirstMessage",
	:"StarterStyle",
	:"LastUserStyle",
	:"LastForumAccess",
	:"LastTopicAccess"
	DO SUSPEND;
	END;
*/


CREATE PROCEDURE objQual_PMESSAGE_PRUNE(I_DAYSREAD INTEGER,I_DAYSUNREAD INTEGER, I_UTCTIMESTAMP TIMESTAMP) 
AS
DECLARE VARIABLE ici_PMessageID integer;
DECLARE VARIABLE ici_FromUserID integer;
DECLARE VARIABLE ici_Created timestamp;
DECLARE VARIABLE ici_Subject varchar(128);
DECLARE VARIABLE ici_Body BLOB SUB_TYPE 1;
DECLARE VARIABLE ICI_FLAGS integer;
DECLARE VARIABLE ici_FromUser varchar(128);
DECLARE VARIABLE ici_ToUserID integer;
DECLARE VARIABLE ici_ToUser varchar(128);
DECLARE VARIABLE ici_IsRead BOOL;
DECLARE VARIABLE ici_UserPMessageID integer DEFAULT 0;
DECLARE VARIABLE ici_tmpFlags integer;
DECLARE VARIABLE ici_tmpCreated timestamp;
DECLARE VARIABLE ici_tmpDays integer DEFAULT 0;
DECLARE VARIABLE ici_tmpDaysRead integer DEFAULT 0;
DECLARE VARIABLE ici_tmpDaysUnread integer DEFAULT 0;


BEGIN
FOR SELECT FLAGS,USERPMESSAGEID FROM objQual_USERPMESSAGE
INTO
:ICI_FLAGS,
:ici_UserPMessageID
DO 
BEGIN
	SELECT CREATED FROM objQual_PMESSAGE x 
	WHERE x.PMESSAGEID=:ici_PMessageID
	INTO :ici_tmpCreated;
	ici_tmpCreated=:I_UTCTIMESTAMP-ici_tmpCreated; 	
	ici_tmpFlags=BIN_OR(:ICI_FLAGS, 4);
	ici_tmpFlags=BIN_AND(:ici_tmpFlags, 1);
	ici_tmpFlags=SIGN(:ici_tmpFlags);
	ici_tmpDays=COALESCE(EXTRACT(DAY FROM :ici_tmpCreated),0);
	ici_tmpDaysUnread=ici_tmpDays-COALESCE(:I_DAYSUNREAD,0);
	ici_tmpDaysRead=ici_tmpDays-COALESCE(:I_DAYSREAD,0);
	IF ( :ici_tmpDaysUnread > 0 AND :ici_tmpFlags<>0) THEN    	
	DELETE FROM objQual_USERPMESSAGE 
	WHERE USERPMESSAGEID=:ici_UserPMessageID;
	IF ( :ici_tmpDaysRead = 0 AND :ici_tmpFlags=0) THEN	
	DELETE FROM objQual_USERPMESSAGE 
	WHERE USERPMESSAGEID=:ici_UserPMessageID;

END  
	DELETE FROM objQual_PMESSAGE
	WHERE (NOT EXISTS(SELECT 1 FROM objQual_USERPMESSAGE x 
	WHERE x.PMESSAGEID=objQual_PMESSAGE.PMESSAGEID));
END;
--GO


 
CREATE PROCEDURE objQual_USER_ADDIGNOREDUSER
	(I_USERID INTEGER,
	I_IGNOREDUSERID INTEGER)
	AS
BEGIN
	IF (NOT EXISTS (SELECT * FROM objQual_IGNOREUSER 
	WHERE USERID = :I_USERID AND IGNOREDUSERID = :I_IGNOREDUSERID))
	THEN
		INSERT INTO objQual_IGNOREUSER(USERID, IGNOREDUSERID) 
		VALUES (:I_USERID, :I_IGNOREDUSERID);	
END;
--GO

CREATE PROCEDURE objQual_USER_REMOVEIGNOREDUSER
	(I_USERID INTEGER,
	I_IGNOREDUSERID INTEGER)
	AS
 BEGIN
	DELETE FROM objQual_IGNOREUSER 
	WHERE USERID = :I_USERID 
	AND IGNOREDUSERID = :I_IGNOREDUSERID;	
END;
--GO

CREATE PROCEDURE objQual_USER_ISUSERIGNORED
	(I_USERID INTEGER,
	I_IGNOREDUSERID INTEGER)
	RETURNS (OUT_IGNORED BOOL)
	AS
BEGIN
	IF (EXISTS(SELECT * FROM objQual_IGNOREUSER 
	WHERE USERID = :I_USERID 
	AND IGNOREDUSERID = :I_IGNOREDUSERID))
	THEN
		OUT_IGNORED=1;	
	ELSE	
		OUT_IGNORED=0;
	SUSPEND;	
END;	
--GO

CREATE PROCEDURE objQual_USER_ACTIVITY_RANK
 (
	I_BOARDID INTEGER,
	I_DISPLAYNUMBER INTEGER,
	I_STARTDATE  TIMESTAMP
 )
 RETURNS
  (
   "ID" INTEGER,
   "Name" VARCHAR(128),
   "NumOfPosts" INTEGER
  )
 AS
 DECLARE ici_GuestUserID INTEGER;
 BEGIN 
	

	SELECT FIRST 1
		a.USERID
	FROM
		objQual_USER a
		INNER JOIN objQual_USERGROUP b on b.USERID = a.USERID
		INNER JOIN objQual_GROUP c on b.GROUPID = c.GROUPID
	WHERE
		a.BOARDID = :I_BOARDID and
		BIN_AND(c.FLAGS, 2)<>0 ORDER BY a.USERID 
		INTO :ici_GuestUserID;

	FOR SELECT FIRST (:I_DISPLAYNUMBER)
	counter."ID",
	u.NAME,
	counter."NumOfPosts"
	FROM
	objQual_USER u inner join
	(
	SELECT m.USERID as "ID", Count(m.USERID) as "NumOfPosts" 
	FROM objQual_MESSAGE m
	WHERE m.POSTED >= :I_STARTDATE
	GROUP BY m.USERID
	) AS counter ON u.USERID = counter."ID"
	WHERE
	u.BOARDID =:I_BOARDID and u.USERID != :ici_GuestUserID
	ORDER BY
	counter."NumOfPosts" DESC
	INTO
	:"ID",
	:"Name",
	:"NumOfPosts"
	DO SUSPEND;
	
   
	END;
--GO


CREATE  PROCEDURE objQual_USER_ADDPOINTS(
	 I_USERID INTEGER,
	 I_POINTS INTEGER)
	 AS
	 BEGIN
	 UPDATE objQual_USER
	 SET    POINTS = POINTS + :I_POINTS
	 WHERE  USERID = :I_USERID;
	 END;
	 
--GO

CREATE PROCEDURE objQual_USER_ADMINSAVE
	 (I_BOARDID INTEGER,
	 I_USERID INTEGER,
	 I_NAME VARCHAR(128),
	 I_EMAIL VARCHAR(128),
	 I_FLAGS INTEGER,
	 I_RANKID INTEGER)
	 RETURNS
	 (o_UserID INTEGER)
	 AS
	 BEGIN
	 UPDATE objQual_USER
	 SET
	 NAME = :I_NAME,
	 "EMAIL" = :I_EMAIL,
	 RANKID = :I_RANKID,
	 FLAGS = :I_FLAGS
	 WHERE USERID = :I_USERID;
	 SELECT :I_USERID FROM RDB$DATABASE INTO :o_UserID;
	 SUSPEND;
	 END;
--GO

 CREATE PROCEDURE objQual_USER_APPROVE(I_USERID INTEGER)
 RETURNS (O_BIT BOOL)
 AS
	 DECLARE ici_CheckEmailID INTEGER;
	 DECLARE ici_Email VARCHAR(128);
	 DECLARE ici_bit BOOL DEFAULT 1;
	 BEGIN
	 

	 SELECT
	 CHECKEMAILID,"EMAIL"    
	 FROM
	 objQual_CHECKEMAIL
	 WHERE
	 USERID = :I_USERID
	 INTO :ici_CheckEmailID,:ici_Email;

	 /*Update new user email*/
	 UPDATE objQual_USER 
	 SET "EMAIL" = :ici_Email, 
	 FLAGS = BIN_OR(FLAGS, 2) 
	 WHERE USERID = :I_USERID;
	 
	 DELETE FROM objQual_CHECKEMAIL 
	 WHERE CHECKEMAILID = :ici_CheckEmailID;
	 O_BIT =ici_bit;
	 SUSPEND;
	 END;
--GO

 CREATE procedure objQual_USER_APPROVEALL(I_BOARDID INTEGER)
 AS
	 DECLARE VARIABLE ICI_USERID INTEGER;
	 DECLARE VARIABLE ici_Bool INTEGER;   
	 begin
		  
	 FOR
	 SELECT USERID FROM objQual_USER 
	 WHERE BOARDID=:I_BOARDID 
	 AND BIN_AND(FLAGS, 2)=0     
	 INTO :ICI_USERID
	 DO
	 BEGIN
	 EXECUTE PROCEDURE objQual_USER_APPROVE :ICI_USERID
	 RETURNING_VALUES :ici_Bool;
	 END
 
END;
--GO

		   
				
				  CREATE PROCEDURE objQual_USER_AVATARIMAGE(I_USERID INTEGER)
				  RETURNS
				  (
					 "UserID" integer,
					 "AvatarImage" BLOB SUB_TYPE 0,
					 "AvatarImageType" VARCHAR(128)
				  )
				  AS
				  BEGIN
				  SELECT
				  USERID,
				  AVATARIMAGE,
				  AVATARIMAGETYPE
				  FROM objQual_USER WHERE USERID=:I_USERID
				  INTO
				  :"UserID",
				  :"AvatarImage",
				  :"AvatarImageType";
				  SUSPEND;
				  END;

--GO


  CREATE PROCEDURE objQual_USER_CHANGEPASSWORD
				  (I_USERID INTEGER,I_OLDPASSWORD VARCHAR(32),I_NEWPASSWORD VARCHAR(32))
				  RETURNS ("Success" BOOL)
				  AS
				  DECLARE ici_CurrentOld VARCHAR(32);
				  DECLARE ici_Success BOOL DEFAULT 1;
				  BEGIN
				
				  SELECT  "PASSWORD"  
				  FROM objQual_USER 
				  WHERE USERID = :I_USERID
				  INTO :ici_CurrentOld;
				  
				  IF (ici_CurrentOld<>I_OLDPASSWORD) THEN
				  ici_Success=0;
				  ELSE 
	UPDATE objQual_USER 
	SET "PASSWORD" = :I_NEWPASSWORD 
	WHERE USERID = :I_USERID;
	
		
	   "Success" = ici_Success;
		SUSPEND;
END;
--GO

  CREATE PROCEDURE objQual_USER_DELETE(I_USERID INTEGER)
AS
DECLARE ici_GuestUserID	INTEGER;
	DECLARE ici_UserName	varchar(128);
	DECLARE ici_GuestCount	INTEGER;
BEGIN
	
 
	SELECT NAME FROM objQual_USER 
	WHERE USERID=:I_USERID
	INTO :ici_UserName;
 
	SELECT  FIRST 1
		 a.USERID 
	FROM
		objQual_USER a
		inner join objQual_USERGROUP b on b.USERID = a.USERID
		inner join objQual_GROUP c on b.GROUPID = c.GROUPID
	WHERE
		BIN_AND(c.FLAGS, 2)<>0 
		GROUP BY a.USERID
		INTO :ici_GuestUserID;
 
	SELECT 
		  COUNT(1) 
	FROM 
		objQual_USERGROUP a
		join objQual_GROUP b on b.GROUPID=a.GROUPID
	WHERE
		BIN_AND(b.FLAGS, 2)<>0
		INTO  :ici_GuestCount;

	IF (NOT (ici_GuestUserID=I_USERID AND ici_GuestCount=1)) THEN
	   BEGIN

	UPDATE objQual_MESSAGE 
	SET USERNAME=:ici_UserName,
		USERID=:ici_GuestUserID 
	WHERE USERID=:I_USERID;
	
	UPDATE objQual_TOPIC 
	SET USERNAME=:ici_UserName,
	USERID=:ici_GuestUserID 
	WHERE USERID=:I_USERID;
	
	UPDATE objQual_TOPIC 
	SET LASTUSERNAME=:ici_UserName,
	LASTUSERID=:ici_GuestUserID 
	WHERE LASTUSERID=:I_USERID;
	
	UPDATE objQual_FORUM 
	SET LASTUSERNAME=:ici_UserName,
	LASTUSERID=:ici_GuestUserID 
	WHERE LASTUSERID=:I_USERID;

	DELETE FROM objQual_ACTIVE WHERE USERID=:I_USERID;
	DELETE FROM objQual_EVENTLOG WHERE USERID=:I_USERID;
	DELETE FROM objQual_USERPMESSAGE WHERE USERID=:I_USERID;
  
	IF (NOT EXISTS(SELECT 1 FROM objQual_PMESSAGE WHERE FROMUSERID=:I_USERID)) THEN
	DELETE FROM objQual_PMESSAGE
	WHERE FROMUSERID=:I_USERID;
   
   -- set messages as from guest so the User can be deleted
	UPDATE objQual_PMESSAGE 
	SET FROMUSERID = :ici_GuestUserID WHERE FROMUSERID = :I_USERID;
	DELETE FROM objQual_CHECKEMAIL WHERE USERID = :I_USERID;
	DELETE FROM objQual_WATCHTOPIC WHERE USERID = :I_USERID;
	DELETE FROM objQual_WATCHFORUM WHERE USERID = :I_USERID;
	DELETE FROM objQual_TOPICREADTRACKING where USERID = :I_USERID;
 	DELETE FROM objQual_FORUMREADTRACKING where USERID = :I_USERID;
	DELETE FROM objQual_USERGROUP WHERE USERID = :I_USERID;
   
	-- Delete UserForums entries Too
	
	DELETE FROM  objQual_USERFORUM WHERE USERID = :I_USERID;
	DELETE FROM objQual_IGNOREUSER WHERE USERID = :I_USERID 
	OR IGNOREDUSERID = :I_USERID;
	
	-- Delete all the thanks entries associated with this UserID.
	DELETE FROM  objQual_THANKS where THANKSFROMUSERID= :I_USERID;
	DELETE FROM  objQual_THANKS where THANKSTOUSERID= :I_USERID;
	-- Delete all the Buddy relations between this user and other users.
	DELETE FROM  objQual_BUDDY where FROMUSERID=:I_USERID;
	DELETE FROM  objQual_BUDDY where TOUSERID=:I_USERID;
	-- Delete all the FavoriteTopic entries associated with this UserID.
	delete from objQual_FAVORITETOPIC where USERID=:I_USERID;
	
	
	DELETE FROM  objQual_USER WHERE USERID = :I_USERID;
	END
	END;
--GO

CREATE procedure objQual_USER_DELETEAVATAR(I_USERID INTEGER)
	AS
	BEGIN
	UPDATE objQual_USER
	SET AVATARIMAGE = null,
	AVATAR = null,
	AVATARIMAGETYPE = null
	where USERID = :I_USERID;
	END;
 --GO
 
 CREATE PROCEDURE objQual_USER_DELETEOLD(I_BOARDID INTEGER, I_DAYS INTEGER, I_UTCTIMESTAMP TIMESTAMP)
AS
DECLARE ici_Since TIMESTAMP; 
DECLARE ICI_USERID INTEGER;
	BEGIN   
	ici_Since = :I_UTCTIMESTAMP;
	FOR SELECT USERID from objQual_USER 
	WHERE BOARDID=:I_BOARDID and ISAPPROVED = 0 
	and DATEDIFF(day,:ici_Since,JOINED) > :I_DAYS
	INTO :ICI_USERID
	DO   
	DELETE FROM objQual_EVENTLOG  WHERE USERID=:ICI_USERID;     
	
	FOR SELECT USERID from objQual_USER 
	WHERE BOARDID=:I_BOARDID and ISAPPROVED = 0  
	and DATEDIFF(day,:ici_Since,JOINED) > :I_DAYS    
	INTO :ICI_USERID
	DO 
	DELETE FROM objQual_CHECKEMAIL WHERE USERID=:ICI_USERID;   
	
	FOR SELECT USERID from objQual_USER 
	WHERE BOARDID=:I_BOARDID and ISAPPROVED = 0 
	and DATEDIFF(day,:ici_Since,JOINED) > :I_DAYS
	INTO :ICI_USERID
	DO   
	DELETE FROM objQual_USERGROUP WHERE USERID=:ICI_USERID; 
	
	
	DELETE FROM objQual_USER where BOARDID=:I_BOARDID 
	and ISAPPROVED = 0
	AND DATEDIFF(day,:ici_Since,JOINED) > :I_DAYS;
	
	END;
--GO

CREATE PROCEDURE objQual_USER_EMAILS(I_BOARDID INTEGER,I_GROUPID INTEGER)
RETURNS ("Email" VARCHAR(128))
	AS
	BEGIN
	IF (I_GROUPID = 0) THEN  I_GROUPID = null;
	IF (I_GROUPID IS NULL) THEN
	FOR SELECT
	a."EMAIL"
	FROM
	objQual_USER a
	WHERE
	a."EMAIL" IS NOT NULL AND
	a.BOARDID = :I_BOARDID and
	a."EMAIL" IS NOT NULL AND
	a."EMAIL"<>''
	INTO :"Email"
	DO SUSPEND;
	ELSE
	FOR	SELECT 
			a."EMAIL" 
		FROM
			objQual_USER a 
			JOIN objQual_USERGROUP b ON b.USERID=a.USERID
			JOIN objQual_GROUP c 
			ON c.GROUPID=b.GROUPID	
		WHERE 
			b.GROUPID = :I_GROUPID AND 
			BIN_AND(c.FLAGS, 2)=0 AND 
			a."EMAIL" IS NOT NULL AND 
			a."EMAIL"<>''
			INTO :"Email"
	DO SUSPEND;
		
END;
--GO



CREATE PROCEDURE objQual_USER_GET
(
	I_BOARDID		INTEGER,
		I_PROVIDERUSERKEY       VARCHAR(64) 
)
RETURNS ( "UserID" INTEGER)
AS
BEGIN

	SELECT USERID FROM objQual_USER 
		WHERE BOARDID=:I_BOARDID 
		AND PROVIDERUSERKEY=CHAR_TO_UUID(:I_PROVIDERUSERKEY)
		INTO
		:"UserID";
		SUSPEND;
END;
 --GO 
 CREATE PROCEDURE objQual_USER_GETPOINTS (I_USERID INTEGER)
 RETURNS ("Points" INTEGER)
 AS 
BEGIN
	SELECT POINTS FROM objQual_USER WHERE USERID = :I_USERID
	INTO :"Points";
	SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USER_GETSIGNATURE(I_USERID INTEGER)
RETURNS ("Signature" BLOB SUB_TYPE 1)
AS 
BEGIN
	SELECT SIGNATURE FROM objQual_USER WHERE USERID = :I_USERID
	INTO :"Signature";
	SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USER_LIST
(I_BOARDID INTEGER,
I_USERID INTEGER,
I_APPROVED SMALLINT,
I_GROUPID INTEGER,
I_RANKID INTEGER,
I_STYLEDNICKS SMALLINT,
I_UTCTIMESTAMP TIMESTAMP)
RETURNS
(
 "UserID" integer,
 "BoardID" integer,
 "ProviderUserKey" VARCHAR(64),
 "Name" varchar(128),
 "DisplayName" varchar(128),
 "Password" varchar(32),
 "Email" VARCHAR(128),
 "Joined" timestamp,
 "LastVisit" timestamp,
 "IP" VARCHAR(39),
 "NumPosts" integer,
 "TimeZone" integer, 
 "Avatar" varchar(255),
 "Signature" BLOB SUB_TYPE 1,
 "AvatarImage" BLOB SUB_TYPE 0,
 "AvatarImageType" VARCHAR(128),
 "Suspended" timestamp,
 "LanguageFile" VARCHAR(128),
 "ThemeFile" VARCHAR(128),
 "OverrideDefaultThemes" BOOL,
 "PMNotification" BOOL,
 "NotificationType" INTEGER,
 "DailyDigest" BOOL,
 "IsFacebookUser" BOOL,
 "IsTwitterUser" BOOL,
 "Flags" integer,
 "Points" integer,
 "IsApproved" BOOL,
 "IsActiveExcluded" BOOL,
 "AutoWatchTopics" BOOL, 
 "CultureUser" VARCHAR(10),
 "Culture" VARCHAR(10),
 "RankID" INTEGER,   
 "RankName" VARCHAR(128),
 "Style" VARCHAR(255),
 "NumDays" integer,
 "NumPostsForum" integer,
 "HasAvatarImage" integer,
 "IsAdmin" integer,
 "IsGuest" BOOL,
 "IsHostAdmin" integer,
 "IsForumModerator" BOOL,
 "IsModerator" integer
 )
AS

DECLARE ici_NumDays INTEGER DEFAULT 0;

DECLARE ici_IsAdmin INTEGER DEFAULT 0;
DECLARE ici_IsForumModerator SMALLINT DEFAULT 0;
DECLARE ici_IsModerator SMALLINT DEFAULT 0;

BEGIN
IF (:I_USERID IS NOT NULL) THEN
FOR SELECT 
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY),
a.NAME,
a.DISPLAYNAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.NOTIFICATIONTYPE,
a.DAILYDIGEST,
a.ISFACEBOOKUSER,
a.ISTWITTERUSER,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
a.AUTOWATCHTOPICS,
a.CULTURE,
a.CULTURE,
b.NAME AS "RankName",
(case(:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 3 ORDER BY f.SORTORDER), b.STYLE)  
			else ''	 end)  AS "Style",
DATEDIFF(DAY,:I_UTCTIMESTAMP,COALESCE(a.JOINED,:I_UTCTIMESTAMP)) + 1 AS "NumDays",
--(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(x.MESSAGEID) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
COALESCE((SELECT 1 FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL),0) AS "HasAvatarImage",
(SELECT :ici_IsAdmin FROM RDB$DATABASE),
COALESCE(SIGN(BIN_AND(a.FLAGS, 4)),0) AS ISGUEST,
COALESCE(BIN_AND(a.FLAGS, 1),0) AS "IsHostAdmin",
(SELECT :ici_IsForumModerator FROM RDB$DATABASE),
(SELECT :ici_IsModerator FROM RDB$DATABASE)
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
WHERE
a.USERID = :I_USERID AND
a.BOARDID = :I_BOARDID AND
(:I_APPROVED IS NULL OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS, 2)=0)
						   OR (:I_APPROVED=1 and BIN_AND(a.FLAGS, 2)=2))
ORDER BY
a.NAME
INTO
		   :"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"DisplayName",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"NotificationType",
		   :"DailyDigest",
		   :"IsFacebookUser",
		   :"IsTwitterUser",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded", 
		   :"AutoWatchTopics",		  
		   :"CultureUser",
		   :"Culture",	
		   :"RankName",
		   :"Style",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
 DO
 BEGIN
 EXECUTE PROCEDURE objQual_vaccess_ul(:"UserID", 0) 
 RETURNING_VALUES  :ici_IsAdmin,:ici_IsForumModerator,:ici_IsModerator; 
SUSPEND;
 END

ELSE IF (I_GROUPID IS NULL and I_RANKID IS NULL) THEN
FOR SELECT 
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY),
a.NAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.NOTIFICATIONTYPE,
a.DAILYDIGEST,
a.ISFACEBOOKUSER,
a.ISTWITTERUSER,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
a.AUTOWATCHTOPICS,
a.CULTURE,
a.CULTURE,
b.NAME AS "RankName",
(case(:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 3 ORDER BY f.SORTORDER), b.STYLE)  
			else ''	 end)  AS "Style",
(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(1) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
(SELECT COUNT(1) FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage",
(SELECT CAST(SIGN(COUNT(1)) AS INTEGER) from objQual_USERGROUP x
						  JOIN objQual_GROUP y
							ON y.GROUPID=x.GROUPID
							  WHERE x.USERID=a.USERID
								AND BIN_AND(y.FLAGS,1)<>0) AS ISADMIN,
COALESCE(SIGN(BIN_AND(a.FLAGS, 4)),0) AS ISGUEST,
COALESCE(SIGN(BIN_AND(a.FLAGS, 1)),0) AS "IsHostAdmin",
(SELECT :ici_IsForumModerator FROM RDB$DATABASE),
(SELECT :ici_IsModerator FROM RDB$DATABASE)
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
WHERE
a.BOARDID = :I_BOARDID
						 AND (:I_APPROVED IS NULL
						  OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS, 2)=0)
							OR (:I_APPROVED=1 AND BIN_AND(a.FLAGS, 2)=2))
ORDER BY
a.NAME
INTO
:"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"NotificationType",
		   :"DailyDigest",
		   :"IsFacebookUser",
		   :"IsTwitterUser",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded",
		   :"AutoWatchTopics",
		   :"CultureUser",
		   :"Culture",		
		   :"RankName",
		   :"Style",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
DO BEGIN
 "NumDays"=COALESCE(current_date-CAST("Joined" AS DATE),0)+1;
 /*  EXECUTE PROCEDURE objQual_vaccess_ul :"UserID", 0 
 RETURNING_VALUES  :"IsAdmin",:"IsForumModerator",:"IsModerator";*/
 EXECUTE PROCEDURE objQual_vaccess_ul(:"UserID", 0) 
 RETURNING_VALUES  :ici_IsAdmin,:ici_IsForumModerator,:ici_IsModerator;
 SUSPEND;
 END

ELSE
BEGIN
FOR SELECT DISTINCT
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY) ,
a.NAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.NOTIFICATIONTYPE,
a.DAILYDIGEST,
a.ISFACEBOOKUSER,
a.ISTWITTERUSER,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
a.AUTOWATCHTOPICS,
a.CULTURE,
a.CULTURE,
b.NAME AS "RankName",
(case(:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 3 ORDER BY f.SORTORDER), b.STYLE)  
			else ''	 end)  AS "Style",
(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(1) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
(SELECT COUNT(1) FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage",
(SELECT CAST(SIGN(COUNT(1)) AS INTEGER) from objQual_USERGROUP x
					   JOIN objQual_GROUP y ON y.GROUPID=x.GROUPID
					   WHERE x.USERID=a.USERID
					   AND BIN_AND(y.FLAGS, 1)<>0) AS "IsAdmin",
COALESCE(SIGN(BIN_AND(a.FLAGS, 4)),0) AS ISGUEST,
COALESCE(BIN_AND(a.FLAGS, 1),0) AS "IsHostAdmin",
(SELECT :ici_IsForumModerator FROM RDB$DATABASE),
(SELECT :ici_IsModerator FROM RDB$DATABASE)
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
WHERE
a.BOARDID = :I_BOARDID and
(:I_APPROVED IS NULL
						 OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS,2)=0)
						 OR (:I_APPROVED=1 AND BIN_AND(a.FLAGS, 2)=2))
						 AND (:I_GROUPID IS NULL OR (EXISTS
							 (SELECT 1 FROM objQual_USERGROUP x
								WHERE x.USERID=a.USERID AND x.GROUPID=:I_GROUPID))
								 AND (:I_RANKID IS NULL OR a.RANKID=:I_RANKID))
ORDER BY
a.NAME
INTO
:"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"NotificationType",
		   :"DailyDigest",
		   :"IsFacebookUser",
		   :"IsTwitterUser",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded",
		   :"AutoWatchTopics",
		   :"CultureUser",
		   :"Culture",    
		   :"RankName",
		   :"Style",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
DO BEGIN
 "NumDays"=COALESCE(current_date-CAST("Joined" AS DATE),0)+1;
/*  EXECUTE PROCEDURE objQual_vaccess_ul :"UserID", 0 
 RETURNING_VALUES  :"IsAdmin",:"IsForumModerator",:"IsModerator";*/
 EXECUTE PROCEDURE objQual_vaccess_ul(:"UserID", 0) 
 RETURNING_VALUES  :ici_IsAdmin,:ici_IsForumModerator,:ici_IsModerator; 
 SUSPEND;
 END
 END     
END;
--GO

CREATE PROCEDURE objQual_ADMIN_LIST(I_BOARDID INTEGER, I_STYLEDNICKS BOOL, I_UTCTIMESTAMP TIMESTAMP) 
RETURNS
(
 "UserID" integer,
 "NumPosts" integer,
 "CultureUser" VARCHAR(10),
 "IsFacebookUser" BOOL,
 "IsTwitterUser" BOOL,
 "RankID" integer,
 "RankName" VARCHAR(255),
 "Style" VARCHAR(255),
 "NumDays" integer,
 "NumPostsForum" integer,
 "HasAvatarImage" BOOL,
 "IsAdmin" BOOL,
 "IsHostAdmin" BOOL)
as
begin
		FOR select 
			a.USERID,
			a.NUMPOSTS,
			a.CULTURE AS CultureUser,
			a.ISFACEBOOKUSER,
			a.ISTWITTERUSER,
			r.RANKID,						
			r.NAME AS RankName,
			(case (:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
			join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND 
			CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)
			else ''	 end) as Style, 
			(DATEDIFF(DAY, :I_UTCTIMESTAMP, a.Joined) + 1) AS NumDays,		
			(select count(1) from objQual_MESSAGE x where (BIN_AND(x.FLAGS,24)=16)) as NumPostsForum,
			(select count(1) from objQual_USER x where x.USERID=a.USERID and a.AVATARIMAGE is not null) AS HasAvatarImage,
			COALESCE(c.ISADMIN,0) as IsAdmin,			
			COALESCE(BIN_AND(a.FLAGS, 1),0) AS IsHostAdmin
		from 
			objQual_USER a	
			JOIN
			objQual_RANK r	
			ON r.RANKID = a.RANKID		
			left join objQual_VACCESS c on c.USERID=a.USERID
		where 			
			a.BOARDID = :I_BOARDID and
			-- is not guest 
			a.ISGUEST = 0 and
			c.FORUMID = 0 and
			-- is admin 
			(COALESCE(c.ISADMIN,0) != 0) 
		order by 
			a.NAME
			INTO
			 :"UserID",
             :"NumPosts",
             :"CultureUser",
			 :"IsFacebookUser",
			 :"IsTwitterUser",
             :"RankID",
             :"RankName",
             :"Style",
             :"NumDays",
             :"NumPostsForum",
             :"HasAvatarImage",
             :"IsAdmin",
             :"IsHostAdmin"
			 DO SUSPEND;
end;
--GO

CREATE PROCEDURE  objQual_USER_LISTMEMBERS(
                I_BOARDID INTEGER,
				I_USERID INTEGER,
				I_APPROVED BOOL,
				I_GROUPID INTEGER,
				I_RANKID INTEGER,
				I_STYLEDNICKS BOOL,
				I_LITERALS varchar(255), 
				I_EXCLUDE BOOL, 
				I_BEGINSWITH BOOL, 				
				I_PAGEINDEX INTEGER, 
				I_PAGESIZE INTEGER,
				I_SORTNAME INTEGER,
				I_SORTRANK INTEGER,
				I_SORTJOINED INTEGER,
				I_SORTPOSTS INTEGER,	
				I_SORTLASTVISIT INTEGER,
				I_NUMPOSTS INTEGER,
				I_NUMPOSTSCOMPARE INTEGER) 
				RETURNS
				 (
                
  "UserID" INTEGER,
  "BoardID" INTEGER,
  "ProviderUserKey" VARCHAR(64),
  "Name" VARCHAR(255),
  "DisplayName" VARCHAR(255),
  "Password" VARCHAR(32),
  "Email" VARCHAR(128),
  "Joined" TIMESTAMP,
  "LastVisit" TIMESTAMP,
  "IP" VARCHAR(39),
  "NumPosts" INTEGER,
  "TimeZone" INTEGER,
  "Avatar" VARCHAR(255),
  "Signature" BLOB SUB_TYPE 1 SEGMENT SIZE 20 CHARACTER SET UTF8,
  "AvatarImage" BLOB SUB_TYPE 0,
  "AvatarImageType" VARCHAR(128),
  "RankID" INTEGER,  
  "Suspended" TIMESTAMP,
  "LanguageFile" VARCHAR(128),
  "ThemeFile" VARCHAR(128),
  "UseSingleSignOn" BOOL,
  "TextEditor" VARCHAR(50),
  "OverrideDefaultThemes" BOOL,
  "PMNotification" BOOL,
  "NotificationType" INTEGER, 
  "Flags" INTEGER,
  "Points" INTEGER,
  "IsApproved" BOOL,
  "IsGuest" BOOL,
  "IsCaptchaExcluded" BOOL,
  "IsActiveExcluded" BOOL,
  "IsDST" BOOL,
  "IsDirty" BOOL,
  "AutoWatchTopics" BOOL,
  "CultureUser" VARCHAR(10), 
  "DailyDigest" BOOL, 
  "RankName" VARCHAR(128),
  "Style"  VARCHAR(255),
  "TotalCount" INTEGER
)
AS
DECLARE VARIABLE ici_user_totalrowsnumber INTEGER DEFAULT 0;
DECLARE VARIABLE ici_pagelowerbound INTEGER;
DECLARE VARIABLE ici_pageupperbound INTEGER; 
DECLARE VARIABLE ici_counter INTEGER DEFAULT 0;
DECLARE VARIABLE ici_firstselectrownum INTEGER;
DECLARE VARIABLE ici_firstselectuserid VARCHAR(255);
DECLARE VARIABLE ici_firstselectrankid INTEGER;
DECLARE VARIABLE ici_firstselectlastvisit TIMESTAMP;
DECLARE VARIABLE ici_firstselectjoined TIMESTAMP;
DECLARE VARIABLE ici_firstselectposts INTEGER;

BEGIN 
ici_pagelowerbound = i_pagesize*i_pageindex;
ici_pageupperbound = i_pagesize -1 + ici_pagelowerbound;
   -- get total number of users in the db
   select COUNT(a.USERID) 
    from objQual_USER a 
	  join objQual_RANK b 
	  on b.RANKID=a.RANKID
	  where
	   a.BOARDID = :I_BOARDID	   
	   and	    
		(:I_APPROVED is null or (:I_APPROVED = 0 
		 and (BIN_AND(a.FLAGS,2)=2)) or 
		 (:I_APPROVED = 1 and (BIN_AND(a.FLAGS,2)=2))) and
		(:I_GROUPID is null or exists(SELECT FIRST 1 1 FROM objQual_USERGROUP x where x.USERID=a.USERID and x.GROUPID=:I_GROUPID )) and
		(:I_RANKID is null or a.RANKID=:I_RANKID) AND
		COALESCE(BIN_AND(a.FLAGS, 4),0) <> 4
			AND
		LOWER(a.DISPLAYNAME) LIKE CASE 
			WHEN (:I_BEGINSWITH = 0 AND :I_LITERALS IS NOT NULL AND CHAR_LENGTH(:I_LITERALS) > 0) THEN '%' || LOWER(:I_LITERALS) || '%' 
			WHEN (:I_BEGINSWITH = 1 AND :I_LITERALS IS NOT NULL AND CHAR_LENGTH(:I_LITERALS) > 0) THEN LOWER(:I_LITERALS) || '%'
			ELSE '%' END  
		and
		(a.NUMPOSTS >= (case 
        when :I_NUMPOSTSCOMPARE = 3 then  :I_NUMPOSTS end) 
		OR a.NUMPOSTS <= (case 
        when :I_NUMPOSTSCOMPARE = 2 then :I_NUMPOSTS end) OR
		a.NUMPOSTS = (case 
        when :I_NUMPOSTSCOMPARE = 1 then :I_NUMPOSTS end)) 
		order by 1
		INTO :ici_user_totalrowsnumber;

				

   -- Set the page bounds
    ici_pagelowerbound = i_pagesize*i_pageindex;
    ici_pageupperbound = i_pagesize -1 + ici_pagelowerbound;    

   
    for select
	  		     a.USERID,
                 a.BOARDID,
                 UUID_TO_CHAR(a.PROVIDERUSERKEY),
                 a.NAME,
                 a.DISPLAYNAME,		
                 a."PASSWORD",
                 a."EMAIL",
                 a.JOINED,
                 a.LASTVISIT,
                 a.IP,
                 a.NUMPOSTS,
                 a.TIMEZONE,
                 a.AVATAR,
                 a.SIGNATURE,
                 a.AVATARIMAGE,
                 a.AVATARIMAGETYPE,
                 a.RANKID,
                 a.SUSPENDED,
                 a.LANGUAGEFILE,
                 a.THEMEFILE,
                 a.USESINGLESIGNON,
                 a.TEXTEDITOR,
                 a.OVERRIDEDEFAULTTHEMES,
                 a.PMNOTIFICATION,
                 a.NOTIFICATIONTYPE,	
                 a.FLAGS,
                 a.POINTS,
                 a.ISAPPROVED,
                 a.ISGUEST,
                 a.ISCAPTCHAEXCLUDED,
                 a.ISACTIVEEXCLUDED,
                 a.ISDST, 
				 a.ISDIRTY,
                 a.AUTOWATCHTOPICS,
                 a.CULTURE,
                 a.DAILYDIGEST,	               
			b.NAME AS RankName,
			(case(:I_STYLEDNICKS)
			when 1 then  COALESCE(( SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
			join objQual_GROUP f on f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), b.STYLE)  
			else ''	 end) AS "Style",
			(SELECT :ici_user_totalrowsnumber FROM RDB$DATABASE)
			from objQual_USER a 
			join objQual_RANK b on b.RANKID=a.RANKID	
       where
	   a.BOARDID = :I_BOARDID	   
	   and
		(:I_APPROVED is null or (:I_APPROVED = 0 and BIN_AND(a.FLAGS, 2)<>2) or (:I_APPROVED = 1 and BIN_AND(a.FLAGS, 2)=2)) and
		(:I_GROUPID is null or exists(select first 1 1 from objQual_USERGROUP x where x.USERID=a.USERID and x.GROUPID=:I_GROUPID)) and
		(:I_RANKID is null or a.RANKID=:I_RANKID) AND
		COALESCE(BIN_AND(a.FLAGS,4),0) <> 4
			AND
		LOWER(a.DISPLAYNAME) LIKE CASE 
			WHEN (:I_BEGINSWITH = 0 AND :I_LITERALS IS NOT NULL AND CHAR_LENGTH(:I_LITERALS) > 0) THEN '%' || LOWER(:I_LITERALS) || '%' 
			WHEN (:I_BEGINSWITH = 1 AND :I_LITERALS IS NOT NULL AND CHAR_LENGTH(:I_LITERALS) > 0) THEN LOWER(:I_LITERALS) || '%'
			ELSE '%' END  
        and
		(a.NUMPOSTS >= (case 
        when :I_NUMPOSTSCOMPARE = 3 then  :I_NUMPOSTS end) 
		OR a.NUMPOSTS <= (case 
        when (:I_NUMPOSTSCOMPARE = 2) then :I_NUMPOSTS end) OR
		a.NUMPOSTS = (case 
        when (:I_NUMPOSTSCOMPARE = 1) then :I_NUMPOSTS end)) 
    ORDER BY  (case 
        when (:I_SORTNAME = 0) then a.NAME 
        else null  end) DESC,
		(case 
        when (:I_SORTNAME = 1) then a.NAME 
        else null  end) ASC, 
		(case 
        when( :I_SORTRANK = 0) then a.RANKID 
        else null  end) DESC,
		(case 
        when ( :I_SORTRANK  = 1) then a.RANKID 
        else null  end) ASC,		
		(case 
        when (:I_SORTJOINED = 0) then a.JOINED 
        else null  end) DESC,
		(case 
        when (:I_SORTJOINED = 1) then a.JOINED 
        else null  end) ASC,
		(case 
        when (:I_SORTLASTVISIT = 0) then a.LASTVISIT 
        else null  end) DESC,
		(case 
        when (:I_SORTLASTVISIT = 1) then a.LASTVISIT 
        else null  end) ASC,
		(case
		 when (:I_SORTPOSTS = 0) then a.NUMPOSTS 
        else null  end) DESC, 
   		(case
		 when (:I_SORTPOSTS = 1) then a.NUMPOSTS 
        else null  end) ASC 
		INTO
		:"UserID",
        :"BoardID",
        :"ProviderUserKey",
        :"Name",
		:"DisplayName",
        :"Password",
        :"Email",
        :"Joined",
        :"LastVisit",
        :"IP",
        :"NumPosts",
        :"TimeZone",
        :"Avatar",
        :"Signature",
        :"AvatarImage",
        :"AvatarImageType",
        :"RankID",  
        :"Suspended",
        :"LanguageFile",
        :"ThemeFile",
        :"UseSingleSignOn",
        :"TextEditor",
        :"OverrideDefaultThemes",
        :"PMNotification",
        :"NotificationType", 
        :"Flags",
        :"Points",
        :"IsApproved",
        :"IsGuest",
        :"IsCaptchaExcluded",
        :"IsActiveExcluded",
        :"IsDST",
		:"IsDirty",
        :"AutoWatchTopics",
        :"CultureUser", 
        :"DailyDigest", 
        :"RankName",
        :"Style",
        :"TotalCount"
		DO BEGIN
		ici_counter = ici_counter+1;	
		if (ici_counter > ici_pageupperbound) then 
		begin
		leave;
		end
		if (ici_counter >= ici_pagelowerbound) then 
		begin 
		SUSPEND;
		end
		
		END  
  
END;
--GO

CREATE PROCEDURE objQual_USER_LIST_OLD
(I_BOARDID INTEGER,
I_USERID INTEGER,
I_APPROVED SMALLINT,
I_GROUPID INTEGER,
I_RANKID INTEGER)
RETURNS
(
 "UserID" integer,
 "BoardID" integer,
 "ProviderUserKey" VARCHAR(64),
 "Name" varchar(128),
 "Password" varchar(32),
 "Email" VARCHAR(128),
 "Joined" timestamp,
 "LastVisit" timestamp,
 "IP" VARCHAR(39),
 "NumPosts" integer,
 "TimeZone" integer,
 "Avatar" varchar(255),
 "Signature" BLOB SUB_TYPE 1,
 "AvatarImage" BLOB SUB_TYPE 0,
 "AvatarImageType" VARCHAR(128),
 "RankID1" integer,
 "Suspended" timestamp,
 "LanguageFile" VARCHAR(128),
 "ThemeFile" VARCHAR(128),
 "OverrideDefaultThemes" BOOL,
 "PMNotification" BOOL,
 "Flags" integer,
 "Points" integer,
 "IsApproved" BOOL,
 "IsActiveExcluded" BOOL,  
 "RankID" INTEGER,   
 "RankName" VARCHAR(128),
 "NumDays" integer,
 "NumPostsForum" integer,
 "HasAvatarImage" BOOL,
 "IsAdmin" BOOL,
 "IsGuest" integer,
 "IsHostAdmin" BOOL,
 "IsForumModerator" BOOL,
 "IsModerator" integer
)
AS
DECLARE ici_NumDays INTEGER;
BEGIN
IF (I_USERID IS NOT NULL) THEN
FOR SELECT 
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY),
a.NAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
b.RANKID,
b.NAME AS "RankName",
(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(1) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
(SELECT COUNT(1) FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage",
COALESCE(BIN_AND(a.FLAGS, 4),0) AS ISGUEST,
COALESCE(BIN_AND(a.FLAGS, 1),0) AS "IsHostAdmin",
COALESCE(c.ISADMIN,0) AS "IsAdmin",
COALESCE(c.ISFORUMMODERATOR,0) AS "IsForumModerator",
COALESCE(c.ISMODERATOR,0) AS "IsModerator"
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
LEFT JOIN objQual_vaccess c ON c.USERID=a.USERID
WHERE
a.USERID = :I_USERID AND
a.BOARDID = :I_BOARDID AND
COALESCE(c.FORUMID,0) = 0 AND
(:I_APPROVED IS NULL OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS, 2)=0)
						   OR (:I_APPROVED=1 and BIN_AND(a.FLAGS, 2)=2))
ORDER BY
a.NAME
INTO
		   :"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID1",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded",           
		   :"RankID",  
		   :"RankName",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
 DO
 BEGIN
 "NumDays"=COALESCE(current_date-CAST("Joined" AS DATE),0)+1;
 SUSPEND;
 END

ELSE IF (I_GROUPID IS NULL and I_RANKID IS NULL) THEN
FOR SELECT DISTINCT
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY),
a.NAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
b.RANKID,
b.NAME AS "RankName",
(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(1) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
(SELECT COUNT(1) FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage",
(SELECT COUNT(1) from objQual_USERGROUP x
						  JOIN objQual_GROUP y
							ON y.GROUPID=x.GROUPID
							  WHERE x.USERID=a.USERID
								AND BIN_AND(y.FLAGS,1)<>0) AS "IsAdmin",
COALESCE(BIN_AND(a.FLAGS, 4),0) AS ISGUEST,
COALESCE(BIN_AND(a.FLAGS, 1),0) AS "IsHostAdmin",
COALESCE(c.ISFORUMMODERATOR,0) AS "IsForumModerator",
COALESCE(c.ISMODERATOR,0) AS "IsModerator"
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
LEFT JOIN objQual_vaccess c ON c.USERID=a.USERID
WHERE
a.BOARDID = :I_BOARDID
						 AND (:I_APPROVED IS NULL
						  OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS, 2)=0)
							OR (:I_APPROVED=1 AND BIN_AND(a.FLAGS, 2)=2))
ORDER BY
a.NAME
INTO
:"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID1",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded",           
		   :"RankID",    
		   :"RankName",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
DO BEGIN
 "NumDays"=COALESCE(current_date-CAST("Joined" AS DATE),0)+1;
 SUSPEND;
 END

ELSE
BEGIN
FOR SELECT DISTINCT
a.USERID,
a.BOARDID,
UUID_TO_CHAR(a.PROVIDERUSERKEY) ,
a.NAME,
a."PASSWORD",
a."EMAIL",
a.JOINED,
a.LASTVISIT,
a.IP,
a.NUMPOSTS,
a.TIMEZONE,  
a.AVATAR,
a.SIGNATURE,
a.AVATARIMAGE,
a.AVATARIMAGETYPE,
a.RANKID,
a.SUSPENDED,
a.LANGUAGEFILE,
a.THEMEFILE,
a.OVERRIDEDEFAULTTHEMES,
a.PMNOTIFICATION,
a.FLAGS,
a.POINTS,
a.ISAPPROVED,
a.ISACTIVEEXCLUDED,
b.RANKID,
b.NAME AS "RankName",
(SELECT :ici_NumDays FROM RDB$DATABASE) AS "NumDays",
(SELECT COUNT(1) FROM objQual_MESSAGE x
WHERE BIN_AND(x.FLAGS, 24)=16) AS "NumPostsForum",
(SELECT COUNT(1) FROM objQual_USER x
						 WHERE x.USERID=a.USERID
						   AND AVATARIMAGE IS NOT NULL) AS "HasAvatarImage",
(SELECT COUNT(1) from objQual_USERGROUP x
					   JOIN objQual_GROUP y ON y.GROUPID=x.GROUPID
					   WHERE x.USERID=a.USERID
					   AND BIN_AND(y.FLAGS, 1)<>0) AS "IsAdmin",
COALESCE(BIN_AND(a.FLAGS, 4),0) AS ISGUEST,
COALESCE(BIN_AND(a.FLAGS, 1),0) AS "IsHostAdmin",
COALESCE(c.ISFORUMMODERATOR,0) AS "IsForumModerator",
COALESCE(c.ISMODERATOR,0) AS "IsModerator"
FROM
objQual_USER a
JOIN objQual_RANK b ON b.RANKID=a.RANKID
LEFT JOIN objQual_vaccess c ON c.USERID=a.USERID
WHERE
a.BOARDID = :I_BOARDID and
(:I_APPROVED IS NULL
						 OR (:I_APPROVED=0 AND BIN_AND(a.FLAGS,2)=0)
						 OR (:I_APPROVED=1 AND BIN_AND(a.FLAGS, 2)=2))
						 AND (:I_GROUPID IS NULL OR (EXISTS
							 (SELECT 1 FROM objQual_USERGROUP x
								WHERE x.USERID=a.USERID AND x.GROUPID=:I_GROUPID))
								 AND (:I_RANKID IS NULL OR a.RANKID=:I_RANKID))
ORDER BY
a.NAME
INTO
:"UserID",
		   :"BoardID",
		   :"ProviderUserKey",
		   :"Name",
		   :"Password",
		   :"Email",
		   :"Joined",
		   :"LastVisit",
		   :"IP",
		   :"NumPosts",
		   :"TimeZone",
		   :"Avatar",
		   :"Signature",
		   :"AvatarImage",
		   :"AvatarImageType",
		   :"RankID1",
		   :"Suspended",
		   :"LanguageFile",
		   :"ThemeFile",
		   :"OverrideDefaultThemes",
		   :"PMNotification",
		   :"Flags",
		   :"Points",
		   :"IsApproved",
		   :"IsActiveExcluded",           
		   :"RankID",     
		   :"RankName",
		   :"NumDays",
		   :"NumPostsForum",
		   :"HasAvatarImage",
		   :"IsAdmin",
		   :"IsGuest",
		   :"IsHostAdmin",
		   :"IsForumModerator",
		   :"IsModerator"
DO BEGIN
 "NumDays"=COALESCE(current_date-CAST("Joined" AS DATE),0)+1;
 SUSPEND;
 END
 END     
END;
--GO

CREATE PROCEDURE objQual_USER_MEDAL_DELETE
	(I_USERID INTEGER,
	I_MEDALID INTEGER)
	AS
BEGIN 
 
	DELETE FROM objQual_USERMEDAL 
	WHERE USERID=:I_USERID AND MEDALID=:I_MEDALID;
 
END;
--GO

CREATE PROCEDURE objQual_USER_MEDAL_LIST(I_USERID INTEGER,
	I_MEDALID INTEGER)
	RETURNS
	(
"MedalID" integer,
"Name" VARCHAR(128),
"MedalURL" VARCHAR(255),
"RibbonURL" VARCHAR(255),
"SmallMedalURL" VARCHAR(255),
"SmallRibbonURL" VARCHAR(255),
"SmallMedalWidth" integer,
"SmallMedalHeight" integer,
"SmallRibbonWidth" integer,
"SmallRibbonHeight" integer,
"SortOrder" integer,
"Flags" integer,
"UserName" varchar(128),
"DisplayName" varchar(128),
"UserID" integer,
"Message" BLOB SUB_TYPE 1,
"MessageEx" BLOB SUB_TYPE 1,
"Hide" BOOL,
"OnlyRibbon" BOOL,
"CurrentSortOrder" smallint,
"DateAwarded" timestamp
)
	AS
BEGIN 
	FOR SELECT 
		a.MEDALID,
		a.NAME,
		a.MEDALURL,
		a.RIBBONURL,
		a.SMALLMEDALURL,
		a.SMALLRIBBONURL,
		a.SMALLMEDALWIDTH,
		a.SMALLMEDALHEIGHT,
		a.SMALLRIBBONWIDTH,
		a.SMALLRIBBONHEIGHT,
		b.SORTORDER,
		a.FLAGS,
		c.NAME as "UserName",
		c.DISPLAYNAME,
		b.USERID,
		COALESCE(b.MESSAGE,a.MESSAGE) as "Message",
		b.MESSAGE as "MessageEx",
		b.HIDE,
		b.ONLYRIBBON,
		b.SORTORDER as "CurrentSortOrder",
		b.DATEAWARDED
	FROM
		objQual_MEDAL a
		INNER JOIN objQual_USERMEDAL b ON b.MEDALID = a.MEDALID
		INNER JOIN objQual_USER c ON c.USERID = b.USERID
	WHERE
		(:I_USERID IS NULL OR b.USERID = :I_USERID) AND
		(:I_MEDALID IS NULL OR b.MEDALID = :I_MEDALID)		
	ORDER BY
		c.NAME ASC,
		b.SORTORDER ASC
		INTO
		:"MedalID",
		:"Name",
		:"MedalURL",
		:"RibbonURL",
		:"SmallMedalURL",
		:"SmallRibbonURL",
		:"SmallMedalWidth",
		:"SmallMedalHeight",
		:"SmallRibbonWidth",
		:"SmallRibbonHeight",
		:"SortOrder",
		:"Flags",
		:"UserName",
		:"DisplayName",
		:"UserID",
		:"Message",
		:"MessageEx",
		:"Hide",
		:"OnlyRibbon",
		:"CurrentSortOrder",
		:"DateAwarded"
DO SUSPEND;
 
END;
--GO
		   
CREATE PROCEDURE objQual_USER_MEDAL_SAVE(I_USERID INTEGER,
	I_MEDALID INTEGER,
	I_MESSAGE varchar(128),
	I_HIDE BOOL,
	I_ONLYRIBBON BOOL,
	I_SORTORDER SMALLINT,
	I_DATEAWARDED TIMESTAMP,
	I_UTCTIMESTAMP TIMESTAMP)
	AS
BEGIN
 
	IF (EXISTS(SELECT 1 from objQual_USERMEDAL 
	WHERE USERID=:I_USERID AND MEDALID=:I_MEDALID)) THEN
		UPDATE objQual_USERMEDAL
		SET
			MESSAGE = :I_MESSAGE,
			HIDE = :I_HIDE,
			ONLYRIBBON = :I_ONLYRIBBON,
			SORTORDER = :I_SORTORDER
		WHERE
			USERID=:I_USERID AND 
			MEDALID=:I_MEDALID;
	
	ELSE 
 BEGIN
		IF (I_DATEAWARDED IS NULL) THEN  I_DATEAWARDED = :I_UTCTIMESTAMP;
 
		INSERT INTO objQual_USERMEDAL(USERID,MEDALID,MESSAGE,HIDE,ONLYRIBBON,
		SORTORDER,DATEAWARDED)
		VALUES
			(:I_USERID,:I_MEDALID,:I_MESSAGE,:I_HIDE,:I_ONLYRIBBON,:I_SORTORDER,:I_DATEAWARDED);
 END

END;
--GO

CREATE PROCEDURE objQual_USER_MIGRATE
 (
	I_USERID INTEGER,
	I_PROVIDERUSERKEY VARCHAR(64),
	I_UPDATEPROVIDER BOOL
 )
 AS
 DECLARE ici_Password VARCHAR(255);
	DECLARE ici_IsApproved BOOL;
	DECLARE ici_LastActivity TIMESTAMP;
		DECLARE ici_Joined TIMESTAMP;
		DECLARE ici_case INTEGER;
		DECLARE ici_result BOOL DEFAULT 0;
 BEGIN
	


	UPDATE objQual_USER SET PROVIDERUSERKEY = CHAR_TO_UUID(:I_PROVIDERUSERKEY)
	 WHERE USERID = :I_USERID;
 
	IF (I_UPDATEPROVIDER = 1) THEN 	
	  BEGIN          
	   SELECT		
			BIN_AND(FLAGS, 2)                
		  FROM
			objQual_USER
		  WHERE
			USERID = :I_USERID INTO :ici_case;
			
		   IF (ici_case =2) THEN ici_result =1;            
				 
				
		SELECT
			  "PASSWORD",
			  (SELECT :ici_result FROM RDB$DATABASE),
			  LASTVISIT,
			  JOINED                
		FROM
			objQual_USER
		WHERE
			USERID = :I_USERID
			INTO :ici_Password, :ici_IsApproved, :ici_LastActivity, :ici_Joined;
		
		UPDATE
			objQual_P_Membership
		SET
			"PASSWORD" = :ici_Password,
			PASSWORDFORMAT = '1',
			LASTACTIVITY = :ici_LastActivity,
			ISAPPROVED = :ici_IsApproved,
			JOINED = :ici_Joined
		WHERE
			USERID = CHAR_TO_UUID(:I_PROVIDERUSERKEY);
	END
 END;
--GO
CREATE PROCEDURE objQual_USER_SAVE(
	             I_USERID               INTEGER,
				 I_BOARDID		        INTEGER,
				 I_USERNAME		        VARCHAR(128),
				 I_DISPLAYNAME          VARCHAR(128),
				 I_EMAIL			    VARCHAR(128),
				 I_TIMEZONE		        INTEGER,
				 I_LANGUAGEFILE		    VARCHAR(128),
				 I_CULTURE		        VARCHAR(10),
				 I_THEMEFILE		    VARCHAR(128),
				 I_USESINGLESIGHON      BOOL,
				 I_TEXTEDITOR			VARCHAR(50),
				 I_OVERRIDEDEFAULTTHEME	BOOL,
				 I_APPROVED		        BOOL,
				 I_PMNOTIFICATION		BOOL,
				 I_NOTIFICATIONTYPE     INTEGER,
				 I_AUTOWATCHTOPICS      BOOL,
				 I_PROVIDERUSERKEY	    VARCHAR(64),
				 I_DSTUSER              BOOL,
				 I_UTCTIMESTAMP         TIMESTAMP,
				 I_HIDEUSER             BOOL)
		RETURNS
		("UserID" INTEGER)
AS
DECLARE ici_RankID INTEGER;
DECLARE ICI_FLAGS INTEGER DEFAULT 0;
BEGIN 	
	
	IF (:I_PMNOTIFICATION IS NULL) THEN I_PMNOTIFICATION = 1; 	
	IF (:I_OVERRIDEDEFAULTTHEME IS NULL) THEN I_OVERRIDEDEFAULTTHEME=0;	
	IF (:I_AUTOWATCHTOPICS IS NULL) THEN I_AUTOWATCHTOPICS = 0;
	IF (:I_DSTUSER IS NULL) THEN I_DSTUSER = 0;
	IF (:I_HIDEUSER IS NULL) THEN I_HIDEUSER = 0;
	if (:I_USESINGLESIGHON IS NULL) THEN  I_USESINGLESIGHON = 0;
	IF (I_USERID IS NULL OR I_USERID < 1) THEN
	BEGIN 
		ICI_FLAGS = 0; 
		IF (:I_APPROVED<>0) THEN  ICI_FLAGS = BIN_OR(:ICI_FLAGS, 2); 
		IF (:I_EMAIL = '') THEN  I_EMAIL = null;  		
		SELECT RANKID  FROM objQual_RANK 
		WHERE BIN_AND(FLAGS, 1)<>0 AND BOARDID=:I_BOARDID
		INTO :ici_RankID;
	 SELECT NEXT VALUE FOR SEQ_YAF_USER_USERID  
	 FROM RDB$DATABASE INTO :I_USERID;
		INSERT INTO objQual_USER(USERID,BOARDID,RANKID,"NAME",DISPLAYNAME,"PASSWORD","EMAIL",JOINED,LASTVISIT,NUMPOSTS,TIMEZONE,FLAGS,PMNOTIFICATION,PROVIDERUSERKEY, AUTOWATCHTOPICS, CULTURE) 
		VALUES(:I_USERID,:I_BOARDID,:ici_RankID,:I_USERNAME,:I_DISPLAYNAME,'-',:I_EMAIL, :I_UTCTIMESTAMP,:I_UTCTIMESTAMP,0,:I_TIMEZONE,:ICI_FLAGS,:I_PMNOTIFICATION,CHAR_TO_UUID(:I_PROVIDERUSERKEY),:I_AUTOWATCHTOPICS, :I_CULTURE); 		
 
		INSERT INTO objQual_USERGROUP(USERID,GROUPID)
		SELECT 
		(SELECT :I_USERID FROM RDB$DATABASE) AS USERID,
		GROUPID FROM objQual_GROUP 
		where BOARDID=:I_BOARDID and BIN_AND(FLAGS, 4)<>0;
	 END
	ELSE
	BEGIN
		SELECT FLAGS FROM objQual_USER where USERID = :I_USERID INTO :ICI_FLAGS;

		-- set user data unapproved or dirty
		IF ((BIN_AND(:ICI_FLAGS, 64) <> 64)) THEN		
		ICI_FLAGS = BIN_OR(:ICI_FLAGS, 64);
		
		IF ((:I_DSTUSER <>0) AND (BIN_AND(:ICI_FLAGS, 32) <> 32)) THEN		
		ICI_FLAGS = BIN_OR(:ICI_FLAGS, 32);
		ELSE IF ((:I_DSTUSER=0) AND (BIN_AND(:ICI_FLAGS, 32) = 32)) THEN
		ICI_FLAGS = BIN_XOR(:ICI_FLAGS , 32);
			
		IF ((:I_HIDEUSER<>0) AND (BIN_AND(:ICI_FLAGS,16) <> 16)) THEN 
		ICI_FLAGS = BIN_OR(:ICI_FLAGS , 16); 
		ELSE IF ((:I_HIDEUSER=0) AND (BIN_AND(:ICI_FLAGS,16) = 16)) THEN  
		ICI_FLAGS = BIN_XOR(:ICI_FLAGS, 16);
		
	UPDATE objQual_USER SET
	TIMEZONE = :I_TIMEZONE,
	LANGUAGEFILE = :I_LANGUAGEFILE,
	THEMEFILE = :I_THEMEFILE,
	OVERRIDEDEFAULTTHEMES = :I_OVERRIDEDEFAULTTHEME,
	PMNOTIFICATION = :I_PMNOTIFICATION,
	AUTOWATCHTOPICS = :I_AUTOWATCHTOPICS,
	CULTURE = :I_CULTURE,
	USESINGLESIGNON = :I_USESINGLESIGHON,
	TEXTEDITOR = 	:I_TEXTEDITOR,
	FLAGS = (CASE WHEN (:ICI_FLAGS <> FLAGS) 
			THEN :ICI_FLAGS ELSE FLAGS END),
	EMAIL = (CASE WHEN  (:I_EMAIL is not null) THEN :I_EMAIL ELSE EMAIL END),
	DISPLAYNAME = (CASE WHEN  (:I_DISPLAYNAME is not null) THEN :I_DISPLAYNAME ELSE DISPLAYNAME END)
	WHERE USERID = :I_USERID;
 
	END
		
	END;
--GO


 CREATE PROCEDURE objQual_USER_SETNOTDIRTY(I_USERID INTEGER)
	AS
	BEGIN
	UPDATE objQual_USER SET FLAGS = BIN_XOR(FLAGS,64) WHERE USERID = :I_USERID AND FLAGS = BIN_AND(FLAGS,64);
	END;
--GO


 CREATE PROCEDURE objQual_USER_SETPOINTS(I_USERID INTEGER,I_POINTS INTEGER)
	AS
	BEGIN
	UPDATE objQual_USER SET POINTS = :I_POINTS WHERE USERID = :I_USERID;
	END;
--GO

 CREATE PROCEDURE objQual_USER_SETROLE
	(I_BOARDID INTEGER,
	I_PROVIDERUSERKEY VARCHAR(64),
	I_ROLE VARCHAR(128))
	AS
	DECLARE ICI_USERID INTEGER;
	DECLARE ici_GroupID INTEGER;
	BEGIN    

	SELECT USERID 
	FROM objQual_USER
	WHERE BOARDID=:I_BOARDID AND PROVIDERUSERKEY=CHAR_TO_UUID(:I_PROVIDERUSERKEY)
	INTO :ICI_USERID;

  IF (:I_ROLE IS NULL OR :I_ROLE = '' ) THEN     
	DELETE FROM objQual_USERGROUP WHERE USERID=:ICI_USERID;
  ELSE
  BEGIN
	IF (NOT EXISTS(SELECT 1 from objQual_GROUP WHERE BOARDID=:I_BOARDID AND NAME=:I_ROLE)) THEN
  BEGIN
	SELECT NEXT VALUE FOR SEQ_objQual_GROUP_GROUPID FROM RDB$DATABASE INTO :ici_GroupID;
	INSERT INTO objQual_GROUP(GROUPID,NAME,BOARDID,FLAGS)
	VALUES (:ici_GroupID,:I_ROLE,:I_BOARDID,0);    

	insert into objQual_FORUMACCESS(GROUPID,FORUMID,ACCESSMASKID)
	SELECT
	(SELECT :ici_GroupID FROM RDB$DATABASE) AS GROUPID,
	a.FORUMID,
	MIN(a.ACCESSMASKID) AS "AccessMaskID"
	FROM
	objQual_FORUMACCESS a
	JOIN objQual_GROUP b ON b.GROUPID=a.GROUPID
	WHERE
	b.BOARDID=:I_BOARDID AND
	BIN_AND(b.FLAGS, 4)=4
	GROUP BY
	a.FORUMID;
  END
	ELSE
	BEGIN
	SELECT  GROUPID 
	FROM objQual_GROUP WHERE BOARDID=:I_BOARDID AND NAME=:I_ROLE
	INTO :ici_GroupID; 
	END
	IF (NOT EXISTS ( SELECT 1 FROM objQual_USERGROUP WHERE USERID = :ICI_USERID AND :ici_GroupID = :ici_GroupID)) THEN
	INSERT INTO objQual_USERGROUP(USERID,GROUPID) 
	VALUES (:ICI_USERID,:ici_GroupID);
 END
	END;
--GO    

 CREATE PROCEDURE objQual_USER_SIMPLELIST(
	I_STARTID INTEGER,
	I_LIMIT   INTEGER)
	RETURNS
	(
"UserID" integer,
"Name"  varchar(128)
)
	AS
	DECLARE l_Limit INTEGER DEFAULT 500;
	DECLARE l_StartID INTEGER DEFAULT 0;
	BEGIN
	
	
		IF (I_STARTID IS NOT NULL) THEN  l_StartID =I_STARTID ;
		IF (I_LIMIT IS NOT NULL) THEN  l_Limit=I_LIMIT;

	FOR SELECT FIRST (:l_Limit) a.USERID,
	a.NAME
	FROM     objQual_USER a
	WHERE    a.USERID >= :l_StartID
	AND a.USERID < (:l_StartID + :l_Limit)
		 ORDER BY a.USERID
		 INTO
		 :"UserID",
		 :"Name"
		 DO SUSPEND;          
	   
	 END;
   --GO  
   
  CREATE PROCEDURE objQual_USER_SUSPEND(I_USERID INTEGER,I_SUSPEND TIMESTAMP)
	AS
	BEGIN
	UPDATE objQual_USER SET SUSPENDED = :I_SUSPEND WHERE USERID=:I_USERID;
	END;
--GO

CREATE PROCEDURE objQual_USERFORUM_DELETE(I_USERID INTEGER,I_FORUMID INTEGER)
AS
BEGIN
	DELETE FROM objQual_USERFORUM WHERE USERID=:I_USERID AND FORUMID=:I_FORUMID;
END;
--GO

CREATE PROCEDURE objQual_USERFORUM_LIST(I_USERID INTEGER,I_FORUMID INTEGER)
RETURNS
(
  "UserID" INTEGER,
  "BoardID" INTEGER,
  "ProviderUserKey" VARCHAR(64),
  "Name" VARCHAR(255),
  "DisplayName" VARCHAR(255),
  "Password" VARCHAR(32),
  "Email" VARCHAR(128),
  "Joined" TIMESTAMP,
  "LastVisit" TIMESTAMP,
  "IP" VARCHAR(39),
  "NumPosts" INTEGER,
  "TimeZone" INTEGER,
  "Avatar" VARCHAR(255),
  "Signature" BLOB SUB_TYPE 1 SEGMENT SIZE 20 CHARACTER SET UTF8,
  "AvatarImage" BLOB SUB_TYPE 0,
  "AvatarImageType" VARCHAR(128),
  "RankID" INTEGER,  
  "Suspended" TIMESTAMP,
  "LanguageFile" VARCHAR(128),
  "ThemeFile" VARCHAR(128),
  "UseSingleSignOn" BOOL,
  "TextEditor" VARCHAR(50),
  "OverrideDefaultThemes" BOOL,
  "PMNotification" BOOL,
  "NotificationType" INTEGER, 
  "Flags" INTEGER,
  "Points" INTEGER,
  "IsApproved" BOOL,
  "IsGuest" BOOL,
  "IsCaptchaExcluded" BOOL,
  "IsActiveExcluded" BOOL,
  "IsDST" BOOL,
  "IsDirty"  BOOL,
  "AutoWatchTopics" BOOL,
  "CultureUser" VARCHAR(10), 
  "DailyDigest" BOOL, 
  "AccessMaskID" integer,
  "Accepted" BOOL,
  "Access" varchar(128)
)
AS
BEGIN
 FOR SELECT
		a.USERID,
        a.BOARDID,
        UUID_TO_CHAR(a.PROVIDERUSERKEY),
        a.NAME,
        a.DISPLAYNAME,		
        a."PASSWORD",
        a."EMAIL",
        a.JOINED,
        a.LASTVISIT,
        a.IP,
        a.NUMPOSTS,
        a.TIMEZONE,
        a.AVATAR,
        a.SIGNATURE,
        a.AVATARIMAGE,
        a.AVATARIMAGETYPE,
        a.RANKID,
        a.SUSPENDED,
        a.LANGUAGEFILE,
        a.THEMEFILE,
        a.USESINGLESIGNON,
        a.TEXTEDITOR,
        a.OVERRIDEDEFAULTTHEMES,
        a.PMNOTIFICATION,
        a.NOTIFICATIONTYPE,	
        a.FLAGS,
        a.POINTS,
        a.ISAPPROVED,
        a.ISGUEST,
        a.ISCAPTCHAEXCLUDED,
        a.ISACTIVEEXCLUDED,
        a.ISDST,
		a.ISDIRTY, 
        a.AUTOWATCHTOPICS,
        a.CULTURE,
        a.DAILYDIGEST,	 
		b.ACCESSMASKID,
		b.ACCEPTED,
		c.NAME AS "Access" 
	FROM
		objQual_USER a
		JOIN objQual_USERFORUM b ON b.USERID=a.USERID
		JOIN objQual_ACCESSMASK c ON c.ACCESSMASKID=b.ACCESSMASKID
	WHERE
		(:I_USERID IS NULL OR a.USERID=:I_USERID) AND
		(:I_FORUMID IS NULL OR b.FORUMID=:I_FORUMID)
	ORDER BY
		a.NAME
		INTO
		:"UserID",
        :"BoardID",
        :"ProviderUserKey",
        :"Name",
		:"DisplayName",
        :"Password",
        :"Email",
        :"Joined",
        :"LastVisit",
        :"IP",
        :"NumPosts",
        :"TimeZone",
        :"Avatar",
        :"Signature",
        :"AvatarImage",
        :"AvatarImageType",
        :"RankID",  
        :"Suspended",
        :"LanguageFile",
        :"ThemeFile",
        :"UseSingleSignOn",
        :"TextEditor",
        :"OverrideDefaultThemes",
        :"PMNotification",
        :"NotificationType", 
        :"Flags",
        :"Points",
        :"IsApproved",
        :"IsGuest",
        :"IsCaptchaExcluded",
        :"IsActiveExcluded",
        :"IsDST",
		:"IsDirty",
        :"AutoWatchTopics",
        :"CultureUser", 
        :"DailyDigest", 
		:"AccessMaskID",
		:"Accepted",
		:"Access"
  DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USERFORUM_SAVE(I_USERID INTEGER,I_FORUMID INTEGER,I_ACCESSMASKID INTEGER, I_UTCTIMESTAMP Timestamp)
AS
BEGIN
	IF (EXISTS(SELECT 1 FROM objQual_USERFORUM 
	WHERE USERID=:I_USERID AND FORUMID=:I_FORUMID)) THEN
		UPDATE objQual_USERFORUM SET ACCESSMASKID=:I_ACCESSMASKID 
		WHERE USERID=:I_USERID AND FORUMID=:I_FORUMID;
	ELSE
		INSERT INTO objQual_USERFORUM(USERID,FORUMID,ACCESSMASKID,INVITED,ACCEPTED) 
		VALUES(:I_USERID,:I_FORUMID,:I_ACCESSMASKID,:I_UTCTIMESTAMP,1);
	  
END;
--GO

CREATE PROCEDURE objQual_TOPIC_FINDDUPLICATE
(
	I_TOPICNAME varchar(255)
)
RETURNS
(
OUT_RESULT INTEGER
)
AS
BEGIN
	IF (I_TOPICNAME IS NOT NULL) THEN
	BEGIN	
		IF (EXISTS (SELECT FIRST 1 1 FROM objQual_TOPIC WHERE TOPIC LIKE  :I_TOPICNAME AND TOPICMOVEDID IS NULL)) THEN
		SELECT 1 FROM RDB$DATABASE INTO :OUT_RESULT;
		ELSE
		SELECT 0 FROM RDB$DATABASE INTO :OUT_RESULT;
    END
	ELSE
	BEGIN
		SELECT 0 FROM RDB$DATABASE INTO :OUT_RESULT;
	END	
	SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USERGROUP_LIST(I_USERID INTEGER)
RETURNS
 (
"GroupID" integer,
"Name" VARCHAR(128),
"Style"  VARCHAR(255) 
)
AS
BEGIN
	FOR SELECT 
		b.GROUPID,
		b.NAME,
		b.STYLE
	FROM
		objQual_USERGROUP a
		JOIN objQual_GROUP b ON b.GROUPID=a.GROUPID
	WHERE
		a.USERID = :I_USERID
	ORDER BY
		b.NAME
		INTO
		:"GroupID",
		:"Name",
		:"Style"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USERGROUP_SAVE(I_USERID INTEGER,I_GROUPID INTEGER,I_MEMBER BOOL)
AS
BEGIN
	IF (I_MEMBER=0) THEN
		DELETE FROM objQual_USERGROUP WHERE USERID=:I_USERID AND GROUPID=:I_GROUPID;
	ELSE
	BEGIN
	IF (NOT EXISTS(SELECT 1 FROM objQual_USERGROUP 
	WHERE USERID=:I_USERID AND GROUPID=:I_GROUPID)) THEN
		INSERT INTO objQual_USERGROUP(USERID,GROUPID)
		VALUES (:I_USERID,:I_GROUPID);
	 END 
END;
--GO

CREATE PROCEDURE objQual_USERPMESSAGE_DELETE(I_USERPMESSAGEID INTEGER)
AS
BEGIN
	DELETE FROM objQual_USERPMESSAGE WHERE USERPMESSAGEID=:I_USERPMESSAGEID;
END;
--GO

CREATE PROCEDURE objQual_USERPMESSAGE_LIST(I_USERPMESSAGEID INTEGER)
RETURNS
(
"PMessageID" integer,
"FromUserID" integer,
"Created" timestamp,
"Subject" varchar(128),
"Body" BLOB SUB_TYPE 1,
"Flags" integer,
"FromUser" varchar(128),
"ToUserID" integer,
"ToUser" varchar(128),
"IsRead" BOOL,
"IsDeleted" BOOL,
"UserPMessageID" integer
) 
AS
BEGIN
	FOR SELECT
		a.*,
		b.NAME AS "FromUser",
		c.USERID AS ToUserID,
		c.NAME AS ToUser,
		d.ISREAD,
		d.ISDELETED,
		d.USERPMESSAGEID
	FROM
		objQual_PMESSAGE a
		inner join objQual_USERPMESSAGE d on d.PMESSAGEID = a.PMESSAGEID
		inner join objQual_USER b on b.USERID = a.FROMUSERID
		inner join objQual_USER c on c.USERID = d.USERID
	WHERE
		d.USERPMESSAGEID = :I_USERPMESSAGEID AND
		d.ISDELETED=0
		INTO
		:"PMessageID",
		:"FromUserID",
		:"Created",
		:"Subject",
		:"Body",
		:"Flags",
		:"FromUser",
		:"ToUserID",
		:"ToUser",
		:"IsRead",
		:"IsDeleted",
		:"UserPMessageID"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_WATCHFORUM_ADD(I_USERID INTEGER,I_FORUMID INTEGER, I_UTCTIMESTAMP TIMESTAMP)
AS
BEGIN
						  
							IF (NOT EXISTS (SELECT 1 FROM objQual_WATCHFORUM a
							WHERE a.FORUMID=:I_FORUMID
							AND a.USERID = :I_USERID)) THEN
							INSERT INTO objQual_WATCHFORUM
							(WATCHFORUMID,FORUMID,
							USERID,
							CREATED)
							VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_WATCHFORUM_WATCHFORUMID FROM RDB$DATABASE),:I_FORUMID,
							:I_USERID,
							:I_UTCTIMESTAMP);
							
 END;                           
--GO

CREATE PROCEDURE objQual_WATCHFORUM_CHECK(I_USERID INTEGER,I_FORUMID INTEGER)
RETURNS
("WatchForumID" INTEGER)
AS
BEGIN 
	FOR SELECT WATCHFORUMID
	 FROM objQual_WATCHFORUM
		 WHERE USERID = :I_USERID AND FORUMID = :I_FORUMID
		 INTO :"WatchForumID"
		 DO
	SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_WATCHFORUM_DELETE(I_WATCHFORUMID INTEGER) 
AS
BEGIN
	DELETE FROM objQual_WATCHFORUM WHERE WATCHFORUMID = :I_WATCHFORUMID;
END;
--GO

CREATE PROCEDURE objQual_WATCHFORUM_LIST(I_USERID INTEGER) 
RETURNS
(
"WatchForumID" integer,
"ForumID" integer,
"UserID" integer,
"Created" timestamp,
"LastMail" timestamp,
"ForumName" varchar(128),
"Messages" integer,
"Topics" integer,
"LastPosted" timestamp,
"LastMessageID"  integer,
"LastTopicID" integer,
"LastUserID" integer,
"LastUserName" varchar(128)
)
AS
BEGIN
	FOR SELECT
		a.*,
		b.NAME AS "ForumName",
		(SELECT COUNT(1) FROM objQual_TOPIC x JOIN objQual_MESSAGE y 
		ON y.TOPICID=x.TOPICID WHERE x.FORUMID=a.FORUMID) AS "Messages",
		(SELECT COUNT(1) FROM objQual_TOPIC x 
		WHERE x.FORUMID=a.FORUMID AND x.TOPICMOVEDID IS NULL) AS "Topics",
		b.LASTPOSTED,
		b.LASTMESSAGEID,
		(SELECT TOPICID FROM objQual_MESSAGE x 
		WHERE x.MESSAGEID=b.LASTMESSAGEID) AS "LastTopicID",
		b.LASTUSERID,
		COALESCE(b.LASTUSERNAME,
		(select NAME from objQual_USER x where x.USERID=b.LASTUSERID)) AS LASTUSERNAME
	FROM
		objQual_WATCHFORUM a
		INNER JOIN objQual_FORUM b ON b.FORUMID = a.FORUMID
	WHERE
		a.USERID = :I_USERID
		INTO
		:"WatchForumID",
		:"ForumID",
		:"UserID",
		:"Created",
		:"LastMail",
		:"ForumName",
		:"Messages",
		:"Topics",
		:"LastPosted",
		:"LastMessageID",
		:"LastTopicID",
		:"LastUserID",
		:"LastUserName"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_WATCHTOPIC_ADD(I_USERID INTEGER,I_TOPICID INTEGER, I_UTCTIMESTAMP TIMESTAMP) 
AS
BEGIN
	 IF (NOT EXISTS(SELECT 1 FROM objQual_WATCHTOPIC 
	 WHERE TOPICID=:I_TOPICID AND USERID=:I_USERID)) THEN
	 INSERT INTO objQual_WATCHTOPIC(WATCHTOPICID,TOPICID,USERID,CREATED)
	 VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_WATCHTOPIC_WATCHTOPICID FROM RDB$DATABASE),:I_TOPICID, :I_USERID, :I_UTCTIMESTAMP); 	
	   
END;
--GO

CREATE PROCEDURE objQual_WATCHTOPIC_CHECK(I_USERID INTEGER,I_TOPICID INTEGER) 
RETURNS ("WatchTopicID" INTEGER)
AS
BEGIN
FOR
	SELECT WATCHTOPICID FROM objQual_WATCHTOPIC 
	WHERE USERID = :I_USERID AND TOPICID = :I_TOPICID
	INTO :"WatchTopicID"
	DO
	SUSPEND;
END;
--GO


CREATE PROCEDURE objQual_WATCHTOPIC_DELETE(I_WATCHTOPICID INTEGER)
AS
BEGIN
	DELETE FROM objQual_WATCHTOPIC WHERE WATCHTOPICID = :I_WATCHTOPICID;
END;
--GO

CREATE PROCEDURE objQual_WATCHTOPIC_LIST(I_USERID INTEGER)
RETURNS
(
"WatchTopicID" integer,
"TopicID" integer,
"UserID" integer,
"Created" timestamp,
"LastMail" timestamp,
"TopicName" varchar(128),
"Replies" integer,
"Views" integer,
"LastPosted" timestamp,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" varchar(128)
)
AS 
BEGIN
	FOR SELECT
		a.*,
		b.TOPIC AS "TopicName",
		(SELECT (COUNT(1) - 1) from objQual_MESSAGE x 
		where x.TOPICID=b.TOPICID) AS "Replies",
		b.VIEWS,
		b.LASTPOSTED,
		b.LASTMESSAGEID,
		b.LASTUSERID,
		COALESCE(b.LASTUSERNAME,(SELECT NAME 
		FROM objQual_USER x WHERE x.USERID=b.LASTUSERID)) AS "LastUserName"
	FROM
		objQual_WATCHTOPIC a
		INNER JOIN objQual_TOPIC b ON b.TOPICID = a.TOPICID
	WHERE
		a.USERID = :I_USERID
		INTO
		:"WatchTopicID",
		:"TopicID",
		:"UserID",
		:"Created",
		:"LastMail",
		:"TopicName",
		:"Replies",
		:"Views",
		:"LastPosted",
		:"LastMessageID",
		:"LastUserID",
		:"LastUserName"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USER_LOGIN(I_BOARDID INTEGER,I_NAME VARCHAR(128),I_PASSWORD VARCHAR(32))
RETURNS ("UserID" INTEGER)
AS
DECLARE ICI_USERID INTEGER;
BEGIN
	
 
	-- Try correct board first
	
	IF (EXISTS(SELECT USERID FROM objQual_USER 
	WHERE NAME=:I_NAME AND "PASSWORD"=:I_PASSWORD AND BOARDID=:I_BOARDID and BIN_AND(FLAGS, 2)=2)) THEN
	
		SELECT USERID  FROM objQual_USER WHERE NAME=:I_NAME 
		and "PASSWORD"=:I_PASSWORD AND BOARDID=:I_BOARDID and BIN_AND(FLAGS, 2)=2
		INTO :"UserID";
		
	ELSE
	BEGIN
	IF (NOT EXISTS(select USERID FROM objQual_USER WHERE NAME=:I_NAME 
	AND "PASSWORD"=:I_PASSWORD AND (BOARDID=:I_BOARDID OR BIN_AND(FLAGS, 3)=3))) THEN
		SELECT NULL FROM RDB$DATABASE INTO :"UserID";                 
	ELSE
	
		SELECT 
			  USERID 
		FROM 
			objQual_USER
		WHERE 
			NAME=:I_NAME AND
			"PASSWORD"=:I_PASSWORD AND 
			(BOARDID=:I_BOARDID OR BIN_AND(FLAGS, 1)=1) AND
			BIN_AND(FLAGS, 2)=2 			 
	INTO :"UserID";	
		END
		IF (ROW_COUNT > 0) THEN SUSPEND;
	  
END;
--GO

CREATE PROCEDURE objQual_user_ignoredlist
   (I_USERID INTEGER)
   RETURNS
   (
   "UserID" INTEGER,
   "IgnoredUserID" INTEGER
   )
AS
BEGIN
FOR	SELECT * FROM objQual_IGNOREUSER WHERE USERID = :I_USERID
	INTO
	:"UserID",
	:"IgnoredUserID"
	 DO SUSPEND;
END;	
--GO

CREATE PROCEDURE objQual_shoutbox_getmessages
(
  I_BOARDID INTEGER, 
  I_NUMBEROFMESSAGES INTEGER, 
  I_STYLEDNICKS BOOL
) 
RETURNS
(
"ShoutBoxMessageID" INTEGER,
"BoardID" INTEGER,
"UserID" INTEGER,
"UserName" VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
"Message"   BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8 COLLATE UNICODE,
"Date" TIMESTAMP,
IP VARCHAR(39),
"Style" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE
) 
AS
BEGIN

FOR SELECT FIRST (:I_NUMBEROFMESSAGES)
		sh.SHOUTBOXMESSAGEID,
		sh.BOARDID,
		sh.USERID,
		sh.USERNAME,		
		sh.MESSAGE,
		sh."DATE",
		sh.IP,
		(case(:I_STYLEDNICKS)
			when 1 then  (SELECT * FROM objQual_GET_USERSTYLE(USERID))  
			else (SELECT '' FROM RDB$DATABASE)	 end)
	FROM
		objQual_SHOUTBOXMESSAGE sh WHERE sh.BOARDID = :I_BOARDID
	ORDER BY "DATE" DESC
	INTO
	:"ShoutBoxMessageID",
	:"BoardID",
	:"UserID",
	:"UserName",
	:"Message",
	:"Date",
	:IP,
	:"Style"
	DO SUSPEND;
	
END;
--GO

CREATE PROCEDURE objQual_SHOUTBOX_SAVEMESSAGE(
    I_BOARDID INTEGER,
	I_USERNAME		varchar(128),
	I_USERID		integer,
	I_MESSAGE		BLOB SUB_TYPE 1 SEGMENT SIZE 80,
	I_DATE			timestamp,
	I_IP			VARCHAR(39),
	I_UTCTIMESTAMP  timestamp
)
AS
BEGIN
	
	IF (I_DATE IS NULL) then
		I_DATE = :I_UTCTIMESTAMP;

	INSERT INTO objQual_SHOUTBOXMESSAGE (SHOUTBOXMESSAGEID, BOARDID, USERNAME, USERID, MESSAGE, "DATE", IP)
	VALUES ((SELECT NEXT VALUE FOR SEQ_objQual_SBOXMESG_SBOXMESGID FROM RDB$DATABASE),:I_BOARDID,:I_USERNAME, :I_USERID, :I_MESSAGE, :I_DATE, :I_IP);

END;
--GO

CREATE PROCEDURE objQual_SHOUTBOX_CLEARMESSAGES(I_BOARDID INTEGER, I_UTCTIMESTAMP TIMESTAMP) 
AS
BEGIN
	DELETE FROM objQual_SHOUTBOXMESSAGE WHERE BOARDID = :I_BOARDID AND  DATEDIFF(DAY FROM  "DATE" TO  :I_UTCTIMESTAMP) > 1;
END;
--GO

CREATE PROCEDURE objQual_DB_SIZE(I_DBNAME varchar(128))
RETURNS (DBSIZE integer)
AS
BEGIN
I_DBNAME = '%' ||  :I_DBNAME || '%';
SELECT  (a.MON$PAGE_SIZE * a.MON$PAGES)/1024/1024  
FROM  MON$DATABASE a WHERE UPPER(a.MON$DATABASE_NAME) LIKE :I_DBNAME
INTO :DBSIZE;
SUSPEND;
END;
--GO

/* Procedures for "Thanks" Mod */
CREATE PROCEDURE objQual_MESSAGE_ADDTHANKS(I_FROMUSERID integer, I_MESSAGEID integer, I_UTCTIMESTAMP timestamp)
RETURNS (O_PARAMOUTPUT varchar(128))
AS
DECLARE VARIABLE ICI_TOUSERID INTEGER;
BEGIN
IF ( not exists (SELECT 1 FROM objQual_THANKS WHERE MESSAGEID = :I_MESSAGEID  AND THANKSFROMUSERID = :I_FROMUSERID)) THEN
BEGIN
	SELECT USERID FROM objQual_MESSAGE WHERE MESSAGEID = :I_MESSAGEID INTO :ICI_TOUSERID ;

	INSERT INTO objQual_THANKS (THANKSID,THANKSFROMUSERID, THANKSTOUSERID, MESSAGEID, THANKSDATE) 
		values ((SELECT NEXT VALUE FOR SEQ_objQual_THANKS_THANKSID FROM RDB$DATABASE),:I_FROMUSERID, :ICI_TOUSERID, :I_MESSAGEID , :I_UTCTIMESTAMP);
	SELECT NAME FROM objQual_USER WHERE (USERID=:ICI_TOUSERID) 
		INTO :O_PARAMOUTPUT;
END
ELSE
	SELECT '' FROM RDB$DATABASE INTO :O_PARAMOUTPUT;
SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_GETTHANKS(I_MESSAGEID integer)
RETURNS ("UserID" integer, "ThanksDate" timestamp,"Name" varchar(128),"DisplayName" varchar(128) )
AS
BEGIN
FOR	SELECT a.THANKSFROMUSERID, a.THANKSDATE, b.NAME, b.DISPLAYNAME
	FROM objQual_THANKS a 
	Inner Join objQual_USER b
	ON (a.THANKSFROMUSERID = b.USERID) WHERE (MESSAGEID=:I_MESSAGEID)
	ORDER BY a.THANKSDATE DESC
		INTO
		:"UserID", :"ThanksDate", :"Name", :"DisplayName"
		DO SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_GETALLTHANKS(I_MESSAGEIDS BLOB SUB_TYPE 1)
RETURNS 
("FromUserID" integer, 
"ThanksDate" timestamp, 
"MessageID" integer, 
"ToUserID" integer,
"ThanksFromUserNumber" integer,
"ThanksToUserNumber" integer,
"ThanksToUserPostsNumber" integer)
AS
DECLARE VARIABLE ICI_MESSAGEID varchar(11);
DECLARE VARIABLE ICI_MESSAGEIDSCHUNK varchar(4000);
DECLARE VARIABLE ICI_POS integer;
DECLARE VARIABLE ICI_ITR integer;
DECLARE VARIABLE ICI_TRIMINDEX integer;
DECLARE VARIABLE ICI_LONG INTEGER DEFAULT 0;
DECLARE VARIABLE ICI_MESSAGEIDSCHUNKCURRENT integer DEFAULT 0;
BEGIN
	ICI_ITR = 0; 
	ICI_POS = 0;
	ICI_TRIMINDEX = 0;
	--  1st chunk length
	ICI_MESSAGEIDSCHUNK  = SUBSTRING( :I_MESSAGEIDS FROM 1 FOR 4000 );
	
	
	WHILE (CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK) > 0) DO	
	BEGIN 


	IF (CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK) > 3989) THEN
	BEGIN    
	-- todo: Find commas in last positions
	-- ICI_Last = POSITION(',',REVERSE( :ICI_MESSAGEIDSCHUNK ), CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK));
	ICI_LONG = 1;
	END

			 -- find first comma position if we have more then 4000 length  
			 IF ( :ICI_LONG > 0 )  THEN       
			 ICI_TRIMINDEX = POSITION(',',REVERSE( :ICI_MESSAGEIDSCHUNK ), 1 ); 
			 ELSE
			 ICI_TRIMINDEX = 0;   

			 ICI_MESSAGEIDSCHUNKCURRENT = CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK); 
			 ICI_MESSAGEIDSCHUNK = SUBSTRING(:ICI_MESSAGEIDSCHUNK FROM 1 FOR :ICI_MESSAGEIDSCHUNKCURRENT - COALESCE(:ICI_TRIMINDEX,0));
			 ICI_ITR = :ICI_ITR - :ICI_TRIMINDEX;
			 ICI_MESSAGEIDSCHUNK = TRIM(BOTH FROM :ICI_MESSAGEIDSCHUNK) || ',';
			 ICI_POS = POSITION(',', :ICI_MESSAGEIDSCHUNK, 1);
		  
 IF ( REPLACE(:ICI_MESSAGEIDSCHUNK, ',', '') <> '') THEN
	BEGIN
	  WHILE (:ICI_POS > 0) DO
	   BEGIN	
	   ICI_MESSAGEID = LEFT(:ICI_MESSAGEIDSCHUNK, :ICI_POS  - 1);
	   ICI_MESSAGEID = TRIM( BOTH FROM :ICI_MESSAGEID  );					
			
	IF (:ICI_MESSAGEID <> '') THEN
	BEGIN	
	SELECT 
	b.THANKSFROMUSERID AS FromUserID, 
	b.THANKSDATE, 
	(SELECT 0 FROM RDB$DATABASE), 
	b.THANKSTOUSERID AS ToUserID,
	(SELECT COUNT(b.THANKSID) FROM objQual_THANKS b WHERE b.THANKSFROMUSERID=d.USERID) AS ThanksFromUserNumber,
	(SELECT COUNT(b.THANKSID) FROM objQual_THANKS b WHERE b.THANKSTOUSERID=d.USERID) AS ThanksToUserNumber,
	(SELECT COUNT(DISTINCT(b.MESSAGEID)) FROM objQual_THANKS b WHERE b.THANKSTOUSERID=d.USERID) AS ThanksToUserPostsNumber	
	FROM objQual_MESSAGE d 
	LEFT JOIN objQual_THANKS b ON (b.MESSAGEID = d.MESSAGEID)
	WHERE d.MESSAGEID=(CAST(:ICI_MESSAGEID AS integer))	
	INTO
	:"FromUserID", 
	:"ThanksDate", 
	:"MessageID", 
	:"ToUserID",
	:"ThanksFromUserNumber",
	:"ThanksToUserNumber",
	:"ThanksToUserPostsNumber";  
	"MessageID" = CAST(:ICI_MESSAGEID AS integer);
	 SUSPEND;
			
	END
			
			ICI_MESSAGEIDSCHUNK = RIGHT(:ICI_MESSAGEIDSCHUNK , (CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK ) - :ICI_POS));
			ICI_POS = POSITION(',', :ICI_MESSAGEIDSCHUNK , 1);	
			-- to be sure that last value is inserted
		/*	IF (CHAR_LENGTH(:ICI_MESSAGEIDSCHUNK) > 0) THEN
			BEGIN
			SELECT 
	b.THANKSFROMUSERID AS FromUserID, 
	b.THANKSDATE, 
	0, 
	b.THANKSTOUSERID AS ToUserID,
	(SELECT COUNT(THANKSID) FROM objQual_THANKS b WHERE b.THANKSFROMUSERID=d.USERID) AS ThanksFromUserNumber,
	(SELECT COUNT(THANKSID) FROM objQual_THANKS b WHERE b.THANKSTOUSERID=d.USERID) AS ThanksToUserNumber,
	(SELECT COUNT(DISTINCT(MESSAGEID)) FROM objQual_THANKS b WHERE b.THANKSTOUSERID=d.USERID) AS ThanksToUserPostsNumber	
	FROM objQual_MESSAGE d 
	LEFT JOIN objQual_THANKS b ON (b.MESSAGEID = d.MESSAGEID)
	WHERE d.MESSAGEID=(CAST(:ICI_MESSAGEIDSCHUNK AS integer))	
	INTO
	:"FromUserID", 
	:"ThanksDate", 
	:"MessageID", 
	:"ToUserID",
	:"ThanksFromUserNumber",
	:"ThanksToUserNumber",
	:"ThanksToUserPostsNumber";  
	"MessageID" = CAST(:ICI_MESSAGEIDSCHUNK AS integer);
	 SUSPEND;
	 END */
		
	END	
	END    
		  ICI_ITR = :ICI_ITR + :ICI_MESSAGEIDSCHUNKCURRENT;            
		  ICI_MESSAGEIDSCHUNK  = SUBSTRING( :I_MESSAGEIDS FROM :ICI_ITR FOR ( :ICI_ITR + 4000 ) ); 
			

END 	
	
	
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_REMOVETHANKS(I_FROMUSERID integer, I_MESSAGEID integer)
RETURNS (OUT_RESULT varchar(128))
AS
DECLARE VARIABLE ICI_TOUSERID integer;
BEGIN
	DELETE FROM objQual_THANKS 
		WHERE THANKSFROMUSERID=:I_FROMUSERID 
		AND MESSAGEID=:I_MESSAGEID;	
	SELECT USERID FROM objQual_MESSAGE WHERE MESSAGEID = :I_MESSAGEID INTO :ICI_TOUSERID;
	SELECT NAME FROM objQual_USER WHERE (USERID=:ICI_TOUSERID) INTO :OUT_RESULT;
SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_MESSAGE_THANKSNUMBER(I_MESSAGEID integer)
RETURNS (OUT_NUMBER integer)
AS
BEGIN
SELECT Count(*) from objQual_THANKS WHERE MESSAGEID = :I_MESSAGEID
INTO :OUT_NUMBER;
SUSPEND; 
END;
--GO

CREATE PROCEDURE objQual_USER_GETTHANKS_FROM(I_USERID integer, I_PAGEUSERID integer)
RETURNS (OUT_NUMBER integer)
AS
BEGIN
SELECT Count(1) FROM objQual_THANKS 
WHERE THANKSFROMUSERID=:I_USERID  INTO :OUT_NUMBER;
END;
--GO

CREATE PROCEDURE objQual_USER_GETTHANKS_TO(I_USERID integer, I_PAGEUSERID integer)
RETURNS ("ThanksToNumber" integer,"ThanksToPostsNumber" integer)
AS
BEGIN
SELECT 
Count(*),	
Count(DISTINCT MESSAGEID) FROM objQual_THANKS WHERE THANKSTOUSERID=:I_USERID
INTO :"ThanksToNumber",:"ThanksToPostsNumber";
SUSPEND;	
END;
--GO

/* Stored procedures for Buddy feature */

CREATE PROCEDURE objQual_BUDDY_ADDREQUEST(
	I_FROMUSERID INTEGER,
	I_TOUSERID INT,
	I_UTCTIMESTAMP TIMESTAMP)
	RETURNS ( I_APPROVED SMALLINT, I_PARAMOUTPUT VARCHAR(128))
AS 
	BEGIN
		IF (NOT EXISTS ( SELECT  ID
						FROM    objQual_BUDDY
						WHERE    FROMUSERID = :I_FROMUSERID
								  AND TOUSERID = :I_TOUSERID ))  THEN
			BEGIN
				IF ( NOT EXISTS ( SELECT    ID
								  FROM      objQual_BUDDY
								  WHERE     FROMUSERID = :I_TOUSERID
											  AND TOUSERID = :I_FROMUSERID
											) 
				   ) THEN
					BEGIN
						INSERT  INTO objQual_BUDDY
								(
								  ID,
								  FROMUSERID,
								  TOUSERID,
								  APPROVED,
								  REQUESTED
								)
						VALUES  (
								 (SELECT NEXT VALUE FOR SEQ_objQual_BUDDY_ID FROM RDB$DATABASE),                              
								  :I_FROMUSERID,
								  :I_TOUSERID,
								  0,
								  :I_UTCTIMESTAMP
								);
								SELECT 
								 (SELECT 0 FROM RDB$DATABASE) AS APPROVED,
								  NAME
											 FROM   objQual_USER
											 WHERE  ( USERID = :I_TOUSERID ) INTO :I_APPROVED,:I_PARAMOUTPUT;
					 
					END
				ELSE 
					BEGIN
						INSERT  INTO objQual_BUDDY
								(
								  ID,
								  FROMUSERID,
								  TOUSERID,
								  APPROVED,
								  REQUESTED
								)
						VALUES  (
								 (SELECT NEXT VALUE FOR SEQ_objQual_BUDDY_ID FROM RDB$DATABASE),                              
								  :I_FROMUSERID,
								  :I_TOUSERID,
								  1,
								  :I_UTCTIMESTAMP
								);
						UPDATE  objQual_BUDDY
						SET     APPROVED = 1
						WHERE   ( FROMUSERID = :I_FROMUSERID
								  AND TOUSERID = :I_FROMUSERID
								);
						 SELECT 
								 (SELECT 1 FROM RDB$DATABASE) AS APPROVED,
								  NAME
											 FROM   objQual_USER
											 WHERE  ( USERID = :I_TOUSERID ) INTO :I_APPROVED,:I_PARAMOUTPUT;
					END
			END	
		ELSE 
			BEGIN
			   SELECT 0, '' FROM RDB$DATABASE INTO :I_APPROVED,:I_PARAMOUTPUT;
			END
SUSPEND;	
END;
--GO

CREATE PROCEDURE objQual_BUDDY_APPROVEREQUEST(
	I_FROMUSERID INTEGER,
	I_TOUSERID INTEGER,
	I_MUTUAL BOOL,
	I_UTCTIMESTAMP TIMESTAMP)
	RETURNS
	(I_PARAMOUTPUT VARCHAR(128))
AS 
	BEGIN
		IF (EXISTS ( SELECT  ID
					FROM    objQual_BUDDY
					WHERE    FROMUSERID = :I_FROMUSERID
							  AND TOUSERID = :I_TOUSERID
							 )) THEN
			BEGIN
				UPDATE  objQual_BUDDY
				SET     APPROVED = 1
				WHERE   ( FROMUSERID = :I_FROMUSERID
						  AND TOUSERID = :I_TOUSERID
						);
				 SELECT NAME
									 FROM   objQual_USER
									 WHERE  ( USERID = :I_FROMUSERID ) INTO :I_PARAMOUTPUT;
								  
				IF (( :I_MUTUAL = 1 )
					AND ( NOT EXISTS ( SELECT   ID
									   FROM     objQual_BUDDY
									   WHERE    FROMUSERID = :I_TOUSERID
												AND TOUSERID = :I_FROMUSERID ) 
						))  THEN
					INSERT  INTO objQual_BUDDY
							(
							  ID,
							  FROMUSERID,
							  TOUSERID,
							  APPROVED,
							  REQUESTED
							)
					VALUES  (
							 (SELECT NEXT VALUE FOR SEQ_objQual_BUDDY_ID FROM RDB$DATABASE),                              
							  :I_TOUSERID,
							  :I_FROMUSERID,
							  1,
							  :I_UTCTIMESTAMP
							);
			END
SUSPEND;	
END;
--GO

	CREATE PROCEDURE objQual_BUDDY_LIST( I_FROMUSERID INTEGER)
	RETURNS (
	"UserID" INTEGER,
	"BoardID" INTEGER,
	"Name" VARCHAR(128),
	"Joined" TIMESTAMP,
	"NumPosts" INTEGER,
	"RankName" VARCHAR(128),
	"Approved" SMALLINT,
	"FromUserID" INTEGER,
	"Requested" TIMESTAMP)
AS 
	BEGIN
	FOR  SELECT a.USERID,
				a.BOARDID,
				a.NAME,
				a.JOINED,
				a.NUMPOSTS,
				b.NAME AS RankName,
				c.APPROVED,
				c.FROMUSERID,
				c.REQUESTED
		FROM   objQual_USER a
				JOIN objQual_RANK b ON b.RANKID = a.RANKID
				JOIN objQual_BUDDY c ON c.TOUSERID = a.USERID
				WHERE c.FROMUSERID = :I_FROMUSERID
				GROUP BY a.NAME,a.USERID, a.BOARDID, a.NUMPOSTS, a.JOINED, b.NAME, c.APPROVED, c.FROMUSERID,c.REQUESTED
		UNION ALL
		SELECT  (SELECT :I_FROMUSERID FROM RDB$DATABASE) AS UserID,
				a.BOARDID,
				a.NAME,
				a.JOINED,
				a.NUMPOSTS,
				b.NAME AS RankName,
				c.APPROVED,
				c.FROMUSERID,
				c.REQUESTED
		FROM    objQual_USER a
				JOIN objQual_RANK b ON b.RANKID = a.RANKID
				JOIN objQual_BUDDY c ON a.USERID = c.FROMUSERID
				WHERE c.APPROVED = 0 AND  c.TOUSERID = :I_FROMUSERID 
				GROUP BY a.NAME,a.USERID, a.BOARDID, a.NUMPOSTS, a.JOINED, b.NAME, c.APPROVED, c.FROMUSERID,c.REQUESTED
				INTO
	:"UserID",
	:"BoardID",
	:"Name",
	:"Joined",
	:"NumPosts",
	:"RankName",
	:"Approved",
	:"FromUserID",
	:"Requested"
	DO
SUSPEND;	
END;
--GO

	CREATE PROCEDURE objQual_BUDDY_REMOVE(
	I_FROMUSERID INTEGER,
	I_TOUSERID INTEGER)
	RETURNS
	( I_PARAMOUTPUT VARCHAR(128) )
AS 
	BEGIN
		DELETE  FROM objQual_BUDDY
		WHERE   FROMUSERID = :I_FROMUSERID
				  AND TOUSERID = :I_TOUSERID;
		 SELECT NAME
		 FROM   objQual_USER
		 WHERE  USERID = :I_TOUSERID
		 INTO :I_PARAMOUTPUT;
   SUSPEND;                        
   END;    
	--GO
	
CREATE PROCEDURE objQual_BUDDY_DENYREQUEST
	(I_FROMUSERID INTEGER,
	I_TOUSERID INTEGER)
	RETURNS
	(
	I_PARAMOUTPUT VARCHAR(128)
	)
AS 
	BEGIN
		DELETE  FROM objQual_BUDDY
		WHERE   FROMUSERID = :I_FROMUSERID
				AND TOUSERID = :I_TOUSERID;
		SELECT NAME FROM   objQual_USER
					WHERE   USERID = :I_FROMUSERID 
					INTO :I_PARAMOUTPUT;
					SUSPEND;
						   
	END;
--GO    
/* End of stored procedures for Buddy feature */

CREATE PROCEDURE objQual_TOPIC_FAVORITE_ADD
	(I_USERID integer,
	I_TOPICID integer)
AS
BEGIN
	IF (NOT EXISTS (SELECT ID FROM objQual_FAVORITETOPIC WHERE USERID = :I_USERID AND TOPICID=:I_TOPICID)) THEN
	BEGIN
		INSERT INTO objQual_FAVORITETOPIC(ID, USERID, TOPICID) VALUES 
								((SELECT NEXT VALUE FOR SEQ_objQual_FAVORITETOPIC_ID FROM RDB$DATABASE), :I_USERID, :I_TOPICID);
	END
END;
--GO

CREATE PROCEDURE objQual_TOPIC_FAVORITE_REMOVE 
	(I_USERID INTEGER,
	I_TOPICID INTEGER)
AS
BEGIN
	DELETE FROM objQual_FAVORITETOPIC WHERE USERID=:I_USERID AND TOPICID=:I_TOPICID;
END;
--GO

CREATE PROCEDURE objQual_TOPIC_FAVORITE_LIST(I_USERID INTEGER)
RETURNS
("TopicID" integer) 
AS
BEGIN
FOR SELECT TOPICID FROM objQual_FAVORITETOPIC WHERE USERID=:I_USERID
INTO :"TopicID"
DO SUSPEND;
END;
--GO

/* CREATE PROCEDURE objQual_TOPIC_FAVORITE_DETAILS(
                 I_BOARDID integer,
				 I_PAGEUSERID integer,
				 I_SINCE timestamp,
				 I_CATEGORYID integer, 
				 I_STYLEDNICKS bool) 
returns
(
"ForumID" integer,
"TopicID" integer,
"Posted" timestamp,
"LinkTopicID" integer,
"Subject" varchar(255),
"Status" varchar(255),
"Styles" varchar(255),
"Description" varchar(255),
"UserID" integer,
"Starter"  varchar(128),
"NumPostsDeleted" integer,
"Replies" integer,
"Views" integer,
"LastPosted" timestamp,
"LastUserID" integer,
"LastUserName" varchar(255),
"LastMessageID" integer,
"LastTopicID" integer,
"TopicFlags" integer,
"FavoriteCount" integer, 
"Priority" integer,
"PollID" integer,
"ForumName" varchar(128),
"TopicMovedID" integer,
"ForumFlags" integer,
"FirstMessage" varchar(4000),
"StarterStyle" varchar(255),
"LastUserStyle" varchar(255)
)
as
begin
	for	select
		c.FORUMID,
		c.TOPICID,
		c.POSTED,
		COALESCE(c.TOPICMOVEDID,c.TOPICID) AS LinkTopicID,
		c.TOPIC AS Subject,
		c.STATUS,
		c.STYLES,
		c.DESCRIPTION,
		c.USERID,
		COALESCE(c.USERNAME,b.NAME) as Starter,
		(SELECT COUNT(1) FROM objQual_MESSAGE mes WHERE mes.TOPICID = c.TOPICID AND mes.ISDELETED = 1 AND mes.ISAPPROVED = 1 AND ((:I_PAGEUSERID IS NOT NULL AND mes.USERID = :I_PAGEUSERID) OR (:I_PAGEUSERID IS NULL)) ) as NumPostsDeleted,
		(SELECT COUNT(1) FROM objQual_MESSAGE x WHERE x.TOPICID=c.TOPICID AND BIN_AND(x.FLAGS,8)=0) - 1 AS Replies,
		c.VIEWS AS Views,
		c.LASTPOSTED as LastPosted ,
		c.LASTUSERID as LastUserID,
		COALESCE(c.LASTUSERNAME,(select NAME from objQual_USER x where x.USERID=c.LASTUSERID)) as LastUserName,
		c.LASTMESSAGEID AS LastMessageID,
		c.TOPICID AS LastTopicID,
		c.FLAGS as TopicFlags,
		(SELECT COUNT(ID) FROM  objQual_FAVORITETOPIC WHERE TOPICID = COALESCE(c.TOPICMOVEDID,c.TOPICID)) AS FAVORITECOUNT,
		c.PRIORITY,
		c.POLLID,
		d.NAME AS ForumName,
		c.TOPICMOVEDID,
		d.FLAGS AS ForumFlags,
		(SELECT FIRST 1 CAST(MESSAGE as varchar(1000)) FROM objQual_MESSAGE mes2 where mes2.TOPICID = COALESCE(c.TOPICMOVEDID,c.TOPICID) AND mes2."POSITION" = 0) AS FirstMessage,
		(case(:I_STYLEDNICKS)
			when 1 then  (SELECT * FROM objQual_GET_USERSTYLE(c.USERID))  
			else ''	 end) AS StarterStyle,
		(case(:I_STYLEDNICKS)
			when 1 then  (SELECT * FROM objQual_GET_USERSTYLE(c.LASTUSERID))  
			else ''	 end) AS LastUserStyle
	from
		objQual_TOPIC c
		join objQual_USER b on b.USERID=c.USERID
		join objQual_FORUM d on d.FORUMID=c.FORUMID
		join objQual_VACCESS x on x.FORUMID=d.FORUMID
		join objQual_CATEGORY e on e.CATEGORYID=d.CATEGORYID
		JOIN objQual_FAVORITETOPIC z ON z.TOPICID=c.TOPICID AND z.USERID=:I_PAGEUSERID
	where
		:I_SINCE < c.LASTPOSTED and
		x.USERID = :I_PAGEUSERID and
		x.READACCESS <> 0 and
		e.BOARDID = :I_BOARDID and
		(:I_CATEGORYID is null or e.CATEGORYID=:I_CATEGORYID) and
		c.ISDELETED = 0
	order by
		d.NAME asc,
		c.PRIORITY desc,
		c.LASTPOSTED desc
		INTO
		:"ForumID",
		:"TopicID",
		:"Posted",
		:"LinkTopicID",
		:"Subject",
		:"Status",
		:"Styles",
		:"Description",
		:"UserID",
		:"Starter",
		:"NumPostsDeleted",
		:"Replies",
		:"Views",
		:"LastPosted",
		:"LastUserID",
		:"LastUserName",
		:"LastMessageID",
		:"LastTopicID",
		:"TopicFlags",
		:"FavoriteCount",
		:"Priority",
		:"PollID",
		:"ForumName",
		:"TopicMovedID",
		:"ForumFlags",
		:"FirstMessage",
		:"StarterStyle",
		:"LastUserStyle"
		DO
		SUSPEND;
END;


 Albums */

CREATE PROCEDURE objQual_ALBUM_SAVE
	(
	  I_ALBUMID integer,
	  I_USERID integer,
	  I_TITLE VARCHAR(255),
	  I_COVERIMAGEID integer,
	  I_UTCTIMESTAMP timestamp
	)
	RETURNS
	( OUT_ALBUMID INTEGER )
	AS        
	BEGIN 
	OUT_ALBUMID = 0;
	IF (:I_ALBUMID IS NOT NULL) THEN OUT_ALBUMID = :I_ALBUMID;
	 
		-- Update Cover?
		IF ( :I_COVERIMAGEID IS NOT NULL
			 AND :I_COVERIMAGEID <> 0
		   ) THEN
			BEGIN
			UPDATE  objQual_USERALBUM
			SET     COVERIMAGEID = :I_COVERIMAGEID
			WHERE   ALBUMID = :I_ALBUMID;
			END
		ELSE 
		BEGIN
			-- Remove Cover?
			IF ( :I_COVERIMAGEID = 0 )  THEN
				BEGIN
				UPDATE  objQual_USERALBUM
				SET     COVERIMAGEID = NULL
				WHERE   ALBUMID = :I_ALBUMID;
				END            
			ELSE 
			BEGIN
			-- Update Title?
				IF (:I_ALBUMID is not null) THEN
					BEGIN
					UPDATE  objQual_USERALBUM
					SET     TITLE = :I_TITLE
					WHERE   ALBUMID = :I_ALBUMID;
					END
				ELSE  
				BEGIN                  
					-- New album. insert into table.
				   SELECT NEXT VALUE FOR SEQ_objQual_USERALBUM_ALBUMID FROM RDB$DATABASE  INTO :OUT_ALBUMID;
						INSERT  INTO objQual_USERALBUM
								(
								  ALBUMID,
								  USERID,
								  TITLE,
								  COVERIMAGEID,
								  UPDATED
								)
						VALUES  (
								  :OUT_ALBUMID,
								  :I_USERID,
								  :I_TITLE,
								  :I_COVERIMAGEID,
								  :I_UTCTIMESTAMP
								);
							 
				END
				END
				END
				SELECT :OUT_ALBUMID FROM RDB$DATABASE INTO :OUT_ALBUMID; 
				SUSPEND;      
end;
--GO
	
CREATE procedure objQual_ALBUM_LIST
	(
	  I_USERID INTEGER,
	  I_ALBUMID INTEGER
	)
	RETURNS
	(
	"AlbumID" INTEGER,
	"UserID" INTEGER,
	"Title" VARCHAR(255),
	"CoverImageID" INTEGER,
	"Updated" TIMESTAMP
	)
	AS
	BEGIN
		IF (:I_USERID IS NOT NULL) THEN
			FOR select  *
			FROM    objQual_USERALBUM
			WHERE   USERID = :I_USERID
			ORDER BY UPDATED DESC
			INTO 
			:"AlbumID",
			:"UserID",
			:"Title",
			:"CoverImageID",
			:"Updated" DO SUSPEND;	        
		ELSE 
			FOR SELECT  *
			FROM    objQual_USERALBUM
			WHERE   ALBUMID = :I_ALBUMID
			INTO 
			:"AlbumID",
			:"UserID",
			:"Title",
			:"CoverImageID",
			:"Updated" DO SUSPEND;
		   
		
 end;
--GO
	
CREATE PROCEDURE objQual_ALBUM_DELETE ( I_ALBUMID integer )
AS
BEGIN
		DELETE  FROM objQual_USERALBUMIMAGE
		WHERE   ALBUMID = :I_ALBUMID;
		DELETE  FROM objQual_USERALBUM
		WHERE   ALBUMID = :I_ALBUMID;        
END;
--GO
	
CREATE PROCEDURE objQual_ALBUM_GETTITLE
	(
	  I_ALBUMID INTEGER 
	)
	RETURNS
	(
	"Title" varchar(255)
	)
	AS
	BEGIN
		 SELECT TITLE
		  FROM   objQual_USERALBUM
			WHERE  ALBUMID = :I_ALBUMID INTO :"Title";
			SUSPEND;
						   
	END;
--GO
	
CREATE PROCEDURE objQual_ALBUM_GETSTATS
	( I_USERID INTEGER,
	I_ALBUMID INTEGER )
RETURNS
(
I_ALBUMNUMBER INTEGER,
I_IMAGENUMBER INTEGER 
)    
AS
 BEGIN
I_ALBUMNUMBER = 0;
I_IMAGENUMBER = 0;
-- DECLARE VARIABLE   I_ALBUMNUMBER INTEGER DEFAULT 0;
-- DECLARE VARIABLE   I_IMAGENUMBER INTEGER DEFAULT 0; 
	  
		IF ( :I_ALBUMID IS NOT NULL ) THEN
		SELECT COUNT(IMAGEID) 
			 FROM   objQual_USERALBUMIMAGE
			 WHERE  ALBUMID = :I_ALBUMID
		INTO  :I_IMAGENUMBER;
		ELSE  
		BEGIN          
		 SELECT COUNT(ALBUMID)
				FROM   objQual_USERALBUM
				WHERE  USERID = :I_USERID
				INTO :I_ALBUMNUMBER ;
		 SELECT COUNT(IMAGEID)
				FROM   objQual_USERALBUMIMAGE
				WHERE  ALBUMID in (
									SELECT  ALBUMID
									FROM    objQual_USERALBUM
									WHERE   USERID = :I_USERID) 
				INTO  :I_IMAGENUMBER;
		 END
			SUSPEND;
 end;
--GO
	
CREATE PROCEDURE objQual_ALBUM_IMAGE_SAVE
	(
	  I_IMAGEID integer,
	  I_ALBUMID integer,
	  I_CAPTION VARCHAR(255),
	  I_FILENAME VARCHAR(255),
	  I_BYTES integer,
	  I_CONTENTTYPE VARCHAR(50),
	  I_UTCTIMESTAMP TIMESTAMP
	)
	AS
	BEGIN
		IF (:I_IMAGEID is not null)  THEN
			UPDATE  objQual_USERALBUMIMAGE
			SET     CAPTION = :I_CAPTION
			WHERE   IMAGEID = :I_IMAGEID;
		ELSE
			INSERT  INTO objQual_USERALBUMIMAGE
					(
					  IMAGEID, 
					  ALBUMID,
					  CAPTION,
					  FILENAME,
					  BYTES,
					  CONTENTTYPE,
					  UPLOADED,
					  DOWNLOADS
					)
			VALUES  (
					 (SELECT NEXT VALUE FOR SEQ_objQual_USRALBIMG_IMAGEID FROM RDB$DATABASE),
					  :I_ALBUMID,
					  :I_CAPTION,
					  :I_FILENAME,
					  :I_BYTES,
					  :I_CONTENTTYPE,
					  :I_UTCTIMESTAMP,
					  0
					);
	   
end;
--GO
	
CREATE procedure objQual_ALBUM_IMAGE_LIST
	(
	  I_ALBIMID INTEGER,
	  I_IMAGEID INTEGER
	)
	RETURNS
	(
	"ImageID" integer,
	"AlbumID" integer,
	"Caption" VARCHAR(255),	
	"FileName" VARCHAR(255),	
	"Bytes" integer,
	"ContentType" VARCHAR(50),
	"Uploaded" TIMESTAMP,
	"Downloads" integer,
	"UserID" integer
	)
	AS
	BEGIN
		IF (:I_ALBIMID IS NOT NULL) THEN        
		 FOR   SELECT  a.*, (SELECT 0 FROM RDB$DATABASE)
			FROM    objQual_USERALBUMIMAGE a
			WHERE   a.ALBUMID = :I_ALBIMID
			ORDER BY a.UPLOADED DESC
			INTO
			:"ImageID",
			:"AlbumID",
			:"Caption",	
			:"FileName",	
			:"Bytes",
			:"ContentType",
			:"Uploaded",
			:"Downloads",
			:"UserID" 
			DO SUSPEND;
		ELSE 
		  FOR  SELECT  a.*,
					b.USERID
			FROM    objQual_USERALBUMIMAGE a
					INNER JOIN objQual_USERALBUM b ON b.ALBUMID = a.ALBUMID
			WHERE   IMAGEID = :I_IMAGEID
			INTO
			:"ImageID",
			:"AlbumID",
			:"Caption",	
			:"FileName",	
			:"Bytes",
			:"ContentType",
			:"Uploaded",
			:"Downloads",
			:"UserID" 
			DO SUSPEND;      
end;
--GO

CREATE procedure objQual_ALBUM_IMAGES_BYUSER
	(
	  I_USERID INTEGER
	)
	RETURNS
	(
	"ImageID" integer,
	"AlbumID" integer,
	"Caption" VARCHAR(255),	
	"FileName" VARCHAR(255),	
	"Bytes" integer,
	"ContentType" VARCHAR(50),
	"Uploaded" TIMESTAMP,
	"Downloads" integer,
	"UserID" integer
	)
	AS
	BEGIN		  
		 FOR   SELECT  a.*, ua.USERID
			FROM    objQual_USERALBUMIMAGE a
			INNER JOIN objQual_USERALBUM ua
			ON a.ALBUMID = ua.ALBUMID
			WHERE   ua.USERID = :I_USERID
			ORDER BY a.UPLOADED DESC
			INTO
			:"ImageID",
			:"AlbumID",
			:"Caption",	
			:"FileName",	
			:"Bytes",
			:"ContentType",
			:"Uploaded",
			:"Downloads",
			:"UserID" 
			DO SUSPEND;
		    
end;
--GO

CREATE PROCEDURE objQual_ALBUM_IMAGE_DELETE( I_IMAGEID integer )
AS
	BEGIN
	
	   UPDATE  objQual_USERALBUM
		SET     COVERIMAGEID = NULL
		WHERE   COVERIMAGEID = :I_IMAGEID;   
		
		DELETE  FROM objQual_USERALBUMIMAGE
		WHERE   IMAGEID = :I_IMAGEID;                  
			 
end;
--GO
	
CREATE PROCEDURE objQual_ALBUM_IMAGE_DOWNLOAD( I_IMAGEID integer )
AS
	BEGIN
		UPDATE  objQual_USERALBUMIMAGE
		SET     DOWNLOADS = DOWNLOADS + 1
		WHERE   IMAGEID = :I_IMAGEID;
 end;
--GO

CREATE PROCEDURE objQual_USER_GETSIGNATUREDATA(I_BOARDID integer, I_USERID integer)
RETURNS 
(
"UsrSigChars" INTEGER,
"UsrSigBBCodes" VARCHAR(1000),
"UsrSigHTMLTags" VARCHAR(1000) 
)
AS
DECLARE VARIABLE  R_UsrSigChars INTEGER DEFAULT 0;
DECLARE VARIABLE  R_UsrSigBBCodes VARCHAR(1000);
DECLARE VARIABLE  R_UsrSigHTMLTags VARCHAR(1000);
DECLARE VARIABLE  G_UsrSigChars INTEGER DEFAULT 0;
DECLARE VARIABLE  G_UsrSigBBCodes VARCHAR(1000);
DECLARE VARIABLE  G_UsrSigHTMLTags VARCHAR(1000);
	BEGIN
	-- Ugly but bullet proof - it used very rarely 
  
	
	SELECT FIRST 1 
	(CASE WHEN c.USRSIGCHARS IS NULL THEN 0 ELSE  c.USRSIGCHARS END),
	(CASE WHEN c.USRSIGBBCODES IS NULL THEN '' ELSE c.USRSIGBBCODES END), 
	(CASE WHEN c.USRSIGHTMLTAGS IS NULL THEN '' ELSE c.USRSIGHTMLTAGS END)
	FROM objQual_USER a JOIN objQual_USERGROUP b
						  ON a.USERID = b.USERID
							JOIN objQual_GROUP c                         
							  ON b.GROUPID = c.GROUPID 
							  WHERE a.USERID = :I_USERID 
							   AND c.BOARDID = :I_BOARDID 
								ORDER BY c.SORTORDER ASC
	  INTO :G_UsrSigChars, :G_UsrSigBBCodes, :G_UsrSigHTMLTags;
								
	SELECT FIRST 1 
	(CASE WHEN c.USRSIGCHARS IS NULL THEN 0 ELSE  c.USRSIGCHARS END),
	(CASE WHEN c.USRSIGBBCODES IS NULL THEN '' ELSE c.USRSIGBBCODES END), 
	(CASE WHEN c.USRSIGHTMLTAGS IS NULL THEN '' ELSE c.USRSIGHTMLTAGS END)   
	FROM objQual_RANK c 
								JOIN objQual_USER d
								  ON c.RANKID = d.RANKID 
								   WHERE d.USERID = :I_USERID 
									 AND c.BOARDID = :I_BOARDID 
									   ORDER BY c.RANKID DESC
		INTO :R_UsrSigChars, :R_UsrSigBBCodes, :R_UsrSigHTMLTags; 
		  
							   
	  SELECT 
		(CASE WHEN (:R_UsrSigChars < :G_UsrSigChars) THEN  :G_UsrSigChars ELSE :R_UsrSigChars END ), 
		(:G_UsrSigBBCodes || ',' || :R_UsrSigBBCodes), 
		(:G_UsrSigHTMLTags || ',' || :R_UsrSigHTMLTags)
		FROM RDB$DATABASE
		INTO
		:"UsrSigChars",
		:"UsrSigBBCodes",
		:"UsrSigHTMLTags";
		SUSPEND;
 end;
--GO

 CREATE PROCEDURE objQual_USER_GETALBUMSDATA(I_BOARDID integer, I_USERID integer)
 RETURNS 
 (
 "NumAlbums" INTEGER,
 "NumImages" INTEGER,
 "UsrAlbums" INTEGER,
 "UsrAlbumImages" INTEGER
 )
  AS
 DECLARE VARIABLE  OR_UsrAlbums INTEGER;
 DECLARE VARIABLE  OR_UsrAlbumImages INTEGER;  
 DECLARE VARIABLE  OG_UsrAlbums INTEGER;        
 DECLARE VARIABLE  OG_UsrAlbumImages INTEGER;
   BEGIN
	 -- Ugly but bullet proof - it used very rarely
	 
	SELECT 
	COALESCE(MAX(c.USRALBUMS),0), 
	COALESCE(MAX( c.USRALBUMIMAGES),0) 
	FROM objQual_USER a 
	   JOIN objQual_USERGROUP b
		  ON a.USERID = b.USERID
			JOIN objQual_GROUP c                         
			  ON b.GROUPID = c.GROUPID 
				WHERE a.USERID = :I_USERID 
				  AND c.BOARDID = :I_BOARDID
					   INTO   :OG_UsrAlbums, :OG_UsrAlbumImages;
						 
	 if (:OG_UsrAlbums IS NULL) THEN OG_UsrAlbums = 0;
	  if (:OG_UsrAlbumImages IS NULL) THEN OG_UsrAlbumImages = 0;
	 
	 SELECT FIRST 1 
	 (CASE WHEN c.USRALBUMS IS NULL THEN 0 ELSE c.USRALBUMS END), 
	 (CASE WHEN c.USRALBUMIMAGES IS NULL THEN 0 ELSE  c.USRALBUMIMAGES END)  
	 FROM objQual_RANK c 
		JOIN objQual_USER d
			ON c.RANKID = d.RANKID 
			   WHERE d.USERID = :I_USERID 
				  AND c.BOARDID = :I_BOARDID 
					  ORDER BY c.RANKID DESC
	   INTO   :OR_UsrAlbums, :OR_UsrAlbumImages;          
	  
	  if (:OR_UsrAlbums IS NULL) THEN OR_UsrAlbums = 0;
	  if (:OR_UsrAlbumImages IS NULL) THEN OR_UsrAlbumImages = 0;
	  
	  SELECT
	   (SELECT COUNT(ua.ALBUMID) FROM objQual_USERALBUM ua
	   WHERE ua.USERID = :I_USERID),
	   (SELECT COUNT(uai.IMAGEID) FROM  objQual_USERALBUMIMAGE uai
	   INNER JOIN objQual_USERALBUM ua
	   ON ua.ALBUMID = uai.ALBUMID
	   WHERE ua.USERID = :I_USERID), 
	   (CASE WHEN (:OR_UsrAlbums < :OG_UsrAlbums) 
	   THEN :OG_UsrAlbums ELSE :OR_UsrAlbums END), 
	   (CASE WHEN (:OR_UsrAlbumImages < :OG_UsrAlbumImages) 
	   THEN :OG_UsrAlbumImages ELSE :OR_UsrAlbumImages END)
	   FROM RDB$DATABASE
	   INTO 
	   :"NumAlbums", 
	   :"NumImages",
	   :"UsrAlbums",
	   :"UsrAlbumImages";
	   SUSPEND;
	END;
   --GO  
   
   CREATE PROCEDURE objQual_MESSAGE_SECDATA(I_MESSAGEID integer, I_PAGEUSERID integer) 
   RETURNS
   (
	"MessageID" INTEGER,
	"UserID" INTEGER,
	"Name" VARCHAR(128) CHARACTER SET UTF8,
	"Message" BLOB SUB_TYPE 1,
	"Posted"  TIMESTAMP,
	"TopicID" INTEGER,
	"ForumID" INTEGER,
	"Topic"  VARCHAR(128) CHARACTER SET UTF8,
	"Priority" INTEGER,
	"Flags" INTEGER,
	"Edited" TIMESTAMP,
	"EditedBy"  INTEGER,
	"TopicFlags" INTEGER,	
	"EditReason"  VARCHAR(128) CHARACTER SET UTF8,
	"Position" INTEGER,
	"IsModeratorChanged" BOOL,
	"DeleteReason"   VARCHAR(128) CHARACTER SET UTF8,
	"BlogPostID" VARCHAR(128) CHARACTER SET UTF8,
	"PollID" INTEGER,
	"IP"  VARCHAR(39)
   )
   AS
BEGIN

if (:I_PAGEUSERID is null) THEN
select first 1 USERID 
from objQual_USER
where  BIN_AND(FLAGS,4)<>0 ORDER BY JOINED DESC
INTO :I_PAGEUSERID;

		SELECT
		m.MESSAGEID,
		m.USERID,
		COALESCE(t.USERNAME, u.NAME),
		m.MESSAGE,
		m.POSTED,
		t.TOPICID,
		t.FORUMID,
		t.TOPIC,
		t.PRIORITY,
		m.FLAGS,		
		COALESCE(m.EDITED,m.POSTED),
		COALESCE(m.EDITEDBY,m.USERID),
		t.FLAGS,
		m.EDITREASON,
		m."POSITION",
		m.ISMODERATORCHANGED,
		m.DELETEREASON,
		m.BLOGPOSTID,
		t.POLLID,
		m."IP"
	FROM
		objQual_TOPIC t 		
		inner join  objQual_MESSAGE m on m.TOPICID = t.TOPICID
		inner join objQual_USER u on u.USERID = m.USERID		
		left join objQual_ACTIVEACCESS x on x.FORUMID=coalesce(t.FORUMID,0)
	WHERE
		m.MESSAGEID = :I_MESSAGEID 
		AND x.USERID = :I_PAGEUSERID 
		AND x.READACCESS <> 0
		INTO 
		  :"MessageID",
		  :"UserID",
		  :"Name",
		  :"Message",
		  :"Posted",
		  :"TopicID",
		  :"ForumID",
		  :"Topic",
		  :"Priority",
		  :"Flags",	     
		  :"Edited",
		  :"EditedBy",
		  :"TopicFlags",	     
		  :"EditReason",
		  :"Position",
		  :"IsModeratorChanged",
		  :"DeleteReason",
		  :"BlogPostID",
		  :"PollID",
		  :"IP";	      
	SUSPEND;
END;
--GO


CREATE PROCEDURE objQual_MESSAGEHISTORY_LIST (
I_MESSAGEID INTEGER, 
I_DAYSTOCLEAN INT, I_UTCTIMESTAMP timestamp )
RETURNS
(	
		"MessageID" INTEGER,
		"Message" BLOB SUB_TYPE 1,
		"IP" VARCHAR(39) CHARACTER SET  UTF8,
		"Edited" TIMESTAMP,
		"EditedBy" INTEGER,	
		"EditReason" VARCHAR(128) CHARACTER SET UTF8,
		"IsModeratorChanged" BOOL,
		"Flags"  INTEGER, 
		"UserID" INTEGER, 
		"UserName" VARCHAR(128),
		"ForumID" INTEGER, 
		"TopicID" INTEGER, 
		"Topic" VARCHAR(128), 
		"Name" VARCHAR(128), 
		"Posted" TIMESTAMP
)
AS 
	BEGIN    
	-- delete all message variants older then DaysToClean days Flags reserved for possible pms
   
	DELETE FROM objQual_MESSAGEHISTORY
	where DATEDIFF(DAY FROM EDITED TO :I_UTCTIMESTAMP) > :I_DAYSTOCLEAN;
	
	-- we don't return Message text and ip if it's simply a user
	   
	       
	 FOR SELECT mh.*, m.USERID, m.USERNAME, t.FORUMID, t.TOPICID, t.TOPIC, 
	 COALESCE(t.USERNAME, u.NAME) as Name, m.POSTED
	 FROM objQual_MESSAGEHISTORY mh
	 LEFT JOIN objQual_MESSAGE m ON m.MESSAGEID = mh.MESSAGEID
	 LEFT JOIN objQual_TOPIC t ON t.TOPICID = m.TOPICID
	 LEFT JOIN objQual_USER u ON u.USERID = t.USERID
	 WHERE mh.MESSAGEID = :I_MESSAGEID  order by mh.EDITED, mh.MESSAGEID
		INTO		
		:"MessageID",
		:"Message",
		:"IP",
		:"Edited",
		:"EditedBy",	
		:"EditReason",
		:"IsModeratorChanged",
		:"Flags", 
		:"UserID", 
		:"UserName",
		:"ForumID", 
		:"TopicID", 
		:"Topic", 
		:"Name", 
		:"Posted"
	 DO SUSPEND; 	 

END;
--GO

create procedure objQual_ACTIVE_LIST_USER(
                 I_BOARDID INTEGER, 
				 I_USERID INTEGER, 
				 I_GUESTS BOOL,
				 I_SHOWCRAWLERS BOOL,
				 I_ACTIVETIME INTEGER, 
				 I_STYLEDNICKS BOOL, 
				 I_UTCTIMESTAMP TIMESTAMP) 
RETURNS
(
		"UserID" INTEGER,
		"UserName" VARCHAR(128),
		"IP" VARCHAR(39),
		"SessionID" VARCHAR(36),
		"ForumID" INTEGER,
		"TopicID" INTEGER,
		"HasForumAccess" BOOL,
		"ForumName" VARCHAR(128),
		"TopicName" VARCHAR(128),
		"IsGuest" SMALLINT,
		"IsCrawler" SMALLINT,
		"IsHidden" SMALLINT,
		"Style"  VARCHAR(255),
		"UserCount" INTEGER,
		"Login" TIMESTAMP,
		"LastActive" TIMESTAMP,
		"Location" VARCHAR(255),
		"Active" INTEGER,
		"Browser" VARCHAR(128),
		"Platform" VARCHAR(128),
		"ForumPage" VARCHAR(255)
)
as
begin	
	-- select active
	if (:I_GUESTS <> 0) then
	for	select
			a.USERID,
			a.NAME as UserName,
			c.IP,
			c.SESSIONID,
			c.FORUMID,
			c.TOPICID,
			/* (SELECT f.READACCESS FROM objQual_vaccess_ULF(:I_USERID,b.FORUMID) f), */
			x.READACCESS as HasForumAccess,
			(select x.NAME from objQual_FORUM x where x.FORUMID=c.FORUMID) AS "ForumName" ,
			(select TOPIC from objQual_TOPIC x where x.TOPICID=c.TOPICID) AS "TopicName",
			COALESCE((select 1 from objQual_USERGROUP x inner join objQual_GROUP y 
			on y.GROUPID=x.GROUPID where x.USERID=a.USERID 
			and BIN_AND(y.FLAGS,2)<>0), 0) AS ISGUEST,
			c.ISCRAWLER AS IsCrawler,
			a.ISACTIVEEXCLUDED AS "IsHidden",
			 CASE :I_STYLEDNICKS
			 WHEN 1 THEN  (SELECT * FROM objQual_GET_USERSTYLE(a.USERID))                      
			  ELSE (SELECT '' FROM RDB$DATABASE)
			END,
				/*	CASE :I_STYLEDNICKS
             WHEN 1 THEN  (SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		    JOIN objQual_GROUP f ON f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)  
			ELSE (SELECT '' FROM RDB$DATABASE) END, */			
			(SELECT 1 FROM RDB$DATABASE) AS "UserCount",
			c.LOGIN,
			c.LASTACTIVE,
			c.LOCATION,
			DATEDIFF(MINUTE FROM  c.LOGIN TO  c.LASTACTIVE) AS "Active",
			c.BROWSER,
			c.PLATFORM,			
			c.FORUMPAGE
			from
			objQual_USER a
				-- JOIN objQual_RANK r on r.RANKID=a.RANKID	
			inner join objQual_ACTIVE c ON c.USERID = a.USERID
				inner join objQual_ACTIVEACCESS x
			ON (x.FORUMID = COALESCE(c.FORUMID,0))						
		where		
			c.BOARDID = :I_BOARDID AND x.USERID = :I_USERID
			order by
			c.LASTACTIVE desc
			INTO
		:"UserID",
		:"UserName",
		:"IP",
		:"SessionID",
		:"ForumID",
		:"TopicID",
		:"HasForumAccess",
		:"ForumName",
		:"TopicName",		
		:"IsGuest",
		:"IsCrawler",
		:"IsHidden",
		:"Style",
		:"UserCount",
		:"Login",
		:"LastActive",
		:"Location",
		:"Active",
		:"Browser",
		:"Platform",
		:"ForumPage"
		DO SUSPEND;	
		else if (I_SHOWCRAWLERS = 1 and I_GUESTS = 0) then
			for select
			a.USERID,
			a.NAME as UserName,
			c.IP,
			c.SESSIONID,
			c.FORUMID,
			c.TOPICID,
			/* (SELECT f.READACCESS FROM objQual_vaccess_ULF(:I_USERID,b.FORUMID) f),*/
			x.READACCESS as HasForumAccess,			
			(select x.NAME from objQual_FORUM x where x.FORUMID=c.FORUMID) AS "ForumName" ,
			(select TOPIC from objQual_TOPIC x where x.TOPICID=c.TOPICID) AS "TopicName",		
            COALESCE((select 1 from objQual_USERGROUP x inner join objQual_GROUP y 
			on y.GROUPID=x.GROUPID where x.USERID=a.USERID 
			and BIN_AND(y.FLAGS,2)<>0), 0) AS ISGUEST,
			c.ISCRAWLER AS IsCrawler, 
			a.ISACTIVEEXCLUDED AS "IsHidden",			
			 CASE :I_STYLEDNICKS
			 WHEN 1 THEN  (SELECT * FROM objQual_GET_USERSTYLE(a.USERID))                    
			  ELSE (SELECT '' FROM RDB$DATABASE)
			END,
				/*	CASE :I_STYLEDNICKS
             WHEN 1 THEN  (SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		    JOIN objQual_GROUP f ON f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)  
			ELSE (SELECT '' FROM RDB$DATABASE) END, */						
			(SELECT 1 FROM RDB$DATABASE) AS "UserCount",
			c.LOGIN,
			c.LASTACTIVE,
			c.LOCATION,
			DATEDIFF(minute,c.Login,c.LastActive) as ACTIVE,
			c.BROWSER,
			c.PLATFORM,
			c.FORUMPAGE
		from
			objQual_USER a
			JOIN objQual_RANK r on r.RANKID=a.RANKID
			inner join objQual_ACTIVE c 
			ON c.USERID = a.USERID
			inner join objQual_ACTIVEACCESS x
			ON (x.FORUMID = COALESCE(c.FORUMID,0))						
		where		
			c.BOARDID = :I_BOARDID AND x.USERID = :I_USERID   
			-- is registered or (is crawler and is registered 	
			   and (BIN_AND(c.FLAGS, 4) = 4 OR BIN_AND(c.Flags, 8) = 8)		
		order by
			c.LASTACTIVE DESC
			INTO
		:"UserID",
		:"UserName",
		:"IP",
		:"SessionID",
		:"ForumID",
		:"TopicID",
		:"HasForumAccess",
		:"ForumName",
		:"TopicName",
		:"IsGuest",
		:"IsCrawler",
		:"IsHidden",
		:"Style",
		:"UserCount",
		:"Login",
		:"LastActive",
		:"Location",
		:"Active",
		:"Browser",
		:"Platform",
		:"ForumPage"
		DO SUSPEND;	
	else
	for	select
			a.USERID,
			a.NAME as UserName,
			c.IP,
			c.SESSIONID,
			c.FORUMID,
			c.TOPICID,
			x.READACCESS as HasForumAccess,
			(select x.NAME from objQual_FORUM x where x.FORUMID=c.FORUMID) AS "ForumName",
			(select TOPIC from objQual_TOPIC x where x.TOPICID=c.TOPICID) AS "TopicName",
			COALESCE((select 1 from objQual_USERGROUP x inner join objQual_GROUP y on y.GROUPID=x.GROUPID where x.USERID=a.USERID and BIN_AND(y.FLAGS, 2)<>0), 0) AS ISGUEST,
			c.ISCRAWLER AS IsCrawler,
			 a.ISACTIVEEXCLUDED AS "IsHidden" ,
			 CASE :I_STYLEDNICKS
			 WHEN 1 THEN  (SELECT * FROM objQual_GET_USERSTYLE(a.USERID))                    
			  ELSE (SELECT '' FROM RDB$DATABASE)
			END,
				/*	CASE :I_STYLEDNICKS
             WHEN 1 THEN  (SELECT FIRST 1 f.STYLE FROM objQual_USERGROUP e 
		    JOIN objQual_GROUP f ON f.GROUPID=e.GROUPID WHERE e.USERID=a.USERID AND CHAR_LENGTH(f.STYLE) > 2 ORDER BY f.SORTORDER), r.STYLE)  
			ELSE (SELECT '' FROM RDB$DATABASE) END, */		
			(SELECT 1 FROM RDB$DATABASE) AS "UserCount",
			c.LOGIN,
			c.LASTACTIVE,
			c.LOCATION,
			DATEDIFF(MINUTE FROM  c.LOGIN TO  c.LASTACTIVE) AS "Active",
			c.BROWSER,
			c.PLATFORM,
			c.FORUMPAGE
	from
			objQual_USER a
				-- JOIN objQual_RANK r on r.RANKID=a.RANKID	
			inner join objQual_ACTIVE c ON c.USERID = a.USERID
					inner join objQual_ACTIVEACCESS x
			ON (x.ForumID = COALESCE(c.FORUMID,0))						
		where		
			c.BOARDID = :I_BOARDID  AND x.USERID = :I_USERID and
			not (exists(
				select FIRST 1 1 
					from objQual_USERGROUP x
						inner join objQual_GROUP y ON y.GROUPID=x.GROUPID 
					where x.USERID=a.USERID and BIN_AND(y.FLAGS, 2) <> 0
				))
		order by
			c.LASTACTIVE desc
			INTO
		:"UserID",
		:"UserName",
		:"IP",
		:"SessionID",
		:"ForumID",
		:"TopicID",
		:"HasForumAccess",
		:"ForumName",
		:"TopicName",
		:"IsGuest",
		:"IsCrawler",
		:"IsHidden",
		:"Style",
		:"UserCount",
		:"Login",
		:"LastActive",
		:"Location",
		:"Active",
		:"Browser",
		:"Platform",
		:"ForumPage"
		DO SUSPEND;	 
				
end;
--GO


CREATE PROCEDURE objQual_USER_VIEWALLTHANKS (I_USERID INTEGER)
RETURNS
(
"ThanksFromUserID" INTEGER,
"ThanksToUserID" INTEGER,
"MessageID" INTEGER,
"ForumID" INTEGER,
"TopicID" INTEGER,
"Topic" VARCHAR(128),
"UserID" INTEGER,
"Posted" TIMESTAMP,
"Message" BLOB SUB_TYPE 1,
"Flags" INTEGER
)
AS 
	BEGIN
	   for select  t.THANKSFROMUSERID,
				t.THANKSTOUSERID,
				c.MESSAGEID,
				a.FORUMID,
				a.TOPICID,
				a.TOPIC,
				b.USERID,             
				c.POSTED,
				c.MESSAGE,
				c.FLAGS
		from    objQual_MESSAGE c
				left join objQual_TOPIC a on a.TOPICID = c.TOPICID
				left join objQual_USER b on c.USERID = b.USERID
				join objQual_ACTIVEACCESS x on x.FORUMID = a.FORUMID
				join objQual_THANKS t on c.MESSAGEID = t.MESSAGEID
		where   x.READACCESS <> 0
				AND x.USERID = :I_USERID
				AND c.ISAPPROVED = 1
				AND a.TOPICMOVEDID IS NULL
				AND a.ISDELETED = 0
				AND c.ISDELETED = 0
				and c.MESSAGEID in ( select MESSAGEID
									 from   objQual_THANKS
									 where  THANKSFROMUSERID = :I_USERID
											or THANKSTOUSERID = :I_USERID )
		ORDER BY c.POSTED DESC
		INTO
		:"ThanksFromUserID",
		:"ThanksToUserID",
		:"MessageID",
		:"ForumID",
		:"TopicID",
		:"Topic",
		:"UserID",       
		:"Posted",
		:"Message",
		:"Flags"
		DO SUSPEND;	 
	END;
--GO


CREATE PROCEDURE objQual_TOPIC_FAVORITE_COUNT(I_TOPICID INTEGER)
RETURNS("FavoriteCount" INTEGER) 
AS
BEGIN
	SELECT COUNT(1) as FAVORITECOUNT FROM  objQual_FAVORITETOPIC WHERE TOPICID = :I_TOPICID
	INTO :"FavoriteCount";
	SUSPEND;
END;
--GO

CREATE PROCEDURE objQual_USER_THANKEDMESSAGE
(I_MESSAGEID INTEGER, I_USERID INTEGER) 
RETURNS ("COUNT" INTEGER)
as
begin
		SELECT COUNT(TH.THANKSID)
        FROM objQual_THANKS AS TH WHERE (TH.MESSAGEID=:I_MESSAGEID) AND (TH.THANKSFROMUSERID = :I_USERID)
		into :"COUNT";
		SUSPEND;
end;
--GO

CREATE PROCEDURE objQual_RECENT_USERS(
                 I_BOARDID INTEGER,
				 I_TIMESINCELASTLOGIN INTEGER,
				 I_STYLEDNICKS BOOL,
				 I_UTCTIMESTAMP TIMESTAMP) 
				 RETURNS
				 (
				 "UserID" integer,
				 "IsCrawler" BOOL,
				 "UserCount" INTEGER,
				 "IsHidden" BOOL,	
				 "Style" VARCHAR(255)		 
				 )
				 as
       begin

	FOR   SELECT U.USERID,
	   (SELECT 0 FROM RDB$DATABASE) AS IsCrawler,
     (SELECT 1 FROM RDB$DATABASE) as UserCount,
    u.IsActiveExcluded as IsHidden,
   (CASE(:I_STYLEDNICKS)
                WHEN 1 THEN
                        coalesce((SELECT FIRST 1 G.STYLE
                         FROM objQual_USERGROUP AS UG
                              JOIN objQual_GROUP G on G.GroupID = UG.GroupID
                              WHERE UG.USERID = U.USERID AND CHAR_LENGTH(G.STYLE) > 2 
                              ORDER BY G.SORTORDER), '')
                ELSE ''
            END) as Style
    FROM objQual_USER AS U
                JOIN objQual_RANK R on R.RANKID=U.RANKID
    WHERE (U.ISAPPROVED = 1) AND
     U.BOARDID = :I_BOARDID AND
	 DATEADD(-:I_TIMESINCELASTLOGIN MINUTE TO :I_UTCTIMESTAMP) < U.LASTVISIT
     AND
                --Excluding guests
                NOT EXISTS(             
                    SELECT 1 
                        FROM objQual_USERGROUP x
                            inner join objQual_GROUP y ON y.GROUPID=x.GROUPID 
                        WHERE x.USERID=U.USERID and BIN_AND(y.FLAGS,2)=2
                    )
    ORDER BY U.LASTVISIT
	INTO 
	:"UserID",
	:"IsCrawler",
	:"UserCount",
	:"IsHidden",
	:"Style"
	DO SUSPEND;	
end;
--GO

 CREATE PROCEDURE objQual_READTOPIC_ADDORUPDATE(I_USERID integer, I_TOPICID integer, I_UTCTIMESTAMP TIMESTAMP)
 AS
 DECLARE VARIABLE  ICI_LASTACCESSDATE TIMESTAMP; 
  BEGIN
   select FIRST 1 LASTACCESSDATE from objQual_TOPICREADTRACKING where USERID=:I_USERID AND TOPICID=:I_TOPICID  INTO :ICI_LASTACCESSDATE;
	IF (ICI_LASTACCESSDATE IS NOT NULL) THEN
	begin
		  update objQual_TOPICREADTRACKING set LASTACCESSDATE=:I_UTCTIMESTAMP where LASTACCESSDATE = :ICI_LASTACCESSDATE;
    end
	ELSE
	  begin
		  insert into objQual_TOPICREADTRACKING(USERID,TOPICID,LASTACCESSDATE)
	      values (:I_USERID, :I_TOPICID, :I_UTCTIMESTAMP);
	  end
end;
--GO

 CREATE PROCEDURE objQual_READTOPIC_DELETE(I_USERID integer)
 AS
  BEGIN
		delete from objQual_TOPICREADTRACKING where USERID = :I_USERID;
  end;
--GO

 CREATE PROCEDURE objQual_READTOPIC_LASTREAD(I_USERID integer, I_TOPICID integer)
 RETURNS ("LastAccessDate" TIMESTAMP)
 AS
  BEGIN
		FOR SELECT FIRST 1 LastAccessDate FROM  objQual_TOPICREADTRACKING WHERE USERID = :I_USERID AND TOPICID = :I_TOPICID
		INTO :"LastAccessDate"
		DO SUSPEND;
end;
--GO

CREATE PROCEDURE objQual_READFORUM_ADDORUPDATE(I_USERID integer, I_FORUMID integer, I_UTCTIMESTAMP TIMESTAMP)
 AS
  DECLARE VARIABLE  ICI_LASTACCESSDATE TIMESTAMP;
  BEGIN
  
	IF ( EXISTS (select FIRST 1 LASTACCESSDATE from objQual_FORUMREADTRACKING where USERID=:I_USERID AND FORUMID=:I_FORUMID)) THEN
	begin
	  select FIRST 1 LASTACCESSDATE from objQual_FORUMREADTRACKING where USERID=:I_USERID AND FORUMID=:I_FORUMID  INTO :ICI_LASTACCESSDATE;
		  update objQual_FORUMREADTRACKING set LASTACCESSDATE=:I_UTCTIMESTAMP where LASTACCESSDATE = :ICI_LASTACCESSDATE;
    end
	ELSE
	  begin
		  insert into objQual_FORUMREADTRACKING(USERID,FORUMID,LASTACCESSDATE)
	      values (:I_USERID, :I_FORUMID, :I_UTCTIMESTAMP);
	  end

	  -- Delete TopicReadTracking for forum...
	DELETE
	FROM objQual_TOPICREADTRACKING
	WHERE  USERID=:I_USERID
		AND TOPICID IN (
			SELECT TOPICID
			FROM objQual_TOPIC
			WHERE  FORUMID=:I_FORUMID
			);
end;
--GO

 CREATE PROCEDURE objQual_READFORUM_DELETE(I_USERID integer)
 AS
  BEGIN
		delete from objQual_FORUMREADTRACKING where USERID = :I_USERID;
  end;
--GO

 CREATE PROCEDURE objQual_READFORUM_LASTREAD(I_USERID integer, I_FORUMID integer)
 RETURNS ("LastAccessDate" TIMESTAMP)
 AS
  BEGIN
		FOR SELECT FIRST 1 LastAccessDate FROM  objQual_FORUMREADTRACKING WHERE USERID = :I_USERID AND FORUMID = :I_FORUMID
		INTO :"LastAccessDate"
		DO SUSPEND;
end;
--GO

 CREATE PROCEDURE objQual_USER_LASTREAD(I_USERID integer)
 RETURNS ("LastAccessDate" TIMESTAMP)
 AS
        DECLARE ICI_LastForumRead TIMESTAMP;
		DECLARE ICI_LastTopicRead TIMESTAMP;
  BEGIN	
		
		SELECT MAX(LastAccessDate) FROM  objQual_FORUMREADTRACKING WHERE UserID = :I_USERID
		INTO :ICI_LastForumRead;
		SELECT MAX(LastAccessDate) FROM  objQual_TOPICREADTRACKING WHERE UserID = :I_USERID
		INTO :ICI_LastTopicRead;

		IF (:ICI_LastForumRead is not null AND :ICI_LastTopicRead is not null) THEN
		BEGIN
		IF (:ICI_LastForumRead > :ICI_LastTopicRead) THEN
		  BEGIN
		  SELECT :ICI_LastForumRead FROM RDB$DATABASE INTO :"LastAccessDate";
		  SUSPEND;
		  END         
		ELSE
		   BEGIN
		   SELECT :ICI_LastTopicRead FROM RDB$DATABASE INTO :"LastAccessDate";
		   SUSPEND;
		   END	
		END   	   
	    ELSE IF (:ICI_LastForumRead is not null) THEN
		    BEGIN
	       SELECT :ICI_LastForumRead FROM RDB$DATABASE INTO :"LastAccessDate";
	       SUSPEND;
		   END	
	    ELSE IF (:ICI_LastTopicRead is not null) THEN
		    BEGIN
	        SELECT :ICI_LastTopicRead FROM RDB$DATABASE INTO :"LastAccessDate";
			SUSPEND;
		END	
end;
--GO

CREATE PROCEDURE objQual_TOPICSTATUS_DELETE (I_TOPICSTATUSID INTEGER) as
BEGIN
   DELETE FROM objQual_TOPICSTATUS 
	WHERE TOPICSTATUSID = :I_TOPICSTATUSID;
END;
--GO

CREATE PROCEDURE objQual_TOPICSTATUS_EDIT (I_TOPICSTATUSID INTEGER)
RETURNS 
       ("TopicStatusID" INTEGER,
		"TopicStatusName" varchar(128),
		"BoardID" INTEGER,
		"DefaultDescription" varchar(128)) 
as
BEGIN
	FOR SELECT 
	    TopicStatusID ,
		TopicStatusName,
		BoardID,
		DefaultDescription 
	FROM objQual_TOPICSTATUS 
	WHERE 
	    TOPICSTATUSID = :I_TOPICSTATUSID
		INTO
		:"TopicStatusID",
		:"TopicStatusName",
		:"BoardID",
		:"DefaultDescription"
		DO SUSPEND;
END;
--GO

CREATE procedure objQual_TOPICSTATUS_LIST (I_BOARDID INTEGER) 
RETURNS 
       ("TopicStatusID" INTEGER,
		"TopicStatusName" varchar(128),
		"BoardID" INTEGER,
		"DefaultDescription" varchar(128)) 
as
BEGIN
	FOR SELECT TopicStatusID,
		TopicStatusName,
		BoardID,
		DefaultDescription
	FROM objQual_TOPICSTATUS
	WHERE BOARDID= :I_BOARDID 
	ORDER BY TOPICSTATUSID
		INTO
		:"TopicStatusID",
		:"TopicStatusName",
		:"BoardID",
		:"DefaultDescription"
		DO SUSPEND;
END;
--GO

CREATE procedure objQual_TOPICSTATUS_SAVE (
                 I_TOPICSTATUSID INTEGER,
				 I_BOARDID INTEGER, 
				 I_TOPICSTATUSNAME varchar(128),
				 I_DEFAULTDESCRIPTION varchar(128)) as
begin
		if (I_TOPICSTATUSID is null or I_TOPICSTATUSID = 0) THEN
		begin
		insert into objQual_TOPICSTATUS(BoardID,TopicStatusName,DefaultDescription) 
		values(:I_BOARDID,:I_TOPICSTATUSNAME,:I_DEFAULTDESCRIPTION);
	    end
	else begin
		update objQual_TOPICSTATUS
		set TOPICSTATUSNAME = :I_TOPICSTATUSNAME, 
		    DEFAULTDESCRIPTION = :I_DEFAULTDESCRIPTION
		where TOPICSTATUSID = :I_TOPICSTATUSID;
	end
end;
--GO

CREATE procedure objQual_USER_UPDATE_SSN_STATUS(I_USERID INTEGER, I_ISFACEBOOKUSER BOOL, I_ISTWITTERUSER BOOL) as
begin
		update objQual_USER
		set ISFACEBOOKUSER = :I_ISFACEBOOKUSER,
		    ISTWITTERUSER = :I_ISTWITTERUSER 		  
		where USERID = :I_USERID;
end;
--GO

