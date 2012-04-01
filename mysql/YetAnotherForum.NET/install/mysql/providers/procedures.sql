-- This scripts for MySQL for Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team https://github.com/vzrus http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPLv2 only licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2008-2012

 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_CreateApplication;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_upgrade;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_changepassword;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_deleteuser;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_deleterole;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_getallusers;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_resetpassword;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_getuser;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_profile_deleteinactive;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_profile_getnumberinactiveprofiles;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_createrole;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_findusersinrole;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_isuserinrole;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_unlockuser;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_changepasswordquestionandanswer;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_createuser;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_findusersbyemail;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_findusersbyname;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_addusertorole;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_getnumberofusersonline;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_getusernamebyemail;
 --GO 
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_profile_deleteprofiles;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_profile_getprofiles_count;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_profile_getprofiles;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_exists;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_getroles;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_role_removeuserfromrole;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_updateuser;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}prov_setprofileproperties;
 --GO
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_CreateApplication
 (
 i_ApplicationName VARCHAR(256),
 OUT i_ApplicationID BINARY(16) 
 )
 MODIFIES SQL DATA
 BEGIN
 	SET i_ApplicationID = (SELECT ApplicationID FROM {databaseName}.{objectQualifier}prov_Application WHERE ApplicationNameLwd=LOWER(i_ApplicationName));
 	
 	IF (i_ApplicationID IS NULL) THEN 	
 		    SET i_ApplicationID = UNHEX(REPLACE(UUID(),'-',''));
             INSERT  {databaseName}.{objectQualifier}prov_Application (ApplicationID, ApplicationName, ApplicationNameLwd)
             VALUES  (i_ApplicationID, i_ApplicationName, LOWER(i_ApplicationName));
     END IF;
 END;
 
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}prov_upgrade
(
i_PreviousVersion int,
i_NewVersion int,
i_UTCTIMESTAMP datetime
)
MODIFIES SQL DATA
BEGIN
-- RESOLVE SALT ISSUE IN 193 RC2
IF ((i_PreviousVersion = 31) OR (i_PreviousVersion = 32)) THEN					
		UPDATE {databaseName}.{objectQualifier}prov_Membership SET PasswordSalt='UwB5AHMAdABlAG0ALgBCAHkAdABlAFsAXQA=' WHERE PasswordSalt IS NOT NULL;
		UPDATE {databaseName}.{objectQualifier}prov_Membership SET Joined=i_UTCTIMESTAMP WHERE Joined IS NULL;
		END IF;	
	
END; 
--GO


/* 1-PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_changepassword(
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Password VARCHAR(256),
 i_PasswordSalt VARCHAR(256),
 i_PasswordFormat VARCHAR(256),
 i_PasswordAnswer VARCHAR(256)
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE i_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, i_ApplicationId);
 	
 	UPDATE {databaseName}.{objectQualifier}prov_Membership SET Password=i_Password, PasswordSalt=i_PasswordSalt,
 		PasswordFormat=i_PasswordFormat, PasswordAnswer=i_PasswordAnswer
 	WHERE UsernameLwd=LOWER(i_UserName) and ApplicationID=i_ApplicationID;
 
END;
--GO 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_deleteuser
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_DeleteAllRelated TINYINT(1)
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
        DECLARE ici_UserID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	/*get the userID*/
 	SELECT   UserID INTO ici_UserID FROM {databaseName}.{objectQualifier}prov_Membership WHERE ApplicationID = ici_ApplicationID AND UsernameLwd = LOWER(i_UserName);
 
 	IF (ici_UserID IS NOT NULL) THEN
 	
 		/*Delete records from membership*/
 		DELETE FROM {databaseName}.{objectQualifier}prov_Membership WHERE UserID = ici_UserID;
 		/*Delete from Role table*/
 		DELETE FROM {databaseName}.{objectQualifier}prov_RoleMembership WHERE UserID = ici_UserID;
 		/*Delete from Profile table*/
 		DELETE FROM {databaseName}.{objectQualifier}prov_Profile WHERE UserID = ici_UserID;
 	END IF;	
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_deleterole
 (
 i_ApplicationName VARCHAR(256),
 i_Rolename VARCHAR(256),
 i_DeleteOnlyIfRoleIsEmpty TINYINT(1)
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE ici_RoleID BINARY(16);
 	DECLARE ici_ErrorCode INT;
 	DECLARE ici_ApplicationID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);	
 	
 	SET ici_ErrorCode = 0;
 	SET ici_RoleID = (SELECT RoleID FROM {databaseName}.{objectQualifier}prov_Role r WHERE r.RolenameLwd=LOWER(i_Rolename) AND r.ApplicationID = ici_ApplicationID);
 	
 	IF (i_DeleteOnlyIfRoleIsEmpty <> 0) THEN
 		IF (EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}prov_RoleMembership rm WHERE rm.RoleID=ici_RoleID)) THEN
 			SET ici_ErrorCode = 2; END IF;
 	ELSE
 		DELETE FROM {databaseName}.{objectQualifier}prov_RoleMembership WHERE RoleID=ici_RoleID;
 	END IF;	
 
 	IF (ici_ErrorCode = 0) THEN
 		DELETE FROM {databaseName}.{objectQualifier}prov_Role WHERE RoleID=ici_RoleID; END IF;
     
     SELECT ici_ErrorCode;	
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_getallusers
 (
 i_ApplicationName VARCHAR(256),
 i_PageIndex INT,
 i_PageSize INT,
 INOUT i_TotalRecords INT 
 )
 MODIFIES SQL DATA
 BEGIN
 
    /*Set the page bounds*/
     DECLARE ici_ApplicationID BINARY(16);
     DECLARE ici_PagingLowerBoundary INT;
     DECLARE ici_PagingUpperBoundary INT;
    
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 

  IF (i_PageIndex < 0 ) THEN
     SET ici_PagingLowerBoundary = ((i_PageSize) * (i_PageIndex))+1;
     SET ici_PagingUpperBoundary = ((i_PageIndex +1)*(i_PageSize))+1;

     ELSE
     SET ici_PagingLowerBoundary = i_PageSize*i_PageIndex;
      SET ici_PagingUpperBoundary = i_PageSize -1 + ici_PagingLowerBoundary;
END IF;
 	 DROP TABLE IF EXISTS tmpRowNumber;
 	CREATE TEMPORARY TABLE tmpRowNumber (RowNumber SERIAL, UserID BINARY(16), UNIQUE KEY (UserID, RowNumber));
 	
 	INSERT INTO tmpRowNumber (UserID) SELECT m.UserID FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON m.ApplicationID = a.ApplicationID WHERE a.ApplicationID = ici_ApplicationID;
 SET i_TotalRecords = (SELECT COUNT(RowNumber) FROM tmpRowNumber);
 	SELECT m.*, r.RowNumber FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN tmpRowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= ici_PagingLowerBoundary AND r.RowNumber <= ici_PagingUpperBoundary;     
 	
 	DROP TABLE IF EXISTS tmpRowNumber;	
    
 END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_resetpassword
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Password VARCHAR(256),
 i_PasswordSalt VARCHAR(256),
 i_PasswordFormat VARCHAR(256),
 i_MaxInvalidAttempts INT,
 i_PasswordAttemptWindow INT,
 i_CurrentTimeUtc DATETIME
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	UPDATE {databaseName}.{objectQualifier}prov_Membership SET
 	Password = i_Password,
 	PasswordSalt = i_PasswordSalt,
 	PasswordFormat = i_PasswordFormat,
 	LastPasswordChange = i_CurrentTimeUtc
 	WHERE ApplicationID = ici_ApplicationID AND
 	UsernameLwd = LOWER(i_UserName);
 
 END;
--GO 
  
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_getuser
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_UserKey CHAR(36),
 i_UserIsOnline TINYINT(1),
i_UTCTIMESTAMP datetime
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	IF (i_UserKey IS NULL) THEN
 		SELECT m.* FROM {databaseName}.{objectQualifier}prov_Membership m 
                  WHERE m.UsernameLwd = LOWER(i_UserName) AND m.ApplicationID = ici_ApplicationID LIMIT 1;
 	ELSE
 		SELECT m.* FROM {databaseName}.{objectQualifier}prov_Membership m 
                  WHERE m.UserID = UNHEX(REPLACE(i_UserKey,'-','')) AND m.ApplicationID = ici_ApplicationID LIMIT 1;
        END IF; 
 	
 	/*IF USER IS ONLINE DO AN UPDATE USER*/	
 	IF (i_UserIsOnline = 1) THEN 	
 		UPDATE {databaseName}.{objectQualifier}prov_Membership SET LastActivity = i_UTCTIMESTAMP WHERE UsernameLwd = LOWER(i_UserName) and ApplicationID = ici_ApplicationID;
 	END IF;		
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_profile_deleteinactive
 (
 i_ApplicationName VARCHAR(256),
 i_InactiveSinceDate DATETIME
 )
 MODIFIES SQL DATA
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
     DELETE
     FROM    {databaseName}.{objectQualifier}prov_Profile
     WHERE   UserID IN
             (   SELECT  UserID
                 FROM    {databaseName}.{objectQualifier}prov_Membership m
                 WHERE   ApplicationID = ici_ApplicationID
                         AND (UNIX_TIMESTAMP(LastActivity) <= UNIX_TIMESTAMP(i_InactiveSinceDate))
             );
 
     SELECT  ROW_COUNT();
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_profile_getnumberinactiveprofiles
    ( i_ApplicationName        VARCHAR(256),
     i_InactiveSinceDate      DATETIME)

 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
     SELECT  COUNT(1)
     FROM    {databaseName}.{objectQualifier}prov_Membership m, {databaseName}.{objectQualifier}prov_Profile p
     WHERE   ApplicationID = ici_ApplicationID
         AND m.UserID = p.UserID
         AND (UNIX_TIMESTAMP(LastActivity) <= UNIX_TIMESTAMP(i_InactiveSinceDate));
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_createrole
 (
 i_ApplicationName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	IF (NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}prov_Role r WHERE r.ApplicationID = ici_ApplicationID AND r.RolenameLwd = LOWER(i_Rolename))) THEN
 		INSERT INTO {databaseName}.{objectQualifier}prov_Role (RoleID, ApplicationID,  RoleName, RoleNameLwd) VALUES (UNHEX(REPLACE(UUID(),'-','')),ici_ApplicationID, i_Rolename,LOWER(i_Rolename)); END IF;		
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_findusersinrole
 (
 i_ApplicationName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_RoleID BINARY(16);
 	DECLARE ici_ApplicationID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	SET ici_RoleID = (SELECT RoleID FROM {databaseName}.{objectQualifier}prov_Role r INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON r.ApplicationID = a.ApplicationID WHERE r.RolenameLwd=LOWER(i_Rolename) AND a.ApplicationID = ici_ApplicationID);
 
 	SELECT m.* FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_RoleMembership rm ON m.UserID = rm.UserID WHERE rm.RoleID = ici_RoleID;
 		
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_isuserinrole
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	SELECT m.* FROM {databaseName}.{objectQualifier}prov_RoleMembership rm 
 		INNER JOIN {databaseName}.{objectQualifier}prov_Membership m ON rm.UserID = m.UserID
 		INNER JOIN {databaseName}.{objectQualifier}prov_Role r ON rm.RoleID = r.RoleID
 		WHERE m.UsernameLwd=LOWER(i_UserName) AND r.RolenameLwd =LOWER(i_Rolename) AND r.ApplicationID = ici_ApplicationID LIMIT 1;
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_unlockuser
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID  BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	UPDATE {databaseName}.{objectQualifier}prov_Membership SET
 	IsLockedOut = 0,
 	FailedPasswordAttempts = 0
 	WHERE ApplicationID = ici_ApplicationID AND
 	UsernameLwd = LOWER(i_UserName);
 
END;
 --GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_changepasswordquestionandanswer
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_PasswordQuestion VARCHAR(256),
 i_PasswordAnswer VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	UPDATE {databaseName}.{objectQualifier}prov_Membership SET PasswordQuestion=i_PasswordQuestion, PasswordAnswer=i_PasswordAnswer
 	WHERE UsernameLwd=LOWER(i_UserName) and ApplicationID=ici_ApplicationID;
 
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_createuser
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Password VARCHAR(256),
 i_PasswordSalt VARCHAR(256),
 i_PasswordFormat VARCHAR(256),
 i_Email VARCHAR(256),
 i_PasswordQuestion VARCHAR(256),
 i_PasswordAnswer VARCHAR(256),
 i_IsApproved TINYINT(1),
 INOUT i_UserKey CHAR(36) 
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16); 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	IF i_UserKey IS NULL THEN
 		SET i_UserKey =UUID();END IF;
 		
 	INSERT INTO {databaseName}.{objectQualifier}prov_Membership (UserID, UserUUID,ApplicationID, Username,UsernameLwd,Password,PasswordSalt,PasswordFormat,Email,EmailLwd,PasswordQuestion,PasswordAnswer,IsApproved)
 		VALUES (UNHEX(REPLACE(i_UserKey,'-','')),i_UserKey, ici_ApplicationID,i_UserName, LOWER(i_UserName), i_Password, i_PasswordSalt, i_PasswordFormat, i_Email, LOWER(i_Email), i_PasswordQuestion, i_PasswordAnswer, i_IsApproved);
END;
--GO 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_findusersbyemail
 (
 i_ApplicationName VARCHAR(256),
 i_EmailAddress VARCHAR(256),
 i_PageIndex INT,
 i_PageSize INT,
 OUT i_TotalRecords INT
 )
 BEGIN
 
     /*Set the page bounds*/
 	DECLARE ici_ApplicationID BINARY(16);
     DECLARE ici_PagingLowerBoundary INT;
     DECLARE ici_PagingUpperBoundary INT;
    /* DECLARE i_TotalRecords   INT;*/
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 

     IF (i_PageIndex < 0 ) THEN
     SET ici_PagingLowerBoundary = ((i_PageSize) * (i_PageIndex))+1;
     SET ici_PagingUpperBoundary = ((i_PageIndex +1)*(i_PageSize))+1;

     ELSE
     SET ici_PagingLowerBoundary = i_PageSize*i_PageIndex;
      SET ici_PagingUpperBoundary = i_PageSize -1 + ici_PagingLowerBoundary ;
END IF;

     DROP TABLE IF EXISTS tmpRowNumber;
 	CREATE TEMPORARY TABLE tmpRowNumber (RowNumber SERIAL, UserID BINARY(16), UNIQUE KEY (UserID, RowNumber));
 	
 	INSERT INTO tmpRowNumber (UserID) SELECT m.UserID FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = ici_ApplicationID AND m.EmailLwd = LOWER(i_EmailAddress);
 
 	
     
 	SET i_TotalRecords = (SELECT COUNT(RowNumber) FROM tmpRowNumber);
        SELECT m.*, r.RowNumber FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN tmpRowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= ici_PagingLowerBoundary AND r.RowNumber <= ici_PagingUpperBoundary;
 	DROP TABLE IF EXISTS tmpRowNumber;
 	/*SELECT i_TotalRecords;*/
    
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_findusersbyname
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_PageIndex INT,
 i_PageSize INT, 
 OUT i_TotalRecords   INT 
 )
 BEGIN
 
     /* Set the page bounds*/
DECLARE i_PagingLowerBoundary INT;
     DECLARE i_PagingUpperBoundary INT;
     DECLARE i_TotalRecords   INT;
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
     
     IF (i_PageIndex < 0 ) THEN
     SET i_PagingLowerBoundary = ((i_PageSize) * (i_PageIndex))+1;
     SET i_PagingUpperBoundary= ((i_PageIndex +1)*(i_PageSize))+1;

     ELSE
     SET i_PagingLowerBoundary = i_PageSize*i_PageIndex;
      SET i_PagingUpperBoundary= i_PageSize -1 + i_PagingLowerBoundary ;
END IF;

     DROP TABLE IF EXISTS tmpRowNumber;
 	CREATE TEMPORARY TABLE tmpRowNumber (RowNumber SERIAL, UserID BINARY(16), UNIQUE KEY (UserID, RowNumber));
 	INSERT INTO tmpRowNumber(UserID) SELECT m.UserID FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON m.ApplicationID = a.ApplicationID WHERE a.ApplicationID = ici_ApplicationID AND m.UsernameLwd LIKE  CONCAT('%' ,LOWER(i_UserName), '%');
 
 	SET i_TotalRecords = (SELECT COUNT(RowNumber) FROM tmpRowNumber);
        SELECT m.*, r.RowNumber FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN tmpRowNumber r ON m.UserID = r.UserID WHERE r.RowNumber >= i_PagingLowerBoundary AND r.RowNumber <= i_PagingUpperBoundary;
 	DROP TABLE IF EXISTS tmpRowNumber;
 	/*SELECT i_TotalRecords;*/
    
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_addusertorole
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_UserID BINARY(16);
 	DECLARE ici_RoleID BINARY(16);
 	DECLARE ici_ApplicationID BINARY(16);
 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	SET ici_UserID = (SELECT UserID FROM {databaseName}.{objectQualifier}prov_Membership m WHERE m.UsernameLwd=LOWER(i_UserName) AND m.ApplicationID = ici_ApplicationID);
 	SET ici_RoleID = (SELECT RoleID FROM {databaseName}.{objectQualifier}prov_Role r WHERE r.RolenameLwd=LOWER(i_Rolename) AND r.ApplicationID = ici_ApplicationID);
 	IF (ici_UserID IS NOT NULL AND ici_RoleID IS NOT NULL) THEN
 	    IF (NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}prov_RoleMembership rm WHERE rm.UserID=ici_UserID AND rm.RoleID=ici_RoleID)) THEN
 		  INSERT INTO {databaseName}.{objectQualifier}prov_RoleMembership (RoleID, UserID) VALUES (ici_RoleID, ici_UserID);
		END IF;
	END IF;
END;
--GO 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_getnumberofusersonline
 (
 i_ApplicationName VARCHAR(256),
 i_TimeWindow INT,
 i_CurrentTimeUtc DATETIME
 )
 BEGIN
 	DECLARE ici_ActivityDate DATETIME;
        DECLARE ici_ApplicationID BINARY(16);
        DECLARE ici_NumberActive INT;

        SET ici_ActivityDate = DATE_SUB(i_CurrentTimeUTC, INTERVAL i_TimeWindow DAY);

 	
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	
 	SET ici_NumberActive = (SELECT COUNT(1) FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = ici_ApplicationID AND m.LastLogin >= ici_ActivityDate);
     
     SELECT ici_NumberActive;
 
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}prov_getusernamebyemail
 (
 i_ApplicationName VARCHAR(256),
 i_Email VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	SELECT m.Username FROM {databaseName}.{objectQualifier}prov_Membership m INNER JOIN {databaseName}.{objectQualifier}prov_Application a ON m.ApplicationID = a.ApplicationID  WHERE a.ApplicationID = ici_ApplicationID AND m.EmailLwd = LOWER(i_Email);
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_profile_deleteprofiles
 (
 i_ApplicationName VARCHAR(256),
 i_UserNames VARCHAR(4000)
 )
 BEGIN
     DECLARE ici_ApplicationID BINARY(16);
     DECLARE ici_UserName     VARCHAR(256);
     DECLARE ici_CurrentPos   INT DEFAULT 1;
     DECLARE ici_NextPos      INT;
     DECLARE ici_NumDeleted   INT DEFAULT 0;
     DECLARE ici_DeletedUser  INT;
     DECLARE ici_ErrorCode    INT DEFAULT 0; 
   
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
     WHILE (ici_CurrentPos <= LEN(i_UserNames)) DO
         SELECT SUBSTRING_INDEX(i_UserNames, ',', ici_CurrentPos) INTO ici_NextPos; 
         IF (ici_NextPos = 0 OR ici_NextPos IS NULL) THEN
             SELECT LEN(i_UserNames) + 1 INTO ici_NextPos; END IF;
 
         SELECT SUBSTRING(i_UserNames, ici_CurrentPos, ici_NextPos - ici_CurrentPos) INTO ici_UserName;
         SELECT ici_NextPos+1 INTO ici_CurrentPos;
 
         IF (LEN(ici_UserName) > 0) THEN         
             SELECT 0 INTO ici_DeletedUser; 
 
 			DELETE LOW_PRIORITY FROM {databaseName}.{objectQualifier}prov_Profile 
 			WHERE UserID IN 
 			(SELECT UserID FROM {databaseName}.{objectQualifier}prov_Membership 
 			WHERE UsernameLwd = LOWER(ici_UserName) 
 			AND ApplicationID = ici_ApplicationID);
 			 
            /* IF( ici_ici_ERROR <> 0 ) THEN           
                 SET ici_ErrorCode = -1
                 GOTO Error
             END IF;*/
             IF (ROW_COUNT() <> 0) THEN
                 SELECT ici_NumDeleted + 1 INTO ici_NumDeleted;END IF;
         END IF;
     END WHILE;
 
     SELECT ici_NumDeleted;
 
     /*RETURN 0
 
 Error:
 
     RETURN ici_ErrorCode*/
END;
--GO 
/* Legacy to delete */
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_profile_getprofiles
 (
 	i_ApplicationName        VARCHAR(256),
 	i_PageIndex              INT,
 	i_PageSize               INT,
 	i_UserNameToMatch        VARCHAR(256),
 	i_InactiveSinceDate      DATETIME,
 	OUT i_TotalCount INT
 )
 BEGIN
  	DECLARE ici_ApplicationID BINARY(16);      
     DECLARE i_PageLowerBound INT;
     DECLARE i_PageUpperBound INT; 
        
   

CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
/*Set the page bounds*/

     SET i_PageLowerBound = i_PageSize*i_PageIndex;
     SET i_PageUpperBound= i_PageSize + i_PageLowerBound;
     SET @_PageLowerBound = i_PageLowerBound;
     SET @_PageUpperBound= i_PageUpperBound;
     
SET @_InactiveSinceDate=i_InactiveSinceDate;
SET @_UserNameToMatch= i_UserNameToMatch;

    		
PREPARE stmt_ppl FROM 'SELECT SQL_CALC_FOUND_ROWS 0 AS TotalCount,m.UserID,m.UserName, m.LastActivity, p.*
     FROM  
     {databaseName}.{objectQualifier}prov_Profile p 
     JOIN {databaseName}.{objectQualifier}prov_Membership m
     ON m.UserID = p.UserID
     WHERE   (? IS NULL OR IFNULL(m.LastActivity,?) <=?)
             AND (? IS NULL OR m.UserNameLwd = LOWER(?)) 
             LIMIT ?,?';     
     EXECUTE stmt_ppl USING @_InactiveSinceDate,@_InactiveSinceDate,@_InactiveSinceDate,@_UserNameToMatch,@_UserNameToMatch,@_PageLowerBound, @_PageUpperBound;
     SET i_TotalCount=FOUND_ROWS();
     DEALLOCATE PREPARE stmt_ppl;    
    END;    
--GO



 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_exists
 (
 i_ApplicationName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 	SELECT COUNT(1) FROM {databaseName}.{objectQualifier}prov_Role
 		WHERE RolenameLwd = LOWER(i_Rolename) AND ApplicationID = ici_ApplicationID;
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_getroles
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
 	
  	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 
 	IF (i_UserName is null) THEN
 		SELECT r.* FROM {databaseName}.{objectQualifier}prov_Role r WHERE r.ApplicationID = ici_ApplicationID;
 	ELSE
 		SELECT
 			r.*
 		FROM
 			{databaseName}.{objectQualifier}prov_Role r
 		INNER JOIN
 			{databaseName}.{objectQualifier}prov_RoleMembership rm ON r.RoleID = rm.RoleID
 		INNER JOIN
 			{databaseName}.{objectQualifier}prov_Membership m ON m.UserID = rm.UserID
 		WHERE
 			r.ApplicationID  = ici_ApplicationID
 			AND m.UsernameLwd = LOWER(i_UserName);
        END IF;
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}prov_role_removeuserfromrole
 (
 i_ApplicationName VARCHAR(256),
 i_UserName VARCHAR(256),
 i_Rolename VARCHAR(256)
 )
 BEGIN
 	DECLARE ici_UserID BINARY(16);
 	DECLARE ici_RoleID BINARY(16);
 	DECLARE ici_ApplicationID BINARY(16);
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);	
 	
 	SET ici_RoleID = (SELECT RoleID FROM {databaseName}.{objectQualifier}prov_Role r WHERE r.RolenameLwd = LOWER(i_Rolename) AND r.ApplicationID = ici_ApplicationID);
 	SET ici_UserID = (SELECT UserID FROM {databaseName}.{objectQualifier}prov_Membership m WHERE m.UsernameLwd=LOWER(i_UserName) AND m.ApplicationID = ici_ApplicationID);
 	
 	DELETE FROM {databaseName}.{objectQualifier}prov_RoleMembership WHERE RoleID = ici_RoleID AND UserID=ici_UserID;
 	
END;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_updateuser
 (
 i_ApplicationName VARCHAR(256),
 i_UserKey CHAR(36),
 i_UserName VARCHAR(256),
 i_Email VARCHAR(256),
 i_Comment TEXT,
 i_IsApproved TINYINT(1),
 i_LastLogin DATETIME,
 i_LastActivity DATETIME,
 i_UniqueEmail TINYINT(1)
 )
 BEGIN
 	DECLARE ici_ApplicationID BINARY(16);
    DECLARE i_Return INT DEFAULT 1;
 
 	CALL {databaseName}.{objectQualifier}prov_CreateApplication (i_ApplicationName, ici_ApplicationID);
 	
 		/* Check UserKey */
 	sproc:BEGIN
        IF (i_UserKey IS NULL) THEN
             SET i_Return = 1 ;			  
			 LEAVE sproc; 
		END IF; 
 
 	/* Check for UniqueEmail */
 	IF (i_UniqueEmail = 1) THEN 	
 		IF (EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}prov_Membership m WHERE m.UserID != UNHEX(REPLACE(i_UserKey,'-','')) AND m.EmailLwd=LOWER(i_Email) AND m.ApplicationID=ici_ApplicationID) )
           THEN  
		   SET i_Return = 2;		 
		   LEAVE sproc; 
		   END IF; 			
 	    END IF;
 	
 	UPDATE {databaseName}.{objectQualifier}prov_Membership SET
 	Username = i_UserName,
 	UsernameLwd = LOWER(i_UserName),
 	Email = i_Email,
 	EmailLwd = LOWER(i_Email),
 	IsApproved = i_IsApproved,
 	LastLogin = i_LastLogin,
 	LastActivity = i_LastActivity,
 	Comment = i_Comment
 	WHERE ApplicationID = ici_ApplicationID AND
 	UserID = UNHEX(REPLACE(i_UserKey,'-',''));
 
 	/* Return successful */
 	 SET i_Return = 0;
     END;
         SELECT i_Return; 
   END;
--GO
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */ 
CREATE PROCEDURE {databaseName}.{objectQualifier}prov_setprofileproperties
 (
 i_userId VARCHAR(64),
 i_index LONGTEXT,
 i_stringData LONGTEXT,
 i_binaryData LONGBLOB
 )
 BEGIN
INSERT INTO {databaseName}.{objectQualifier}prov_Profile(UserID,valueindex,stringdata,binarydata) 
VALUES (UNHEX(REPLACE(i_userId,'-','')), i_index , i_stringData , i_binaryData) 
ON DUPLICATE KEY UPDATE
valueindex=VALUES(valueindex), stringdata=VALUES(stringdata),
binarydata=VALUES(binarydata);
 END;
 --GO





