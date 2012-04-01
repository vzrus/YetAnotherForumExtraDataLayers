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
IF (NOT EXISTS (SELECT 1
FROM RDB$FIELDS a WHERE a.RDB$FIELD_NAME='BOOL')) THEN
EXECUTE STATEMENT 'CREATE DOMAIN BOOL AS
SMALLINT
DEFAULT NULL
CHECK (value=1 or value=0 or value is null );';
END
--GO


EXECUTE BLOCK
AS 
BEGIN
IF (NOT EXISTS (SELECT 1
FROM RDB$FIELDS a WHERE a.RDB$FIELD_NAME='BOOL1')) THEN
EXECUTE STATEMENT 'CREATE DOMAIN BOOL1 AS
CHAR(1)
DEFAULT ''f''
CHECK (value= ''t'' or value= ''f'' or value is null );';
END
--GO



