-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

-- Domains are not currently used. They are planned for ips
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_domains()
  RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS(
SELECT 1 from pg_type where typname = 'databaseSchema.objectQualifier_d_username' LIMIT 1) THEN
CREATE DOMAIN  databaseSchema.objectQualifier_d_username AS character varying(255);
END IF;

IF NOT EXISTS(
SELECT 1 from pg_type where typname = 'databaseSchema.objectQualifier_d_forumname' LIMIT 1) THEN
CREATE DOMAIN  databaseSchema.objectQualifier_d_forumname AS character varying(255);
END IF;

END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO
DROP FUNCTION databaseSchema.objectQualifier_create_or_check_domains();
--GO