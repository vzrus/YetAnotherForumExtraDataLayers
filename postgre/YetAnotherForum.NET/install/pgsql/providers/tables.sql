-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_prov_tables()
RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_prov_application') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_application (
    applicationid uuid NOT NULL,
    applicationname character varying(256),
    applicationnamelwd character varying(256),
    description text
)WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_prov_membership') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_membership (
    userid uuid NOT NULL,
    applicationid uuid NOT NULL,
    username character varying(256) NOT NULL,
    usernamelwd character varying(256) NOT NULL,
    password character varying(256),
    passwordsalt character varying(256),
    passwordformat character varying(256),
    email character varying(256),
    emaillwd character varying(256),
    passwordquestion character varying(256),
    passwordanswer character varying(256),
    isapproved boolean,
    islockedout boolean,
    lastlogin timestamp with time zone,
    lastactivity timestamp with time zone,
    lastpasswordchange timestamp with time zone,
    lastlockout timestamp with time zone,
    failedpasswordattempts integer,
    failedanswerattempts integer,
    failedpasswordwindow timestamp with time zone,
    failedanswerwindow timestamp with time zone,
    joined timestamp with time zone,
    comment text
)WITH (OIDS=withOIDs);
END IF; 


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_prov_profile') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_profile (
    userid uuid NOT NULL,
    valueindex text,
    stringdata text,
    binarydata bytea,
    lastupdateddate timestamp with time zone NOT NULL DEFAULT (current_timestamp at time zone 'UTC'),
	-- added columns
	lastactivitydate timestamp with time zone,
	applicationid uuid,
	isanonymous boolean default false,
	username character varying (255) NOT NULL
)WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_prov_role') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_role (
    roleid uuid NOT NULL,
    applicationid uuid NOT NULL,
    rolename character varying(256) NOT NULL,
    rolenamelwd character varying(256) NOT NULL
)WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_prov_rolemembership') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_rolemembership (
    roleid uuid NOT NULL,
    userid uuid NOT NULL
)WITH (OIDS=withOIDs);
END IF;


IF (column_exists('databaseSchema.objectQualifier_prov_profile','lastactivitydate') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_prov_profile ADD COLUMN lastactivitydate timestamp with time zone NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_prov_profile','applicationid') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_prov_profile ADD COLUMN applicationid uuid NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_prov_profile','isanonymous') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_prov_profile ADD COLUMN isanonymous bool NOT NULL DEFAULT false;
END IF;

IF (column_exists('databaseSchema.objectQualifier_prov_profile','username') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_prov_profile ADD COLUMN username character varying (255);
PERFORM databaseSchema.objectQualifier_fill_in_profileusername();
END IF;

IF (column_exists('databaseSchema.objectQualifier_prov_profile','username') IS TRUE) THEN
PERFORM databaseSchema.objectQualifier_fill_in_profileusername();
-- ALTER TABLE databaseSchema.objectQualifier_prov_profile ALTER COLUMN username SET NOT NULL;
END IF;




/*
IF EXISTS (SELECT 1 FROM pg_attribute
WHERE attrelid = 'databaseSchema.objectQualifier_prov_profile'::regclass
AND attname = 'applicationid' AND attnotnull IS FALSE LIMIT 1) THEN
UPDATE databaseSchema.objectQualifier_prov_profile SET applicationid = (SELECT applicationid from  databaseSchema.objectQualifier_prov_application WHERE applicationid IS NULL) LIMIT 1; 
ALTER TABLE databaseSchema.objectQualifier_prov_profile ALTER COLUMN applicationid SET NOT NULL; 
END IF; */


END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
     GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_prov_tables() TO public;
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_prov_tables();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_prov_tables();
    --GO







