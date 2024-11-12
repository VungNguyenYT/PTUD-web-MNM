-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2024 at 10:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `USER_ADMIN` varchar(255) NOT NULL,
  `PASS_ADMIN` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `USERNAME` varchar(255) NOT NULL,
  `USER_ADMIN` varchar(255) NOT NULL,
  `ID_CHAT` int(11) NOT NULL,
  `NOI_DUNG_CHAT` text DEFAULT NULL,
  `THOI_GIAN_CHAT` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_gio_hang`
--

CREATE TABLE `chi_tiet_gio_hang` (
  `USERNAME` varchar(255) NOT NULL,
  `ID_SACH` int(11) NOT NULL,
  `ID_GIO_HANG` int(11) NOT NULL,
  `ID_CHI_TIET_GIO_HANG` int(11) NOT NULL,
  `SO_LUONG_MUA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gio_hang`
--

CREATE TABLE `gio_hang` (
  `ID_GIO_HANG` int(11) NOT NULL,
  `USER_ADMIN` varchar(255) NOT NULL,
  `THONG_TIN_GIO_HANG` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loai_sanh`
--

CREATE TABLE `loai_sanh` (
  `MA_LOAI` varchar(5) NOT NULL,
  `TEN_LOAI` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loai_sanh`
--

INSERT INTO `loai_sanh` (`MA_LOAI`, `TEN_LOAI`) VALUES
('FIC', 'Fiction'),
('HIS', 'History'),
('ROM', 'Romance'),
('SCI', 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `USERNAME` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sach`
--

CREATE TABLE `sach` (
  `ID_SACH` int(11) NOT NULL,
  `MA_LOAI` varchar(5) NOT NULL,
  `TEN_SACH` varchar(255) DEFAULT NULL,
  `TAC_GIA` varchar(255) DEFAULT NULL,
  `MO_TA` text DEFAULT NULL,
  `HINH_SACH` text DEFAULT NULL,
  `SO_TRANG` int(11) DEFAULT NULL,
  `GIA` int(11) DEFAULT NULL,
  `SO_LUONG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sach`
--

INSERT INTO `sach` (`ID_SACH`, `MA_LOAI`, `TEN_SACH`, `TAC_GIA`, `MO_TA`, `HINH_SACH`, `SO_TRANG`, `GIA`, `SO_LUONG`) VALUES
(1, 'FIC', 'To Kill a Mockingbird', 'Harper Lee', 'A novel about racial injustice in the Deep South.', 'mockingbird.jpg', 281, 120000, 15),
(2, 'FIC', '1984', 'George Orwell', 'Dystopian social science fiction novel and cautionary tale.', '1984.jpg', 328, 150000, 20),
(3, 'FIC', 'The Great Gatsby', 'F. Scott Fitzgerald', 'A story about the American dream.', 'gatsby.jpg', 180, 100000, 10),
(4, 'SCI', 'A Brief History of Time', 'Stephen Hawking', 'A book about cosmology and the universe.', 'hawking.jpg', 212, 180000, 8),
(5, 'SCI', 'Cosmos', 'Carl Sagan', 'Exploring the universe and our place within it.', 'cosmos.jpg', 365, 200000, 12),
(6, 'ROM', 'Pride and Prejudice', 'Jane Austen', 'A classic romantic novel.', 'pride.jpg', 279, 90000, 25),
(7, 'HIS', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'A narrative of humanity’s creation and evolution.', 'sapiens.jpg', 443, 250000, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`USER_ADMIN`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`USERNAME`,`USER_ADMIN`,`ID_CHAT`),
  ADD KEY `FK_CHAT2` (`USER_ADMIN`);

--
-- Indexes for table `chi_tiet_gio_hang`
--
ALTER TABLE `chi_tiet_gio_hang`
  ADD PRIMARY KEY (`USERNAME`,`ID_SACH`,`ID_GIO_HANG`,`ID_CHI_TIET_GIO_HANG`),
  ADD KEY `FK_CHI_TIET_GIO_HANG2` (`ID_SACH`),
  ADD KEY `FK_CHI_TIET_GIO_HANG3` (`ID_GIO_HANG`);

--
-- Indexes for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`ID_GIO_HANG`),
  ADD KEY `FK_DUYET` (`USER_ADMIN`);

--
-- Indexes for table `loai_sanh`
--
ALTER TABLE `loai_sanh`
  ADD PRIMARY KEY (`MA_LOAI`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indexes for table `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`ID_SACH`),
  ADD KEY `FK_THUOC` (`MA_LOAI`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `ID_GIO_HANG` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sach`
--
ALTER TABLE `sach`
  MODIFY `ID_SACH` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `FK_CHAT` FOREIGN KEY (`USERNAME`) REFERENCES `nguoi_dung` (`USERNAME`),
  ADD CONSTRAINT `FK_CHAT2` FOREIGN KEY (`USER_ADMIN`) REFERENCES `admin` (`USER_ADMIN`);

--
-- Constraints for table `chi_tiet_gio_hang`
--
ALTER TABLE `chi_tiet_gio_hang`
  ADD CONSTRAINT `FK_CHI_TIET_GIO_HANG` FOREIGN KEY (`USERNAME`) REFERENCES `nguoi_dung` (`USERNAME`),
  ADD CONSTRAINT `FK_CHI_TIET_GIO_HANG2` FOREIGN KEY (`ID_SACH`) REFERENCES `sach` (`ID_SACH`),
  ADD CONSTRAINT `FK_CHI_TIET_GIO_HANG3` FOREIGN KEY (`ID_GIO_HANG`) REFERENCES `gio_hang` (`ID_GIO_HANG`);

--
-- Constraints for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `FK_DUYET` FOREIGN KEY (`USER_ADMIN`) REFERENCES `admin` (`USER_ADMIN`);

--
-- Constraints for table `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `FK_THUOC` FOREIGN KEY (`MA_LOAI`) REFERENCES `loai_sanh` (`MA_LOAI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
