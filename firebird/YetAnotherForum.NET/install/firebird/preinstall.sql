
/* Yet Another Forum.NET Firebird data layer by vzrus
 * Copyright (C) 2006-2012 Vladimir Zakharov
 * https://github.com/vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; version 2 only
 * General class structure is based on MS SQL Server code,
 * created by YAF developers
 *
 * http://www.yetanotherforum.net/
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation;version 2 only
 * of the License.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
CREATE PROCEDURE DROP_PROCEDURE(procname varchar(32))
AS
BEGIN
IF  (EXISTS (
SELECT a.RDB$PROCEDURE_NAME
FROM RDB$PROCEDURES a WHERE a.RDB$PROCEDURE_NAME = UPPER(:procname)) ) THEN
EXECUTE STATEMENT  'DROP PROCEDURE  "' || UPPER(:procname) || '"';
END;
--GO

CREATE PROCEDURE DP_DROP_FKEY_PROC
  (TABLENAME VARCHAR(50), FKEYNAME VARCHAR(50))
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$RELATION_CONSTRAINTS RC
    WHERE (RC.RDB$CONSTRAINT_NAME = :FKEYNAME) AND (RC.RDB$RELATION_NAME = :TABLENAME)
        AND (RC.RDB$CONSTRAINT_TYPE = 'FOREIGN KEY')
  )) THEN
  EXECUTE STATEMENT 'ALTER TABLE "' || :TABLENAME || '" DROP CONSTRAINT "' || :FKEYNAME || '"';
END;
--GO

CREATE PROCEDURE DP_DROP_TRIGGER_PROC
  (TABLENAME VARCHAR(50), TRNAME VARCHAR(50), FN VARCHAR(50), GN VARCHAR(50),ST VARCHAR(50),TT VARCHAR(50), TP INTEGER, GO INTEGER )
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = :TRNAME 
  )) THEN  
 -- EXECUTE STATEMENT 'ALTER TABLE "' || :TABNAME || '" DROP TRIGGER "' || :TRNAME || '"';
 EXECUTE STATEMENT 'DROP TRIGGER "' || :TRNAME || '"';
END;
--GO

CREATE PROCEDURE DP_DROP_INDEX_PROC
  (INAME VARCHAR(50),TABLENAME VARCHAR(50), COLNAME VARCHAR(50))
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$INDICES I
    WHERE (I.RDB$INDEX_NAME = :INAME) AND (I.RDB$RELATION_NAME = :TABLENAME)
   )) THEN
  EXECUTE STATEMENT 'ALTER TABLE "' || :TABLENAME || '" DROP INDEX "' || :INAME || '"';
END;
--GO


CREATE PROCEDURE DP_DROP_UKEY_PROC
  (TABLENAME VARCHAR(50), UKEYNAME VARCHAR(50))
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$RELATION_CONSTRAINTS R
    WHERE (R.RDB$CONSTRAINT_NAME = :UKEYNAME) AND (R.RDB$RELATION_NAME = :TABLENAME)
        AND (R.RDB$CONSTRAINT_TYPE = 'UNIQUE')
  )) THEN
  EXECUTE STATEMENT 'ALTER TABLE "' || :TABLENAME || '" DROP CONSTRAINT "' || :UKEYNAME || '"';
END;
--GO


CREATE PROCEDURE DP_DROP_PKEY_PROC
  (KEYTYPE VARCHAR(50),  TABLENAME VARCHAR(50), KEYNAME VARCHAR(50),CN1 VARCHAR(50),CN2 VARCHAR(50))
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$RELATION_CONSTRAINTS R
    WHERE (R.RDB$CONSTRAINT_NAME = :KEYNAME) AND (R.RDB$RELATION_NAME = :TABLENAME)
        AND (R.RDB$CONSTRAINT_TYPE = :KEYTYPE)
  )) THEN
  EXECUTE STATEMENT 'ALTER TABLE "' || :TABLENAME || '" DROP CONSTRAINT "' || :KEYNAME || '"';
END;
--GO


CREATE PROCEDURE DP_DROP_TABLE_PROC
  (NM VARCHAR(50))
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$RELATIONS
    WHERE (RDB$VIEW_BLR IS NULL) AND (RDB$RELATION_NAME = :NM)
  )) THEN
  EXECUTE STATEMENT 'DROP TABLE "' || :NM || '"';
END;
--GO

































