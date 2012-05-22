-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012

-- RENAME TABLE {databaseName}.{objectQualifier}AccessMask TO {databaseName}.{objectQualifier}accessmask;

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}AccessMask
       (
       `AccessMaskID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(128) NOT NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `SortOrder` INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`AccessMaskID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Active
       (
       `SessionID` VARCHAR(24) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `BoardID` INT NOT NULL,
	   `UserID` INT NOT NULL,
	   `IP` VARCHAR(39) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Login` DATETIME NOT NULL,
	   `LastActive` DATETIME NOT NULL,
	   `Location` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `ForumPage` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `ForumID` INT NULL,
	   `TopicID` INT NULL,
	   `Browser` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Platform` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`SessionID`, `BoardID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}ActiveAccess
        (		
		`UserID`			    int NOT NULL ,
		`BoardID`			    int NOT NULL ,			
		`ForumID`			    int NOT NULL DEFAULT 0,
		`IsAdmin`				TINYINT(1) NOT NULL DEFAULT 0,
		`IsForumModerator`	    TINYINT(1) NOT NULL DEFAULT 0,
		`IsModerator`			TINYINT(1) NOT NULL DEFAULT 0,
		`IsGuestX`		     	TINYINT(1) NOT NULL DEFAULT 0,
		`LastActive`		    DATETIME NOT NULL,
		`ReadAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`PostAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`ReplyAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`PriorityAccess`		TINYINT(1) NOT NULL DEFAULT 0,
		`PollAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`VoteAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`ModeratorAccess`		TINYINT(1) NOT NULL DEFAULT 0,
		`EditAccess`			TINYINT(1) NOT NULL DEFAULT 0,
		`DeleteAccess`		    TINYINT(1) NOT NULL DEFAULT 0,
		`UploadAccess`		    TINYINT(1) NOT NULL DEFAULT 0,		
		`DownloadAccess`		TINYINT(1) NOT NULL DEFAULT 0
		)
		ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}AdminPageUserAccess
       (
       `UserID` INT NOT NULL,	  
	   `PageName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL	  
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}EventLogGroupAccess
       (
	   `GroupID`		       int NOT NULL,
	   `EventTypeID`           int NOT NULL,
	   `EventTypeName`	       varchar (128) NOT NULL,
	   `DeleteAccess`          TINYINT(1) NOT NULL DEFAULT 0
	)
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Attachment
       (
       `AttachmentID` INT NOT NULL AUTO_INCREMENT,
	   `MessageID` INT NOT NULL,
	   `FileName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Bytes` INT NOT NULL,
	   `FileID` INT NULL,
	   `ContentType` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Downloads` INT NOT NULL,
	   `FileData` LONGBLOB NULL,
	   PRIMARY KEY (`AttachmentID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}BannedIP
       (
       `ID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Mask` VARCHAR(57) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Since` DATETIME NOT NULL,
	   `Reason`  VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UserID` INT NOT NULL,
	   PRIMARY KEY (`ID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}BBCode
       (
       `BBCodeID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Description` VARCHAR(4000) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `OnClickJS` VARCHAR(1000) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `DisplayJS` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `EditJS` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `DisplayCSS` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SearchRegex` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ReplaceRegex` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Variables` VARCHAR(1000) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `UseModule` TINYINT(1) NULL,
	   `ModuleClass` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ExecOrder` INT NOT NULL,
	   PRIMARY KEY (`BBCodeID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Board
       (
	   `BoardID` INT NOT NULL AUTO_INCREMENT,
	   `BoardUID` BINARY(16),
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `AllowThreaded` TINYINT(1) NOT NULL,
	   `MembershipAppName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `RolesAppName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   PRIMARY KEY (`BoardID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Category
       (
	   `CategoryID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `CategoryImage` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SortOrder` SMALLINT(5) NOT NULL,
	   `PollGroupID` int,
	   PRIMARY KEY (`CategoryID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}CheckEmail
       (
	   `CheckEmailID` INT NOT NULL AUTO_INCREMENT,
	   `UserID` INT NOT NULL,
	   `Email` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Created` DATETIME NOT NULL,
	   `Hash` VARCHAR(32) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   PRIMARY KEY (`CheckEmailID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Choice
       (
	   `ChoiceID` INT NOT NULL AUTO_INCREMENT,
	   `PollID` INT NOT NULL,
	   `Choice` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Votes` INT NOT NULL DEFAULT 0,
	   `ObjectPath` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `MimeType` VARCHAR(50) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   PRIMARY KEY (`ChoiceID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}EventLog
       (
	   `EventLogID` INT NOT NULL AUTO_INCREMENT,
	   `EventTime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	   `UserID` INT NULL,
	   `Source` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Description` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Type` INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`EventLogID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Extension
       (
	   `ExtensionID` INT NOT NULL AUTO_INCREMENT,
	   `BoardId` INT NOT NULL DEFAULT 1,
	   `Extension` VARCHAR(10) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   PRIMARY KEY (`ExtensionID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Forum
       (
	   `ForumID` INT NOT NULL AUTO_INCREMENT,
	   `CategoryID` INT NOT NULL,
	   `ParentID` INT NULL,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Description` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `SortOrder` SMALLINT(5) NOT NULL,
	   `LastPosted` DATETIME NULL,
	   `LastTopicID` INT NULL,
	   `LastMessageID` INT NULL,
	   `LastUserID` INT NULL,
	   `LastUserName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `LastUserDisplayName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `NumTopics` INT NOT NULL,
	   `NumPosts` INT NOT NULL,
	   `RemoteURL` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `ThemeURL` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ImageURL` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Styles` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `PollGroupID` INT NULL,
	   PRIMARY KEY (`ForumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}ForumAccess
       (
	   `GroupID` INT NOT NULL,
	   `ForumID` INT NOT NULL,
	   `AccessMaskID` INT NOT NULL,
	   PRIMARY KEY (`GroupID`, `ForumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Group
       (
	   `GroupID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `PMLimit` INT,
	   `Style`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `SortOrder`  INT NOT NULL DEFAULT 0,
	   `Description` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UsrSigChars`   INT NOT NULL DEFAULT 0,
	   `UsrSigBBCodes` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UsrSigHTMLTags` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UsrAlbums`  INT NOT NULL DEFAULT 0,
	   `UsrAlbumImages`  INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`GroupID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}GroupMedal
       (
	   `GroupID` INT NOT NULL,
	   `MedalID` INT NOT NULL,
	   `Message` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Hide` TINYINT NOT NULL DEFAULT 0,
	   `OnlyRibbon` TINYINT(1) NOT NULL DEFAULT 0,
	   `SortOrder` TINYINT(3) UNSIGNED NOT NULL DEFAULT 255
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Mail
       (
	   `MailID` INT NOT NULL AUTO_INCREMENT,
	   `FromUser` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `FromUserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ToUser` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `ToUserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Created` DATETIME NOT NULL,
	   `Subject` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Body` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `BodyHtml` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SendTries` INT NOT NULL DEFAULT 0,
	   `SendAttempt` DATETIME NULL,
	   `ProcessID` INT NULL,
	   PRIMARY KEY (`MailID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO


CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Medal
       (
	   `BoardID` INT NOT NULL,
	   `MedalID` INT NOT NULL AUTO_INCREMENT,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Description` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Message` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Category` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `MedalURL` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `RibbonURL` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SmallMedalURL` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `SmallRibbonURL` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SmallMedalWidth` SMALLINT(5) NOT NULL,
	   `SmallMedalHeight` SMALLINT(5) NOT NULL,
	   `SmallRibbonWidth` SMALLINT(5) NULL,
	   `SmallRibbonHeight` SMALLINT(5) NULL,
	   `SortOrder` TINYINT(3) UNSIGNED NOT NULL DEFAULT 255,
	   `Flags` INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`MedalID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Message
       (
	   `MessageID` INT NOT NULL AUTO_INCREMENT,
	   `TopicID` INT NOT NULL,
	   `ReplyTo` INT NULL,
	   `Position` INT NOT NULL,
	   `Indent` INT NOT NULL,
	   `UserID` INT NOT NULL,
	   `UserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `UserDisplayName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Posted` DATETIME NOT NULL,
	   `Message` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL ,
	   `IP` VARCHAR(39) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Edited` DATETIME NULL,
	   `EditedBy` INT,
	   `Flags` INT NOT NULL DEFAULT 23,
	   `EditReason` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `IsModeratorChanged` TINYINT(1) NOT NULL DEFAULT 0,
	   `DeleteReason` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `BlogPostID` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ExternalMessageId`	varchar(255) NULL,
	   `ReferenceMessageId` varchar(255) NULL,
	   PRIMARY KEY (`MessageID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}MessageHistory
       (
	   `MessageID` INT NOT NULL,
	   `Message` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL ,
	   `IP` VARCHAR(39) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Edited` DATETIME NULL,
	   `EditedBy` INT,
	   `EditReason` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `IsModeratorChanged` TINYINT(1) NOT NULL DEFAULT 0,
	   `Flags` INT NOT NULL DEFAULT 23
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}MessageReported
       (
	   `MessageID` INT NOT NULL,
	   `Message` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Resolved` TINYINT(1) NULL,
	   `ResolvedBy` INT NULL,
	   `ResolvedDate` DATETIME NULL
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}MessageReportedAudit
       (
	   `LogID` INT NOT NULL AUTO_INCREMENT,
	   `UserID` INT NULL,
	   `MessageID` INT NULL,
	   `Reported` DATETIME NULL,
	   PRIMARY KEY (`LogID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}NntpForum
       (
	   `NntpForumID` INT NOT NULL AUTO_INCREMENT,
	   `NntpServerID` INT NOT NULL,
	   `GroupName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `ForumID` INT NOT NULL,
	   `LastMessageNo` INT NOT NULL,
	   `LastUpdate` DATETIME NOT NULL,
	   `Active` TINYINT(1) NOT NULL,
	   `DateCutOff` DATETIME,
	   PRIMARY KEY (`NntpForumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}NntpServer
       (
	   `NntpServerID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Address` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Port` INT NULL,
	   `UserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `UserPass` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   PRIMARY KEY (`NntpServerID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}NntpTopic
       (
	   `NntpTopicID` INT NOT NULL AUTO_INCREMENT,
	   `NntpForumID` INT NOT NULL,
	   `Thread` VARCHAR(64) NOT NULL,
	   `TopicID` INT NOT NULL,
	   PRIMARY KEY (`NntpTopicID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}PMessage
       (
	   `PMessageID` INT NOT NULL AUTO_INCREMENT,
	   `FromUserID` INT NOT NULL,
	   `Created` DATETIME NOT NULL,
	   `Subject` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Body` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Flags` INT NOT NULL,
	   `ReplyTo` INT,
	   PRIMARY KEY (`PMessageID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}PollGroupCluster
       (
	   `PollGroupID` INT NOT NULL AUTO_INCREMENT,
	   `UserID`	int not NULL,
	   `Flags` int NOT NULL DEFAULT 0,
	   PRIMARY KEY (`PollGroupID`)
	   );
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Poll
       (
	   `PollID` INT NOT NULL AUTO_INCREMENT,
	   `Question` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Closes` DATETIME NULL,
	   `PollGroupID` int NULL,
	   `UserID` int not NULL,
	   `ObjectPath` varchar(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `MimeType` varchar(50) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Flags` int NULL,
	   PRIMARY KEY (`PollID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}PollVote
       (
	   `PollVoteID` INT NOT NULL AUTO_INCREMENT,
	   `PollID` INT NOT NULL,
	   `UserID` INT NULL,
	   `RemoteIP` VARCHAR(57) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ChoiceID` INT,
	   PRIMARY KEY (`PollVoteID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}PollVoteRefuse
       (
	   `RefuseID` INT NOT NULL AUTO_INCREMENT,
	   `PollID` INT NOT NULL,
	   `UserID` INT NULL,
	   `RemoteIP` VARCHAR(57) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   PRIMARY KEY (`RefuseID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Rank
       (
	   `RankID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `MinPosts` INT NULL,
	   `RankImage` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `PMLimit` INT NOT NULL DEFAULT 0,
	   `Style`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `SortOrder`  INT NOT NULL DEFAULT 0,
	   `Description` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation}, 
	   `UsrSigChars`   INT NOT NULL DEFAULT 0,
	   `UsrSigBBCodes` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UsrSigHTMLTags` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
	   `UsrAlbums`  INT NOT NULL DEFAULT 0,
	   `UsrAlbumImages`  INT NOT NULL DEFAULT 0,
	   PRIMARY KEY (`RankID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Registry
       (
	   `RegistryID` INT NOT NULL AUTO_INCREMENT,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Value` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `BoardID` INT NULL,
	   PRIMARY KEY (`RegistryID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE  IF NOT EXISTS {databaseName}.{objectQualifier}ShoutboxMessage(
		ShoutBoxMessageID INT  NOT NULL AUTO_INCREMENT,		
		UserID int,
		UserName varchar(128)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
		UserDisplayName varchar(128)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
		Message LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation},
		`Date` datetime NOT NULL,
		`IP` varchar(39) NOT NULL,
		PRIMARY KEY (`ShoutBoxMessageID`)
		)
		ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Replace_Words
       (
	   `ID` INT NOT NULL AUTO_INCREMENT,
	   `BoardId` INT NOT NULL,
	   `BadWord` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `GoodWord` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   PRIMARY KEY (`ID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Smiley
       (
	   `SmileyID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `Code` VARCHAR(10) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Icon` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Emoticon` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `SortOrder` TINYINT(3) NOT NULL DEFAULT 0,
	   PRIMARY KEY (`SmileyID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Topic
       (
	   `TopicID` INT NOT NULL AUTO_INCREMENT,
	   `ForumID` INT NOT NULL,
	   `UserID` INT NOT NULL,
	   `UserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `UserDisplayName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Posted` DATETIME NOT NULL,
	   `Topic` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Status` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Styles` VARCHAR(255) NULL,
	   `Description` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Views` INT NOT NULL,
	   `Priority` SMALLINT(5) NOT NULL,
	   `PollID` INT NULL,
	   `TopicMovedID` INT NULL,
	   `LastPosted` DATETIME NULL,
	   `LastMessageID` INT NULL,
	   `LastUserID` INT NULL,
	   `LastUserName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `LastUserDisplayName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `NumPosts` INT NOT NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `AnswerMessageId` INT NULL, 
	   `LastMessageFlags`	INT NOT NULL DEFAULT 22,
	   PRIMARY KEY (`TopicID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}User
       (
	   `UserID` INT NOT NULL AUTO_INCREMENT,
	   `BoardID` INT NOT NULL,
	   `ProviderUserKey` VARCHAR(64) NULL,
	   `Name` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `DisplayName` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Password` VARCHAR(32) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `Email` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Joined` DATETIME NOT NULL,
	   `LastVisit` DATETIME NOT NULL,
	   `IP` VARCHAR(39) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `NumPosts` INT NOT NULL,
	   `TimeZone` INT NOT NULL,
	   `UseSingleSignOn`  TINYINT(1) NOT NULL DEFAULT 0,
	   `TextEditor` VARCHAR(50),
	   `Avatar` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Signature` LONGTEXT CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `AvatarImage` LONGBLOB NULL,
	   `AvatarImageType`	VARCHAR (50) NULL,
	   `RankID` INT NOT NULL,
	   `Suspended` DATETIME NULL,
	   `LanguageFile` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `ThemeFile` VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `OverrideDefaultThemes` TINYINT(1) NOT NULL DEFAULT 0,
	   `PMNotification` TINYINT(1) NOT NULL DEFAULT 1,
	   `NotificationType` INT DEFAULT 10,
	   `DailyDigest` TINYINT(1) NOT NULL DEFAULT 0,
	   `AutoWatchTopics` TINYINT(1) NOT NULL DEFAULT 0,
	   `Culture` VARCHAR(10) NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `Points` INT NOT NULL DEFAULT 0,
	   `IsFacebookUser` TINYINT(1) NOT NULL DEFAULT 0,
	   `IsTwitterUser` TINYINT(1) NOT NULL DEFAULT 0,
	   `UserStyle` VARCHAR(510) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `StyleFlags` INT NOT NULL DEFAULT 0,
	   `IsUserStyle` TINYINT(1) NOT NULL DEFAULT 0,
	   `IsGroupStyle` TINYINT(1) NOT NULL DEFAULT 0,
	   `IsRankStyle` TINYINT(1) NOT NULL DEFAULT 0,
	   PRIMARY KEY (`UserID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}UserForum
       (
	   `UserID` INT NOT NULL,
	   `ForumID` INT NOT NULL,
	   `AccessMaskID` INT NOT NULL,
	   `Invited` DATETIME NOT NULL,
	   `Accepted` TINYINT(1) NOT NULL,
	   PRIMARY KEY (`UserID`, `ForumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}UserGroup
       (
	   `UserID` INT NOT NULL,
	   `GroupID` INT NOT NULL,
	   PRIMARY KEY (`UserID`, `GroupID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}UserMedal
       (
	   `UserID` INT NOT NULL,
	   `MedalID` INT NOT NULL,
	   `Message` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL,
	   `Hide` TINYINT(1) NOT NULL DEFAULT 0,
	   `OnlyRibbon` TINYINT(1) NOT NULL DEFAULT 0,
	   `SortOrder` TINYINT(3) UNSIGNED NOT NULL DEFAULT 255,
	   `DateAwarded` DATETIME NOT NULL
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}IgnoreUser
	   (
	   `UserID` INT NOT NULL,
	   `IgnoredUserID` INT NOT NULL,
	   PRIMARY KEY (`UserID`, `IgnoredUserID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};	
--GO
	
CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}UserPMessage
       (
	   `UserPMessageID` INT NOT NULL AUTO_INCREMENT,
	   `UserID` INT NOT NULL,
	   `PMessageID` INT NOT NULL,
	   `Flags` INT NOT NULL DEFAULT 0,
	   `IsReply` TINYINT(1) NOT NULL DEFAULT 0,
	   PRIMARY KEY (`UserPMessageID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}WatchForum
       (
	   `WatchForumID` INT NOT NULL AUTO_INCREMENT,
	   `ForumID` INT NOT NULL,
	   `UserID` INT NOT NULL,
	   `Created` DATETIME NOT NULL,
	   `LastMail` DATETIME NULL,
	   PRIMARY KEY (`WatchForumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}WatchTopic
       (
	   `WatchTopicID` INT NOT NULL AUTO_INCREMENT,
	   `TopicID` INT NOT NULL,
	   `UserID` INT NOT NULL,
	   `Created` DATETIME NOT NULL,
	   `LastMail` DATETIME NULL,
	   PRIMARY KEY (`WatchTopicID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Thanks
       (
	   `ThanksID` INT NOT NULL AUTO_INCREMENT,
	   `ThanksFromUserID` INT NOT NULL,
	   `ThanksToUserID` INT NOT NULL,
	   `MessageID` INT NOT NULL,
	   `ThanksDate` DATETIME NOT NULL,
	   PRIMARY KEY (`ThanksID`)
	   ) ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}Buddy
       (
	   `ID` INT NOT NULL AUTO_INCREMENT,
	   `FromUserID` INT NOT NULL,
	   `ToUserID` INT NOT NULL,
	   `Approved` TINYINT(1) NOT NULL,
	   `Requested` DATETIME NOT NULL,
	   PRIMARY KEY (`ID`)
	   ) 
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

/* YAF FavoriteTopic Table */
CREATE TABLE IF NOT EXISTS {databaseName}.{objectQualifier}FavoriteTopic
       (
	   `ID` INT NOT NULL AUTO_INCREMENT,
	   `UserID` INT NOT NULL,
	   `TopicID` INT NOT NULL,
	   PRIMARY KEY (`ID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}UserAlbum
       (
	   `AlbumID` INT NOT NULL  AUTO_INCREMENT,
	   `UserID` INT NOT NULL,
	   `Title` VARCHAR(255),
	   `CoverImageID` INT,
	   `Updated` DATETIME NOT NULL,
	   PRIMARY KEY (`AlbumID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}UserAlbumImage
       (
	   `ImageID` INT NOT NULL  AUTO_INCREMENT,
	   `AlbumID`  INT NOT NULL,
	   `Caption` VARCHAR(255),
	   `FileName` VARCHAR(255) NOT NULL,
	   `Bytes` INT NOT NULL,
	   `ContentType`  VARCHAR(50),
	   `Uploaded` DATETIME NOT NULL,
	   `Downloads` INT NOT NULL,
	   PRIMARY KEY (`ImageID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}TopicReadTracking
       (
	   `UserID`			INT NOT NULL ,
	   `TopicID`			INT NOT NULL ,
	   `LastAccessDate`	DATETIME NOT NULL
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}ForumReadTracking
       (
	   `UserID`			INT NOT NULL ,
	   `ForumID`			INT NOT NULL ,
	   `LastAccessDate`	DATETIME NOT NULL
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}TopicStatus
       (
	   `TopicStatusID` INT NOT NULL AUTO_INCREMENT,
	   `TopicStatusName` VARCHAR(100)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   `BoardID` int NOT NULL,
	   `DefaultDescription` VARCHAR(100)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL,
	   PRIMARY KEY (`TopicStatusID`)
	   )
	   ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}UserProfile
	   (
	   `UserID` INT NOT NULL,
	   `LastUpdatedDate` DATETIME NOT NULL,
	   -- added columns
	   `LastActivity` DATETIME,
	   `ApplicationName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation}  NOT NULL,
	   `IsAnonymous` TINYINT(1) NOT NULL,
	   `UserName` VARCHAR(255)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NOT NULL
	   ) ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

CREATE TABLE IF NOT EXISTS  {databaseName}.{objectQualifier}ReputationVote(
		`ReputationFromUserID`  INT NOT NULL,
		`ReputationToUserID`	  INT NOT NULL,
		`VoteDate`	DATETIME NOT NULL
	) ENGINE=InnoDB DEFAULT CHARSET={databaseEncoding};
--GO

-- update procedures 

DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}tables_upgrade;
--GO;
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_migration;
--GO;
CREATE PROCEDURE {databaseName}.{objectQualifier}pollgroup_migration  
 (	 	
 )
 BEGIN
 	  -- local variables for temporary values
      DECLARE ici_ptmp INT;
	  DECLARE ici_ttmp INT;
	  DECLARE ici_utmp INT;
	  DECLARE ici_PollGroupID INT;
	  DECLARE cltt CURSOR FOR
      SELECT  PollID, TopicID, UserID 
	   FROM {databaseName}.{objectQualifier}Topic 
	    WHERE PollID IS NOT NULL;
	
		OPEN cltt;				
 		
        BEGIN	
          DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;         
        LOOP        
            FETCH cltt INTO ici_ptmp, ici_ttmp, ici_utmp;       
		     IF ici_ptmp is not null THEN
		       insert into {databaseName}.{objectQualifier}PollGroupCluster(UserID, Flags) 
		        values (ici_utmp, 0);	
		       SET ici_PollGroupID = LAST_INSERT_ID(); 
			   update {databaseName}.{objectQualifier}Topic SET PollID = ici_PollGroupID WHERE TopicID = ici_ttmp;
			   update {databaseName}.{objectQualifier}Poll SET UserID = ici_utmp, PollGroupID = ici_PollGroupID, Flags = 0 WHERE PollID = ici_ptmp;
			END IF; 
		END LOOP;
		END;

 		CLOSE cltt;		
 END;
--GO


CREATE  PROCEDURE {databaseName}.{objectQualifier}tables_upgrade()
BEGIN
-- clean-up for active tables
DELETE FROM {databaseName}.{objectQualifier}Active;
DELETE FROM {databaseName}.{objectQualifier}ActiveAccess;

-- Active Table

  -- add `ForumPage` column  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
                 WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}') 
				 AND (TABLE_NAME='{objectQualifier}Active' 
				      OR TABLE_NAME=LOWER('{objectQualifier}Active'))
				 AND COLUMN_NAME='ForumPage' LIMIT 1) THEN
	 ALTER TABLE  {databaseName}.{objectQualifier}Active ADD `ForumPage` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} AFTER `Location`;
  END IF;
  
  -- Check for a right column `ForumPage` size
  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
             WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  
			 AND (TABLE_NAME='{objectQualifier}Active' 
			      OR TABLE_NAME=LOWER('{objectQualifier}Active'))
             AND COLUMN_NAME='ForumPage' AND CHARACTER_MAXIMUM_LENGTH < 255 LIMIT 1) THEN
     ALTER TABLE  {databaseName}.{objectQualifier}Active CHANGE `ForumPage` `ForumPage` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  -- Check for a right column `Location` size
  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
             WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}') 
			 AND (TABLE_NAME='{objectQualifier}Active' 
			      OR TABLE_NAME=LOWER('{objectQualifier}Active'))
             AND COLUMN_NAME='Location' AND CHARACTER_MAXIMUM_LENGTH < 255 LIMIT 1) THEN
     ALTER TABLE  {databaseName}.{objectQualifier}Active CHANGE `Location` `Location` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;  

  -- add `Flags` column  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Active' OR TABLE_NAME=LOWER('{objectQualifier}Active'))
  AND COLUMN_NAME='Flags' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Active ADD `Flags` INT;
  END IF;

-- Active Access Table
   -- add `IsGuestX` column  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}ActiveAccess' OR TABLE_NAME=LOWER('{objectQualifier}ActiveAccess'))
  AND COLUMN_NAME='IsGuestX' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}ActiveAccess ADD `IsGuestX` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

     -- add `LastActive` column  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}ActiveAccess' OR TABLE_NAME=LOWER('{objectQualifier}ActiveAccess'))
  AND COLUMN_NAME='LastActive' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}ActiveAccess ADD `LastActive`  DATETIME NOT NULL;
  END IF;

 
  
-- AccessMask Table
IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}AccessMask' OR TABLE_NAME=LOWER('{objectQualifier}AccessMask'))
  AND COLUMN_NAME='SortOrder' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}AccessMask ADD `SortOrder`  INT NOT NULL DEFAULT 0;
  END IF;  
-- Board Table
IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Board' OR TABLE_NAME=LOWER('{objectQualifier}Board'))
  AND COLUMN_NAME='BoardUID' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Board ADD `BoardUID`  BINARY(16);
  END IF;  
-- Topic Table
IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='AnswerMessageId' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD `AnswerMessageId` INT AFTER `Flags`;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='Description' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD  `Description` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `Topic`;
  END IF;

   IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='Styles' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD  `Styles` VARCHAR(255) NULL AFTER `Status`;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='Status' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD  `Status` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `Topic`;
  END IF;

  IF  EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='Status' LIMIT 1) THEN
  ALTER TABLE {databaseName}.{objectQualifier}Topic CHANGE `Status` `Status`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  END IF;  
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='LinkDays' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD  `LinkDays` DATETIME;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='UserDisplayName' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD `UserDisplayName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `UserName`;
  END IF;
    
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Topic' OR TABLE_NAME=LOWER('{objectQualifier}Topic')) 
  AND COLUMN_NAME='LastUserDisplayName' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD `LastUserDisplayName` VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `LastUserName`;
  END IF;
 
-- Rank Table
IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='PMLimit' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `PMLimit` INT;
  END IF;
  
 IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='Style' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `Style` VARCHAR(255);
  END IF; 
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='SortOrder' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `SortOrder`  INT NOT NULL DEFAULT 0;
  END IF; 
  UPDATE  {databaseName}.{objectQualifier}Rank SET PMLimit = 0 WHERE PMLimit IS NULL;
  
   IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='Description' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `Description`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='UsrSigChars' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `UsrSigChars`  INT NOT NULL DEFAULT 0;
  END IF;  
 
 
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='UsrSigBBCodes' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `UsrSigBBCodes`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='UsrSigHTMLTags' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `UsrSigHTMLTags`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='UsrAlbums' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `UsrAlbums`  INT NOT NULL DEFAULT 0;
  END IF; 
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Rank' OR TABLE_NAME=LOWER('{objectQualifier}Rank'))
  AND COLUMN_NAME='UsrAlbumImages' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Rank ADD `UsrAlbumImages`  INT NOT NULL DEFAULT 0;
  END IF;  
  
  -- Group Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='PMLimit' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `PMLimit` INT;
  END IF;
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='Style' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `Style`  VARCHAR(255);
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='SortOrder' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `SortOrder` INT NOT NULL DEFAULT 0;
  END IF;
  UPDATE  {databaseName}.{objectQualifier}Group SET PMLimit = 30 WHERE PMLimit IS NULL;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='Description' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `Description`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='UsrSigChars' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `UsrSigChars`  INT NOT NULL DEFAULT 0;
  END IF;
  
  UPDATE  {databaseName}.{objectQualifier}Group SET UsrSigChars = 128 WHERE UsrSigChars IS NULL;
 
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='UsrSigBBCodes' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `UsrSigBBCodes`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='UsrSigHTMLTags' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `UsrSigHTMLTags`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='UsrAlbums' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `UsrAlbums`  INT NOT NULL DEFAULT 0;
  END IF;
  
  UPDATE  {databaseName}.{objectQualifier}Group SET UsrAlbums = 1 WHERE UsrAlbums IS NULL AND Name !='Guest';
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  (TABLE_NAME='{objectQualifier}Group' OR TABLE_NAME=LOWER('{objectQualifier}Group'))
  AND COLUMN_NAME='UsrAlbumImages' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Group ADD `UsrAlbumImages`  INT NOT NULL DEFAULT 0;
  END IF;  
   UPDATE  {databaseName}.{objectQualifier}Group SET UsrAlbumImages = 30 WHERE UsrAlbumImages IS NULL AND Name !='Guest';


  -- MessageReportedAudit Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageReportedAudit')
  AND COLUMN_NAME='ReportedNumber' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}MessageReportedAudit ADD `ReportedNumber` INT NOT NULL DEFAULT 1;
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageReportedAudit')
  AND COLUMN_NAME='ReportText' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}MessageReportedAudit ADD `ReportText` VARCHAR(4000);
  END IF;

  -- User Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='DisplayName' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD `DisplayName`  VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} AFTER `Name`;
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='AutoWatchTopics' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD `AutoWatchTopics` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='NotificationType' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD `NotificationType` INT NOT NULL DEFAULT 10;
  END IF; 
   
       IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='TextEditor' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD  `TextEditor` VARCHAR(50);
  END IF; 
 
    
    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='DailyDigest' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD `DailyDigest` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;
  
     IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='Culture' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}User ADD `Culture` VARCHAR(10) NULL;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='UseSingleSignOn' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `UseSingleSignOn`  TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='IsFacebookUser' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `IsFacebookUser` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;  

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='IsTwitterUser' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `IsTwitterUser` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

        IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='UserStyle' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `UserStyle` VARCHAR(510) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  END IF;

      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='StyleFlags' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `StyleFlags` INT NOT NULL DEFAULT 0;
  END IF;

        IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='IsUserStyle' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `IsUserStyle` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

          IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='IsGroupStyle' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `IsGroupStyle` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;

            IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}User')
  AND COLUMN_NAME='IsRankStyle' LIMIT 1) THEN
        ALTER TABLE   {databaseName}.{objectQualifier}User ADD `IsRankStyle` TINYINT(1) NOT NULL DEFAULT 0;
  END IF;    

  -- Message Table
      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Message')
  AND COLUMN_NAME='EditedBy' LIMIT 1) THEN
         ALTER TABLE  {databaseName}.{objectQualifier}Message ADD `EditedBy`  INT  AFTER `Edited`;
  END IF; 

       IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Message')
  AND COLUMN_NAME='ExternalMessageId' LIMIT 1) THEN
         ALTER TABLE  {databaseName}.{objectQualifier}Message ADD  `ExternalMessageId`	varchar(255) NULL;
  END IF; 

         IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Message')
  AND COLUMN_NAME='ReferenceMessageId' LIMIT 1) THEN
         ALTER TABLE  {databaseName}.{objectQualifier}Message ADD  `ReferenceMessageId`	varchar(255) NULL;
  END IF; 

           IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Message')
  AND COLUMN_NAME='UserDisplayName' LIMIT 1) THEN
         ALTER TABLE  {databaseName}.{objectQualifier}Message ADD  `UserDisplayName`	varchar(255)  CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER  `UserName`;
  END IF; 

  -- Forum Table
      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Forum')
  AND COLUMN_NAME='ImageURL' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Forum ADD `ImageURL`  VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Forum')
  AND COLUMN_NAME='Styles' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Forum ADD `Styles`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF; 

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Forum')
  AND COLUMN_NAME='PollGroupID' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Forum ADD `PollGroupID`  INT NULL;
  END IF; 

      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Forum')
  AND COLUMN_NAME='LastUserDisplayName' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Forum ADD `LastUserDisplayName`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `LastUserName`;
  END IF; 

  -- PollVote Table
   IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}PollVote')
  AND COLUMN_NAME='ChoiceID' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}PollVote ADD `ChoiceID`  INT NULL;
  END IF;   

  -- Category Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Category')
  AND COLUMN_NAME='PollGroupID' LIMIT 1) THEN
  ALTER TABLE  {databaseName}.{objectQualifier}Category ADD `PollGroupID`  INT NULL;
  END IF;   
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}BannedIP')
  AND COLUMN_NAME='Reason' LIMIT 1) THEN
         ALTER TABLE  {databaseName}.{objectQualifier}BannedIP ADD `Reason`  VARCHAR(128) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF; 
  
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}BannedIP')
  AND COLUMN_NAME='UserID' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}BannedIP ADD `UserID`   INT NOT NULL;
  END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}ShoutboxMessage')
  AND COLUMN_NAME='BoardID' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}ShoutboxMessage ADD `BoardID`   INT NOT NULL DEFAULT 1;
  END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Topic')
  AND COLUMN_NAME='LastMessageFlags' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Topic ADD `LastMessageFlags`   INT NOT NULL DEFAULT 22;
  END IF;

  -- Poll Table
  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='Question' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll MODIFY `Question`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation};
  END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='PollGroupID' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `PollGroupID`  INT NULL;
  END IF;

    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='PollGroupID' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `UserID`  INT NOT NULL DEFAULT 1;
  END IF;

      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='PollGroupID' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `UserID`  INT NOT NULL DEFAULT 1;
  END IF;

        IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='Flags' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `Flags`  INT NOT NULL DEFAULT 0;
  END IF;

          IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='ObjectPath' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `ObjectPath`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  END IF;

          IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='MimeType' LIMIT 1) THEN
        ALTER TABLE  {databaseName}.{objectQualifier}Poll ADD `MimeType`  VARCHAR(50) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  END IF;

  CALL {databaseName}.{objectQualifier}pollgroup_migration();

  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Poll')
  AND COLUMN_NAME='Flags' LIMIT 1) THEN
  update {databaseName}.{objectQualifier}Poll set Flags = 0 where Flags is null;

  END IF;

-- Choice Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Choice')
  AND COLUMN_NAME='ObjectPath' LIMIT 1) THEN
	alter table {databaseName}.{objectQualifier}Choice ADD `ObjectPath`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  
    END IF;

  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}Choice')
  AND COLUMN_NAME='MimeType' LIMIT 1) THEN
	alter table {databaseName}.{objectQualifier}Choice ADD `MimeType`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL;
  END IF;



    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}NntpForum')
  AND COLUMN_NAME='DateCutOff' LIMIT 1) THEN
	alter table {databaseName}.{objectQualifier}NntpForum ADD `DateCutOff` DATETIME;
	 END IF;  

-- ShoutboxMessage Table
  IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}ShoutboxMessage')
  AND COLUMN_NAME='UserDisplayName' LIMIT 1) THEN
	alter table {databaseName}.{objectQualifier}ShoutboxMessage ADD `UserDisplayName`  VARCHAR(255) CHARACTER SET {databaseEncoding} COLLATE {databaseEncoding}_{databaseCollation} NULL AFTER `UserName`;
  END IF;

 -- UserPMessage Table
	     IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}UserPMessage')
  AND COLUMN_NAME='IsRead' LIMIT 1) THEN
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage ADD `IsRead` TINYINT(1) NULL;
	UPDATE {databaseName}.{objectQualifier}UserPMessage 
	SET IsRead = IFNULL(SIGN(Flags & 1)>0,false) WHERE IsRead IS NULL;
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage CHANGE `IsRead` `IsRead`  TINYINT(1) NOT NULL;
	 END IF; 
	 
	  	     IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}UserPMessage')
  AND COLUMN_NAME='IsInOutbox' LIMIT 1) THEN
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage ADD `IsInOutbox` TINYINT(1) NULL;
	UPDATE {databaseName}.{objectQualifier}UserPMessage 
	SET IsInOutbox = IFNULL(SIGN(Flags & 2)>0,false) WHERE IsInOutbox IS NULL;
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage 
	CHANGE `IsInOutbox` `IsInOutbox`  TINYINT(1) NOT NULL;
	 END IF;  

	    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}UserPMessage')
  AND COLUMN_NAME='IsArchived' LIMIT 1) THEN
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage ADD `IsArchived` TINYINT(1) NULL;
	UPDATE {databaseName}.{objectQualifier}UserPMessage 
	SET IsArchived = IFNULL(SIGN(Flags & 4)>0,false) WHERE IsArchived IS NULL;
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage CHANGE `IsArchived` `IsArchived`  TINYINT(1) NOT NULL;
	 END IF;
	 
	    IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}UserPMessage')
  AND COLUMN_NAME='IsDeleted' LIMIT 1) THEN
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage ADD `IsDeleted` TINYINT(1) NULL;
	UPDATE {databaseName}.{objectQualifier}UserPMessage 
	SET IsDeleted = IFNULL(SIGN(Flags & 8)>0,false) WHERE IsDeleted IS NULL;
	ALTER TABLE {databaseName}.{objectQualifier}UserPMessage CHANGE `IsDeleted` `IsDeleted`  TINYINT(1) NOT NULL;
	 END IF;  
  
	-- drop pk `MessageHistoryID`
IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageHistory')
  AND COLUMN_NAME='MessageHistoryID' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}MessageHistory CHANGE `MessageHistoryID` `MessageHistoryID` BINARY(16) NOT NULL;
 ALTER TABLE {databaseName}.{objectQualifier}MessageHistory DROP PRIMARY KEY;
 ALTER TABLE {databaseName}.{objectQualifier}MessageHistory DROP `MessageHistoryID`;
END IF;

 	-- drop pk `TrackingID`
IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}TopicReadtracking')
  AND COLUMN_NAME='TrackingID' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}TopicReadtracking CHANGE `TrackingID` `TrackingID` BINARY(16) NOT NULL;
 ALTER TABLE {databaseName}.{objectQualifier}TopicReadtracking DROP PRIMARY KEY;
 ALTER TABLE {databaseName}.{objectQualifier}TopicReadtracking DROP `TrackingID`;
  END IF;

  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}PollVoteRefuse')
  AND COLUMN_NAME='BoardID' LIMIT 1) THEN 
   ALTER TABLE {databaseName}.{objectQualifier}PollVoteRefuse DROP `BoardID`;
  END IF;


   	-- drop pk `TrackingID`
IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}ForumReadtracking')
  AND COLUMN_NAME='TrackingID' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}ForumReadtracking CHANGE `TrackingID` `TrackingID` BINARY(16) NOT NULL;
 ALTER TABLE {databaseName}.{objectQualifier}ForumReadtracking DROP PRIMARY KEY;
 ALTER TABLE {databaseName}.{objectQualifier}ForumReadtracking DROP `TrackingID`;
  END IF; 
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.STATISTICS S WHERE S.TABLE_SCHEMA='{databaseName}' AND S.INDEX_NAME='IX_{databaseName}_{objectQualifier}ActiveAccess_UserID_Forum' AND S.TABLE_NAME=LOWER('{objectQualifier}ActiveAccess') AND (S.COLUMN_NAME='UserID' OR  S.COLUMN_NAME='ForumID') LIMIT 1) THEN

ALTER TABLE {databaseName}.{objectQualifier}ActiveAccess
DROP INDEX  `IX_{databaseName}_{objectQualifier}ActiveAccess_UserID_Forum`;

END IF;

IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageReportedAudit')
  AND COLUMN_NAME='MessageID' AND IS_NULLABLE='YES' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}MessageReportedAudit CHANGE `MessageID` `MessageID` INT NOT NULL;
  END IF; 

  IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageReportedAudit')
  AND COLUMN_NAME='UserID' AND IS_NULLABLE='YES' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}MessageReportedAudit CHANGE `UserID` `UserID` INT NOT NULL;
  END IF; 

    IF EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}MessageReportedAudit')
  AND COLUMN_NAME='Reported' AND IS_NULLABLE='YES' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}MessageReportedAudit CHANGE `Reported` `Reported` DATETIME NOT NULL;
  END IF; 

      IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}PMessage')
  AND COLUMN_NAME='ReplyTo' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}PMessage ADD `ReplyTo`  INT;
  END IF; 

   IF NOT EXISTS (SELECT 1 FROM information_schema.COLUMNS 
  WHERE LOWER(TABLE_SCHEMA)=LOWER('{databaseName}')  AND
  LOWER(TABLE_NAME)=LOWER('{objectQualifier}UserPMessage')
  AND COLUMN_NAME='IsReply' LIMIT 1) THEN
 ALTER TABLE {databaseName}.{objectQualifier}UserPMessage ADD `IsReply`  TINYINT(1) NOT NULL DEFAULT 0;
  END IF; 
  
  END;
--GO

CALL {databaseName}.{objectQualifier}tables_upgrade();
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}tables_upgrade;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_migration;	
--GO

/* Check and update table column sizes */

DROP PROCEDURE   IF EXISTS {databaseName}.{objectQualifier}change_table_columns;
--GO
CREATE  PROCEDURE {databaseName}.{objectQualifier}change_table_columns()
        BEGIN				
		     ALTER TABLE  {databaseName}.{objectQualifier}PollVote CHANGE `RemoteIP` `RemoteIP` VARCHAR(39);
			 ALTER TABLE  {databaseName}.{objectQualifier}BannedIP CHANGE `Mask` `Mask` VARCHAR(57);
			 ALTER TABLE  {databaseName}.{objectQualifier}Active CHANGE `Location` `Location` VARCHAR(255);
			 ALTER TABLE  {databaseName}.{objectQualifier}User CHANGE `Culture` `Culture` VARCHAR(10);
		END;
--GO
CALL {databaseName}.{objectQualifier}change_table_columns();
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}change_table_columns;
--GO
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_initdisplayname() 

BEGIN

	declare ici_tmp int;
	declare ici_tmpUserID int;
	declare ici_tmpLastUserID int;
		
		declare fc cursor for
		select ForumID, LastUserID from {databaseName}.{objectQualifier}Forum
		where LastUserDisplayName IS NULL;

		declare sbc cursor for
		select ShoutBoxMessageID,UserID from {databaseName}.{objectQualifier}ShoutboxMessage
		where UserDisplayName IS NULL;

		declare mc cursor for
		select MessageID,UserID from {databaseName}.{objectQualifier}Message
		where UserDisplayName IS NULL;

		declare tc cursor for
		select TopicID,UserID,LastUserID from {databaseName}.{objectQualifier}Topic
		where UserDisplayName IS NULL OR LastUserDisplayName IS NULL;

		open fc;

		BEGIN	
        DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;         
        LOOP        
		fetch fc into ici_tmp,ici_tmpLastUserID;		
		update {databaseName}.{objectQualifier}Forum set LastUserDisplayName = (select u.DisplayName FROM {databaseName}.{objectQualifier}User u WHERE u.UserID = ici_tmpLastUserID) where {databaseName}.{objectQualifier}Forum.ForumID = ici_tmp; 	
	   	END LOOP;
        END;
		close fc;		
		
			
		open sbc;
		BEGIN	
        DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;         
        LOOP 
		fetch sbc into ici_tmp,ici_tmpUserID;		
		update {databaseName}.{objectQualifier}ShoutboxMessage 
		set UserDisplayName = (select u.DisplayName FROM {databaseName}.{objectQualifier}User u where u.UserID = ici_tmpUserID) where {databaseName}.{objectQualifier}ShoutboxMessage.ShoutBoxMessageID = ici_tmp;
	  	END LOOP;
        END;
		close sbc;		
				
		open mc;
		BEGIN	
        DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;         
        LOOP 
		fetch  mc into ici_tmp,ici_tmpUserID;				
	    update {databaseName}.{objectQualifier}Message  set UserDisplayName = (select u.DisplayName FROM {databaseName}.{objectQualifier}User u  WHERE u.UserID = ici_tmpUserID) where MessageID = ici_tmp;
	     END LOOP;
        END;		
		close mc;
				
		open tc;
			BEGIN	
        DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;         
        LOOP 
		fetch next from tc into ici_tmp,ici_tmpUserID,ici_tmpLastUserID;	    
	    update {databaseName}.{objectQualifier}Topic set UserDisplayName = (select u.DisplayName FROM {databaseName}.{objectQualifier}User u  WHERE u.UserID = ici_tmpUserID) where TopicID = ici_tmp;
	    update {databaseName}.{objectQualifier}Topic set LastUserDisplayName = (select u.DisplayName FROM {databaseName}.{objectQualifier}User u WHERE u.UserID = ici_tmpLastUserID) where TopicID = ici_tmp;			
	     END LOOP;
        END;
		close tc;
			
end;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}tmp_initdisplayname()
BEGIN
if exists (select 1 from {databaseName}.{objectQualifier}Message where UserDisplayName IS NULL limit 1) then
CALL {databaseName}.{objectQualifier}forum_initdisplayname();
end if;
END;
--GO
  DROP PROCEDURE  IF EXISTS {databaseName}.{objectQualifier}tmp_initdisplayname;
  --GO 
    DROP PROCEDURE  IF EXISTS {databaseName}.{objectQualifier}forum_initdisplayname;
  --GO 