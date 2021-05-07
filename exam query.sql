CREATE DATABASE Exam

use exam

DROP TABLE main_User

CREATE TABLE main_User(
	UserID CHAR(7),
	FirstName VARCHAR(255)NOT NULL,
	Lastname VARCHAR(255)NOT NULL,
	School VARCHAR(255),
	Adress VARCHAR (255),
	Email VARCHAR (255)NOT NULL,
	PhoneNumber VARCHAR (255),
	Location_ VARCHAR(255),
	DOB CHAR (8),
	--^12/12/12
	Gender VARCHAR (255) CHECK (Gender like 'Male' or  Gender like 'Female')
	CONSTRAINT main_userPK PRIMARY KEY (UserID)
)

CREATE TABLE Page_likes(
	PageID CHAR(7),
	UserID CHAR(7),
	CONSTRAINT page_likespk PRIMARY KEY (PageID),
	CONSTRAINT Page_Likesfk FOREIGN KEY (UserID) REFERENCES main_User(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Pages (
	pageID CHAR(7),
	pagename VARCHAR(255),
	pagecontent VARCHAR (255),
	CONSTRAINT pagesPK PRIMARY KEY (PageID),
)

CREATE TABLE friends(
	FriendsID CHAR(7),
	UserID CHAR(7),
	CONSTRAINT FriendsPK PRIMARY KEY (FriendsID),
	CONSTRAINT FriendsFK FOREIGN KEY (UserID) REFERENCES main_User(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE tempFRIEND(
	RelationID CHAR (7),
	FriendsID CHAR(7),
	CONSTRAINT tempfriendPK PRIMARY KEY (RelationID),
	CONSTRAINT tempfriendFK FOREIGN KEY (FriendsID) REFERENCES friends(FriendsID),
)

CREATE TABLE post(
	postID CHAR (7),
	UserID CHAR (7),
	Postdate VARCHAR (255),
	PostContent VARCHAR (255),
	CONSTRAINT postPK PRIMARY KEY (PostID),
	CONSTRAINT postFK FOREIGN KEY (UserID) REFERENCES main_user(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE Postlikes(
	PostID char(7),
	UserID char(7),
	CONSTRAINT postlikesPK PRIMARY KEY (PostID),
	CONSTRAINT postlikesFK FOREIGN KEY (UserID) REFERENCES main_user (UserID)
	ON UPDATE CASCADE ON DELETE set NULL
)

CREATE TABLE Photo(
	PhotoID CHAR(7),
	PostID CHAR(7),
	imageContent VARCHAR(255),
	CONSTRAINT photoPK PRImARY KEY (PhotoID),
	CONSTRAINT postID FOREIGN KEY (postID) REFERENCES post(UserID)
	ON UPDATE CASCADE on DELETE SET NULL,
)

CREATE TABLE Shares(
	SharesID char (7),
	PostID char (7),
	CONSTRAINT sharesPK PRIMARY KEY (SHARESID),
	CONSTRAINT sharesFK FOREIGN KEY (PostID) REFERENCES post(postID)
	ON UPDATE CASCADE on DELETE SET NULL
)

CREATE TABLE Comments(
	CommentsID char (7),
	PostID char(7),
	UserID char (7),
	CommentDate  varchar(255),
	CommentContent varchar(255),
	CONSTRAINT CommentPK PRIMARY KEY (CommentsID),
	CONSTRAINT postFK FOREIGN KEY (PostID) REFERENCES post(postID)
	ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT userFK FOREIGN KEY (UserID) REFERENCES main_user(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)

CREATE TABLE CommentLikes(
	CommentsId char(7),
	UserID char (7),
	CONSTRAINT COMMENTLIKESPK PRIMARY KEY (CommentsID),
	CONSTRAINT userFK FOREIGN KEY (UserID) REFERENCES main_user(UserID)
	ON UPDATE CASCADE ON DELETE SET NULL
)


