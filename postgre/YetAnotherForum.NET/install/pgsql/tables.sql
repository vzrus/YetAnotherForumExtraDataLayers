-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_tables()
                  RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_accessmask' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_accessmask 
            (
             accessmaskid              serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL,
			 sortorder                 smallint DEFAULT 0 NOT NULL
			) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_active' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_active 
            (
             sessionid                 varchar(24) NOT NULL,
			 boardid                   integer NOT NULL,
			 userid                    integer NOT NULL,
			 ip                        varchar(39) NOT NULL,
			 login                     timestampTZ  NOT NULL,
			 lastactive                timestampTZ  NOT NULL,
			 location                  varchar(255) NOT NULL,
			 forumid                   integer,
			 topicid                   integer,
			 browser                   varchar(128),
			 platform                  varchar(128),
			 forumpage                 varchar(255) NOT NULL,
			 flags                     integer NOT NULL default 0
			) 
		WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_activeaccess' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_activeaccess
             (
             userid                    integer NOT NULL,
			 boardid                   integer NOT NULL,
			 forumid                   integer NOT NULL,
			 isadmin                   boolean NOT NULL default false,
			 isforummoderator	       boolean NOT NULL default false,
			 ismoderator    	       boolean NOT NULL default false,
			 isguestx			       boolean NOT NULL default false,
			 lastactive			       timestampTZ ,
			 readaccess			       boolean NOT NULL default false,
			 postaccess			       boolean NOT NULL default false,
			 replyaccess		       boolean NOT NULL default false,
			 priorityaccess		       boolean NOT NULL default false,
			 pollaccess			       boolean NOT NULL default false,
			 voteaccess			       boolean NOT NULL default false,
			 moderatoraccess	       boolean NOT NULL default false,
			 editaccess			       boolean NOT NULL default false,
			 deleteaccess		       boolean NOT NULL default false,
			 uploadaccess		       boolean NOT NULL default false,
			 downloadaccess		       boolean NOT NULL default false			
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_attachment' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_attachment
             (
             attachmentid              serial NOT NULL,
			 messageid                 integer NOT NULL,
			 filename                  varchar(255) NOT NULL,
			 bytes                     integer NOT NULL,
			 fileid                    integer,
			 contenttype               varchar(128),
			 downloads                 integer NOT NULL,
			 filedata                  bytea
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_bannedip' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_bannedip
             (
             id                        serial NOT NULL,
			 boardid                   integer NOT NULL,
			 mask                      varchar(57) NOT NULL,
			 since                     timestampTZ  NOT NULL,
			 reason                    varchar(128),
			 userid	                   integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_bbcode' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_bbcode
            (
             bbcodeid                  serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(255) NOT NULL,
			 description               varchar(4000),
			 onclickjs                 varchar(1000),
			 displayjs                 text,
			 editjs                    text,
			 displaycss                text,
			 searchregex               text,
			 replaceregex              text,
			 variables                 varchar(1000),
			 usemodule                 boolean,
			 moduleclass               varchar(255),
			 execorder                 integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema'
			     AND tablename='objectQualifier_board' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_board
             (
             boardid                   serial NOT NULL,
			 name                      varchar(128) NOT NULL,
			 allowthreaded             boolean NOT NULL,
			 membershipappname         varchar(255),
			 rolesappname              varchar(255)
			 ) 
		WITH (OIDS=withOIDs);
END IF;
IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_category' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_category
             (
             categoryid                serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 categoryimage             varchar(255),
			 sortorder                 smallint NOT NULL,
			 pollgroupid               int
			 ) 			 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_checkemail' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_checkemail
             (
             checkemailid              serial NOT NULL,
			 userid                    integer NOT NULL,
			 email                     varchar(128) NOT NULL,
			 created                   timestampTZ  NOT NULL,
			 hash                      varchar(32) NOT NULL
			 ) 
	    WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_choice' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_choice
             (
             choiceid                  serial NOT NULL,
			 pollid                    integer NOT NULL,
			 choice                    varchar(128) NOT NULL,
			 votes                     integer NOT NULL,
			 objectpath                varchar(255),
			 mimetype                  varchar(50)
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_eventlog' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_eventlog
             (
             eventlogid                serial NOT NULL,
			 eventtime                 timestampTZ  NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
			 userid                    integer,
			 source                    varchar(128) NOT NULL,
			 description               text NOT NULL,
			 type                      integer DEFAULT 0 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_extension' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_extension
             (
             extensionid               serial NOT NULL,
			 boardid                   integer DEFAULT 1 NOT NULL,
			 extension                 varchar(10) NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_forum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_forum
             (
             forumid                   serial NOT NULL,
			 categoryid                integer NOT NULL,
			 parentid                  integer,
			 name                      varchar(128) NOT NULL,
			 description               varchar(255) NOT NULL,
			 sortorder                 smallint NOT NULL,
			 lastposted                timestampTZ ,
			 lasttopicid               integer,
			 lastmessageid             integer,
			 lastuserid                integer,
			 lastusername              varchar(128),
			 numtopics                 integer NOT NULL,
			 numposts                  integer NOT NULL,
			 remoteurl                 varchar(255),
			 flags                     integer DEFAULT 0 NOT NULL,
			 themeurl                  varchar(255),
			 imageurl                  varchar(255),
			 styles                    varchar(255),
			 pollgroupid               integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_forumaccess' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_forumaccess
             (
             groupid                   integer NOT NULL,
			 forumid                   integer NOT NULL,
			 accessmaskid              integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_group' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_group
             (
             groupid                   serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL,
			 pmlimit                   integer DEFAULT 0 NOT NULL,
			 style                     varchar(255),
			 sortorder                 smallint DEFAULT 0 NOT NULL,
			 description               varchar(128),
			 usrsigchars               integer  DEFAULT 0 NOT NULL,
			 usrsigbbcodes	           varchar(255),
			 usrsightmltags            varchar(255),
			 usralbums                 integer  DEFAULT 0 NOT NULL,
			 usralbumimages            integer   DEFAULT 0 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_groupmedal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_groupmedal
             (
             groupid                   integer NOT NULL,
			 medalid                   integer NOT NULL,
			 message                   varchar(128),
			 hide                      boolean DEFAULT false NOT NULL,
			 onlyribbon                boolean DEFAULT false NOT NULL,
			 sortorder                 smallint DEFAULT 255 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_mail' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_mail
             (
             mailid                    serial NOT NULL,
			 fromuser                  varchar(128) NOT NULL,
			 fromusername              varchar(128),
			 touser                    varchar(128) NOT NULL,
			 tousername                varchar(128),
			 created                   timestampTZ  NOT NULL,
			 subject                   varchar(128) NOT NULL,
			 body                      text NOT NULL,
			 bodyhtml                  text,
			 sendtries                 integer DEFAULT 0 NOT NULL,
			 sendattempt               timestampTZ ,
			 processid                 integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
              where schemaname='databaseSchema' 
			  AND tablename='objectQualifier_medal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_medal
            (
             medalid                   serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 description               text NOT NULL,
			 message                   varchar(128) NOT NULL,
			 category                  varchar(128),
			 medalurl                  varchar(255) NOT NULL,
			 ribbonurl                 varchar(255),
			 smallmedalurl             varchar(255) NOT NULL,
			 smallribbonurl            varchar(255),
			 smallmedalwidth           smallint NOT NULL,
			 smallmedalheight          smallint NOT NULL,
			 smallribbonwidth          smallint,
			 smallribbonheight         smallint,
			 sortorder                 smallint DEFAULT 255 NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_message' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_message
             (
             messageid                 serial NOT NULL,
			 topicid                   integer NOT NULL,
			 replyto                   integer,
			 position                  integer NOT NULL,
			 indent                    integer NOT NULL,
			 userid                    integer NOT NULL,
			 username                  varchar(128),
			 posted                    timestampTZ  NOT NULL,
			 message                   text NOT NULL,
			 ip                        varchar(39) NOT NULL,
			 edited                    timestampTZ ,
			 flags                     integer DEFAULT 23 NOT NULL,
			 editreason                varchar(128),
			 ismoderatorchanged        boolean DEFAULT false NOT NULL,
			 deletereason              varchar(128),
			 blogpostid                varchar(128),
			 editedby                  integer,
			 externalmessageid         varchar(255),
			 referencemessageid	       varchar(255),
			 isdeleted                 boolean DEFAULT false NOT NULL,
			 isapproved                boolean DEFAULT false NOT NULL
			 )
		WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_messagereported' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_messagereported
             (
             messageid                 integer NOT NULL,
			 message                   text,
			 resolved                  boolean,
			 resolvedby                integer,
			 resolveddate              timestampTZ
			 )
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
              where schemaname='databaseSchema' 
			    AND tablename='objectQualifier_messagereportedaudit' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_messagereportedaudit
             (
             logid                     serial NOT NULL,
			 userid                    integer,
			 messageid                 integer,
			 reported                  timestampTZ ,
			 reportednumber            integer,
			 reporttext                varchar(4000)
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_nntpforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntpforum
            (
             nntpforumid               serial NOT NULL,
			 nntpserverid              integer NOT NULL,
			 groupname                 varchar(128) NOT NULL,
			 forumid                   integer NOT NULL,
			 lastmessageno             integer NOT NULL,
			 lastupdate                timestampTZ  NOT NULL,
			 active                    boolean NOT NULL,
			 datecutoff	               timestampTZ 
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_nntpserver' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntpserver
             (
             nntpserverid              serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 address                   varchar(100) NOT NULL,
			 port                      integer,
			 username                  varchar(128),
			 userpass                  varchar(128)
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_nntptopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntptopic
             (
             nntptopicid               serial NOT NULL,
			 nntpforumid               integer NOT NULL,
			 thread                    varchar(64) NOT NULL,
			 topicid                   integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_pmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pmessage
             (
             pmessageid                serial NOT NULL,
			 fromuserid                integer NOT NULL,
			 created                   timestampTZ  NOT NULL,
			 subject                   varchar(128) NOT NULL,
			 body                      text NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;
IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_pollgroupcluster' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollgroupcluster
             (
             pollgroupid               serial NOT NULL,
			 userid                    integer NOT NULL,
			 flags                     integer NOT NULL DEFAULT 0
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_poll' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_poll
             (
             pollid                    serial NOT NULL,
			 question                  varchar(128) NOT NULL,
			 closes                    timestampTZ ,
			 pollgroupid               integer,
			 userid                    integer not null,
			 objectpath                varchar(255),
			 mimetype                  varchar(50),
			 flags                     integer  NOT NULL DEFAULT 0
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_pollvote' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollvote
             (
             pollvoteid                serial NOT NULL,
			 pollid                    integer NOT NULL,
			 userid                    integer,
			 remoteip                  varchar(39),
			 choiceid                  integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_pollvoterefuse' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollvoterefuse
             (
             refuseid                  serial NOT NULL,
			 pollid                    integer NOT NULL,
			 userid                    integer,
			 remoteip                  varchar(57)
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_rank' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_rank
             (
             rankid                    serial NOT NULL,
			 boardid                   integer NOT NULL,
			 name                      varchar(128) NOT NULL,
			 minposts                  integer,
			 rankimage                 varchar(128),
			 flags                     integer DEFAULT 0 NOT NULL,
			 pmlimit                   integer DEFAULT 0 NOT NULL,
			 style                     varchar(255),
			 sortorder                 smallint DEFAULT 0 NOT NULL,
			 description               varchar(128),
			 usrsigchars               integer DEFAULT 0 NOT NULL,
			 usrsigbbcodes	           varchar(255),
			 usrsightmltags            varchar(255),
			 usralbums                 integer DEFAULT 0 NOT NULL,
			 usralbumimages            integer DEFAULT 0 NOT NULL
			 ) 
		WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_registry' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_registry
             (
             registryid                serial NOT NULL,
			 name                      varchar(128) NOT NULL,
			 value                     text,
			 boardid                   integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			   AND tablename='objectQualifier_replace_words' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_replace_words
             (
             id                        serial NOT NULL,
			 boardid                   integer NOT NULL,
			 badword                   varchar(255),
			 goodword                  varchar(255)
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_smiley' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_smiley
             (
             smileyid                  serial NOT NULL,
			 boardid                   integer NOT NULL,
			 code                      varchar(10) NOT NULL,
			 icon                      varchar(128) NOT NULL,
			 emoticon                  varchar(128),
			 sortorder                 smallint DEFAULT 0 NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_topic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_topic
             (
             topicid                   serial NOT NULL,
			 forumid                   integer NOT NULL,
			 userid                    integer NOT NULL,
			 username                  varchar(128),
			 posted                    timestampTZ  NOT NULL,
			 topic                     varchar(128) NOT NULL,
			 views                     integer NOT NULL,
			 priority                  smallint NOT NULL,
			 pollid                    integer,
			 topicmovedid              integer,
			 lastposted                timestampTZ ,
			 lastmessageid             integer,
			 lastuserid                integer,
			 lastusername              varchar(128),
			 numposts                  integer NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL,
			 answermessageid           integer NULL,
			 lastmessageflags          integer NOT null default 22,
			 description               varchar(255),
			 status                    varchar(255),
			 styles                    varchar(255),
			 islocked                  boolean DEFAULT FALSE NOT NULL,
			 isdeleted                 boolean DEFAULT FALSE NOT NULL,
			 ispersistent              boolean DEFAULT FALSE NOT NULL,
			 isquestion                boolean DEFAULT FALSE NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
			   where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_user' LIMIT 1) THEN
CREATE TABLE databaseSchema.objectQualifier_user
             (
             userid                    serial NOT NULL,
			 boardid                   integer NOT NULL,
			 provideruserkey           varchar(64),
			 name                      varchar(128) NOT NULL,
			 password                  varchar(32) NOT NULL,
			 email                     varchar(128),
			 joined                    timestampTZ  NOT NULL,
			 lastvisit                 timestampTZ  NOT NULL,
			 ip                        varchar(39),
			 numposts                  integer NOT NULL,
			 timezone                  integer NOT NULL,
			 avatar                    varchar(255),
			 signature                 text,
			 avatarimage               bytea,
			 avatarimagetype           varchar(128),
			 rankid                    integer NOT NULL,
			 suspended                 timestampTZ ,
			 languagefile              varchar(128),
			 themefile                 varchar(128),
			 overridedefaultthemes     boolean DEFAULT false NOT NULL,
			 pmnotification            boolean DEFAULT true NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL,
			 points                    integer DEFAULT 0 NOT NULL,
			 autowatchtopics           boolean NOT NULL DEFAULT FALSE,
			 displayname               varchar(128) NOT NULL,
			 culture                   varchar(10),
			 dailydigest               boolean NOT NULL DEFAULT FALSE,
			 notificationtype          integer,
			 texteditor	               varchar(50) NULL,
			 usesinglesignon           boolean NOT NULL  DEFAULT FALSE,
			 isfacebookuser            boolean NOT NULL  DEFAULT FALSE,
			 istwitteruser             boolean NOT NULL  DEFAULT FALSE,
			 ishostadmin               boolean NOT NULL  DEFAULT FALSE,
			 isapproved                boolean NOT NULL  DEFAULT FALSE,
             isguest                   boolean NOT NULL  DEFAULT TRUE,
			 iscaptchaexcluded         boolean NOT NULL  DEFAULT FALSE,
			 isactiveexcluded          boolean NOT NULL  DEFAULT FALSE,
			 isdst                     boolean NOT NULL  DEFAULT FALSE,
			 isdirty                   boolean NOT NULL  DEFAULT FALSE
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_userprofile' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userprofile
             (
             userid                    integer NOT NULL,
			 lastupdateddate           timestampTZ  NOT NULL,			
			 lastactivity              timestampTZ ,
			 applicationname           varchar(255) NOT NULL,
			 isanonymous               boolean DEFAULT false NOT NULL,
			 username                  varchar(255) NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_userpmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userpmessage
             (
             userpmessageid            serial NOT NULL,
			 userid                    integer NOT NULL,
			 pmessageid                integer NOT NULL,
			 flags                     integer DEFAULT 0 NOT NULL,
			 isread                    boolean DEFAULT false NOT NULL,
			 isinoutbox                boolean DEFAULT false NOT NULL,
			 isarchived                boolean DEFAULT false NOT NULL,
			 isdeleted                 boolean DEFAULT false NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_userforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userforum
             (
             userid                    serial NOT NULL,
			 forumid                   integer NOT NULL,
			 accessmaskid              integer NOT NULL,
			 invited                   timestampTZ  NOT NULL,
			 accepted                  boolean NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_usergroup' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_usergroup
             (
             userid                    integer NOT NULL,
			 groupid                   integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_usermedal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_usermedal
             (
             userid                    integer NOT NULL,
			 medalid                   integer NOT NULL,
			 message                   varchar(128),
			 hide                      boolean DEFAULT false NOT NULL,
			 onlyribbon                boolean DEFAULT false NOT NULL,
			 sortorder                 smallint DEFAULT 255 NOT NULL,
			 dateawarded               timestampTZ  NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_ignoreuser' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_ignoreuser
            (
		     userid                    integer NOT NULL,
			 ignoreduserid             integer NOT NULL
			)
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_watchforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_watchforum
            (
             watchforumid              serial NOT NULL,
			 forumid                   integer NOT NULL,
			 userid                    integer NOT NULL,
			 created timestampTZ  NOT NULL,
			 lastmail timestampTZ
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_watchtopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_watchtopic
             (
             watchtopicid              serial NOT NULL,
			 topicid                   integer NOT NULL,
			 userid                    integer NOT NULL,
			 created                   timestampTZ  NOT NULL,
	         lastmail                  timestampTZ
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_shoutboxmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_shoutboxmessage
             (
             shoutboxmessageid         serial NOT NULL,
			 userid                    integer,
			 username                  varchar(128) NOT NULL,
			 message                   text,
			 "date"                    timestampTZ  NOT NULL,
			 "ip"                      varchar(128) NOT NULL,
			 boardid integer
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_thanks' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_thanks
             (
             thanksid                  serial NOT NULL,
			 thanksfromuserid          integer NOT NULL,
			 thankstouserid            integer NOT NULL,
			 messageid                 integer NOT NULL,
			 thanksdate                timestampTZ  NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

-- YAF Buddy Table

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			      AND tablename='objectQualifier_buddy' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_buddy
             (
             id                        serial NOT NULL,
			 fromuserid                integer NOT NULL,
			 touserid                  integer NOT NULL,
			 approved                  boolean NOT NULL,
			 requested                 timestampTZ  NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

-- FavoriteTopic Table

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_favoritetopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_favoritetopic
             (
             id                        serial NOT NULL,		
		     userid                    integer NOT NULL,
             topicid                   integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

-- UserAlbum Table
IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_useralbum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_useralbum
             (
             albumid                   serial NOT NULL,		
		     userid                    integer NOT NULL,
             title                     varchar(255),	
             coverimageid              integer,
             updated                   timestampTZ  NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_useralbumimage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_useralbumimage
             (
             imageid                   serial NOT NULL,
             albumid                   integer NOT NULL,
             caption                   varchar(255),	
             filename                  varchar(255) NOT NULL,
		     bytes                     integer NOT NULL,
		     contenttype               varchar(50),
		     uploaded                  timestampTZ  NOT NULL,
             downloads                 integer NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_messagehistory' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_messagehistory
             (
             messageid		           integer NOT NULL,
			 message		           text NOT NULL,
			 ip				           varchar(15) NOT NULL,
			 edited			           timestampTZ  NULL,
			 editreason                varchar(100) NULL,
			 ismoderatorchanged        boolean DEFAULT false NOT NULL,
			 flags                     integer NOT NULL DEFAULT 0,
			 editedby		           int NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_topicreadtracking' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_topicreadtracking
             (
             userid			           int NOT NULL,
			 topicid			       int NOT NULL ,
			 lastaccessdate	           timestampTZ  NOT NULL
			 )
	   WITH (OIDS=withOIDs);
END IF;

-- Create Forum Read Tracking Table

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_forumreadtracking' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_forumreadtracking
             (
             userid			           int NOT NULL,
			 forumid			       int NOT NULL,
			 lastaccessdate	           timestampTZ  NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables 
               where schemaname='databaseSchema' 
			     AND tablename='objectQualifier_topicstatus' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_topicstatus
             (
             topicstatusid             serial NOT NULL,
			 topicstatusname           varchar(100) NOT NULL,
			 boardid                   integer NOT NULL,
			 defaultdescription        varchar(100) NOT NULL
			 ) 
	   WITH (OIDS=withOIDs);
END IF;
END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
    -- GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_tables() TO public;
    -- GO
    SELECT databaseSchema.objectQualifier_create_or_check_tables();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_tables();
--GO

-- add missing columns or change them

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_add_or_change_columns()
RETURNS void AS
$BODY$DECLARE i integer;
BEGIN
i := 1;
END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;   
--GO
    SELECT databaseSchema.objectQualifier_add_or_change_columns();
--GO
    DROP FUNCTION databaseSchema.objectQualifier_add_or_change_columns();
--GO
