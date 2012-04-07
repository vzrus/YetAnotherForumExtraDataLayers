-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

-- Table Types
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_table_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_table_type AS
(
  "UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" varchar(36),
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "CultureUser" varchar(10),  
  "DailyDigest" boolean,
  "NotificationType" integer,
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean 
);
--GO

-- derived types

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_accessmask_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_accessmask_list_return_type AS
(
"AccessMaskID" integer,
"BoardID" integer,
"Name" varchar,
"Flags" integer,
"SortOrder" smallint
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_active_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_active_list_return_type AS
(
"UserID" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"IP" varchar(39),
"SessionID" varchar(32),
"ForumID" integer,
"TopicID" integer,
"ForumName" varchar(128),
"TopicName" varchar(128), 
"IsGuest" boolean,
"IsCrawler" boolean,
"IsHidden" boolean,
"Style" varchar(255), 
"UserCount" integer,
"Login" timestampTZ,
"LastActive" timestampTZ,
"Location" varchar(255),
"Active"  integer,
"Browser" varchar(128),
"Platform" varchar(128),
"ForumPage"  varchar(255),
"ActiveSpan" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_active_list_user_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_active_list_user_return_type AS
(
"UserID" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"IP" varchar(39),
"SessionID" varchar(32),
"ForumID" integer,
"HasForumAccess" integer,
"TopicID" integer,
"ForumName" varchar(128),
"TopicName" varchar(128), 
"IsGuest" boolean,
"IsCrawler" boolean,
"IsHidden" boolean,
"Style" varchar(255), 
"UserCount" integer,
"Login" timestampTZ,
"LastActive" timestampTZ,
"Location" varchar(255),
"Active"  integer,
"Browser" varchar(128),
"Platform" varchar(128),
"ForumPage"  varchar(255),
"ActiveSpan" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_active_listforum_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_active_listforum_return_type AS
(
"UserID" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"IsCrawler" boolean,
"IsHidden" boolean,
"Style" varchar(255), 
"UserCount" integer,
"Browser" varchar(128)
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_active_listtopic_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_active_listtopic_return_type AS
(
"UserID" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"IsCrawler" boolean,
"IsHidden" boolean,
"Style" varchar(255), 
"UserCount" integer,
"Browser" varchar(128) 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_active_stats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_active_stats_return_type AS
(
"ActiveUsers" integer, 
"ActiveGuests" integer, 
"ActiveMembers" integer, 
"ActiveHidden" integer
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_attachment_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_attachment_list_return_type AS
(
"AttachmentID" integer,
"MessageID" integer,
"FileName" varchar(255),
"Bytes" integer,
"FileID" integer,
"ContentType" varchar(128),
"Downloads" integer,
"FileData" bytea,
"BoardID" integer,
"Posted" timestampTZ,
"ForumID" integer,
"ForumName" varchar(128),
"TopicID" integer, 
"TopicName"  varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_bannedip_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_bannedip_list_return_type AS
(
"ID" integer,
"BoardID" integer,
"Mask" varchar(57),
"Since" timestampTZ,
"Reason" varchar(128),
"UserID" integer
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_bbcode_list_return_type');
--GO
 CREATE TYPE databaseSchema.objectQualifier_bbcode_list_return_type AS
 (
 "BBCodeID" integer,
 "BoardID" integer, 
 "Name" varchar(255),
 "Description" varchar(4000),
 "OnClickJS" varchar(1000),
 "DisplayJS" text,
 "EditJS" text,
 "DisplayCSS" text,
 "SearchRegex" text,
 "ReplaceRegex" text,
 "Variables" varchar(1000),
 "UseModule" boolean,
 "ModuleClass" varchar(255),
 "ExecOrder" integer
 );
 
 --GO
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_board_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_board_list_return_type AS
(
    "BoardID" integer,
    "Name" varchar(128),
    "AllowThreaded" boolean,
    "MembershipAppName" varchar(255),
    "RolesAppName" varchar(255),
    "SQLVersion" varchar(512)
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_board_poststats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_board_poststats_return_type AS
(
"Posts" integer,
"Topics" integer,
"Forums" integer,
"LastPostInfoID" integer,
"LastPost" timestampTZ,
"LastUserID" integer,
"LastUser" varchar(255),
"LastUserDisplayName" varchar(255),
"LastUserStyle"  varchar(255)
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_board_userstats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_board_userstats_return_type AS
(
"Members" integer,
"MaxUsers" integer,
"MaxUsersWhen" timestampTZ,
"LastMemberInfoID" integer,
"LastMemberID" integer,
"LastMember" varchar(255),
"LastMemberDisplayName" varchar(255)
);

--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_board_stats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_board_stats_return_type AS
(
"NumPosts" integer,
"NumTopics" integer,
"NumUsers" integer,
"BoardStart" timestampTZ 
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_category_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_category_list_return_type AS
(
"CategoryID" integer,
"BoardID" integer,
"Name" varchar(128),
"CategoryImage" varchar(255),
"SortOrder" smallint
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_category_listread_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_category_listread_return_type AS
(
"CategoryID" integer,
"Name" varchar(128),
"CategoryImage" varchar(255),
"ForumID" integer,
"Flags"  integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_category_simplelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_category_simplelist_return_type AS
(
"CategoryID" integer,
"Name" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_category_save_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_category_save_return_type AS
(
"CategoryID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_checkemail_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_checkemail_list_return_type AS (
    "CheckEmailID" integer,
    "UserID" integer,
    "Email" varchar(128),
    "Created" timestampTZ,
    "Hash" varchar(32)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_checkemail_update_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_checkemail_update_return_type AS (
    "ProviderUserKey" varchar(64),    
    "Email" varchar(128)   
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_extension_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_extension_return_type AS
(
"ExtensionID" integer,
"BoardID" integer,
"Extension" varchar(10)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_eventlog_list_return_type');
--GO
CREATE TYPE  databaseSchema.objectQualifier_eventlog_list_return_type AS
(
"EventLogID" integer,
"EventTime" timestampTZ,
"UserID" integer,
"Source" varchar(128),
"Description" text,
"Type" integer,
"Name" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_list_return_type AS
(
"ForumID" integer,
"CategoryID" integer,
"ParentID" integer,
"Name" varchar(128),
"Description" varchar(255),
"SortOrder" smallint,
"LastPosted" timestampTZ,
"LastTopicID" integer,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" varchar(128),
"NumTopics" integer,
"NumPosts" integer,
"RemoteURL" varchar(100),
"Flags" integer,
"ThemeURL" varchar(100),
"ImageURL" varchar(128),
"Styles" varchar(255)
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listall_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listall_return_type AS
(
"CategoryID" integer,
"Category" varchar(100),
"ForumID" integer,
"Forum" varchar(100),
"Indent" integer,
"ParentID" integer,
"Flags" integer,
"PollGroupID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listall_fromcat_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listall_fromcat_return_type AS
(
"CategoryID" integer,
"Category" varchar(255),
"ForumID" integer,
"Forum" varchar(100),
"ParentID" integer,
"PollGroupID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listallmymoderated_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listallmymoderated_return_type AS
(
"CategoryID" integer,
"Category" varchar(255),
"ForumID" integer,
"Forum" varchar(100),
"Indent" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listpath_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listpath_return_type AS
(
"ForumID" integer,
"Name" varchar(255)
);

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forumid_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forumid_return_type AS
(
"ForumID" integer
);
--GO
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listread_helper_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listread_helper_return_type AS
(
"LastPosted" timestampTZ,
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastUserID" integer,
"LastTopicID" integer,
"TopicMovedID" integer,
"LastTopicName" varchar(255)
);
--GO
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listread_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listread_return_type AS
(
"CategoryID" integer,
"Category" varchar(128),
"ForumID" integer,
"ParentID" integer,
"Forum" varchar(128),
"Description" varchar(255),
"ImageUrl"  varchar(128),
"PollGroupID" integer,
/*"LastTopicID" integer,*/
"Topics" integer,
"Posts" integer,
/* "Subforums" integer, */
"LastTopicID" integer,
"LastTopicStatus" varchar(255),
"LastTopicStyles" varchar(255),
"TopicMovedID" integer,
"LastPosted" timestampTZ,
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastUserID" integer,
"LastTopicName"  varchar(128),
"LastUser"  varchar(128),
"LastUserDisplayName" varchar(128),
"Flags" integer,
"Style"  varchar(255),
"Viewing" integer,
"RemoteURL" varchar(255),
"ReadAccess" integer,
"LastForumAccess"  timestampTZ,
"LastTopicAccess"  timestampTZ 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listtopics_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listtopics_return_type AS
(
    "TopicID" integer,
    "ForumID" integer,
    "UserID" integer,
    "UserName" varchar(128),
    "Posted" timestampTZ,
    "Topic" varchar(128),
    "Views" integer,
    "Priority" smallint,
    "PollID" integer,
    "TopicMovedID" integer,
    "LastPosted" timestampTZ,
    "LastMessageID" integer,    
    "LastUserID" integer,
    "LastUserName" varchar(128),
    "NumPosts" integer,
    "Flags" integer,
	"AnswerMessageID" integer,
	"LastMessageFlags" integer,
	"Description" varchar(255),
	"Status" varchar(255),
    "IsDeleted" boolean,
	"IsQuestion" boolean
);

--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_moderatelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_moderatelist_return_type AS
(
"ForumID" integer,
"CategoryID" integer,
"ParentID" integer,
"Name" varchar(128),
"Description" varchar(255),
"SortOrder" smallint,
"LastPosted" timestampTZ,
"LastTopicID" integer,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" varchar(128),
"NumTopics" integer,
"NumPosts" integer,
"RemoteURL" varchar(128),
"Flags" integer,
"ThemeURL" varchar(128),
"ImageURL" varchar(128),
"Styles" varchar(128),
"PollGroupID" integer,
"MessageCount" integer,
"ReportedCount" integer,
"ModeratorAccess" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_moderators_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_moderators_return_type AS
(
"ForumID"  integer,
"ForumName" varchar(255),
"ModeratorID" integer,
"ModeratorName" varchar(255),
"ModeratorDisplayName" varchar(255),
"ModeratorEmail" varchar(255),
"ModeratorAvatar" varchar(255),
"ModeratorAvatarImage" boolean,
"Style" varchar(255),
"IsGroup" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_moderators_team_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_moderators_team_list_return_type AS
(
"ForumID"  integer,
"ForumName" varchar(255),
"ModeratorID" integer,
"ModeratorName" varchar(255),
"ModeratorDisplayName" varchar(255),
"ModeratorEmail" varchar(255),
"ModeratorAvatar" varchar(255),
"ModeratorAvatarImage" boolean,
"Style" varchar(255),
"IsGroup" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_simplelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_simplelist_return_type AS
(
"ForumID" integer,
"Name" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forumaccess_group_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forumaccess_group_return_type AS
(
"GroupID" integer,
"ForumID" integer,
"AccessMaskID" integer,
"ForumName"  varchar(128),
"CategoryName" varchar(128),
"CategoryID" integer,
"ParentID" integer,
"BoardName"  varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forumaccess_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_forumaccess_list_return_type AS
(
"GroupID" integer,
"ForumID" integer,
"AccessMaskID" integer,
"GroupName"  varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_group_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_group_list_return_type AS
(
"GroupID" integer,
"BoardID" integer,
"Name" varchar(128),
"Flags" integer,
"PMLimit" integer,
"Style" varchar(256),
"SortOrder" integer,
"Description" varchar(128),
"UsrSigChars" integer,
"UsrSigBBCodes" varchar(255),
"UsrSigHTMLTags"  varchar(255),
"UsrAlbums" integer,
"UsrAlbumImages" integer

);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_group_medal_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_group_medal_list_return_type AS
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
"SortOrder" smallint,
"Flags" integer,
"GroupName" varchar(128),
"GroupID" integer,
"Message" text,
"MessageEx" text,
"Hide" boolean,
"OnlyRibbon" boolean,
"CurrentSortOrder" smallint
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_group_member_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_group_member_return_type AS
(
"GroupID" integer,
"Name" varchar(128),
"Member" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_group_save_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_group_save_return_type AS
(
"GroupID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_mail_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_mail_list_return_type AS (
"MailID" integer,
"FromUser" varchar(128),
"FromUserName" varchar(128),
"ToUser" varchar(128),
"ToUserName" varchar(128),
"Created" timestampTZ,
"Subject" varchar(128),
"Body" text,
"BodyHtml" text,
"SendTries" integer,
"SendAttempt" timestampTZ,
"ProcessID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_medal_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_medal_list_return_type AS 
(
"MedalID" integer,
"BoardID" integer,
"Name" varchar(128),
"Description" text,
"Message" varchar(128),
"Category" varchar(128),
"MedalURL" varchar(250),
"RibbonURL" varchar(250),
"SmallMedalURL" varchar(250),
"SmallRibbonURL" varchar(250),
"SmallMedalWidth" smallint,
"SmallMedalHeight" smallint,
"SmallRibbonWidth" smallint,
"SmallRibbonHeight" smallint,
"SortOrder" smallint,
"Flags" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_medal_listusers_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_medal_listusers_return_type AS 
(
"UserID" integer,
"Name" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_findunread_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_findunread_return_type AS 
(
"MessageID" integer,
"MessagePosition" integer, 
"FirstMessageID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_getreplies_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_getreplies_return_type AS 
(
"MessageID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_list_return_type AS 
(
"MessageID" integer,
"UserID" integer,
"UserName" varchar(255),
"UserDisplayName" varchar(255),
"Message" text,
"TopicID" integer,
"ForumID" integer,
"Topic"  varchar(255),
"Status"  varchar(255),
"Styles"  varchar(255),
"Priority"  smallint,
"Description"  varchar(255),
"Flags" integer,
"TopicOwnerID"  integer,
"Edited" timestampTZ,
"TopicFlags"  integer,
"ForumFlags"  integer,
"EditReason" varchar(100),
"Position"  integer,
"IsModeratorChanged" boolean,
"DeleteReason" varchar(100),
"BlogPostID"   varchar(100),
"PollID"   integer,
"IP" varchar(39),
"ReplyTo" integer,
"ExternalMessageId" varchar(255),
"ReferenceMessageId" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_listreported_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_listreported_return_type AS 
(
"MessageID" integer,
"Message" text,
"Resolved" boolean,
"ResolvedBy" integer,
"ResolvedDate" timestampTZ,
"OriginalMessage" text,
"Flags" integer,
"IsModeratorChanged" boolean,
"UserName" varchar(128),
"UserDisplayName" varchar(255),
"UserID" integer,
"Posted" timestampTZ,
"TopicID" integer,
"Topic" varchar(128), 
"NumberOfReports" integer
);
--GO

-- Function: databaseSchema.objectQualifier_message_reply_list(integer)
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_reply_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_reply_list_return_type AS 
(
"MessageID" integer,
"Posted" timestampTZ,
"Subject" varchar(128),
"Message" text,
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"Signature" text);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_simplelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_simplelist_return_type AS
(
"MessageID" integer,
"TopicID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_unapproved_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_unapproved_return_type AS 
(
"MessageID" integer,
"UserID" integer, 
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"Posted" timestampTZ,
"TopicID" integer, 
"Topic" varchar(128),
"Message" text,
"Flags" integer,
"IsModeratorChanged" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_nntpforum_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_nntpforum_list_return_type AS 
(
"Name" varchar(128),
"Address" varchar(100),
"Port" integer,
"UserName" varchar(128),
"UserPass" varchar(128),
"NntpServerID" integer,
"NntpForumID" integer,
"GroupName" varchar(128),
"ForumID" integer,
"LastMessageNo" integer,
"LastUpdate" timestampTZ,
"Active" boolean,
"DateCutOff"  timestampTZ,
"ForumName" varchar(128) 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_nntpserver_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_nntpserver_list_return_type AS 
(
"NntpServerID" integer,
"BoardID" integer,
"Name" varchar(128),
"Address" varchar(128),
"Port" integer,
"UserName" varchar(128),
"UserPass" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_nntptopic_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_nntptopic_list_return_type AS 
(
"NntpTopicID" integer,
"NntpForumID" integer,
"Thread" character(32),
"TopicID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pmessage_info_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pmessage_info_return_type AS 
(
"NumRead" integer,
"NumUnread" integer,
"NumTotal" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pmessage_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pmessage_list_return_type AS 
(
"PMessageID" integer,
"UserPMessageID" integer,
"FromUserID" integer,
"FromUser" varchar(128),
"ToUserID" integer,
"ToUser" varchar(128),
"Created" timestampTZ,
"Subject" varchar(128),
"Body" text,
"Flags" integer,
"IsRead" boolean,
"IsInOutbox" boolean,
"IsArchived" boolean,
"IsDeleted" boolean
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_poll_save_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_poll_save_return_type AS
(
"PollID" integer
);
--GO
select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_poll_stats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_poll_stats_return_type AS
(
"PollID" integer,
"Question" varchar(128),
"Closes" timestamp,
"UserID" integer,
"ObjectPath"  varchar(255),
"MimeType"  varchar(50),
"QuestionObjectPath"  varchar(255),
"QuestionMimeType"  varchar(50),
"ChoiceID" integer,
"Choice" varchar(128),
"Votes" integer,
"IsBound" boolean,
"IsClosedBound" boolean,
"AllowMultipleChoices"  boolean,
"ShowVoters" boolean,
"AllowSkipVote" boolean,
"Total" integer,
"Stats" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pollgroup_stats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pollgroup_stats_return_type AS
(
"GroupUserID" integer,
"PollID" integer,
"PollGroupID" integer,
"Question" varchar(128),
"Closes" timestamp,
"ChoiceID" integer,
"Choice"   varchar(255),
"Votes" integer,
"ObjectPath"  varchar(255),
"MimeType"  varchar(50),
"QuestionObjectPath"  varchar(255),
"QuestionMimeType"  varchar(50),
"IsBound" boolean,
"IsClosedBound" boolean,
"AllowMultipleChoices"  boolean,
"ShowVoters" boolean,
"AllowSkipVote" boolean,
"Total" integer,
"Stats" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pollgroup_votecheck_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pollgroup_votecheck_return_type AS
(
"PollID" integer,
"ChoiceID" integer,
"UserName"  varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pollvote_check_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pollvote_check_return_type AS
(
"PollVoteID" integer
);
--GO
select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_post_last10user_type');
--GO
select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_post_alluser_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_post_alluser_type AS
(
"Posted" timestampTZ,
"Subject" varchar(128),
"MessageID" integer,
"Message" text,
"IP" varchar(39),
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"Signature" text,
"TopicID" integer,
"ForumID" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_post_list_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_post_list_type AS
(
 		"TopicID" integer,
		"Topic"  varchar(255),
		"Priority" integer,
		"Description"  varchar(255),
		"Status"  varchar(255),
		"Styles"  varchar(255),
		"PollID" integer,
		"TopicOwnerID" integer,
 		"TopicFlags" integer,
 		"ForumFlags" integer,
 		"MessageID" integer,
 		"Posted" timestampTZ, 		
 		"Message" text,
 		"UserID" integer,
 		"Position" integer,
 		"Indent" integer,
 		"IP" varchar(39),
 		"Flags" integer,
 		"EditReason" varchar(255) ,
 		"IsModeratorChanged" boolean,
 		"IsDeleted" boolean,
 		"DeleteReason" varchar(255),
		"BlogPostID" varchar(255),
		"ExternalMessageId" varchar(255),
		"ReferenceMessageId" varchar(255),
 		"UserName" varchar(255),
		"DisplayName" varchar(255),
		"Suspended" timestampTZ,
 		"Joined" timestampTZ,
 		"Avatar" varchar(100),
 		"Signature" text,
 		"Posts" integer,
 		"Points" integer,
		"ReputationVoteDate" timestampTZ,
		"IsGuest" bool,
 		"Views" integer,
 		"ForumID" integer,
 		"RankName" varchar(128),
 		"RankImage" varchar(100),
       	"Style"  varchar(255),
 		"Edited" timestampTZ,
 		"HasAttachments" integer,
		"HasAvatarImage" integer,
		"TotalRows" integer,
		"PageIndex" integer, 
		"FirstRowNumber" integer
);        
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','post_list_reverse10_return_type');
--GO
CREATE TYPE databaseSchema.post_list_reverse10_return_type AS
(
"Posted" timestampTZ,
"Subject" varchar(128),
"Message" text,
"UserID" integer,
"Flags" integer,
"UserName" varchar(128),
"UserDisplayName" varchar(128),
"Signature" text
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','rank_list_return_type');
--GO
CREATE TYPE databaseSchema.rank_list_return_type AS
(
  "RankID" integer,
  "BoardID" integer,
  "Name" varchar(128),
  "MinPosts" integer,
  "RankImage" varchar(128),
  "Flags" integer,
  "PMLimit" integer,
  "Style" varchar(256),
  "SortOrder" integer,
  "Description" varchar(128),
  "UsrSigChars" integer,
  "UsrSigBBCodes" varchar(255),
  "UsrSigHTMLTags"  varchar(255),
  "UsrAlbums" integer,
  "UsrAlbumImages" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_registry_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_registry_return_type AS (
    "RegistryID" integer,
    "Name" varchar(128),
    "Value" text,
    "BoardID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_replace_words_list_select');
--GO
CREATE TYPE databaseSchema.objectQualifier_replace_words_list_select  AS (
    "ID" integer,
    "BoardID" integer ,
    "BadWord" varchar(255),
    "GoodWord" varchar(255)
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_smiley_list_selecttype');
--GO
CREATE TYPE databaseSchema.objectQualifier_smiley_list_selecttype AS (
    "SmileyID" integer,
    "BoardID" integer,
    "Code" varchar(10),
    "Icon" varchar(128),
    "Emoticon" varchar(128),
    "SortOrder" int
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_smiley_listunique_selecttype');
--GO
CREATE TYPE databaseSchema.objectQualifier_smiley_listunique_selecttype AS (
"Icon" varchar(128), 
"Emoticon" varchar(128),
"Code" varchar(10),
"SortOrder" smallint);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_active_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_active_return_type AS
(
"ForumID" integer,
"TopicID" integer,
"TopicMovedID" integer,
"Posted" timestamp,
"LinkTopicID" integer,
"Subject" varchar(128),
"Status" varchar(255),
"Styles" varchar(255),
"Description" varchar(255),
"UserID" integer,
"Starter" varchar(128),
"StarterDisplay" varchar(128),
"NumPostsDeleted" integer,
"Replies" integer,
"Views" integer,
"LastPosted" timestamp,
"LastUserID" integer,
"LastUserName" varchar(128),
"LastUserDisplayName" varchar(128),
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastTopicID" integer,
"TopicFlags" integer,
"FavoriteCount" integer,
"Priority" smallint,
"PollID" integer,
"ForumName" varchar(128),
"ForumFlags" integer,
"FirstMessage" varchar(12000),
"StarterStyle"  varchar(255),
"LastUserStyle"  varchar(255),
"LastForumAccess"  timestampTZ,
"LastTopicAccess"  timestampTZ,
"TotalRows" integer,
"PageIndex" integer	  	     
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_unread_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_unread_return_type AS
(
"ForumID" integer,
"TopicID" integer,
"TopicMovedID" integer,
"Posted" timestamp,
"LinkTopicID" integer,
"Subject" varchar(128),
"Status" varchar(255),
"Styles" varchar(255),
"Description" varchar(255),
"UserID" integer,
"Starter" varchar(128),
"StarterDisplay" varchar(128),
"NumPostsDeleted" integer,
"Replies" integer,
"Views" integer,
"LastPosted" timestamp,
"LastUserID" integer,
"LastUserName" varchar(128),
"LastUserDisplayName" varchar(128),
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastTopicID" integer,
"TopicFlags" integer,
"FavoriteCount" integer,
"Priority" smallint,
"PollID" integer,
"ForumName" varchar(128),
"ForumFlags" integer,
"FirstMessage" varchar(12000),
"StarterStyle"  varchar(255),
"LastUserStyle"  varchar(255),
"LastForumAccess"  timestampTZ,
"LastTopicAccess"  timestampTZ,
"TotalRows" integer,
"PageIndex" integer	  	     
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_announcements_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_announcements_return_type AS
(
"Topic" varchar(128),
"LastPosted" timestampTZ,
"Posted" timestampTZ, 
"TopicID" integer,
"LastMessageID" integer,
"LastMessageFlags" integer,
"ForumID" integer,
"Flags" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_findnext_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_findnext_return_type AS
(
"TopicID" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pollgroup_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pollgroup_list_return_type AS
(
"Question"  varchar(255),
"PollGroupID" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_findprevnext_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_findprevnext_return_type AS
(
"TopicID"  integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_info_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_info_return_type AS (
    "TopicID" integer,
    "ForumID" integer,
    "UserID" integer,
    "UserName" varchar(128),
    "Posted" timestampTZ,
    "Topic" varchar(128),
    "Views" integer,
    "Priority" smallint,
    "PollID" integer,
    "TopicMovedID" integer,
    "LastPosted" timestampTZ,
    "LastMessageID" integer,    
    "LastUserID" integer,
    "LastUserName" varchar(128),
    "NumPosts" integer,
    "Flags" integer,
	"AnswerMessageID" integer,
	"LastMessageFlags" integer,
	"Description" varchar(255),
	"Status" varchar(255),
	"Styles" varchar(255),
	"IsLocked" boolean,
    "IsDeleted" boolean,
	"IsPersistent" boolean,
	"IsQuestion" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_latest_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_latest_return_type AS
(
"LastPosted" timestampTZ,
"ForumID" integer,
"Forum" varchar(100),
"Topic" varchar(128),
"Status" varchar(255),
"Styles" varchar(255),
"TopicID" integer,
"TopicMovedID" integer,
"UserID" integer,
"UserName" varchar(255),
"UserDisplayName" varchar(255),
"StarterIsGuest" boolean,
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastUserID" integer,
"NumPosts" integer,
"Posted"  timestampTZ,
"LastUserName" varchar(128),
"LastUserDisplayName" varchar(128),
"LastUserStyle"  varchar(255),
"LastUserIsGuest" boolean,
"LastForumAccess" timestampTZ,
"LastTopicAccess"  timestampTZ
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_rss_topic_latest_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_rss_topic_latest_return_type AS
(
"LastMessage" text, 
"LastPosted" timestampTZ,
"ForumID" integer,
"Forum" varchar(128),
"Topic" varchar(128),
"TopicID" integer,
"TopicMovedID" integer,
"UserID" integer,
"UserName" varchar(255),
"StarterIsGuest" boolean,
"UserDisplayName" varchar(255),
"LastMessageID" integer,
"LastMessageFlags" integer,
"LastUserID" integer,
"Posted" timestampTZ,
"LastUserName" varchar(255),
"LastUserDisplayName" varchar(255),
"LastUserIsGuest" boolean
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_list_return_type AS (   
    "ForumID" integer,
    "TopicID" integer,
    "Posted" timestampTZ,
    "LinkTopicID" integer,
    "TopicMovedID" integer,
	"FavoriteCount" integer,
    "Subject" varchar(255),
	"Description" varchar(255),
	"Status" varchar(255),
	"Styles" varchar(255),
    "UserID" integer,    
    "Starter" varchar(128),
	"StarterDisplay" varchar(128),
    "Replies" integer,
    "NumPostsDeleted" integer,  
    "Views" integer,
    "LastPosted" timestampTZ,   
    "LastUserID" integer,
    "LastUserName" varchar(128),
	"LastUserDisplayName" varchar(128),
    "LastMessageID" integer,
    "LastTopicID" integer,
    "TopicFlags" integer,
    "Priority" smallint,
    "PollID" integer,
    "ForumFlags" integer,
    "FirstMessage"   varchar(4000),	
    "StarterStyle"  varchar(255), 
    "LastUserStyle"  varchar(255),
    "LastForumAccess"  timestampTZ,
    "LastTopicAccess"  timestampTZ,
	"TotalRows" integer,
	"PageIndex" integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topics_byuser_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topics_byuser_return_type AS (  
    "ForumID" integer,
    "TopicID" integer,
	"TopicMovedID" integer,
    "Posted" timestampTZ,
    "LinkTopicID" integer,	
    "Subject" varchar(100),
	"Description" varchar(255),
	"Status"  varchar(255),
	"Styles"  varchar(255),
    "UserID" integer,    
    "Starter" varchar(255),
	"StarterDisplay" varchar(255),
	"NumPostsDeleted" integer,  
    "Replies" integer,   
    "Views" integer,
    "LastPosted" timestampTZ,   
    "LastUserID" integer,
    "LastUserName" varchar(255),
	"LastUserDisplayName" varchar(255),
    "LastMessageID" integer,
	"LastMessageFlags" integer,
    "LastTopicID" integer,
    "TopicFlags" integer,
	"FavoriteCount" integer,
    "Priority" smallint,
    "PollID" integer,
    "ForumName" varchar(255),	
	"ForumFlags" integer,
	"FirstMessage"  varchar(4000),
	"StarterStyle" varchar(255),
	"LastUserStyle" varchar(255),
	"LastForumAccess"  timestampTZ,
	"LastTopicAccess"   timestampTZ,
	"TotalRows" integer,
	"PageIndex" integer	  	     
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_unanswered_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_unanswered_rt AS (  
    "ForumID" integer,
    "TopicID" integer,
	"TopicMovedID" integer,
    "Posted" timestampTZ,
    "LinkTopicID" integer,	
    "Subject" varchar(100),
	"Description" varchar(255),
	"Status"  varchar(255),
	"Styles"  varchar(255),
    "UserID" integer,    
    "Starter" varchar(255),
	"StarterDisplay" varchar(255),
	"NumPostsDeleted" integer,  
    "Replies" integer,   
    "Views" integer,
    "LastPosted" timestampTZ,   
    "LastUserID" integer,
    "LastUserName" varchar(255),
	"LastUserDisplayName" varchar(255),
    "LastMessageID" integer,
	"LastMessageFlags" integer,
    "LastTopicID" integer,
    "TopicFlags" integer,
	"FavoriteCount" integer,
    "Priority" smallint,
    "PollID" integer,
    "ForumName" varchar(255),	
	"ForumFlags" integer,
	"FirstMessage"  varchar(4000),
	"StarterStyle" varchar(255),
	"LastUserStyle" varchar(255),
	"LastForumAccess"  timestampTZ,
	"LastTopicAccess"   timestampTZ,
    "TotalRows" integer,
    "PageIndex" integer	  	     
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_list_helper_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_list_helper_return_type AS (
    rowno integer,   
    topicid integer,   
    rowscount integer
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_listmessages_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_listmessages_return_type AS (
  "MessageID" integer,
    "TopicID" integer,
    "ReplyTo" integer,
    "Position" integer,
    "Indent" integer,
    "UserID" integer,
    "UserName" varchar(128),
	"UserDisplayName" varchar(128),
    "Posted" timestampTZ,
    "Message" text,
    "IP" varchar(39),
    "Edited" timestampTZ,
    "Flags" integer,
    "EditReason" varchar(100),
    "IsModeratorChanged" boolean,
    "DeleteReason" varchar(100),
    "IsDeleted" boolean,
    "IsApproved" boolean,
    "BlogPostID" varchar(128)
);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_prune_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_prune_return_type AS
("COUNT" integer);
--GO

select databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_save_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_save_return_type AS
(
 "TopicID" integer,
 "MessageID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_simplelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_simplelist_return_type AS
(
"TopicID" integer,
"Topic" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_accessmasks_return_type');
--GO
CREATE TYPE  databaseSchema.objectQualifier_user_accessmasks_return_type AS
(
"AccessMaskID" integer,
"AccessMaskName" varchar(128),
"ForumID" integer,
"ForumName" varchar(128),
"CategoryID" integer,
"ParentID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_activity_rank_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_activity_rank_return_type AS
(
"ID" integer,
"Name" varchar(128),
"NumOfPosts" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_adminsave_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_adminsave_return_type AS
(
"UserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_aspnet_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_aspnet_return_type AS
(
"UserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_avatarimage_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_avatarimage_return_type AS 
(
"UserID" integer,
"AvatarImage" bytea,
"AvatarImageType" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_changepassword_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_changepassword_return_type AS
(
"Success" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_emails_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_emails_return_type AS
(
"Email" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_find_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_find_return_type AS
(
  -- databaseSchema.objectQualifier_user_table_type
  "UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" varchar(36),
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "Culture" varchar(10), 
  "CultureUser" varchar(10),  
  "DailyDigest" boolean,
  "NotificationType" integer,
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean,
  "IsApproved" boolean,
  "IsActiveExcluded" boolean, 
  "IsGuest" boolean,
  "IsAdmin" boolean 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_get_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_get_return_type AS
(
"UserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_getpoints_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_getpoints_return_type AS
(
"Points" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_getsignature_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_getsignature_return_type AS
(
"Signature" text
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_list_return_type AS
(
  -- databaseSchema.objectQualifier_user_table_type 
  "UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" varchar(36),
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "CultureUser" varchar(10), 
  "Culture" varchar(10), 
  "DailyDigest" boolean,
  "NotificationType" integer,
  "IsFacebookUser" boolean,
  "IsTwitterUser" boolean, 
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean,
  "IsApproved" boolean,
  "IsActiveExcluded" boolean, 
  "RankName" varchar(128),
  "Style"  varchar(255),
  "NumDays" integer,
  "NumPostsForum" integer,
  "HasAvatarImage" int2,  
  "IsGuest" boolean,
  "IsHostAdmin" integer,
  "IsAdmin" integer,
  "IsForumModerator" boolean, 
  "IsModerator" boolean
);
--GO
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_admin_list_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_admin_list_rt AS
(
  -- databaseSchema.objectQualifier_user_table_type	
  	"UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" uuid,
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "CultureUser" varchar(10),  
  "DailyDigest" boolean,
  "NotificationType" integer,
  "IsFacebookUser" boolean,
  "IsTwitterUser" boolean,
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean,
  "RankName"  varchar(50),
  "Style"  varchar(255),
  "NumDays" integer,
  "NumPostsForum" integer,
  "HasAvatarImage" int2,  
  "IsAdmin" boolean,
  "IsHostAdmin" boolean,
  "IsForumModerator" boolean, 
  "IsModerator" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_listmembers_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_listmembers_return_type AS
(
 --  databaseSchema.objectQualifier_user_table_type 
 "UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" uuid,
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "CultureUser" varchar(10),  
  "DailyDigest" boolean,
  "NotificationType" integer,
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean,
  "IsApproved" boolean,
  "IsActiveExcluded" boolean,
  "RankName" varchar(128),
  "Style"  varchar(255),
  "TotalCount" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_listmedals_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_listmedals_return_type AS
(
"MedalID" integer,
"Name" varchar(128),
"Message" text,
"MedalURL" varchar(250),
"RibbonURL" varchar(250),
"SmallMedalURL" varchar(250),
"SmallRibbonURL" varchar(250),
"SmallMedalWidth" integer,
"SmallMedalHeight" integer,
"SmallRibbonWidth" integer,
"SmallRibbonHeight" integer,
"SortOrder" smallint,
"Hide" boolean,
"OnlyRibbon" boolean,
"Flags" integer,
"DateAwarded" timestampTZ 
);
--GO    

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_login_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_login_return_type AS
(
"UserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_medal_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_medal_list_return_type AS
(
"MedalID" integer,
"Name" varchar(128),
"MedalURL" varchar(250),
"RibbonURL" varchar(250),
"SmallMedalURL" varchar(250),
"SmallRibbonURL" varchar(250),
"SmallMedalWidth" integer,
"SmallMedalHeight" integer,
"SmallRibbonWidth" integer,
"SmallRibbonHeight" integer,
"SortOrder" integer,
"Flags" integer,
"UserName" varchar(128),
"DisplayName" varchar(128),
"UserID" integer,
"Message" text,
"MessageEx" text,
"Hide" boolean,
"OnlyRibbon" boolean,
"CurrentSortOrder" smallint,
"DateAwarded" timestampTZ 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_pmcount_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_pmcount_return_type AS
(
"NumberIn" integer,
"NumberOut" integer,
"NumberArchived" integer,
"NumberTotal" integer,
"NumberAllowed" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_recoverpassword_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_recoverpassword_return_type AS
(
"UserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_simplelist_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_simplelist_return_type AS
(
"UserID" integer,
"Name"  varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_userforum_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_userforum_list_return_type AS
(
  -- databaseSchema.objectQualifier_user_table_type
  "UserID" integer,
  "BoardID" integer,
  "ProviderUserKey" uuid,
  "Name" varchar(128),
  "Password" varchar(32),
  "Email" varchar(128),
  "Joined" timestampTZ,
  "LastVisit" timestampTZ,
  "IP" varchar(39),
  "NumPosts" integer,
  "TimeZone" integer,
  "Avatar" varchar(255),
  "Signature" text,
  "AvatarImage" bytea,
  "AvatarImageType" varchar(128),
  "RankID" integer,  
  "Suspended" timestampTZ,
  "LanguageFile" varchar(128),
  "ThemeFile" varchar(128),
  "OverrideDefaultThemes" boolean,
  "PMNotification" boolean,
  "Flags" integer,
  "Points" integer,
  "AutoWatchTopics" boolean,
  "DisplayName" varchar(128),
  "CultureUser" varchar(10),  
  "DailyDigest" boolean,
  "NotificationType" integer,
  "TextEditor" varchar(50),
  "UseSingleSignOn" boolean,
  "IsApproved" boolean,
  "IsActiveExcluded" boolean,
  "AccessMaskID" integer,  
  "Accepted" boolean,
  "Access" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_usergroup_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_usergroup_list_return_type AS
(
"GroupID" integer,
"Name" varchar(128),
"Style"  varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_userpmessage_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_userpmessage_list_return_type AS
(
"PMessageID" integer,
"FromUserID" integer,
"Created" timestampTZ,
"Subject" varchar(100),
"Body" text,
"Flags" integer,
"FromUser" varchar(128),
"ToUserID" integer,
"ToUser" varchar(128),
"IsRead" boolean,
"UserPMessageID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_watchforum_check_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_watchforum_check_return_type AS
(
"WatchForumID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_watchforum_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_watchforum_list_return_type AS
(
"WatchForumID" integer,
"ForumID" integer,
"UserID" integer,
"Created" timestampTZ,
"LastMail" timestampTZ,
"ForumName" varchar(128),
"Messages" integer,
"Topics" integer,
"LastPosted" timestampTZ,
"LastMessageID"  integer,
"LastTopicID" integer,
"LastUserID" integer,
"LastUserName" varchar(128),
"LastUserDisplayName" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_watchtopic_check_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_watchtopic_check_return_type AS
(
"WatchTopicID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_watchtopic_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_watchtopic_list_return_type AS
(
"WatchTopicID" integer,
"TopicID" integer,
"UserID" integer,
"Created" timestampTZ,
"LastMail" timestampTZ,
"TopicName" varchar(128),
"Replies" integer,
"Views" integer,
"LastPosted" timestampTZ,
"LastMessageID" integer,
"LastUserID" integer,
"LastUserName" varchar(128),
"LastUserDisplayName" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pageload_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pageload_return_type AS 
(
"ActiveUpdate" bool,
"PreviousVisit" timestampTZ,
"UserID" integer,
"ForumID" integer,
"IsAdmin" boolean,
"IsForumModerator" boolean,
"IsModerator"  boolean,
"IsGuestX"  boolean,
"LastActive" timestampTZ,
"ReadAccess" integer,			
"PostAccess" integer,
"ReplyAccess" integer,
"PriorityAccess" integer,
"PollAccess" integer,
"VoteAccess" integer,
"ModeratorAccess" integer,
"EditAccess" integer,
"DeleteAccess" integer,
"UploadAccess" integer,		
"DownloadAccess" integer,
"IsCrawler" boolean,
"IsMobileDevice" boolean,		
"CategoryID" integer,
"CategoryName" varchar(128),
"ForumName" varchar(128),
"ForumTheme" varchar(100),
"TopicID" integer,
"TopicName" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_lazydata_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_lazydata_return_type AS 
(
"ProviderUserKey" varchar(64),
"UserFlags" integer,
"UserName" varchar(128),
"DisplayName" varchar(128),
"Suspended" timestampTZ,
"ThemeFile" varchar(128),
"LanguageFile" varchar(128),
"UseSingleSignOn" bool,
"IsDirty" bool,
"TextEditor" varchar(3),
"TimeZoneUser" integer,
"CultureUser" varchar(10),
"IsFacebookUser" boolean,
"IsTwitterUser" boolean,
"IsGuest" boolean,
"MailsPending" integer,
"UnreadPrivate" integer,
"LastUnreadPm"  timestampTZ,
"PendingBuddies" integer,
"LastPendingBuddies"   timestampTZ,
"UserStyle"  varchar(255),
"NumAlbums" integer,
"UsrAlbums"  integer,
"UserHasBuddies" boolean,
"BoardVoteAccess" boolean,
"Reputation" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_rsstopic_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_rsstopic_list_return_type AS
(
"Topic" varchar(128),
"TopicID" integer, 
"Name" varchar(128), 
"LastPosted" timestampTZ,
"LastUserID" integer,
"LastMessageID" integer,
"LastMessageFlags" integer
);
--GO
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_last_posted_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_last_posted_return_type AS
(
 lasttopicid integer,
 lastposted timestampTZ 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_vaccess_combo_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_vaccess_combo_return_type AS
(
   "UserID" integer,
   "ForumID" integer,
   "IsAdmin" integer,
   "IsForumModerator" integer,
   "IsModerator"  integer,
   "ReadAccess" integer,			
   "PostAccess" integer,
   "ReplyAccess" integer,
   "PriorityAccess" integer,
   "PollAccess" integer,
   "VoteAccess" integer,
   "ModeratorAccess" integer,
   "EditAccess" integer,
   "DeleteAccess" integer,
   "UploadAccess" integer,		
   "DownloadAccess" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_ignoreuser_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_ignoreuser_return_type AS
(
"UserID" integer,
"IgnoredUserID" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_shoutbox_getmessages_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_shoutbox_getmessages_return_type AS
(
"ShoutBoxMessageID" integer,	
"UserID" integer,
"UserName" varchar(255),
"DisplayName" varchar(255),
"Message" text,
"Date" timestampTZ,
"Style"  varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_getthanks_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_getthanks_return_type AS
(		
"UserID" integer, 
"ThanksDate" timestampTZ, 
"Name"  varchar(128),
"DisplayName"  varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_getthanksto_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_user_getthanksto_return_type AS
(		
thankstonumber integer, 
thankstopostsnumber integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_pageload_guests_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_pageload_guests_type AS
(		
ici_userid integer,
ici_rowcount integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_group_rank_style_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_group_rank_style_type AS
(
	"LegendID" integer,
	"Name" varchar(128),
	"Style" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_listreporters_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_listreporters_return_type AS
(
	"UserID" integer,
	"UserName" varchar(128),
	"UserDisplayName" varchar(128),
	"ReportedNumber" integer,
	"ReportText" text
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_getallthanks_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_getallthanks_return_type AS
(
	"FromUserID" integer,
	"ThanksDate" timestampTZ,
	"MessageID" integer,
	"ToUserID" integer,
        "ThanksFromUserNumber" integer,
        "ThanksToUserNumber" integer,
        "ThanksToUserPostsNumber" integer  
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_favorite_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_favorite_list_return_type AS
(
	"TopicID" integer
);
--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topic_favorite_details_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topic_favorite_details_return_type AS
(
	"ForumID" integer,
	"TopicID" integer,
	"TopicMovedID" integer,
	"Posted"  timestampTZ,
	"LinkTopicID" integer,
	"Subject" varchar(255),
	"Status" varchar(255),
	"Styles" varchar(255),
	"Description" varchar(255),
	"UserID" integer,
	"Starter"  varchar(255),
	"StarterDisplay"  varchar(255),
	"NumPostsDeleted" integer,
	"Replies" integer,
	"Views" integer,
	"LastPosted"  timestampTZ,
	"LastUserID" integer,
	"LastUserName"  varchar(255),
	"LastUserDisplayName"  varchar(255),
	"LastMessageID"  integer,
	"LastMessageFlags"  integer,
	"LastTopicID" integer,
	"TopicFlags" integer,
	"FavoriteCount" integer,
	"Priority" integer,
	"PollID" integer,
	"ForumName"  varchar(128),	
	"ForumFlags" integer,
	"FirstMessage" text,
	"StarterStyle"   varchar(255),
	"LastUserStyle"   varchar(255),
	"LastForumAccess"   timestampTZ,
	"LastTopicAccess"   timestampTZ,
	"TotalRows" integer,
	"PageIndex" integer		
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_buddy_addrequest_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_buddy_addrequest_return_type AS
(
	"i_paramoutput" varchar(128),
	"i_approved" boolean
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_buddy_approverequest_return_type');
--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_buddy_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_buddy_list_return_type AS
(
    "UserID" integer,
    "BoardID" integer,
    "Name" varchar(128),
    "Joined" timestampTZ,
    "NumPosts" integer,
    "RankName" varchar(128),
    "Approved" boolean,
    "FromUserID" integer,
    "Requested" timestampTZ         
	
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_buddy_remove_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_buddy_remove_return_type AS
(
"i_paramoutput" varchar(128)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_album_list_return_type AS
(
"AlbumID" integer,
"UserID" integer,
"Title" varchar(255),
"CoverImageID" integer,
"Updated"  timestampTZ 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_getstats_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_album_getstats_return_type AS
(
albumnumber integer,
imagenumber integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_image_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_album_image_list_return_type AS
(
 "ImageID" integer,
 "AlbumID" integer,
 "Caption" varchar(255),	
 "FileName"  varchar(255),
 "Bytes" integer,
 "ContentType"  varchar(50),
 "Uploaded" timestampTZ,
 "Downloads" integer,
 "UserID" integer
 );
 --GO
 SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_image_list2_return_type');
--GO
 
 SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_image_list_return_type2');
 --GO
 
CREATE TYPE databaseSchema.objectQualifier_album_image_list_return_type2 AS
(
 "ImageID" integer,
 "AlbumID" integer,
 "Caption" varchar(255),	
 "FileName"  varchar(255),
 "Bytes" integer,
 "ContentType"  varchar(50),
 "Uploaded" timestampTZ,
 "Downloads" integer
 );
 --GO
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_getsignaturedata_return_type');
--GO

CREATE TYPE databaseSchema.objectQualifier_user_getsignaturedata_return_type AS
(
 "UsrSigChars" integer,
 "UsrSigBBCodes" varchar(255),	
 "UsrSigHTMLTags"  varchar(255)
 );
 --GO
 
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_getalbumsdata_return_type');
--GO

CREATE TYPE databaseSchema.objectQualifier_user_getalbumsdata_return_type AS
(
 "NumAlbums" integer,
 "NumImages" integer,
 "UsrAlbums" integer,	
 "UsrAlbumImages"  integer
 );
 --GO

 SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_secdata_return_type');
 --GO

CREATE TYPE databaseSchema.objectQualifier_message_secdata_return_type AS
(
 "MessageID" integer,
 "UserID" integer,
 "Name" varchar(128),
 "UserDisplayName" varchar(255),
 "Message" text,
 "Posted" timestampTZ,
 "TopicID" integer,
 "ForumID" integer,	
 "Topic"   varchar(128),
 "Priority" integer,
 "Flags" integer,
 "Edited" timestampTZ,
 "TopicFlags" integer,
 "EditReason"   varchar(128),
 "Position" integer,
 "IsModeratorChanged" boolean,
 "DeleteReason"   varchar(128),
 "BlogPostID" integer,
 "PollID" integer,
 "IP"   varchar(39),
 "EditedBy" integer
 );
 --GO
 
SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_messagehistory_list_return_type');
 --GO

CREATE TYPE databaseSchema.objectQualifier_messagehistory_list_return_type AS
(
  "MessageID"		integer,
  "Message"			text,
  "IP"				varchar (15),
  "Edited"			timestampTZ,  	
  "EditReason"      varchar(128),
  "IsModeratorChanged"  boolean,
  "Flags" integer,  
  "EditedBy"		integer,
  "UserID" integer, 
  "UserName" varchar(255), 
  "UserDisplayName" varchar(255), 
  "ForumID" integer,  
  "TopicID" integer, 
  "Topic" text,  
  "Posted" timestampTZ 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_user_viewallthanks_return_type');
 --GO
 
	CREATE TYPE databaseSchema.objectQualifier_user_viewallthanks_return_type AS
(
  "ThanksFromUserID" integer,
  "ThanksToUserID"	 integer,
  "MessageID"		 integer,
  "ForumID"		     integer,
  "TopicID"		     integer,
  "Topic"		     varchar(128),
  "UserID"		     integer, 
  "Posted"		     timestampTZ,  	
  "Message"          text, 
  "Flags"            integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_message_gettextbyids_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_message_gettextbyids_return_type AS
(
"MessageID"  integer,
"Message" text
);
--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_recent_users_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_recent_users_rt AS
(
"UserID"  integer,
"UserName" varchar(255),
"UserDisplayName"  varchar(255),
"IsCrawler" integer,
"UserCount" integer,
"IsHidden" smallint,
"Style"  varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_listread_tmp');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_listread_tmp AS
(
"UserID"  integer,
"ForumID" integer,
"ParentID" integer,
"ReadAccess" smallint
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topicstatus_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topicstatus_list_return_type AS
(
"TopicStatusID"  integer,
"TopicStatusName" varchar(255),
"BoardID" integer,
"DefaultDescription" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_topicstatus_list_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_topicstatus_list_return_type AS
(
"TopicStatusID"  integer,
"TopicStatusName" varchar(255),
"BoardID" integer,
"DefaultDescription" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_dbinfo_usertype_fields_info_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_dbinfo_usertype_fields_info_rt AS
(
"ColumnName"  varchar(255),
"ColumnType" varchar(255),
"NotNull" boolean ,
"HasDefinition" boolean,
"Npacl" varchar(255)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_album_images_by_user_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_album_images_by_user_rt AS
(
"ImageID" integer,
"AlbumID" integer,
"Caption" varchar(255),	
"FileName" varchar(255),
"Bytes" integer,
"ContentType" varchar(50),
"Uploaded" timestampTZ,
"Downloads" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_ns_getsubtree_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_ns_getsubtree_rt AS
(
"ForumID"  integer,
"ParentID" integer,
"Level" integer 
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_forum_ns_getchildren_rt');
--GO
CREATE TYPE databaseSchema.objectQualifier_forum_ns_getchildren_rt AS
(
"CategoryID"  integer,
"CategoryName" varchar(255),
"Title" varchar(255),
"ForumID"  integer,
"ParentID" integer,
"Level" integer 
);
--GO


