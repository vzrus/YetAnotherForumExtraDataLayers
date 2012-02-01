-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009

-- SET search_path = databaseSchema, pg_catalog;
-- SET default_tablespace = '';
-- SET default_with_oids = false;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = off;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;
-- SET escape_string_warning = off;

  -- create db with template1
  --from superuser name
 -- CREATE LANGUAGE 'plpgsql' HANDLER plpgsql_call_handler  LANCOMPILER 'PL/pgSQL';
  --                        
  -- execute from shell createlang plpgsql youdatabasename
-- DROP SCHEMA databaseSchema CASCADE ;
-- CREATE SCHEMA databaseSchema  AUTHORIZATION granteeName;
CREATE OR REPLACE FUNCTION objectQualifier_check_or_create_schema
(
	varchar(100)
) returns void 
as '
declare
    _schemename alias for $1;    
begin
	
if not exists(select 1 FROM pg_namespace WHERE pg_namespace.nspname=_schemename)  then
	EXECUTE ''CREATE SCHEMA '' || _schemename || ''  AUTHORIZATION  '' || current_user || '';'';
end if;
return; 
end'
 LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO


SELECT objectQualifier_check_or_create_schema('databaseSchema');
DROP FUNCTION objectQualifier_check_or_create_schema(varchar(100));
--GO
   
-- Function: databaseSchema.objectQualifier_int_to_bool_helper(integer)

-- DROP FUNCTION databaseSchema.objectQualifier_int_to_bool_helper(integer);

-- A set of custom helper functions


-- Function: databaseSchema.objectQualifier_int_to_bool_helper(integer)

-- DROP FUNCTION databaseSchema.objectQualifier_int_to_bool_helper(integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_int_to_bool_helper(reqvalue double precision)
  RETURNS boolean AS
$BODY$
BEGIN
IF  reqvalue >= 1 THEN RETURN TRUE;
ELSE RETURN FALSE;
END IF;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO
/* CREATE OR REPLACE FUNCTION public.uuid_generate_v1()
 RETURNS uuid
 AS '$libdir/uuid-ossp', 'uuid_generate_v1'
 VOLATILE SECURITY DEFINER STRICT LANGUAGE C; 
 ALTER FUNCTION public.uuid_generate_v1() OWNER TO granteeName; */

/* CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_uuid_generate_v1()
 RETURNS uuid
 AS '$libdir/uuid-ossp', 'uuid_generate_v1'
 VOLATILE SECURITY DEFINER STRICT LANGUAGE C; 
*/


-- GRANT ALL ON FUNCTION databaseSchema.objectQualifier_uuid_generate_v1() TO databaseOwner;
/* CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_uuid_generate_v1()
 RETURNS uuid AS
 'SELECT public.uuid_generate_v1()' 
 VOLATILE SECURITY DEFINER STRICT LANGUAGE sql;
GRANT ALL ON FUNCTION databaseSchema.objectQualifier_uuid_generate_v1() TO granteeName;

 
GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_uuid_generate_v1() TO databaseOwner; 

GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_uuid_generate_v1() TO granteeName; 

GRANT EXECUTE ON FUNCTION pg_database_size(name) TO granteeName;

GRANT EXECUTE ON FUNCTION pg_size_pretty(bigint) TO granteeName;

GRANT EXECUTE ON FUNCTION pg_postmaster_start_time() TO granteeName;

*/

-- This is helper function which drops all types. Don't forget to remove it in the end 
-- It was put here to ensure that it will be ready before any type creation

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_drop_type
(
	varchar(100), 
	varchar(100)
) returns int4 
as '
declare
    _schemename alias for $1;
	_typename alias for $2;
	_rowcount int4;

begin

_rowcount := 0;
	
if exists(select 1 FROM pg_type INNER JOIN pg_namespace ON pg_type.typnamespace =pg_namespace.oid where pg_namespace.nspname=_schemename AND typname=_typename)  then
	EXECUTE ''DROP TYPE '' || _schemename ||''.'' || _typename || '' CASCADE;'';
	GET DIAGNOSTICS _rowcount = ROW_COUNT;
end if;
return _rowcount; 
end'
 LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_drop_type(varchar,varchar) TO public;

--GO

-- This is helper function which checks if pkeys and fkeys exist. Don't forget to remove it in the end 
-- It was put here to ensure that we don't create double constraints.

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_check_or_create_keys
(
	varchar(100), 
	varchar(100),
	varchar(100),
	varchar(100),
	varchar(100),
	varchar(100)
) returns int4 
as '
declare
    _conschema alias for $1;
    _contable alias for $2;
    _altertable alias for $3;
    _conname alias for $4; 
    _concolumn alias for $5;       
	_contype alias for $6;
	
	_rowcount int4;

begin

_rowcount := 0;

IF _contype = ''p'' THEN
IF NOT EXISTS (SELECT * FROM pg_constraint where contype=_contype and conname =_conname ) THEN
EXECUTE ''ALTER TABLE ONLY  '' || _conschema || ''.'' || _altertable ||
     '' ADD CONSTRAINT  '' || _conname || '' PRIMARY KEY  ( '' || _concolumn || '');'';
END IF;
END IF;

IF _contype = ''f'' THEN
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype=_contype and conname =_conname) THEN
EXECUTE ''ALTER TABLE ONLY  '' || _conschema || ''.'' || _altertable ||
     '' ADD CONSTRAINT '' || _conname || 
    '' FOREIGN KEY ( '' || _concolumn || '') '' ||  
    '' REFERENCES '' || _conschema || ''.'' || _contable || '' ( '' || _concolumn || '');'';
END IF;
END IF;
GET DIAGNOSTICS _rowcount = ROW_COUNT;
RETURN _rowcount; 
END'
 LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO
GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_check_or_create_keys(varchar,varchar,varchar,varchar,varchar,varchar) TO public;

--GO


-- This is helper function which check if indexes exists and creates them if not. 
-- It was put here to ensure that we don't create double indexes.
-- Don't forget to remove it in the end 
 

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_replace_index
(
	varchar(100), 
	varchar(100),
	varchar(100), 
	varchar(100),
	varchar(100)
) returns int4 
as '
declare
    _schemaname alias for $1;
    _tablename alias for $2;
    _indexname alias for $3;
	_indexuniue alias for $4;
	_indexcolumn alias for $5;
	_rowcount int4;

begin

_rowcount := 0;
	
IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename=_tablename AND indexname=_indexname) THEN
IF _indexuniue=''unique'' THEN
EXECUTE ''CREATE UNIQUE INDEX '' || _indexname || '' ON '' || _schemaname || ''.'' || _tablename || '' USING btree ('' || _indexcolumn || '');'';
ELSE
EXECUTE ''CREATE INDEX '' || _indexname || '' ON '' || _schemaname || ''.'' || _tablename || '' USING btree ('' || _indexcolumn || '');'';
END IF;
END IF;

GET DIAGNOSTICS _rowcount = ROW_COUNT;
RETURN _rowcount; 
END'

 LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO
GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_replace_index(varchar, 
	varchar,
	varchar, 
	varchar,
	varchar) TO public;
--GO


CREATE OR REPLACE FUNCTION column_exists(tablename text, colname text)
RETURNS boolean AS
$BODY$
DECLARE
_myrow record;
BEGIN
FOR _myrow in (SELECT attname FROM pg_attribute WHERE attrelid = tablename::regclass)
LOOP
IF _myrow.attname = colname THEN
RETURN true;
EXIT;
END IF;
END LOOP;
RETURN false;
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_profileusernamemigrate');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_profileusernamemigrate AS
(
userid uuid,
username character varying(255)
);
--GO
-- Function: objectQualifier_board_delete(integer)

-- DROP FUNCTION objectQualifier_board_delete(integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_fill_in_profileusername()
				  RETURNS void AS
$BODY$DECLARE 
userid_cursor uuid;
board_cursor refcursor; 
CurUserName character varying(255);
_rec databaseSchema.objectQualifier_prov_profileusernamemigrate%ROWTYPE;
BEGIN
  DROP TABLE IF EXISTS tmp_migr_prof;
  CREATE TEMPORARY TABLE tmp_migr_prof(userid uuid, username varchar(255)) ON COMMIT DROP;
  INSERT INTO tmp_migr_prof (username,userid)
  SELECT   username,userid 
  FROM     databaseSchema.objectQualifier_prov_membership
  WHERE    username ISNULL;

  OPEN board_cursor  FOR
  SELECT   userid
  FROM     databaseSchema.objectQualifier_prov_profile 
  WHERE    username IS NULL; 

 LOOP
  FETCH board_cursor  INTO userid_cursor ;
  EXIT WHEN NOT FOUND;
 INSERT INTO tmp_migr_prof (username,userid)
  SELECT   username,userid 
  FROM     databaseSchema.objectQualifier_prov_membership
  WHERE    userid = userid_cursor;
  EXIT WHEN NOT FOUND;
END LOOP;
  CLOSE board_cursor;
  FOR _rec IN SELECT * FROM tmp_migr_prof
  LOOP
  /*DEALLOCATE board_cursor;*/
   UPDATE databaseSchema.objectQualifier_prov_profile SET username = _rec.username where userid = _rec.userid;
   END LOOP;
  END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
  --GO
