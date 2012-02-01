-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_findusersbyemail_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_findusersbyemail_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" character varying(256),
"UsernameLwd" character varying(256),
"Password" character varying(256),
"PasswordSalt" character varying(256),
"PasswordFormat" character varying(256),
"Email" character varying(256),
"EmailLwd" character varying(256),
"PasswordQuestion" character varying(256),
"PasswordAnswer" character varying(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestamp with time zone,
"LastActivity" timestamp with time zone,
"LastPasswordChange" timestamp with time zone,
"LastLockOut" timestamp with time zone,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestamp with time zone,
"FailedAnswerWindow" timestamp with time zone,
"Joined" timestamp with time zone,
"Comment" text,
"RowNumber" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_findusersbyname_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_findusersbyname_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" character varying(256),
"UsernameLwd" character varying(256),
"Password" character varying(256),
"PasswordSalt" character varying(256),
"PasswordFormat" character varying(256),
"Email" character varying(256),
"EmailLwd" character varying(256),
"PasswordQuestion" character varying(256),
"PasswordAnswer" character varying(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestamp with time zone,
"LastActivity" timestamp with time zone,
"LastPasswordChange" timestamp with time zone,
"LastLockOut" timestamp with time zone,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestamp with time zone,
"FailedAnswerWindow" timestamp with time zone,
"Joined" timestamp with time zone,
"Comment" text,
"RowNumber" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_getallusers_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_getallusers_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" character varying(256),
"UsernameLwd" character varying(256),
"Password" character varying(256),
"PasswordSalt" character varying(256),
"PasswordFormat" character varying(256),
"Email" character varying(256),
"EmailLwd" character varying(256),
"PasswordQuestion" character varying(256),
"PasswordAnswer" character varying(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestamp with time zone,
"LastActivity" timestamp with time zone,
"LastPasswordChange" timestamp with time zone,
"LastLockOut" timestamp with time zone,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestamp with time zone,
"FailedAnswerWindow" timestamp with time zone,
"Joined" timestamp with time zone,
"Comment" text,
"RowNumber" integer
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_getuser_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_getuser_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" character varying(256),
"UsernameLwd" character varying(256),
"Password" character varying(256),
"PasswordSalt" character varying(256),
"PasswordFormat" character varying(256),
"Email" character varying(256),
"EmailLwd" character varying(256),
"PasswordQuestion" character varying(256),
"PasswordAnswer" character varying(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestamp with time zone,
"LastActivity" timestamp with time zone,
"LastPasswordChange" timestamp with time zone,
"LastLockOut" timestamp with time zone,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestamp with time zone,
"FailedAnswerWindow" timestamp with time zone,
"Joined" timestamp with time zone,
"Comment" text
);
--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_getusernamebyemail_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_getusernamebyemail_return_type AS
(
"Username" character varying(256)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_role_getroles_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_role_getroles_return_type AS
(
"RoleId" uuid,
"ApplicationId" uuid,
"RoleName" character varying(256),
"RoleNameLwd" character varying(256)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_role_findusersinrole_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_role_findusersinrole_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" character varying(256),
"UsernameLwd" character varying(256),
"Password" character varying(256),
"PasswordSalt" character varying(256),
"PasswordFormat" character varying(256),
"Email" character varying(256),
"EmailLwd" character varying(256),
"PasswordQuestion" character varying(256),
"PasswordAnswer" character varying(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestamp with time zone,
"LastActivity" timestamp with time zone,
"LastPasswordChange" timestamp with time zone,
"LastLockOut" timestamp with time zone,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestamp with time zone,
"FailedAnswerWindow" timestamp with time zone,
"Joined" timestamp with time zone,
"Comment" text
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_role_isuserinrole_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_role_isuserinrole_return_type AS
(
"RoleId" uuid,
"UserId" uuid
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_profile_getprofiles_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_profile_getprofiles_return_type AS
(
"TotalRecords" integer,
"UserID" uuid,
valueindex text,
stringdata text,
binarydata bytea,
"LastUpdatedDate" timestamp with time zone,
"LastActivity" timestamp with time zone,
"ApplicationId" uuid,
"IsAnonymous" boolean,
"UserName" character varying(255)
);
--GO



