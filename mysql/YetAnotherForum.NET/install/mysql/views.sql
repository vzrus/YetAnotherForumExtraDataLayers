-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012


/* Views */

DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccessfull1;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccessfull2;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccessfull3;
--GO

DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccessfull;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccess;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccess_null;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccess_group;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}vaccess_user;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}UserPMessageSelectView;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}MessageSelectView;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}TopicSelectView;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}PMessageView;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}MessageSelectView;
--GO
DROP VIEW IF EXISTS {databaseName}.{objectQualifier}UserSelectView;
--GO

/* Views vaccess */
CREATE VIEW {databaseName}.{objectQualifier}vaccessfull1 AS
SELECT
b.UserID,
b.ForumID,
c.Flags & 1 AS ReadAccess,
c.Flags & 2 AS PostAccess,
c.Flags & 4 AS ReplyAccess,
c.Flags & 8 AS PriorityAccess,
c.Flags & 16 AS PollAccess,
c.Flags & 32 AS VoteAccess,
c.Flags & 64 AS ModeratorAccess,
c.Flags & 128 AS EditAccess,
c.Flags & 256 AS DeleteAccess,
c.Flags & 512 AS UploadAccess,
c.Flags & 1024 AS DownloadAccess,
0 AS AdminGroup                                 
FROM          {databaseName}.{objectQualifier}UserForum AS b
INNER JOIN    {databaseName}.{objectQualifier}AccessMask AS c
ON c.AccessMaskID = b.AccessMaskID;
--GO
CREATE VIEW {databaseName}.{objectQualifier}vaccessfull2 AS
SELECT
b.UserID,
c.ForumID,
d.Flags & 1 AS ReadAccess,
d.Flags & 2 AS PostAccess,
d.Flags & 4 AS ReplyAccess,
d.Flags & 8 AS PriorityAccess,
d.Flags & 16 AS PollAccess,
d.Flags & 32 AS VoteAccess,
d.Flags & 64 AS ModeratorAccess,
d.Flags & 128 AS EditAccess,
d.Flags & 256 AS DeleteAccess,
d.Flags & 512 AS UploadAccess,
d.Flags & 1024 AS DownloadAccess,
e.Flags & 1 AS AdminGroup  
FROM   {databaseName}.{objectQualifier}UserGroup AS b
INNER JOIN {databaseName}.{objectQualifier}ForumAccess AS c
ON c.GroupID = b.GroupID
INNER JOIN {databaseName}.{objectQualifier}AccessMask AS d
ON d.AccessMaskID = c.AccessMaskID
INNER JOIN {databaseName}.{objectQualifier}Group e
ON e.GroupID=b.GroupID;
--GO
CREATE VIEW {databaseName}.{objectQualifier}vaccessfull3 AS
   SELECT a1.UserID AS UserID,
                   0 AS  ForumID,
                   0 AS ReadAccess,
                   0 AS PostAccess,
                   0 AS ReplyAccess,
                   0 AS PriorityAccess,
                   0 AS PollAccess,
                   0 AS VoteAccess,
                   0 AS ModeratorAccess,
                   0 AS EditAccess,
                   0 AS DeleteAccess,
                   0 AS UploadAccess,
                   0 AS DownloadAccess,
                   0 AS AdminGroup 
            FROM  {databaseName}.{objectQualifier}User a1;
--GO

/* eof Views */ 

CREATE VIEW {databaseName}.{objectQualifier}vaccessfull AS
SELECT
b.UserID,
b.ForumID,
c.Flags & 1 AS ReadAccess,
c.Flags & 2 AS PostAccess,
c.Flags & 4 AS ReplyAccess,
c.Flags & 8 AS PriorityAccess,
c.Flags & 16 AS PollAccess,
c.Flags & 32 AS VoteAccess,
c.Flags & 64 AS ModeratorAccess,
c.Flags & 128 AS EditAccess,
c.Flags & 256 AS DeleteAccess,
c.Flags & 512 AS UploadAccess,
c.Flags & 1024 AS DownloadAccess,
0 AS AdminGroup                                 
FROM          {databaseName}.{objectQualifier}UserForum AS b
INNER JOIN    {databaseName}.{objectQualifier}AccessMask AS c
ON c.AccessMaskID = b.AccessMaskID
UNION ALL
SELECT
b.UserID,
c.ForumID,
d.Flags & 1 AS ReadAccess,
d.Flags & 2 AS PostAccess,
d.Flags & 4 AS ReplyAccess,
d.Flags & 8 AS PriorityAccess,
d.Flags & 16 AS PollAccess,
d.Flags & 32 AS VoteAccess,
d.Flags & 64 AS ModeratorAccess,
d.Flags & 128 AS EditAccess,
d.Flags & 256 AS DeleteAccess,
d.Flags & 512 AS UploadAccess,
d.Flags & 1024 AS DownloadAccess,
e.Flags & 1 AS AdminGroup  
FROM   {databaseName}.{objectQualifier}UserGroup AS b
INNER JOIN {databaseName}.{objectQualifier}ForumAccess AS c
ON c.GroupID = b.GroupID
INNER JOIN {databaseName}.{objectQualifier}AccessMask AS d
ON d.AccessMaskID = c.AccessMaskID
INNER JOIN {databaseName}.{objectQualifier}Group e
ON e.GroupID=b.GroupID
UNION ALL
SELECT
UserID,
0 AS ForumID,
0 AS ReadAccess,
0 AS PostAccess,
0 AS ReplyAccess,
0 AS PriorityAccess,
0 AS PollAccess,
0 AS VoteAccess,
0 AS ModeratorAccess,
0 AS EditAccess,
0 AS DeleteAccess,
0 AS UploadAccess,
0 AS DownloadAccess,
0 AS AdminGroup 
FROM {databaseName}.{objectQualifier}User AS a;
--GO 




/* TODO to not forget to separate if improves performance
CREATE VIEW {databaseName}.{objectQualifier}vaccess_user AS
SELECT
b.UserID,
b.ForumID,
c.AccessMaskID,
0 AS GroupID,
c.Flags & 1 AS ReadAccess,
c.Flags & 2 AS PostAccess,
c.Flags & 4 AS ReplyAccess,
c.Flags & 8 AS PriorityAccess,
c.Flags & 16 AS PollAccess,
c.Flags & 32 AS VoteAccess,
c.Flags & 64 AS ModeratorAccess,
c.Flags & 128 AS EditAccess,
c.Flags & 256 AS DeleteAccess,
c.Flags & 512 AS UploadAccess,
c.Flags & 1024 AS DownloadAccess,
0 AS AdminGroup                                 
FROM          {databaseName}.{objectQualifier}UserForum AS b
INNER JOIN    {databaseName}.{objectQualifier}AccessMask AS c
ON c.AccessMaskID = b.AccessMaskID;
-- GO

CREATE VIEW {databaseName}.{objectQualifier}vaccess_group AS
SELECT
b.UserID,
c.ForumID,
d.AccessMaskID,
b.GroupID,
d.Flags & 1 AS ReadAccess,
d.Flags & 2 AS PostAccess,
d.Flags & 4 AS ReplyAccess,
d.Flags & 8 AS PriorityAccess,
d.Flags & 16 AS PollAccess,
d.Flags & 32 AS VoteAccess,
d.Flags & 64 AS ModeratorAccess,
d.Flags & 128 AS EditAccess,
d.Flags & 256 AS DeleteAccess,
d.Flags & 512 AS UploadAccess,
d.Flags & 1024 AS DownloadAccess,
e.Flags & 1 AS AdminGroup  
FROM   {databaseName}.{objectQualifier}UserGroup AS b
INNER JOIN {databaseName}.{objectQualifier}ForumAccess AS c
ON c.GroupID = b.GroupID
INNER JOIN {databaseName}.{objectQualifier}AccessMask AS d
ON d.AccessMaskID = c.AccessMaskID
INNER JOIN {databaseName}.{objectQualifier}Group e
ON e.GroupID=b.GroupID;
-- GO

CREATE VIEW {databaseName}.{objectQualifier}vaccess_null AS
SELECT
a.UserID,
0 AS ForumID,
0 AS AccessMaskID,
0 AS GroupID,
0 AS ReadAccess,
0 AS PostAccess,
0 AS ReplyAccess,
0 AS PriorityAccess,
0 AS PollAccess,
0 AS VoteAccess,
0 AS ModeratorAccess,
0 AS EditAccess,
0 AS DeleteAccess,
0 AS UploadAccess,
0 AS DownloadAccess,
0 AS AdminGroup 
FROM {databaseName}.{objectQualifier}User AS a;
-- GO

CREATE VIEW {databaseName}.{objectQualifier}vaccessfull
AS
select 
			UserID,
			ForumID,
                      MAX(ReadAccess) AS ReadAccess, MAX(PostAccess) AS PostAccess, MAX(ReplyAccess) AS ReplyAccess, MAX(PriorityAccess) AS PriorityAccess, 
                      MAX(PollAccess) AS PollAccess, MAX(VoteAccess) AS VoteAccess, MAX(ModeratorAccess) AS ModeratorAccess, MAX(EditAccess) AS EditAccess, 
                      MAX(DeleteAccess) AS DeleteAccess, MAX(UploadAccess) AS UploadAccess, MAX(DownloadAccess) AS DownloadAccess, MAX(AdminGroup) as AdminGroup
		FROM (
		select
			UserID,
			ForumID,
			ReadAccess		,
			PostAccess		,
			ReplyAccess		,
			PriorityAccess	,
			PollAccess		,
			VoteAccess		,
			ModeratorAccess	,
			EditAccess		,
			DeleteAccess	,
			UploadAccess	,
			DownloadAccess	,
			AdminGroup		
		from
			{databaseName}.{objectQualifier}vaccess_user b
		
		union all
		
		select
			UserID,
			ForumID,
			ReadAccess		,
			PostAccess		,
			ReplyAccess		,
			PriorityAccess	,
			PollAccess		,
			VoteAccess		,
			ModeratorAccess	,
			EditAccess		,
			DeleteAccess	,
			UploadAccess	,
			DownloadAccess	,
			AdminGroup	
		from
			{databaseName}.{objectQualifier}vaccess_group b

		union all

		select
			UserID,
			ForumID,
			ReadAccess		,
			PostAccess		,
			ReplyAccess		,
			PriorityAccess	,
			PollAccess		,
			VoteAccess		,
			ModeratorAccess	,
			EditAccess		,
			DeleteAccess	,
			UploadAccess	,
			DownloadAccess	,
			AdminGroup	
		from
			{databaseName}.{objectQualifier}vaccess_null b
) access
	GROUP BY
		UserID,ForumID;			
-- GO
*/

CREATE VIEW {databaseName}.{objectQualifier}vaccess AS
SELECT     a.UserID,
x_1.ForumID,
MAX(b.Flags & 1) AS IsAdmin,
MAX(b.Flags & 2) AS IsGuest,
MAX(b.Flags & 8) AS IsForumModerator,
(SELECT     COUNT(1) AS Expr1
FROM          {databaseName}.{objectQualifier}UserGroup AS v
INNER JOIN    {databaseName}.{objectQualifier}Group AS w
ON v.GroupID = w.GroupID
CROSS JOIN  {databaseName}.{objectQualifier}ForumAccess AS x
CROSS JOIN  {databaseName}.{objectQualifier}AccessMask AS y
WHERE (v.UserID = a.UserID)
AND (x.GroupID = w.GroupID)
AND (y.AccessMaskID = x.AccessMaskID)
AND (y.Flags & 64 <> 0)) AS IsModerator,
MAX(x_1.ReadAccess) AS ReadAccess,
MAX(x_1.PostAccess) AS PostAccess,
MAX(x_1.ReplyAccess) AS ReplyAccess,
MAX(x_1.PriorityAccess) AS PriorityAccess,
MAX(x_1.PollAccess) AS PollAccess,
MAX(x_1.VoteAccess) AS VoteAccess,
MAX(x_1.ModeratorAccess) AS ModeratorAccess,
MAX(x_1.EditAccess) AS EditAccess,
MAX(x_1.DeleteAccess) AS DeleteAccess,
MAX(x_1.UploadAccess) AS UploadAccess,
MAX(x_1.DownloadAccess) AS DownloadAccess
FROM     {databaseName}.{objectQualifier}vaccessfull x_1
INNER JOIN  {databaseName}.{objectQualifier}UserGroup AS a
ON a.UserID = x_1.UserID
INNER JOIN {databaseName}.{objectQualifier}Group AS b
ON b.GroupID = a.GroupID
GROUP BY a.UserID, x_1.ForumID;
--GO  


 CREATE VIEW {databaseName}.{objectQualifier}MessageSelectView
 AS
 SELECT
a.MessageID,
a.TopicID,
a.ReplyTo,
a.Position,
a.Indent,
a.UserID,
a.UserName,
a.Posted,
a.Message,
a.IP,
a.Edited,
a.Flags,
a.EditReason,
a.IsModeratorChanged,
a.DeleteReason,
IFNULL(SIGN(a.Flags & 8)>0,false) AS IsDeleted,
IFNULL(SIGN(a.Flags & 16)>0,false) AS IsApproved,
a.BlogPostID
 FROM
 	{databaseName}.{objectQualifier}Message a;
--GO

 CREATE VIEW {databaseName}.{objectQualifier}TopicSelectView
 AS
 SELECT
a.TopicID,
a.ForumID,
a.UserID,
a.UserName,
a.Posted,
a.Topic,
a.Views,
a.Priority,
a.PollID,
a.TopicMovedID,
a.LastPosted,
a.LastMessageID,
a.LastUserID,
a.LastUserName,
a.NumPosts,
IFNULL(a.Flags,0) AS Flags,
IFNULL(SIGN(a.Flags & 8)>0,false) AS IsDeleted,
IFNULL(SIGN(a.Flags & 1024)>0,false)  AS IsQuestion
 FROM
 	{databaseName}.{objectQualifier}Topic a;
--GO


 CREATE VIEW {databaseName}.{objectQualifier}UserSelectView
 AS
 SELECT
a.UserID,
a.BoardID,
a.ProviderUserKey,
a.Name,
a.DisplayName,
a.Password,
a.Email,
a.Joined,
a.LastVisit,
a.IP,
a.NumPosts,
a.TimeZone,
a.Avatar,
a.Signature,
a.AvatarImage,
a.AvatarImageType,
a.RankID,
a.Suspended,
a.LanguageFile,
a.ThemeFile,
a.OverrideDefaultThemes,
a.PMNotification,
a.NotificationType,
a.DailyDigest,
a.Flags,
a.Points,
a.Culture AS CultureUser,
a.AutoWatchTopics,
((a.Flags & 2) = 2) AS IsApproved,
((a.Flags & 16) = 16) AS IsActiveExcluded
 FROM
 	{databaseName}.{objectQualifier}User a;
--GO


















