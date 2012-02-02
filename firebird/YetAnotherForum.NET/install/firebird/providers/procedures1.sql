/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_resetpassword;
--GO 



 DROP PROCEDURE IF EXISTS objQual_P_getuser;
--GO  
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_profile_deleteinactive;
--GO 




/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_role_createrole;
--GO 


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_role_findusersinrole;
--GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_role_isuserinrole;
 --GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_unlockuser;
 --GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_CHANGEPASSQUESTIONANDANSWERWER;
--GO 


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_createuser;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_findusersbyemail;
--GO 


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_findusersbyname;
 --GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_role_addusertorole;
 --GO 

 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_getnumberofusersonline;
--GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_getusernamebyemail;
--GO 


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_PROFILE_DELETEPROFILEs;
--GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_profile_getprofiles;
 --GO 
 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- DROP PROCEDURE IF EXISTS objQual_P_role_deleterole;
-- GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 DROP PROCEDURE IF EXISTS objQual_P_role_exists;
 --GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_role_getroles;
--GO 
 
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_role_removeuserfromrole;
--GO 
 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
DROP PROCEDURE IF EXISTS objQual_P_updateuser;

--GO 


/*CREATE PROCEDURE objQual_P_PROFILE_DELETEPROFILES
 (
 I_APPLICATIONNAME VARCHAR(63),
 i_UserNames VARCHAR(4000)
 )
 RETURNS(ici_NumDeleted INTEGER)
 AS 
     DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
     DECLARE VARIABLE ici_UserName     VARCHAR(63);
     DECLARE VARIABLE ici_CurrentPos   INTEGER DEFAULT 1;
     DECLARE VARIABLE ici_NextPos      INTEGER DEFAULT 0;
     DECLARE VARIABLE ici_Span         INTEGER DEFAULT 0;     
     DECLARE VARIABLE ici_DeletedUser  INTEGER DEFAULT 0;
     DECLARE VARIABLE ici_ErrorCode    INTEGER DEFAULT 0; 
     DECLARE VARIABLE ici_UserNamesLen    INTEGER DEFAULT 0; 
     
 BEGIN
     
    -- ici_ErrorCode = 0;
    -- ici_CurrentPos = 1;
    -- ici_Span = 0;
     ici_NumDeleted = 0;
     ici_UserNamesLen=CHAR_LENGTH(:i_UserNames);
 
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
         
     WHILE (ici_CurrentPos <= ici_UserNamesLen) DO
     begin     
         ici_NextPos = POSITION(',', :i_UserNames, :ici_CurrentPos); 
         IF (:ici_NextPos = 0 OR :ici_NextPos IS NULL) THEN
         begin
         ici_NextPos=i_UserNames + 1;
         ici_Span =ici_NextPos - ici_CurrentPos;
         ici_UserName = SUBSTRING(:i_UserNames FROM :ici_CurrentPos FOR :ici_Span);
         ici_CurrentPos = ici_NextPos+1;
         end
 
         IF (CHAR_LENGTH(:ici_UserName) > 0) THEN 
         begin        
             ici_DeletedUser = 0; 
 
 			DELETE FROM objQual_P_PROFILE 
 			WHERE "UserID" IN (SELECT "UserID" 
 			FROM objQual_P_MEMBERSHIP 
 			WHERE "UsernameLwd" = LOWER(:ici_UserName) 
 			AND APPLICATIONID = :ICI_APPLICATIONID16); 
            IF( ici_ici_ERROR <> 0 ) THEN           
                 SET ici_ErrorCode = -1
                 GOTO Error
             END IF;
             IF (ROW_COUNT <> 0) THEN
             ici_NumDeleted = ici_NumDeleted + 1;
       end
    end
 
    
 
     RETURN 0
 
 Error:
 
     RETURN ici_ErrorCode
END;
*/ 





