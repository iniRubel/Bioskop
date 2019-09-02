-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2019 at 09:57 PM
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
-- Database: `silverlight cinema`
--

-- --------------------------------------------------------

--
-- Table structure for table `bioskop`
--

CREATE TABLE `bioskop` (
  `id_bioskop` varchar(10) NOT NULL,
  `nama_bioskop` varchar(30) NOT NULL,
  `alamat` varchar(120) NOT NULL,
  `no_telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bioskop`
--

INSERT INTO `bioskop` (`id_bioskop`, `nama_bioskop`, `alamat`, `no_telp`) VALUES
('BSK-001', 'Center Point Silver Light', 'Central Point Mall Lt.3A Jl. Pradana No.9', '06180748881'),
('BSK-002', 'Ring Road Silver Light', 'Jl. Gagak Hitam No.28', '06180748882'),
('BSK-003', 'Jamtos Silver Light', 'Jl. Kapten A. Bakaruddin No.88', '06180748883'),
('BSK-004', 'Mezanin Silver Light', 'Mezanin Mega Mall Lt.4 Jl. Jendral Sudirman No.1', '06180748884'),
('BSK-005', 'WTC Silver Light', 'Willipop Trade Center Lt.3 Jl. Sultan Tahaha No.17', '06180748885'),
('BSK-006', 'Margo Silver Light', 'Margo Mall Lt.2 Jl. Margonda Raya No358', '06180748886'),
('BSK-007', 'Joyko Silver Light', 'Jl. Indragiri No.12', '06180748887'),
('BSK-008', 'Cinere Silver Light', 'Cinere Mall Lt.4', '06180748888'),
('BSK-009', 'Bencoolen Silver Light', 'Bencoolen Mall Lt. Dasar', '06180748889'),
('BSK-010', 'Twivortiare Silver Light', 'Vort Trade Center Lt.2 Jl. Pariwisata No.1', '06180748810');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id_film` varchar(10) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `sinopsis` text NOT NULL,
  `durasi` varchar(10) NOT NULL,
  `sutradara` varchar(30) NOT NULL,
  `link_trailer` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id_film`, `judul`, `sinopsis`, `durasi`, `sutradara`, `link_trailer`) VALUES
('FLM-001', 'Ready or Not', 'A bride\'s wedding night takes a sinister turn when her eccentric new in-laws force her to take part in a terrifying game. ', '1h 35min', 'Matt Bettinelli-Olpin, Tyler G', 'https://www.youtube.com/watch?v=ZtYTwUxhAoI'),
('FLM-002', 'Gundala', 'Indonesia\'s preeminent comic book superhero and his alter ego Sancaka enter the cinematic universe to battle the wicked Pengkor and his diabolical squad of orph', '2h 3min', 'Joko Anwar', 'https://www.youtube.com/watch?v=8rauD1vxMCw'),
('FLM-003', 'Twivortiare', 'Pertama mereka bertemu, langsung jatuh cinta. Dalam hitungan bulan, mereka menikah. Setelah dua tahun, setelah lelah dengan semua konflik dan pertengkaran yang ', '1h 43min', 'Benni Setiawan', 'https://www.youtube.com/watch?v=dh2rJbFsJRo'),
('FLM-004', 'Bumi Manusia', 'ni adalah kisah dua anak manusia yang meramu cinta di atas pentas pergelutan tanah kolonial awal abad 20. Inilah kisah Minke dan Annelies. Cinta yang hadir di h', '3h 1min', 'Hanung Bramantyo', 'https://www.youtube.com/watch?v=2BYJaVz_wpM'),
('FLM-005', 'Weathering with You', 'A high-school boy who has run away to Tokyo befriends a girl who appears to be able to manipulate the weather.', '1h 51min', '1h 51min', 'Makoto Shinkai'),
('FLM-006', 'It Chapter Two', 'Twenty-seven years after their first encounter with the terrifying Pennywise, the Losers Club have grown up and moved away, until a devastating phone call bring', '2h 49min ', 'Andy Muschietti', 'https://www.youtube.com/watch?v=xhJ5P7Up3jA'),
('FLM-007', 'Once Upon a Time in Hollywood', 'A faded television actor and his stunt double strive to achieve fame and success in the film industry during the final years of Hollywood\'s Golden Age in 1969 L', '2h 41min', 'Quentin Tarantino', 'https://www.youtube.com/watch?v=ELeMaP8EPAA'),
('FLM-008', 'Sadako', 'A group of people must find out how to stop the newborn deadly curse, which has born and gone viral after a Youtuber accidentally captured a vengeful ghost on c', '1h 39min', 'Hideo Nakata', 'https://www.youtube.com/watch?v=4LYK0rTjlM8'),
('FLM-009', 'Ad Astra', 'Astronaut Roy McBride undertakes a mission across an unforgiving solar system to uncover the truth about his missing father and his doomed expedition that now, ', '2h 4min', 'James Gray', 'https://www.youtube.com/watch?v=nxi6rtBtBM0'),
('FLM-010', 'Makmum', 'Dari film pendek peraih berbagai penghargaan karya Riza Pahlevi. Sosok ghaib yang disebut MAKMUM oleh para penghuni asrama semakin sering mengganggu sejak RINI ', '1h 35m', 'Hadrah Daeng Ratu', 'https://www.youtube.com/watch?v=Ks0rYwutbXQ');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` varchar(10) NOT NULL,
  `jam` time NOT NULL,
  `tanggal` date NOT NULL,
  `id_film` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `jam`, `tanggal`, `id_film`) VALUES
('JDW-01', '11:15:00', '2019-09-04', 'FLM-001'),
('JDW-02', '13:15:00', '2019-09-04', 'FLM-001'),
('JDW-03', '15:15:00', '2019-09-04', 'FLM-001'),
('JDW-04', '17:15:00', '2019-09-04', 'FLM-001'),
('JDW-05', '19:15:00', '2019-09-04', 'FLM-001'),
('JDW-06', '12:45:00', '2019-09-04', 'FLM-002'),
('JDW-07', '14:45:00', '2019-09-04', 'FLM-002'),
('JDW-08', '16:45:00', '2019-09-04', 'FLM-002'),
('JDW-09', '18:45:00', '2019-09-04', 'FLM-002'),
('JDW-10', '20:45:00', '2019-09-04', 'FLM-002');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_user` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `status`, `id_user`) VALUES
('KRJ-01', 1, 'USR-001'),
('KRJ-02', 1, 'USR-002'),
('KRJ-03', 1, 'USR-003'),
('KRJ-04', 1, 'USR-004'),
('KRJ-05', 1, 'USR-005'),
('KRJ-06', 1, 'USR-006'),
('KRJ-07', 1, 'USR-007'),
('KRJ-08', 1, 'USR-008'),
('KRJ-09', 1, 'USR-009'),
('KRJ-10', 1, 'USR-010');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang_makmin`
--

CREATE TABLE `keranjang_makmin` (
  `id_krj_makmin` varchar(10) NOT NULL,
  `id_keranjang` varchar(10) NOT NULL,
  `id_stock` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keranjang_makmin`
--

INSERT INTO `keranjang_makmin` (`id_krj_makmin`, `id_keranjang`, `id_stock`) VALUES
('JM-001', 'KRJ-01', 'STK01-10'),
('JM-002', 'KRJ-01', 'STK01-09'),
('JM-003', 'KRJ-06', 'STK01-05'),
('JM-004', 'KRJ-06', 'STK01-03'),
('JM-005', 'KRJ-03', 'STK01-03'),
('JM-006', 'KRJ-02', 'STK01-05'),
('JM-007', 'KRJ-09', 'STK01-05'),
('JM-008', 'KRJ-09', 'STK01-06'),
('JM-009', 'KRJ-09', 'STK01-10'),
('JM-010', 'KRJ-09', 'STK01-09');

-- --------------------------------------------------------

--
-- Table structure for table `kursi`
--

CREATE TABLE `kursi` (
  `id_kursi` varchar(10) NOT NULL,
  `row` varchar(2) NOT NULL,
  `nomor` int(40) NOT NULL,
  `id_theater` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kursi`
--

INSERT INTO `kursi` (`id_kursi`, `row`, `nomor`, `id_theater`) VALUES
('0xpUxcFvpB', 'A', 1, 'THR-001'),
('axfUClJSmw', 'B', 1, 'THR-001'),
('CfNzj8Qsl6', 'A', 2, 'THR-001'),
('DHdJ32cSjT', 'B', 5, 'THR-001'),
('DUbqIBfTCB', 'B', 2, 'THR-001'),
('GpAwQzVWcw', 'A', 4, 'THR-001'),
('munbdoYYI0', 'A', 5, 'THR-001'),
('wHzRx9Pn8s', 'B', 3, 'THR-001'),
('xHHGHQtvFT', 'B', 4, 'THR-001'),
('xvDo7eZwVY', 'A', 3, 'THR-001');

-- --------------------------------------------------------

--
-- Table structure for table `makmin`
--

CREATE TABLE `makmin` (
  `id_makmin` varchar(10) NOT NULL,
  `nama_makmin` varchar(30) NOT NULL,
  `deskripsi` varchar(120) NOT NULL,
  `harga` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makmin`
--

INSERT INTO `makmin` (`id_makmin`, `nama_makmin`, `deskripsi`, `harga`) VALUES
('MKIN-001', 'French Fries', 'French Fries 200g', 40000),
('MKIN-002', 'Beef Hot Dog', 'Beef Hot Dog', 40000),
('MKIN-003', 'Chicken Hod Dog', 'Chicken Hod Dog', 40000),
('MKIN-004', 'Fishball Satay', '1 Portion 3 Sticks', 30000),
('MKIN-005', 'Medium Milo', 'Medium Milo', 22000),
('MKIN-006', '600ml Aqua ', '600ml Aqua ', 16000),
('MKIN-007', 'L. Sweet Popcorn', 'L. Sweet Popcorn', 47000),
('MKIN-008', 'L. Salty Popcorn', 'L. Salty Popcorn', 37000),
('MKIN-009', 'J. Mixed Popcorn', 'J. Mixed Popcorn', 65000),
('MKIN-010', 'Natcos with Cheese', 'Natcos with Cheese', 40000);

-- --------------------------------------------------------

--
-- Table structure for table `makmin_stock`
--

CREATE TABLE `makmin_stock` (
  `id_stock` varchar(10) NOT NULL,
  `stock` smallint(6) NOT NULL,
  `id_bioskop` varchar(10) NOT NULL,
  `id_makmin` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `makmin_stock`
--

INSERT INTO `makmin_stock` (`id_stock`, `stock`, `id_bioskop`, `id_makmin`) VALUES
('STK01-01', 200, 'BSK-001', 'MKIN-001'),
('STK01-02', 234, 'BSK-001', 'MKIN-002'),
('STK01-03', 265, 'BSK-001', 'MKIN-003'),
('STK01-04', 242, 'BSK-001', 'MKIN-004'),
('STK01-05', 278, 'BSK-001', 'MKIN-005'),
('STK01-06', 300, 'BSK-001', 'MKIN-006'),
('STK01-07', 300, 'BSK-001', 'MKIN-007'),
('STK01-08', 298, 'BSK-001', 'MKIN-008'),
('STK01-09', 264, 'BSK-001', 'MKIN-009'),
('STK01-10', 250, 'BSK-001', 'MKIN-010');

-- --------------------------------------------------------

--
-- Table structure for table `theater`
--

CREATE TABLE `theater` (
  `id_theater` varchar(10) NOT NULL,
  `no_theater` int(30) NOT NULL,
  `id_bioskop` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `theater`
--

INSERT INTO `theater` (`id_theater`, `no_theater`, `id_bioskop`) VALUES
('THR-001', 1, 'BSK-001'),
('THR-002', 2, 'BSK-001'),
('THR-003', 3, 'BSK-001'),
('THR-004', 4, 'BSK-001'),
('THR-005', 5, 'BSK-001'),
('THR-006', 6, 'BSK-001'),
('THR-007', 7, 'BSK-001'),
('THR-008', 1, 'BSK-002'),
('THR-009', 2, 'BSK-002'),
('THR-010', 3, 'BSK-002');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `harga` mediumint(11) NOT NULL,
  `id_kursi` varchar(10) NOT NULL,
  `id_jadwal` varchar(10) NOT NULL,
  `id_keranjang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `status`, `harga`, `id_kursi`, `id_jadwal`, `id_keranjang`) VALUES
('2e8nMbtsSH', 1, 30000, '0xpUxcFvpB', 'JDW-01', 'KRJ-01'),
('5tA4cH0iNT', 1, 30000, 'DUbqIBfTCB', 'JDW-01', 'KRJ-09'),
('6yg9MUhahJ', 1, 30000, 'xvDo7eZwVY', 'JDW-01', 'KRJ-07'),
('7ZiTq0K0Mv', 1, 30000, 'xHHGHQtvFT', 'JDW-01', 'KRJ-08'),
('9RKkMsLnCA', 1, 30000, 'DHdJ32cSjT', 'JDW-01', 'KRJ-05'),
('CpqNqCxSJn', 1, 30000, 'GpAwQzVWcw', 'JDW-01', 'KRJ-10'),
('i4LRYnJCEd', 1, 30000, 'axfUClJSmw', 'JDW-01', 'KRJ-06'),
('JigT7nFitG', 1, 30000, 'munbdoYYI0', 'JDW-01', 'KRJ-04'),
('VDMbCaGflq', 1, 30000, 'CfNzj8Qsl6', 'JDW-01', 'KRJ-03'),
('zfWI714uO3', 1, 30000, 'wHzRx9Pn8s', 'JDW-01', 'KRJ-02');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `nama`, `tgl_lahir`) VALUES
('USR-001', 'AISugiarto@example.com', '491481', 'Adi Iskandar Sugiarto', '1999-08-01'),
('USR-002', 'salimindra@example.com', '377211', 'Hendri Indra Salim', '1999-09-21'),
('USR-003', 'megayanti@example.com', '901978', 'Mega Yanti Gunardi', '1998-12-14'),
('USR-004', 'yujunanggono@example.com', '920381', 'Anggono Yu-jun', '1998-04-20'),
('USR-005', 'sasmitabatari09@example.com', '690492', 'Sinta Batari Sasmita', '1997-04-12'),
('USR-006', 'claudius765@example.com', '653855', 'Claudius Lingga', '2000-10-02'),
('USR-007', '02ratna@example.com', '118119', 'Ratna Fanny Setiabudi', '1998-11-11'),
('USR-008', 'dracullasibabita@example.com', '845020', 'Drusilla Sibabiat', '1999-08-20'),
('USR-009', 'suying@example.com', '868699', 'Handoyo Suyin', '2000-01-15'),
('USR-010', 'lonyeka@example.com', '862918', 'Eka Leony Lesmana', '1998-12-25');

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
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `menayangkan` (`id_film`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`),
  ADD KEY `dibayar` (`id_user`);

--
-- Indexes for table `keranjang_makmin`
--
ALTER TABLE `keranjang_makmin`
  ADD PRIMARY KEY (`id_krj_makmin`),
  ADD KEY `relasi` (`id_stock`),
  ADD KEY `relasi2` (`id_keranjang`);

--
-- Indexes for table `kursi`
--
ALTER TABLE `kursi`
  ADD PRIMARY KEY (`id_kursi`),
  ADD KEY `berada` (`id_theater`);

--
-- Indexes for table `makmin`
--
ALTER TABLE `makmin`
  ADD PRIMARY KEY (`id_makmin`);

--
-- Indexes for table `makmin_stock`
--
ALTER TABLE `makmin_stock`
  ADD PRIMARY KEY (`id_stock`),
  ADD KEY `dijual` (`id_bioskop`),
  ADD KEY `memiliki` (`id_makmin`);

--
-- Indexes for table `theater`
--
ALTER TABLE `theater`
  ADD PRIMARY KEY (`id_theater`),
  ADD KEY `dimiliki` (`id_bioskop`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `menempati` (`id_kursi`),
  ADD KEY `kapan` (`id_jadwal`),
  ADD KEY `which_keranjang` (`id_keranjang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `menayangkan` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD CONSTRAINT `dibayar` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `keranjang_makmin`
--
ALTER TABLE `keranjang_makmin`
  ADD CONSTRAINT `relasi` FOREIGN KEY (`id_stock`) REFERENCES `makmin_stock` (`id_stock`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi2` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id_keranjang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kursi`
--
ALTER TABLE `kursi`
  ADD CONSTRAINT `berada` FOREIGN KEY (`id_theater`) REFERENCES `theater` (`id_theater`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `makmin_stock`
--
ALTER TABLE `makmin_stock`
  ADD CONSTRAINT `dijual` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id_bioskop`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `memiliki` FOREIGN KEY (`id_makmin`) REFERENCES `makmin` (`id_makmin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theater`
--
ALTER TABLE `theater`
  ADD CONSTRAINT `dimiliki` FOREIGN KEY (`id_bioskop`) REFERENCES `bioskop` (`id_bioskop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `kapan` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menempati` FOREIGN KEY (`id_kursi`) REFERENCES `kursi` (`id_kursi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `which_keranjang` FOREIGN KEY (`id_keranjang`) REFERENCES `keranjang` (`id_keranjang`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SELECT * FROM `bioskop`;
SELECT * FROM `film`;
SELECT * FROM `jadwal`;
SELECT * FROM `keranjang`;
SELECT * FROM `keranjang_makmin`;
SELECT * FROM `kursi`;
SELECT * FROM `makmin`;
SELECT * FROM `makmin_stock`;
SELECT * FROM `theater`;
SELECT * FROM `tiket`;
SELECT * FROM `user`;
