/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.14-MariaDB : Database - wkvapestore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`wkvapestore` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `wkvapestore`;

/*Table structure for table `carts` */

DROP TABLE IF EXISTS `carts`;

CREATE TABLE `carts` (
  `id_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_customer` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL,
  `pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ongkir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ekspedisi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomor_resi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  UNIQUE KEY `carts_id_order_unique` (`id_order`),
  KEY `carts_id_customer_foreign` (`id_customer`),
  CONSTRAINT `carts_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id_customer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `carts` */

insert  into `carts`(`id_order`,`id_customer`,`status`,`pdf`,`ongkir`,`ekspedisi`,`nomor_resi`,`created_at`,`updated_at`) values 
('HDSXXPDOC5',2,2,'https://app.sandbox.midtrans.com/snap/v1/transactions/1771b629-c26a-41bb-87ac-106bc3ae4c34/pdf','140000','POS - Express Next Day Barang - 1 HARI|0|0',NULL,'2021-11-27 20:30:27','2021-11-27 20:33:16'),
('INBDUAXXX4',1,1,NULL,NULL,NULL,NULL,'2021-11-28 10:24:37','2021-11-28 10:24:37'),
('YJT80CT2BR',1,2,'https://app.sandbox.midtrans.com/snap/v1/transactions/2445db1b-b729-4873-be77-a0f772bd5e88/pdf','20000','JNE - Layanan Reguler - 1-2 HARI',NULL,'2021-11-27 20:30:15','2021-11-27 20:55:50');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `categories` */

insert  into `categories`(`id`,`nama_kategori`) values 
(1,'Betul');

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id_customer` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `customers_username_unique` (`username`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_no_hp_unique` (`no_hp`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `customers` */

insert  into `customers`(`id_customer`,`name`,`username`,`email`,`no_hp`,`password`) values 
(1,'Bagoes Anugrah Putra Dwitanto','Barah','barah@yahoo.com','087802472524','$2y$10$9cmGA/hIdVUxiRuit2rKTuLZT0Yt.e5CqEsBMkf3Vuw/X3Q7kSuOK'),
(2,'barah2','barah2','BAGOESANUGRAH69@GMAIL.COM','087128371231','$2y$10$6hOuWjh7.jo/JqnfuuW8weU2hvvsUfZEmC/9cAPXBS3laYa5RI7L6');

/*Table structure for table `detail_orders` */

DROP TABLE IF EXISTS `detail_orders`;

CREATE TABLE `detail_orders` (
  `id_detail_order` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_order`),
  KEY `detail_orders_id_product_foreign` (`id_product`),
  KEY `detail_orders_id_order_foreign` (`id_order`),
  CONSTRAINT `detail_orders_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `carts` (`id_order`) ON UPDATE CASCADE,
  CONSTRAINT `detail_orders_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `detail_orders` */

insert  into `detail_orders`(`id_detail_order`,`id_order`,`id_product`,`quantity`) values 
(7,'HDSXXPDOC5',2,9),
(8,'YJT80CT2BR',1,1),
(9,'INBDUAXXX4',2,1),
(10,'INBDUAXXX4',1,1);

/*Table structure for table `detail_pembelians` */

DROP TABLE IF EXISTS `detail_pembelians`;

CREATE TABLE `detail_pembelians` (
  `id_detail_pembelian` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_pembelian` int(10) unsigned DEFAULT NULL,
  `id_product` int(10) unsigned NOT NULL,
  `harga` double NOT NULL,
  `jumlah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_pembelian`),
  KEY `detail_pembelians_id_pembelian_foreign` (`id_pembelian`),
  KEY `detail_pembelians_id_product_foreign` (`id_product`),
  CONSTRAINT `detail_pembelians_id_pembelian_foreign` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelians` (`id_pembelian`),
  CONSTRAINT `detail_pembelians_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `detail_pembelians` */

insert  into `detail_pembelians`(`id_detail_pembelian`,`id_pembelian`,`id_product`,`harga`,`jumlah`,`status`) values 
('HIW0TET6TE',1,1,20000,'10',2);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(12,'2014_10_12_000000_create_users_table',1),
(13,'2019_12_14_000001_create_personal_access_tokens_table',1),
(14,'2021_09_28_035016_create_customers_table',1),
(15,'2021_09_29_034253_create_categories_table',1),
(16,'2021_09_29_035005_create_products_table',1),
(17,'2021_09_30_045626_create_carts_table',1),
(18,'2021_10_05_152907_create_detail_orders_table',1),
(19,'2021_10_05_153131_create_shipping_addresses_table',1),
(20,'2021_10_26_115533_create_suppliers_table',1),
(21,'2021_10_26_120748_create_pembelians_table',1),
(22,'2021_10_26_122436_create_detail_pembelians_table',1);

/*Table structure for table `pembelians` */

DROP TABLE IF EXISTS `pembelians`;

CREATE TABLE `pembelians` (
  `id_pembelian` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_supplier` int(10) unsigned NOT NULL,
  `id_user` bigint(20) unsigned NOT NULL,
  `no_faktur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `pembelians_id_supplier_foreign` (`id_supplier`),
  KEY `pembelians_id_user_foreign` (`id_user`),
  CONSTRAINT `pembelians_id_supplier_foreign` FOREIGN KEY (`id_supplier`) REFERENCES `suppliers` (`id_supplier`),
  CONSTRAINT `pembelians_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pembelians` */

insert  into `pembelians`(`id_pembelian`,`id_supplier`,`id_user`,`no_faktur`,`tanggal`) values 
(1,1,1,'3434343','2021-11-15');

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id_product` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int(10) unsigned NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga` double NOT NULL,
  `jumlah` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `berat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deskripsi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gambar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_product`),
  KEY `products_id_kategori_foreign` (`id_kategori`),
  CONSTRAINT `products_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `products` */

insert  into `products`(`id_product`,`id_kategori`,`nama_barang`,`harga`,`jumlah`,`berat`,`deskripsi`,`gambar`) values 
(1,1,'Bebas',200000,'10','1500','<div>sasa</div>','post-images/52c409f1571f500e28f490a302a12540.jpg|post-images/7cac11e2f46ed46c339ec3d569853759.jpg'),
(2,1,'Itzy',20000,'10','1500','<div>sadadad</div>','post-images/3d8e03e8b133b16f13a586f0c01b6866.jpg|post-images/a9eb812238f753132652ae09963a05e9.jpg');

/*Table structure for table `shipping_addresses` */

DROP TABLE IF EXISTS `shipping_addresses`;

CREATE TABLE `shipping_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `provinsi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kode_pos` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shipping_addresses_id_order_foreign` (`id_order`),
  CONSTRAINT `shipping_addresses_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `carts` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `shipping_addresses` */

insert  into `shipping_addresses`(`id`,`id_order`,`provinsi`,`kabupaten`,`kode_pos`,`alamat`) values 
(4,'HDSXXPDOC5','DI Yogyakarta','Kabupaten Kulon Progo','55611','aww'),
(5,'YJT80CT2BR','DI Yogyakarta','Kabupaten Gunung Kidul','55812','Mejing Wetan RT 006 RW 006 Ambarketawang Gamping, Sleman, Yogyakarta');

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id_supplier` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_hp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_supplier`),
  UNIQUE KEY `suppliers_nama_supplier_unique` (`nama_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `suppliers` */

insert  into `suppliers`(`id_supplier`,`nama_supplier`,`alamat`,`no_hp`) values 
(1,'Udin PA','Deket Kos Idham','087802472524');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`level`,`email`,`password`) values 
(1,'Bagoes Anugrah Putra Dwitanto','barah',1,'bagiya.pertiwi@example.com','$2y$10$d0krOR.Nx9o14/ch3Q1UyOn31sZwe9KcnueGBdZdLbwbnUWsvA0Y.'),
(2,'Putu Najmudin','koko08',2,'tprayoga@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(3,'Kunthara Marsudi Hakim S.H.','hesti41',2,'opermata@example.net','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(4,'Mujur Sihombing','zpuspita',2,'firmansyah.teguh@example.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi'),
(5,'Kani Zulaika','cprayoga',2,'siregar.ghaliyati@example.org','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
