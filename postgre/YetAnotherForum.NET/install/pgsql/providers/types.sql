-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_findusersbyemail_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_findusersbyemail_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" varchar(256),
"UsernameLwd" varchar(256),
"Password" varchar(256),
"PasswordSalt" varchar(256),
"PasswordFormat" varchar(256),
"Email" varchar(256),
"EmailLwd" varchar(256),
"PasswordQuestion" varchar(256),
"PasswordAnswer" varchar(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestampTZ ,
"LastActivity" timestampTZ ,
"LastPasswordChange" timestampTZ ,
"LastLockOut" timestampTZ ,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestampTZ,
"FailedAnswerWindow" timestampTZ ,
"Joined" timestampTZ ,
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
"Username" varchar(256),
"UsernameLwd" varchar(256),
"Password" varchar(256),
"PasswordSalt" varchar(256),
"PasswordFormat" varchar(256),
"Email" varchar(256),
"EmailLwd" varchar(256),
"PasswordQuestion" varchar(256),
"PasswordAnswer" varchar(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestampTZ ,
"LastActivity" timestampTZ ,
"LastPasswordChange" timestampTZ ,
"LastLockOut" timestampTZ ,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestampTZ ,
"FailedAnswerWindow" timestampTZ ,
"Joined" timestampTZ ,
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
"Username" varchar(256),
"UsernameLwd" varchar(256),
"Password" varchar(256),
"PasswordSalt" varchar(256),
"PasswordFormat" varchar(256),
"Email" varchar(256),
"EmailLwd" varchar(256),
"PasswordQuestion" varchar(256),
"PasswordAnswer" varchar(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestampTZ ,
"LastActivity" timestampTZ ,
"LastPasswordChange" timestampTZ ,
"LastLockOut" timestampTZ ,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestampTZ ,
"FailedAnswerWindow" timestampTZ ,
"Joined" timestampTZ ,
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
"Username" varchar(256),
"UsernameLwd" varchar(256),
"Password" varchar(256),
"PasswordSalt" varchar(256),
"PasswordFormat" varchar(256),
"Email" varchar(256),
"EmailLwd" varchar(256),
"PasswordQuestion" varchar(256),
"PasswordAnswer" varchar(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestampTZ ,
"LastActivity" timestampTZ ,
"LastPasswordChange" timestampTZ ,
"LastLockOut" timestampTZ ,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestampTZ ,
"FailedAnswerWindow" timestampTZ ,
"Joined" timestampTZ ,
"Comment" text
);
--GO


SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_getusernamebyemail_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_getusernamebyemail_return_type AS
(
"Username" varchar(256)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_role_getroles_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_role_getroles_return_type AS
(
"RoleId" uuid,
"ApplicationId" uuid,
"RoleName" varchar(256),
"RoleNameLwd" varchar(256)
);
--GO

SELECT databaseSchema.objectQualifier_drop_type('databaseSchema','objectQualifier_prov_role_findusersinrole_return_type');
--GO
CREATE TYPE databaseSchema.objectQualifier_prov_role_findusersinrole_return_type AS
(
"UserId" uuid,
"ApplicationId" uuid,
"Username" varchar(256),
"UsernameLwd" varchar(256),
"Password" varchar(256),
"PasswordSalt" varchar(256),
"PasswordFormat" varchar(256),
"Email" varchar(256),
"EmailLwd" varchar(256),
"PasswordQuestion" varchar(256),
"PasswordAnswer" varchar(256),
"IsApproved" boolean,
"IsLockedOut" boolean,
"LastLogin" timestampTZ ,
"LastActivity" timestampTZ ,
"LastPasswordChange" timestampTZ ,
"LastLockOut" timestampTZ ,
"FailedPasswordAttempts" integer,
"FailedAnswerAttempts" integer,
"FailedPasswordWindow" timestampTZ ,
"FailedAnswerWindow" timestampTZ ,
"Joined" timestampTZ ,
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
"LastUpdatedDate" timestampTZ ,
"LastActivity" timestampTZ ,
"ApplicationId" uuid,
"IsAnonymous" boolean,
"UserName" varchar(255)
);
--GO



