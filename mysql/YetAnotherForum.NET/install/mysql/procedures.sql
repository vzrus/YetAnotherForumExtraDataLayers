/* Yet Another Forum.NET MySQL data layer by vzrus
 * Copyright (C) 2006-2011 Vladimir Zakharov
 * https://github.com/vzrus
 * http://sourceforge.net/projects/yaf-datalayers/
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */


/* STORED PROCEDURE CREATED BY VZ-TEAM */

/* DROP procedures */
-- not in use
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_setguid;
--GO
-- vaccess procedure
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}vaccess_s_moderatoraccess_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}vaccessfull_combo;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}vaccess_combo;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}vaccess_s_moderatoraccess_list;
--GO
-- eof vaccess procedure

DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_listforum;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_listtopic;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_stats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_updatemaxstats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}attachment_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}attachment_download;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}attachment_list ;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}attachment_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bannedip_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bannedip_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bannedip_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bbcode_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bbcode_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}bbcode_save;
--GO

DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_create;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_poststats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_userstats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_poststats1;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_poststats2;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_poststats3;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_resync;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}board_stats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}category_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}category_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}category_listread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}category_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}checkemail_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}checkemail_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}checkemail_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}choice_add;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}choice_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}choice_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}choice_vote;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}eventlog_create;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}eventlog_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}eventlog_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}extension_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}extension_edit;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}extension_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}extension_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listall;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listall_fromcat;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listallmymoderated;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listpath;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listread_old;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listSubForums;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listtopics;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_moderatelist;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_moderators;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_moderators_1;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_moderators_2;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}moderators_team_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_resync;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_updatelastpost ;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_updatestats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forumaccess_group;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forumaccess_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forumaccess_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_medal_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_medal_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_medal_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_member;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}group_rank_style;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}mail_create;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}mail_createwatch;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}mail_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}mail_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}medal_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}medal_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}medal_listusers;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}medal_resort;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}medal_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_approve;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_deleteundelete; 
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_findunread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_getReplies;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_listreported;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_move;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_reply_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_listreporters;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_report;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_reportcopyover;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_reportresolve;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_unapproved;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpforum_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpforum_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpforum_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readtopic_addorupdate;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readtopic_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readforum_addorupdate;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readtopic_lastread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readforum_lastread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}readforum_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpforum_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpserver_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpserver_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntpserver_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntptopic_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}nntptopic_savemessage;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}activeaccess_reset;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pageload;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_archive;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_markread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_info;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_prune;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pmessage_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}poll_remove;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_attach;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_remove;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}poll_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_stats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}poll_stats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollgroup_votecheck;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}poll_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}pollvote_check;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}post_last10user;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}post_alluser;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}post_list_result;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}post_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}post_list_reverse10;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}rank_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}rank_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}rank_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}registry_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}registry_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}replace_words_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}replace_words_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}replace_words_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}shoutbox_getmessages;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}shoutbox_savemessage;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}shoutbox_clearmessages;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}smiley_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}smiley_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}smiley_listunique;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}smiley_resort;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}smiley_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}system_initialize;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}system_updateversion;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_active;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_create_by_message;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_favorite_count;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_findduplicate;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_findnext;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_findprev;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_info;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_findduplicate;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_latest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}rss_topic_latest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_listmessages;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_lock;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_move;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_poll_update;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_prune;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_updatelastpost;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_updatetopic;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topics_byuser;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_accessmasks;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_addpoints;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_adminsave;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_approve;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_approveall;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_deleteavatar;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_aspnet;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_avatarimage;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_changepassword;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_addignoreduser;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_ignoredlist;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_removeignoreduser;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_isuserignored;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_deleteold;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_emails;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_lastread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_find;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getpoints;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getsignature;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_guest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_lastread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_lastread;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_list_new;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_listmembers;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_listmembers_result;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}admin_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_login;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_medal_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_medal_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_medal_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_nntp;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_pmcount;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_recoverpassword;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_removepoints;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_removepointsbytopicid;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_resetpoints;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_savenotification;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_saveavatar;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_savepassword;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_savesignature;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_setnotdirty;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_setpoints;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_setrole;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_suspend;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_upgrade;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}userforum_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}userforum_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}userforum_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}usergroup_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}usergroup_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}userpmessage_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}userpmessage_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchforum_add;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchforum_check;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchforum_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchforum_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchtopic_add;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchtopic_check;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchtopic_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}watchtopic_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_migrate;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_listmedals;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_thankedmessage;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}accessmask_list;
--GO
DROP PROCEDURE IF EXISTS {objectQualifier}accessmask_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}accessmask_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_get;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_latest1;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_latest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_simplelist;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_activity_rank;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_simplelist;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_announcements;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_simplelist;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}category_simplelist;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_simplelist;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}db_size;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}rsstopic_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_addthanks;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_getthanks;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_isthankedbyuser;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_removethanks;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_thanksnumber;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getthanks_from;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getthanks_to;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}recent_users;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_getallthanks ;
--GO
 -- Drop old procedures
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_insert;
 --GO  
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listread_helper;
 --GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listread_helper_old; 
--GO
 DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}forum_listread_old;
 --GO
-- eof Drop old procedures
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}buddy_addrequest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}buddy_approverequest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}buddy_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}buddy_remove;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}buddy_denyrequest;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_favorite_add;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_favorite_remove;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_favorite_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}topic_favorite_details;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_save;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_list;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_gettitle;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_getstats;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_image_save;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_image_list;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_image_delete;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}album_image_download;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getsignaturedata;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_getalbumsdata;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_secdata;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}messagehistory_list;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}active_list_user;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}message_gettextbyids;
--GO 
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_thankfromcount;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_repliedtopic;
--GO

 



DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_viewallthanks;
--GO
DROP PROCEDURE IF EXISTS {databaseName}.{objectQualifier}user_lazydata;
--GO

/* Create vaccess procedures */

CREATE PROCEDURE {databaseName}.{objectQualifier}vaccess_combo(i_UserID INT, i_ForumID INT)
READS SQL DATA
BEGIN
DECLARE ici_UserID INT;
DECLARE ici_ForumID INT;
DECLARE ici_IsAdmin INT  DEFAULT 0;
DECLARE ici_IsGuest INT  DEFAULT 0;
DECLARE ici_IsForumModerator INT  DEFAULT 0;
DECLARE ici_IsModerator INT DEFAULT 0;
DECLARE ici_ReadAccess  INT DEFAULT 0;
DECLARE ici_PostAccess INT DEFAULT 0;
DECLARE ici_ReplyAccess INT DEFAULT 0;
DECLARE ici_PriorityAccess INT DEFAULT 0;
DECLARE ici_PollAccess INT DEFAULT 0;
DECLARE ici_VoteAccess INT DEFAULT 0;
DECLARE ici_ModeratorAccess INT DEFAULT 0;
DECLARE ici_EditAccess INT DEFAULT 0;
DECLARE ici_DeleteAccess INT DEFAULT 0;
DECLARE ici_UploadAccess INT DEFAULT 0;
DECLARE ici_DownloadAccess INT DEFAULT 0;

DECLARE out_UserID INT;
DECLARE out_ForumID INT;
DECLARE out_IsAdmin INT DEFAULT 0;
DECLARE out_IsGuest INT DEFAULT 0;
DECLARE out_IsForumModerator INT DEFAULT 0;
DECLARE out_IsModerator INT DEFAULT 0;
DECLARE out_ReadAccess INT DEFAULT 0;
DECLARE out_PostAccess INT DEFAULT 0;
DECLARE out_ReplyAccess INT DEFAULT 0;
DECLARE out_PriorityAccess INT DEFAULT 0;
DECLARE out_PollAccess INT DEFAULT 0;
DECLARE out_VoteAccess INT DEFAULT 0;
DECLARE out_ModeratorAccess INT DEFAULT 0;
DECLARE out_EditAccess INT DEFAULT 0;
DECLARE out_DeleteAccess INT DEFAULT 0;
DECLARE out_UploadAccess INT DEFAULT 0;
DECLARE out_DownloadAccess INT DEFAULT 0;

SELECT 
IFNULL(UserID,i_UserID),IFNULL(ForumID,0),IFNULL(ReadAccess,0), IFNULL(PostAccess,0),IFNULL(ReplyAccess,0),IFNULL(PriorityAccess,0),
IFNULL(PollAccess,0),IFNULL(VoteAccess,0),IFNULL(ModeratorAccess,0),IFNULL(EditAccess,0),
DeleteAccess,UploadAccess,DownloadAccess
INTO
ici_UserID,ici_ForumID,
ici_ReadAccess,ici_PostAccess,ici_ReplyAccess,ici_PriorityAccess,
ici_PollAccess,ici_VoteAccess,ici_ModeratorAccess, ici_EditAccess,
ici_DeleteAccess,ici_UploadAccess, ici_DownloadAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull1  
 WHERE UserID=i_UserID AND ForumID = IFNULL(i_ForumID,0) LIMIT 1; 
 
 SELECT 
IFNULL(UserID,i_UserID),IFNULL(ForumID,0),IFNULL(ReadAccess,0), IFNULL(PostAccess,0),IFNULL(ReplyAccess,0),IFNULL(PriorityAccess,0),
IFNULL(PollAccess,0),IFNULL(VoteAccess,0),IFNULL(ModeratorAccess,0),IFNULL(EditAccess,0),
IFNULL(DeleteAccess,0),IFNULL(UploadAccess,0),IFNULL(DownloadAccess,0)
INTO 
out_UserID,out_ForumID,
out_ReadAccess,out_PostAccess,out_ReplyAccess,out_PriorityAccess,
out_PollAccess,out_VoteAccess,out_ModeratorAccess, out_EditAccess,
out_DeleteAccess,out_UploadAccess, out_DownloadAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull2  
 WHERE UserID=i_UserID AND ForumID = IFNULL(i_ForumID,0) LIMIT 1;
  
 SELECT         
      SIGN(MAX(b.Flags & 1)),
      SIGN(MAX(b.Flags & 2)),
      SIGN(MAX(b.Flags & 8)) 
      INTO  out_IsAdmin, out_IsGuest, out_IsForumModerator 
      FROM {databaseName}.{objectQualifier}UserGroup a             
           JOIN {databaseName}.{objectQualifier}Group b
             ON b.GroupID = a.GroupID
             WHERE a.UserID=i_UserID LIMIT 1;
 
SELECT
i_UserID AS UserID,
IFNULL(i_ForumID,0) AS ForumID,
out_IsAdmin AS IsAdmin,
out_IsGuest AS IsGuest,
out_IsForumModerator AS IsForumModerator,
(SELECT     COUNT(v.UserID) AS Expr1
FROM          {databaseName}.{objectQualifier}UserGroup AS v
INNER JOIN    {databaseName}.{objectQualifier}Group AS w
ON v.GroupID = w.GroupID
CROSS JOIN  {databaseName}.{objectQualifier}ForumAccess AS x
CROSS JOIN  {databaseName}.{objectQualifier}AccessMask AS y
WHERE (v.UserID = i_UserID)
AND (x.GroupID = w.GroupID)
AND (y.AccessMaskID = x.AccessMaskID)
AND (y.Flags & 64 <> 0)) AS IsModerator,
(CASE WHEN ici_ReadAccess > out_ReadAccess THEN ici_ReadAccess ELSE out_ReadAccess END)AS ReadAccess,
(CASE WHEN ici_PostAccess > out_PostAccess THEN ici_PostAccess ELSE out_PostAccess END) AS PostAccess,
(CASE WHEN ici_ReplyAccess > out_ReplyAccess THEN ici_ReplyAccess ELSE out_ReplyAccess END) AS ReplyAccess,
(CASE WHEN ici_PriorityAccess > out_PriorityAccess THEN ici_PriorityAccess ELSE out_PriorityAccess END) AS PriorityAccess,
(CASE WHEN ici_PollAccess > out_PollAccess THEN ici_PollAccess ELSE out_PollAccess END) AS PollAccess,
(CASE WHEN ici_VoteAccess > out_VoteAccess THEN ici_VoteAccess ELSE out_VoteAccess END) AS VoteAccess,
(CASE WHEN ici_ModeratorAccess > out_ModeratorAccess THEN ici_ModeratorAccess ELSE out_ModeratorAccess END) AS ModeratorAccess,
(CASE WHEN ici_EditAccess > out_EditAccess THEN ici_EditAccess ELSE out_EditAccess END) AS EditAccess,
(CASE WHEN ici_DeleteAccess > out_DeleteAccess THEN ici_DeleteAccess ELSE out_DeleteAccess END) AS DeleteAccess,
(CASE WHEN ici_UploadAccess > out_UploadAccess THEN ici_UploadAccess ELSE out_UploadAccess END) AS UploadAccess,
(CASE WHEN ici_DownloadAccess > out_DownloadAccess THEN ici_DownloadAccess ELSE out_DownloadAccess END) AS DownloadAccess;
END;

--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}vaccessfull_combo(i_UserID INT, i_ForumID INT)
READS SQL DATA
BEGIN
DECLARE ici_UserID INT;
DECLARE ici_ForumID INT;
DECLARE ici_IsAdmin INT  DEFAULT 0;
DECLARE ici_IsGuest INT  DEFAULT 0;
DECLARE ici_IsForumModerator INT  DEFAULT 0;
DECLARE ici_IsModerator INT DEFAULT 0;
DECLARE ici_ReadAccess  INT DEFAULT 0;
DECLARE ici_PostAccess INT DEFAULT 0;
DECLARE ici_ReplyAccess INT DEFAULT 0;
DECLARE ici_PriorityAccess INT DEFAULT 0;
DECLARE ici_PollAccess INT DEFAULT 0;
DECLARE ici_VoteAccess INT DEFAULT 0;
DECLARE ici_ModeratorAccess INT DEFAULT 0;
DECLARE ici_EditAccess INT DEFAULT 0;
DECLARE ici_DeleteAccess INT DEFAULT 0;
DECLARE ici_UploadAccess INT DEFAULT 0;
DECLARE ici_DownloadAccess INT DEFAULT 0;

DECLARE out_UserID INT;
DECLARE out_ForumID INT;
DECLARE out_IsAdmin INT DEFAULT 0;
DECLARE out_IsGuest INT DEFAULT 0;
DECLARE out_IsForumModerator INT DEFAULT 0;
DECLARE out_IsModerator INT DEFAULT 0;
DECLARE out_ReadAccess INT DEFAULT 0;
DECLARE out_PostAccess INT DEFAULT 0;
DECLARE out_ReplyAccess INT DEFAULT 0;
DECLARE out_PriorityAccess INT DEFAULT 0;
DECLARE out_PollAccess INT DEFAULT 0;
DECLARE out_VoteAccess INT DEFAULT 0;
DECLARE out_ModeratorAccess INT DEFAULT 0;
DECLARE out_EditAccess INT DEFAULT 0;
DECLARE out_DeleteAccess INT DEFAULT 0;
DECLARE out_UploadAccess INT DEFAULT 0;
DECLARE out_DownloadAccess INT DEFAULT 0;

SELECT 
IFNULL(UserID,i_UserID),IFNULL(ForumID,0),IFNULL(ReadAccess,0), IFNULL(PostAccess,0),IFNULL(ReplyAccess,0),IFNULL(PriorityAccess,0),
IFNULL(PollAccess,0),IFNULL(VoteAccess,0),IFNULL(ModeratorAccess,0),IFNULL(EditAccess,0),
DeleteAccess,UploadAccess,DownloadAccess
INTO
ici_UserID,ici_ForumID,
ici_ReadAccess,ici_PostAccess,ici_ReplyAccess,ici_PriorityAccess,
ici_PollAccess,ici_VoteAccess,ici_ModeratorAccess, ici_EditAccess,
ici_DeleteAccess,ici_UploadAccess, ici_DownloadAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull1  
 WHERE UserID=i_UserID AND ForumID = IFNULL(i_ForumID,0) LIMIT 1; 
 
 SELECT 
IFNULL(UserID,i_UserID),IFNULL(ForumID,0),IFNULL(ReadAccess,0), IFNULL(PostAccess,0),IFNULL(ReplyAccess,0),IFNULL(PriorityAccess,0),
IFNULL(PollAccess,0),IFNULL(VoteAccess,0),IFNULL(ModeratorAccess,0),IFNULL(EditAccess,0),
IFNULL(DeleteAccess,0),IFNULL(UploadAccess,0),IFNULL(DownloadAccess,0)
INTO 
out_UserID,out_ForumID,
out_ReadAccess,out_PostAccess,out_ReplyAccess,out_PriorityAccess,
out_PollAccess,out_VoteAccess,out_ModeratorAccess, out_EditAccess,
out_DeleteAccess,out_UploadAccess, out_DownloadAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull2  
 WHERE UserID=i_UserID AND ForumID = IFNULL(i_ForumID,0) LIMIT 1;
  
 SELECT         
      SIGN(MAX(b.Flags & 1)),
      SIGN(MAX(b.Flags & 2)),
      SIGN(MAX(b.Flags & 8)) 
      INTO  out_IsAdmin, out_IsGuest, out_IsForumModerator 
      FROM {databaseName}.{objectQualifier}UserGroup a             
           JOIN {databaseName}.{objectQualifier}Group b
             ON b.GroupID = a.GroupID
             WHERE a.UserID=i_UserID LIMIT 1;
 
SELECT
i_UserID AS UserID,
IFNULL(i_ForumID,0) AS ForumID,
out_IsAdmin AS IsAdmin,
out_IsGuest AS IsGuest,
out_IsForumModerator AS IsForumModerator,
(SELECT     COUNT(v.UserID) AS Expr1
FROM          {databaseName}.{objectQualifier}UserGroup AS v
INNER JOIN    {databaseName}.{objectQualifier}Group AS w
ON v.GroupID = w.GroupID
CROSS JOIN  {databaseName}.{objectQualifier}ForumAccess AS x
CROSS JOIN  {databaseName}.{objectQualifier}AccessMask AS y
WHERE (v.UserID = i_UserID)
AND (x.GroupID = w.GroupID)
AND (y.AccessMaskID = x.AccessMaskID)
AND (y.Flags & 64 <> 0)) AS IsModerator,
(CASE WHEN ici_ReadAccess > out_ReadAccess THEN ici_ReadAccess ELSE out_ReadAccess END)AS ReadAccess,
(CASE WHEN ici_PostAccess > out_PostAccess THEN ici_PostAccess ELSE out_PostAccess END) AS PostAccess,
(CASE WHEN ici_ReplyAccess > out_ReplyAccess THEN ici_ReplyAccess ELSE out_ReplyAccess END) AS ReplyAccess,
(CASE WHEN ici_PriorityAccess > out_PriorityAccess THEN ici_PriorityAccess ELSE out_PriorityAccess END) AS PriorityAccess,
(CASE WHEN ici_PollAccess > out_PollAccess THEN ici_PollAccess ELSE out_PollAccess END) AS PollAccess,
(CASE WHEN ici_VoteAccess > out_VoteAccess THEN ici_VoteAccess ELSE out_VoteAccess END) AS VoteAccess,
(CASE WHEN ici_ModeratorAccess > out_ModeratorAccess THEN ici_ModeratorAccess ELSE out_ModeratorAccess END) AS ModeratorAccess,
(CASE WHEN ici_EditAccess > out_EditAccess THEN ici_EditAccess ELSE out_EditAccess END) AS EditAccess,
(CASE WHEN ici_DeleteAccess > out_DeleteAccess THEN ici_DeleteAccess ELSE out_DeleteAccess END) AS DeleteAccess,
(CASE WHEN ici_UploadAccess > out_UploadAccess THEN ici_UploadAccess ELSE out_UploadAccess END) AS UploadAccess,
(CASE WHEN ici_DownloadAccess > out_DownloadAccess THEN ici_DownloadAccess ELSE out_DownloadAccess END) AS DownloadAccess;
END;

--GO


CREATE PROCEDURE {databaseName}.{objectQualifier}vaccess_s_moderatoraccess_list()
READS SQL DATA
BEGIN
DECLARE ici_UserID INT;
DECLARE ici_ForumID INT;
DECLARE ici_ModeratorAccess INT DEFAULT 0;

DECLARE out_UserID INT ;
DECLARE out_ForumID INT;
DECLARE out_ModeratorAccess INT DEFAULT 0;
SELECT DISTINCT
CAST(r.ForumID AS UNSIGNED),
r.UserID,
MAX(r.ModeratorAccess) AS ModeratorAccess,
(SELECT Name FROM  {databaseName}.{objectQualifier}User u WHERE u.UserID=r.UserID) AS ModeratorName,
0 AS IsGroup
FROM (SELECT * FROM (SELECT 
ForumID,UserID,ModeratorAccess 
FROM
 {databaseName}.{objectQualifier}vaccessfull1  
 WHERE ModeratorAccess<>0 AND AdminGroup = 0) AS t1
UNION
SELECT * FROM (SELECT 
ForumID,UserID,ModeratorAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull2  
  WHERE ModeratorAccess<>0 AND AdminGroup = 0) AS t2
  UNION 
 SELECT * FROM (SELECT 
 ForumID,UserID,ModeratorAccess
 FROM
 {databaseName}.{objectQualifier}vaccessfull3  
  WHERE ModeratorAccess<>0  AND AdminGroup = 0) AS t3  
   ) r ;
END;
--GO 

 /* Create procedures */
 
 

CREATE  PROCEDURE {databaseName}.{objectQualifier}active_list(
             IN i_BoardID INT,
             IN i_Guests  TINYINT(1),
			 IN i_ShowCrawlers  TINYINT(1),
             IN i_ActiveTime INT,
             IN i_StyledNicks TINYINT(1))
             MODIFIES SQL DATA
  BEGIN

	DELETE FROM {databaseName}.{objectQualifier}Active 
	WHERE  (LastActive < DATE_SUB(UTC_TIMESTAMP(), INTERVAL i_ActiveTime MINUTE) OR LastActive IS NULL); 
	-- we don't delete guest access
	DELETE FROM {databaseName}.{objectQualifier}ActiveAccess 
	WHERE  (LastActive < DATE_SUB(UTC_TIMESTAMP(), INTERVAL i_ActiveTime MINUTE) OR LastActive IS NULL) 
	AND  IsGuestX = 0;
	
                  
       -- select active non-guest users
       
        IF i_Guests <> 0 AND i_Guests IS NOT NULL THEN
              SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                       CAST(SIGN(c.Flags & 8) AS SIGNED) AS IsCrawler,		
                               IF(SIGN(a.Flags & 16), 'true', 'false') AS IsHidden,                      
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                      TIMESTAMPDIFF(MINUTE,IFNULL(c.Login,UTC_TIMESTAMP()),IFNULL(c.LastActive,UTC_TIMESTAMP()))  AS Active,                  
                      c.Browser,
                      c.Platform
              FROM     {databaseName}.{objectQualifier}User a
			           INNER JOIN 
                       {databaseName}.{objectQualifier}Active c
					   ON  c.UserID = a.UserID
              WHERE 
                 c.BoardID = i_BoardID
              ORDER BY c.LastActive DESC;
	elseif (i_ShowCrawlers = 1 and i_Guests = 0) THEN		
			        SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                       CAST(SIGN(c.Flags & 8) AS SIGNED) AS IsCrawler,		
                               IF(SIGN(a.Flags & 16), 'true', 'false') AS IsHidden,                      
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                      TIMESTAMPDIFF(MINUTE,IFNULL(c.Login,UTC_TIMESTAMP()),IFNULL(c.LastActive,UTC_TIMESTAMP()))  AS Active,                  
                      c.Browser,
                      c.Platform	
			   FROM     {databaseName}.{objectQualifier}User a
			           INNER JOIN 
                       {databaseName}.{objectQualifier}Active c
					   ON  c.UserID = a.UserID
				  
		where
			c.BoardID = i_BoardID			
			   -- is registered or is crawler 
			   and ((c.Flags & 4) = 4 OR (c.Flags & 8) = 8)	 		   								  
		order by 
			c.LastActive desc;
        ELSE
                    SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                       CAST(SIGN(c.Flags & 8) AS SIGNED) AS IsCrawler,		
                               IF(SIGN(a.Flags & 16), 'true', 'false') AS IsHidden,                      
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                      TIMESTAMPDIFF(MINUTE,IFNULL(c.Login,UTC_TIMESTAMP()),IFNULL(c.LastActive,UTC_TIMESTAMP()))  AS Active,                  
                      c.Browser,
                      c.Platform
               FROM     {databaseName}.{objectQualifier}User a
                        INNER JOIN 
                       {databaseName}.{objectQualifier}Active c
					   ON  c.UserID = a.UserID
               WHERE    
                 c.BoardID = i_BoardID
				 -- no guests
                 AND NOT EXISTS (SELECT 1
                                  FROM   {databaseName}.{objectQualifier}UserGroup x,
                                         {databaseName}.{objectQualifier}Group y
                                 WHERE  x.UserID = a.UserID
                                  AND y.GroupID = x.GroupID
                                  AND (y.Flags & 2) <> 0)
              ORDER BY c.LastActive DESC;
  END IF;
END;
--GO

create procedure {databaseName}.{objectQualifier}active_list_user(i_BoardID INT, i_UserID INT, i_Guests TINYINT(1), i_ShowCrawlers TINYINT(1), i_ActiveTime INT,i_StyledNicks TINYINT(1)) 
READS SQL DATA
begin
                 
       -- select active non-guest users
       
        IF (i_Guests <> 0 AND i_Guests IS NOT NULL) THEN
              SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       x.ReadAccess AS HasForumAccess,		
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                        IFNULL(SIGN(a.Flags & 8)>0,false) AS IsCrawler,
                        IFNULL(SIGN(a.Flags & 16)>0,false) AS IsHidden,
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                        CAST(ROUND((c.LastActive-
                        c.Login)/60) AS SIGNED) AS Active,
                      c.Browser,
                      c.Platform
              FROM     {databaseName}.{objectQualifier}User a
			           INNER JOIN 
                       {databaseName}.{objectQualifier}Active c 
					   ON c.UserID = a.UserID
					   INNER JOIN {databaseName}.{objectQualifier}ActiveAccess x
			           ON (x.ForumID = IFNULL(c.ForumID,0))	
              WHERE  
                 c.BoardID = i_BoardID  AND x.UserID = i_UserID	
              ORDER BY c.LastActive DESC;
	    ELSEIF (i_ShowCrawlers = 1 and i_Guests = 0) THEN
		              SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       x.ReadAccess AS HasForumAccess,			
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                        IFNULL(SIGN(a.Flags & 8)>0,false) AS IsCrawler,
                        IFNULL(SIGN(a.Flags & 16)>0,false) AS IsHidden,
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                        CAST(ROUND((c.LastActive-
                        c.Login)/60) AS SIGNED) AS Active,
                      c.Browser,
                      c.Platform
              FROM     {databaseName}.{objectQualifier}User a
			           INNER JOIN
                       {databaseName}.{objectQualifier}Active c
					    ON c.UserID = a.UserID
					   INNER JOIN {databaseName}.{objectQualifier}ActiveAccess x
			           ON (x.ForumID = IFNULL(c.ForumID,0))	
              WHERE   c.BoardID = i_BoardID AND x.UserID = i_UserID	and   
			   -- is registered or is crawler 
			    ((c.Flags & 4) = 4 OR (c.Flags & 8) = 8)	 

              ORDER BY c.LastActive DESC;	
        ELSE
              SELECT   a.UserID,
                       a.Name AS UserName,
                       c.IP,
                       c.SessionID,
                       c.ForumID,
                       x.ReadAccess AS HasForumAccess,			
                       c.TopicID,
                         (SELECT x.Name
                           FROM   {databaseName}.{objectQualifier}Forum x
                             WHERE  x.ForumID = c.ForumID) AS ForumName,
                         (SELECT Topic
                           FROM   {databaseName}.{objectQualifier}Topic x
                             WHERE  x.TopicID = c.TopicID) AS TopicName,
                         (SELECT 1
                           FROM   {databaseName}.{objectQualifier}UserGroup x,
                           {databaseName}.{objectQualifier}Group y
                             WHERE  x.UserID = a.UserID
                               AND y.GroupID = x.GroupID
                               AND (y.Flags & 2) <> 0) AS IsGuest,
                        IFNULL(SIGN(a.Flags & 8)>0,false) AS IsCrawler,
                        IFNULL(SIGN(a.Flags & 16)>0,false) AS IsHidden,
                      (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,	 
                      1 AS UserCount,
                      c.Login,
                      c.LastActive,
                      c.Location,
                      c.ForumPage,
                        CAST(ROUND((c.LastActive-
                        c.Login)/60) AS SIGNED) AS Active,
                      c.Browser,
                      c.Platform
              FROM     {databaseName}.{objectQualifier}User a
			           INNER JOIN
                       {databaseName}.{objectQualifier}Active c
					    ON c.UserID = a.UserID
					   INNER JOIN {databaseName}.{objectQualifier}ActiveAccess x
			           ON (x.ForumID = IFNULL(c.ForumID,0))	
              WHERE   c.BoardID = i_BoardID AND x.UserID = i_UserID
                 AND NOT EXISTS (SELECT 1
                                  FROM   {databaseName}.{objectQualifier}UserGroup x,
                                         {databaseName}.{objectQualifier}Group y
                                 WHERE  x.UserID = a.UserID
                                  AND y.GroupID = x.GroupID
                                  AND (y.Flags & 2) <> 0)
              ORDER BY c.LastActive DESC;
  END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}active_listforum(
IN i_ForumID INT, IN i_StyledNicks TINYINT(1))
READS SQL DATA
BEGIN
SELECT
a.UserID AS UserID,
b.Name AS UserName,
IFNULL(CAST(SIGN(b.Flags & 16) AS SIGNED),false) AS IsHidden,
IFNULL(CAST(SIGN(b.Flags & 8) AS SIGNED),false) AS IsCrawler,
(case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,
(SELECT COUNT(ac.UserID) from
		{databaseName}.{objectQualifier}Active ac  where ac.UserID = a.UserID and ac.ForumID = i_ForumID) AS UserCount ,
		Browser = a.Browser 
FROM     {databaseName}.{objectQualifier}Active a
JOIN {databaseName}.{objectQualifier}User b
ON b.UserID = a.UserID
WHERE    a.ForumID = i_ForumID
GROUP BY
a.UserID,
b.Name,
IsHidden,
IsCrawler,
a.Flags,
a.Browser,
Style
ORDER BY b.Name;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}active_listtopic(
IN i_TopicID INT, IN i_StyledNicks TINYINT(1))
READS SQL DATA
BEGIN

SELECT    a.UserID AS UserID,
b.Name AS UserName,
IFNULL(CAST(SIGN(b.Flags & 16) AS SIGNED),false) AS IsHidden,
IFNULL(CAST(SIGN(b.Flags & 8) AS SIGNED),false) AS IsCrawler,
 (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(a.UserID)  
	        else ''	 end) AS  Style,

	   (SELECT COUNT(ac.UserID) from
		{databaseName}.{objectQualifier}Active ac  
		where ac.UserID = a.UserID and ac.TopicID = i_TopicID) AS UserCount,
		a.Browser AS  Browser
FROM     {databaseName}.{objectQualifier}Active a
JOIN {databaseName}.{objectQualifier}User b
ON b.UserID = a.UserID
WHERE    a.TopicID = i_TopicID
GROUP BY
a.UserID,
b.Name,
IsHidden,
IsCrawler,
a.Flags,
a.Browser,
Style
ORDER BY b.Name;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}active_stats(
i_BoardID INT)
READS SQL DATA
BEGIN
DECLARE ActiveUsers SMALLINT DEFAULT 0 ;
DECLARE ActiveGuests SMALLINT DEFAULT 0;
DECLARE ActiveMembers SMALLINT DEFAULT 0;
DECLARE ActiveHidden SMALLINT DEFAULT 0;
SELECT COUNT(x.SessionID) INTO ActiveUsers
FROM {databaseName}.{objectQualifier}Active x
JOIN {databaseName}.{objectQualifier}UserSelectView usr
ON x.UserID = usr.UserID
WHERE x.BoardID = i_BoardID
AND usr.IsActiveExcluded = 0 OR usr.IsActiveExcluded IS NULL;
SELECT count(x.SessionID) INTO ActiveMembers
FROM {databaseName}.{objectQualifier}Active x
JOIN {databaseName}.{objectQualifier}UserSelectView usr
ON x.UserID = usr.UserID
WHERE x.BoardID = i_BoardID
AND EXISTS(select 1
from {databaseName}.{objectQualifier}UserGroup y
inner join {databaseName}.{objectQualifier}Group z
on y.GroupID=z.GroupID
where y.UserID=x.UserID
and (z.Flags & 2)=0
AND usr.IsActiveExcluded = 0 OR usr.IsActiveExcluded IS NULL );
SELECT count(x.SessionID) INTO  ActiveGuests
from {databaseName}.{objectQualifier}Active x
WHERE x.BoardID = i_BoardID
AND EXISTS(SELECT 1 from {databaseName}.{objectQualifier}UserGroup y
inner join {databaseName}.{objectQualifier}Group z
on y.GroupID=z.GroupID
WHERE y.UserID=x.UserID
and (z.Flags & 2)<>0);
SELECT count(x.SessionID) INTO ActiveHidden
from {databaseName}.{objectQualifier}Active x
JOIN {databaseName}.{objectQualifier}UserSelectView usr
ON x.UserID = usr.UserID
WHERE x.BoardID = i_BoardID
AND EXISTS(SELECT 1 from {databaseName}.{objectQualifier}UserGroup y
inner join {databaseName}.{objectQualifier}Group z
on y.GroupID=z.GroupID
WHERE y.UserID=x.UserID
and (z.Flags & 2)=0  
AND usr.IsActiveExcluded = 1);
SELECT ActiveUsers, ActiveGuests, ActiveMembers,ActiveHidden;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}active_updatemaxstats
(
	i_BoardID		INT
) 
MODIFIES SQL DATA
BEGIN
  DECLARE ici_count int;
  DECLARE ici_max int;
  DECLARE ici_maxStr varchar(255);

-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SET ici_count = IFNULL((SELECT COUNT(DISTINCT CAST(IP AS CHAR(37))+ CAST(UserID AS CHAR(10)))
FROM   {databaseName}.{objectQualifier}Active a
WHERE  a.BoardID = i_BoardID ORDER BY UserID LIMIT 1),0);

/* Here we find current max users value and transform it to integer
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; */

SET ici_maxStr = IFNULL((SELECT CAST(`VALUE` AS CHAR) 
FROM   {databaseName}.{objectQualifier}Registry
WHERE  BoardID = i_BoardID
AND `Name` = CONVERT('maxusers' USING {databaseEncoding})),'1');

SET ici_max =(SELECT CAST(ici_maxStr AS SIGNED));
/* Here we transform the rest*/

	

	IF NOT EXISTS ( SELECT 1 FROM {databaseName}.{objectQualifier}Registry 
	WHERE BoardID = i_BoardID and `Name` = CONVERT('maxusers' USING {databaseEncoding}) ) THEN
	INSERT INTO {databaseName}.{objectQualifier}Registry
(BoardID,
`Name`,
`VALUE`)
VALUES     (i_BoardID,
CONVERT('maxusers' USING {databaseEncoding}),
CAST(ici_count AS CHAR));
INSERT INTO {databaseName}.{objectQualifier}Registry
(BoardID,
`Name`,
`VALUE`)
VALUES     (i_BoardID,
CONVERT('maxuserswhen' USING {databaseEncoding}),
CAST(UTC_TIMESTAMP() AS CHAR));
	
	ELSEIF (ici_count > ici_max)	THEN
	
		/* In the case we of course simply update 2 registry values*/
UPDATE {databaseName}.{objectQualifier}Registry
SET    `VALUE` = CAST(ici_count AS CHAR)
WHERE  BoardID = i_BoardID
AND `Name` = CONVERT('maxusers' USING {databaseEncoding});

UPDATE {databaseName}.{objectQualifier}Registry
SET    `VALUE` = CAST(UTC_TIMESTAMP() AS CHAR)
WHERE  BoardID = i_BoardID
AND `Name` = CONVERT('maxuserswhen' USING {databaseEncoding});
	END  IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}attachment_delete(
i_AttachmentID INT)
MODIFIES SQL DATA
BEGIN
DELETE FROM {databaseName}.{objectQualifier}Attachment
WHERE       AttachmentID = i_AttachmentID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}attachment_download(
i_AttachmentID INT)
MODIFIES SQL DATA
BEGIN
UPDATE {databaseName}.{objectQualifier}Attachment
SET    Downloads = Downloads + 1
WHERE  AttachmentID = i_AttachmentID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}attachment_list(
i_MessageID    INT,
i_AttachmentID INT,
i_BoardID      INT)
READS SQL DATA
BEGIN
   IF i_MessageID IS NOT NULL THEN
     select 
 			a.*,
 			e.BoardID
 		from
 			{databaseName}.{objectQualifier}Attachment a
 			inner join {databaseName}.{objectQualifier}Message b on b.MessageID = a.MessageID
 			inner join {databaseName}.{objectQualifier}Topic c on c.TopicID = b.TopicID
 			inner join {databaseName}.{objectQualifier}Forum d on d.ForumID = c.ForumID
 			inner join {databaseName}.{objectQualifier}Category e on e.CategoryID = d.CategoryID
			inner join {databaseName}.{objectQualifier}Board brd on brd.BoardID = e.BoardID
 		where
 			a.MessageID=i_MessageID;
   ELSEIF i_AttachmentID IS NOT NULL THEN
     select 
 			a.*,
 			e.BoardID
 		from
 			{databaseName}.{objectQualifier}Attachment a
 			inner join {databaseName}.{objectQualifier}Message b on b.MessageID = a.MessageID
 			inner join {databaseName}.{objectQualifier}Topic c on c.TopicID = b.TopicID
 			inner join {databaseName}.{objectQualifier}Forum d on d.ForumID = c.ForumID
 			inner join {databaseName}.{objectQualifier}Category e on e.CategoryID = d.CategoryID
			inner join {databaseName}.{objectQualifier}Board brd on brd.BoardID = e.BoardID
 		where 
 			a.AttachmentID=i_AttachmentID;
   ELSE
    select 
 			a.*,
			i_BoardID AS BoardID,						
 			b.`Posted` AS Posted,
 			d.`ForumID` AS ForumID,
 			d.`Name` AS ForumName,
 			c.`TopicID` AS TopicID,
 			c.`Topic` AS TopicName
 		from 
 			{databaseName}.{objectQualifier}Attachment a
 			inner join {databaseName}.{objectQualifier}Message b on b.MessageID = a.MessageID
 			inner join {databaseName}.{objectQualifier}Topic c on c.TopicID = b.TopicID
 			inner join {databaseName}.{objectQualifier}Forum d on d.ForumID = c.ForumID
 			inner join {databaseName}.{objectQualifier}Category e on e.CategoryID = d.CategoryID
 		where
 			e.BoardID = i_BoardID
 		order by
 			d.Name,
 			c.Topic,
 			b.Posted;
   END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}attachment_save(
i_MessageID   INT,
i_FileName    VARCHAR(128),
i_Bytes       INT,
i_ContentType VARCHAR(128) ,
i_FileData    LONGBLOB)
MODIFIES SQL DATA
BEGIN

INSERT INTO {databaseName}.{objectQualifier}Attachment
(MessageID,
FileName,
Bytes,
ContentType,
Downloads,
FileData)
VALUES     (i_MessageID,
i_FileName,
i_Bytes,
i_ContentType,
0,
i_FileData);
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}bannedip_delete(
i_ID INT)
MODIFIES SQL DATA
BEGIN
DELETE FROM {databaseName}.{objectQualifier}BannedIP
WHERE       ID = i_ID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}bannedip_list(
i_BoardID INT,
i_ID      INT)
READS SQL DATA
BEGIN
DECLARE ici_ID INT DEFAULT NULL;
IF i_ID IS NOT NULL THEN SET ici_ID=i_ID;END IF;
IF ici_ID IS NULL THEN
SELECT *
FROM   {databaseName}.{objectQualifier}BannedIP
WHERE  BoardID = i_BoardID;
ELSE
SELECT *
FROM   {databaseName}.{objectQualifier}BannedIP
WHERE  BoardID = i_BoardID
AND ID = ici_ID;
END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}bannedip_save(
i_ID      INT,
i_BoardID INT,
i_Mask    VARCHAR(57),
i_Reason VARCHAR(128),
i_UserID INT)
MODIFIES SQL DATA
BEGIN
DECLARE ici_ID INT DEFAULT NULL;

IF i_ID IS NOT NULL THEN SET ici_ID=i_ID;
END IF;

IF ici_ID IS NULL OR ici_ID = 0 THEN
BEGIN
INSERT INTO {databaseName}.{objectQualifier}BannedIP
(BoardID,
Mask,
Since,
Reason,
UserID)
VALUES     (i_BoardID,
i_Mask,
UTC_TIMESTAMP(),
i_Reason,
i_UserID);
END;
ELSE
BEGIN
UPDATE {databaseName}.{objectQualifier}BannedIP
SET    Mask = i_Mask, Reason = i_Reason, UserID = i_UserID
WHERE  ID = ici_ID;
END;
END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}bbcode_delete
 (
 	i_BBCodeID INT
 )
 MODIFIES SQL DATA
 BEGIN
 	IF i_BBCodeID IS NOT NULL THEN
 		DELETE FROM {databaseName}.{objectQualifier}BBCode WHERE BBCodeID = i_BBCodeID;
 	ELSE
 		DELETE FROM {databaseName}.{objectQualifier}BBCode;
   END IF;
 END;
--GO

 /* STORED PROCEDURE CREATED BY VZ-TEAM */
 
 CREATE PROCEDURE {databaseName}.{objectQualifier}bbcode_list
 (
 	i_BoardID INT,
 	i_BBCodeID INT
 )
 READS SQL DATA
 BEGIN
 	IF i_BBCodeID IS NULL THEN
 		SELECT * FROM {databaseName}.{objectQualifier}BBCode a  WHERE a.BoardID = i_BoardID ORDER BY a.ExecOrder, a.`Name` DESC;
 	ELSE
 		SELECT * FROM {databaseName}.{objectQualifier}BBCode b WHERE b.BBCodeID = i_BBCodeID ORDER BY b.ExecOrder;
   END IF; 
 END;
--GO


 /* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}bbcode_save
 (
 	i_BBCodeID INT,
 	i_BoardID INT,
 	i_Name VARCHAR(255),
 	i_Description VARCHAR(4000),
 	i_OnClickJS VARCHAR(1000),
 	i_DisplayJS TEXT,
 	i_EditJS TEXT,
 	i_DisplayCSS TEXT,
 	i_SearchRegEx TEXT,
 	i_ReplaceRegEx TEXT,
 	i_Variables VARCHAR(1000),
 	i_UseModule TINYINT(1),
 	i_ModuleClass VARCHAR(255),	
 	i_ExecOrder INT
 )
MODIFIES SQL DATA
 BEGIN
 	IF i_BBCodeID IS NOT NULL THEN
        
 		UPDATE
 			{databaseName}.{objectQualifier}BBCode
 		SET
 			`Name` = i_Name,
 			`Description` = i_Description,
 			`OnClickJS` = i_OnClickJS,
 			`DisplayJS` = i_DisplayJS,
 			`EditJS` = i_EditJS,
 			`DisplayCSS` = i_DisplayCSS,
 			`SearchRegEx` = i_SearchRegEx,
 			`ReplaceRegEx` = i_ReplaceRegEx,
 			`Variables` = i_Variables,
 			`UseModule` = i_UseModule,
 			`ModuleClass` = i_ModuleClass,			
 			`ExecOrder` = i_ExecOrder
 		WHERE
 			BBCodeID = i_BBCodeID;
 	
 	ELSE 
 		IF NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}BBCode WHERE BoardID = i_BoardID AND `Name` = i_Name) THEN
 			INSERT INTO
 				{databaseName}.{objectQualifier}BBCode (`BoardID`,`Name`,`Description`,`OnClickJS`,`DisplayJS`,`EditJS`,`DisplayCSS`,`SearchRegEx`,`ReplaceRegEx`,`Variables`,`UseModule`,`ModuleClass`,`ExecOrder`)
 			VALUES (i_BoardID,i_Name,i_Description,i_OnClickJS,i_DisplayJS,i_EditJS,i_DisplayCSS,i_SearchRegEx,i_ReplaceRegEx,i_Variables,i_UseModule,i_ModuleClass,i_ExecOrder);
 	END IF; 
 	END IF;
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}board_create(
 	i_BoardName 		VARCHAR(128),
 	i_Culture           char(5),
	i_LanguageFile   	VARCHAR(128),
 	i_MembershipAppName VARCHAR(128),
 	i_RolesAppName      VARCHAR(128),
 	i_UserName		    VARCHAR(255),
 	i_UserEmail		    VARCHAR(255),
 	i_UserKey		    VARCHAR(64), 
 	i_IsHostAdmin	    TINYINT(1),
	i_RolePrefix VARCHAR(128)
 ) 
 MODIFIES SQL DATA
 BEGIN
 	DECLARE l_BoardID			    INT;
 	DECLARE l_TimeZone			    INT;
 	DECLARE l_ForumEmail			VARCHAR(128);
 	DECLARE l_GroupIDAdmin			INT;
 	DECLARE l_GroupIDGuest			INT;
 	DECLARE l_GroupIDMember			INT;
 	DECLARE l_AccessMaskIDAdmin		INT;
 	DECLARE l_AccessMaskIDModerator	INT;
 	DECLARE l_AccessMaskIDMember	INT;
 	DECLARE l_AccessMaskIDReadOnly	INT;
 	DECLARE l_UserIDAdmin			INT;
 	DECLARE l_UserIDGuest			INT;
 	DECLARE l_RankIDAdmin			INT;
 	DECLARE l_RankIDGuest			INT;
 	DECLARE l_RankIDNewbie			INT;
 	DECLARE l_RankIDMember			INT;
 	DECLARE l_RankIDAdvanced		INT;
 	DECLARE l_CategoryID			INT;
 	DECLARE l_ForumID			    INT;
 	DECLARE l_UserFlags			    INT;
 

        SELECT COALESCE(CAST(`Value` AS SIGNED),0)
                         INTO l_TimeZone
                         FROM   {databaseName}.{objectQualifier}Registry
                         WHERE  Lower(`Name`) = Lower('TimeZone');
        SELECT CAST(`Value` AS CHAR(128))
                           INTO l_ForumEmail			
                           FROM   {databaseName}.{objectQualifier}Registry
                           WHERE  Lower(`Name`) = Lower('ForumEmail');
 
 	 /*Board 
        SET FOREIGN_KEY_CHECKS =0;*/
        INSERT INTO {databaseName}.{objectQualifier}Board
                   (`Name`, AllowThreaded, MembershipAppName, RolesAppName )
        VALUES     (i_BoardName,0, i_MembershipAppName, i_RolesAppName);
        /*SET FOREIGN_KEY_CHECKS =1;*/
        SET l_BoardID = LAST_INSERT_ID();
        
        CALL {databaseName}.{objectQualifier}registry_save('culture',i_Culture,l_BoardID);
	    CALL {databaseName}.{objectQualifier}registry_save('language',i_LanguageFile,l_BoardID);	
        
 	 /*Rank*/
        INSERT INTO {databaseName}.{objectQualifier}Rank
                   (BoardID,
                    `Name`,
                    Flags,
                    MinPosts,
                    PMLimit,
                    Style,
                    SortOrder
                    )
        VALUES     (l_BoardID,
                    'Administration',
                    0,
                    NULL,
                    0,
                    '',
                    2);
        
        SET l_RankIDAdmin = LAST_INSERT_ID();
        INSERT INTO {databaseName}.{objectQualifier}Rank
                   (BoardID,
                    `Name`,
                    Flags,
                    MinPosts,
                    PMLimit,
                    Style,
                    SortOrder)
        VALUES     (l_BoardID,
                    'Guest',
                    0,
                    NULL,
                    0,
                    '',
                    2);
        
        SET l_RankIDGuest = LAST_INSERT_ID();
        INSERT INTO {databaseName}.{objectQualifier}Rank
                   (BoardID,
                    `Name`,
                    Flags,
                    MinPosts,
                    PMLimit,
                    Style,
                    SortOrder)
        VALUES     (l_BoardID,
                    'Newbie',
                    3,
                    0,
                    0,
                    '',
                    2);
        
        SET l_RankIDNewbie = LAST_INSERT_ID();
        INSERT INTO {databaseName}.{objectQualifier}Rank
                   (BoardID,
                    `Name`,
                    Flags,
                    MinPosts,
                    PMLimit,
                    Style,
                    SortOrder)
        VALUES     (l_BoardID,
                    'Member',
                    2,
                    10,
                    0,
                    '',
                    2);
        
        SET l_RankIDMember = LAST_INSERT_ID();
        INSERT INTO {databaseName}.{objectQualifier}Rank
                   (BoardID,
                    `Name`,
                    Flags,
                    MinPosts,
                    PMLimit,
                    Style,
                    SortOrder)
        VALUES     (l_BoardID,
                    'Advanced Member',
                    2,
                    30,
                    0,
                    '',
                    2);
        
        SET l_RankIDAdvanced =  LAST_INSERT_ID();
 
 	/*AccessMask*/
 	INSERT INTO {databaseName}.{objectQualifier}AccessMask(BoardID,`Name`,Flags, SortOrder)
 	VALUES(l_BoardID,'Admin Access',1023 + 1024,4);
 	SET l_AccessMaskIDAdmin = LAST_INSERT_ID();

 	INSERT INTO {databaseName}.{objectQualifier}AccessMask(BoardID,`Name`,Flags, SortOrder)
 	VALUES(l_BoardID,'Moderator Access',487 + 1024,3);
 	SET l_AccessMaskIDModerator = LAST_INSERT_ID();

 	INSERT INTO {databaseName}.{objectQualifier}AccessMask(BoardID,`Name`,Flags, SortOrder)
 	VALUES(l_BoardID,'Member Access',423 + 1024,2);
 	SET l_AccessMaskIDMember = LAST_INSERT_ID();

 	INSERT INTO {databaseName}.{objectQualifier}AccessMask(BoardID,`Name`,Flags, SortOrder)
 	VALUES(l_BoardID,'Read Only Access',1,1);
 	SET l_AccessMaskIDReadOnly = LAST_INSERT_ID();

 	INSERT INTO {databaseName}.{objectQualifier}AccessMask(BoardID,`Name`,Flags, SortOrder)
 	VALUES(l_BoardID,'No Access',0,0);

   
 
 	 /*Group*/
 	INSERT INTO {databaseName}.{objectQualifier}Group(BoardID,`Name`,Flags,PMLimit,Style,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) 
	values(l_BoardID, CONCAT(COALESCE(i_RolePrefix,''), 'Administrators'),1, 2147483647,'default!font-size: 8pt; color: red/flatearth!font-size: 8pt; color:blue',0,256,'URL,IMG,SPOILER,QUOTE',10,120);
 	set l_GroupIDAdmin = LAST_INSERT_ID();
 	INSERT INTO {databaseName}.{objectQualifier}Group(BoardID,`Name`,Flags,PMLimit,Style,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) 
	values(l_BoardID,'Guests',2,0,'',1,0,null,0,0);
 	SET l_GroupIDGuest = LAST_INSERT_ID();
 	INSERT INTO {databaseName}.{objectQualifier}Group(BoardID,`Name`,Flags,PMLimit,Style,SortOrder,UsrSigChars,UsrSigBBCodes,UsrAlbums,UsrAlbumImages) 
	values(l_BoardID, CONCAT(COALESCE(i_RolePrefix,''),'Registered'),4,30,'',2,128,'URL,IMG,SPOILER,QUOTE',5,30);
 	SET l_GroupIDMember = LAST_INSERT_ID();	
 	
 	 /*User (GUEST)*/
 	INSERT INTO {databaseName}.{objectQualifier}User(BoardID,RankID,`Name`,`DisplayName`,Password,Joined,LastVisit,NumPosts,TimeZone,Email,Flags)
 	VALUES(l_BoardID,l_RankIDGuest,'Guest','Guest','na', UTC_TIMESTAMP(),UTC_TIMESTAMP(),0,l_TimeZone,l_ForumEmail,6);
 	SET l_UserIDGuest = LAST_INSERT_ID();	
 	
 	SET l_UserFlags = 2;
 	IF i_IsHostAdmin<>0 THEN SET l_UserFlags = 3; END IF;

  /*User (ADMIN)*/
  INSERT INTO {databaseName}.{objectQualifier}User(BoardID,RankID,`Name`,`DisplayName`,Password, Email,ProviderUserKey, Joined,LastVisit,NumPosts,TimeZone,Flags)
  VALUES(l_BoardID,l_RankIDAdmin,i_UserName,i_UserName,'na',i_UserEmail,i_UserKey,UTC_TIMESTAMP(),UTC_TIMESTAMP(),0,l_TimeZone,l_UserFlags);
  SET l_UserIDAdmin = LAST_INSERT_ID();

  /*UserGroup*/
  INSERT INTO {databaseName}.{objectQualifier}UserGroup(UserID,GroupID) VALUES(l_UserIDAdmin,l_GroupIDAdmin);
  INSERT INTO {databaseName}.{objectQualifier}UserGroup(UserID,GroupID) VALUES(l_UserIDGuest,l_GroupIDGuest);

  /*Category*/
  INSERT INTO {databaseName}.{objectQualifier}Category(BoardID,`Name`,SortOrder) VALUES(l_BoardID,'Test Category',1);
  set l_CategoryID = LAST_INSERT_ID();

  /*Forum*/
  INSERT INTO {databaseName}.{objectQualifier}Forum(CategoryID,`Name`,Description,SortOrder,NumTopics,NumPosts,Flags)
  VALUES(l_CategoryID,'Test Forum','A test forum',1,0,0,4);
  SET l_ForumID = LAST_INSERT_ID();
  /* ForumAccess */
  INSERT INTO {databaseName}.{objectQualifier}ForumAccess(GroupID,ForumID,AccessMaskID) VALUES(l_GroupIDAdmin,l_ForumID,l_AccessMaskIDAdmin);
  INSERT INTO {databaseName}.{objectQualifier}ForumAccess(GroupID,ForumID,AccessMaskID) VALUES(l_GroupIDGuest,l_ForumID,l_AccessMaskIDReadOnly);
  INSERT INTO {databaseName}.{objectQualifier}ForumAccess(GroupID,ForumID,AccessMaskID) VALUES(l_GroupIDMember,l_ForumID,l_AccessMaskIDMember);
  SELECT l_BoardID;
  
  END;
--GO


  /* STORED PROCEDURE CREATED BY VZ-TEAM */

  CREATE  PROCEDURE {databaseName}.{objectQualifier}board_delete(
  i_BoardID INT)
  MODIFIES SQL DATA
  BEGIN
   
  DECLARE  itmpForumID INT;
  
  DECLARE board_cursor CURSOR  FOR
  SELECT   ForumID
  FROM     {databaseName}.{objectQualifier}Forum a
  JOIN {databaseName}.{objectQualifier}Category b
  ON a.CategoryID = b.CategoryID
  WHERE    b.BoardID = i_BoardID
  ORDER BY ForumID DESC;


  OPEN board_cursor;
   BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
   LOOP
  FETCH board_cursor  INTO itmpForumID ;
  
  CALL {databaseName}.{objectQualifier}forum_delete(itmpForumID);
  END LOOP; 
  END;
  CLOSE board_cursor;
  /*DEALLOCATE board_cursor;*/

  DELETE FROM {databaseName}.{objectQualifier}ForumAccess
  WHERE       EXISTS (SELECT 1
  FROM   {databaseName}.{objectQualifier}Group x
  WHERE  x.GroupID = {databaseName}.{objectQualifier}ForumAccess.GroupID
  AND x.BoardID = i_BoardID);
  DELETE FROM {databaseName}.{objectQualifier}Forum
  WHERE       EXISTS (SELECT 1
  FROM   {databaseName}.{objectQualifier}Category x
  WHERE  x.CategoryID = {databaseName}.{objectQualifier}Forum.CategoryID
  AND x.BoardID = i_BoardID);
 

  DELETE FROM {databaseName}.{objectQualifier}UserGroup
  WHERE       EXISTS (SELECT 1
  FROM   {databaseName}.{objectQualifier}User x
  WHERE  x.UserID = {databaseName}.{objectQualifier}UserGroup.UserID
  AND x.BoardID = i_BoardID);



  DELETE FROM {databaseName}.{objectQualifier}Category
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}AccessMask
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}ActiveAccess
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Active
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}User
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Rank
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Group
  WHERE       BoardID = i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Extension where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}BBCode where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}ShoutboxMessage where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Medal where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Smiley where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Replace_Words where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}NntpServer where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}BannedIP where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Registry where BoardID= i_BoardID;
  DELETE FROM {databaseName}.{objectQualifier}Board
  WHERE       BoardID = i_BoardID;
  END;
--GO


  /* STORED PROCEDURE CREATED BY VZ-TEAM */

  CREATE  PROCEDURE {databaseName}.{objectQualifier}board_list(
  i_BoardID INT,i_OSString VARCHAR(255))
  READS SQL DATA
  BEGIN
  DECLARE ici_BoardID INT DEFAULT NULL;

  IF i_BoardID IS NOT NULL THEN SET ici_BoardID=i_BoardID; END IF;
  IF ici_BoardID IS NULL THEN
  SELECT a.*,
  CONCAT('MySQL', ' ',VERSION()) AS SQLVersion
  FROM   {databaseName}.{objectQualifier}Board a;
  ELSE
  SELECT a.*,
  CONCAT('Database: MySQL', ' ',VERSION(), ' - ', i_OSString) AS SQLVersion
  FROM   {databaseName}.{objectQualifier}Board a
  WHERE  a.BoardID = ici_BoardID;
  END IF;
  END;
--GO

   /* STORED PROCEDURE CREATED BY VZ-TEAM */
   CREATE  PROCEDURE {databaseName}.{objectQualifier}board_poststats(
                     i_BoardID INT, 
					 i_StyledNicks TINYINT(1), 
					 i_ShowNoCountPosts TINYINT(1), 
					 i_GetDefaults TINYINT(1))
  READS SQL DATA
  BEGIN
  IF i_GetDefaults <= 0 THEN

  SELECT (SELECT CAST(COUNT(a.Indent) AS UNSIGNED)
  FROM   {databaseName}.{objectQualifier}Message a
  JOIN {databaseName}.{objectQualifier}Topic b
  ON b.TopicID = a.TopicID
  JOIN {databaseName}.{objectQualifier}Forum c
  ON c.ForumID = b.ForumID
  JOIN {databaseName}.{objectQualifier}Category d
  ON d.CategoryID = c.CategoryID
  WHERE  d.BoardID = i_BoardID  AND (a.Flags & 24)=16)   AS Posts,

(SELECT CAST(COUNT(a.TopicID) AS UNSIGNED)
FROM   {databaseName}.{objectQualifier}Topic a
JOIN {databaseName}.{objectQualifier}Forum b
ON b.ForumID = a.ForumID
JOIN {databaseName}.{objectQualifier}Category c
ON c.CategoryID = b.CategoryID
WHERE  c.BoardID = i_BoardID AND (a.Flags & 8) <> 8) AS Topics,

    (SELECT CAST(COUNT(a.ForumID) AS UNSIGNED)
    FROM   {databaseName}.{objectQualifier}Forum a
    JOIN {databaseName}.{objectQualifier}Category b
    ON b.CategoryID = a.CategoryID
    WHERE  b.BoardID = i_BoardID ) AS Forums,
1 AS LastPostInfoID,
a.Posted AS LastPost,
a.UserID AS LastUserID,
e.Name AS LastUser,
/* case(i_StyledNicks)
			when 1 then  IFNULL(
			(SELECT g.Style FROM {databaseName}.{objectQualifier}UserGroup ug 
		    join {databaseName}.{objectQualifier}Group g 
			on g.GroupID=ug.GroupID WHERE ug.UserID=e.UserID 
			AND LENGTH(g.Style) > 2 ORDER BY g.SortOrder LIMIT 1), 
			r.Style)
	        else ''	 end)  AS LastUserStyle	*/	
(case(i_StyledNicks) when 1 then  IFNULL(s.Style, r.Style)  
	        else ''	 end)  AS LastUserStyle		
FROM     {databaseName}.{objectQualifier}Message a
JOIN {databaseName}.{objectQualifier}Topic b
ON b.TopicID = a.TopicID
JOIN {databaseName}.{objectQualifier}Forum c
ON c.ForumID = b.ForumID
JOIN {databaseName}.{objectQualifier}Category d
ON d.CategoryID = c.CategoryID
JOIN {databaseName}.{objectQualifier}User e
ON e.UserID = a.UserID
JOIN {databaseName}.{objectQualifier}Rank r
ON r.RankID = e.RankID
JOIN ( SELECT f.Style, ug.UserID FROM {databaseName}.{objectQualifier}UserGroup ug
		join {databaseName}.{objectQualifier}Group f on f.GroupID=ug.GroupID WHERE char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1) s
ON s.UserID = e.UserID
WHERE    (a.Flags & 24) = 16
    -- topic not deleted
	AND (b.Flags & 8) <> 8 
	AND d.BoardID = i_BoardID
	-- nocount
	AND (c.Flags & 8) <> (CASE WHEN i_ShowNoCountPosts > 0 THEN -1 ELSE 8 END)
ORDER BY a.Posted DESC LIMIT 1;
ELSE
SELECT
		0 AS Posts,
		0 AS Topics,
		1 AS Forums,	
		1 AS LastPostInfoID,
		NULL AS LastPost,
		NULL AS LastUserID,
		NULL AS LastUser,
		'' AS LastUserStyle ;
END IF;
END;
--GO

   /* STORED PROCEDURE CREATED BY VZ-TEAM */
   CREATE  PROCEDURE {databaseName}.{objectQualifier}board_userstats(
  i_BoardID INT, i_StyledNicks TINYINT(1))
  READS SQL DATA
  BEGIN
  SELECT 
(SELECT CAST(COUNT(1) AS UNSIGNED)
FROM   {databaseName}.{objectQualifier}User a
WHERE  a.BoardID = i_BoardID AND (a.Flags & 2) = 2 AND (a.Flags & 4) = 0) AS Members,
    (SELECT `Value` FROM {databaseName}.{objectQualifier}Registry WHERE LOWER(`Name`) = LOWER('maxusers') AND      BoardID=i_BoardID) AS MaxUsers,
    (SELECT `Value` FROM {databaseName}.{objectQualifier}Registry WHERE LOWER(`Name`) = LOWER('maxuserswhen') AND     BoardID=i_BoardID) AS MaxUsersWhen,
 1 AS LastMemberInfoID,
 `UserID` AS LastMemberID,
`Name` AS LastMember
FROM      {databaseName}.{objectQualifier}User
WHERE    (Flags & 2) = 2
	 AND (Flags & 4) <> 4
	 AND BoardID = i_BoardID 
ORDER BY `Joined` DESC LIMIT 1;
END;
--GO

   /* STORED PROCEDURE CREATED BY VZ-TEAM */
  CREATE  PROCEDURE {databaseName}.{objectQualifier}board_poststats1(
  i_BoardID INT)
  READS SQL DATA
  BEGIN
  SELECT (SELECT CAST(COUNT(a.Indent) AS UNSIGNED)
  FROM   {databaseName}.{objectQualifier}Message a
  JOIN {databaseName}.{objectQualifier}Topic b
  ON b.TopicID = a.TopicID
  JOIN {databaseName}.{objectQualifier}Forum c
  ON c.ForumID = b.ForumID
  JOIN {databaseName}.{objectQualifier}Category d
  ON d.CategoryID = c.CategoryID
  WHERE  d.BoardID = i_BoardID  AND (a.Flags & 24)=16) AS Posts,
(SELECT CAST(COUNT(a.TopicID) AS UNSIGNED)
FROM   {databaseName}.{objectQualifier}Topic a
JOIN {databaseName}.{objectQualifier}Forum b
ON b.ForumID = a.ForumID
JOIN {databaseName}.{objectQualifier}Category c
ON c.CategoryID = b.CategoryID
WHERE  c.BoardID = i_BoardID AND (a.Flags & 8) <> 8) AS Topics,
    (SELECT CAST(COUNT(a.ForumID) AS UNSIGNED)
    FROM   {databaseName}.{objectQualifier}Forum a
    JOIN {databaseName}.{objectQualifier}Category b
    ON b.CategoryID = a.CategoryID
    WHERE  b.BoardID = i_BoardID ) AS Forums,
(SELECT CAST(COUNT(1) AS UNSIGNED)
FROM   {databaseName}.{objectQualifier}User a
WHERE  a.BoardID = i_BoardID AND (a.Flags & 2) = 2 AND (a.Flags & 4) = 0) AS Members,
    (SELECT `Value` FROM {databaseName}.{objectQualifier}Registry WHERE LOWER(`Name`) = LOWER('maxusers') AND      BoardID=i_BoardID) AS MaxUsers,
    (SELECT `Value` FROM {databaseName}.{objectQualifier}Registry WHERE LOWER(`Name`) = LOWER('maxuserswhen') AND     BoardID=i_BoardID) AS MaxUsersWhen;
END;
--GO

  /* STORED PROCEDURE CREATED BY VZ-TEAM */

  CREATE  PROCEDURE {databaseName}.{objectQualifier}board_poststats2(
  i_BoardID INT)
  READS SQL DATA
  BEGIN
SELECT 
1 AS LastPostInfoID,
a.Posted AS LastPost,
a.UserID AS LastUserID,
e.Name AS LastUser,
{databaseName}.{objectQualifier}get_userstyle(a.UserID) AS LastUserStyle	
FROM     {databaseName}.{objectQualifier}Message a
JOIN {databaseName}.{objectQualifier}Topic b
ON b.TopicID = a.TopicID
JOIN {databaseName}.{objectQualifier}Forum c
ON c.ForumID = b.ForumID
JOIN {databaseName}.{objectQualifier}Category d
ON d.CategoryID = c.CategoryID
JOIN {databaseName}.{objectQualifier}User e
ON e.UserID = a.UserID
WHERE    (a.Flags & 24) = 16
	AND (b.Flags & 8) <> 8 
	AND d.BoardID = i_BoardID
ORDER BY a.Posted DESC LIMIT 1;
END;
--GO

 /* STORED PROCEDURE CREATED BY VZ-TEAM */
  CREATE  PROCEDURE {databaseName}.{objectQualifier}board_poststats3(
  i_BoardID INT)
  READS SQL DATA
  BEGIN
SELECT 
1 AS LastMemberInfoID,
`UserID` AS LastMemberID,
`Name` AS LastMember
FROM     {databaseName}.{objectQualifier}User
WHERE    (Flags & 2) = 2
	 AND (Flags & 4) = 0
	 AND BoardID = i_BoardID 
ORDER BY `Joined` DESC LIMIT 1;
END;
--GO
  
/* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}board_resync
 	(i_BoardID INT)
 	MODIFIES SQL DATA
BEGIN

        DECLARE  itmpForumID INT;
DECLARE currBoards CURSOR FOR
 			SELECT BoardID FROM {databaseName}.{objectQualifier}Board;

 	IF i_BoardID IS NULL THEN		
 
 		OPEN currBoards;
 		
 		 /*cycle through forums*/
    BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
    LOOP
        FETCH currBoards INTO itmpForumID ;		
 		
           /*resync board forums*/
 			CALL {databaseName}.{objectQualifier}forum_resync (itmpForumID, null);
     END LOOP; 		
      END;
 		CLOSE currBoards;
 		/*deallocate curBoards*/ 	
 	ELSE
 		/*resync board forums*/
 		CALL {databaseName}.{objectQualifier}forum_resync(i_BoardID, null);
 	END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}board_save(
                i_BoardID       INT,
                i_Name          VARCHAR(128),
                i_LanguageFile  varchar(128), 
                i_Culture       char(5),
                i_AllowThreaded TINYINT(1))
               MODIFIES SQL DATA 
BEGIN
        CALL {databaseName}.{objectQualifier}registry_save('culture',i_Culture,i_BoardID);
	    CALL {databaseName}.{objectQualifier}registry_save('language',i_LanguageFile,i_BoardID);
        UPDATE {databaseName}.{objectQualifier}Board
        SET    `Name` = CONVERT(i_Name USING {databaseEncoding}),
               AllowThreaded = i_AllowThreaded
        WHERE  BoardID = i_BoardID;
        SELECT i_BoardID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}board_stats
 	(i_BoardID INT)
 	READS SQL DATA
BEGIN
 	IF i_BoardID IS NULL THEN
 		SELECT
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}Message where SIGN(Flags & 16) = 1 AND SIGN(a.Flags & 8) = 0) AS NumPosts,
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}Topic where SIGN(Flags & 8) = 0) AS NumTopics,
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}User where SIGN(Flags & 2) = 1) AS NumUsers,
 		(SELECT MIN(Joined)  FROM {databaseName}.{objectQualifier}User) AS BoardStart;
 	
 	ELSE
        
 		SELECT
 		(SELECT CAST(COUNT(a.MessageID) AS UNSIGNED) FROM  {databaseName}.{objectQualifier}Message a
 		JOIN {databaseName}.{objectQualifier}Topic b ON a.TopicID=b.TopicID
 		JOIN {databaseName}.{objectQualifier}Forum c ON b.ForumID=c.ForumID
 		JOIN {databaseName}.{objectQualifier}Category d ON c.CategoryID=d.CategoryID
 		WHERE SIGN(a.Flags & 16) = 1 
                  AND SIGN(a.Flags & 8) = 0 
                  AND SIGN(b.Flags & 8) = 0 
                  AND d.BoardID=i_BoardID) AS NumPosts,
 		(SELECT CAST(COUNT(a.TopicID) AS UNSIGNED) FROM {databaseName}.{objectQualifier}Topic a
 		JOIN {databaseName}.{objectQualifier}Forum b ON a.ForumID=b.ForumID
 		JOIN {databaseName}.{objectQualifier}Category c ON b.CategoryID=c.CategoryID
 		WHERE c.BoardID=i_BoardID 
                  AND SIGN(a.Flags & 8) = 0) AS NumTopics,
 		(SELECT CAST(COUNT(UserID) AS UNSIGNED) from {databaseName}.{objectQualifier}User 
                WHERE SIGN(Flags & 2) = 1 
                   AND BoardID=i_BoardID) AS NumUsers,
 		(SELECT MIN(`Joined`)  FROM {databaseName}.{objectQualifier}User where BoardID=i_BoardID) AS BoardStart;
 	END IF;
END;
/*
CREATE  PROCEDURE {databaseName}.{objectQualifier}board_stats
 	(i_BoardID INT)
BEGIN
 	IF i_BoardID IS NULL THEN
 		SELECT
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}MessageSelectView where IsApproved = 1 AND IsDeleted = 0) AS NumPosts,
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}TopicSelectView where IsDeleted = 0) AS NumTopics,
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}UserSelectView where IsApproved = 1) AS NumUsers,
 		(SELECT min(Joined) FROM {databaseName}.{objectQualifier}User) AS BoardStart;
 	
 	ELSE
        
 		SELECT
 		(SELECT COUNT(1) FROM  {databaseName}.{objectQualifier}MessageSelectView a
 		JOIN {databaseName}.{objectQualifier}TopicSelectView b ON a.TopicID=b.TopicID
 		JOIN {databaseName}.{objectQualifier}Forum c ON b.ForumID=c.ForumID
 		JOIN {databaseName}.{objectQualifier}Category d ON c.CategoryID=d.CategoryID
 		WHERE a.IsApproved = 1 
                  AND a.IsDeleted = 0 
                  AND b.IsDeleted = 0 
                  AND d.BoardID=i_BoardID) AS NumPosts,
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}TopicSelectView a
 		JOIN {databaseName}.{objectQualifier}Forum b ON a.ForumID=b.ForumID
 		JOIN {databaseName}.{objectQualifier}Category c ON b.CategoryID=c.CategoryID
 		WHERE c.BoardID=i_BoardID 
                  AND a.IsDeleted = 0) AS NumTopics,
 		(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserSelectView 
                WHERE IsApproved = 1 
                   AND BoardID=i_BoardID) AS NumUsers,
 			(SELECT MIN(`Joined`) FROM {databaseName}.{objectQualifier}User where BoardID=i_BoardID) AS BoardStart;
 	END IF;
END;*/
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}category_delete(
                i_CategoryID INT)
               MODIFIES SQL DATA 
BEGIN
        DECLARE  iflag INT;
        IF EXISTS (SELECT 1
                   FROM   {databaseName}.{objectQualifier}Forum
                   WHERE  CategoryID = i_CategoryID) THEN       
            SET iflag = 0;       
        ELSE
            DELETE FROM {databaseName}.{objectQualifier}Category
            WHERE       CategoryID = i_CategoryID;
            SET iflag = 1;
        END IF;
        SELECT iflag;
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */ 

 CREATE PROCEDURE {databaseName}.{objectQualifier}category_list(i_BoardID INT,i_CategoryID INT) 
READS SQL DATA
BEGIN
 	IF i_CategoryID IS NULL THEN
 		SELECT * FROM {databaseName}.{objectQualifier}Category WHERE BoardID = i_BoardID ORDER BY SortOrder;
 	ELSE
 		SELECT * FROM {databaseName}.{objectQualifier}Category WHERE BoardID = i_BoardID AND CategoryID = i_CategoryID;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}category_listread(
IN i_BoardID    INT,
IN i_UserID     INT,
IN i_CategoryID INT)
READS SQL DATA
BEGIN
SELECT   a.CategoryID,
a.Name,
a.CategoryImage
FROM     {databaseName}.{objectQualifier}Category a
JOIN {databaseName}.{objectQualifier}Forum b
ON b.CategoryID = a.CategoryID
JOIN {databaseName}.{objectQualifier}ActiveAccess v on v.ForumID=b.ForumID
WHERE    a.BoardID = i_BoardID
AND v.UserID=i_UserID 
AND (CAST(v.ReadAccess AS UNSIGNED)<>0 OR (b.Flags & 2)=0) 
AND (i_CategoryID IS NULL
OR a.CategoryID = i_CategoryID)
AND b.ParentID IS NULL
GROUP BY a.CategoryID,a.Name,a.SortOrder,
a.CategoryImage
ORDER BY a.SortOrder;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}category_save
(
i_BoardID    INT,
i_CategoryID INT,
i_Name       VARCHAR(128),
i_SortOrder  SMALLINT,
i_CategoryImage VARCHAR(255)
)
MODIFIES SQL DATA
BEGIN
IF i_CategoryID > 0 THEN

UPDATE {databaseName}.{objectQualifier}Category
SET    `Name` = CONVERT(i_Name USING {databaseEncoding}),
CategoryImage = i_CategoryImage,
SortOrder = i_SortOrder
WHERE  CategoryID = i_CategoryID;
SELECT  i_CategoryID AS CategoryID;
ELSE
INSERT INTO {databaseName}.{objectQualifier}Category
(BoardID,
`Name`,
`CategoryImage`,
SortOrder)
VALUES     (i_BoardID,
i_Name,
i_CategoryImage,
i_SortOrder);
SELECT LAST_INSERT_ID()AS CategoryID;
END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}checkemail_list
(
i_Email VARCHAR(128)
)
READS SQL DATA
BEGIN
IF i_Email IS NULL THEN
SELECT * FROM {databaseName}.{objectQualifier}CheckEmail;
ELSE
SELECT * FROM {databaseName}.{objectQualifier}CheckEmail WHERE Email = LOWER(i_EMail);
END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}checkemail_save
(
i_UserID INT,
i_Hash VARCHAR(32),
i_Email VARCHAR(128)
)
MODIFIES SQL DATA
BEGIN
INSERT INTO {databaseName}.{objectQualifier}CheckEmail
(UserID,Email,Created,Hash)
VALUES
(i_UserID,LOWER(i_Email),UTC_TIMESTAMP(),i_Hash);
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE procedure {databaseName}.{objectQualifier}checkemail_update(i_Hash VARCHAR(32))
MODIFIES SQL DATA
BEGIN
DECLARE l_UserID INT;
DECLARE l_CheckEmailID INT;
DECLARE l_Email VARCHAR(128);

SET l_UserID = NULL;

SELECT
CheckEmailID,
UserID,
Email
INTO l_CheckEmailID,l_UserID,l_Email
FROM
{databaseName}.{objectQualifier}CheckEmail
WHERE
Hash = i_Hash;

IF l_UserID IS NULL THEN
SELECT CONVERT(NULL, CHAR(36)) AS ProviderUserKey, CONVERT(NULL, CHAR(255)) AS Email;
ELSE
/*Update new user email*/
UPDATE {databaseName}.{objectQualifier}User SET Email = LOWER(l_Email), Flags = Flags | 2  WHERE UserID = l_UserID;
DELETE FROM {databaseName}.{objectQualifier}CheckEmail WHERE CheckEmailID = l_CheckEmailID;

/*return the UserProviderKey*/
SELECT ProviderUserKey, Email FROM {databaseName}.{objectQualifier}User WHERE UserID = l_UserID;
END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
/*polls*/

CREATE PROCEDURE {databaseName}.{objectQualifier}choice_add(
i_PollID		INT,
i_Choice		VARCHAR(128),
i_ObjectPath    VARCHAR(255),
i_MimeType      VARCHAR(50)
)
MODIFIES SQL DATA
BEGIN
INSERT INTO {databaseName}.{objectQualifier}Choice
(PollID, Choice, Votes, ObjectPath, MimeType)
VALUES
(i_PollID, i_Choice, 0, i_ObjectPath, i_MimeType);
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE procedure {databaseName}.{objectQualifier}choice_delete(
i_ChoiceID	INT
)
MODIFIES SQL DATA
BEGIN
DELETE FROM {databaseName}.{objectQualifier}Choice
WHERE ChoiceID = i_ChoiceID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}choice_update(
i_ChoiceID	INT,
i_Choice		VARCHAR(128),
i_ObjectPath    VARCHAR(255),
i_MimeType      VARCHAR(50)
)
MODIFIES SQL DATA
BEGIN

UPDATE {databaseName}.{objectQualifier}Choice
SET Choice = i_Choice,
ObjectPath = i_ObjectPath,
MimeType = i_MimeType 
WHERE ChoiceID = i_ChoiceID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}choice_vote
(i_ChoiceID INT,i_UserID INT, i_RemoteIP VARCHAR(39))
MODIFIES SQL DATA
BEGIN
DECLARE l_PollID INT;

SET l_PollID = (SELECT PollID FROM {databaseName}.{objectQualifier}Choice WHERE ChoiceID = i_ChoiceID);

IF i_UserID IS NULL THEN
IF i_RemoteIP IS NOT NULL THEN
INSERT INTO {databaseName}.{objectQualifier}PollVote (PollID, UserID, RemoteIP, ChoiceID) VALUES (l_PollID,NULL,i_RemoteIP, i_ChoiceID);
END IF;

ELSE
INSERT INTO {databaseName}.{objectQualifier}PollVote (PollID, UserID, RemoteIP, ChoiceID) VALUES (l_PollID,i_UserID,i_RemoteIP, i_ChoiceID);
END IF;

UPDATE {databaseName}.{objectQualifier}Choice SET Votes = Votes + 1 WHERE ChoiceID = i_ChoiceID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}eventlog_create(
i_UserID      INT,
i_Source      VARCHAR(128),
i_Description TEXT,
i_Type        INT)
MODIFIES SQL DATA
BEGIN
DECLARE topLogID INT;
DECLARE Version VARCHAR(128);
INSERT INTO {databaseName}.{objectQualifier}EventLog
(UserID,
Source,
Description,
`Type`)
VALUES     (i_UserID,
i_Source,
i_Description,
i_Type);
/*delete entries older than 10 days*/
DELETE FROM {databaseName}.{objectQualifier}EventLog
WHERE DATEDIFF(UTC_TIMESTAMP(),EventTime) > 10;
       /*or if there are more then 1000*/
        IF ((SELECT COUNT(*)
             FROM   {databaseName}.{objectQualifier}eventlog) >= 1050) THEN
 SELECT VERSION() INTO Version;
 IF LOCATE('5.1',Version)<>0 OR LOCATE('5.4',Version)<>0 OR LOCATE('6.0',Version)<>0 THEN
 -- DELETE FROM {databaseName}.{objectQualifier}EventLog WHERE EventLogID IN (SELECT EventLogID FROM {databaseName}.{objectQualifier}EventLog ORDER BY EventTime LIMIT 100) ; 
 SELECT EventLogID INTO topLogID  FROM  {databaseName}.{objectQualifier}EventLog ORDER BY EventLogID LIMIT 1; 
            
            DELETE FROM {databaseName}.{objectQualifier}EventLog
            WHERE       EventLogID BETWEEN  topLogID  AND topLogID +100;
 ELSE        
           
            SELECT EventLogID INTO topLogID  FROM  {databaseName}.{objectQualifier}EventLog ORDER BY EventLogID LIMIT 1; 
            
            DELETE FROM {databaseName}.{objectQualifier}EventLog
            WHERE       EventLogID BETWEEN  topLogID  AND topLogID +100;
        END IF;
  END IF;      
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}eventlog_delete
 (
 	i_EventLogID INT, 
 	i_BoardID  INT
 )
 MODIFIES SQL DATA
 BEGIN
 	 /*either EventLogID or BoardID must be null, not both at the same time*/
 	if i_EventLogID IS NULL THEN 
 		/* delete all events of this board*/
 		DELETE FROM {databaseName}.{objectQualifier}EventLog
 		WHERE
 			(UserID IS NULL or
 			UserID IN (SELECT UserID FROM {databaseName}.{objectQualifier}User WHERE BoardID=i_BoardID));
 	
 	ELSE 
 		 /*delete just one event*/
 		DELETE FROM {databaseName}.{objectQualifier}EventLog WHERE EventLogID=i_EventLogID;
 	END IF;
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}eventlog_list(
                i_BoardID INT)
                READS SQL DATA 
BEGIN
        SELECT   a.*,
                 IFNULL(b.Name,'System')  AS `Name`
        FROM     {databaseName}.{objectQualifier}EventLog a
                 LEFT JOIN {databaseName}.{objectQualifier}User b
                   ON b.UserID = a.UserID
        WHERE    (b.UserID IS NULL 
          OR b.BoardID = i_BoardID)
        ORDER BY a.EventLogID DESC;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}extension_delete (i_ExtensionID INT) 
 MODIFIES SQL DATA
 BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}Extension 
 	WHERE ExtensionID = i_ExtensionID;
 END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}extension_edit (i_ExtensionID INT)
 READS SQL DATA
 BEGIN
 	SELECT * 
 	FROM {databaseName}.{objectQualifier}Extension 
 	WHERE ExtensionID = i_ExtensionID 
 	ORDER BY Extension;
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}extension_list (i_BoardID INT, i_Extension VARCHAR(10)) 
 READS SQL DATA
 BEGIN
 
 	/*If an extension is passed, then we want to check for THAT extension*/
 	IF LENGTH(i_Extension) > 0 THEN
 		
 			SELECT
 				a.*
 			FROM
 				{databaseName}.{objectQualifier}Extension a
 			WHERE
 				a.BoardID = i_BoardID AND a.Extension=i_Extension
 			ORDER BY
 				a.Extension;

 
 	ELSE
 		/* Otherwise, just get a list for the given i_BoardId*/
 		
 			SELECT
 				a.*
 			FROM
 				{databaseName}.{objectQualifier}Extension a
 			WHERE
 				a.BoardID = i_BoardID	
 			ORDER BY
 				a.Extension;
 		END IF;
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE procedure {databaseName}.{objectQualifier}extension_save (i_ExtensionID INT,i_BoardID INT,i_Extension VARCHAR(10))
 MODIFIES SQL DATA
 BEGIN
 	if i_ExtensionID IS NULL OR i_ExtensionID = 0 THEN
 		INSERT INTO {databaseName}.{objectQualifier}Extension (BoardID,Extension) 
 		VALUES(i_BoardID,i_Extension);
 	ELSE
 		UPDATE {databaseName}.{objectQualifier}Extension
 		SET Extension = i_Extension 
 		WHERE ExtensionID = i_ExtensionID;
 	END IF;
 END;
--GO

CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_delete(
                i_ForumID INT)
MODIFIES SQL DATA              
BEGIN
DECLARE ici_LastTopicID INT;
DECLARE ici_LastMessageID INT;
DECLARE ici_LastUserID INT;
DECLARE ici_LastUserName VARCHAR(128);
DECLARE ici_ParentID INT;
DECLARE ici_LastPosted DATETIME;
DECLARE ici_LastTopicID_Check INT;
DECLARE ici_LastMessageID_Check INT;
DECLARE  itmpTopicID INT;
       
        DECLARE topic_cursor CURSOR  FOR
        SELECT   TopicID
        FROM     {databaseName}.{objectQualifier}topic
        WHERE    ForumID = i_ForumID
        ORDER BY TopicID DESC;
               
/*Here we change Last things in forums */
SELECT LastMessageID
INTO ici_LastMessageID
FROM {databaseName}.{objectQualifier}Forum
WHERE ForumID = i_ForumID;


        UPDATE {databaseName}.{objectQualifier}Forum
        SET    `LastMessageID` = NULL,
                LastTopicID = NULL
        WHERE  ForumID = i_ForumID;
        

        UPDATE {databaseName}.{objectQualifier}Topic
        SET    `LastMessageID` = NULL
        WHERE  `ForumID` = i_ForumID;

        UPDATE {databaseName}.{objectQualifier}Active 
        SET ForumID=NULL 
        WHERE ForumID=i_ForumID;

        

        DELETE  {databaseName}.{objectQualifier}WatchTopic,{databaseName}.{objectQualifier}Topic
        FROM {databaseName}.{objectQualifier}WatchTopic, {databaseName}.{objectQualifier}Topic
        WHERE `ForumID` = i_ForumID
        AND {databaseName}.{objectQualifier}WatchTopic.`TopicID` = {databaseName}.{objectQualifier}Topic.`TopicID`;

        DELETE {databaseName}.{objectQualifier}Active, {databaseName}.{objectQualifier}Topic
        FROM  {databaseName}.{objectQualifier}Active, {databaseName}.{objectQualifier}Topic
        WHERE {databaseName}.{objectQualifier}Topic.`ForumID` = i_ForumID
        AND   {databaseName}.{objectQualifier}Active.`TopicID` = {databaseName}.{objectQualifier}Topic.`TopicID`;

        DELETE  {databaseName}.{objectQualifier}NntpTopic, {databaseName}.{objectQualifier}NntpForum
         FROM         {databaseName}.{objectQualifier}NntpTopic, {databaseName}.{objectQualifier}NntpForum
         WHERE        {databaseName}.{objectQualifier}NntpForum.`ForumID` = i_ForumID
         AND {databaseName}.{objectQualifier}NntpTopic.`NntpForumID` = {databaseName}.{objectQualifier}NntpForum.`NntpForumID`;

        DELETE FROM {databaseName}.{objectQualifier}NntpForum
        WHERE       `ForumID` = i_ForumID;

        DELETE FROM {databaseName}.{objectQualifier}WatchForum
        WHERE       `ForumID` = i_ForumID;
                
        /*Delete topics, messages and attachments*/       

   OPEN topic_cursor;
   BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
   LOOP
           FETCH topic_cursor INTO itmpTopicID;           
           CALL {databaseName}.{objectQualifier}topic_delete(itmpTopicID, 1 , 1);
   END LOOP;          
   END;
           CLOSE topic_cursor;
      
        /* TopicDelete finished*/ 
      
        DELETE FROM {databaseName}.{objectQualifier}ForumAccess
        WHERE       ForumID = i_ForumID;
      
        /*Delete UserForums*/

        DELETE FROM {databaseName}.{objectQualifier}UserForum
        WHERE       ForumID = i_ForumID;

       /*And after this we can delete Forum itself*/

        DELETE FROM {databaseName}.{objectQualifier}Forum
        WHERE       ForumID = i_ForumID;
        /* Forum on update */
        SELECT ParentID INTO ici_ParentID FROM  {databaseName}.{objectQualifier}Forum
        WHERE ForumID = i_ForumID;
        IF ici_ParentID > 0 THEN
        SELECT LastPosted 
        INTO ici_LastPosted 
        FROM  {databaseName}.{objectQualifier}Forum
        WHERE ParentID = ici_ParentID ORDER BY LastPosted DESC LIMIT 1;
        IF ici_LastPosted IS NOT NULL THEN 
        SELECT ForumID INTO ici_ParentID FROM  {databaseName}.{objectQualifier}Forum
        WHERE LastPosted = ici_LastPosted ORDER BY ForumID DESC LIMIT 1;
        CALL {databaseName}.{objectQualifier}forum_updatelasttopic(ici_ParentID);
        CALL {databaseName}.{objectQualifier}forum_updatestats(ici_ParentID);
        END IF; 
        END IF; 
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_list(i_BoardID INT,i_ForumID INT) 
READS SQL DATA
BEGIN
        IF i_ForumID = 0 THEN 
                             SET i_ForumID = NULL; END IF; 
        IF i_ForumID IS NULL THEN
		              SELECT a.* FROM {databaseName}.{objectQualifier}Forum a 
                                  JOIN {databaseName}.{objectQualifier}Category b 
                                     ON b.CategoryID=a.CategoryID                                  
                                        WHERE b.BoardID=i_BoardID 
                                          ORDER BY a.SortOrder;
 	ELSE
 		SELECT a.* FROM {databaseName}.{objectQualifier}Forum a 
                   JOIN {databaseName}.{objectQualifier}Category b 
                    ON b.CategoryID=a.CategoryID 
                     WHERE b.BoardID=i_BoardID 
                      AND a.ForumID = i_ForumID;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}forum_listall (i_BoardID INT,i_UserID INT, i_Root INT)
   READS SQL DATA
   BEGIN
            IF i_Root IS NULL THEN SET i_Root = 0 ; END IF;
            IF i_Root = 0 THEN
                 SELECT
                    b.CategoryID,
                    b.Name AS Category,
                    a.ForumID,
                    a.Name AS Forum,
                    0 AS Indent,
                    a.ParentID,
		            a.PollGroupID
              FROM
                    {databaseName}.{objectQualifier}Forum a
                    JOIN {databaseName}.{objectQualifier}Category b ON b.CategoryID=a.CategoryID
					JOIN {databaseName}.{objectQualifier}ActiveAccess c ON c.ForumID=a.ForumID
              WHERE                    
                    b.BoardID = i_BoardID AND
					c.UserID = i_UserID AND
                     CAST(c.ReadAccess AS UNSIGNED) > 0 
              ORDER BY
                    b.SortOrder,
                    a.SortOrder,
                    b.CategoryID,
                    a.ForumID;

              ELSEIF  i_Root > 0  THEN

    SELECT
        b.CategoryID,
        b.Name AS Category,
        a.ForumID,
        a.Name AS Forum,
        0 AS Indent,
        a.ParentID,
		a.PollGroupID
    FROM
        {databaseName}.{objectQualifier}Forum a
        JOIN {databaseName}.{objectQualifier}Category b ON b.CategoryID=a.CategoryID 
		JOIN {databaseName}.{objectQualifier}ActiveAccess c ON c.ForumID=a.ForumID   
    WHERE       
        b.BoardID=i_BoardID AND
		c.UserID = i_UserID AND
        CAST(c.ReadAccess AS UNSIGNED) > 0 AND
        a.ForumID = i_Root
    ORDER BY
        b.SortOrder,
        a.SortOrder,
        b.CategoryID,
        a.ForumID;
ELSE 
   SELECT
        b.CategoryID,
        b.Name AS Category,
        a.ForumID,
        a.Name AS Forum,
        0 AS Indent,
        a.ParentID,
		a.PollGroupID
    FROM
        {databaseName}.{objectQualifier}Forum a
        JOIN {databaseName}.{objectQualifier}Category b ON b.CategoryID=a.CategoryID
		JOIN {databaseName}.{objectQualifier}ActiveAccess c ON c.ForumID=a.ForumID     
    WHERE      
        b.BoardID=i_BoardID AND
        CAST(c.ReadAccess AS UNSIGNED) > 0 AND
        b.CategoryID = -i_Root
    ORDER BY
        b.SortOrder,
        a.SortOrder,
        b.CategoryID,
        a.ForumID;
END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}forum_listall_fromcat(i_BoardID INT,i_CategoryID INT) 
 READS SQL DATA
 BEGIN
 	SELECT b.CategoryID,
	       b.Name AS Category, 
		   a.ForumID, 
		   a.Name AS Forum, 
		   a.ParentID, 
		   a.PollGroupID 
 	FROM   {databaseName}.{objectQualifier}Forum a 
           INNER JOIN
 		   {databaseName}.{objectQualifier}Category b 
		             ON b.CategoryID = a.CategoryID
 		   WHERE
 			b.CategoryID=i_CategoryID and
 			b.BoardID=i_BoardID
 		   ORDER BY
 			b.SortOrder,
 			a.SortOrder;
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_listallmymoderated(i_BoardID INT,i_UserID INT)
READS SQL DATA
BEGIN
 	SELECT
 		b.CategoryID,
 		b.Name AS Category,
 		a.ForumID,
 		a.Name AS Forum,
 		x.Indent
 	FROM
 		((SELECT
 			b.ForumID,
 			0 AS Indent
 		FROM
 			{databaseName}.{objectQualifier}Category a
 			JOIN {databaseName}.{objectQualifier}Forum b ON b.CategoryID=a.CategoryID
 		WHERE
 			a.BoardID=i_BoardID AND
 			b.ParentID IS NULL)
 	
 		UNION
 	
 		(SELECT
 			c.ForumID,
 			1 AS Indent
 		FROM
 			{databaseName}.{objectQualifier}Category a
 			JOIN {databaseName}.{objectQualifier}Forum b on b.CategoryID=a.CategoryID
 			JOIN {databaseName}.{objectQualifier}Forum c on c.ParentID=b.ForumID
 		WHERE
 			a.BoardID=i_BoardID and
 			b.ParentID IS NULL)
 	
 		UNION
 	
 		(SELECT
 			d.ForumID,
 			2 AS Indent 
 		FROM
 			{databaseName}.{objectQualifier}Category a
 			JOIN {databaseName}.{objectQualifier}Forum b ON b.CategoryID=a.CategoryID
 			JOIN {databaseName}.{objectQualifier}Forum c ON c.ParentID=b.ForumID
 			JOIN {databaseName}.{objectQualifier}Forum d ON d.ParentID=c.ForumID
 		WHERE
 			a.BoardID=i_BoardID AND
 			b.ParentID IS NULL
 		)) AS x
 		JOIN {databaseName}.{objectQualifier}Forum a ON a.ForumID=x.ForumID
 		JOIN {databaseName}.{objectQualifier}Category b ON b.CategoryID=a.CategoryID
 		JOIN {databaseName}.{objectQualifier}ActiveAccess c on c.ForumID=a.ForumID

 	WHERE 		
 		b.BoardID=i_BoardID AND
 		c.ModeratorAccess > 0
 	ORDER BY
 		b.SortOrder,
 		a.SortOrder;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_listpath(
                            i_ForumID INT)
                            READS SQL DATA
BEGIN
                            /*supports up to 4 levels of nested forums*/
                            SELECT a.ForumID,
                            a.Name
                            FROM     ((SELECT a.ForumID,
                            0 AS Indent
                            FROM   {databaseName}.{objectQualifier}Forum a
                            WHERE  a.ForumID = i_ForumID)
                            UNION
                            (SELECT b.ForumID,
                            1 AS Indent
                            FROM   {databaseName}.{objectQualifier}Forum a
                            JOIN {databaseName}.{objectQualifier}Forum b
                            ON b.ForumID = a.ParentID
                            WHERE  a.ForumID = i_ForumID)
                            UNION
                            (SELECT c.ForumID,
                            2 AS Indent
                            FROM   {databaseName}.{objectQualifier}Forum a
                            JOIN {databaseName}.{objectQualifier}Forum b
                            ON b.ForumID = a.ParentID
                            JOIN {databaseName}.{objectQualifier}Forum c
                            ON c.ForumID = b.ParentID
                            WHERE  a.ForumID = i_ForumID)
                            UNION
                            (SELECT d.ForumID,
                            3 AS Indent
                            FROM   {databaseName}.{objectQualifier}Forum a
                            JOIN {databaseName}.{objectQualifier}Forum b
                            ON b.ForumID = a.ParentID
                            JOIN {databaseName}.{objectQualifier}Forum c
                            ON c.ForumID = b.ParentID
                            JOIN {databaseName}.{objectQualifier}Forum d
                            ON d.ForumID = c.ParentID
                            WHERE  a.ForumID = i_ForumID)) AS x
                            JOIN {databaseName}.{objectQualifier}Forum a
                            ON a.ForumID = x.ForumID
                            ORDER BY x.Indent DESC;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_listread(
 i_BoardID INT,
 i_UserID INT,
 i_CategoryID INT,
 i_ParentID INT, 
 i_StyledNicks TINYINT(1),
 i_FindLastRead TINYINT(1)) 
 BEGIN
 DROP TEMPORARY TABLE IF EXISTS tbl_1;
 DROP TEMPORARY TABLE IF EXISTS tbl;
 
 -- get parent forums list first
 CREATE TEMPORARY TABLE IF NOT EXISTS  tbl_1
 select 	
		b.ForumID,
		b.ParentID		
	from 
		{databaseName}.{objectQualifier}Category a  
		join {databaseName}.{objectQualifier}Forum b  on b.CategoryID=a.CategoryID
		join {databaseName}.{objectQualifier}ActiveAccess x  on x.ForumID=b.ForumID	
	where 
		a.BoardID = i_BoardID and
		((b.Flags & 2)=0 or x.ReadAccess<>0) and
		(i_CategoryID is null or a.CategoryID=i_CategoryID) and
		((i_ParentID is null and b.ParentID is null) or b.ParentID=i_ParentID) and
		x.UserID = i_BoardID
	order by
		a.SortOrder,
		b.SortOrder;
-- child forums
CREATE TEMPORARY TABLE IF NOT EXISTS  tbl
select 	
		b.ForumID,
		b.ParentID		
	from 
		{databaseName}.{objectQualifier}Category a  
		join {databaseName}.{objectQualifier}Forum b   on b.CategoryID=a.CategoryID
		join {databaseName}.{objectQualifier}ActiveAccess x   on x.ForumID=b.ForumID		
	where 
		a.BoardID = i_BoardID and
		((b.Flags & 2)=0 or x.ReadAccess<>0) and
		(i_CategoryID is null or a.CategoryID=i_CategoryID) and
		(b.ParentID IN (SELECT ForumID FROM tbl_1)) and
		x.UserID = i_UserID
	order by
		a.SortOrder,
		b.SortOrder;

 insert into tbl(ForumID,ParentID)
 select * FROM tbl_1;
 -- more childrens can be added to display as a tree


   CREATE TEMPORARY TABLE IF NOT EXISTS  tmp_flr
 	SELECT 
 		a.CategoryID, 
 		a.Name AS Category, 
 		b.ForumID AS ForumID,
 		b.Name AS Forum, 
 		b.Description,
		b.ImageURL AS ImageUrl,
		b.Styles, 
		b.ParentID,
		b.PollGroupID,          
 		b.Flags,
    (SELECT CAST(COUNT(a1.SessionID)AS UNSIGNED)  FROM {databaseName}.{objectQualifier}Active a1 
    JOIN {databaseName}.{objectQualifier}User usr 
    ON a1.UserID = usr.UserID     
    WHERE a1.ForumID=b.ForumID    
    AND SIGN(usr.Flags & 16) = 0)  AS Viewing,   
 		b.RemoteURL, 		
 		{databaseName}.{objectQualifier}forum_topics(b.ForumID) AS Topics,
 		{databaseName}.{objectQualifier}forum_posts(b.ForumID) AS Posts, 				
 		CAST(x.ReadAccess AS signed) AS ReadAccess,
 		b.LastTopicID AS LTID,
 		b.LastPosted AS LP,
 		{databaseName}.{objectQualifier}forum_lasttopic(b.ForumID,i_UserID,b.LastTopicID,b.LastPosted) AS LastTopicID,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=b.ForumID AND x.UserID = i_UserID limit 1)
		     else null	 end) AS LastForumAccess
 		/* {databaseName}.{objectQualifier}forum_lasttopic(b.ForumID,i_UserID,b.LastTopicID,b.LastPosted) AS LastTopicID,
 		(SELECT t.LastPosted  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1) AS LastPosted, 
 	     (SELECT t.LastMessageID  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1) AS LastMessageID,
 	     (SELECT t.LastUserID  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE   t.TopicID=LastTopicID LIMIT 1) AS LastUserID, 	 
 	    (SELECT t.Topic  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE   t.TopicID=LastTopicID LIMIT 1) AS LastTopicName,
 	    COALESCE((SELECT t.LastUserName FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1),(SELECT u2.Name
             FROM   {databaseName}.{objectQualifier}User u2
             WHERE  u2.UserID = b.LastUserID LIMIT 1)) AS LastUser */
 	FROM 
 		{databaseName}.{objectQualifier}Category a
 		JOIN {databaseName}.{objectQualifier}Forum b 
		ON b.CategoryID=a.CategoryID 
		JOIN {databaseName}.{objectQualifier}ActiveAccess x 
		ON x.ForumID=b.ForumID

 	WHERE 
	 	a.BoardID = i_BoardID and
		((b.Flags & 2)=0 or x.ReadAccess<>0) and 
 		a.BoardID = i_BoardID
 		AND
 		(i_CategoryID IS NULL OR a.CategoryID=i_CategoryID) AND 				
		(b.ForumID IN (SELECT ForumID FROM tbl) ) and
		x.UserID = i_UserID
 	ORDER BY
 		a.SortOrder,
 		b.SortOrder;
 		
 		SELECT tf.*, 		
 		t.LastPosted AS LastPosted,
 		t.LastMessageID AS LastMessageID,
		t.LastMessageFlags,
		t.TopicMovedID,
 		t.LastUserID AS LastUserID,
 		t.Topic AS LastTopicName,
		t.Status AS LastTopicStatus, 
			(case(i_StyledNicks)
			when 1 then  {databaseName}.{objectQualifier}get_userstyle(t.LastUserID)  
			else ''	 end)  AS 	Style,		
 		COALESCE(t.LastUserName,(SELECT u2.Name
             FROM   {databaseName}.{objectQualifier}User u2
             WHERE  u2.UserID = t.LastUserID LIMIT 1)) AS LastUser,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=t.TopicID AND y.UserID = i_UserID limit 1)
		     else null	end) AS  LastTopicAccess    
 		 FROM tmp_flr tf 
 		 LEFT JOIN {databaseName}.{objectQualifier}Topic t 
 		 ON t.TopicID = tf.LastTopicID;

 		 DROP TEMPORARY TABLE IF EXISTS tmp_flr;
		 DROP TEMPORARY TABLE IF EXISTS tbl_1;
		 DROP TEMPORARY TABLE IF EXISTS tbl;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_listread_old(i_BoardID INT,i_UserID INT,i_CategoryID INT,i_ParentID INT, i_StyledNicks TINYINT(1)) 
 BEGIN
 	SELECT 
 		a.CategoryID, 
 		a.Name AS Category, 
 		b.ForumID AS ForumID,
 		b.Name AS Forum, 
 		b.Description,
		b.ImageURL AS ImageUrl,
		b.Styles, 
		b.PollGroupID,          
 		b.Flags,
    (SELECT CAST(COUNT(a1.SessionID)AS UNSIGNED)  FROM {databaseName}.{objectQualifier}Active a1 
    JOIN {databaseName}.{objectQualifier}User usr 
    ON a1.UserID = usr.UserID     
    WHERE a1.ForumID=b.ForumID    
    AND SIGN(usr.Flags & 16) = 0)  AS Viewing,   
 		b.RemoteURL, 		
 		{databaseName}.{objectQualifier}forum_topics(b.ForumID) AS Topics,
 		{databaseName}.{objectQualifier}forum_posts(b.ForumID) AS Posts, 			
 		{databaseName}.{objectQualifier}vaccess_s_readaccess_combo(i_UserID,b.ForumID) AS ReadAccess, 
 	 	{databaseName}.{objectQualifier}forum_lasttopic(b.ForumID,i_UserID,b.LastTopicID,b.LastPosted) AS LastTopicID,
 		(SELECT t.LastPosted  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1) AS LastPosted, 
 	     (SELECT t.LastMessageID  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1) AS LastMessageID,
 	     (SELECT t.LastUserID  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE   t.TopicID=LastTopicID LIMIT 1) AS LastUserID, 	 
 	    (SELECT t.Topic  FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE   t.TopicID=LastTopicID LIMIT 1) AS LastTopicName,
 	    COALESCE((SELECT t.LastUserName FROM 
 		{databaseName}.{objectQualifier}Topic t
 		WHERE  t.TopicID=LastTopicID LIMIT 1),(SELECT u2.Name
             FROM   {databaseName}.{objectQualifier}User u2
             WHERE  u2.UserID = b.LastUserID LIMIT 1)) AS LastUser
 	FROM 
 		{databaseName}.{objectQualifier}Category a
 		JOIN {databaseName}.{objectQualifier}Forum b on b.CategoryID=a.CategoryID 
 		
 	/*LEFT OUTER JOIN {databaseName}.{objectQualifier}Topic t 
    ON t.TopicID ={databaseName}.{objectQualifier}forum_lasttopic(b.ForumID,i_UserID,b.LastTopicID,b.LastPosted)*/
 	WHERE  	  
 		a.BoardID = i_BoardID 		
 		/*AND b.Flags & 2 = 0 */
 		AND
 		(i_CategoryID IS NULL OR a.CategoryID=i_CategoryID) AND
 		((i_ParentID IS NULL AND b.ParentID IS NULL) 
                OR b.ParentID=i_ParentID)
 	ORDER BY
 		a.SortOrder,
 		b.SortOrder;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_listSubForums(i_ForumID INT)
BEGIN
SELECT SUM(1) FROM {databaseName}.{objectQualifier}Forum WHERE ParentID = i_ForumID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_listtopics(i_ForumID INT) 
BEGIN
SELECT * from {databaseName}.{objectQualifier}TopicSelectView
WHERE ForumID = i_ForumID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_moderatelist(i_BoardID INT,i_UserID INT) 
 BEGIN
 
 SELECT
 		b.*,
 		(SELECT     COUNT({databaseName}.{objectQualifier}Message.MessageID)
 		FROM         {databaseName}.{objectQualifier}Message 
                INNER JOIN  {databaseName}.{objectQualifier}Topic 
                ON {databaseName}.{objectQualifier}Message.TopicID ={databaseName}.{objectQualifier}Topic.TopicID
 		WHERE (({databaseName}.{objectQualifier}Message.Flags & 16)=0) 
 		and (({databaseName}.{objectQualifier}Message.Flags & 8)=0) 
 		AND (({databaseName}.{objectQualifier}Topic.Flags & 8) = 0) 
 		AND ({databaseName}.{objectQualifier}Topic.ForumID=b.ForumID)) AS MessageCount,
 		(SELECT     count({databaseName}.{objectQualifier}Message.MessageID)
 		FROM         {databaseName}.{objectQualifier}Message 
                INNER JOIN   {databaseName}.{objectQualifier}Topic 
                ON {databaseName}.{objectQualifier}Message.TopicID = {databaseName}.{objectQualifier}Topic.TopicID
 		WHERE (({databaseName}.{objectQualifier}Message.Flags & 128)=128) 
                AND (({databaseName}.{objectQualifier}Message.Flags & 8)=0) 
                AND (({databaseName}.{objectQualifier}Topic.Flags & 8) = 0) 
                AND ({databaseName}.{objectQualifier}Topic.ForumID=b.ForumID)) AS ReportedCount
 	        FROM
 		{databaseName}.{objectQualifier}Category a 
 	        JOIN {databaseName}.{objectQualifier}Forum b ON b.CategoryID=a.CategoryID
 	        JOIN {databaseName}.{objectQualifier}ActiveAccess c ON c.ForumID=b.ForumID
 	        WHERE
 		a.BoardID=i_BoardID AND
 		c.ModeratorAccess> 0
 		AND
 		c.UserID=i_UserID
 	        ORDER BY
 		a.SortOrder,
 		b.SortOrder;
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_moderators(i_StyledNicks TINYINT(1)) 
 BEGIN
 DECLARE bf0 TINYINT(1) DEFAULT 0;
 DECLARE bf1 TINYINT(1) DEFAULT 1;
 	SELECT
 		CAST(a.ForumID AS UNSIGNED) AS ForumID, 
 		a.GroupID AS ModeratorID, 
 		b.Name AS ModeratorName,
		'' AS Style,	
 		bf1 AS IsGroup 
 	FROM
 		{databaseName}.{objectQualifier}ForumAccess a
 		INNER JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID = a.GroupID
 		INNER JOIN {databaseName}.{objectQualifier}AccessMask c ON c.AccessMaskID = a.AccessMaskID
 	WHERE
 		(b.Flags & 1)=0 
                 AND
 		(c.Flags & 64)<>0
 	UNION ALL
 	SELECT 
 	    CAST(acc.ForumID AS UNSIGNED) AS ForumID,  		 
 		usr.UserID AS ModeratorID, 
 		usr.Name AS ModeratorName,
		case(i_StyledNicks)
			when 1 then  {databaseName}.{objectQualifier}get_userstyle(usr.UserID)  
			else ''	 end AS Style,	
 		bf0 AS IsGroup
 		 	FROM
 		{databaseName}.{objectQualifier}User usr
 		INNER JOIN (
 			SELECT
 				a.UserID,
 				x.ForumID,
 				max(x.ModeratorAccess) AS ModeratorAccess
 			FROM
 				{databaseName}.{objectQualifier}vaccessfull as x
 				INNER JOIN {databaseName}.{objectQualifier}UserGroup a ON a.UserID=x.UserID
 				INNER JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID=a.GroupID
 			WHERE 
 				x.ModeratorAccess <> 0 AND x.AdminGroup = 0
 			GROUP BY
 				a.UserID,x.ForumID		
 		) acc ON usr.UserID = acc.UserID
		JOIN {databaseName}.{objectQualifier}Rank r
		ON r.RankID = usr.RankID
 	WHERE
 		acc.ModeratorAccess<>0
 	ORDER BY
 		IsGroup desc,
 		ModeratorName asc;
END;
--GO 

 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_moderators_1() 
 BEGIN
 DECLARE bf1 TINYINT(1) DEFAULT 1;
 	SELECT
 		CAST(a.ForumID AS UNSIGNED) AS ForumID, 
 		a.GroupID AS ModeratorID,
		b.Name AS ModeratorName, 		
		'' AS Style, 		
 		bf1 AS IsGroup 
 	FROM
 		{databaseName}.{objectQualifier}ForumAccess a
 		INNER JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID = a.GroupID
 		INNER JOIN {databaseName}.{objectQualifier}AccessMask c ON c.AccessMaskID = a.AccessMaskID
 	WHERE
 		(b.Flags & 1)=0 
                 AND
 		(c.Flags & 64)<>0 	
 	ORDER BY
 		IsGroup desc,
 		ModeratorName asc;
END;
--GO
 CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_moderators_2(i_StyledNicks TINYINT(1)) 
 BEGIN
 DECLARE bf0 TINYINT(1) DEFAULT 0; 
SELECT DISTINCT
CAST(r.ForumID AS UNSIGNED) AS ForumID,
r.UserID as ModeratorID,
(SELECT Name FROM  {databaseName}.{objectQualifier}User u WHERE u.UserID=r.UserID) AS ModeratorName,
case(i_StyledNicks)
			when 1 then  {databaseName}.{objectQualifier}get_userstyle(r.UserID)  
			else ''	 end AS Style,
bf0 AS IsGroup
FROM (SELECT * FROM (SELECT 
ForumID,UserID,ModeratorAccess 
FROM
 {databaseName}.{objectQualifier}vaccessfull1  
 WHERE ModeratorAccess<>0 AND AdminGroup = 0) AS t1
UNION
SELECT * FROM (SELECT 
ForumID,UserID,ModeratorAccess
FROM
 {databaseName}.{objectQualifier}vaccessfull2  
  WHERE ModeratorAccess<>0 AND AdminGroup = 0) AS t2
  UNION 
 SELECT * FROM (SELECT 
 ForumID,UserID,ModeratorAccess
 FROM
 {databaseName}.{objectQualifier}vaccessfull3  
  WHERE ModeratorAccess<>0  AND AdminGroup = 0) AS t3  
   ) r ;
END;
 --GO
 create procedure {databaseName}.{objectQualifier}moderators_team_list (i_StyledNicks TINYINT(1)) 
BEGIN
DECLARE falsebool TINYINT(1) DEFAULT 0;
		select
		a.ForumID AS ForumID, 
		e.UserID AS ModeratorID, 
		e.Name AS ModeratorName,	
		(case(i_StyledNicks)
			when 1 then b.Style  
			else ''	 end) AS Style,						
		falsebool AS IsGroup
	from
		{databaseName}.{objectQualifier}ForumAccess a 
		INNER JOIN {databaseName}.{objectQualifier}Group b  ON b.GroupID = a.GroupID
		INNER JOIN {databaseName}.{objectQualifier}AccessMask c  ON c.AccessMaskID = a.AccessMaskID
		INNER JOIN {databaseName}.{objectQualifier}UserGroup d  on d.GroupID=a.GroupID
		INNER JOIN {databaseName}.{objectQualifier}User e  on e.UserID=d.UserID
	where
		(b.Flags & 1)<> 1 and
		(c.Flags & 64)=64;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}forum_resync
 	(i_BoardID INT,i_ForumID INT)

BEGIN

DECLARE  itmpForumID INT;
DECLARE currForums CURSOR FOR
 			SELECT 
 				a.ForumID
 			FROM
 				{databaseName}.{objectQualifier}Forum a
 				JOIN {databaseName}.{objectQualifier}Category b on a.CategoryID=b.CategoryID
 				JOIN {databaseName}.{objectQualifier}Board c on b.BoardID = c.BoardID  
 			WHERE
 				c.BoardID=i_BoardID;

 	IF i_ForumID IS NULL THEN	
 
 		OPEN currForums; 		
 		 /*cycle through forums*/
                BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
      LOOP
                FETCH currForums INTO itmpForumID;  		
 		/*update statistics*/
 			CALL {databaseName}.{objectQualifier}forum_updatestats(itmpForumID);
 			/*update last post*/
 			CALL {databaseName}.{objectQualifier}forum_updatelastpost(itmpForumID);	
  		
                END LOOP;
                END;
 		CLOSE currForums;
 		/*deallocate curForums*/
 	
 	ELSE 		
 		/*update statistics*/
		CALL {databaseName}.{objectQualifier}forum_updatestats(i_ForumID);
 		/*update last post*/
		CALL {databaseName}.{objectQualifier}forum_updatelastpost(i_ForumID);
 	END IF;
END;
--GO


    /* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}forum_save(
 	i_ForumID 		INT,
 	i_CategoryID	INT,
 	i_ParentID		INT,
 	i_Name			VARCHAR(128),
 	i_Description	VARCHAR(255),
 	i_SortOrder		SMALLINT,
 	i_Locked		TINYINT(1),
 	i_Hidden		TINYINT(1),
 	i_IsTest		TINYINT(1),
 	i_Moderated		TINYINT(1),
 	i_RemoteURL		VARCHAR(128),
 	i_ThemeURL		VARCHAR(128),
 	i_ImageURL		VARCHAR(128),
 	i_Styles 		VARCHAR(255),
 	i_AccessMaskID	INT 
 )
BEGIN
 	DECLARE l_BoardID	INT;
 	DECLARE l_Flags		INT;
 	DECLARE l_HasDependency		INT;
 	
 	SET l_Flags = 0;
 	IF i_Locked<>0 THEN SET l_Flags = l_Flags | 1;END IF;
 	IF i_Hidden<>0 THEN SET l_Flags = l_Flags | 2;END IF;
 	IF i_IsTest<>0 THEN SET l_Flags = l_Flags | 4;END IF;
 	IF i_Moderated<>0 THEN SET l_Flags = l_Flags | 8;END IF;

  IF i_ForumID IS NOT NULL AND i_ForumID>0 THEN
  
  IF i_ForumID IS NOT NULL AND i_ParentID>0 THEN
  SET l_HasDependency = {databaseName}.{objectQualifier}forum_save_parentschecker(i_ForumID,i_ParentID);
  END IF;
 
  IF  (l_HasDependency <=0 OR l_HasDependency IS NULL)  THEN
  UPDATE {databaseName}.{objectQualifier}Forum
  SET
  ParentID=(CASE WHEN(i_ParentID = 0) THEN NULL ELSE i_ParentID END),
  `Name`= CONVERT(i_Name USING {databaseEncoding}),
  `Description`=CONVERT(i_Description USING {databaseEncoding}),
  SortOrder=i_SortOrder,
  CategoryID=i_CategoryID,
  RemoteURL = i_RemoteURL,
  ThemeURL = i_ThemeURL,
  ImageURL = i_ImageURL,
  Styles = i_Styles,
  Flags = l_Flags
  WHERE ForumID=i_ForumID;
  END IF;
  ELSE
  INSERT INTO {databaseName}.{objectQualifier}Forum(ParentID,`Name`,Description,SortOrder,CategoryID,NumTopics,NumPosts,RemoteURL,ThemeURL,ImageURL,Styles,Flags)
  VALUES((CASE WHEN(i_ParentID = 0) THEN NULL ELSE i_ParentID END),CONVERT(i_Name USING {databaseEncoding}),CONVERT(i_Description USING {databaseEncoding}),i_SortOrder,i_CategoryID,0,0,i_RemoteURL,i_ThemeURL,i_ImageURL,i_Styles,l_Flags);
  SET i_ForumID = LAST_INSERT_ID();
  SET l_BoardID = (SELECT BoardID  
  from {databaseName}.{objectQualifier}Category
  WHERE CategoryID=i_CategoryID LIMIT 1);
  INSERT INTO {databaseName}.{objectQualifier}ForumAccess(GroupID,ForumID,AccessMaskID)
  SELECT GroupID,i_ForumID,i_AccessMaskID
  FROM {databaseName}.{objectQualifier}Group
  WHERE BoardID = l_BoardID;
  END IF;
  SELECT i_ForumID AS ForumID;
  END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forum_updatelastpost(i_ForumID INT)
BEGIN
DECLARE ici_ParentID         INT;
DECLARE ici_tmpParent        INT;
DECLARE ici_LastPosted       DATETIME;
DECLARE ici_tmpMaxPosted3    DATETIME DEFAULT NULL;

DECLARE ici_LastTopicID      INT;
DECLARE ici_LastMessageID    INT;
DECLARE ici_LastUserID       INT;
DECLARE ici_LastUserName     VARCHAR(128);

DECLARE ici_LastPostedTmp    DATETIME;
DECLARE ici_LastTopicIDTmp   INT;
DECLARE ici_LastMessageIDTmp INT;
DECLARE ici_LastUserIDTmp    INT;
DECLARE ici_LastUserNameTmp  VARCHAR(128);

DECLARE ici_MaxTPosted       DATETIME;

SELECT z.ParentID
INTO ici_ParentID
FROM {databaseName}.{objectQualifier}Forum z
WHERE z.ForumID = i_ForumID;

/*SELECT DISTINCTROW LastPosted,
TopicID,
LastMessageID,
LastUserID,
LastUserName
INTO ici_LastPosted,ici_LastTopicID,ici_LastMessageID,ici_LastUserID,ici_LastUserName
from {databaseName}.{objectQualifier}Topic
WHERE ForumID =i_ForumID ORDER BY LastPosted DESC LIMIT 1;

IF ici_LastTopicID IS NULL THEN*/
SELECT y.Posted,y.TopicID,y.MessageID,y.UserID,y.UserName
INTO ici_LastPosted,ici_LastTopicID,ici_LastMessageID,ici_LastUserID,ici_LastUserName
FROM
{databaseName}.{objectQualifier}Forum z
JOIN {databaseName}.{objectQualifier}TopicSelectView x ON z.ForumID=x.ForumID 
JOIN {databaseName}.{objectQualifier}Message y ON y.TopicID=x.TopicID
WHERE x.ForumID = i_ForumID
AND (y.Flags & 24)=16
AND x.IsDeleted = 0
ORDER BY y.Posted DESC LIMIT 1;
/*END IF; Look for it in children*/

SELECT LastPosted,
LastTopicID,
LastMessageID,
LastUserID,
LastUserName
INTO 

ici_LastPostedTmp,ici_LastTopicIDTmp,ici_LastMessageIDTmp,ici_LastUserIDTmp,ici_LastUserNameTmp
from {databaseName}.{objectQualifier}Forum
WHERE ParentID =i_ForumID ORDER BY LastPosted DESC LIMIT 1;
-- END IF; 
IF ici_LastPostedTmp IS NOT NULL AND ici_LastPosted IS NOT NULL THEN
IF TIMESTAMPDIFF(SECOND,IFNULL(ici_LastPostedTmp,'1001-01-01'),IFNULL(ici_LastPosted,'1001-01-01')) THEN

SET ici_LastPosted=ici_LastPostedTmp;
SET ici_LastTopicID=ici_LastTopicIDTmp;
SET ici_LastMessageID=ici_LastMessageIDTmp;
SET ici_LastUserID=ici_LastUserIDTmp;
SET ici_LastUserName=ici_LastUserNameTmp;

END IF;
END IF;

IF ici_LastPostedTmp IS NOT NULL AND ici_LastPosted IS NULL THEN

SET ici_LastPosted=ici_LastPostedTmp;
SET ici_LastTopicID=ici_LastTopicIDTmp;
SET ici_LastMessageID=ici_LastMessageIDTmp;
SET ici_LastUserID=ici_LastUserIDTmp;
SET ici_LastUserName=ici_LastUserNameTmp;

END IF;


IF (ici_LastTopicID IS NOT NULL AND ici_LastPostedTmp IS NOT NULL AND (UNIX_TIMESTAMP(ici_LastPostedTmp) <= UNIX_TIMESTAMP(ici_LastPosted))) OR (ici_LastTopicID IS NOT NULL AND 

ici_LastPostedTmp IS NULL) THEN

UPDATE {databaseName}.{objectQualifier}Forum
   SET
        LastPosted = ici_LastPosted,
				LastTopicID = ici_LastTopicID,
				LastMessageID = ici_LastMessageID,
				LastUserID = ici_LastUserID,
				LastUserName = ici_LastUserName
 WHERE ForumID = i_ForumID;

END IF;

 CALL {databaseName}.{objectQualifier}forum_updatestats(i_ForumID);



--   max value  in the current forum we compare with its peers to use in parent

IF ici_ParentID >0  THEN

 	 -- CALL {databaseName}.{objectQualifier}forum_updatestats(i_ForumID);

/* In peers to use in parent*/
SET ici_tmpMaxPosted3 =
(SELECT MAX(LastPosted)
FROM {databaseName}.{objectQualifier}Forum
WHERE ParentID = ici_ParentID
AND ForumID != i_ForumID AND LastPosted IS NOT NULL ORDER BY LastPosted DESC LIMIT 1);


IF ici_tmpMaxPosted3 IS NOT NULL AND ici_LastPosted IS NULL THEN
SET  ici_MaxTPosted = ici_tmpMaxPosted3; END IF;

IF
(ici_tmpMaxPosted3 IS NULL AND ici_LastPosted IS NOT NULL)
OR ((ici_tmpMaxPosted3 IS NOT NULL AND ici_LastPosted IS NOT NULL)
AND (UNIX_TIMESTAMP(ici_tmpMaxPosted3) <= UNIX_TIMESTAMP(ici_LastPosted))) THEN
SET ici_MaxTPosted = ici_LastPosted; END IF;

IF ici_tmpMaxPosted3 IS NOT NULL
AND ici_LastPosted IS NOT NULL
AND UNIX_TIMESTAMP(ici_tmpMaxPosted3) > UNIX_TIMESTAMP(ici_LastPosted) THEN
SET ici_MaxTPosted = ici_tmpMaxPosted3; END IF;

SET ici_tmpMaxPosted3 = NULL;

/* In parent themes
SELECT DISTINCTROW LastPosted
INTO ici_tmpMaxPosted3
FROM {databaseName}.{objectQualifier}Topic
WHERE ForumID=ici_ParentID ORDER BY LastPosted LIMIT 1;


IF ici_tmpMaxPosted3 IS NOT NULL AND ici_MaxTPosted IS NULL THEN
SET ici_MaxTPosted = ici_tmpMaxPosted3;
END IF;

IF ici_tmpMaxPosted3 IS NOT NULL
AND ici_LastPosted IS NOT NULL
AND UNIX_TIMESTAMP(ici_tmpMaxPosted3) > UNIX_TIMESTAMP(ici_MaxTPosted) THEN
SET ici_MaxTPosted = ici_tmpMaxPosted3;
END IF; */

IF ici_MaxTPosted IS NOT NULL THEN
SELECT  LastPosted,
LastTopicID,
LastMessageID,
LastUserID,
LastUserName
INTO ici_LastPosted,ici_LastTopicID,ici_LastMessageID,ici_LastUserID,ici_LastUserName
FROM {databaseName}.{objectQualifier}Forum
WHERE LastPosted =ici_MaxTPosted ORDER BY LastPosted DESC LIMIT 1;



 	  UPDATE {databaseName}.{objectQualifier}Forum
          SET
        LastPosted = ici_LastPosted,
				LastTopicID = ici_LastTopicID,
				LastMessageID = ici_LastMessageID,
				LastUserID = ici_LastUserID,
				LastUserName = ici_LastUserName                   
 	  WHERE ForumID = ici_ParentID;
END IF;
CALL {databaseName}.{objectQualifier}forum_updatestats(ici_ParentID);



SELECT  ParentID INTO  ici_tmpParent 
  FROM  {databaseName}.{objectQualifier}Forum
  WHERE ForumID = ici_ParentID LIMIT 1;


 -- Here we set new values in parents

WHILE ici_tmpParent  > 0 DO
IF ici_tmpParent > 0 THEN
SET ici_MaxTPosted =
(SELECT MAX(LastPosted)
FROM {databaseName}.{objectQualifier}Forum
WHERE ParentID = ici_tmpParent
AND LastPosted IS NOT NULL
ORDER BY LastPosted DESC LIMIT 1);
IF ici_MaxTPosted IS NOT NULL THEN
SELECT  LastPosted,
LastTopicID,
LastMessageID,
LastUserID,
LastUserName
INTO ici_LastPosted,
ici_LastTopicID,
ici_LastMessageID,
ici_LastUserID,
ici_LastUserName
FROM {databaseName}.{objectQualifier}Forum
WHERE LastPosted =ici_MaxTPosted ORDER BY LastPosted DESC LIMIT 1;
END IF;

   		UPDATE {databaseName}.{objectQualifier}Forum SET
				LastPosted = ici_LastPosted,
				LastTopicID = ici_LastTopicID,
				LastMessageID = ici_LastMessageID,
				LastUserID = ici_LastUserID,
				LastUserName = ici_LastUserName
			WHERE
				ForumID = ici_tmpParent
        AND ((UNIX_TIMESTAMP(LastPosted) <= UNIX_TIMESTAMP(ici_LastPosted))
        OR LastPosted IS NULL);
        CALL {databaseName}.{objectQualifier}forum_updatestats(ici_tmpParent);
 END IF;
         SELECT  ParentID INTO  ici_tmpParent
  FROM  {databaseName}.{objectQualifier}Forum
  WHERE ForumID = ici_tmpParent LIMIT 1;

  END WHILE;

  END IF;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM forum_updatelastpost */
CREATE  PROCEDURE {databaseName}.{objectQualifier}forum_updatestats(i_ForumID INT)
BEGIN
        UPDATE {databaseName}.{objectQualifier}Forum 
           SET 
 		NumPosts = (SELECT COUNT(1) FROM {databaseName}.{objectQualifier}MessageSelectView x 
                               JOIN {databaseName}.{objectQualifier}TopicSelectView y 
                                  ON y.TopicID=x.TopicID 
                                   WHERE y.ForumID = i_ForumID 
                                     AND x.IsApproved = 1 
                                       AND x.IsDeleted = 0 
                                         AND y.IsDeleted = 0 ),
 		NumTopics = (SELECT COUNT(distinct x.TopicID) FROM {databaseName}.{objectQualifier}TopicSelectView x 
                               JOIN {databaseName}.{objectQualifier}MessageSelectView y 
                                  ON y.TopicID=x.TopicID 
                                   WHERE x.ForumID = i_ForumID 
                                     AND y.IsApproved = 1 
                                         AND y.IsDeleted = 0 
                                           AND x.IsDeleted = 0)
 	WHERE ForumID=i_ForumID;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}forumaccess_group(i_GroupID INT) 
 BEGIN
 	SELECT 
 		 a.*,
         b.Name AS ForumName,
         c.Name AS CategoryName,
 		 b.CategoryID AS CategoryID,
 		 b.ParentID AS ParentID,
 		 brd.Name  AS BoardName
 	FROM 
 		{databaseName}.{objectQualifier}ForumAccess a
 		INNER JOIN {databaseName}.{objectQualifier}Forum b on b.ForumID=a.ForumID
 		INNER JOIN {databaseName}.{objectQualifier}Category c on c.CategoryID=b.CategoryID
 		INNER JOIN {databaseName}.{objectQualifier}Board brd on brd.BoardID=c.BoardID	
 	WHERE 
 		a.GroupID = i_GroupID
 	ORDER BY 
 	    brd.Name,
 		c.SortOrder,
 		b.SortOrder;
 END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}forumaccess_list(
                i_ForumID INT)
BEGIN
        SELECT a.*,
               b.Name AS GroupName
        FROM   {databaseName}.{objectQualifier}ForumAccess a
               INNER JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID=a.GroupID
        WHERE  a.ForumID = i_ForumID;      
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}forumaccess_save(
                i_ForumID      INT,
                i_GroupID      INT,
                i_AccessMaskID INT)
BEGIN
        UPDATE {databaseName}.{objectQualifier}ForumAccess
        SET    AccessMaskID = i_AccessMaskID
        WHERE  ForumID = i_ForumID
        AND GroupID = i_GroupID;
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
        CREATE  PROCEDURE {databaseName}.{objectQualifier}group_delete(
        i_GroupID INT)
        BEGIN
        DELETE FROM {databaseName}.{objectQualifier}ForumAccess
        WHERE       GroupID = i_GroupID;
        DELETE FROM {databaseName}.{objectQualifier}UserGroup
        WHERE       GroupID = i_GroupID;
        DELETE FROM {databaseName}.{objectQualifier}Group
        WHERE       GroupID = i_GroupID;
        END;

--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
        CREATE  PROCEDURE {databaseName}.{objectQualifier}group_list(
        i_BoardID INT,
        i_GroupID INT)
        BEGIN

        IF i_GroupID IS NULL THEN
        SELECT *
        FROM   {databaseName}.{objectQualifier}Group
        WHERE  BoardID = i_BoardID  order by SortOrder;
        ELSE
        SELECT *
        FROM   {databaseName}.{objectQualifier}Group
        WHERE  BoardID = i_BoardID
        AND GroupID = i_GroupID AND Flags & 2 = 2;
        END IF;
        END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE
 {databaseName}.{objectQualifier}group_medal_delete
 	(i_GroupID INT,
	i_MedalID  INT)
 BEGIN
 
 	DELETE FROM {databaseName}.{objectQualifier}GroupMedal WHERE `GroupID`=i_GroupID AND `MedalID`=i_MedalID;
 
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}group_medal_list
 	(i_GroupID INT,
 	i_MedalID  INT)
 BEGIN
 
 	SELECT 
 		a.MedalID,
 		a.Name,
 		a.MedalURL,
 		a.RibbonURL,
 		a.SmallMedalURL,
 		a.SmallRibbonURL,
 		a.SmallMedalWidth,
 		a.SmallMedalHeight,
 		a.SmallRibbonWidth,
 		a.SmallRibbonHeight,
 		b.SortOrder,
 		a.Flags,
 		c.Name AS GroupName,
 		b.GroupID,
 		IFNULL(b.`Message`,a.`Message`) AS `Message`,
 		b.`Message` AS `MessageEx`,
 		b.`Hide`,
 		b.`OnlyRibbon`,
 		b.`SortOrder` AS CurrentSortOrder
 	FROM
 		{databaseName}.{objectQualifier}Medal a
 		INNER JOIN {databaseName}.{objectQualifier}GroupMedal b ON b.`MedalID` = a.`MedalID`
 		INNER JOIN {databaseName}.{objectQualifier}Group c ON  c.`GroupID` = b.`GroupID`
 	WHERE
 		(i_GroupID IS NULL OR b.`GroupID` = i_GroupID) AND
 		(i_MedalID IS NULL OR b.`MedalID` = i_MedalID)		
 	ORDER BY
 		c.`Name` ASC,
 		b.`SortOrder` ASC;
 
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}group_medal_save
    (i_GroupID   INT,
    i_MedalID    INT,
    i_Message    VARCHAR(128),
    i_Hide       TINYINT(1),
    i_OnlyRibbon TINYINT(1),
    i_SortOrder  TINYINT(3))
 BEGIN
 
 	IF EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}GroupMedal WHERE `GroupID`=i_GroupID AND `MedalID`=i_MedalID) THEN
 		UPDATE {databaseName}.{objectQualifier}GroupMedal
 		SET
 			Message = i_Message,
 			Hide = i_Hide,
 			OnlyRibbon = i_OnlyRibbon,
 			SortOrder = i_SortOrder
 		WHERE
 			GroupID=i_GroupID and 
 			MedalID=i_MedalID;
 	
 	ELSE
 
 		INSERT INTO {databaseName}.{objectQualifier}GroupMedal
 			(`GroupID`,`MedalID`,`Message`,`Hide`,`OnlyRibbon`,`SortOrder`)
 		VALUES
 			(i_GroupID,i_MedalID,i_Message,i_Hide,i_OnlyRibbon,i_SortOrder);
 	END IF;
 
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
        CREATE  PROCEDURE {databaseName}.{objectQualifier}group_member(
        i_BoardID INT,
        i_UserID  INT)
        BEGIN
        SELECT   a.GroupID,
        a.Name,
        (SELECT COUNT(1)
        FROM   {databaseName}.{objectQualifier}UserGroup x
        WHERE  x.UserID = i_UserID
        AND x.GroupID = a.GroupID) AS Member
        FROM     {databaseName}.{objectQualifier}Group a
        WHERE    a.BoardID = i_BoardID AND a.Name !='Guests'
        ORDER BY a.Name;
        END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */ 
        CREATE  PROCEDURE {databaseName}.{objectQualifier}group_save(
        i_GroupID      INT,
        i_BoardID      INT,
        i_Name         VARCHAR(128),
        i_IsAdmin      TINYINT(1),
        i_IsGuest      TINYINT(1),
        i_IsStart      TINYINT(1),
        i_IsModerator  TINYINT(1),
        i_AccessMaskID INT,
        i_PMLimit INT,
        i_Style VARCHAR(255),
        i_SortOrder SMALLINT,        
	    i_Description VARCHAR(255),
	    i_UsrSigChars INT,
	    i_UsrSigBBCodes	VARCHAR(255),
	    i_UsrSigHTMLTags VARCHAR(255),
	    i_UsrAlbums INT,
	    i_UsrAlbumImages INT)
        BEGIN

        DECLARE  iciFlags INT;
        SET iciFlags = 0;
        IF i_IsAdmin <> 0 THEN
        SET iciFlags = iciFlags | 1 ; END IF;
        IF i_IsGuest <> 0 THEN
        SET iciFlags = iciFlags | 2; END IF;
        IF i_IsStart <> 0 THEN
        SET iciFlags = iciFlags | 4; END IF;
        IF i_IsModerator <> 0 THEN
        SET iciFlags = iciFlags | 8; END IF;
        IF i_GroupID > 0 THEN        
            UPDATE {databaseName}.{objectQualifier}Group
            SET `Name` = i_Name,
                 Flags = iciFlags,
 			     PMLimit = i_PMLimit,
 			     Style = i_Style,
 			     SortOrder = i_SortOrder, 			
			     Description = i_Description,
		         UsrSigChars = i_UsrSigChars,
			     UsrSigBBCodes = i_UsrSigBBCodes,
			     UsrSigHTMLTags = i_UsrSigHTMLTags,
			     UsrAlbums = i_UsrAlbums,
			     UsrAlbumImages = i_UsrAlbumImages 
            WHERE  GroupID = i_GroupID;        
        ELSE        
            INSERT INTO {databaseName}.{objectQualifier}Group
                       (`Name`,
                        BoardID,
                        Flags,
                        PMLimit,
                        Style,
                        SortOrder,
                        Description,
                        UsrSigChars,
                        UsrSigBBCodes,
                        UsrSigHTMLTags,
                        UsrAlbums,
                        UsrAlbumImages)
            VALUES     (i_Name,
                        i_BoardID,
                        iciFlags,
                        i_PMLimit,
                        i_Style,
                        i_SortOrder,
                        i_Description,
                        i_UsrSigChars,
                        i_UsrSigBBCodes,
                        i_UsrSigHTMLTags,
                        i_UsrAlbums,
                        i_UsrAlbumImages);
            SET i_GroupID = LAST_INSERT_ID();
            INSERT INTO {databaseName}.{objectQualifier}ForumAccess
                       (GroupID,
                        ForumID,
                        AccessMaskID)
            SELECT i_GroupID,
                   a.ForumID,
                   i_AccessMaskID
            FROM   {databaseName}.{objectQualifier}Forum a
                   JOIN {databaseName}.{objectQualifier}Category b
                     ON b.CategoryID = a.CategoryID
            WHERE  b.BoardID = i_BoardID;
         END IF;
        SELECT i_GroupID AS GroupID; 
    END;
--GO

-- to split it it returns columns only with style
CREATE procedure {databaseName}.{objectQualifier}group_rank_style( i_BoardID int) 
begin
SELECT 1 AS LegendID,`Name`,Style,Description,PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages FROM {databaseName}.{objectQualifier}Group
WHERE BoardID = i_BoardID AND Length(Style) > 2   GROUP BY SortOrder,`Name`,Style,Description,PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages
UNION
SELECT 2  AS LegendID,`Name`,Style,Description,PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages FROM {databaseName}.{objectQualifier}Rank
WHERE BoardID = i_BoardID AND Length(Style) > 2 GROUP BY SortOrder,`Name`,Style,Description,PMLimit,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages;
end;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}mail_create
 (
 	i_From     VARCHAR(128),
 	i_FromName VARCHAR(128),
	i_To       VARCHAR(128),
 	i_ToName   VARCHAR(128),
 	i_Subject  VARCHAR(128),
 	i_Body     TEXT,
 	i_BodyHtml TEXT
 )

 BEGIN
 	INSERT INTO {databaseName}.{objectQualifier}Mail
 		(FromUser,FromUserName,ToUser,ToUserName,Created,Subject,Body,BodyHtml)
 	VALUES
 		(i_From,i_FromName,i_To,i_ToName,UTC_TIMESTAMP(),i_Subject,i_Body,i_BodyHtml);	
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 create procedure {databaseName}.{objectQualifier}mail_createwatch
 (
 	i_TopicID   INT,
 	i_FROM      VARCHAR(128),
 	i_FROMName  VARCHAR(128),
 	i_Subject   VARCHAR(128),
 	i_Body      TEXT,
 	i_BodyHtml  TEXT,
 	i_UserID    INT
 )
 BEGIN
 	INSERT INTO {databaseName}.{objectQualifier}Mail(FromUser,FromUserName,ToUser,ToUserName,Created,Subject,Body,BodyHtml)
 	SELECT
 		i_FROM,
 		i_FROMName,
 		b.Email,
 		b.Name,
 		UTC_TIMESTAMP(),
 		i_Subject,
 		i_Body,
 		i_BodyHtml
 	FROM
 		{databaseName}.{objectQualifier}WatchTopic a
 		INNER JOIN {databaseName}.{objectQualifier}User b on b.UserID=a.UserID
 	WHERE
 		b.UserID <> i_UserID AND
		b.NotificationType NOT IN (10, 20) AND		
 		a.TopicID = i_TopicID AND
 		(a.LastMail IS NULL OR UNIX_TIMESTAMP(a.LastMail) < UNIX_TIMESTAMP(b.LastVisit));
 	
 	INSERT INTO {databaseName}.{objectQualifier}Mail(FromUser,FromUserName,ToUser,ToUserName,Created,Subject,Body,BodyHtml)
 	SELECT
 		i_From,
 		i_FromName,
 		b.Email,
 		b.Name,
 		UTC_TIMESTAMP(),
 		i_Subject,
 		i_Body,
 		i_BodyHtml
 	FROM
 		{databaseName}.{objectQualifier}WatchForum a
 		INNER JOIN {databaseName}.{objectQualifier}User b ON b.UserID=a.UserID
 		INNER JOIN {databaseName}.{objectQualifier}Topic c ON c.ForumID=a.ForumID
 	WHERE
 		b.UserID <> i_UserID AND
		b.NotificationType NOT IN (10, 20) AND		
 		c.TopicID = i_TopicID AND
 		(a.LastMail IS NULL OR UNIX_TIMESTAMP(a.LastMail) < UNIX_TIMESTAMP(b.LastVisit)) AND
 		NOT EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}WatchTopic x WHERE x.UserID=b.UserID AND x.TopicID=c.TopicID);
 
 	UPDATE {databaseName}.{objectQualifier}WatchTopic SET LastMail = UTC_TIMESTAMP()
 	WHERE TopicID = i_TopicID
 	AND UserID <> i_UserID;
 	
 	UPDATE {databaseName}.{objectQualifier}WatchForum SET LastMail = UTC_TIMESTAMP()
 	WHERE ForumID = (SELECT ForumID FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID)
 	AND UserID <> i_UserID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}mail_delete(i_MailID INT)
BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}Mail WHERE MailID = i_MailID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}mail_list
(
 	i_ProcessID INT
 )
 BEGIN
 CREATE TEMPORARY TABLE IF NOT EXISTS tmp_table55 SELECT  MailID FROM {databaseName}.{objectQualifier}Mail WHERE SendAttempt < UTC_TIMESTAMP() OR SendAttempt IS NULL ORDER BY SendAttempt desc, Created desc LIMIT 10;
 	UPDATE {databaseName}.{objectQualifier}Mail
 	SET 
 		SendTries = SendTries + 1,
 		SendAttempt = ADDDATE(UTC_TIMESTAMP(), INTERVAL 5 MINUTE),
 		ProcessID = i_ProcessID
 	WHERE
 		MailID IN (SELECT MailID FROM tmp_table55 ORDER BY SendAttempt desc, Created desc);
 
 	/*now select all mail reserved for this process...*/
 	SELECT * FROM {databaseName}.{objectQualifier}Mail WHERE ProcessID = i_ProcessID ORDER BY SendAttempt desc, Created desc LIMIT 10;
           DROP TABLE IF EXISTS tmp_table55;
 END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}medal_delete(i_BoardID	INT,
 	i_MedalID	INT,
 	i_Category	VARCHAR(128))
BEGIN
 
 	IF i_MedalID IS NOT NULL THEN
 		DELETE from {databaseName}.{objectQualifier}GroupMedal WHERE `MedalID` = i_MedalID;
 		DELETE from {databaseName}.{objectQualifier}UserMedal WHERE `MedalID` = i_MedalID; 
 		DELETE from {databaseName}.{objectQualifier}Medal WHERE `MedalID`=i_MedalID;
 	
 	ELSEIF i_Category IS NOT NULL AND i_BoardID IS NOT NULL THEN
 		DELETE from {databaseName}.{objectQualifier}GroupMedal 
 			WHERE `MedalID` in (SELECT `MedalID` FROM {databaseName}.{objectQualifier}Medal WHERE `Category`=i_Category and `BoardID`=i_BoardID);
 
 		DELETE from {databaseName}.{objectQualifier}UserMedal 
 			WHERE `MedalID` in (SELECT `MedalID` FROM {databaseName}.{objectQualifier}Medal WHERE `Category`=i_Category and `BoardID`=i_BoardID);
 
 		DELETE from {databaseName}.{objectQualifier}Medal WHERE `Category`=i_Category;
 	
 	ELSEIF  i_BoardID IS NOT NULL THEN
 		DELETE from {databaseName}.{objectQualifier}GroupMedal 
 			WHERE `MedalID` in (SELECT `MedalID` FROM {databaseName}.{objectQualifier}Medal WHERE `BoardID`=i_BoardID);
 
 		DELETE from {databaseName}.{objectQualifier}UserMedal 
 			WHERE `MedalID` in (SELECT `MedalID` FROM {databaseName}.{objectQualifier}Medal WHERE `BoardID`=i_BoardID);

 		DELETE from {databaseName}.{objectQualifier}Medal WHERE `BoardID`=i_BoardID;
 	END IF;
 
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}medal_list
 	(i_BoardID	INT,
 	i_MedalID	INT,
 	i_Category	VARCHAR(128))
BEGIN
 
 	IF i_MedalID IS NOT NULL THEN
 		SELECT 
 			* 
 		FROM 
 			{databaseName}.{objectQualifier}Medal 
 		WHERE 
 			`MedalID`=i_MedalID 
 		ORDER BY 
 			`Category` ASC, 
 			`SortOrder` ASC;
 	
 	ELSEIF i_Category IS NOT NULL AND  i_BoardID IS NOT NULL THEN
 		SELECT 
 			* 
 		FROM 
 			{databaseName}.{objectQualifier}Medal 
 		WHERE 
 			`Category`=i_Category and `BoardID`=i_BoardID
 		ORDER BY 
 			`Category` ASC, 
 			`SortOrder` ASC;
 	ELSEIF i_BoardID IS NOT NULL THEN
 		SELECT 
 			* 
 		FROM 
 			{databaseName}.{objectQualifier}Medal 
 		WHERE 
 			`BoardID`=i_BoardID
 		ORDER BY 
 			`Category` ASC, 
 			`SortOrder` ASC;
      END IF; 
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}medal_listusers
 	(i_MedalID	INT)
  BEGIN
 
 	(SELECT 
 		a.UserID, a.Name
 	FROM 
 		{databaseName}.{objectQualifier}User a
 		INNER JOIN {databaseName}.{objectQualifier}UserMedal b ON a.`UserID` = b.`UserID`
 	WHERE
 		b.`MedalID`=i_MedalID)
 	UNION	
 
 	(SELECT 
 		a.UserID, a.Name
 	FROM 
 		{databaseName}.{objectQualifier}User a
 		INNER JOIN {databaseName}.{objectQualifier}UserGroup b ON a.`UserID` = b.`UserID`
 		INNER JOIN {databaseName}.{objectQualifier}GroupMedal c ON b.`GroupID` = c.`GroupID`
 	WHERE
 		c.`MedalID`=i_MedalID); 
 
 
END;
 --GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}medal_resort
 	(i_BoardID INT,i_MedalID INT,i_Move INT)

BEGIN
 	DECLARE i_Position INT;
 	DECLARE i_Category VARCHAR(128);
 
 	SELECT 
 		`SortOrder`,
 		`Category`
        INTO i_Position,i_Category
 	FROM 
 		{databaseName}.{objectQualifier}Medal 
 	WHERE 
 		`BoardID`=i_BoardID and `MedalID`=i_MedalID;
 
 	IF (i_Position IS NOT NULL) THEN
 
 	IF (i_Move > 0) THEN
 		UPDATE 
 			{databaseName}.{objectQualifier}Medal
 		SET 
 			`SortOrder`=`SortOrder`-1
 		WHERE 
 			`BoardID`=i_BoardID and 
 			`Category`=i_Category and
 			`SortOrder` between i_Position 
                         AND (i_Position + i_Move) 
                         AND `SortOrder` between 1 and 255; 	
 	ELSEIF (i_Move < 0) THEN
 		UPDATE
 			{databaseName}.{objectQualifier}Medal
 		SET
 			`SortOrder`=`SortOrder`+1
 		WHERE 
 			BoardID=i_BoardID AND 
 			`Category`=i_Category AND
 			`SortOrder` BETWEEN (i_Position+i_Move) AND i_Position AND
 			`SortOrder` BETWEEN 0 and 254;
 	END IF;
 
 	SET i_Position = i_Position + i_Move;
 
 	IF (i_Position>255) THEN SET i_Position = 255;
 	ELSEIF (i_Position<0) THEN 
        SET i_Position = 0; END IF;
 	UPDATE {databaseName}.{objectQualifier}Medal
 		SET `SortOrder`=i_Position
 		WHERE `BoardID`=i_BoardID AND 
 			`MedalID`=i_MedalID;
        END IF;
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}medal_save
 (	i_BoardID INT,
 	i_MedalID INT,
 	i_Name VARCHAR(128),
 	i_Description TEXT,
 	i_Message VARCHAR(128),
 	i_Category VARCHAR(128),
 	i_MedalURL VARCHAR(250),
 	i_RibbonURL VARCHAR(250),
 	i_SmallMedalURL VARCHAR(250),
 	i_SmallRibbonURL VARCHAR(250),
 	i_SmallMedalWidth SMALLINT,
 	i_SmallMedalHeight SMALLINT,
 	i_SmallRibbonWidth SMALLINT,
 	i_SmallRibbonHeight SMALLINT,
 	i_SortOrder TINYINT(3),
 	i_Flags INT)
BEGIN
DECLARE rcount integer;
 
 	IF i_MedalID IS NULL THEN
 		INSERT INTO {databaseName}.{objectQualifier}Medal
 			(`BoardID`,`Name`,`Description`,`Message`,`Category`,
 			`MedalURL`,`RibbonURL`,`SmallMedalURL`,`SmallRibbonURL`,
 			`SmallMedalWidth`,`SmallMedalHeight`,`SmallRibbonWidth`,`SmallRibbonHeight`,
 			`SortOrder`,`Flags`)
 		VALUES
 			(i_BoardID,i_Name,i_Description,i_Message,i_Category,
 			i_MedalURL,i_RibbonURL,i_SmallMedalURL,i_SmallRibbonURL,
 			i_SmallMedalWidth,i_SmallMedalHeight,i_SmallRibbonWidth,i_SmallRibbonHeight,
 			i_SortOrder,i_Flags);
 SET rcount = (SELECT ROW_COUNT());
 		SELECT rcount;

 	
 	ELSE 
 		UPDATE {databaseName}.{objectQualifier}Medal
 			SET `BoardID` = BoardID,
 				`Name` = i_Name,
 				`Description` = i_Description,
 				`Message` = i_Message,
 				`Category` = i_Category,
 				`MedalURL` = i_MedalURL,
 				`RibbonURL` = i_RibbonURL,
 				`SmallMedalURL` = i_SmallMedalURL,
 				`SmallRibbonURL` = i_SmallRibbonURL,
 				`SmallMedalWidth` = i_SmallMedalWidth,
 				`SmallMedalHeight` = i_SmallMedalHeight,
 				`SmallRibbonWidth` = i_SmallRibbonWidth,
 				`SmallRibbonHeight` = i_SmallRibbonHeight,
 				`SortOrder` = i_SortOrder,
 				`Flags` = i_Flags
 		WHERE `MedalID` = i_MedalID; 
 	 SET rcount = (SELECT ROW_COUNT());               
                SELECT rcount;
     END IF;
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_approve(i_MessageID INT) 
BEGIN
 	DECLARE	ici_UserID	INT;
 	DECLARE	ici_ForumID	INT;
 	DECLARE	ici_ParentID	INT;
 	DECLARE	ici_TopicID	INT;
 	DECLARE ici_Posted	DATETIME;
 	DECLARE	ici_UserName	VARCHAR(128);
    DECLARE	ici_NewFlag	INT; 	
 
 	SELECT 
 		 a.UserID,
 		 a.TopicID,
 		 b.ForumID,
 		 a.Posted,
 		 a.UserName,
 		 a.Flags
 		INTO ici_UserID,ici_TopicID,ici_ForumID,ici_Posted,ici_UserName,ici_NewFlag
 	FROM
 		{databaseName}.{objectQualifier}Message a
 		inner join {databaseName}.{objectQualifier}Topic b on b.TopicID=a.TopicID
 	WHERE
 		a.MessageID = i_MessageID;
 
 	/* update Message table, set meesage flag to approved */
 	UPDATE {databaseName}.{objectQualifier}Message 
 	 SET
        Flags = Flags | 16
 	WHERE MessageID = i_MessageID;

 	/*update User table to increase postcount*/
 	IF EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Forum WHERE ForumID=ici_ForumID AND (Flags & 4)=0 LIMIT 1) THEN
 	
 		UPDATE {databaseName}.{objectQualifier}User set NumPosts = NumPosts + 1 where UserID = ici_UserID;
 		/*upgrade user, i.e. promote rank if conditions allow it*/
 		CALL {databaseName}.{objectQualifier}user_upgrade (ici_UserID);
 	
 END IF;
 	/*update Forum table with last topic/post info*/

  SELECT  ParentID INTO  ici_ParentID
  FROM  {databaseName}.{objectQualifier}Forum
  WHERE ForumID = ici_ForumID LIMIT 1;  
 
 	UPDATE {databaseName}.{objectQualifier}Forum set
 		LastPosted = ici_Posted,
 		LastTopicID = ici_TopicID,
 		LastMessageID = i_MessageID,
 		LastUserID = ici_UserID ,
 		LastUserName = ici_UserName
 	WHERE ForumID = ici_ForumID;
 	
 	WHILE ici_ParentID > 0 DO
   		UPDATE {databaseName}.{objectQualifier}Forum SET
				LastPosted = ici_Posted,
				LastTopicID = ici_TopicID,
				LastMessageID = i_MessageID,
				LastUserID = ici_UserID,
				LastUserName = ici_UserName
			WHERE
				ForumID = ici_ParentID
        AND ((UNIX_TIMESTAMP(LastPosted) < UNIX_TIMESTAMP(ici_Posted))
        OR LastPosted IS NULL);         
         SELECT ParentID INTO  ici_ParentID
  FROM  {databaseName}.{objectQualifier}Forum
  WHERE ForumID = ici_ParentID LIMIT 1;  
  END WHILE; 	
  

 
 	/*update Topic table with info about last post in topic*/
 	UPDATE {databaseName}.{objectQualifier}Topic set
 		LastPosted = ici_Posted,
 		LastMessageID = i_MessageID,
		LastMessageFlags = ici_NewFlag | 16,
 		LastUserID = ici_UserID,
 		LastUserName = ici_UserName,		
 		NumPosts = (select count(1) from {databaseName}.{objectQualifier}MessageSelectView x WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
 	WHERE TopicID = ici_TopicID;
 	
 	/*update forum stats*/
 	CALL {databaseName}.{objectQualifier}forum_updatestats (ici_ForumID);
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_delete(i_MessageID INT, i_EraseMessage TINYINT(1)) 
BEGIN
 	DECLARE ici_TopicID		INT;
 	DECLARE ici_ForumID		INT;
    DECLARE ici_ForumID2	INT;
 	DECLARE ici_MessageCount	INT;
 	DECLARE ici_LastMessageID	INT;
 	DECLARE ici_UserID		    INT;

        DECLARE ici_LastTopicID_Check INT;
        DECLARE ici_LastMessageID_Check INT;
          
 	/*Find TopicID and ForumID*/
 	SELECT b.TopicID,b.ForumID 
        INTO ici_TopicID,ici_ForumID
 		FROM 
 			{databaseName}.{objectQualifier}Message a
 			INNER JOIN  {databaseName}.{objectQualifier}Topic b 
 			ON b.TopicID=a.TopicID
 		WHERE
 			a.MessageID=i_MessageID;
 
	/*UPDATE LastMessageID in Topic*/
 	UPDATE {databaseName}.{objectQualifier}Topic SET 
 		LastPosted = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	WHERE LastMessageID = i_MessageID;

 	/*UPDATE LastMessageID in Forum*/
 	UPDATE {databaseName}.{objectQualifier}Forum SET 
 		LastPosted = NULL,
 		LastTopicID = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	WHERE LastMessageID = i_MessageID;
 
 	SET ici_UserID = (SELECT UserID FROM {databaseName}.{objectQualifier}Message WHERE MessageID = i_MessageID);	
 
 	/*should it be physically deleter or not*/
 	IF i_EraseMessage = 1 THEN
 		DELETE FROM {databaseName}.{objectQualifier}Attachment WHERE MessageID = i_MessageID;
 		DELETE FROM {databaseName}.{objectQualifier}MessageReported WHERE MessageID = i_MessageID;
 		DELETE FROM {databaseName}.{objectQualifier}MessageReportedAudit WHERE MessageID = i_MessageID;
 		DELETE FROM {databaseName}.{objectQualifier}MessageHistory WHERE MessageID = i_MessageID;
 		DELETE FROM {databaseName}.{objectQualifier}Thanks where MessageID = i_MessageID;
	
 		DELETE FROM {databaseName}.{objectQualifier}Message WHERE MessageID = i_MessageID; 	
 	ELSE
 		/*"Delete" it only by setting deleted flag message*/
 		UPDATE {databaseName}.{objectQualifier}Message SET Flags = Flags | 8
 		WHERE MessageID = i_MessageID;
 	END IF;
 	
 	/* UPDATE user post count*/
 	UPDATE {databaseName}.{objectQualifier}User SET NumPosts = (SELECT count(MessageID) FROM {databaseName}.{objectQualifier}MessageSelectView WHERE UserID = ici_UserID AND IsDeleted = 0 AND IsApproved = 1) WHERE UserID = ici_UserID;
 	
 	/* Delete topic if there are no more messages*/
 	SELECT COUNT(1) INTO ici_MessageCount FROM {databaseName}.{objectQualifier}Message WHERE TopicID = ici_TopicID AND (Flags & 8)=0;
 	IF ici_MessageCount=0 THEN CALL {databaseName}.{objectQualifier}topic_delete (ici_TopicID, 1, i_EraseMessage); END IF;
 
 	/*UPDATE lastpost*/
 	CALL {databaseName}.{objectQualifier}topic_updatelastpost (ici_ForumID,ici_TopicID);
 	CALL {databaseName}.{objectQualifier}forum_updatelastpost (ici_ForumID);
 	CALL {databaseName}.{objectQualifier}forum_updatestats (ici_ForumID);
 
 	/*UPDATE topic numposts*/
 	UPDATE {databaseName}.{objectQualifier}Topic SET
 		NumPosts = (SELECT COUNT(1) FROM {databaseName}.{objectQualifier}MessageSelectView x WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID and x.IsApproved = 1 and x.IsDeleted = 0)
 	WHERE TopicID = ici_TopicID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_deleteundelete
(i_MessageID INT, 
i_isModeratorChanged TINYINT(1), 
i_DeleteReason VARCHAR(128), 
i_isDeleteAction TINYINT(1)) 
BEGIN
 	DECLARE ici_TopicID		INT;
 	DECLARE ici_ForumID		INT;
    DECLARE ici_ForumID2            INT;
 	DECLARE ici_MessageCount	INT;
 	DECLARE ici_LastMessageID	INT;
 	DECLARE ici_UserID		INT;

        DECLARE ici_LastTopicID_Check   INT;
        DECLARE ici_LastMessageID_Check INT;

 	/*Find TopicID and ForumID*/
 	SELECT b.TopicID,b.ForumID 
        INTO ici_TopicID,ici_ForumID
 	FROM 
 		{databaseName}.{objectQualifier}Message a
 		INNER JOIN {databaseName}.{objectQualifier}Topic b 
 		ON b.TopicID=a.TopicID
 	WHERE 
 		a.MessageID=i_MessageID;
 
 	/*Update LastMessageID in Topic and Forum*/
 	UPDATE {databaseName}.{objectQualifier}Topic SET
 		LastPosted = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	WHERE LastMessageID = i_MessageID;
 
 	UPDATE {databaseName}.{objectQualifier}Forum 
            SET
 		LastPosted = NULL,
 		LastTopicID = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	   WHERE LastMessageID = i_MessageID;
 /*get the userID for this message...*/ 	
 	 SELECT UserID INTO ici_UserID 
 	 FROM {databaseName}.{objectQualifier}Message 
 	 WHERE MessageID = i_MessageID;
 
 	/* "Delete" message*/
     UPDATE {databaseName}.{objectQualifier}Message 
     SET IsModeratorChanged = i_isModeratorChanged 
     WHERE MessageID = i_MessageID 
     AND ((Flags & 8) <> i_isDeleteAction*8);
    UPDATE {databaseName}.{objectQualifier}Message 
    SET DeleteReason = i_DeleteReason 
    WHERE MessageID = i_MessageID 
    AND ((Flags & 8) <> i_isDeleteAction*8);
    UPDATE {databaseName}.{objectQualifier}Message 
    SET Flags = Flags ^ 8 WHERE MessageID =i_MessageID 
    AND ((Flags & 8) <> i_isDeleteAction*8);
     
     /* update num posts for user now that the delete/undelete status has been toggled...*/
     UPDATE {databaseName}.{objectQualifier}User SET NumPosts = (SELECT count(MessageID) FROM {databaseName}.{objectQualifier}MessageSelectView WHERE UserID = ici_UserID AND IsDeleted = 0 AND IsApproved = 1) WHERE UserID = ici_UserID;
 
 	/* Delete topic if there are no more messages*/
 	SELECT COUNT(1) INTO ici_MessageCount FROM {databaseName}.{objectQualifier}Message WHERE TopicID = ici_TopicID AND (Flags & 8)=0;
 	IF ici_MessageCount=0 THEN CALL {databaseName}.{objectQualifier}topic_delete (ici_TopicID,0,0); END IF;
 	/*update lastpost*/
 	CALL {databaseName}.{objectQualifier}topic_updatelastpost (ici_ForumID,ici_TopicID);
 	CALL {databaseName}.{objectQualifier}forum_updatelastpost (ici_ForumID);
 	CALL {databaseName}.{objectQualifier}forum_updatestats (ici_ForumID);
 	/* update topic numposts*/
 	UPDATE {databaseName}.{objectQualifier}Topic set
 		NumPosts = (select count(1) from {databaseName}.{objectQualifier}MessageSelectView x WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID and x.IsApproved = 1 and x.IsDeleted = 0 )
 	WHERE TopicID = ici_TopicID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
        CREATE  PROCEDURE {databaseName}.{objectQualifier}message_findunread(
		 i_TopicID  INT,
		 i_MessageID INT,
		 i_LastRead DATETIME,
		 i_ShowDeleted TINYINT(1),
		 i_AuthorUserID INT
       )
        BEGIN     
		
		 
DECLARE ici_firstmessageid INT;
DROP TABLE IF EXISTS tbl_msglunr ; 
CREATE TEMPORARY table tbl_msglunr 
(
cntrt INT NOT NULL AUTO_INCREMENT,
MessageID int,
TopicID int,
Posted datetime,
Edited datetime,
PRIMARY KEY (`cntrt`)
);
TRUNCATE tbl_msglunr;
-- find first message id
select   
		m.MessageID INTO ici_firstmessageid
	from
		{databaseName}.{objectQualifier}Message m	
	where
		m.TopicID = i_TopicID ORDER BY m.Posted LIMIT 1;


   -- we return last 100 messages ONLY if we look for last unread or lastpost(Messageid = 0)
   if (i_MessageID > 0) THEN   
   -- fill in the table variable with all topic's messages(slow). It's used in cases when we forced to find a particular message. 		
	insert into tbl_msglunr (MessageID,TopicID,Posted,Edited) 
	select  
		m.MessageID,
		m.TopicID,
		m.Posted,
		IFNULL(m.Edited,m.Posted)
	from
		{databaseName}.{objectQualifier}Message m	
	where
		m.TopicID = i_TopicID			
		AND (m.Flags & 16)  = 16
		AND ((m.Flags & 8)  <> 8 OR ((i_ShowDeleted = 1 AND (m.Flags & 8)  = 8) OR (i_AuthorUserID > 0 AND m.UserID = i_AuthorUserID)))
		 AND UNIX_TIMESTAMP(m.Posted) >	 UNIX_TIMESTAMP(i_LastRead)
	order by		
		m.Posted DESC;		
    else	    
	-- fill in the table variable with last 100 values from topic's messages		
	insert into tbl_msglunr (MessageID,TopicID,Posted,Edited) 
	select  
		m.MessageID,
		m.TopicID,
		m.Posted,
		IFNULL(m.Edited,m.Posted)
	from
		{databaseName}.{objectQualifier}Message m	
	where
		m.TopicID = i_TopicID
		-- approved 			
		AND (m.Flags & 16)  = 16
		-- deleted
		AND ((m.Flags & 8)  <> 8 OR ((i_ShowDeleted = 1 AND (m.Flags & 8)  = 8) OR (i_AuthorUserID > 0 AND m.UserID = i_AuthorUserID)))
		AND UNIX_TIMESTAMP(m.Posted) >	UNIX_TIMESTAMP(i_LastRead)
	order by		
		m.Posted DESC LIMIT 100;
	END IF;

	     -- simply return last post if no unread message is found
  if EXISTS (SELECT 1 FROM tbl_msglunr LIMIT 1) THEN  
    -- the messageid was already supplied, find a particular message
    if (i_MessageID > 0) THEN	
	   if EXISTS (SELECT 1 FROM tbl_msglunr WHERE TopicID = i_TopicID and MessageID = i_MessageID LIMIT 1) THEN
	    
	     -- return last unread		
	       select MessageID, cntrt AS MessagePosition, ici_firstmessageid  AS FirstMessageID
		   from tbl_msglunr
	       where TopicID=i_TopicID and  MessageID = i_MessageID LIMIT 1;		
		
	    else
	    
	     -- simply return last post if no unread message is found
	       select  MessageID, 1 AS MessagePosition, ici_firstmessageid  AS FirstMessageID
		   from tbl_msglunr
	       where TopicID=i_TopicID and UNIX_TIMESTAMP(Posted)> UNIX_TIMESTAMP(i_LastRead)
	       order by Posted DESC LIMIT 1;
	    end if;
	
	else	
	   -- simply return last message as no MessageID was supplied 
	   if EXISTS (SELECT 1 FROM tbl_msglunr WHERE Posted > i_LastRead LIMIT 1)	THEN    
	     -- return last unread		
	       select  MessageID, cntrt AS MessagePosition, ici_firstmessageid  AS FirstMessageID
		   from tbl_msglunr
	       where TopicID=i_TopicID and Posted > i_LastRead  
	       order by Posted  ASC LIMIT 1;
		
	    else	    
	       select  MessageID, 1 AS MessagePosition, ici_firstmessageid AS  FirstMessageID
		   from tbl_msglunr
	       where TopicID=i_TopicID
	       order by Posted DESC LIMIT 1; 
	    end	if;	
    end IF;
	else
		select m.MessageID,  1 AS MessagePosition, ici_firstmessageid AS FirstMessageID
	from
		{databaseName}.{objectQualifier}Message m	
	where
		m.TopicID = i_TopicID			
		-- approved 			
		AND (m.Flags & 16)  = 16
		-- deleted
		AND ((m.Flags & 8)  <> 8 OR ((i_ShowDeleted = 1 AND (m.Flags & 8)  = 8) OR (i_AuthorUserID > 0 AND m.UserID = i_AuthorUserID)))
	order by		
		m.Posted DESC LIMIT 1;
end if;
DROP TABLE IF EXISTS tbl_msglunr ;
        END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}message_getReplies(i_MessageID int) 
 BEGIN
 	SELECT MessageID FROM {databaseName}.{objectQualifier}Message WHERE ReplyTo = i_MessageID;
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}message_list(i_MessageID INT)
 BEGIN
 	SELECT
 		a.MessageID,
 		a.UserID,
 		b.Name AS UserName,
 		a.Message,
 		c.TopicID,
 		c.ForumID,
 		c.Topic,
		c.Status,
 		c.Priority,
		c.Description,
 		a.Flags,
 		c.UserID AS TopicOwnerID,
 		IFNULL(a.Edited,a.Posted) AS Edited,
 		c.Flags AS TopicFlags,
 		d.Flags AS ForumFlags,
 		a.EditReason,
 		a.Position,
 		a.IsModeratorChanged,
 		a.DeleteReason,
 		a.BlogPostID,
 		c.PollID,
        a.IP,
		a.ReplyTo,
		a.ExternalMessageId,
		a.ReferenceMessageId
 	FROM
 		{databaseName}.{objectQualifier}Message a
 		INNER JOIN {databaseName}.{objectQualifier}User b ON b.UserID = a.UserID
 		INNER JOIN {databaseName}.{objectQualifier}Topic c ON c.TopicID = a.TopicID
 		INNER JOIN {databaseName}.{objectQualifier}Forum d ON c.ForumID = d.ForumID
 	WHERE
 		a.MessageID = i_MessageID;
 END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_listreported(i_ForumID INT) 
 BEGIN
 	SELECT
 		a.*,
 		b.Message AS OriginalMessage,
 		b.Flags,
		b.IsModeratorChanged,	
 		IFNULL(b.UserName,d.Name) AS UserName,
 		b.UserID AS UserID,
 		b.Posted AS Posted,
		b.TopicID AS TopicID,
 		c.Topic AS Topic,
 		(SELECT count(LogID) FROM {databaseName}.{objectQualifier}MessageReportedAudit WHERE {databaseName}.{objectQualifier}MessageReportedAudit.MessageID = a.MessageID) AS NumberOfReports
 	FROM
 		{databaseName}.{objectQualifier}MessageReported a
 	INNER JOIN
 		{databaseName}.{objectQualifier}Message b ON a.MessageID = b.MessageID
 	INNER JOIN
 		{databaseName}.{objectQualifier}Topic c ON b.TopicID = c.TopicID
 	INNER JOIN
 		{databaseName}.{objectQualifier}User d ON b.UserID = d.UserID
 	WHERE
 		c.ForumID = i_ForumID AND
 		(c.Flags & 16)=0 AND
 		(b.Flags & 8)=0 AND
 		(c.Flags & 8)=0 AND
 		(b.Flags & 128)=128
 	ORDER BY
 		b.TopicID DESC, b.Posted DESC;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_move (i_MessageID INT, i_MoveToTopic INT)
 BEGIN

 DECLARE ici_Position INT;
 DECLARE ici_ReplyToID INT;
 DECLARE ici_ForumID2 INT;
 DECLARE ici_OldTopicID INT;
 DECLARE ici_OldForumID INT;
 DECLARE ici_NewForumID	INT;
 DECLARE ici_MessageCount INT;
 DECLARE ici_LastMessageID INT;
 DECLARE ici_Posted DATETIME;
 
 	/*Find TopicID and ForumID
 SELECT b.TopicID,b.ForumID INTO ici_ForumID,ici_OldTopicID
        FROM {databaseName}.{objectQualifier}Message a,{databaseName}.{objectQualifier}Topic b WHERE a.MessageID=i_MessageID and b.TopicID=a.TopicID;*/
SELECT Posted INTO ici_Posted 
FROM {databaseName}.{objectQualifier}Message  
WHERE MessageID= i_MessageID;
 SET 	ici_NewForumID = (SELECT     ForumID
 				FROM         {databaseName}.{objectQualifier}Topic
 				WHERE     (TopicID = i_MoveToTopic));
 
 
 SET 	ici_OldTopicID = 	(SELECT     TopicID
 				FROM         {databaseName}.{objectQualifier}Message
 				WHERE     (MessageID = i_MessageID));
 
 SET 	ici_OldForumID = (SELECT     ForumID
 				FROM         {databaseName}.{objectQualifier}Topic
 				WHERE     (TopicId = ici_OldTopicID));
 
 SET	ici_ReplyToID = (SELECT     MessageID
 			FROM         {databaseName}.{objectQualifier}Message
 			WHERE     (`Position` = 0) AND (TopicID = i_MoveToTopic));
 
 SET	ici_Position = 	(SELECT     MAX(`Position`) + 1 AS Expr1
 			FROM         {databaseName}.{objectQualifier}Message
 			WHERE     (TopicID = i_MoveToTopic) and UNIX_TIMESTAMP(Posted) < UNIX_TIMESTAMP(ici_Posted));
 
IF ici_Position IS NULL THEN set ici_Position = 0; END IF;
 
 update {databaseName}.{objectQualifier}Message SET
 		`Position` = `Position`+1
 	 WHERE     (TopicID = i_MoveToTopic) and UNIX_TIMESTAMP(Posted) > UNIX_TIMESTAMP(ici_Posted);
 
 update {databaseName}.{objectQualifier}Message set
 		`Position` = `Position`-1
 	 WHERE (TopicID = ici_OldTopicID) and UNIX_TIMESTAMP(Posted) > UNIX_TIMESTAMP(ici_Posted);
 
 	 /*Update LastMessageID in Topic and Forum*/
 	UPDATE {databaseName}.{objectQualifier}Topic set
 		LastPosted = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	WHERE LastMessageID = i_MessageID;
 
 	UPDATE {databaseName}.{objectQualifier}Forum set
 		LastPosted = NULL,
 		LastTopicID = NULL,
 		LastMessageID = NULL,
 		LastUserID = NULL,
 		LastUserName = NULL
 	WHERE LastMessageID = i_MessageID;

 
 UPDATE {databaseName}.{objectQualifier}Message SET
  	TopicID = i_MoveToTopic,
 	ReplyTo = ici_ReplyToID,
 	`Position` = ici_Position
 WHERE  MessageID = i_MessageID;
 
 	 /*Delete topic if there are no more messages*/
 	SELECT COUNT(1) INTO ici_MessageCount 
 	FROM {databaseName}.{objectQualifier}Message 
 	WHERE TopicID = ici_OldTopicID and (Flags & 8)=0;
 	IF ici_MessageCount=0 THEN 
 	CALL {databaseName}.{objectQualifier}topic_delete(ici_OldTopicID,0,0); 
 	END IF;
 
 	 /*update lastpost*/
 	CALL {databaseName}.{objectQualifier}topic_updatelastpost(ici_OldForumID,ici_OldTopicID);
 	CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_OldForumID);
 	CALL {databaseName}.{objectQualifier}topic_updatelastpost(ici_NewForumID,i_MoveToTopic);
    CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_NewForumID);
 	 /*update topic numposts*/
 	UPDATE {databaseName}.{objectQualifier}Topic SET
 		NumPosts = (SELECT COUNT(1) from {databaseName}.{objectQualifier}MessageSelectView x 
 		WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID 
 		and x.IsApproved = 1 and x.IsDeleted = 0)
 	WHERE TopicID = ici_OldTopicID;
 	UPDATE {databaseName}.{objectQualifier}Topic set
 		NumPosts = (SELECT COUNT(1) from {databaseName}.{objectQualifier}MessageSelectView x 
 		WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID 
 		and x.IsApproved = 1 and x.IsDeleted = 0)
 	WHERE TopicID = i_MoveToTopic;
 
 	CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_NewForumID);
 	CALL {databaseName}.{objectQualifier}forum_updatestats(ici_NewForumID);
 	CALL {databaseName}.{objectQualifier}forum_updatestats(ici_OldForumID);
 
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_reply_list(i_MessageID INT) 
BEGIN
 SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
 	SELECT
                 a.MessageID,
 		a.Posted,
 		c.Topic AS Subject,
 		a.Message,
 		a.UserID,
 		a.Flags,
 		IFNULL(a.UserName,b.Name) AS UserName,
 		b.Signature
 	FROM
 		{databaseName}.{objectQualifier}Message a
 		INNER JOIN {databaseName}.{objectQualifier}User b on b.UserID = a.UserID
 		INNER JOIN {databaseName}.{objectQualifier}Topic c on c.TopicID = a.TopicID
 	WHERE
 		(a.Flags & 16)=16 AND
 		a.ReplyTo = i_MessageID;
 
 SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_listreporters(i_MessageID int, i_UserID int)
BEGIN
	IF i_UserID > 0 THEN
	SELECT DISTINCTROW b.UserID, a.Name AS UserName, b.ReportedNumber, b.ReportText  
	FROM {databaseName}.{objectQualifier}User a,
	{databaseName}.{objectQualifier}MessageReportedAudit b
	WHERE a.UserID = b.UserID AND b.MessageID = i_MessageID  AND a.UserID =i_UserID ORDER BY b.Reported DESC;
	ELSE
	SELECT DISTINCTROW b.UserID, a.Name AS UserName, b.ReportedNumber, b.ReportText  
	FROM {databaseName}.{objectQualifier}User a,
	{databaseName}.{objectQualifier}MessageReportedAudit b
	WHERE a.UserID = b.UserID AND b.MessageID = i_MessageID ORDER BY b.Reported DESC;
	END IF;
	
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_report
(i_MessageID INT, 
i_ReporterID INT, 
i_ReportedDate DATETIME, i_ReportText VARCHAR(4000)) 
 BEGIN
 	IF i_ReportText IS NULL THEN SET i_ReportText = ''; END IF;
 	IF NOT EXISTS (SELECT MessageID from {databaseName}.{objectQualifier}MessageReportedAudit WHERE MessageID=i_MessageID AND UserID=i_ReporterID) THEN
 		INSERT INTO {databaseName}.{objectQualifier}MessageReportedAudit(MessageID,UserID,Reported, ReportText) VALUES (i_MessageID,i_ReporterID,i_ReportedDate,CONCAT(CAST(UTC_TIMESTAMP() AS CHAR(40)), '??' ,i_ReportText) ); 
    ELSE
        UPDATE {databaseName}.{objectQualifier}MessageReportedAudit SET ReportedNumber = ( CASE WHEN ReportedNumber < 2147483647 THEN  ReportedNumber  + 1 ELSE ReportedNumber END ), Reported = i_ReportedDate, ReportText = (CASE WHEN (CHAR_LENGTH(ReportText) + CHAR_LENGTH(i_ReportText ) + 255 < 4000)  THEN  CONCAT(ReportText , '|' , CAST(UTC_TIMESTAMP() AS CHAR(40)), '??' ,  i_ReportText)  ELSE ReportText END) WHERE MessageID=i_MessageID AND UserID=i_ReporterID; 
	END IF;
	
 	IF NOT EXISTS (SELECT MessageID FROM {databaseName}.{objectQualifier}MessageReported WHERE MessageID=i_MessageID) THEN
 		INSERT INTO {databaseName}.{objectQualifier}MessageReported(MessageID, `Message`)
 		SELECT 
 			a.MessageID,
 			a.Message
 		FROM
 			{databaseName}.{objectQualifier}Message a
 		WHERE
 			a.MessageID = i_MessageID;
 	END IF;
 	/*update Message table to set message with flag Reported*/
 	UPDATE {databaseName}.{objectQualifier}Message 
SET Flags = Flags | 128 WHERE MessageID = i_MessageID;

 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}message_reportcopyover(i_MessageID INT)
 BEGIN
	UPDATE {databaseName}.{objectQualifier}MessageReported,{databaseName}.{objectQualifier}Message
 	SET {databaseName}.{objectQualifier}MessageReported.`Message` = (SELECT m.`Message` FROM {databaseName}.{objectQualifier}MessageReported mr
 	JOIN {databaseName}.{objectQualifier}Message m
   ON m.MessageID = mr.MessageID
 	WHERE mr.MessageID = i_MessageID);
 	
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_reportresolve(i_MessageFlag INT, i_MessageID INT, i_UserID INT) 
 BEGIN

 	UPDATE {databaseName}.{objectQualifier}MessageReported
 	SET Resolved = 1, ResolvedBy = i_UserID, ResolvedDate = UTC_TIMESTAMP()
 	WHERE MessageID = i_MessageID; 	
 	/* Remove Flag */
 	UPDATE {databaseName}.{objectQualifier}Message
 	SET Flags = Flags & (~POWER(2, i_MessageFlag))
 	WHERE MessageID = i_MessageID;
 END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}message_save(
 	i_TopicID		INT,
 	i_UserID		INT,
 	i_Message		TEXT,
 	i_UserName		VARCHAR(128),
 	i_IP			VARCHAR(39),
 	i_Posted		DATETIME,
 	i_ReplyTo		INT,
 	i_BlogPostID	VARCHAR(128),
	i_ExternalMessageId varchar(255),
	i_ReferenceMessageId varchar(255),
 	i_Flags			INT,
 	OUT i_MessageID	INT
 )
 BEGIN
 	DECLARE ici_ForumID INT;
        DECLARE ici_ForumFlags INT;
        DECLARE ici_Position INT;
        DECLARE ici_Indent INT;
        DECLARE ici_temp INT;
       
 	IF i_Posted IS NULL THEN
 		SET i_Posted = UTC_TIMESTAMP(); END IF;
 
 	SELECT  x.ForumID,  y.Flags
        INTO ici_ForumID,ici_ForumFlags
 	FROM 
 		{databaseName}.{objectQualifier}Topic x
 	INNER JOIN 
 		{databaseName}.{objectQualifier}Forum y ON y.ForumID=x.ForumID
 	WHERE x.TopicID = i_TopicID;
 
 	IF i_ReplyTo IS NULL THEN
 			SELECT 0,0 INTO ici_Position, ici_Indent; /* New thread*/
 
 	ELSEIF i_ReplyTo<0 THEN
 		/* Find post to reply to AND indent of this post */
 		SELECT   MessageID, Indent+1
                INTO i_ReplyTo,ici_Indent
 		FROM {databaseName}.{objectQualifier}Message
 		WHERE TopicID = i_TopicID AND ReplyTo IS NULL
 		ORDER BY Posted LIMIT 1;
 
 	ELSE
 		/* Got reply, find indent of this post */
 			SELECT Indent+1 INTO ici_Indent
 			FROM {databaseName}.{objectQualifier}Message
 			WHERE MessageID=i_ReplyTo;
        END IF;  
 
 	/* Find position */
 	IF i_ReplyTo IS NOT NULL THEN
 		
         SELECT ReplyTo,`Position` INTO ici_temp,ici_Position 
         FROM {databaseName}.{objectQualifier}Message WHERE MessageID=i_ReplyTo;
 
         IF ici_temp IS NULL THEN
 			/* We are replying to first post */
             SELECT MAX(`Position`)+1 INTO ici_Position  FROM {databaseName}.{objectQualifier}Message WHERE TopicID=i_TopicID;
 
           ELSE
 			/* Last position of replies to parent post*/
             SELECT MIN(`Position`) INTO ici_Position 
             FROM {databaseName}.{objectQualifier}Message 
             WHERE ReplyTo=ici_temp AND `Position`>ici_Position;
 
         /* No replies, THEN USE parent post's position+1*/
             IF ici_Position IS NULL THEN
                 SELECT `Position`+1 
                 INTO ici_Position 
                 FROM {databaseName}.{objectQualifier}Message 
                 WHERE MessageID=i_ReplyTo;
 		/*Increase position of posts after this*/

         UPDATE {databaseName}.{objectQualifier}Message 
         SET `Position`=`Position`+1 
         WHERE TopicID=i_TopicID 
         AND `Position`>=ici_Position; 
            END IF;
         END IF;
  END IF;
 
 	/* Add points to Users total points */
 	UPDATE {databaseName}.{objectQualifier}User SET Points = Points + 3  WHERE UserID = i_UserID;       
 	INSERT {databaseName}.{objectQualifier}Message ( UserID, Message, TopicID, Posted, UserName, IP, ReplyTo, `Position`, Indent, Flags, BlogPostID, ExternalMessageId, ReferenceMessageId)
 	VALUES ( i_UserID, CONVERT(i_Message USING {databaseEncoding}), i_TopicID, i_Posted, i_UserName, i_IP, i_ReplyTo, ici_Position, ici_Indent, i_Flags & ~16, i_BlogPostID, i_ExternalMessageId, i_ReferenceMessageId);

 	SET i_MessageID = LAST_INSERT_ID();

 	IF ((i_Flags & 16) = 16) THEN
      CALL {databaseName}.{objectQualifier}message_approve (i_MessageID); 
	END IF;
      END;
--GO

     


      /* STORED PROCEDURE CREATED BY VZ-TEAM */     
      CREATE PROCEDURE {databaseName}.{objectQualifier}message_unapproved(i_ForumID INT)
      BEGIN
      SELECT
      b.MessageID AS MessageID,
      b.UserID AS UserID,
      IFNULL(b.UserName,c.Name) AS UserName,
      b.Posted AS Posted,
      a.Topic AS Topic,
      a.TopicID,
      b.Message AS Message,
      b.Flags AS Flags,
      b.IsModeratorChanged AS IsModeratorChanged
      FROM
      {databaseName}.{objectQualifier}Topic a
      INNER JOIN {databaseName}.{objectQualifier}Message b on b.TopicID = a.TopicID
      INNER JOIN {databaseName}.{objectQualifier}User c on c.UserID = b.UserID
      WHERE
      a.ForumID = i_ForumID AND
      (b.Flags & 16)=0 AND
 		(a.Flags & 8)=0 AND
 		(b.Flags & 8)=0
 	ORDER BY
 		a.Posted;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_update
(i_MessageID INT,
i_Priority INT,
i_Subject VARCHAR(255),
i_status VARCHAR(255),
i_Description VARCHAR(255),
i_Flags INT, 
i_Message TEXT, 
i_Reason VARCHAR(128),
i_EditedBy INT, 
i_IsModeratorChanged TINYINT(1), 
i_OverrideApproval TINYINT(1),
i_OriginalMessage TEXT) 
BEGIN
 	DECLARE ici_TopicID	INT;
 	DECLARE	ici_ForumFlags	INT;
 
 	SET i_Flags = i_Flags & ~16;	
 	
 	SELECT 
 	a.TopicID,
 	c.Flags
        INTO ici_TopicID,ici_ForumFlags
 	FROM 
 		{databaseName}.{objectQualifier}Message a
 		INNER JOIN {databaseName}.{objectQualifier}Topic b ON b.TopicID = a.TopicID
 		INNER JOIN {databaseName}.{objectQualifier}Forum c ON c.ForumID = b.ForumID
 	WHERE 
 		a.MessageID = i_MessageID;
 
 	IF (i_OverrideApproval = 1 OR (ici_ForumFlags & 8)=0) THEN SET i_Flags = i_Flags | 16; END IF;
 -- insert current message variant - use OriginalMessage in future 	
	insert into {databaseName}.{objectQualifier}MessageHistory
	(MessageID,		
		Message,
		IP,
		Edited,
		EditedBy,		
		EditReason,
		IsModeratorChanged,
		Flags)
	select 
	MessageID, i_OriginalMessage, IP , 
	IFNULL(Edited,Posted), IFNULL(EditedBy,UserID), 
	EditReason, IsModeratorChanged, Flags
	from {databaseName}.{objectQualifier}Message where
		MessageID = i_MessageID;
	
 	UPDATE {databaseName}.{objectQualifier}Message SET
 		Message = CONVERT(i_Message USING {databaseEncoding}),
 		Edited = UTC_TIMESTAMP(),
 		EditedBy = i_EditedBy,
 		Flags = i_Flags,
 		IsModeratorChanged  = i_IsModeratorChanged,
        EditReason = CONVERT(i_Reason USING {databaseEncoding})
 	WHERE
 		MessageID = i_MessageID;
 
 	IF i_Priority IS NOT NULL THEN
 		UPDATE {databaseName}.{objectQualifier}Topic SET
 			Priority = i_Priority
 		WHERE
 			TopicID = ici_TopicID;
 	END IF;
 
 	IF NOT i_Subject = '' AND i_Subject IS NOT NULL THEN
 		UPDATE {databaseName}.{objectQualifier}Topic SET
 			Topic = CONVERT(i_Subject USING {databaseEncoding}), 
			Description =  CONVERT(i_Description USING {databaseEncoding}),
			Status = i_status
 		WHERE
 			TopicID = ici_TopicID;
 	END IF; 
 	
 	/*If forum is moderated, make sure last post pointers are correct*/
 	IF (ici_ForumFlags & 8)<>0 THEN 
 	CALL {databaseName}.{objectQualifier}topic_updatelastpost(null,null);
 	/*CALL {databaseName}.{objectQualifier}forum_updatelastpost (ici_ForumID);*/
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpforum_delete(i_NntpForumID INT) 
BEGIN
DELETE FROM {databaseName}.{objectQualifier}NntpTopic where NntpForumID = i_NntpForumID;
DELETE FROM {databaseName}.{objectQualifier}NntpForum where NntpForumID = i_NntpForumID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpforum_list(i_BoardID INT,i_Minutes INT,i_NntpForumID INT,i_Active TINYINT(1)) 
BEGIN
 	SELECT
 		a.Name,
 		a.Address,
 		IFNULL(a.Port,119) AS Port,
 		a.UserName,
 		a.UserPass,		
 		a.NntpServerID,
 		b.NntpForumID,		
 		b.GroupName,
 		b.ForumID,
 		b.LastMessageNo,
 		b.LastUpdate,
 		b.Active,	
		b.DateCutOff,
 		c.Name AS ForumName 
 	FROM
 		{databaseName}.{objectQualifier}NntpServer a
 		JOIN {databaseName}.{objectQualifier}NntpForum b 
                ON b.NntpServerID = a.NntpServerID
 		JOIN {databaseName}.{objectQualifier}Forum c 
                ON c.ForumID = b.ForumID
 	WHERE
 		(i_Minutes IS NULL 
                 OR CAST(ROUND((UTC_TIMESTAMP()-b.LastUpdate)/60) AS SIGNED)>i_Minutes) AND
 		(i_NntpForumID IS NULL OR b.NntpForumID=i_NntpForumID) AND
 		a.BoardID=i_BoardID AND
 		(i_Active IS NULL OR b.Active=i_Active)
 	ORDER BY
 		a.Name,
 		b.GroupName;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpforum_save(
                 i_NntpForumID INT,
				 i_NntpServerID INT,
				 i_GroupName VARCHAR(128),
				 i_ForumID INT,
				 i_Active TINYINT(1), 
				 i_DateCutoff DATETIME) 
BEGIN
 	IF i_NntpForumID IS NULL THEN
 		INSERT INTO {databaseName}.{objectQualifier}NntpForum(NntpServerID,GroupName,ForumID,LastMessageNo,LastUpdate,Active, DateCutoff)
 		VALUES(i_NntpServerID,i_GroupName,i_ForumID,0,UTC_TIMESTAMP(),i_Active, i_DateCutoff);
 	ELSE
 		UPDATE {databaseName}.{objectQualifier}NntpForum SET
 			NntpServerID = i_NntpServerID,
 			GroupName = i_GroupName,
 			ForumID = i_ForumID,
 			Active = i_Active,
			DateCutoff = i_DateCutoff
 		WHERE NntpForumID = i_NntpForumID;
       END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}nntpforum_update(i_NntpForumID INT,i_LastMessageNo INT,i_UserID INT) 
BEGIN
 	DECLARE	ici_ForumID	INT;
 	
 	SELECT ForumID INTO ici_ForumID from {databaseName}.{objectQualifier}NntpForum where NntpForumID=i_NntpForumID;
 
 	UPDATE {databaseName}.{objectQualifier}NntpForum SET
 		LastMessageNo = i_LastMessageNo,
 		LastUpdate = UTC_TIMESTAMP()
 	WHERE NntpForumID = i_NntpForumID;
 
 	UPDATE {databaseName}.{objectQualifier}Topic SET 
 		NumPosts = (SELECT COUNT(1) FROM {databaseName}.{objectQualifier}MessageSelectView x WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID AND x.IsApproved = 1 AND x.IsDeleted = 0)
 	WHERE ForumID=ici_ForumID;
 
 	/* CALL {databaseName}.{objectQualifier}user_upgrade(i_UserID) */
 	CALL {databaseName}.{objectQualifier}forum_updatestats(ici_ForumID);
 	/* CALL {databaseName}.{objectQualifier}topic_updatelastpost ici_ForumID,null*/
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpserver_delete(i_NntpServerID INT) 
BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}NntpTopic WHERE NntpForumID IN (SELECT NntpForumID FROM {databaseName}.{objectQualifier}NntpForum WHERE NntpServerID = i_NntpServerID);
 	DELETE FROM {databaseName}.{objectQualifier}NntpForum WHERE NntpServerID = i_NntpServerID;
 	DELETE FROM {databaseName}.{objectQualifier}NntpServer WHERE NntpServerID = i_NntpServerID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpserver_list(i_BoardID INT,i_NntpServerID INT)
BEGIN
 	IF i_NntpServerID IS NULL THEN
 		SELECT * FROM {databaseName}.{objectQualifier}NntpServer WHERE BoardID=i_BoardID ORDER BY `Name`;
 	ELSE
 		SELECT * FROM {databaseName}.{objectQualifier}NntpServer WHERE NntpServerID=i_NntpServerID;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntpserver_save(
 	i_NntpServerID 	INT,
 	i_BoardID	INT,
 	i_Name		VARCHAR(128),
 	i_Address	VARCHAR(128),
 	i_Port		INT,
 	i_UserName	VARCHAR(128),
 	i_UserPass	VARCHAR(128)
 )  BEGIN
 	IF i_NntpServerID IS NULL THEN
 		INSERT INTO {databaseName}.{objectQualifier}NntpServer(`Name`,BoardID,Address,Port,UserName,UserPass)
 		VALUES(i_Name,i_BoardID,i_Address,i_Port,i_UserName,i_UserPass);
 	ELSE
 		UPDATE {databaseName}.{objectQualifier}NntpServer SET
 			`Name` = i_Name,
 			Address = i_Address,
 			Port = i_Port,
 			UserName = i_UserName,
 			UserPass = i_UserPass
 		WHERE NntpServerID = i_NntpServerID;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}nntptopic_list(i_Thread varchar(128))
BEGIN
	SELECT
		a.*
	FROM
		{databaseName}.{objectQualifier}NntpTopic a
	WHERE
		a.Thread = i_Thread;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}nntptopic_savemessage(
 	i_NntpForumID	int,
 	i_Topic 		VARCHAR(128),
 	i_Body 			TEXT,
 	i_UserID 		INT,
 	i_UserName		VARCHAR(128),
 	i_IP			VARCHAR(39),
 	i_Posted			DATETIME, 
	i_ExternalMessageId	nvarchar(64),
	i_ReferenceMessageId nvarchar(64)
 )  
 BEGIN   
 	DECLARE	ici_ForumID	INT;
 	DECLARE	ici_ParentID	INT;
 	DECLARE ici_TopicID	INT;
 	DECLARE	ici_MessageID	INT;
DECLARE ici_LastTopicID_Check INT;
DECLARE ici_LastMessageID_Check INT;
DECLARE FlagDeleted TINYINT(1) DEFAULT 0;
DECLARE FlagApproved TINYINT(1) DEFAULT 1;
declare ici_ReplyTo	INT DEFAULT NULL;

 	SELECT ForumID INTO ici_ForumID 
 	FROM {databaseName}.{objectQualifier}NntpForum 
 	WHERE NntpForumID=i_NntpForumID;

	

 if exists(select 1 from {databaseName}.{objectQualifier}Message where ExternalMessageId = i_ReferenceMessageId limit 1) then
 

 		/* thread exists */
		-- message exists
		select TopicID,  MessageID into ici_TopicID, ici_ReplyTo
		 from {databaseName}.{objectQualifier}Message where ExternalMessageId = i_ExternalMessageId; 	
 	 ELSE 
	 	if not exists(select 1 from {databaseName}.{objectQualifier}Message where ExternalMessageId = i_ExternalMessageId) then
 		/* thread doesn't exists */
		if (i_ReferenceMessageId IS NULL OR i_ReferenceMessageId = 0)
		then
 		INSERT INTO {databaseName}.{objectQualifier}Topic(ForumID,UserID,UserName,Posted,Topic,Views,Priority,NumPosts)
 		VALUES(ici_ForumID,i_UserID,i_UserName,i_Posted,i_Topic,0,0,0);
 	    SELECT LAST_INSERT_ID() INTO ici_TopicID; 
 		INSERT INTO {databaseName}.{objectQualifier}NntpTopic(NntpForumID,Thread,TopicID)
 		VALUES (i_NntpForumID,'',ici_TopicID);
		end if;
		end if;
 	END IF;


 	IF ici_TopicID IS NOT NULL
	then
		CALL {databaseName}.{objectQualifier}message_save( ici_TopicID, i_UserID, i_Body, i_UserName, i_IP, i_Posted, cic_ReplyTo, NULL, i_ExternalMessageId, i_ReferenceMessageId, 17, ici_MessageID); 
	END if;	

 
 	/* update user */
 	IF EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Forum 
 	WHERE ForumID=ici_ForumID AND (Flags & 4)=0) THEN
 	
 		UPDATE {databaseName}.{objectQualifier}User SET NumPosts=NumPosts+1 WHERE UserID=i_UserID;
 	END IF;
 	
 	/* update topic */
 	UPDATE {databaseName}.{objectQualifier}Topic SET 
 		LastPosted		= i_Posted,
 		LastMessageID	= ici_MessageID,
 		LastUserID		= i_UserID,
 		LastUserName	= i_UserName,
 		NumPosts =NumPosts + 1
 	WHERE TopicID=ici_TopicID;	
 	UPDATE {databaseName}.{objectQualifier}Forum SET
 		LastPosted		= i_Posted,
 		LastTopicID	= ici_TopicID,
 		LastMessageID	= ici_MessageID,
 		LastUserID		= i_UserID,
 		LastUserName	= i_UserName
 	WHERE ForumID=ici_ForumID AND (LastPosted IS NULL OR (UNIX_TIMESTAMP(LastPosted) < UNIX_TIMESTAMP(i_Posted)));
CALL {databaseName}.{objectQualifier}topic_updatelastpost(ici_ForumID,ici_TopicID);
CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_ForumID);
CALL {databaseName}.{objectQualifier}forum_updatestats(ici_ForumID);

 	/* update forum 

SELECT ParentID 
INTO ici_ParentID
FROM {databaseName}.{objectQualifier}Forum
WHERE ForumID = ici_ForumID;

 	UPDATE {databaseName}.{objectQualifier}Forum SET
 		LastPosted		= i_Posted,
 		LastTopicID	= ici_TopicID,
 		LastMessageID	= ici_MessageID,
 		LastUserID		= i_UserID,
 		LastUserName	= i_UserName
 	WHERE ForumID=ici_ForumID AND (LastPosted IS NULL OR (UNIX_TIMESTAMP(LastPosted) < UNIX_TIMESTAMP(i_Posted)));
CALL {databaseName}.{objectQualifier}topic_updatelasttopic(ici_ForumID,ici_TopicID);
CALL {databaseName}.{objectQualifier}forum_updatelasttopic(ici_ForumID);
WHILE ici_ParentID > 0 DO
   		UPDATE {databaseName}.{objectQualifier}Forum SET
				LastPosted = i_Posted,
				LastTopicID = ici_TopicID,
				LastMessageID = ici_MessageID,
				LastUserID = i_UserID,
				LastUserName = i_UserName
			WHERE ForumID=ici_ForumID AND (LastPosted IS NULL OR UNIX_TIMESTAMP(LastPosted)<UNIX_TIMESTAMP(i_Posted));    
         SELECT DISTINCTROW ParentID INTO  ici_ParentID
  FROM  {databaseName}.{objectQualifier}Forum
  WHERE ForumID = ici_ParentID;  
  END WHILE; 	
END IF;*/ 
END;
--GO
CREATE procedure {databaseName}.{objectQualifier}activeaccess_reset() 
begin
delete from {databaseName}.{objectQualifier}Active;
delete from {databaseName}.{objectQualifier}ActiveAccess;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pageload(
	i_SessionID 	 VARCHAR(24),
	i_BoardID	     INT,	
	i_UserKey	     VARCHAR(64),
	i_IP		     VARCHAR(37),
	i_Location	     VARCHAR(255),
	i_ForumPage	     VARCHAR(255),
	i_Browser	     VARCHAR(128),
	i_Platform	     VARCHAR(128),
	i_CategoryID	 INT,
	i_ForumID	     INT,
	i_TopicID	     INT,
	i_MessageID  	 INT,
	i_IsCrawler      TINYINT(1),
	i_IsMobileDevice TINYINT(1),
	i_DontTrack      TINYINT(1)
)
BEGIN
	DECLARE ici_UserID		INT;
	DECLARE ici_UserBoardID	INT;
	DECLARE ici_IsGuest	TINYINT(1) DEFAULT 0;
	DECLARE ici_rowcount	INT;
	DECLARE ici_PreviousVisit	DATETIME;
	DECLARE ici_timestamp DATETIME DEFAULT UTC_TIMESTAMP();	
	DECLARE ici_ForumID INT;
	DECLARE ici_ActiveUpdate TINYINT(1) DEFAULT 0;
	declare ici_ActiveFlags	INT DEFAULT 1;
	declare ici_GuestID     INT;  
	

	/* set implicit_transactions off */
 
 START TRANSACTION WITH CONSISTENT SNAPSHOT;
 	-- find a guest id should do it every time to be sure that guest access rights are in ActiveAccess table
	    SELECT SQL_CALC_FOUND_ROWS UserID INTO ici_GuestID from {databaseName}.{objectQualifier}User where BoardID=i_BoardID and (Flags & 4)<>0 ORDER BY Joined DESC LIMIT 1;
		SET ici_rowcount=FOUND_ROWS();
		IF ici_rowcount>1 THEN
				/*raiserror('Found %d possible guest users. There should be one and only one user marked as guest.',16,1,ici_rowcount)*/		 
				    SET ici_rowcount = ici_rowcount;			
		END IF;
	IF i_UserKey IS NULL THEN
		SET ici_UserID = ici_GuestID;
		set ici_IsGuest = 1;
		-- set IsGuest ActiveFlag  1 | 2
		set ici_ActiveFlags = 3;
		set ici_UserBoardID = i_BoardID;
		-- crawlers are always guests 
		if	i_IsCrawler = 1 then			
			-- set IsCrawler ActiveFlag
			set ici_ActiveFlags =  ici_ActiveFlags | 8;
		end  if;		
	ELSE
	
		SELECT UserID, BoardID INTO ici_UserID,ici_UserBoardID  
		FROM {databaseName}.{objectQualifier}UserSelectView 
		where BoardID=i_BoardID AND ProviderUserKey=i_UserKey;
		
		SET ici_IsGuest = 0;
		-- make sure that registered users are not crawlers
		SET i_IsCrawler = 0;
		-- set IsRegistered ActiveFlag
		SET ici_ActiveFlags = ici_ActiveFlags | 4;

	END IF;
	-- START TRANSACTION WITH CONSISTENT SNAPSHOT;
	/* Check valid ForumID */
	IF i_ForumID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Forum WHERE ForumID=i_ForumID)
          THEN 
		SET i_ForumID = NULL; 
            END IF;
	
	/* Check valid CategoryID*/
	IF i_CategoryID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Category WHERE CategoryID=i_CategoryID)              THEN 
		SET i_CategoryID = NULL;
	    END IF;
	/*Check valid MessageID*/
	IF i_MessageID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Message WHERE MessageID=i_MessageID) 
           THEN
		SET i_MessageID = NULL;
	    END IF;
	/*Check valid TopicID*/
	IF i_TopicID IS NOT NULL AND NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Topic WHERE TopicID=i_TopicID) 
           THEN
		SET i_TopicID = NULL;
	    END IF;	
		-- ensure that no duplicates and that the guest access rights always present in the access table 
	 if not exists (select 
			UserID	
			from {databaseName}.{objectQualifier}ActiveAccess 
			where UserID = ici_GuestID limit 1)
			then				
			insert into {databaseName}.{objectQualifier}ActiveAccess(
			UserID,
			BoardID,
			ForumID,
			IsAdmin,
			IsForumModerator,
		    IsModerator,
			IsGuestX,
			LastActive,
			ReadAccess,
			PostAccess,
			ReplyAccess,
			PriorityAccess,
			PollAccess,
			VoteAccess,
			ModeratorAccess,
			EditAccess,
			DeleteAccess,
			UploadAccess,
			DownloadAccess)
			select 
			UserID, 
			i_BoardID, 
			ForumID, 
			IFNULL(SIGN(IsAdmin),0),
			SIGN(IsForumModerator),
			SIGN(IsModerator),
			ici_IsGuest,
			ici_timestamp,
			SIGN(ReadAccess),
			SIGN(PostAccess),
			SIGN(ReplyAccess),
			SIGN(PriorityAccess),
			SIGN(PollAccess),
			SIGN(VoteAccess),
			SIGN(ModeratorAccess),
			IFNULL(SIGN(EditAccess),0),
			SIGN(DeleteAccess),
			SIGN(UploadAccess),
			SIGN(DownloadAccess)			
			from {databaseName}.{objectQualifier}vaccess
			WHERE UserID = ici_GuestID;			
	end if;
	-- START TRANSACTION WITH CONSISTENT SNAPSHOT;
	/*update last visit*/
	UPDATE {databaseName}.{objectQualifier}User SET 
		LastVisit = ici_timestamp,
		IP = i_IP
	WHERE UserID = ici_UserID;
	-- COMMIT;
   -- START TRANSACTION WITH CONSISTENT SNAPSHOT;
	/*find missing ForumID/TopicID*/
	IF i_MessageID IS NOT NULL THEN
		SELECT
			c.CategoryID,
			b.ForumID,
			b.TopicID
                INTO i_CategoryID,i_ForumID,i_TopicID
		FROM
			{databaseName}.{objectQualifier}Message a
			INNER JOIN {databaseName}.{objectQualifier}Topic b ON b.TopicID = a.TopicID
			INNER JOIN {databaseName}.{objectQualifier}Forum c ON c.ForumID = b.ForumID
			INNER JOIN {databaseName}.{objectQualifier}Category d ON d.CategoryID = c.CategoryID
		WHERE
			a.MessageID = i_MessageID AND
			d.BoardID = i_BoardID;
	ELSEIF i_TopicID IS NOT NULL THEN
		SELECT 
			b.CategoryID,
			a.ForumID 
                INTO i_CategoryID,i_ForumID
		FROM 
			{databaseName}.{objectQualifier}Topic a
			inner join {databaseName}.{objectQualifier}Forum b on b.ForumID = a.ForumID
			inner join {databaseName}.{objectQualifier}Category c on c.CategoryID = b.CategoryID
		WHERE 
			a.TopicID = i_TopicID AND
			c.BoardID = i_BoardID;
	
	ELSEIF i_ForumID IS NOT NULL THEN
		SELECT
			 a.CategoryID
		INTO     i_CategoryID
                    
		FROM	{databaseName}.{objectQualifier}Forum a
			inner join {databaseName}.{objectQualifier}Category b on b.CategoryID = a.CategoryID
		WHERE
			a.ForumID = i_ForumID and
			b.BoardID = i_BoardID;
	END IF;
	
	/*update active*/
	-- ensure that access right are in place		
		if not exists (select 
			UserID	
			from {databaseName}.{objectQualifier}ActiveAccess  
			where UserID = ici_UserID LIMIT 1)
			then							
			insert into {databaseName}.{objectQualifier}ActiveAccess(
			UserID,
			BoardID,
			ForumID,
			IsAdmin, 
			IsForumModerator,
			IsModerator,
			IsGuestX,
			LastActive,
			ReadAccess,
			PostAccess,
			ReplyAccess,
			PriorityAccess,
			PollAccess,
			VoteAccess,	
			ModeratorAccess,
			EditAccess,
			DeleteAccess,
			UploadAccess,
			DownloadAccess)
			select 
			UserID, 
			i_BoardID, 
			ForumID, 
			SIGN(IsAdmin),
			SIGN(IsForumModerator),
			SIGN(IsModerator),
			ici_IsGuest,
			ici_timestamp,
			SIGN(ReadAccess),
			SIGN(PostAccess),
			SIGN(ReplyAccess),
			SIGN(PriorityAccess),
			SIGN(PollAccess),
			SIGN(VoteAccess),
			SIGN(ModeratorAccess),
			IFNULL(SIGN(EditAccess),0),
			SIGN(DeleteAccess),
			SIGN(UploadAccess),
			SIGN(DownloadAccess)			
			from {databaseName}.{objectQualifier}vaccess 
			where UserID = ici_UserID;			
	end if;
	
	IF i_DontTrack != 1 AND ici_UserID IS NOT NULL AND ici_UserBoardID=i_BoardID THEN
		IF EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}Active 
		WHERE (SessionID=i_SessionID OR ( Browser = i_Browser AND (Flags & 8) = 8 )) 
		AND BoardID=i_BoardID) THEN
		if i_IsCrawler <> 1 THEN
		 UPDATE {databaseName}.{objectQualifier}Active SET
				UserID = ici_UserID,
				IP = CAST(i_IP AS CHAR(39)),
				LastActive = ici_timestamp,
				Location = i_Location,
				ForumPage = i_ForumPage,
				ForumID = i_ForumID,
				TopicID = i_TopicID,
				Browser = i_Browser,
				Platform = i_Platform
			WHERE SessionID = i_SessionID and BoardID=i_BoardID;	
			ELSE
			 UPDATE {databaseName}.{objectQualifier}Active SET
				UserID = ici_UserID,
				IP = i_IP,
				LastActive = ici_timestamp,
				Location = i_Location,
				ForumPage = i_ForumPage,
				ForumID = i_ForumID,
				TopicID = i_TopicID,
				Browser = i_Browser,
				Platform = i_Platform
			WHERE Browser = i_Browser AND IP = i_IP and BoardID=i_BoardID;
			-- trace crawler: the cache is reset every time crawler moves to next page ? Disabled as cache reset will overload server 
			-- set @ActiveUpdate = 1		 ;	
			END IF;	
		ELSE
			-- we set ici_ActiveFlags ready flags 	
			INSERT INTO {databaseName}.{objectQualifier}Active(SessionID,BoardID,UserID,IP,Login,LastActive,Location,ForumID,TopicID,Browser,Platform,Flags)
			VALUES(i_SessionID,i_BoardID,ici_UserID,i_IP,ici_timestamp,ici_timestamp,i_Location,i_ForumID,i_TopicID,i_Browser,i_Platform,ici_ActiveFlags);
			/*update max user stats*/
			if ici_IsGuest = 0 then 
			SET ici_ActiveUpdate = 1; 
			end if;
			-- parameter to update active users cache if this is a new user
			 if ici_IsGuest=0 THEN
	
			 CALL {databaseName}.{objectQualifier}active_updatemaxstats (i_BoardID); 
			END IF; 
		END IF;
		/*remove duplicate users*/
		IF ici_IsGuest = 0 THEN
			DELETE FROM {databaseName}.{objectQualifier}Active WHERE UserID=ici_UserID AND BoardID=i_BoardID AND SessionID<>i_SessionID; END IF;
	    END IF;
	/*return information*/
      --  SELECT count(1) INTO ici_Incoming FROM {databaseName}.{objectQualifier}UserPMessageSelectView b  where b.UserID=ici_UserID and b.IsRead=0;
	 SELECT
		x.*,		
		ici_IsGuest AS IsGuest,
		i_IsCrawler AS IsCrawler,
		i_IsMobileDevice AS IsMobileDevice,
	    ici_UserID AS UserID,		
		(SELECT  LastVisit  FROM {databaseName}.{objectQualifier}User WHERE UserID = ici_UserID) AS PreviousVisit,		      	
		CAST(i_CategoryID AS SIGNED) AS CategoryID,
		(SELECT `Name` FROM {databaseName}.{objectQualifier}Category WHERE CategoryID = i_CategoryID) AS CategoryName,
		CAST(i_ForumID AS SIGNED) AS ForumID,
		(select `Name` from {databaseName}.{objectQualifier}Forum where ForumID = i_ForumID) AS ForumName,
		CAST(i_TopicID AS SIGNED) AS TopicID,
		(select Topic from {databaseName}.{objectQualifier}Topic where TopicID = i_TopicID) AS TopicName,		
		(select ThemeURL from {databaseName}.{objectQualifier}Forum where ForumID = i_ForumID LIMIT 1) AS ForumTheme,
		ici_ActiveUpdate AS ActiveUpdate
		from
	    {databaseName}.{objectQualifier}ActiveAccess x 
	    where
		x.UserID = ici_UserID and x.ForumID=IFNULL(i_ForumID,0); 
COMMIT;
-- SET AUTOCOMMIT=1;

END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_archive(i_UserPMessageID INT) 
 BEGIN
 	/* set IsArchived bit */
	UPDATE {databaseName}.{objectQualifier}UserPMessage SET `Flags` = (`Flags` | 4) 
	WHERE UserPMessageID = i_UserPMessageID AND 
	IFNULL(SIGN(Flags & 4),0) = 0;
 END;

--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_delete(i_UserPMessageID INT, i_FromOutbox TINYINT(1)) 
BEGIN
 	DECLARE ici_PMessageID INT; 
 	
 	SELECT PMessageID INTO ici_PMessageID FROM {databaseName}.{objectQualifier}UserPMessage 
 	where `UserPMessageID` = i_UserPMessageID LIMIT 1; 
	
	
	
	IF ( i_FromOutbox = 1 AND 
	EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserPMessage
	WHERE UserPMessageID = i_UserPMessageID AND SIGN(Flags & 2) = 1 ) ) THEN
	-- set IsInOutbox bit which will remove it from the senders outbox
		UPDATE {databaseName}.{objectQualifier}UserPMessage SET Flags = (Flags ^ 2) WHERE UserPMessageID = i_UserPMessageID;
		
		
	END IF;
	
	IF i_FromOutbox = 0 OR i_FromOutbox IS NULL THEN 
		-- The pmessage is in archive but still is in sender outbox
				  	
		IF ( 
	EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserPMessage
	WHERE UserPMessageID = i_UserPMessageID AND SIGN(Flags & 4) = 1 AND SIGN(Flags & 2) = 1 AND SIGN(Flags & 8) = 0) ) THEN
	  -- Remove archive flag
	UPDATE {databaseName}.{objectQualifier}UserPMessage SET Flags = (Flags ^ 4)   
	WHERE UserPMessageID = i_UserPMessageID;
	END IF;		
	  -- set IsInOutbox bit which will remove it from the senders outbox
      UPDATE {databaseName}.{objectQualifier}UserPMessage 
	  SET Flags = Flags ^ 8 WHERE UserPMessageID = i_UserPMessageID;	 
	 END IF;
	
	
	
	-- see if there are no longer references to this PM.
	IF ( EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserPMessageSelectView WHERE UserPMessageID = i_UserPMessageID AND IsInOutbox = 0 AND IsDeleted = 1 ) ) THEN
	-- delete
 		DELETE FROM {databaseName}.{objectQualifier}UserPMessage WHERE PMessageID = ici_PMessageID;
 		DELETE FROM {databaseName}.{objectQualifier}PMessage WHERE `PMessageID` = ici_PMessageID;
 	END IF;
 	
 	/*SET ici_MsgCount = (SELECT COUNT(UserPMessageID) FROM {databaseName}.{objectQualifier}UserPMessage  WHERE  Flags & 2 = 0 AND UserPMessageID = i_UserPMessageID) ;
 	
 	IF ici_MsgCount > 0 THEN
 	SET ici_dummy =1;
	DELETE FROM {databaseName}.{objectQualifier}UserPMessage WHERE PMessageID = ici_PMessageID;
	DELETE FROM {databaseName}.{objectQualifier}PMessage WHERE PMessageID = ici_PMessageID;
 	END IF;*/
 	
 END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_list(i_FromUserID INT,i_ToUserID INT,i_UserPMessageID INT) 
BEGIN
	SELECT PMessageID, UserPMessageID, FromUserID, FromUser, ToUserID, ToUser, Created, Subject, Body, Flags, IsRead, IsInOutbox, IsArchived, IsDeleted
 		FROM {databaseName}.{objectQualifier}PMessageView 		
 		WHERE	((i_UserPMessageID IS NOT NULL AND UserPMessageID=i_UserPMessageID) OR 
 				 (i_ToUserID   IS NOT NULL AND ToUserID = i_ToUserID) OR 
 				 (i_FromUserID IS NOT NULL AND FromUserID = i_FromUserID AND IsDeleted = 0))  
 		ORDER BY Created DESC;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_markread(i_UserPMessageID INT)

 BEGIN
 	UPDATE {databaseName}.{objectQualifier}UserPMessage SET `Flags` = `Flags` | 1 
 	WHERE UserPMessageID = i_UserPMessageID AND SIGN(`Flags` &  1) = 0;
/* IsRead */
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_info()
 BEGIN
 /* Is Read and Is Deleted bits */
SELECT
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}userpmessage 
 		WHERE IFNULL(SIGN(Flags & 1)>0,0) <>0   
 		AND SIGN(Flags & 8) <>0 ) AS NumRead, 		
 		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}userpmessage
 		WHERE IFNULL(SIGN(Flags & 1)=0,false) = 0   
 		AND SIGN(Flags & 8) <>0 ) AS NumUnread,
		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}userpmessage
		WHERE SIGN(Flags & 8) <>0 ) AS NumTotal;
		
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_prune(i_DaysRead INT,i_DaysUnread INT) 
BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}UserPMessage
 	WHERE CAST(SIGN((`Flags` | 4)  & 1) AS SIGNED)<>0
 	and DATEDIFF(UTC_TIMESTAMP(),
 	(SELECT x.Created FROM {databaseName}.{objectQualifier}PMessage x 
 	WHERE x.PMessageID={databaseName}.{objectQualifier}UserPMessage.PMessageID))>i_DaysRead;
 
 	DELETE FROM {databaseName}.{objectQualifier}UserPMessage
 	WHERE CAST(SIGN((`Flags` | 4)  & 1) AS SIGNED)=0
 	and DATEDIFF(UTC_TIMESTAMP(),(SELECT Created FROM {databaseName}.{objectQualifier}PMessage x 
 	WHERE x.PMessageID={databaseName}.{objectQualifier}UserPMessage.PMessageID))>i_DaysUnread;
 
 	DELETE FROM {databaseName}.{objectQualifier}PMessage
 	WHERE NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserPMessage x WHERE x.PMessageID={databaseName}.{objectQualifier}PMessage.PMessageID);
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pmessage_save(
 	i_FromUserID	INT,
 	i_ToUserID	INT,
 	i_Subject	VARCHAR(128),
 	i_Body		TEXT,
 	i_Flags		INT
 ) 
BEGIN
 	DECLARE ici_PMessageID INT;
 	DECLARE ici_UserID INT;
 
 	INSERT INTO {databaseName}.{objectQualifier}PMessage(FromUserID,Created,Subject,Body,Flags)
 	VALUES(i_FromUserID,UTC_TIMESTAMP(),i_Subject,i_Body,i_Flags);
 
 	SET ici_PMessageID = LAST_INSERT_ID();
 	IF (i_ToUserID = 0) THEN
 	
 		INSERT INTO {databaseName}.{objectQualifier}UserPMessage(UserID,PMessageID,Flags)
 		SELECT
 				a.UserID,ici_PMessageID,2
 		FROM
 				{databaseName}.{objectQualifier}User a
 				JOIN {databaseName}.{objectQualifier}UserGroup b on b.UserID=a.UserID
 				JOIN {databaseName}.{objectQualifier}Group c on c.GroupID=b.GroupID 
 				WHERE	(c.Flags & 2)=0 AND
 				c.BoardID=(SELECT BoardID from {databaseName}.{objectQualifier}User x 
 				WHERE  x.UserID=i_FromUserID) AND a.UserID<>i_FromUserID
 		                GROUP BY a.UserID;
 	
 	ELSE
 	
 		INSERT INTO {databaseName}.{objectQualifier}UserPMessage(UserID,PMessageID,Flags) 
                VALUES (i_ToUserID,ici_PMessageID,2);
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE procedure {databaseName}.{objectQualifier}poll_remove(
 	i_PollGroupID int, i_PollID int, i_BoardID INT, i_RemoveCompletely TINYINT(1), i_RemoveEverywhere TINYINT(1)
 ) 
 BEGIN
 declare ici_groupcount int;

 IF i_RemoveCompletely = 1  THEN
 	/* DELETE vote records first */
 	DELETE FROM {databaseName}.{objectQualifier}PollVote WHERE PollID = i_PollID;
 	/* DELETE choices first */
 	DELETE FROM {databaseName}.{objectQualifier}Choice WHERE PollID = i_PollID;
 	/* DELETE it from topic itself */
 	UPDATE {databaseName}.{objectQualifier}Poll SET PollGroupID = NULL WHERE PollID = i_PollID;
 	/* DELETE poll */
 	DELETE FROM {databaseName}.{objectQualifier}Poll WHERE PollID = i_PollID;
	DELETE FROM {databaseName}.{objectQualifier}Poll WHERE PollID = i_PollID;
		IF  NOT EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}Poll 
		     WHERE PollGroupID = i_PollGroupID LIMIT 1) THEN
          UPDATE {databaseName}.{objectQualifier}Topic set PollID = NULL where PollID = i_PollGroupID;
		  UPDATE {databaseName}.{objectQualifier}Forum set PollGroupID = NULL where PollGroupID = i_PollGroupID;
		  UPDATE {databaseName}.{objectQualifier}Category set PollGroupID = NULL where PollGroupID = i_PollGroupID; 
          DELETE FROM  {databaseName}.{objectQualifier}PollGroupCluster WHERE PollGroupID = i_PollGroupID;
		 END IF;     
	
 END IF;

 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}poll_stats(
i_PollID INT)
BEGIN

DECLARE iciCount INT;
DECLARE iciStats INT;
DECLARE ici_SumVotes INT;

SET ici_SumVotes =  (SELECT SUM(x.Votes)
FROM   {databaseName}.{objectQualifier}Choice x
WHERE  x.PollID = i_PollID);

IF ici_SumVotes =0 THEN SET iciCount =1;
ELSE
SET iciCount =ici_SumVotes ;
END IF;

SELECT 
        a.PollID,
		b.Question,
		b.Closes,
		b.UserID,		
		a.ObjectPath,
		a.MimeType,
		b.ObjectPath AS QuestionObjectPath,
		b.MimeType AS QuestionMimeType,
		a.ChoiceID,
		a.Choice,
		CAST(a.Votes AS SIGNED) AS Votes,
		-- is bound
		pg.Flags & 2 AS IsBound,
		-- is closed bound 
		b.Flags & 4 AS IsClosedBound,
		-- Allow Multiple Choices	
		b.Flags & 8 AS AllowMultipleChoices,
		b.Flags & 16 AS ShowVoters,
		b.Flags & 32 AS AllowSkipVote,
ici_SumVotes as Total,
CAST(100*a.Votes/iciCount AS UNSIGNED) AS Stats
FROM   {databaseName}.{objectQualifier}Choice a
JOIN
{databaseName}.{objectQualifier}Poll b 
ON a.PollID=b.PollID
INNER JOIN  
{databaseName}.{objectQualifier}PollGroupCluster pg 
ON pg.PollGroupID = b.PollGroupID
AND b.PollID = i_PollID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}pollgroup_stats(i_PollGroupID int) 
BEGIN
		SELECT		
		pg.UserID AS GroupUserID,	
		a.PollID,
		b.PollGroupID,
		b.Question,
		b.Closes,
		a.ChoiceID,		
		a.Choice,
		a.Votes as Votes,
		a.ObjectPath,
		a.MimeType,
		b.ObjectPath AS QuestionObjectPath,
		b.MimeType AS QuestionMimeType,
		-- is bound
		pg.Flags & 2 AS IsBound,
		-- is closed bound 
		b.Flags & 4 AS IsClosedBound,
		-- Allow Multiple Choices	
		b.Flags & 8 AS AllowMultipleChoices,
		SIGN(b.Flags & 16) AS ShowVoters,
		SIGN(b.Flags & 32) AS AllowSkipVote,
		(select sum(x.Votes) from {databaseName}.{objectQualifier}Choice x where  x.PollID = a.PollID) as Total,
		(select 100 * a.Votes / (case sum(x.Votes) when 0 then 1 else sum(x.Votes) end) from {databaseName}.{objectQualifier}Choice x where x.PollID=a.PollID) AS Stats
	FROM
		{databaseName}.{objectQualifier}Choice a		
	INNER JOIN 
		{databaseName}.{objectQualifier}Poll b ON b.PollID = a.PollID
	INNER JOIN  
		{databaseName}.{objectQualifier}PollGroupCluster pg ON pg.PollGroupID = b.PollGroupID	  
	WHERE
		pg.PollGroupID = i_PollGroupID
		ORDER BY b.PollGroupID;
	--	GROUP BY a.PollID, b.Question, b.Closes, a.ChoiceID, a.Choice,a.Votes
		END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}poll_update(
 	i_PollID		INT,
 	i_Question	VARCHAR(128),
 	i_Closes 	DATETIME,
	i_QuestionObjectPath varchar(255), 
    i_QuestionMimeType varchar(50),
	i_IsBounded  TINYINT(1),
	i_IsClosedBounded  TINYINT(1),
	i_AllowMultipleChoices TINYINT(1),
	i_ShowVoters TINYINT(1),
	i_AllowSkipVote TINYINT(1)
 ) 
BEGIN

declare ici_pgid int;
declare ici_flags int;

		update {databaseName}.{objectQualifier}Poll
		set Flags = 0 where PollID = i_PollID AND Flags IS NULL;

		SELECT Flags INTO ici_flags FROM {databaseName}.{objectQualifier}Poll		
		where PollID = i_PollID;

		-- is closed bound flag
		SET ici_flags = (CASE				
		WHEN i_IsClosedBounded > 0 AND (ici_flags & 4) <> 4 THEN ici_flags | 4		
		WHEN i_IsClosedBounded <= 0 AND (ici_flags & 4) = 4  THEN ici_flags ^ 4
		ELSE ici_flags END);

		-- allow multiple choices flag
		SET ici_flags = (CASE				
		WHEN i_AllowMultipleChoices > 0 AND (ici_flags & 8) <> 8 THEN ici_flags | 8		
		WHEN i_AllowMultipleChoices <= 0 AND (ici_flags & 8) = 8  THEN ici_flags ^ 8
		ELSE ici_flags END);

		-- show who's voted for a poll flag
		SET ici_flags = (CASE				
		WHEN i_ShowVoters > 0 AND (ici_flags & 16) <> 16 THEN ici_flags | 16		
		WHEN i_ShowVoters <= 0 AND (ici_flags & 16) = 16  THEN ici_flags ^ 16
		ELSE ici_flags END);

		-- allow users don't vote and see results
		SET ici_flags = (CASE				
		WHEN i_AllowSkipVote > 0 AND (ici_flags & 32) <> 32 THEN ici_flags | 32		
		WHEN i_AllowSkipVote <= 0 AND (ici_flags & 32) = 32  THEN ici_flags ^ 32
		ELSE ici_flags END);

	  update {databaseName}.{objectQualifier}Poll
		set Question	=	i_Question,
			Closes		=	i_Closes,
			ObjectPath = i_QuestionObjectPath,
		    MimeType = i_QuestionMimeType,
			Flags	= ici_flags
		where PollID = i_PollID;

      SELECT  PollGroupID INTO ici_pgid FROM {databaseName}.{objectQualifier}Poll
	  where PollID = i_PollID;
   
	update {databaseName}.{objectQualifier}PollGroupCluster
		set Flags	= (CASE 
		WHEN i_IsBounded > 0 AND (Flags & 2) <> 2 THEN Flags | 2 		
		WHEN i_IsBounded <= 0 AND (Flags & 2) = 2 THEN Flags ^ 2 		
		ELSE Flags END)		
		where PollGroupID = ici_pgid;	
 
END;
--GO



CREATE PROCEDURE {databaseName}.{objectQualifier}pollgroup_votecheck(i_PollGroupID int, i_UserID int, i_RemoteIP varchar(39)) 
BEGIN
	IF i_UserID IS NULL THEN
	  IF i_RemoteIP IS NOT NULL THEN		
			-- check by remote IP
			SELECT pv.PollID, pv.ChoiceID, u.Name as UserName FROM {databaseName}.{objectQualifier}PollVote pv
			JOIN {databaseName}.{objectQualifier}User u ON u.UserID = pv.UserID
			WHERE pv.PollID IN ( SELECT PollID FROM {databaseName}.{objectQualifier}Poll 
			WHERE PollGroupID = i_PollGroupID) AND pv.RemoteIP = i_RemoteIP;		
		ELSE		
		-- to get structure
		    SELECT pv.PollID, pv.ChoiceID, u.Name as UserName FROM {databaseName}.{objectQualifier}PollVote pv
			JOIN {databaseName}.{objectQualifier}User u ON u.UserID = pv.UserID
			WHERE pv.PollID IN ( SELECT PollID FROM {databaseName}.{objectQualifier}Poll 
			WHERE PollGroupID = i_PollGroupID);
		END IF;	 
	ELSE	    
		-- check by userid or remote IP
		SELECT pv.PollID, pv.ChoiceID, u.Name as UserName FROM {databaseName}.{objectQualifier}PollVote pv
		JOIN {databaseName}.{objectQualifier}User u ON u.UserID = pv.UserID
		WHERE pv.PollID IN (SELECT PollID FROM {databaseName}.{objectQualifier}Poll
		WHERE PollGroupID = i_PollGroupID) AND (pv.UserID = i_UserID OR pv.RemoteIP = i_RemoteIP);
    END IF;
	    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}pollvote_check(i_PollID INT, i_UserID INT,i_RemoteIP VARCHAR(39))
BEGIN
 	IF i_UserID IS NULL THEN 	
 		IF i_RemoteIP IS NOT NULL THEN 		
 			/*check by remote IP*/
 			SELECT PollVoteID FROM {databaseName}.{objectQualifier}PollVote
       WHERE PollID = i_PollID AND RemoteIP = i_RemoteIP;
 		END IF;
 	ELSE
 		/*check by userid or remote IP*/
 		  SELECT PollVoteID FROM {databaseName}.{objectQualifier}PollVote
       WHERE PollID = i_PollID AND (UserID = i_UserID OR RemoteIP = i_RemoteIP);
  END IF;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */


CREATE  PROCEDURE {databaseName}.{objectQualifier}post_alluser(
                i_BoardID    INT,
                i_UserID     INT,
                i_PageUserID INT,
                I_NumberOfMessages INT)
BEGIN
        
       PREPARE stmt_pau FROM 
	    'SELECT a.MessageID,
                a.Posted,
                c.Topic AS `Subject`,
                a.Message,
                a.IP,
                a.UserID,
                a.Flags,                
                IFNULL(a.UserName,b.Name) AS UserName,
                b.Signature,
                c.TopicID,
                c.ForumID,
				x.ReadAccess           
        FROM    {databaseName}.{objectQualifier}Message a
                 JOIN {databaseName}.{objectQualifier}User b
                   ON b.UserID = a.UserID
                 JOIN {databaseName}.{objectQualifier}Topic c
                   ON c.TopicID = a.TopicID
                 JOIN {databaseName}.{objectQualifier}Forum d
                   ON d.ForumID = c.ForumID
                 JOIN {databaseName}.{objectQualifier}Category e
                   ON e.CategoryID = d.CategoryID  
				 JOIN {databaseName}.{objectQualifier}ActiveAccess x 
				   ON x.ForumID=d.ForumID	           
        WHERE    a.UserID = ? AND
		         x.UserID = ? 
		         AND x.ReadAccess <> 0      
                 AND e.BoardID = ?
                AND (a.Flags & 24) = 16
                AND (c.Flags & 8) = 0
        ORDER BY a.Posted DESC LIMIT ?';
        
        SET @prp_PageUserID = i_PageUserID;
        SET @prp_UserID =  i_UserID;
        SET @prp_BoardID =  i_BoardID;
        SET @limit_all = I_NumberOfMessages;

    EXECUTE stmt_pau USING @prp_UserID, @prp_PageUserID, @prp_BoardID, @limit_all;
    DEALLOCATE PREPARE stmt_pau;         
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}post_list
(i_TopicID INT,
 i_AuthorUserID INT,
i_UpdateViewCount SMALLINT, 
i_ShowDeleted TINYINT(1), 
i_StyledNicks TINYINT(1),
i_SincePostedDate datetime, 
i_ToPostedDate datetime, 
i_SinceEditedDate datetime, 
i_ToEditedDate datetime, 
i_PageIndex int, 
i_PageSize int, 
i_SortPosted int, 
i_SortEdited int,
i_SortPosition int,				
i_ShowThanks TINYINT(1),
i_MessagePosition int
)
BEGIN
 declare ici_post_totalrowsnumber int default 0; 
   declare ici_firstselectrownum int; 
  
   declare ici_firstselectposted datetime;
   declare ici_firstselectedited datetime;

   declare ici_floor decimal;
   declare ici_ceiling decimal;
  
   declare ici_offset int; 
   
   declare ici_pagecorrection int;
   declare ici_pageshift int;

IF i_SortPosted IS NULL THEN
SET i_SortPosted = 2;
END IF;
/* IF i_PageIndex IS NULL OR i_PageIndex = 0 THEN
SET i_PageIndex = 1; 
END IF; */
SET i_PageIndex = i_PageIndex + 1;
 	/* how set nocount on */
 	IF i_UpdateViewCount>0 THEN
 		UPDATE {databaseName}.{objectQualifier}Topic 
 		SET `Views` = `Views` + 1 WHERE TopicID = i_TopicID;
 	END IF;

	-- find total returned count
		select
		COUNT(m.MessageID) INTO ici_post_totalrowsnumber
	from
		{databaseName}.{objectQualifier}Message m
	where
		m.TopicID = i_TopicID
		AND m.Flags & 16 = 16
		AND (m.Flags & 8 <> 8 OR ((i_ShowDeleted = 1 AND m.Flags & 8 = 8 ) 
		OR (i_AuthorUserID > 0 AND m.UserID = i_AuthorUserID)))
		AND m.Posted BETWEEN
		 i_SincePostedDate AND i_ToPostedDate;
		 /*
		AND 
		m.Edited >= SinceEditedDate
		*/

  -- number of messages on the last page @post_totalrowsnumber - @floor*@PageSize
   if (i_MessagePosition > 0) then
       -- round to ceiling - total number of pages  
       SET ici_ceiling = CEILING(CAST(ici_post_totalrowsnumber AS decimal)/i_PageSize) ;
       -- round to floor - a number of full pages
       SET ici_floor = FLOOR(CAST(ici_post_totalrowsnumber AS decimal)/i_PageSize);

       SET ici_pageshift = i_MessagePosition - (ici_post_totalrowsnumber - ici_floor*i_PageSize);
            if  ici_pageshift < 0
			   then
			      SET ici_pageshift = 0;
				     end if;  
   -- here pageshift converts to full pages 
   if (ici_pageshift <= 0)
   then    
   set ici_pageshift = 0;   
   else  
   set ici_pageshift = CEILING(CAST(ici_pageshift AS decimal)/i_PageSize); 
   end  if; 
   
   SET i_PageIndex = ici_ceiling -ici_pageshift ;
   if ici_ceiling != ici_floor then
   SET i_PageIndex = i_PageIndex - 1;
   end if;	      
   
   select (i_PageIndex) * i_PageSize + 1 INTO ici_firstselectrownum;  
  -- SET i_PageIndex = i_PageIndex + 2;

 else  
   -- select i_PageIndex + 1 INTO i_PageIndex;
   select (i_PageIndex-1) * i_PageSize + 1 INTO ici_firstselectrownum;
   
 end if;
  
   -- find first selectedrowid 
  /* if (ici_firstselectrownum > 0) then  
   set rowcount @firstselectrownum;
   else
   -- should not be 0
   set rowcount 1;
   end if; */

 PREPARE plist2 FROM 'select
CAST(? AS SIGNED) AS PostTotalRowsNumber,
m.Posted AS i_FirstSelectPosted,
m.Edited AS i_FirstSelectEdited,
CAST(? AS SIGNED) AS PageIndex
	from
		{databaseName}.{objectQualifier}Message m
		join {databaseName}.{objectQualifier}User b on b.UserID=m.UserID
		join {databaseName}.{objectQualifier}Topic d on d.TopicID=m.TopicID
		join {databaseName}.{objectQualifier}Forum g on g.ForumID=d.ForumID
		join {databaseName}.{objectQualifier}Category h on h.CategoryID=g.CategoryID
		join {databaseName}.{objectQualifier}Rank c on c.RankID=b.RankID
	where
		m.TopicID = ?
		-- IsApproved
		AND (m.Flags & 16) = 16
		-- IsDeleted
		AND ((m.Flags & 8) <> 8 OR ((? = 1 AND (m.Flags & 8) = 8) OR (? > 0 AND m.UserID = ?)))
		AND UNIX_TIMESTAMP(m.Posted) BETWEEN
		 UNIX_TIMESTAMP(?) AND UNIX_TIMESTAMP(?) 
		 /*
		AND m.Edited > @SinceEditedDate
		*/
		
	order by
		(case 
        when ? = 1 then m.Position end) ASC,	
		(case 
        when ? = 2 then m.Posted end) DESC,
		(case 
        when ? = 1 then m.Posted end) ASC, 
		(case 
        when ? = 2 then m.Edited end) DESC,
		(case
        when ? = 1 then m.Edited end) ASC LIMIT 1 OFFSET ?';

		SET @ii2_StyledNicks = i_StyledNicks;
        SET @iici2_post_totalrowsnumber = ici_post_totalrowsnumber;
        SET @ii2_PageIndex = i_PageIndex;
		SET @ii2_PageSize =  i_PageSize;
		SET @ii2_TopicID = i_TopicID;
		SET @ii2_AuthorUserID = i_AuthorUserID;
		SET @ii2_SortPosted = i_SortPosted;
		SET @ii2_SortEdited = i_SortEdited;
		SET @ii2_SortPosition = i_SortPosition;	
		SET @ici2_SincePostedDate = i_SincePostedDate;
		SET @ici2_ToPostedDate = i_ToPostedDate;

	    SET @ici_firstselectrownum = ici_firstselectrownum;
		SET @ici_offfirstselectrownum = ici_firstselectrownum - 1;
		SET @ici2_SinceEditedDate = i_SinceEditedDate;
		SET @ici2_ToEditedDate = i_ToEditedDate;		
		SET @ii2_ShowDeleted = i_ShowDeleted;


        EXECUTE plist2 USING 	
		@iici2_post_totalrowsnumber,
		@ii2_PageIndex,	
		@ii2_TopicID,
		@ii2_ShowDeleted,
		@ii_AuthorUserID, 
		@ii_AuthorUserID, 
		@ici2_SincePostedDate,
		@ici2_ToPostedDate,		
		@ii_SortPosition, 
		@ii_SortPosted, 
		@ii_SortPosted,
		@ii_SortEdited, 
		@ii_SortEdited,
		@ici_offfirstselectrownum;

		/* @ii_SortPosted, 
		@iici_firstselectposted, 
		@ii_SortPosted, 
		@iici_firstselectposted, 
		@ii_SortPosted, 
		@ii_SortPosition, 
		@ii_SortPosted, 
		@ii_SortPosted,
		@ii_SortEdited, 
		@ii_SortEdited; */
		 
		DEALLOCATE PREPARE plist2;
			 		
			
   -- SELECT FOUND_ROWS()

		

END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}post_list_result
(i_StyledNicks TINYINT(1),
 i_post_totalrowsnumber INT,
 i_PageIndex int, 
 i_PageSize int,
 i_TopicID INT,
 i_AuthorUserID INT,
 i_SortPosted int, 
 i_SortEdited int,
 i_SortPosition int,	
i_SincePostedDate datetime, 
i_ToPostedDate datetime, 
i_SinceEditedDate datetime, 
i_ToEditedDate datetime, 
i_FirstSelectPosted datetime,
i_FirstSelectEdited datetime,
i_ShowDeleted TINYINT(1)
)
BEGIN 
  
	PREPARE plist1 FROM 'select
		d.TopicID,		
		d.Flags AS TopicFlags,
		g.Flags AS ForumFlags,
		m.MessageID,
		m.Posted,
		d.Topic AS Subject,
		d.Status,
		m.Message AS Message, 
		m.UserID,
		m.Position,
		m.Indent,
		m.IP,
		m.Flags,
		m.EditReason,
		m.IsModeratorChanged,
		(m.Flags & 8) = 8 AS IsDeleted,
		m.DeleteReason,
		IfNull(m.UserName,b.Name) AS UserName,
		b.Joined,
		b.Avatar,
		b.Signature,
		b.NumPosts AS Posts,
		b.Points,
		d.Views,
		d.ForumID,
		c.Name AS RankName,		
		c.RankImage,
		-- i_StyledNicks
		(case(?)
			when 1 then  
			IFNULL(
			(SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=b.UserID 
		AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1),
		    c.Style)  
			else '''' end) as Style, 
		IFNULL(m.Edited,m.Posted) AS Edited,
		IFNULL((select 1 from {databaseName}.{objectQualifier}Attachment x 
		where x.MessageID=m.MessageID LIMIT 1),0) AS HasAttachments,
		IFNULL((select  1 from {databaseName}.{objectQualifier}User x 
		where x.UserID=b.UserID and AvatarImage is not null LIMIT 1),0) AS HasAvatarImage,
		-- ici_post_totalrowsnumber
		CAST(? AS UNSIGNED) AS TotalRows,
		-- i_PageIndex
		CAST(? AS UNSIGNED) AS PageIndex
	from
		{databaseName}.{objectQualifier}Message m
		join {databaseName}.{objectQualifier}User b on b.UserID=m.UserID
		join {databaseName}.{objectQualifier}Topic d on d.TopicID=m.TopicID
		join {databaseName}.{objectQualifier}Forum g on g.ForumID=d.ForumID
		join {databaseName}.{objectQualifier}Category h on h.CategoryID=g.CategoryID
		join {databaseName}.{objectQualifier}Rank c on c.RankID=b.RankID
	where
	   -- i_TopicID
		(m.TopicID = ?)
		-- IsApproved
 		AND IFNULL((m.Flags & 16)=16,false) 
		-- IsDeleted AuthorUserID	
 		 AND 
		(IFNULL((m.Flags & 8) <> 8,false) OR ((? = 1 AND IFNULL((m.Flags & 8 )= 8,false)) OR (? > 0 AND m.UserID = ?))) 
		AND 
		(m.Posted is null OR 
		(m.Posted is not null AND
		-- SortPosted
		(m.Posted >= (case 
        when ? = 1 then
		 ? end) OR m.Posted <= (case 
        when ? = 2 then ? end) OR
		m.Posted >= (case 
        when ? = 0 then 0 end))))	AND
		-- ToPostedDate
		(m.Posted <= (?))	
		/*
		AND (m.Edited is null OR (m.Edited is not null AND
		(m.Edited >= (case 
        when @SortEdited = 1 then @firstselectedited end) 
		OR m.Edited <= (case 
        when @SortEdited = 2 then @firstselectedited end) OR
		m.Edited >= (case 
        when @SortEdited = 0 then 0
		end)))) 
		*/
	order by		
		(case 
        when ? = 1 then m.Position end) ASC,	
		(case 
        when ? = 2 then m.Posted end) DESC,
		(case 
        when ? = 1 then m.Posted end) ASC, 
		(case 
        when ? = 2 then m.Edited end) DESC,
		(case 
        when ? = 1 then m.Edited end) ASC LIMIT ?'; 

		SET @ii_StyledNicks = i_StyledNicks;
        SET @iici_post_totalrowsnumber = i_post_totalrowsnumber;
        SET @ii_PageIndex = i_PageIndex;
		SET @ii_TopicID = i_TopicID;
		SET @ii_AuthorUserID = i_AuthorUserID;
		SET @ii_SortPosted = i_SortPosted;
		SET @iici_firstselectposted = i_FirstSelectPosted;
		SET @ii_ToPostedDate = i_ToPostedDate;
		SET @ii_SortPosition = i_SortPosition;	
		SET @ii_SortEdited = i_SortEdited;
		SET @ii_PageSize =  i_PageSize;
		SET @ii_ShowDeleted =  i_ShowDeleted;
        EXECUTE plist1 USING 
		@ii_StyledNicks, 
		@iici_post_totalrowsnumber, 
		@ii_PageIndex, 
		@ii_TopicID,
		@ii_ShowDeleted,
		@ii_AuthorUserID, 
		@ii_AuthorUserID, 
		@ii_SortPosted, 
		@iici_firstselectposted, 
		@ii_SortPosted, 
		@iici_firstselectposted,
		@ii_SortPosted, 
		@ii_ToPostedDate,
		@ii_SortPosition, 
		@ii_SortPosted, 
		@ii_SortPosted,
		@ii_SortEdited, 
		@ii_SortEdited,
		@ii_PageSize;
		 
		DEALLOCATE PREPARE plist1;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}post_list_reverse10(i_TopicID INT)
BEGIN
 	/*set nocount on*/
 
 	SELECT
 		a.Posted,
 		d.Topic AS `Subject`,
 		a.Message,
 		a.UserID,
 		a.Flags,
 		IFNULL(a.UserName,b.Name) AS UserName,
 		b.Signature
 	FROM
 		{databaseName}.{objectQualifier}Message a 
 		inner join {databaseName}.{objectQualifier}User b on b.UserID = a.UserID
 		inner join {databaseName}.{objectQualifier}Topic d on d.TopicID = a.TopicID
 	WHERE
 		(a.Flags & 24)=16 AND
 		a.TopicID = i_TopicID
 	ORDER BY
 		a.Posted DESC LIMIT 10;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}rank_delete(i_RankID INT) 
BEGIN
	DELETE from {databaseName}.{objectQualifier}Rank where RankID = i_RankID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE PROCEDURE {databaseName}.{objectQualifier}rank_list(i_BoardID INT,i_RankID INT) 
BEGIN
 	IF i_RankID IS NULL THEN
 		SELECT
 			a.*
 		FROM
 			{databaseName}.{objectQualifier}Rank a
 		WHERE
 			a.BoardID=i_BoardID
 		ORDER BY
 			a.SortOrder,
 			a.Name;
 	ELSE
 		SELECT
 			a.*
 		FROM
 			{databaseName}.{objectQualifier}Rank a
 		WHERE
 			a.RankID = i_RankID;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}rank_save(
 	i_RankID		INT,
	i_BoardID	INT,
 	i_Name		VARCHAR(128),
 	i_IsStart	TINYINT(1),
 	i_IsLadder	TINYINT(1),
 	i_MinPosts	INT,
 	i_RankImage	VARCHAR(128),
    i_PMLimit INT,
    i_Style VARCHAR(255),
    i_SortOrder SMALLINT,        
	i_Description VARCHAR(255),
	i_UsrSigChars INT,
	i_UsrSigBBCodes	VARCHAR(255),
	i_UsrSigHTMLTags VARCHAR(255),
	i_UsrAlbums INT,
	i_UsrAlbumImages INT
 ) 
BEGIN
 	DECLARE ici_Flags INT;
 
 	IF i_IsLadder=0 THEN SET i_MinPosts = NULL; END IF; 
 	IF i_IsLadder=1 AND i_MinPosts IS NULL THEN SET i_MinPosts = 0; END IF;
 	
 	SET ici_Flags = 0;
 	IF i_IsStart<>0 THEN SET ici_Flags = ici_Flags | 1; END IF;
 	IF i_IsLadder<>0 THEN SET ici_Flags = ici_Flags | 2; END IF;
 	
 	IF i_RankID>0 THEN
 		UPDATE {databaseName}.{objectQualifier}Rank 
                SET
 			`Name` = i_Name,
 			Flags = ici_Flags,
 			MinPosts = i_MinPosts,
 			RankImage = i_RankImage,
 			PMLimit = i_PMLimit,
 			Style = i_Style,
 			SortOrder = i_SortOrder, 			
			Description = i_Description,
		    UsrSigChars = i_UsrSigChars,
			UsrSigBBCodes = i_UsrSigBBCodes,
			UsrSigHTMLTags = i_UsrSigHTMLTags,
			UsrAlbums = i_UsrAlbums,
			UsrAlbumImages = i_UsrAlbumImages 
 		WHERE RankID = i_RankID;
 	
 	ELSE 
 		INSERT INTO {databaseName}.{objectQualifier}Rank(BoardID,`Name`,Flags,MinPosts,RankImage,PMLimit,Style,SortOrder,Description,UsrSigChars,UsrSigBBCodes,UsrSigHTMLTags,UsrAlbums,UsrAlbumImages)
 		VALUES(i_BoardID,i_Name,ici_Flags,i_MinPosts,i_RankImage,i_PMLimit,i_Style,i_SortOrder,i_Description,i_UsrSigChars,i_UsrSigBBCodes,i_UsrSigHTMLTags,i_UsrAlbums,i_UsrAlbumImages);
 	END IF;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}registry_list(i_Name VARCHAR(128),i_BoardID INT) 
BEGIN
 	IF i_BoardID IS NULL THEN
 	
 		IF i_Name IS NULL OR i_Name = '' THEN
 		
 			SELECT * FROM {databaseName}.{objectQualifier}Registry 
                        WHERE BoardID IS NULL;
 		 ELSE
 		
 			SELECT * FROM {databaseName}.{objectQualifier}Registry 
                        WHERE LOWER(`Name`) = LOWER(i_Name) and BoardID IS NULL;
 		END IF;
 	ELSE 	
 		IF i_Name IS NULL OR i_Name = '' THEN
 		
 			SELECT * FROM {databaseName}.{objectQualifier}Registry 
                        WHERE BoardID=i_BoardID;
 		 ELSE
 		
 			SELECT * FROM {databaseName}.{objectQualifier}Registry 
                        WHERE LOWER(`Name`) = LOWER(i_Name) and BoardID=i_BoardID;
 		END IF;
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}registry_save(
                i_Name    VARCHAR(128),
                i_Value   TEXT,
                i_BoardID INT)
BEGIN
        
        IF i_BoardID IS NULL THEN
        BEGIN
            IF EXISTS (SELECT 1
                       FROM   {databaseName}.{objectQualifier}Registry
                       WHERE  Lower(`Name`) = Lower(i_Name)) THEN
            UPDATE {databaseName}.{objectQualifier}Registry
            SET    VALUE = i_Value
            WHERE  Lower(`Name`) = Lower(i_Name)
            AND BoardID IS NULL;
            ELSE            
                INSERT INTO {databaseName}.{objectQualifier}Registry
                           (`Name`,
                            VALUE)
                VALUES     (Lower(i_Name),
                            i_Value);
            END IF;
        END;
        ELSE
        BEGIN
            IF EXISTS (SELECT 1
                       FROM   {databaseName}.{objectQualifier}Registry
                       WHERE  Lower(`Name`) = Lower(i_Name)
                       AND BoardID = i_BoardID) THEN
            UPDATE {databaseName}.{objectQualifier}Registry
            SET    VALUE = i_Value
            WHERE  Lower(`Name`) = Lower(i_Name)
            AND BoardID = i_BoardID;
            ELSE            
                INSERT INTO {databaseName}.{objectQualifier}Registry
                           (`Name`,
                            VALUE,
                            BoardID)
                VALUES     (Lower(i_Name),
                            i_Value,
                            i_BoardID);
            END IF;
        END;
        END IF;
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}replace_words_delete(i_ID INT)
 BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}replace_words WHERE id = i_ID;
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}replace_words_list
 (
 	i_BoardID INT,
 	i_ID INT
 )
 BEGIN
 	IF (i_ID IS NOT NULL AND i_ID <> 0) THEN
 		SELECT * FROM {databaseName}.{objectQualifier}Replace_Words WHERE BoardID = i_BoardID AND ID = i_ID;
 	ELSE
 		SELECT * FROM {databaseName}.{objectQualifier}Replace_Words WHERE BoardID = i_BoardID;
        END IF;
 END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */ 
 CREATE PROCEDURE {databaseName}.{objectQualifier}replace_words_save
 (
 	i_BoardID INT,
 	i_ID INT,
 	i_BadWord VARCHAR(255),
 	i_GoodWord VARCHAR(255)
 )
 BEGIN
 	IF (i_ID IS NOT NULL AND i_ID <> 0) THEN 	
 		UPDATE {databaseName}.{objectQualifier}replace_words SET BadWord = i_BadWord, GoodWord = i_GoodWord WHERE ID = i_ID;		
 	 	ELSE 
 		INSERT INTO {databaseName}.{objectQualifier}replace_words
 			(BoardID,BadWord,GoodWord)
 		VALUES
 			(i_BoardID,i_BadWord,i_GoodWord);
 	END IF;
 END;
--GO

/*****************************************************************************************************
//  Original code by: DLESKTECH at http://www.dlesktech.com/support.aspx
//  Modifications by: KASL Technologies at www.kasltechnologies.com
//  Modifications for integration into YAF/Conventions by Jaben Cargman
//  Rewritten by vzrus for mysql database.
*****************************************************************************************************/

CREATE  PROCEDURE {databaseName}.{objectQualifier}shoutbox_getmessages(
 i_BoardId int, I_NumberOfMessages INT, I_StyledNicks TINYINT(1))
BEGIN
SET @limit_shsl_style = I_StyledNicks;
SET @limit_shsl_emptystyle = '';
SET @limit_shsl_boardid = i_BoardId;
SET @limit_shsl = I_NumberOfMessages;
PREPARE stmt_shsl FROM 'SELECT
		sh.Username,
		sh.UserID,
		sh.`Message`,
		sh.ShoutBoxMessageID,
		sh.`Date`,
		(case(?) 
	        when 1 then {databaseName}.{objectQualifier}get_userstyle(sh.UserID)  
	        else ?	end ) AS Style    
	FROM
		{databaseName}.{objectQualifier}ShoutboxMessage sh
		WHERE 
		sh.BoardID = ?
	ORDER BY sh.Date DESC LIMIT ?';

    EXECUTE stmt_shsl USING @limit_shsl_style,@limit_shsl_emptystyle, @limit_shsl_boardid, @limit_shsl;
    DEALLOCATE PREPARE stmt_shsl;         
    END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}shoutbox_savemessage(
    i_BoardId int,
	i_UserID		int,
	i_UserName		varchar(128),	
	i_Message		text,
	i_Date			datetime,
	i_IP			varchar(39)
)
BEGIN
	-- i_UserName def null
	-- i_Date def null
	IF i_Date IS NULL THEN
		SET i_Date = UTC_TIMESTAMP();
		END IF;
	INSERT {databaseName}.{objectQualifier}ShoutboxMessage (BoardID, UserName, UserID, `Message`, `Date`, IP)
	VALUES (i_BoardId, i_UserName, i_UserID, i_Message, i_Date, i_IP);

END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}shoutbox_clearmessages(i_BoardId int)
BEGIN
	DELETE FROM {databaseName}.{objectQualifier}ShoutboxMessage 
	WHERE BoardID = i_BoardId AND DATEDIFF(UTC_DATE(),LastPosted) > 1;
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}smiley_delete(i_SmileyID INT)
BEGIN
 	IF i_SmileyID IS NOT NULL THEN
 		DELETE FROM {databaseName}.{objectQualifier}Smiley WHERE SmileyID=i_SmileyID;
 	ELSE
 		DELETE FROM {databaseName}.{objectQualifier}Smiley;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}smiley_list(
                 i_BoardID INT,
				 i_SmileyID INT) 
BEGIN
IF i_SmileyID IS NULL THEN
 		SELECT 	
		SmileyID,
		BoardID,
		Code,
		Icon,
		Emoticon,
		CAST(SortOrder AS SIGNED) AS SortOrder
		FROM {databaseName}.{objectQualifier}Smiley WHERE BoardID=i_BoardID ORDER BY SortOrder, CHAR_LENGTH(Code) DESC;
 	ELSE
 		SELECT 		
		SmileyID,
		BoardID,
		Code,
		Icon,
		Emoticon,
		SortOrder = CAST(SortOrder AS SIGNED) 
		FROM {databaseName}.{objectQualifier}Smiley WHERE SmileyID=i_SmileyID ORDER BY SortOrder;
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}smiley_listunique(i_BoardID INT) 
BEGIN
 	SELECT 
 		Icon, 
 		Emoticon,
 		(SELECT Code from {databaseName}.{objectQualifier}Smiley x where x.Icon={databaseName}.{objectQualifier}Smiley.Icon ORDER BY Code LIMIT 1) AS Code,
 		(SELECT SortOrder from {databaseName}.{objectQualifier}Smiley x where x.Icon={databaseName}.{objectQualifier}Smiley.Icon ORDER BY x.SortOrder ASC LIMIT 1) AS SortOrder
 	FROM 
 		{databaseName}.{objectQualifier}Smiley
 	WHERE
 		BoardID=i_BoardID
 	GROUP BY
 		Icon,
 		Emoticon
 	ORDER BY
 		SortOrder,
 		Code;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}smiley_resort(i_BoardID INT,i_SmileyID INT,i_Move INT)
BEGIN
 	DECLARE ici_Position INT;
 
 	SELECT SortOrder INTO ici_Position FROM {databaseName}.{objectQualifier}Smiley WHERE BoardID=i_BoardID AND SmileyID=i_SmileyID;
 
 	IF (ici_Position IS NOT NULL) THEN
 
 	IF (i_Move > 0) THEN
 		UPDATE {databaseName}.{objectQualifier}Smiley
 			SET SortOrder=SortOrder-1
 			WHERE BoardID=i_BoardID and 
 				SortOrder BETWEEN ici_Position AND (ici_Position + i_Move) AND
 				SortOrder BETWEEN 1 and 255;
 	
 	ELSEIF (i_Move < 0) THEN
 		update {databaseName}.{objectQualifier}Smiley
 			set SortOrder=SortOrder+1
 			where BoardID=i_BoardID and 
 				SortOrder between (ici_Position+i_Move) and ici_Position and
 				SortOrder between 0 and 254;
 	END IF;
 
 	SET ici_Position = ici_Position + i_Move;
 
 	IF (ici_Position>255) THEN SET ici_Position = 255;
 	ELSEIF (ici_Position<0) THEN  SET ici_Position = 0; END IF;

 	UPDATE {databaseName}.{objectQualifier}Smiley
 		SET SortOrder=ici_Position
 		WHERE BoardID=i_BoardID AND 
 			SmileyID=i_SmileyID;
END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}smiley_save
(i_SmileyID INT,i_BoardID INT,i_Code VARCHAR(10),i_Icon VARCHAR(128),i_Emoticon VARCHAR(128),i_SortOrder TINYINT(3),i_Replace TINYINT(1)) 
BEGIN
 	IF i_SmileyID IS NOT NULL THEN
 		UPDATE {databaseName}.{objectQualifier}Smiley SET Code = i_Code, Icon = i_Icon, Emoticon = i_Emoticon, SortOrder = i_SortOrder WHERE SmileyID = i_SmileyID;
 	
 	ELSE
 		IF i_Replace>0 THEN
 			DELETE FROM {databaseName}.{objectQualifier}Smiley WHERE Code=i_Code; 
                END IF;
 
 		IF NOT EXISTS(SELECT 1 from {databaseName}.{objectQualifier}Smiley 
                               WHERE BoardID=i_BoardID AND Code=i_Code) THEN
 			INSERT INTO {databaseName}.{objectQualifier}Smiley(BoardID,Code,Icon,Emoticon,SortOrder)
 			                          VALUES(i_BoardID,i_Code,i_Icon,i_Emoticon,i_SortOrder); 
                END IF;
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}system_initialize(
 	i_Name		VARCHAR(128),
 	i_TimeZone	INT,
 	i_Culture	char(5),
	i_LanguageFile VARCHAR(128),
 	i_ForumEmail	VARCHAR(128),
 	i_SmtpServer	VARCHAR(128),
 	i_User		VARCHAR(128),
 	i_UserEmail	VARCHAR(255),
 	i_UserKey	CHAR(36),
	i_RolePrefix VARCHAR(128)
 	
 ) BEGIN
 	DECLARE ici_tmpValue VARCHAR(128);
 
 	
 	SET ici_tmpValue = CAST(i_TimeZone AS CHAR(100));
 	CALL {databaseName}.{objectQualifier}registry_save ('TimeZone', ici_tmpValue,null);
 	CALL {databaseName}.{objectQualifier}registry_save ('SmtpServer', i_SmtpServer,null);
 	CALL {databaseName}.{objectQualifier}registry_save ('ForumEmail', i_ForumEmail,null);
 	
    CALL {databaseName}.{objectQualifier}registry_save('culture',i_Culture,null);
	CALL {databaseName}.{objectQualifier}registry_save('language',i_LanguageFile,null);
	    
 	 /*initalize new board*/
 	CALL {databaseName}.{objectQualifier}board_create (i_Name, i_Culture, i_LanguageFile, null,null,i_User,i_UserEmail,i_UserKey,1,i_RolePrefix);
 	 /*initalize required 'registry' settings*/
 	CALL {databaseName}.{objectQualifier}registry_save ('version','1',null);
 	CALL {databaseName}.{objectQualifier}registry_save ('versionName','1.0.0',null);
 END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}system_updateversion
(
	i_Version		INT,
	i_VersionName	VARCHAR(128)
) 

BEGIN

	DECLARE ici_tmpValue VARCHAR (100);
	SET ici_tmpValue= CAST(i_Version AS CHAR(100));
	CALL {databaseName}.{objectQualifier}registry_save ('Version',ici_tmpValue,null);
	CALL {databaseName}.{objectQualifier}registry_save ('VersionName',i_VersionName,null);

END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_active
                 (i_BoardID INT,
				 i_PageUserID INT,
				 i_Since DATETIME,
				 i_CategoryID INT,
				 i_StyledNicks TINYINT(1),
				 i_FindLastRead TINYINT(1)) 
BEGIN
 	SELECT
 		c.ForumID,
 		c.TopicID,
		c.TopicMovedID,
		c.`Status`,
 		c.Posted,
 		IFNULL(c.TopicMovedID,c.TopicID) AS LinkTopicID,
 		c.Topic AS Subject,
		c.Description,
 		c.UserID,
 		IFNULL(c.UserName,b.Name) AS Starter,
 		(SELECT COUNT(1) 
                      FROM {databaseName}.{objectQualifier}MessageSelectView mes 
                      WHERE mes.TopicID = c.TopicID 
                        AND mes.IsDeleted = 1 
                        AND mes.IsApproved = 1 
                        AND ((i_PageUserID IS NOT NULL AND mes.UserID = i_PageUserID) 
                        OR (i_PageUserID IS NULL)) ) AS NumPostsDeleted,
 		((SELECT COUNT(1) FROM {databaseName}.{objectQualifier}Message x WHERE x.TopicID=c.TopicID and (x.Flags & 8)=0) - 1)
                 AS Replies,
 		c.Views AS Views,
 		c.LastPosted AS LastPosted ,
 		c.LastUserID AS LastUserID,
 		IFNULL(c.LastUserName,(SELECT `Name` FROM {databaseName}.{objectQualifier}User x where x.UserID=c.LastUserID)) AS                   LastUserName,
 		c.LastMessageID AS LastMessageID,
		LastMessageFlags = c.LastMessageFlags,
 		c.TopicID AS LastTopicID,
 		c.Flags AS TopicFlags,
		(SELECT COUNT(ID) FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE TopicID = IFNULL(c.TopicMovedID,c.TopicID)) as FavoriteCount,
 		c.Priority,
 		c.PollID,
 		d.Name AS ForumName,
 		c.TopicMovedID,
 		d.Flags AS ForumFlags, 
 	    (SELECT CAST(`Message` AS CHAR(1000)) 
 	    FROM {databaseName}.{objectQualifier}Message mes2 
 	    where mes2.TopicID = IFNULL(c.TopicMovedID,c.TopicID) 
 	    AND mes2.Position = 0) AS FirstMessage,
 	     (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.UserID)  
	        else ''	 end) AS  StarterStyle,
	    (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.LastUserID)  
	        else ''	 end ) AS LastUserStyle,
	    (case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=d.ForumID AND x.UserID = i_PageUserID limit 1)
		     else null	 end) AS LastForumAccess,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=c.TopicID AND y.UserID = i_PageUserID limit 1)
		     else null	 end) AS  LastTopicAccess    
 	FROM
 		{databaseName}.{objectQualifier}Topic c
 		JOIN {databaseName}.{objectQualifier}User b ON b.UserID=c.UserID
 		JOIN {databaseName}.{objectQualifier}Forum d ON d.ForumID=c.ForumID
 		join {databaseName}.{objectQualifier}ActiveAccess x on x.ForumID=d.ForumID
 		JOIN {databaseName}.{objectQualifier}Category e ON e.CategoryID=d.CategoryID
 	WHERE
 		UNIX_TIMESTAMP(i_Since) < UNIX_TIMESTAMP(c.LastPosted) AND 	
 		x.UserID = i_PageUserID and
		x.ReadAccess <> 0 
 		 AND e.BoardID = i_BoardID AND
    (i_CategoryID IS NULL OR e.CategoryID=i_CategoryID) AND    
    -- is deleted
    IFNULL(SIGN(c.Flags & 8),0) = 0 AND
	c.TopicMovedID is null 
    ORDER BY
	e.SortOrder asc,
	d.SortOrder asc,
    d.Name DESC,
    Priority DESC,
    LastPosted DESC;
    END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM topic_announcements */
    CREATE PROCEDURE {databaseName}.{objectQualifier}topic_create_by_message (
    i_MessageID      INT,
    i_ForumID	INT,
    i_Subject	VARCHAR(128)
    )
    BEGIN


    DECLARE		ici_UserID		INT;
    DECLARE		ici_Posted		DATETIME;
    DECLARE i_TopicID INT;

   SELECT UserID,Posted INTO ici_UserID,ici_Posted  from {databaseName}.{objectQualifier}message WHERE MessageID =  i_MessageID;


    /*declare i_MessageID int*/

    IF ici_Posted IS NULL THEN SET ici_Posted = UTC_TIMESTAMP(); END IF;

    INSERT INTO {databaseName}.{objectQualifier}Topic(ForumID,Topic,UserID,Posted,Views,Priority,PollID,UserName,NumPosts)
    VALUES(i_ForumID,i_Subject,ici_UserID,ici_Posted,0,0,null,null,0);

    SET i_TopicID = LAST_INSERT_ID();
  /*CALL {databaseName}.{objectQualifier}message_save (i_TopicID,ici_UserID,i_Message,i_UserName,i_IP,ici_Posted,null,null,i_Flags, i_MessageID);*/
    SELECT i_TopicID AS TopicID,i_MessageID AS MessageID;
    END;

--GO
    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}topic_delete (i_TopicID int,i_UpdateLastPost TINYINT(1),i_EraseTopic TINYINT(1))
    BEGIN
    /*SET NOCOUNT ON*/
    DECLARE ici_ForumID INT;
    DECLARE ici_ForumID2 INT;
    DECLARE ici_pollID INT;
    DECLARE ici_Deleted INT;

    SELECT ForumID INTO ici_ForumID  FROM  {databaseName}.{objectQualifier}Topic 
    WHERE TopicID=i_TopicID;
    UPDATE  {databaseName}.{objectQualifier}Topic SET LastMessageID = NULL 
    WHERE TopicID = i_TopicID; 

  UPDATE  {databaseName}.{objectQualifier}Forum SET
    LastTopicID = NULL,
    LastMessageID = NULL,
    LastUserID = NULL,
    LastUserName = NULL,
    LastPosted = NULL
    WHERE LastMessageID IN (SELECT MessageID from  {databaseName}.{objectQualifier}Message 
    where TopicID = i_TopicID); 
    
      
    UPDATE  {databaseName}.{objectQualifier}Active SET TopicID = NULL WHERE TopicID = i_TopicID;

    /*delete messages and topics*/
    DELETE FROM  {databaseName}.{objectQualifier}nntptopic WHERE TopicID = i_TopicID;
    UPDATE {databaseName}.{objectQualifier}topic SET PollID = NULL WHERE TopicID = i_TopicID AND TopicMovedID IS NOT NULL;
    

    IF i_EraseTopic = 0 THEN
    UPDATE  {databaseName}.{objectQualifier}topic SET `Flags` = `Flags` | 8 WHERE TopicID = i_TopicID OR TopicMovedID = i_TopicID;
    UPDATE  {databaseName}.{objectQualifier}message SET `Flags` = `Flags` | 8 WHERE TopicID = i_TopicID;
    ELSE
         -- remove polls	
            SELECT  pollID INTO ici_pollID FROM  {databaseName}.{objectQualifier}topic WHERE TopicID = i_TopicID;
    IF ici_pollID IS NOT NULL THEN
    UPDATE  {databaseName}.{objectQualifier}topic set PollID = NULL where TopicID = i_TopicID;
	CALL {databaseName}.{objectQualifier}pollgroup_remove(ici_pollID, i_TopicID, null, null, null, 0, 0); 
    END IF; 
     
    DELETE FROM  {databaseName}.{objectQualifier}topic WHERE TopicMovedID = i_TopicID;	
	
    DELETE FROM  {databaseName}.{objectQualifier}Attachment
    WHERE MessageID IN
    (SELECT MessageID FROM  {databaseName}.{objectQualifier}Message WHERE TopicID = i_TopicID);
    DELETE FROM {databaseName}.{objectQualifier}MessageHistory where MessageID IN (select MessageID from  {databaseName}.{objectQualifier}message where TopicID = i_TopicID);
    DELETE FROM {databaseName}.{objectQualifier}Message WHERE TopicID = i_TopicID;
    DELETE FROM {databaseName}.{objectQualifier}WatchTopic WHERE TopicID = i_TopicID;
    DELETE FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID; 
	DELETE FROM {databaseName}.{objectQualifier}Topic WHERE  TopicMovedID = i_TopicID;
    DELETE FROM {databaseName}.{objectQualifier}MessageReportedAudit where MessageID IN (select MessageID from  {databaseName}.{objectQualifier}message where TopicID = i_TopicID); 
	DELETE FROM {databaseName}.{objectQualifier}MessageReported where MessageID IN (select MessageID from  {databaseName}.{objectQualifier}message where TopicID = i_TopicID);	
    DELETE FROM {databaseName}.{objectQualifier}FavoriteTopic  WHERE TopicID = i_TopicID;

    END IF;

    /*commit*/
    IF i_UpdateLastPost<>0 THEN
 		CALL  {databaseName}.{objectQualifier}forum_updatelastpost (ici_ForumID);
 		END IF;
 	
 	IF ici_ForumID IS NOT NULL THEN 		
 		CALL  {databaseName}.{objectQualifier}forum_updatestats(ici_ForumID); 
 		END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_findnext(i_TopicID INT) 
BEGIN
 	DECLARE ici_LastPosted DATETIME;
 	DECLARE ici_ForumID INT;
 	SELECT LastPosted,ForumID INTO ici_LastPosted, ici_ForumID  FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID;
 	SELECT TopicID FROM {databaseName}.{objectQualifier}Topic WHERE UNIX_TIMESTAMP(LastPosted)>UNIX_TIMESTAMP(ici_LastPosted) AND ForumID = ici_ForumID AND (Flags & 8) = 0 ORDER BY LastPosted ASC LIMIT 1;
END;
--GO

create procedure {databaseName}.{objectQualifier}pollgroup_remove(i_PollGroupID int, i_TopicID int, i_ForumID int, i_CategoryID int, i_BoardID int, i_RemoveCompletely TINYINT(1), i_RemoveEverywhere TINYINT(1))
  begin   
	declare ici_tmp int;
	
	
			 -- we delete poll from the place only it persists in other places 
		 if i_RemoveEverywhere <> 1
			 then
				   if i_TopicID > 0 then
				   Update {databaseName}.{objectQualifier}Topic set PollID = NULL where TopicID = i_TopicID;                 
                   end if; 
				   if i_ForumID > 0 then
                   Update {databaseName}.{objectQualifier}Forum set PollGroupID = NULL where ForumID = i_ForumID;
                   end if; 
	               if i_CategoryID > 0 then
                   Update {databaseName}.{objectQualifier}Category set PollGroupID = NULL where CategoryID = i_CategoryID;
                   end if;
		     end if;        
		    
	      -- we remove poll group links from all places where they are
	     if (i_RemoveEverywhere = 1 OR i_RemoveCompletely = 1)
		 then
				   Update {databaseName}.{objectQualifier}Topic set PollID = NULL where PollID = i_PollGroupID;
                   Update {databaseName}.{objectQualifier}Forum set PollGroupID = NULL where PollGroupID = i_PollGroupID;
				   Update {databaseName}.{objectQualifier}Category set PollGroupID = NULL where PollGroupID = i_PollGroupID;				 
         end if;

		 -- simply remove all polls
	if i_RemoveCompletely = 1 
	then	   
			DELETE FROM  {databaseName}.{objectQualifier}pollvote WHERE PollID IN (select PollID from {databaseName}.{objectQualifier}Poll where PollGroupID = i_PollGroupID);
			DELETE FROM  {databaseName}.{objectQualifier}choice WHERE PollID IN (select PollID from {databaseName}.{objectQualifier}Poll where PollGroupID = i_PollGroupID);	
			DELETE FROM  {databaseName}.{objectQualifier}poll WHERE PollGroupID = i_PollGroupID; 
			DELETE FROM  {databaseName}.{objectQualifier}PollGroupCluster WHERE PollGroupID = i_PollGroupID;		
    end  if;

	-- don't remove cluster if the polls are not removed from db 
	end;
--GO

create procedure {databaseName}.{objectQualifier}pollgroup_attach(i_PollGroupID int, i_TopicID int, i_ForumID int, i_CategoryID int, i_BoardID int) 
begin
                   -- this deletes possible polls without choices it should not normally happen
			                 
				--  DELETE FROM {databaseName}.{objectQualifier}PollVote WHERE PollID IN (SELECT PollID FROM {databaseName}.{objectQualifier}Poll WHERE PollGroupID = NULL);
				--  DELETE FROM {databaseName}.{objectQualifier}Choice WHERE PollID IN (SELECT PollID FROM {databaseName}.{objectQualifier}Poll WHERE PollGroupID = NULL);
				--  DELETE FROM {databaseName}.{objectQualifier}Poll WHERE PollID IN (SELECT PollID FROM {databaseName}.{objectQualifier}Poll WHERE PollGroupID = NULL);
				   				   
                   if NOT EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}Poll WHERE PollGroupID IS NULL LIMIT 1)
				   then
	               if i_TopicID > 0
				   then
				   if exists (select 1 from {databaseName}.{objectQualifier}Topic where TopicID = i_TopicID  and PollID is not null)
				   then
				   SELECT 1;				  
				   else				  
				   Update {databaseName}.{objectQualifier}Topic set PollID = i_PollGroupID where TopicID = i_TopicID; 
				   SELECT 10;
				   end if;
				   end if;            
                  
				   if i_ForumID > 0
				   then
				   if exists (select 1 from {databaseName}.{objectQualifier}Forum where ForumID = i_ForumID and PollGroupID is not null)
                   then
				   SELECT 1;				  
				   else				  
				   Update {databaseName}.{objectQualifier}Forum set PollGroupID = i_PollGroupID where ForumID = i_ForumID;
                   SELECT 0;
				   end if;
				   end if;

	               if i_CategoryID > 0
				   then
				   if exists (select 1 from {databaseName}.{objectQualifier}Category where CategoryID = i_CategoryID and PollGroupID is null)
                   then
				   SELECT 1;				   
				   else				   
				   Update {databaseName}.{objectQualifier}Category set PollGroupID = i_PollGroupID where CategoryID = i_CategoryID;
                   SELECT 0;
				   end if;
				   end if;
				   end if;
				   SELECT 1;	               

end;
--GO

create procedure {databaseName}.{objectQualifier}pollgroup_list(i_UserID int, i_ForumID int, i_BoardID int)
begin
	select 
	distinct(p.Question),
	        p.PollGroupID 
	from {databaseName}.{objectQualifier}Poll p
	LEFT JOIN {databaseName}.{objectQualifier}PollGroupCluster pgc 
	ON pgc.PollGroupID = p.PollGroupID
	WHERE p.PollGroupID is not null
	-- WHERE p.Closes IS NULL OR p.Closes > UTC_TIMESTAMP()
	order by Question asc;
end;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}topic_findprev(i_TopicID INT)  
 BEGIN
 	DECLARE ici_LastPosted DATETIME;
	DECLARE ici_ForumID INT;
 	SELECT LastPosted,ForumID INTO ici_LastPosted,ici_ForumID 
          FROM {databaseName}.{objectQualifier}Topic 
            WHERE TopicID = i_TopicID;
 	SELECT TopicID from {databaseName}.{objectQualifier}Topic WHERE UNIX_TIMESTAMP(LastPosted)<UNIX_TIMESTAMP(ici_LastPosted) AND ForumID = ici_ForumID AND (Flags & 8) = 0 ORDER BY LastPosted DESC LIMIT 1;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_info
 (
 	i_TopicID INT,
 	i_ShowDeleted TINYINT(1)
 )
 BEGIN
 	IF i_TopicID = 0 THEN SET i_TopicID = NULL; END IF;
 
 	IF i_TopicID IS NULL THEN
 	
 		IF i_ShowDeleted = 1 THEN
 			SELECT * FROM {databaseName}.{objectQualifier}Topic;
 		ELSE
 			SELECT * FROM {databaseName}.{objectQualifier}Topic WHERE (Flags & 8) = 0;
 	END IF;
 	ELSE 	
 		IF i_ShowDeleted = 1 THEN
 			SELECT * FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID;
 		ELSE
 			SELECT * FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID AND (Flags & 8) = 0;		
 	END IF;
        END IF; 
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_findduplicate
(
	i_TopicName varchar(255)
)
BEGIN
	IF i_TopicName IS NOT NULL
	THEN	
		IF EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}Topic WHERE Topic LIKE  i_TopicName AND TopicMovedID IS NULL LIMIT 1)
		THEN
		SELECT 1;
		ELSE
		SELECT 0;
    END IF;
	ELSE	
		SELECT 0;
	END	IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}topic_list
 (
 	i_ForumID INT,
 	i_UserID INT,
 	i_Announcement INT,
 	i_Date DATETIME,
 	i_Offset INT,
 	i_Count INT,
 	i_StyledNicks TINYINT(1),
	i_ShowMoved TINYINT(1),
	i_FindLastRead TINYINT(1)
 )
BEGIN
    DECLARE	ici_RowCount INT;
    DECLARE	ici_ShowMoved CHAR(5); 
          
    DROP TEMPORARY TABLE IF EXISTS temptable2 ;
 	CREATE TEMPORARY TABLE temptable2
        (
		RowNo   INT auto_increment NOT NULL,
        TopicID INT NOT NULL, 
		PRIMARY KEY (`RowNo`)
		); 
 
 	INSERT INTO  temptable2(TopicID)
 	SELECT
 		c.TopicID
 	FROM
 		{databaseName}.{objectQualifier}Topic c 
          JOIN {databaseName}.{objectQualifier}User b ON b.UserID=c.UserID 
          JOIN {databaseName}.{objectQualifier}Forum d on d.ForumID=c.ForumID
 	WHERE
 		c.ForumID = i_ForumID
 	AND
 		(i_Date IS NULL OR UNIX_TIMESTAMP(c.Posted)>=UNIX_TIMESTAMP(i_Date) 
 		OR UNIX_TIMESTAMP(c.LastPosted)>=UNIX_TIMESTAMP(i_Date) OR c.Priority>0) 
 	AND
 		((i_Announcement=1 AND c.Priority=2) 
 		OR (i_Announcement=0 and c.Priority<>2) OR (i_Announcement<0)) 
 	AND	
 		(c.TopicMovedID IS NOT NULL OR c.NumPosts > 0) 
 	AND
 		IFNULL(SIGN(c.Flags & 8),0) = 0
 	ORDER BY
 		c.Priority DESC,
 		c.LastPosted DESC;
 
 	
 	SET ici_RowCount = (SELECT COUNT(1) FROM temptable2);
 
   IF TRIM(ici_ShowMoved) = '1' OR LOWER(TRIM(ici_ShowMoved)) = 'true' THEN
 	SELECT
 		ici_RowCount AS `RowCount`,
 		c.ForumID,
 		c.TopicID,
		c.`Status` AS Status,
 		c.Posted,
 		IFNULL(c.TopicMovedID,c.TopicID) AS LinkTopicID,
 		c.TopicMovedID,
		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE TopicID = IfNull(c.TopicMovedID,c.TopicID)) AS FavoriteCount,
 		c.Topic AS `Subject`,
		c.Description,
 		c.UserID,
 		 IFNULL(c.UserName,b.Name) AS Starter,
 		 c.NumPosts - 1  AS Replies,
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}MessageSelectView mes 
                 WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 
                 AND mes.IsApproved = 1 
                 AND ((i_UserID IS NOT NULL AND mes.UserID = i_UserID) 
                 OR (i_UserID IS NULL)) ) AS NumPostsDeleted,
 		c.Views AS `Views`,
 		c.LastPosted AS LastPosted,
 		c.LastUserID AS LastUserID,
 		IFNULL(c.LastUserName,(select `Name` from {databaseName}.{objectQualifier}User x
 		 where x.UserID=c.LastUserID)) AS                    LastUserName,
 		c.LastMessageID AS LastMessageID,
 		c.TopicID AS LastTopicID,
 		c.Flags AS TopicFlags,
 		c.Priority,
 		c.PollID,
 		d.Flags AS ForumFlags,
 		(SELECT CAST(`Message` AS CHAR(1000)) 
                 FROM {databaseName}.{objectQualifier}Message mes2 
                 WHERE mes2.TopicID = IFNULL(c.TopicMovedID,c.TopicID)
                 AND mes2.Position = 0 ORDER BY mes2.TopicID LIMIT 1) AS FirstMessage,
        (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.UserID)  
	        else ''	 end) AS  StarterStyle,
	    (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.LastUserID)  
	        else ''	 end ) AS LastUserStyle,
	    (case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=d.ForumID AND x.UserID = i_UserID limit 1)
		     else null	 end) AS LastForumAccess,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=c.TopicID AND y.UserID = i_UserID limit 1)
		     else null	 end) AS  LastTopicAccess         
               
 	FROM
 		{databaseName}.{objectQualifier}Topic c 
 		JOIN {databaseName}.{objectQualifier}User b ON b.UserID=c.UserID 
 		JOIN {databaseName}.{objectQualifier}Forum d ON d.ForumID=c.ForumID 
 		JOIN temptable2 e ON e.TopicID=c.TopicID
 	WHERE
 		e.RowNo BETWEEN i_Offset+1 AND i_Offset + i_Count
 	ORDER BY
 		e.RowNo;
 		ELSE
 		SELECT
 		ici_RowCount AS `RowCount`,
 		c.ForumID,
 		c.TopicID,
 		c.Posted,
		c.Status AS Status,
 		IFNULL(c.TopicMovedID,c.TopicID) AS LinkTopicID,
 		c.TopicMovedID,
		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE TopicID = IfNull(c.TopicMovedID,c.TopicID)) AS FavoriteCount,
 		c.Topic AS `Subject`,
		c.Description,
 		c.UserID,
 		 IFNULL(c.UserName,b.Name) AS Starter,
 		 c.NumPosts - 1  AS Replies,
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}MessageSelectView mes 
                 WHERE mes.TopicID = c.TopicID AND mes.IsDeleted = 1 
                 AND mes.IsApproved = 1 
                 AND ((i_UserID IS NOT NULL AND mes.UserID = i_UserID) 
                 OR (i_UserID IS NULL)) ) AS NumPostsDeleted,
 		c.Views AS `Views`,
 		c.LastPosted AS LastPosted,
 		c.LastUserID AS LastUserID,
 		IFNULL(c.LastUserName,(select `Name` from {databaseName}.{objectQualifier}User x
 		 where x.UserID=c.LastUserID)) AS                    LastUserName,
 		c.LastMessageID AS LastMessageID,
 		c.TopicID AS LastTopicID,
 		c.Flags AS TopicFlags,
 		c.Priority,
 		c.PollID,
 		d.Flags AS ForumFlags,
 		(SELECT CAST(`Message` AS CHAR(1000)) 
                 FROM {databaseName}.{objectQualifier}Message mes2 
                 WHERE mes2.TopicID = IFNULL(c.TopicMovedID,c.TopicID)
                 AND mes2.Position = 0 ORDER BY mes2.TopicID LIMIT 1) AS FirstMessage,
        (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.UserID)  
	        else ''	 end) AS  StarterStyle,
	    (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.LastUserID)  
	        else ''	 end ) AS LastUserStyle,
	    (case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=d.ForumID AND x.UserID = i_UserID limit 1)
		     else null	 end) AS LastForumAccess,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=c.TopicID AND y.UserID = i_UserID limit 1)
		     else null	 end) AS  LastTopicAccess         
               
 	FROM
 		{databaseName}.{objectQualifier}Topic c 
 		JOIN {databaseName}.{objectQualifier}User b ON b.UserID=c.UserID 
 		JOIN {databaseName}.{objectQualifier}Forum d ON d.ForumID=c.ForumID 
 		JOIN temptable2 e ON e.TopicID=c.TopicID
 	WHERE
 		e.RowNo BETWEEN i_Offset+1 AND i_Offset + i_Count
 		AND c.TopicMovedID IS NULL
 	ORDER BY
 		e.RowNo;
 		END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_listmessages(i_TopicID INT)
BEGIN
 	SELECT * FROM {databaseName}.{objectQualifier}MessageSelectView
 	WHERE TopicID = i_TopicID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_lock(i_TopicID INT,i_Locked TINYINT(1)) 
BEGIN

 	IF i_Locked<>0 THEN
 		UPDATE {databaseName}.{objectQualifier}Topic 
 		SET Flags = Flags | 1
 		WHERE TopicID = i_TopicID;
 	ELSE
		UPDATE {databaseName}.{objectQualifier}Topic
		SET Flags = Flags & ~1
		WHERE TopicID = i_TopicID;
        END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE procedure {databaseName}.{objectQualifier}topic_move(i_TopicID INT,i_ForumID INT,i_ShowMoved TINYINT(1)) 
BEGIN
     DECLARE ici_OldForumID INT;
 
     SELECT  ForumID INTO ici_OldForumID FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID;
 
 IF ici_OldForumID !=i_ForumID THEN 
     IF i_ShowMoved<>0  THEN
	  -- delete an old link if exists
	 DELETE FROM {databaseName}.{objectQualifier}Topic WHERE TopicMovedID = i_TopicID;	
         /*create a moved message*/
         INSERT INTO {databaseName}.{objectQualifier}Topic(ForumID,UserID,UserName,Posted,Topic,Views,Flags,Priority,PollID,TopicMovedID,LastPosted,NumPosts)
         SELECT ForumID,UserID,UserName,Posted,Topic,0,Flags,Priority,PollID,i_TopicID,LastPosted,0
         FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID;
     END IF;
 
    /* move the topic */
     UPDATE {databaseName}.{objectQualifier}Topic SET ForumID = i_ForumID WHERE TopicID = i_TopicID;
 
     /* update last posts */
     CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_OldForumID);
     CALL {databaseName}.{objectQualifier}forum_updatelastpost(i_ForumID);
     
     /* update stats */
      CALL {databaseName}.{objectQualifier}forum_updatestats (ici_OldForumID);
      CALL {databaseName}.{objectQualifier}forum_updatestats (i_ForumID);
  END IF;   
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}topic_prune(
                i_BoardID INT,
                i_ForumID INT,
                i_Days    INT,
                i_PermDelete TINYINT(1))                
BEGIN        
       
        DECLARE  iciTopicID INT;
        DECLARE  iciCount INT DEFAULT 0;
        DECLARE ici_ForumID INT DEFAULT NULL;       
              
        DECLARE  icic1 CURSOR FOR SELECT TopicID
        FROM  {databaseName}.{objectQualifier}Topic yt
        INNER JOIN
		{databaseName}.{objectQualifier}Forum yf
		ON
		yt.ForumID = yf.ForumID
		INNER JOIN
		{databaseName}.{objectQualifier}Category yc
		ON
		yf.CategoryID = yc.CategoryID
		WHERE
			yc.BoardID = i_BoardID AND
			yt.ForumID = ici_ForumID AND
			Priority = 0 AND
			(yt.Flags & 512) = 0 AND 			
			 	-- not flagged as persistent 
         DATEDIFF(UTC_DATE(),LastPosted) > i_Days;           
        
        DECLARE icic2 CURSOR FOR SELECT TopicID
        FROM   {databaseName}.{objectQualifier}Topic
        WHERE  Priority = 0
        AND (Flags & 512) = 0
        AND  DATEDIFF(UTC_DATE(),LastPosted) > i_Days;     

    
     IF i_ForumID IS NOT NULL AND i_ForumID >0 THEN 
     SET ici_ForumID = i_ForumID;
     END IF;
     
     IF ici_ForumID = 0 THEN
     SET ici_ForumID = NULL;
     END IF;

     IF ici_ForumID IS NOT NULL AND ici_ForumID > 0 THEN
     OPEN icic1;
     BEGIN
       DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
     LOOP 
       FETCH icic1  INTO iciTopicID; 
       IF (iciCount % 100 = 0) THEN SELECT SLEEP(.5); END IF;		
       CALL {databaseName}.{objectQualifier}topic_delete(iciTopicID , 0, i_PermDelete);
       SET iciCount = iciCount + 1;     
     END LOOP;
     END;
     
     CLOSE icic1;
     ELSE
     OPEN icic2;
      BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
   LOOP
     FETCH icic2  INTO iciTopicID;  
     CALL {databaseName}.{objectQualifier}topic_delete(iciTopicID , 0, i_PermDelete);
     SET iciCount = iciCount + 1;
     END LOOP;
     END;
     CLOSE icic2;
     END IF;



     /*DEALLOCATE icic
     -- This takes forever with many posts...
     --CALL {databaseName}.{objectQualifier}topic_updatelastpost(null)
     CALL {databaseName}.{objectQualifier}forum_updatelastpost (ici_ForumID);
     */
     SELECT iciCount AS COUNT;
     END;
     --GO



     /* STORED PROCEDURE CREATED BY VZ-TEAM */     
     CREATE PROCEDURE {databaseName}.{objectQualifier}topic_save(
     i_ForumID	INT,
     i_Subject	VARCHAR(255),
	 i_status	VARCHAR(255),
	 i_Description	VARCHAR(255),
     i_UserID		INT,
     i_Message	TEXT,	
     i_Priority	SMALLINT,
     i_UserName	VARCHAR(128),
     i_IP		VARCHAR(39), 
     i_Posted		DATETIME,
     i_BlogPostID	VARCHAR(128),
     i_Flags		INT
     )
     BEGIN
     DECLARE ici_TopicID INT;
     DECLARE ici_MessageID INT;
 

     IF i_Posted IS NULL THEN
     SET i_Posted = UTC_TIMESTAMP(); END IF;

     /* create the topic */
     INSERT INTO {databaseName}.{objectQualifier}Topic(ForumID,Topic,UserID,Posted,Views,Priority,UserName,NumPosts, Description, Status)
     VALUES(i_ForumID,CONVERT(i_Subject USING {databaseEncoding}),i_UserID,i_Posted,0,i_Priority,i_UserName,0, i_Description, i_status);

     /* get its id*/
     SET ici_TopicID = LAST_INSERT_ID();

     /* add message to the topic*/
     CALL {databaseName}.{objectQualifier}message_save (ici_TopicID,i_UserID,i_Message,i_UserName,i_IP,i_Posted,NULL,NULL,i_BlogPostID, null, i_Flags,ici_MessageID);

     SELECT   ici_TopicID AS TopicID,  ici_MessageID AS MessageID;
     END;
--GO

   /* STORED PROCEDURE CREATED BY VZ-TEAM */
     CREATE  PROCEDURE {databaseName}.{objectQualifier}topic_updatelastpost(
     i_ForumID INT,
     i_TopicID INT)
     BEGIN
     DECLARE ici_ForumID INT DEFAULT NULL;
     DECLARE ici_TopicID INT DEFAULT NULL;

     IF i_ForumID IS NOT NULL OR i_ForumID >=0 THEN SET ici_ForumID = i_ForumID;END IF;
     IF i_TopicID  IS NOT NULL OR i_TopicID  >=0 THEN SET ici_TopicID = i_TopicID ;END IF;

     IF ici_TopicID IS NOT NULL THEN
     UPDATE {databaseName}.{objectQualifier}Topic
     SET    LastPosted = (SELECT  x.Posted
     FROM     {databaseName}.{objectQualifier}Message x
     WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
     AND (x.Flags & 24) = 16
                             ORDER BY Posted DESC LIMIT 1),
                LastMessageID=(SELECT    x.MessageID
                                FROM     {databaseName}.{objectQualifier}Message x
                                WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                                AND (x.Flags & 24) = 16
                                ORDER BY Posted DESC LIMIT 1),
               LastUserID=(SELECT   x.UserID
                             FROM    {databaseName}.{objectQualifier}Message x
                             WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                             AND (x.Flags & 24) = 16
                             ORDER BY Posted DESC LIMIT 1) ,
               LastUserName=(SELECT   x.UserName
                               FROM     {databaseName}.{objectQualifier}Message x
                               WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                               AND (x.Flags & 24) = 16 
							   ORDER BY Posted DESC LIMIT 1),
			   LastMessageFlags = (SELECT x.Flags FROM {databaseName}.{objectQualifier}Message x 
			                       WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID 
			                       and (x.Flags & 24)=16 
								   ORDER BY Posted DESC LIMIT 1)                          
        WHERE  TopicID = ici_TopicID;
        ELSE
        UPDATE {databaseName}.{objectQualifier}Topic
        SET    LastPosted=(SELECT   x.Posted
                             FROM     {databaseName}.{objectQualifier}Message x
                             WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                             AND (x.Flags & 24) = 16
                             ORDER BY Posted DESC LIMIT 1),
               LastMessageID=(SELECT    x.MessageID
                                FROM     {databaseName}.{objectQualifier}Message x
                                WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                                AND (x.Flags & 24) = 16
                                ORDER BY Posted DESC LIMIT 1),
               LastUserID=(SELECT   x.UserID
                             FROM     {databaseName}.{objectQualifier}Message x
                             WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                             AND (x.Flags & 24) = 16
                             ORDER BY Posted DESC LIMIT 1),
               LastUserName = (SELECT   x.UserName
                               FROM     {databaseName}.{objectQualifier}Message x
                               WHERE    x.TopicID = {databaseName}.{objectQualifier}Topic.`TopicID`
                               AND (x.Flags & 24) = 16 
							   ORDER BY Posted DESC LIMIT 1),
               LastMessageFlags = (SELECT x.Flags FROM {databaseName}.{objectQualifier}Message x 
			                       WHERE x.TopicID={databaseName}.{objectQualifier}Topic.TopicID 
			                       and (x.Flags & 24)=16 
								   ORDER BY Posted DESC LIMIT 1)
				WHERE  TopicMovedID IS NULL
     AND (ici_ForumID IS NULL
     OR ForumID = ici_ForumID);

    /* CALL {databaseName}.{objectQualifier}forum_updatelastpost(ici_ForumID);*/
     END IF;
     END ;
  --GO

  CREATE procedure {databaseName}.{objectQualifier}topic_updatetopic
(i_TopicID int,i_Topic varchar (100))
begin
		if i_TopicID is not null then
		update {databaseName}.{objectQualifier}Topic set
			Topic = i_Topic
		where TopicID = i_TopicID;
		end if;
end;
--GO
     
     /* STORED PROCEDURE CREATED BY VZ-TEAM */     
     CREATE  PROCEDURE {databaseName}.{objectQualifier}user_accessmasks(
     i_BoardID INT,
     i_UserID  INT)
     BEGIN
     SELECT   *
     FROM     ((SELECT   e.AccessMaskID AS AccessMaskID,
     e.Name AS AccessMaskName,
     f.ForumID AS ForumID,
     f.Name AS ForumName,
     f.CategoryID,
	 f.ParentID
     FROM     {databaseName}.{objectQualifier}User a
     JOIN {databaseName}.{objectQualifier}UserGroup b
     ON b.UserID = a.UserID
     JOIN {databaseName}.{objectQualifier}Group c
     ON c.GroupID = b.GroupID
     JOIN {databaseName}.{objectQualifier}ForumAccess d
     ON d.GroupID = c.GroupID
     JOIN {databaseName}.{objectQualifier}AccessMask e
     ON e.AccessMaskID = d.AccessMaskID
     JOIN {databaseName}.{objectQualifier}Forum f
     ON f.ForumID = d.ForumID
     WHERE    a.UserID = i_UserID
     AND c.BoardID = i_BoardID
     GROUP BY e.AccessMaskID,e.Name,f.ForumID,f.Name)
     UNION
     (SELECT   c.AccessMaskID AS AccessMaskID,
     c.Name AS AccessMaskName,
     d.ForumID AS ForumID,
     d.Name AS  ForumName,
     d.CategoryID,
	 d.ParentID
     FROM     {databaseName}.{objectQualifier}User a
     JOIN {databaseName}.{objectQualifier}UserForum b
     ON b.UserID = a.UserID
     JOIN {databaseName}.{objectQualifier}AccessMask c
     ON c.AccessMaskID = b.AccessMaskID
     JOIN {databaseName}.{objectQualifier}Forum d
     ON d.ForumID = b.ForumID
     WHERE    a.UserID = i_UserID
     AND c.BoardID = i_BoardID
     GROUP BY c.AccessMaskID,c.Name,d.ForumID,d.Name)) AS x
     ORDER BY ForumName,
     AccessMaskName;
     END;   
--GO


     /* STORED PROCEDURE CREATED BY VZ-TEAM */     
     CREATE  PROCEDURE {databaseName}.{objectQualifier}user_addpoints(
     i_UserID INT,
     i_Points INT)
     BEGIN
     UPDATE {databaseName}.{objectQualifier}User
     SET    Points = Points + i_Points
     WHERE  UserID = i_UserID;
     END;
     
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */     
     CREATE PROCEDURE {databaseName}.{objectQualifier}user_adminsave
     (i_BoardID INT,
     i_UserID INT,
     i_Name VARCHAR(128),
	 i_DisplayName VARCHAR(128),
     i_Email VARCHAR(128),
     i_Flags INT,
     i_RankID INT)
     BEGIN
     UPDATE {databaseName}.{objectQualifier}User
     SET
     `Name` = i_Name,
	 DisplayName = i_DisplayName,
     Email = i_Email,
     RankID = i_RankID,
     Flags = i_Flags
     WHERE UserID = i_UserID;
     SELECT i_UserID AS UserID;
     END;
--GO
     /* STORED PROCEDURE CREATED BY VZ-TEAM */     
     CREATE PROCEDURE {databaseName}.{objectQualifier}user_approve(i_UserID INT)
     BEGIN
     DECLARE ici_CheckEmailID INT;
     DECLARE ici_Email VARCHAR(128);
     DECLARE ici_bit TINYINT(1) DEFAULT 1;

     SELECT
     CheckEmailID,Email INTO ici_CheckEmailID,ici_Email
     FROM
     {databaseName}.{objectQualifier}CheckEmail
     WHERE
     UserID = i_UserID;

     /*Update new user email*/
     UPDATE {databaseName}.{objectQualifier}User SET Email = ici_Email, 
Flags = Flags | 2 WHERE UserID = i_UserID;
     DELETE FROM {databaseName}.{objectQualifier}CheckEmail WHERE CheckEmailID = ici_CheckEmailID;
     SELECT ici_bit;
     END;
--GO

     /* STORED PROCEDURE CREATED BY VZ-TEAM */  
     CREATE procedure {databaseName}.{objectQualifier}user_approveall(i_BoardID INT)
   BEGIN
   
   DECLARE ici_UserID INT;
    
   DECLARE userslist CURSOR  FOR
     SELECT UserID FROM {databaseName}.{objectQualifier}User WHERE BoardID=i_BoardID AND (Flags & 2)=0 ;
      
 	 OPEN userslist;   
   BEGIN
      DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
   LOOP
        FETCH userslist INTO ici_UserID;          
           CALL {databaseName}.{objectQualifier}user_approve (ici_UserID);
   END LOOP;        
    END;
     
 	CLOSE userslist;
 	 
END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE procedure {databaseName}.{objectQualifier}user_deleteavatar(i_UserID INT)
    BEGIN
    UPDATE {databaseName}.{objectQualifier}User
    SET AvatarImage = null,
    Avatar = null,
    AvatarImageType = null
    where UserID = i_UserID;
    END;
 --GO     

 CREATE procedure {databaseName}.{objectQualifier}user_aspnet
 (i_BoardID INT,
  i_UserName VARCHAR(128),
  i_DisplayName VARCHAR(128),
  i_Email VARCHAR(128),
  i_ProviderUserKey VARCHAR(64),
  i_IsApproved TINYINT(1)) 
BEGIN
/*SET NOCOUNT ON*/
 	DECLARE ici_UserID INT;
        DECLARE ici_RankID INT;
        DECLARE ici_approvedFlag INT;
 
 	SET ici_approvedFlag = 0;
 	IF (i_IsApproved = 1) THEN SET ici_approvedFlag = 2;END IF;	
 	
 	IF EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}User 
                  WHERE BoardID=i_BoardID 
                  AND ((`ProviderUserKey`=i_ProviderUserKey) OR (`Name` = i_UserName))) THEN
 	
 		SELECT UserID INTO ici_UserID 
 		from {databaseName}.{objectQualifier}User 
 		where `BoardID`=i_BoardID AND ((`ProviderUserKey`=i_ProviderUserKey) OR (`Name` = i_UserName)) LIMIT 1;
 		
 		IF (i_DisplayName IS NULL) 
		THEN
			SELECT DisplayName INTO i_DisplayName FROM {databaseName}.{objectQualifier}User WHERE UserId = i_UserID LIMIT 1;
		END IF;
		
 		UPDATE {databaseName}.{objectQualifier}User SET 
 			`Name` = i_UserName,
 			`DisplayName` = i_DisplayName, 
 			Email = i_Email,
 			Flags = Flags | ici_approvedFlag
 		WHERE
 			UserID = ici_UserID ORDER BY UserID LIMIT 1;
 	ELSE
 	
 		SELECT RankID INTO ici_RankID FROM {databaseName}.{objectQualifier}Rank 
                  WHERE (Flags & 1)<>0 AND BoardID=i_BoardID;
      IF (i_DisplayName IS NULL) 
		THEN
			SET i_DisplayName = i_UserName;
		END IF;		

                  INSERT INTO {databaseName}.{objectQualifier}User(BoardID,RankID,`Name`,`DisplayName`,Password,Email,Joined,LastVisit,NumPosts,TimeZone,Flags,ProviderUserKey)
                  VALUES(i_BoardID,ici_RankID,i_UserName,i_DisplayName,'-',i_Email,UTC_TIMESTAMP(),UTC_TIMESTAMP(),0,IFNULL((SELECT CAST(CAST(Value AS CHAR(5)) AS SIGNED) from {databaseName}.{objectQualifier}Registry where Name LIKE 'timezone' and BoardID = i_BoardID),0),ici_approvedFlag,i_ProviderUserKey);

                  SET ici_UserID = LAST_INSERT_ID();

                  END IF;

                  SELECT  ici_UserID AS UserID;
                  END;



                  /* STORED PROCEDURE CREATED BY VZ-TEAM */                  
                  CREATE PROCEDURE {databaseName}.{objectQualifier}user_avatarimage(i_UserID INT)
                  BEGIN
                  SELECT
                  UserID,
                  AvatarImage,
                  AvatarImageType
                  FROM {databaseName}.{objectQualifier}User WHERE UserID=i_UserID;
                  END;


                  /* STORED PROCEDURE CREATED BY VZ-TEAM */                 
                  CREATE PROCEDURE {databaseName}.{objectQualifier}user_changepassword
                  (i_UserID INT,i_OldPassword VARCHAR(32),i_NewPassword VARCHAR(32))
                  BEGIN
                  DECLARE ici_CurrentOld VARCHAR(32);
                  DECLARE ici_Success TINYINT(1) DEFAULT 1;
                  SELECT  Password INTO ici_CurrentOld FROM {databaseName}.{objectQualifier}User WHERE UserID = i_UserID;
                  IF ici_CurrentOld<>i_OldPassword THEN
                SET ici_Success=0;  
 		SELECT ici_Success AS Success;		
 	
        ELSE 
 	UPDATE {databaseName}.{objectQualifier}User SET Password = i_NewPassword WHERE UserID = i_UserID;
 	SELECT ici_Success AS Success;
        END IF;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_delete(i_UserID INT)
BEGIN
 	DECLARE ici_GuestUserID	INT;
 	DECLARE ici_UserName	VARCHAR(128);
 	DECLARE ici_GuestCount	INT;
 
 	SELECT `Name` INTO ici_UserName FROM {databaseName}.{objectQualifier}User WHERE UserID=i_UserID;
 
 	SELECT 
 		 a.UserID INTO ici_GuestUserID
 	FROM
 		{databaseName}.{objectQualifier}User a
 		inner join {databaseName}.{objectQualifier}UserGroup b on b.UserID = a.UserID
 		inner join {databaseName}.{objectQualifier}Group c on b.GroupID = c.GroupID
 	WHERE
 		(c.Flags & 2)<>0 GROUP BY a.UserID LIMIT 1;
 
 	SELECT 
 		  COUNT(1) INTO  ici_GuestCount
 	FROM 
 		{databaseName}.{objectQualifier}UserGroup a
 		join {databaseName}.{objectQualifier}Group b on b.GroupID=a.GroupID
 	WHERE
 		(b.Flags & 2)<>0;

    IF NOT (ici_GuestUserID=i_UserID AND ici_GuestCount=1) THEN


    UPDATE {databaseName}.{objectQualifier}Message SET UserName=ici_UserName,UserID=ici_GuestUserID WHERE UserID=i_UserID;
    UPDATE {databaseName}.{objectQualifier}Topic SET UserName=ici_UserName,UserID=ici_GuestUserID WHERE UserID=i_UserID;
    UPDATE {databaseName}.{objectQualifier}Topic SET LastUserName=ici_UserName,LastUserID=ici_GuestUserID WHERE LastUserID=i_UserID;
    UPDATE {databaseName}.{objectQualifier}Forum SET LastUserName=ici_UserName,LastUserID=ici_GuestUserID WHERE LastUserID=i_UserID;

    DELETE FROM {databaseName}.{objectQualifier}Active WHERE UserID=i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}EventLog WHERE UserID=i_UserID	;
    DELETE FROM {databaseName}.{objectQualifier}UserPMessage WHERE UserID=i_UserID;
  
    IF NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}PMessage WHERE FromUserID=i_UserID) THEN
    DELETE FROM {databaseName}.{objectQualifier}PMessage
    WHERE FromUserID=i_UserID;
    END IF;
    /*set messages as from guest so the User can be deleted*/
    UPDATE {databaseName}.{objectQualifier}PMessage 
    SET FromUserID = ici_GuestUserID WHERE FromUserID = i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}CheckEmail WHERE UserID = i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}WatchTopic WHERE UserID = i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}WatchForum WHERE UserID = i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}UserGroup WHERE UserID = i_UserID;
    /*ABOT CHANGED
    Delete UserForums entries Too*/
    DELETE FROM  {databaseName}.{objectQualifier}UserForum WHERE UserID = i_UserID;
    DELETE FROM {databaseName}.{objectQualifier}IgnoreUser WHERE UserID = i_UserID OR IgnoredUserID = i_UserID;
    /*END ABOT CHANGED 09.04.2004*/
    DELETE FROM {databaseName}.{objectQualifier}Thanks where ThanksFromUserID = i_UserID OR ThanksToUserID = i_UserID;
    -- Delete all the Buddy relations between this user and other users.
	DELETE FROM {databaseName}.{objectQualifier}Buddy where FromUserID=i_UserID OR ToUserID=i_UserID;
	
    DELETE FROM  {databaseName}.{objectQualifier}User WHERE UserID = i_UserID;
    END IF;
    END;
--GO

/* User Ignore Procedures */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_addignoreduser
	(i_UserID INT,
	i_IgnoredUserID INT)
BEGIN
	IF NOT EXISTS (SELECT * FROM {databaseName}.{objectQualifier}IgnoreUser WHERE UserID = i_UserID AND IgnoredUserID = i_IgnoredUserID)
	THEN
		INSERT INTO {databaseName}.{objectQualifier}IgnoreUser (UserID, IgnoredUserID) VALUES (i_UserID, i_IgnoredUserID);
	END IF;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_ignoredlist
    (i_UserID INT)
BEGIN
	SELECT * FROM {databaseName}.{objectQualifier}IgnoreUser WHERE UserID = i_UserID;
END;	
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_removeignoreduser
    (i_UserId INT,
    i_IgnoredUserId INT)
 BEGIN
	DELETE FROM {databaseName}.{objectQualifier}IgnoreUser WHERE UserID = i_userId AND IgnoredUserID = i_ignoredUserId;
	
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_isuserignored
    (i_UserId INT,
    i_IgnoredUserId INT)
BEGIN
	IF EXISTS(SELECT * FROM {databaseName}.{objectQualifier}IgnoreUser WHERE UserID = i_UserId AND IgnoredUserID = i_IgnoredUserId)
	THEN
		SELECT 1;	
	ELSE	
		SELECT 0;
	END IF;
	
END;	
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */   
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_deleteold(i_BoardID INT, i_Days INT)
    BEGIN
    DECLARE ici_Since DATETIME DEFAULT UTC_TIMESTAMP();

    /*set ici_Since = UTC_TIMESTAMP()*/

    DELETE FROM {databaseName}.{objectQualifier}EventLog  WHERE UserID IN (SELECT UserID from {databaseName}.{objectQualifier}User WHERE BoardID=i_BoardID and {databaseName}.{objectQualifier}bitset(Flags,2)=0 and DATEDIFF(ici_Since,Joined)>i_Days);
    DELETE FROM {databaseName}.{objectQualifier}CheckEmail WHERE UserID IN (SELECT UserID from {databaseName}.{objectQualifier}User WHERE BoardID=i_BoardID and {databaseName}.{objectQualifier}bitset(Flags,2)=0 and DATEDIFF(ici_Since,Joined)>i_Days);
    DELETE FROM {databaseName}.{objectQualifier}UserGroup WHERE UserID IN (SELECT UserID from {databaseName}.{objectQualifier}User WHERE BoardID=i_BoardID and {databaseName}.{objectQualifier}bitset(Flags,2)=0 and DATEDIFF(ici_Since,Joined)>i_Days);
    DELETE FROM {databaseName}.{objectQualifier}User where BoardID=i_BoardID and {databaseName}.{objectQualifier}bitset(Flags,2)=0 AND DATEDIFF(ici_Since,Joined)>i_Days;
    END;
--GO

 /* STORED PROCEDURE CREATED BY VZ-TEAM */
  
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_emails(i_BoardID INT,i_GroupID INT)
    BEGIN
    IF i_GroupID = 0 THEN SET i_GroupID = null; END IF;
    IF i_GroupID IS NULL THEN
    SELECT
    a.Email
    FROM
    {databaseName}.{objectQualifier}User a
    WHERE
    a.Email IS NOT NULL AND
    a.BoardID = i_BoardID and
    a.Email IS NOT NULL AND
    a.Email<>'';
 	ELSE
 		SELECT 
 			a.Email 
 		FROM
 			{databaseName}.{objectQualifier}User a 
 			JOIN {databaseName}.{objectQualifier}UserGroup b 
 			ON b.UserID=a.UserID
 			JOIN {databaseName}.{objectQualifier}Group c 
 			ON c.GroupID=b.GroupID		
 		WHERE 
 			b.GroupID = i_GroupID AND 
 			(c.Flags & 2)=0 AND
 			a.Email IS NOT NULL AND 
 			a.Email<>'';
        END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_find(
i_BoardID INT,
i_Filter TINYINT(1),
i_UserName VARCHAR(128),
i_DisplayName VARCHAR(128),
i_Email VARCHAR(128),
i_NotificationType INT,
i_DailyDigest TINYINT(1)) 
BEGIN
 	IF i_Filter<>0 THEN 	
 		IF i_UserName IS NOT NULL THEN
 			SET i_UserName = CONCAT('%',i_UserName,'%');  END IF;
 			
    IF i_DisplayName IS NOT NULL THEN
 			SET i_DisplayName = CONCAT('%',i_DisplayName,'%');  END IF;
 		SELECT 
 			a.*,
 			(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}UserGroup x join {databaseName}.{objectQualifier}Group y ON x.GroupID=y.GroupID WHERE x.UserID=a.UserID AND (y.Flags & 2)<>0) AS IsGuest,
 			(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserGroup x JOIN {databaseName}.{objectQualifier}Group y ON x.GroupID=y.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0) AS IsAdmin
 		FROM 
 			{databaseName}.{objectQualifier}UserSelectView a
 		WHERE 
 			a.BoardID=i_BoardID AND
 			((i_UserName IS NOT NULL and a.Name LIKE i_UserName) 
			OR (i_Email IS NOT NULL and Email LIKE i_Email) 
			OR (i_DisplayName IS NOT NULL AND a.DisplayName like i_DisplayName)
			OR (i_NotificationType IS NOT NULL AND a.NotificationType = i_NotificationType) 
			OR (i_DailyDigest IS NOT NULL AND a.DailyDigest = i_DailyDigest))
		ORDER BY
 			a.Name;
 	ELSE
 	
 		SELECT
 			a.*,
 			(SELECT count(1) from {databaseName}.{objectQualifier}UserGroup x JOIN {databaseName}.{objectQualifier}Group y ON x.GroupID=y.GroupID where x.UserID=a.UserID and (y.Flags & 2)<>0) AS IsGuest,
 			(SELECT count(1) from {databaseName}.{objectQualifier}UserGroup x JOIN {databaseName}.{objectQualifier}Group y ON x.GroupID=y.GroupID where x.UserID=a.UserID and (y.Flags & 1)<>0) AS IsAdmin
 		FROM 
 			{databaseName}.{objectQualifier}UserSelectView a
 		WHERE
 			a.BoardID=i_BoardID AND
 			((i_UserName IS NOT NULL AND a.Name=i_UserName) 
			OR (i_Email IS NOT NULL AND Email=i_Email)
			OR (i_DisplayName IS NOT NULL AND a.DisplayName=i_DisplayName)
			OR (i_NotificationType IS NOT NULL AND a.NotificationType = i_NotificationType) 
			OR (i_DailyDigest IS NOT NULL AND a.DailyDigest = i_DailyDigest));
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}user_getpoints (i_UserID INT) 
BEGIN
	SELECT Points FROM {databaseName}.{objectQualifier}User WHERE UserID = i_UserID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_getsignature(i_UserID INT) 
BEGIN
 	SELECT Signature FROM {databaseName}.{objectQualifier}User WHERE UserID = i_UserID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_guest
 (
 	i_BoardID INT
 )
BEGIN
 	SELECT 
 		a.UserID
 	FROM
 		{databaseName}.{objectQualifier}User a
 		INNER JOIN {databaseName}.{objectQualifier}UserGroup b ON b.UserID = a.UserID
 		INNER JOIN {databaseName}.{objectQualifier}Group c ON b.GroupID = c.GroupID
 	WHERE
 		a.BoardID = i_BoardID AND
 		(c.Flags & 2)<>0 ORDER BY a.UserID LIMIT 1;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_list_new
(i_BoardID INT,i_UserID INT,i_Approved TINYINT(1),i_GroupID INT,i_RankID INT, i_StyledNicks TINYINT(1)) 
BEGIN
 	IF i_UserID IS NOT NULL THEN
 		SELECT 
 			a.*, 
 			a.Culture AS CultureUser,			
 			b.Name AS RankName,
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,
 			IFNULL(a.Flags & 4,0) AS IsGuest, 
 			DATEDIFF(UTC_TIMESTAMP(),a.Joined)+1 AS NumDays, 			
 			(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}Message x WHERE (x.Flags & 24)=16) AS NumPostsForum,
 			(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}User x 
                          WHERE x.UserID=a.UserID 
                            AND AvatarImage IS NOT NULL) AS HasAvatarImage
 		FROM 
 			{databaseName}.{objectQualifier}User a
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 			/*LEFT JOIN {databaseName}.{objectQualifier}vaccess c ON c.UserID=a.UserID*/
 		WHERE 
 			a.UserID = i_UserID AND
 			a.BoardID = i_BoardID AND
 			(i_Approved IS NULL OR (i_Approved=0 AND (a.Flags & 2)=0) 
                            OR (i_Approved=1 and (a.Flags & 2)=2))
 		ORDER BY 
 			a.Name;

 	ELSEIF i_GroupID IS NULL and i_RankID IS NULL THEN
 		SELECT 
 			a.*,
 			a.Culture AS CultureUser, 
 			b.Name AS RankName,
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,                     
 			IFNULL(a.Flags & 4,0) AS IsGuest, 			
 			(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserGroup x
                           JOIN {databaseName}.{objectQualifier}Group y 
                             ON y.GroupID=x.GroupID 
                               WHERE x.UserID=a.UserID
                                 AND (y.Flags & 1)<>0) AS IsAdmin           		 			
 			
 		FROM 
 			{databaseName}.{objectQualifier}User a
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 		WHERE 
 			a.BoardID = i_BoardID 
                          AND (i_Approved IS NULL 
                           OR (i_Approved=0 AND (a.Flags & 2)=0) 
                             OR (i_Approved=1 AND (a.Flags & 2)=2))
 		ORDER BY 
 			a.Name;
 	ELSE
 		SELECT 
 			a.*,
 			a.Culture AS CultureUser,
 			b.Name AS RankName,	
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,            
 			IFNULL(a.Flags & 4,0) AS IsGuest,	
 			(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserGroup x 
                        JOIN {databaseName}.{objectQualifier}Group y ON y.GroupID=x.GroupID 
                        WHERE x.UserID=a.UserID 
                        AND (y.Flags & 1)<>0) AS IsAdmin 			 			
 			
 		FROM 
 			{databaseName}.{objectQualifier}User a
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 		WHERE 
 			a.BoardID = i_BoardID and
 			(i_Approved IS NULL 
                          OR (i_Approved=0 AND (a.Flags & 2)=0) 
                          OR (i_Approved=1 AND (a.Flags & 2)=2)) 
                          AND (i_GroupID IS NULL OR EXISTS
                              (SELECT 1 FROM {databaseName}.{objectQualifier}UserGroup x 
                                 WHERE x.UserID=a.UserID AND x.GroupID=i_GroupID)) 
                                  AND (i_RankID IS NULL OR a.RankID=i_RankID)
 		ORDER BY 
 			a.Name;
         END IF;
END;
--GO

create procedure {databaseName}.{objectQualifier}user_listmembers(
                I_BoardID int,
				I_UserID int,
				I_Approved  tinyint(1),
				I_GroupID int,
				I_RankID int,
				I_StyledNicks tinyint(1),
				I_Literals varchar(255), 
				I_Exclude  tinyint(1), 
				I_BeginsWith  tinyint(1), 				
				I_PageIndex int, 
				I_PageSize int,
				I_SortName int,
				I_SortRank int,
				I_SortJoined int,
				I_SortPosts int,
				I_SortLastVisit int,
				I_NumPosts int,
				I_NumPostsCompare int)
begin
  
   declare ici_user_totalrowsnumber int; 
   declare ici_firstselectrownum int;
  
/*   declare ici_firstselectrankid int;
   declare ici_firstselectlastvisit datetime;
   declare ici_firstselectjoined datetime;
   declare ici_firstselectposts int;
   declare ici_firstselectuserid int; */

  
  
				

	--	SET @user_totalrowsnumber = @@ROWCOUNT    

   SET I_PageIndex = I_PageIndex+1;   
   SET ici_firstselectrownum = (I_PageIndex - 1) * I_PageSize + 1; 
   SET ici_firstselectrownum = ici_firstselectrownum -1 ;
      
	  -- fined first selectedrowid  
	/*  if (ici_firstselectrownum > 0)
	  set rowcount ici_firstselectrownum
	  else
	  set rowcount	1 */

    PREPARE stmt_ulm FROM 'select  a.Name AS ici_firstselectuserid,  
	          a.LastVisit AS ici_firstselectlastvisit, 
			  a.Joined AS ici_firstselectjoined, 
			  a.RankID as ici_firstselectrankid, 
			  a.NumPosts as ici_firstselectposts			
      from {databaseName}.{objectQualifier}User a 
	  join {databaseName}.{objectQualifier}Rank b 
	  on b.RankID=a.RankID 
	 where
	   a.BoardID = ?	   
	   and
		(? is null or (? = 0 and (a.Flags & 2)=0) or (? = 1 and (a.Flags & 2)=2)) and
		(? is null or exists(select 1 from {databaseName}.{objectQualifier}UserGroup x where x.UserID=a.UserID 
		and x.GroupID=?)) and
		(? is null or a.RankID = ?) AND
		IFNULL(a.Flags & 4,0) <> 4
			AND
     
		 LOWER(a.DisplayName) LIKE (CASE 
			WHEN (? = 0 AND ? IS NOT NULL AND CHAR_LENGTH(?) > 0) THEN (?) 
			WHEN (? = 1 AND ? IS NOT NULL AND CHAR_LENGTH(?) > 0) THEN (?)
			ELSE (?) END) 
			
       and
	   
		(a.NumPosts >= (case 
        when ? = 3 then  ? end) 
		OR a.NumPosts <= (case 
        when ? = 2 then ? end) OR
		a.NumPosts = (case 
        when ? = 1 then ? end)) 
     order by  	 
	    (case 
        when ? = 2 then a.Name end) DESC,
		(case 
        when ? = 1 then a.Name end) ASC, 
		(case 
        when ? = 2 then a.RankID end) DESC,
		(case 
        when ? = 1 then a.RankID end) ASC,		
		(case 
        when ? = 2 then a.Joined end) DESC,
		(case 
        when ? = 1 then a.Joined end) ASC,
		(case 
        when ? = 2 then a.LastVisit end) DESC,
		(case 
        when ? = 1 then a.LastVisit end) ASC,
		(case
		 when ? = 2 then a.NumPosts end) DESC, 
   		(case
		 when ? = 1 then a.NumPosts end) ASC  LIMIT 1 OFFSET ?;';

		 SET @PI_BoardID = I_BoardID;
		 SET @PI_Approved = I_Approved;
		 SET @PI_GroupID = I_GroupID;
		 SET @PI_RankID = I_RankID;
		 SET @PI_BeginsWith = I_BeginsWith;
		 SET @PI_Literals = I_Literals;
		 SET @PI_Literals0 = CONCAT('%',LOWER(IFNULL(I_Literals,'')),'%');
		 SET @PI_Literals1 = CONCAT(LOWER(IFNULL(I_Literals,'')),'%');
		 SET @PI_LiteralsALL ='%';
		 SET @PI_NumPostsCompare = I_NumPostsCompare;
		 SET @PI_NumPosts = I_NumPosts;
		 SET @PI_SortName = I_SortName;
		 SET @PI_SortRank = I_SortRank;
		 SET @PI_SortJoined = I_SortJoined;
		 SET @PI_SortLastVisit = I_SortLastVisit;
		 SET @PI_SortPosts = I_SortPosts;
		 SET @Pici_firstselectrownum = ici_firstselectrownum;

		 EXECUTE stmt_ulm USING
		 @PI_BoardID,		
		 @PI_Approved,
		 @PI_Approved,
		 @PI_Approved,
		 @PI_GroupID,
		 @PI_GroupID,
		 @PI_RankID,
		 @PI_RankID,
		 @PI_BeginsWith,
		 @PI_Literals,
		 @PI_Literals,
		 @PI_Literals0,
		 @PI_BeginsWith,
		 @PI_Literals,
		 @PI_Literals,
		 @PI_Literals1,	
		 @PI_LiteralsALL,
		 @PI_NumPostsCompare,
		 @PI_NumPosts,
		 @PI_NumPostsCompare,
		 @PI_NumPosts,
		 @PI_NumPostsCompare,
		 @PI_NumPosts,
		 @PI_SortName,
		 @PI_SortName,
		 @PI_SortRank,
		 @PI_SortRank,
		 @PI_SortJoined,
		 @PI_SortJoined,
		 @PI_SortLastVisit,
		 @PI_SortLastVisit,
		 @PI_SortPosts,
		 @PI_SortPosts, 
		 @Pici_firstselectrownum;
		 	 
  DEALLOCATE PREPARE stmt_ulm;  
end;
--GO

create procedure {databaseName}.{objectQualifier}user_listmembers_result(
	            I_PageIndex int,
				I_UserID int,				
				I_PageSize int,
				I_StyledNicks tinyint(1),
				I_SortName int,	
				I_SortJoined int,
				I_SortLastVisit int,
				I_NumPostsCompare int,
				I_NumPosts int,
				I_BoardID int,
				I_Approved  tinyint(1),
				I_GroupID int,
				I_RankID int,
				I_BeginsWith  tinyint(1), 
				I_Literals varchar(255), 
				I_SortRank int,			
				I_SortPosts int,
				I_Exclude  tinyint(1),		
				ici_firstselectuserid varchar(255),
			    ici_firstselectlastvisit datetime,
			    ici_firstselectjoined datetime,
			    ici_firstselectrankid int,
			    ici_firstselectposts  int)
begin
  
   declare ici_user_totalrowsnumber int default 0; 
   declare ici_firstselectrownum int; 
   declare ici_wildcard char(1) default '%' ;
 if (CHAR_LENGTH(ici_firstselectuserid) > 0) THEN
  -- get total number of users in the db
   select CAST(count(a.UserID) AS SIGNED) INTO ici_user_totalrowsnumber
    from {databaseName}.{objectQualifier}User a  
	  join {databaseName}.{objectQualifier}Rank b 
	  on b.RankID=a.RankID 
	  where
	   a.BoardID = I_BoardID	   
	   and
		(I_Approved is null or (I_Approved=0 and (a.Flags & 2)<>2) or (I_Approved=1 and (a.Flags & 2)=2)) and
		(I_GroupID is null or exists(select 1 from {databaseName}.{objectQualifier}UserGroup x where x.UserID=a.UserID and x.GroupID=I_GroupID)) and
		(I_RankID is null or a.RankID=I_RankID) AND
		-- user is not guest
		IFNULL(a.Flags & 4,0) <> 4
			AND
		LOWER(a.DisplayName) LIKE CASE 
			WHEN (I_BeginsWith = 0 AND I_Literals IS NOT NULL AND CHAR_LENGTH(I_Literals) > 0) THEN CONCAT('%', LOWER(IFNULL(I_Literals,'')) , '%') 
			WHEN (I_BeginsWith = 1 AND I_Literals IS NOT NULL AND CHAR_LENGTH(I_Literals) > 0) THEN CONCAT(LOWER(IFNULL(I_Literals,'')), '%')
			ELSE '%' END  
        and
		(a.NumPosts >= (case 
        when I_NumPostsCompare = 3 then  I_NumPosts end) 
		OR a.NumPosts <= (case 
        when I_NumPostsCompare = 2 then I_NumPosts end) OR
		a.NumPosts = (case 
        when I_NumPostsCompare = 1 then I_NumPosts end)); 

	-- set rowcount I_PageSize
	-- else
	-- set rowcount 10
	
     PREPARE stlistmem FROM 
	      'select a.*,			
			      a.Culture AS CultureUser,
			      (select COUNT(1) from {databaseName}.{objectQualifier}UserGroup x 
				  join {databaseName}.{objectQualifier}Group y 
				  on y.GroupID=x.GroupID
				  where x.UserID=a.UserID 
				  and (y.Flags & 1)=1) AS IsAdmin,
			     IFNULL(a.Flags & 1,0) AS IsHostAdmin,
				 b.RankID,
				 b.Name AS RankName,
				 (case(?)
				 when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
			     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID 
			     AND CHAR_LENGTH(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)   
			     else '''' end) AS Style,
			     CAST(? AS SIGNED) as TotalCount
			     from {databaseName}.{objectQualifier}User a 
			     join {databaseName}.{objectQualifier}Rank b on b.RankID=a.RankID	
      where 
	              (a.Name >= (case 
                                 when ? = 1 then ? end) OR a.Name <= (case 
                                 when ? = 2 then ? end) OR
		           a.Name >= (case 
                                 when ? = 0 then '''' end)) 
		         and
		(a.Joined >= (case 
        when ? = 1 then ? end) 
		OR a.Joined <= (case 
        when ? = 2 then ? end) OR
		a.Joined >= (case 
        when ? = 0 then 0 end)) and
		(a.LastVisit >= (case 
        when ? = 1 then  ? end) 
		OR a.LastVisit <= (case 
        when ? = 2 then ? end) OR
		a.LastVisit >= (case 
        when ? = 0 then 0 end))  and
		(a.NumPosts >= (case 
        when ? = 3 then  ? end) 
		OR a.NumPosts <= (case 
        when ? = 2 then ? end) OR
		a.NumPosts = (case 
        when ? = 1 then ? end))  and
		/*
		(a.NumPosts >= (case 
        when @SortPosts = 1 then @firstselectposts end) 
		OR a.NumPosts <= (case 
        when @SortPosts = 2 then @firstselectposts end) OR
		a.NumPosts >= (case 
        when @SortPosts = 0 then 0 end))   and
		(a.RankID >= (case 
        when @SortRank = 1 then @firstselectrankid end) 
		OR a.RankID <= (case 
        when @SortRank = 2 then @firstselectrankid end) OR
		a.RankID >= (case 
        when @SortRank = 0 then 0 end)) and */
	
	         a.BoardID = ? and
			(? is null or (?=0 and (a.Flags & 2)<>2) or (?=1 and (a.Flags & 2)=2)) and
			(? is null or exists(SELECT 1 FROM {databaseName}.{objectQualifier}UserGroup x 
			where x.UserID=a.UserID and x.GroupID=?)) and
			(? is null or a.RankID=?) AND
			IFNULL(a.Flags & 4,0) <> 4
			AND
			LOWER(a.DisplayName) LIKE 
			CASE 
			WHEN (? = 0 AND ? IS NOT NULL AND CHAR_LENGTH(?) > 0) THEN CONCAT(''%'', LOWER(?), ''%'') 
			WHEN (? = 1 AND ? IS NOT NULL AND CHAR_LENGTH(?) > 0) THEN CONCAT(LOWER(?), ''%'')
			ELSE ''%'' 
			END 
    ORDER BY 	
	 (case 
        when ? = 2 then a.Name end) DESC,
		(case 
        when ? = 1 then a.Name end) ASC, 
		(case 
        when ? = 2 then a.RankID end) DESC,
		(case 
        when ? = 1 then a.RankID end) ASC,		
		(case 
        when ? = 2 then a.Joined end) DESC,
		(case 
        when ? = 1 then a.Joined end) ASC,
		(case 
        when ? = 2 then a.LastVisit end) DESC,
		(case 
        when ? = 1 then a.LastVisit end) ASC,
		(case
		 when ? = 2 then a.NumPosts end) DESC, 
   		(case
		 when ? = 1 then a.NumPosts end) ASC LIMIT ?';

		 SET @PI_StyledNicks = I_StyledNicks;
         SET @PI_SortName = I_SortName;
		 SET @pici_user_totalrowsnumber = ici_user_totalrowsnumber;
		 SET @pici_firstselectuserid = ici_firstselectuserid;
		 SET @PI_SortJoined = I_SortJoined ;
		 SET @pici_firstselectjoined = ici_firstselectjoined;
		 SET @PI_SortLastVisit = I_SortLastVisit;
		 SET @pici_firstselectlastvisit = ici_firstselectlastvisit; 
		 SET @PI_NumPostsCompare = I_NumPostsCompare;
		 SET @PI_NumPosts = I_NumPosts;
		 SET @PI_BoardID = I_BoardID;
		 SET @PI_Approved = I_Approved;
		 SET @PI_GroupID = I_GroupID;
		 SET @PI_RankID = I_RankID;
		 SET @PI_BeginsWith = I_BeginsWith;
		 SET @PI_Literals = I_Literals;
		 SET @PI_Literals = I_Literals;		
		 SET @PI_BeginsWith = I_BeginsWith;
		 SET @PI_Literals = I_Literals;
		 SET @PI_Literals = I_Literals;
		 SET @PI_Literals = I_Literals;
		 SET @PI_SortPosts = I_SortPosts;
		 SET @PI_SortRank = I_SortRank;
		 SET @PI_PageSize = I_PageSize;
		

 EXECUTE stlistmem USING 
 @PI_StyledNicks, 
 @pici_user_totalrowsnumber, 
 -- where
 @PI_SortName, 
 @pici_firstselectuserid, 
 @PI_SortName, 
 @pici_firstselectuserid,
 @PI_SortName,
 @PI_SortJoined,
 @pici_firstselectjoined,
 @PI_SortJoined,
 @pici_firstselectjoined,
 @PI_SortJoined,
 @PI_SortLastVisit,
 @pici_firstselectlastvisit,
 @PI_SortLastVisit,
 @pici_firstselectlastvisit,
 @PI_SortLastVisit,
 @PI_NumPostsCompare,
 @PI_NumPosts,
 @PI_NumPostsCompare,
 @PI_NumPosts,
 @PI_NumPostsCompare,
 @PI_NumPosts,
 -- where boardid section 
 @PI_BoardID,
 @PI_Approved,
 @PI_Approved,
 @PI_Approved,

 @PI_GroupID,
 @PI_GroupID,
 @PI_RankID,
 @PI_RankID,
 @PI_BeginsWith,
 @PI_Literals,
 @PI_Literals,
 @PI_Literals,
 @PI_BeginsWith,
 @PI_Literals,
 @PI_Literals,
 @PI_Literals,
 -- order by
 @PI_SortName,
 @PI_SortName,
 @PI_SortRank,
 @PI_SortRank,
 @PI_SortJoined,
 @PI_SortJoined,
 @PI_SortLastVisit,
 @PI_SortLastVisit,
 @PI_SortPosts,
 @PI_SortPosts,
 -- limit
 @PI_PageSize;
 DEALLOCATE PREPARE stlistmem;
 else
 select a.*,			
			     a.Culture AS CultureUser,
			     0 AS IsAdmin,
			     0 AS IsHostAdmin,
				 1,
				 '' AS RankName,
			     '' AS Style,
			     0 as TotalCount
			     from {databaseName}.{objectQualifier}User a 
      where a.UserID = -1;
 end if;
		  
end;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_list
(i_BoardID INT,i_UserID INT,i_Approved TINYINT(1),i_GroupID INT,i_RankID INT, i_StyledNicks TINYINT(1)) 
BEGIN
 	IF i_UserID IS NOT NULL THEN
 		SELECT 
 			a.*, 
			a.Culture AS CultureUser,						
 			b.Name AS RankName,
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,
 			{databaseName}.{objectQualifier}biginttoint(IFNULL(a.Flags & 4,0)) AS IsGuest,
 			DATEDIFF(UTC_TIMESTAMP(),a.Joined)+1 AS NumDays,
 			(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}Message x WHERE (x.Flags & 24)=16) AS NumPostsForum,
 			SIGN((SELECT 1 FROM {databaseName}.{objectQualifier}User x 
                          WHERE x.UserID=a.UserID 
                            AND AvatarImage IS NOT NULL LIMIT 1)) AS HasAvatarImage, 
			IFNULL(c.IsAdmin,0) AS IsAdmin,
			IFNULL(a.Flags & 4,0) AS IsGuest,
			IFNULL(a.Flags & 1,0) AS IsHostAdmin,
			IFNULL(c.IsForumModerator,0) AS IsForumModerator,
			IFNULL(c.IsModerator,0) AS IsModerator											
 		FROM 
 			{databaseName}.{objectQualifier}User a
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 			left join {databaseName}.{objectQualifier}ActiveAccess c on c.UserID=a.UserID
 		WHERE 
 			a.UserID = i_UserID AND
 			a.BoardID = i_BoardID AND
 			(i_Approved IS NULL OR (i_Approved=0 AND (a.Flags & 2)=0) 
                            OR (i_Approved=1 and (a.Flags & 2)=2))
 		ORDER BY 
 			a.Name;

 	ELSEIF i_GroupID IS NULL and i_RankID IS NULL THEN
 		SELECT 
 			a.*,  
			a.Culture AS CultureUser,						
 			b.Name AS RankName,
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,                     
 			{databaseName}.{objectQualifier}biginttoint(IFNULL(a.Flags & 4,0)) AS IsGuest, 			
 			(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserGroup x
                           JOIN {databaseName}.{objectQualifier}Group y 
                             ON y.GroupID=x.GroupID 
                               WHERE x.UserID=a.UserID
                                 AND (y.Flags & 1)<>0) AS IsAdmin           		 			
 			
 		FROM 
 			{databaseName}.{objectQualifier}User a
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 		WHERE 
 			a.BoardID = i_BoardID 
                          AND (i_Approved IS NULL 
                           OR (i_Approved=0 AND (a.Flags & 2)=0) 
                             OR (i_Approved=1 AND (a.Flags & 2)=2))
 		ORDER BY 
 			a.Name;
 	ELSE
 		SELECT 
 			a.*,
			a.Culture AS CultureUser,				
 			b.Name AS RankName,	
 			(case(i_StyledNicks)
	          when 1 then  IFNULL(( SELECT f.Style 
	          FROM {databaseName}.{objectQualifier}UserGroup e 
		     join {databaseName}.{objectQualifier}Group f 
		     on f.GroupID=e.GroupID WHERE e.UserID=a.UserID 
		     AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), b.Style)  
	        else ''	 end) AS Style, 
 			IFNULL(a.Flags & 1,0) AS IsHostAdmin,            
 			{databaseName}.{objectQualifier}biginttoint(IFNULL(a.Flags & 4,0)) AS IsGuest,	
 			(SELECT COUNT(1) from {databaseName}.{objectQualifier}UserGroup x 
                        JOIN {databaseName}.{objectQualifier}Group y ON y.GroupID=x.GroupID 
                        WHERE x.UserID=a.UserID 
                        AND (y.Flags & 1)<>0) AS IsAdmin 			 			
 			
 		FROM 
 			{databaseName}.{objectQualifier}User a 
 			JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID=a.RankID
 		WHERE 
 			a.BoardID = i_BoardID and
 			(i_Approved IS NULL 
                          OR (i_Approved=0 AND (a.Flags & 2)=0) 
                          OR (i_Approved=1 AND (a.Flags & 2)=2)) 
                          AND (i_GroupID IS NULL OR EXISTS
                              (SELECT 1 FROM {databaseName}.{objectQualifier}UserGroup x 
                                 WHERE x.UserID=a.UserID AND x.GroupID=i_GroupID)) 
                                  AND (i_RankID IS NULL OR a.RankID=i_RankID)
 		ORDER BY 
 			a.Name;
         END IF;
END;
--GO

create procedure {databaseName}.{objectQualifier}admin_list(i_BoardID int, i_StyledNicks tinyint(1)) 
begin
		 select 
			a.*,
			a.NumPosts,
			a.Culture AS CultureUser,			
			r.RankID,						
			r.Name AS RankName,
			(case(i_StyledNicks)
			when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
			join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=a.UserID 
			AND CHAR_LENGTH(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), r.Style) 
			else ''	 end) AS Style,  
			(DATEDIFF(a.Joined, UTC_TIMESTAMP())+1) AS NumDays,
			(select count(1) from {databaseName}.{objectQualifier}Message x where (x.Flags & 24)=16) as NumPostsForum,
			(select count(1) from {databaseName}.{objectQualifier}User x 
			where x.UserID=a.UserID and AvatarImage is not null) AS HasAvatarImage,
			IfNull(c.IsAdmin,0) AS IsAdmin,			
			IfNull(a.Flags & 1,0) AS IsHostAdmin
		from 
			{databaseName}.{objectQualifier}User a	
			JOIN
			{databaseName}.{objectQualifier}Rank r	
			ON r.RankID = a.RankID		
			left join {databaseName}.{objectQualifier}vaccess c on c.UserID=a.UserID
		where 			
			a.BoardID = i_BoardID and
			-- is not guest 
			IfNull(a.Flags & 4,0) = 0 and
			c.ForumID = 0 and
			-- is admin 
			(IfNull(c.IsAdmin,0) <> 0) 
		order by 
			a.Name;
end;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_login(i_BoardID INT,i_Name VARCHAR(128),i_Password VARCHAR(32))
BEGIN
 	DECLARE ici_UserID INT;
 
 	/*Try correct board first*/
 	IF EXISTS(SELECT UserID FROM {databaseName}.{objectQualifier}User WHERE `Name`=i_Name AND Password=i_Password AND BoardID=i_BoardID and (Flags & 2)=2) THEN
 	
 		SELECT UserID  FROM {databaseName}.{objectQualifier}User WHERE `Name`=i_Name and Password=i_Password AND BoardID=i_BoardID and (Flags & 2)=2;
 		
 	ELSE
 
 	IF NOT EXISTS(select UserID FROM {databaseName}.{objectQualifier}User WHERE `Name`=i_Name AND Password=i_Password AND (BoardID=i_BoardID OR (Flags & 3)=3)) THEN
 		SELECT NULL AS UserID;
                 
 	ELSE
 		SELECT 
 			 UserID 
 		FROM 
 			{databaseName}.{objectQualifier}User
 		WHERE 
 			`Name`=i_Name AND
 			Password=i_Password AND 
 			(BoardID=i_BoardID OR (Flags & 1)=1) AND
 			(Flags & 2)=2; 
 	
        END IF;
        END IF; 
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_medal_delete
 	(i_UserID INT,
 	i_MedalID INT)
BEGIN 
 
 	DELETE FROM {databaseName}.{objectQualifier}UserMedal WHERE UserID=i_UserID AND MedalID=i_MedalID;
 
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_medal_list(i_UserID INT,
 	i_MedalID INT)
BEGIN 
 	SELECT 
 		a.MedalID,
 		a.Name,
 		a.MedalURL,
 		a.RibbonURL,
 		a.SmallMedalURL,
 		a.SmallRibbonURL,
 		a.SmallMedalWidth,
 		a.SmallMedalHeight,
 		a.SmallRibbonWidth,
 		a.SmallRibbonHeight,
 		b.SortOrder,
 		a.Flags,
 		c.Name as UserName,
 		c.DisplayName,
 		b.UserID,
 		IFNULL(b.Message,a.Message) as Message,
 		b.Message as MessageEx,
 		b.Hide,
 		b.OnlyRibbon,
 		b.SortOrder as CurrentSortOrder,
 		b.DateAwarded
 	FROM
 		{databaseName}.{objectQualifier}Medal a
 		INNER JOIN {databaseName}.{objectQualifier}UserMedal b ON b.MedalID = a.MedalID
 		INNER JOIN {databaseName}.{objectQualifier}User c ON c.UserID = b.UserID
 	WHERE
 		(i_UserID IS NULL OR b.UserID = i_UserID) AND
 		(i_MedalID IS NULL OR b.MedalID = i_MedalID)		
 	ORDER BY
 		c.Name ASC,
 		b.SortOrder ASC;
 
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_medal_save(
    i_UserID INT,
 	i_MedalID INT,
 	i_Message VARCHAR(128),
 	i_Hide TINYINT(1),
 	i_OnlyRibbon TINYINT(1),
 	i_SortOrder TINYINT(3),
 	i_DateAwarded DATETIME)
BEGIN
 
 	IF EXISTS(SELECT 1 from {databaseName}.{objectQualifier}UserMedal WHERE UserID=i_UserID AND MedalID=i_MedalID) THEN
 		UPDATE {databaseName}.{objectQualifier}UserMedal
 		SET
 			Message = i_Message,
 			Hide = i_Hide,
 			OnlyRibbon = i_OnlyRibbon,
 			SortOrder = i_SortOrder
 		WHERE
 			UserID=i_UserID AND 
 			MedalID=i_MedalID;
 	
 	ELSE 
 
 		IF (i_DateAwarded IS NULL) THEN SET i_DateAwarded = UTC_TIMESTAMP(); END IF;
 
 		INSERT INTO {databaseName}.{objectQualifier}UserMedal(UserID,MedalID,Message,Hide,OnlyRibbon,SortOrder,DateAwarded)
 		VALUES
 			(i_UserID,i_MedalID,i_Message,i_Hide,i_OnlyRibbon,i_SortOrder,i_DateAwarded);
 	END IF; 
 
END;
--GO

 	 /* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_nntp(i_BoardID INT,i_UserName VARCHAR(128),i_Email VARCHAR(128),i_TimeZone int) 
BEGIN
DECLARE icic_UserID INT DEFAULT 0; 
DECLARE icic_cntr INT;  
SET i_UserName = CONCAT(i_UserName,' ','NNTP');
SELECT qqq.UserID,COUNT(qqq.UserID) INTO  icic_UserID, icic_cntr FROM {databaseName}.{objectQualifier}User qqq 
WHERE qqq.BoardID=i_BoardID AND qqq.Name =i_UserName;
/*SET icic_cntr = FOUND_ROWS();
SELECT
 		UserID INTO  icic_UserID
 	    FROM
 		{databaseName}.{objectQualifier}User
 	    WHERE
 		BoardID=i_BoardID 
 		AND `Name`=i_UserName LIMIT 1;*/
 		
 IF icic_cntr < 1 OR icic_cntr IS NULL THEN 		

 		CALL {databaseName}.{objectQualifier}user_save(null,i_BoardID,i_UserName,i_UserName,i_Email,i_TimeZone,null,null,null,null, null, 1, null, null, null); 		
 		SELECT MAX(UserID) INTO icic_UserID FROM {databaseName}.{objectQualifier}User;
END IF;		
 	SELECT icic_UserID AS UserID;		
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_pmcount
 	(i_UserID INT)
 BEGIN 	
 	
 	    DECLARE ici_CountIn int;	
		DECLARE ici_CountOut int;
		DECLARE ici_CountArchivedIn int;
		DECLARE ici_plimit1 int;       
        DECLARE ici_pcount int default 0;
        
      set ici_plimit1 = (SELECT  c.PMLimit FROM {databaseName}.{objectQualifier}User a 
                        JOIN {databaseName}.{objectQualifier}UserGroup b
                          ON a.UserID = b.UserID
                            JOIN {databaseName}.{objectQualifier}Group c                         
                              ON b.GroupID = c.GroupID WHERE a.UserID = i_UserID ORDER BY c.PMLimit DESC LIMIT 1);
      set ici_pcount = (SELECT  c.PMLimit FROM {databaseName}.{objectQualifier}Rank c 
                        JOIN {databaseName}.{objectQualifier}User d
                           ON c.RankID = d.RankID WHERE d.UserID = i_UserID ORDER BY c.PMLimit DESC LIMIT 1);
      if (ici_plimit1 > ici_pcount)  THEN     
      set ici_pcount = ici_plimit1;      
      end if; 
      
    -- get count of pm's in user's sent items
	
	SELECT 
	COUNT(1) INTO	ici_CountOut 
	FROM 
		{databaseName}.{objectQualifier}UserPMessage a
	INNER JOIN {databaseName}.{objectQualifier}PMessage b 
	ON a.PMessageID=b.PMessageID
	WHERE 
		SIGN(a.Flags & 2)<>0 AND
		b.FromUserID = i_UserID;
    -- get count of pm's in user's received items
	SELECT 
	 COUNT(1) INTO	ici_CountIn  
	FROM 
		{databaseName}.{objectQualifier}UserPMessage 
	WHERE 
		UserID = i_UserID
		AND SIGN(Flags & 8) = 0 AND SIGN(Flags & 4) = 0;
		-- archived pmessages
	SELECT 
		COUNT(1) INTO ici_CountArchivedIn
	FROM 
		{databaseName}.{objectQualifier}UserPMessage a
		WHERE
		SIGN(a.Flags & 4) <> 0 AND
		a.UserID = i_UserID;	

	-- return all pm data
	SELECT 
		ici_CountIn AS NumberIn,
		ici_CountOut AS NumberOut,
		ici_CountArchivedIn AS NumberArchived,
		ici_CountIn + ici_CountOut + ici_CountArchivedIn AS NumberTotal,
		ici_pcount AS NumberAllowed;
END;
--GO

/* XXX STORED PROCEDURE CREATED BY VZ-TEAM XXX */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_recoverpassword(i_BoardID INT,i_UserName VARCHAR(128),i_Email VARCHAR(128)) 
BEGIN
 	DECLARE ici_UserID INT;
 	SELECT  UserID INTO ici_UserID FROM {databaseName}.{objectQualifier}User 
          WHERE BoardID = i_BoardID AND `Name` = i_UserName and Email = i_Email;
 	IF ici_UserID IS NULL THEN
 		SELECT CONVERT(null,SIGNED) AS UserID;
 		/*return*/
 	ELSE 	
 		SELECT  ici_UserID AS UserID;
 	END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_removepoints (i_UserID INT,i_Points INT) 
BEGIN
	UPDATE {databaseName}.{objectQualifier}User SET Points = Points - i_Points WHERE UserID = i_UserID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_removepointsbytopicid(i_TopicID INT,i_Points INT) 
BEGIN
 	DECLARE ici_UserID INT;
 	SELECT UserID INTO ici_UserID FROM {databaseName}.{objectQualifier}Topic WHERE TopicID = i_TopicID;
 	UPDATE {databaseName}.{objectQualifier}User SET Points = Points - i_Points WHERE UserID = ici_UserID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_savenotification(
	i_UserID				int,
	i_PMNotification		TINYINT(1),
	i_AutoWatchTopics    TINYINT(1),
	i_NotificationType	INT,
	i_DailyDigest		TINYINT(1)
)
BEGIN

		UPDATE
			{databaseName}.{objectQualifier}User
		SET
			PMNotification = (CASE WHEN (i_PMNotification is not null) THEN  i_PMNotification ELSE PMNotification END),
			AutoWatchTopics = (CASE WHEN (i_AutoWatchTopics is not null) THEN  i_AutoWatchTopics ELSE AutoWatchTopics END),
			NotificationType =  (CASE WHEN (i_NotificationType is not null) THEN  i_NotificationType ELSE NotificationType END),
			DailyDigest = (CASE WHEN (i_DailyDigest is not null) THEN  i_DailyDigest ELSE DailyDigest END)
		WHERE
			UserID = i_UserID;
END
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_resetpoints ()
BEGIN
 	UPDATE {databaseName}.{objectQualifier}User SET Points = NumPosts * 3;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */ 
 CREATE PROCEDURE {databaseName}.{objectQualifier}user_save(
 	i_UserID		        INT,
 	i_BoardID		        INT,
 	i_UserName		        VARCHAR(128),
 	i_DisplayName		    VARCHAR(128),
 	i_Email			        VARCHAR(128),
 	i_TimeZone		        INT,
 	i_LanguageFile	        VARCHAR(128),
 	i_Culture		        CHAR(5),
 	i_ThemeFile		        VARCHAR(128),
	i_UseSingleSignOn       TINYINT(1),
	i_TextEditor			VARCHAR(50),
 	i_OverrideDefaultTheme	TINYINT(1),
 	i_Approved		        TINYINT(1),
 	i_PMNotification		TINYINT(1),
	i_NotificationType	    INT,
 	i_ProviderUserKey	    VARCHAR(64),
 	i_AutoWatchTopics		TINYINT(1),
 	i_DSTUser               TINYINT(1),
	i_HideUser              TINYINT(1))

BEGIN
 	DECLARE ici_RankID INT;
 	DECLARE ici_Flags INT DEFAULT 0;
 	
 	 	             if i_DSTUser is null 
 	                  THEN 
 	                     SET i_DSTUser = 0;
 	                  END IF;
	                 if i_HideUser is null
	                 THEN 
	                     SET i_HideUser = 0;
	                  END IF;
	
 	                 IF i_PMNotification IS NULL 
 	                 THEN 
 	                    SET i_PMNotification = 1; 
 	                 END IF;
 	                 IF i_OverrideDefaultTheme IS NULL 
 	                 THEN
 	                    SET i_OverrideDefaultTheme=0;
 	                 END IF;
					    IF i_UseSingleSignOn IS NULL 
 	                 THEN
 	                    SET i_UseSingleSignOn = 0;
 	                 END IF;
 	              
 
 	IF (i_UserID IS NULL OR i_UserID < 1) THEN
 	-- begin it
 	IF i_Approved<>0 THEN 
 	  SET ici_Flags = ici_Flags | 2; 
 	    END IF;
 		IF (i_Email = '') 
 		  THEN 
 		   SET i_Email = null; 
 		    END IF;
 		
 		SELECT RankID 
 		INTO ici_RankID 
 		FROM {databaseName}.{objectQualifier}Rank 
 		WHERE (Flags & 1)<>0 AND BoardID=i_BoardID;
 
 		INSERT INTO {databaseName}.{objectQualifier}User(BoardID,RankID,`Name`,DisplayName,Password,Email,Joined,LastVisit,NumPosts,TimeZone,Flags,PMNotification,NotificationType,ProviderUserKey,AutoWatchTopics) 
          VALUES(i_BoardID,ici_RankID,i_UserName,i_DisplayName,'-',i_Email,UTC_TIMESTAMP(),UTC_TIMESTAMP(),0,i_TimeZone,ici_Flags,i_PMNotification,i_NotificationType,i_ProviderUserKey,i_AutoWatchTopics);		
 	
 		SET i_UserID = LAST_INSERT_ID();
 
 		INSERT INTO {databaseName}.{objectQualifier}UserGroup(UserID,GroupID) 
 		SELECT i_UserID AS UserID,
 		GroupID 
 		FROM {databaseName}.{objectQualifier}Group 
 		where BoardID=i_BoardID and (Flags & 4)<>0;
 		-- else condition
    ELSE
      set ici_Flags = (SELECT Flags FROM {databaseName}.{objectQualifier}User where UserID = i_UserID);	
	 -- isdirty flag -set only		
		IF ((ici_flags & 64) <> 64) then		
		SET ici_flags = ici_flags | 64;
		end if;

		 IF ((i_DSTUser<>0) AND ((ici_Flags & 32) <> 32)) 	
		THEN	
		SET ici_Flags = ici_Flags | 32;
		ELSEIF ((i_DSTUser=0) AND ((ici_Flags & 32) = 32)) 
		THEN
		SET ici_Flags = ici_Flags ^ 32;
		END IF;
				
		IF i_HideUser<>0 AND (ici_Flags & 16) <> 16 
		  THEN
		    SET ici_Flags = (ici_Flags | 16); 
		ELSEIF i_HideUser=0 AND (ici_Flags & 16) = 16 
		  THEN 
		   SET ici_Flags = (ici_Flags ^ 16);		
		END IF; 
		
    UPDATE {databaseName}.{objectQualifier}User SET
    TimeZone = i_TimeZone,
    LanguageFile = i_LanguageFile,
    Culture = i_Culture,
    ThemeFile = i_ThemeFile,
	UseSingleSignOn = i_UseSingleSignOn,
	TextEditor = i_TextEditor,
    OverrideDefaultThemes = i_OverrideDefaultTheme,
   	PMNotification = (CASE WHEN (i_PMNotification > 0) THEN i_PMNotification ELSE PMNotification END),
	AutoWatchTopics = (CASE WHEN (i_AutoWatchTopics > 0) THEN  i_AutoWatchTopics ELSE AutoWatchTopics END),
	NotificationType =  (CASE WHEN (i_NotificationType > 0) THEN  i_NotificationType ELSE NotificationType END),
	Flags = (CASE WHEN ici_Flags<>Flags THEN  ici_Flags ELSE Flags END),
	DisplayName = (CASE WHEN (i_DisplayName is not null) THEN  i_DisplayName ELSE DisplayName END),
	Email = (CASE WHEN (i_Email is not null) THEN  i_Email ELSE Email END)					
    WHERE UserID = i_UserID;       
	END IF;
			
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_saveavatar
    (
    i_UserID INT,
    i_Avatar VARCHAR(255),
    i_AvatarImage BLOB,
    i_AvatarImageType VARCHAR(128)
    )
    BEGIN
    IF i_Avatar IS NOT NULL  THEN

    UPDATE {databaseName}.{objectQualifier}User
    SET Avatar = i_Avatar,
    AvatarImage = null,
    AvatarImageType = null
    WHERE UserID = i_UserID;

    ELSEIF i_AvatarImage IS NOT NULL THEN
    UPDATE {databaseName}.{objectQualifier}User
    SET AvatarImage = i_AvatarImage,
    AvatarImageType = i_AvatarImageType,
    Avatar = null WHERE UserID = i_UserID;
    END IF;
    END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_savepassword(i_UserID INT,i_Password VARCHAR(32))
    BEGIN
    UPDATE {databaseName}.{objectQualifier}User SET Password = i_Password where UserID = i_UserID;
    END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_savesignature(i_UserID INT,i_Signature TEXT) 
BEGIN
 	UPDATE {databaseName}.{objectQualifier}User SET Signature = i_Signature WHERE UserID = i_UserID;
END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_setnotdirty(i_UserID INT)
    BEGIN
    UPDATE {databaseName}.{objectQualifier}User SET Flags = Flags ^ 64 WHERE UserID = i_UserID AND (Flags & 64) = 64;
    END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_setpoints(i_UserID INT,i_Points INT)
    BEGIN
    UPDATE {databaseName}.{objectQualifier}User SET Points = i_Points WHERE UserID = i_UserID;
    END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */   
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_setrole
    (i_BoardID INT,
    i_ProviderUserKey VARCHAR(64),
    i_Role VARCHAR(128))
    BEGIN
    DECLARE ici_UserID INT;
    DECLARE ici_GroupID INT;

    SELECT UserID INTO ici_UserID
    FROM {databaseName}.{objectQualifier}User
    WHERE BoardID=i_BoardID AND ProviderUserKey=i_ProviderUserKey;

    IF i_Role IS NULL THEN
    DELETE FROM {databaseName}.{objectQualifier}UserGroup WHERE UserID=ici_UserID;
    ELSE
    IF NOT EXISTS(SELECT 1 from {databaseName}.{objectQualifier}Group 
    WHERE BoardID=i_BoardID AND `Name`=i_Role) THEN

    INSERT INTO {databaseName}.{objectQualifier}Group(`Name`,BoardID,Flags)
    VALUES (i_Role,i_BoardID,0);
    SET ici_GroupID = LAST_INSERT_ID();
    
    insert into {databaseName}.{objectQualifier}ForumAccess(GroupID,ForumID,AccessMaskID)
    SELECT
    ici_GroupID AS GroupID,
    a.ForumID,
    MIN(a.AccessMaskID) AS AccessMaskID
    FROM
    {databaseName}.{objectQualifier}ForumAccess a
    JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID=a.GroupID
    WHERE
    b.BoardID=i_BoardID AND
    (b.Flags & 4)=4
    GROUP BY
    a.ForumID;
    ELSE
    SELECT  GroupID INTO ici_GroupID FROM {databaseName}.{objectQualifier}Group WHERE BoardID=i_BoardID AND `Name`=i_Role;
    END IF;
    IF NOT EXISTS(SELECT 1 from {databaseName}.{objectQualifier}UserGroup 
    WHERE UserID=ici_UserID AND GroupID=ici_GroupID) THEN
    INSERT INTO {databaseName}.{objectQualifier}UserGroup(UserID,GroupID) VALUES (ici_UserID,ici_GroupID);
    END IF;
    END IF;
    END;
--GO    
    
    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_suspend(i_UserID INT,i_Suspend DATETIME)
    BEGIN
    UPDATE {databaseName}.{objectQualifier}User SET Suspended = i_Suspend WHERE UserID=i_UserID;
    END;
--GO

    /* STORED PROCEDURE CREATED BY VZ-TEAM */    
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_upgrade(i_UserID INT)
    BEGIN
    DECLARE ici_RankID	INT;
    DECLARE ici_Flags	INT;
    DECLARE ici_MinPosts	INT;
    DECLARE ici_NumPosts	INT;
    DECLARE myrowcount INT;
    DECLARE ici_BoardID	INT;
    DECLARE ici_RankBoardID	INT;
    /* Get user and rank information*/
    SELECT
    b.RankID ,
    b.Flags,
    b.MinPosts,
    a.NumPosts,
    a.BoardID	
    INTO
    ici_RankID,
    ici_Flags,
    ici_MinPosts,
    ici_NumPosts,
    ici_BoardID
    FROM
    {databaseName}.{objectQualifier}User a
    INNER JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID = a.RankID
    WHERE
    a.UserID = i_UserID;

    /*If user isn't member of a ladder rank, exit*/
    if (ici_Flags & 2) != 0 THEN
 	
 		-- retrieve board current user's rank beling to	
    select BoardID INTO ici_RankBoardID
    from   {databaseName}.{objectQualifier}Rank
    where  RankID = ici_RankID LIMIT 1;

	-- does user have rank from his board?
    IF (ici_RankBoardID <> ici_BoardID) THEN
		-- get highest rank user can get
		select RankID INTO ici_RankID
        from    {databaseName}.{objectQualifier}Rank
        where BoardID = ici_BoardID 
               and (Flags & 2) = 2
               and MinPosts <= ici_NumPosts
        order by
               MinPosts desc LIMIT 1;	
    else 	
			 	/* See if user got enough posts for next ladder group */
 	SELECT 
 	 RankID
        INTO
        ici_RankID
 	FROM
 		{databaseName}.{objectQualifier}Rank
 	WHERE
 	    BoardID = ici_BoardID AND
 		(Flags & 2) = 2 and
 		MinPosts <= ici_NumPosts and
 		MinPosts > ici_MinPosts
 	ORDER BY
 		MinPosts LIMIT 1;
	END IF;
	
	IF ici_RankID IS NOT NULL THEN
 		UPDATE {databaseName}.{objectQualifier}User SET RankID = ici_RankID WHERE UserID = i_UserID; END IF;
         END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}userforum_delete(i_UserID INT,i_ForumID INT)
BEGIN
	DELETE FROM {databaseName}.{objectQualifier}UserForum WHERE UserID=i_UserID AND ForumID=i_ForumID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}userforum_list(i_UserID INT,i_ForumID INT)
BEGIN
 SELECT
 		a.*,
 		b.AccessMaskID,
 		b.Accepted,
 		c.Name AS Access 
 	FROM
 		{databaseName}.{objectQualifier}UserSelectView a
 		JOIN {databaseName}.{objectQualifier}UserForum b ON b.UserID=a.UserID
 		JOIN {databaseName}.{objectQualifier}AccessMask c ON c.AccessMaskID=b.AccessMaskID
 	WHERE
 		(i_UserID IS NULL OR a.UserID=i_UserID) AND
 		(i_ForumID IS NULL OR b.ForumID=i_ForumID)
 	ORDER BY
 		a.Name;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}userforum_save(i_UserID INT,i_ForumID INT,i_AccessMaskID INT)
BEGIN
 	IF EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserForum WHERE UserID=i_UserID AND ForumID=i_ForumID) THEN
 		UPDATE {databaseName}.{objectQualifier}UserForum SET AccessMaskID=i_AccessMaskID WHERE UserID=i_UserID AND ForumID=i_ForumID;
	ELSE
 		INSERT INTO {databaseName}.{objectQualifier}UserForum(UserID,ForumID,AccessMaskID,Invited,Accepted) VALUES(i_UserID,i_ForumID,i_AccessMaskID,UTC_TIMESTAMP(),1);
        END IF;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}usergroup_list(i_UserID INT) 
BEGIN
 	SELECT 
 		b.GroupID,
 		b.Name,
 		b.Style
 	FROM
 		{databaseName}.{objectQualifier}UserGroup a
 		JOIN {databaseName}.{objectQualifier}Group b ON b.GroupID=a.GroupID
 	WHERE
 		a.UserID = i_UserID
 	ORDER BY
 		b.Name;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}usergroup_save(i_UserID INT,i_GroupID INT,i_Member TINYINT(1))
BEGIN
	IF i_Member=0 THEN
		DELETE FROM {databaseName}.{objectQualifier}UserGroup WHERE UserID=i_UserID AND GroupID=i_GroupID;
	ELSE
    IF NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}UserGroup WHERE UserID=i_UserID AND GroupID=i_GroupID) THEN
		INSERT INTO {databaseName}.{objectQualifier}UserGroup(UserID,GroupID)
		VALUES (i_UserID,i_GroupID); END IF;
        END IF;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}userpmessage_delete(i_UserPMessageID INT)
BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}UserPMessage WHERE UserPMessageID=i_UserPMessageID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}userpmessage_list(i_UserPMessageID INT) 
BEGIN
 	SELECT
 		a.*,
 		b.Name AS FromUser,
 		c.UserID AS ToUserID,
 		c.Name AS ToUser,
 		d.IsRead,
 		d.UserPMessageID
 	FROM
 		{databaseName}.{objectQualifier}PMessage a
 		inner join {databaseName}.{objectQualifier}UserPMessageSelectView d on d.PMessageID = a.PMessageID
 		inner join {databaseName}.{objectQualifier}User b on b.UserID = a.FromUserID
 		inner join {databaseName}.{objectQualifier}User c on c.UserID = d.UserID
 	WHERE
 		d.UserPMessageID = i_UserPMessageID
 		/*AND 
		SIGN(d.IsDeleted)=0*/;
END;
--GO



/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchforum_add(i_UserID INT,i_ForumID INT)
BEGIN
                          
                            IF NOT EXISTS (SELECT 1 FROM {databaseName}.{objectQualifier}watchforum a
                            WHERE a.ForumID=i_ForumID
                            AND a.UserID = i_UserID) THEN
                            INSERT INTO {databaseName}.{objectQualifier}WatchForum
                            (ForumID,
                            UserID,
                            Created)
                            VALUES (i_ForumID,
                            i_UserID,
                            UTC_TIMESTAMP());
                            END IF;


	
END;

--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchforum_check(i_UserID INT,i_ForumID INT)
BEGIN 
 	SELECT WatchForumID
     FROM {databaseName}.{objectQualifier}WatchForum
         WHERE UserID = i_UserID AND ForumID = i_ForumID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchforum_delete(i_WatchForumID INT) 
BEGIN
	DELETE FROM {databaseName}.{objectQualifier}WatchForum WHERE WatchForumID = i_WatchForumID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchforum_list(i_UserID INT) 
BEGIN
 	SELECT
 		a.*,
 		b.Name AS ForumName,
 		(SELECT CAST(COUNT(x.Priority) AS UNSIGNED) FROM {databaseName}.{objectQualifier}Topic x JOIN {databaseName}.{objectQualifier}Message y ON y.TopicID=x.TopicID WHERE x.ForumID=a.ForumID) AS Messages,
 		(SELECT CAST(COUNT(1) AS UNSIGNED) FROM {databaseName}.{objectQualifier}Topic x WHERE x.ForumID=a.ForumID AND x.TopicMovedID IS NULL) AS Topics,
 		b.LastPosted,
 		b.LastMessageID,
 		(SELECT TopicID FROM {databaseName}.{objectQualifier}Message x WHERE x.MessageID=b.LastMessageID) AS LastTopicID,
 		b.LastUserID,
 		IFNULL(b.LastUserName,(select `Name` from {databaseName}.{objectQualifier}User x where x.UserID=b.LastUserID)) AS LastUserName
 	FROM
 		{databaseName}.{objectQualifier}WatchForum a
 		INNER JOIN {databaseName}.{objectQualifier}Forum b ON b.ForumID = a.ForumID
 	WHERE
 		a.UserID = i_UserID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchtopic_add(i_UserID INT,i_TopicID INT) 
BEGIN
        IF NOT EXISTS(SELECT 1 FROM {databaseName}.{objectQualifier}WatchTopic WHERE TopicID=i_TopicID AND UserID=i_UserID) THEN
 	INSERT INTO {databaseName}.{objectQualifier}WatchTopic(TopicID,UserID,Created)
	VALUES (i_TopicID, i_UserID, UTC_TIMESTAMP()); 	
        END IF; 
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchtopic_check(i_UserID INT,i_TopicID INT) 
BEGIN
 	SELECT WatchTopicID FROM {databaseName}.{objectQualifier}WatchTopic WHERE UserID = i_UserID AND TopicID = i_TopicID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchtopic_delete(i_WatchTopicID INT)
BEGIN
 	DELETE FROM {databaseName}.{objectQualifier}WatchTopic WHERE WatchTopicID = i_WatchTopicID;
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}watchtopic_list(i_UserID INT) 
BEGIN
 	SELECT
 		a.*,
 		b.Topic AS TopicName,
 		(SELECT COUNT(1) from {databaseName}.{objectQualifier}Message x where x.TopicID=b.TopicID) - 1 AS Replies,
 		b.Views,
 		b.LastPosted,
 		b.LastMessageID,
 		b.LastUserID,
 		IFNULL(b.LastUserName,(SELECT `Name` FROM {databaseName}.{objectQualifier}User x WHERE x.UserID=b.LastUserID)) AS LastUserName
 	FROM
 		{databaseName}.{objectQualifier}WatchTopic a
 		INNER JOIN {databaseName}.{objectQualifier}Topic b ON b.TopicID = a.TopicID
 	WHERE
 		a.UserID = i_UserID;
END;
--GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
 CREATE PROCEDURE {databaseName}.{objectQualifier}user_migrate
 (
 	i_UserID INT,
 	i_ProviderUserKey VARCHAR(64),
 	i_UpdateProvider TINYINT(1)
 )
 BEGIN
 	DECLARE ici_Password VARCHAR(255);
        DECLARE ici_IsApproved TINYINT(1);
        DECLARE ici_LastActivity DATETIME;
        DECLARE ici_Joined DATETIME;
        DECLARE ici_case INT;
        DECLARE ici_result TINYINT(1) DEFAULT 0;


 	UPDATE {databaseName}.{objectQualifier}User SET ProviderUserKey = i_ProviderUserKey WHERE UserID = i_UserID;
 
 	IF (i_UpdateProvider = 1) THEN 	
                
                  SELECT			
 			Flags & 2 INTO ici_case 	
                
 		  FROM
 			{databaseName}.{objectQualifier}User
 		  WHERE
 			UserID = i_UserID;
                  IF ici_case =2 THEN SET ici_result =1;  END IF;               
                 
                
 		SELECT
 			  Password,
 			  ici_result,
 			  LastVisit,
 			  Joined
                INTO ici_Password, ici_IsApproved, ici_LastActivity, ici_Joined
 		FROM
 			{databaseName}.{objectQualifier}User
 		WHERE
 			UserID = i_UserID;
 		
 		UPDATE
 			{databaseName}.{objectQualifier}prov_Membership
 		SET
 			Password = ici_Password,
 			PasswordFormat = '1',
 			LastActivity = ici_LastActivity,
 			IsApproved = ici_IsApproved,
 			Joined = ici_Joined
 		WHERE
 			UserID = i_ProviderUserKey;
 	END IF;
 END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE PROCEDURE {databaseName}.{objectQualifier}user_listmedals(i_UserID	INT)
BEGIN
 
 	(SELECT
 		a.`MedalID`,
 		a.`Name`,
 		IFNULL(b.`Message`, a.`Message`) AS `Message`,
 		a.`MedalURL`,
 		a.`RibbonURL`,
 		a.`SmallMedalURL`,
 		IFNULL(a.`SmallRibbonURL`, a.`SmallMedalURL`) AS SmallRibbonURL,
 		a.`SmallMedalWidth`,
 		a.`SmallMedalHeight`,
 		IFNULL(a.`SmallRibbonWidth`, a.`SmallMedalWidth`) AS `SmallRibbonWidth`,
 		IFNULL(a.`SmallRibbonHeight`, a.`SmallMedalHeight`) AS `SmallRibbonHeight`,
 		{databaseName}.{objectQualifier}medal_getsortorder(b.`SortOrder`,a.`SortOrder`,a.`Flags`) as `SortOrder`,
 		{databaseName}.{objectQualifier}medal_gethide(b.`Hide`,a.`Flags`) AS `Hide`,
 		{databaseName}.{objectQualifier}medal_getribbonsetting(a.`SmallRibbonURL`,a.`Flags`,b.`OnlyRibbon`) AS `OnlyRibbon`,
 		a.`Flags`,
 		b.`DateAwarded`
 	FROM
 		{databaseName}.{objectQualifier}Medal a
 		INNER JOIN {databaseName}.{objectQualifier}UserMedal b ON a.`MedalID` = b.`MedalID`
 	WHERE
 		b.`UserID` = i_UserID)
 
 	UNION
 
 	(SELECT	a.`MedalID`, a.`Name`,
 		IFNULL(b.`Message`, a.`Message`) as `Message`,
 		a.`MedalURL`,
 		a.`RibbonURL`,
 		a.`SmallMedalURL`,
 		IFNULL(a.`SmallRibbonURL`, a.`SmallMedalURL`) as `SmallRibbonURL`,
 		a.`SmallMedalWidth`,
 		a.`SmallMedalHeight`,
 		IFNULL(a.`SmallRibbonWidth`, a.`SmallMedalWidth`) as `SmallRibbonWidth`,
 		IFNULL(a.`SmallRibbonHeight`, a.`SmallMedalHeight`) as `SmallRibbonHeight`,
 		{databaseName}.{objectQualifier}medal_getsortorder(b.`SortOrder`,a.`SortOrder`,a.`Flags`) as `SortOrder`,
 		{databaseName}.{objectQualifier}medal_gethide(b.`Hide`,a.`Flags`) as `Hide`,
 		{databaseName}.{objectQualifier}medal_getribbonsetting(a.`SmallRibbonURL`,a.`Flags`,b.`OnlyRibbon`) as `OnlyRibbon`,
 		a.`Flags`,
 		NULL AS `DateAwarded`
 	FROM
 		{databaseName}.{objectQualifier}Medal a
 		INNER JOIN {databaseName}.{objectQualifier}GroupMedal b ON a.`MedalID` = b.`MedalID`
 		INNER JOIN {databaseName}.{objectQualifier}UserGroup c ON b.`GroupID` = c.`GroupID`
 	WHERE
 		c.`UserID` = i_UserID)
 	ORDER BY
 		`OnlyRibbon` DESC,
 		`SortOrder` ASC;
 
END;
--GO

/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}accessmask_list(
i_BoardID  INT, i_AccessMaskID INT, i_ExcludeFlags INT)
BEGIN
IF i_AccessMaskID IS NULL THEN
SELECT   a.*
FROM     {databaseName}.{objectQualifier}AccessMask a
WHERE    a.BoardID = i_BoardID and
			(a.Flags & i_ExcludeFlags) = 0
ORDER BY a.SortOrder;
ELSE
SELECT   a.*
FROM     {databaseName}.{objectQualifier}AccessMask a
WHERE    a.BoardID = i_BoardID
AND a.AccessMaskID = i_AccessMaskID
ORDER BY a.SortOrder;
END IF;
END;
--GO

CREATE  PROCEDURE {objectQualifier}accessmask_delete(
i_AccessMaskID INT)
BEGIN
DECLARE  l_flag INT DEFAULT 1;

IF EXISTS (SELECT 1
FROM   {databaseName}.{objectQualifier}ForumAccess
WHERE  AccessMaskID = i_AccessMaskID)
OR EXISTS (SELECT 1
FROM   {databaseName}.{objectQualifier}UserForum
WHERE  AccessMaskID = i_AccessMaskID) THEN
SET l_flag = 0;
ELSE
DELETE FROM {databaseName}.{objectQualifier}AccessMask
WHERE       AccessMaskID = i_AccessMaskID;
END IF;
SELECT l_flag;
END;
--GO
/* STORED PROCEDURE CREATED BY VZ-TEAM */

CREATE  PROCEDURE {databaseName}.{objectQualifier}accessmask_save(
IN i_AccessMaskID    INT,
IN i_BoardID         INT,
IN i_Name            VARCHAR(128),
IN i_ReadAccess      TINYINT(1),
IN i_PostAccess      TINYINT(1),
IN i_ReplyAccess     TINYINT(1),
IN i_PriorityAccess  TINYINT(1),
IN i_PollAccess      TINYINT(1),
IN i_VoteAccess      TINYINT(1),
IN i_ModeratorAccess TINYINT(1),
IN i_EditAccess      TINYINT(1),
IN i_DeleteAccess    TINYINT(1),
IN i_UploadAccess    TINYINT(1),
IN i_DownloadAccess  TINYINT(1),
IN i_SortOrder  INT)
BEGIN
DECLARE  l_Flags INT;
SET l_Flags = 0;

IF i_ReadAccess <> 0 THEN
SET l_Flags = l_Flags | 1;
END IF;
IF i_PostAccess <> 0 THEN
SET l_Flags = l_Flags | 2;
END IF;
IF i_ReplyAccess <> 0 THEN
SET l_Flags = l_Flags | 4;
END IF;
IF i_PriorityAccess <> 0 THEN
SET l_Flags = l_Flags | 8;
END IF;
IF i_PollAccess <> 0 THEN
SET l_Flags = l_Flags | 16;
END IF;
IF i_VoteAccess <> 0 THEN
SET l_Flags = l_Flags | 32;
END IF;
IF i_ModeratorAccess <> 0 THEN
SET l_Flags = l_Flags | 64;
END IF;
IF i_EditAccess <> 0 THEN
SET l_Flags = l_Flags | 128;
END IF;
IF i_DeleteAccess <> 0 THEN
SET l_Flags = l_Flags | 256;
END IF;
IF i_UploadAccess <> 0 THEN
SET l_Flags = l_Flags | 512;
END IF;
IF i_DownloadAccess <> 0 THEN
SET l_Flags = l_Flags | 1024;
END IF;
IF i_AccessMaskID IS NULL THEN
INSERT INTO {databaseName}.{objectQualifier}AccessMask
(`Name`,
`BoardID`,
`Flags`,`SortOrder`)
VALUES     (i_Name,
i_BoardID,
l_Flags,i_SortOrder);
ELSE
UPDATE {databaseName}.{objectQualifier}AccessMask
SET    `Name` = i_Name,
`Flags` = l_Flags,`SortOrder` = i_SortOrder
WHERE  AccessMaskID = i_AccessMaskID;
END IF;
END;
--GO
/* My procedures */

CREATE PROCEDURE {databaseName}.{objectQualifier}user_get
(
	i_BoardID		INT,
    i_ProviderUserKey       VARCHAR(64) 
) 

BEGIN

	SELECT UserID FROM {databaseName}.{objectQualifier}User 
        WHERE BoardID=i_BoardID 
        AND ProviderUserKey=i_ProviderUserKey;
END;
--GO 


/* STORED PROCEDURE CREATED BY VZ-TEAM topic_latest */
CREATE PROCEDURE {databaseName}.{objectQualifier}topic_latest
 (
 	i_BoardID INT,
 	i_NumPosts INT,
 	i_PageUserID INT,
 	i_StyledNicks TINYINT(1),
	i_ShowNoCountPosts TINYINT(1),
	i_FindLastRead TINYINT(1)
 )
 BEGIN
 -- to boost performance
 -- SET i_StyledNicks = 0;		
PREPARE stmt_tl FROM 'SELECT
 		t.LastPosted,
 		t.ForumID,
 		f.Name as Forum,
 		t.Topic,
		t.`Status`,
 		t.TopicID,
		t.TopicMovedID,
		t.UserID,
		t.UserName,	
 		t.LastMessageID,
		t.LastMessageFlags,
 		t.LastUserID,
 		t.NumPosts, 
		t.Posted,	
 		IFNULL(t.LastUserName,(SELECT `Name` from {databaseName}.{objectQualifier}User x WHERE x.UserID = t.LastUserID)) AS LastUserName,
 	    (case(?)
	          when 1 then  IFNULL(( SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=t.LastUserID AND char_length(f.Style) > 2 ORDER BY f.SortOrder LIMIT 1), ( SELECT r.Style FROM {databaseName}.{objectQualifier}User u 
		join {databaseName}.{objectQualifier}Rank r on r.RankID=u.RankID WHERE u.UserID=t.LastUserID AND char_length(r.Style) > 2))  
	        else ?	end) AS LastUserStyle,	
	    (case(?)
		     when 1 then
		       (SELECT  LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=f.ForumID AND x.UserID = ? LIMIT 1)
		     else null	end) AS LastForumAccess,
		(case(?)
		     when 1 then
		       (SELECT  LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=t.TopicID AND y.UserID = ? LIMIT 1)
		     else null	 end) AS  	LastTopicAccess    
 	FROM 
 		{databaseName}.{objectQualifier}Topic t
 	INNER JOIN
 		{databaseName}.{objectQualifier}Forum f ON t.ForumID = f.ForumID	
 	INNER JOIN
 		{databaseName}.{objectQualifier}Category c ON c.CategoryID = f.CategoryID
	JOIN
		{databaseName}.{objectQualifier}ActiveAccess v ON v.ForumID=f.ForumID	 	
 	WHERE
 		c.BoardID = ?
 		AND t.TopicMovedID is NULL
		AND v.UserID= ?
		AND v.ReadAccess <> 0
        AND SIGN(t.Flags & 8) != 1
        AND t.LastPosted IS NOT NULL
		AND
		f.Flags & 4 <> (CASE WHEN (?) > 0 THEN -1 ELSE 4 END)	       
    ORDER BY
    t.LastPosted DESC LIMIT ?';

	
    -- AND ({databaseName}.{objectQualifier}vaccess_s_readaccess(?,f.ForumID)<>0)
    
    
    SET @_uvp1_nicks = i_StyledNicks;
	SET @_uvp1_flr = i_FindLastRead;
    SET @_uvp1_nicksempty = '';
    SET @_uvp1_userID = i_PageUserID; 
    SET @_uvp1_boardID = i_BoardID;       
    SET @_uvp1_limit = i_NumPosts;
	SET @_uvp1_shownocount = i_ShowNoCountPosts;
    
    EXECUTE stmt_tl USING @_uvp1_nicks,
	                      @_uvp1_flr,
						  @_uvp1_userID,
						  @_uvp1_flr,
						  @_uvp1_userID,
	                      @_uvp1_nicksempty,
						  @_uvp1_boardID,						
						  @_uvp1_userID,
						  @_uvp1_shownocount,
						  @_uvp1_limit;
    DEALLOCATE PREPARE stmt_tl;    
    END;    
--GO

  /* STORED PROCEDURE CREATED BY VZ-TEAM topic_simplelist */
    CREATE PROCEDURE {databaseName}.{objectQualifier}topic_simplelist(
    i_StartID INT,
    i_Limit   INT)

    BEGIN
    SET @_uvp2_start = i_StartID, @_uvp2_limit = i_Limit;
    PREPARE stmt_tsl FROM 'SELECT   t.`TopicID`,
    t.`Topic`
    FROM     {databaseName}.{objectQualifier}Topic t
    WHERE    t.`TopicID` >= ?
    AND t.`TopicID` < (? + ?)
         ORDER BY t.`TopicID` LIMIT ?,?';
           EXECUTE stmt_tsl USING @_uvp2_start, @_uvp2_start,@_uvp2_limit,@_uvp2_start,@_uvp2_limit;
           DEALLOCATE PREPARE stmt_tsl;  
         
     END;
 --GO    

      /* STORED PROCEDURE CREATED BY VZ-TEAM user_activity_rank */
 CREATE PROCEDURE {databaseName}.{objectQualifier}user_activity_rank
 (
 	i_BoardID INT,
 	i_DisplayNumber INT,
 	i_StartDate  DATETIME
 ) 
 BEGIN
 	DECLARE ici_GuestUserID INT;
  
 
 	/*SET ROWCOUNT i_DisplayNumber*/

 	SET ici_GuestUserID =
 	(SELECT 
 		a.UserID
 	FROM
 		{databaseName}.{objectQualifier}User a
 		INNER JOIN {databaseName}.{objectQualifier}UserGroup b on b.UserID = a.UserID
 		INNER JOIN {databaseName}.{objectQualifier}Group c on b.GroupID = c.GroupID
 	WHERE
 		a.BoardID = i_BoardID and
 		(c.Flags & 2)<>0 ORDER BY a.UserID LIMIT 1
    );

    PREPARE stmt_uar FROM 'SELECT
    counter.`ID`,
    u.`Name`,
    counter.`NumOfPosts`
    FROM
    {databaseName}.{objectQualifier}User u inner join
    (
    SELECT m.UserID as ID, Count(m.UserID) as NumOfPosts FROM {databaseName}.{objectQualifier}Message m
    WHERE UNIX_TIMESTAMP(m.Posted) >= UNIX_TIMESTAMP(?)
    GROUP BY m.UserID
    ) AS counter ON u.UserID = counter.ID
    WHERE
    u.BoardID =? and u.UserID != ?
    ORDER BY
    NumOfPosts DESC LIMIT ?,?';
      SET @_uvp3_startdate =i_StartDate,@_uvp3_boardId = i_BoardID,@_uvp3_gestuserid=ici_GuestUserID,@_uvp3_start = 0, @_uvp3_limit = i_DisplayNumber;
    EXECUTE stmt_uar USING @_uvp3_startdate,@_uvp3_boardId, @_uvp3_gestuserid, @_uvp3_start, @_uvp3_limit;
    DEALLOCATE PREPARE stmt_uar;
   
    END;
--GO
    /* STORED PROCEDURE CREATED BY VZ-TEAM user_simplelist */   
    CREATE PROCEDURE {databaseName}.{objectQualifier}user_simplelist(
    i_StartID INT,
    i_Limit   INT)
    BEGIN
    DECLARE l_Limit INT DEFAULT 500;
    DECLARE l_StartID INT DEFAULT 0;
        IF i_StartID IS NOT NULL THEN SET l_StartID =i_StartID ;END IF;
        IF i_Limit IS NOT NULL THEN SET l_Limit=i_Limit;END IF;
    SET @_uvp4_start1 = l_StartID,
            @_uvp4_start2 = l_StartID,   
            @_uvp4_limit1 = l_Limit,
            @_uvp4_start3 = l_StartID,
            @_uvp4_limit2 = l_Limit;
    /*SET ROWCOUNT  i_Limit*/
    PREPARE stmt_usl FROM 'SELECT   a.`UserID`,
    a.`Name`
    FROM     {databaseName}.{objectQualifier}User a
    WHERE    a.`UserID` >= ?
    AND a.`UserID` < (? + ?)
         ORDER BY a.`UserID` LIMIT ?, ?';
           EXECUTE stmt_usl USING @_uvp4_start1, @_uvp4_start2, @_uvp4_limit1, @_uvp4_start3, @_uvp4_limit2;
           DEALLOCATE PREPARE stmt_usl;  
         /*SET ROWCOUNT  0*/
     END;
   --GO  
    /* STORED PROCEDURE CREATED BY VZ-TEAM topic_announcements */
 CREATE PROCEDURE {databaseName}.{objectQualifier}topic_announcements
 (
 	i_BoardID int,
 	i_NumPosts int,
 	i_PageUserID int
 )

 BEGIN
 
 	DECLARE ici_SQL VARCHAR(500);
        DECLARE ici_numPosts CHAR;
        

 
 	SET @ici_SQL = 'SELECT  '
                       + ' t.Topic, 
					       t.LastPosted, 
						   t.Posted,
						   t.TopicID,
						   t.LastMessageID, 
						   t.LastMessageFlags FROM';
 	SET @ici_SQL = @ici_SQL
                       + ' {databaseName}.{objectQualifier}Topic t 
                          INNER JOIN {databaseName}.{objectQualifier}Category c
						  ON c.CategoryID = f.CategoryID 
                          INNER JOIN {databaseName}.{objectQualifier}Forum f                          
                          ON t.ForumID = f.ForumID
						  join [{databaseName}].[{objectQualifier}ActiveAccess] v 
						  on v.ForumID=f.ForumID ';
 	SET @ici_SQL = @ici_SQL 
                       + ' WHERE c.BoardID = ' + '?'
                       + ' AND v.UserID='
                       + '?'
					   + ' (v.ReadAccess) <> 0                        
                       OR (f.Flags & 2) = 0) 
                       AND (t.Flags & 8) != 8 
					   AND t.TopicMovedID IS NULL
                       AND (t.Priority = 2) ORDER BY t.LastPosted DESC LIMIT ?';

        SET @_uvp5_userID = CONVERT(i_PageUserID, CHAR),
            @_uvp5_boardID = CONVERT(i_BoardID, CHAR),
            @_uvp5_numPosts = CONVERT (i_NumPosts, CHAR);
        PREPARE stmt_ta FROM @ici_SQL;
        EXECUTE stmt_ta USING @_uvp5_boardID, @_uvp5_userID, @_uvp5_numPosts ;
        DEALLOCATE PREPARE stmt_ta;	
 
 END;  
 --GO

 CREATE PROCEDURE {databaseName}.{objectQualifier}rss_topic_latest
(
	i_BoardID int,
	i_NumPosts int,
	i_PageUserID int,
	i_StyledNicks TINYINT(1),
	i_ShowNoCountPosts  TINYINT(1)
)
BEGIN	
DECLARE ici_SQL VARCHAR(1000); 
 	SET ici_SQL ='
	SELECT
	    m.Message AS LastMessage,
		t.LastPosted,
		t.ForumID,
		f.Name AS Forum,
		t.Topic,
		t.TopicID,
		t.TopicMovedID,
		t.UserID,
		t.UserName,		
		t.LastMessageID,
		t.LastMessageFlags,
		t.LastUserID,	
		t.Posted,		
		IFNULL(t.LastUserName,(select Name from {databaseName}.{objectQualifier}User x where x.UserID = t.LastUserID)) AS LastUserName		
	FROM
	    {databaseName}.{objectQualifier}Message m 
	INNER JOIN	
		{databaseName}.{objectQualifier}Topic t  ON t.LastMessageID = m.MessageID
	INNER JOIN
		{databaseName}.{objectQualifier}Forum f ON t.ForumID = f.ForumID	
	INNER JOIN
		{databaseName}.{objectQualifier}Category c ON c.CategoryID = f.CategoryID
	JOIN
		{databaseName}.{objectQualifier}ActiveAccess v ON v.ForumID=f.ForumID
	WHERE	
		c.BoardID = ?
		AND t.TopicMovedID IS NULL 
		AND (v.UserID = ?) 
		AND (CAST(v.ReadAccess AS UNSIGNED) <> 0) 
		AND t.IsDeleted != 1  
		AND t.LastPosted IS NOT NULL
		AND	f.Flags & 4 <> (CASE WHEN (?) > 0 THEN -1 ELSE 4 END)
	ORDER BY
		t.LastPosted DESC LIMIT ?';

		  SET @_uvp5_userID = CONVERT(i_PageUserID, CHAR),
              @_uvp5_boardID = CONVERT(i_BoardID, CHAR),
              @_uvp5_numPosts = CONVERT (i_NumPosts, CHAR),							
			  @_uvp5_shownocount = CONVERT (i_ShowNoCountPosts, CHAR);
        PREPARE stmt_ta FROM @ici_SQL;
        EXECUTE stmt_ta USING  @_uvp5_boardID, @_uvp5_userID, @_uvp5_shownocount, @_uvp5_numPosts ;
        DEALLOCATE PREPARE stmt_ta;	
END;
--GO

     
 /* STORED PROCEDURE CREATED BY VZ-TEAM */

 CREATE PROCEDURE {databaseName}.{objectQualifier}forum_simplelist(
                 i_StartID INT,
                 i_Limit   INT)
  BEGIN
    DECLARE l_Limit INT DEFAULT 500;
    DECLARE l_StartID INT DEFAULT 0;
        IF i_StartID IS NOT NULL THEN SET l_StartID =i_StartID ;END IF;
        IF i_Limit IS NOT NULL THEN SET l_Limit=i_Limit;END IF;
    
          SET @_uvp6_start1 := l_StartID,
            @_uvp6_start2 := l_StartID,   
            @_uvp6_limit1 := l_Limit,
            @_uvp6_start3 := l_StartID,
            @_uvp6_limit2 := l_Limit;
           
         PREPARE stmt_fsl FROM 'SELECT   f.`ForumID`,
                  f.`Name`
         FROM     {databaseName}.{objectQualifier}Forum f
         WHERE    f.ForumID >= ?
         AND f.ForumID < (? + ?)
         ORDER BY f.`ForumID` LIMIT ?, ?';
       
           EXECUTE stmt_fsl USING @_uvp6_start1, @_uvp6_start2, @_uvp6_limit1, @_uvp6_start3, @_uvp6_limit2;
           DEALLOCATE PREPARE stmt_fsl;          
     END;
 --GO


/* STORED PROCEDURE CREATED BY VZ-TEAM */
CREATE  PROCEDURE {databaseName}.{objectQualifier}category_simplelist(
i_StartID INT,
i_Limit   INT)
BEGIN
SET @start_csl = i_StartID, @limit_csl = i_Limit;
PREPARE stmt_csl FROM 'SELECT   c.CategoryID,
c.Name
FROM     {databaseName}.{objectQualifier}Category c
WHERE    c.CategoryID >= ?
AND c.CategoryID < (? + ?)
        ORDER BY c.CategoryID LIMIT ?';

    EXECUTE stmt_csl USING @start_csl, @start_csl, @limit_csl, @limit_csl;
    DEALLOCATE PREPARE stmt_csl;         
    END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_simplelist(
                i_StartID INT,
                i_Limit   INT)
BEGIN
        DECLARE ici_Limit INT DEFAULT 1000;
        DECLARE ici_StartID INT DEFAULT 0; 
           
        IF i_StartID IS NOT NULL THEN 
        SET ici_StartID =i_StartID ;
        END IF; 
        
        IF i_Limit IS NOT NULL THEN 
        SET ici_Limit=i_Limit;
        END IF;


        SET @_uvp7_start = ici_StartID, @_uvp7_limit = ici_Limit;

    PREPARE stmt_msl FROM 'SELECT  m.`MessageID`,
                 m.`TopicID`        
        FROM     {databaseName}.{objectQualifier}Message m
        WHERE    m.`MessageID` >= ?
        AND m.`MessageID` < (? + ?)
        AND m.`TopicID` IS NOT NULL ORDER BY m.`MessageID` LIMIT ?, ?';

    EXECUTE stmt_msl USING @_uvp7_start, @_uvp7_start,@_uvp7_limit,@_uvp7_start,@_uvp7_limit;
    DEALLOCATE PREPARE stmt_msl;       
        
    END;
--GO 


/* VZRUS ADDONS - STORED PROCEDURES CREATED BY VZ-TEAM */
        CREATE  PROCEDURE {databaseName}.{objectQualifier}db_size(
        i_TableSchema VARCHAR(128))
        BEGIN
        SELECT 
        IFNULL((ROUND(((SUM(t.data_length)+ SUM(t.index_length))/1048576),2)),0)
        FROM INFORMATION_SCHEMA.TABLES t 
        WHERE t.engine = 'InnoDB' AND t.TABLE_SCHEMA=i_TableSchema;
        END;
--GO


        CREATE  PROCEDURE {databaseName}.{objectQualifier}rsstopic_list(
        i_ForumID INT, i_StartID INT, i_Limit INT)
        BEGIN
                SET @_rsstl_forumid = i_ForumID, 
                    @_rsstl_start = i_StartID, 
                    @_rsstl_limit = i_Limit;
    -- check for IsDeleted flag a.Flags & 8



    PREPARE stmt_rsstl FROM 'SELECT a.Topic,
               a.TopicID, 
               b.Name, 
			   IFNULL(a.LastPosted,a.Posted) AS LastPosted,
               a.Posted,
               a.LastMessageID,
			   IFNULL(a.LastUserID, a.UserID) AS LastUserID,
	           IFNULL(a.LastMessageID,(select  m.MessageID 
               FROM {databaseName}.{objectQualifier}Message m where m.TopicID = a.TopicID order by m.Posted desc LIMIT 1)) AS LastMessageID, 
               IFNULL(a.LastMessageFlags,22) AS LastMessageFlags
               FROM {databaseName}.{objectQualifier}Topic a
               INNER JOIN {databaseName}.{objectQualifier}Forum b 
               ON b.ForumID = a.ForumID
               WHERE a.ForumID = ?  AND IFNULL(SIGN(a.Flags & 8),0) <> 8  
               AND a.TopicMovedID IS NULL
               ORDER BY a.Posted DESC
               LIMIT ?,?';
    
    EXECUTE stmt_rsstl USING @_rsstl_forumid,@_rsstl_start, @_rsstl_limit;
    DEALLOCATE PREPARE stmt_rsstl;    
    END;
--GO

/* *************************************************************************************************************************** */
/* **** BEGIN CREATE PROCEDURES ******/

/* Procedures for "Thanks" Mod  */
CREATE PROCEDURE {databaseName}.{objectQualifier}message_addthanks 
	(I_FromUserID INT,
	I_MessageID INT)
BEGIN
DECLARE ici_ToUserID INT;
IF not exists (SELECT ThanksID FROM {databaseName}.{objectQualifier}Thanks WHERE MessageID = I_MessageID AND ThanksFromUserID=I_FromUserID LIMIT 1) THEN
	SET ici_ToUserID = (SELECT UserID FROM {databaseName}.{objectQualifier}Message WHERE MessageID = I_MessageID);
	INSERT INTO {databaseName}.{objectQualifier}Thanks (ThanksFromUserID, ThanksToUserID, MessageID, ThanksDate) Values 
								(I_FromUserID,ici_ToUserID, I_MessageID, UTC_TIMESTAMP());
	SELECT Name FROM {databaseName}.{objectQualifier}User WHERE UserID=ici_ToUserID LIMIT 1;
ELSE
	SELECT '';
END IF;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_getthanks 
	(I_MessageID INT)
BEGIN
	SELECT a.ThanksFromUserID as UserID, a.ThanksDate, b.Name, b.DisplayName
	FROM {databaseName}.{objectQualifier}Thanks a 
	INNER JOIN {databaseName}.{objectQualifier}User b
	ON a.ThanksFromUserID = b.UserID WHERE MessageID = I_MessageID
	ORDER BY a.ThanksDate DESC;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_isthankedbyuser 
	(I_UserID INT,
	I_MessageID INT)

BEGIN
DECLARE ret TINYINT(1) DEFAULT 1;
	IF NOT EXISTS (SELECT ThanksID FROM {databaseName}.{objectQualifier}Thanks WHERE ThanksFromUserID=I_UserID AND MessageID=I_MessageID) THEN
		SET ret = 0;
		SELECT ret;
	ELSE
		SELECT ret;
	END IF;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_removethanks 
	(I_FromUserID int,
	I_MessageID int)
	BEGIN
	DELETE FROM {databaseName}.{objectQualifier}Thanks 
	WHERE ThanksFromUserID=I_FromUserID AND MessageID=I_MessageID;	
	SELECT `Name` FROM {databaseName}.{objectQualifier}User WHERE UserID IN (SELECT UserID FROM {databaseName}.{objectQualifier}Message WHERE MessageID = I_MessageID);
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_thanksnumber 
	(I_MessageID INT)
BEGIN
SELECT Count(1) from {databaseName}.{objectQualifier}Thanks WHERE MessageID=I_MessageID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_getthanks_from 
	(I_UserID INT, I_PageUserID INT)
BEGIN
SELECT Count(1) FROM {databaseName}.{objectQualifier}Thanks WHERE ThanksFromUserID=I_UserID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_getthanks_to 
	(I_UserID			   INT,
	 I_PageUserID          INT,
 OUT I_ThanksToNumber      INT,
 OUT I_ThanksToPostsNumber INT)
BEGIN
     SET I_ThanksToNumber =(SELECT Count(1) FROM {databaseName}.{objectQualifier}Thanks WHERE ThanksToUserID=I_UserID);	
     SET I_ThanksToPostsNumber =(SELECT Count(DISTINCT MessageID) FROM {databaseName}.{objectQualifier}Thanks WHERE ThanksToUserID=I_UserID);	
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}message_getallthanks 
	(i_MessageIDs longtext)
BEGIN
    DECLARE ici_MessageID varchar(11);
    DECLARE ici_MessageIDsChunk varchar(4000);
    DECLARE ici_Pos int;
    DECLARE ici_Itr int;
    DECLARE ici_trimindex int;
    
    DROP TEMPORARY TABLE  IF EXISTS {objectQualifier}tmp_ParsedMessageIDs;
    CREATE TEMPORARY TABLE IF NOT EXISTS {objectQualifier}tmp_ParsedMessageIDs 
	(
		MessageID INT NOT NULL
	);
	-- drop table is not required with it
	TRUNCATE TABLE {objectQualifier}tmp_ParsedMessageIDs;
        
	SET i_MessageIDs = (CONCAT(TRIM(i_MessageIDs), ','));
	SET ici_Pos = (LOCATE(',', i_MessageIDs, 1));
	IF REPLACE(i_MessageIDs, ',', '') <> '' THEN	
		WHILE ici_Pos > 0 DO		
			SET ici_MessageID = LTRIM(RTRIM(LEFT(i_MessageIDs, ici_Pos - 1)));
			IF ici_MessageID <> '' THEN			
				INSERT INTO {objectQualifier}tmp_ParsedMessageIDs(MessageID) VALUES (CAST(ici_MessageID AS SIGNED)) ;
				-- Use Appropriate conversion
			END IF;
			SET i_MessageIDs = RIGHT(i_MessageIDs, CHAR_LENGTH(i_MessageIDs) - ici_Pos);
			SET ici_Pos = LOCATE(',', i_MessageIDs, 1);
		END WHILE;
		  -- to be sure that last value is inserted
					IF (CHAR_LENGTH(ici_MessageID) > 0) THEN
					 INSERT INTO {objectQualifier}tmp_ParsedMessageIDs (MessageID) 
					 VALUES (CAST(ici_MessageID AS SIGNED));  
	                END IF;
	END	IF;

	SELECT b.ThanksFromUserID AS FromUserID, 
	       b.ThanksDate, 
	       a.MessageID, 
	       b.ThanksToUserID AS ToUserID,
	       (SELECT COUNT(b.ThanksID) FROM {databaseName}.{objectQualifier}Thanks b WHERE b.ThanksFromUserID=d.UserID) AS ThanksFromUserNumber,
	       (SELECT COUNT(b.ThanksID) FROM {databaseName}.{objectQualifier}Thanks b WHERE b.ThanksToUserID=d.UserID) AS ThanksToUserNumber,
	       (SELECT COUNT(DISTINCT(b.MessageID)) FROM {databaseName}.{objectQualifier}Thanks b WHERE b.ThanksToUserID=d.userID) AS ThanksToUserPostsNumber
	FROM  {databaseName}.{objectQualifier}tmp_ParsedMessageIDs a
	INNER JOIN {databaseName}.{objectQualifier}Message d 
	ON (d.MessageID=a.MessageID)
	LEFT JOIN {databaseName}.{objectQualifier}Thanks b 
	ON (b.MessageID = a.MessageID);
    
    DROP TEMPORARY TABLE  IF EXISTS {objectQualifier}tmp_ParsedMessageIDs;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_viewallthanks(I_UserID int, I_PageUserID int)
    READS SQL DATA
    BEGIN    
        select  t.ThanksFromUserID,
                t.ThanksToUserID,
                c.MessageID,
                a.ForumID,
                a.TopicID,
                a.Topic,
                b.UserID,
                c.MessageID,
                c.Posted,
                c.Message,
                c.Flags                
        from   {databaseName}.{objectQualifier}thanks t 
		        left join {databaseName}.{objectQualifier}message c on c.MessageID = t.MessageID
                left join {databaseName}.{objectQualifier}topic a on a.TopicID = c.TopicID
                join {databaseName}.{objectQualifier}user b on c.UserID = b.UserID    
				join {databaseName}.{objectQualifier}activeaccess x on x.ForumID = a.ForumID
        where   x.ReadAccess > 0
                AND x.UserID = I_PageUserID
				-- Message IsApproved
                AND (c.Flags & 16) = 16
                AND a.TopicMovedID IS NULL
				-- Topic IsDeleted
                AND (a.Flags & 8) <> 8
				-- Message IsDeleted
                AND (c.Flags & 8) <> 8
                AND
					( t.ThanksFromUserID = I_UserID 
					OR t.thankstouserID = I_UserID )
		ORDER BY c.Posted DESC;
    END;
--GO

/* End of procedures for "Thanks" Mod */



/* Stored procedures for Buddy feature */
CREATE PROCEDURE {databaseName}.{objectQualifier}buddy_addrequest
    ( i_FromUserID INT,
    i_ToUserID INT
    ) 
     MODIFIES SQL DATA
     BEGIN
     DECLARE i_approved TINYINT(1);
     DECLARE i_paramOutput VARCHAR(128);
        IF NOT EXISTS ( SELECT  ID
                        FROM    {databaseName}.{objectQualifier}Buddy
                        WHERE   ( FromUserID = i_FromUserID
                                  AND ToUserID = i_ToUserID
                                ) ) 
            THEN
                IF ( NOT EXISTS ( SELECT    ID
                                  FROM      {databaseName}.{objectQualifier}Buddy
                                  WHERE     ( FromUserID = i_ToUserID
                                              AND ToUserID = i_FromUserID
                                            ) )
                   ) 
                    THEN
                        INSERT  INTO {databaseName}.{objectQualifier}Buddy
                                (
                                  FromUserID,
                                 ToUserID,
                                  Approved,
                                  Requested
                                )
                        VALUES  (
                                  i_FromUserID,
                                  i_ToUserID,
                                  0,
                                  UTC_TIMESTAMP()
                                );
                        SET i_paramOutput = ( SELECT `Name`
                                             FROM   {databaseName}.{objectQualifier}User
                                             WHERE  ( UserID = i_ToUserID )
                                           );
                        SET i_approved = 0;
                    ELSE 
                    
                        INSERT  INTO {databaseName}.{objectQualifier}Buddy
                                (
                                  FromUserID,
                                  ToUserID,
                                  Approved,
                                  Requested
                                )
                        VALUES  (
                                  i_FromUserID,
                                  i_ToUserID,
                                  1,
                                  UTC_TIMESTAMP()
                                );
                        UPDATE  {databaseName}.{objectQualifier}Buddy
                        SET     Approved = 1
                        WHERE   ( FromUserID = i_ToUserID
                                  AND ToUserID = i_FromUserID
                                );
                        SET i_paramOutput = ( SELECT `Name`
                                             FROM   {databaseName}.{objectQualifier}User
                                             WHERE  ( UserID = i_ToUserID )
                                           );
                        SET i_approved = 1;
                    
            END	IF;
        ELSE            
                SET i_paramOutput = '';
                SET i_approved = 0;
        END IF;
        SELECT i_paramOutput,i_approved;
    END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}buddy_approverequest
    (i_FromUserID INT,
    i_ToUserID INT,
    i_Mutual TINYINT(1),
    OUT i_paramOutput VARCHAR(128))
    MODIFIES SQL DATA
    BEGIN
        IF EXISTS ( SELECT  ID
                    FROM    {databaseName}.{objectQualifier}Buddy
                    WHERE   ( FromUserID = i_FromUserID
                              AND ToUserID = i_ToUserID
                            ) ) 
            THEN
                UPDATE  {databaseName}.{objectQualifier}Buddy
                SET     Approved = 1
                WHERE   ( FromUserID = i_FromUserID
                          AND ToUserID = i_ToUserID
                        );
                SET i_paramOutput = ( SELECT `Name`
                                     FROM   {databaseName}.{objectQualifier}User
                                     WHERE  ( UserID = i_FromUserID )
                                   );                                   
                IF ( i_Mutual = 1 )
                    AND ( NOT EXISTS ( SELECT   ID
                                       FROM     {databaseName}.{objectQualifier}Buddy
                                       WHERE    FromUserID = i_ToUserID
                                                AND ToUserID = i_FromUserID )
                        ) THEN
                    INSERT  INTO {databaseName}.{objectQualifier}Buddy
                            (
                              FromUserID,
                              ToUserID,
                              Approved,
                              Requested
                            )
                    VALUES  (
                              i_ToUserID,
                              i_FromUserID,
                              1,
                              UTC_TIMESTAMP()
                            );
            END IF;
	END IF;
END;	
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}buddy_list ( i_FromUserID INT )
    READS SQL DATA
    BEGIN    
        SELECT  a.UserID,
                a.BoardID,
                a.`Name`,
                a.Joined,
                a.NumPosts,
                b.`Name` AS RankName,
                c.Approved,
                c.FromUserID,
                c.Requested
        FROM   {databaseName}.{objectQualifier}User a
                JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID = a.RankID
                JOIN {databaseName}.{objectQualifier}Buddy c ON ( c.ToUserID = a.UserID
                                              AND c.FromUserID = i_FromUserID
                                            )
        UNION
        SELECT  i_FromUserID AS UserID,
                a.BoardID,
                a.`Name`,
                a.Joined,
                a.NumPosts,
                b.`Name` AS RankName,
                c.Approved,
                c.FromUserID,
                c.Requested
        FROM    {databaseName}.{objectQualifier}User a
                JOIN {databaseName}.{objectQualifier}Rank b ON b.RankID = a.RankID
                JOIN {databaseName}.{objectQualifier}Buddy c ON ( ( c.Approved = 0 )
                                              AND ( c.ToUserID = i_FromUserID )
                                              AND ( a.UserID = c.FromUserID )
                                            )
        ORDER BY `Name`;
    END;
    --GO

CREATE PROCEDURE {databaseName}.{objectQualifier}buddy_remove
(    i_FromUserID INT,
    i_ToUserID INT,
    OUT i_paramOutput VARCHAR(128) )
    MODIFIES SQL DATA
    BEGIN
        DELETE  FROM {databaseName}.{objectQualifier}Buddy
        WHERE   ( FromUserID = i_FromUserID
                  AND ToUserID = i_ToUserID
                );
        SET i_paramOutput = ( SELECT `Name`
                             FROM   {databaseName}.{objectQualifier}User
                             WHERE  ( UserID = i_ToUserID )
                           );
    END;
    --GO    

CREATE PROCEDURE {databaseName}.{objectQualifier}buddy_denyrequest
    ( i_FromUserID INT,
    i_ToUserID INT,
    OUT i_paramOutput VARCHAR(128) )
    MODIFIES SQL DATA
    BEGIN
        DELETE  FROM {databaseName}.{objectQualifier}Buddy
        WHERE   FromUserID = i_FromUserID
                AND ToUserID = i_ToUserID;
        SET i_paramOutput = ( SELECT `Name`
                             FROM   {databaseName}.{objectQualifier}User
                             WHERE  ( UserID = i_FromUserID )
                           );
    END;
--GO   
/* End of stored procedures for Buddy feature */

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_favorite_add 
	( i_UserID int,
	i_TopicID int)
MODIFIES SQL DATA
BEGIN
	IF NOT EXISTS (SELECT ID FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE (UserID = i_UserID AND TopicID=i_TopicID))
    THEN  
		INSERT INTO {databaseName}.{objectQualifier}FavoriteTopic(UserID, TopicID) Values 
								(i_UserID, i_TopicID);
	END IF;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_favorite_remove 
(	i_UserID int,
	i_TopicID int)
MODIFIES SQL DATA
BEGIN
	DELETE FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE UserID=i_UserID AND TopicID=i_TopicID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_favorite_list(i_UserID int)
READS SQL DATA
BEGIN
SELECT TopicID FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE UserID=i_UserID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_favorite_count(i_TopicID int) 
READS SQL DATA
BEGIN
	SELECT COUNT(ID) as FavoriteCount FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE TopicId = i_TopicID;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}topic_favorite_details(i_BoardID int,i_PageUserID int,i_Since datetime,i_CategoryID int, i_StyledNicks TINYINT(1))
READS SQL DATA
begin
		select
		c.ForumID,
		c.TopicID,
		c.TopicMovedID,
		c.Posted,
		c.`Status`,
		IFNULL(c.TopicMovedID,c.TopicID) AS LinkTopicID,
		c.Topic AS Subject,
		c.Description,
		c.UserID,
		IFNULL(c.UserName,b.Name) AS Starter,
		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}Message mes WHERE mes.TopicID = c.TopicID AND SIGN(mes.Flags & 8) = 1 AND SIGN(mes.Flags & 16) = 1 AND ((i_PageUserID IS NOT NULL AND mes.UserID = i_PageUserID) OR (i_PageUserID IS NULL)) ) AS NumPostsDeleted,
		(select count(1)- 1  from {databaseName}.{objectQualifier}Message x where x.TopicID=c.TopicID and (x.Flags & 8)=0) AS Replies,
		c.Views,
		c.LastPosted,
		c.LastUserID,
		IFNULL(c.LastUserName,(select Name from {databaseName}.{objectQualifier}User x where x.UserID=c.LastUserID)) AS LastUserName,
		c.LastMessageID,
		c.LastMessageFlags AS LastMessageFlags,
		c.TopicID AS LastTopicID,
		c.Flags AS TopicFlags,
		(SELECT COUNT(ID) FROM {databaseName}.{objectQualifier}FavoriteTopic 
		WHERE TopicId = IfNull(c.TopicMovedID,c.TopicID)) as FavoriteCount ,
		c.Priority,
		c.PollID,
		d.Name AS ForumName,
		c.TopicMovedID,
		d.Flags AS ForumFlags,
		(SELECT `Message` FROM {databaseName}.{objectQualifier}Message mes2 where mes2.TopicID = IFNULL(c.TopicMovedID,c.TopicID) AND mes2.Position = 0) AS FirstMessage,
		(case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.UserID)  
	        else ''	 end) AS StarterStyle,
	    (case(i_StyledNicks)
	        when 1 then  {databaseName}.{objectQualifier}get_userstyle(c.LastUserID)  
	        else ''	 end) AS LastUserStyle,
	    {databaseName}.{objectQualifier}vaccess_s_readaccess_combo(c.UserID, c.ForumID) AS ReadAccess      
	from
		{databaseName}.{objectQualifier}Topic c
		join {databaseName}.{objectQualifier}User b on b.UserID=c.UserID
		join {databaseName}.{objectQualifier}Forum d on d.ForumID=c.ForumID
		join {databaseName}.{objectQualifier}ActiveAccess x on x.ForumID=d.ForumID 
		join {databaseName}.{objectQualifier}Category e on e.CategoryID=d.CategoryID
		JOIN {databaseName}.{objectQualifier}FavoriteTopic z ON (z.TopicID=c.TopicID AND z.UserID=i_PageUserID)
	where
		UNIX_TIMESTAMP(c.LastPosted) > UNIX_TIMESTAMP(i_Since) and
		b.UserID = i_PageUserID and
		x.ReadAccess <> 0 and 
		e.BoardID = i_BoardID and
		(i_CategoryID is null or e.CategoryID=i_CategoryID) and
		SIGN(c.Flags & 8) = 0
	order by
		d.Name asc,
		c.Priority desc,
		c.LastPosted desc;
end;
--GO

/* Albums */
CREATE procedure {databaseName}.{objectQualifier}album_save
    (
      i_AlbumID INT,
      i_UserID INT,
      i_Title VARCHAR(255),
      i_CoverImageID INT
    )
    MODIFIES SQL DATA
    BEGIN 
    DECLARE ici_AlbumInserted INT DEFAULT 0;   
        -- Update Cover?
        IF ( i_CoverImageID IS NOT NULL
             AND i_CoverImageID <> 0
           ) THEN
            UPDATE  {databaseName}.{objectQualifier}UserAlbum
            SET     CoverImageID = i_CoverImageID
            WHERE   AlbumID = i_AlbumID;
        ELSE 
            -- Remove Cover?
            IF ( i_CoverImageID = 0 )  THEN
                UPDATE  {databaseName}.{objectQualifier}UserAlbum
                SET     CoverImageID = NULL
                WHERE   AlbumID = i_AlbumID;            
            ELSE 
            -- Update Title?
                IF i_AlbumID is not null THEN
                    UPDATE  {databaseName}.{objectQualifier}UserAlbum
                    SET     Title = i_Title
                    WHERE   AlbumID = i_AlbumID;
                ELSE                    
                    -- New album. insert into table.
                        INSERT  INTO {databaseName}.{objectQualifier}UserAlbum
                                (
                                  UserID,
                                  Title,
                                  CoverImageID,
                                  Updated
                                )
                        VALUES  (
                                  i_UserID,
                                  i_Title,
                                  i_CoverImageID,
                                  UTC_TIMESTAMP()
                                );
                       SET ici_AlbumInserted = (SELECT LAST_INSERT_ID());       
                END IF;
                END IF;
                END IF;
                SELECT ici_AlbumInserted;       
end;
--GO
   
CREATE procedure {databaseName}.{objectQualifier}album_list
    (
      i_UserID INT,
      i_AlbumID INT
    )
    READS SQL DATA
    BEGIN
        IF i_UserID IS NOT NULL THEN
            select  *
            FROM    {databaseName}.{objectQualifier}UserAlbum
            WHERE   UserID = i_UserID
            ORDER BY Updated DESC;
        ELSE 
            SELECT  *
            FROM    {databaseName}.{objectQualifier}UserAlbum
            WHERE   AlbumID = i_AlbumID;
        END IF;
 end;
--GO
   
CREATE PROCEDURE {databaseName}.{objectQualifier}album_delete ( i_AlbumID int )
MODIFIES SQL DATA
BEGIN
        DELETE  FROM {databaseName}.{objectQualifier}UserAlbumImage
        WHERE   AlbumID = i_AlbumID;
        DELETE  FROM {databaseName}.{objectQualifier}UserAlbum
        WHERE   AlbumID = i_AlbumID;        
END;
--GO
   
CREATE PROCEDURE {databaseName}.{objectQualifier}album_gettitle
    (
      i_AlbumID INT 
    )
    READS SQL DATA
    BEGIN
         SELECT `Title`
          FROM   {databaseName}.{objectQualifier}UserAlbum
            WHERE  AlbumID = i_AlbumID ;
                           
    END;
--GO
   
CREATE PROCEDURE {databaseName}.{objectQualifier}album_getstats
    ( i_UserID INT,
    i_AlbumID INT )
    READS SQL DATA
    BEGIN
    DECLARE  i_AlbumNumber INT DEFAULT 0;
    DECLARE  i_ImageNumber INT DEFAULT 0; 
    
        IF i_AlbumID IS NOT NULL  THEN
            SET i_ImageNumber = ( SELECT COUNT(ImageID)
                                 FROM   {databaseName}.{objectQualifier}UserAlbumImage
                                 WHERE  AlbumID = i_AlbumID
                               );
        ELSE            
                SET i_AlbumNumber = ( SELECT COUNT(AlbumID)
                                     FROM   {databaseName}.{objectQualifier}UserAlbum
                                     WHERE  UserID = i_UserID
                                   );
                SET i_ImageNumber = ( SELECT COUNT(ImageID)
                                     FROM   {databaseName}.{objectQualifier}UserAlbumImage
                                     WHERE  AlbumID in (
                                            SELECT  AlbumID
                                            FROM    {databaseName}.{objectQualifier}UserAlbum
                                            WHERE   UserID = i_UserID )
                                   );
         END IF;
            SELECT i_AlbumNumber, i_ImageNumber;
 end;
--GO  
CREATE PROCEDURE {databaseName}.{objectQualifier}album_image_save
    (
      i_ImageID INT,
      i_AlbumID INT,
      i_Caption VARCHAR(255),
      i_FileName VARCHAR(255),
      i_Bytes INT,
      i_ContentType VARCHAR(50)
    )
    MODIFIES SQL DATA
    BEGIN
        IF i_ImageID is not null  THEN
            UPDATE  {databaseName}.{objectQualifier}UserAlbumImage
            SET     Caption = i_Caption
            WHERE   ImageID = i_ImageID;
        ELSE
            INSERT  INTO {databaseName}.{objectQualifier}UserAlbumImage
                    (
                      AlbumID,
                      Caption,
                      FileName,
                      Bytes,
                      ContentType,
                      Uploaded,
                      Downloads
                    )
            VALUES  (
                      i_AlbumID,
                      i_Caption,
                      i_FileName,
                      i_Bytes,
                      i_ContentType,
                      UTC_TIMESTAMP(),
                      0
                    );
        END IF;
end;
--GO
    
CREATE procedure {databaseName}.{objectQualifier}album_image_list
    (
      i_AlbumID INT,
      i_ImageID INT
    )
    READS SQL DATA
    BEGIN
        IF i_AlbumID IS NOT null THEN
            SELECT  *
            FROM    {databaseName}.{objectQualifier}UserAlbumImage
            WHERE   AlbumID = i_AlbumID
            ORDER BY Uploaded DESC;
        ELSE 
            SELECT  a.*,
                    b.UserID
            FROM    {databaseName}.{objectQualifier}UserAlbumImage a
                    INNER JOIN {databaseName}.{objectQualifier}UserAlbum b ON b.AlbumID = a.AlbumID
            WHERE   ImageID = i_ImageID;
        END IF;
end;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}album_image_delete ( i_ImageID INT )
    MODIFIES SQL DATA
    BEGIN
        DELETE  FROM {databaseName}.{objectQualifier}UserAlbumImage
        WHERE   ImageID = i_ImageID;
        UPDATE  {databaseName}.{objectQualifier}UserAlbum
        SET     CoverImageID = NULL
        WHERE   CoverImageID = i_ImageID;      
end;
--GO
  
CREATE PROCEDURE {databaseName}.{objectQualifier}album_image_download ( i_ImageID INT )
    MODIFIES SQL DATA
    BEGIN
        UPDATE  {databaseName}.{objectQualifier}UserAlbumImage
        SET     Downloads = Downloads + 1
        WHERE   ImageID = i_ImageID;
 end;
--GO
   

CREATE PROCEDURE {databaseName}.{objectQualifier}user_getsignaturedata(i_BoardID INT, i_UserID INT)
READS SQL DATA
BEGIN
    -- Ugly but bullet proof - it used very rarely

    DECLARE i_G_UsrSigChars int;
    DECLARE i_G_UsrSigBBCodes varchar(4000);
    DECLARE i_G_UsrSigHTMLTags varchar(4000);
	 
	DECLARE i_R_UsrSigChars int;
    DECLARE i_R_UsrSigBBCodes varchar(4000);
    DECLARE i_R_UsrSigHTMLTags varchar(4000); 

	DECLARE i_tmp_UsrSigChars int;
    DECLARE i_tmp_UsrSigBBCodes varchar(4000);
    DECLARE i_tmp_UsrSigHTMLTags varchar(4000);
	
	
  DECLARE sig_cursor CURSOR  FOR
  SELECT IFNULL(c.UsrSigChars,0), IFNULL(c.UsrSigBBCodes,''), IFNULL(c.UsrSigHTMLTags,'')
	  FROM {databaseName}.{objectQualifier}User a 
						JOIN {databaseName}.{objectQualifier}UserGroup b
						  ON a.UserID = b.UserID
							JOIN {databaseName}.{objectQualifier}Group c                         
							  ON b.GroupID = c.GroupID 
							   WHERE a.UserID = i_UserID AND c.BoardID = i_BoardID 
							    ORDER BY c.SortOrder ASC;


   OPEN sig_cursor;
   BEGIN
   DECLARE EXIT HANDLER FOR NOT FOUND BEGIN END;
   LOOP
    FETCH sig_cursor  INTO i_tmp_UsrSigChars, i_tmp_UsrSigBBCodes, i_tmp_UsrSigHTMLTags;
  
    if i_G_UsrSigChars IS NULL then		
		-- first check ranks		
		SELECT  IFNULL(c.UsrSigChars,0), c.UsrSigBBCodes, c.UsrSigHTMLTags
		INTO i_R_UsrSigChars, i_R_UsrSigBBCodes, i_R_UsrSigHTMLTags 
		FROM {databaseName}.{objectQualifier}Rank c 
								JOIN {databaseName}.{objectQualifier}User d
								  ON c.RankID = d.RankID
								   WHERE d.UserID = i_UserID AND c.BoardID = i_BoardID 
								   ORDER BY c.RankID DESC LIMIT 1;

        -- compare with rank data	   
		SELECT (CASE WHEN i_R_UsrSigChars > IFNULL(i_tmp_UsrSigChars,0) THEN i_R_UsrSigChars ELSE IFNULL(i_tmp_UsrSigChars,0) END) 
		INTO i_G_UsrSigChars;
		SELECT CONCAT(COALESCE(CONCAT(i_R_UsrSigBBCodes ,','),''), COALESCE(i_tmp_UsrSigBBCodes,'')) 
		INTO i_G_UsrSigBBCodes;
		SELECT CONCAT(COALESCE(CONCAT(i_R_UsrSigHTMLTags,','),''), COALESCE(i_tmp_UsrSigHTMLTags, '')) 
		INTO i_G_UsrSigHTMLTags;		
		else		
		SELECT  (CASE WHEN G_UsrSigChars > COALESCE(i_tmp_UsrSigChars, 0) THEN i_G_UsrSigChars ELSE COALESCE(i_tmp_UsrSigChars, 0) END) 
		INTO i_G_UsrSigChars;
		SELECT  CONCAT(COALESCE(CONCAT(i_tmp_UsrSigBBCodes, ','),'') + G_UsrSigBBCodes) 
		INTO i_G_UsrSigBBCodes; 
		SELECT CONCAT(COALESCE(CONCAT(i_tmp_UsrSigHTMLTags , ','), '') + G_UsrSigHTMLTags)
        INTO i_G_UsrSigHTMLTags;	
	    end if;
  END LOOP;  
  END;
  CLOSE sig_cursor;

    SELECT 
		i_G_UsrSigChars AS UsrSigChars, 
		i_G_UsrSigBBCodes AS UsrSigBBCodes, 
		i_G_UsrSigHTMLTags AS UsrSigHTMLTags;
    END;
    --GO 

 CREATE PROCEDURE {databaseName}.{objectQualifier}user_getalbumsdata(i_BoardID INT, i_UserID INT )
    READS SQL DATA
    BEGIN     
    DECLARE i_OR_UsrAlbums int;    
    DECLARE i_OG_UsrAlbums int;
    DECLARE i_OR_UsrAlbumImages int;     
    DECLARE i_OG_UsrAlbumImages int; 


    SELECT IFNULL(c.UsrAlbums,0), IFNULL(c.UsrAlbumImages,0) 
    INTO  i_OG_UsrAlbums, i_OG_UsrAlbumImages 
    FROM {databaseName}.{objectQualifier}User a 
                        JOIN {databaseName}.{objectQualifier}UserGroup b
                          ON a.UserID = b.UserID
                            JOIN {databaseName}.{objectQualifier}Group c                         
                              ON b.GroupID = c.GroupID 
                              WHERE a.UserID = i_UserID AND c.BoardID = i_BoardID 
                              ORDER BY c.SortOrder ASC LIMIT 1;
     
     SELECT  IFNULL(c.UsrAlbums,0), IFNULL(c.UsrAlbumImages,0) 
     INTO  i_OR_UsrAlbums, i_OR_UsrAlbumImages 
     FROM {databaseName}.{objectQualifier}Rank c 
                                JOIN {databaseName}.{objectQualifier}User d
                                  ON c.RankID = d.RankID WHERE d.UserID = i_UserID 
                                  AND c.BoardID = i_BoardID 
                                  ORDER BY c.RankID DESC LIMIT 1; 
       
       if (i_OG_UsrAlbums > i_OR_UsrAlbums)
       then
       SET i_OR_UsrAlbums = i_OG_UsrAlbums;
       end if;
       if (i_OG_UsrAlbumImages > i_OR_UsrAlbumImages)
       then
       SET i_OR_UsrAlbumImages = i_OG_UsrAlbumImages;
       end if;                 
      
      SELECT
       (SELECT COUNT(ua.AlbumID) FROM {databaseName}.{objectQualifier}UserAlbum ua
       WHERE ua.UserID = i_UserID) AS NumAlbums,
       (SELECT COUNT(uai.ImageID) FROM  {databaseName}.{objectQualifier}UserAlbumImage uai
       INNER JOIN {databaseName}.{objectQualifier}UserAlbum ua
       ON ua.AlbumID = uai.AlbumID
       WHERE ua.UserID = i_UserID) AS NumImages, 
       i_OR_UsrAlbums AS UsrAlbums, 
       i_OR_UsrAlbumImages AS UsrAlbumImages ;            
    
    END;
    --GO  
 
   CREATE PROCEDURE {databaseName}.{objectQualifier}message_secdata(i_MessageID int, i_PageUserID int)
    BEGIN
    -- BoardID=@BoardID and
if (i_PageUserID is null) THEN
select UserID INTO i_PageUserID from {databaseName}.{objectQualifier}User where  (Flags & 4)<>0 ORDER BY Joined DESC LIMIT 1;
END IF;
        SELECT
		m.MessageID,
		m.UserID,
		IFNULL(t.UserName, u.Name) as `Name`,
		m.Message,
		m.Posted,
		t.TopicID,
		t.ForumID,
		t.Topic,
		t.Priority,
		m.Flags,		
		IFNULL(m.Edited,m.Posted) AS Edited,
		IFNULL(m.EditedBy,m.UserID) AS EditedBy, 		
		t.Flags AS TopicFlags,		
		m.EditReason,
		m.Position,
		m.IsModeratorChanged,
		m.DeleteReason,
		m.BlogPostID,
		t.PollID,
        m.IP
	FROM		
		{databaseName}.{objectQualifier}Topic t 
        join  {databaseName}.{objectQualifier}Message m ON m.TopicID = t.TopicID
        join  {databaseName}.{objectQualifier}User u ON u.UserID = t.UserID
		left join {databaseName}.{objectQualifier}ActiveAccess x on x.ForumID=IFNULL(t.ForumID,0)
	WHERE
	m.MessageID = i_MessageID AND x.UserID=i_PageUserID  AND  CAST(x.ReadAccess AS SIGNED) > 0;
END;
--GO 

CREATE PROCEDURE {databaseName}.{objectQualifier}messagehistory_list (i_MessageID INT, i_DaysToClean INT )
    MODIFIES SQL DATA
    BEGIN    
    -- delete all message variants older then DaysToClean days Flags reserved for possible pms
   
    delete from {databaseName}.{objectQualifier}MessageHistory
     where DATEDIFF(UTC_DATE(),Edited) > i_DaysToClean;
    
    -- we don't return Message text and ip if it's simply a user       
          
     SELECT mh.*, m.UserID, m.UserName, t.ForumID, t.TopicID, t.Topic, IFNULL(t.UserName, u.Name) as Name, m.Posted
     FROM {databaseName}.{objectQualifier}MessageHistory mh
     LEFT JOIN {databaseName}.{objectQualifier}Message m ON m.MessageID = mh.MessageID
     LEFT JOIN {databaseName}.{objectQualifier}Topic t ON t.TopicID = m.TopicID
     LEFT JOIN {databaseName}.{objectQualifier}User u ON u.UserID = t.UserID
     WHERE mh.MessageID = i_MessageID ;      
END;
--GO 

CREATE procedure {databaseName}.{objectQualifier}user_lazydata(
	I_UserID int,
	I_BoardID int,
	I_ShowPendingMails tinyint(1),
	I_ShowPendingBuddies tinyint(1),
	I_ShowUnreadPMs tinyint(1),
	I_ShowUserAlbums tinyint(1),
	I_ShowUserStyle tinyint(1)
	
)
READS SQL DATA
begin 
	declare G_UsrAlbums int default 0;
	declare R_UsrAlbums int default 0;
	declare R_Style varchar(255);
	declare G_Style varchar(255);	
	IF (I_ShowUserStyle > 0) THEN	
	SELECT r.Style INTO R_Style
	FROM {databaseName}.{objectQualifier}User u 
		INNER JOIN  {databaseName}.{objectQualifier}Rank r 
		ON  r.RankID = u.RankID
		WHERE u.UserID = I_UserID AND u.BoardID = I_BoardID LIMIT 1;
		
	SELECT c.Style INTO  G_Style
    FROM {databaseName}.{objectQualifier}User a 
                        JOIN {databaseName}.{objectQualifier}UserGroup b
                          ON a.UserID = b.UserID
                            JOIN {databaseName}.{objectQualifier}Group c                         
                              ON b.GroupID = c.GroupID 
                              WHERE a.UserID = I_UserID AND a.BoardID = I_BoardID 
                              ORDER BY c.SortOrder ASC LIMIT 1 ;  
	END IF; 

	IF (I_ShowUserAlbums > 0) THEN	
	SELECT IFNULL(MAX(r.UsrAlbums),0) INTO R_UsrAlbums
	FROM {databaseName}.{objectQualifier}User u 
		INNER JOIN  {databaseName}.{objectQualifier}Rank r 
		ON  r.RankID = u.RankID
		WHERE u.UserID = I_UserID AND u.BoardID = I_BoardID LIMIT 1;
		
	SELECT IFNULL(MAX(c.UsrAlbums),0) INTO  G_UsrAlbums 
    FROM {databaseName}.{objectQualifier}User a 
                        JOIN {databaseName}.{objectQualifier}UserGroup b
                          ON a.UserID = b.UserID
                            JOIN {databaseName}.{objectQualifier}Group c                         
                              ON b.GroupID = c.GroupID 
                              WHERE a.UserID = I_UserID AND a.BoardID = I_BoardID 
                              ORDER BY c.SortOrder ASC LIMIT 1 ;
	ELSE
	SET G_UsrAlbums = 0;
	SET R_UsrAlbums = 0;				    
	END IF; 					
							                        

	-- return information
	select 		
	    a.ProviderUserKey,
		a.Flags AS UserFlags,
		a.Name AS UserName,
		a.DisplayName AS DisplayName,
		a.Suspended,
		a.UseSingleSignOn,
		a.ThemeFile,
		a.LanguageFile,
		a.TextEditor,
		a.TimeZone AS TimeZoneUser,
		a.Culture AS CultureUser,
		SIGN(a.Flags & 64) AS IsDirty,		
		-- a.Flags & 4 AS IsGuest, 
		(select count(1) from {databaseName}.{objectQualifier}Mail) AS MailsPending,
		/* IsRead and IsDeleted bits */
		(CASE WHEN i_ShowUnreadPMs > 0 THEN (SELECT count(1) FROM {databaseName}.{objectQualifier}UserPMessage b  where
		 b.UserID=I_UserID AND SIGN(b.Flags & 1)=0  AND SIGN(b.Flags & 8)=0 AND SIGN(b.Flags & 4)=0
		 ) ELSE 0 END) AS UnreadPrivate,
		(CASE WHEN i_ShowUnreadPMs > 0 THEN (SELECT Created FROM {databaseName}.{objectQualifier}PMessage pm 
		INNER JOIN {databaseName}.{objectQualifier}UserPMessage upm 
		ON pm.PMessageID = upm.PMessageID 
		WHERE upm.UserID=a.UserID and SIGN(upm.Flags & 1)=0   AND SIGN(upm.Flags & 8)=0 AND SIGN(upm.Flags & 4)=0 
		ORDER BY pm.Created DESC LIMIT 1) ELSE NULL END) AS LastUnreadPm,
		CASE WHEN i_ShowPendingBuddies > 0 THEN (SELECT COUNT(ID) FROM {databaseName}.{objectQualifier}Buddy WHERE ToUserID = I_UserID AND Approved = 0) ELSE 0 END AS PendingBuddies,
		CASE WHEN i_ShowPendingBuddies > 0 THEN (SELECT Requested FROM {databaseName}.{objectQualifier}Buddy WHERE ToUserID=a.UserID and Approved = 0 ORDER BY Requested DESC  LIMIT 1) ELSE NULL END AS LastPendingBuddies, 			
	 	CASE WHEN i_ShowUserStyle > 0 THEN (IFNULL(G_Style, R_Style)) ELSE NULL END AS  UserStyle,		
	    (SELECT COUNT(ua.AlbumID) FROM {databaseName}.{objectQualifier}UserAlbum ua
        WHERE ua.UserID = I_UserID) AS NumAlbums,
	    (CASE WHEN G_UsrAlbums > R_UsrAlbums THEN G_UsrAlbums ELSE R_UsrAlbums END) AS UsrAlbums,
	    SIGN(IFNULL((SELECT 1 FROM {databaseName}.{objectQualifier}Buddy WHERE FromUserID = I_UserID OR ToUserID = I_UserID LIMIT 1),0)) AS UserHasBuddies,	    
	    -- Guest can't vote in polls attached to boards, we need some temporary access check by a criteria 
		(CASE WHEN a.Flags & 4 > 0 THEN 0 ELSE 1 END) AS BoardVoteAccess
	
		from
		   {databaseName}.{objectQualifier}User a		
	    where
		a.UserID = I_UserID AND a.BoardID = I_BoardID LIMIT 1;
	 end;
--GO


CREATE PROCEDURE {databaseName}.{objectQualifier}message_gettextbyids 
	(i_MessageIDs longtext)
BEGIN
    DECLARE ici_MessageID varchar(11);
    DECLARE ici_MessageIDsChunk varchar(4000);
    DECLARE ici_Pos int;
    DECLARE ici_Itr int;
    DECLARE ici_trimindex int;
    
   -- DROP TEMPORARY TABLE  IF EXISTS {objectQualifier}tmp_ParsedMessageIDs;
    CREATE TEMPORARY TABLE IF NOT EXISTS {objectQualifier}tmp_ParsedMessageIDs 
	(
		MessageID INT NOT NULL
	);

        
	SET i_MessageIDs = (CONCAT(TRIM(i_MessageIDs), ','));
	SET ici_Pos = (LOCATE(',', i_MessageIDs, 1));
	IF REPLACE(i_MessageIDs, ',', '') <> '' THEN	
		WHILE ici_Pos > 0 DO		
			SET ici_MessageID = LTRIM(RTRIM(LEFT(i_MessageIDs, ici_Pos - 1)));
			IF ici_MessageID <> '' THEN			
				INSERT INTO {objectQualifier}tmp_ParsedMessageIDs(MessageID) VALUES (CAST(ici_MessageID AS SIGNED)) ;
				-- Use Appropriate conversion
			END IF;
			SET i_MessageIDs = RIGHT(i_MessageIDs, CHAR_LENGTH(i_MessageIDs) - ici_Pos);
			SET ici_Pos = LOCATE(',', i_MessageIDs, 1);
		END WHILE;
	END	IF;

	SELECT a.MessageID, d.Message
			FROM {objectQualifier}tmp_ParsedMessageIDs a
			INNER JOIN {databaseName}.{objectQualifier}Message d ON d.MessageID = a.MessageID;
    
    DROP TEMPORARY TABLE IF EXISTS {objectQualifier}tmp_ParsedMessageIDs;
END;
--GO

CREATE PROCEDURE {databaseName}.{objectQualifier}user_thankedmessage
(i_MessageID int, i_UserID int) 
begin
		SELECT COUNT(TH.ThanksID)
        FROM {databaseName}.{objectQualifier}Thanks AS TH WHERE (TH.MessageID=i_MessageID) AND (TH.ThanksFromUserID = i_UserID);
end;
--GO
CREATE PROCEDURE {databaseName}.{objectQualifier}user_thankfromcount
(i_UserID int) 
begin
        SELECT COUNT(TH.ThanksID) 
		FROM {databaseName}.{objectQualifier}Thanks AS TH WHERE (TH.ThanksToUserID=i_UserID);
end;
--GO

CREATE procedure {databaseName}.{objectQualifier}user_repliedtopic
(i_MessageID int, i_UserID int) 
begin
        DECLARE ici_TopicID int;
		SET ici_TopicID = (SELECT TopicID FROM {databaseName}.{objectQualifier}Message WHERE (MessageID = i_MessageID));

		SELECT COUNT(1)
        FROM {databaseName}.{objectQualifier}Message AS t WHERE (t.TopicID=ici_TopicID) AND (t.UserID = i_UserID);		
end;
--GO


CREATE PROCEDURE {databaseName}.{objectQualifier}recent_users(i_BoardID int,i_TimeSinceLastLogin int,i_StyledNicks TINYINT(1)) 
begin  
    SELECT 
	U.UserId,
    0 as IsCrawler,
    1 as UserCount,
    U.IsActiveExcluded AS IsHidden,
    (CASE(i_StyledNicks)
                WHEN 1 THEN
                        IFNULL((SELECT G.Style
                         FROM {databaseName}.{objectQualifier}UserGroup AS UG
                              JOIN {databaseName}.{objectQualifier}Group G on G.GroupID=UG.GroupID
                              WHERE UG.UserID=U.UserID AND CHAR_LENGTH(G.Style) > 2 
                              ORDER BY G.SortOrder LIMIT 1), '')
                ELSE ''
            END) AS Style
    FROM {databaseName}.{objectQualifier}User AS U
                JOIN {databaseName}.{objectQualifier}Rank R on R.RankID=U.RankID
				-- APPROVED
    WHERE ((U.Flags & 2) = 2) AND
     U.BoardID = i_BoardID AND U.LastVisit > ADDDATE(UTC_DATE(), INTERVAL -i_TimeSinceLastLogin MINUTE)
     -- Excluding guests
           AND  NOT EXISTS(             
                    SELECT 1 
                        FROM {databaseName}.{objectQualifier}UserGroup x
                            inner join {databaseName}.{objectQualifier}Group y ON y.GroupID=x.GroupID 
                        WHERE x.UserID=U.UserID and (y.Flags & 2)<>0 LIMIT 1
                    )
    ORDER BY U.LastVisit;
end;
--GO

create procedure {databaseName}.{objectQualifier}readtopic_addorupdate(i_UserID int,i_TopicID int) 
begin

    declare	ici_LastAccessDate	DATETIME;
	select LastAccessDate INTO ici_LastAccessDate from {databaseName}.{objectQualifier}TopicReadTracking where UserID=i_UserID AND TopicID=i_TopicID LIMIT 1;
	IF ici_LastAccessDate IS NOT NULL then	     
		  update {databaseName}.{objectQualifier}TopicReadTracking set LastAccessDate=UTC_TIMESTAMP() where LastAccessDate = ici_LastAccessDate;
  	ELSE	  
		  insert into {databaseName}.{objectQualifier}TopicReadTracking(UserID,TopicID,LastAccessDate)
	      values (i_UserID, i_TopicID, UTC_TIMESTAMP());
	end if;
end;
--GO

create procedure {databaseName}.{objectQualifier}readtopic_delete(i_userid int) 
begin
		delete from {databaseName}.{objectQualifier}TopicReadTracking where UseridID = i_UserID;
end;
--GO

create procedure {databaseName}.{objectQualifier}readtopic_lastread(i_UserID int, i_TopicID int) 
begin
		SELECT LastAccessDate FROM  {databaseName}.{objectQualifier}TopicReadTracking WHERE UserID = i_UserID AND TopicID = i_TopicID;
end;
--GO

create procedure {databaseName}.{objectQualifier}readforum_addorupdate(i_UserID int,i_ForumID int) 
begin
     declare ici_LastAccessDate	DATETIME;
	 SELECT LastAccessDate INTO ici_LastAccessDate from {databaseName}.{objectQualifier}ForumReadTracking where UserID=i_UserID AND ForumID=i_ForumID limit 1;
	IF ici_LastAccessDate IS NULL then
	      SELECT LastAccessDate INTO ici_LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking WHERE (UserID=i_UserID AND ForumID=i_ForumID);
		  update {databaseName}.{objectQualifier}ForumReadTracking set LastAccessDate=UTC_TIMESTAMP() where LastAccessDate = ici_LastAccessDate;
  	ELSE	  
		  insert into {databaseName}.{objectQualifier}ForumReadTracking(UserID,ForumID,LastAccessDate)
	      values (i_UserID, i_ForumID, UTC_TIMESTAMP());
	end if;
end;
--GO


create procedure {databaseName}.{objectQualifier}readforum_delete(i_userid int) 
begin
		delete from {databaseName}.{objectQualifier}ForumReadTracking where UserID = i_userid;
end;
--GO

create procedure {databaseName}.{objectQualifier}readforum_lastread(i_UserID int,i_ForumID int) 
begin
		SELECT LastAccessDate FROM  {databaseName}.{objectQualifier}ForumReadTracking WHERE UserID = i_UserID AND ForumID = i_ForumID;
end;
--GO

create procedure {databaseName}.{objectQualifier}user_lastread(i_UserID int) 
begin
		DECLARE i_LastForumRead DATETIME;
		DECLARE i_LastTopicRead DATETIME;
		
		SET i_LastForumRead = (SELECT MAX(LastAccessDate) FROM  {databaseName}.{objectQualifier}ForumReadTracking WHERE UserID = i_UserID);
		SET i_LastTopicRead = (SELECT MAX(LastAccessDate) FROM  {databaseName}.{objectQualifier}TopicReadTracking WHERE UserID = i_UserID);

		IF i_LastForumRead is not null AND i_LastTopicRead is not null then
		
		IF i_LastForumRead > i_LastTopicRead then
		   SELECT LastAccessDate = i_LastForumRead;
		ELSE
		   SELECT LastAccessDate = i_LastTopicRead;
		   end if;
		   
	    ELSEIF i_LastForumRead is not null then
	       SELECT i_LastForumRead as LastAccessDate;
	        
	    ELSEIF i_LastTopicRead is not null then
	        SELECT i_LastTopicRead as LastAccessDate;
			end if;
end;
--GO

create procedure {databaseName}.{objectQualifier}topics_byuser(
                 i_BoardID int,
				 i_PageUserID int,
				 i_Since DATETIME,
				 i_CategoryID int, 
				 i_StyledNicks tinyint(1), 
				 i_FindLastRead tinyint(1)) 
begin
		select
		c.ForumID,
		c.TopicID,
		c.TopicMovedID,
		c.Posted,
		c.`Status`,
		IFNULL(c.TopicMovedID,c.TopicID) as LinkTopicID,
		c.Topic as Subject,
		c.Description,
		c.UserID,
		IFNULL(c.UserName,b.Name) as Starter,
		(SELECT COUNT(1) FROM {databaseName}.{objectQualifier}Message mes WHERE mes.TopicID = c.TopicID AND (mes.Flags & 8) = 8 AND (mes.Flags & 16) = 16 AND ((i_PageUserID IS NOT NULL AND mes.UserID = i_PageUserID) OR (i_PageUserID IS NULL)) ) as NumPostsDeleted,
		(select count(1) from {databaseName}.{objectQualifier}Message x where x.TopicID=c.TopicID and (x.Flags & 8)<> 8) - 1 as Replies,
		c.Views,
		c.LastPosted,
		c.LastUserID,
		IFNULL(c.LastUserName,(select Name from {databaseName}.{objectQualifier}User x where x.UserID=c.LastUserID)) as LastUserName,
		c.LastMessageID as LastMessageID,
		c.LastMessageFlags as LastMessageFlags,
		c.TopicID as LastTopicID,
		c.Flags as TopicFlags,
		(SELECT COUNT(ID) as FavoriteCount FROM {databaseName}.{objectQualifier}FavoriteTopic WHERE TopicId = IFNULL(c.TopicMovedID,c.TopicID)) as FavoriteCount,
		c.Priority,
		c.PollID,
		d.Name as ForumName,		
		d.Flags as ForumFlags,
		(SELECT CAST(Message as char(1000)) FROM {databaseName}.{objectQualifier}Message mes2 where mes2.TopicID = IFNULL(c.TopicMovedID,c.TopicID) AND mes2.Position = 0 limit 1) as FirstMessage,
	    (case(i_StyledNicks)
			when 1 then  IFNULL((SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		    join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=c.UserID AND CHAR_LENGTH(f.Style) > 2 ORDER BY f.SortOrder limit 1), 
			(select r.Style from {databaseName}.{objectQualifier}User usr 
			join {databaseName}.{objectQualifier}Rank r ON r.RankID = usr.RankID  where usr.UserID=c.UserID))  
			else ''	 end) as  StarterStyle,
		(case(i_StyledNicks)
			when 1 then  IFNULL((SELECT f.Style FROM {databaseName}.{objectQualifier}UserGroup e 
		    join {databaseName}.{objectQualifier}Group f on f.GroupID=e.GroupID WHERE e.UserID=c.LastUserID AND CHAR_LENGTH(f.Style) > 2 ORDER BY f.SortOrder limit 1), 
			(select r.Style from {databaseName}.{objectQualifier}User usr 
			join {databaseName}.{objectQualifier}Rank r ON r.RankID = usr.RankID  where usr.UserID=c.LastUserID))  
			else ''	 end) as LastUserStyle,
	    (case(i_FindLastRead)
		     when 1 then
		       (SELECT  LastAccessDate FROM {databaseName}.{objectQualifier}ForumReadTracking x WHERE x.ForumID=d.ForumID AND x.UserID = i_PageUserID limit 1)
		     else null	 end) as LastForumAccess,
		(case(i_FindLastRead)
		     when 1 then
		       (SELECT  LastAccessDate FROM {databaseName}.{objectQualifier}TopicReadTracking y WHERE y.TopicID=c.TopicID AND y.UserID = i_PageUserID limit 1)
		     else null	 end) as LastTopicAccess
	from
		{databaseName}.{objectQualifier}Topic c
		join {databaseName}.{objectQualifier}User b on b.UserID=c.UserID
		join {databaseName}.{objectQualifier}Forum d on d.ForumID=c.ForumID
		join {databaseName}.{objectQualifier}ActiveAccess x on x.ForumID=d.ForumID
		join {databaseName}.{objectQualifier}Category cat on cat.CategoryID=d.CategoryID
	where
		i_Since < c.LastPosted and
		x.UserID = i_PageUserID and
		CAST(x.ReadAccess AS SIGNED) <> 0 and
		cat.BoardID = i_BoardID and
		(i_CategoryID is null or cat.CategoryID=i_CategoryID) and
		IFNULL((c.Flags & 8)<>8,false)
		and	c.TopicMovedID is null
		and c.TopicID = (SELECT mess.TopicID FROM {databaseName}.{objectQualifier}Message mess WHERE mess.UserID=i_PageUserID AND mess.TopicID=c.TopicID limit 1)
	order by
		cat.SortOrder asc,
		d.SortOrder asc,
		d.Name asc,
		Priority desc,
		LastPosted desc;
end;
--GO



--	1048576 max packet text length


