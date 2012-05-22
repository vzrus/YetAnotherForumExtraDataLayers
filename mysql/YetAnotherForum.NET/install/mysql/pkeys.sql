-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012


DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_pkeys;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}add_or_check_pkeys(
pk_t_name VARCHAR(99),
pk_s_modify VARCHAR(99),
pk_c_name VARCHAR(99),
pk_c2_name VARCHAR(99)
)
BEGIN

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS T WHERE T.CONSTRAINT_TYPE = 'PRIMARY KEY' AND
T.CONSTRAINT_SCHEMA = '{databaseName}'
AND LOWER(T.TABLE_NAME) = LOWER(CONCAT('{objectQualifier}',pk_t_name))
AND T.CONSTRAINT_TYPE = 'PRIMARY KEY') THEN

set @pk_t_name = pk_t_name ;
set @pk_c_name = pk_c_name ;
set @pk_c2_name = pk_c2_name ;

if pk_c2_name is null then
set @fk_create_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@pk_t_name,' ADD PRIMARY KEY  (`',@pk_c_name,'`);');
else
set @fk_create_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@pk_t_name,' ADD PRIMARY KEY  (`',@pk_c_name,'`,`',@pk_c2_name,'`);');
end if;

prepare fk_check_statement from @fk_create_string ;
execute fk_check_statement ;
deallocate prepare fk_check_statement ;

if pk_s_modify is not null then
set @pk_s_modify = pk_s_modify ;

set @pk_modify_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@pk_t_name,' MODIFY COLUMN  `',@pk_c_name, ' `',@pk_s_modify, '`;');

prepare pk_modify_statement from @pk_modify_string ;
execute pk_modify_statement ;
deallocate prepare pk_modify_statement ;
end if;

END IF;
END;

--GO


CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('AccessMask','INT NOT NULL AUTO_INCREMENT','AccessMaskID',null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Active',null,'SessionID', 'BoardID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Attachment','INT NOT NULL AUTO_INCREMENT','AttachmentID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('BannedIP','INT NOT NULL AUTO_INCREMENT','ID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('BBCode','INT NOT NULL AUTO_INCREMENT','BBCodeID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Board','INT NOT NULL AUTO_INCREMENT','BoardID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Buddy','INT NOT NULL AUTO_INCREMENT','ID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Category','INT NOT NULL AUTO_INCREMENT','CategoryID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('CheckEmail','INT NOT NULL AUTO_INCREMENT','CheckEmailID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Choice','INT NOT NULL AUTO_INCREMENT','ChoiceID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('EventLog','INT NOT NULL AUTO_INCREMENT','EventLogID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Extension','INT NOT NULL AUTO_INCREMENT','ExtensionID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('FavoriteTopic','INT NOT NULL AUTO_INCREMENT','ID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Forum','INT NOT NULL AUTO_INCREMENT','ForumID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('ForumAccess',null,'GroupID', 'ForumID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Group','INT NOT NULL AUTO_INCREMENT','GroupID', null);
--GO 
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('IgnoreUser',null,'UserID', 'IgnoredUserID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Mail','INT NOT NULL AUTO_INCREMENT','MailID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Medal','INT NOT NULL AUTO_INCREMENT','MedalID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Message','INT NOT NULL AUTO_INCREMENT','MessageID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('MessageReportedAudit','INT NOT NULL AUTO_INCREMENT','LogID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('NntpForum','INT NOT NULL AUTO_INCREMENT','NntpForumID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('NntpServer','INT NOT NULL AUTO_INCREMENT','NntpServerID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('NntpTopic','INT NOT NULL AUTO_INCREMENT','NntpTopicID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('PMessage','INT NOT NULL AUTO_INCREMENT','PMessageID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Poll','INT NOT NULL AUTO_INCREMENT','PollID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('PollVote','INT NOT NULL AUTO_INCREMENT','PollVoteID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Rank','INT NOT NULL AUTO_INCREMENT','RankID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Registry','INT NOT NULL AUTO_INCREMENT','RegistryID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Replace_Words','INT NOT NULL AUTO_INCREMENT','ID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('ShoutboxMessage','INT NOT NULL AUTO_INCREMENT','ShoutBoxMessageID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Smiley','INT NOT NULL AUTO_INCREMENT','SmileyID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Thanks','INT NOT NULL AUTO_INCREMENT','ThanksID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('Topic','INT NOT NULL AUTO_INCREMENT','TopicID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('User','INT NOT NULL AUTO_INCREMENT','UserID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserAlbum','INT NOT NULL AUTO_INCREMENT','AlbumID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserAlbumImage','INT NOT NULL AUTO_INCREMENT','ImageID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserForum',null,'UserID', 'ForumID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserGroup',null,'UserID', 'GroupID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserPMessage','INT NOT NULL AUTO_INCREMENT','UserPMessageID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('WatchForum','INT NOT NULL AUTO_INCREMENT','WatchForumID', null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('WatchTopic','INT NOT NULL AUTO_INCREMENT','WatchTopicID', null);
--GO

CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('ActiveAccess',null,'UserID', 'ForumID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserProfile',null,'UserID', 'ApplicationName');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('ForumReadTracking',null,'UserID', 'ForumID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('TopicReadTracking',null,'UserID', 'TopicID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('GroupMedal',null,'MedalID', 'GroupID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('UserMedal',null,'MedalID', 'UserID');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('MessageHistory',null,'MessageID', 'Edited');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('MessageReported',null,'MessageID',null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('MessageReportedAudit',null,'LogID',null);
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('AdminPageUserAccess',null,'UserID', 'PageName');
--GO
CALL  {databaseName}.{objectQualifier}add_or_check_pkeys('EventLogGroupAccess',null,'GroupID', 'EventTypeID');
--GO
DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_pkeys;
--GO
