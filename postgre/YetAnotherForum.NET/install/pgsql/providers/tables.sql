-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_prov_tables()
                  RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_prov_application') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_application
             (
			 applicationid             uuid NOT NULL,
			 applicationname           varchar(256),
			 applicationnamelwd        varchar(256),
			 description               text
			 )
	   WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_prov_membership') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_membership
             (
			 userid                    uuid NOT NULL,
			 applicationid             uuid NOT NULL,
			 username                  varchar(256) NOT NULL,
			 usernamelwd               varchar(256) NOT NULL,
			 password                  varchar(256),
			 passwordsalt              varchar(256),
			 passwordformat            varchar(256),
			 email                     varchar(256),
			 emaillwd                  varchar(256),
			 passwordquestion          varchar(256),
			 passwordanswer            varchar(256),
			 isapproved                boolean,
			 islockedout               boolean,
			 lastlogin                 timestampTZ,
			 lastactivity              timestampTZ,
			 lastpasswordchange        timestampTZ,
			 lastlockout               timestampTZ,
			 failedpasswordattempts    integer,
			 failedanswerattempts      integer,
			 failedpasswordwindow      timestampTZ,
			 failedanswerwindow        timestampTZ,
			 joined                    timestampTZ,
			 comment                   text
			 )
	   WITH (OIDS=withOIDs);
END IF; 


IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_prov_profile') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_profile
             (
			 userid                    uuid NOT NULL,
			 valueindex                text,
			 stringdata                text,
			 binarydata                bytea,
			 lastupdateddate           timestampTZ  NOT NULL DEFAULT (current_timestamp at time zone 'UTC'),
			 lastactivitydate          timestampTZ ,
			 applicationid             uuid,
			 isanonymous               boolean default false,
			 username varchar (255) NOT NULL
			 )
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_prov_role') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_role
             (
			 roleid                    uuid NOT NULL,
			 applicationid             uuid NOT NULL,
			 rolename                  varchar(256) NOT NULL,
			 rolenamelwd               varchar(256) NOT NULL
			 )
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_prov_rolemembership') THEN
CREATE TABLE databaseSchema.objectQualifier_prov_rolemembership
             (
			 roleid                    uuid NOT NULL,
			 userid                    uuid NOT NULL
			 )
	   WITH (OIDS=withOIDs);
END IF;

IF (column_exists('databaseSchema.objectQualifier_prov_profile','username') IS TRUE) THEN
   -- used only with internal providers
   PERFORM databaseSchema.objectQualifier_fill_in_profileusername();
END IF;
IF (column_exists('databaseSchema.objectQualifier_prov_profile','birthday') IS TRUE) THEN
   -- used only with internal providers
  ALTER TABLE databaseSchema.objectQualifier_prov_profile ALTER COLUMN birthday TYPE timestampTZ;
END IF;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
--GO
    SELECT databaseSchema.objectQualifier_create_or_check_prov_tables();
--GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_prov_tables();
    --GO




