-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Mar 2023 pada 12.36
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengaduan_masyarakat`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `masyarakat`
--

CREATE TABLE `masyarakat` (
  `nik` int(11) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `telp` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `masyarakat`
--

INSERT INTO `masyarakat` (`nik`, `nama`, `username`, `password`, `telp`, `role_id`) VALUES
(4343, 'adil', 'adil', 'adil', 231312, 0),
(123123, 'salman', 'sallena', 'lala', 213123, 1),
(213123, 'salman', 'sallena', 'salman', 2341234, 0),
(2138102, 'tegar firmansyah', 'tegarfirman', 'tfss123', 234234, 3),
(35341231, 'Tegar Firmansyah', 'tegarfirmasnyah', 'tegarfirmasnyah123', 835561432, 3),
(76432548, 'rizki', 'rizki', 'rizki', 123123, 0),
(279271927, 'salman ilham shalihan', 'shalihanilham', 'nijuunikyuu', 67567, 3),
(1221323213, 'ihsan', 'sanji', 'sanji', 1312312, 3),
(2147483647, 'tiwi', 'pratiwi', '1234', 9881234, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `tgl_pengaduan` datetime NOT NULL DEFAULT current_timestamp(),
  `nik` int(11) NOT NULL,
  `isi_laporan` text NOT NULL,
  `foto` varchar(256) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `tgl_pengaduan`, `nik`, `isi_laporan`, `foto`, `status`) VALUES
(28, '2023-03-13 02:34:15', 123123, 'kebakaran', 'bakar.jpg', 'selesai'),
(29, '2023-03-13 02:59:55', 123123, 'ubah jadi register', 'login_mockup.png', 'selesai'),
(30, '2023-03-13 04:36:33', 123123, 'buat di database', 'ClassDiagramPengaduan.png', 'proses '),
(31, '2023-03-14 00:48:42', 2138102, 'bangunan rusak tolong di perbaiki', 'bangunan.jpg', 'selesai'),
(32, '2023-03-14 00:51:28', 123123, 'ganti wallpaper', 'windows_xp.jpg', 'proses '),
(33, '2023-03-15 08:02:19', 4343, 'jadikan wallpaper', 'windows_xp1.jpg', 'proses '),
(34, '2023-03-16 03:54:31', 76432548, 'buatkan activity diagram ', 'usecase.PNG', 'selesai'),
(36, '2023-03-16 20:53:00', 123123, '', 'sequence_masyarakat.png', 'proses '),
(37, '2023-03-16 20:54:36', 123123, 'sdfsdf', 'relasitabel.png', 'selesai'),
(42, '2023-03-16 21:43:31', 123123, 'sasaa', 'sequence_admin1.png', 'selesai'),
(49, '2023-03-19 05:50:54', 123123, 'safafa', 'ActivityPetugas3.png', 'selesai'),
(50, '2023-03-19 05:51:48', 123123, 'bangunan di komplek simpay asih roboh karena gempa', 'bangunan1.jpg', 'selesai'),
(51, '2023-03-19 21:55:36', 2138102, 'perbaiki jalan rusak di jln golf', 'jlnrusak.jpg', 'selesai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `telpon` int(11) NOT NULL,
  `level` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `telpon`, `level`) VALUES
(22222, 'admin', 'admin', 'admin123', 867547609, '1'),
(2123412313, 'ridho alfarizi', 'riozi', 'ridho123', 826271828, '2');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tangapan`
--

CREATE TABLE `tangapan` (
  `id_tangapan` int(11) NOT NULL,
  `id_pengaduan` int(11) NOT NULL,
  `tgl_tangapan` date NOT NULL DEFAULT current_timestamp(),
  `tangapan` text NOT NULL,
  `foto_tangapan` varchar(200) NOT NULL,
  `id_petugas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tangapan`
--

INSERT INTO `tangapan` (`id_tangapan`, `id_pengaduan`, `tgl_tangapan`, `tangapan`, `foto_tangapan`, `id_petugas`) VALUES
(27, 28, '2023-03-13', 'berhasil di padamkan', 'selokan-tersumbat-sampah-air-hujan-meluap-ke-perkampungan_m_2223631.jpg', 22222),
(28, 29, '2023-03-13', 'sudah di ubah', 'register_mockup.png', 22222),
(29, 34, '2023-03-16', 'sudah beres', 'ActivityMasyarakat.png', 22222),
(30, 37, '2023-03-16', 'jalan sudah di perbaiki', 'ActivityMasyarakat3.png', 22222),
(31, 42, '2023-03-19', 'tes', 'flowchart.PNG', 22222),
(32, 49, '2023-03-19', 'tes', 'ActivityMasyarakat4.png', 22222),
(33, 50, '2023-03-19', 'tes', 'landingpage.PNG', 22222),
(34, 31, '2023-03-19', 'bangunan sedang di bangun kembali', 'bangunanbaru.jpg', 22222),
(35, 51, '2023-03-19', 'jalan sedang di perbaiki', 'perbaiki.jpg', 22222);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `masyarakat`
--
ALTER TABLE `masyarakat`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `nik` (`nik`);

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indeks untuk tabel `tangapan`
--
ALTER TABLE `tangapan`
  ADD PRIMARY KEY (`id_tangapan`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_pengaduan` (`id_pengaduan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT untuk tabel `tangapan`
--
ALTER TABLE `tangapan`
  MODIFY `id_tangapan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`nik`) REFERENCES `masyarakat` (`nik`);

--
-- Ketidakleluasaan untuk tabel `tangapan`
--
ALTER TABLE `tangapan`
  ADD CONSTRAINT `tangapan_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `tangapan_ibfk_2` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
