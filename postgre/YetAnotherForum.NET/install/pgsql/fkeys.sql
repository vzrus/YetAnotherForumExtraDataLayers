﻿-- This scripts for PostgreSQL Yet Another Forum http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team http://sourceforge.net/projects/yaf-datalayers/
-- They are distributed under terms of GPL licence as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2010

-- Foregn keys

--databaseSchema.objectQualifier_check_or_create_keys arguments
-- constraint_schema,constraint_table, key_table(''(for pkeys)|'table_name'(for fkeys),constraint_name,constraint_column,constraint_type('p'(primary key)|'f'(foreign key))	

-- SELECT databaseSchema.objectQualifier_check_or_create_keys('databaseSchema','objectQualifier_bbcode','objectQualifier_board','fk_databaseSchema_objectQualifier_bbcode_objectQualifier_board_boardid','boardid','f');
-- GO

-- SELECT databaseSchema.objectQualifier_check_or_create_keys('databaseSchema','objectQualifier_accessmask','objectQualifier_board','fk_databaseSchema_objectQualifier_accessmask_objectQualifier_board_boardid','boardid','f');
-- GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_fkeys()
RETURNS void AS
$BODY$
BEGIN

IF EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    DROP CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_bbcode_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bbcode
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_bbcode_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid) 
    ON DELETE NO ACTION;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_accessmask_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_accessmask
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_accessmask_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;    

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_forum_forumid 
    FOREIGN KEY (forumid) 
    REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_messagehistory_messageid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_messagehistory
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_messagehistory_messageid 
    FOREIGN KEY (messageid) 
    REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;  

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_topic_topicid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_topic_topicid 
    FOREIGN KEY (topicid) 
    REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_user_userid 
    FOREIGN KEY (userid) 
    REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;   

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_attachment
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid 
    FOREIGN KEY (messageid) 
    REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_bannedip_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bannedip
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_bannedip_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_category_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_category
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_category_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_checkemail
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_choice
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid FOREIGN KEY (pollid) REFERENCES databaseSchema.objectQualifier_poll(pollid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_eventlog
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_extension
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid FOREIGN KEY (accessmaskid) REFERENCES databaseSchema.objectQualifier_accessmask(accessmaskid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_group_groupid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_group_groupid FOREIGN KEY (groupid) REFERENCES databaseSchema.objectQualifier_group(groupid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_category_categoryid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_category_categoryid FOREIGN KEY (categoryid) REFERENCES databaseSchema.objectQualifier_category(categoryid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_forum_parentid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_forum_parentid FOREIGN KEY (parentid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid FOREIGN KEY (lastmessageid) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid FOREIGN KEY (lasttopicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid FOREIGN KEY (lastuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_group_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_group
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_group_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_message_replyto') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_message_replyto FOREIGN KEY (replyto) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid FOREIGN KEY (nntpserverid) REFERENCES databaseSchema.objectQualifier_nntpserver(nntpserverid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpserver
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntptopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid FOREIGN KEY (nntpforumid) REFERENCES databaseSchema.objectQualifier_nntpforum(nntpforumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntptopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid FOREIGN KEY (fromuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pollvote
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid FOREIGN KEY (pollid) REFERENCES databaseSchema.objectQualifier_poll(pollid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_rank_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_rank
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_rank_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_registry
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_smiley
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid FOREIGN KEY (lastmessageid) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid FOREIGN KEY (topicmovedid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid FOREIGN KEY (lastuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid FOREIGN KEY (accessmaskid) REFERENCES databaseSchema.objectQualifier_accessmask(accessmaskid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_usergroup
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid FOREIGN KEY (groupid) REFERENCES databaseSchema.objectQualifier_group(groupid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_usergroup_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_usergroup
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_usergroup_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userpmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid FOREIGN KEY (pmessageid) REFERENCES databaseSchema.objectQualifier_pmessage(pmessageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userpmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_rank
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_user
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_user
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid FOREIGN KEY (rankid) REFERENCES databaseSchema.objectQualifier_rank(rankid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid') THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_topic_objectQualifier_message
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_message_messageid') THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_message_messageid FOREIGN KEY (lastmessageid)
      REFERENCES databaseSchema.objectQualifier_message(messageid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: databaseSchema.fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster') THEN
ALTER TABLE databaseSchema.objectQualifier_poll
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF; 

-- Foreign Key: databaseSchema.fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite') THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite FOREIGN KEY (topicid)
      REFERENCES databaseSchema.objectQualifier_topic(topicid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF; 

-- Foreign Key: fk_databaseSchema_objectQualifier_buddy_objectQualifier_user
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_buddy_objectQualifier_user') THEN
ALTER TABLE databaseSchema.objectQualifier_buddy
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_buddy_objectQualifier_user FOREIGN KEY (fromuserid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster') THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster FOREIGN KEY (pollid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster') THEN
ALTER TABLE databaseSchema.objectQualifier_forum
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

 -- Foreign Key: fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster') THEN
ALTER TABLE databaseSchema.objectQualifier_category
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

 -- Foreign Key: fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user
 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user') THEN
ALTER TABLE databaseSchema.objectQualifier_useralbum
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION; 
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_useralbum_objectQualifier_useralbumimage
/* IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_album_objectQualifier_albumimage') THEN
ALTER TABLE databaseSchema.objectQualifier_useralbumimage
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_album_objectQualifier_albumimage FOREIGN KEY (albumid)
      REFERENCES databaseSchema.objectQualifier_useralbum(albumid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF; */

         END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
     GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_fkeys() TO public;
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_fkeys();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_fkeys();
--GO 
      


