-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012


 -- DROP VIEW IF EXISTS databaseSchema.objectQualifier_vaccessfull;
 -- GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_vaccess;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_pmessageview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_userpmessageselectview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_messageselectview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_topicselectview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_userselectview; 
 -- GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_vaccessfull1;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_vaccessfull2;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_pollgroupclusterselectview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_pollselectview;
 --GO
 DROP VIEW IF EXISTS databaseSchema.objectQualifier_forumselectview;
 --GO
 
CREATE OR REPLACE VIEW databaseSchema.objectQualifier_vaccessfull AS
    (SELECT b.userid, 
            b.forumid, 
            (c.flags & 1) AS readaccess, 
            (c.flags & 2) AS postaccess, 
            (c.flags & 4) AS replyaccess, 
            (c.flags & 8) AS priorityaccess, 
            (c.flags & 16) AS pollaccess, 
            (c.flags & 32) AS voteaccess, 
            (c.flags & 64) AS moderatoraccess, 
            (c.flags & 128) AS editaccess, 
            (c.flags & 256) AS deleteaccess, 
            (c.flags & 512) AS uploadaccess, 
            (c.flags & 1024) AS downloadaccess, 
            0 AS admingroup 
     FROM (databaseSchema.objectQualifier_userforum b 
     JOIN databaseSchema.objectQualifier_accessmask c 
     ON ((c.accessmaskid = b.accessmaskid))) 
     UNION ALL 
     SELECT b.userid,
	        c.forumid,
			(d.flags & 1) AS readaccess,
			(d.flags & 2) AS postaccess,
			(d.flags & 4) AS replyaccess,
			(d.flags & 8) AS priorityaccess,
			(d.flags & 16) AS pollaccess,
			(d.flags & 32) AS voteaccess,
			(d.flags & 64) AS moderatoraccess,
			(d.flags & 128) AS editaccess,
			(d.flags & 256) AS deleteaccess,
			(d.flags & 512) AS uploadaccess,
			(d.flags & 1024) AS downloadaccess,
			(e.flags & 1) AS admingroup 
    FROM (((databaseSchema.objectQualifier_usergroup b 
    JOIN databaseSchema.objectQualifier_forumaccess c 
    ON ((c.groupid = b.groupid))) 
    JOIN databaseSchema.objectQualifier_accessmask d 
    ON ((d.accessmaskid = c.accessmaskid))) 
    JOIN databaseSchema.objectQualifier_group e 
    ON ((e.groupid = b.groupid)))) 
    UNION ALL 
    SELECT 
          a.userid, 
          0 AS forumid,
		  0 AS readaccess,
		  0 AS postaccess,
		  0 AS replyaccess,
		  0 AS priorityaccess,
		  0 AS pollaccess,
		  0 AS voteaccess,
		  0 AS moderatoraccess,
		  0 AS editaccess,
		  0 AS deleteaccess,
		  0 AS uploadaccess, 
		  0 AS downloadaccess,
		  0 AS admingroup 
     FROM databaseSchema.objectQualifier_user a;    
--GO
 
CREATE OR REPLACE VIEW databaseSchema.objectQualifier_vaccess AS
    SELECT a.userid, 
           x.forumid,
		   MAX(b.flags & 1) AS isadmin,
		   MAX(b.flags & 8)  AS isforummoderator,
		   CAST(SIGN((SELECT count(1) AS count 
                      FROM databaseSchema.objectQualifier_usergroup v,
					  databaseSchema.objectQualifier_group w,
					  databaseSchema.objectQualifier_forumaccess x,
					  databaseSchema.objectQualifier_accessmask y 
					  WHERE v.userid = a.userid 
					  AND w.groupid = v.groupid
					  AND x.groupid = w.groupid 
					  AND y.accessmaskid = x.accessmaskid
					  AND (y.flags & 64) <> 0))AS integer) AS ismoderator, 
           MAX(x.readaccess) AS readaccess, 
           MAX(x.postaccess) AS postaccess, 
           MAX(x.replyaccess) AS replyaccess, 
           MAX(x.priorityaccess) AS priorityaccess, 
           MAX(x.pollaccess) AS pollaccess, 
           MAX(x.voteaccess) AS voteaccess, 
           MAX(x.moderatoraccess) AS moderatoraccess, 
           MAX(x.editaccess) AS editaccess, 
           MAX(x.deleteaccess) AS deleteaccess, 
           MAX(x.uploadaccess) AS uploadaccess, 
           MAX(x.downloadaccess) AS downloadaccess 
    FROM ((databaseSchema.objectQualifier_vaccessfull x 
    JOIN databaseSchema.objectQualifier_usergroup a 
    ON ((a.userid = x.userid))) 
    JOIN databaseSchema.objectQualifier_group b ON ((b.groupid = a.groupid))) 
    GROUP BY a.userid, x.forumid;
--GO
 
CREATE OR REPLACE VIEW databaseSchema.objectQualifier_vaccessfull1 AS
    SELECT
	      b.userid,
		  b.forumid,
		  c.flags & 1 AS ReadAccess,
		  c.flags & 2 AS PostAccess,
		  c.flags & 4 AS ReplyAccess,
		  c.flags & 8 AS PriorityAccess,
		  c.flags & 16 AS PollAccess,
		  c.flags & 32 AS VoteAccess,
		  c.flags & 64 AS ModeratorAccess,
		  c.flags & 128 AS EditAccess,
		  c.flags & 256 AS DeleteAccess,
		  c.flags & 512 AS UploadAccess,
		  c.flags & 1024 AS DownloadAccess,
		  0 AS AdminGroup                                 
    FROM  databaseSchema.objectQualifier_userforum AS b
    INNER JOIN    databaseSchema.objectQualifier_accessmask AS c
	ON c.accessmaskid = b.accessmaskid;
--GO

CREATE OR REPLACE VIEW databaseSchema.objectQualifier_vaccessfull2 AS
    SELECT
	      b.userid,
		  c.forumid,
		  d.flags & 1 AS ReadAccess,
		  d.flags & 2 AS PostAccess,
		  d.flags & 4 AS ReplyAccess,
		  d.flags & 8 AS PriorityAccess,
		  d.flags & 16 AS PollAccess,
		  d.flags & 32 AS VoteAccess,
		  d.flags & 64 AS ModeratorAccess,
		  d.flags & 128 AS EditAccess,
		  d.flags & 256 AS DeleteAccess,
		  d.flags & 512 AS UploadAccess,
		  d.flags & 1024 AS DownloadAccess,
		  e.flags & 1 AS AdminGroup  
    FROM   databaseSchema.objectQualifier_usergroup AS b
    INNER JOIN databaseSchema.objectQualifier_forumaccess AS c
	ON c.groupid = b.groupid
	INNER JOIN databaseSchema.objectQualifier_accessmask AS d
	ON d.accessmaskid = c.accessmaskid
	INNER JOIN databaseSchema.objectQualifier_group e
	ON e.groupid=b.groupid;
--GO
