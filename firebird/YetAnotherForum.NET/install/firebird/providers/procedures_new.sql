-- The procedure converts all uuids to text
create procedure objQual_GET_HEX_UUID
returns(real_uuid char(16) character set OCTETS, hex_uuid varchar(32), varchar64_uuid varchar(64))
AS
declare variable i integer;
declare variable c integer;
BEGIN
real_uuid = GEN_UUID();
hex_uuid = '';
varchar64_uuid = '';
i = 0;
while (i < 16) do
begin
c = ascii_val(substring(real_uuid from i+1 for 1));
if (c < 0) then c = 256 + c;
if ((CHAR_LENGTH(varchar64_uuid)=8) 
OR (CHAR_LENGTH(varchar64_uuid)=12)
OR (CHAR_LENGTH(varchar64_uuid)=16)
OR (CHAR_LENGTH(varchar64_uuid)=20)) then varchar64_uuid = varchar64_uuid || '-';

hex_uuid = hex_uuid
|| substring('0123456789abcdef' from bin_shr(c, 4) + 1 for 1)
|| substring('0123456789abcdef' from bin_and(c, 15) + 1 for 1);
varchar64_uuid=varchar64_uuid
|| substring('0123456789abcdef' from bin_shr(c, 4) + 1 for 1)
|| substring('0123456789abcdef' from bin_and(c, 15) + 1 for 1);

i = i + 1;
end
suspend;
END;
--GO

create procedure objQual_GET_VARCHAR64_UUID
returns(varchar64_uuid varchar(64))
AS
declare variable i integer;
declare variable c integer;
declare variable real_uuid  char(16) character set OCTETS;
BEGIN
real_uuid = GEN_UUID();
varchar64_uuid = '';
i = 0;
while (i < 16) do
begin
c = ascii_val(substring(real_uuid from i+1 for 1));
if (c < 0) then c = 256 + c;
if (CHAR_LENGTH(varchar64_uuid)=8 
OR CHAR_LENGTH(varchar64_uuid)=13
OR CHAR_LENGTH(varchar64_uuid)=18 
OR CHAR_LENGTH(varchar64_uuid)=23) then varchar64_uuid = varchar64_uuid || '-';

varchar64_uuid=varchar64_uuid
|| substring('0123456789abcdef' from bin_shr(c, 4) + 1 for 1)
|| substring('0123456789abcdef' from bin_and(c, 15) + 1 for 1);

i = i + 1;
end
suspend;
END;

--GO

/*create procedure objQual_GET_CHAR16_VARCHAR64
returns(varchar64_uuid varchar(64))
AS
declare variable i integer;
declare variable c integer;
declare variable real_uuid  char(16) character set OCTETS;
BEGIN
real_uuid = '';
i = 0;
while (i < 16) do
begin
c = ascii_val(substring(real_uuid from i+1 for 1));
if (c < 0) then c = 256 + c;
if (CHAR_LENGTH(varchar64_uuid)=8 
OR CHAR_LENGTH(varchar64_uuid)=12
OR CHAR_LENGTH(varchar64_uuid)=16 
OR CHAR_LENGTH(varchar64_uuid)=20) then varchar64_uuid = varchar64_uuid || '-';
SUBSTRING( varchar64_uuid FROM 1 FOR 8) 
SUBSTRING( varchar64_uuid FROM 10 FOR 13) 
SUBSTRING( varchar64_uuid FROM 10 FOR 13) 
SUBSTRING( varchar64_uuid FROM 22 FOR 36) 
varchar64_uuid=varchar64_uuid
|| substring('0123456789abcdef' from bin_shr(c, 4) + 1 for 1)
|| substring('0123456789abcdef' from bin_and(c, 15) + 1 for 1);

i = i + 1;
end
suspend;
END;*/

-- GO

create procedure objQual_GET_VARCHAR64_CHAR16(real_uuid  char(16) character set OCTETS) 
returns(varchar64_uuid varchar(64))
AS
declare variable i integer;
declare variable c integer;
BEGIN
varchar64_uuid = '';
i = 0;
while (i < 16) do
begin
c = ascii_val(substring(real_uuid from i+1 for 1));
if (c < 0) then c = 256 + c;
if (CHAR_LENGTH(varchar64_uuid)=8 
OR CHAR_LENGTH(varchar64_uuid)=12
OR CHAR_LENGTH(varchar64_uuid)=16 
OR CHAR_LENGTH(varchar64_uuid)=20) 
then varchar64_uuid = varchar64_uuid || '-';

varchar64_uuid=varchar64_uuid
|| substring('0123456789abcdef' from bin_shr(c, 4) + 1 for 1)
|| substring('0123456789abcdef' from bin_and(c, 15) + 1 for 1);

i = i + 1;
end
suspend;
END;

--GO


 CREATE PROCEDURE objQual_P_CREATEAPPLICATION
 (
 I_APPLICATIONNAME VARCHAR(63)
 )
RETURNS (I_APPLICATIONID  CHAR(16) CHARACTER SET OCTETS)
AS
 BEGIN
 	SELECT "ApplicationID" FROM objQual_P_APPLICATION WHERE "ApplicationNameLwd"=LOWER(:I_APPLICATIONNAME) INTO :I_APPLICATIONID;
 	
 	IF (I_APPLICATIONID IS NULL) THEN 
 	begin
 		I_APPLICATIONID = GEN_UUID(); 		  
         INSERT  INTO objQual_P_APPLICATION ("ApplicationID", "ApplicationName", "ApplicationNameLwd")
             VALUES  (:I_APPLICATIONID, :I_APPLICATIONNAME, LOWER(:I_APPLICATIONNAME));
    end    
 END;
 
--GO

CREATE PROCEDURE objQual_P_UPGRADE
(
PreviousVersion INTEGER,
NewVersion INTEGER
)
AS
BEGIN
		IF (PreviousVersion = 32 OR PreviousVersion = 31) THEN
		BEGIN
			-- RESOLVE SALT ISSUE IN 193 RC2
			UPDATE objQual_P_MEMBERSHIP SET "PasswordSalt"='UwB5AHMAdABlAG0ALgBCAHkAdABlAFsAXQA=' WHERE "PasswordSalt" IS NOT NULL;
			UPDATE objQual_P_MEMBERSHIP SET JOINED=current_date WHERE JOINED IS NULL;
		END	
END; 
--GO
 -- DROP PROCEDURE IF EXISTS objQual_P_CHANGEPASSWORD;

 CREATE PROCEDURE objQual_P_CHANGEPASSWORD(
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_PASSWORD VARCHAR(63),
 I_PASSWORDSALT VARCHAR(63),
 I_PASSWORDFORMAT VARCHAR(63),
 I_PASSWORDANSWER VARCHAR(63)
 ) AS 
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 	
    EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16;
        	
 	UPDATE objQual_P_MEMBERSHIP SET "PASSWORD"=:I_PASSWORD, "PasswordSalt"=:I_PASSWORDSALT,
 		"PasswordFormat"=:I_PASSWORDFORMAT, "PasswordAnswer"=:I_PASSWORDANSWER
 	WHERE "UsernameLwd"=LOWER(:I_USERNAME) and "ApplicationID"=:ICI_APPLICATIONID16;
 
 END;
--GO


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- DROP PROCEDURE IF EXISTS objQual_P_deleteuser;
 -- GO 
 CREATE PROCEDURE objQual_P_DELETEUSER
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_DELETEALLRELATED BOOLEAN
 ) AS     	
    DECLARE VARIABLE ICI_USERID16 CHAR(16); 
 	DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 
 	
    EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16;
 
 	/*get the userID*/
 	SELECT   USERID  FROM objQual_P_MEMBERSHIP 
 	WHERE "ApplicationID" = :ICI_APPLICATIONID16 
 	AND "UsernameLwd" = LOWER(:I_USERNAME) INTO  :ICI_USERID16;

        
 	IF (ICI_USERID16 IS NOT NULL) THEN
 	begin
 		/*Delete records from membership*/
 		DELETE FROM objQual_P_MEMBERSHIP WHERE USERID = :ICI_USERID16;
 		/*Delete from Role table*/
 		DELETE FROM objQual_P_ROLEMEMBERSHIP WHERE USERID = :ICI_USERID16;
 		/*Delete from Profile table*/
 		DELETE FROM objQual_P_PROFILE WHERE USERID = :ICI_USERID16;
 	end	
END;
--GO



 


-- Implement here user name for temp table check column and so for all data layers!
-- DROP PROCEDURE IF EXISTS objQual_P_GETALLUSERS;
-- GO 
CREATE PROCEDURE objQual_P_GETALLUSERS
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_PAGEINDEX INTEGER,
 I_PAGESIZE INTEGER 
 )
 RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1,
  "RowNumber" INTEGER)
  AS  
   DECLARE VARIABLE ICI_USERID CHAR(16) CHARACTER SET OCTETS;
   DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
   DECLARE VARIABLE ICI_PAGINGLOWERBOUNDARY INTEGER;
   DECLARE VARIABLE ICI_PAGINGUPPERBOUNDARY INTEGER;
   DECLARE VARIABLE ICI_TOTALRECORDS INTEGER;
 BEGIN

  EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
    /*Set the page bounds*/
    IF (I_PAGEINDEX < 0 ) THEN
       begin
     ICI_PAGINGLOWERBOUNDARY = ((I_PAGESIZE) * (I_PAGEINDEX))+1;
     ICI_PAGINGUPPERBOUNDARY = ((I_PAGEINDEX +1)*(I_PAGESIZE))+1;
       end
     ELSE
       begin
     ICI_PAGINGLOWERBOUNDARY = I_PAGESIZE*I_PAGEINDEX;
     ICI_PAGINGUPPERBOUNDARY = I_PAGESIZE -1 + ICI_PAGINGLOWERBOUNDARY;
       end
  
   

 	
   
 	 FOR SELECT  FIRST(:ICI_PAGINGUPPERBOUNDARY) SKIP(:ICI_PAGINGLOWERBOUNDARY)
 	 m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment", 	  
 	 (SELECT :ICI_TOTALRECORDS FROM rdb$database) AS "RowNumber" 
 	FROM objQual_P_MEMBERSHIP m  
 	WHERE  m."ApplicationID" = :ICI_APPLICATIONID16
 	INTO 
  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment",
  :"RowNumber"
 	DO
 	 	begin
 	 --	EXECUTE PROCEDURE objQual_GET_VARCHAR64_CHAR16 m.USERID
     --   RETURNING_VALUES :ICI_USERID;
     --   EXECUTE PROCEDURE objQual_GET_VARCHAR64_CHAR16 m."ApplicationID"
     --   RETURNING_VALUES :ICI_APPLICATIONID;
 	 	ICI_TOTALRECORDS=ICI_TOTALRECORDS+1;
 	 	SUSPEND; 	  	      
        end 
           
 END;
--GO


CREATE PROCEDURE objQual_P_RESETPASSWORD
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_PASSWORD VARCHAR(63),
 I_PASSWORDSALT VARCHAR(63),
 I_PASSWORDFORMAT VARCHAR(63),
 I_MAXINVALIDATTEMPTS INTEGER,
 I_PASSWORDATTEMPTWINDOW INTEGER,
 I_CURRENTTIMEUTC TIMESTAMP
 )
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
    
 	  EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 	UPDATE objQual_P_MEMBERSHIP SET
 	"PASSWORD" = :I_PASSWORD,
 	"PasswordSalt" = :I_PASSWORDSALT,
 	"PasswordFormat" = :I_PASSWORDFORMAT,
 	"LastPasswordChange" = :I_CURRENTTIMEUTC
 	WHERE "ApplicationID" = :ICI_APPLICATIONID16 AND
 	"UsernameLwd" = LOWER(:I_USERNAME);
 
 END;
--GO 

CREATE PROCEDURE objQual_P_GETUSER
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_USERKEY CHAR(16) CHARACTER SET OCTETS,
 i_UserIsOnline BOOLEAN,
 I_UTCTIMESTAMP TIMESTAMP
 )
  RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1)
 AS
 --DECLARE VARIABLE ICI_APPLICATIONID VARCHAR(64);
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 DECLARE VARIABLE ICI_USERID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
        
 	-- (SELECT * FROM objQual_GET_VARCHAR64_CHAR16(m.USERID)) AS "UserID",
 	-- (SELECT * FROM  objQual_GET_VARCHAR64_CHAR16(m."ApplicationID")) AS "ApplicationID",
 	IF (I_USERKEY IS NULL) THEN 	
 	SELECT
 	 m.USERID,
 	 m."ApplicationID", 	
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment"
 	  	 FROM objQual_P_MEMBERSHIP m 
                  WHERE m."UsernameLwd" = LOWER(:I_USERNAME) 
                  AND m."ApplicationID" = :ICI_APPLICATIONID16
                  INTO 
  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment"; 	
 	
 	ELSE
 	begin 	
       
 		SELECT 
 	 m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment" FROM objQual_P_MEMBERSHIP m 
                  WHERE m.USERID = :I_USERKEY 
                  AND m."ApplicationID" = :ICI_APPLICATIONID16
         INTO 
  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment"; 
  end         
        
 	
 	/*IF USER IS ONLINE DO AN UPDATE OF THE USER*/	
 	IF (i_UserIsOnline = 1) THEN 	
 		UPDATE objQual_P_MEMBERSHIP 
 		SET "LastActivity" = :I_UTCTIMESTAMP 
 		WHERE "UsernameLwd" = LOWER(:I_USERNAME) 
 		and "ApplicationID" = :ICI_APPLICATIONID16;
 	SUSPEND;	
END;
--GO 

CREATE PROCEDURE objQual_P_UNLOCKUSER
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63)
 )
 AS 
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 	UPDATE objQual_P_MEMBERSHIP SET
 	"IsLockedOut" = 0,
 	"FailedPasswordAttempts" = 0
 	WHERE "ApplicationID" = :ICI_APPLICATIONID16 AND
 	"UsernameLwd" = LOWER(:I_USERNAME);
 
END;
 --GO 
 
  CREATE PROCEDURE objQual_P_CHANGEPASSQUEANDANS
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_PASSWORDQUESTION VARCHAR(63),
 I_PASSWORDANSWER VARCHAR(63)
 )
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 	
 		EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 	UPDATE objQual_P_MEMBERSHIP SET "PasswordQuestion"=:I_PASSWORDQUESTION, "PasswordAnswer"=:I_PASSWORDANSWER
 	WHERE "UsernameLwd"=LOWER(:I_USERNAME) and "ApplicationID"=:ICI_APPLICATIONID16;
 
END;
--GO

CREATE PROCEDURE objQual_P_CREATEUSER
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_PASSWORD VARCHAR(63),
 I_PASSWORDSALT VARCHAR(63),
 I_PASSWORDFORMAT VARCHAR(63),
 I_EMAIL VARCHAR(63),
 I_PASSWORDQUESTION VARCHAR(63),
 I_PASSWORDANSWER VARCHAR(63),
 I_ISAPPROVED BOOLEAN,
 I_USERKEY CHAR(16) CHARACTER SET OCTETS,
 I_UTCTIMESTAMP  TIMESTAMP
 ) 
  RETURNS (OUT_USERKEY CHAR(16) CHARACTER SET OCTETS)
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 DECLARE VARIABLE ICI_USERKEY16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 		
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
        
 	IF (I_USERKEY IS NULL) THEN
 	begin
 	ICI_USERKEY16 = GEN_UUID();
 	OUT_USERKEY=ICI_USERKEY16;
 	-- SELECT * FROM objQual_GET_VARCHAR64_CHAR16(:ICI_USERKEY16) INTO :OUT_USERKEY;
  	end	
 	INSERT INTO objQual_P_MEMBERSHIP ("UserID","ApplicationID","Username","UsernameLwd","PASSWORD","PasswordSalt","PasswordFormat","EMAIL","EmailLwd","PasswordQuestion","PasswordAnswer",ISAPPROVED,JOINED)
 		VALUES (:ICI_USERKEY16, :ICI_APPLICATIONID16 ,:I_USERNAME, LOWER(:I_USERNAME), :I_PASSWORD, :I_PASSWORDSALT, :I_PASSWORDFORMAT, :I_EMAIL, LOWER(:I_EMAIL), :I_PASSWORDQUESTION, :I_PASSWORDANSWER, :I_ISAPPROVED,:I_UTCTIMESTAMP);
SUSPEND;
END;
--GO 

CREATE PROCEDURE objQual_P_FINDUSERSBYEMAIL
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_EMAILADDRESS VARCHAR(63),
 I_PAGEINDEX INTEGER,
 I_PAGESIZE INTEGER
 )
 RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1,
  "RowNumber" INTEGER)
 AS
     DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
     DECLARE VARIABLE ICI_PAGINGLOWERBOUNDARY INTEGER;
     DECLARE VARIABLE ICI_PAGINGUPPERBOUNDARY INTEGER;
     DECLARE VARIABLE ICI_ID INTEGER;
      
 BEGIN 
     /*Set the page bounds*/  
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 


       IF (I_PAGEINDEX < 0 ) THEN
       begin
     ICI_PAGINGLOWERBOUNDARY = ((I_PAGESIZE) * (I_PAGEINDEX))+1;
     ICI_PAGINGUPPERBOUNDARY = ((I_PAGEINDEX +1)*(I_PAGESIZE))+1;
       end
     ELSE
       begin
     ICI_PAGINGLOWERBOUNDARY = I_PAGESIZE*I_PAGEINDEX;
     ICI_PAGINGUPPERBOUNDARY = I_PAGESIZE -1 + ICI_PAGINGLOWERBOUNDARY;
       end
  


-- SET GENERATOR PFUBM TO 0;
     FOR SELECT  FIRST(:ICI_PAGINGUPPERBOUNDARY) SKIP(:ICI_PAGINGLOWERBOUNDARY)
     m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment", 
 	 (SELECT :ICI_ID FROM rdb$database) AS "RowNumber" FROM objQual_P_MEMBERSHIP m  
        WHERE m."EmailLwd" = LOWER(:I_EMAILADDRESS)       
         INTO 
  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment",
  :"RowNumber"
  DO
  begin
  ICI_ID = ICI_ID+1;
   SUSPEND;
  end 
   
END;
--GO 

CREATE PROCEDURE objQual_P_FINDUSERSBYNAME
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 I_PAGEINDEX INTEGER,
 I_PAGESIZE INTEGER
 )
RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1,
  "RowNumber" INTEGER)
 AS
     DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
     DECLARE VARIABLE ICI_PAGINGLOWERBOUNDARY INTEGER;
     DECLARE VARIABLE ICI_PAGINGUPPERBOUNDARY INTEGER;
     DECLARE VARIABLE ICI_ID INTEGER;
 BEGIN    
    
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 
      /* Set the page bounds*/
      
     IF (I_PAGEINDEX < 0 ) THEN
      begin
     ICI_PAGINGLOWERBOUNDARY = ((I_PAGESIZE) * (I_PAGEINDEX))+1;
     ICI_PAGINGUPPERBOUNDARY= ((I_PAGEINDEX +1)*(I_PAGESIZE))+1;
      end
     ELSE
      begin
     ICI_PAGINGLOWERBOUNDARY = I_PAGESIZE*I_PAGEINDEX;
     ICI_PAGINGUPPERBOUNDARY= I_PAGESIZE -1 + ICI_PAGINGLOWERBOUNDARY ;
      end


  --  SET GENERATOR PFUBN TO 0;  
  --  SELECT m.*, GEN_ID(PFUBN, 1) AS "RowNumber" 
 
         FOR SELECT  FIRST(:ICI_PAGINGUPPERBOUNDARY) SKIP(:ICI_PAGINGLOWERBOUNDARY)
     m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment", 
 	 (SELECT :ICI_ID FROM rdb$database) AS "RowNumber" 
 	 FROM objQual_P_MEMBERSHIP m  
       WHERE m."UsernameLwd" = LOWER(:I_USERNAME)       
         INTO 
  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment",
  :"RowNumber" 
  DO
  begin
  ICI_ID = ICI_ID+1;
   SUSPEND;
  end 
   
END;
--GO 

 CREATE PROCEDURE objQual_P_GETUSERNAMEBYEMAL
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_EMAIL VARCHAR(63)
 )
 RETURNS ("Username" VARCHAR(63))
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 
 	FOR SELECT m."Username" FROM objQual_P_MEMBERSHIP m 
 	INNER JOIN objQual_P_APPLICATION a 
 	ON m."ApplicationID" = a."ApplicationID"  
 	WHERE a."ApplicationID" = :ICI_APPLICATIONID16 
 	AND m."EmailLwd" = LOWER(:I_EMAIL)
 	INTO :"Username" 	
 	DO
 	SUSPEND;
END;
--GO 

 CREATE PROCEDURE objQual_P_GETNUMBEROFUSERSONLINE
 (
 I_APPLICATIONNAME VARCHAR(63),
 i_TimeWindow INTEGER,
 I_CURRENTTIMEUTC TIMESTAMP
 )
 RETURNS (ici_NumberActive  INTEGER)
 AS
 	DECLARE VARIABLE ici_ActivityDate TIMESTAMP;
    DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 

      -- ici_ActivityDate = DATEDIFF(i_CurrentTimeUTC, INTERVAL i_TimeWindow DAY);

 	ici_ActivityDate =DATEDIFF(DAY, current_date,(cast(:i_CurrentTimeUTC as date) -5)) ;
 	
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 	
 	 SELECT COUNT(1) FROM objQual_P_MEMBERSHIP m 
 	 INNER JOIN objQual_P_APPLICATION a 
 	 ON m."ApplicationID" = a."ApplicationID"  
 	 WHERE a."ApplicationID" = :ICI_APPLICATIONID16 
 	 AND m."LastLogin" >= :ici_ActivityDate 
 	 INTO :ici_NumberActive;    
     SUSPEND; 
END;
--GO 

CREATE PROCEDURE objQual_P_UPDATEUSER
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERKEY CHAR(16) CHARACTER SET OCTETS,
 I_USERNAME VARCHAR(63),
 i_Email VARCHAR(63),
 i_Comment BLOB SUB_TYPE 1 SEGMENT SIZE 80,
 I_ISAPPROVED BOOLEAN,
 i_LastLogin TIMESTAMP,
 i_LastActivity TIMESTAMP,
 i_UniqueEmail BOOLEAN
 )
 AS
    DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
    DECLARE VARIABLE i_Return INTEGER DEFAULT 1;
 BEGIN 	
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 		/* Check UserKey */

        IF (I_USERKEY IS NULL) THEN
        begin
         i_Return = 1 ; EXIT; 
        end
 
 	/* Check for UniqueEmail */
 	IF (i_UniqueEmail = 1) THEN 	
 		IF (EXISTS (SELECT 1 FROM objQual_P_MEMBERSHIP m 
 		WHERE m.USERID != :I_USERKEY 
 		AND m."EmailLwd"=LOWER(:i_Email) 
 		AND m."ApplicationID"=:ICI_APPLICATIONID16) ) THEN
 		begin
       i_Return = 2; EXIT; 			
 	    end
 	
 	UPDATE objQual_P_MEMBERSHIP SET
 	"Username" = :I_USERNAME,
 	"UsernameLwd" = LOWER(:I_USERNAME),
 	"EMAIL" = :i_Email,
 	"EmailLwd" = LOWER(:i_Email),
 	ISAPPROVED = :I_ISAPPROVED,
 	"LastLogin" = :i_LastLogin,
 	"LastActivity" = :i_LastActivity
 	WHERE "ApplicationID" = :ICI_APPLICATIONID16 AND
 	"UserID" = :I_USERKEY;
 
 	/* Return successful */
 	 i_Return = 0;        
END;
--GO

/* ROLE PROVIDER */

CREATE PROCEDURE objQual_P_ROLE_DELETEROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_ROLENAME VARCHAR(63),
 I_DELETEONLYIFROLEISEMPTY BOOLEAN
 )
 RETURNS (ICI_ERRORCODE INTEGER)
 AS
   DECLARE VARIABLE ICI_ROLEID16 CHAR(16) CHARACTER SET OCTETS;
   DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 	
 	  EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16;
 	
    ICI_ERRORCODE = 0;
 	SELECT r."RoleID" FROM objQual_P_ROLE r 
 	WHERE r."RoleNameLwd"=LOWER(:I_ROLENAME) 
 	AND r."ApplicationID" = :ICI_APPLICATIONID16 INTO :ICI_ROLEID16;
 	
 	IF (I_DELETEONLYIFROLEISEMPTY <> 0) THEN
 	        begin
 		      IF (EXISTS (SELECT 1 FROM objQual_P_ROLEMEMBERSHIP rm WHERE rm."RoleID"=:ICI_ROLEID16)) THEN
 			      ICI_ERRORCODE = 2; 
 			end
 	ELSE
 		DELETE FROM objQual_P_ROLEMEMBERSHIP WHERE "RoleID" = :ICI_ROLEID16;
 	
 
 	IF (ICI_ERRORCODE = 0) THEN
 		DELETE FROM objQual_P_ROLE WHERE "RoleID" =:ICI_ROLEID16;    
 END;

--GO

CREATE PROCEDURE objQual_P_ROLE_CREATEROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
 AS
  DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 	
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 	
 	IF (NOT EXISTS(SELECT 1 FROM objQual_P_ROLE r WHERE r."ApplicationID" = :ICI_APPLICATIONID16 
 	AND r."RoleNameLwd" = LOWER(:i_Rolename))) THEN
 		INSERT INTO objQual_P_ROLE ("RoleID", "ApplicationID", "RoleName", "RoleNameLwd") 
 		VALUES (GEN_UUID(),:ICI_APPLICATIONID16, :i_Rolename,LOWER(:i_Rolename));
 				
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_FINDUSERSINROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
 RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1)
 AS
    DECLARE VARIABLE ICI_ROLEID16 CHAR(16) CHARACTER SET OCTETS;
 	DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 	
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 
 	SELECT r."RoleID" FROM objQual_P_ROLE r 
 	INNER JOIN objQual_P_APPLICATION a 
 	ON r."ApplicationID" = a."ApplicationID" 
 	WHERE r."RoleNameLwd"=LOWER(:i_Rolename) 
 	AND a."ApplicationID" = :ICI_APPLICATIONID16 
 	INTO :ici_RoleID16;
 
 	FOR SELECT
 	 m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment"   FROM objQual_P_MEMBERSHIP m 
 	 INNER JOIN objQual_P_ROLEMEMBERSHIP rm 
 	 ON m.USERID = rm.USERID 
 	 WHERE rm."RoleID" = :ici_RoleID16
 	 INTO
 	   :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment"
 		DO
 		begin
 		SUSPEND;
 		end
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_ISUSERINROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
  RETURNS( "UserID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "Username" VARCHAR(63) ,
  "UsernameLwd" VARCHAR(63) ,
  "Password" VARCHAR(63),
  "PasswordSalt" VARCHAR(63),
  "PasswordFormat" VARCHAR(63),
  "Email" VARCHAR(63),
  "EmailLwd" VARCHAR(63),
  "PasswordQuestion" VARCHAR(63),
  "PasswordAnswer" VARCHAR(63),
  "IsApproved" SMALLINT,
  "IsLockedOut" SMALLINT,
  "LastLogin" TIMESTAMP,
  "LastActivity" TIMESTAMP,
  "LastPasswordChange" TIMESTAMP,
  "LastLockOut" TIMESTAMP,
  "FailedPasswordAttempts" INTEGER,
  "FailedAnswerAttempts" INTEGER,
  "FailedPasswordWindow" TIMESTAMP,
  "FailedAnswerWindow" TIMESTAMP,
  "Joined" TIMESTAMP,
  "Comment" BLOB SUB_TYPE 1)
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN 	
 
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 
 FOR SELECT 
     m.USERID AS "UserID",
 	 m."ApplicationID" AS "ApplicationID",
 	 m."Username",
 	 m."UsernameLwd",
 	 m."PASSWORD",
 	 m."PasswordSalt",
 	 m."PasswordFormat",
 	 m."EMAIL",
 	 m."EmailLwd",
 	 m."PasswordQuestion",
 	 m."PasswordAnswer",
 	 m.ISAPPROVED,
 	 m."IsLockedOut",
 	 m."LastLogin", 	 
 	 m."LastActivity", 	 
 	 m."LastPasswordChange", 	 
 	 m."LastLockOut", 	 
 	 m."FailedPasswordAttempts", 	
 	 m."FailedAnswerAttempts",
 	 m."FailedPasswordWindow",
 	 m."FailedAnswerWindow",
 	 m.JOINED,
 	 m."Comment" FROM objQual_P_ROLEMEMBERSHIP rm 
 		INNER JOIN objQual_P_MEMBERSHIP m ON rm.USERID = m.USERID
 		INNER JOIN objQual_P_ROLE r ON rm."RoleID" = r."RoleID"
 		WHERE m."UsernameLwd"=LOWER(:I_USERNAME) 
 		AND r."RoleNameLwd" =LOWER(:i_Rolename) 
 		AND r."ApplicationID" = :ICI_APPLICATIONID16
 		INTO
 		  :"UserID" ,
  :"ApplicationID",
  :"Username" ,
  :"UsernameLwd",
  :"Password",
  :"PasswordSalt",
  :"PasswordFormat",
  :"Email",
  :"EmailLwd",
  :"PasswordQuestion",
  :"PasswordAnswer",
  :"IsApproved",
  :"IsLockedOut",
  :"LastLogin",
  :"LastActivity",
  :"LastPasswordChange",
  :"LastLockOut",
  :"FailedPasswordAttempts",
  :"FailedAnswerAttempts",
  :"FailedPasswordWindow",
  :"FailedAnswerWindow",
  :"Joined",
  :"Comment"
  DO
 		begin
 		SUSPEND;
 		end
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_ADDUSERTOROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
 AS 
 	DECLARE VARIABLE ICI_USERID16 CHAR(16) CHARACTER SET OCTETS;
 	DECLARE VARIABLE ICI_ROLEID16 CHAR(16) CHARACTER SET OCTETS;
 	DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 
 	
 	EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
 
 	SELECT m.USERID FROM objQual_P_MEMBERSHIP m 
 	WHERE m."UsernameLwd"=LOWER(:I_USERNAME) 
 	AND m."ApplicationID" = :ICI_APPLICATIONID16 
 	INTO :ici_UserID16;
 	
 	SELECT r."RoleID" FROM objQual_P_ROLE r 
 	WHERE r."RoleNameLwd"=LOWER(:i_Rolename) 
 	AND r."ApplicationID" = :ICI_APPLICATIONID16 
 	INTO :ici_RoleID16;
 	
 	IF (NOT EXISTS(SELECT 1 FROM objQual_P_ROLEMEMBERSHIP rm 
 	WHERE rm.USERID=:ici_UserID16 
 	AND rm."RoleID"=:ici_RoleID16)) 
 	THEN 
 	INSERT INTO objQual_P_ROLEMEMBERSHIP ("RoleID", "UserID")
 	VALUES (:ici_RoleID16, :ici_UserID16);
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_EXISTS
 (
 I_APPLICATIONNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
 RETURNS (OUT_EXISTS INTEGER) 
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN	
 
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
         	
 	SELECT COUNT(1) FROM objQual_P_ROLE
 		WHERE "RoleNameLwd" = LOWER(:i_Rolename) 
 		AND "ApplicationID" = :ICI_APPLICATIONID16 INTO :OUT_EXISTS;
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_GETROLES
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63)
 )
 RETURNS
 ("RoleID" CHAR(16) CHARACTER SET OCTETS,
  "ApplicationID" CHAR(16) CHARACTER SET OCTETS,
  "RoleName" VARCHAR(63),
  "RoleNameLwd"VARCHAR(63))
 AS
DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 	
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16;  
 	IF (I_USERNAME is null) THEN
 	FOR	SELECT 
 		r."RoleID" AS "RoleID",
 	    r."ApplicationID" AS "ApplicationID",
 		r."RoleName",
        r."RoleNameLwd" FROM objQual_P_ROLE r 
 		WHERE r."ApplicationID" = :ICI_APPLICATIONID16
 		INTO 
 		:"RoleID",
        :"ApplicationID",
        :"RoleName",
        :"RoleNameLwd"
 		DO SUSPEND;
 	ELSE
 		FOR SELECT
 		r."RoleID" AS "RoleID",
 	    r."ApplicationID"   AS "ApplicationID",
 		    r."RoleName",
            r."RoleNameLwd"
 		FROM
 			objQual_P_ROLE r
 		INNER JOIN
 			objQual_P_ROLEMEMBERSHIP rm ON r."RoleID" = rm."RoleID"
 		INNER JOIN
 			objQual_P_MEMBERSHIP m ON m.USERID = rm.USERID
 		WHERE
 			r."ApplicationID"  = :ICI_APPLICATIONID16
 			AND m."UsernameLwd" = LOWER(:I_USERNAME)
 			INTO 
 		:"RoleID",
        :"ApplicationID",
        :"RoleName",
        :"RoleNameLwd"
        DO SUSPEND;
END;
--GO 

CREATE PROCEDURE objQual_P_ROLE_REMUSERFRROLE
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_USERNAME VARCHAR(63),
 i_Rolename VARCHAR(63)
 )
 AS  
 	DECLARE VARIABLE ICI_USERID16 CHAR(16) CHARACTER SET OCTETS;
 	DECLARE VARIABLE ICI_ROLEID16 CHAR(16) CHARACTER SET OCTETS;
 	DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
         	
 	SELECT r."RoleID" FROM objQual_P_ROLE r 
 	WHERE r."RoleNameLwd" = LOWER(:i_Rolename) 
 	AND r."ApplicationID" = :ICI_APPLICATIONID16 
 	INTO :ICI_ROLEID16;
 	
 	SELECT m.USERID FROM objQual_P_MEMBERSHIP m 
 	WHERE m."UsernameLwd"=LOWER(:I_USERNAME) 
 	AND m."ApplicationID" = :ICI_APPLICATIONID16 
 	INTO :ICI_USERID16;
 	
 	DELETE FROM objQual_P_ROLEMEMBERSHIP 
 	WHERE "RoleID" = :ICI_ROLEID16 
 	AND "UserID"=:ICI_USERID16;
 	
END;
--GO 


/* PROFILES PROVIDER */

CREATE PROCEDURE objQual_P_PROFILE_DELETEINACTIVE
 (
 I_APPLICATIONNAME VARCHAR(63),
 I_INACTIVESINCEDATE TIMESTAMP
 )
 RETURNS ("RowCount" INTEGER)
 AS
 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16;  
     DELETE
     FROM    objQual_P_PROFILE
     WHERE   "UserID" IN
             (   SELECT  m.USERID
                 FROM    objQual_P_MEMBERSHIP m
                 WHERE   m."ApplicationID" = :ICI_APPLICATIONID16
                         AND (m."LastActivity" <= :I_INACTIVESINCEDATE)
             );
 
     "RowCount"=ROW_COUNT;
END;
--GO 

--TODO

 -- DROP PROCEDURE IF EXISTS objQual_P_profile_getnumberinactiveprofiles;
 CREATE PROCEDURE objQual_P_PROFILE_GETNUMINACT
    ( I_APPLICATIONNAME        VARCHAR(63),
     I_INACTIVESINCEDATE      TIMESTAMP)
     RETURNS ("RowCount" INTEGER)
AS
DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 	
 
EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
         
     SELECT  COUNT(*)
     FROM    objQual_P_MEMBERSHIP m, objQual_P_PROFILE p
     WHERE   "ApplicationID" = :ICI_APPLICATIONID16
         AND m.USERID = p.USERID
         AND ("LastActivity" <= :I_INACTIVESINCEDATE) INTO :"RowCount";
END;
--GO 
CREATE PROCEDURE objQual_P_PROFILE_DELETEPROFILE
(
 I_APPLICATIONNAME VARCHAR(63),
 i_UserName VARCHAR(63)
 )
 RETURNS(ici_NumDeleted INTEGER)
 AS 
     DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
 BEGIN
 EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
           	DELETE FROM objQual_P_PROFILE 
 			WHERE "UserID" IN (SELECT "UserID" 
 			FROM objQual_P_MEMBERSHIP 
 			WHERE "UsernameLwd" = LOWER(:i_UserName) 
 			AND "ApplicationID" = :ICI_APPLICATIONID16); 
            /* IF( ici_ici_ERROR <> 0 ) THEN           
                 SET ici_ErrorCode = -1
                 GOTO Error
             END IF;*/
             IF (ROW_COUNT <> 0) THEN
             ici_NumDeleted = ici_NumDeleted + 1;      
 END;
--GO


CREATE PROCEDURE objQual_P_PROFILE_GETPROFILES
(
    I_APPLICATIONNAME VARCHAR(63) CHARACTER SET UTF8,
    I_PROFILEAUTHOPTIONS INTEGER,
    I_USERNAMETOMATCH VARCHAR(63) CHARACTER SET UTF8,
    I_INACTIVESINCEDATE TIMESTAMP,
    I_PAGEINDEX INTEGER,
    I_PAGESIZE INTEGER)    
   RETURNS 
    (
  "UserName" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "LastActivity" TIMESTAMP,
  "UserID" CHAR(16) CHARACTER SET OCTETS, 
  "LastUpdatedDate" TIMESTAMP,
  "YIM" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Blog" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Gender" INTEGER,
  "MSN" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "ICQ" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Birthday" TIMESTAMP,
  "BlogServiceUsername" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "BlogServicePassword" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "AIM" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "GoogleTalk" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Location" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Interests" VARCHAR(400) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Homepage" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Skype" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "RealName" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "BlogServiceUrl" VARCHAR(255) CHARACTER SET UTF8 COLLATE UNICODE ,
  "Occupation" VARCHAR(400) CHARACTER SET UTF8 COLLATE UNICODE 
    )
 AS
	 DECLARE VARIABLE ICI_APPLICATIONID16 CHAR(16) CHARACTER SET OCTETS;
	 DECLARE VARIABLE pkid char(36) character set octets;
     DECLARE VARIABLE spkid char(16) character set octets;
     DECLARE VARIABLE I_PAGELOWERBOUND INTEGER;
     DECLARE VARIABLE I_PAGEUPPERBOUND INTEGER;
     DECLARE VARIABLE I_TOTALRECORDS   INTEGER;
 BEGIN 	
 
     /*Set the page bounds*/    
   

EXECUTE PROCEDURE objQual_P_CREATEAPPLICATION :I_APPLICATIONNAME
        RETURNING_VALUES :ICI_APPLICATIONID16; 
        
   IF (I_PAGEINDEX <= 0 ) THEN 
   begin  
    I_PAGELOWERBOUND = ((I_PAGESIZE) * (I_PAGEINDEX))+1;
    I_PAGEUPPERBOUND = ((I_PAGEINDEX +1)*(I_PAGESIZE))+1;
    end
     ELSE
     begin
    I_PAGELOWERBOUND = I_PAGESIZE*I_PAGEINDEX;
    I_PAGEUPPERBOUND= I_PAGESIZE -1 + I_PAGELOWERBOUND;
     end



 
   FOR SELECT  FIRST(:I_PAGEUPPERBOUND) SKIP(:I_PAGELOWERBOUND) 
   m."Username",
   m."LastActivity", 
   p.USERID AS "UserID",
   p."LastUpdatedDate",
   p."YIM" ,
   p."Blog",
   p."Gender",
   p."MSN",
   p."ICQ",
   p."Birthday",
   p."BlogServiceUsername",
   p."BlogServicePassword",
   p."AIM",
   p."GoogleTalk",
   p.LOCATION,
   p."Interests",
   p."Homepage",
   p."Skype",
   p."RealName",
   p."BlogServiceUrl",
   p."Occupation"
    FROM    objQual_P_MEMBERSHIP m, 
     objQual_P_PROFILE p
     WHERE   m.USERID = p.USERID 
      AND (:I_INACTIVESINCEDATE IS NULL 
      OR "LastActivity" <= :I_INACTIVESINCEDATE)
             AND (:I_USERNAMETOMATCH IS NULL 
             OR m."UsernameLwd" LIKE LOWER(:I_USERNAMETOMATCH))
         ORDER BY "Username" 
   INTO 
   :"UserName", 
   :"LastActivity", 
   :"UserID",
   :"LastUpdatedDate",
   :"YIM" ,
   :"Blog",
   :"Gender",
   :"MSN",
   :"ICQ",
   :"Birthday",
   :"BlogServiceUsername",
   :"BlogServicePassword",
   :"AIM",
   :"GoogleTalk",
   :"Location",
   :"Interests",
   :"Homepage",
   :"Skype",
   :"RealName",
   :"BlogServiceUrl",
   :"Occupation"
  DO
     begin 
    SUSPEND;
     end
  END; 
 
--GO 

