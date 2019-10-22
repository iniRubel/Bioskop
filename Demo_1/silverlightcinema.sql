-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2019 at 02:13 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `silverlightcinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `bioskop`
--

CREATE TABLE `bioskop` (
  `id_bioskop` varchar(25) NOT NULL,
  `nama_bioskop` varchar(40) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bioskop`
--

INSERT INTO `bioskop` (`id_bioskop`, `nama_bioskop`, `no_telp`, `alamat`) VALUES
('BSKP-1', 'Mezanin Silver Light', '082148147188', 'Mezanin Mega Mall Lt.4 Jl. Jendral Sudirman No.1'),
('BSKP-2', 'Ring Road Silver', '082148147156', 'Jl. Gagak Hitam No.28');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id_film` varchar(25) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `durasi` varchar(15) NOT NULL,
  `sinopsis` text NOT NULL,
  `gendre` varchar(50) NOT NULL,
  `sutradara` varchar(200) NOT NULL,
  `link_trailer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id_film`, `judul`, `durasi`, `sinopsis`, `gendre`, `sutradara`, `link_trailer`) VALUES
('FLM-1', 'Gundala', '2j 23m', 'Indonesia\'s preeminent comic book superhero and his alter ego Sancaka enter the cinematic universe to battle the wicked Pengkor and his diabolical squad of orphan assassins.', 'Action, Crime, Drama', 'Joko Anwar', 'https://youtu.be/8rauD1vxMCw'),
('FLM-2', 'IT : Chapter Two', '2j 49m', 'Twenty-seven years after their first encounter with the terrifying Pennywise, the Losers Club have grown up and moved away, until a devastating phone call brings them back. ', 'Horror', 'Andy Muschietti', 'https://youtu.be/xhJ5P7Up3jA'),
('FLM-3', 'Ready or Not', '1j 35m', 'A bride\'s wedding night takes a sinister turn when her eccentric new in-laws force her to take part in a terrifying game. ', 'Comedy, Horror', 'Matt Bettinelli-Olpin, Tyler Gillett', 'https://youtu.be/ZtYTwUxhAoI'),
('FLM-4', 'Weathering with You', '1j 51m', 'A high-school boy who has run away to Tokyo befriends a girl who appears to be able to manipulate the weather. ', 'Animation, Drama', 'Makoto Shinkai', 'https://youtu.be/Q6iK6DjV_iE'),
('FLM-5', 'Ad Astra', '2j 3m', 'Astronaut Roy McBride undertakes a mission across an unforgiving solar system to uncover the truth about his missing father and his doomed expedition that now, 30 years later, threatens the universe. ', 'Adventure, Drama, Mystery', 'James Gray', 'https://youtu.be/nxi6rtBtBM0'),
('FLM-6', 'Joker', '2j 1m', 'A gritty character study of Arthur Fleck, a man disregarded by society. ', 'Crime, Drama', 'Todd Phillips', 'https://youtu.be/zAGVQLHvwOY');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` varchar(25) NOT NULL,
  `status` varchar(20) NOT NULL,
  `total_harga` mediumint(9) NOT NULL,
  `id_user` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--

CREATE TABLE `kursi` (
  `id_kursi` varchar(25) NOT NULL,
  `col_num` varchar(3) NOT NULL,
  `row_alp` varchar(3) NOT NULL,
  `harga` mediumint(9) NOT NULL,
  `id_theater` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `makmin`
--

CREATE TABLE `makmin` (
  `id_makmin` varchar(25) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `keterangan` varchar(200) NOT NULL,
  `harga` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makmin`
--

INSERT INTO `makmin` (`id_makmin`, `nama`, `keterangan`, `harga`) VALUES
('MKN-1', 'French Fries', 'French Fries 200g', 40000),
('MKN-10', 'L. Salty Popcorn', 'Large Salty Popcorn', 75000),
('MKN-11', 'M. Coca Cola', 'Medium Cup Coca Cola', 25000),
('MKN-12', 'L. Coca Cola', 'Large Cup Coca Cola', 45000),
('MKN-13', 'Aqua 600 ml', 'Aqua 600 ml', 10000),
('MKN-14', 'J. Mixed Popcorn', 'Jumbo Sweet & Salty Popcorn', 150000),
('MKN-2', 'Beef Hot Dog', 'Beef Hot Dog', 40000),
('MKN-3', 'Chicken Hot Dog', 'Chicken Hot Dog', 40000),
('MKN-4', 'Sandwitch', '1 Portion 2 Sandwitch', 40000),
('MKN-5', 'M. Milo', 'Medium Cup Milo', 15000),
('MKN-6', 'L. Milo', 'Large Cup Milo', 25000),
('MKN-7', 'M. Sweet Popcorn', 'Medium Sweet Popcorn', 50000),
('MKN-8', 'L. Sweet Popcorn', 'Large Sweet Popcorn', 85000),
('MKN-9', 'M. Salty Popcorn', 'Medium Salty Popcorn', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `memutar`
--

CREATE TABLE `memutar` (
  `id_memutar` varchar(25) NOT NULL,
  `tanggal` date NOT NULL,
  `jam` time NOT NULL,
  `id_theater` varchar(25) NOT NULL,
  `id_film` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesan_makmin`
--

CREATE TABLE `pesan_makmin` (
  `id_psn_mkmn` varchar(25) NOT NULL,
  `id_keranjang` varchar(25) NOT NULL,
  `id_stock` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_makmin`
--

CREATE TABLE `stock_makmin` (
  `id_stock` varchar(25) NOT NULL,
  `stock` mediumint(9) NOT NULL,
  `id_makmin` varchar(25) NOT NULL,
  `id_bioskop` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `id_theater` varchar(25) NOT NULL,
  `no_theater` varchar(25) NOT NULL,
  `id_bioskop` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`id_theater`, `no_theater`, `id_bioskop`) VALUES
('THTR-1', '1', 'BSKP-1'),
('THTR-2', '2', 'BSKP-1'),
('THTR-3', '3', 'BSKP-1'),
('THTR-4', '4', 'BSKP-1'),
('THTR-5', '1', 'BSKP-2'),
('THTR-6', '2', 'BSKP-2'),
('THTR-7', '3', 'BSKP-2');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` varchar(25) NOT NULL,
  `id_memutar` varchar(25) NOT NULL,
  `id_kursi` varchar(25) NOT NULL,
  `id_keranjang` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(40) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `sandi` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `nohp`, `nama`, `sandi`) VALUES
('hilmihidayatar@gmail.com', '082148147155', 'Hilmi Hidayat Arfisko', 'de44f78a9f007ee56a775ce1b013e4a3'),
('madeadiwid@gmail.com', '081349471399', 'Made Adi Widyananda', '22d7fe8c185003c98f97e5d6ced420c7'),
('setyoadjipr@gmail.com', '081342461581', 'Setyo Adji Pratomo', 'bf709005906087dc1256bb4449d8774d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bioskop`
--
ALTER TABLE `bioskop`
  ADD PRIMARY KEY (`id_bioskop`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `krjng_usr` (`id_user`);

--
-- Indexes for table `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`id_kursi`),
  ADD KEY `krs_thtr` (`id_theater`);

--
-- Indexes for table `makmin`
--
ALTER TABLE `makmin`
  ADD PRIMARY KEY (`id_makmin`);

--
-- Indexes for table `memutar`
--
ALTER TABLE `memutar`
  ADD PRIMARY KEY (`id_memutar`),
  ADD KEY `mmtr_thtr` (`id_theater`),
  ADD KEY `mmtr_flm` (`id_film`);

--
-- Indexes for table `pesan_makmin`
--
ALTER TABLE `pesan_makmin`
  ADD PRIMARY KEY (`id_psn_mkmn`),
  ADD KEY `psnmkmn_stck` (`id_stock`),
  ADD KEY `psnmkmn_krnjng` (`id_keranjang`);

--
-- Indexes for table `stock_makmin`
--
ALTER TABLE `stock_makmin`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `stck_mkmn` (`id_makmin`),
  ADD KEY `stck_bskp` (`id_bioskop`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`id_theater`),
  ADD KEY `thtr_bskp` (`id_bioskop`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `tkt_mmtr` (`id_memutar`),
  ADD KEY `tkt_krs` (`id_kursi`),
  ADD KEY `tkt_krjng` (`id_keranjang`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `krjng_usr` FOREIGN KEY (`id_user`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `krs_thtr` FOREIGN KEY (`id_theater`) REFERENCES `theater` (`id_theater`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `memutar`
--
ALTER TABLE `memutar`
  ADD CONSTRAINT `mmtr_flm` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mmtr_thtr` FOREIGN KEY (`id_theater`) REFERENCES `theater` (`id_theater`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesan_makmin`
--
ALTER TABLE `pesan_makmin`
  ADD CONSTRAINT `psnmkmn_krnjng` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id_keranjang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `psnmkmn_stck` FOREIGN KEY (`id_stock`) REFERENCES `stock_makmin` (`id_stock`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_makmin`
--
ALTER TABLE `stock_makmin`
  ADD CONSTRAINT `stck_bskp` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id_bioskop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stck_mkmn` FOREIGN KEY (`id_makmin`) REFERENCES `makmin` (`id_makmin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theater`
--
ALTER TABLE `theater`
  ADD CONSTRAINT `thtr_bskp` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id_bioskop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tkt_krjng` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id_keranjang`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tkt_krs` FOREIGN KEY (`id_kursi`) REFERENCES `kursi` (`id_kursi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tkt_mmtr` FOREIGN KEY (`id_memutar`) REFERENCES `memutar` (`id_memutar`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
