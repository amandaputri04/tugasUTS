-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2024 at 01:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualandb`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `ID` int(8) NOT NULL,
  `BARCODE` int(20) DEFAULT NULL,
  `NAME` char(100) DEFAULT NULL,
  `HARGA_JUAL` bigint(20) DEFAULT NULL,
  `HARGA_BELI` bigint(20) DEFAULT NULL,
  `STOK` int(10) DEFAULT NULL,
  `KATEGORI_ID` int(8) DEFAULT NULL,
  `SATUAN_ID` int(8) DEFAULT NULL,
  `USER_ID` int(8) DEFAULT NULL,
  `SUPPLIER_ID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`ID`, `BARCODE`, `NAME`, `HARGA_JUAL`, `HARGA_BELI`, `STOK`, `KATEGORI_ID`, `SATUAN_ID`, `USER_ID`, `SUPPLIER_ID`) VALUES
(10, 382349832, 'TONER', 85000, 95000, 5, 23846, 44444, 23942, 1293),
(20, 5624542, 'PULPEN', 3000, 2500, 11, 39247, 55555, 78236, 38426),
(30, 43786419, 'KOPI', 15000, 11000, 3, 23874, 44444, 73221, 23728),
(40, 1344678, 'PENSIL', 2000, 1000, 9, 39247, 55555, 24726, 24164),
(50, 74381914, 'EMAS', 1000000, 900000, 1, 82348, 11111, 63481, 28361);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `ID` int(8) NOT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `QTY` int(10) DEFAULT NULL,
  `SUBTOTAL` bigint(20) DEFAULT NULL,
  `PEMBELIAN_ID` int(8) DEFAULT NULL,
  `BARANG_ID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`ID`, `HARGA`, `QTY`, `SUBTOTAL`, `PEMBELIAN_ID`, `BARANG_ID`) VALUES
(10, 85000, 1, 85000, 10, 10),
(20, 2500, 2, 5000, 20, 20),
(30, 11000, 1, 11000, 30, 30),
(40, 1000, 1, 1000, 40, 40),
(50, 900000, 1, 900000, 50, 50);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `ID` int(8) NOT NULL,
  `HARGA` int(11) DEFAULT NULL,
  `QTY` int(10) DEFAULT NULL,
  `SUBTOTAL` bigint(20) DEFAULT NULL,
  `PENJUALAN_ID` int(8) DEFAULT NULL,
  `BARANG_ID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`ID`, `HARGA`, `QTY`, `SUBTOTAL`, `PENJUALAN_ID`, `BARANG_ID`) VALUES
(10, 95000, 1, 95000, 10, 10),
(20, 3000, 2, 6000, 20, 20),
(30, 15000, 1, 15000, 30, 30),
(40, 2000, 1, 2000, 40, 40),
(50, 1000000, 1, 1000000, 50, 50);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `ID` int(8) NOT NULL,
  `NAME` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`ID`, `NAME`) VALUES
(23846, 'ELEKTRONIK'),
(23874, 'AKSESORIS\r\n'),
(32486, 'PAKAIAN'),
(39247, 'ALAT TULIS'),
(82348, 'PERHIASAN');

-- --------------------------------------------------------

--
-- Table structure for table `kostumer`
--

CREATE TABLE `kostumer` (
  `ID` int(8) NOT NULL,
  `NIK` int(16) DEFAULT NULL,
  `NAME` char(100) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL,
  `EMAIL` char(100) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kostumer`
--

INSERT INTO `kostumer` (`ID`, `NIK`, `NAME`, `TELP`, `EMAIL`, `ALAMAT`) VALUES
(67546, 218446122, 'VENTI', '0725146781245', 'barbatos@gmail.com', 'JL. MONDO'),
(67843, 989427812, 'LAYLA', '086482638416', 'layla@yahoo.com', 'JL. SUMERU'),
(72489, 192748356, 'RAIDEN', '077215468495', 'Ei@yahoo.com', 'JL. INAZUMA'),
(87239, 980137328, 'FURINA', '09284781247', 'furinair@gmail.com', 'JL. FONTAINE'),
(90124, 818747481, 'KIRARA', '08475619841', 'kirara@gmail.com', 'JL. PADANG');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `ID` int(8) NOT NULL,
  `INVOICE` int(20) DEFAULT NULL,
  `TOTAL` bigint(20) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `DISKRIPSI` varchar(255) DEFAULT NULL,
  `TANGGAL` date DEFAULT NULL,
  `SUPPLIER_ID` int(8) DEFAULT NULL,
  `USER_ID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`ID`, `INVOICE`, `TOTAL`, `BAYAR`, `DISKRIPSI`, `TANGGAL`, `SUPPLIER_ID`, `USER_ID`) VALUES
(10, 56748, 95000, 100000, 'JAM TANGAN', '2024-01-24', 1293, 23942),
(20, 64567, 6000, 10000, 'PULPEN', '2024-03-06', 38426, 78236),
(30, 654865, 15000, 20000, 'KIPAS ANGIN\r\n', '2024-03-17', 23728, 73221),
(40, 76535, 2000, 2000, 'PENSIL', '2024-02-13', 24164, 24726),
(50, 467546, 1000000, 1000000, 'EMAS', '2024-04-30', 28361, 63481);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `ID` int(8) NOT NULL,
  `INVOICE` int(20) DEFAULT NULL,
  `TOTAL` bigint(20) DEFAULT NULL,
  `BAYAR` int(11) DEFAULT NULL,
  `KEMBALI` int(11) DEFAULT NULL,
  `TANGGAL` date DEFAULT NULL,
  `KOSTUMER_ID` int(8) DEFAULT NULL,
  `USER_ID` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`ID`, `INVOICE`, `TOTAL`, `BAYAR`, `KEMBALI`, `TANGGAL`, `KOSTUMER_ID`, `USER_ID`) VALUES
(10, 56748, 95000, 100000, 5000, '2024-01-24', 67546, 23942),
(20, 64567, 6000, 10000, 4000, '2024-03-06', 67843, 24726),
(30, 654865, 15000, 20000, 5000, '2024-03-17', 72489, 63481),
(40, 76535, 2000, 2000, 0, '2024-02-13', 87239, 73221),
(50, 467546, 1000000, 1000000, 0, '2024-04-30', 90124, 78236);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `ID` int(8) NOT NULL,
  `NAME` char(100) DEFAULT NULL,
  `DISKRIPSI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`ID`, `NAME`, `DISKRIPSI`) VALUES
(11111, 'Kg', 'Kilogram'),
(22222, 'L', 'Liter'),
(33333, 'Mg', 'Miligram'),
(44444, 'mL', 'Mililiter'),
(55555, 'Pcs', 'Buah');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `ID` int(8) NOT NULL,
  `NIK` int(16) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL,
  `EMAIL` varchar(150) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `PERUSAHAAN` varchar(150) DEFAULT NULL,
  `NAMA_BANK` varchar(150) DEFAULT NULL,
  `NAMA_AKUN_BANK` varchar(150) DEFAULT NULL,
  `NO_AKUN_BANK` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`ID`, `NIK`, `NAME`, `TELP`, `EMAIL`, `ALAMAT`, `PERUSAHAAN`, `NAMA_BANK`, `NAMA_AKUN_BANK`, `NO_AKUN_BANK`) VALUES
(1293, 1024887329, 'Azzahra', '08317582767591', 'putri@gmail.com', 'JL. BENUA ANYAR', 'PT. BASIRIH', 'BCA', 'bca98201', '3473654187'),
(23728, 123837823, 'Lylia', '082731631', 'lyliaala@gmail.com', 'Jl. Depok', 'PT. SUJEL', 'BSI', 'Lylia1231', '28136783'),
(24164, 984237582, 'Jodi', '087464851096', 'cempaka@yahoo.com', 'JL. CEMPAKA', 'PT. CEMPAKA', 'BNI', 'JODI575', '21433123'),
(28361, 123721839, 'Risol', '0812371317', 'risolenak@gmail.com', 'Jl. Matahari', 'PT. YAMAHA', 'MANDIRI', 'risol123', '21831631'),
(38426, 1326428321, 'Zilong', '083417236', 'zilongmeta@gmail.com', 'Jl. Alpukat', 'PT. BAKWAN', 'BCA', 'zilong2234', '234787382');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID` int(8) NOT NULL,
  `NIK` int(16) DEFAULT NULL,
  `USERNAME` char(100) DEFAULT NULL,
  `FULL_NAME` varchar(150) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `ROLE` char(20) DEFAULT NULL,
  `EMAIL` varchar(150) DEFAULT NULL,
  `ALAMAT` varchar(255) DEFAULT NULL,
  `TELP` char(20) DEFAULT NULL,
  `IS_ACTIVE` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `NIK`, `USERNAME`, `FULL_NAME`, `PASSWORD`, `ROLE`, `EMAIL`, `ALAMAT`, `TELP`, `IS_ACTIVE`) VALUES
(23942, 1237834712, 'YANTO', 'HARYANTO', 'admin123', 'ADMIN', 'sumanto@gmail.com', 'Jl. HKSN', '083231752517', 'YES'),
(24726, 123671361, 'BEBEL', 'AMANDA PUTRI AZZAHRA', 'staff123', 'STAFF', 'amanda@gmail.com', 'JL. Adhyaksa', '097563859237', 'YES'),
(63481, 1364866249, 'MIRA', 'MIRANTY SETYA PERTIWI', 'miranty123', 'KARYAWAN', 'miranty@gmail.com', 'JL. Sungai Andai', '0926582641', 'NO'),
(73221, 1274675913, 'USUP', 'SUPRATMAN', 'supra123', 'KARYAWAN', 'usup@gmail.com', 'JL. SUNGAI MIAI', '084572486494', 'NO'),
(78236, 194728562, 'JOY', 'JOYA', 'joya12', 'STAFF', 'joy@gmail.com', 'JL. MT.HARYONO', '09746586412', 'YES');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_KATEGORI` (`KATEGORI_ID`),
  ADD KEY `FK_SATUAN` (`SATUAN_ID`),
  ADD KEY `FK_USER` (`USER_ID`),
  ADD KEY `FK_SUPPLIER` (`SUPPLIER_ID`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PEMBELIAN` (`PEMBELIAN_ID`),
  ADD KEY `FK_DETAIL_BELI_BARANG` (`BARANG_ID`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PENJUALAN` (`PENJUALAN_ID`),
  ADD KEY `FK_DETAIL_JUAL_BARANG` (`BARANG_ID`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kostumer`
--
ALTER TABLE `kostumer`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PEMBELIAN_SUPPLIER` (`SUPPLIER_ID`),
  ADD KEY `FK_PEMBELIAN_USER` (`USER_ID`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_PENJUALAN_KOSTUMER` (`KOSTUMER_ID`),
  ADD KEY `FK_PENJUALAN_USER` (`USER_ID`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `detail_beli`
--
ALTER TABLE `detail_beli`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `detail_jual`
--
ALTER TABLE `detail_jual`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82351;

--
-- AUTO_INCREMENT for table `kostumer`
--
ALTER TABLE `kostumer`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90125;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55556;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38427;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78237;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `FK_KATEGORI` FOREIGN KEY (`KATEGORI_ID`) REFERENCES `kategori` (`ID`),
  ADD CONSTRAINT `FK_SATUAN` FOREIGN KEY (`SATUAN_ID`) REFERENCES `satuan` (`ID`),
  ADD CONSTRAINT `FK_SUPPLIER` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`ID`),
  ADD CONSTRAINT `FK_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `FK_DETAIL_BELI_BARANG` FOREIGN KEY (`BARANG_ID`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `FK_PEMBELIAN` FOREIGN KEY (`PEMBELIAN_ID`) REFERENCES `pembelian` (`ID`);

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `FK_DETAIL_JUAL_BARANG` FOREIGN KEY (`BARANG_ID`) REFERENCES `barang` (`ID`),
  ADD CONSTRAINT `FK_PENJUALAN` FOREIGN KEY (`PENJUALAN_ID`) REFERENCES `penjualan` (`ID`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `FK_PEMBELIAN_SUPPLIER` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`ID`),
  ADD CONSTRAINT `FK_PEMBELIAN_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `FK_PENJUALAN_KOSTUMER` FOREIGN KEY (`KOSTUMER_ID`) REFERENCES `kostumer` (`ID`),
  ADD CONSTRAINT `FK_PENJUALAN_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
