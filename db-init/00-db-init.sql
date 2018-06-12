-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ownerid` char(24) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ownerid` (`ownerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `albums` (`id`, `name`, `category`, `email`, `ownerid`) VALUES
(1,	'Dogs',	'Animals',	'lioyj@oregonstate.edu',	'1'),
(2,	'Cats',	'Animals',	'lioyj@oregonstate.edu',	'1'),
(3,	'Mole Rats',	'Animals',	'moleratlover@yahoo.com',	'2');

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `caption` text NOT NULL,
  `data` text NOT NULL,
  `albumid` mediumint(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `albumid` (`albumid`),
  CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`albumid`) REFERENCES `albums` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `photos` (`id`, `userid`, `title`, `caption`, `data`, `albumid`) VALUES
(3,	1,	'Dog 1',	'Dog 1',	'00111101 00110101 11100001 11110011 00101100 11111001 00101100 01011010 \r\n11110011 11010100 ',	1),
(4,	1,	'Dog 2',	'Dog 2',	'00111000 01000100 10011001 00111000 00101001 11110001 10101001 11111100 \r\n11001011 10010011 ',	1),
(5,	1,	'Cat 1',	'Cat 1',	'10100000 01000010 00100101 10000010 01001111 01100100 10011110 10111011 \r\n01110010 01010010 ',	2),
(6,	1,	'Cat 2',	'Cat 2',	'01000010 10111110 00010010 11000001 00011001 10101000 00100000 01001011 \r\n01100101 01110001 ',	2),
(7,	2,	'Mole Rat 1',	'Mole Rat 1',	'11011100 10010010 01001011 00010010 00000010 11011100 00100001 10100010 \r\n01111001 11011000 ',	3),
(8,	2,	'Mole Rat 2',	'Mole Rat 2',	'10110000 10001010 10111000 00011100 10000011 00011111 00001111 01101100 \r\n10110101 01011000 ',	3);

-- 2018-06-12 17:23:44