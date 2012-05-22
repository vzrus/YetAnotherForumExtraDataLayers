-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012

/*Here we add or check foreign keys*/
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}delete_foreign_keys_by_table;
CREATE PROCEDURE {databaseName}.{objectQualifier}delete_foreign_keys_by_table(pSchema VARCHAR(64), pTable VARCHAR(64))
  DETERMINISTIC
  MODIFIES SQL DATA
  SQL SECURITY INVOKER
BEGIN
  DECLARE  done BOOLEAN DEFAULT FALSE;
  DECLARE  rSchema, rTable, rConstraint VARCHAR(64);
  
  DECLARE  dependencies CURSOR FOR
  SELECT   TABLE_SCHEMA, TABLE_NAME, CONSTRAINT_NAME
  FROM     information_schema.KEY_COLUMN_USAGE
  WHERE    REFERENCED_TABLE_SCHEMA = pSchema
  AND      REFERENCED_TABLE_NAME = pTable;
  
  DECLARE  CONTINUE HANDLER FOR SQLSTATE '02000' SET done = TRUE;
  
  OPEN dependencies;
  dependency_loop: LOOP
       FETCH dependencies INTO rSchema, rTable, rConstraint;
       IF `done` THEN LEAVE dependency_loop; END IF;
       SET @delDeps_query := CONCAT('ALTER TABLE ', rSchema, '.', rTable,
                                    ' DROP FOREIGN KEY ', rConstraint);
       PREPARE delDeps_stmt FROM @delDeps_query;
       EXECUTE delDeps_stmt;
       DEALLOCATE PREPARE delDeps_stmt;
  END LOOP dependency_loop;
  CLOSE dependencies;

END;

/*Here we add or check foreign keys*/

DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_fkeys;

CREATE PROCEDURE {databaseName}.{objectQualifier}add_or_check_fkeys(
fk_t_name VARCHAR(99),
fk_c_name VARCHAR(99),
fk_rt_name VARCHAR(99),
fk_rc_name VARCHAR(99),
fk_k_name VARCHAR(99),
fk_d_action VARCHAR(20),
fk_u_action VARCHAR(20)
)
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.TABLE_CONSTRAINTS WHERE CONSTRAINT_SCHEMA = DATABASE() AND LOWER(CONSTRAINT_NAME) = LOWER(fk_k_name)) THEN
set @fk_t_name = fk_t_name ;
set @fk_rt_name = fk_rt_name ;
set @fk_c_name = fk_c_name ;
set @fk_rc_name = fk_rc_name ;
set @fk_d_action = fk_d_action ;
set @fk_u_action = fk_u_action ;
set @fk_k_name = fk_k_name;

set @fk_create_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@fk_t_name,' ADD CONSTRAINT `',@fk_k_name, '` FOREIGN KEY `',@fk_k_name, '` (`',@fk_c_name,
'`) REFERENCES {databaseName}.`{objectQualifier}',@fk_rt_name,'`(`',@fk_rc_name,'`) ',
' ON DELETE ',@fk_d_action, ' ON UPDATE ',@fk_u_action,';');

prepare fk_check_statement from @fk_create_string ;
execute fk_check_statement ;
deallocate prepare fk_check_statement ;

END IF;
END;
--GO

CALL {databaseName}.{objectQualifier}delete_foreign_keys_by_table('{databaseName}','Topic');
--GO

CALL {databaseName}.{objectQualifier}add_or_check_fkeys('AccessMask','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}AccessMask_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Active','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Active_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Active','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}Active_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Active','TopicID','Topic','TopicID','FK_{databaseName}_{objectQualifier}Active_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Active','UserID','User','UserID','FK_{databaseName}_{objectQualifier}Active_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Attachment','MessageID','Message','MessageID','FK_{databaseName}_{objectQualifier}Attachment_{objectQualifier}Message','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('BannedIP','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}BannedIP_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('BBCode','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}BBCode_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Buddy','FromUserID','User','UserID','FK_{databaseName}_{objectQualifier}Buddy_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Category','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Category_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('CheckEmail','UserID','User','UserID','FK_{databaseName}_{objectQualifier}CheckEmail_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
-- v10
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('EventLog','UserID','User','UserID','FK_{databaseName}_{objectQualifier}EventLog_{objectQualifier}User','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Extension','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Extension_{objectQualifier}Board','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','ParentID','Forum','ForumID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','CategoryID','Category','CategoryID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}Category','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','LastMessageID','Message','MessageID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}Message','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','LastTopicID','Topic','TopicID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','LastUserID','User','UserID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('ForumAccess','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}ForumAccess_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('ForumAccess','GroupID','Group','GroupID','FK_{databaseName}_{objectQualifier}ForumAccess_{objectQualifier}Group','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('ForumAccess','AccessMaskID','AccessMask','AccessMaskID','FK_{databaseName}_{objectQualifier}ForumAccess_{objectQualifier}AccessMask','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Group','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Group_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Message','ReplyTo','Message','MessageID','FK_{databaseName}_{objectQualifier}Message_{objectQualifier}Message','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Message','TopicID','Topic','TopicID','FK_{databaseName}_{objectQualifier}Message_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Message','UserID','User','UserID','FK_{databaseName}_{objectQualifier}Message_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('NntpForum','NntpServerID','NntpServer','NntpServerID','FK_{databaseName}_{objectQualifier}NntpForum_{objectQualifier}NntpServer','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('NntpForum','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}NntpForum_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('NntpServer','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}NntpServer_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('NntpTopic','NntpForumID','NntpForum','NntpForumID','FK_{databaseName}_{objectQualifier}NntpTopic_{objectQualifier}NntpForum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('NntpTopic','TopicID','Topic','TopicID','FK_{databaseName}_{objectQualifier}NntpTopic_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('PMessage','FromUserID','User','UserID','FK_{databaseName}_{objectQualifier}PMessage_{objectQualifier}User1','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Poll','PollGroupID','PollGroupCluster','PollGroupID','FK_{databaseName}_{objectQualifier}Poll_{objectQualifier}PollGroupID','NO ACTION','CASCADE');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','PollID','PollGroupCluster','PollGroupID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}PollGroupID','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Forum','PollGroupID','PollGroupCluster','PollGroupID','FK_{databaseName}_{objectQualifier}Forum_{objectQualifier}PollGroupID','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Poll','PollGroupID','PollGroupCluster','PollGroupID','FK_{databaseName}_{objectQualifier}Poll_{objectQualifier}PollGroupID','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('PollVote','PollID','Poll','PollID','FK_{databaseName}_{objectQualifier}PollVote_{objectQualifier}Poll','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Rank','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Rank_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Registry','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Registry_{objectQualifier}Board','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Smiley','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}Smiley_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Thanks','ThanksFromUserID','User','UserID','FK_{databaseName}_{objectQualifier}Thanks_{objectQualifier}User','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}Forum','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','LastMessageID','Message','MessageID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}Message','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','PollID','PollGroupCluster','PollGroupID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}UserID','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','TopicMovedID','Topic','TopicID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','UserID','User','UserID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Topic','LastUserID','User','UserID','FK_{databaseName}_{objectQualifier}Topic_{objectQualifier}User2','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('WatchTopic','TopicID','Topic','TopicID','FK_{databaseName}_{objectQualifier}WatchTopic_{objectQualifier}Topic','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('WatchTopic','UserID','User','UserID','FK_{databaseName}_{objectQualifier}WatchTopic_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('WatchForum','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}WatchForum1_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('WatchForum','UserID','User','UserID','FK_{databaseName}_{objectQualifier}WatchForum1_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserGroup','GroupID','Group','GroupID','FK_{databaseName}_{objectQualifier}UserGroup_{objectQualifier}Group','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserGroup','UserID','User','UserID','FK_{databaseName}_{objectQualifier}UserGroup_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserForum','ForumID','Forum','ForumID','FK_{databaseName}_{objectQualifier}UserForum_{objectQualifier}Forum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserForum','AccessMaskID','AccessMask','AccessMaskID','FK_{databaseName}_{objectQualifier}UserForum_{objectQualifier}AccessMask','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserForum','UserID','User','UserID','FK_{databaseName}_{objectQualifier}UserForum_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('Choice','PollID','Poll','PollID','FK_{databaseName}_{objectQualifier}Choice_{objectQualifier}Poll','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('User','RankID','Rank','RankID','FK_{databaseName}_{objectQualifier}User_{objectQualifier}Rank','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('User','BoardID','Board','BoardID','FK_{databaseName}_{objectQualifier}User_{objectQualifier}Board','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserPMessage','UserID','User','UserID','FK_{databaseName}_{objectQualifier}UserPMessage_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserPMessage','PMessageID','PMessage','PMessageID','FK_{databaseName}_{objectQualifier}UserPMessage_{objectQualifier}PMessage','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserAlbumImage','AlbumID','UserAlbum','AlbumID','FK_{databaseName}_{objectQualifier}UserAlbumImage_{objectQualifier}UserAlbum','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserAlbum','AlbumID','User','UserID','FK_{databaseName}_{objectQualifier}UserAlbum_{objectQualifier}User','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('MessageHistory','MessageID','Message','MessageID','FK_{databaseName}_{objectQualifier}MessageHistory_{objectQualifier}Message','NO ACTION','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('UserProfile','UserID','User','UserID','FK_{databaseName}_{objectQualifier}UserProfile_{objectQualifier}User','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('AdminPageUserAccess','UserID','User','UserID','FK_{databaseName}_{objectQualifier}AdminPageUserAccess_{objectQualifier}User','CASCADE','NO ACTION');
--GO
CALL {databaseName}.{objectQualifier}add_or_check_fkeys('EventLogGroupAccess','GroupID','Group','GroupID','FK_{databaseName}_{objectQualifier}EventLogGroupAccess_{objectQualifier}Group','CASCADE','NO ACTION');
--GO

DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_fkeys;
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}delete_foreign_keys_by_table;
/*ALTER TABLE {databaseName}.{objectQualifier}Message 
DROP FOREIGN KEY `FK_{databaseName}_{objectQualifier}Message_{objectQualifier}Message` ;*/