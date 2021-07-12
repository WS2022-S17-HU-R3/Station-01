-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2021. Júl 12. 09:55
-- Kiszolgáló verziója: 10.4.19-MariaDB
-- PHP verzió: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `skills_it_01`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `accomodations`
--

CREATE TABLE `accomodations` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_hungarian_ci NOT NULL,
  `price` float NOT NULL,
  `description` text COLLATE utf8_hungarian_ci NOT NULL,
  `img` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `accomodations`
--

INSERT INTO `accomodations` (`id`, `name`, `price`, `description`, `img`) VALUES
(1, 'Hotel President', 59.5, 'Located right in the business, governmental and historical area of Budapest, Hotel President is a perfect choice for world explorers and business travellers as well.', '1.webp'),
(2, 'Gold Hotel', 35, '30 comfortably furnished rooms are offered by Gold Hotel **** Zakopane to guests looking for accommodation in Zakopane. The hotel ensures a pleasant stay for you and your family by offering chield-friendly services. You are also welcome at the hotel for a fine local meal in the restaurant.', '2.jpg'),
(3, 'Alta Moda Fashion Hotel', 50, 'The Alta Moda Fashion Hotel is a fully renovated four-star hotel, that represents fashionable elegance in the heart of the city to meet our guests’ needs.', '3.webp'),
(4, 'Vila Malinska', 75, 'This property is 3 minutes walk from the beach. Located in the centre of Malinska, less than 100 m from the sea, Guesthouse Villa Adria offers a shared terrace and free Wi-Fi in public areas. An on-site à la carte restaurant and a breakfast buffet cater to the guests\' culinary needs', '4.jpg'),
(5, 'Danubius Health Spa', 100, 'Voted the best hotel in Romania in 2004, the first four-star hotel in Sovata standing just 200m from the unique salty Bear Lake.', '5.webp'),
(6, 'Ferienhaus Regina Werfenweng', 60, 'This peaceful and friendly holiday house in Salzburg is surrounded by mountains and forests and is the best choice for those who want to have a good rest. Our house is situated in a calm place with a view of the Hochkönig-mountain mass, right at the valley station of the cableway IKARUS. In winter you can spend here many of days skiing and in summer you can use it for long walking trips and glider flights.', '6.jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `accomodationId` int(11) NOT NULL,
  `checkIn` datetime NOT NULL,
  `checkOut` datetime NOT NULL,
  `bookingDate` datetime NOT NULL,
  `comment` text COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `bookings`
--

INSERT INTO `bookings` (`id`, `accomodationId`, `checkIn`, `checkOut`, `bookingDate`, `comment`) VALUES
(1, 1, '2021-07-01 00:00:00', '2021-07-04 00:00:00', '2021-07-01 00:00:00', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit'),
(2, 1, '2021-07-06 00:00:00', '2021-07-11 00:00:00', '2021-07-03 00:00:00', 'Vestibulum scelerisque nulla non cursus consequat'),
(3, 1, '2021-07-15 00:00:00', '2021-07-22 00:00:00', '2021-07-05 00:00:00', 'Phasellus id lobortis risus'),
(4, 1, '2021-07-28 00:00:00', '2021-07-30 00:00:00', '2021-07-07 00:00:00', 'Fusce eleifend felis in nulla fringilla efficitur'),
(5, 1, '2021-08-07 00:00:00', '2021-08-11 00:00:00', '2021-07-09 00:00:00', 'Ut euismod lorem sed libero cursus viverra'),
(6, 1, '2021-08-21 00:00:00', '2021-08-29 00:00:00', '2021-07-11 00:00:00', 'Duis placerat mi sodales odio accumsan, sed dignissim nisi tincidunt'),
(7, 2, '2021-07-01 00:00:00', '2021-07-03 00:00:00', '2021-07-01 00:00:00', 'Phasellus varius fermentum malesuada'),
(8, 2, '2021-07-05 00:00:00', '2021-07-12 00:00:00', '2021-07-03 00:00:00', 'Etiam elementum eros ac lacus rhoncus, sed aliquet ligula aliquam'),
(9, 2, '2021-07-16 00:00:00', '2021-07-20 00:00:00', '2021-07-05 00:00:00', 'Nam sed ex condimentum, venenatis dolor eget, hendrerit sem'),
(10, 2, '2021-07-26 00:00:00', '2021-08-04 00:00:00', '2021-07-07 00:00:00', 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus'),
(11, 2, '2021-08-12 00:00:00', '2021-08-17 00:00:00', '2021-07-09 00:00:00', 'Mauris eu feugiat magna, quis vestibulum nisi'),
(12, 2, '2021-08-27 00:00:00', '2021-08-29 00:00:00', '2021-07-11 00:00:00', 'Aliquam lobortis suscipit libero, vitae consectetur est bibendum dictum'),
(13, 2, '2021-09-10 00:00:00', '2021-09-17 00:00:00', '2021-07-13 00:00:00', 'Mauris sagittis erat nec tellus sollicitudin sodales'),
(14, 3, '2021-07-01 00:00:00', '2021-07-02 00:00:00', '2021-07-01 00:00:00', 'Fusce id pharetra est, a porttitor dui'),
(15, 3, '2021-07-04 00:00:00', '2021-07-10 00:00:00', '2021-07-03 00:00:00', 'Morbi vitae ex vitae velit convallis pulvinar vitae eget justo'),
(16, 3, '2021-07-14 00:00:00', '2021-07-18 00:00:00', '2021-07-05 00:00:00', 'Sed iaculis ultricies purus dictum semper'),
(17, 3, '2021-07-24 00:00:00', '2021-08-01 00:00:00', '2021-07-07 00:00:00', 'Suspendisse potenti'),
(18, 3, '2021-08-09 00:00:00', '2021-08-11 00:00:00', '2021-07-09 00:00:00', 'Quisque sit amet congue est'),
(19, 3, '2021-08-21 00:00:00', '2021-08-26 00:00:00', '2021-07-11 00:00:00', 'Donec ligula nibh, vulputate non magna a, rhoncus aliquam purus'),
(20, 3, '2021-09-07 00:00:00', '2021-09-10 00:00:00', '2021-07-13 00:00:00', 'Mauris ac nisl ac ex aliquet convallis'),
(21, 3, '2021-09-24 00:00:00', '2021-09-28 00:00:00', '2021-07-15 00:00:00', 'Integer at pretium urna, eu dapibus dui'),
(22, 4, '2021-07-01 00:00:00', '2021-07-05 00:00:00', '2021-07-01 00:00:00', 'Aenean convallis tincidunt eros eu tristique'),
(23, 4, '2021-07-07 00:00:00', '2021-07-10 00:00:00', '2021-07-03 00:00:00', 'Aenean venenatis nunc orci, a fringilla mi consectetur vel'),
(24, 4, '2021-07-14 00:00:00', '2021-07-20 00:00:00', '2021-07-05 00:00:00', 'Praesent nisl tellus, tempor a neque sit amet, maximus malesuada orci'),
(25, 4, '2021-07-26 00:00:00', '2021-07-30 00:00:00', '2021-07-07 00:00:00', 'Nunc auctor nunc sed magna suscipit, quis condimentum mauris tincidunt'),
(26, 4, '2021-08-07 00:00:00', '2021-08-12 00:00:00', '2021-07-09 00:00:00', 'Proin ex ligula, venenatis in lorem id, dictum bibendum nibh'),
(27, 4, '2021-08-22 00:00:00', '2021-08-24 00:00:00', '2021-07-11 00:00:00', 'Integer quis scelerisque augue, vitae pretium est'),
(28, 4, '2021-09-05 00:00:00', '2021-09-13 00:00:00', '2021-07-13 00:00:00', 'Maecenas consectetur commodo dui, id vestibulum ex vestibulum non');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `accomodations`
--
ALTER TABLE `accomodations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accomodationId` (`accomodationId`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`accomodationId`) REFERENCES `accomodations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
