-- Drop all primary keys if exist.


-- Source primary key: PRIMARY
EXECUTE PROCEDURE DP_DROP_PKEY_PROC('PRIMARY KEY','objQual_P_APPLICATION', 'PRIMARY025','ApplicationID','');
--GO

-- Source primary key: PRIMARY
EXECUTE PROCEDURE DP_DROP_PKEY_PROC('PRIMARY KEY','objQual_P_MEMBERSHIP', 'PRIMARY026','UserID','');
--GO



-- Source primary key: PRIMARY
EXECUTE PROCEDURE DP_DROP_PKEY_PROC('PRIMARY KEY','objQual_P_PROFILE', 'PRIMARY027','UserID','');
--GO

-- Source unique key: PRIMARY
EXECUTE PROCEDURE DP_DROP_PKEY_PROC('PRIMARY KEY','objQual_P_ROLE', 'PRIMARY028','RoleID','');
--GO

