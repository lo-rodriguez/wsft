-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para dbwsft
CREATE DATABASE IF NOT EXISTS `dbwsft` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_bin */;
USE `dbwsft`;

-- Volcando estructura para tabla dbwsft.batches
CREATE TABLE IF NOT EXISTS `batches` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `program_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `name` varchar(200) COLLATE latin1_bin NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `notes` varchar(2000) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batch_name_by_program` (`program_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.batches: ~0 rows (aproximadamente)
DELETE FROM `batches`;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.confirm_attendance
CREATE TABLE IF NOT EXISTS `confirm_attendance` (
  `session_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `user_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`session_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.confirm_attendance: ~0 rows (aproximadamente)
DELETE FROM `confirm_attendance`;
/*!40000 ALTER TABLE `confirm_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirm_attendance` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.deliverables
CREATE TABLE IF NOT EXISTS `deliverables` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `batch_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `due_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `title` varchar(200) COLLATE latin1_bin NOT NULL,
  `description` text COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.deliverables: ~0 rows (aproximadamente)
DELETE FROM `deliverables`;
/*!40000 ALTER TABLE `deliverables` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverables` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.deliverables_by_session
CREATE TABLE IF NOT EXISTS `deliverables_by_session` (
  `deliverable_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `session_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `type` varchar(25) COLLATE latin1_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.deliverables_by_session: ~0 rows (aproximadamente)
DELETE FROM `deliverables_by_session`;
/*!40000 ALTER TABLE `deliverables_by_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverables_by_session` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.deliverables_resources
CREATE TABLE IF NOT EXISTS `deliverables_resources` (
  `deliverable_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `resource_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`deliverable_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.deliverables_resources: ~0 rows (aproximadamente)
DELETE FROM `deliverables_resources`;
/*!40000 ALTER TABLE `deliverables_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverables_resources` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.firebase_users
CREATE TABLE IF NOT EXISTS `firebase_users` (
  `uid` varchar(200) COLLATE latin1_bin NOT NULL,
  `user_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `email` varchar(200) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.firebase_users: ~0 rows (aproximadamente)
DELETE FROM `firebase_users`;
/*!40000 ALTER TABLE `firebase_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `firebase_users` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.hibernate_sequence
CREATE TABLE IF NOT EXISTS `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.hibernate_sequence: ~0 rows (aproximadamente)
DELETE FROM `hibernate_sequence`;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` (`next_val`) VALUES
	(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `user_sender_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `title` varchar(200) COLLATE latin1_bin NOT NULL,
  `body` text COLLATE latin1_bin NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `_high_priority` tinyint(1) NOT NULL,
  `_read` tinyint(1) NOT NULL,
  `received` tinyint(1) NOT NULL,
  `confirm_reading` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.messages: ~0 rows (aproximadamente)
DELETE FROM `messages`;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.messages_by_users
CREATE TABLE IF NOT EXISTS `messages_by_users` (
  `message_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `user_receiver_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`message_id`,`user_receiver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.messages_by_users: ~0 rows (aproximadamente)
DELETE FROM `messages_by_users`;
/*!40000 ALTER TABLE `messages_by_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_by_users` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.messages_resources
CREATE TABLE IF NOT EXISTS `messages_resources` (
  `message_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `resource_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`message_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.messages_resources: ~0 rows (aproximadamente)
DELETE FROM `messages_resources`;
/*!40000 ALTER TABLE `messages_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages_resources` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.oauth_client_details
CREATE TABLE IF NOT EXISTS `oauth_client_details` (
  `client_id` varchar(256) COLLATE latin1_bin NOT NULL,
  `resource_ids` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `client_secret` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `scope` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `authorized_grant_types` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `authorities` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) COLLATE latin1_bin DEFAULT NULL,
  `autoapprove` varchar(256) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.oauth_client_details: ~3 rows (aproximadamente)
DELETE FROM `oauth_client_details`;
/*!40000 ALTER TABLE `oauth_client_details` DISABLE KEYS */;
INSERT INTO `oauth_client_details` (`client_id`, `resource_ids`, `client_secret`, `scope`, `authorized_grant_types`, `web_server_redirect_uri`, `authorities`, `access_token_validity`, `refresh_token_validity`, `additional_information`, `autoapprove`) VALUES
	('AndroidApp', NULL, '$2a$10$SK3CdCpS2ui543vb4dMS4ev1F5NanWS.wxzlSFRa/huWBZkKIWwe6', 'read,write', 'firebase', NULL, NULL, 5184000, 0, NULL, '1'),
	('ManagementApp', NULL, '$2a$10$QyEdcDTyzndP6/3p7IrtWOF.Bg.AgzejotqLgYOjwzU0Ua5szaRDC', 'read,write', 'firebase', NULL, NULL, 5184000, 0, NULL, '1'),
	('iOSApp', NULL, '$2a$10$7rdl7jOe.LW1Db05XkPhneoAFXryHC0qGhmDdsmSbLYjMpZPTrBZ2', 'read,write', 'firebase', NULL, NULL, 5184000, 0, NULL, '1');
/*!40000 ALTER TABLE `oauth_client_details` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.programs
CREATE TABLE IF NOT EXISTS `programs` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `name` varchar(200) COLLATE latin1_bin NOT NULL,
  `description` varchar(500) COLLATE latin1_bin NOT NULL,
  `responsible` varchar(2000) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.programs: ~0 rows (aproximadamente)
DELETE FROM `programs`;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `url` varchar(200) COLLATE latin1_bin NOT NULL,
  `mime_type` varchar(200) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.resources: ~0 rows (aproximadamente)
DELETE FROM `resources`;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `name` varchar(100) COLLATE latin1_bin NOT NULL,
  `description` varchar(2000) COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.roles: ~5 rows (aproximadamente)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`name`, `description`) VALUES
	('ROLE_ADMINISTRATOR', 'People guiding the programs. An administrator belongs to staff as well'),
	('ROLE_MENTOR', 'People in charge of some team of teckers'),
	('ROLE_PARENT', 'Parents/tutors of the teckers'),
	('ROLE_STAFF', 'People helping to achieve success in any of the programs'),
	('ROLE_TECKER', 'Main consumers of the programs provided by the organization, for many of the programs they are supposed to be kids');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `batch_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `title` varchar(200) COLLATE latin1_bin NOT NULL,
  `notes` text COLLATE latin1_bin NOT NULL,
  `location` varchar(500) COLLATE latin1_bin DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_title` (`batch_id`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.sessions: ~0 rows (aproximadamente)
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.teckers_by_parents
CREATE TABLE IF NOT EXISTS `teckers_by_parents` (
  `tecker_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `parent_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`tecker_id`,`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.teckers_by_parents: ~0 rows (aproximadamente)
DELETE FROM `teckers_by_parents`;
/*!40000 ALTER TABLE `teckers_by_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `teckers_by_parents` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.tecker_by_deliverable
CREATE TABLE IF NOT EXISTS `tecker_by_deliverable` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `tecker_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `deliverable_id` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `status` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.tecker_by_deliverable: ~0 rows (aproximadamente)
DELETE FROM `tecker_by_deliverable`;
/*!40000 ALTER TABLE `tecker_by_deliverable` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecker_by_deliverable` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.tecker_by_mentor
CREATE TABLE IF NOT EXISTS `tecker_by_mentor` (
  `tecker_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `mentor_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`tecker_id`,`mentor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.tecker_by_mentor: ~0 rows (aproximadamente)
DELETE FROM `tecker_by_mentor`;
/*!40000 ALTER TABLE `tecker_by_mentor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecker_by_mentor` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(100) COLLATE latin1_bin NOT NULL,
  `name` varchar(100) COLLATE latin1_bin NOT NULL,
  `preferred_email` varchar(200) COLLATE latin1_bin NOT NULL,
  `phone_number` varchar(100) COLLATE latin1_bin DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `picture_url` varchar(1024) COLLATE latin1_bin NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.users: ~0 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.users_by_batch
CREATE TABLE IF NOT EXISTS `users_by_batch` (
  `batch_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `user_id` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`batch_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.users_by_batch: ~0 rows (aproximadamente)
DELETE FROM `users_by_batch`;
/*!40000 ALTER TABLE `users_by_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_by_batch` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft.users_roles
CREATE TABLE IF NOT EXISTS `users_roles` (
  `user_id` varchar(100) COLLATE latin1_bin NOT NULL,
  `role_name` varchar(100) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`user_id`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft.users_roles: ~0 rows (aproximadamente)
DELETE FROM `users_roles`;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;

-- Volcando estructura para tabla dbwsft._users
CREATE TABLE IF NOT EXISTS `_users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(255) COLLATE latin1_bin NOT NULL,
  `email_address` varchar(255) COLLATE latin1_bin NOT NULL,
  `first_name` varchar(255) COLLATE latin1_bin NOT NULL,
  `last_name` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(255) COLLATE latin1_bin DEFAULT NULL,
  `roll` varchar(255) COLLATE latin1_bin NOT NULL,
  `password` varchar(50) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- Volcando datos para la tabla dbwsft._users: ~2 rows (aproximadamente)
DELETE FROM `_users`;
/*!40000 ALTER TABLE `_users` DISABLE KEYS */;
INSERT INTO `_users` (`id`, `created_at`, `created_by`, `email_address`, `first_name`, `last_name`, `updated_at`, `updated_by`, `roll`, `password`) VALUES
	(1, '2019-09-14 23:20:20', 'Admin', 'suport@ronasoft.net', 'anonimo', 'anonimo', '2019-09-14 23:23:16', 'admin', 'ROLL_ADMIN', '$2y$12$Sz2SPom4xIeA6WpsusjT2uPooYGyoc.T2iaUsBo3Y9J'),
	(2, '2019-09-15 19:57:04', 'Admin', 'user@ronasoft.net', 'user', NULL, '2019-09-15 19:56:25', 'admin', 'USER_APP_ANDROID', '$2y$12$IJa4N7wmozsGxbjp22A8OOgQ.D9ku4tTt3In7z42Hu2');
/*!40000 ALTER TABLE `_users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
