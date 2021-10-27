-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.29-log - MySQL Community Server (GPL)
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных dbwork
CREATE DATABASE IF NOT EXISTS `dbwork` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;
USE `dbwork`;

-- Дамп структуры для таблица dbwork.customers
CREATE TABLE IF NOT EXISTS `customers` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `custumerId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`custumerId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица dbwork.orderitems
CREATE TABLE IF NOT EXISTS `orderitems` (
  `orderitensId` int(11) NOT NULL AUTO_INCREMENT,
  `product` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summ` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`orderitensId`) USING BTREE,
  KEY `FK_orderitems_products` (`product`),
  KEY `FK_orderitems_orders` (`order`),
  CONSTRAINT `FK_orderitems_orders` FOREIGN KEY (`order`) REFERENCES `orders` (`orderId`),
  CONSTRAINT `FK_orderitems_products` FOREIGN KEY (`product`) REFERENCES `products` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица dbwork.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `seller` int(11) NOT NULL,
  `dateSale` datetime DEFAULT NULL,
  `isPaid` set('yes','no') COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`orderId`) USING BTREE,
  KEY `FK_orders_customers` (`seller`) USING BTREE,
  CONSTRAINT `FK_orders_customers` FOREIGN KEY (`seller`) REFERENCES `customers` (`custumerId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица dbwork.products
CREATE TABLE IF NOT EXISTS `products` (
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `manufacturer` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,6) NOT NULL DEFAULT '0.000000',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `dateCreate` datetime NOT NULL,
  `dateUpdate` datetime DEFAULT NULL,
  `summ` int(11) DEFAULT NULL,
  `userWhoAdd` int(11) NOT NULL,
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`productId`) USING BTREE,
  UNIQUE KEY `name` (`name`),
  KEY `userWhoAdd` (`userWhoAdd`),
  CONSTRAINT `FK_products_users` FOREIGN KEY (`userWhoAdd`) REFERENCES `users` (`custumerId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица dbwork.users
CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondName` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` set('admin','manager','salesman') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custumerId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`custumerId`) USING BTREE,
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Экспортируемые данные не выделены.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
