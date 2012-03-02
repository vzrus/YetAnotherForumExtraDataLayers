-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

-- CREATE FUNCTION plpgsql_call_handler () RETURNS OPAQUE AS '/usr/local/pgsql/lib/plpgsql' LANGUAGE C;
-- CREATE TRUSTED LANGUAGE plpgsql HANDLER plpgsql_call_handler;


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
