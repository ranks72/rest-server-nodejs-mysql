-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Mar 2022 pada 16.58
-- Versi server: 10.1.31-MariaDB
-- Versi PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ideamart`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` int(20) NOT NULL,
  `users_id` int(11) NOT NULL,
  `questions_id` int(11) NOT NULL,
  `answer` varchar(50) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id` int(20) NOT NULL,
  `category` varchar(200) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id`, `category`, `createdAt`, `updatedAt`) VALUES
(1, 'mandatory', '2021-11-27 13:04:24', '2021-11-27 13:04:24'),
(2, 'choice based', '2021-11-27 13:04:41', '2021-11-27 13:04:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `feedback`
--

CREATE TABLE `feedback` (
  `id` int(20) NOT NULL,
  `users_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `feedback` longtext NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` int(20) NOT NULL,
  `question` longtext NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `questions`
--

INSERT INTO `questions` (`id`, `question`, `sub_cat_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Pusat Karier memiliki visi dan misi yang jelas?', 1, '2021-11-27 13:09:35', '2021-11-27 13:09:35'),
(2, 'Tujuan dari Pusat Karier telah difahami dengan baik oleh seluruh pengguna layanan\r\n', 1, '2021-11-27 13:10:13', '2021-11-27 13:09:35'),
(3, 'Pusat Karier memberikan layanan konsisten dengan tujuan', 1, '2021-11-27 13:10:13', '2021-11-27 13:09:35'),
(4, 'Informasi layanan Pusat Karier mudah diakses', 1, '2021-11-27 13:11:04', '2021-11-27 13:09:35'),
(5, 'Konten Media Pusat Karier informatif', 2, '2021-11-27 13:11:04', '2021-11-27 13:09:35'),
(6, 'Presentasi Media Pusat Karier Menarik', 2, '2021-12-02 03:46:08', '2021-11-27 13:09:35'),
(7, 'Konten Media Pusat Karier mudah difahami', 2, '2021-12-02 03:47:10', '2021-11-27 13:09:35'),
(8, 'Konten Media Pusat Karier sesuai dengan kebutuhan karier', 2, '2021-12-02 03:47:10', '2021-11-27 13:09:35'),
(9, 'Saya senang mengikuti sosial media Pusat Karier', 3, '2021-12-02 03:49:00', '2021-11-27 13:09:35'),
(10, 'Saya akan merekomendasikan teman untuk menjadi pengikut sosial media Pusat Karier', 3, '2021-12-02 03:49:00', '2021-11-27 13:09:35'),
(11, 'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier di industri', 3, '2021-12-02 03:49:39', '2021-11-27 13:09:35'),
(12, 'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier sebagai wirausaha', 3, '2021-12-02 03:49:39', '2021-11-27 13:09:35'),
(13, 'Pusat Karier memberikan layanan yang saya butuhkan untuk mempersiapkan karier untuk studi lanjut', 3, '2021-12-02 03:51:08', '2021-11-27 13:09:35'),
(14, 'Prosedur kerjasama sudah dapat dipahami dengan baik', 4, '2021-12-02 03:51:08', '2021-11-27 13:09:35'),
(15, 'Admin Pusat Karier cepat menanggapi e-mail yang masuk', 4, '2021-12-02 03:51:08', '2021-11-27 13:09:35'),
(16, 'Pusat Karier mengurus persuratan yang dibutuhkan dengan cepat', 4, '2021-12-02 03:51:08', '2021-11-27 13:09:35'),
(17, 'Kegiatan yang dibuat Pusat Karier sesuai dengan kebutuhan mahasiswa dan alumni', 5, '2021-12-02 03:53:18', '2021-11-27 13:09:35'),
(18, 'Kegiatan yang diadakan pusat karier relevan dengan perkembangan dunia karier masa kini', 5, '2021-12-02 03:53:18', '2021-11-27 13:09:35'),
(19, 'Kegiatan Pusat Karier dapat meningkatkan kemampuan mahasiswa/alumni untuk lebih siap memasuki dunia karier', 5, '2021-12-02 03:53:18', '2021-11-27 13:09:35'),
(20, 'Variasi kegiatan Pusat Karier memberikan saya motivasi untuk mempersiapkan karier yang excellent', 5, '2021-12-02 03:53:18', '2021-11-27 13:09:35'),
(21, 'Narasumber kegiatan Pusat Karier adalah mereka yang profesional di bidangnya', 5, '2021-12-02 03:53:18', '2021-11-27 13:09:35'),
(22, 'Sertifikat keikutsertaan kegiatan Pusat Karier diterima tepat pada waktunya', 5, '2021-12-02 03:55:09', '2021-11-27 13:09:35'),
(23, 'Saya senang mengikuti kegiatan Pusat Karier', 5, '2021-12-02 03:55:09', '2021-11-27 13:09:35'),
(24, 'Saya mendapatkan manfaat dari kegiatan yang diselenggarakan Pusat Karier', 6, '2021-12-02 03:56:56', '2021-11-27 13:09:35'),
(25, 'Saya senang dengan kesempatan yang diberikan Pusat Karier dalam program terstrukturnya', 6, '2021-12-02 03:56:56', '2021-11-27 13:09:35'),
(26, 'Saya mendapatkan alternatif yang cukup memadai untuk meningkatkan pengetahuan dan kompetensi yang saya inginkan', 6, '2021-12-02 03:56:56', '2021-11-27 13:09:35'),
(27, 'Saya termotivasi untuk mengembangkan keterampilan baru setelah mengikuti kegiatan Pusat Karier', 6, '2021-12-02 03:56:56', '2021-11-27 13:09:35'),
(28, 'Data tracer study mudah diakses prodi', 7, '2021-12-02 03:58:40', '2021-11-27 13:09:35'),
(29, 'Pusat Karier merespon cepat kebutuhan data', 7, '2021-12-02 03:58:40', '2021-11-27 13:09:35'),
(30, 'Pusat Karier memberikan data yang dibutuhkan', 7, '2021-12-02 03:58:40', '2021-11-27 13:09:35'),
(31, 'Pusat Karier memberikan data yang dapat dipertanggungjawabkan', 7, '2021-12-02 03:58:40', '2021-11-27 13:09:35'),
(32, 'Pusat Karier memberikan data yang akurat', 7, '2021-12-02 03:58:40', '2021-11-27 13:09:35'),
(33, 'Prosedur kerjasama media partner dapat difahami dengan baik', 8, '2021-12-02 04:00:47', '2021-11-27 13:09:35'),
(34, 'Pusat Karier menawarkan kerjasama media partner yang fair', 8, '2021-12-02 04:00:47', '2021-11-27 13:09:35'),
(35, 'Kerjasama sebaaai media partner dengan Pusat Karier memberikan pengaruh positif terhdap kegiatan yang diselenggarakan', 8, '2021-12-02 04:00:47', '2021-11-27 13:09:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_cat`
--

CREATE TABLE `sub_cat` (
  `id` int(20) NOT NULL,
  `sub_cat` varchar(200) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sub_cat`
--

INSERT INTO `sub_cat` (`id`, `sub_cat`, `category_id`, `createdAt`, `updatedAt`) VALUES
(1, 'Pengelola', 1, '2021-11-27 13:07:19', '2021-11-27 13:07:19'),
(2, 'Media Sosial', 1, '2021-11-27 13:07:19', '2021-12-02 03:36:19'),
(3, 'Organizational Belonging', 1, '2021-11-27 13:07:44', '2021-12-02 03:39:05'),
(4, 'Administration', 1, '2021-11-27 13:08:16', '2021-12-02 03:39:12'),
(5, 'Event', 1, '2021-11-27 13:08:33', '2021-11-27 13:08:33'),
(6, 'Pengembangan Diri', 1, '2021-12-02 03:39:49', '2021-12-02 03:39:49'),
(7, 'Data Services', 2, '2021-12-02 03:40:20', '2021-12-02 03:40:20'),
(8, 'Media Partner', 2, '2021-12-02 03:40:20', '2021-12-02 03:40:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone` longtext NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `username` longtext NOT NULL,
  `password` varchar(255) NOT NULL,
  `job_desc` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `login_type` varchar(255) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `phone`, `email`, `username`, `password`, `job_desc`, `hash`, `login_type`, `createdAt`, `updatedAt`, `image`) VALUES
(1, 'Fazza', 'Mufti', '082122484154', 'fazza.mufti18@mhs.uinjkt.ac.id', 'fazza_mufti', '', '', '', '', '2022-02-02 15:12:25', '2022-02-02 15:12:44', NULL),
(2, 'Maliki', 'karim', '085257788423', 'maliki22@gmail.com', 'maliki_72', '', '', '', '', '2022-02-02 15:12:25', '2022-02-02 15:12:44', NULL),
(3, 'Jason', 'Watmore', '082122484153', 'Watmore@gmail.co.id', 'testinglagi', '', '', '', 'mahasiswa', '2022-02-02 16:48:08', '2022-02-02 16:48:08', NULL),
(11, 'Jason', 'Watmore', '082122484153', 'Watmore@gmail.co.id', 'testinglagi2242', '$2a$10$ZBqNSceulmhxQsxa70j4aO5/nwpaxzKslmcPHY.Qxj5J888M4xjh.', '', '', 'mahasiswa', '2022-02-03 15:44:40', '2022-02-03 15:44:40', NULL),
(12, 'Risya', 'dhana', '081213697925', 'risyadhana@gmail.com', 'dhansstar', '$2a$10$wzQigHgzSh8yPY/e3AIK1OcVJzEAEEDwDv/Srab4o50WJGUrxOnDO', '', '', 'mahasiswa', '2022-03-01 05:36:51', '2022-03-01 05:36:51', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `questions_id` (`questions_id`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `sub_cat_id` (`sub_cat_id`);

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_cat_id` (`sub_cat_id`);

--
-- Indeks untuk tabel `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `sub_cat`
--
ALTER TABLE `sub_cat`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_cat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`sub_cat_id`) REFERENCES `sub_cat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `sub_cat`
--
ALTER TABLE `sub_cat`
  ADD CONSTRAINT `sub_cat_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
