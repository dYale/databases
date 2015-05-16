CREATE DATABASE chat;

USE chat;



DROP TABLE IF EXISTS `Users`;
		
CREATE TABLE messages (

  id int NOT NULL AUTO_INCREMENT,
  userid int NOT NULL,
  text varchar(200) NOT NULL,
  roomname varchar(20),
  PRIMARY KEY(20)
);

CREATE TABLE users(
  id  int NOT NULL AUTO_INCREMENT,
  username varchar(40) NOT NULL,
  PRIMARY KEY (ID)
);