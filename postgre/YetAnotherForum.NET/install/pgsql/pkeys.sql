-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

-- Primary keys

-- IF EXISTS (SELECT 1 FROM pg_indexes WHERE indexname='' AND tablename='' and schemaname='')
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_pkeys()
RETURNS void AS
$BODY$
BEGIN
-- drop
/* IF  EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_watchtopicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    DROP CONSTRAINT pk_databaseSchema_objectQualifier_watchtopicid;
END IF;

IF  EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_watchforumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    DROP CONSTRAINT pk_databaseSchema_objectQualifier_watchforumid;
END IF; */

IF EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_logid_messagereportedaudit' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_messagereportedaudit
    DROP CONSTRAINT pk_databaseSchema_objectQualifier_logid_messagereportedaudit CASCADE;
END IF;

-- create


IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_attachmentid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_attachment
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_attachmentid PRIMARY KEY (attachmentid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_bbcodeid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bbcode
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_bbcodeid PRIMARY KEY (bbcodeid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_topicstatusid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topicstatus
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_topicstatusid PRIMARY KEY (topicstatusid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_board
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_boardid PRIMARY KEY (boardid);
END IF;    

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_categoryid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_category
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_categoryid PRIMARY KEY (categoryid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_checkemailid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_checkemail
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_checkemailid PRIMARY KEY (checkemailid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_choiceid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_choice
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_choiceid PRIMARY KEY (choiceid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_eventlogid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_eventlog
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_eventlogid PRIMARY KEY (eventlogid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_eventloggroupaccess_groupid_eventtypeid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_eventloggroupaccess
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_eventloggroupaccess_groupid_eventtypeid PRIMARY KEY (groupid,eventtypeid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_extensionid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_extension
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_extensionid PRIMARY KEY (extensionid);
END IF; 

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_forumid PRIMARY KEY (forumid);
END IF;


IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_groupid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_group
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_groupid PRIMARY KEY (groupid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_groupid_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_groupid_forumid PRIMARY KEY (groupid, forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_mailid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_mail
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_mailid PRIMARY KEY (mailid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_medalid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_medal
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_medalid PRIMARY KEY (medalid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_messageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_messageid PRIMARY KEY (messageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_nntpforumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpforum
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_nntpforumid PRIMARY KEY (nntpforumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_nntpserverid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpserver
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_nntpserverid PRIMARY KEY (nntpserverid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_accessmaskid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_accessmask
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_accessmaskid PRIMARY KEY (accessmaskid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_replace_words_id' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_replace_words
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_replace_words_id PRIMARY KEY (id);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_bannedip_id' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bannedip
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_bannedip_id PRIMARY KEY (id);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_rankid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_rank
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_rankid PRIMARY KEY (rankid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_registryid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_registry
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_registryid PRIMARY KEY (registryid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_smileyid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_smiley
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_smileyid PRIMARY KEY (smileyid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_topicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_topicid PRIMARY KEY (topicid);
END IF;   

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_user
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid PRIMARY KEY (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userid_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_forumid PRIMARY KEY (userid, forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userid_groupid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_usergroup
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_groupid PRIMARY KEY (userid, groupid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_userpmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userpmessage
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_userpmessageid PRIMARY KEY (userpmessageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_watchforumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_watchforumid PRIMARY KEY (watchforumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_watchtopicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_watchtopicid PRIMARY KEY (watchtopicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_pmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pmessage
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_pmessageid PRIMARY KEY (pmessageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_pollgroupid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pollgroupcluster
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_pollgroupid PRIMARY KEY (pollgroupid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_pollid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_poll
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_pollid PRIMARY KEY (pollid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_pollvoteid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pollvote
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_pollvoteid PRIMARY KEY (pollvoteid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_ignoreuser' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_ignoreuser
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_ignoreuser PRIMARY KEY (userid, ignoreduserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_sessionid_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_sessionid_boardid PRIMARY KEY (sessionid, boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_nntptopicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntptopic
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_nntptopicid PRIMARY KEY (nntptopicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_shoutboxmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_shoutboxmessage
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_shoutboxmessageid PRIMARY KEY (shoutboxmessageid);
END IF;
 
-- Thanks table

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_thanksid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_thanks
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_thanksid PRIMARY KEY (thanksid);
END IF; 

-- Buddy table

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_buddyid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_buddy
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_buddyid PRIMARY KEY (id);
END IF; 

-- TopicActive table

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_favoritetopic_id' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_favoritetopic
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_favoritetopic_id PRIMARY KEY (id);
END IF; 
 
IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_useralbum_useralbumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_useralbum
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_useralbum_useralbumid PRIMARY KEY (albumid);
END IF; 

IF NOT EXISTS (SELECT 1 FROM pg_constraint where contype='p' and conname ='pk_databaseSchema_objectQualifier_useralbumimage_imageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_useralbumimage
    ADD CONSTRAINT pk_databaseSchema_objectQualifier_useralbumimage_imageid PRIMARY KEY (imageid);
END IF;
IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_forumid_activeaccess' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_activeaccess
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_forumid_activeaccess PRIMARY KEY (userid,forumid);
END IF;
IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_applicationname_userprofile' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_userprofile
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_applicationname_userprofile PRIMARY KEY (userid,applicationname);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_medalid_usermedal' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_usermedal
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_medalid_usermedal PRIMARY KEY (userid,medalid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_forumid_forumreadtracking' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_forumreadtracking
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_forumid_forumreadtracking PRIMARY KEY (userid,forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_topicid_topicreadtracking' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_topicreadtracking
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_topicid_topicreadtracking PRIMARY KEY (userid,topicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_medalid_groupid_groupmedal' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_groupmedal
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_medalid_groupid_groupmedal PRIMARY KEY (medalid,groupid);
END IF;


IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_messageid_edited_messagehistory' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_messagehistory
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_messageid_edited_messagehistory PRIMARY KEY (messageid,edited);
END IF;


IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_messageid_messagereported' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_messagereported
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_messageid_messagereported PRIMARY KEY (messageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_repfruid_reptouid_reputationvote' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_reputationvote
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_repfruid_reptouid_reputationvote PRIMARY KEY (reputationfromuserid,reputationtouserid);
END IF; 

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_userid_pagename_adminpageuseraccess' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_adminpageuseraccess
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_userid_pagename_adminpageuseraccess PRIMARY KEY (userid,pagename);
END IF; 

IF NOT EXISTS (SELECT 1 FROM pg_constraint 
               where contype='p' 
			     and conname ='pk_databaseSchema_objectQualifier_messageid_userid_reported_objectQualifier_messagereportedaudit' LIMIT 1) THEN
   ALTER TABLE ONLY databaseSchema.objectQualifier_messagereportedaudit
   ADD CONSTRAINT pk_databaseSchema_objectQualifier_messageid_userid_reported_objectQualifier_messagereportedaudit PRIMARY KEY (messageid,userid,reported);
END IF;

END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
     GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_pkeys() TO public;
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_pkeys();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_pkeys();
--GO
