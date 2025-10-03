-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk dbpos1
CREATE DATABASE IF NOT EXISTS `dbpos1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dbpos1`;

-- membuang struktur untuk table dbpos1.jenis_produk
CREATE TABLE IF NOT EXISTS `jenis_produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.jenis_produk: ~3 rows (lebih kurang)
INSERT INTO `jenis_produk` (`id`, `nama`) VALUES
	(1, 'ATK'),
	(2, 'Buku Tulis'),
	(3, 'Peralatan Kantor');

-- membuang struktur untuk table dbpos1.kartu
CREATE TABLE IF NOT EXISTS `kartu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `diskon` decimal(5,2) DEFAULT '0.00',
  `iuran` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.kartu: ~3 rows (lebih kurang)
INSERT INTO `kartu` (`id`, `kode`, `nama`, `diskon`, `iuran`) VALUES
	(1, 'SLV', 'Silver', 2.50, 25000.00),
	(2, 'GLD', 'Gold', 5.00, 50000.00),
	(3, 'PLT', 'Platinum', 10.00, 100000.00);

-- membuang struktur untuk table dbpos1.pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jk` char(1) DEFAULT NULL,
  `tmp_lahir` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `kartu_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  KEY `kartu_id` (`kartu_id`),
  CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`kartu_id`) REFERENCES `kartu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.pelanggan: ~2 rows (lebih kurang)
INSERT INTO `pelanggan` (`id`, `kode`, `nama`, `jk`, `tmp_lahir`, `tgl_lahir`, `email`, `kartu_id`) VALUES
	(1, 'CUST001', 'Andi Wijaya', 'L', 'Jakarta', '1995-01-01', 'andi@example.com', 1),
	(2, 'CUST002', 'Budi Santoso', 'L', 'Depok', '1996-02-02', 'budi@example.com', 2);

-- membuang struktur untuk table dbpos1.pembayaran
CREATE TABLE IF NOT EXISTS `pembayaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nokuitansi` varchar(50) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jumlah` decimal(12,2) DEFAULT NULL,
  `ke` int DEFAULT NULL,
  `pesan_id` int DEFAULT NULL,
  `status_pembayaran` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nokuitansi` (`nokuitansi`),
  KEY `pesan_id` (`pesan_id`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`pesan_id`) REFERENCES `pesanan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.pembayaran: ~1 rows (lebih kurang)
INSERT INTO `pembayaran` (`id`, `nokuitansi`, `tanggal`, `jumlah`, `ke`, `pesan_id`, `status_pembayaran`) VALUES
	(1, 'KW-001', '2025-09-21', 200000.00, 1, 1, 'Belum Lunas');

-- membuang struktur untuk table dbpos1.pembelian
CREATE TABLE IF NOT EXISTS `pembelian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `nomor` varchar(50) DEFAULT NULL,
  `produk_id` int DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `harga` decimal(12,2) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomor` (`nomor`),
  KEY `produk_id` (`produk_id`),
  KEY `vendor_id` (`vendor_id`),
  CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.pembelian: ~2 rows (lebih kurang)
INSERT INTO `pembelian` (`id`, `tanggal`, `nomor`, `produk_id`, `jumlah`, `harga`, `vendor_id`) VALUES
	(1, '2025-09-20', 'PO-0001', 1, 200, 3200.00, 1),
	(2, '2025-09-22', 'PO-0002', 3, 50, 18000.00, 2);

-- membuang struktur untuk table dbpos1.pesanan
CREATE TABLE IF NOT EXISTS `pesanan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `total` decimal(12,2) DEFAULT '0.00',
  `pelanggan_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pelanggan_id` (`pelanggan_id`),
  CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.pesanan: ~2 rows (lebih kurang)
INSERT INTO `pesanan` (`id`, `tanggal`, `total`, `pelanggan_id`) VALUES
	(1, '2025-10-01', 70000.00, 1),
	(2, '2025-10-02', 44000.00, 2);

-- membuang struktur untuk table dbpos1.pesanan_items
CREATE TABLE IF NOT EXISTS `pesanan_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `produk_id` int DEFAULT NULL,
  `pesanan_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `harga` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produk_id` (`produk_id`),
  KEY `pesanan_id` (`pesanan_id`),
  CONSTRAINT `pesanan_items_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`id`),
  CONSTRAINT `pesanan_items_ibfk_2` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.pesanan_items: ~3 rows (lebih kurang)
INSERT INTO `pesanan_items` (`id`, `produk_id`, `pesanan_id`, `qty`, `harga`) VALUES
	(1, 1, 1, 10, 5000.00),
	(2, 2, 1, 1, 12000.00),
	(3, 3, 2, 2, 22000.00);

-- membuang struktur untuk table dbpos1.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `harga_beli` decimal(12,2) DEFAULT NULL,
  `harga_jual` decimal(12,2) DEFAULT NULL,
  `stok` int DEFAULT '0',
  `min_stok` int DEFAULT '0',
  `jenis_produk_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kode` (`kode`),
  KEY `jenis_produk_id` (`jenis_produk_id`),
  CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`jenis_produk_id`) REFERENCES `jenis_produk` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.produk: ~3 rows (lebih kurang)
INSERT INTO `produk` (`id`, `kode`, `nama`, `harga_beli`, `harga_jual`, `stok`, `min_stok`, `jenis_produk_id`) VALUES
	(1, 'PRD001', 'Pulpen Biru', 3000.00, 5000.00, 100, 10, 1),
	(2, 'PRD002', 'Buku A5', 8000.00, 12000.00, 75, 5, 2),
	(3, 'PRD003', 'Stapler Mini', 15000.00, 22000.00, 40, 5, 3);

-- membuang struktur untuk table dbpos1.vendor
CREATE TABLE IF NOT EXISTS `vendor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nomor` varchar(20) DEFAULT NULL,
  `nama` varchar(150) NOT NULL,
  `kota` varchar(100) DEFAULT NULL,
  `kontak` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomor` (`nomor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Membuang data untuk tabel dbpos1.vendor: ~2 rows (lebih kurang)
INSERT INTO `vendor` (`id`, `nomor`, `nama`, `kota`, `kontak`) VALUES
	(1, 'V001', 'PT Sumber Makmur', 'Jakarta', 'Ibu Rina'),
	(2, 'V002', 'CV Alat Tulis', 'Bogor', 'Pak Dedi');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
