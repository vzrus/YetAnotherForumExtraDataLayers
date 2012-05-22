-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

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

IF EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    DROP CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_bbcode_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bbcode
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_bbcode_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid) 
    ON DELETE NO ACTION;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_accessmask_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_accessmask
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_accessmask_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;    

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_forum_forumid 
    FOREIGN KEY (forumid) 
    REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_messagehistory_messageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_messagehistory
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_messagehistory_messageid 
    FOREIGN KEY (messageid) 
    REFERENCES databaseSchema.objectQualifier_message(messageid) ON DELETE CASCADE;
END IF;  

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_topic_topicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_topic_topicid 
    FOREIGN KEY (topicid) 
    REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_active_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_active
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_active_objectQualifier_user_userid 
    FOREIGN KEY (userid) 
    REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;   

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_attachment
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid 
    FOREIGN KEY (messageid) 
    REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_bannedip_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_bannedip
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_bannedip_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_category_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_category
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_category_objectQualifier_board_boardid 
    FOREIGN KEY (boardid) 
    REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_checkemail
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_choice
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid FOREIGN KEY (pollid) REFERENCES databaseSchema.objectQualifier_poll(pollid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_eventlog
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_extension
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid FOREIGN KEY (accessmaskid) REFERENCES databaseSchema.objectQualifier_accessmask(accessmaskid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_group_groupid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forumaccess
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumaccess_objectQualifier_group_groupid FOREIGN KEY (groupid) REFERENCES databaseSchema.objectQualifier_group(groupid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_category_categoryid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_category_categoryid FOREIGN KEY (categoryid) REFERENCES databaseSchema.objectQualifier_category(categoryid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_forum_parentid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_forum_parentid FOREIGN KEY (parentid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid FOREIGN KEY (lastmessageid) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid FOREIGN KEY (lasttopicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_forum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid FOREIGN KEY (lastuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_group_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_group
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_group_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_message_replyto' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_message_replyto FOREIGN KEY (replyto) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_message_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_message
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_message_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF; 

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid FOREIGN KEY (nntpserverid) REFERENCES databaseSchema.objectQualifier_nntpserver(nntpserverid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntpserver
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntptopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid FOREIGN KEY (nntpforumid) REFERENCES databaseSchema.objectQualifier_nntpforum(nntpforumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_nntptopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid FOREIGN KEY (fromuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_pollvote
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid FOREIGN KEY (pollid) REFERENCES databaseSchema.objectQualifier_poll(pollid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_rank_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_rank
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_rank_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_registry
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_smiley
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid) ON DELETE CASCADE;
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid FOREIGN KEY (lastmessageid) REFERENCES databaseSchema.objectQualifier_message(messageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid FOREIGN KEY (topicmovedid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_topic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid FOREIGN KEY (lastuserid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid FOREIGN KEY (accessmaskid) REFERENCES databaseSchema.objectQualifier_accessmask(accessmaskid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userforum_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userforum_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_usergroup
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid FOREIGN KEY (groupid) REFERENCES databaseSchema.objectQualifier_group(groupid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_usergroup_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_usergroup
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_usergroup_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userpmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid FOREIGN KEY (pmessageid) REFERENCES databaseSchema.objectQualifier_pmessage(pmessageid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_userpmessage
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_rank
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_user
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_board_boardid FOREIGN KEY (boardid) REFERENCES databaseSchema.objectQualifier_board(boardid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_user
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid FOREIGN KEY (rankid) REFERENCES databaseSchema.objectQualifier_rank(rankid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid FOREIGN KEY (forumid) REFERENCES databaseSchema.objectQualifier_forum(forumid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchforum
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid FOREIGN KEY (topicid) REFERENCES databaseSchema.objectQualifier_topic(topicid);
END IF;

IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE ONLY databaseSchema.objectQualifier_watchtopic
    ADD CONSTRAINT fk_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid FOREIGN KEY (userid) REFERENCES databaseSchema.objectQualifier_user(userid);
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_topic_objectQualifier_message
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_message_messageid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_message_messageid FOREIGN KEY (lastmessageid)
      REFERENCES databaseSchema.objectQualifier_message(messageid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: databaseSchema.fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_poll
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_poll_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF; 

-- Foreign Key: databaseSchema.fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_favorite FOREIGN KEY (topicid)
      REFERENCES databaseSchema.objectQualifier_topic(topicid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF; 

-- Foreign Key: fk_databaseSchema_objectQualifier_buddy_objectQualifier_user
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_buddy_objectQualifier_user' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_buddy
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_buddy_objectQualifier_user FOREIGN KEY (fromuserid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_topic
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topic_objectQualifier_pollgroupcluster FOREIGN KEY (pollid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

-- Foreign Key: fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_forum
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_forum_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

 -- Foreign Key: fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster
IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_category
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_category_objectQualifier_pollgroupcluster FOREIGN KEY (pollgroupid)
      REFERENCES databaseSchema.objectQualifier_pollgroupcluster(pollgroupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
END IF;

 -- Foreign Key: fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user
 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_useralbum
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_useralbum_objectQualifier_user FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_activeaccess_objectQualifier_user' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_activeaccess
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_activeaccess_objectQualifier_user FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_messagereportedaudit_objectQualifier_messagereported' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_messagereportedaudit
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_messagereportedaudit_objectQualifier_messagereported FOREIGN KEY (messageid)
      REFERENCES databaseSchema.objectQualifier_messagereported(messageid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;
 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumreadtracking_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_forumreadtracking
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumreadtracking_objectQualifier_user_userid FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_forumreadtracking_objectQualifier_forum_forumid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_forumreadtracking
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_forumreadtracking_objectQualifier_forum_forumid FOREIGN KEY (forumid)
      REFERENCES databaseSchema.objectQualifier_forum(forumid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topicreadtracking_objectQualifier_user_userid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_topicreadtracking
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topicreadtracking_objectQualifier_user_userid FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_topicreadtracking_objectQualifier_topic_topicid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_topicreadtracking
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_topicreadtracking_objectQualifier_topic_topicid FOREIGN KEY (topicid)
      REFERENCES databaseSchema.objectQualifier_topic(topicid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_to' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_reputationvote
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_to FOREIGN KEY (reputationtouserid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_from' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_reputationvote
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_from FOREIGN KEY (reputationfromuserid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_to' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_reputationvote
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_reputationvote_objectQualifier_user_to FOREIGN KEY (reputationtouserid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_adminpageuseraccess_objectQualifier_user' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_adminpageuseraccess
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_adminpageuseraccess_objectQualifier_user FOREIGN KEY (userid)
      REFERENCES databaseSchema.objectQualifier_user(userid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
END IF;

 IF NOT EXISTS(SELECT 1 FROM pg_constraint where contype='f' and conname ='fk_databaseSchema_objectQualifier_eventloggroupaccess_objectQualifier_group_groupid' LIMIT 1) THEN
ALTER TABLE databaseSchema.objectQualifier_eventloggroupaccess
  ADD CONSTRAINT fk_databaseSchema_objectQualifier_eventloggroupaccess_objectQualifier_group_groupid FOREIGN KEY (groupid)
      REFERENCES databaseSchema.objectQualifier_group(groupid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE; 
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
      



