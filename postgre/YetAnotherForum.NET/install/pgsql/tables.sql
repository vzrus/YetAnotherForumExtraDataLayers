-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009



CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_tables()
RETURNS void AS
$BODY$
BEGIN

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_accessmask' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_accessmask (
    accessmaskid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    sortorder smallint DEFAULT 0 NOT NULL
) WITH (OIDS=withOIDs);
END IF;




IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_active' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_active (
    sessionid character varying(24) NOT NULL,
    boardid integer NOT NULL,
    userid integer NOT NULL,
    ip character varying(39) NOT NULL,
    login timestamp with time zone NOT NULL,
    lastactive timestamp with time zone NOT NULL,
    location character varying(255) NOT NULL,    
    forumid integer,
    topicid integer,
    browser character varying(128),
    platform character varying(128),
    forumpage character varying(255) NOT NULL,
	flags integer NOT NULL default 0
) WITH (OIDS=withOIDs);

END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_activeaccess' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_activeaccess(		
		userid integer NOT NULL,
		boardid integer NOT NULL,			
		forumid			    integer,
		isadmin				boolean NOT NULL default false,
		isforummoderator	boolean NOT NULL default false,
		ismoderator			boolean NOT NULL default false,
		isguestx			boolean NOT NULL default false,
		lastactive			timestamp with time zone,
		readaccess			boolean NOT NULL default false,
		postaccess			boolean NOT NULL default false,
		replyaccess			boolean NOT NULL default false,
		priorityaccess		boolean NOT NULL default false,
		pollaccess			boolean NOT NULL default false,
		voteaccess			boolean NOT NULL default false,
		moderatoraccess		boolean NOT NULL default false,
		editaccess			boolean NOT NULL default false,
		deleteaccess		boolean NOT NULL default false,
		uploadaccess		boolean NOT NULL default false,		
		downloadaccess		boolean NOT NULL default false		
	) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_attachment' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_attachment (
    attachmentid serial NOT NULL,
    messageid integer NOT NULL,
    filename character varying(255) NOT NULL,
    bytes integer NOT NULL,
    fileid integer,
    contenttype character varying(128),
    downloads integer NOT NULL,
    filedata bytea
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_bannedip' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_bannedip (
    id serial NOT NULL,
    boardid integer NOT NULL,
    mask character varying(57) NOT NULL,
    since timestamp with time zone NOT NULL,
    reason  character varying(128),
	userid	integer 
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_bbcode' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_bbcode (
    bbcodeid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000),
    onclickjs character varying(1000),
    displayjs text,
    editjs text,
    displaycss text,
    searchregex text,
    replaceregex text,
    variables character varying(1000),
    usemodule boolean,
    moduleclass character varying(255),
    execorder integer NOT NULL
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_board' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_board (
    boardid serial NOT NULL,
    name character varying(128) NOT NULL,
    allowthreaded boolean NOT NULL,
    membershipappname character varying(255),
    rolesappname character varying(255)
) WITH (OIDS=withOIDs);
END IF;
IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_category' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_category (
    categoryid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    categoryimage character varying(255),
    sortorder smallint NOT NULL,
	pollgroupid int
) WITH (OIDS=withOIDs);
END IF;




IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_checkemail' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_checkemail (
    checkemailid serial NOT NULL,
    userid integer NOT NULL,
    email character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    hash character varying(32) NOT NULL
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_choice' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_choice (
    choiceid serial NOT NULL,
    pollid integer NOT NULL,
    choice character varying(128) NOT NULL,
    votes integer NOT NULL,
	objectpath varchar(255),
	mimetype varchar(50)
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_eventlog' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_eventlog (
    eventlogid serial NOT NULL,
    eventtime timestamp with time zone NOT NULL DEFAULT (CURRENT_TIMESTAMP AT TIME ZONE 'UTC'),
    userid integer,
    source character varying(128) NOT NULL,
    description text NOT NULL,
    type integer DEFAULT 0 NOT NULL
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_extension' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_extension (
    extensionid serial NOT NULL,
    boardid integer DEFAULT 1 NOT NULL,
    extension character varying(10) NOT NULL
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_forum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_forum (
    forumid serial NOT NULL,
    categoryid integer NOT NULL,
    parentid integer,
    name character varying(128) NOT NULL,
    description character varying(255) NOT NULL,
    sortorder smallint NOT NULL,
    lastposted timestamp with time zone,
    lasttopicid integer,
    lastmessageid integer,
    lastuserid integer,
    lastusername character varying(128),
    numtopics integer NOT NULL,
    numposts integer NOT NULL,
    remoteurl character varying(255),
    flags integer DEFAULT 0 NOT NULL,
    themeurl character varying(255),
    imageurl character varying(255),
    styles character varying(255),
	pollgroupid  integer
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_forumaccess' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_forumaccess (
    groupid integer NOT NULL,
    forumid integer NOT NULL,
    accessmaskid integer NOT NULL
) WITH (OIDS=withOIDs);
END IF;




IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_group' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_group (
    groupid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    pmlimit integer,
    style  character varying(255),
    sortorder  smallint DEFAULT 0 NOT NULL,              
    description varchar(128),
	usrsigchars integer   DEFAULT 0 NOT NULL,
	usrsigbbcodes	varchar(255),
	usrsightmltags varchar(255),
	usralbums integer  DEFAULT 0 NOT NULL,
	usralbumimages integer   DEFAULT 0 NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_groupmedal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_groupmedal (
    groupid integer NOT NULL,
    medalid integer NOT NULL,
    message character varying(128),
    hide boolean DEFAULT false NOT NULL,
    onlyribbon boolean DEFAULT false NOT NULL,
    sortorder smallint DEFAULT 255 NOT NULL
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_mail' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_mail (
    mailid serial NOT NULL,
    fromuser character varying(128) NOT NULL,
    fromusername character varying(128),
    touser character varying(128) NOT NULL,
    tousername character varying(128),
    created timestamp with time zone NOT NULL,
    subject character varying(128) NOT NULL,
    body text NOT NULL,
    bodyhtml text,
    sendtries integer DEFAULT 0 NOT NULL,
    sendattempt timestamp with time zone,
    processid integer
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_medal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_medal (
    medalid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    message character varying(128) NOT NULL,
    category character varying(128),
    medalurl character varying(255) NOT NULL,
    ribbonurl character varying(255),
    smallmedalurl character varying(255) NOT NULL,
    smallribbonurl character varying(255),
    smallmedalwidth smallint NOT NULL,
    smallmedalheight smallint NOT NULL,
    smallribbonwidth smallint,
    smallribbonheight smallint,
    sortorder smallint DEFAULT 255 NOT NULL,
    flags integer DEFAULT 0 NOT NULL
) WITH (OIDS=withOIDs);
END IF;



IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_message' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_message (
    messageid serial NOT NULL,
    topicid integer NOT NULL,
    replyto integer,
    position integer NOT NULL,
    indent integer NOT NULL,
    userid integer NOT NULL,
    username character varying(128),
    posted timestamp with time zone NOT NULL,
    message text NOT NULL,
    ip character varying(39) NOT NULL,
    edited timestamp with time zone,
    flags integer DEFAULT 23 NOT NULL,
    editreason character varying(128),
    ismoderatorchanged boolean DEFAULT false NOT NULL,
    deletereason character varying(128),
    blogpostid character varying(128),
    editedby integer,
	externalmessageid character varying(255),
	referencemessageid	character varying(255)
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_messagereported' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_messagereported (
    messageid integer NOT NULL,
    message text,
    resolved boolean,
    resolvedby integer,
    resolveddate timestamp with time zone
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_messagereportedaudit' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_messagereportedaudit (
    logid serial NOT NULL,
    userid integer,
    messageid integer,
    reported timestamp with time zone,
    reportednumber  integer,
    reporttext character varying(4000)
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_nntpforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntpforum (
    nntpforumid serial NOT NULL,
    nntpserverid integer NOT NULL,
    groupname character varying(128) NOT NULL,
    forumid integer NOT NULL,
    lastmessageno integer NOT NULL,
    lastupdate timestamp with time zone NOT NULL,
    active boolean NOT NULL,
	datecutoff	timestamp with time zone
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_nntpserver' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntpserver (
    nntpserverid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    address character varying(100) NOT NULL,
    port integer,
    username character varying(128),
    userpass character varying(128)
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_nntptopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_nntptopic (
    nntptopicid serial NOT NULL,
    nntpforumid integer NOT NULL,
    thread character varying(64) NOT NULL,
    topicid integer NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_pmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pmessage (
    pmessageid serial NOT NULL,
    fromuserid integer NOT NULL,
    created timestamp with time zone NOT NULL,
    subject character varying(100) NOT NULL,
    body text NOT NULL,
    flags integer NOT NULL
) WITH (OIDS=withOIDs);
END IF;
IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_pollgroupcluster' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollgroupcluster (
    pollgroupid serial NOT NULL,
    userid integer NOT NULL,
    flags integer NOT NULL DEFAULT 0
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_poll' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_poll (
    pollid serial NOT NULL,
    question character varying(128) NOT NULL,
    closes timestamp with time zone,
	pollgroupid integer,
	userid integer not null,
	objectpath character varying(255),
	mimetype character varying(50),
	flags integer  NOT NULL DEFAULT 0
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_pollvote' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollvote (
    pollvoteid serial NOT NULL,
    pollid integer NOT NULL,
    userid integer,
    remoteip character varying(39),
	choiceid integer
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_pollvoterefuse' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_pollvoterefuse (
    refuseid serial NOT NULL,	
    pollid integer NOT NULL,
    userid integer,
    remoteip character varying(57)	
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_rank' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_rank (
    rankid serial NOT NULL,
    boardid integer NOT NULL,
    name character varying(128) NOT NULL,
    minposts integer,
    rankimage character varying(128),
    flags integer DEFAULT 0 NOT NULL,
    pmlimit integer DEFAULT 0 NOT NULL,
    style  character varying(255),
    sortorder smallint DEFAULT 0 NOT NULL,              
    description varchar(128),
    usrsigchars integer DEFAULT 0 NOT NULL,
	usrsigbbcodes	varchar(255),
	usrsightmltags varchar(255),
	usralbums integer DEFAULT 0 NOT NULL,
	usralbumimages integer DEFAULT 0 NOT NULL 
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_registry' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_registry (
    registryid serial NOT NULL,
    name character varying(128) NOT NULL,
    value text,
    boardid integer
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_replace_words' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_replace_words (
    id serial NOT NULL,
    boardid integer NOT NULL,
    badword character varying(255),
    goodword character varying(255)
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_smiley' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_smiley (
    smileyid serial NOT NULL,
    boardid integer NOT NULL,
    code character varying(10) NOT NULL,
    icon character varying(128) NOT NULL,
    emoticon character varying(128),
    sortorder smallint DEFAULT 0 NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_topic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_topic (
    topicid serial NOT NULL,
    forumid integer NOT NULL,
    userid integer NOT NULL,
    username character varying(128),
    posted timestamp with time zone NOT NULL,
    topic character varying(128) NOT NULL,	
    views integer NOT NULL,
    priority smallint NOT NULL,
    pollid integer,
    topicmovedid integer,
    lastposted timestamp with time zone,
    lastmessageid integer,
    lastuserid integer,
    lastusername character varying(128),
    numposts integer NOT NULL,
    flags integer DEFAULT 0 NOT NULL, 
    answermessageid INT NULL,
	lastmessageflags INT NOT null default 22,
	description  character varying(255), 
	status   character varying(255),
	styles   character varying(255)                   
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_attribute 
WHERE attrelid = (SELECT oid FROM pg_class WHERE relname = 'objectQualifier_topic' limit 1) AND attname = 'answermessageid' LIMIT 1) THEN
ALTER  TABLE  databaseSchema.objectQualifier_topic ADD COLUMN answermessageid INT NULL;
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_user' LIMIT 1) THEN
CREATE TABLE databaseSchema.objectQualifier_user (
userid serial NOT NULL,    
boardid integer NOT NULL,    
provideruserkey character varying(64),    
name character varying(128) NOT NULL,    
password character varying(32) NOT NULL,    
email character varying(128),    
joined timestamp with time zone NOT NULL,    
lastvisit timestamp with time zone NOT NULL,    
ip character varying(39),    
numposts integer NOT NULL,    
timezone integer NOT NULL,    
avatar character varying(255),    
signature text,    
avatarimage bytea,    
avatarimagetype character varying(128),    
rankid integer NOT NULL,    
suspended timestamp with time zone,    
languagefile character varying(128),    
themefile character varying(128),
overridedefaultthemes boolean DEFAULT false NOT NULL,    
pmnotification boolean DEFAULT true NOT NULL,    
flags integer DEFAULT 0 NOT NULL,    
points integer DEFAULT 0 NOT NULL,
autowatchtopics boolean NOT NULL DEFAULT FALSE,
displayname character varying(128) NOT NULL,
culture varchar(10),
dailydigest boolean NOT NULL DEFAULT FALSE,
notificationtype integer,
texteditor	character varying(50) NULL,
usesinglesignon boolean NOT NULL  DEFAULT FALSE,
isfacebookuser boolean NOT NULL  DEFAULT FALSE,
istwitteruser boolean NOT NULL  DEFAULT FALSE
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_userprofile' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userprofile
	(
		userid integer NOT NULL,
		lastupdateddate  timestamp with time zone NOT NULL,
		-- added columns
		lastactivity  timestamp with time zone,
		applicationname varchar(255) NOT NULL,	
		isanonymous boolean NOT NULL,
		username varchar(255) NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_userpmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userpmessage (
    userpmessageid serial NOT NULL,
    userid integer NOT NULL,
    pmessageid integer NOT NULL,
    flags integer DEFAULT 0 NOT NULL  
) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_userforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_userforum (
    userid serial NOT NULL,
    forumid integer NOT NULL,
    accessmaskid integer NOT NULL,
    invited timestamp with time zone NOT NULL,
    accepted boolean NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_usergroup' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_usergroup (
    userid integer NOT NULL,
    groupid integer NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_usermedal' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_usermedal (
    userid integer NOT NULL,
    medalid integer NOT NULL,
    message character varying(128),
    hide boolean DEFAULT false NOT NULL,
    onlyribbon boolean DEFAULT false NOT NULL,
    sortorder smallint DEFAULT 255 NOT NULL,
    dateawarded timestamp with time zone NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_ignoreuser' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_ignoreuser
	(
		userid int NOT NULL,
		ignoreduserid int NOT NULL
	) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_watchforum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_watchforum (
    watchforumid serial NOT NULL,
    forumid integer NOT NULL,
    userid integer NOT NULL,
    created timestamp with time zone NOT NULL,
    lastmail timestamp with time zone
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_watchtopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_watchtopic (
    watchtopicid serial NOT NULL,
    topicid integer NOT NULL,
    userid integer NOT NULL,
    created timestamp with time zone NOT NULL,
    lastmail timestamp with time zone
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_shoutboxmessage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_shoutboxmessage (
        shoutboxmessageid serial NOT NULL,		
		userid integer,
		username varchar(128) NOT NULL,
		message text,
		"date" timestamp with time zone NOT NULL,
		"ip" varchar(128) NOT NULL,
		boardid integer  
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_thanks' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_thanks (
                thanksid serial NOT NULL,		
		        thanksfromuserid integer NOT NULL,
                thankstouserid integer NOT NULL,
                messageid integer NOT NULL,		
		thanksdate timestamp with time zone NOT NULL		
) WITH (OIDS=withOIDs);
END IF;


-- YAF Buddy Table

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_buddy' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_buddy (
                id serial NOT NULL,		
		        fromuserid integer NOT NULL,
                touserid integer NOT NULL,
                approved boolean NOT NULL,		
		requested timestamp with time zone NOT NULL		
) WITH (OIDS=withOIDs);
END IF;

-- FavoriteTopic Table

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_favoritetopic' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_favoritetopic (
                id serial NOT NULL,		
		        userid integer NOT NULL,
                topicid integer NOT NULL	
) WITH (OIDS=withOIDs);
END IF;

-- UserAlbum Table
IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_useralbum' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_useralbum (
                albumid serial NOT NULL,		
		        userid integer NOT NULL,
                title  varchar(255),	
                coverimageid integer,
                updated timestamp with time zone NOT NULL
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_useralbumimage' limit 1) THEN
CREATE TABLE databaseSchema.objectQualifier_useralbumimage (
                imageid serial NOT NULL,
                albumid integer NOT NULL,
                caption  varchar(255),	
                filename  varchar(255) NOT NULL,
		        bytes integer NOT NULL,
		        contenttype  varchar(50),
		        uploaded timestamp with time zone NOT NULL,
                downloads integer NOT NULL	
) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_messagehistory' limit 1) THEN
	create table databaseSchema.objectQualifier_messagehistory(	
		messageid		integer NOT NULL ,
		message			text NOT NULL ,
		ip				varchar (15) NOT NULL ,
		edited			timestamp with time zone NULL,			
		editreason      varchar (100) NULL ,
		ismoderatorchanged boolean DEFAULT false NOT NULL,
		flags integer NOT NULL DEFAULT 0,
		editedby		int NULL	  
	) WITH (OIDS=withOIDs);
END IF;


IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_topicreadtracking' limit 1) THEN
	create table databaseSchema.objectQualifier_topicreadtracking(	
		userid			int NOT NULL ,
		topicid			int NOT NULL ,
		lastaccessdate	timestamp with time zone NOT NULL		
	) WITH (OIDS=withOIDs);
END IF;

-- Create Forum Read Tracking Table

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_forumreadtracking' limit 1) THEN
	create table databaseSchema.objectQualifier_forumreadtracking(
		userid			int NOT NULL ,
		forumid			int NOT NULL ,
		lastaccessdate	timestamp with time zone NOT NULL
		) WITH (OIDS=withOIDs);
END IF;

IF NOT EXISTS (select 1 from pg_tables where schemaname='databaseSchema' AND tablename='objectQualifier_topicstatus' limit 1) THEN
	create table databaseSchema.objectQualifier_topicstatus(
	    topicstatusid serial NOT NULL,
		topicstatusname varchar(100) NOT NULL,
		boardid integer NOT NULL,
		defaultdescription varchar(100) NOT NULL
		) WITH (OIDS=withOIDs);
END IF;


-- add missing columns



IF (column_exists('databaseSchema.objectQualifier_activeaccess','isguestx') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_activeaccess ADD COLUMN isguestx	boolean NOT NULL default false;
END IF;

IF (column_exists('databaseSchema.objectQualifier_activeaccess','lastactive') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_activeaccess ADD COLUMN lastactive timestamp with time zone;
END IF;
		
IF (column_exists('databaseSchema.objectQualifier_nntpforum','datecutoff') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_nntpforum ADD COLUMN datecutoff	timestamp with time zone NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_message','externalmessageid' ) IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_message ADD COLUMN externalmessageid character varying(255) NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_message','referencemessageid' ) IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_message ADD COLUMN referencemessageid character varying(255) NULL;
END IF;


END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
    -- GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_tables() TO public;
    -- GO
    SELECT databaseSchema.objectQualifier_create_or_check_tables();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_tables();
--GO

/*

SELECT atttypmod FROM pg_attribute
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage';
We get here 259 if col size = 255 
UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage';
UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'location';

UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage'; */

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_tables2()
RETURNS void AS
$BODY$
BEGIN





-- User Table

IF (column_exists('databaseSchema.objectQualifier_user','texteditor') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN texteditor character varying(50) NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','usesinglesignon') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN usesinglesignon bool NOT NULL  DEFAULT false;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isfacebookuser') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isfacebookuser boolean NOT NULL  DEFAULT FALSE;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','istwitteruser') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN istwitteruser boolean NOT NULL  DEFAULT FALSE;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','ishostadmin') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN ishostadmin boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET ishostadmin = ((flags & 1) = 1);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN ishostadmin SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isapproved') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isapproved boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET isapproved = ((flags & 2) = 2);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN  isapproved SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isguest') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isguest boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET isguest = ((flags & 4) = 4);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN isguest SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','iscaptchaexcluded') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN iscaptchaexcluded boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET iscaptchaexcluded = ((flags & 8) = 8);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN iscaptchaexcluded SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isactiveexcluded') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isactiveexcluded boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET isactiveexcluded = ((flags & 16) = 16);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN isactiveexcluded SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isdst') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isdst boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET isdst = ((flags & 32) = 32);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN isdst SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_user','isdirty') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_user ADD COLUMN isdirty boolean NULL;
UPDATE databaseSchema.objectQualifier_user SET isdirty = ((flags & 64) = 64);
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN isdirty SET NOT NULL;
END IF;

-- Topic Table

IF (column_exists('databaseSchema.objectQualifier_topic','description') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN "description" character varying(255) NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_topic','status') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN "status" character varying(255) NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_topic','styles') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN "styles" character varying(255) NULL;
END IF;

 IF (column_exists('databaseSchema.objectQualifier_topic','islocked') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN islocked boolean NULL;
UPDATE databaseSchema.objectQualifier_topic SET islocked = ((flags & 1) = 1);
ALTER TABLE databaseSchema.objectQualifier_topic ALTER COLUMN islocked SET NOT NULL;
END IF; 

IF (column_exists('databaseSchema.objectQualifier_topic','isdeleted') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN isdeleted boolean NULL;
UPDATE databaseSchema.objectQualifier_topic SET isdeleted = ((flags & 8) = 8);
ALTER TABLE databaseSchema.objectQualifier_topic ALTER COLUMN isdeleted SET NOT NULL;
END IF;

 IF (column_exists('databaseSchema.objectQualifier_topic','ispersistent') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN ispersistent boolean NULL;
UPDATE databaseSchema.objectQualifier_topic SET ispersistent = ((flags & 512) = 512);
ALTER TABLE databaseSchema.objectQualifier_topic ALTER COLUMN ispersistent SET NOT NULL;
END IF; 

IF (column_exists('databaseSchema.objectQualifier_topic','isquestion') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_topic ADD COLUMN isquestion boolean NULL;
UPDATE databaseSchema.objectQualifier_topic SET isquestion = ((flags & 1024) = 1024);
ALTER TABLE databaseSchema.objectQualifier_topic ALTER COLUMN isquestion SET NOT NULL;
END IF;

-- Message Table
IF (column_exists('databaseSchema.objectQualifier_message','isdeleted') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_message ADD COLUMN isdeleted boolean NULL;
UPDATE databaseSchema.objectQualifier_message SET isdeleted = ((flags & 8) = 8);
ALTER TABLE databaseSchema.objectQualifier_message ALTER COLUMN isdeleted SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_message','isapproved') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_message ADD COLUMN isapproved boolean NULL;
UPDATE databaseSchema.objectQualifier_message SET isapproved = ((flags & 16) = 16);
ALTER TABLE databaseSchema.objectQualifier_message ALTER COLUMN isapproved SET NOT NULL;
END IF;

-- messagehistory table

IF (column_exists('databaseSchema.objectQualifier_messagehistory','messagehistoryid') IS TRUE) THEN
ALTER TABLE databaseSchema.objectQualifier_messagehistory DROP CONSTRAINT IF EXISTS messagehistoryid;
ALTER TABLE databaseSchema.objectQualifier_messagehistory DROP COLUMN IF EXISTS messagehistoryid;
END IF;

IF (column_exists('databaseSchema.objectQualifier_topicreadtracking','trackingid') IS TRUE) THEN
ALTER TABLE databaseSchema.objectQualifier_topicreadtracking DROP CONSTRAINT IF EXISTS trackingid;
ALTER TABLE databaseSchema.objectQualifier_topicreadtracking DROP COLUMN IF EXISTS trackingid;
END IF;

IF (column_exists('databaseSchema.objectQualifier_forumreadtracking','trackingid') IS TRUE) THEN
ALTER TABLE databaseSchema.objectQualifier_forumreadtracking DROP CONSTRAINT IF EXISTS trackingid;
ALTER TABLE databaseSchema.objectQualifier_forumreadtracking DROP COLUMN IF EXISTS trackingid;
END IF;

IF (column_exists('databaseSchema.objectQualifier_board','boarduid') IS TRUE) THEN
ALTER TABLE databaseSchema.objectQualifier_board DROP CONSTRAINT IF EXISTS boarduid;
ALTER TABLE databaseSchema.objectQualifier_board DROP COLUMN IF EXISTS boarduid;
END IF;

IF (column_exists('databaseSchema.objectQualifier_pollvoterefuse','boardid') IS TRUE) THEN
ALTER TABLE databaseSchema.objectQualifier_pollvoterefuse DROP CONSTRAINT IF EXISTS boardid;
ALTER TABLE databaseSchema.objectQualifier_pollvoterefuse DROP COLUMN IF EXISTS boardid;
END IF;

-- alter column
IF EXISTS (SELECT 1 FROM pg_attribute WHERE attrelid = 'databaseSchema.objectQualifier_nntptopic'::regclass and atttypmod < 37 and attname = 'thread') THEN
ALTER TABLE databaseSchema.objectQualifier_nntptopic ALTER COLUMN thread SET DEFAULT  NOT NULL;
ALTER TABLE databaseSchema.objectQualifier_nntptopic ALTER COLUMN thread TYPE  character varying(64) ;
END IF;

-- change column type to not null
IF EXISTS (SELECT 1 FROM pg_attribute
WHERE attrelid = 'databaseSchema.objectQualifier_group'::regclass
AND attname = 'usrsigchars' AND attnotnull IS FALSE LIMIT 1) THEN
UPDATE databaseSchema.objectQualifier_group SET usrsigchars = 0 WHERE  usrsigchars is null; 
ALTER TABLE databaseSchema.objectQualifier_group ALTER COLUMN usrsigchars SET DEFAULT 0; 
ALTER TABLE databaseSchema.objectQualifier_group ALTER COLUMN usrsigchars SET NOT NULL; 
END IF;

IF EXISTS (SELECT 1 FROM pg_attribute
WHERE attrelid = 'databaseSchema.objectQualifier_group'::regclass
AND attname = 'pmlimit' AND attnotnull IS FALSE LIMIT 1) THEN
UPDATE databaseSchema.objectQualifier_group SET pmlimit = 0 WHERE  pmlimit is null; 
ALTER TABLE databaseSchema.objectQualifier_group ALTER COLUMN pmlimit SET DEFAULT 0; 
ALTER TABLE databaseSchema.objectQualifier_group ALTER COLUMN pmlimit SET NOT NULL; 
END IF;

IF EXISTS (SELECT 1 FROM pg_attribute WHERE attrelid = 'databaseSchema.objectQualifier_user'::regclass and atttypmod < 8 and attname = 'culture') THEN
ALTER TABLE databaseSchema.objectQualifier_user ALTER COLUMN culture TYPE  character varying(10) ;
END IF;

--- userpmessage table 
IF (column_exists('databaseSchema.objectQualifier_userpmessage','isread') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_userpmessage ADD COLUMN isread boolean NULL;
UPDATE databaseSchema.objectQualifier_userpmessage SET isread = ((flags & 1) = 1);
ALTER TABLE databaseSchema.objectQualifier_userpmessage ALTER COLUMN isread SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_userpmessage','isinoutbox') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_userpmessage ADD COLUMN isinoutbox boolean NULL;
UPDATE databaseSchema.objectQualifier_userpmessage SET isinoutbox = ((flags & 2) = 2);
ALTER TABLE databaseSchema.objectQualifier_userpmessage ALTER COLUMN isinoutbox SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_userpmessage','isarchived') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_userpmessage ADD COLUMN isarchived boolean NULL;
UPDATE databaseSchema.objectQualifier_userpmessage SET isarchived = ((flags & 4) = 4);
ALTER TABLE databaseSchema.objectQualifier_userpmessage ALTER COLUMN isarchived SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_userpmessage','isdeleted') IS FALSE) THEN
ALTER TABLE databaseSchema.objectQualifier_userpmessage ADD COLUMN isdeleted boolean NULL;
UPDATE databaseSchema.objectQualifier_userpmessage SET isdeleted = ((flags & 8) = 8);
ALTER TABLE databaseSchema.objectQualifier_userpmessage ALTER COLUMN isdeleted SET NOT NULL;
END IF;

IF (column_exists('databaseSchema.objectQualifier_pmessage','flags') IS TRUE) THEN
UPDATE databaseSchema.objectQualifier_pmessage SET flags = 0 WHERE flags IS NULL;
ALTER TABLE databaseSchema.objectQualifier_pmessage ALTER COLUMN flags SET NOT NULL;
ALTER TABLE public.yaf_pmessage ALTER COLUMN flags SET DEFAULT 0;
END IF;

ALTER TABLE yaf_user ALTER COLUMN flags SET DEFAULT 0;



END ;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
    -- GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_tables() TO public;
    -- GO
    SELECT databaseSchema.objectQualifier_create_or_check_tables2();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_tables2();
--GO

/*

SELECT atttypmod FROM pg_attribute
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage';
We get here 259 if col size = 255 
UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage';
UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'location';

UPDATE pg_attribute SET atttypmod = 255+4
WHERE attrelid = 'yaf_active'::regclass
AND attname = 'forumpage'; */












