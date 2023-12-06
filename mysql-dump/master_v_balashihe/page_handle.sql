-- --------------------------------------------------------
-- Хост:                         192.168.0.50
-- Версия сервера:               11.0.3-MariaDB-1:11.0.3+maria~ubu2204 - mariadb.org binary distribution
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица master_v_balashihe.page_handle
CREATE TABLE IF NOT EXISTS `page_handle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(1024) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.page_handle: ~38 rows (приблизительно)
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(17, '');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(39, '1111111111111111111111');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(18, 'computer-master-balashiha');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(40, 'fdsfsa');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(38, 'semanticheskaya-razmetka-schema-org-v-react-js');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(37, 'uslugi-mastera-v-balashihe');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(46, 'uslugi-mastera-v-balashihe/00000000000000000');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(43, 'uslugi-mastera-v-balashihe/11');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(44, 'uslugi-mastera-v-balashihe/22');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(45, 'uslugi-mastera-v-balashihe/234324324');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(47, 'uslugi-mastera-v-balashihe/3221321321');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(48, 'uslugi-mastera-v-balashihe/32432432');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(15, 'uslugi-mastera-v-balashihe/chastnyj-kompyuternyj-master-mgtu-mirea-(rossijskij-tehnologicheskij-universitet)');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(21, 'uslugi-mastera-v-balashihe/davajte-poznakomimsya-dmitrij-kompyuternyj-master');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(42, 'uslugi-mastera-v-balashihe/dfsdfsdf');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(16, 'uslugi-mastera-v-balashihe/dmitrij-chastnyj-kompyuternyj-master-mgtu-mirea-rossijskij-tehnologicheskij-universitet');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(20, 'uslugi-mastera-v-balashihe/dmitrij-kompyuternyj-master');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(22, 'uslugi-mastera-v-balashihe/dmitrij-kompyuternyj-master-v-balashihe-mgtu-mirea-eerossijskij-tehnologicheskij-universitet');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(19, 'uslugi-mastera-v-balashihe/dmitrij-kompyuternyj-master-v-balashihe-mgtu-mirea-rossijskij-tehnologicheskij-universitet');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(8, 'uslugi-mastera-v-balashihe/kompyuternye-sistemnye-bloki-v-balashihe-remont-pk');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(9, 'uslugi-mastera-v-balashihe/master-po-remontu-kompyuterov-s-horoshimi-otzyvami-v-balashihe-master-s-vyezdom-na-dom-ili-v-ofise-ryadom-s-centrom-goroda-balashiha');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(14, 'uslugi-mastera-v-balashihe/master-po-remontu-kompyuterov-udalit-virusy-v-kompyutere-po-nizkoj-cene-ili-udalit-virusy-samomu');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(24, 'uslugi-mastera-v-balashihe/remont-kompyuterov-bystro-balashiha-na-domu-ili-v-ofise');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(2, 'uslugi-mastera-v-balashihe/remont-materinskih-plat-v-balashihe-i-moskovskoj-oblasti');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(27, 'uslugi-mastera-v-balashihe/remont-noutbuka-mfc-balashiha');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(29, 'uslugi-mastera-v-balashihe/remont-noutbuka-v-balashihe-ryadom-s-mfc');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(1, 'uslugi-mastera-v-balashihe/remont-noutbukov-v-balashihe-v-den-obrasheniya-u-vas-doma-ili-v-ofisnom-centre');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(41, 'uslugi-mastera-v-balashihe/sdfsdfsdfdsa');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(35, 'uslugi-mastera-v-balashihe/semanticheskaya-razmetka-schema-org-v-react-js');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(26, 'uslugi-mastera-v-balashihe/srochnyj-remont-kompyutera-balashiha-na-domu-ili-v-ofise');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(25, 'uslugi-mastera-v-balashihe/srochnyj-remont-kompyuterov-balashiha-na-domu-ili-v-ofise');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(33, 'uslugi-mastera-v-balashihe/udalit-virusy-bystro-i-dyoshevo-v-balashihe-remont-kompyuterov-i-noutbukov-v-centre');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(7, 'uslugi-mastera-v-balashihe/udalit-virusy-v-kompyutere-po-nizkoj-cene-v-balashihe-ili-poprobovat-udalit-virusy-samomu');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(28, 'uslugi-mastera-v-balashihe/ustanovka-os-windows-v-balashihe-remont-pk');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(23, 'uslugi-mastera-v-balashihe/ustanovka-programm-balashiha');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(30, 'uslugi-mastera-v-balashihe/vyzvat-mastera-po-remontu-kompyuterov-s-celyu-udalit-virusy-v-kompyutere-po-nizkoj-cene-ili-udalit-virusy-samomu');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(32, 'uslugi-mastera-v-balashihe/vyzvat-mastera-po-remontu-kompyuterov-udalit-virusy-v-kompyutere-po-nizkoj-cene');
INSERT IGNORE INTO `page_handle` (`id`, `handle`) VALUES
	(31, 'uslugi-mastera-v-balashihe/vyzvat-mastera-po-remontu-kompyuterov-udalit-virusy-v-kompyutere-po-nizkoj-cene-ili-udalit-virusy-samomu');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
