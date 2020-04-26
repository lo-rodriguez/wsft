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

-- Volcando datos para la tabla dbwsft.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `created_at`, `created_by`, `email_address`, `first_name`, `last_name`, `updated_at`, `updated_by`, `roll`, `password`) VALUES
	(1, '2019-09-14 23:20:20', 'Admin', 'suport@ronasoft.net', 'anonimo', 'anonimo', '2019-09-14 23:23:16', 'admin', 'ROLL_ADMIN', '$2y$12$Sz2SPom4xIeA6WpsusjT2uPooYGyoc.T2iaUsBo3Y9J'),
	(2, '2019-09-15 19:57:04', 'Admin', 'user@ronasoft.net', 'user', NULL, '2019-09-15 19:56:25', 'admin', 'USER_APP_ANDROID', '$2y$12$IJa4N7wmozsGxbjp22A8OOgQ.D9ku4tTt3In7z42Hu2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
