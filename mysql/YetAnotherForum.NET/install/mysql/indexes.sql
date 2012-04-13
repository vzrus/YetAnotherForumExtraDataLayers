-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012

DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_ukeys;
--GO
CREATE PROCEDURE {databaseName}.{objectQualifier}add_or_check_ukeys(
pk_t_name VARCHAR(99),
pk_s_modify VARCHAR(99),
pk_c_name VARCHAR(99),
pk_c2_name VARCHAR(99)
)
BEGIN

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS T WHERE T.CONSTRAINT_TYPE = 'PRIMARY KEY' AND
T.CONSTRAINT_SCHEMA = '{databaseName}'
AND LOWER(T.TABLE_NAME) = LOWER(CONCAT('{objectQualifier}',pk_t_name))
AND T.CONSTRAINT_NAME = 'PRIMARY') THEN

set @pk_t_name = pk_t_name ;
set @pk_c_name = pk_c_name ;


if pk_c2_name is null then
set @fk_create_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@pk_t_name,' ADD PRIMARY KEY  (`',@pk_c_name,'`);');
else
set @fk_create_string = concat('ALTER TABLE {databaseName}.{objectQualifier}',
@pk_t_name,' ADD PRIMARY KEY  (`',@pk_c_name,'`,`',@pk_c_name,'`);');
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

DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_indexes;
--GO
CREATE PROCEDURE {databaseName}.{objectQualifier}add_or_check_indexes()
BEGIN

SET foreign_key_checks=0; 

/*ADD  INDEXES AT FIRST INSTALL*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}BannedIP' AND S.TABLE_NAME=LOWER('{objectQualifier}BannedIP') AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Mask')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}BannedIP 
ADD UNIQUE INDEX  `IX_{databaseName}_{objectQualifier}BannedIP` (`BoardID`, `Mask`);

END IF;

 /* Thanks - it gives duplicate entry 

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Thanks_UserID' AND S.TABLE_NAME=LOWER('{objectQualifier}Thanks') AND (S.COLUMN_NAME='ThanksToUserID' OR  S.COLUMN_NAME='ThanksFromUserID')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Thanks
ADD UNIQUE INDEX  `IX_{databaseName}_{objectQualifier}Thanks_UserID` (`ThanksFromUserID`, `ThanksToUserID`);

END IF; 

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}ActiveAccess_UserID_Forum' AND S.TABLE_NAME=LOWER('{objectQualifier}ActiveAccess') AND (S.COLUMN_NAME='UserID' OR  S.COLUMN_NAME='ForumID') LIMIT 1) THEN

ALTER TABLE {databaseName}.{objectQualifier}ActiveAccess
ADD UNIQUE INDEX  `IX_{databaseName}_{objectQualifier}ActiveAccess_UserID_Forum` (`UserID`,`ForumID`);

END IF;*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}MessageHistory_Edited_MessageID' AND S.TABLE_NAME=LOWER('{objectQualifier}MessageHistory') AND (S.COLUMN_NAME='Edited' OR  S.COLUMN_NAME='MessageID') LIMIT 1) THEN

ALTER TABLE {databaseName}.{objectQualifier}MessageHistory
ADD INDEX  `IX_{databaseName}_{objectQualifier}MessageHistory_Edited_MessageID` (`Edited`);

END IF;

/* IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}ForumReadTracking_UserID_ForumID' AND S.TABLE_NAME=LOWER('{objectQualifier}ForumReadTracking') AND (S.COLUMN_NAME='UserID' OR  S.COLUMN_NAME='ForumID') LIMIT 1) THEN

ALTER TABLE {databaseName}.{objectQualifier}ForumReadTracking
ADD  INDEX  `IX_{databaseName}_{objectQualifier}ForumReadTracking_UserID_ForumID` (`UserID`,`ForumID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}TopicReadTracking_UserID_TopicID' AND S.TABLE_NAME=LOWER('{objectQualifier}TopicReadTracking') AND (S.COLUMN_NAME='UserID' OR  S.COLUMN_NAME='TopicID') LIMIT 1) THEN

ALTER TABLE {databaseName}.{objectQualifier}TopicReadTracking
ADD  INDEX  `IX_{databaseName}_{objectQualifier}TopicReadTracking_UserID_TopicID` (`UserID`,`TopicID`);

END IF; */


-- Buddies 

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Buddy_UserID' AND S.TABLE_NAME=LOWER('{objectQualifier}Buddy') AND (S.COLUMN_NAME='ToUserID' OR  S.COLUMN_NAME='FromUserID')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Buddy
ADD UNIQUE INDEX  `IX_{databaseName}_{objectQualifier}Buddy_UserID` (`FromUserID`, `ToUserID`);

END IF;

/*CheckEmail*/

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE INDEX_SCHEMA='{databaseName}' AND TABLE_NAME ='{objectQualifier}checkemail' AND S.COLUMN_NAME='Hash' AND INDEX_NAME='IX_{databaseName}_{objectQualifier}CheckEmail') THEN

ALTER TABLE {databaseName}.{objectQualifier}CheckEmail 
ADD 
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}CheckEmail` (`Hash`);

END IF;

/*Category*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Category' AND S.TABLE_NAME='{objectQualifier}category' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Category 
ADD UNIQUE INDEX `IX_{databaseName}_{objectQualifier}Category` (`BoardID`, `Name`);

END IF;

IF NOT EXISTS(SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE INDEX_SCHEMA='{databaseName}' AND TABLE_NAME ='{objectQualifier}category' AND S.COLUMN_NAME='BoardID' AND INDEX_NAME='IX_{databaseName}_{objectQualifier}Category_BoardID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Category 
ADD INDEX `IX_{databaseName}_{objectQualifier}Category_BoardID` (`BoardID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Category_Name' AND S.TABLE_NAME='{objectQualifier}category' AND S.COLUMN_NAME='Name') THEN

ALTER TABLE {databaseName}.{objectQualifier}Category 
ADD INDEX `IX_{databaseName}_{objectQualifier}Category_Name` (`Name`);

END IF;

/*Forum*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Forum' AND S.TABLE_NAME='{objectQualifier}forum' AND (S.COLUMN_NAME='ParentID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Forum 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}Forum` (`ParentID`, `Name`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Forum_CategoryID' AND S.TABLE_NAME='{objectQualifier}forum' AND S.COLUMN_NAME='CategoryID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Forum 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Forum_CategoryID` (`CategoryID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Forum_Flags' AND S.TABLE_NAME='{objectQualifier}forum' AND S.COLUMN_NAME='Flags') THEN

ALTER TABLE {databaseName}.{objectQualifier}Forum 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Forum_Flags` (`Flags`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Forum_ParentID' AND S.TABLE_NAME='{objectQualifier}forum' AND S.COLUMN_NAME='ParentID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Forum 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Forum_ParentID` (`ParentID`);

END IF;

/*ForumAccess*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}ForumAccess_ForumID' AND S.TABLE_NAME='{objectQualifier}forumaccess' AND S.COLUMN_NAME='ForumID') THEN

ALTER TABLE {databaseName}.{objectQualifier}ForumAccess 
ADD
INDEX `IX_{databaseName}_{objectQualifier}ForumAccess_ForumID` (`ForumID`);

END IF;

/*Group*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Group' AND S.TABLE_NAME='{objectQualifier}group' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Group 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}Group` (`BoardID`, `Name`);

END IF;

/*Message*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Message_Flags' AND S.TABLE_NAME='{objectQualifier}message' AND S.COLUMN_NAME='Flags') THEN

ALTER TABLE {databaseName}.{objectQualifier}Message 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Message_Flags` (`Flags`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Message_TopicID' AND S.TABLE_NAME='{objectQualifier}message' AND S.COLUMN_NAME='TopicID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Message 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Message_TopicID` (`TopicID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Message_UserID' AND S.TABLE_NAME='{objectQualifier}message' AND S.COLUMN_NAME='UserID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Message 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Message_UserID` (`UserID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Message_Posted_Desc' AND S.TABLE_NAME='{objectQualifier}message' AND S.COLUMN_NAME='Posted') THEN

ALTER TABLE {databaseName}.{objectQualifier}Message 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Message_Posted_Desc` (`Posted` DESC);
END IF;

/*PollVote*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}PollVote_PollID' AND S.TABLE_NAME='{objectQualifier}pollvote' AND S.COLUMN_NAME='PollID') THEN

ALTER TABLE {databaseName}.{objectQualifier}PollVote 
ADD
INDEX `IX_{databaseName}_{objectQualifier}PollVote_PollID` (`PollID`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}PollVote_RemoteIP' AND S.TABLE_NAME='{objectQualifier}pollvote' AND S.COLUMN_NAME='RemoteIP') THEN

ALTER TABLE {databaseName}.{objectQualifier}PollVote 
ADD
INDEX `IX_{databaseName}_{objectQualifier}PollVote_RemoteIP` (`RemoteIP`);

END IF;


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}PollVote_UserID' AND S.TABLE_NAME='{objectQualifier}pollvote' AND S.COLUMN_NAME='UserID') THEN

ALTER TABLE {databaseName}.{objectQualifier}PollVote 
ADD
INDEX `IX_{databaseName}_{objectQualifier}PollVote_UserID` (`UserID`);

END IF;

/*Rank*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Rank' AND S.TABLE_NAME='{objectQualifier}rank' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Rank 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}Rank` (`BoardID`, `Name`);

END IF;

/*Registry*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Registry_Name' AND S.TABLE_NAME='{objectQualifier}registry' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Registry 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Registry_Name` (`BoardID`, `Name`);

END IF;

/*Reputation*/
IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}ReputationVote_FU_TU' AND S.TABLE_NAME='{objectQualifier}ReputationVote' AND (S.COLUMN_NAME='ReputationFromUserID' OR  S.COLUMN_NAME='ReputationToUserID')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}ReputationVote 
ADD
INDEX `IX_{databaseName}_{objectQualifier}ReputationVote_FU_TU` (`ReputationFromUserID`, `ReputationToUserID`);

END IF;

/*Smiley*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Smiley' AND S.TABLE_NAME='{objectQualifier}smiley' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Code')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}Smiley 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}Smiley` (`BoardID`, `Code`);

END IF;

/*Topic*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Topic_Flags' AND S.TABLE_NAME='{objectQualifier}topic' AND S.COLUMN_NAME='Flags') THEN

ALTER TABLE {databaseName}.{objectQualifier}Topic 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Topic_Flags` (`Flags`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Topic_ForumID' AND S.TABLE_NAME='{objectQualifier}topic' AND S.COLUMN_NAME='ForumID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Topic 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Topic_ForumID` (`ForumID`);

END IF;


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Topic_UserID' AND S.TABLE_NAME='{objectQualifier}topic' AND S.COLUMN_NAME='UserID') THEN

ALTER TABLE {databaseName}.{objectQualifier}Topic 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Topic_UserID` (`UserID`);

END IF;


/*User*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}User' AND S.TABLE_NAME='{objectQualifier}user' AND (S.COLUMN_NAME='BoardID' OR  S.COLUMN_NAME='Name')) < 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}User 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}User` (`BoardID`, `Name`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}User_Flags' AND S.TABLE_NAME='{objectQualifier}user' 
AND S.COLUMN_NAME='Flags') THEN

ALTER TABLE {databaseName}.{objectQualifier}User 
ADD
INDEX `IX_{databaseName}_{objectQualifier}User_Flags` (`Flags`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}User_Name' AND S.TABLE_NAME='{objectQualifier}user' 
AND S.COLUMN_NAME='Name') THEN

ALTER TABLE {databaseName}.{objectQualifier}User 
ADD
INDEX `IX_{databaseName}_{objectQualifier}User_Name` (`Name`);

END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.TABLE_NAME='{objectQualifier}user' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}User_ProviderUserKey' AND S.COLUMN_NAME='ProviderUserKey') THEN

ALTER TABLE {databaseName}.{objectQualifier}User 
ADD
INDEX `IX_{databaseName}_{objectQualifier}User_ProviderUserKey` (`ProviderUserKey`);

END IF;


/*UserGroup*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}UserGroup_UserID' AND S.TABLE_NAME='{objectQualifier}usergroup' AND S.COLUMN_NAME='UserID') THEN

ALTER TABLE {databaseName}.{objectQualifier}UserGroup 
ADD
INDEX `IX_{databaseName}_{objectQualifier}UserGroup_UserID` (`UserID`);

END IF;

/*UserPMessage*/

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}UserPMessage_UserID' AND S.TABLE_NAME='{objectQualifier}userpmessage' AND S.COLUMN_NAME='UserID') THEN

ALTER TABLE {databaseName}.{objectQualifier}UserPMessage 
ADD
INDEX `IX_{databaseName}_{objectQualifier}UserPMessage_UserID` (`UserID`);

END IF;


/*WatchForum*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}WatchForum' AND S.TABLE_NAME='{objectQualifier}watchforum' AND (S.COLUMN_NAME='ForumID' OR  S.COLUMN_NAME='UserID'))< 2 THEN

ALTER TABLE {databaseName}.{objectQualifier}WatchForum 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}WatchForum` (`ForumID`, `UserID`);

END IF;


/*WatchTopic*/

IF (SELECT COUNT(1) FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}WatchTopic'  AND S.TABLE_NAME='{objectQualifier}watchtopic' AND (S.COLUMN_NAME='TopicID' OR  S.COLUMN_NAME='UserID')) < 2 THEN
ALTER TABLE {databaseName}.{objectQualifier}WatchTopic 
ADD
UNIQUE INDEX `IX_{databaseName}_{objectQualifier}WatchTopic` (`TopicID`, `UserID`);
END IF;

-- {databaseName}.{objectQualifier}Thanks

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Thanks_MessageID'  AND S.TABLE_NAME='{objectQualifier}thanks' AND S.COLUMN_NAME='MessageID')  THEN
ALTER TABLE {databaseName}.{objectQualifier}Thanks 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Thanks_MessageID` (`MessageID`);
END IF;


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Thanks_ThanksFromUserID'  AND S.TABLE_NAME='{objectQualifier}thanks' AND S.COLUMN_NAME='ThanksFromUserID')  THEN
ALTER TABLE {databaseName}.{objectQualifier}Thanks 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Thanks_ThanksFromUserID` (`ThanksFromUserID`);
END IF;

IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}Thanks_ThanksToUserID'  AND S.TABLE_NAME='{objectQualifier}thanks' AND S.COLUMN_NAME='ThanksToUserID')  THEN
ALTER TABLE {databaseName}.{objectQualifier}Thanks 
ADD
INDEX `IX_{databaseName}_{objectQualifier}Thanks_ThanksToUserID` (`ThanksToUserID`);
END IF;


SET foreign_key_checks=1; 
END;
--GO

CALL {databaseName}.{objectQualifier}add_or_check_indexes();

--GO


DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_indexes;
--GO
DROP  PROCEDURE IF EXISTS {databaseName}.{objectQualifier}add_or_check_ukeys;
--GO

