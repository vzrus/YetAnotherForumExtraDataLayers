-- Drop  indexes  if exist.

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

-- Source Index: IX_objQual_prov_Role_ApplicationID
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('"IX_objQual_prov_Role_Applica"','objQual_PROV_ROLE','ApplicationID');
--GO

-- Source Index: IX_objQual_prov_Role_Name
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_Role_Name','objQual_PROV_ROLE','RoleName');
--GO

-- Source Index: IX_objQual_prov_Application_Name
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_Application_','objQual_PROV_APPLICATION','ApplicationName');
--GO

-- Source Index: IX_objQual_prov_Membership_Applicat
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_Membership_A','objQual_PROV_MEMBERSHIP','ApplicationID');
--GO


-- Source Index: IX_objQual_prov_Membership_Email
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_Membership_E','objQual_PROV_MEMBERSHIP','Email');
--GO

-- Source Index: IX_objQual_prov_Membership_Username
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_Membership_U','objQual_PROV_MEMBERSHIP','Username');
--GO

-- Source Index: IX_objQual_prov_RoleMembership_Role
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_RoleMembersh','objQual_PROV_ROLEMEMBERSHIP','RoleID');
--GO

-- Source Index: IX_objQual_prov_RoleMembership_User
EXECUTE PROCEDURE DP_DROP_INDEX_PROC('IX_objQual_prov_RoleMembe001','objQual_PROV_ROLEMEMBERSHIP','UserID');
--GO

DROP PROCEDURE DP_DROP_INDEX_PROC;
--GO