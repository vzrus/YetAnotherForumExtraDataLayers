-- This scripts for PostgreSQL Yet Another Forum https://github.com/vzrus/YetAnotherForumExtraDataLayers http://sourceforge.net/projects/yafdotnet/
-- were created by vzrus from vz-team  https://github.com/vzrus
-- They are distributed under terms of GPLv2 licence only as in http://www.fsf.org/licensing/licenses/gpl.html
-- Copyright vzrus(c) 2009-2012

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_forum_posts(
                           i_forumID integer)
                  RETURNS integer AS
$BODY$DECLARE
             ici_NumPosts integer:=0;
             ici_tmp integer;
             cntrfp integer:=0;
             cur_forposts refcursor;
BEGIN	

	select numposts INTO ici_NumPosts 
	from databaseSchema.objectQualifier_forum 
	where forumid=i_forumID;


	if exists(select 1 from databaseSchema.objectQualifier_forum where parentid=i_forumID) THEN

		OPEN cur_forposts FOR
		select forumid FROM databaseSchema.objectQualifier_forum
		where parentid = i_forumID;
		LOOP
  FETCH cur_forposts INTO ici_tmp;
  EXIT WHEN NOT FOUND;
  ici_NumPosts=ici_NumPosts+ COALESCE((SELECT databaseSchema.objectQualifier_forum_posts(ici_tmp)),0);
  cntrfp:=cntrfp+1;  
  EXIT WHEN NOT FOUND;
   
END LOOP;  
		
		CLOSE cur_forposts;		
	END IF;

	RETURN ici_NumPosts;
END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_forum_lasttopic(
                           i_forumid integer, 
						   i_userid integer, 
						   i_lasttopicid integer, 
						   i_lastposted timestamp with time zone)
                  RETURNS integer AS
$BODY$DECLARE
             ici_LastTopicID integer :=i_lasttopicid;
			 ici_LastPosted  timestamp with time zone :=i_lastposted;
			 ici_LastTopicIDTemp integer;
			 ici_LastPostedTemp timestamp with time zone;
			 ici_ParentID integer;
			 ici_SubforumID integer;
			 ici_doneflt integer:=1;
			 ici_TopicID integer;
			 ici_Posted timestamp with time zone;
 BEGIN
 
 	/*try to retrieve last direct topic posed in forums if not supplied as argument*/ 
 	IF (ici_LastTopicID is null or ici_LastPosted is null) THEN
 		SELECT 
 			a.lasttopicid,
 			a.lastposted,
 			a.parentid
                INTO  ici_LastTopicID,ici_LastPosted,ici_ParentID
 		FROM
 			databaseSchema.objectQualifier_forum a
 			JOIN databaseSchema.objectQualifier_activeaccess x ON a.forumid=x.forumid
 		WHERE
 			a.forumid = i_forumid AND
 			(
 				(i_userid is null and (a.flags & 2)=0) or 
 				(x.userid=i_userid and ((a.flags & 2)=0 or x.readaccess IS TRUE))
 			);
 	END IF;
 	
 IF EXISTS(select 1 from databaseSchema.objectQualifier_forum where parentid=i_forumid) THEN 
 	SELECT  			
 			MAX(a.lastposted)
                INTO  ici_LastPostedTemp
 		FROM
 			databaseSchema.objectQualifier_forum a
 			JOIN databaseSchema.objectQualifier_activeaccess x ON a.forumid=x.forumid
 		WHERE
 			a.parentid=i_forumid and a.forumid <> i_forumid and
 			(
 				(i_userid is null and (a.flags & 2)=0) or 
 				(x.userid=i_userid and ((a.flags & 2)=0 or x.readaccess IS TRUE))
 			);
 	SELECT 
 			a.lasttopicid 			
                INTO  ici_LastTopicIDTemp
 		FROM
 			databaseSchema.objectQualifier_forum a
 			JOIN databaseSchema.objectQualifier_activeaccess x ON a.forumid=x.forumid
 		WHERE
 			a.parentid=i_forumid and a.lastposted = ici_LastPostedTemp and
 			(
 				(i_userid is null and (a.flags & 2)=0) or 
 				(x.userid=i_UserID and ((a.flags & 2)=0 or x.readaccess IS TRUE))
 			);		
 	END IF;
 IF ici_LastPostedTemp > ici_LastPosted THEN
 ici_LastPosted:=ici_LastPostedTemp;
 ici_LastTopicID:=ici_LastTopicIDTemp;
 END IF;
 	
 
 	/*return id of topic with last message in this forum or its subforums*/
 	RETURN   ici_LastTopicID;
 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO









-- Function: databaseSchema.objectQualifier_forum_lastposted(integer, integer, integer, time with time zone)

-- DROP FUNCTION databaseSchema.objectQualifier_forum_lastposted(integer, integer, integer, timestamp with time zone);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_forum_lastposted(i_forumid integer, i_userid integer, i_lasttopicid integer, i_lastposted timestamp with time zone)
  RETURNS databaseSchema.objectQualifier_last_posted_return_type AS
$BODY$DECLARE
ici_LastTopicID int :=i_lasttopicid;
ici_LastPosted  timestamp with time zone :=i_lastposted;
ici_SubforumID integer;
ici_doneflt integer:=1;
ici_TopicID integer;
ici_Posted timestamp with time zone;
_rec databaseSchema.objectQualifier_last_posted_return_type;
cltt CURSOR FOR
 			SELECT 
 				a.forumid,
 				a.lasttopicid,
 				a.lastposted
 			FROM
 				databaseSchema.objectQualifier_forum a
 				JOIN databaseSchema.objectQualifier_activeaccess x ON a.forumid=x.forumid
 			WHERE
 				a.parentid=i_forumid AND 
 				(
 					(i_userid IS NULL AND (a.flags & 2)=0) 
 					OR (x.userid=i_UserID and ((a.flags & 2)=0 
 					OR x.readaccess IS TRUE))
 				);
 BEGIN

 
 	-- try to retrieve last direct topic posed in forums if not supplied as argument 
	IF (i_LastTopicID IS NULL OR i_LastPosted IS NULL) THEN
 		SELECT
 			a.lasttopicid,
 			a.lastposted 
 			INTO
 			ici_LastTopicID,ici_LastPosted              
 		FROM
 			databaseSchema.objectQualifier_forum a
 			JOIN databaseSchema.objectQualifier_activeaccess x ON a.forumid=x.forumid
 		WHERE
 			a.forumid=i_forumid and
 			(
 				(i_UserID is null and (a.flags & 2)=0) or 
 				(x.userid=i_userid and ((a.flags & 2)=0 
 				or x.readaccess IS TRUE))
 			);
 	END IF;
 	-- look for newer topic/message in subforums
 	IF EXISTS(select 1 from databaseSchema.objectQualifier_forum where parentid=i_forumid) THEN 		
 			
 		open cltt;
 		
 		-- cycle through subforums
LOOP
FETCH cltt INTO ici_SubforumID, ici_TopicID, ici_Posted;
EXIT WHEN NOT FOUND;
-- get last topic/message info for subforum
 			SELECT 
 				 a.LastTopicID,
			         a.LastPosted 
			         INTO ici_TopicID,ici_Posted
 				 FROM 				                       
 			databaseSchema.objectQualifier_forum a
				JOIN databaseSchema.objectQualifier_activeaccess x 
				ON a.ForumID=x.ForumID
			WHERE
				a.ParentID=i_forumid and
				(
					(i_userid is null and (a.Flags & 2)=0) or 
					(x.UserID=i_userid and ((a.Flags & 2)=0 or 
					x.readaccess IS TRUE))
				);
 
 			-- if subforum has newer topic/message, make it last for parent forum 
 			if (ici_TopicID is not null and ici_Posted is not null and ici_LastPosted < ici_Posted) THEN
 				ici_LastTopicID := ici_TopicID;
 				 ici_LastPosted := ici_Posted;
 			END IF;
  EXIT WHEN NOT FOUND; 

END LOOP; 	
 		CLOSE cltt; 		
 	-- deallocate c
 	END IF; 
 	SELECT 	ici_LastTopicID AS  LastTopicID,
 	ici_LastPosted AS LastPosted
 	INTO _rec;
 	RETURN _rec;
 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
--GO

-- Function: databaseSchema.objectQualifier_medal_getribbonsetting(character varying, integer, boolean)

-- DROP FUNCTION databaseSchema.objectQualifier_medal_getribbonsetting(character varying, integer, boolean);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_medal_getribbonsetting(i_ribbonurl character varying, i_flags integer, i_onlyribbon boolean)
  RETURNS boolean AS
$BODY$DECLARE
ici_OnlyRibbon boolean :=i_onlyribbon;
BEGIN
 
 	IF ((i_ribbonurl IS NULL) OR ((i_flags & 2) = 0)) 
 	THEN ici_OnlyRibbon = false;END IF; 
 	RETURN ici_OnlyRibbon;
 
 END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
 --GO

-- Function: databaseSchema.objectQualifier_forum_topics(integer)

-- DROP FUNCTION databaseSchema.objectQualifier_forum_topics(integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_forum_topics(i_forumid integer)
  RETURNS integer AS
$BODY$DECLARE
ici_NumTopics integer:=0;
ici_tmpt integer;
cntrfp1 integer:=0;
cur_fortopics refcursor;
BEGIN	

	select z.numtopics INTO ici_NumTopics
	from databaseSchema.objectQualifier_forum z
	where z.forumid=i_forumid;

	if exists(select 1 from databaseSchema.objectQualifier_forum z where z.parentid=i_ForumID) THEN

		OPEN cur_fortopics FOR
		SELECT z.forumid FROM databaseSchema.objectQualifier_forum z
		WHERE z.parentid = i_forumid;
		LOOP
  FETCH cur_fortopics INTO ici_tmpt;
  EXIT WHEN NOT FOUND;
  ici_NumTopics=ici_NumTopics + COALESCE(databaseSchema.objectQualifier_forum_topics(ici_tmpt),0);
  cntrfp1:=cntrfp1+1;
 EXIT WHEN NOT FOUND OR cntrfp1>4;   
END LOOP;  
		
		CLOSE cur_fortopics;		
	END IF;

	RETURN ici_NumTopics;
	
	END;$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;  
--GO

-- Function: databaseSchema.objectQualifier_medal_getsortorder(smallint, smallint, integer)

-- DROP FUNCTION databaseSchema.objectQualifier_medal_getsortorder(smallint, smallint, integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_medal_getsortorder(i_sortorder smallint, i_defaultsortorder smallint, i_flags integer)
  RETURNS smallint AS
$BODY$DECLARE
ici_SortOrder smallint:=i_sortorder;
BEGIN
IF ((i_flags & 8) = 0) THEN ici_SortOrder := i_defaultsortorder; END IF;
RETURN ici_SortOrder;

END;$BODY$
  LANGUAGE 'plpgsql' IMMUTABLE
  COST 100; 
--GO

-- Function: databaseSchema.objectQualifier_medal_gethide(boolean, integer)

-- DROP FUNCTION databaseSchema.objectQualifier_medal_gethide(boolean, integer);

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_medal_gethide(i_hide boolean, i_flags integer)
  RETURNS boolean AS
$BODY$DECLARE
ici_hide boolean :=i_hide;
BEGIN
	IF ((i_flags & 4) = 0) THEN ici_hide = false;END IF;
	RETURN ici_hide;
END$BODY$
  LANGUAGE 'plpgsql' IMMUTABLE
  COST 100; 
--GO


CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_get_userstyle(i_userid integer)
  RETURNS character varying(255)   AS
$BODY$DECLARE
ici_style character varying(255);
BEGIN	
	SELECT  c.style INTO ici_style FROM databaseSchema.objectQualifier_user a 
                        JOIN databaseSchema.objectQualifier_usergroup b
                          ON a.userid = b.userid
                            JOIN databaseSchema.objectQualifier_group c                         
                              ON b.groupid = c.groupid 
                              WHERE a.userid = i_userid AND LENGTH(c.style) > 3  
                              ORDER BY c.sortorder ASC LIMIT 1;
       if ( ici_style is null or LENGTH(ici_style) < 4 ) then               
                              SELECT c.style INTO ici_style FROM databaseSchema.objectQualifier_rank c 
                                JOIN databaseSchema.objectQualifier_user d
                                  ON c.rankid = d.rankid 
                                  WHERE d.userid = i_userid AND LENGTH(c.style) > 3 
                                  ORDER BY c.sortorder  LIMIT 1;
                 end if;
      return ici_style;	
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
--GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_message_getthanksinfo(i_messageid integer, i_showthanksdate boolean)
  RETURNS text   AS
$BODY$DECLARE
ici_temp1 text;
ici_temp2 text;
ici_temp3 text;
ici_return text;
BEGIN	
	SELECT COALESCE(ici_return || ',', '') , i.thanksfromuserid::text,
	(CASE i_showthanksdate  WHEN TRUE THEN ',' || i.thanksdate::text  ELSE '' END)
    INTO ici_temp1,ici_temp2 ,ici_temp3 
			FROM	databaseSchema.objectQualifier_thanks i
			WHERE	i.messageid = i_messageid ORDER BY i.thanksdate;
	ici_return := ici_temp1 || ici_temp2 || ici_temp3;
-- Add the last comma if ici_return has data.
	IF ici_return <> '' THEN
		ici_return := ici_return || ',';
        END IF;
      return ici_return;	
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100;
  --GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_forum_save_parentschecker(i_forumid integer, i_parentid integer)
  RETURNS integer AS
$BODY$DECLARE
ici_dependency integer:= 0;
ici_haschildren integer:= 0;
row_data RECORD;
-- ici_frmtmp integer,
-- ici_prntmp integer
begin
-- Checks if the forum is already referenced as a parent 
    
    select forumid into ici_dependency 
    from databaseSchema.objectQualifier_forum 
    where parentid=i_forumid and forumid = i_parentid;
    if ici_dependency > 0 then   
    return i_parentid;
    end if;

    if exists(select 1 from databaseSchema.objectQualifier_forum where parentID=i_forumid) then
      FOR  row_data  IN       
        select forumid,parentid from databaseSchema.objectQualifier_forum
        where parentid = i_forumid
        LOOP
        if row_data.forumid > 0 AND row_data.forumid IS NOT NULL then              
            SELECT * INTO ici_haschildren 
            FROM databaseSchema.objectQualifier_forum_save_parentschecker(row_data.forumid, i_parentid);            
            if  row_data.parentid = i_parentid
            then
            ici_dependency := i_parentid;                
            elseif ici_haschildren > 0  then           
            ici_dependency := ici_haschildren;
            end if;                    
        end if;
        
        
        END LOOP;
        end if;
    return COALESCE(ici_dependency,0);
END$BODY$
  LANGUAGE 'plpgsql' VOLATILE SECURITY DEFINER
  COST 100; 
--GO

CREATE OR REPLACE FUNCTION databaseSchema.objectQualifier_registry_value( i_name varchar(64), i_boardid integer)
  RETURNS text AS
$BODY$DECLARE
ici_returnValue text;
begin
    IF i_boardid IS NOT NULL AND EXISTS(SELECT 1 FROM databaseSchema.objectQualifier_registry WHERE LOWER("name") = LOWER(i_name) AND boardid = i_boardid) then
   
            SELECT "value"::text INTO ici_returnValue
            FROM databaseSchema.objectQualifier_registry
            WHERE LOWER("name") = LOWER(i_name) and  boardid = i_boardid;    
    
    ELSE
    
         SELECT "value"::text INTO ici_returnValue
            FROM databaseSchema.objectQualifier_registry
            WHERE LOWER("name") = LOWER(i_name) and
                boardid is NULL;          
    END IF;
         

    RETURN ici_returnValue;
END$BODY$
  LANGUAGE 'plpgsql' STABLE SECURITY DEFINER
  COST 100; 
--GO