CREATE DATABASE `BD_basicCourse` /*!40100 DEFAULT CHARACTER SET utf8 */;


CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countri_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `regions-countri_key_idx` (`countri_id`),
  CONSTRAINT `regions-countri_key` FOREIGN KEY (`countri_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `districts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countri_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `region_key_idx` (`region_id`),
  KEY `countri_key_idx` (`countri_id`),
  KEY `district-region_key_idx` (`region_id`),
  KEY `district-counri_key_idx` (`countri_id`),
  CONSTRAINT `district-counri_key` FOREIGN KEY (`countri_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `district-region_key` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `type_locality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `localities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `localities-counri_key_idx` (`country_id`),
  KEY `localities-region_key_idx` (`region_id`),
  KEY `localities-district_key_idx` (`district_id`),
  KEY `localities-type_key_idx` (`type_id`),
  CONSTRAINT `localities-counri_key` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `localities-district_key` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `localities-region_key` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `localities-type_key` FOREIGN KEY (`type_id`) REFERENCES `type_locality` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
