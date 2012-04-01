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
IF (EXISTS(SELECT 1 
FROM RDB$VIEW_RELATIONS a  WHERE a.RDB$VIEW_NAME='objQual_VACCESS')) THEN
EXECUTE STATEMENT 'DROP VIEW objQual_VACCESS;';
END
--GO
EXECUTE BLOCK
AS
BEGIN
IF (EXISTS(SELECT 1 
FROM RDB$VIEW_RELATIONS a  WHERE a.RDB$VIEW_NAME='objQual_VACCESSFULL')) THEN
EXECUTE STATEMENT 'DROP VIEW objQual_VACCESSFULL;';
END
--GO
EXECUTE BLOCK
AS
BEGIN
IF (EXISTS(SELECT 1 
FROM RDB$VIEW_RELATIONS a  WHERE a.RDB$VIEW_NAME='objQual_PMESSAGEVIEW')) THEN
EXECUTE STATEMENT 'DROP VIEW objQual_PMESSAGEVIEW;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
IF (EXISTS(SELECT 1 
FROM RDB$VIEW_RELATIONS a  WHERE a.RDB$VIEW_NAME='objQual_VACCESSFULL1')) THEN
EXECUTE STATEMENT 'DROP VIEW objQual_VACCESSFULL1;';
END
--GO

EXECUTE BLOCK
AS
BEGIN
IF (EXISTS(SELECT 1 
FROM RDB$VIEW_RELATIONS a  WHERE a.RDB$VIEW_NAME='objQual_VACCESSFULL2')) THEN
EXECUTE STATEMENT 'DROP VIEW objQual_VACCESSFULL2;';
END
--GO

