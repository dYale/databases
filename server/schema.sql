CREATE DATABASE chat;

USE chat;





-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'Users'
-- 
-- ---

DROP TABLE IF EXISTS `Users`;
		
CREATE TABLE `Users` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Username` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Messages'
-- 
-- ---

DROP TABLE IF EXISTS `Messages`;
		
CREATE TABLE `Messages` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Userid` INTEGER NULL DEFAULT NULL,
  `Roomid` INTEGER NULL DEFAULT NULL,
  `Text` VARCHAR(140) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'Rooms'
-- 
-- ---

DROP TABLE IF EXISTS `Rooms`;
		
CREATE TABLE `Rooms` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `Roomname` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `Messages` ADD FOREIGN KEY (Userid) REFERENCES `Users` (`id`);
ALTER TABLE `Messages` ADD FOREIGN KEY (Roomid) REFERENCES `Rooms` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`Username`) VALUES
-- ('','');
-- INSERT INTO `Messages` (`id`,`Userid`,`Roomid`,`Text`) VALUES
-- ('','','','');
-- INSERT INTO `Rooms` (`id`,`Roomname`) VALUES
-- ('','');




-- ---
-- Table Properties
-- ---

-- ALTER TABLE `Users` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `Users` (`id`,`Username`) VALUES
-- ('','');
-- INSERT INTO `Rooms` (`id`,`Messages`,`Users`,`Name`) VALUES
-- ('','','','');
-- INSERT INTO `messages` (`id`,`Roomid`,`Userid`,`Timestamp`,`text`) VALUES
-- ('','','','','');



/* Create other tables and define schemas for them here! */




/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/

