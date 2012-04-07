
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

EXECUTE BLOCK
AS
BEGIN
-- Source table: objQual_P_APPLICATION
IF (NOT EXISTS( SELECT 1 FROM RDB$RELATIONS a 
                WHERE a.RDB$RELATION_NAME='objQual_P_APPLICATION')) THEN
    EXECUTE STATEMENT 'CREATE TABLE objQual_P_APPLICATION
	                   (
					   APPLICATIONID                       CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   APPLICATIONNAME                     VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   APPLICATIONNAMELWD                  VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   DESCRIPTION                         BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8
					   );';
end
--GO
EXECUTE BLOCK
AS
BEGIN
-- Source table: objQual_P_MEMBERSHIP
IF (NOT EXISTS( SELECT 1 FROM RDB$RELATIONS a 
                WHERE a.RDB$RELATION_NAME='objQual_P_MEMBERSHIP')) THEN
    EXECUTE STATEMENT 'CREATE TABLE objQual_P_MEMBERSHIP
	                   (
					   USERID               CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   APPLICATIONID        CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   USERNAME             VARCHAR(128) CHARACTER SET  UTF8 NOT NULL COLLATE UNICODE,
					   USERNAMELWD          VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE,
					   "PASSWORD"           VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   PASSWORDSALT         VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   PASSWORDFORMAT       VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   "EMAIL"              VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   EMAILLWD             VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   PASSWORDQUESTION     VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   PASSWORDANSWER       VARCHAR(128) CHARACTER SET UTF8 COLLATE UNICODE,
					   ISAPPROVED           BOOL,
					   ISLOCKEDOUT          BOOL,
					   LASTLOGIN            TIMESTAMP,
					   LASTACTIVITY         TIMESTAMP,
					   LASTPASSWORDCHANGE   TIMESTAMP,
					   LASTLOCKOUT          TIMESTAMP,
					   FAILEDPASSWORDATTEMPTS INTEGER,
					   FAILEDANSWERATTEMPTS INTEGER,
					   FAILEDPASSWORDWINDOW TIMESTAMP,
					   FAILEDANSWERWINDOW   TIMESTAMP,
					   JOINED               TIMESTAMP,
					   "COMMENT"            BLOB SUB_TYPE 1 SEGMENT SIZE 80 CHARACTER SET UTF8
					   );';
  end
  --GO
EXECUTE BLOCK
AS
BEGIN

-- Source table: objQual_P_PROFILE
IF (NOT EXISTS( SELECT 1 FROM RDB$RELATIONS a 
                WHERE a.RDB$RELATION_NAME='objQual_P_PROFILE')) THEN
    EXECUTE STATEMENT 'CREATE TABLE objQual_P_PROFILE
	                   (
					   USERID               CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   VALUEINDEX           BLOB SUB_TYPE 1,
					   STRINGDATA           BLOB SUB_TYPE 1,
					   BINARYDATA           BLOB SUB_TYPE 0,
					   LASTUPDATEDDATE      TIMESTAMP DEFAULT current_timestamp NOT NULL
					   );';

  end
  --GO
EXECUTE BLOCK
AS
BEGIN
-- Source table: objQual_P_ROLE
IF (NOT EXISTS( SELECT 1 FROM RDB$RELATIONS a 
                WHERE a.RDB$RELATION_NAME='objQual_P_ROLE')) THEN
    EXECUTE STATEMENT 'CREATE TABLE objQual_P_ROLE
	                   (
					   ROLEID               CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   APPLICATIONID        CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   ROLENAME             VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE,
					   ROLENAMELWD          VARCHAR(128) CHARACTER SET   UTF8 NOT NULL COLLATE UNICODE
					   );';

  end
  --GO
EXECUTE BLOCK
AS
BEGIN

-- Source table: objQual_P_ROLEMEMBERSHIP
IF (NOT EXISTS( SELECT 1 FROM RDB$RELATIONS a 
                WHERE a.RDB$RELATION_NAME='objQual_P_ROLEMEMBERSHIP')) THEN
    EXECUTE STATEMENT 'CREATE TABLE objQual_P_ROLEMEMBERSHIP
	                   (
					   ROLEID               CHAR(16) CHARACTER SET OCTETS NOT NULL,
					   USERID               CHAR(16) CHARACTER SET OCTETS NOT NULL
					   );';
END
--GO


