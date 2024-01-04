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

-- Дамп структуры для таблица master_v_balashihe.index_now_request
CREATE TABLE IF NOT EXISTS `index_now_request` (
  `uuid` tinytext NOT NULL,
  `apiUrl` tinytext NOT NULL,
  `siteHost` tinytext NOT NULL,
  `siteOrigin` tinytext NOT NULL,
  `url` varchar(2048) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `revalidated` tinyint(1) unsigned DEFAULT NULL,
  `indexNowSended` tinyint(1) unsigned DEFAULT NULL,
  `indexNowStatus` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`uuid`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Дамп данных таблицы master_v_balashihe.index_now_request: ~544 rows (приблизительно)
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0005a7ce-01f3-4d15-8c25-f2dff5e6f764', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('007494d4-ee14-4e81-b6b2-0f3180def868', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 19:20:20', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('01608a76-19d1-4a62-bb14-ae3718b128b7', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:12:35', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('01ca5502-e874-4d71-9f13-8cd95662384d', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:42:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('02284aba-2168-4af9-b55d-e289531e1b07', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:01:34', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('033a3f3c-0d70-4361-be3e-cc42e2c0e746', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:09:54', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('03597616-5d3a-4798-8700-b531c0dd21e2', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('04779c49-59ac-4f2b-bd19-330b0c186fae', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('049f0d83-271b-4b2a-9670-ecd7d32e5be8', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('05a60116-0cbd-4e9d-ae71-332085dfff6d', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('069df6cc-75b6-47d6-b7ae-11ca89188c47', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('06cfc7d1-21ed-4b60-9446-3c26064693b8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0825d7e3-5b95-43a0-80b8-a006edcd0c77', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('09732e42-9e89-4fd9-96bd-ecf4fd028d1d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:09:54', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0a27bad0-f7c6-41f4-986b-cefde5c013db', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:57:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0a3ea960-64c3-4441-ba60-f64a817363a2', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0b045b49-fcce-46f1-b660-0ba68f3a15a8', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0bdc004b-9742-4909-bab2-13b89431552e', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0c317ea5-bd8a-4af2-9af0-0a768761e752', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0c4c653d-15bc-44ae-9249-05738409046f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0c572154-21b4-49f4-9640-35dac444a1ab', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0d829a39-295f-40f9-8cc4-54aa7d2f5e17', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0e496516-d332-41d1-a414-9f079dae61e8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0f60d05d-a9d9-443b-a147-e6a78db83b87', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('0f9705ab-7709-4f1f-ba79-2e4fa6889c31', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:01:34', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('10f16122-ba7a-4dc6-b501-92f8bf11da8a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('11cea6e9-7ba8-435f-8f61-d9e5174e6bde', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:38:38', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1327df3d-5b93-4733-b217-aab6d5d926de', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('14263a25-dbf4-4fd3-a2fe-d970b2be97f9', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('14c616fa-4bec-4bbf-8ca6-f92dbe30b52e', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('156c3777-a5a2-4cf0-81ac-4521a295585e', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('15e9a823-acf1-435d-a72d-ba5401ad381e', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:22:30', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('16e15651-c882-4cb6-9729-6a4f2108c932', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('175c941b-ce43-488f-a446-b26eb586a590', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('18138656-519a-48a2-9972-f818da94ce0c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('18e9b3bf-d1a9-4f24-9751-7a203651f2ae', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('192e9ec0-0a96-48f0-9f36-a02bbe05d4d4', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('192ea030-7e42-47ad-abbc-cee6bc2b5877', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1931ac7b-a821-4e1d-b8be-82a9bbb693a2', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('19dc67b0-dcef-42ad-8b36-70e4e89031b4', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1afeef13-f767-4626-9d7d-89c5dd36d1ee', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:01:34', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1c06a521-9d85-4ecf-910d-16927bb317b7', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1c0f2d69-5c15-4221-bab4-874fc7155cad', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1c5efab8-1d9a-4ef1-b458-cba836018d5a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1cc504a9-9e32-4d52-a490-4b56c27da166', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1cca912c-e2c9-40e2-9ebe-fa0214028a79', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1e4946f5-82e1-48c0-94dc-b6f4472ae56b', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 16:54:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1e932d1d-fbb6-4018-9ea0-28b44f375e4f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1e934507-15a5-4ed5-a0e9-db86105edbab', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:22:30', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1ee8b5e5-45ab-4539-88a1-373a4429ac68', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:52:23', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1f4fb4a5-657e-41f7-976c-b06450f025a9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('1f798cc5-0f27-4db7-8d9e-aefe4225932e', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:01:34', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('214be676-cf7f-4744-a1a7-b42b8f546651', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2192b344-7351-4f75-b5e7-fe6f1d454a03', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('21e9cc4a-9688-4a69-8e16-1789b335eb86', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('223447a5-5878-4b62-bf07-166cd5b77d0a', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:15:09', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('22631c10-97f1-4f85-8dd1-0c2bd2f4af54', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2382a784-ea15-4bc0-a7f6-d81862dc4f1c', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:12:35', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2430f272-389b-4477-960c-df997cf2139e', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('24680d30-000f-449f-af7c-8d86720f08c4', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('24f189eb-eecc-4594-a6e4-1882f4695684', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('25515506-b90e-43a2-be53-107f4f990b82', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2566772f-afa3-452a-a73d-25f8c8c2c1cb', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('25ce7383-6dc3-44b2-8b59-42ac6fdc5f40', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:13', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('265d8297-5910-4f47-bc27-5c77e5143a8e', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:05:28', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('26e3bada-859a-4487-9e52-6ee7feea9d85', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:01:34', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('271e7224-ac9e-4e62-82a7-3ce4ad21fb8c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('272d9072-91b4-4fd3-94be-6a442db336ae', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 19:20:20', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('27a44a80-f0d5-4189-a81e-415071fb2385', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('27d56c96-cdb6-485e-8044-198c7a6ca290', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('28079a87-7078-4c47-95b7-317905aaa269', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('28f77666-375d-483f-a5a6-8ae5d9cebded', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:31', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('29159cce-eade-45f5-8270-621a80c750f7', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 19:20:20', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2a27072b-c8b7-4082-bff1-7da1e86a1179', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:10:44', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2aef66fd-4d04-49e8-8d11-891f8c8388da', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2b131728-305d-4e5e-ae26-4a0ea1995247', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:33:09', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2b6083a5-9ab9-4a32-b50f-af51ade4b665', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2cc09a8f-4fb7-488e-abce-660b774848b2', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ce1607c-6831-4120-9909-e737f0cca611', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:22:30', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2cee204c-0d85-498b-8ef1-8c8867948621', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ceebb06-d414-4581-b059-9dab478c6a74', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2d785c04-bc8f-4add-a000-d0b8b7807830', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:54:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2da803b5-ad73-4bd5-9e48-6043f76c61d0', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2defc2c4-cf8a-446d-8675-77cdbf21ffff', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 19:20:20', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2e5454fd-1485-4ffd-8962-4bdba56712b5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ed59332-d41f-4648-99b2-fe4948684c99', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ed5fc90-8cea-45c2-a4da-66c00b712565', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ef83d96-cff6-4784-b40c-9e4fa7ce98b9', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:31', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('2ff9f286-84b3-47b1-9139-a4081d2d8ef4', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3000e260-eda8-4af0-a970-00285f3d3ecf', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3034b6cb-42db-4f06-b66f-c453526512c1', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('312d9d0b-4c5d-4d57-93ed-f8223e960539', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:28:15', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3176448b-52c7-4b66-913b-b08e70f2754c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('318f7bc7-19da-4b38-ad48-9cc767ed7a4d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3199658f-e727-489a-b517-c35d59aa2356', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('319ad6db-8198-45f3-9b73-17eb286015ca', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:40:24', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('31d31821-4d20-4f79-bc05-e66c58735442', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('339034e7-0edf-48bf-b7f0-a001e318d288', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:31', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3395f35d-4595-4051-b649-98db55d75456', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('341c2ddd-0376-46c9-b069-1417448360af', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('34f076df-1e23-4af6-867e-063ab8557875', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:30:36', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('35253e0e-687f-4a90-aadd-01ac5a325b22', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:01:34', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('36853d17-56df-482d-ad55-7ad6ef3d5045', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('368aee20-f7fc-4f4d-90c0-a5cee8fa9f65', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('36a913e8-e658-486b-8dae-af4442b32182', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:00:18', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('37077a30-6b29-434f-b7e6-56bf53adc149', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:33:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('377dadb0-f828-4d0c-96bf-6d499cd35bc1', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:33:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('380837aa-ae09-48c4-a1c2-a81b7ffeff1c', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:15:10', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('39216218-1cb4-465f-80f8-e3d703289325', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('39d36291-9540-4bf8-8165-871151bc3745', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3a20f35b-f3a6-4f6b-bddf-09ab3f3f6b48', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:10:44', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3aab2f2f-7b02-42ec-b258-58334012bb51', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3ab31b7d-c4f3-4687-a561-d66633fbe010', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3b5976f8-ab3a-41b5-ab24-d5583fd96776', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3badd563-3399-480d-8550-c88dd8c4e9fb', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3bff7b3c-a99a-4288-87c6-9091dbdcbb59', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3c5a13f6-6af3-4b9b-b981-bbc81e99f5a0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3d4bc4d1-1678-4ab2-a826-d604725cfc6d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3d949c06-29fe-4664-9467-d2879c1581e1', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3d949f69-b05d-4ba4-9185-56d84d722131', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3da37c8d-dce0-4e23-a98e-198ff1d73ff9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3e339038-018c-4668-af7c-b435db86563b', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3f6228f4-d7ea-49fe-a971-8db65cbd2e8c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3f812d2d-6b20-40eb-8b20-933ad3ec6458', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('3fa304ee-fbc6-46ca-b27a-0bc2d2d0faee', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:32', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('404d0943-963d-4fa6-953f-d4a0153e30e3', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('40ce6f1a-56e4-4d0c-87d7-f5b62b850a20', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('41373333-29a2-41b8-a5c8-2db9cf841205', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:09:54', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('414352a2-2b07-414f-909f-55bf041f79b5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('41606e5e-a1a4-471f-abf4-ab01932113cc', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:28:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('41fd5efd-aa9b-402d-8f7e-e5dcd4f742c8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('41fd9c70-c0ee-4f05-b2ea-257dd71ab414', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('42431dc6-3985-45c6-b861-6f0fa266ec97', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('42574223-1be9-48ac-8f28-a86414e89c9f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4340a2f4-7147-4d64-93e5-4cf4661f3767', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4370e33d-5f05-4ec0-a9bb-0db7bb4e812d', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:30:36', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('438c1a89-d873-4125-baa6-cd27fb7263e6', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:02:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4426e37c-72bd-4e39-ae00-3fab661709fe', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:09:54', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('44d14434-cf27-4daf-adc5-539220aac3ed', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:05:28', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4506f920-e9e8-4070-b67d-243c5112aa5f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('461859d3-4168-4881-b83c-4cbe145fc985', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('46b5ba80-6c2f-41a1-b842-4728e7fd1da2', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4718f11e-81f2-4985-a280-fef55f0b2f6f', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('472b8f59-f048-4c58-9b4a-bbbb06e597af', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('48a6f92e-b8e8-4947-b8c0-74e5290486d0', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('48d8f9c6-ee57-4295-b4ed-ed2a5414a55a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4905a441-ed49-4f05-9d5a-08d582927547', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:25:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('49f69f8b-03a8-44bd-85dd-34956009a043', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:49:10', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4aa96fb6-d94e-4d08-961d-9fff816e05db', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4b861549-5312-4ee7-a1ce-959923f286b2', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:28:15', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4b973c38-c16a-4f3b-8a3d-e5d43ce9f080', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:11:32', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4bcc256f-3cce-402b-8d51-915d98986246', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:54:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4c4e0700-5c95-4234-9c9b-93a16e62af3a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4ca6e8e8-1973-4dac-b3eb-408b5761c515', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4d739f34-42f9-42a8-b2cc-65a20d8b1905', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4f0aa17a-b999-42eb-bf65-a7b7090cc9a2', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('4fa6b41d-47d8-433d-86e9-b5feb2ea96e0', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('50082ca3-a328-4f62-8eff-bba8c82c72f0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:25:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5052f83d-458b-482c-b883-ba3608b9a848', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('50eb6026-43be-4fe8-abe4-991afef48a71', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('51bb2da3-26ce-4de9-96eb-221560f39433', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5249cc9c-5aa2-4e2a-bd61-97abadecd328', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5295157e-5c91-4a6f-b69d-0efea1b3dd3a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('52b58d92-b2d5-458c-b0f7-f22480e74c2d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:05:28', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('52dc3e92-a365-40c9-bee3-6d28bda956a9', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('52e3af23-6ae1-49db-81e8-18162f6fb514', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5337a56c-f326-4420-b85c-228506b2cb59', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('53b9d037-8679-47bd-b872-67e01467d6fd', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5556f839-c911-4050-ad9d-edad53ad9659', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('57571087-8406-4191-966d-5d19a5771c9f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('576b19ba-9176-495b-a242-d47e53732384', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('57d49edd-1c19-4807-bbc0-aa733cac17b0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('58d467ef-c9e7-4aae-9d6a-82538f49546a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('593f1857-44e2-439d-a555-220e5ed26ac8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('59b5f8b9-2852-4018-82e2-13d1cdb3d5fe', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5b005538-0a30-4293-a023-d5f56751c87d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5bebbadf-ab99-4ce1-a305-8e954aad8528', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5d013770-5b61-4650-9c62-1a431bdaf452', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5d51a9ac-dbf1-4730-a862-dd62ee0f03da', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:31', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5dc9a85e-78e8-4d0f-b4b4-0145cc90b9ed', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5e07bd83-cf0b-44b3-bfac-6a33308c98f7', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5e5302da-fd6f-40f0-8b85-fa435a50c60f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:28:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5f10e4e9-34e0-409a-b956-e0ac6045f039', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5f9548cf-302d-46ef-8cdb-a0b55820d2b8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5f96bb5a-aaf5-48e7-a09b-bc958e0dcc83', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:51', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('5fce8214-b31f-49c9-aa7a-0cee6bbf5c7e', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6067111d-47d8-4321-bd9d-168915bd4249', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:42:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('60f95504-aa60-455d-823f-7b048216c1d1', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('622b1d21-5e78-4e57-85ba-973e2da8eb3c', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:57:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6336a8ba-ffe9-42ce-8b77-1c2270ad23f1', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('633f96e2-af73-41fb-bb97-aa5a60b2e955', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:33:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6415737a-64d3-4521-968b-53632ecd9182', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6461cde6-39c5-483a-8ff7-0390eb8347fe', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:42:31', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('652404e3-d109-48db-8d70-4a8414e07113', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6529feb1-af84-42e4-a391-4d1b8f33c8f0', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:40:24', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6584eb24-00dc-4252-83a1-872ce872ed38', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:00:18', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('66427546-bc97-4684-8242-df94ff3fbd44', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:06', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('66afcd52-5299-4df3-8f84-77fb2283eeee', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:30:36', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('66d14645-96b0-4b10-a099-194186683636', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6787edb8-c66b-44dd-9f75-84e2fb9b6c1c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('67a96e22-2777-4b19-8ab0-b3c891365a65', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('67e44f7c-6efa-45c2-bddc-bf042710c50f', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6800dd36-e143-4930-8bab-3d67bea6676a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:30:36', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('68025978-d9a6-44b6-b029-59a693246cab', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6812329b-8c0e-470c-877a-11049a2c15d5', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('69ae7255-e7ff-4ba1-ab63-d6f1a18890b0', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6a060852-b615-4a35-aae8-a807f9106517', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:57:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6a088f14-e95f-47bf-8aef-397cc3664c54', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6ad78552-b7f0-49ff-94cc-9a7c3fc65eac', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6b2576f2-de70-4a4c-80b6-474c70b3dd32', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:12:35', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6b8034af-9218-4949-ab08-53d844868e0a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6be53e99-c5f4-481e-9a77-3bb3b3837e02', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6c5d2ded-9f37-41a3-bfa6-363bfb62ad24', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6c6cbf7c-9fc9-44ad-9568-c00fa362bc09', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6cba719e-ffb7-4477-bb85-d7652e510e46', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:09:54', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6ccfe830-fd5e-4fb1-808b-908169c7a21d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6e1f060c-9e43-4006-a5af-c6e20cfa5c37', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6e9e3574-8038-446d-aa17-176cb58f1bfc', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6ebc5a3b-7c35-4027-b1e0-4fcf722ca89a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6ef390ab-cb0b-47dc-8284-f1462f1e484c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6f0b1fe7-84ed-4594-981d-a6329be41693', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:42:31', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('6f40bed6-538c-4397-8000-f3e9358ea1e0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('70434111-ab11-4bdd-8efa-3cc57a41c3cf', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:54:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('706aeb76-8c30-446b-b5c1-8e08007b7b77', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7071a772-55f7-4fa6-bc39-01185455dbbb', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('724a67fc-3d42-4c18-b088-3c9c06de5d8b', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('732393e9-ebb5-4cc3-aa79-812de6354ac7', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('734a5dbe-5312-4e53-8cc4-6dee43aa182b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('735426f6-de9b-41ac-b8d1-0f3cb262c317', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7389dd81-a983-4dd7-afd7-dd9dc518ccb0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('739c2452-61d2-4241-aefb-6a15a7b6b3f9', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:10:44', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('73c94c69-6110-4efe-83d0-0f4fb15344fa', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:33:09', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('73cd88d2-a222-4ac7-90b2-80a24b49630f', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:05:28', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('75530550-c7f0-49ce-868a-6ffc7dc6102d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('75692d55-60a5-4651-939f-ecde0bc51e20', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:12:35', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('75cb4515-b9cf-4d58-a740-59cd45e91e4c', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:42:31', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('75dcb1bc-7593-4d7c-a728-7a8b02c3c496', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('762a0ca9-009b-4fb1-a119-3b959489e5f6', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('765b87ec-b09c-47c3-9459-bdb0ec364323', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:09:54', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('78f47636-9a7b-433d-b232-3bfc8594ebd9', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7939163a-ecc5-486b-94c8-4e6b2b8a81c9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('793c54f6-0b68-4af4-b725-8de460bfb142', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('796621cf-d3b8-407c-bcbc-7cbf45709924', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('79d2a260-01d3-4abf-8e3b-6cf2c3fbfdee', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:25:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7b026200-6653-4ca8-a71b-6f9fc1882878', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7c94057c-bd96-4844-b601-eff4dde5906c', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:33:09', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7cc110cb-94b9-4164-be1a-e0d9684bffd7', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:10:44', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7d17c713-1d09-4c03-af75-65bfcd752c33', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7daf034e-a4a5-4f42-912a-37a9b3af2021', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7df9a886-94dd-4ebe-ac14-249d772f7713', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7e78c063-841e-40b0-b621-7d0ee9b055f0', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7f1ebab3-583b-426b-8f04-e6c64dd69e59', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('7f46cc56-8dba-443b-967e-d117218168f4', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('80288c4c-749b-42fa-a6d1-c1a0ceb64b62', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8031a82d-09df-45ad-8b41-5aec29c5b75c', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:33:09', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('806f84c3-b412-4c1d-aec3-9dc721f2d22d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8194275d-59aa-4cbb-95b3-f914aae64928', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('81bc29c3-84d1-410e-887a-8982654d68ae', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:42:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('81cda822-2814-4184-8eff-350af772ab50', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:57:49', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('81fb0ba6-25eb-45e7-a741-8cff153db25d', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('82eca99a-30df-4d04-a28d-e869607aa3a4', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('83bc1328-f537-4cc1-a581-8b6a61129c88', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('83c7ad8f-c56d-45c2-946b-b14c6d45ce77', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:38:38', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8467e2a0-cc16-4012-9295-a18b6f8f9d91', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:13', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('84b5f059-6953-4c1d-b6af-81309ca0187d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('84ee6bd7-8605-4b2a-912a-45dc3a9755d2', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('853576a4-f23a-4cd4-99c6-a620a49ab0d5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:40:24', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('85b25620-8238-4bd8-9d77-5c0afcf9517a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('85d0b30a-eeb9-4fd2-b0ab-a23aa3000435', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8756b1d5-80a2-4d49-bc34-0fbe12e66ae5', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('875c3e5c-64ab-434b-8573-35f7daae518a', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:51', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('88ce4499-8ff7-4a6f-b5b5-2a24d9da17df', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('88d622c4-9737-4b44-9b2f-7f8f3c367ac8', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:38:38', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('88e84b82-a5de-4aa2-8878-57e03f04d706', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('89ded2da-0d79-4af2-a0f1-50f41400c519', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:00:18', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8a004d08-f80e-45a2-8849-b4de1b4fbf13', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8c281be1-fc5e-498f-8090-c2adad352a45', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:38:38', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8ca9af64-a47f-4030-ad80-03121acdfd41', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:01:34', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8d78e7d5-7d63-4882-a4b1-f5aa21e06ae3', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8e3f7556-ba1d-4a3e-b3d7-577920963a71', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:42:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8ec1795e-f50c-4b23-9142-7e0aec0bf10f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8ed62df1-e375-47ea-953c-860df0d48f62', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:40:24', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8f361b84-2a3d-45e0-833f-849c4ad110c1', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8f419675-f4b7-4742-970d-7e269fd5c74d', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8f5aaff7-9dc7-4a0d-87ad-8604754da6c5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8f6f4bf5-0d57-4fef-bcd4-39b900fbe278', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('8fc4daa7-b995-41ea-86b0-a1751ae71dd0', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:00:18', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9031715a-36d9-4d59-8e6e-5678ba60552d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('908f0ab9-aa7c-4c13-837d-3e9164806f0f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('90b1e25a-674d-4b98-8147-c98be9837a84', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('90f12f94-bdc9-46ef-99e3-4ec7cf21613b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('910ce476-9bb9-4c2d-8fe3-6e18442880c5', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('91ef33af-5a6d-46f8-8451-0f9278ce2143', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('92ac1258-77fb-468d-88ba-6492e8819f9f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('930e02b7-64fb-4b84-9469-41283dcc027a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:00:18', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('934eb0d0-329b-4ffc-a20a-291595ee27b0', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('93c97eb8-98d7-4236-9259-804d7d70f633', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('940c5109-b519-4b7e-a9a7-8f2c66271e1f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9497c1d8-7d9d-4e39-a964-c2235fe9efeb', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('95fca54d-f406-4ada-b6f5-7a1720004bd3', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('963123ed-a46a-49d4-ae9b-9e23a23c7ac3', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9813f8b7-9b0f-43b7-927d-e78f486ec987', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('98d4597b-b491-485b-8bac-168e5fc746ec', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:32', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('99ad1c28-e62f-4073-ab2e-3326f16ff08c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:54:49', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('99d40625-6ae0-43b3-afd7-ea3f77ded5b0', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9a77efab-04be-46f2-a66f-3ed29efd324c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9a7f8642-d022-4d8d-ab41-89eadec5f9db', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9a7f8d78-6079-4244-8a44-4a4c399f7cb7', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9a99c0df-229d-4520-b218-ef565fc7dcfd', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9ae3e47e-d277-46c3-876b-dd80bb36a441', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9b6fc950-1fe1-4520-bfcb-9f87e48a4936', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 19:20:20', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9bede327-566b-4cf9-b7e0-bad2be6a0de1', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:49:10', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9c377e45-331a-4d9a-b085-711cd7f0b0b1', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9c93582c-861e-410e-93ce-278e49951950', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9cbff7d7-a949-44e5-b700-649da5ce03af', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 19:20:20', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9cfb0ee1-43fe-4192-af2b-c5cfbd964d76', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9d141747-063e-4164-8c71-2e867573a08c', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9d1d5f06-2e5c-48d1-b826-8c0f1aa7d702', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9daf5e23-71d1-4f7c-b62f-9f0ac60a8b24', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9df3af7b-6c99-4664-9ca4-b91314e8533b', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9f21c447-5f28-4c5c-a140-c6dc3aa233fe', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('9f9fc14f-535e-40b6-9f46-b68336bee29d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a0717628-3963-4855-9680-989e6257b167', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a0f7bc06-bf5e-40dc-84b5-3d328106e104', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a180f20f-ab9c-44ea-b4da-8276e68f1209', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:33:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a19f0c40-5aa1-48fd-80a5-f3d9f526a24b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a243fef6-1708-4c00-80c0-fa13f7e8b64b', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a28de5b4-b2d8-4dc1-adfc-91f3d6304957', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:40:24', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a375e7f8-4261-4595-b5cb-020cab189370', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a39fb36b-d87c-44a4-a8ec-be7d7bfdd6d6', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:57:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a3a4f200-8770-4598-a84a-e672b533a2c2', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:54:15', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a3b2952b-4304-472a-91c5-663a60065304', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a514ff32-f214-4bb6-a4bc-10fba6fa4ef1', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a5390202-d8a0-445b-8d38-6b04b399eb6b', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a5b2c27c-a882-47d5-aeb5-2e8b8c4aa71e', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:56:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a5deb426-67ec-4837-a2e7-294b6e40f1c2', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:38:38', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a5eb1860-1e9c-4fa3-b4df-cd40e87cef1e', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:10:44', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a60bc694-9201-41c5-bff5-8e77e82f23b8', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:25:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a6499e46-9bd7-424a-b351-9696d599f68c', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a660c71c-0028-4567-96f2-5b514a425614', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:40:24', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a67f17c5-b2b9-4427-85a1-0f89b84fa0f6', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a6bfe529-6304-46da-8576-0ce96539dd08', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a7864539-6921-42e1-8ca0-89723f4eb8be', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a834aaa6-c191-4ff4-b0b4-46e613aafee4', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a8e2fc6e-c3a0-4d22-9038-1c4fa3ebb85a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a8fa8785-8b39-4464-bc70-d092bf215d40', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('a927c5f6-3fad-4b64-b172-02963c9fe6d8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:09:54', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aa0093de-55b1-44bb-972c-8ea62a1d4625', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:42:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aa1cea41-f9ab-4aa4-b471-62cfcb4e7b24', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aa1d1576-0ae5-4a9e-be3f-a959d934776a', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:17:05', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aa29fbb6-67a4-45d0-93dd-4df6a465a98c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aa66b07a-6184-4e18-a94d-2f3b2a274b03', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ab1528d7-00c2-49da-b7f2-4b85b2a158b1', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ab670e88-8830-4589-8abc-721b123800b7', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ab7d94e9-5b87-49a3-825e-3e2a03f54197', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:28:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ab9aaaa1-adad-4b18-9be3-a3148add226d', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ac431996-d045-44c6-97fd-950173a42f99', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ac55ce60-5476-48c8-9b96-e324729e39f9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ac71a6f6-2b97-4d43-be01-c1e1877c59fb', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:28:15', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('acb446f7-bf6a-4951-a817-d3834fc3f654', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ad505bed-7a81-4250-9f82-88aae34fe007', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ad640f13-c102-4856-8cb0-c287748b3743', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ae28302d-fb6c-4c1b-b81c-3fca26226aeb', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aef703b2-f409-445b-82d6-14f504c9c108', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:25:11', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('af22c4d1-026b-4ea6-8f56-12405da16630', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:26:13', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('af60a7ad-7b34-41a9-981f-1b9c1751d898', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('af7b4ffa-922b-40c8-bb12-85f700bb4514', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aff26033-bfa9-4583-b35c-449e3171581d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('aff581e5-d0d8-489a-90b6-c74a7907a673', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b0480d04-84a3-4601-b8fd-6b2aef0426b1', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b0777d02-8970-456c-a092-927eb1c8adfb', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b16ce8a2-a36a-4b8b-a631-9bb3acb946f2', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:42:31', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b19a9d5a-6598-424b-96fd-e5e3b04d8f6b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b1a55c99-8ced-449c-b43c-6becef35d384', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:30:36', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b255a8c7-252f-48a0-90a8-6acb464e0fde', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b25d1e92-acb7-457b-ad40-e41c3cefcd0a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:42:26', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b2f92e5a-bc90-4958-9dca-e06ba5fc8c12', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b36fdc56-dbea-44a4-b68e-9964a79ae0c4', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:52:23', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b38ac691-d905-4041-b11f-92868f580ac5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b3ff99b9-43a9-4c33-b191-237b2b52d599', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b4c8b8c6-db79-4c92-9f37-3286f1868661', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b5702073-ca3e-449d-893e-8fe6b086bc19', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b5e36b6b-2007-4fac-8561-64e4ff411e24', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:11:32', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b7969f31-f80a-495a-a4de-105162e2fa15', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:17:05', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b79c05dd-6f7c-421a-bb41-6e671d05a57f', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:42:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b7d0b53d-3081-4a48-9d6b-1467d7da2f73', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b88e279c-a121-4169-8963-2b737854d166', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b8e8e0ab-1c3a-4d65-ac3a-38289fb25063', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b9174fa3-6f9e-445f-912c-5d4f8a746120', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:28:15', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b9668b8b-ea5a-4b5c-ba68-be97a83db5d0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('b998deda-0477-42b0-b53a-d82e2764626a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bad0e408-9680-40b5-bdd2-24596566ee98', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bae52b67-f116-4a6f-98c9-0ea95496d8a5', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:02:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bb7771da-5e88-451d-89b9-f05acb5f34c4', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:00:18', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bb8294b1-bfe6-462d-80fe-3fe081b552f5', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bbf9b70f-5692-45c0-8543-7259ea4d14a2', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:05:28', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bc3b54ee-a8e1-4745-80ae-0541adacaaae', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bc7e954f-30ab-44c6-b86b-1b17342f2e67', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bceec290-0876-40fb-b80e-bb48c47166f1', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:54:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bd16658d-5580-4cc2-b30c-c22281266719', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bd2d9a15-80a8-47b5-b1ea-24e71ac9f25c', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bd4136cd-647a-42fd-a38c-8d99ad25e6bb', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bd528a1c-054f-42be-97fc-f020f14bdc88', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:06:12', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bda3228d-6389-47b3-9a8b-a35059821f9d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('be38f9f4-8fa3-49e3-89dd-9867ee4c1d51', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bf3eee62-a405-4fd6-b16e-46bf685ba263', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bf65319b-bf3b-45f7-89ba-285d9c71ba27', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 19:20:20', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bfa45edf-e62a-495d-9c96-023cbca01b11', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bfa91257-1dab-499a-bf08-ee296624417a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:03:39', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('bfe73a59-0bf6-418b-b00d-2663653134ee', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c144eef6-3969-4078-87c1-7feeb3ba4274', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:30:36', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c15af495-d478-4d4e-b650-8a8452516202', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:00:09', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c1a76ba1-f330-42d4-b085-05231c48f050', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c1e6f945-74dc-4cdb-8aa8-ee07d17a1681', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:38:38', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c20d6b7e-40e9-4f2b-8e1f-d8b92df6f3b8', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:22:30', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c21596fc-bf5d-425a-a5bb-514dd32bda15', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c2312d67-639a-4b55-b36a-9a479db95f85', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c238a039-42dc-413d-9b4f-bb7dd67def50', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:42:26', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c411964e-d72b-4def-9593-db3b455e5101', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c417a522-988f-4a62-94ab-d66c1be8d5d3', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:12:35', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c48712d2-2b61-4496-a252-022197d2671a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:25:11', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c4985582-46be-4fa6-9589-6fb9aa7605c4', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c4dee071-0192-4404-9694-3a47d54a52a0', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:25:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c530bcb5-0627-49ff-b76c-6f79ba3a8d0d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c550237a-2443-4a52-afc5-99fef9c031b5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:22:30', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c552175a-c70d-4e9d-a3aa-fe091b3614b9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:48:59', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c5b14756-f2ea-4d60-a750-ffcf478d2d65', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:54:49', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c5bf1b93-cde3-47bf-bc48-169f6f22c2a8', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:01:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c5dba6bb-16b2-4fc7-bbc9-630f2af9649c', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:54:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c5f0bbcd-e62d-49b8-9c1d-4490bc5c76d8', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c691ef6d-2cc8-42ae-bcc0-87fda317e60e', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:42:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c749ebdc-63a0-4ca9-83bd-c05b67e34e2c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:30:36', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c7567a29-5c26-435a-9b49-519ea7bde85e', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c76094a6-d851-4d21-a2e8-b78645b1ab1e', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:42:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c76d75d6-3b2c-4832-9bbc-dce5a51879b3', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c78fe65e-f613-42f1-8462-392ac033d8c6', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c79b97c9-aec0-48f6-aa95-0d7ed4297270', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c80a6a7d-3c4c-4e4c-9b1e-3f441d5003f3', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c83ae9be-c665-45d1-a7db-e4604f79e637', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('c96488de-13ef-459d-87ca-01f1c056075e', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ca2e424c-5ae9-4cc6-b15b-605f55263cf7', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:12:35', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cae220e8-dd57-4dee-b879-4142c6ce8725', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:10:44', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('caf8b2f8-11b0-4c39-86bc-82d1aa9bd7eb', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 17:02:46', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cb6b37a5-620e-49de-a475-d9a353e00bfe', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:30:36', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cc835247-c119-4efb-b551-fbaea6d417f5', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ccb8a4cb-886d-42bf-9f25-28c65e7a527f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:15:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ccc3e84c-f86f-41f0-8aad-71788c5c9d69', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ce380302-aca9-4f66-bfea-c469d677819a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ceb506e5-f672-4cd5-9257-fe89bbdfb023', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:01:34', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cebce41c-fd40-49bc-8541-c4bc373e6789', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:00:09', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ced61bd2-9781-480c-9771-4eadc1ae70ac', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:10:44', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cf5b8872-984c-4aad-b028-0c695c98ecfc', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('cfd283f5-ee51-4636-8273-9376224d5273', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:40:24', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d03ec960-f4ba-4c2d-a9c1-5b112dd9ac91', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:05:28', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d0a33e1c-4335-43c8-b49d-ace12e5480ad', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d0adfebf-380a-4a52-b033-9f02acec1cde', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 17:06:12', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d0f313a6-36ba-4dc1-8962-680788c723bf', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d1957186-f317-4189-8c21-7a1533271c5c', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d2778f83-ddf6-45f6-b41f-6a0802398e0d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d29514c9-dd10-4022-8b92-d59b9084c3e5', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d2c30bf2-6a7e-4321-bdd5-024907841939', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d3205c43-68f5-4071-9fb4-383be7b58e68', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:02:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d3a2897c-1aab-4f7c-bb40-a1e6e4f7215b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d3ce31b7-e285-4bca-882e-30372c8ee740', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:05:28', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d46b9cdb-6444-4f74-aeb3-50ad2bc484d0', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:12:04', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d4c161ef-f7ea-436b-b56a-6fedbcd59411', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d539b0b0-2c55-465a-be86-81a98889c55c', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 17:02:46', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d5b36801-51bd-4a53-a620-9fce1ad6292b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d5b91f85-7553-43fb-b399-5818c96ad703', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d753d16f-a973-42ba-bee2-3d08e28f842d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d85d1e87-9441-4961-bddb-3be3632344a0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d901f354-0347-4ea9-86c4-47089816d45c', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:25:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d9ea53ac-d73f-4e46-b99e-79033d71b978', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:52:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('d9eb9ba3-0fd7-47fb-9385-ce9d6847fe40', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:11', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dae60af9-c009-4289-a4bd-1a4ceb9d605e', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 19:20:20', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('db1ca07a-2523-4523-a851-d715233d645a', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:06', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('db96616a-d3b1-4c57-b84b-17740309bfba', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:01:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dc421c14-bc1e-46db-972c-cde367c8be5c', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dcf08ad7-5ef4-4d15-8b14-3cac98f02ce4', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dd204b00-cc06-441e-809b-e9d11200c51b', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:01:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dd474cee-5809-4864-b32a-1f89344a7172', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dd74f197-f9d3-4546-a760-36d87dc3fe20', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:54:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('de0e2be0-5dfd-4484-998f-b1cd07853a30', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('de13f8da-9d64-4116-a431-45c14b0eef09', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 16:57:49', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('de1ad35b-89ca-4b99-ab7e-ea2777394581', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:49:10', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('de635033-fa9d-47dc-8df8-620ee1f3e2b8', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:43:48', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('de871c74-c842-4343-891c-3c144ce17585', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:00:18', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('decbc681-7cb1-4b13-a9ee-0806f620de28', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('dedc9df1-7794-4d93-935b-ee1c09101f06', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('df1f376e-ce44-4966-b343-3a60bca3fc02', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:00:18', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('df67ee9b-a59b-4438-8ff4-cbbc2dab6cc9', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:12:35', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e0e49b64-2e13-4c08-b62f-3152b73db6ad', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:27:58', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e36a58a6-2e2e-4c6b-b597-cbb85dc6f019', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:41:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e43bfdd9-7654-4328-a4f9-4db83ab62979', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-03 00:26:13', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e484aeaa-8f0f-45aa-b31c-173d58a2f83b', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:10:44', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e51a8dd5-8750-45ba-8acf-bd0cf62ca406', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:05:28', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e5dcd6b1-5a50-49bc-9477-77a1dfc92b95', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:40:24', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e6cfe19a-63c4-445f-9b64-59038fcc8b6b', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e73a1581-18a5-4347-92f2-8064bde25b5d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e81aee37-404b-4359-823b-4840a89dd262', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e88e368d-22e1-4d1f-b90a-344420862a73', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 21:15:10', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e8c255b6-fe30-4549-97dd-79c9cfd4144a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('e8def32e-44c8-4368-b89f-5bbcc3bee838', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:43:48', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ea1c1a08-d576-40e4-bb8c-24e4a87fe135', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:09:54', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ea20954d-2f54-4563-89cd-fd7ddd90b4ff', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:22:30', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('eb262bc9-be2e-4bd5-bb4c-94bb75258c7c', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('eb359895-8f14-414d-81b2-4b8675d7c4a7', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ebd467d4-b289-45e7-9492-6f45a6c73e78', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:44:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ecf3971c-a75d-4ded-aebb-62d64b0864e1', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:22:30', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ed501b86-4210-4958-80af-ec9eda0a6dba', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 21:17:05', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ed89bd6f-c554-44e8-adcb-52b2feb21919', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:12:04', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('edd1de94-78af-4f66-9a3e-025d587133e7', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:11:32', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('edd9b2b6-1ffd-4837-8832-51bb6c72e4d2', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-03 00:31:26', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ede12004-be91-4522-b13b-77f232c0c09a', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:42:26', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ee24339e-1bb6-448b-9b3a-6d5b2e5c969b', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 16:57:49', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f00e5c28-eeff-49bb-9f32-9da6ecff5a07', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f09272f5-9a20-4576-a6c1-e8cd21f43066', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:42:31', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f0d5782c-0780-4eec-8480-5de0a6b4b45a', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f1a438a3-348f-4105-a33e-95e64c45bd33', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 17:28:15', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f22e3b17-a7e5-4e36-987d-ee9585c57393', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 22:02:00', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f25f0439-a8b3-4ae6-8eea-5ef36b5df59a', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 17:22:30', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f296dd95-2ecc-4cdc-a47a-768df8f8a3b9', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f370971d-a01a-4fe8-8d36-476f4c6ea441', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f3e8983d-8ce0-4932-9722-4851191e34d4', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 21:12:04', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f5fd49c0-3273-4845-9565-d105f22e8d20', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f791e128-de2b-4d9c-97a7-a37cc1896810', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:57:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f79dbb4d-cfdb-4fb4-b1bb-97b2c6d613f2', '', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-04 20:44:11', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f94891fa-00f7-4ec5-9f7c-a8466be840f9', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:57:49', NULL, 1, 202);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('f9b33fdd-a95c-4f9a-ac66-50c465a07224', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:55:29', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fa00efc9-2b9f-410b-b667-5713bed9cfa2', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:00', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('faad360e-fca1-4cef-a89d-893f72826c49', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-02 21:55:29', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fb74f459-7169-4005-be06-9203c0fb8b8d', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:48:59', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fbd89dbf-59b7-47fd-90e5-2689028d0e1f', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:44:51', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fc026424-3ea7-4293-835f-9c5121ec868d', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:38:38', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fc6a392d-ca1c-4717-9383-2db872c36515', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 16:53:22', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fcb2bd15-3794-46e7-9d44-253fe4623f32', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-02 21:52:58', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fce5e7ca-a12f-4797-a1fc-774eb0ca404f', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:38:38', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fcfb658e-18cf-417e-8ac4-2ff9f12bfdbe', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-02 22:02:55', NULL, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fd51a91a-4777-4332-88bf-da1c0753cf07', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fdac30dc-2d38-4b4d-9c62-e607f9c15bab', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 17:12:35', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fdf2ebb2-6619-4337-ba91-5e2371663f6a', 'https://api.indexnow.org/indexnow', 'mbalashiha.ru', 'http://localhost:5000', 'uslugi-mastera-v-balashihe', '2024-01-03 00:44:52', 1, NULL, NULL);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fe1e3b74-4977-44e5-bf5a-5192e52a6b51', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:52:23', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('fe8bf975-5d63-4599-a879-75da490c9894', 'https://yandex.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 20:53:06', NULL, 1, 200);
INSERT IGNORE INTO `index_now_request` (`uuid`, `apiUrl`, `siteHost`, `siteOrigin`, `url`, `created`, `revalidated`, `indexNowSended`, `indexNowStatus`) VALUES
	('ff763994-1784-4ebc-826b-96b35b644bb0', 'https://www.bing.com/indexnow', 'mbalashiha.ru', 'https://mbalashiha.ru', 'uslugi-mastera-v-balashihe/kak-vstavit-schyotchiki-yandex-metrika-na-sajt-s-next-js', '2024-01-04 16:56:13', NULL, 1, 200);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
