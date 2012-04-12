-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

-- Index
-- databaseSchema.objectQualifier_create_or_replace_index args:
--  _schemaname, _tablename, _indexname ,_indexuniue('unique'|''),	_indexcolumn
SELECT databaseSchema.objectQualifier_create_or_replace_index
('databaseSchema', 'objectQualifier_bbcode','fki_databaseSchema_objectQualifier_bbcode_board','','boardid');
--GO	
CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_create_or_check_indexes()
RETURNS void AS
$BODY$
BEGIN


/*IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_bbcode' AND indexname='fki_databaseSchema_objectQualifier_bbcode_board') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_bbcode_board ON databaseSchema.objectQualifier_bbcode USING btree (boardid);
END IF;*/

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_accessmask' AND indexname='fki_databaseSchema_objectQualifier_accessmask_objectQualifier_board') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_accessmask_objectQualifier_board ON databaseSchema.objectQualifier_accessmask USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_active' AND indexname='fki_databaseSchema_objectQualifier_active_objectQualifier_board') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_active_objectQualifier_board ON databaseSchema.objectQualifier_active USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_active' AND indexname='fki_databaseSchema_objectQualifier_active_objectQualifier_forum') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_active_objectQualifier_forum ON databaseSchema.objectQualifier_active USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_active' AND indexname='fki_databaseSchema_objectQualifier_active_objectQualifier_topic') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_active_objectQualifier_topic ON databaseSchema.objectQualifier_active USING btree (topicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_active' AND indexname='fki_databaseSchema_objectQualifier_active_objectQualifier_user') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_active_objectQualifier_user ON databaseSchema.objectQualifier_active USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_group' AND indexname='ix_objectQualifier_group') THEN
CREATE UNIQUE INDEX ix_objectQualifier_group ON databaseSchema.objectQualifier_group USING btree (groupid, name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_pollvote' AND indexname='ix_objectQualifier_pollvote_remoteip') THEN
CREATE INDEX ix_objectQualifier_pollvote_remoteip ON databaseSchema.objectQualifier_pollvote USING btree (remoteip);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_pollvote' AND indexname='ix_objectQualifier_pollvote_userid') THEN
CREATE INDEX ix_objectQualifier_pollvote_userid ON databaseSchema.objectQualifier_pollvote USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_rank' AND indexname='ix_objectQualifier_rank_boardid_name') THEN
CREATE UNIQUE INDEX ix_objectQualifier_rank_boardid_name ON databaseSchema.objectQualifier_rank USING btree (boardid, name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_registry' AND indexname='ix_objectQualifier_registry_boardid_name') THEN
CREATE INDEX ix_objectQualifier_registry_boardid_name ON databaseSchema.objectQualifier_registry USING btree (boardid, name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_reputationvote' AND indexname='ix_objectQualifier_reputationvote_fruserid_touserid') THEN
CREATE UNIQUE INDEX ix_objectQualifier_reputationvote_fruserid_touserid ON databaseSchema.objectQualifier_reputationvote USING btree (reputationfromuserid, reputationtouserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_smiley' AND indexname='ix_objectQualifier_smiley_boardid_code') THEN
CREATE INDEX ix_objectQualifier_smiley_boardid_code ON databaseSchema.objectQualifier_smiley USING btree (boardid, code);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='ix_objectQualifier_topic_lastposted_topicid') THEN
CREATE UNIQUE INDEX ix_objectQualifier_topic_lastposted_topicid ON databaseSchema.objectQualifier_topic USING btree (lastposted,topicid DESC);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_group' AND indexname='ix_objectQualifier_group_sortorder') THEN
CREATE INDEX ix_objectQualifier_group_sortorder ON databaseSchema.objectQualifier_group USING btree (sortorder ASC);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='ix_objectQualifier_user_displayname') THEN
CREATE INDEX ix_objectQualifier_user_displayname ON databaseSchema.objectQualifier_user USING btree (displayname ASC);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='ix_objectQualifier_topic_flags') THEN
CREATE INDEX ix_objectQualifier_topic_flags ON databaseSchema.objectQualifier_topic USING btree (flags);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_usergroup' AND indexname='ix_objectQualifier_usergroup_userid') THEN
CREATE INDEX ix_objectQualifier_usergroup_userid ON databaseSchema.objectQualifier_usergroup USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='ix_objectQualifier_user_flags') THEN
CREATE INDEX ix_objectQualifier_user_flags ON databaseSchema.objectQualifier_user USING btree (flags);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='ix_objectQualifier_user_name') THEN
CREATE INDEX ix_objectQualifier_user_name ON databaseSchema.objectQualifier_user USING btree (name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='ix_objectQualifier_user_provideruserkey') THEN
CREATE INDEX ix_objectQualifier_user_provideruserkey ON databaseSchema.objectQualifier_user USING btree (provideruserkey);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchforum' AND indexname='ix_objectQualifier_watchforum_forumid_userid') THEN
CREATE UNIQUE INDEX ix_objectQualifier_watchforum_forumid_userid ON databaseSchema.objectQualifier_watchforum USING btree (forumid, userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchtopic' AND indexname='ix_objectQualifier_watchtopic_topicid_userid') THEN
CREATE UNIQUE INDEX ix_objectQualifier_watchtopic_topicid_userid ON databaseSchema.objectQualifier_watchtopic USING btree (topicid, userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_attachment' AND indexname='fki_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_attachment_objectQualifier_message_messageid ON databaseSchema.objectQualifier_attachment USING btree (messageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_checkemail' AND indexname='fki_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_checkemail_objectQualifier_user_userid ON databaseSchema.objectQualifier_checkemail USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_choice' AND indexname='fki_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_choice_objectQualifier_poll_pollid ON databaseSchema.objectQualifier_choice USING btree (pollid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_eventlog' AND indexname='fki_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_eventlog_objectQualifier_user_userid ON databaseSchema.objectQualifier_eventlog USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_extension' AND indexname='fki_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_extension_objectQualifier_board_boardid ON databaseSchema.objectQualifier_extension USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forumaccess' AND indexname='fki_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_forumaccess_objectQualifier_accessmask_accessmaskid ON databaseSchema.objectQualifier_forumaccess USING btree (accessmaskid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='fki_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_forum_objectQualifier_message_lastmessageid ON databaseSchema.objectQualifier_forum USING btree (lastmessageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='fki_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_forum_objectQualifier_topic_lasttopicid ON databaseSchema.objectQualifier_forum USING btree (lasttopicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='fki_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_forum_objectQualifier_user_lastuserid ON databaseSchema.objectQualifier_forum USING btree (lastuserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_group' AND indexname='fki_databaseSchema_objectQualifier_group_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_group_objectQualifier_board_boardid ON databaseSchema.objectQualifier_group USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_message' AND indexname='fki_databaseSchema_objectQualifier_message_objectQualifier_message_replyto') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_message_objectQualifier_message_replyto ON databaseSchema.objectQualifier_message USING btree (replyto);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_message' AND indexname='fki_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_message_objectQualifier_topic_topicid ON databaseSchema.objectQualifier_message USING btree (topicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_message' AND indexname='fki_databaseSchema_objectQualifier_message_objectQualifier_posted_desc') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_message_objectQualifier_posted_desc ON databaseSchema.objectQualifier_message USING btree (posted DESC);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_message' AND indexname='fki_databaseSchema_objectQualifier_message_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_message_objectQualifier_user_userid ON databaseSchema.objectQualifier_message USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_nntpforum' AND indexname='fki_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_nntpforum_objectQualifier_forum_forumid ON databaseSchema.objectQualifier_nntpforum USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_nntpforum' AND indexname='fki_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_nntpforum_objectQualifier_nntpserver_nntpserverid ON databaseSchema.objectQualifier_nntpforum USING btree (nntpserverid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_nntpserver' AND indexname='fki_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_nntpserver_objectQualifier_board_boardid ON databaseSchema.objectQualifier_nntpserver USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_nntptopic' AND indexname='fki_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_nntptopic_objectQualifier_nntpforum_nntpforumid ON databaseSchema.objectQualifier_nntptopic USING btree (nntpforumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_nntptopic' AND indexname='fki_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_nntptopic_objectQualifier_topic_topicid ON databaseSchema.objectQualifier_nntptopic USING btree (topicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_pmessage' AND indexname='fki_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_pmessage_objectQualifier_user1_fromuserid ON databaseSchema.objectQualifier_pmessage USING btree (fromuserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_pollvote' AND indexname='fki_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_pollvote_objectQualifier_poll_pollid ON databaseSchema.objectQualifier_pollvote USING btree (pollid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_registry' AND indexname='fki_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_registry_objectQualifier_board_boardid ON databaseSchema.objectQualifier_registry USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_smiley' AND indexname='fki_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_smiley_objectQualifier_board_boardid ON databaseSchema.objectQualifier_smiley USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_forum_forumid ON databaseSchema.objectQualifier_topic USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_message_lastmessageid ON databaseSchema.objectQualifier_topic USING btree (lastmessageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_poll_pollid ON databaseSchema.objectQualifier_topic USING btree (pollid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_topic_topicmovedid ON databaseSchema.objectQualifier_topic USING btree (topicmovedid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_user_userid ON databaseSchema.objectQualifier_topic USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_topic' AND indexname='fki_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_topic_objectQualifier_user2_lastuserid ON databaseSchema.objectQualifier_topic USING btree (lastuserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_userforum' AND indexname='fki_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_userforum_objectQualifier_accessmask_accessmaskid ON databaseSchema.objectQualifier_userforum USING btree (accessmaskid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_userforum' AND indexname='fki_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_userforum_objectQualifier_forum_forumid ON databaseSchema.objectQualifier_userforum USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_usergroup' AND indexname='fki_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_usergroup_objectQualifier_group_groupid ON databaseSchema.objectQualifier_usergroup USING btree (groupid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_userpmessage' AND indexname='fki_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_userpmessage_objectQualifier_pmessage_pmessageid ON databaseSchema.objectQualifier_userpmessage USING btree (pmessageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_userpmessage' AND indexname='fki_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_userpmessage_objectQualifier_user_userid ON databaseSchema.objectQualifier_userpmessage USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='fki_databaseSchema_objectQualifier_user_objectQualifier_board_boardid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_user_objectQualifier_board_boardid ON databaseSchema.objectQualifier_user USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_user' AND indexname='fki_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_user_objectQualifier_rank_rankid ON databaseSchema.objectQualifier_user USING btree (rankid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchforum' AND indexname='fki_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_watchforum1_objectQualifier_forum_forumid ON databaseSchema.objectQualifier_watchforum USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchforum' AND indexname='fki_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_watchforum1_objectQualifier_user_userid ON databaseSchema.objectQualifier_watchforum USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchtopic' AND indexname='fki_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_watchtopic_objectQualifier_topic_topicid ON databaseSchema.objectQualifier_watchtopic USING btree (topicid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_watchtopic' AND indexname='fki_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid') THEN
CREATE INDEX fki_databaseSchema_objectQualifier_watchtopic_objectQualifier_user_userid ON databaseSchema.objectQualifier_watchtopic USING btree (userid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_bannedip' AND indexname='ix_objectQualifier_bannedip_boardid_mask') THEN
CREATE UNIQUE INDEX ix_objectQualifier_bannedip_boardid_mask ON databaseSchema.objectQualifier_bannedip USING btree (boardid, mask);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_category' AND indexname='ix_objectQualifier_category_boardid_name') THEN
CREATE UNIQUE INDEX ix_objectQualifier_category_boardid_name ON databaseSchema.objectQualifier_category USING btree (boardid, name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_category' AND indexname='ix_objectQualifier_category_boardid') THEN
CREATE INDEX ix_objectQualifier_category_boardid ON databaseSchema.objectQualifier_category USING btree (boardid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_category' AND indexname='ix_objectQualifier_category_name') THEN
CREATE INDEX ix_objectQualifier_category_name ON databaseSchema.objectQualifier_category USING btree (name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_checkemail' AND indexname='ix_objectQualifier_checkemail_hash') THEN
CREATE UNIQUE INDEX ix_objectQualifier_checkemail_hash ON databaseSchema.objectQualifier_checkemail USING btree (hash);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='ix_objectQualifier_forum_parentid_name') THEN
CREATE UNIQUE INDEX ix_objectQualifier_forum_parentid_name ON databaseSchema.objectQualifier_forum USING btree (parentid, name);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forumaccess' AND indexname='ix_objectQualifier_forumaccess_forumid') THEN
CREATE INDEX ix_objectQualifier_forumaccess_forumid ON databaseSchema.objectQualifier_forumaccess USING btree (forumid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='ix_objectQualifier_forum_categoryid') THEN
CREATE INDEX ix_objectQualifier_forum_categoryid ON databaseSchema.objectQualifier_forum USING btree (categoryid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='ix_objectQualifier_forum_flags') THEN
CREATE INDEX ix_objectQualifier_forum_flags ON databaseSchema.objectQualifier_forum USING btree (flags);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_forum' AND indexname='ix_objectQualifier_forum_parentid') THEN
CREATE INDEX ix_objectQualifier_forum_parentid ON databaseSchema.objectQualifier_forum USING btree (parentid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_buddy' AND indexname='ix_objectQualifier_buddy_fromuserid_touserid') THEN
CREATE UNIQUE INDEX  ix_objectQualifier_buddy_fromuserid_touserid ON databaseSchema.objectQualifier_buddy USING btree (fromuserid,touserid);
END IF;

-- {objectQualifier}Thanks

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_thanks' AND indexname='ix_objectQualifier_thanks_messageid') THEN
CREATE INDEX ix_objectQualifier_thanks_messageid ON databaseSchema.objectQualifier_thanks USING btree (messageid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_thanks' AND indexname='ix_objectQualifier_thanks_thanksfromuserid') THEN
CREATE INDEX ix_objectQualifier_thanks_thanksfromuserid ON databaseSchema.objectQualifier_thanks USING btree (thanksfromuserid);
END IF;

IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='objectQualifier_thanks' AND indexname='ix_objectQualifier_thanks_thankstouserid') THEN
CREATE INDEX ix_objectQualifier_thanks_thankstouserid ON databaseSchema.objectQualifier_thanks USING btree (thankstouserid);
END IF;

END;
$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER STRICT
  COST 100;
     GRANT EXECUTE ON FUNCTION databaseSchema.objectQualifier_create_or_check_indexes() TO public;
    --GO
    SELECT databaseSchema.objectQualifier_create_or_check_indexes();
    --GO
    DROP FUNCTION databaseSchema.objectQualifier_create_or_check_indexes();
--GO
