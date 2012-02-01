-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009

-- #############################################################################
-- ################ Membership Create Procedures ###############################
-- #############################################################################
-- PROVIDER FUNCTION SCRIPT BY VZ_TEAM 

-- Function: databaseSchema.objectQualifier_prov_createapplication(character varying)

-- DROP FUNCTION databaseSchema.objectQualifier_prov_createapplication(character varying);



CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_createapplication(
IN i_applicationname character varying, 
IN i_newguid uuid, 
OUT i_applicationid uuid)
  RETURNS uuid AS  
$BODY$
BEGIN

      SELECT applicationid
      INTO  i_applicationid 
      FROM databaseSchema.objectQualifier_prov_application 
      WHERE applicationnamelwd=LOWER(i_applicationname);
	  
	  IF (i_applicationid IS NULL) THEN 	
 	  i_applicationid := i_newguid;
             INSERT  INTO databaseSchema.objectQualifier_prov_application (applicationid, applicationname, applicationnamelwd)
             VALUES  (i_applicationid, i_applicationname, LOWER(i_applicationname));
      END IF;

      RETURN;

 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_upgrade(i_previousversion integer,  i_newversion  integer)
  RETURNS void AS
$BODY$
BEGIN
-- RESOLVE SALT ISSUE IN 193 BETA and RC2
IF ((i_previousversion  = 31) OR (i_previousversion  = 32)) THEN			
			UPDATE databaseSchema.objectQualifier_prov_membership 
			SET passwordsalt='UwB5AHMAdABlAG0ALgBCAHkAdABlAFsAXQA=' 
			WHERE passwordsalt IS NOT NULL;
		    UPDATE databaseSchema.objectQualifier_prov_membership 
		    SET joined=current_timestamp at time zone 'UTC' 
		    WHERE joined IS NULL;		
		END IF;

 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
 
--GO

-- PROVIDER FUNCTION SCRIPT BY VZ_TEAM 

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_changepassword
(IN i_applicationname character varying, 
IN i_username character varying, 
IN i_password character varying, 
IN i_passwordsalt character varying, 
IN i_passwordformat character varying,
IN i_passwordanswer character varying,
IN i_newguid uuid) 
RETURNS void AS
$BODY$
BEGIN 
 	
 	
 	UPDATE databaseSchema.objectQualifier_prov_membership 
 	SET password=i_password, 
 	    passwordsalt=i_passwordsalt,
 		passwordformat=i_passwordformat, 
 		passwordanswer=i_passwordanswer
 	WHERE usernamelwd=LOWER(i_username) 
 	AND (applicationid =(SELECT databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)));
 RETURN;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER;
--GO

-- PROVIDER FUNCTION SCRIPT BY VZ_TEAM 

-- Function: objectQualifier_prov_ChangePasswordQuestionAndAnswer(character varying, character varying, character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_ChangePasswordQuestionAndAnswer(character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_changepasswordquestionandanswer(
i_applicationname character varying, 
i_username character varying, 
i_passwordquestion character varying, 
i_passwordanswer character varying,
IN i_newguid uuid) 
  RETURNS void AS
$BODY$
BEGIN 	
 	UPDATE databaseSchema.objectQualifier_prov_membership 
 	SET passwordquestion=i_passwordquestion,
 	 passwordanswer=i_passwordanswer
 	WHERE usernamelwd=LOWER(i_username) 
 	AND (applicationid=(SELECT databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)));
 	RETURN; 
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

-- Function: databaseSchema.objectQualifier_prov_createuser(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, boolean)

-- DROP FUNCTION databaseSchema.objectQualifier_prov_createuser(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_createuser(
IN i_applicationname character varying, 
IN i_username character varying, 
IN i_password character varying, 
IN i_passwordsalt character varying,
IN i_passwordformat character varying, 
IN i_email character varying, 
IN i_passwordquestion character varying, 
IN i_passwordanswer character varying, 
IN i_isapproved boolean,
IN i_newguid uuid,
IN i_newuserkey uuid,  
INOUT i_userkey uuid)

  RETURNS uuid AS
$BODY$DECLARE
ici_userkey uuid:=i_userkey;
BEGIN	
	IF ici_userkey IS NULL THEN
	   ici_userkey := i_newuserkey;
	END IF;
		
	INSERT INTO databaseSchema.objectQualifier_prov_membership(userid,applicationid,username,usernamelwd,password,passwordsalt,passwordformat,email,emaillwd,passwordquestion,passwordanswer,isapproved,joined)
		VALUES (ici_userkey,(SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)),i_username, LOWER(i_username), i_password, i_passwordsalt, i_passwordformat, i_email, LOWER(i_email), i_passwordquestion, i_passwordanswer, i_isapproved,current_timestamp at time zone 'UTC');
	
	RETURN;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO
-- PROVIDER FUNCTION SCRIPT BY VZ_TEAM --

-- Function: objectQualifier_prov_deleteuser(character varying, character varying, boolean)

-- DROP FUNCTION objectQualifier_prov_deleteuser(character varying, character varying, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_deleteuser(
i_applicationname character varying, 
i_username character varying, 
i_deleteallrelated boolean,
IN i_newguid uuid)
  RETURNS void AS
$BODY$ DECLARE 
ici_userid character varying(64);
BEGIN 	
 
    
 	-- get the userID
 	SELECT   userid 
        INTO ici_userid 
        FROM databaseSchema.objectQualifier_prov_membership 
        WHERE (applicationid=(SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid))) 
          AND usernamelwd = LOWER(i_username);
 -- TODO implement i_deleteallrelated
 	IF (ici_userid IS NOT NULL) THEN 	
 		/*Delete records from membership*/
 		DELETE FROM databaseSchema.objectQualifier_prov_membership WHERE userid = ici_userid;
 		/*Delete from Role table*/
 		DELETE FROM databaseSchema.objectQualifier_prov_rolemembership WHERE userid = ici_userid;
 		/*Delete from Profile table*/
 		DELETE FROM databaseSchema.objectQualifier_prov_profile WHERE userid = ici_userid;
 	END IF;
 	RETURN;	
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */



-- Function: objectQualifier_prov_findusersbyemail(character varying, character varying, integer, integer)

--DROP FUNCTION objectQualifier_prov_findusersbyemail(character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_findusersbyemail(
i_applicationname character varying, 
i_emailaddress character varying, 
i_pageindex integer, 
i_pagesize integer,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_findusersbyemail_return_type AS
$BODY$DECLARE 
ici_pagelowerbound integer:=0;
ici_pageupperbound integer:=0;
i_totalrecords   integer:=0;
rownumber integer:=0;
ici_applicationid uuid;
_rec databaseSchema.objectQualifier_prov_findusersbyemail_return_type%ROWTYPE;
BEGIN 
SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid) INTO ici_applicationid;
     ici_pagelowerbound := i_pagesize*i_pageindex;
     ici_pageupperbound := i_pagesize -1 + ici_pagelowerbound ;
 	
        FOR _rec IN
 	SELECT m.*, rownumber  FROM databaseSchema.objectQualifier_prov_membership m 
 	INNER JOIN databaseSchema.objectQualifier_prov_application a 
 	ON m.applicationid= a.applicationid 
 	WHERE (a.applicationid= ici_applicationid)
 	AND m.emaillwd = LOWER(i_emailaddress) 	
                      LOOP
IF rownumber >= ici_pagelowerbound AND rownumber <= ici_pageupperbound THEN RETURN NEXT _rec;
EXIT; END IF;
EXIT WHEN rownumber < ici_pagelowerbound AND rownumber >= ici_pageupperbound;
rownumber:=rownumber+1;
END LOOP;    
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO



-- Function: objectQualifier_prov_findusersbyname(character varying, character varying, integer, integer)

--DROP FUNCTION objectQualifier_prov_findusersbyname(character varying, character varying, integer, integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_findusersbyname(
i_applicationname character varying, 
i_username character varying, 
i_pageindex integer, 
i_pagesize integer,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_findusersbyname_return_type AS
$BODY$DECLARE 
ici_pagelowerbound integer:=0;
ici_pageupperbound integer:=0;
i_totalrecords   integer;
rownumber integer:=0;
ici_applicationid uuid;
 _rec databaseSchema.objectQualifier_prov_findusersbyname_return_type%ROWTYPE;

BEGIN
SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid) INTO ici_applicationid;
     ici_pagelowerbound := i_pagesize*i_pageindex;
     ici_pageupperbound := i_pagesize -1 + ici_pagelowerbound ;      
 
         FOR _rec IN 
 	SELECT m.*, rownumber
 	FROM databaseSchema.objectQualifier_prov_membership m 
 	INNER JOIN databaseSchema.objectQualifier_prov_application a 
 	ON m.applicationid= a.applicationid  
 	WHERE (a.applicationid= ici_applicationid)
 	AND m.usernamelwd 
 	LIKE  ('%' || LOWER(i_username) || '%')
LOOP
IF rownumber >= ici_pagelowerbound AND rownumber <= ici_pageupperbound THEN RETURN NEXT _rec;
EXIT; END IF;
EXIT WHEN rownumber < ici_pagelowerbound AND rownumber >= ici_pageupperbound;
rownumber:=rownumber+1;
END LOOP;  	
 	RETURN;
    
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */


-- Function: objectQualifier_prov_getallusers(character varying, integer, integer)

-- DROP FUNCTION objectQualifier_prov_getallusers(character varying, integer, integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_getallusers(
i_applicationname character varying,
 i_pageindex integer, 
 i_pagesize integer,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_getallusers_return_type AS
$BODY$    
DECLARE      
     ici_pagelowerbound integer;
     ici_pageupperbound integer;
     ici_totalrecords   integer; 
     rownumber integer:=0;
  ici_applicationid uuid;   
_rec databaseSchema.objectQualifier_prov_getallusers_return_type%ROWTYPE;

BEGIN   
 SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid) INTO ici_applicationid;
     ici_pagelowerbound = i_pagesize*i_pageindex;
     ici_pageupperbound = i_pagesize -1 + ici_pagelowerbound ; 	
 
 FOR _rec IN
 	SELECT m.*, rownumber FROM databaseSchema.objectQualifier_prov_membership m 
 	 INNER JOIN databaseSchema.objectQualifier_prov_application a 
 	ON m.applicationid= a.applicationid 
 	WHERE a.applicationid= ici_applicationid
 	
LOOP
IF rownumber >= ici_pagelowerbound AND rownumber <= ici_pageupperbound THEN RETURN NEXT _rec;END IF;
EXIT WHEN rownumber < ici_pagelowerbound AND rownumber >= ici_pageupperbound;
rownumber:=rownumber+1;
END LOOP; 

 	RETURN;
    
 END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100
  ROWS 1000;
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_resetpassword(character varying, character varying, character varying, character varying, character varying, integer, integer, timestamp with time zone)

-- DROP FUNCTION objectQualifier_prov_resetpassword(character varying, character varying, character varying, character varying, character varying, integer, integer, timestamp with time zone);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_resetpassword(
i_applicationname character varying, 
i_username character varying, 
i_password character varying, 
i_passwordsalt character varying, 
i_passwordformat character varying, 
i_maxinvalidattempts integer, 
i_passwordattemptwindow integer, 
i_currenttimeutc timestamp with time zone,
IN i_newguid uuid)
  RETURNS void AS
$BODY$
BEGIN  
 	
 	UPDATE databaseSchema.objectQualifier_prov_membership SET
 	password = i_password,
 	passwordsalt = i_passwordsalt,
 	passwordformat = i_passwordformat,
 	lastpasswordchange = i_currenttimeutc
 	WHERE applicationid= (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)) AND
 	usernamelwd = LOWER(i_username);
 	RETURN;
 
 END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

 -- Function: objectQualifier_prov_GetUser(character varying, character varying, character varying, boolean)

-- DROP FUNCTION objectQualifier_prov_GetUser(character varying, character varying, character varying, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_getuser(
i_applicationname character varying, 
i_username character varying, 
i_userkey uuid, 
i_userisonline boolean,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_getuser_return_type AS
$BODY$DECLARE 
ici_applicationid uuid;
_rec databaseSchema.objectQualifier_prov_getuser_return_type;

BEGIN 	
 	 SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	 
 	 INTO ici_applicationid;
 	
 	IF (i_userkey IS NULL) THEN 
 	FOR _rec IN	SELECT m.*  FROM databaseSchema.objectQualifier_prov_membership m  
                  WHERE m.usernamelwd = LOWER(i_username) 
                  AND m.applicationid = ici_applicationid
                  LOOP
                  RETURN NEXT _rec;
                  END LOOP;
 	ELSE 
 		FOR _rec IN SELECT m.*  FROM databaseSchema.objectQualifier_prov_membership m 
                  WHERE m.userid = i_userkey AND m.applicationid= ici_applicationid
                  LOOP
                  RETURN NEXT _rec;
                  END LOOP;       

   END IF; 
 	
 	/*IF USER IS ONLINE DO AN UPDATE USER*/	
 	IF (i_userisonline IS TRUE) THEN 
 	-- SELECT TIMESTAMP current_timestamp at time zone 'UTC'() AT TIME ZONE utc_offset INTO i_CurrentUtc;
 		UPDATE databaseSchema.objectQualifier_prov_membership 
 		SET lastactivity = current_timestamp at time zone 'UTC'
 		WHERE usernamelwd = LOWER(i_username) 
 		and applicationid= ici_applicationid;
 	END IF;	 
 		
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100 ROWS 1000;
--GO


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_updateuser(character varying, character varying, character varying, character varying, text, boolean, timestamp with time zone, timestamp with time zone, boolean)

-- DROP FUNCTION objectQualifier_prov_updateuser(character varying, character varying, character varying, character varying, text, boolean, timestamp with time zone, timestamp with time zone, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_updateuser(
i_applicationname character varying, 
i_userkey uuid, 
i_username character varying, 
i_email character varying, 
i_comment text, 
i_isapproved boolean, 
i_lastlogin timestamp with time zone, 
i_lastactivity timestamp with time zone, 
i_uniqueemail boolean,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$DECLARE 
ici_applicationid uuid;
ici_return integer := 0;
BEGIN
 	
 
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	
 	INTO ici_applicationid;
 	
 		/* Check UserKey */
 	IF (i_userkey IS NULL) THEN
         ici_return := 1;  
         RETURN ici_return;     
    END IF; 
 
 	/* Check for UniqueEmail */ 		
 		IF ((i_uniqueemail IS TRUE) 
 		AND (EXISTS (SELECT 1 FROM databaseSchema.objectQualifier_prov_membership m 
 		WHERE m.userid != i_userkey AND m.emaillwd=LOWER(i_email) 
 		AND m.applicationid=ici_applicationid)))
    THEN 
              ici_return := 2; 
              RETURN ici_return;  
    END IF;			
 	
 	
 	UPDATE databaseSchema.objectQualifier_prov_membership SET
 	username = i_username,
 	usernamelwd = LOWER(i_username),
 	email = i_email,
 	emaillwd = LOWER(i_email),
 	isapproved = i_isapproved,
 	lastlogin = i_lastlogin,
 	lastactivity = i_lastactivity,
 	comment = i_comment
 	WHERE applicationid= ici_applicationid AND
 	userid = i_userkey;
 
 	-- Return successful  	    
         RETURN ici_return; 
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_unlockuser(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_unlockuser(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_unlockuser(
i_applicationname character varying, 
i_username character varying,
IN i_newguid uuid)
  RETURNS void AS
$BODY$
BEGIN	
 	
 	
 	UPDATE databaseSchema.objectQualifier_prov_membership SET
 	islockedout = 0,
 	failedpasswordattempts = 0
 	WHERE applicationid= (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)) AND
 	usernamelwd = LOWER(i_username);
 	RETURN;
 
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_getnumberofusersonline(character varying, integer, timestamp with time zone)

-- DROP FUNCTION objectQualifier_prov_getnumberofusersonline(character varying, integer, timestamp with time zone);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_getnumberofusersonline(
i_applicationname character varying, 
i_timewindow integer, 
i_currenttimeutc timestamp with time zone,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$DECLARE ici_activitydate timestamp with time zone;
     ici_numberactive integer;
     dd interval;
     
BEGIN 
 dd := CAST(CAST(i_timewindow AS character varying) || ' minute' AS interval); 
       ici_activitydate:= i_currenttimeutc - dd ; 	
 	SELECT COUNT(1) INTO ici_numberactive 
 	FROM databaseSchema.objectQualifier_prov_membership m 
 	INNER JOIN databaseSchema.objectQualifier_prov_application a 
 	ON m.applicationid= a.applicationid 
 	WHERE a.applicationid= (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)) AND m.lastlogin >= ici_activitydate;
     
     RETURN ici_numberactive;
 
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;   
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */


-- Function: objectQualifier_prov_getusernamebyemail(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_getusernamebyemail(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_getusernamebyemail(
i_applicationname character varying, 
i_email character varying,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_getusernamebyemail_return_type AS
$BODY$DECLARE 
ici_applicationid uuid;
_rec databaseSchema.objectQualifier_prov_getusernamebyemail_return_type%ROWTYPE;
BEGIN 	
SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid) INTO ici_applicationid;
FOR _rec IN 
 	SELECT m.username FROM databaseSchema.objectQualifier_prov_membership m 
 	INNER JOIN databaseSchema.objectQualifier_prov_application a 
 	ON m.applicationid= a.applicationid 
 	WHERE a.applicationid= ici_applicationid AND m.emaillwd = LOWER(i_email)
LOOP
RETURN NEXT _rec;
END LOOP; 
RETURN;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

-- #############################################################################
-- ################ Roles Create Procedures ####################################
-- #############################################################################

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 -- Function: objectQualifier_prov_role_addusertorole(character varying, character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_addusertorole(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_addusertorole(
i_applicationname character varying, 
i_username character varying, 
i_rolename character varying,
IN i_newguid uuid)
  RETURNS void AS
$BODY$DECLARE 
 ici_iserid uuid;
 ici_roleid uuid;
 ici_applicationid uuid;
BEGIN	
 	
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	INTO ici_applicationid;
 
 	SELECT userid INTO ici_iserid 
 	FROM databaseSchema.objectQualifier_prov_membership m 
	WHERE m.usernamelwd=LOWER(i_username) 
	AND m.applicationid= ici_applicationid;

 	SELECT roleid  INTO ici_roleid 
 	FROM databaseSchema.objectQualifier_prov_role r 
 	WHERE r.rolenamelwd=LOWER(i_rolename) 
	AND r.applicationid= ici_applicationid LIMIT 1;

 	IF (ici_iserid IS NULL OR ici_roleid IS NULL) THEN
		RETURN;
	END IF;
 	IF (NOT EXISTS(SELECT 1 FROM databaseSchema.objectQualifier_prov_rolemembership rm 
 	WHERE rm.userid=ici_iserid 
 	AND rm.roleid=ici_roleid LIMIT 1)) THEN
 		INSERT INTO databaseSchema.objectQualifier_prov_rolemembership (roleid, userid)
 		VALUES (ici_roleid, ici_iserid);
 		END IF;
        RETURN;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO 

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_role_createrole(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_createrole(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_createrole(
i_applicationname character varying, 
i_rolename character varying,
IN i_newguid uuid,
IN i_newroleguid uuid)
  RETURNS void AS
$BODY$DECLARE 
ici_applicationid uuid;

BEGIN 	
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	 INTO ici_applicationid;
 	
 	IF (NOT EXISTS(SELECT 1 FROM databaseSchema.objectQualifier_prov_role r 
 	WHERE r.applicationid= ici_applicationid 
 	AND r.rolenamelwd = LOWER(i_rolename))) THEN
 		INSERT INTO databaseSchema.objectQualifier_prov_role (roleid, applicationid, rolename, rolenamelwd) VALUES (i_newroleguid,ici_applicationid, i_rolename,LOWER(i_rolename)); END IF;		
RETURN;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: databaseSchema.objectQualifier_prov_role_deleterole(character varying, character varying, boolean)

-- DROP FUNCTION databaseSchema.objectQualifier_prov_role_deleterole(character varying, character varying, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_deleterole(
i_applicationname character varying, 
i_rolename character varying, 
i_deleteonlyifroleisempty boolean,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$	DECLARE
	 ici_roleid uuid;
 	 ici_errorcode integer:=0; 	 
 	 
 	
BEGIN 	
 	
 	SELECT r.roleid INTO ici_roleid FROM databaseSchema.objectQualifier_prov_role r WHERE r.rolenamelwd=LOWER(i_rolename) AND r.applicationid= (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid));
 	
 	IF (i_deleteonlyifroleisempty IS NOT FALSE) THEN
 		IF (EXISTS (SELECT 1 FROM databaseSchema.objectQualifier_prov_rolemembership rm WHERE rm.roleid=ici_roleid)) THEN
 			SELECT 2 INTO ici_errorcode; END IF;
 	ELSE
 		DELETE FROM databaseSchema.objectQualifier_prov_rolemembership WHERE roleid=ici_roleid;
 	END IF;	
 
 	IF (ici_errorcode = 0) THEN
 		DELETE FROM  databaseSchema.objectQualifier_prov_role WHERE roleid=ici_roleid; END IF;
     
     RETURN COALESCE(ici_errorcode,0);	
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 -- Function: objectQualifier_prov_role_exists(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_exists(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_exists(
i_applicationname character varying, 
i_rolename character varying,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$
 	BEGIN	
 	
 	RETURN (SELECT COUNT(1) FROM databaseSchema.objectQualifier_prov_role r
 		WHERE (r.rolenamelwd = LOWER(i_rolename)) 
 		AND  (r.applicationid=(SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid))));
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO

-- Function: objectQualifier_prov_role_getroles(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_getroles(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_getroles(
i_applicationname character varying, 
i_username character varying,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_role_getroles_return_type AS
$BODY$DECLARE ici_applicationid uuid;
_rec databaseSchema.objectQualifier_prov_role_getroles_return_type%ROWTYPE;
BEGIN 	
 	
  	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	INTO ici_applicationid;
 
 	IF i_username IS NULL THEN
 	FOR _rec IN 
 		SELECT r.* FROM databaseSchema.objectQualifier_prov_role r 
 		WHERE r.rolenamelwd = LOWER(rolename) AND r.applicationid= ici_applicationid
LOOP
RETURN NEXT _rec;
END LOOP;
 	ELSE
 	FOR _rec IN  
 		SELECT
 			r.*
 		FROM
 			databaseSchema.objectQualifier_prov_role r
 		INNER JOIN
 			databaseSchema.objectQualifier_prov_rolemembership rm ON r.roleid = rm.roleid
 		INNER JOIN
 			databaseSchema.objectQualifier_prov_membership m ON m.userid = rm.userid
 		WHERE
 			r.applicationid = ici_applicationid
 			AND m.usernamelwd = LOWER(i_username)
LOOP
RETURN NEXT _rec;
END LOOP;
        END IF;
        RETURN;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100
  ROWS 1000;  
--GO
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_role_removeuserfromrole(character varying, character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_removeuserfromrole(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_removeuserfromrole(
i_applicationname character varying, 
i_username character varying, 
i_rolename character varying,
IN i_newguid uuid)
  RETURNS void AS
$BODY$DECLARE 
ici_iserid character varying(64);
ici_roleid uuid;
ici_applicationid uuid;

BEGIN
 
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	INTO ici_applicationid;	
 	
 	SELECT r.roleid INTO ici_roleid 
 	FROM databaseSchema.objectQualifier_prov_role r 
 	WHERE r.rolenamelwd = LOWER(i_rolename) 
 	AND r.applicationid= ici_applicationid  ;
 	SELECT m.userid INTO ici_iserid 
 	FROM databaseSchema.objectQualifier_prov_membership m 
 	WHERE m.usernamelwd=LOWER(i_username) 
 	AND m.applicationid= ici_applicationid ;
 	
 	DELETE FROM databaseSchema.objectQualifier_prov_rolemembership WHERE roleid = ici_roleid AND userid=ici_iserid;
 	
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;   
--GO




/* PROVIDER TABLE SCRIPT BY VZ_TEAM */



 -- Function: objectQualifier_prov_role_findusersinrole(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_findusersinrole(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_findusersinrole(
i_applicationname character varying, 
i_rolename character varying,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_role_findusersinrole_return_type AS
$BODY$DECLARE ici_roleid uuid;
 ici_applicationid uuid;
 _rec databaseSchema.objectQualifier_prov_role_findusersinrole_return_type%ROWTYPE;
BEGIN	
 	
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	
 	INTO ici_applicationid;
 
 	SELECT r.roleid INTO ici_roleid FROM databaseSchema.objectQualifier_prov_role r 
 	INNER JOIN  databaseSchema.objectQualifier_prov_application a 
 	ON r.applicationid= a.applicationid 
 	WHERE r.rolenamelwd=LOWER(i_rolename) 
 	AND a.applicationid= ici_applicationid ;
 FOR _rec IN
 	SELECT m.* FROM databaseSchema.objectQualifier_prov_membership m INNER JOIN databaseSchema.objectQualifier_prov_rolemembership rm ON m.userid = rm.userid WHERE rm.roleid = ici_roleid
LOOP
RETURN NEXT _rec;
END LOOP;
 RETURN;
	
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
--GO

 -- Function: objectQualifier_prov_role_isuserinrole(character varying, character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_role_isuserinrole(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_role_isuserinrole(
i_applicationname character varying, 
i_username character varying, 
i_rolename character varying,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_role_isuserinrole_return_type AS
$BODY$DECLARE 
_rec databaseSchema.objectQualifier_prov_role_isuserinrole_return_type%ROWTYPE;
ici_applicationid uuid;
BEGIN  
 SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	INTO ici_applicationid;
 FOR _rec IN
 	SELECT m.* FROM  databaseSchema.objectQualifier_prov_rolemembership rm 
 		INNER JOIN databaseSchema.objectQualifier_prov_membership m ON rm.userid = m.userid
 		INNER JOIN databaseSchema.objectQualifier_prov_role r ON rm.roleid = r.roleid
		WHERE m.usernamelwd=LOWER(i_username) AND r.rolenamelwd =LOWER(i_rolename) AND r.applicationid= ici_applicationid
LOOP 
RETURN NEXT _rec;
END LOOP;
		RETURN;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO


-- #############################################################################
-- ################ Profiles Create Procedures ####################################
-- #############################################################################
/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_profile_deleteinactive(character varying, timestamp with time zone)

-- DROP FUNCTION objectQualifier_prov_profile_deleteinactive(character varying, timestamp with time zone);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_profile_deleteinactive(
i_applicationname character varying, 
i_inactivesincedate timestamp with time zone,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$DECLARE 
deleted integer:=0;
BEGIN 	 
 
     DELETE
     FROM    databaseSchema.objectQualifier_prov_profile
     WHERE   applicationid = (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid))
                         AND (lastactivitydate <= i_inactivesincedate);
       GET DIAGNOSTICS deleted = ROW_COUNT;  
   
 
     RETURN  deleted;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
-- Function: objectQualifier_prov_profile_deleteprofiles(character varying, character varying)

-- DROP FUNCTION objectQualifier_prov_profile_deleteprofiles(character varying, character varying);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_profile_deleteprofiles(
i_applicationname character varying, 
i_usernames character varying,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$     DECLARE     
      ici_applicationid uuid;
      ici_username     character varying(256);
      ici_currentpos   integer :=1;
      ici_nextpos      integer;
      ici_numdeleted   integer :=0;
      ici_deleteduser  integer;
      ici_errorcode    integer :=0;
      deleted integer:=0;
BEGIN
   
 
 	SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)	INTO ici_applicationid;
 
     WHILE (ici_currentpos <= length(i_usernames)) LOOP
         SELECT SUBSTRING_INDEX(i_usernames, ',', ici_currentpos) INTO ici_nextpos; 
         IF (ici_nextpos = 0 OR ici_nextpos IS NULL) THEN
             SELECT length(i_usernames) + 1 INTO ici_nextpos; END IF;
 
         SELECT SUBSTRING(i_usernames, ici_currentpos, ici_nextpos - ici_currentpos) INTO ici_username;
         SELECT ici_nextpos+1 INTO ici_currentpos;
 
         IF (length(ici_username) > 0) THEN 
         BEGIN        
            SELECT 0 INTO ici_deleteduser;  
 			DELETE FROM databaseSchema.objectQualifier_prov_profile 
 			WHERE username = ici_username 
 			AND applicationid= ici_applicationid; 
            GET DIAGNOSTICS deleted = ROW_COUNT;
            EXCEPTION
            WHEN OTHERS THEN
             SELECT  -1 INTO ici_errorcode;
               --  GOTO Error;  
            RAISE NOTICE 'common_error';             
             RETURN ici_errorcode;     
         
            END; 
             IF (deleted <>0) THEN
                 SELECT ici_numdeleted + 1 INTO ici_numdeleted;END IF;
         END IF;
     END LOOP;
 
     RETURN ici_numdeleted;
 
    -- RETURN 0;
 
--  Error: 
--     RETURN ici_errorcode;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
--GO

/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 -- Function: objectQualifier_prov_profile_getprofiles(character varying, integer, integer, character varying, timestamp with time zone)

 -- DROP FUNCTION objectQualifier_prov_profile_getprofiles(character varying, integer, integer, character varying, timestamp with time zone);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_profile_getprofiles(
i_applicationname character varying, 
i_pageindex integer, 
i_pagesize integer, 
i_usernametomatch character varying, 
i_inactivesincedate timestamp with time zone,
IN i_newguid uuid)
  RETURNS SETOF databaseSchema.objectQualifier_prov_profile_getprofiles_return_type AS
$BODY$DECLARE 
ici_applicationid uuid;
ici_pagelowerbound integer;
ici_pageupperbound integer;
ici_totalrecords   integer;
rownumber integer:=0;
_rec databaseSchema.objectQualifier_prov_profile_getprofiles_return_type%ROWTYPE;
BEGIN 
 SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid) INTO ici_applicationid;
     -- Set the page bounds
     ici_pagelowerbound = i_pagesize*i_pageindex;
     ici_pageupperbound= i_pagesize -1 + ici_pagelowerbound;
       
 SELECT  COUNT(p.username) INTO ici_totalrecords
     FROM     databaseSchema.objectQualifier_prov_profile p
     WHERE    p.applicationid= ici_applicationid   
             AND (i_inactivesincedate IS NULL OR p.lastactivitydate <= i_inactivesincedate)
             AND (i_usernametomatch IS NULL OR p.username = i_usernametomatch);
         
 FOR _rec IN 
     SELECT   ici_totalrecords, p.*
     FROM     databaseSchema.objectQualifier_prov_profile p
     WHERE    p.applicationid= ici_applicationid     
             AND (i_inactivesincedate IS NULL OR lastactivitydate <= i_inactivesincedate)
             AND (i_usernametomatch IS NULL OR p.username = i_usernametomatch)
         ORDER BY p.username 

LOOP

IF rownumber >= ici_pagelowerbound AND rownumber <= ici_pageupperbound 
THEN RETURN NEXT _rec;
END IF;

EXIT WHEN rownumber < ici_pagelowerbound OR rownumber > ici_pageupperbound;
rownumber:=rownumber+1;

END LOOP; 
     
     RETURN;
 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100
  ROWS 1000; 
--GO


/* PROVIDER TABLE SCRIPT BY VZ_TEAM */
 -- Function: objectQualifier_prov_profile_getnumberinactiveprofiles(character varying, timestamp with time zone)
 
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_prov_profile_getnumberinactiveprofiles(
i_applicationname character varying, 
i_inactivesincedate timestamp with time zone,
IN i_newguid uuid)
  RETURNS integer AS
$BODY$
BEGIN  	
 
    RETURN (SELECT  COUNT(1)
     FROM    databaseSchema.objectQualifier_prov_profile 
     WHERE   (applicationid= (SELECT  databaseSchema.objectQualifier_prov_createapplication(i_applicationname,i_newguid)))     
         AND (lastactivitydate <= i_inactivesincedate));
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  

