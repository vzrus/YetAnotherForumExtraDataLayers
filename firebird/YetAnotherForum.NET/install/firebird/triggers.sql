/* Yet Another Forum.NET MySQL data layer by vzrus
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

CREATE PROCEDURE DP_CHECK_OR_CREATE_TRIGGER_PROC
  (TABNAME VARCHAR(50), TRNAME VARCHAR(50), COLNAME VARCHAR(50), GENNAME VARCHAR(50),ST VARCHAR(50),TT VARCHAR(50), TP INTEGER, GO INTEGER)
AS
BEGIN
  IF (EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = :TRNAME
  )) THEN  
  EXECUTE STATEMENT 'CREATE TRIGGER "' || :TRNAME ||'" FOR "' 
  || :TABNAME || '"  "' || :ST  || '"  "' || :TT || '" POSITION '' || :TP   
  || '' AS BEGIN IF (NEW."' || :COLNAME  || '" = GEN_ID("' || :GENNAME || '", 1); END;';
  END;
--GO

DROP PROCEDURE DP_CHECK_OR_CREATE_TRIGGER_PROC;
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_SBOXMESG_SBOXMESGID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_SBOXMESG_SBOXMESGID FOR objQual_SHOUTBOXMESSAGE
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.SHOUTBOXMESSAGEID IS NULL) THEN
  NEW.SHOUTBOXMESSAGEID = GEN_ID(SEQ_objQual_SBOXMESG_SBOXMESGID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_POLL_POLLID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_POLL_POLLID FOR objQual_POLL
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.POLLID IS NULL) THEN
  NEW.POLLID = GEN_ID(SEQ_objQual_POLL_POLLID, 1);
END;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
 IF (NOT EXISTS(
    SELECT 1 FROM RDB$TRIGGERS T
    WHERE T.RDB$TRIGGER_NAME = 'TR_AI_objQual_TOPSTATUS_TOPSTID' 
  )) THEN  
EXECUTE STATEMENT 'CREATE TRIGGER TR_AI_objQual_TOPSTATUS_TOPSTID FOR objQual_TOPICSTATUS
ACTIVE BEFORE INSERT
POSITION 0
AS
BEGIN
IF (NEW.TOPICSTATUSID IS NULL) THEN
  NEW.TOPICSTATUSID = GEN_ID(SEQ_objQual_TOPSTATUS_TOPSTID, 1);
END;';
END
--GO




