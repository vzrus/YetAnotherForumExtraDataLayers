-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009

--databaseSchema.objectQualifier_check_or_create_keys arguments
-- constraint_schema,constraint_table, key_table(''(for pkeys)|'table_name'(for fkeys),constraint_name,constraint_column,constraint_type('p'(primary key)|'f'(foreign key))	


-- SELECT databaseSchema.objectQualifier_check_or_create_keys('databaseSchema','objectQualifier_prov_application','','pk_databaseSchema_objectQualifier_prov_application_applicationid','applicationid','p');
-- GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_prov_pkeys()
RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (SELECT * FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_prov_application_applicationid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_prov_application
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_prov_application_applicationid PRIMARY KEY (applicationid);
END IF;  


IF NOT EXISTS (SELECT * FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_roleid_prov_role') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_prov_role
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_roleid_prov_role PRIMARY KEY (roleid);
END IF; 

IF NOT EXISTS (SELECT * FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userid_prov_membership') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_prov_membership
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_prov_membership PRIMARY KEY (userid);
END IF;

IF NOT EXISTS (SELECT * FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userid_prov_profile') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_prov_profile
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_prov_profile PRIMARY KEY (userid);
END IF;
    
    END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
     GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_prov_pkeys() TO public;
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_prov_pkeys();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_prov_pkeys();
--GO