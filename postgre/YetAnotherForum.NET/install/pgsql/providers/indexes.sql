-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_prov_indexes()
RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_application' 
			     AND indexname='ix_objectQualifier_prov_application_name') THEN
       CREATE INDEX ix_objectQualifier_prov_application_name 
	          ON databaseSchema.objectQualifier_prov_application 
			  USING btree (applicationid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_membership' 
			     AND indexname='ix_objectQualifier_prov_membership_applicationid') THEN
       CREATE INDEX ix_objectQualifier_prov_membership_applicationid 
	          ON databaseSchema.objectQualifier_prov_membership 
			  USING btree (applicationid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_membership' 
			     AND indexname='ix_objectQualifier_prov_membership_email') THEN
       CREATE INDEX ix_objectQualifier_prov_membership_email 
	   ON databaseSchema.objectQualifier_prov_membership 
	   USING btree (email);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_membership' 
			     AND indexname='ix_objectQualifier_prov_membership_username') THEN
       CREATE INDEX ix_objectQualifier_prov_membership_username 
	   ON databaseSchema.objectQualifier_prov_membership 
	   USING btree (username);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_rolemembership' 
			     AND indexname='ix_objectQualifier_prov_rolemembership_role') THEN
       CREATE INDEX ix_objectQualifier_prov_rolemembership_role 
	   ON databaseSchema.objectQualifier_prov_rolemembership 
	   USING btree (roleid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_rolemembership' 
			     AND indexname='ix_objectQualifier_prov_rolemembership_user') THEN
       CREATE INDEX ix_objectQualifier_prov_rolemembership_user 
	   ON databaseSchema.objectQualifier_prov_rolemembership 
	   USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_role' 
			     AND indexname='ix_objectQualifier_prov_role_applicationid') THEN
       CREATE INDEX ix_objectQualifier_prov_role_applicationid 
	   ON databaseSchema.objectQualifier_prov_role 
	   USING btree (applicationid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes 
               WHERE tablename='objectQualifier_prov_role' 
			     AND indexname='ix_objectQualifier_prov_role_name') THEN
       CREATE INDEX ix_objectQualifier_prov_role_name 
	   ON databaseSchema.objectQualifier_prov_role 
	   USING btree (rolename);
END IF;

END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;   
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_prov_indexes();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_prov_indexes();
--GO
