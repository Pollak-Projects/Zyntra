-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Feb 12. 11:22
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `zyntra`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `businesses`
--

CREATE TABLE `businesses` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `businesses`
--

INSERT INTO `businesses` (`id`, `name`, `category`, `address`, `phone`, `website`, `created_at`) VALUES
(1, 'Rózsa Ristorante', 'Magyar', 'Horthy krt. 40', '626262', 'rozsa.hu', '2025-02-10 12:13:30'),
(2, 'Gyümi Vendéglő', 'Magyar', 'Mindsznet', '6734', 'www.gyumi.eu', '2025-02-10 13:09:58'),
(3, 'Klugscheisser', 'Német', 'München', '7638726347', 'www.klugscheisser.de', '2025-02-12 10:31:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Olasz', '2025-02-10 12:10:44'),
(2, 'Magyar', '2025-02-10 12:10:44'),
(3, 'Japán', '2025-02-10 12:41:09'),
(4, 'Német', '2025-02-10 12:41:09'),
(5, 'Mexikói', '2025-02-11 12:14:07'),
(6, 'Spanyol', '2025-02-12 10:20:11'),
(7, 'Ausztrál', '2025-02-12 10:20:11');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `uploaded_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `photos`
--

INSERT INTO `photos` (`id`, `business_id`, `photo_url`, `uploaded_at`) VALUES
(1, 1, 'www.g.com', '2025-02-10 12:56:40');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_avatar` varchar(500) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `business_id` int(11) NOT NULL,
  `business_name` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `user_avatar`, `user_name`, `business_id`, `business_name`, `rating`, `comment`, `created_at`) VALUES
(8, 9, 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'Gábor Varga', 1, 'Rózsa Ristorante', 2, 'ds', '2025-02-12 09:39:06'),
(9, 8, 'https://yt3.googleusercontent.com/FdUVbS9sWu6qJn_enrduD9zB5_le9T-RcPJNP-mOcjKVU0JmPCKeFjicdjfbipcRWWgEslZs2Q=s900-c-k-c0x00ffffff-no-rj', 'Bournemouth', 2, 'Gyümi Vendéglő', 5, 'verynlvélojbkasfdgv vorp', '2025-02-12 10:19:14'),
(12, 4, 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Rooster04_adjusted.jpg/260px-Rooster04_adjusted.jpg', 'Anna Szabó', 2, 'Gyümi Vendéglő', 3, 'd', '2025-02-12 10:24:02'),
(13, 11, 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'István Horváth', 1, 'Rózsa Ristorante', 3, 'dsf', '2025-02-12 10:25:40'),
(14, 14, 'https://pollak.hu/_next/image?url=https%3A%2F%2Fhod-szentesi.cms.intezmeny.edir.hu%2Fuploads%2Fthumbnail_pollak_logo_nev_nelkul_pe7mqc154hwuby07ff5ln4w6cauhj48lw4u02ljvt8_c2ff7553fe.png&w=256&q=90', 'aguw aoiwdha', 2, 'Gyümi Vendéglő', 5, 'awdiuhuhmmbmmbmbmbm', '2025-02-12 10:28:32'),
(15, 6, 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Brown_Leghorn_rooster_in_Australia.jpg/260px-Brown_Leghorn_rooster_in_Australia.jpg', 'Csaba Tóth', 3, 'Klugscheisser', 5, 'ACHTUNG', '2025-02-12 10:32:21');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `password`, `created_at`) VALUES
(2, 'poer ztae', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Rooster04_adjusted.jpg/260px-Rooster04_adjusted.jpg', 'hthee@ahw.com', 'aefhukku', '2025-02-11 12:04:38'),
(3, 'zawteb moals', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Brown_Leghorn_rooster_in_Australia.jpg/260px-Brown_Leghorn_rooster_in_Australia.jpg', 'ahziazwe5@au.com', 'awhudgia', '2025-02-11 12:12:48'),
(4, 'Anna Szabó', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'anna.s@domain.com', 'pass1234', '2025-02-12 10:00:00'),
(5, 'Béla Kovács', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'bela.k@domain.com', 'secret5678', '2025-02-12 10:05:00'),
(6, 'Csaba Tóth', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'csaba.t@domain.com', 'qwerty9876', '2025-02-12 10:10:00'),
(7, 'Dóra Farkas', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'dora.f@domain.com', 'dora2025', '2025-02-12 10:15:00'),
(8, 'Bournemouth', 'https://yt3.googleusercontent.com/FdUVbS9sWu6qJn_enrduD9zB5_le9T-RcPJNP-mOcjKVU0JmPCKeFjicdjfbipcRWWgEslZs2Q=s900-c-k-c0x00ffffff-no-rj', 'erik.nagy@domain.com', 'erik12345', '2025-02-12 10:20:00'),
(9, 'Gábor Varga', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'gabor.v@domain.com', 'gabor_567', '2025-02-12 10:25:00'),
(10, 'Hanna Kovács', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'hanna.k@domain.com', 'hanna4567', '2025-02-12 10:30:00'),
(11, 'István Horváth', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'istvan.h@domain.com', 'password6789', '2025-02-12 10:35:00'),
(12, 'Júlia Tóth', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'julia.t@domain.com', 'julia@2025', '2025-02-12 10:40:00'),
(13, 'Károly Molnár', 'https://wallpapers.com/images/hd/basic-default-pfp-pxi77qv5o0zuz8j3.jpg', 'karoly.m@domain.com', 'karoly_2025', '2025-02-12 10:45:00'),
(14, 'aguw aoiwdha', 'https://pollak.hu/_next/image?url=https%3A%2F%2Fhod-szentesi.cms.intezmeny.edir.hu%2Fuploads%2Fthumbnail_pollak_logo_nev_nelkul_pe7mqc154hwuby07ff5ln4w6cauhj48lw4u02ljvt8_c2ff7553fe.png&w=256&q=90', 'huawhd@agztwud.eu', 'awDAWDAD2223', '2025-02-12 10:28:00');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- A tábla indexei `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_id` (`business_id`);

--
-- A tábla indexei `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `business_id` (`business_id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `business_name` (`business_name`),
  ADD KEY `user_avatar` (`user_avatar`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `avatar` (`avatar`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `businesses`
--
ALTER TABLE `businesses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `photos`
--
ALTER TABLE `photos`
  ADD CONSTRAINT `photos_ibfk_1` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`business_id`) REFERENCES `businesses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`user_avatar`) REFERENCES `users` (`avatar`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`user_name`) REFERENCES `users` (`name`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_5` FOREIGN KEY (`business_name`) REFERENCES `businesses` (`name`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
