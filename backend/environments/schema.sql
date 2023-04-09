
-- check condition for the length of string where fixed length is needed !
-- last visit me on update wali cheej me mereko clarity nhi h !
-- abhi ke liye TEXT likh diye hai but usko as a tex file implement karna hai !
-- whereever get VARCHAR(100) means it is of set type thing and hence need to be stored in a different schema 

DROP DATABASE IF EXISTS Synergy_db;
CREATE DATABASE Synergy_db;
USE Synergy_db;


DROP TABLE IF EXISTS Personal;
DROP TABLE IF EXISTS Report;
DROP TABLE IF EXISTS Comment;
DROP TABLE IF EXISTS Post;
DROP TABLE IF EXISTS Id;
DROP TABLE IF EXISTS Tag;
DROP TABLE IF EXISTS Institution;
DROP TABLE IF EXISTS Account;


CREATE TABLE Account (
    id_obj CHAR(1) DEFAULT 'A' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE, 
    username VARCHAR(50) NOT NULL UNIQUE,
    creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    name VARCHAR(150) NOT NULL,
    email_id VARCHAR(150) NOT NULL UNIQUE,
    institutes VARCHAR(100) NOT NULL UNIQUE, 
    posts VARCHAR(100) NOT NULL UNIQUE,
    last_visit TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    upvotes VARCHAR(100) NOT NULL UNIQUE,
    -- profile_photo BLOB,  -- not certain of it tough
    bookmarks VARCHAR(100) NOT NULL UNIQUE,
    followers VARCHAR(100) NOT NULL UNIQUE,
    following VARCHAR(100) NOT NULL UNIQUE,
    comments VARCHAR(100) NOT NULL UNIQUE,
    visited_post VARCHAR(100) NOT NULL UNIQUE,
    activity VARCHAR(100) NOT NULL UNIQUE,
    tag_list VARCHAR(100) NOT NULL UNIQUE,
    country CHAR(150) ,
    state CHAR(150),
    city CHAR(150),
    website_address VARCHAR(1000),
    github_handle VARCHAR(150),
    organisation CHAR(150),
    visibility BOOLEAN DEFAULT true,
    report_list VARCHAR(100) NOT NULL UNIQUE,
    api_visibility BOOLEAN default true,
    PRIMARY KEY (id_obj, id_uniq)
);

CREATE TABLE Institution (
    id_obj CHAR(1) DEFAULT 'I' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL UNIQUE,
    members VARCHAR(100) NOT NULL UNIQUE,
    creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    posts VARCHAR(100) NOT NULL UNIQUE,
    description TEXT, -- needed to be tex file !
    -- domains VARCHAR(100) NOT NULL UNIQUE, -- what was this if anyone remembers ??
    admin_obj CHAR(1) DEFAULT 'A' NOT NULL, 
    admin_uniq VARCHAR(200) NOT NULL,
    email_id VARCHAR(150) NOT NULL UNIQUE,
    visibility BOOLEAN DEFAULT true,
    api_visibility BOOLEAN DEFAULT true,
    PRIMARY KEY (id_obj, id_uniq)
);


CREATE TABLE Tag (
    id_obj CHAR(1) DEFAULT 'T' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    posts VARCHAR(100) NOT NULL UNIQUE,
    members VARCHAR(100) NOT NULL UNIQUE,
    api_visibility BOOLEAN DEFAULT true,
    PRIMARY KEY (id_obj, id_uniq)
);

CREATE TABLE Id (
    id_obj CHAR(1) NOT NULL NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    PRIMARY KEY (id_obj, id_uniq)
);


CREATE TABLE Post (
    id_obj CHAR(1) DEFAULT 'P' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    author_obj CHAR(1) NOT NULL,
    author_uniq VARCHAR(200),
    INDEX (author_obj, author_uniq),
    FOREIGN KEY (author_obj, author_uniq) REFERENCES Id(id_obj, id_uniq),
    creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    title TEXT,
    content TEXT, -- kuch karna h iska !! 
    upvotes VARCHAR(100) NOT NULL UNIQUE,
    comments VARCHAR(100) NOT NULL UNIQUE,
    report_list VARCHAR(100) NOT NULL UNIQUE,
    public_post BOOLEAN DEFAULT true,
    visibility BOOLEAN DEFAULT true,
    institutes VARCHAR(100)  NOT NULL UNIQUE,
    tag_list VARCHAR(100) NOT NULL UNIQUE,
    api_visibility BOOLEAN DEFAULT true,
    PRIMARY KEY (id_obj, id_uniq)
);

CREATE TABLE Comment (
    id_obj CHAR(1) DEFAULT 'C' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    author_obj CHAR(1) NOT NULL,
    author_uniq VARCHAR(200),
    INDEX (author_obj, author_uniq),
    FOREIGN KEY (author_obj, author_uniq) REFERENCES Id(id_obj, id_uniq), 
    creation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    content TEXT, -- isko change karna hai !
    upvotes VARCHAR(100) NOT NULL UNIQUE,
    comments VARCHAR(100) NOT NULL UNIQUE,
    report_list VARCHAR(100) NOT NULL UNIQUE,
    visibility BOOLEAN DEFAULT true,
    post_obj CHAR(1) NOT NULL,
    post_uniq VARCHAR(200),
    INDEX (post_obj, post_uniq),
    FOREIGN KEY (post_obj, post_uniq) REFERENCES Id(id_obj, id_uniq),
    api_visibility BOOLEAN DEFAULT true,
    PRIMARY KEY (id_obj, id_uniq)
);

CREATE TABLE Report (
    id_obj CHAR(1) DEFAULT 'R' NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    from_obj CHAR(1) NOT NULL,
    from_uniq VARCHAR(200),
    INDEX (from_obj, from_uniq),
    FOREIGN KEY (from_obj, from_uniq) REFERENCES Id(id_obj, id_uniq),
    to_obj CHAR(1) NOT NULL,
    to_uniq VARCHAR(200),
    INDEX (to_obj, to_uniq),
    FOREIGN KEY (to_obj, to_uniq) REFERENCES Id(id_obj, id_uniq),
    description TEXT,
    api_visibility BOOLEAN DEFAULT true,
    PRIMARY KEY (id_obj, id_uniq)
);

CREATE TABLE Personal (
    id_obj CHAR(1) NOT NULL NOT NULL,
    id_uniq VARCHAR(200) NOT NULL UNIQUE,
    pass VARCHAR(300) NOT NULL,
    PRIMARY KEY (id_obj, id_uniq)
);


use Synergy_db;
show tables;

-- insert into Id (id_obj, id_uniq) values ('A', "asdfgh12345");
-- insert into Id (id_obj, id_uniq) values ('A', "asdfgh12987");
-- insert into Id (id_obj, id_uniq) values ('I', "njniuw98530");
-- insert into Id (id_obj, id_uniq) values ('C', "asfnjk78495");
-- insert into Id (id_obj, id_uniq) values ('C', "ahwkmk92835");
-- insert into Id (id_obj, id_uniq) values ('P', "mksdnq82910");
-- insert into Id (id_obj, id_uniq) values ('P', "niokwq85573");
-- insert into Id (id_obj, id_uniq) values ('R', "moqwid98530");
-- insert into Id (id_obj, id_uniq) values ('T', "dfniew20935");
-- insert into Id (id_obj, id_uniq) values ('P', "viunsd74850");
-- insert into Id (id_obj, id_uniq) values ('P', "wmdisd30930");


-- insert into Personal (id_obj, id_uniq, pass) values ('A', "asdfgh12345", '$2b$12$BPgM2TZNwWMnrCl5d5Bjme9DToqZVRTe9CkKpLCOYgXj0VdPcCozi');  -- "password"
-- insert into Personal (id_obj, id_uniq, pass) values ('A', "asdfgh12987", '$2b$12$kdK1jlmB.UH2jcfR2RrhJOAxPS1HuOc3K62TZib6oZqoxQjtgb4/W'); -- "kuruasfad"
-- insert into Personal (id_obj, id_uniq, pass) values ('I', "njniuw98530", '$2b$12$SNBsbZBsY8inv4Qi2bGb6OvMxGntXAQBTfvUDSLnNW6xcbizxsCri'); -- "kururthedean"

-- insert into Account (id_obj, id_uniq, username, creation_time, name, email_id, institutes, posts, last_visit, upvotes, bookmarks, followers, following, comments, visited_post, activity, tag_list, country, state, city, website_address, github_handle, organisation, visibility, report_list, api_visibility) values ('A', "asdfgh12345", "Aman_Zod", "2023-04-05 21:32:36", "Aman Singh Dalawat", "ris04hit@gmail.com", "asdfgh12345_ins", "asdfgh12345_pos", "2023-04-05 21:59:36", "asdfgh12345_upv", "asdfgh12345_boo", "asdfgh12345_ers", "asdfgh12345_ing", "asdfgh12345_com", "asdfgh12345_vis", "asdfgh12345_act", "asdfgh12345_tag", "India", "Rajasthan", "Udaipur", "www.giguschadus.com", "excitedleopard", "IIT_Delhi", 1, "asdfgh12345_rep", 1);
-- insert into Account (id_obj, id_uniq, username, name, email_id, institutes, posts, last_visit, upvotes, bookmarks, followers, following, comments, visited_post, activity, tag_list, country, state, city, website_address, github_handle, organisation, visibility, report_list, api_visibility) values ('A', "asdfgh12987", "Matki Mutthal", "Mani Sarthak", "manisarthak@gmail.com", "asdfgh12987_ins", "asdfgh12987_pos", "2023-04-05 23:59:36", "asdfgh12987_upv", "asdfgh12987_boo", "asdfgh12987_ers", "asdfgh12987_ing", "asdfgh12987_com", "asdfgh12987_vis", "asdfgh12987_act", "asdfgh12987_tag", "India", "Bihar", "Chapra", "www.betussimpus.com", "mani-sarthak", "IIT_Delhi", 1, "asdfgh12987_rep", 0);

-- insert into Comment (id_obj, id_uniq, author_obj, author_uniq, creation_time, content, upvotes, comments, report_list, visibility, post_obj, post_uniq, api_visibility) values ('C', "asfnjk78495", 'A', "asdfgh12345", "2023-04-05 21:59:36", "This is a chess tutorial on how to open as white", "asfnjk78495_upv", "asfnjk78495_com", "asfnjk78495_rep", 1, 'P', "viunsd74850", 0);
-- insert into Comment (id_obj, id_uniq, author_obj, author_uniq, creation_time, content, upvotes, comments, report_list, visibility, post_obj, post_uniq, api_visibility) values ('C', "ahwkmk92835", 'A', "asdfgh12987", "2023-04-05 23:59:36", "Hi, this post is for those who want a quick tutorial on linux commands", "ahwkmk92835_upv", "ahwkmk92835_com", "ahwkmk92835_rep", 1, 'P', "wmdisd30930", 0);

-- insert into Institution (id_obj, id_uniq, name, members, creation_time, posts, description, admin_obj, admin_uniq, email_id, visibility, api_visibility) values ('I', "njniuw98530", "IIT_Delhi", "njniuw98530_mem", "2023-04-05 23:59:36", "njniuw98530_pos", "baby shark doo dododo", 'A', "asdfgh12345", "iitdelhi@iitd.ac.in", 1, 1);

-- insert into Post (id_obj, id_uniq, author_obj, author_uniq, creation_time, title, content, upvotes, comments, report_list, public_post, visibility, institutes, tag_list, api_visibility) values ('P', "mksdnq82910", 'A', "asdfgh12345", "2023-04-05 23:59:36", "This is the best Post ever", "blah blah sasodfh dsfuaheuif <br>nidsufbe ufbiau sdfbieuf <br>gibbersih isfudhfe fidsu f", "mksdnq82910_upv", "mksdnq82910_com", "mksdnq82910_rep", 1, 1, "mksdnq82910_ins", "mksdnq82910_tag", 1);
-- insert into Post (id_obj, id_uniq, author_obj, author_uniq, creation_time, title, content, upvotes, comments, report_list, public_post, visibility, institutes, tag_list, api_visibility) values ('P', "niokwq85573", 'A', "asdfgh12987", "2023-04-05 23:59:36", "This is the worst shitpost ever", "blah blah<br> asodfh dsfuaheuif <br>nidsufbe ufbiau sdfbieuf <br>gibbersih isfudhfe fidsu f", "niokwq85573_upv", "niokwq85573_com", "niokwq85573_rep", 1, 1, "niokwq85573_ins", "niokwq85573_tag", 1);

-- insert into Report (id_obj, id_uniq, from_obj, from_uniq, to_obj, to_uniq, description, api_visibility) values ('R', "moqwid98530", 'A', "asdfgh12345", 'A', "asdfgh12987", "This is the worst tutorial I have ever seen, the content of this tutorial is very bad", 1);

-- insert into Tag (id_obj, id_uniq, name, posts, members, api_visibility) values ('T', "dfniew20935", "Chess", "dfniew20935_pos", "dfniew20935_mem", 0);

-- DROP TABLE IF EXISTS asdfgh12345_tag;
-- CREATE TABLE asdfgh12345_tag (
--     id_obj CHAR(1) NOT NULL,
--     id_uniq VARCHAR(200) NOT NULL UNIQUE,
--     Primary key (id_obj, id_uniq)
-- );

-- insert into asdfgh12345_tag (id_obj, id_uniq) values ('T', "dfniew20935");

-- DROP TABLE IF EXISTS dfniew20935_pos;
-- CREATE TABLE dfniew20935_pos (
--     id_obj CHAR(1) NOT NULL,
--     id_uniq VARCHAR(200) NOT NULL UNIQUE,
--     Primary key (id_obj, id_uniq)
-- );

-- insert into dfniew20935_pos (id_obj, id_uniq) values ('P', "mksdnq82910");


-- DROP TABLE IF EXISTS mksdnq82910_upv;
-- CREATE TABLE mksdnq82910_upv (
--     id_obj CHAR(1) NOT NULL,
--     id_uniq VARCHAR(200) NOT NULL UNIQUE,
--     Primary key (id_obj, id_uniq)
-- );

-- insert into mksdnq82910_upv (id_obj, id_uniq) values ('A', "asdfgh12345");
