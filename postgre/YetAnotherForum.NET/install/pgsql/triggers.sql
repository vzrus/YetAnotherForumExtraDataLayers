-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012


-- user table triggers

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_userflag_update ON databaseSchema.objectQualifier_user;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_user_updateflags()
				  RETURNS trigger AS
$BODY$
BEGIN
        NEW.ishostadmin = COALESCE(CAST(SIGN(NEW.flags & 1) AS integer)>0,false);
 		NEW.isapproved = COALESCE(CAST(SIGN(NEW.flags & 2) AS integer)>0,false);
        new.isguest = COALESCE(CAST(SIGN(new.flags & 4) AS integer)>0,false);
		new.iscaptchaexcluded = COALESCE(CAST(SIGN(new.flags & 8) AS integer)>0,false);
		NEW.isactiveexcluded = COALESCE(CAST(SIGN(NEW.flags & 16) AS integer)>0,false);
		new.isdst = COALESCE(CAST(SIGN(new.flags & 32) AS integer)>0,false);
		new.isdirty = COALESCE(CAST(SIGN(new.flags & 64) AS integer)>0,false);
		new.isuserstyle = COALESCE(CAST(SIGN(new.styleflags & 1) AS integer)>0,false);
		new.isgroupstyle = COALESCE(CAST(SIGN(new.styleflags & 2) AS integer)>0,false);
		new.isrankstyle = COALESCE(CAST(SIGN(new.styleflags & 4) AS integer)>0,false);
 	 return NEW;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_userflag_update
       BEFORE UPDATE ON databaseSchema.objectQualifier_user
	          FOR EACH ROW
			  WHEN (OLD.flags IS DISTINCT FROM NEW.flags)
              EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_user_updateflags();
--GO

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_userflag_insert ON databaseSchema.objectQualifier_user;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_user_insertflags()
				  RETURNS TRIGGER AS
$BODY$
BEGIN
        new.ishostadmin = COALESCE(CAST(SIGN(new.flags & 1) AS integer)>0,false);
 		new.isapproved = COALESCE(CAST(SIGN(new.flags & 2) AS integer)>0,false);
		new.isguest = COALESCE(CAST(SIGN(new.flags & 4) AS integer)>0,false);
        new.iscaptchaexcluded = COALESCE(CAST(SIGN(new.flags & 8) AS integer)>0,false);
		new.isactiveexcluded = COALESCE(CAST(SIGN(new.flags & 16) AS integer)>0,false);
		new.isdst = COALESCE(CAST(SIGN(new.flags & 32) AS integer)>0,false);
		new.isdirty = COALESCE(CAST(SIGN(new.flags & 64) AS integer)>0,false);
		new.isuserstyle = COALESCE(CAST(SIGN(new.styleflags & 1) AS integer)>0,false);
		new.isgroupstyle = COALESCE(CAST(SIGN(new.styleflags & 2) AS integer)>0,false);
		new.isrankstyle = COALESCE(CAST(SIGN(new.styleflags & 4) AS integer)>0,false);
		RETURN new;
 	END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_userflag_insert
       BEFORE INSERT ON databaseSchema.objectQualifier_user
       FOR EACH ROW   
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_user_insertflags();
--GO


-- user pmessage triggers

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_userpmflag_update ON databaseSchema.objectQualifier_userpmessage;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_userpm_updateflags()
				  RETURNS trigger AS
$BODY$
BEGIN
        new.isread =  COALESCE(CAST(SIGN(new.flags & 1) AS integer)>0,false);
		new.isinoutbox =  COALESCE(CAST(SIGN(new.flags & 2) AS integer)>0,false);
		new.isarchived =  COALESCE(CAST(SIGN(new.flags & 4) AS integer)>0,false);
		new.isdeleted =  COALESCE(CAST(SIGN(new.flags & 8) AS integer)>0,false);
 	 return NEW;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_userpmflag_update
       BEFORE UPDATE ON databaseSchema.objectQualifier_userpmessage
	   FOR EACH ROW
	   WHEN (OLD.flags IS DISTINCT FROM NEW.flags)
	   EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_userpm_updateflags();
	--GO

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_userpmflag_insert ON databaseSchema.objectQualifier_userpmessage;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_userpm_insertflags()
				  RETURNS TRIGGER AS
$BODY$
BEGIN
        new.isread =  COALESCE(CAST(SIGN(NEW.flags & 1) AS integer)>0,false);
		new.isinoutbox =  COALESCE(CAST(SIGN(NEW.flags & 2) AS integer)>0,false);
		new.isarchived =  COALESCE(CAST(SIGN(NEW.flags & 4) AS integer)>0,false);
		new.isdeleted =  COALESCE(CAST(SIGN(NEW.flags & 8) AS integer)>0,false);
		RETURN new;
 	END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_userpmflag_insert
       BEFORE INSERT ON databaseSchema.objectQualifier_userpmessage
       FOR EACH ROW   
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_userpm_insertflags();
	--GO

-- topic table

 DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_topic_update ON databaseSchema.objectQualifier_topic;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_topic_updateflags()
				  RETURNS trigger AS
$BODY$
BEGIN
         new.islocked = COALESCE(CAST(SIGN(NEW.flags & 1) AS integer)>0,false);
         new.isdeleted = COALESCE(CAST(SIGN(NEW.flags & 8) AS integer)>0,false);
         new.ispersistent = COALESCE(CAST(SIGN(NEW.flags & 512) AS integer)>0,false);
		 new.isquestion = COALESCE(CAST(SIGN(NEW.flags & 1024) AS integer)>0,false);      
 	 return NEW;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_topic_update
       BEFORE UPDATE ON databaseSchema.objectQualifier_topic
       FOR EACH ROW
       WHEN (OLD.flags IS DISTINCT FROM NEW.flags)
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_topic_updateflags();
--GO

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_topicflag_beforeinsert ON databaseSchema.objectQualifier_topic;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_topic_insertflags()
				  RETURNS TRIGGER AS
$BODY$
BEGIN
         NEW.islocked = COALESCE(CAST(SIGN(NEW.flags & 1) AS integer)>0,false);
         NEW.isdeleted = COALESCE(CAST(SIGN(NEW.flags & 8) AS integer)>0,false);
         NEW.ispersistent = COALESCE(CAST(SIGN(NEW.flags & 512) AS integer)>0,false);
	     NEW.isquestion = COALESCE(CAST(SIGN(NEW.flags & 1024) AS integer)>0,false); 
		RETURN NEW;
 	END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_topicflag_beforeinsert
       BEFORE INSERT ON databaseSchema.objectQualifier_topic
	   FOR EACH ROW
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_topic_insertflags();
--GO

	
-- message table

 DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_message_update ON databaseSchema.objectQualifier_message;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_message_updateflags()
				  RETURNS trigger AS
$BODY$
BEGIN
     NEW.isdeleted = COALESCE(CAST(SIGN(NEW.flags & 8) AS integer)>0,false);
	 NEW.isapproved = COALESCE(CAST(SIGN(NEW.flags & 16) AS integer)>0,false);      
 	 return NEW;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_message_update
       BEFORE UPDATE ON databaseSchema.objectQualifier_message
       FOR EACH ROW
       WHEN (OLD.flags IS DISTINCT FROM NEW.flags)
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_message_updateflags();
	--GO

DROP TRIGGER IF EXISTS databaseSchema_objectQualifier_tr_message_beforeinsert ON databaseSchema.objectQualifier_message;
--GO
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_trf_message_insertflags()
				  RETURNS TRIGGER AS
$BODY$
BEGIN
     NEW.isdeleted = COALESCE(CAST(SIGN(NEW.flags & 8) AS integer)>0,false);
	 NEW.isapproved = COALESCE(CAST(SIGN(NEW.flags & 16) AS integer)>0,false);
	    
	RETURN NEW;
 	END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

CREATE TRIGGER databaseSchema_objectQualifier_tr_message_beforeinsert
       BEFORE INSERT ON databaseSchema.objectQualifier_message
	   FOR EACH ROW
       EXECUTE PROCEDURE databaseSchema.objectQualifier_trf_message_insertflags();
--GO


