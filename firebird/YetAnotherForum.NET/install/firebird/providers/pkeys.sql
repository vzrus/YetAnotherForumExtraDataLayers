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
-- Source primary key: PRIMARY
EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY025' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_P_APPLICATION ADD CONSTRAINT PRIMARY025 PRIMARY KEY (APPLICATIONID);';
END
--GO
-- Source primary key: PRIMARY
EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY026' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_P_MEMBERSHIP ADD CONSTRAINT PRIMARY026 PRIMARY KEY (USERID);';
END
--GO
EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY027' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_P_PROFILE ADD CONSTRAINT PRIMARY027 PRIMARY KEY (USERID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PRIMARY028' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_P_ROLE ADD CONSTRAINT PRIMARY028 PRIMARY KEY (ROLEID);';
END
--GO

EXECUTE BLOCK
AS
BEGIN 
-- Source primary key: PRIMARY
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='PK_objQual_P_ROLEMEMBERSHIP' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_P_ROLEMEMBERSHIP ADD CONSTRAINT PK_objQual_P_ROLEMEMBERSHIP PRIMARY KEY (USERID,ROLEID);';
END
--GO
