-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2019 at 11:48 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_antrian`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `gambar` varchar(255) NOT NULL DEFAULT 'default.png',
  `theme` varchar(20) NOT NULL DEFAULT 'sb_admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `nama`, `status`, `gambar`, `theme`) VALUES
(2, 'admin@admin.com', 'admin', 'admin', 1, 'default.png', 'sb_admin');

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int(4) NOT NULL,
  `tgl_antrian` date NOT NULL,
  `no_antrian` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `tgl_antrian`, `no_antrian`) VALUES
(1, '2019-07-31', '1'),
(2, '2019-07-31', '2'),
(3, '2019-07-31', '3'),
(4, '2019-07-31', '4'),
(5, '2019-07-31', '5'),
(6, '2019-07-31', '6'),
(7, '2019-07-31', '7'),
(8, '2019-07-31', '8'),
(9, '2019-08-01', '1'),
(10, '2019-08-01', '2'),
(11, '2019-08-07', '1'),
(12, '2019-08-07', '2'),
(13, '2019-08-07', '3'),
(14, '2019-08-07', '4'),
(15, '2019-08-07', '5');

-- --------------------------------------------------------

--
-- Table structure for table `antrian_poli`
--

CREATE TABLE `antrian_poli` (
  `id_antrian_poli` int(4) NOT NULL,
  `id_antrian` int(4) NOT NULL,
  `id_pasien` int(4) NOT NULL,
  `id_poli` int(2) NOT NULL,
  `no_antrian_poli` varchar(10) NOT NULL,
  `tgl_antrian_poli` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `antrian_poli`
--

INSERT INTO `antrian_poli` (`id_antrian_poli`, `id_antrian`, `id_pasien`, `id_poli`, `no_antrian_poli`, `tgl_antrian_poli`) VALUES
(1, 0, 1, 2, '1', '2019-07-17'),
(2, 0, 1, 2, '2', '2019-07-17'),
(3, 0, 1, 2, '3', '2019-07-17'),
(4, 0, 1, 4, '1', '2019-07-17'),
(5, 0, 1, 3, '1', '2019-07-17'),
(6, 0, 1, 3, '30', '2019-07-17'),
(8, 0, 1, 4, '2', '2019-07-17'),
(9, 0, 1, 2, '1', '2019-07-18'),
(10, 0, 2, 2, '30', '2019-07-18'),
(11, 0, 6, 3, '1', '2019-07-30'),
(12, 0, 1, 1, '1', '2019-07-31'),
(13, 0, 1, 1, '2', '2019-07-31'),
(14, 0, 1, 2, '1', '2019-07-31'),
(15, 0, 1, 3, '1', '2019-07-31'),
(16, 0, 1, 3, '2', '2019-07-31'),
(17, 0, 1, 3, '3', '2019-07-31'),
(18, 0, 14, 1, '3', '2019-07-31'),
(19, 0, 14, 1, '4', '2019-07-31'),
(20, 0, 14, 1, '5', '2019-07-31'),
(21, 0, 14, 2, '2', '2019-07-31'),
(22, 0, 14, 4, '1', '2019-07-31'),
(23, 0, 14, 4, '2', '2019-07-31'),
(24, 0, 14, 2, '1', '2019-08-01'),
(25, 0, 14, 3, '1', '2019-08-01'),
(26, 0, 14, 1, '1', '2019-08-07'),
(27, 0, 14, 2, '1', '2019-08-07'),
(28, 0, 14, 1, '2', '2019-08-07'),
(29, 0, 14, 1, '3', '2019-08-07'),
(30, 0, 14, 4, '1', '2019-08-07');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_poli`
--

CREATE TABLE `kategori_poli` (
  `id_poli` int(2) NOT NULL,
  `kode_poli` varchar(5) NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `jumlah_maksimal` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_poli`
--

INSERT INTO `kategori_poli` (`id_poli`, `kode_poli`, `nama_poli`, `jumlah_maksimal`) VALUES
(1, 'PLUM', 'Poli Umum', '30'),
(2, 'PLGG', 'Poli Gigi', '30'),
(3, 'PLIM', 'Poli Imunisasi', '30'),
(4, 'PLTB', 'Poli Tuberculosis', '30');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(4) NOT NULL,
  `no_identitas` varchar(25) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jenis_kelamin` enum('Perempuan','Laki-Laki') NOT NULL,
  `tgl_lahir` date NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `no_identitas`, `nama`, `jenis_kelamin`, `tgl_lahir`, `alamat`, `no_telp`, `username`, `password`) VALUES
(1, '123456789', 'evi', 'Perempuan', '2019-07-16', '<p>\n	pomad</p>\n', '082199252530', '', ''),
(3, 'wq', 'qwqw', 'Perempuan', '2019-07-17', '<p>\n	sadas</p>\n', 'q', 'q', '7694f4a66316e53c8cdd9d9954bd611d'),
(4, '34567891234567', 'rafly', 'Laki-Laki', '1998-04-03', 'Jl. Merdeka', '08587654323', 'raff', '123'),
(5, '988553322771', 'dwi', 'Laki-Laki', '1999-03-22', 'Jl Bunga', '09584433221', 'dwi22', '12345'),
(6, '3479272653563', 'Aisyah', 'Perempuan', '2001-06-11', 'Jl. Manis', '0838222445', 'ais', '2000'),
(7, '345678564567', 'Simon', 'Laki-Laki', '1997-02-06', 'Jl. Mawar', '081319898213', 'sim', 'dia'),
(8, '998877665544', 'Putri', 'Perempuan', '2000-08-27', 'Jl. Merpati', '081994321522', 'putput', '2000'),
(9, '4523467867845', 'Vio', 'Perempuan', '2003-09-02', 'Jl Kuningan', '08225488006', 'vio', 'a591024321c5e2bdbd23ed35f0574dde'),
(10, '3425261782753', 'Josua', 'Laki-Laki', '1995-11-02', 'Jl. Setia', '081316552245', 'jo', '3f088ebeda03513be71d34d214291986'),
(11, '12536383920282', 'silva', 'Perempuan', '1998-01-04', 'Jl. Anggur', '0943527252461', 'silva98', '202cb962ac59075b964b07152d234b70'),
(12, '1224564324', 'vi', 'Laki-Laki', '1998-03-05', 'Jl.merdeka', '082199252530', 'vi98', '202cb962ac59075b964b07152d234b70'),
(13, '34567891234567', 'rafly', '', '2019-07-12', '', '', 'raff', 'ed474ee8e3b2f7c00e406d57c76c9638'),
(14, '34567891234567', 'meli', 'Perempuan', '1997-08-04', 'jl.merpati', '09584433221', 'meli', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `tjm_menu`
--

CREATE TABLE `tjm_menu` (
  `id` int(11) NOT NULL,
  `parent_menu` int(11) NOT NULL DEFAULT '1',
  `nama_menu` varchar(50) NOT NULL,
  `url_menu` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `urutan` tinyint(3) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `type` enum('Admin') NOT NULL DEFAULT 'Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tjm_menu`
--

INSERT INTO `tjm_menu` (`id`, `parent_menu`, `nama_menu`, `url_menu`, `icon`, `urutan`, `status`, `type`) VALUES
(1, 1, 'root', '/', '', 0, 0, 'Admin'),
(2, 1, 'dashboard', 'admin/dashboard', 'fa fa-fw fa-dashboard', 1, 1, 'Admin'),
(3, 1, 'User Admin', 'admin/useradmin', 'fa fa-users', 99, 0, 'Admin'),
(4, 1, 'Menu', 'admin/menu', 'fa fa-gear', 100, 1, 'Admin'),
(25, 1, 'Master', 'admin/master', 'fa fa-ticket', 2, 0, 'Admin'),
(31, 1, 'Data Pasien', 'admin/pasien', 'glyphicon glyphicon-user', 2, 1, 'Admin'),
(32, 1, 'Poli', 'admin/poli', 'glyphicon glyphicon-list-alt', 3, 1, 'Admin'),
(33, 1, 'Antrian Poli', 'admin/antrian_poli', 'glyphicon glyphicon-list', 4, 1, 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD PRIMARY KEY (`id_antrian`);

--
-- Indexes for table `antrian_poli`
--
ALTER TABLE `antrian_poli`
  ADD PRIMARY KEY (`id_antrian_poli`);

--
-- Indexes for table `kategori_poli`
--
ALTER TABLE `kategori_poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `antrian`
--
ALTER TABLE `antrian`
  MODIFY `id_antrian` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `antrian_poli`
--
ALTER TABLE `antrian_poli`
  MODIFY `id_antrian_poli` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kategori_poli`
--
ALTER TABLE `kategori_poli`
  MODIFY `id_poli` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tjm_menu`
--
ALTER TABLE `tjm_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
