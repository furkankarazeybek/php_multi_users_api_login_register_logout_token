-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 23 Ağu 2022, 04:16:56
-- Sunucu sürümü: 5.7.23
-- PHP Sürümü: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `tasksdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblsessions`
--

DROP TABLE IF EXISTS `tblsessions`;
CREATE TABLE IF NOT EXISTS `tblsessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Session ID',
  `userid` bigint(20) NOT NULL COMMENT 'User ID',
  `accesstoken` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Access Token',
  `accesstokenexpiry` datetime NOT NULL COMMENT 'Access Token Expiry Date/Time',
  `refreshtoken` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Refresh Token',
  `refreshtokenexpiry` datetime NOT NULL COMMENT 'Refresh Token Expiry Date/Time',
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstoken` (`accesstoken`),
  UNIQUE KEY `refreshtoken` (`refreshtoken`),
  KEY `sessionuserid_fk` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tblsessions`
--

INSERT INTO `tblsessions` (`id`, `userid`, `accesstoken`, `accesstokenexpiry`, `refreshtoken`, `refreshtokenexpiry`) VALUES
(48, 31, 'NzZlYmU1YzEyZjE0ZWM3MDNjZTMzOTlmMmMwZWU3ZGIzZDJkMmIzZTM2MDFiN2ViMTY2MTIyODE0Nw==', '2022-08-23 07:35:47', 'MzRjNGYyMThiMmE5NjJjNGUxMDdkZWJjZmY5ODlkZGNjMjk3MTBiYTM1Y2ZiNmZkMTY2MTIyODE0Nw==', '2022-09-06 07:15:47'),
(49, 31, 'NjQzZTJlNmU4YjgxNjJlNWI2MGY2MzAyMGJmYmFjNWJjZGZjNDU5MjVlMDE0YTdhMTY2MTIyODE1NQ==', '2022-08-23 07:35:55', 'ZTkyYmZjZmNkZmEyNTU2YTVjNDg1ZjRiNTAwNjJkODcwZjI2Yjk3ZjY4MDkwYjliMTY2MTIyODE1NQ==', '2022-09-06 07:15:55'),
(50, 30, 'MmY2NjY5YmM4NGEzMTVjNjk1MmY1NTg3OWJhMzUwZDJmMWUwMTI0ZmRhYmIyYWEwMTY2MTIyODE2Nw==', '2022-08-23 07:36:07', 'ZTE2YWM1MmFhMTFmNzU2MzcxNjM4MWNkMGQwZGRhNmQzZDhiYzNhMGFhN2EzZjMzMTY2MTIyODE2Nw==', '2022-09-06 07:16:07'),
(51, 30, 'MTA2OTg5NmNiYzE5OGJhNTI4NjNjYWFiMWQwM2YzMDFkNmJiOGQ2YmNjNDVlMTkzMTY2MTIyODE3MA==', '2022-08-23 07:36:10', 'OWI5N2M2MjYyNDU0MGEzMGYzMjQxNDFkMDZiNTQ3ZDc3NmFiNzU4MDMwZWM2NjY3MTY2MTIyODE3MA==', '2022-09-06 07:16:10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
CREATE TABLE IF NOT EXISTS `tblusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `fullname` varchar(255) NOT NULL COMMENT 'User Full Name',
  `username` varchar(255) NOT NULL COMMENT 'Username',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Password',
  `usertype` varchar(50) NOT NULL,
  `useractive` enum('N','Y') NOT NULL DEFAULT 'Y' COMMENT 'Is User Active',
  `loginattempts` int(1) NOT NULL DEFAULT '0' COMMENT 'Attempts to Log in',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `usertype` (`usertype`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `tblusers`
--

INSERT INTO `tblusers` (`id`, `fullname`, `username`, `password`, `usertype`, `useractive`, `loginattempts`) VALUES
(28, 'Furkan', 'Furkan1', '$2y$10$gzaTk2PFtI/fPScYHissG.TlxUc4xeyWzvUpYXblJ5fTRSXE0MrmK', 'admin', 'Y', 0),
(29, 'Furkan', 'Furkan2', '$2y$10$ovnJpy8E5s8C.Lyh2W00o.Tn7CagTO1sMVQB8L8GAp43Hu8ssGW16', 'admin', 'Y', 0),
(30, 'Furkan', 'Furkan3', '$2y$10$K0eMaWclLGbt2ynB5nfnuOeUClfF/ehc9WkfX4a0LWKInIGnZtBIi', 'admin', 'Y', 0),
(31, 'Furkan', 'Furkan4', '$2y$10$M3zndKBHInAivTe0i29RduhacNZh//MbIknf5dgRSdh3VD3KRt6Qa', 'user', 'Y', 0);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `tblsessions`
--
ALTER TABLE `tblsessions`
  ADD CONSTRAINT `sessionuserid_fk` FOREIGN KEY (`userid`) REFERENCES `tblusers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
