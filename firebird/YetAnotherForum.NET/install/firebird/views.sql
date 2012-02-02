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

CREATE VIEW objQual_VACCESSFULL(USERID,FORUMID,READACCESS,
POSTACCESS,REPLYACCESS,
PRIORITYACCESS,POLLACCESS,
VOTEACCESS,MODERATORACCESS,
EDITACCESS,DELETEACCESS,
UPLOADACCESS,DOWNLOADACCESS,
ADMINGROUP) 
AS
  SELECT
b.USERID,
b.FORUMID,
CAST(BIN_AND(c.FLAGS,1) AS INTEGER) AS READACCESS,
CAST(BIN_AND(c.FLAGS,2) AS INTEGER) AS POSTACCESS,
CAST(BIN_AND(c.FLAGS,4) AS INTEGER) AS REPLYACCESS,
CAST(BIN_AND(c.FLAGS,8) AS INTEGER) AS PRIORITYACCESS,
CAST(BIN_AND(c.FLAGS,16) AS INTEGER) AS POLLACCESS,
CAST(BIN_AND(c.FLAGS,32) AS INTEGER) AS VOTEACCESS,
CAST(BIN_AND(c.FLAGS,64) AS INTEGER) AS MODERATORACCESS,
CAST(BIN_AND(c.FLAGS,128) AS INTEGER) AS EDITACCESS,
CAST(BIN_AND(c.FLAGS,256) AS INTEGER) AS DELETEACCESS,
CAST(BIN_AND(c.FLAGS,512) AS INTEGER) AS UPLOADACCESS,
CAST(BIN_AND(c.FLAGS,1024) AS INTEGER) AS DOWNLOADACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database)  AS ADMINGROUP   
FROM    objQual_USERFORUM AS b
INNER JOIN    objQual_ACCESSMASK AS c
ON c.ACCESSMASKID = b.ACCESSMASKID
UNION ALL
SELECT
b.USERID,
c.FORUMID,
CAST(BIN_AND(d.FLAGS, 1) AS INTEGER) AS READACCESS,
CAST(BIN_AND(d.FLAGS, 2 ) AS INTEGER) AS POSTACCESS,
CAST(BIN_AND(d.FLAGS, 4) AS INTEGER) AS REPLYACCESS,
CAST(BIN_AND(d.FLAGS, 8) AS INTEGER) AS PRIORITYACCESS,
CAST(BIN_AND(d.FLAGS, 16) AS INTEGER) AS POLLACCESS,
CAST(BIN_AND(d.FLAGS, 32) AS INTEGER) AS VOTEACCESS,
CAST(BIN_AND(d.FLAGS, 64) AS INTEGER) AS MODERATORACCESS,
CAST(BIN_AND(d.FLAGS, 128) AS INTEGER) AS EDITACCESS,
CAST(BIN_AND(d.FLAGS, 256) AS INTEGER) AS DELETEACCESS,
CAST(BIN_AND(d.FLAGS, 512) AS INTEGER) AS UPLOADACCESS,
CAST(BIN_AND(d.FLAGS, 1024) AS INTEGER) AS DOWNLOADACCESS,
CAST(BIN_AND(e.FLAGS, 1) AS INTEGER) AS ADMINGROUP  
FROM   objQual_USERGROUP AS b
INNER JOIN objQual_FORUMACCESS AS c
ON c.GROUPID = b.GROUPID
INNER JOIN objQual_ACCESSMASK AS d
ON d.ACCESSMASKID = c.ACCESSMASKID
INNER JOIN objQual_GROUP e
ON e.GROUPID=b.GROUPID
UNION ALL
SELECT
USERID,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS FORUMID,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS READACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS POSTACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS REPLYACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS PRIORITYACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS POLLACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS VOTEACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS MODERATORACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS EDITACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS DELETEACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS UPLOADACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS DOWNLOADACCESS,
(SELECT CAST(0 AS INTEGER) from rdb$database) AS ADMINGROUP 
FROM objQual_USER AS a;

--GO



CREATE VIEW objQual_VACCESS(
USERID,
FORUMID,
ISADMIN,
ISGUEST,
ISFORUMMODERATOR,
ISMODERATOR,
READACCESS,
POSTACCESS,
REPLYACCESS,
PRIORITYACCESS,
POLLACCESS,
VOTEACCESS,
MODERATORACCESS,
EDITACCESS,
DELETEACCESS,
UPLOADACCESS,
DOWNLOADACCESS) AS
SELECT     a.USERID,
x_1.FORUMID,
MAX(CAST(BIN_AND(b.FLAGS , 1) AS INTEGER)) AS ISADMIN,
MAX(CAST(BIN_AND(b.FLAGS , 2) AS INTEGER)) AS ISGUEST,
MAX(CAST(BIN_AND(b.FLAGS , 8) AS INTEGER)) AS ISFORUMMODERATOR,
(SELECT     COUNT(v.USERID) 
FROM          objQual_USERGROUP AS v
INNER JOIN    objQual_GROUP AS w
ON v.GROUPID = w.GROUPID
CROSS JOIN  objQual_FORUMACCESS AS x
CROSS JOIN  objQual_ACCESSMASK AS y
WHERE (v.USERID = a.USERID)
AND (x.GROUPID = w.GROUPID)
AND (y.ACCESSMASKID = x.ACCESSMASKID)
AND (BIN_AND(y.FLAGS,64) <> 0)) AS ISMODERATOR,
MAX(x_1.READACCESS) AS READACCESS,
MAX(x_1.POSTACCESS) AS POSTACCESS,
MAX(x_1.REPLYACCESS) AS REPLYACCESS,
MAX(x_1.PRIORITYACCESS) AS PRIORITYACCESS,
MAX(x_1.POLLACCESS) AS POLLACCESS,
MAX(x_1.VOTEACCESS) AS VOTEACCESS,
MAX(x_1.MODERATORACCESS) AS MODERATORACCESS,
MAX(x_1.EDITACCESS) AS EDITACCESS,
MAX(x_1.DELETEACCESS) AS DELETEACCESS,
MAX(x_1.UPLOADACCESS) AS UPLOADACCESS,
MAX(x_1.DOWNLOADACCESS) AS DOWNLOADACCESS
FROM     objQual_VACCESSFULL x_1
INNER JOIN  objQual_USERGROUP AS a
ON a.USERID = x_1.USERID
INNER JOIN objQual_GROUP AS b
ON b.GROUPID = a.GROUPID
GROUP BY a.USERID, x_1.FORUMID;

--GO




 CREATE VIEW objQual_PMESSAGEVIEW(PMESSAGEID, 
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
        ISDELETED)
 AS
 SELECT
	    a.PMESSAGEID, 
        b.USERPMESSAGEID, 
        a.FROMUSERID, 
        d.NAME AS FROMUSER, 
 	    b.USERID AS TOUSERID, 
        c.NAME AS TOUSER, 
        a.CREATED, 
        a.SUBJECT, 
 	    a.BODY, 
        a.FLAGS, 
        b.ISREAD, 
        b.ISINOUTBOX, 
        b.ISARCHIVED,
        b.ISDELETED
 FROM
 	objQual_PMESSAGE a
 INNER JOIN
 	objQual_USERPMESSAGE b ON a.PMESSAGEID = b.PMESSAGEID
 INNER JOIN
 	objQual_USER c ON b.USERID = c.USERID
 INNER JOIN
 	objQual_USER d ON a.FROMUSERID = d.USERID;
--GO



CREATE VIEW objQual_VACCESSFULL1(USERID,FORUMID,READACCESS,
POSTACCESS,REPLYACCESS,
PRIORITYACCESS,POLLACCESS,
VOTEACCESS,MODERATORACCESS,
EDITACCESS,DELETEACCESS,
UPLOADACCESS,DOWNLOADACCESS,
ADMINGROUP) AS
SELECT
b.USERID,
b.FORUMID,
BIN_AND(c.FLAGS, 1) AS READACCESS,
BIN_AND(c.FLAGS, 2) AS POSTACCESS,
BIN_AND(c.FLAGS, 4) AS REPLYACCESS,
BIN_AND(c.FLAGS, 8) AS PRIORITYACCESS,
BIN_AND(c.FLAGS, 16) AS POLLACCESS,
BIN_AND(c.FLAGS, 32) AS VOTEACCESS,
BIN_AND(c.FLAGS, 64) AS MODERATORACCESS,
BIN_AND(c.FLAGS, 128) AS EDITACCESS,
BIN_AND(c.FLAGS, 256) AS DELETEACCESS,
BIN_AND(c.FLAGS, 512) AS UPLOADACCESS,
BIN_AND(c.FLAGS, 1024) AS DOWNLOADACCESS,
(SELECT 0 FROM RDB$DATABASE) AS ADMINGROUP                                 
FROM          objQual_USERFORUM AS b
INNER JOIN    objQual_ACCESSMASK AS c
ON c.ACCESSMASKID = b.ACCESSMASKID;
--GO
CREATE VIEW objQual_VACCESSFULL2(USERID,FORUMID,READACCESS,
POSTACCESS,REPLYACCESS,
PRIORITYACCESS,POLLACCESS,
VOTEACCESS,MODERATORACCESS,
EDITACCESS,DELETEACCESS,
UPLOADACCESS,DOWNLOADACCESS,
ADMINGROUP) AS
SELECT
b.USERID,
c.FORUMID,
BIN_AND(d.FLAGS, 1) AS READACCESS,
BIN_AND(d.FLAGS, 2) AS POSTACCESS,
BIN_AND(d.FLAGS, 4) AS REPLYACCESS,
BIN_AND(d.FLAGS, 8) AS PRIORITYACCESS,
BIN_AND(d.FLAGS, 16) AS POLLACCESS,
BIN_AND(d.FLAGS, 32) AS VOTEACCESS,
BIN_AND(d.FLAGS, 64) AS MODERATORACCESS,
BIN_AND(d.FLAGS, 128) AS EDITACCESS,
BIN_AND(d.FLAGS, 256) AS DELETEACCESS,
BIN_AND(d.FLAGS, 512) AS UPLOADACCESS,
BIN_AND(d.FLAGS,1024) AS DOWNLOADACCESS,
BIN_AND(e.FLAGS, 1) AS AdminGroup  
FROM   objQual_USERGROUP AS b
INNER JOIN objQual_FORUMACCESS AS c
ON c.GROUPID = b.GROUPID
INNER JOIN objQual_ACCESSMASK AS d
ON d.ACCESSMASKID = c.ACCESSMASKID
INNER JOIN objQual_GROUP e
ON e.GROUPID=b.GROUPID;
--GO

 