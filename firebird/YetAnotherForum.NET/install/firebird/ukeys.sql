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

-- Source unique key: IX_objQual_BannedIP
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_BANNEDIP' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_BANNEDIP ADD CONSTRAINT IX_objQual_BANNEDIP UNIQUE (BOARDID,MASK);';
END
--GO
-- Source unique key: IX_objQual_Category

EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_CATEGORY' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_CATEGORY ADD CONSTRAINT IX_objQual_CATEGORY UNIQUE (BOARDID,NAME);';
END
--GO

-- Source unique key: IX_objQual_CheckEmail
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_CHECKEMAIL' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_CHECKEMAIL ADD CONSTRAINT IX_objQual_CHECKEMAIL UNIQUE ("HASH");';
END
--GO

-- Source unique key: IX_objQual_Forum
-- TODO ParentID is required to not show empty or no access categories but it fails because of duplicate nulls which are forbidden for uniques
/* EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_FORUM')) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_FORUM ADD CONSTRAINT IX_objQual_FORUM UNIQUE (CATEGORYID,"NAME");';
END
*/

-- Source unique key: IX_objQual_Group
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_GROUP' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_GROUP ADD CONSTRAINT IX_objQual_GROUP UNIQUE (BOARDID,NAME);';
END
--GO

-- Source unique key: IX_objQual_Rank

EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_RANK' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_RANK ADD CONSTRAINT IX_objQual_RANK UNIQUE (BOARDID,NAME);';
END
--GO

-- Source unique key: IX_objQual_Smiley
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_SMILEY' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_SMILEY ADD CONSTRAINT IX_objQual_SMILEY UNIQUE (BOARDID,"CODE");';
END
--GO

-- Source unique key: IX_objQual_User
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_USER' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_USER ADD CONSTRAINT IX_objQual_USER UNIQUE (BOARDID,NAME);';
END
--GO

-- Source unique key: IX_objQual_WatchForum
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_WATCHFORUM' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_WATCHFORUM ADD CONSTRAINT IX_objQual_WATCHFORUM UNIQUE (FORUMID,USERID);';
END
--GO

-- Source unique key: IX_objQual_WatchTopic
EXECUTE BLOCK
AS
BEGIN
IF (NOT EXISTS( SELECT 1
FROM RDB$INDICES a WHERE a.RDB$INDEX_NAME ='IX_objQual_WATCHTOPIC' ROWS 1)) THEN
EXECUTE STATEMENT 'ALTER TABLE objQual_WATCHTOPIC ADD CONSTRAINT IX_objQual_WATCHTOPIC UNIQUE (TOPICID,USERID);';
END
--GO




