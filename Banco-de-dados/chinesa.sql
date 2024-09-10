-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 23/07/2024 às 19:47
-- Versão do servidor: 8.0.37-0ubuntu0.22.04.3
-- Versão do PHP: 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `chinesa`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_histories`
--

CREATE TABLE `affiliate_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `inviter` int UNSIGNED NOT NULL,
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00',
  `commission_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `deposited` tinyint DEFAULT '0',
  `deposited_amount` decimal(10,2) DEFAULT '0.00',
  `losses` bigint DEFAULT '0',
  `losses_amount` decimal(10,2) DEFAULT '0.00',
  `commission_paid` decimal(10,2) DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receita` decimal(10,2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `affiliate_withdraws`
--

CREATE TABLE `affiliate_withdraws` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `proof` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `pix_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_general_ci,
  `currency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'home',
  `description` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `banners`
--

INSERT INTO `banners` (`id`, `link`, `image`, `type`, `description`, `created_at`, `updated_at`) VALUES
(17, '#', '01J1D4EBRJG46BVR33TA43YB61.webp', 'home', '...', '2024-04-07 16:29:27', '2024-06-27 15:18:52'),
(18, '#', '01J1D4ESJ2F50MM159PJDVCRXM.webp', 'home', '....', '2024-04-07 16:30:46', '2024-06-27 15:19:07'),
(15, '#', '01J2JVFXVV4FZZ9MGJ5H66P0VR.png', 'carousel', NULL, '2024-04-06 01:58:25', '2024-07-12 07:53:35'),
(8, '#', '01J2JVG90MY20XCKQPQQ2SERRH.png', 'carousel', NULL, '2024-01-13 18:41:09', '2024-07-12 07:53:46'),
(16, '#', '01J1D4DECNQNW8E8TETGZSPF9H.webp', 'home', '...', '2024-04-06 02:03:23', '2024-06-27 15:18:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `baus`
--

CREATE TABLE `baus` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `bau_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `caminho` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dataS` timestamp NULL DEFAULT NULL,
  `aberto_em` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Populares', 'Populares', 'pupulares.png', 'Populares', '2023-11-13 14:59:07', '2024-07-12 02:00:23'),
(2, 'PGSoft', 'PGSoft', 'pgsot.png', 'PGSoft', '2023-12-24 12:06:46', '2024-07-12 02:07:16'),
(3, 'Pragmatic', 'Pragmatic', 'pragmatic.png', 'Pragmatic', '2023-12-24 12:12:36', '2024-07-12 01:59:20'),
(4, 'Slots Games', 'Popular', 'slotsgames.png', 'slot', '2023-12-24 12:19:42', '2024-07-12 01:59:40'),
(5, 'Ao vivo', 'Roletas', 'live.png', 'Live', '2023-12-24 20:03:48', '2024-07-12 02:00:02');

-- --------------------------------------------------------

--
-- Estrutura para tabela `category_game`
--

CREATE TABLE `category_game` (
  `category_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `category_game`
--

INSERT INTO `category_game` (`category_id`, `game_id`) VALUES
(2, 3),
(5, 1186);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Leke', 'ALL', 'Lek', '2023-11-07 18:01:38', NULL),
(2, 'Dollars', 'USD', '$', '2023-11-07 18:01:38', NULL),
(3, 'Afghanis', 'AFN', '؋', '2023-11-07 18:01:38', NULL),
(4, 'Pesos', 'ARS', '$', '2023-11-07 18:01:38', NULL),
(5, 'Guilders', 'AWG', 'ƒ', '2023-11-07 18:01:38', NULL),
(6, 'Dollars', 'AUD', '$', '2023-11-07 18:01:38', NULL),
(7, 'New Manats', 'AZN', 'ман', '2023-11-07 18:01:38', NULL),
(8, 'Dollars', 'BSD', '$', '2023-11-07 18:01:38', NULL),
(9, 'Dollars', 'BBD', '$', '2023-11-07 18:01:38', NULL),
(10, 'Rubles', 'BYR', 'p.', '2023-11-07 18:01:38', NULL),
(11, 'Euro', 'EUR', '€', '2023-11-07 18:01:38', NULL),
(12, 'Dollars', 'BZD', 'BZ$', '2023-11-07 18:01:38', NULL),
(13, 'Dollars', 'BMD', '$', '2023-11-07 18:01:38', NULL),
(14, 'Bolivianos', 'BOB', '$b', '2023-11-07 18:01:38', NULL),
(15, 'Convertible Marka', 'BAM', 'KM', '2023-11-07 18:01:38', NULL),
(16, 'Pula', 'BWP', 'P', '2023-11-07 18:01:38', NULL),
(17, 'Leva', 'BGN', 'лв', '2023-11-07 18:01:38', NULL),
(18, 'Reais', 'BRL', 'R$', '2023-11-07 18:01:38', NULL),
(19, 'Pounds', 'GBP', '£', '2023-11-07 18:01:38', NULL),
(20, 'Dollars', 'BND', '$', '2023-11-07 18:01:38', NULL),
(21, 'Riels', 'KHR', '៛', '2023-11-07 18:01:38', NULL),
(22, 'Dollars', 'CAD', '$', '2023-11-07 18:01:38', NULL),
(23, 'Dollars', 'KYD', '$', '2023-11-07 18:01:38', NULL),
(24, 'Pesos', 'CLP', '$', '2023-11-07 18:01:38', NULL),
(25, 'Yuan Renminbi', 'CNY', '¥', '2023-11-07 18:01:38', NULL),
(26, 'Pesos', 'COP', '$', '2023-11-07 18:01:38', NULL),
(27, 'Colón', 'CRC', '₡', '2023-11-07 18:01:38', NULL),
(28, 'Kuna', 'HRK', 'kn', '2023-11-07 18:01:38', NULL),
(29, 'Pesos', 'CUP', '₱', '2023-11-07 18:01:38', NULL),
(30, 'Koruny', 'CZK', 'Kč', '2023-11-07 18:01:38', NULL),
(31, 'Kroner', 'DKK', 'kr', '2023-11-07 18:01:38', NULL),
(32, 'Pesos', 'DOP', 'RD$', '2023-11-07 18:01:38', NULL),
(33, 'Dollars', 'XCD', '$', '2023-11-07 18:01:38', NULL),
(34, 'Pounds', 'EGP', '£', '2023-11-07 18:01:38', NULL),
(35, 'Colones', 'SVC', '$', '2023-11-07 18:01:38', NULL),
(36, 'Pounds', 'FKP', '£', '2023-11-07 18:01:38', NULL),
(37, 'Dollars', 'FJD', '$', '2023-11-07 18:01:38', NULL),
(38, 'Cedis', 'GHC', '¢', '2023-11-07 18:01:38', NULL),
(39, 'Pounds', 'GIP', '£', '2023-11-07 18:01:38', NULL),
(40, 'Quetzales', 'GTQ', 'Q', '2023-11-07 18:01:38', NULL),
(41, 'Pounds', 'GGP', '£', '2023-11-07 18:01:38', NULL),
(42, 'Dollars', 'GYD', '$', '2023-11-07 18:01:38', NULL),
(43, 'Lempiras', 'HNL', 'L', '2023-11-07 18:01:38', NULL),
(44, 'Dollars', 'HKD', '$', '2023-11-07 18:01:38', NULL),
(45, 'Forint', 'HUF', 'Ft', '2023-11-07 18:01:38', NULL),
(46, 'Kronur', 'ISK', 'kr', '2023-11-07 18:01:38', NULL),
(47, 'Rupees', 'INR', 'Rp', '2023-11-07 18:01:38', NULL),
(48, 'Rupiahs', 'IDR', 'Rp', '2023-11-07 18:01:38', NULL),
(49, 'Rials', 'IRR', '﷼', '2023-11-07 18:01:38', NULL),
(50, 'Pounds', 'IMP', '£', '2023-11-07 18:01:38', NULL),
(51, 'New Shekels', 'ILS', '₪', '2023-11-07 18:01:38', NULL),
(52, 'Dollars', 'JMD', 'J$', '2023-11-07 18:01:38', NULL),
(53, 'Yen', 'JPY', '¥', '2023-11-07 18:01:38', NULL),
(54, 'Pounds', 'JEP', '£', '2023-11-07 18:01:38', NULL),
(55, 'Tenge', 'KZT', 'лв', '2023-11-07 18:01:38', NULL),
(56, 'Won', 'KPW', '₩', '2023-11-07 18:01:38', NULL),
(57, 'Won', 'KRW', '₩', '2023-11-07 18:01:38', NULL),
(58, 'Soms', 'KGS', 'лв', '2023-11-07 18:01:38', NULL),
(59, 'Kips', 'LAK', '₭', '2023-11-07 18:01:38', NULL),
(60, 'Lati', 'LVL', 'Ls', '2023-11-07 18:01:38', NULL),
(61, 'Pounds', 'LBP', '£', '2023-11-07 18:01:38', NULL),
(62, 'Dollars', 'LRD', '$', '2023-11-07 18:01:38', NULL),
(63, 'Switzerland Francs', 'CHF', 'CHF', '2023-11-07 18:01:38', NULL),
(64, 'Litai', 'LTL', 'Lt', '2023-11-07 18:01:38', NULL),
(65, 'Denars', 'MKD', 'ден', '2023-11-07 18:01:38', NULL),
(66, 'Ringgits', 'MYR', 'RM', '2023-11-07 18:01:38', NULL),
(67, 'Rupees', 'MUR', '₨', '2023-11-07 18:01:38', NULL),
(68, 'Pesos', 'MXN', '$', '2023-11-07 18:01:38', NULL),
(69, 'Tugriks', 'MNT', '₮', '2023-11-07 18:01:38', NULL),
(70, 'Meticais', 'MZN', 'MT', '2023-11-07 18:01:38', NULL),
(71, 'Dollars', 'NAD', '$', '2023-11-07 18:01:38', NULL),
(72, 'Rupees', 'NPR', '₨', '2023-11-07 18:01:38', NULL),
(73, 'Guilders', 'ANG', 'ƒ', '2023-11-07 18:01:38', NULL),
(74, 'Dollars', 'NZD', '$', '2023-11-07 18:01:38', NULL),
(75, 'Cordobas', 'NIO', 'C$', '2023-11-07 18:01:38', NULL),
(76, 'Nairas', 'NGN', '₦', '2023-11-07 18:01:38', NULL),
(77, 'Krone', 'NOK', 'kr', '2023-11-07 18:01:38', NULL),
(78, 'Rials', 'OMR', '﷼', '2023-11-07 18:01:38', NULL),
(79, 'Rupees', 'PKR', '₨', '2023-11-07 18:01:38', NULL),
(80, 'Balboa', 'PAB', 'B/.', '2023-11-07 18:01:38', NULL),
(81, 'Guarani', 'PYG', 'Gs', '2023-11-07 18:01:38', NULL),
(82, 'Nuevos Soles', 'PEN', 'S/.', '2023-11-07 18:01:38', NULL),
(83, 'Pesos', 'PHP', 'Php', '2023-11-07 18:01:38', NULL),
(84, 'Zlotych', 'PLN', 'zł', '2023-11-07 18:01:38', NULL),
(85, 'Rials', 'QAR', '﷼', '2023-11-07 18:01:38', NULL),
(86, 'New Lei', 'RON', 'lei', '2023-11-07 18:01:38', NULL),
(87, 'Rubles', 'RUB', 'руб', '2023-11-07 18:01:38', NULL),
(88, 'Pounds', 'SHP', '£', '2023-11-07 18:01:38', NULL),
(89, 'Riyals', 'SAR', '﷼', '2023-11-07 18:01:38', NULL),
(90, 'Dinars', 'RSD', 'Дин.', '2023-11-07 18:01:38', NULL),
(91, 'Rupees', 'SCR', '₨', '2023-11-07 18:01:38', NULL),
(92, 'Dollars', 'SGD', '$', '2023-11-07 18:01:38', NULL),
(93, 'Dollars', 'SBD', '$', '2023-11-07 18:01:38', NULL),
(94, 'Shillings', 'SOS', 'S', '2023-11-07 18:01:38', NULL),
(95, 'Rand', 'ZAR', 'R', '2023-11-07 18:01:38', NULL),
(96, 'Rupees', 'LKR', '₨', '2023-11-07 18:01:38', NULL),
(97, 'Kronor', 'SEK', 'kr', '2023-11-07 18:01:38', NULL),
(98, 'Dollars', 'SRD', '$', '2023-11-07 18:01:38', NULL),
(99, 'Pounds', 'SYP', '£', '2023-11-07 18:01:38', NULL),
(100, 'New Dollars', 'TWD', 'NT$', '2023-11-07 18:01:38', NULL),
(101, 'Baht', 'THB', '฿', '2023-11-07 18:01:38', NULL),
(102, 'Dollars', 'TTD', 'TT$', '2023-11-07 18:01:38', NULL),
(103, 'Lira', 'TRY', '₺', '2023-11-07 18:01:38', NULL),
(104, 'Liras', 'TRL', '£', '2023-11-07 18:01:38', NULL),
(105, 'Dollars', 'TVD', '$', '2023-11-07 18:01:38', NULL),
(106, 'Hryvnia', 'UAH', '₴', '2023-11-07 18:01:38', NULL),
(107, 'Pesos', 'UYU', '$U', '2023-11-07 18:01:38', NULL),
(108, 'Sums', 'UZS', 'лв', '2023-11-07 18:01:38', NULL),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', '2023-11-07 18:01:38', NULL),
(110, 'Dong', 'VND', '₫', '2023-11-07 18:01:38', NULL),
(111, 'Rials', 'YER', '﷼', '2023-11-07 18:01:38', NULL),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', '2023-11-07 18:01:38', NULL),
(113, 'Rupees', 'INR', '₹', '2023-11-07 18:01:38', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `currency_alloweds`
--

CREATE TABLE `currency_alloweds` (
  `id` bigint UNSIGNED NOT NULL,
  `currency_id` bigint UNSIGNED NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `custom_layouts`
--

CREATE TABLE `custom_layouts` (
  `id` bigint UNSIGNED NOT NULL,
  `font_family_default` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `primary_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#0073D2',
  `primary_opacity_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secundary_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#084375',
  `gray_dark_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#3b3b3b',
  `gray_light_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#c9c9c9',
  `gray_medium_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#676767',
  `gray_over_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#1A1C20',
  `title_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#ffffff',
  `text_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#98A7B5',
  `sub_text_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#656E78',
  `placeholder_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#4D565E',
  `background_color` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '#24262B',
  `background_base` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '#ECEFF1',
  `background_base_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '#24262B',
  `carousel_banners` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '#1E2024',
  `carousel_banners_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '#1E2024',
  `sidebar_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sidebar_color_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navtop_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `navtop_color_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `side_menu` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `side_menu_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `input_primary` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `input_primary_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `footer_color_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `card_color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `card_color_dark` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `border_radius` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '.25rem',
  `custom_css` text COLLATE utf8mb4_general_ci,
  `custom_js` text COLLATE utf8mb4_general_ci,
  `custom_header` longtext COLLATE utf8mb4_general_ci,
  `custom_body` longtext COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telegram` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `whastapp` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `custom_layouts`
--

INSERT INTO `custom_layouts` (`id`, `font_family_default`, `primary_color`, `primary_opacity_color`, `secundary_color`, `gray_dark_color`, `gray_light_color`, `gray_medium_color`, `gray_over_color`, `title_color`, `text_color`, `sub_text_color`, `placeholder_color`, `background_color`, `background_base`, `background_base_dark`, `carousel_banners`, `carousel_banners_dark`, `sidebar_color`, `sidebar_color_dark`, `navtop_color`, `navtop_color_dark`, `side_menu`, `side_menu_dark`, `input_primary`, `input_primary_dark`, `footer_color`, `footer_color_dark`, `card_color`, `card_color_dark`, `border_radius`, `custom_css`, `custom_js`, `custom_header`, `custom_body`, `created_at`, `updated_at`, `instagram`, `facebook`, `telegram`, `twitter`, `whastapp`, `youtube`) VALUES
(1, '\'Roboto Condensed\', sans-serif', '#5a2394', '#bd32cc', '#de8bff', '#3b3b3b', '#efefef', '#d4d4d4', '#191A1E', '#ffffff', '#98A7B5', '#656E78', '#4D565E', '#4030b8', '#6b32a8', '#6b32a8', '#dbdbdb', '#93727200', '#0f1923', '#30b878', '#ffffff0e', '#0f1923', '#dbdbdb', '#0f1923', '#ffffff', '#ffffff', '#919191', '#0f1923', '#ababab', '#1E2024', '.25rem', '\n', '<div class=\"w-full relative\">\n    <div class=\"text-[var(--theme-text-color)] font-bold my-[20px] text-[22px] w-full min-h-[24px] text-center leading-[1.3]\">\n        <span class=\"w-full -mb-[2.58824px] pb-[-2.58824px] text-[22px] inline-block leading-[0] overflow-hidden\">\n            <span class=\"text-[14.9067px] sm:text-[22px] inline-block w-full\">\n                <span class=\"leading-[1.2] [overflow:initial] text-center overflow-ellipsis align-middle\" style=\"-webkit-line-clamp: 5;\">\n                    🎁 Venha se Divertir no maior site do Brasil\n                </span>\n            </span>\n        </span>\n    </div>\n    <div class=\"text-[var(--theme-text-color)] pb-[20px] sm:pb-0 sm:h-[405px] text-[14px] leading-[1.56] text-left w-full\">\n        <div class=\"w-full h-full px-[30px]\">\n            <div class=\"sm:h-full overflow-x-hidden overflow-y-scroll [scrollbar-width:none]\">\n                <div class=\"my-scrollbar-content\">\n                    <div class=\"D4IXpi08hh8lVGgzIBUz\">\n                        <div>\n                            <p class=\"mb-0\">\n                                ✈️Clique no canal:\n                                <a href=\"https://seusite.com\" target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Telegram</span>\n                                </a>\n                                <br>📲Baixe o site oficial do APP:\n                                <a href=\"https://seusite.com\" target=\"_blank\" rel=\"noopener\">\n                                    <span style=\"color: #ffeb00;\">Daanrox​​.com</span>\n                                </a>\n                                <br>❤️Convide amigos e ganhe\n                                <span style=\"color: #ffeb00;\">10 mil</span>\n                                reais por dia não é sonho❤️\n                                <br>🎁Bônus de primeiro depósito para novos usuários\n                                <span style=\"color: #ffeb00;\">10%</span>\n                                <br>🎁 Bônus convite:\n                                <span style=\"color: #ffeb00;\">R$ 10</span>\n                                por pessoa\n                                <br>🎁 Convide amigos, compartilhe e ganhe dinheiro! Comissão\n                                <span style=\"color: #ffeb00;\"> até 2%</span>\n                                <br>🎁 Recompensas e privilégios de associação VIP de até\n                                <span style=\"color: #ffeb00;\">R$ 777.777</span>\n                                <br>👉 Passos: Visitar → Eventos/Promoções → Recomendar amigos → Receber/Receber\n                            </p>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n\n\n\n', '', '<a href=\"https://seusite.com\" target=\"_blank\" class=\"float1\" id=\"float1\">\n  <img class=\"icon\" src=\"https://wordpress-731680-3807664.cloudwaysapps.com/wp-content/uploads/2024/04/ActiveImg7532580654847733-1.gif\"/>\n</a>\n<button class=\"close-btn\" onclick=\"hideFloat1()\"><i class=\"fa-regular fa-circle-xmark\"></i></button>\n\n<style>\n  :root {\n    --icon-color: #fff;\n    --icon-hover: #fff;\n    --background-color: #0060ff;\n    --background-hover: #0044b3;\n  }\n\n  .icon {\n    width: 110px;\n    height: 110px;\n    transform: scale(0.6) translate(15%, 28%);\n  }\n\n  .float1 {\n    position: fixed;\n    cursor: pointer;\n    width: 110px;\n    height: 110px;\n    bottom: 140px;\n    right: 0px;\n    transition: 1s;\n    z-index: 9000;\n  }\n\n  .close-btn {\n    position: fixed;\n    bottom: 200px; /* Ajuste conforme necessário */\n    right: 10px; /* Ajuste conforme necessário */\n    width: 20px;\n    height: 20px;\n   background-color: var(--ci-primary-color);\n    color: var(--ci-secundary-color);\n    border: none;\n    border-radius: 50%;\n    cursor: pointer;\n    z-index: 9001; /* Um nível acima da float2 */\n  }\n\n  .close-btn:hover {\n    background-color: var(--background-hover);\n  }\n\n  @keyframes pulse {\n    0% {\n      -webkit-box-shadow: 0 0 0 0 rgba(0, 96, 255, 1);\n    }\n\n    70% {\n      -webkit-box-shadow: 0 0 0 20px rgba(0, 96, 255, 0);\n    }\n\n    100% {\n      -webkit-box-shadow: 0 0 0 0 rgba(0, 96, 255, 0);\n    }\n  }\n\n\n</style>\n\n<script>\n  function hideFloat1() {\n    document.getElementById(\'float1\').style.display = \'none\';\n    document.querySelector(\'.close-btn\').style.display = \'none\';\n  }\n</script>\n\n<a href=\"/home/agents\" class=\"float2\" id=\"float2\">\n  <img class=\"icon\" src=\"/storage/rox/rox_gif_post.gif\"/>\n</a>\n<button class=\"close-btn2\" onclick=\"hideFloat2()\"><i class=\"fa-regular fa-circle-xmark\"></i></button>\n\n<style>\n  :root {\n    --icon-color: #fff;\n    --icon-hover: #fff;\n    --background-color: #0060ff;\n    --background-hover: #0044b3;\n  }\n\n \n  .float2 {\n    position: fixed;\n    cursor: pointer;\n    width: 110px;\n    height: 110px;\n    bottom: 230px;\n    right: 5px;\n    transition: 1s;\n    z-index: 9000;\n  }\n\n  .close-btn2 {\n    position: fixed;\n    bottom: 280px; /* Ajuste conforme necessário */\n    right: 10px; /* Ajuste conforme necessário */\n    width: 20px;\n    height: 20px;\n    background-color: var(--ci-primary-color);\n    color: var(--ci-secundary-color);\n    border: none;\n    border-radius: 50%;\n    cursor: pointer;\n    z-index: 9001; /* Um nível acima da float2 */\n  }\n\n  .close-btn2:hover {\n    background-color: var(--background-hover);\n  }\n\n\n\n\n</style>\n\n<script>\n  function hideFloat2() {\n    document.getElementById(\'float2\').style.display = \'none\';\n    document.querySelector(\'.close-btn2\').style.display = \'none\';\n  }\n</script>', '2024-01-01 14:36:03', '2024-07-23 01:51:54', 'https://golden.braboscode.com/#', 'https://golden.braboscode.com/#', 'https://golden.braboscode.com/#', 'https://golden.braboscode.com/#', 'https://golden.braboscode.com/#', 'https://golden.braboscode.com/#');

-- --------------------------------------------------------

--
-- Estrutura para tabela `debug`
--

CREATE TABLE `debug` (
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `debug`
--

INSERT INTO `debug` (`text`) VALUES
('\"PlaceBet: 914806915\"'),
('\"PlaceBet: 914806915\"'),
('\"AwardWinnings: 914806915\"'),
('\"PlaceBet: 914806916\"'),
('\"AwardWinnings: 914806916\"'),
('\"PlaceBet: 914806916\"'),
('\"PlaceBet: 914806917\"'),
('\"PlaceBet: 914806918\"'),
('\"AwardWinnings: 914806918\"'),
('\"PlaceBet: 914806918\"'),
('\"PlaceBet: 914806919\"'),
('\"AwardWinnings: 914806919\"'),
('\"AwardWinnings: 914806919\"'),
('\"PlaceBet: 914806920\"'),
('\"PlaceBet: 914806921\"'),
('\"AwardWinnings: 914806921\"'),
('\"PlaceBet: 535367\"'),
('\"PlaceBet: 154646\"'),
('\"PlaceBet: 914806922\"'),
('\"PlaceBet: 914806923\"'),
('\"PlaceBet: 914806924\"'),
('\"AwardWinnings: 914806924\"'),
('{\"idTransaction\":\"875dcfac-f963-4a70-90ef-ad3c357d3f7b\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"value\":150,\"destinationName\":\"Julia Ayumi Imada De Lima\",\"destinationTaxId\":\"***.373.478-**\",\"destinationBank\":\"PICPAY\"}'),
('{\"idTransaction\":\"1979e952-67cb-4924-a463-b79e2716804b\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"value\":177,\"destinationName\":\"Anne Ferreira\",\"destinationTaxId\":\"***.916.418-**\",\"destinationBank\":\"NUBANK\"}'),
('{\"idTransaction\":\"ec707f26-d5b9-4d0b-85cf-56a4d518144b\",\"typeTransaction\":\"PIX_CASHOUT\",\"statusTransaction\":\"PAID_OUT\",\"value\":181,\"destinationName\":\"Anne Ferreira\",\"destinationTaxId\":\"***.916.418-**\",\"destinationBank\":\"NUBANK\"}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `proof` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `currency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `digito_pay_payments`
--

CREATE TABLE `digito_pay_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `withdrawal_id` int UNSIGNED NOT NULL,
  `pix_key` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observation` text COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `connection` text COLLATE utf8mb4_general_ci NOT NULL,
  `queue` text COLLATE utf8mb4_general_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `games`
--

CREATE TABLE `games` (
  `id` bigint UNSIGNED NOT NULL,
  `provider_id` int UNSIGNED NOT NULL,
  `game_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `game_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `technology` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'html5',
  `distribution` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'play_fiver',
  `views` bigint NOT NULL DEFAULT '0',
  `is_featured` tinyint DEFAULT '0',
  `show_home` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `game_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games`
--

INSERT INTO `games` (`id`, `provider_id`, `game_name`, `game_id`, `game_type`, `cover`, `status`, `technology`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `game_code`) VALUES
(1, 2, 'Book of Golden Sands', 'vswaysbook', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysbook.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-23 00:25:42', 'vswaysbook'),
(2, 2, 'Wild Hop and Drop', 'vs20mparty', 'Pragmatic', 'PlayFiver/Pragmatic/vs20mparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-23 01:16:49', 'vs20mparty'),
(3, 2, 'Snakes e Ladders - Snake Eyes', 'vs10snakeeyes', 'Pragmatic', 'PlayFiver/Pragmatic/vs10snakeeyes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-23 01:33:23', 'vs10snakeeyes'),
(4, 2, 'Striking Hot 5', 'vs5strh', 'Pragmatic', 'PlayFiver/Pragmatic/vs5strh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5strh'),
(5, 2, 'Legend of Heroes', 'vswayslofhero', 'Pragmatic', 'PlayFiver/Pragmatic/vswayslofhero.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayslofhero'),
(6, 2, 'Muertos Multiplier Megaways', 'vs20muertos', 'Pragmatic', 'PlayFiver/Pragmatic/vs20muertos.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 21:19:46', 'vs20muertos'),
(7, 2, 'Crown of Fire', 'vs10crownfire', 'Pragmatic', 'PlayFiver/Pragmatic/vs10crownfire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10crownfire'),
(8, 2, 'Candy Stars', 'vswaysstrwild', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysstrwild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysstrwild'),
(9, 2, 'Black Bull', 'vs20trswild2', 'Pragmatic', 'PlayFiver/Pragmatic/vs20trswild2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20trswild2'),
(10, 2, 'Floating Dragon Hold e Spin Megaways', 'vswaysfltdrg', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysfltdrg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysfltdrg'),
(11, 2, 'Magic Money Maze', 'vs10mmm', 'Pragmatic', 'PlayFiver/Pragmatic/vs10mmm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10mmm'),
(12, 2, 'Down the Rails', 'vs20underground', 'Pragmatic', 'PlayFiver/Pragmatic/vs20underground.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20underground'),
(13, 2, 'Greedy Wolf', 'vs20wolfie', 'Pragmatic', 'PlayFiver/Pragmatic/vs20wolfie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20wolfie'),
(14, 2, 'Fire Hot 5', 'vs5firehot', 'Pragmatic', 'PlayFiver/Pragmatic/vs5firehot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5firehot'),
(15, 2, 'Fire Hot 40', 'vs40firehot', 'Pragmatic', 'PlayFiver/Pragmatic/vs40firehot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40firehot'),
(16, 2, 'Fire Hot 20', 'vs20fh', 'Pragmatic', 'PlayFiver/Pragmatic/vs20fh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20fh'),
(17, 2, 'Fire Hot 100', 'vs100firehot', 'Pragmatic', 'PlayFiver/Pragmatic/vs100firehot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs100firehot'),
(18, 2, 'Big Bass Splash', 'vs10txbigbass', 'Pragmatic', 'PlayFiver/Pragmatic/vs10txbigbass.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10txbigbass'),
(19, 2, 'Octobeer Fortunes', 'vs20octobeer', 'Pragmatic', 'PlayFiver/Pragmatic/vs20octobeer.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20octobeer'),
(20, 2, 'Hot To Burn Extreme', 'vs40hotburnx', 'Pragmatic', 'PlayFiver/Pragmatic/vs40hotburnx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40hotburnx'),
(21, 2, 'Cheeky Emperor', 'vs243ckemp', 'Pragmatic', 'PlayFiver/Pragmatic/vs243ckemp.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243ckemp'),
(22, 2, 'Tropical Tiki', 'vswaysjkrdrop', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysjkrdrop.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysjkrdrop'),
(23, 2, 'Shining Hot 5', 'vs5sh', 'Pragmatic', 'PlayFiver/Pragmatic/vs5sh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5sh'),
(24, 2, 'Shining Hot 40', 'vs40sh', 'Pragmatic', 'PlayFiver/Pragmatic/vs40sh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40sh'),
(25, 2, 'Shining Hot 20', 'vs20sh', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sh'),
(26, 2, 'Coffee Wild', 'vs10coffee', 'Pragmatic', 'PlayFiver/Pragmatic/vs10coffee.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10coffee'),
(27, 2, 'Shining Hot 100', 'vs100sh', 'Pragmatic', 'PlayFiver/Pragmatic/vs100sh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs100sh'),
(28, 2, 'Queen of Gods', 'vs10egrich', 'Pragmatic', 'PlayFiver/Pragmatic/vs10egrich.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10egrich'),
(29, 2, 'Koi Pond', 'vs243koipond', 'Pragmatic', 'PlayFiver/Pragmatic/vs243koipond.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243koipond'),
(30, 2, 'Rise of Samurai 3', 'vs40samurai3', 'Pragmatic', 'PlayFiver/Pragmatic/vs40samurai3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40samurai3'),
(31, 2, 'Cosmic Cash', 'vs40cosmiccash', 'Pragmatic', 'PlayFiver/Pragmatic/vs40cosmiccash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40cosmiccash'),
(32, 2, 'Bomb Bonanza', 'vs25bomb', 'Pragmatic', 'PlayFiver/Pragmatic/vs25bomb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25bomb'),
(33, 2, 'Mahjong Panda', 'vs1024mahjpanda', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024mahjpanda.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024mahjpanda'),
(34, 2, 'Spirit of Adventure', 'vs10spiritadv', 'Pragmatic', 'PlayFiver/Pragmatic/vs10spiritadv.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10spiritadv'),
(35, 2, 'Fire Strike 2', 'vs10firestrike2', 'Pragmatic', 'PlayFiver/Pragmatic/vs10firestrike2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10firestrike2'),
(36, 2, 'Eye of Cleopatra', 'vs40cleoeye', 'Pragmatic', 'PlayFiver/Pragmatic/vs40cleoeye.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40cleoeye'),
(37, 2, 'Goblin Heist Powernudge', 'vs20gobnudge', 'Pragmatic', 'PlayFiver/Pragmatic/vs20gobnudge.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20gobnudge'),
(38, 2, 'The Great Stick-up', 'vs20stickysymbol', 'Pragmatic', 'PlayFiver/Pragmatic/vs20stickysymbol.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20stickysymbol'),
(39, 2, 'Zombie Carnival', 'vswayszombcarn', 'Pragmatic', 'PlayFiver/Pragmatic/vswayszombcarn.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayszombcarn'),
(40, 2, 'North Guardians', 'vs50northgard', 'Pragmatic', 'PlayFiver/Pragmatic/vs50northgard.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50northgard'),
(41, 2, 'Sugar Rush', 'vs20sugarrush', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sugarrush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sugarrush'),
(42, 2, 'Cleocatra', 'vs20cleocatra', 'Pragmatic', 'PlayFiver/Pragmatic/vs20cleocatra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20cleocatra'),
(43, 2, 'Little Gem Hold and Spin', 'vs5littlegem', 'Pragmatic', 'PlayFiver/Pragmatic/vs5littlegem.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5littlegem'),
(44, 2, 'Drill That Gold', 'vs20drtgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs20drtgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20drtgold'),
(45, 2, 'Clover Gold', 'vs20mustanggld2', 'Pragmatic', 'PlayFiver/Pragmatic/vs20mustanggld2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20mustanggld2'),
(46, 2, 'Chicken Chase', 'vs10chkchase', 'Pragmatic', 'PlayFiver/Pragmatic/vs10chkchase.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10chkchase'),
(47, 2, 'Wild West Gold Megaways', 'vswayswildwest', 'Pragmatic', 'PlayFiver/Pragmatic/vswayswildwest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayswildwest'),
(48, 2, 'Book of Aztec King', 'vs10bookazteck', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bookazteck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bookazteck'),
(49, 2, 'Might of Ra', 'vs50mightra', 'Pragmatic', 'PlayFiver/Pragmatic/vs50mightra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50mightra'),
(50, 2, 'Bull Fiesta', 'vs25bullfiesta', 'Pragmatic', 'PlayFiver/Pragmatic/vs25bullfiesta.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25bullfiesta'),
(51, 2, 'Rainbow Gold', 'vs20rainbowg', 'Pragmatic', 'PlayFiver/Pragmatic/vs20rainbowg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20rainbowg'),
(52, 2, 'Tic Tac Take', 'vs10tictac', 'Pragmatic', 'PlayFiver/Pragmatic/vs10tictac.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10tictac'),
(53, 2, 'Disco Lady', 'vs243discolady', 'Pragmatic', 'PlayFiver/Pragmatic/vs243discolady.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243discolady'),
(54, 2, 'Queenie', 'vs243queenie', 'Pragmatic', 'PlayFiver/Pragmatic/vs243queenie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243queenie'),
(55, 2, 'Barn Festival', 'vs20farmfest', 'Pragmatic', 'PlayFiver/Pragmatic/vs20farmfest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20farmfest'),
(56, 2, 'Wild Beach Party', 'vs20bchprty', 'Pragmatic', 'PlayFiver/Pragmatic/vs20bchprty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20bchprty'),
(57, 2, 'The Ultimate 5', 'vs20ultim5', 'Pragmatic', 'PlayFiver/Pragmatic/vs20ultim5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20ultim5'),
(58, 2, 'Cash Patrol', 'vs25copsrobbers', 'Pragmatic', 'PlayFiver/Pragmatic/vs25copsrobbers.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25copsrobbers'),
(59, 2, 'Colossal Cash Zone', 'vs20colcashzone', 'Pragmatic', 'PlayFiver/Pragmatic/vs20colcashzone.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20colcashzone'),
(60, 2, 'Rock Vegas Mega Hold e Spin', 'vs20rockvegas', 'Pragmatic', 'PlayFiver/Pragmatic/vs20rockvegas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20rockvegas'),
(61, 2, 'Super X(tm)', 'vs20superx', 'Pragmatic', 'PlayFiver/Pragmatic/vs20superx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20superx'),
(62, 2, 'Crystal Caverns Megaways(tm)', 'vswayscryscav', 'Pragmatic', 'PlayFiver/Pragmatic/vswayscryscav.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayscryscav'),
(63, 2, 'Smugglers Cove(tm)', 'vs20smugcove', 'Pragmatic', 'PlayFiver/Pragmatic/vs20smugcove.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20smugcove'),
(64, 2, 'Magician s Secrets(tm)', 'vs4096magician', 'Pragmatic', 'PlayFiver/Pragmatic/vs4096magician.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs4096magician'),
(65, 2, 'Wild Depths(tm)', 'vs40wanderw', 'Pragmatic', 'PlayFiver/Pragmatic/vs40wanderw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40wanderw'),
(66, 2, 'Extra Juicy Megaways(tm)', 'vswaysxjuicy', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysxjuicy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysxjuicy'),
(67, 2, 'Gold Party(r)', 'vs25goldparty', 'Pragmatic', 'PlayFiver/Pragmatic/vs25goldparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25goldparty'),
(68, 2, 'Gates of Valhalla(tm)', 'vs10runes', 'Pragmatic', 'PlayFiver/Pragmatic/vs10runes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10runes'),
(69, 2, 'Fortune of Giza(tm)', 'vs20amuleteg', 'Pragmatic', 'PlayFiver/Pragmatic/vs20amuleteg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20amuleteg'),
(70, 2, 'New Year Tiger Treasures (tm)', 'vs25tigeryear', 'Pragmatic', 'PlayFiver/Pragmatic/vs25tigeryear.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25tigeryear'),
(71, 2, 'Emperor Caishen', 'vs243empcaishen', 'Pragmatic', 'PlayFiver/Pragmatic/vs243empcaishen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243empcaishen'),
(72, 2, 'Pyramid Bonanza', 'vs20pbonanza', 'Pragmatic', 'PlayFiver/Pragmatic/vs20pbonanza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20pbonanza'),
(73, 2, 'Treasure Wild', 'vs20trsbox', 'Pragmatic', 'PlayFiver/Pragmatic/vs20trsbox.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20trsbox'),
(74, 2, 'Raging Bull', 'vs243chargebull', 'Pragmatic', 'PlayFiver/Pragmatic/vs243chargebull.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243chargebull'),
(75, 2, 'Cash Bonanza', 'vswaysbankbonz', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysbankbonz.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysbankbonz'),
(76, 2, 'Hokkaido Wolf', 'vs576hokkwolf', 'Pragmatic', 'PlayFiver/Pragmatic/vs576hokkwolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs576hokkwolf'),
(77, 2, 'Phoenix Forge', 'vs20phoenixf', 'Pragmatic', 'PlayFiver/Pragmatic/vs20phoenixf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20phoenixf'),
(78, 2, 'Aztec King Megaways', 'vswaysaztecking', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysaztecking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysaztecking'),
(79, 2, 'Lucky Grace And Charm', 'vs10luckcharm', 'Pragmatic', 'PlayFiver/Pragmatic/vs10luckcharm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10luckcharm'),
(80, 2, 'Elemental Gems Megaways', 'vswayselements', 'Pragmatic', 'PlayFiver/Pragmatic/vswayselements.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayselements'),
(81, 2, 'Chilli Heat Megaways', 'vswayschilheat', 'Pragmatic', 'PlayFiver/Pragmatic/vswayschilheat.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayschilheat'),
(82, 2, 'The Magic Cauldron - Enchanted Brew', 'vs20magicpot', 'Pragmatic', 'PlayFiver/Pragmatic/vs20magicpot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20magicpot'),
(83, 2, 'The Amazing Money Machine', 'vs10amm', 'Pragmatic', 'PlayFiver/Pragmatic/vs10amm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10amm'),
(84, 2, 'Starz Megaways', 'vs117649starz', 'Pragmatic', 'PlayFiver/Pragmatic/vs117649starz.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs117649starz'),
(85, 2, 'Mysterious Egypt', 'vs10wildtut', 'Pragmatic', 'PlayFiver/Pragmatic/vs10wildtut.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10wildtut'),
(86, 2, 'Eye of the Storm', 'vs10eyestorm', 'Pragmatic', 'PlayFiver/Pragmatic/vs10eyestorm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10eyestorm'),
(87, 2, 'Golden Ox', 'vs25gldox', 'Pragmatic', 'PlayFiver/Pragmatic/vs25gldox.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25gldox'),
(88, 2, 'Voodoo Magic', 'vs40voodoo', 'Pragmatic', 'PlayFiver/Pragmatic/vs40voodoo.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40voodoo'),
(89, 2, 'Bonanza Gold', 'vs20bonzgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs20bonzgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20bonzgold'),
(90, 2, 'John Hunter and the Mayan Gods', 'vs10mayangods', 'Pragmatic', 'PlayFiver/Pragmatic/vs10mayangods.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10mayangods'),
(91, 2, 'The Dragon Tiger', 'vs1024dtiger', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024dtiger.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024dtiger'),
(92, 2, 'Christmas Carol Megaways', 'vs20xmascarol', 'Pragmatic', 'PlayFiver/Pragmatic/vs20xmascarol.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20xmascarol'),
(93, 2, 'Fishin Reels', 'vs10goldfish', 'Pragmatic', 'PlayFiver/Pragmatic/vs10goldfish.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10goldfish'),
(94, 2, 'Book of Kingdoms', 'vs25bkofkngdm', 'Pragmatic', 'PlayFiver/Pragmatic/vs25bkofkngdm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25bkofkngdm'),
(95, 2, 'Gems Bonanza', 'vs20goldfever', 'Pragmatic', 'PlayFiver/Pragmatic/vs20goldfever.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20goldfever'),
(96, 2, 'Wild Walker', 'vs25walker', 'Pragmatic', 'PlayFiver/Pragmatic/vs25walker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25walker'),
(97, 2, 'Rise of Samurai', 'vs25samurai', 'Pragmatic', 'PlayFiver/Pragmatic/vs25samurai.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25samurai'),
(98, 2, 'Star Bounty', 'vswayshive', 'Pragmatic', 'PlayFiver/Pragmatic/vswayshive.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayshive'),
(99, 2, 'Curse of the Werewolf Megaways', 'vswayswerewolf', 'Pragmatic', 'PlayFiver/Pragmatic/vswayswerewolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayswerewolf'),
(100, 2, 'Aztec Gems Deluxe', 'vs9aztecgemsdx', 'Pragmatic', 'PlayFiver/Pragmatic/vs9aztecgemsdx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9aztecgemsdx'),
(101, 2, 'Jungle Gorilla', 'vs20gorilla', 'Pragmatic', 'PlayFiver/Pragmatic/vs20gorilla.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20gorilla'),
(102, 2, 'Street Racer', 'vs40streetracer', 'Pragmatic', 'PlayFiver/Pragmatic/vs40streetracer.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40streetracer'),
(103, 2, 'Fu Fu Fu', 'vs1fufufu', 'Pragmatic', 'PlayFiver/Pragmatic/vs1fufufu.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1fufufu'),
(104, 2, 'Drago - Jewels of Fortune', 'vs1600drago', 'Pragmatic', 'PlayFiver/Pragmatic/vs1600drago.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1600drago'),
(105, 2, 'Money Money Money', 'vs1money', 'Pragmatic', 'PlayFiver/Pragmatic/vs1money.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1money'),
(106, 2, 'Busy Bees', 'vs20bl', 'Pragmatic', 'PlayFiver/Pragmatic/vs20bl.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20bl'),
(107, 2, 'Beowulf', 'vs40beowulf', 'Pragmatic', 'PlayFiver/Pragmatic/vs40beowulf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40beowulf'),
(108, 2, 'Jurassic Giants', 'vs4096jurassic', 'Pragmatic', 'PlayFiver/Pragmatic/vs4096jurassic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs4096jurassic'),
(109, 2, 'Gold Train', 'vs3train', 'Pragmatic', 'PlayFiver/Pragmatic/vs3train.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs3train'),
(110, 2, 'Hot Chilli', 'vs9hotroll', 'Pragmatic', 'PlayFiver/Pragmatic/vs9hotroll.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9hotroll'),
(111, 2, 'Queen of Gold', 'vs25queenofgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs25queenofgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25queenofgold'),
(112, 2, 'Super Joker', 'vs5spjoker', 'Pragmatic', 'PlayFiver/Pragmatic/vs5spjoker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5spjoker'),
(113, 2, 'Egyptian Fortunes', 'vs20egypttrs', 'Pragmatic', 'PlayFiver/Pragmatic/vs20egypttrs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20egypttrs'),
(114, 2, 'Treasure Horse', 'vs18mashang', 'Pragmatic', 'PlayFiver/Pragmatic/vs18mashang.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs18mashang'),
(115, 2, 'Lucky Dragons', 'vs50chinesecharms', 'Pragmatic', 'PlayFiver/Pragmatic/vs50chinesecharms.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50chinesecharms'),
(116, 2, '7 Monkeys', 'vs7monkeys', 'Pragmatic', 'PlayFiver/Pragmatic/vs7monkeys.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs7monkeys'),
(117, 2, 'Great Reef', 'vs25sea', 'Pragmatic', 'PlayFiver/Pragmatic/vs25sea.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25sea'),
(118, 2, 'Leprechaun Song', 'vs20leprechaun', 'Pragmatic', 'PlayFiver/Pragmatic/vs20leprechaun.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20leprechaun'),
(119, 2, 'Dwarven Gold Deluxe', 'vs25dwarves_new', 'Pragmatic', 'PlayFiver/Pragmatic/vs25dwarves_new.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25dwarves_new'),
(120, 2, 'Hot to burn', 'vs5hotburn', 'Pragmatic', 'PlayFiver/Pragmatic/vs5hotburn.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5hotburn'),
(121, 2, 'Master Chen s Fortune', 'vs9chen', 'Pragmatic', 'PlayFiver/Pragmatic/vs9chen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9chen'),
(122, 2, 'Triple Tigers', 'vs1tigers', 'Pragmatic', 'PlayFiver/Pragmatic/vs1tigers.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1tigers'),
(123, 2, 'Lady Godiva', 'vs20godiva', 'Pragmatic', 'PlayFiver/Pragmatic/vs20godiva.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20godiva'),
(124, 2, 'Monkey Madness', 'vs9madmonkey', 'Pragmatic', 'PlayFiver/Pragmatic/vs9madmonkey.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9madmonkey'),
(125, 2, 'Mighty Kong', 'vs50kingkong', 'Pragmatic', 'PlayFiver/Pragmatic/vs50kingkong.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50kingkong'),
(126, 2, 'Fruit Rainbow', 'vs40frrainbow', 'Pragmatic', 'PlayFiver/Pragmatic/vs40frrainbow.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40frrainbow'),
(127, 2, 'Lucky New Year', 'vs25newyear', 'Pragmatic', 'PlayFiver/Pragmatic/vs25newyear.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25newyear'),
(128, 2, 'The Wild Machine', 'vs40madwheel', 'Pragmatic', 'PlayFiver/Pragmatic/vs40madwheel.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40madwheel'),
(129, 2, 'Triple Dragons', 'vs5trdragons', 'Pragmatic', 'PlayFiver/Pragmatic/vs5trdragons.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5trdragons'),
(130, 2, 'Aztec Bonanza', 'vs7776aztec', 'Pragmatic', 'PlayFiver/Pragmatic/vs7776aztec.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs7776aztec'),
(131, 2, 'Hercules Son of Zeus', 'vs50hercules', 'Pragmatic', 'PlayFiver/Pragmatic/vs50hercules.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50hercules'),
(132, 2, 'Journey to the West', 'vs25journey', 'Pragmatic', 'PlayFiver/Pragmatic/vs25journey.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25journey'),
(133, 2, 'The Great Chicken Escape', 'vs20chicken', 'Pragmatic', 'PlayFiver/Pragmatic/vs20chicken.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20chicken'),
(134, 2, 'Tree of Riches', 'vs1fortunetree', 'Pragmatic', 'PlayFiver/Pragmatic/vs1fortunetree.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1fortunetree'),
(135, 2, 'Wild Pixies', 'vs20wildpix', 'Pragmatic', 'PlayFiver/Pragmatic/vs20wildpix.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20wildpix'),
(136, 2, 'Fairytale Fortune', 'vs15fairytale', 'Pragmatic', 'PlayFiver/Pragmatic/vs15fairytale.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs15fairytale'),
(137, 2, 'Santa', 'vs20santa', 'Pragmatic', 'PlayFiver/Pragmatic/vs20santa.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20santa'),
(138, 2, 'Vampires vs Wolves', 'vs10vampwolf', 'Pragmatic', 'PlayFiver/Pragmatic/vs10vampwolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10vampwolf'),
(139, 2, '3 Genie Wishes', 'vs50aladdin', 'Pragmatic', 'PlayFiver/Pragmatic/vs50aladdin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50aladdin'),
(140, 2, 'Hot Safari', 'vs25safari', 'Pragmatic', 'PlayFiver/Pragmatic/vs25safari.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25safari'),
(141, 2, 'Honey Honey Honey', 'vs20honey', 'Pragmatic', 'PlayFiver/Pragmatic/vs20honey.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20honey'),
(142, 2, 'Hercules and Pegasus', 'vs20hercpeg', 'Pragmatic', 'PlayFiver/Pragmatic/vs20hercpeg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20hercpeg'),
(143, 2, 'Fire 88', 'vs7fire88', 'Pragmatic', 'PlayFiver/Pragmatic/vs7fire88.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs7fire88'),
(144, 2, 'Aztec Gems', 'vs5aztecgems', 'Pragmatic', 'PlayFiver/Pragmatic/vs5aztecgems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5aztecgems'),
(145, 2, '888 Dragons', 'vs1dragon8', 'Pragmatic', 'PlayFiver/Pragmatic/vs1dragon8.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1dragon8'),
(146, 2, 'Dragon Kingdom', 'vs25dragonkingdom', 'Pragmatic', 'PlayFiver/Pragmatic/vs25dragonkingdom.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25dragonkingdom'),
(147, 2, 'Gold Rush', 'vs25goldrush', 'Pragmatic', 'PlayFiver/Pragmatic/vs25goldrush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25goldrush'),
(148, 2, 'Golden Pig', 'vs25goldpig', 'Pragmatic', 'PlayFiver/Pragmatic/vs25goldpig.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25goldpig'),
(149, 2, 'Wild Gladiator', 'vs25gladiator', 'Pragmatic', 'PlayFiver/Pragmatic/vs25gladiator.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25gladiator'),
(150, 2, 'Joker s Jewels', 'vs5joker', 'Pragmatic', 'PlayFiver/Pragmatic/vs5joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5joker'),
(151, 2, 'Caishen s Cash', 'vs243caishien', 'Pragmatic', 'PlayFiver/Pragmatic/vs243caishien.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243caishien'),
(152, 2, '7 Piggies', 'vs7pigs', 'Pragmatic', 'PlayFiver/Pragmatic/vs7pigs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs7pigs'),
(153, 2, 'Leprechaun Carol', 'vs20leprexmas', 'Pragmatic', 'PlayFiver/Pragmatic/vs20leprexmas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20leprexmas'),
(154, 2, 'Magic Journey', 'vs8magicjourn', 'Pragmatic', 'PlayFiver/Pragmatic/vs8magicjourn.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs8magicjourn'),
(155, 2, 'Greek Gods', 'vs243fortseren', 'Pragmatic', 'PlayFiver/Pragmatic/vs243fortseren.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243fortseren'),
(156, 2, 'Chilli Heat', 'vs25chilli', 'Pragmatic', 'PlayFiver/Pragmatic/vs25chilli.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25chilli'),
(157, 2, 'Aladdin and the Sorcerrer', 'vs20aladdinsorc', 'Pragmatic', 'PlayFiver/Pragmatic/vs20aladdinsorc.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20aladdinsorc'),
(158, 2, 'Caishen s Gold', 'vs243fortune', 'Pragmatic', 'PlayFiver/Pragmatic/vs243fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243fortune'),
(159, 2, 'Fire Strike', 'vs10firestrike', 'Pragmatic', 'PlayFiver/Pragmatic/vs10firestrike.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10firestrike'),
(160, 2, 'Release the Kraken', 'vs20kraken', 'Pragmatic', 'PlayFiver/Pragmatic/vs20kraken.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20kraken'),
(161, 2, 'Master Joker', 'vs1masterjoker', 'Pragmatic', 'PlayFiver/Pragmatic/vs1masterjoker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 20:26:05', 'vs1masterjoker'),
(162, 2, 'Super 7s', 'vs5super7', 'Pragmatic', 'PlayFiver/Pragmatic/vs5super7.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5super7'),
(163, 2, 'Wild Booster', 'vs20wildboost', 'Pragmatic', 'PlayFiver/Pragmatic/vs20wildboost.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20wildboost'),
(164, 2, 'Power of Thor Megaways', 'vswayshammthor', 'Pragmatic', 'PlayFiver/Pragmatic/vswayshammthor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 20:39:20', 'vswayshammthor'),
(165, 2, '5 Lions', 'vs243lions', 'Pragmatic', 'PlayFiver/Pragmatic/vs243lions.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243lions'),
(166, 1, 'Fortune Tiger', '126', 'PGSoft', 'PlayFiver/Pgsoft/126.png', '1', 'html5', 'play_fiver', 1000014, 1, 1, '2024-05-27 07:25:59', '2024-07-23 02:19:03', '126'),
(167, 1, 'Fortune Ox', '98', 'PGSoft', 'PlayFiver/Pgsoft/98.png', '1', 'html5', 'play_fiver', 100000, 1, 1, '2024-05-27 07:25:59', '2024-07-18 22:40:59', '98'),
(168, 1, 'Fortune Mouse', '68', 'PGSoft', 'PlayFiver/Pgsoft/68.png', '1', 'html5', 'play_fiver', 100000, 0, 1, '2024-05-27 07:25:59', '2024-07-18 22:41:56', '68'),
(169, 1, 'Fortune Rabbit', '1543462', 'PGSoft', 'PlayFiver/Pgsoft/1543462.png', '1', 'html5', 'play_fiver', 100000, 1, 1, '2024-05-27 07:25:59', '2024-07-18 22:43:33', '1543462'),
(170, 1, 'Bikini Paradise', '69', 'PGSoft', 'PlayFiver/Pgsoft/69.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:24:08', '69'),
(171, 1, 'Jungle Delight', '40', 'PGSoft', 'PlayFiver/Pgsoft/40.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:23:57', '40'),
(172, 1, 'Fortune Dragon', '1695365', 'PGSoft', 'PlayFiver/Pgsoft/1695365.png', '1', 'html5', 'play_fiver', 100000, 1, 1, '2024-05-27 07:25:59', '2024-07-18 22:41:43', '1695365'),
(173, 1, 'Chicky Run', '1738001', 'PGSoft', 'PlayFiver/Pgsoft/1738001.png', '1', 'html5', 'play_fiver', 1000006, 1, 1, '2024-05-27 07:25:59', '2024-07-23 00:45:43', '1738001'),
(174, 1, 'Ganesha Gold', '42', 'PGSoft', 'PlayFiver/Pgsoft/42.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', '42'),
(175, 1, 'Leprechaun Riches', '60', 'PGSoft', 'PlayFiver/Pgsoft/60.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-18 22:43:03', '60'),
(176, 1, 'Wild Bandito', '104', 'PGSoft', 'PlayFiver/Pgsoft/104.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', '104'),
(177, 1, 'Dragon Tiger Luck', '63', 'PGSoft', 'PlayFiver/Pgsoft/63.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', '63'),
(178, 1, 'Piggy Gold', 'piggy-gold', 'PGSoft', 'PlayFiver/Pgsoft/piggy-gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'piggy-gold'),
(179, 1, 'Double Fortune', 'double-fortune', 'PGSoft', 'PlayFiver/Pgsoft/double-fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'double-fortune'),
(180, 1, 'The Great Icescape', 'the-great-icescape', 'PGSoft', 'PlayFiver/Pgsoft/the-great-icescape.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'the-great-icescape'),
(181, 1, 'Captain\'s Bounty', 'captains-bounty', 'PGSoft', 'PlayFiver/Pgsoft/captains-bounty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'captains-bounty'),
(182, 1, 'Dragon Hatch', 'dragon-hatch', 'PGSoft', 'PlayFiver/Pgsoft/dragon-hatch.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'dragon-hatch'),
(183, 1, 'Vampire\'s Charm', 'vampires-charm', 'PGSoft', 'PlayFiver/Pgsoft/vampires-charm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'vampires-charm'),
(184, 1, 'Gem Saviour Conquest', 'gem-saviour-conquest', 'PGSoft', 'PlayFiver/Pgsoft/gem-saviour-conquest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'gem-saviour-conquest'),
(185, 1, 'Mahjong Ways', 'mahjong-ways', 'PGSoft', 'PlayFiver/Pgsoft/mahjong-ways.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'mahjong-ways'),
(186, 1, 'Candy Burst', 'candy-burst', 'PGSoft', 'PlayFiver/Pgsoft/candy-burst.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'candy-burst'),
(187, 1, 'Mahjong Ways 2', 'mahjong-ways2', 'PGSoft', 'PlayFiver/Pgsoft/mahjong-ways2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'mahjong-ways2'),
(188, 1, 'Ganesha Fortune', 'ganesha-fortune', 'PGSoft', 'PlayFiver/Pgsoft/ganesha-fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'ganesha-fortune'),
(189, 1, 'Phoenix Rises', 'phoenix-rises', 'PGSoft', 'PlayFiver/Pgsoft/phoenix-rises.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'phoenix-rises'),
(190, 1, 'Wild Fireworks', 'wild-fireworks', 'PGSoft', 'PlayFiver/Pgsoft/wild-fireworks.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'wild-fireworks'),
(191, 1, 'Galactic Gems', 'galactic-gems', 'PGSoft', 'PlayFiver/Pgsoft/galactic-gems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'galactic-gems'),
(192, 1, 'Treasures of Aztec', 'treasures-aztec', 'PGSoft', 'PlayFiver/Pgsoft/treasures-aztec.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'treasures-aztec'),
(193, 1, 'Jewels of Prosperity', 'jewels-prosper', 'PGSoft', 'PlayFiver/Pgsoft/jewels-prosper.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'jewels-prosper'),
(194, 1, 'Guardians of Ice and Fire', 'gdn-ice-fire', 'PGSoft', 'PlayFiver/Pgsoft/gdn-ice-fire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'gdn-ice-fire'),
(195, 1, 'Bali Vacation', 'bali-vacation', 'PGSoft', 'PlayFiver/Pgsoft/bali-vacation.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'bali-vacation'),
(196, 1, 'Majestic Treasures', 'majestic-ts', 'PGSoft', 'PlayFiver/Pgsoft/majestic-ts.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'majestic-ts'),
(197, 1, 'Jack Frost\'s Winter', 'jack-frosts', 'PGSoft', 'PlayFiver/Pgsoft/jack-frosts.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'jack-frosts'),
(198, 1, 'Candy Bonanza', 'candy-bonanza', 'PGSoft', 'PlayFiver/Pgsoft/candy-bonanza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'candy-bonanza'),
(199, 1, 'Heist Stakes', 'heist-stakes', 'PGSoft', 'PlayFiver/Pgsoft/heist-stakes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'heist-stakes'),
(200, 1, 'Legendary Monkey King', 'lgd-monkey-kg', 'PGSoft', 'PlayFiver/Pgsoft/lgd-monkey-kg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'lgd-monkey-kg'),
(201, 1, 'Buffalo Win', 'buffalo-win', 'PGSoft', 'PlayFiver/Pgsoft/buffalo-win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'buffalo-win'),
(202, 1, 'Raider Jane\'s Crypt of Fortune', 'crypt-fortune', 'PGSoft', 'PlayFiver/Pgsoft/crypt-fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'crypt-fortune'),
(203, 1, 'Emoji Riches', 'emoji-riches', 'PGSoft', 'PlayFiver/Pgsoft/emoji-riches.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'emoji-riches'),
(204, 1, 'Supermarket Spree', 'sprmkt-spree', 'PGSoft', 'PlayFiver/Pgsoft/sprmkt-spree.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'sprmkt-spree'),
(205, 1, 'Spirited Wonders', 'spirit-wonder', 'PGSoft', 'PlayFiver/Pgsoft/spirit-wonder.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'spirit-wonder'),
(206, 1, 'Destiny of Sun & Moon', 'dest-sun-moon', 'PGSoft', 'PlayFiver/Pgsoft/dest-sun-moon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'dest-sun-moon'),
(207, 1, 'Garuda Gems', 'garuda-gems', 'PGSoft', 'PlayFiver/Pgsoft/garuda-gems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'garuda-gems'),
(208, 1, 'Rooster Rumble', 'rooster-rbl', 'PGSoft', 'PlayFiver/Pgsoft/rooster-rbl.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'rooster-rbl'),
(209, 1, 'Battleground Royale', 'battleground', 'PGSoft', 'PlayFiver/Pgsoft/battleground.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'battleground'),
(210, 1, 'Butterfly Blossom', 'btrfly-blossom', 'PGSoft', 'PlayFiver/Pgsoft/btrfly-blossom.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'btrfly-blossom'),
(211, 1, 'Prosperity Fortune Tree', 'prosper-ftree', 'PGSoft', 'PlayFiver/Pgsoft/prosper-ftree.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'prosper-ftree'),
(212, 1, 'Asgardian Rising', 'asgardian-rs', 'PGSoft', 'PlayFiver/Pgsoft/asgardian-rs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'asgardian-rs'),
(213, 1, 'Alchemy Gold', 'alchemy-gold', 'PGSoft', 'PlayFiver/Pgsoft/alchemy-gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'alchemy-gold'),
(214, 1, 'Diner Delights', 'diner-delights', 'PGSoft', 'PlayFiver/Pgsoft/diner-delights.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'diner-delights'),
(215, 1, 'Midas Fortune', 'midas-fortune', 'PGSoft', 'PlayFiver/Pgsoft/midas-fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'midas-fortune'),
(216, 1, 'Bakery Bonanza', 'bakery-bonanza', 'PGSoft', 'PlayFiver/Pgsoft/bakery-bonanza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'bakery-bonanza'),
(217, 1, 'Songkran Splash', 'songkran-spl', 'PGSoft', 'PlayFiver/Pgsoft/songkran-spl.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'songkran-spl'),
(218, 1, 'Dragon Hatch2', 'dragon-hatch2', 'PGSoft', 'PlayFiver/Pgsoft/dragon-hatch2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'dragon-hatch2'),
(219, 1, 'Cruise Royale', 'cruise-royale', 'PGSoft', 'PlayFiver/Pgsoft/cruise-royale.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'cruise-royale'),
(220, 1, 'Wild Ape #3258', 'wild-ape-3258', 'PGSoft', 'PlayFiver/Pgsoft/wild-ape-3258.png', '1', 'html5', 'play_fiver', 204, 0, 1, '2024-05-27 07:25:59', '2024-07-23 01:43:49', 'wild-ape-3258'),
(221, 1, 'Super Golf Drive', 'spr-golf-drive', 'PGSoft', 'PlayFiver/Pgsoft/spr-golf-drive.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'spr-golf-drive'),
(222, 1, 'Anubis Wrath', 'anubis-wrath', 'PGSoft', 'PlayFiver/Pgsoft/anubis-wrath.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'anubis-wrath'),
(223, 1, 'Zombie Outbreak', 'zombie-outbrk', 'PGSoft', 'PlayFiver/Pgsoft/zombie-outbrk.png', '1', 'html5', 'play_fiver', 216, 0, 1, '2024-05-27 07:25:59', '2024-07-23 01:39:47', 'zombie-outbrk'),
(224, 1, 'Cash Mania', 'cash-mania', 'PGSoft', 'PlayFiver/Pgsoft/cash-mania.png', '1', 'html5', 'play_fiver', 204, 0, 1, '2024-05-27 07:25:59', '2024-07-23 01:38:40', 'cash-mania'),
(225, 2, 'Monkey Warrior', 'vs243mwarrior', 'Pragmatic', 'PlayFiver/Pragmatic/vs243mwarrior.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 19:48:43', 'vs243mwarrior'),
(226, 2, 'The Dog House', 'vs20doghouse', 'Pragmatic', 'PlayFiver/Pragmatic/vs20doghouse.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20doghouse'),
(227, 2, 'Pirate Gold', 'vs40pirate', 'Pragmatic', 'PlayFiver/Pragmatic/vs40pirate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40pirate'),
(228, 2, 'Great Rhino', 'vs20rhino', 'Pragmatic', 'PlayFiver/Pragmatic/vs20rhino.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20rhino'),
(229, 2, 'Panda Fortune', 'vs25pandagold', 'Pragmatic', 'PlayFiver/Pragmatic/vs25pandagold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25pandagold'),
(230, 2, 'Buffalo King', 'vs4096bufking', 'Pragmatic', 'PlayFiver/Pragmatic/vs4096bufking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs4096bufking'),
(231, 2, 'Pyramid King', 'vs25pyramid', 'Pragmatic', 'PlayFiver/Pragmatic/vs25pyramid.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25pyramid'),
(232, 2, 'Ultra Burn', 'vs5ultrab', 'Pragmatic', 'PlayFiver/Pragmatic/vs5ultrab.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5ultrab'),
(233, 2, 'Ultra Hold and Spin', 'vs5ultra', 'Pragmatic', 'PlayFiver/Pragmatic/vs5ultra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5ultra'),
(234, 2, 'Joker King', 'vs25jokerking', 'Pragmatic', 'PlayFiver/Pragmatic/vs25jokerking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25jokerking'),
(235, 2, 'Return of the Dead', 'vs10returndead', 'Pragmatic', 'PlayFiver/Pragmatic/vs10returndead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10returndead'),
(236, 2, 'Madame Destiny', 'vs10madame', 'Pragmatic', 'PlayFiver/Pragmatic/vs10madame.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10madame'),
(237, 2, 'Diamond Strike', 'vs15diamond', 'Pragmatic', 'PlayFiver/Pragmatic/vs15diamond.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs15diamond'),
(238, 2, 'Aztec King', 'vs25aztecking', 'Pragmatic', 'PlayFiver/Pragmatic/vs25aztecking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25aztecking'),
(239, 2, 'Wild Spells', 'vs25wildspells', 'Pragmatic', 'PlayFiver/Pragmatic/vs25wildspells.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25wildspells'),
(240, 2, 'Big Bass Bonanza', 'vs10bbbonanza', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bbbonanza.png', '1', 'html5', 'play_fiver', 100000, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:22:04', 'vs10bbbonanza'),
(241, 2, 'Cowboys Gold', 'vs10cowgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs10cowgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10cowgold'),
(242, 2, 'The Tiger Warrior', 'vs25tigerwar', 'Pragmatic', 'PlayFiver/Pragmatic/vs25tigerwar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25tigerwar'),
(243, 2, 'Mustang Gold', 'vs25mustang', 'Pragmatic', 'PlayFiver/Pragmatic/vs25mustang.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25mustang'),
(244, 2, 'Hotfiesta', 'vs25hotfiesta', 'Pragmatic', 'PlayFiver/Pragmatic/vs25hotfiesta.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 20:22:00', 'vs25hotfiesta'),
(245, 2, 'Dance Party', 'vs243dancingpar', 'Pragmatic', 'PlayFiver/Pragmatic/vs243dancingpar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243dancingpar'),
(246, 2, 'Wild Wild Riches', 'vs576treasures', 'Pragmatic', 'PlayFiver/Pragmatic/vs576treasures.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs576treasures'),
(247, 2, 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'Pragmatic', 'PlayFiver/Pragmatic/vs20hburnhs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20hburnhs'),
(248, 2, 'Empty the Bank', 'vs20emptybank', 'Pragmatic', 'PlayFiver/Pragmatic/vs20emptybank.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20emptybank'),
(249, 2, 'The Hand of Midas', 'vs20midas', 'Pragmatic', 'PlayFiver/Pragmatic/vs20midas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20midas'),
(250, 2, 'Gates of Olympus', 'vs20olympgate', 'Pragmatic', 'PlayFiver/Pragmatic/vs20olympgate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20olympgate'),
(251, 2, 'Lucky Lightning', 'vswayslight', 'Pragmatic', 'PlayFiver/Pragmatic/vswayslight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayslight'),
(252, 2, 'Vegas Magic', 'vs20vegasmagic', 'Pragmatic', 'PlayFiver/Pragmatic/vs20vegasmagic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20vegasmagic'),
(253, 2, 'Fruit Party', 'vs20fruitparty', 'Pragmatic', 'PlayFiver/Pragmatic/vs20fruitparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20fruitparty'),
(254, 2, 'Fruit Party 2', 'vs20fparty2', 'Pragmatic', 'PlayFiver/Pragmatic/vs20fparty2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20fparty2'),
(255, 2, 'The Dog House Megaways', 'vswaysdogs', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysdogs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysdogs'),
(256, 2, 'Juicy Fruits', 'vs50juicyfr', 'Pragmatic', 'PlayFiver/Pragmatic/vs50juicyfr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50juicyfr'),
(257, 2, 'Panda Fortune 2', 'vs25pandatemple', 'Pragmatic', 'PlayFiver/Pragmatic/vs25pandatemple.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25pandatemple'),
(258, 2, 'Buffalo King Megaways', 'vswaysbufking', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysbufking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysbufking'),
(259, 2, 'Wild West Gold', 'vs40wildwest', 'Pragmatic', 'PlayFiver/Pragmatic/vs40wildwest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40wildwest');
INSERT INTO `games` (`id`, `provider_id`, `game_name`, `game_id`, `game_type`, `cover`, `status`, `technology`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `game_code`) VALUES
(260, 2, 'Chicken Drop', 'vs20chickdrop', 'Pragmatic', 'PlayFiver/Pragmatic/vs20chickdrop.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20chickdrop'),
(261, 2, 'Spartan King', 'vs40spartaking', 'Pragmatic', 'PlayFiver/Pragmatic/vs40spartaking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40spartaking'),
(262, 2, 'Great Rhino Megaways', 'vswaysrhino', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysrhino.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysrhino'),
(263, 2, 'Sweet Bonanza Xmas', 'vs20sbxmas', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sbxmas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sbxmas'),
(264, 2, 'Extra Juicy', 'vs10fruity2', 'Pragmatic', 'PlayFiver/Pragmatic/vs10fruity2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10fruity2'),
(265, 2, 'Ancient Egypt', 'vs10egypt', 'Pragmatic', 'PlayFiver/Pragmatic/vs10egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10egypt'),
(266, 2, 'Dragon Hot Hold and Spin', 'vs5drhs', 'Pragmatic', 'PlayFiver/Pragmatic/vs5drhs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5drhs'),
(267, 2, 'Bigger Bass Bonanza', 'vs12bbb', 'Pragmatic', 'PlayFiver/Pragmatic/vs12bbb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs12bbb'),
(268, 2, 'The Tweety House', 'vs20tweethouse', 'Pragmatic', 'PlayFiver/Pragmatic/vs20tweethouse.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20tweethouse'),
(269, 2, '5 Lions Megaways', 'vswayslions', 'Pragmatic', 'PlayFiver/Pragmatic/vswayslions.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayslions'),
(270, 2, 'Rise of Samurai Megaways', 'vswayssamurai', 'Pragmatic', 'PlayFiver/Pragmatic/vswayssamurai.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayssamurai'),
(271, 2, 'Pixie Wings', 'vs50pixie', 'Pragmatic', 'PlayFiver/Pragmatic/vs50pixie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50pixie'),
(272, 2, 'Floating Dragon', 'vs10floatdrg', 'Pragmatic', 'PlayFiver/Pragmatic/vs10floatdrg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10floatdrg'),
(273, 2, 'Sweet Bonanza', 'vs20fruitsw', 'Pragmatic', 'PlayFiver/Pragmatic/vs20fruitsw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20fruitsw'),
(274, 2, 'Great Rhino Deluxe', 'vs20rhinoluxe', 'Pragmatic', 'PlayFiver/Pragmatic/vs20rhinoluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20rhinoluxe'),
(275, 2, 'Madame Destiny Megaways', 'vswaysmadame', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysmadame.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysmadame'),
(276, 2, 'Temujin Treasures', 'vs1024temuj', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024temuj.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024temuj'),
(277, 2, 'Pirate Gold Deluxe', 'vs40pirgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs40pirgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40pirgold'),
(278, 2, 'Money Mouse', 'vs25mmouse', 'Pragmatic', 'PlayFiver/Pragmatic/vs25mmouse.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25mmouse'),
(279, 2, 'Three Star Fortune', 'vs10threestar', 'Pragmatic', 'PlayFiver/Pragmatic/vs10threestar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10threestar'),
(280, 2, 'Lucky Dragon Ball', 'vs1ball', 'Pragmatic', 'PlayFiver/Pragmatic/vs1ball.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1ball'),
(281, 2, '5 Lions', 'vs243lionsgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs243lionsgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243lionsgold'),
(282, 2, 'Ancient Egypt Classic', 'vs10egyptcls', 'Pragmatic', 'PlayFiver/Pragmatic/vs10egyptcls.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10egyptcls'),
(283, 2, 'Da Vinci Treasure', 'vs25davinci', 'Pragmatic', 'PlayFiver/Pragmatic/vs25davinci.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25davinci'),
(284, 2, 'Aztec Treasure', 'vs7776secrets', 'Pragmatic', 'PlayFiver/Pragmatic/vs7776secrets.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs7776secrets'),
(285, 2, 'Wolf Gold', 'vs25wolfgold', 'Pragmatic', 'PlayFiver/Pragmatic/vs25wolfgold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25wolfgold'),
(286, 2, 'Safari King', 'vs50safariking', 'Pragmatic', 'PlayFiver/Pragmatic/vs50safariking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50safariking'),
(287, 2, 'Peking Luck', 'vs25peking', 'Pragmatic', 'PlayFiver/Pragmatic/vs25peking.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25peking'),
(288, 2, 'Asgard', 'vs25asgard', 'Pragmatic', 'PlayFiver/Pragmatic/vs25asgard.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25asgard'),
(289, 2, 'Vegas Nights', 'vs25vegas', 'Pragmatic', 'PlayFiver/Pragmatic/vs25vegas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25vegas'),
(290, 2, 'John Hunter and the Tomb of the Scarab Queen', 'vs25scarabqueen', 'Pragmatic', 'PlayFiver/Pragmatic/vs25scarabqueen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25scarabqueen'),
(291, 2, 'Starlight Princess', 'vs20starlight', 'Pragmatic', 'PlayFiver/Pragmatic/vs20starlight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20starlight'),
(292, 2, 'John Hunter and the Book of Tut', 'vs10bookoftut', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bookoftut.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bookoftut'),
(293, 2, 'Piggy Bank Bills', 'vs9piggybank', 'Pragmatic', 'PlayFiver/Pragmatic/vs9piggybank.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9piggybank'),
(294, 2, 'Dragon Kingdom Mystery', 'vs5drmystery', 'Pragmatic', 'PlayFiver/Pragmatic/vs5drmystery.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5drmystery'),
(295, 2, 'Eight Dragons', 'vs20eightdragons', 'Pragmatic', 'PlayFiver/Pragmatic/vs20eightdragons.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20eightdragons'),
(296, 2, '5 Lions Dance', 'vs1024lionsd', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024lionsd.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024lionsd'),
(297, 2, 'Heart of Rio', 'vs25rio', 'Pragmatic', 'PlayFiver/Pragmatic/vs25rio.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25rio'),
(298, 2, 'Rise of Giza PowerNudge', 'vs10nudgeit', 'Pragmatic', 'PlayFiver/Pragmatic/vs10nudgeit.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10nudgeit'),
(299, 2, 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bxmasbnza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bxmasbnza'),
(300, 2, 'Santa s Wonderland', 'vs20santawonder', 'Pragmatic', 'PlayFiver/Pragmatic/vs20santawonder.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20santawonder'),
(301, 2, 'Bubble Pop', 'vs10bblpop', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bblpop.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bblpop'),
(302, 2, 'Bounty Gold', 'vs25btygold', 'Pragmatic', 'PlayFiver/Pragmatic/vs25btygold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25btygold'),
(303, 2, 'Hockey Attack(tm)', 'vs88hockattack', 'Pragmatic', 'PlayFiver/Pragmatic/vs88hockattack.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs88hockattack'),
(304, 2, 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysbbb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysbbb'),
(305, 2, 'Book of the Fallen', 'vs10bookfallen', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bookfallen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bookfallen'),
(306, 2, 'Big Juan', 'vs40bigjuan', 'Pragmatic', 'PlayFiver/Pragmatic/vs40bigjuan.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40bigjuan'),
(307, 2, 'John Hunter and the Quest for Bermuda Riches', 'vs20bermuda', 'Pragmatic', 'PlayFiver/Pragmatic/vs20bermuda.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20bermuda'),
(308, 2, 'Star Pirates Code', 'vs10starpirate', 'Pragmatic', 'PlayFiver/Pragmatic/vs10starpirate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10starpirate'),
(309, 2, 'Mystic Chief', 'vswayswest', 'Pragmatic', 'PlayFiver/Pragmatic/vswayswest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayswest'),
(310, 2, 'Day of Dead', 'vs20daydead', 'Pragmatic', 'PlayFiver/Pragmatic/vs20daydead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20daydead'),
(311, 2, 'Candy Village', 'vs20candvil', 'Pragmatic', 'PlayFiver/Pragmatic/vs20candvil.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20candvil'),
(312, 7, 'Return to the Future', 'SGReturnToTheFeature', 'slot', 'PlayFiver/Habanero/SGReturnToTheFeature.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGReturnToTheFeature'),
(313, 7, 'Tevena de los Muirtos Ultra', 'SGTabernaDeLosMuertosUltra', 'slot', 'PlayFiver/Habanero/SGTabernaDeLosMuertosUltra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:08:20', 'SGTabernaDeLosMuertosUltra'),
(314, 7, 'Totem towers', 'SGTotemTowers', 'slot', 'PlayFiver/Habanero/SGTotemTowers.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTotemTowers'),
(315, 7, 'Christmas Kipoot Rush', 'SGChristmasGiftRush', 'slot', 'PlayFiver/Habanero/SGChristmasGiftRush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGChristmasGiftRush'),
(316, 7, 'Overs of Atlantis', 'SGOrbsOfAtlantis', 'slot', 'PlayFiver/Habanero/SGOrbsOfAtlantis.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGOrbsOfAtlantis'),
(317, 7, 'Before Time Runner Out', 'SGBeforeTimeRunsOut', 'slot', 'PlayFiver/Habanero/SGBeforeTimeRunsOut.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBeforeTimeRunsOut'),
(318, 7, 'Techno tumble', 'SGTechnoTumble', 'slot', 'PlayFiver/Habanero/SGTechnoTumble.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTechnoTumble'),
(319, 7, 'Happy ape', 'SGHappyApe', 'slot', 'PlayFiver/Habanero/SGHappyApe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGHappyApe'),
(320, 7, 'Tevena di los Muertos', 'SGTabernaDeLosMuertos', 'slot', 'PlayFiver/Habanero/SGTabernaDeLosMuertos.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTabernaDeLosMuertos'),
(321, 7, 'Notty Santa', 'SGNaughtySanta', 'slot', 'PlayFiver/Habanero/SGNaughtySanta.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGNaughtySanta'),
(322, 7, 'Pakai Sen Deluxe', 'SGFaCaiShenDeluxe', 'slot', 'PlayFiver/Habanero/SGFaCaiShenDeluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFaCaiShenDeluxe'),
(323, 7, 'Hey sushi', 'SGHeySushi', 'slot', 'PlayFiver/Habanero/SGHeySushi.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGHeySushi'),
(324, 7, 'Knockout football rush', 'SGKnockoutFootballRush', 'slot', 'PlayFiver/Habanero/SGKnockoutFootballRush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGKnockoutFootballRush'),
(325, 7, 'Closal Gems', 'SGColossalGems', 'slot', 'PlayFiver/Habanero/SGColossalGems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGColossalGems'),
(326, 7, 'hot hot halloween', 'SGHotHotHalloween', 'slot', 'PlayFiver/Habanero/SGHotHotHalloween.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGHotHotHalloween'),
(327, 7, 'Lucky fortune cat', 'SGLuckyFortuneCat', 'slot', 'PlayFiver/Habanero/SGLuckyFortuneCat.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:12:21', 'SGLuckyFortuneCat'),
(328, 7, 'hot hot fruit', 'SGHotHotFruit', 'slot', 'PlayFiver/Habanero/SGHotHotFruit.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:09:32', 'SGHotHotFruit'),
(329, 7, 'Mount Majuma', 'SGMountMazuma', 'slot', 'PlayFiver/Habanero/SGMountMazuma.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGMountMazuma'),
(330, 7, 'Wild Trucks', 'SGWildTrucks', 'slot', 'PlayFiver/Habanero/SGWildTrucks.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGWildTrucks'),
(331, 7, 'Lucky Lucky', 'SGLuckyLucky', 'slot', 'PlayFiver/Habanero/SGLuckyLucky.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGLuckyLucky'),
(332, 7, 'Knockout football', 'SGKnockoutFootball', 'slot', 'PlayFiver/Habanero/SGKnockoutFootball.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGKnockoutFootball'),
(333, 7, 'Jump!', 'SGJump', 'slot', 'PlayFiver/Habanero/SGJump.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGJump'),
(334, 7, 'Pumpkin patch', 'SGPumpkinPatch', 'slot', 'PlayFiver/Habanero/SGPumpkinPatch.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 19:03:54', 'SGPumpkinPatch'),
(335, 7, 'Way of Fortune', 'SGWaysOfFortune', 'slot', 'PlayFiver/Habanero/SGWaysOfFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGWaysOfFortune'),
(336, 7, 'For Devine Beasts', 'SGFourDivineBeasts', 'slot', 'PlayFiver/Habanero/SGFourDivineBeasts.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFourDivineBeasts'),
(337, 7, 'Panda panda', 'SGPandaPanda', 'slot', 'PlayFiver/Habanero/SGPandaPanda.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGPandaPanda'),
(338, 7, 'Ocean s Call', 'SGOceansCall', 'slot', 'PlayFiver/Habanero/SGOceansCall.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGOceansCall'),
(339, 7, 'Scruffy Skellywex', 'SGScruffyScallywags', 'slot', 'PlayFiver/Habanero/SGScruffyScallywags.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGScruffyScallywags'),
(340, 7, 'Nuwa', 'SGNuwa', 'slot', 'PlayFiver/Habanero/SGNuwa.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:11:15', 'SGNuwa'),
(341, 7, 'Koi gate', 'SGTheKoiGate', 'slot', 'PlayFiver/Habanero/SGTheKoiGate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:11:00', 'SGTheKoiGate'),
(342, 7, 'Pacaishen', 'SGFaCaiShen', 'slot', 'PlayFiver/Habanero/SGFaCaiShen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFaCaiShen'),
(343, 7, '12 zodiacs', 'SG12Zodiacs', 'slot', 'PlayFiver/Habanero/SG12Zodiacs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SG12Zodiacs'),
(344, 7, 'Fire rooster', 'SGFireRooster', 'slot', 'PlayFiver/Habanero/SGFireRooster.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFireRooster'),
(345, 7, 'Phoenix', 'SGFenghuang', 'slot', 'PlayFiver/Habanero/SGFenghuang.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFenghuang'),
(346, 7, 'Bird of Thunder', 'SGBirdOfThunder', 'slot', 'PlayFiver/Habanero/SGBirdOfThunder.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBirdOfThunder'),
(347, 7, 'The Dead Escape', 'SGTheDeadEscape', 'slot', 'PlayFiver/Habanero/SGTheDeadEscape.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTheDeadEscape'),
(348, 7, 'Bombs Away', 'SGBombsAway', 'slot', 'PlayFiver/Habanero/SGBombsAway.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBombsAway'),
(349, 7, 'Gold rush', 'SGGoldRush', 'slot', 'PlayFiver/Habanero/SGGoldRush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGGoldRush'),
(350, 7, 'Ruffled up', 'SGRuffledUp', 'slot', 'PlayFiver/Habanero/SGRuffledUp.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGRuffledUp'),
(351, 7, 'Roman empire', 'SGRomanEmpire', 'slot', 'PlayFiver/Habanero/SGRomanEmpire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGRomanEmpire'),
(352, 7, 'Coyote crash', 'SGCoyoteCrash', 'slot', 'PlayFiver/Habanero/SGCoyoteCrash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGCoyoteCrash'),
(353, 7, 'Wickt Location', 'SGWickedWitch', 'slot', 'PlayFiver/Habanero/SGWickedWitch.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGWickedWitch'),
(354, 7, 'Dragon s Throne', 'SGDragonsThrone', 'slot', 'PlayFiver/Habanero/SGDragonsThrone.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGDragonsThrone'),
(355, 7, 'Buggy bonus', 'SGBuggyBonus', 'slot', 'PlayFiver/Habanero/SGBuggyBonus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBuggyBonus'),
(356, 7, 'Glam rock', 'SGGlamRock', 'slot', 'PlayFiver/Habanero/SGGlamRock.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGGlamRock'),
(357, 7, 'Super twister', 'SGSuperTwister', 'slot', 'PlayFiver/Habanero/SGSuperTwister.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGSuperTwister'),
(358, 7, 'Treasure Tomb', 'SGTreasureTomb', 'slot', 'PlayFiver/Habanero/SGTreasureTomb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTreasureTomb'),
(359, 7, 'Jugglenut', 'SGJugglenaut', 'slot', 'PlayFiver/Habanero/SGJugglenaut.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGJugglenaut'),
(360, 7, 'Glactic Cash', 'SGGalacticCash', 'slot', 'PlayFiver/Habanero/SGGalacticCash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGGalacticCash'),
(361, 7, 'Zeus 2', 'SGZeus2', 'slot', 'PlayFiver/Habanero/SGZeus2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGZeus2'),
(362, 7, 'Dragon castle', 'SGTheDragonCastle', 'slot', 'PlayFiver/Habanero/SGTheDragonCastle.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTheDragonCastle'),
(363, 7, 'King Teeth Tomb', 'SGKingTutsTomb', 'slot', 'PlayFiver/Habanero/SGKingTutsTomb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGKingTutsTomb'),
(364, 7, 'Carnival cash', 'SGCarnivalCash', 'slot', 'PlayFiver/Habanero/SGCarnivalCash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGCarnivalCash'),
(365, 7, 'Treasure diver', 'SGTreasureDiver', 'slot', 'PlayFiver/Habanero/SGTreasureDiver.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTreasureDiver'),
(366, 7, 'Little Green Money', 'SGLittleGreenMoney', 'slot', 'PlayFiver/Habanero/SGLittleGreenMoney.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGLittleGreenMoney'),
(367, 7, 'Monster Mash Cash', 'SGMonsterMashCash', 'slot', 'PlayFiver/Habanero/SGMonsterMashCash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGMonsterMashCash'),
(368, 7, 'Xiaolin Fortune 100', 'SGShaolinFortunes100', 'slot', 'PlayFiver/Habanero/SGShaolinFortunes100.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGShaolinFortunes100'),
(369, 7, 'Xiaolin Fortune', 'SGShaolinFortunes243', 'slot', 'PlayFiver/Habanero/SGShaolinFortunes243.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGShaolinFortunes243'),
(370, 7, 'Weird Science', 'SGWeirdScience', 'slot', 'PlayFiver/Habanero/SGWeirdScience.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGWeirdScience'),
(371, 7, 'Blackbeards Bounty', 'SGBlackbeardsBounty', 'slot', 'PlayFiver/Habanero/SGBlackbeardsBounty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBlackbeardsBounty'),
(372, 7, 'Dr. Feelgood', 'SGDrFeelgood', 'slot', 'PlayFiver/Habanero/SGDrFeelgood.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGDrFeelgood'),
(373, 7, 'Vikings plunder', 'SGVikingsPlunder', 'slot', 'PlayFiver/Habanero/SGVikingsPlunder.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGVikingsPlunder'),
(374, 7, 'Double O Dollars', 'SGDoubleODollars', 'slot', 'PlayFiver/Habanero/SGDoubleODollars.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGDoubleODollars'),
(375, 7, 'Space fortune', 'SGSpaceFortune', 'slot', 'PlayFiver/Habanero/SGSpaceFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGSpaceFortune'),
(376, 7, 'Pamper me', 'SGPamperMe', 'slot', 'PlayFiver/Habanero/SGPamperMe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGPamperMe'),
(377, 7, 'Zeus', 'SGZeus', 'slot', 'PlayFiver/Habanero/SGZeus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:08:29', 'SGZeus'),
(378, 7, 'Egyptian Dreams', 'SGEgyptianDreams', 'slot', 'PlayFiver/Habanero/SGEgyptianDreams.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGEgyptianDreams'),
(379, 7, 'Barnstormer Bucks', 'SGBarnstormerBucks', 'slot', 'PlayFiver/Habanero/SGBarnstormerBucks.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBarnstormerBucks'),
(380, 7, 'Super strike', 'SGSuperStrike', 'slot', 'PlayFiver/Habanero/SGSuperStrike.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGSuperStrike'),
(381, 7, 'Jungle rumble', 'SGJungleRumble', 'slot', 'PlayFiver/Habanero/SGJungleRumble.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGJungleRumble'),
(382, 7, 'Arctic Wonders', 'SGArcticWonders', 'slot', 'PlayFiver/Habanero/SGArcticWonders.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:08:29', 'SGArcticWonders'),
(383, 7, 'Tower of Pizza', 'SGTowerOfPizza', 'slot', 'PlayFiver/Habanero/SGTowerOfPizza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTowerOfPizza'),
(384, 7, 'Mummy money', 'SGMummyMoney', 'slot', 'PlayFiver/Habanero/SGMummyMoney.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:08:26', 'SGMummyMoney'),
(385, 7, 'bikini island', 'SGBikiniIsland', 'slot', 'PlayFiver/Habanero/SGBikiniIsland.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBikiniIsland'),
(386, 7, 'Queen of Queens II', 'SGQueenOfQueens1024', 'slot', 'PlayFiver/Habanero/SGQueenOfQueens1024.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGQueenOfQueens1024'),
(387, 7, 'Dragon s Realm', 'SGDragonsRealm', 'slot', 'PlayFiver/Habanero/SGDragonsRealm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGDragonsRealm'),
(388, 7, 'All for one', 'SGAllForOne', 'slot', 'PlayFiver/Habanero/SGAllForOne.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGAllForOne'),
(389, 7, 'Flying high', 'SGFlyingHigh', 'slot', 'PlayFiver/Habanero/SGFlyingHigh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFlyingHigh'),
(390, 7, 'Mr. Bling', 'SGMrBling', 'slot', 'PlayFiver/Habanero/SGMrBling.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGMrBling'),
(391, 7, 'Mystic Fortune', 'SGMysticFortune', 'slot', 'PlayFiver/Habanero/SGMysticFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGMysticFortune'),
(392, 7, 'Queen of queens', 'SGQueenOfQueens243', 'slot', 'PlayFiver/Habanero/SGQueenOfQueens243.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGQueenOfQueens243'),
(393, 7, 'The Graph Escape', 'SGGrapeEscape', 'slot', 'PlayFiver/Habanero/SGGrapeEscape.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGGrapeEscape'),
(394, 7, 'Golden unicorn', 'SGGoldenUnicorn', 'slot', 'PlayFiver/Habanero/SGGoldenUnicorn.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGGoldenUnicorn'),
(395, 7, 'Frontier Fortune', 'SGFrontierFortunes', 'slot', 'PlayFiver/Habanero/SGFrontierFortunes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGFrontierFortunes'),
(396, 7, 'Indian Cash Catcher', 'SGIndianCashCatcher', 'slot', 'PlayFiver/Habanero/SGIndianCashCatcher.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGIndianCashCatcher'),
(397, 7, 'Skys the Limit', 'SGSkysTheLimit', 'slot', 'PlayFiver/Habanero/SGSkysTheLimit.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:08:22', 'SGSkysTheLimit'),
(398, 7, 'The Big Deal', 'SGTheBigDeal', 'slot', 'PlayFiver/Habanero/SGTheBigDeal.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGTheBigDeal'),
(399, 7, 'Cashosaurus', 'SGCashosaurus', 'slot', 'PlayFiver/Habanero/SGCashosaurus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGCashosaurus'),
(400, 7, 'Disco funk', 'SGDiscoFunk', 'slot', 'PlayFiver/Habanero/SGDiscoFunk.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGDiscoFunk'),
(401, 7, 'Calaveras Explociba', 'SGCalaverasExplosivas', 'slot', 'PlayFiver/Habanero/SGCalaverasExplosivas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGCalaverasExplosivas'),
(402, 7, 'Nine Tales', 'SGNineTails', 'slot', 'PlayFiver/Habanero/SGNineTails.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGNineTails'),
(403, 7, 'Mystic Fortune Deluxe', 'SGMysticFortuneDeluxe', 'slot', 'PlayFiver/Habanero/SGMysticFortuneDeluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:09:41', 'SGMysticFortuneDeluxe'),
(404, 7, 'Lucky durian', 'SGLuckyDurian', 'slot', 'PlayFiver/Habanero/SGLuckyDurian.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:12:39', 'SGLuckyDurian'),
(405, 7, 'Disco beat', 'SGDiscoBeats', 'slot', 'PlayFiver/Habanero/SGDiscoBeats.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:10:42', 'SGDiscoBeats'),
(406, 7, 'Lantern lucky', 'SGLanternLuck', 'slot', 'PlayFiver/Habanero/SGLanternLuck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGLanternLuck'),
(407, 7, 'Boom runner', 'SGBombRunner', 'slot', 'PlayFiver/Habanero/SGBombRunner.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SGBombRunner'),
(408, 15, 'SUN OF EGYPT', 'sun_of_egypt', 'slot', 'PlayFiver/Booongo/sun_of_egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:18', 'sun_of_egypt'),
(409, 15, 'SUN OF EGYPT 2', 'sun_of_egypt_2', 'slot', 'PlayFiver/Booongo/sun_of_egypt_2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'sun_of_egypt_2'),
(410, 15, 'HAPPY FISH', 'happy_fish', 'slot', 'PlayFiver/Booongo/happy_fish.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:30:44', 'happy_fish'),
(411, 15, 'QUEEN OF THE SUN', 'queen_of_the_sun', 'slot', 'PlayFiver/Booongo/queen_of_the_sun.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'queen_of_the_sun'),
(412, 15, 'TIGER JUNGLE', 'tiger_jungle', 'slot', 'PlayFiver/Booongo/tiger_jungle.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:27', 'tiger_jungle'),
(413, 15, 'BLACK WOLF', 'black_wolf', 'slot', 'PlayFiver/Booongo/black_wolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:34:14', 'black_wolf'),
(414, 15, 'HIT THE GOLD', 'hit_the_gold', 'slot', 'PlayFiver/Booongo/hit_the_gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'hit_the_gold'),
(415, 15, 'CANDY BOOM', 'candy_boom', 'slot', 'PlayFiver/Booongo/candy_boom.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'candy_boom'),
(416, 15, 'SCARAB RICHES', 'scarab_riches', 'slot', 'PlayFiver/Booongo/scarab_riches.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'scarab_riches'),
(417, 15, 'GOLDEN DANCING LION', 'golden_dancing_lion', 'slot', 'PlayFiver/Booongo/golden_dancing_lion.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'golden_dancing_lion'),
(418, 15, 'DRAGON PEARLS', 'dragon_pearls', 'slot', 'PlayFiver/Booongo/dragon_pearls.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'dragon_pearls'),
(419, 15, '3 COINS', '3_coins', 'slot', 'PlayFiver/Booongo/3_coins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '3_coins'),
(420, 15, 'SUPER RICH GOD', 'super_rich_god', 'slot', 'PlayFiver/Booongo/super_rich_god.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'super_rich_god'),
(421, 15, '15 DRAGON PEARLS', '15_dragon_pearls', 'slot', 'PlayFiver/Booongo/15_dragon_pearls.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:35:27', '15_dragon_pearls'),
(422, 15, 'AZTEC SUN', 'aztec_sun', 'slot', 'PlayFiver/Booongo/aztec_sun.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'aztec_sun'),
(423, 15, 'SCARAB TEMPLE', 'scarab_temple', 'slot', 'PlayFiver/Booongo/scarab_temple.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'scarab_temple'),
(424, 15, 'GODS TEMPLE DELUXE', 'gods_temple_deluxe', 'slot', 'PlayFiver/Booongo/gods_temple_deluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'gods_temple_deluxe'),
(425, 15, 'BOOK OF SUN', 'book_of_sun', 'slot', 'PlayFiver/Booongo/book_of_sun.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'book_of_sun'),
(426, 15, '777 GEMS', '777_gems', 'slot', 'PlayFiver/Booongo/777_gems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '777_gems'),
(427, 15, 'BOOK OF SUN MULTICHANCE', 'book_of_sun_multichance', 'slot', 'PlayFiver/Booongo/book_of_sun_multichance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'book_of_sun_multichance'),
(428, 15, 'OLYMPIAN GODS', 'olympian_gods', 'slot', 'PlayFiver/Booongo/olympian_gods.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'olympian_gods'),
(429, 15, '777 GEMS RESPIN', '777_gems_respin', 'slot', 'PlayFiver/Booongo/777_gems_respin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:59', '777_gems_respin'),
(430, 15, 'TIGERS GOLD', 'tigers_gold', 'slot', 'PlayFiver/Booongo/tigers_gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'tigers_gold'),
(431, 15, 'MOON SISTERS', 'moon_sisters', 'slot', 'PlayFiver/Booongo/moon_sisters.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'moon_sisters'),
(432, 15, 'BOOK OF SUN CHOICE', 'book_of_sun_choice', 'slot', 'PlayFiver/Booongo/book_of_sun_choice.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'book_of_sun_choice'),
(433, 15, 'SUPER MARBLE', 'super_marble', 'slot', 'PlayFiver/Booongo/super_marble.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'super_marble'),
(434, 15, 'BUDDHA FORTUNE', 'buddha_fortune', 'slot', 'PlayFiver/Booongo/buddha_fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'buddha_fortune'),
(435, 15, 'GREAT PANDA', 'great_panda', 'slot', 'PlayFiver/Booongo/great_panda.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:30:38', 'great_panda'),
(436, 15, '15 GOLDEN EGGS', '15_golden_eggs', 'slot', 'PlayFiver/Booongo/15_golden_eggs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:14', '15_golden_eggs'),
(437, 15, 'THUNDER OF OLYMPUS', 'thunder_of_olympus', 'slot', 'PlayFiver/Booongo/thunder_of_olympus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'thunder_of_olympus'),
(438, 15, 'EYE OF GOLD', 'eye_of_gold', 'slot', 'PlayFiver/Booongo/eye_of_gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'eye_of_gold'),
(439, 15, 'TIGER STONE', 'tiger_stone', 'slot', 'PlayFiver/Booongo/tiger_stone.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'tiger_stone'),
(440, 15, 'MAGIC APPLE', 'magic_apple', 'slot', 'PlayFiver/Booongo/magic_apple.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:45', 'magic_apple'),
(441, 15, 'WOLF SAGA', 'wolf_saga', 'slot', 'PlayFiver/Booongo/wolf_saga.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wolf_saga'),
(442, 15, 'MAGIC BALL', 'magic_ball', 'slot', 'PlayFiver/Booongo/magic_ball.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'magic_ball'),
(443, 15, 'SCARAB BOOST', 'scarab_boost', 'slot', 'PlayFiver/Booongo/scarab_boost.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'scarab_boost'),
(444, 15, 'WUKONG', 'wukong', 'slot', 'PlayFiver/Booongo/wukong.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wukong'),
(445, 15, 'PEARL DIVER', 'pearl_diver', 'slot', 'PlayFiver/Booongo/pearl_diver.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pearl_diver'),
(446, 15, '3 COINS EGYPT', '3_coins_egypt', 'slot', 'PlayFiver/Booongo/3_coins_egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:33:16', '3_coins_egypt'),
(447, 15, 'GANESHA BOOST', 'ganesha_boost', 'slot', 'PlayFiver/Booongo/ganesha_boost.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ganesha_boost'),
(448, 15, 'WOLF NIGHT', 'wolf_night', 'slot', 'PlayFiver/Booongo/wolf_night.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wolf_night'),
(449, 15, 'BOOK OF WIZARD', 'book_of_wizard', 'slot', 'PlayFiver/Booongo/book_of_wizard.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'book_of_wizard'),
(450, 15, 'LORD FORTUNE 2', 'lord_fortune_2', 'slot', 'PlayFiver/Booongo/lord_fortune_2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:30:42', 'lord_fortune_2'),
(451, 15, 'GOLD EXPRESS', 'gold_express', 'slot', 'PlayFiver/Booongo/gold_express.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:30:42', 'gold_express'),
(452, 15, 'BOOK OF WIZARD CRYSTAL', 'book_of_wizard_crystal', 'slot', 'PlayFiver/Booongo/book_of_wizard_crystal.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'book_of_wizard_crystal'),
(453, 15, 'PEARL DIVER 2', 'pearl_diver_2', 'slot', 'PlayFiver/Booongo/pearl_diver_2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pearl_diver_2'),
(454, 15, 'SUN OF EGYPT 3', 'sun_of_egypt_3', 'slot', 'PlayFiver/Booongo/sun_of_egypt_3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:34:25', 'sun_of_egypt_3'),
(455, 15, 'CAISHEN WEALTH', 'caishen_wealth', 'slot', 'PlayFiver/Booongo/caishen_wealth.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'caishen_wealth'),
(456, 15, 'AZTEC FIRE', 'aztec_fire', 'slot', 'PlayFiver/Booongo/aztec_fire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:30:44', 'aztec_fire'),
(457, 10, 'HAND OF GOLD', 'hand_of_gold', 'slot', 'PlayFiver/Playson/hand_of_gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'hand_of_gold'),
(458, 10, 'LEGEND OF CLEOPATRA', 'legend_of_cleopatra', 'slot', 'PlayFiver/Playson/legend_of_cleopatra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 17:14:11', 'legend_of_cleopatra'),
(459, 10, '40 JOKER STAXX', '40_joker_staxx', 'slot', 'PlayFiver/Playson/40_joker_staxx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 19:05:43', '40_joker_staxx'),
(460, 10, 'BURNING WINS', 'burning_wins', 'slot', 'PlayFiver/Playson/burning_wins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 19:05:36', 'burning_wins'),
(461, 10, 'BOOK OF GOLD', 'book_of_gold', 'slot', 'PlayFiver/Playson/book_of_gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:36:31', 'book_of_gold'),
(462, 10, '100 JOKER STAXX', '100_joker_staxx', 'slot', 'PlayFiver/Playson/100_joker_staxx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '100_joker_staxx'),
(463, 10, 'BOOK OF GOLD CLASSIC', 'book_of_gold_classic', 'slot', 'PlayFiver/Playson/book_of_gold_classic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:33:55', 'book_of_gold_classic'),
(464, 10, 'BUFFALO XMAS', 'buffalo_xmas', 'slot', 'PlayFiver/Playson/buffalo_xmas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 19:05:41', 'buffalo_xmas'),
(465, 16, 'Golden eggs', '67', 'slot', 'PlayFiver/Cq9/67.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '67'),
(466, 16, 'Hercules', '161', 'slot', 'PlayFiver/Cq9/161.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '161'),
(467, 16, 'Super 5', '16', 'slot', 'PlayFiver/Cq9/16.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '16'),
(468, 16, 'Happy Rich Year', '72', 'slot', 'PlayFiver/Cq9/72.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '72'),
(469, 16, 'Fruit King', '1', 'slot', 'PlayFiver/Cq9/1.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:39:11', '1'),
(470, 16, 'Neja Advent', '163', 'slot', 'PlayFiver/Cq9/163.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '163'),
(471, 16, '777', '26', 'slot', 'PlayFiver/Cq9/26.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:38:04', '26'),
(472, 16, 'Good fortune', '50', 'slot', 'PlayFiver/Cq9/50.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:38:23', '50'),
(473, 16, 'God of war', '31', 'slot', 'PlayFiver/Cq9/31.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '31'),
(474, 16, 'Zeus', '64', 'slot', 'PlayFiver/Cq9/64.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:39:47', '64'),
(475, 16, 'Pasaycen', '69', 'slot', 'PlayFiver/Cq9/69.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '69'),
(476, 16, 'Thor', '89', 'slot', 'PlayFiver/Cq9/89.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:36:09', '89'),
(477, 16, 'Wolf moon', '46', 'slot', 'PlayFiver/Cq9/46.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '46'),
(478, 16, 'Fire chibi', '139', 'slot', 'PlayFiver/Cq9/139.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '139'),
(479, 16, 'Gu Gu Gu', '15', 'slot', 'PlayFiver/Cq9/15.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '15'),
(480, 16, 'Fire Chibi 2', '140', 'slot', 'PlayFiver/Cq9/140.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '140'),
(481, 16, 'So Sweet', '8', 'slot', 'PlayFiver/Cq9/8.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:36:09', '8'),
(482, 16, 'Flower fortune', '147', 'slot', 'PlayFiver/Cq9/147.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '147'),
(483, 16, 'Flying Kai Shen', '113', 'slot', 'PlayFiver/Cq9/113.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '113'),
(484, 16, 'Gu Gu Gu 2', '58', 'slot', 'PlayFiver/Cq9/58.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '58'),
(485, 16, 'Wheel money', '128', 'slot', 'PlayFiver/Cq9/128.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '128'),
(486, 16, 'Mr Rich', '5', 'slot', 'PlayFiver/Cq9/5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '5'),
(487, 16, 'Gu Gu Gu 3', '180', 'slot', 'PlayFiver/Cq9/180.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:36:11', '180'),
(488, 16, 'SkullSkull', '118', 'slot', 'PlayFiver/Cq9/118.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '118'),
(489, 16, 'Fortune totem', '148', 'slot', 'PlayFiver/Cq9/148.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '148'),
(490, 16, 'Diamond treasure', '144', 'slot', 'PlayFiver/Cq9/144.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '144'),
(491, 16, 'Hot spin', '19', 'slot', 'PlayFiver/Cq9/19.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:39:18', '19'),
(492, 16, 'Pyramid radar', '112', 'slot', 'PlayFiver/Cq9/112.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '112'),
(493, 16, 'Pa Kai Shen2', '160', 'slot', 'PlayFiver/Cq9/160.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '160'),
(494, 16, 'Pharaoh gold', '47', 'slot', 'PlayFiver/Cq9/47.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:36:04', '47'),
(495, 16, 'Sakura legend', '13', 'slot', 'PlayFiver/Cq9/13.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '13'),
(496, 16, 'Gopher s War', '34', 'slot', 'PlayFiver/Cq9/34.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '34'),
(497, 16, 'Summer mood', '59', 'slot', 'PlayFiver/Cq9/59.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '59'),
(498, 16, 'Football boots', '95', 'slot', 'PlayFiver/Cq9/95.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '95'),
(499, 16, 'The Beast War', '57', 'slot', 'PlayFiver/Cq9/57.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '57'),
(500, 16, 'Great lion', '17', 'slot', 'PlayFiver/Cq9/17.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '17'),
(501, 16, '888', '20', 'slot', 'PlayFiver/Cq9/20.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:38:32', '20'),
(502, 16, 'Thor 2', '182', 'slot', 'PlayFiver/Cq9/182.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '182'),
(503, 16, 'Fire 777', '66', 'slot', 'PlayFiver/Cq9/66.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '66'),
(504, 16, 'God of Chess', '2', 'slot', 'PlayFiver/Cq9/2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '2'),
(505, 16, 'Big wolf', '21', 'slot', 'PlayFiver/Cq9/21.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '21'),
(506, 16, 'Dragon s Treasure', '197', 'slot', 'PlayFiver/Cq9/197.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:36:06', '197'),
(507, 16, 'Money tree', '208', 'slot', 'PlayFiver/Cq9/208.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '208'),
(508, 16, 'Burning Si-Yow', '212', 'slot', 'PlayFiver/Cq9/212.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '212'),
(509, 16, 'Ninja raccoon', '214', 'slot', 'PlayFiver/Cq9/214.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '214'),
(510, 16, 'Dollar night', '218', 'slot', 'PlayFiver/Cq9/218.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '218'),
(511, 14, 'The Great Wall Treasure', 'greatwall', 'slot', 'PlayFiver/Evoplay/greatwall.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'greatwall'),
(512, 14, 'Chinese New Year', 'chinesenewyear', 'slot', 'PlayFiver/Evoplay/chinesenewyear.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'chinesenewyear'),
(513, 14, 'Jewelry store', 'jewellerystore', 'slot', 'PlayFiver/Evoplay/jewellerystore.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'jewellerystore'),
(514, 14, 'Red cliff', 'redcliff', 'slot', 'PlayFiver/Evoplay/redcliff.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'redcliff'),
(515, 14, 'Elven Princess', 'ElvenPrincesses', 'slot', 'PlayFiver/Evoplay/ElvenPrincesses.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ElvenPrincesses'),
(516, 14, 'Robinson', 'robinzon', 'slot', 'PlayFiver/Evoplay/robinzon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'robinzon'),
(517, 14, 'Aeronauts', 'aeronauts', 'slot', 'PlayFiver/Evoplay/aeronauts.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'aeronauts'),
(518, 14, 'Monster rap', 'monsterlab', 'slot', 'PlayFiver/Evoplay/monsterlab.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'monsterlab'),
(519, 14, 'Trip to the Future', 'TriptotheFuture', 'slot', 'PlayFiver/Evoplay/TriptotheFuture.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TriptotheFuture'),
(520, 14, 'Nook World', 'NukeWorld', 'slot', 'PlayFiver/Evoplay/NukeWorld.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'NukeWorld'),
(521, 14, 'Legend of Khan', 'legendofkaan', 'slot', 'PlayFiver/Evoplay/legendofkaan.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'legendofkaan'),
(522, 14, 'Night of the Living Tales', 'LivingTales', 'slot', 'PlayFiver/Evoplay/LivingTales.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LivingTales'),
(523, 14, 'Ice mania', 'IceMania', 'slot', 'PlayFiver/Evoplay/IceMania.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:59:00', 'IceMania'),
(524, 14, 'Valley of Dreams', 'ValleyOfDreams', 'slot', 'PlayFiver/Evoplay/ValleyOfDreams.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ValleyOfDreams'),
(525, 14, 'Fruit Nova', 'FruitNova', 'slot', 'PlayFiver/Evoplay/FruitNova.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FruitNova'),
(526, 14, 'Tree of light', 'TreeOfLight', 'slot', 'PlayFiver/Evoplay/TreeOfLight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TreeOfLight'),
(527, 14, 'Temple of the dead', 'TempleOfDead', 'slot', 'PlayFiver/Evoplay/TempleOfDead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TempleOfDead');
INSERT INTO `games` (`id`, `provider_id`, `game_name`, `game_id`, `game_type`, `cover`, `status`, `technology`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `game_code`) VALUES
(528, 14, 'Runes of Destiny', 'RunesOfDestiny', 'slot', 'PlayFiver/Evoplay/RunesOfDestiny.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'RunesOfDestiny'),
(529, 14, 'Ellen Fortune', 'EllensFortune', 'slot', 'PlayFiver/Evoplay/EllensFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'EllensFortune'),
(530, 14, 'Unlimited Wishes', 'UnlimitedWishes', 'slot', 'PlayFiver/Evoplay/UnlimitedWishes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'UnlimitedWishes'),
(531, 14, 'Food fist', 'FoodFeast', 'slot', 'PlayFiver/Evoplay/FoodFeast.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:58:58', 'FoodFeast'),
(532, 14, 'Epic legends', 'EpicLegends', 'slot', 'PlayFiver/Evoplay/EpicLegends.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'EpicLegends'),
(533, 14, 'Sweet sugar', 'SweetSugar', 'slot', 'PlayFiver/Evoplay/SweetSugar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SweetSugar'),
(534, 14, 'Cycle of Luck', 'CycleofLuck', 'slot', 'PlayFiver/Evoplay/CycleofLuck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:03:21', 'CycleofLuck'),
(535, 14, 'Gangster night', 'GangsterNight', 'slot', 'PlayFiver/Evoplay/GangsterNight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GangsterNight'),
(536, 14, 'Gold of sirens', 'GoldOfSirens', 'slot', 'PlayFiver/Evoplay/GoldOfSirens.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:01:09', 'GoldOfSirens'),
(537, 14, 'Bloody brilliant', 'BloodyBrilliant', 'slot', 'PlayFiver/Evoplay/BloodyBrilliant.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BloodyBrilliant'),
(538, 14, 'Temple of the Dead BB', 'TempleOfDeadBonusBuy', 'slot', 'PlayFiver/Evoplay/TempleOfDeadBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TempleOfDeadBonusBuy'),
(539, 14, 'Shadow of Luxor', 'ShadowOfLuxor', 'slot', 'PlayFiver/Evoplay/ShadowOfLuxor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ShadowOfLuxor'),
(540, 14, 'Cycle of Luck BB', 'CycleofLuckBonusBuy', 'slot', 'PlayFiver/Evoplay/CycleofLuckBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CycleofLuckBonusBuy'),
(541, 14, 'Anubis moon', 'AnubisMoon', 'slot', 'PlayFiver/Evoplay/AnubisMoon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'AnubisMoon'),
(542, 14, 'Fruit disco', 'FruitDisco', 'slot', 'PlayFiver/Evoplay/FruitDisco.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:59:04', 'FruitDisco'),
(543, 14, 'Fruit Super Nova 30', 'FruitSuperNova30', 'slot', 'PlayFiver/Evoplay/FruitSuperNova30.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:02:03', 'FruitSuperNova30'),
(544, 14, 'Curse of the Pharaoh', 'CurseOfThePharaoh', 'slot', 'PlayFiver/Evoplay/CurseOfThePharaoh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CurseOfThePharaoh'),
(545, 14, 'Gold of Sirens BB', 'GoldOfSirensBonusBuy', 'slot', 'PlayFiver/Evoplay/GoldOfSirensBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GoldOfSirensBonusBuy'),
(546, 14, 'Fruit Super Nova 60', 'FruitSuperNova60', 'slot', 'PlayFiver/Evoplay/FruitSuperNova60.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FruitSuperNova60'),
(547, 14, 'Curse of the Pharaoh BB', 'CurseofthePharaohBonusBuy', 'slot', 'PlayFiver/Evoplay/CurseofthePharaohBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CurseofthePharaohBonusBuy'),
(548, 14, 'Fruit Super Nova 100', 'FruitSuperNova100', 'slot', 'PlayFiver/Evoplay/FruitSuperNova100.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FruitSuperNova100'),
(549, 14, 'Whoft Super Nova 80', 'FruitSuperNova80', 'slot', 'PlayFiver/Evoplay/FruitSuperNova80.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FruitSuperNova80'),
(550, 14, 'Dragons Tavern', 'DragonsTavern', 'slot', 'PlayFiver/Evoplay/DragonsTavern.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DragonsTavern'),
(551, 14, 'Christmas Riti BB', 'ChristmasReachBonusBuy', 'slot', 'PlayFiver/Evoplay/ChristmasReachBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ChristmasReachBonusBuy'),
(552, 14, 'Wild overlord', 'WildOverlords', 'slot', 'PlayFiver/Evoplay/WildOverlords.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'WildOverlords'),
(553, 14, 'Dragons Tavern BB', 'DragonsTavernBonusBuy', 'slot', 'PlayFiver/Evoplay/DragonsTavernBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DragonsTavernBonusBuy'),
(554, 14, 'Budai reels', 'BudaiReels', 'slot', 'PlayFiver/Evoplay/BudaiReels.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:04:01', 'BudaiReels'),
(555, 14, 'Budai Lils BB', 'BudaiReelsBonusBuy', 'slot', 'PlayFiver/Evoplay/BudaiReelsBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BudaiReelsBonusBuy'),
(556, 14, 'Money minter', 'MoneyMinter', 'slot', 'PlayFiver/Evoplay/MoneyMinter.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MoneyMinter'),
(557, 14, 'The Greatest Catch', 'TheGreatestCatch', 'slot', 'PlayFiver/Evoplay/TheGreatestCatch.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TheGreatestCatch'),
(558, 14, 'Tree of Light BB', 'TreeOfLightBB', 'slot', 'PlayFiver/Evoplay/TreeOfLightBB.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TreeOfLightBB'),
(559, 14, 'Wolf Hiding', 'WolfHiding', 'slot', 'PlayFiver/Evoplay/WolfHiding.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'WolfHiding'),
(560, 14, 'Camino de Chili', 'CaminoDeChili', 'slot', 'PlayFiver/Evoplay/CaminoDeChili.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:05:02', 'CaminoDeChili'),
(561, 14, 'candy dreams', 'CandyDreamsSweetPlanet', 'slot', 'PlayFiver/Evoplay/CandyDreamsSweetPlanet.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:04:05', 'CandyDreamsSweetPlanet'),
(562, 14, 'Wild Overlord BB', 'WildOverlordsBonusBuy', 'slot', 'PlayFiver/Evoplay/WildOverlordsBonusBuy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'WildOverlordsBonusBuy'),
(563, 14, 'Temple of Thunder', 'TempleOfThunder', 'slot', 'PlayFiver/Evoplay/TempleOfThunder.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TempleOfThunder'),
(564, 12, 'WildTriads', 'WildTriads', 'slot', 'PlayFiver/Toptrend/WildTriads.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'WildTriads'),
(565, 12, 'Golden Dragon', 'GoldenDragon', 'slot', 'PlayFiver/Toptrend/GoldenDragon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:32:37', 'GoldenDragon'),
(566, 12, 'Reels Of Fortune', 'ReelsOfFortune', 'slot', 'PlayFiver/Toptrend/ReelsOfFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-03 23:40:29', 'ReelsOfFortune'),
(567, 12, 'Golden Amazon', 'GoldenAmazon', 'slot', 'PlayFiver/Toptrend/GoldenAmazon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GoldenAmazon'),
(568, 12, 'MonkeyLuck', 'MonkeyLuck', 'slot', 'PlayFiver/Toptrend/MonkeyLuck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MonkeyLuck'),
(569, 12, 'League Of Champions', 'LeagueOfChampions', 'slot', 'PlayFiver/Toptrend/LeagueOfChampions.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LeagueOfChampions'),
(570, 12, 'MadMonkey', 'MadMonkeyH5', 'slot', 'PlayFiver/Toptrend/MadMonkeyH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MadMonkeyH5'),
(571, 12, 'Dynasty Empire', 'DynastyEmpire', 'slot', 'PlayFiver/Toptrend/DynastyEmpire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:32:27', 'DynastyEmpire'),
(572, 12, 'SuperKids', 'SuperKids', 'slot', 'PlayFiver/Toptrend/SuperKids.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SuperKids'),
(573, 12, 'HotVolcano', 'HotVolcanoH5', 'slot', 'PlayFiver/Toptrend/HotVolcanoH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'HotVolcanoH5'),
(574, 12, 'Huluwa', 'Huluwa', 'slot', 'PlayFiver/Toptrend/Huluwa.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'Huluwa'),
(575, 12, 'LegendOfLink', 'LegendOfLinkH5', 'slot', 'PlayFiver/Toptrend/LegendOfLinkH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LegendOfLinkH5'),
(576, 12, 'DetectiveBlackCat', 'DetectiveBlackCat', 'slot', 'PlayFiver/Toptrend/DetectiveBlackCat.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DetectiveBlackCat'),
(577, 12, 'Chilli Gold', 'ChilliGoldH5', 'slot', 'PlayFiver/Toptrend/ChilliGoldH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ChilliGoldH5'),
(578, 12, 'Silver Lion', 'SilverLionH5', 'slot', 'PlayFiver/Toptrend/SilverLionH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SilverLionH5'),
(579, 12, 'ThunderingZeus', 'ThunderingZeus', 'slot', 'PlayFiver/Toptrend/ThunderingZeus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:48:15', 'ThunderingZeus'),
(580, 12, 'Dragon Palace', 'DragonPalaceH5', 'slot', 'PlayFiver/Toptrend/DragonPalaceH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DragonPalaceH5'),
(581, 12, 'MadMonkey', 'MadMonkey2', 'slot', 'PlayFiver/Toptrend/MadMonkey2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MadMonkey2'),
(582, 12, 'Medusa Curse', 'MedusaCurse', 'slot', 'PlayFiver/Toptrend/MedusaCurse.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MedusaCurse'),
(583, 12, 'Battle Heroes', 'BattleHeroes', 'slot', 'PlayFiver/Toptrend/BattleHeroes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BattleHeroes'),
(584, 12, 'Neptunes Gold', 'NeptunesGoldH5', 'slot', 'PlayFiver/Toptrend/NeptunesGoldH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'NeptunesGoldH5'),
(585, 12, 'Heroes Never Die', 'HeroesNeverDie', 'slot', 'PlayFiver/Toptrend/HeroesNeverDie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'HeroesNeverDie'),
(586, 12, 'Wild Wild Witch', 'WildWildWitch', 'slot', 'PlayFiver/Toptrend/WildWildWitch.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'WildWildWitch'),
(587, 12, 'Wild Kart Racers', 'WildKartRacers', 'slot', 'PlayFiver/Toptrend/WildKartRacers.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 17:32:36', 'WildKartRacers'),
(588, 12, 'KingDinosaur', 'KingDinosaur', 'slot', 'PlayFiver/Toptrend/KingDinosaur.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:33:18', 'KingDinosaur'),
(589, 12, 'GoldenGenie', 'GoldenGenie', 'slot', 'PlayFiver/Toptrend/GoldenGenie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GoldenGenie'),
(590, 12, 'UltimateFighter', 'UltimateFighter', 'slot', 'PlayFiver/Toptrend/UltimateFighter.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'UltimateFighter'),
(591, 12, 'EverlastingSpins', 'EverlastingSpins', 'slot', 'PlayFiver/Toptrend/EverlastingSpins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'EverlastingSpins'),
(592, 12, 'Zoomania', 'Zoomania', 'slot', 'PlayFiver/Toptrend/Zoomania.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'Zoomania'),
(593, 12, 'Laser Cats', 'LaserCats', 'slot', 'PlayFiver/Toptrend/LaserCats.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LaserCats'),
(594, 12, 'DiamondFortune', 'DiamondFortune', 'slot', 'PlayFiver/Toptrend/DiamondFortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 12:52:23', 'DiamondFortune'),
(595, 12, 'GoldenClaw', 'GoldenClaw', 'slot', 'PlayFiver/Toptrend/GoldenClaw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GoldenClaw'),
(596, 12, 'PandaWarrior', 'PandaWarrior', 'slot', 'PlayFiver/Toptrend/PandaWarrior.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-03 23:39:21', 'PandaWarrior'),
(597, 12, 'RoyalGoldenDragon', 'RoyalGoldenDragon', 'slot', 'PlayFiver/Toptrend/RoyalGoldenDragon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'RoyalGoldenDragon'),
(598, 12, 'MegaMaya', 'MegaMaya', 'slot', 'PlayFiver/Toptrend/MegaMaya.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MegaMaya'),
(599, 12, 'MegaPhoenix', 'MegaPhoenix', 'slot', 'PlayFiver/Toptrend/MegaPhoenix.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MegaPhoenix'),
(600, 12, 'DolphinGold', 'DolphinGoldH5', 'slot', 'PlayFiver/Toptrend/DolphinGoldH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DolphinGoldH5'),
(601, 12, 'DragonKing', 'DragonKingH5', 'slot', 'PlayFiver/Toptrend/DragonKingH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DragonKingH5'),
(602, 12, 'LuckyPanda', 'LuckyPandaH5', 'slot', 'PlayFiver/Toptrend/LuckyPandaH5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LuckyPandaH5'),
(603, 13, 'Crazy Basketball', 'btball5x20', 'slot', 'PlayFiver/Dreamtech/btball5x20.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'btball5x20'),
(604, 13, 'DragonPhoenix Prosper', 'dnp', 'slot', 'PlayFiver/Dreamtech/dnp.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'dnp'),
(605, 13, 'Glory of Heroes', 'crystal', 'slot', 'PlayFiver/Dreamtech/crystal.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'crystal'),
(606, 13, 'FULUSHOU', 'fls', 'slot', 'PlayFiver/Dreamtech/fls.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'fls'),
(607, 13, 'Four Holy Beasts', 'fourss', 'slot', 'PlayFiver/Dreamtech/fourss.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'fourss'),
(608, 13, '3D Slot', 'casino', 'slot', 'PlayFiver/Dreamtech/casino.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:32', 'casino'),
(609, 13, 'Crazy GO GO GO', 'crazy5x243', 'slot', 'PlayFiver/Dreamtech/crazy5x243.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'crazy5x243'),
(610, 13, 'RocknRoll Night', 'rocknight', 'slot', 'PlayFiver/Dreamtech/rocknight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:44:16', 'rocknight'),
(611, 13, 'Blue Sea', 'bluesea', 'slot', 'PlayFiver/Dreamtech/bluesea.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bluesea'),
(612, 13, 'Crazy Circus', 'circus', 'slot', 'PlayFiver/Dreamtech/circus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'circus'),
(613, 13, 'Bikini Party', 'bikini', 'slot', 'PlayFiver/Dreamtech/bikini.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bikini'),
(614, 13, 'SO YOUNG', 'foryouth5x25', 'slot', 'PlayFiver/Dreamtech/foryouth5x25.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'foryouth5x25'),
(615, 13, 'Four Beauties', 'fourbeauty', 'slot', 'PlayFiver/Dreamtech/fourbeauty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'fourbeauty'),
(616, 13, 'Candy House', 'sweethouse', 'slot', 'PlayFiver/Dreamtech/sweethouse.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'sweethouse'),
(617, 13, 'Legend of the King', 'legend5x25', 'slot', 'PlayFiver/Dreamtech/legend5x25.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'legend5x25'),
(618, 13, 'Beijing opera', 'opera', 'slot', 'PlayFiver/Dreamtech/opera.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'opera'),
(619, 13, 'Big Red', 'bigred', 'slot', 'PlayFiver/Dreamtech/bigred.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bigred'),
(620, 13, 'Wrath of Thor', 'wrathofthor', 'slot', 'PlayFiver/Dreamtech/wrathofthor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wrathofthor'),
(621, 13, 'Boxing Arena', 'boxingarena', 'slot', 'PlayFiver/Dreamtech/boxingarena.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'boxingarena'),
(622, 13, 'Elf Kingdom', 'fantasyforest', 'slot', 'PlayFiver/Dreamtech/fantasyforest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'fantasyforest'),
(623, 13, 'Egyptian Empire', 'egyptian', 'slot', 'PlayFiver/Dreamtech/egyptian.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:44:47', 'egyptian'),
(624, 13, 'Hotpot Feast', 'hotpotfeast', 'slot', 'PlayFiver/Dreamtech/hotpotfeast.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'hotpotfeast'),
(625, 13, 'Magician', 'magician', 'slot', 'PlayFiver/Dreamtech/magician.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'magician'),
(626, 13, 'Galaxy Wars', 'galaxywars', 'slot', 'PlayFiver/Dreamtech/galaxywars.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'galaxywars'),
(627, 13, 'Easy Rider', 'easyrider', 'slot', 'PlayFiver/Dreamtech/easyrider.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'easyrider'),
(628, 13, 'Jin Yu Man Tang', 'goldjade5x50', 'slot', 'PlayFiver/Dreamtech/goldjade5x50.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'goldjade5x50'),
(629, 13, 'shokudo', 'shokudo', 'slot', 'PlayFiver/Dreamtech/shokudo.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'shokudo'),
(630, 13, 'Treasure Hunt Trip', 'train', 'slot', 'PlayFiver/Dreamtech/train.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'train'),
(631, 13, 'Love Fighters', 'lovefighters', 'slot', 'PlayFiver/Dreamtech/lovefighters.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'lovefighters'),
(632, 13, 'Aladdin s Wish', 'genie', 'slot', 'PlayFiver/Dreamtech/genie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'genie'),
(633, 13, 'Little Big Garden', 'garden', 'slot', 'PlayFiver/Dreamtech/garden.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:15', 'garden'),
(634, 13, 'Crazy Alchemist', 'alchemist', 'slot', 'PlayFiver/Dreamtech/alchemist.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'alchemist'),
(635, 13, 'Dinosaur World', 'dinosaur5x25', 'slot', 'PlayFiver/Dreamtech/dinosaur5x25.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:15', 'dinosaur5x25'),
(636, 13, 'Tomb Shadow', 'tombshadow', 'slot', 'PlayFiver/Dreamtech/tombshadow.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'tombshadow'),
(637, 13, 'Clash of Three kingdoms', 'clash', 'slot', 'PlayFiver/Dreamtech/clash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'clash'),
(638, 13, 'Magic Bean Legend', 'magicbean', 'slot', 'PlayFiver/Dreamtech/magicbean.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:12', 'magicbean'),
(639, 13, 'Secret Date', 'secretdate', 'slot', 'PlayFiver/Dreamtech/secretdate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:10', 'secretdate'),
(640, 13, 'Germ Lab', 'bacteria', 'slot', 'PlayFiver/Dreamtech/bacteria.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bacteria'),
(641, 13, 'Baseball Frenzy', 'baseball', 'slot', 'PlayFiver/Dreamtech/baseball.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-29 18:50:03', 'baseball'),
(642, 13, 'Mystical Stones', 'mysticalstones', 'slot', 'PlayFiver/Dreamtech/mysticalstones.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'mysticalstones'),
(643, 13, 'Sin City', 'sincity', 'slot', 'PlayFiver/Dreamtech/sincity.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:45:36', 'sincity'),
(644, 13, 'Secrets of The Pentagram', 'wheel', 'slot', 'PlayFiver/Dreamtech/wheel.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wheel'),
(645, 13, 'West Wild', 'westwild', 'slot', 'PlayFiver/Dreamtech/westwild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'westwild'),
(646, 13, 'Witch Winnings', 'halloween', 'slot', 'PlayFiver/Dreamtech/halloween.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:43:46', 'halloween'),
(647, 13, 'Blood Wolf legend', 'bloodmoon', 'slot', 'PlayFiver/Dreamtech/bloodmoon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-29 18:56:26', 'bloodmoon'),
(648, 13, 'Heroes of the East', 'dragonball2', 'slot', 'PlayFiver/Dreamtech/dragonball2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'dragonball2'),
(649, 13, 'Muaythai', 'muaythai', 'slot', 'PlayFiver/Dreamtech/muaythai.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'muaythai'),
(650, 13, 'Sailor Princess', 'sailor', 'slot', 'PlayFiver/Dreamtech/sailor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'sailor'),
(651, 13, 'Infinity Club', 'nightclub', 'slot', 'PlayFiver/Dreamtech/nightclub.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nightclub'),
(652, 13, 'Nezha Legend', 'nezha', 'slot', 'PlayFiver/Dreamtech/nezha.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nezha'),
(653, 13, 'Bird Island', 'bird', 'slot', 'PlayFiver/Dreamtech/bird.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bird'),
(654, 13, 'Field Of Honor', 'honor', 'slot', 'PlayFiver/Dreamtech/honor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'honor'),
(655, 13, 'Treasure Hunt Trip 2', 'train2', 'slot', 'PlayFiver/Dreamtech/train2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'train2'),
(656, 13, 'ShiningStars', 'shiningstars', 'slot', 'PlayFiver/Dreamtech/shiningstars.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'shiningstars'),
(657, 13, 'Cai Shen Dao Plus', 'tgow2plus', 'slot', 'PlayFiver/Dreamtech/tgow2plus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'tgow2plus'),
(658, 13, 'Peeping', 'peeping', 'slot', 'PlayFiver/Dreamtech/peeping.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'peeping'),
(659, 17, 'Ultra Burn', 'vs5ultrab', 'slot', 'PlayFiver/Reelkingdom/vs5ultrab.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5ultrab'),
(660, 17, 'Ultra Hold and Spin', 'vs5ultra', 'slot', 'PlayFiver/Reelkingdom/vs5ultra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5ultra'),
(661, 17, 'Return of the Dead', 'vs10returndead', 'slot', 'PlayFiver/Reelkingdom/vs10returndead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10returndead'),
(662, 17, 'Big Bass Bonanza', 'vs10bbbonanza', 'slot', 'PlayFiver/Reelkingdom/vs10bbbonanza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bbbonanza'),
(663, 17, 'Hot to Burn Hold and Spin', 'vs20hburnhs', 'slot', 'PlayFiver/Reelkingdom/vs20hburnhs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20hburnhs'),
(664, 17, 'Lucky Lightning', 'vswayslight', 'slot', 'PlayFiver/Reelkingdom/vswayslight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-03 18:29:53', 'vswayslight'),
(665, 17, 'Bigger Bass Bonanza', 'vs12bbb', 'slot', 'PlayFiver/Reelkingdom/vs12bbb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-18 22:44:05', 'vs12bbb'),
(666, 17, 'Floating Dragon', 'vs10floatdrg', 'slot', 'PlayFiver/Reelkingdom/vs10floatdrg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-03 18:17:19', 'vs10floatdrg'),
(667, 17, 'Temujin Treasures', 'vs1024temuj', 'slot', 'PlayFiver/Reelkingdom/vs1024temuj.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-03 18:17:23', 'vs1024temuj'),
(668, 17, 'Christmas Big Bass Bonanza', 'vs10bxmasbnza', 'slot', 'PlayFiver/Reelkingdom/vs10bxmasbnza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bxmasbnza'),
(669, 17, 'Big Bass Bonanza Megaways(tm)', 'vswaysbbb', 'slot', 'PlayFiver/Reelkingdom/vswaysbbb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysbbb'),
(670, 17, 'Big Juan', 'vs40bigjuan', 'slot', 'PlayFiver/Reelkingdom/vs40bigjuan.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:33:43', 'vs40bigjuan'),
(671, 17, 'Star Pirates Code', 'vs10starpirate', 'slot', 'PlayFiver/Reelkingdom/vs10starpirate.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-18 19:02:39', 'vs10starpirate'),
(672, 17, 'Hot to burn', 'vs5hotburn', 'slot', 'PlayFiver/Reelkingdom/vs5hotburn.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5hotburn'),
(673, 17, 'Book of Kingdoms', 'vs25bkofkngdm', 'slot', 'PlayFiver/Reelkingdom/vs25bkofkngdm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25bkofkngdm'),
(674, 17, 'Eye of the Storm', 'vs10eyestorm', 'slot', 'PlayFiver/Reelkingdom/vs10eyestorm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-18 19:23:19', 'vs10eyestorm'),
(675, 17, 'The Amazing Money Machine', 'vs10amm', 'slot', 'PlayFiver/Reelkingdom/vs10amm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10amm'),
(676, 17, 'Lucky Grace And Charm', 'vs10luckcharm', 'slot', 'PlayFiver/Reelkingdom/vs10luckcharm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10luckcharm'),
(677, 17, 'Gold Party(r)', 'vs25goldparty', 'slot', 'PlayFiver/Reelkingdom/vs25goldparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-27 19:34:39', 'vs25goldparty'),
(678, 17, 'Rock Vegas Mega Hold e Spin', 'vs20rockvegas', 'slot', 'PlayFiver/Reelkingdom/vs20rockvegas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20rockvegas'),
(679, 17, 'Tic Tac Take', 'vs10tictac', 'slot', 'PlayFiver/Reelkingdom/vs10tictac.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-18 16:40:59', 'vs10tictac'),
(680, 17, 'Queenie', 'vs243queenie', 'slot', 'PlayFiver/Reelkingdom/vs243queenie.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243queenie'),
(681, 17, 'Spirit of Adventure', 'vs10spiritadv', 'slot', 'PlayFiver/Reelkingdom/vs10spiritadv.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10spiritadv'),
(682, 17, 'Little Gem Hold and Spin', 'vs5littlegem', 'slot', 'PlayFiver/Reelkingdom/vs5littlegem.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5littlegem'),
(683, 18, 'Auto-Roulette VIP', '01rb77cq1gtenhmo', 'Live', 'PlayFiver/Evolution/01rb77cq1gtenhmo.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '01rb77cq1gtenhmo'),
(684, 18, 'Speed Baccarat W', 'qgqrucipvltnvnvq', 'Live', 'PlayFiver/Evolution/qgqrucipvltnvnvq.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgqrucipvltnvnvq'),
(685, 18, 'Japanese Speed Baccarat A', 'JapSpeedBac00001', 'Live', 'PlayFiver/Evolution/JapSpeedBac00001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'JapSpeedBac00001'),
(686, 18, 'No Commission Baccarat', 'NoCommBac0000001', 'Live', 'PlayFiver/Evolution/NoCommBac0000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'NoCommBac0000001'),
(687, 18, 'Prosperity Tree Baccarat', 'PTBaccarat000001', 'Live', 'PlayFiver/Evolution/PTBaccarat000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'PTBaccarat000001'),
(688, 18, 'Korean Speed Baccarat A', 'p63cmvmwagteemoy', 'Live', 'PlayFiver/Evolution/p63cmvmwagteemoy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'p63cmvmwagteemoy'),
(689, 18, 'MONOPOLY Big Baller', 'MonBigBaller0001', 'Live', 'PlayFiver/Evolution/MonBigBaller0001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'MonBigBaller0001'),
(690, 18, 'Lightning Roulette', 'LightningTable01', 'Live', 'PlayFiver/Evolution/LightningTable01.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LightningTable01'),
(691, 18, 'Speed Baccarat D', 'ndgvz5mlhfuaad6e', 'Live', 'PlayFiver/Evolution/ndgvz5mlhfuaad6e.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ndgvz5mlhfuaad6e'),
(692, 18, 'Speed Baccarat J', 'obj64qcnqfunjelj', 'Live', 'PlayFiver/Evolution/obj64qcnqfunjelj.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'obj64qcnqfunjelj'),
(693, 18, 'Roleta Relampago', 'PorROULigh000001', 'Live', 'PlayFiver/Evolution/PorROULigh000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-29 19:58:42', 'PorROULigh000001'),
(694, 18, 'Lightning Roulette Italia', 'ovfzgqahvicqtiwu', 'Live', 'PlayFiver/Evolution/ovfzgqahvicqtiwu.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovfzgqahvicqtiwu'),
(695, 18, 'Hindi Speed Baccarat B', 'HSpeedBac0000002', 'Live', 'PlayFiver/Evolution/HSpeedBac0000002.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'HSpeedBac0000002'),
(696, 18, 'Speed Baccarat X', 'qgqrv4asvltnvuty', 'Live', 'PlayFiver/Evolution/qgqrv4asvltnvuty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgqrv4asvltnvuty'),
(697, 18, 'Ruleta en Vivo', '8clwnwrupuvf0osq', 'Live', 'PlayFiver/Evolution/8clwnwrupuvf0osq.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '8clwnwrupuvf0osq'),
(698, 18, 'Punto Banco', 'xie6wodezmfwmmcb', 'Live', 'PlayFiver/Evolution/xie6wodezmfwmmcb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'xie6wodezmfwmmcb'),
(699, 18, 'Auto-Roulette', '48z5pjps3ntvqc1b', 'Live', 'PlayFiver/Evolution/48z5pjps3ntvqc1b.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-29 19:59:07', '48z5pjps3ntvqc1b'),
(700, 18, 'Arabic Roulette', 'mkvhbciosnfqhat7', 'Live', 'PlayFiver/Evolution/mkvhbciosnfqhat7.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'mkvhbciosnfqhat7'),
(701, 18, 'Red Door Roulette', 'RedDoorRoulette1', 'Live', 'PlayFiver/Evolution/RedDoorRoulette1.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'RedDoorRoulette1'),
(702, 18, 'Korean Speed Baccarat C', 'qgdk6rtpw6hax4fe', 'Live', 'PlayFiver/Evolution/qgdk6rtpw6hax4fe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgdk6rtpw6hax4fe'),
(703, 18, 'Speed Baccarat F', 'nmwde3fd7hvqhq43', 'Live', 'PlayFiver/Evolution/nmwde3fd7hvqhq43.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nmwde3fd7hvqhq43'),
(704, 18, 'Speed Baccarat K', 'ocye2ju2bsoyq6vv', 'Live', 'PlayFiver/Evolution/ocye2ju2bsoyq6vv.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ocye2ju2bsoyq6vv'),
(705, 18, 'Emperor Sic Bo', 'EmperorSB0000001', 'Live', 'PlayFiver/Evolution/EmperorSB0000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'EmperorSB0000001'),
(706, 18, 'Crazy Time A', 'CrazyTime0000002', 'Live', 'PlayFiver/Evolution/CrazyTime0000002.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CrazyTime0000002'),
(707, 18, 'Speed Baccarat N', 'ovu5eja74ccmyoiq', 'Live', 'PlayFiver/Evolution/ovu5eja74ccmyoiq.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5eja74ccmyoiq'),
(708, 18, 'Side Bet City', 'SBCTable00000001', 'Live', 'PlayFiver/Evolution/SBCTable00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SBCTable00000001'),
(709, 18, 'Speed Baccarat G', 'nmwdzhbg7hvqh6a7', 'Live', 'PlayFiver/Evolution/nmwdzhbg7hvqh6a7.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nmwdzhbg7hvqh6a7'),
(710, 18, 'Bucharest Auto-Roulette', 'k37tle5hfceqacik', 'Live', 'PlayFiver/Evolution/k37tle5hfceqacik.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'k37tle5hfceqacik'),
(711, 18, 'Deutsches Roulette', 'qtkjorzrlqeb6hrd', 'Live', 'PlayFiver/Evolution/qtkjorzrlqeb6hrd.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qtkjorzrlqeb6hrd'),
(712, 18, 'Japanese Golden Wealth Baccarat', 'Japgwbaccarat001', 'Live', 'PlayFiver/Evolution/Japgwbaccarat001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'Japgwbaccarat001'),
(713, 18, 'Dansk Roulette', '3aidqufu9szxha2n', 'Live', 'PlayFiver/Evolution/3aidqufu9szxha2n.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '3aidqufu9szxha2n'),
(714, 18, 'American Roulette', 'AmericanTable001', 'Live', 'PlayFiver/Evolution/AmericanTable001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'AmericanTable001'),
(715, 18, 'Roleta ao Vivo', 'PorROU0000000001', 'Live', 'PlayFiver/Evolution/PorROU0000000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:42:45', 'PorROU0000000001'),
(716, 18, 'Emperor Roulette', 'pv5q45yjhasyt46y', 'Live', 'PlayFiver/Evolution/pv5q45yjhasyt46y.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pv5q45yjhasyt46y'),
(717, 18, 'Speed Baccarat E', 'ndgv45bghfuaaebf', 'Live', 'PlayFiver/Evolution/ndgv45bghfuaaebf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ndgv45bghfuaaebf'),
(718, 18, 'Japanese Speed Baccarat B', 'JapSpeedBac00002', 'Live', 'PlayFiver/Evolution/JapSpeedBac00002.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'JapSpeedBac00002'),
(719, 18, 'Immersive Roulette', '7x0b1tgh7agmf6hv', 'Live', 'PlayFiver/Evolution/7x0b1tgh7agmf6hv.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '7x0b1tgh7agmf6hv'),
(720, 18, 'Greek Lightning Roulette', 'GreekLRou0000001', 'Live', 'PlayFiver/Evolution/GreekLRou0000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GreekLRou0000001'),
(721, 18, 'No Commission Speed Baccarat C', 'ovu5h6b3ujb4y53w', 'Live', 'PlayFiver/Evolution/ovu5h6b3ujb4y53w.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5h6b3ujb4y53w'),
(722, 18, 'Speed Baccarat Z', 'qsf63ownyvbqnz33', 'Live', 'PlayFiver/Evolution/qsf63ownyvbqnz33.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qsf63ownyvbqnz33'),
(723, 18, 'Speed Baccarat C', 'ndgvwvgthfuaad3q', 'Live', 'PlayFiver/Evolution/ndgvwvgthfuaad3q.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ndgvwvgthfuaad3q'),
(724, 18, 'Thai Speed Baccarat A', 'pezjou3ltf6hvzjk', 'Live', 'PlayFiver/Evolution/pezjou3ltf6hvzjk.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pezjou3ltf6hvzjk'),
(725, 18, 'Caribbean Stud Poker', 'CSPTable00000001', 'Live', 'PlayFiver/Evolution/CSPTable00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CSPTable00000001'),
(726, 18, 'Speed Baccarat U', 'qgqrhfvsvltnueqf', 'Live', 'PlayFiver/Evolution/qgqrhfvsvltnueqf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgqrhfvsvltnueqf'),
(727, 18, 'Japanese Roulette', 'n4jwxsz2x4tqitvx', 'Live', 'PlayFiver/Evolution/n4jwxsz2x4tqitvx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'n4jwxsz2x4tqitvx'),
(728, 18, 'Auto-Roulette La Partage', 'f1f4rm9xgh4j3u2z', 'Live', 'PlayFiver/Evolution/f1f4rm9xgh4j3u2z.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'f1f4rm9xgh4j3u2z'),
(729, 18, 'MONOPOLY Live', 'Monopoly00000001', 'Live', 'PlayFiver/Evolution/Monopoly00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'Monopoly00000001'),
(730, 18, 'Greek Roulette', 'o4vjrhh5rtwimgi3', 'Live', 'PlayFiver/Evolution/o4vjrhh5rtwimgi3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'o4vjrhh5rtwimgi3'),
(731, 18, 'Emperor Dragon Tiger', 'puu47n7mic3rfd7y', 'Live', 'PlayFiver/Evolution/puu47n7mic3rfd7y.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'puu47n7mic3rfd7y'),
(732, 18, 'Speed Baccarat A', 'leqhceumaq6qfoug', 'Live', 'PlayFiver/Evolution/leqhceumaq6qfoug.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'leqhceumaq6qfoug'),
(733, 18, 'Speed Baccarat T', 'qgonc7t4ucdiel4o', 'Live', 'PlayFiver/Evolution/qgonc7t4ucdiel4o.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgonc7t4ucdiel4o'),
(734, 18, 'Football Studio Roulette', '7nyiaws9tgqrzaz3', 'Live', 'PlayFiver/Evolution/7nyiaws9tgqrzaz3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '7nyiaws9tgqrzaz3'),
(735, 18, 'Extreme Texas Hold em', 'ETHTable00000001', 'Live', 'PlayFiver/Evolution/ETHTable00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ETHTable00000001'),
(736, 18, 'Baccarat C', 'ndgvs3tqhfuaadyg', 'Live', 'PlayFiver/Evolution/ndgvs3tqhfuaadyg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ndgvs3tqhfuaadyg'),
(737, 18, 'Speed Roulette', 'lkcbrbdckjxajdol', 'Live', 'PlayFiver/Evolution/lkcbrbdckjxajdol.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'lkcbrbdckjxajdol'),
(738, 18, 'Speed Baccarat S', 'o4kymodby2fa2c7g', 'Live', 'PlayFiver/Evolution/o4kymodby2fa2c7g.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'o4kymodby2fa2c7g'),
(739, 18, 'Speed Baccarat I', 'nxpkul2hgclallno', 'Live', 'PlayFiver/Evolution/nxpkul2hgclallno.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nxpkul2hgclallno'),
(740, 18, 'Crazy Time', 'CrazyTime0000001', 'Live', 'PlayFiver/Evolution/CrazyTime0000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'CrazyTime0000001'),
(741, 18, 'Roulette', 'vctlz20yfnmp1ylr', 'Live', 'PlayFiver/Evolution/vctlz20yfnmp1ylr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vctlz20yfnmp1ylr'),
(742, 18, 'Baccarat Squeeze', 'zixzea8nrf1675oh', 'Live', 'PlayFiver/Evolution/zixzea8nrf1675oh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'zixzea8nrf1675oh'),
(743, 18, 'Triple Card Poker', 'TRPTable00000001', 'Live', 'PlayFiver/Evolution/TRPTable00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TRPTable00000001'),
(744, 18, 'Teen Patti', 'teenpattitable01', 'Live', 'PlayFiver/Evolution/teenpattitable01.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'teenpattitable01'),
(745, 18, 'Peek Baccarat', 'peekbaccarat0001', 'Live', 'PlayFiver/Evolution/peekbaccarat0001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'peekbaccarat0001'),
(746, 18, 'Speed Baccarat Q', 'o4kyj7tgpwqqy4m4', 'Live', 'PlayFiver/Evolution/o4kyj7tgpwqqy4m4.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'o4kyj7tgpwqqy4m4'),
(747, 18, 'Funky Time', 'FunkyTime0000001', 'Live', 'PlayFiver/Evolution/FunkyTime0000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FunkyTime0000001'),
(748, 18, 'XXXtreme Lightning Roulette', 'XxxtremeLigh0001', 'Live', 'PlayFiver/Evolution/XxxtremeLigh0001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'XxxtremeLigh0001'),
(749, 18, 'Super Andar Bahar', 'AndarBahar000001', 'Live', 'PlayFiver/Evolution/AndarBahar000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'AndarBahar000001'),
(750, 18, 'Speed Baccarat R', 'o4kylkahpwqqy57w', 'Live', 'PlayFiver/Evolution/o4kylkahpwqqy57w.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'o4kylkahpwqqy57w'),
(751, 18, 'Baccarat B', '60i0lcfx5wkkv3sy', 'Live', 'PlayFiver/Evolution/60i0lcfx5wkkv3sy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '60i0lcfx5wkkv3sy'),
(752, 18, 'Bac Bo Ao Vivo', 'PorBacBo00000001', 'Live', 'PlayFiver/Evolution/PorBacBo00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-04 15:30:40', 'PorBacBo00000001'),
(753, 18, 'No Commission Speed Baccarat B', 'ocye5hmxbsoyrcii', 'Live', 'PlayFiver/Evolution/ocye5hmxbsoyrcii.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ocye5hmxbsoyrcii'),
(754, 18, 'Texas Hold em Bonus Poker', 'THBTable00000001', 'Live', 'PlayFiver/Evolution/THBTable00000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'THBTable00000001'),
(755, 18, 'Bonsai Speed Baccarat B', 'BonsaiBacc000002', 'Live', 'PlayFiver/Evolution/BonsaiBacc000002.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BonsaiBacc000002'),
(756, 18, 'Double Ball Roulette', 'DoubleBallRou001', 'Live', 'PlayFiver/Evolution/DoubleBallRou001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'DoubleBallRou001'),
(757, 18, 'Speed Baccarat B', 'lv2kzclunt2qnxo5', 'Live', 'PlayFiver/Evolution/lv2kzclunt2qnxo5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'lv2kzclunt2qnxo5'),
(758, 18, 'Casino Hold em', 'HoldemTable00001', 'Live', 'PlayFiver/Evolution/HoldemTable00001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'HoldemTable00001'),
(759, 18, 'Speed Baccarat 2', 'qsf7alptyvbqohva', 'Live', 'PlayFiver/Evolution/qsf7alptyvbqohva.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qsf7alptyvbqohva'),
(760, 18, 'Lotus Roulette', 'pv2zgy42anvdwk3l', 'Live', 'PlayFiver/Evolution/pv2zgy42anvdwk3l.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pv2zgy42anvdwk3l'),
(761, 18, 'Speed Baccarat L', 'ovu5cwp54ccmymck', 'Live', 'PlayFiver/Evolution/ovu5cwp54ccmymck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5cwp54ccmymck'),
(762, 18, 'Fan Tan', 'FanTan0000000001', 'Live', 'PlayFiver/Evolution/FanTan0000000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'FanTan0000000001'),
(763, 18, 'Bonsai Speed Baccarat C', 'BonsaiBacc000003', 'Live', 'PlayFiver/Evolution/BonsaiBacc000003.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BonsaiBacc000003'),
(764, 18, 'Speed Baccarat 7', 'rep5ca4ynyjl7wdw', 'Live', 'PlayFiver/Evolution/rep5ca4ynyjl7wdw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'rep5ca4ynyjl7wdw'),
(765, 18, 'Speed Baccarat M', 'ovu5dsly4ccmynil', 'Live', 'PlayFiver/Evolution/ovu5dsly4ccmynil.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5dsly4ccmynil'),
(766, 18, 'Lightning Baccarat', 'LightningBac0001', 'Live', 'PlayFiver/Evolution/LightningBac0001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LightningBac0001'),
(767, 18, 'Baccarat A', 'oytmvb9m1zysmc44', 'Live', 'PlayFiver/Evolution/oytmvb9m1zysmc44.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'oytmvb9m1zysmc44'),
(768, 18, 'Stock Market', 'StockMarket00001', 'Live', 'PlayFiver/Evolution/StockMarket00001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'StockMarket00001'),
(769, 18, 'Futebol Studio Ao Vivo', 'TopCard000000004', 'Live', 'PlayFiver/Evolution/TopCard000000004.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-30 16:07:56', 'TopCard000000004'),
(770, 18, 'Speed Baccarat 3', 'qsf7bpfvyvbqolwp', 'Live', 'PlayFiver/Evolution/qsf7bpfvyvbqolwp.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qsf7bpfvyvbqolwp'),
(771, 18, 'Football Studio Dice', 'TopDice000000001', 'Live', 'PlayFiver/Evolution/TopDice000000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'TopDice000000001'),
(772, 18, 'Baccarat Control Squeeze', 'k2oswnib7jjaaznw', 'Live', 'PlayFiver/Evolution/k2oswnib7jjaaznw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'k2oswnib7jjaaznw'),
(773, 18, 'Speed Baccarat 1', 'qsf65xtoyvbqoaop', 'Live', 'PlayFiver/Evolution/qsf65xtoyvbqoaop.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qsf65xtoyvbqoaop'),
(774, 18, 'Speed Baccarat P', 'ovu5fzje4ccmyqnr', 'Live', 'PlayFiver/Evolution/ovu5fzje4ccmyqnr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5fzje4ccmyqnr'),
(775, 18, 'Speed Baccarat V', 'qgqrrnuqvltnvejx', 'Live', 'PlayFiver/Evolution/qgqrrnuqvltnvejx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'qgqrrnuqvltnvejx'),
(776, 18, 'Imperial Quest', 'ImperialQuest001', 'Live', 'PlayFiver/Evolution/ImperialQuest001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ImperialQuest001'),
(777, 18, 'VIP Roulette', 'wzg6kdkad1oe7m5k', 'Live', 'PlayFiver/Evolution/wzg6kdkad1oe7m5k.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'wzg6kdkad1oe7m5k'),
(778, 18, 'Football Studio', 'TopCard000000001', 'Live', 'PlayFiver/Evolution/TopCard000000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-06-04 15:34:22', 'TopCard000000001'),
(779, 18, 'Super Sic Bo', 'SuperSicBo000001', 'Live', 'PlayFiver/Evolution/SuperSicBo000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SuperSicBo000001'),
(780, 18, 'Speed Baccarat O', 'ovu5fbxm4ccmypmb', 'Live', 'PlayFiver/Evolution/ovu5fbxm4ccmypmb.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ovu5fbxm4ccmypmb'),
(781, 18, 'Speed Baccarat H', 'nxpj4wumgclak2lx', 'Live', 'PlayFiver/Evolution/nxpj4wumgclak2lx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'nxpj4wumgclak2lx'),
(782, 18, 'Gold Vault Roulette', 'GoldVaultRo00001', 'Live', 'PlayFiver/Evolution/GoldVaultRo00001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'GoldVaultRo00001');
INSERT INTO `games` (`id`, `provider_id`, `game_name`, `game_id`, `game_type`, `cover`, `status`, `technology`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `game_code`) VALUES
(783, 18, 'XXXtreme Lightning Baccarat', 'XXXtremeLB000001', 'Live', 'PlayFiver/Evolution/XXXtremeLB000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'XXXtremeLB000001'),
(784, 18, 'Speed Auto Roulette', 'SpeedAutoRo00001', 'Live', 'PlayFiver/Evolution/SpeedAutoRo00001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'SpeedAutoRo00001'),
(785, 18, 'Bac Bo', 'BacBo00000000001', 'Live', 'PlayFiver/Evolution/BacBo00000000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BacBo00000000001'),
(786, 18, 'Bonsai Speed Baccarat A', 'BonsaiBacc000001', 'Live', 'PlayFiver/Evolution/BonsaiBacc000001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'BonsaiBacc000001'),
(787, 18, 'Lightning Dice', 'LightningDice001', 'Live', 'PlayFiver/Evolution/LightningDice001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-29 19:57:51', 'LightningDice001'),
(788, 18, 'Ruleta Relampago en Vivo', 'LightningSpain01', 'Live', 'PlayFiver/Evolution/LightningSpain01.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'LightningSpain01'),
(789, 2, 'Wild Wild Bananas', 'vswayswwhex', 'Pragmatic', 'PlayFiver/Pragmatic/vswayswwhex.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayswwhex'),
(790, 2, 'Secret City Gold', 'vs25spgldways', 'Pragmatic', 'PlayFiver/Pragmatic/vs25spgldways.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25spgldways'),
(791, 2, 'Gold Oasis', 'vswaysincwnd', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysincwnd.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysincwnd'),
(792, 2, 'Frozen Tropics', 'vswaysftropics', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysftropics.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysftropics'),
(793, 2, 'Monster Superlanche', 'vs20superlanche', 'Pragmatic', 'PlayFiver/Pragmatic/vs20superlanche.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20superlanche'),
(794, 2, 'Fish Eye', 'vs10fisheye', 'Pragmatic', 'PlayFiver/Pragmatic/vs10fisheye.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10fisheye'),
(795, 2, 'Mochimon', 'vs20mochimon', 'Pragmatic', 'PlayFiver/Pragmatic/vs20mochimon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20mochimon'),
(796, 2, 'Gatot Kaca s Fury', 'vs20gatotfury', 'Pragmatic', 'PlayFiver/Pragmatic/vs20gatotfury.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20gatotfury'),
(797, 2, 'Fire Archer', 'vs25archer', 'Pragmatic', 'PlayFiver/Pragmatic/vs25archer.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25archer'),
(798, 2, 'Club Tropicana', 'vs12tropicana', 'Pragmatic', 'PlayFiver/Pragmatic/vs12tropicana.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs12tropicana'),
(799, 2, 'Peak Power', 'vs10powerlines', 'Pragmatic', 'PlayFiver/Pragmatic/vs10powerlines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10powerlines'),
(800, 2, 'Mystery of the Orient', 'vswaysmorient', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysmorient.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysmorient'),
(801, 2, 'Rabbit Garden', 'vs20goldclust', 'Pragmatic', 'PlayFiver/Pragmatic/vs20goldclust.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20goldclust'),
(802, 2, 'The Knight King', 'vs20sknights', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sknights.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sknights'),
(803, 2, 'Fruits of the Amazon', 'vs20framazon', 'Pragmatic', 'PlayFiver/Pragmatic/vs20framazon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20framazon'),
(804, 2, 'The Red Queen', 'vswaysredqueen', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysredqueen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysredqueen'),
(805, 2, 'Moonshot', 'vs1024moonsh', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024moonsh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024moonsh'),
(806, 2, 'Big Bass - Hold e Spinner', 'vs10bbhas', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bbhas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bbhas'),
(807, 2, 'African Elephant', 'vs20hotzone', 'Pragmatic', 'PlayFiver/Pragmatic/vs20hotzone.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20hotzone'),
(808, 2, '3 Dancing Monkeys', 'vswaysmonkey', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysmonkey.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysmonkey'),
(809, 2, 'Wild Celebrity Bus Megaways', 'vswaysrsm', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysrsm.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysrsm'),
(810, 2, 'Gods of Giza', 'vs10gizagods', 'Pragmatic', 'PlayFiver/Pragmatic/vs10gizagods.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10gizagods'),
(811, 2, 'Cowboy Coins', 'vswaysultrcoin', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysultrcoin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysultrcoin'),
(812, 2, 'Kingdom of the Dead', 'vs10kingofdth', 'Pragmatic', 'PlayFiver/Pragmatic/vs10kingofdth.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10kingofdth'),
(813, 2, 'Jasmine Dreams', 'vs20mvwild', 'Pragmatic', 'PlayFiver/Pragmatic/vs20mvwild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20mvwild'),
(814, 2, 'Holiday Ride', 'vs25holiday', 'Pragmatic', 'PlayFiver/Pragmatic/vs25holiday.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25holiday'),
(815, 2, 'Wild Bison Charge', 'vs20stickywild', 'Pragmatic', 'PlayFiver/Pragmatic/vs20stickywild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20stickywild'),
(816, 2, 'Excalibur Unleashed', 'vs20excalibur', 'Pragmatic', 'PlayFiver/Pragmatic/vs20excalibur.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20excalibur'),
(817, 2, 'Knight Hot Spotz', 'vs25spotz', 'Pragmatic', 'PlayFiver/Pragmatic/vs25spotz.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25spotz'),
(818, 2, 'Sticky Bees', 'vs20clustwild', 'Pragmatic', 'PlayFiver/Pragmatic/vs20clustwild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20clustwild'),
(819, 2, 'Floating Dragon - Dragon Boat Festival', 'vs10fdrasbf', 'Pragmatic', 'PlayFiver/Pragmatic/vs10fdrasbf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10fdrasbf'),
(820, 2, 'Robber Strike', 'vs4096robber', 'Pragmatic', 'PlayFiver/Pragmatic/vs4096robber.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs4096robber'),
(821, 2, 'Lamp Of Infinity', 'vs20lampinf', 'Pragmatic', 'PlayFiver/Pragmatic/vs20lampinf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20lampinf'),
(822, 2, 'Frogs e Bugs', 'vswaysfrbugs', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysfrbugs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysfrbugs'),
(823, 2, 'Pirates Pub', 'vs9outlaw', 'Pragmatic', 'PlayFiver/Pragmatic/vs9outlaw.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs9outlaw'),
(824, 2, 'Jewel Rush', 'vs20jewelparty', 'Pragmatic', 'PlayFiver/Pragmatic/vs20jewelparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20jewelparty'),
(825, 2, 'Fat Panda', 'vs20beefed', 'Pragmatic', 'PlayFiver/Pragmatic/vs20beefed.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20beefed'),
(826, 2, 'Heist for the Golden Nuggets', 'vs20hstgldngt', 'Pragmatic', 'PlayFiver/Pragmatic/vs20hstgldngt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20hstgldngt'),
(827, 2, 'Joker Race', 'vs25jokrace', 'Pragmatic', 'PlayFiver/Pragmatic/vs25jokrace.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs25jokrace'),
(828, 2, 'Hellvis Wild', 'vs243nudge4gold', 'Pragmatic', 'PlayFiver/Pragmatic/vs243nudge4gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs243nudge4gold'),
(829, 2, 'Sky Bounty', 'vs50jucier', 'Pragmatic', 'PlayFiver/Pragmatic/vs50jucier.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50jucier'),
(830, 2, 'Cash Box', 'vs20cashmachine', 'Pragmatic', 'PlayFiver/Pragmatic/vs20cashmachine.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20cashmachine'),
(831, 2, 'Spellbinding Mystery', 'vs20splmystery', 'Pragmatic', 'PlayFiver/Pragmatic/vs20splmystery.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20splmystery'),
(832, 2, 'The Dog House Multihold', 'vs20doghousemh', 'Pragmatic', 'PlayFiver/Pragmatic/vs20doghousemh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20doghousemh'),
(833, 2, '3 Buzzing Wilds', 'vs20wildparty', 'Pragmatic', 'PlayFiver/Pragmatic/vs20wildparty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20wildparty'),
(834, 2, 'Lobster Bob s Crazy Crab Shack', 'vs20lobcrab', 'Pragmatic', 'PlayFiver/Pragmatic/vs20lobcrab.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20lobcrab'),
(835, 2, 'Supermania', 'vs20supermania', 'Pragmatic', 'PlayFiver/Pragmatic/vs20supermania.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20supermania'),
(836, 2, 'Mustang Trail', 'vs10trail', 'Pragmatic', 'PlayFiver/Pragmatic/vs10trail.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10trail'),
(837, 2, 'Pub Kings', 'vs20lvlup', 'Pragmatic', 'PlayFiver/Pragmatic/vs20lvlup.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20lvlup'),
(838, 2, 'Saiyan Mania', 'vs20saiman', 'Pragmatic', 'PlayFiver/Pragmatic/vs20saiman.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20saiman'),
(839, 2, 'Cyclops Smash', 'vs20earthquake', 'Pragmatic', 'PlayFiver/Pragmatic/vs20earthquake.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20earthquake'),
(840, 2, 'Big Bass Hold e Spinner Megaways', 'vswaysbbhas', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysbbhas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysbbhas'),
(841, 2, 'Forge of Olympus', 'vs20forge', 'Pragmatic', 'PlayFiver/Pragmatic/vs20forge.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20forge'),
(842, 2, 'Wisdom of Athena', 'vs20procount', 'Pragmatic', 'PlayFiver/Pragmatic/vs20procount.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20procount'),
(843, 2, 'Mahjong Wins', 'vs1024mahjwins', 'Pragmatic', 'PlayFiver/Pragmatic/vs1024mahjwins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs1024mahjwins'),
(844, 2, 'Cash Chips', 'vs20maskgame', 'Pragmatic', 'PlayFiver/Pragmatic/vs20maskgame.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20maskgame'),
(845, 2, 'Tundra s Fortune', 'vswaysraghex', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysraghex.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysraghex'),
(846, 2, 'Big Bass Halloween', 'vs10bhallbnza', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bhallbnza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bhallbnza'),
(847, 2, 'Rainbow Reels', 'vs40rainbowr', 'Pragmatic', 'PlayFiver/Pragmatic/vs40rainbowr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40rainbowr'),
(848, 2, 'Gravity Bonanza', 'vs20gravity', 'Pragmatic', 'PlayFiver/Pragmatic/vs20gravity.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20gravity'),
(849, 2, 'Infective Wild', 'vs40infwild', 'Pragmatic', 'PlayFiver/Pragmatic/vs40infwild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40infwild'),
(850, 2, 'Sword of Ares', 'vs20swordofares', 'Pragmatic', 'PlayFiver/Pragmatic/vs20swordofares.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20swordofares'),
(851, 2, 'Spin e Score Megaways', 'vswaysfrywld', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysfrywld.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysfrywld'),
(852, 2, 'Sweet PowerNudge(tm)', 'vswaysconcoll', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysconcoll.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysconcoll'),
(853, 2, 'Gems of Serengeti(tm)', 'vs20lcount', 'Pragmatic', 'PlayFiver/Pragmatic/vs20lcount.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20lcount'),
(854, 2, 'Shield of Sparta', 'vs20sparta', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sparta.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sparta'),
(855, 2, 'Big Bass Bonanza Keeping it Reel', 'vs10bbkir', 'Pragmatic', 'PlayFiver/Pragmatic/vs10bbkir.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10bbkir'),
(856, 2, 'Pizza Pizza Pizza', 'vswayspizza', 'Pragmatic', 'PlayFiver/Pragmatic/vswayspizza.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswayspizza'),
(857, 2, 'Hot Pepper(tm)', 'vs20dugems', 'Pragmatic', 'PlayFiver/Pragmatic/vs20dugems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20dugems'),
(858, 2, 'Sweet PowerNudge', 'vs20clspwrndg', 'Pragmatic', 'PlayFiver/Pragmatic/vs20clspwrndg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20clspwrndg'),
(859, 2, 'Fury of Odin Megaways(tm)', 'vswaysfuryodin', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysfuryodin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysfuryodin'),
(860, 2, 'Viking Forge', 'vs20sugarcoins', 'Pragmatic', 'PlayFiver/Pragmatic/vs20sugarcoins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20sugarcoins'),
(861, 2, 'Grace of Ebisu', 'vs20olympgrace', 'Pragmatic', 'PlayFiver/Pragmatic/vs20olympgrace.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20olympgrace'),
(862, 2, 'Starlight Princess 1000', 'vs20starlightx', 'Pragmatic', 'PlayFiver/Pragmatic/vs20starlightx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20starlightx'),
(863, 2, 'The Money Men Megaways', 'vswaysmoneyman', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysmoneyman.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysmoneyman'),
(864, 2, 'Demon Pots', 'vs40demonpots', 'Pragmatic', 'PlayFiver/Pragmatic/vs40demonpots.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs40demonpots'),
(865, 2, 'John Hunter and the Book of Tut Megaways', 'vswaystut', 'Pragmatic', 'PlayFiver/Pragmatic/vswaystut.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaystut'),
(866, 2, '8 Golden Dragon Challenge', 'vs10gdchalleng', 'Pragmatic', 'PlayFiver/Pragmatic/vs10gdchalleng.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs10gdchalleng'),
(867, 2, 'Yi Sun Shin', 'vs20yisunshin', 'Pragmatic', 'PlayFiver/Pragmatic/vs20yisunshin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20yisunshin'),
(868, 2, 'Candy Blitz', 'vs20candyblitz', 'Pragmatic', 'PlayFiver/Pragmatic/vs20candyblitz.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20candyblitz'),
(869, 2, 'Fortunes of Aztec', 'vswaysstrlght', 'Pragmatic', 'PlayFiver/Pragmatic/vswaysstrlght.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vswaysstrlght'),
(870, 4, 'Mines', '12591', 'slot', 'PlayFiver/Galaxsys/Mines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:05:55', '12591'),
(871, 4, 'Atlantis', '12547', 'slot', 'PlayFiver/Galaxsys/Atlantis.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12547'),
(872, 4, 'Bingo Star', '12545', 'slot', 'PlayFiver/Galaxsys/Bingo-Star.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12545'),
(873, 4, 'Maestro', '12543', 'slot', 'PlayFiver/Galaxsys/Maestro.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12543'),
(874, 4, 'Turbo Mines', '12541', 'slot', 'PlayFiver/Galaxsys/Turbo-Mines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:06:03', '12541'),
(875, 4, 'Totem', '12539', 'slot', 'PlayFiver/Galaxsys/Totem.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12539'),
(876, 4, 'Magic Dice', '12538', 'slot', 'PlayFiver/Galaxsys/Magic-Dice.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12538'),
(877, 4, 'Scratch Map', '12535', 'slot', 'PlayFiver/Galaxsys/Scratch-Map.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12535'),
(878, 4, 'Coin Flip', '12534', 'slot', 'PlayFiver/Galaxsys/Coin-Flip.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:06:50', '12534'),
(879, 4, 'Roulette X', '12531', 'slot', 'PlayFiver/Galaxsys/Roulette-X.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:06:11', '12531'),
(880, 4, 'Plinkoman', '12529', 'slot', 'PlayFiver/Galaxsys/Plinkoman.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12529'),
(881, 4, 'Ninja Crash', '12527', 'slot', 'PlayFiver/Galaxsys/Ninja-Crash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:06:13', '12527'),
(882, 4, 'Mr.Thimble', '12525', 'slot', 'PlayFiver/Galaxsys/Mr.Thimble.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12525'),
(883, 4, 'Jungle Wheel', '12523', 'slot', 'PlayFiver/Galaxsys/Jungle-Wheel.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12523'),
(884, 4, 'Jungle Wheel', '12522', 'slot', 'PlayFiver/Galaxsys/Jungle-Wheel.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12522'),
(885, 4, 'GoldenRA', '12521', 'slot', 'PlayFiver/Galaxsys/GoldenRA.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12521'),
(886, 4, 'F Mines', '12519', 'slot', 'PlayFiver/Galaxsys/F-Mines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12519'),
(887, 4, 'Crasher', '12517', 'slot', 'PlayFiver/Galaxsys/Crasher.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12517'),
(888, 4, 'Cash Show', '12515', 'slot', 'PlayFiver/Galaxsys/Cash-Show.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12515'),
(889, 4, 'SicBo', '12514', 'slot', 'PlayFiver/Galaxsys/SicBo.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:05:55', '12514'),
(890, 4, 'Rocketon', '12513', 'slot', 'PlayFiver/Galaxsys/Rocketon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:06:25', '12513'),
(891, 4, 'Penalty', '12512', 'slot', 'PlayFiver/Galaxsys/Penalty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12512'),
(892, 4, 'Keno Express', '12511', 'slot', 'PlayFiver/Galaxsys/Keno-Express.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12511'),
(893, 4, 'Keno 8 (2 Minute)', '12510', 'slot', 'PlayFiver/Galaxsys/Keno-8-(2-Minute).png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12510'),
(894, 4, 'Keno 8 (1 Minute)', '12509', 'slot', 'PlayFiver/Galaxsys/Keno-8-(1-Minute).png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:52', '12509'),
(895, 4, 'Keno 10 (2 Minute)', '12508', 'slot', 'PlayFiver/Galaxsys/Keno-10-(2-Minute).png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '12508'),
(896, 4, 'Keno 10 (1 Minute)', '12507', 'slot', 'PlayFiver/Galaxsys/Keno-10-(1-Minute).png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '12507'),
(897, 4, 'Hilo', '12506', 'slot', 'PlayFiver/Galaxsys/Hilo.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:05:53', '12506'),
(898, 4, 'Crash', '12505', 'slot', 'PlayFiver/Galaxsys/Crash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:07:37', '12505'),
(899, 4, 'BlackJack', '12504', 'slot', 'PlayFiver/Galaxsys/BlackJack.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '12504'),
(900, 5, 'Power Stars', '30', 'slot', 'PlayFiver/Novomatic/Power-Stars.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-06 19:52:55', '30'),
(901, 5, 'Queen of Hearts Deluxe', '3218', 'slot', 'PlayFiver/Novomatic/Queen-of-Hearts-Deluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-23 20:49:57', '3218'),
(902, 5, 'Quest for Gold', '103', 'slot', 'PlayFiver/Novomatic/Quest-for-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '103'),
(903, 5, 'Ramses II', '102', 'slot', 'PlayFiver/Novomatic/Ramses-II.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:22:08', '102'),
(904, 5, 'Red Lady', '374', 'slot', 'PlayFiver/Novomatic/Red-Lady.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '374'),
(905, 5, 'Reel King', '114', 'slot', 'PlayFiver/Novomatic/Reel-King.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-20 21:49:19', '114'),
(906, 5, 'Rex', '107', 'slot', 'PlayFiver/Novomatic/Rex.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '107'),
(907, 5, 'River Queen', '4571', 'slot', 'PlayFiver/Novomatic/River-Queen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4571'),
(908, 5, 'Roaring Forties', '3210', 'slot', 'PlayFiver/Novomatic/Roaring-Forties.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:42:04', '3210'),
(909, 5, 'Roaring Wilds', '3211', 'slot', 'PlayFiver/Novomatic/Roaring-Wilds.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '3211'),
(910, 5, 'Royal Dynasty', '6657', 'slot', 'PlayFiver/Novomatic/Royal-Dynasty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6657'),
(911, 5, 'Royal Treasure', '475', 'slot', 'PlayFiver/Novomatic/Royal-Treasure.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-09 01:11:20', '475'),
(912, 5, 'Secret Elixir', '95', 'slot', 'PlayFiver/Novomatic/Secret-Elixir.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '95'),
(913, 5, 'Secret Treasure', '6878', 'slot', 'PlayFiver/Novomatic/Secret-Treasure.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6878'),
(914, 5, 'Sizzling 6', '3149', 'slot', 'PlayFiver/Novomatic/Sizzling-6.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '3149'),
(915, 5, 'Supra Hot', '3158', 'slot', 'PlayFiver/Novomatic/Supra-Hot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '3158'),
(916, 5, 'The Money Game', '547', 'slot', 'PlayFiver/Novomatic/The-Money-Game.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 19:57:20', '547'),
(917, 5, 'Totally Wild', '6872', 'slot', 'PlayFiver/Novomatic/Totally-Wild.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-23 20:49:18', '6872'),
(918, 5, 'Ultra Hot Deluxe', '6990', 'slot', 'PlayFiver/Novomatic/Ultra-Hot-Deluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-18 13:13:17', '6990'),
(919, 5, 'Unicorn Magic', '549', 'slot', 'PlayFiver/Novomatic/Unicorn-Magic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '549'),
(920, 5, 'Wild Country', '4628', 'slot', 'PlayFiver/Novomatic/Wild-Country.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-23 20:46:50', '4628'),
(921, 5, 'Xtra Hot', '90', 'slot', 'PlayFiver/Novomatic/Xtra-Hot.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '90'),
(922, 6, 'Silver Fang', '3204', 'slot', 'PlayFiver/Microgaming/Silver-Fang.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:14:42', '3204'),
(923, 6, 'Thunder Struck', '3203', 'slot', 'PlayFiver/Microgaming/Thunder-Struck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '3203'),
(924, 6, 'Immortal Romance', '3202', 'slot', 'PlayFiver/Microgaming/Immortal-Romance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-23 03:47:39', '3202'),
(925, 6, 'Game Of Thrones', '3201', 'slot', 'PlayFiver/Microgaming/Game-Of-Thrones.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '3201'),
(926, 6, 'Burning Desire', '4210', 'slot', 'PlayFiver/Microgaming/Burning-Desire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:17:11', '4210'),
(927, 6, 'Alaskan Fishing', '4209', 'slot', 'PlayFiver/Microgaming/Alaskan-Fishing.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:17:14', '4209'),
(928, 6, 'Agent Jane Blonde', '4208', 'slot', 'PlayFiver/Microgaming/Agent-Jane-Blonde.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4208'),
(929, 6, 'Tomb Raider', '4191', 'slot', 'PlayFiver/Microgaming/Tomb-Raider.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:14:44', '4191'),
(930, 6, 'Deck the Halls', '4190', 'slot', 'PlayFiver/Microgaming/Deck-the-Halls.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4190'),
(931, 6, 'Six Acrobats', '4240', 'slot', 'PlayFiver/Microgaming/Six-Acrobats.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4240'),
(932, 6, 'Beautiful Bones', '4239', 'slot', 'PlayFiver/Microgaming/Beautiful-Bones.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:17:15', '4239'),
(933, 6, 'Monster Wheels', '4218', 'slot', 'PlayFiver/Microgaming/Monster-Wheels.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-23 22:40:13', '4218'),
(934, 6, 'Mermaids Millions', '4260', 'slot', 'PlayFiver/Microgaming/Mermaids-Millions.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:14:42', '4260'),
(935, 6, 'King Tusk', '4264', 'slot', 'PlayFiver/Microgaming/King-Tusk.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4264'),
(936, 6, 'Secret Romance', '4263', 'slot', 'PlayFiver/Microgaming/Secret-Romance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:17:19', '4263'),
(937, 6, 'High Lander', '4275', 'slot', 'PlayFiver/Microgaming/High-Lander.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '4275'),
(938, 6, 'Cool Wolf', '4273', 'slot', 'PlayFiver/Microgaming/Cool-Wolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:17:02', '4273'),
(939, 6, 'Break Away', '6712', 'slot', 'PlayFiver/Microgaming/Break-Away.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-09 01:10:02', '6712'),
(940, 6, 'Ancient Fortunes Zeus', '6905', 'slot', 'PlayFiver/Microgaming/Ancient-Fortunes-Zeus.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:16:59', '6905'),
(941, 6, 'Tarzan Jewels of Opar', '6904', 'slot', 'PlayFiver/Microgaming/Tarzan-Jewels-of-Opar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6904'),
(942, 6, 'Emperor of the Sea', '6903', 'slot', 'PlayFiver/Microgaming/Emperor-of-the-Sea.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6903'),
(943, 6, 'Age Of Conquest', '6937', 'slot', 'PlayFiver/Microgaming/Age-Of-Conquest.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6937'),
(944, 6, 'Avalon', '7000', 'slot', 'PlayFiver/Microgaming/Avalon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '7000'),
(945, 6, 'Titans of the Sun Theia', '6999', 'slot', 'PlayFiver/Microgaming/Titans-of-the-Sun-Theia.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '6999'),
(946, 6, '9 Masks of Fire', '7049', 'slot', 'PlayFiver/Microgaming/9-Masks-of-Fire.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '7049'),
(947, 6, '9 Pots of Gold', '7057', 'slot', 'PlayFiver/Microgaming/9-Pots-of-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '7057'),
(948, 6, 'Assassin Moon', '7708', 'slot', 'PlayFiver/Microgaming/Assassin-Moon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 17:07:53', '7708'),
(949, 7, 'Hot Hot Fruit', '6789', 'slot', 'PlayFiver/Habanero/Hot-Hot-Fruit.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:08:40', '6789'),
(950, 7, 'Nuwa', '6811', 'slot', 'PlayFiver/Habanero/Nuwa.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-05-06 20:08:36', '6811'),
(951, 7, 'Hot Hot Halloween', '6893', 'slot', 'PlayFiver/Habanero/Hot-Hot-Halloween.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:08:42', '6893'),
(952, 7, 'Happy Ape', '6933', 'slot', 'PlayFiver/Habanero/Happy-Ape.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:08:42', '6933'),
(953, 7, 'Panda Panda', '6932', 'slot', 'PlayFiver/Habanero/Panda-Panda.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:08:51', '6932'),
(954, 7, 'Lucky Fortune Cat', '6931', 'slot', 'PlayFiver/Habanero/Lucky-Fortune-Cat.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:08:50', '6931'),
(955, 8, 'Xmas Joker', '7820', 'slot', 'PlayFiver/Playngo/Xmas-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7820'),
(956, 8, 'Wild Blood', '7819', 'slot', 'PlayFiver/Playngo/Wild-Blood.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7819'),
(957, 8, 'Sticky Joker', '7818', 'slot', 'PlayFiver/Playngo/Sticky-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7818'),
(958, 8, 'Star Joker', '7817', 'slot', 'PlayFiver/Playngo/Star-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7817'),
(959, 8, 'Space Race', '7816', 'slot', 'PlayFiver/Playngo/Space-Race.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7816'),
(960, 8, 'Sizzling Spins', '7815', 'slot', 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7815'),
(961, 8, 'Scroll of Dead', '7814', 'slot', 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7814'),
(962, 8, 'Saxon', '7813', 'slot', 'PlayFiver/Playngo/Saxon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7813'),
(963, 8, 'Sails of Gold', '7812', 'slot', 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7812'),
(964, 8, 'Royal Masquerade', '7811', 'slot', 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7811'),
(965, 8, 'Rise of Merlin', '7810', 'slot', 'PlayFiver/Playngo/Rise-of-Merlin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:25:56', '7810'),
(966, 8, 'Rise of Athena', '7809', 'slot', 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7809'),
(967, 8, 'Xmas Joker', '7820', 'slot', 'PlayFiver/Playngo/Xmas-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7820'),
(968, 8, 'Wild Blood', '7819', 'slot', 'PlayFiver/Playngo/Wild-Blood.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7819'),
(969, 8, 'Sticky Joker', '7818', 'slot', 'PlayFiver/Playngo/Sticky-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7818'),
(970, 8, 'Star Joker', '7817', 'slot', 'PlayFiver/Playngo/Star-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7817'),
(971, 8, 'Space Race', '7816', 'slot', 'PlayFiver/Playngo/Space-Race.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7816'),
(972, 8, 'Sizzling Spins', '7815', 'slot', 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7815'),
(973, 8, 'Scroll of Dead', '7814', 'slot', 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7814'),
(974, 8, 'Saxon', '7813', 'slot', 'PlayFiver/Playngo/Saxon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7813'),
(975, 8, 'Sails of Gold', '7812', 'slot', 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7812'),
(976, 8, 'Royal Masquerade', '7811', 'slot', 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7811'),
(977, 8, 'Rise of Athena', '7809', 'slot', 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7809'),
(978, 8, 'Xmas Joker', '7820', 'slot', 'PlayFiver/Playngo/Xmas-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7820'),
(979, 8, 'Wild Blood', '7819', 'slot', 'PlayFiver/Playngo/Wild-Blood.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7819'),
(980, 8, 'Sticky Joker', '7818', 'slot', 'PlayFiver/Playngo/Sticky-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7818'),
(981, 8, 'Star Joker', '7817', 'slot', 'PlayFiver/Playngo/Star-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7817'),
(982, 8, 'Space Race', '7816', 'slot', 'PlayFiver/Playngo/Space-Race.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7816'),
(983, 8, 'Sizzling Spins', '7815', 'slot', 'PlayFiver/Playngo/Sizzling-Spins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7815'),
(984, 8, 'Scroll of Dead', '7814', 'slot', 'PlayFiver/Playngo/Scroll-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7814'),
(985, 8, 'Saxon', '7813', 'slot', 'PlayFiver/Playngo/Saxon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7813'),
(986, 8, 'Sails of Gold', '7812', 'slot', 'PlayFiver/Playngo/Sails-of-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7812'),
(987, 8, 'Royal Masquerade', '7811', 'slot', 'PlayFiver/Playngo/Royal-Masquerade.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7811'),
(988, 8, 'Rise of Athena', '7809', 'slot', 'PlayFiver/Playngo/Rise-of-Athena.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7809'),
(989, 8, 'Riches of RA', '7808', 'slot', 'PlayFiver/Playngo/Riches-of-RA.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7808'),
(990, 8, 'Rich Wilde and the Amulet of Dead', '7807', 'slot', 'PlayFiver/Playngo/Rich-Wilde-and-the-Amulet-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7807'),
(991, 8, 'Prosperity Palace', '7806', 'slot', 'PlayFiver/Playngo/Prosperity-Palace.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7806'),
(992, 8, 'Prism of Gems', '7805', 'slot', 'PlayFiver/Playngo/Prism-of-Gems.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7805'),
(993, 8, 'Photo Safari', '7804', 'slot', 'PlayFiver/Playngo/Photo-Safari.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7804'),
(994, 8, 'Pearl Lagoon', '7803', 'slot', 'PlayFiver/Playngo/Pearl-Lagoon.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7803'),
(995, 8, 'New Year Riches', '7802', 'slot', 'PlayFiver/Playngo/New-Year-Riches.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:30', '7802'),
(996, 8, 'Mystery Joker', '7801', 'slot', 'PlayFiver/Playngo/Mystery-Joker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7801'),
(997, 8, 'MultiFruit 81', '7800', 'slot', 'PlayFiver/Playngo/MultiFruit-81.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:29', '7800'),
(998, 8, 'Miner Donkey Trouble', '7799', 'slot', 'PlayFiver/Playngo/Miner-Donkey-Trouble.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7799'),
(999, 8, 'Lord Merlin and the Lady of the Lake', '7798', 'slot', 'PlayFiver/Playngo/Lord-Merlin-and-the-Lady-of-the-Lake.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7798'),
(1000, 8, 'Legacy of Dead', '7797', 'slot', 'PlayFiver/Playngo/Legacy-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:25', '7797'),
(1001, 8, 'Irish Gold', '7796', 'slot', 'PlayFiver/Playngo/Irish-Gold.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:27:50', '7796'),
(1002, 8, 'House of Doom', '7795', 'slot', 'PlayFiver/Playngo/House-of-Doom.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 17:32:51', '7795'),
(1003, 8, 'Happy Halloween', '7794', 'slot', 'PlayFiver/Playngo/Happy-Halloween.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7794'),
(1004, 8, 'Golden Legend', '7793', 'slot', 'PlayFiver/Playngo/Golden-Legend.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7793'),
(1005, 8, 'Gold Trophy', '7792', 'slot', 'PlayFiver/Playngo/Gold-Trophy.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:26:04', '7792'),
(1006, 8, 'Ghost of Dead', '7791', 'slot', 'PlayFiver/Playngo/Ghost-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7791'),
(1007, 8, 'Fu Er Dai', '7790', 'slot', 'PlayFiver/Playngo/Fu-Er-Dai.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7790'),
(1008, 8, 'Dragonship', '7789', 'slot', 'PlayFiver/Playngo/Dragonship.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7789'),
(1009, 8, 'Doom of Egypt', '7788', 'slot', 'PlayFiver/Playngo/Doom-of-Egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7788'),
(1010, 8, 'Disco Diamonds', '7787', 'slot', 'PlayFiver/Playngo/Disco-Diamonds.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:27:35', '7787'),
(1011, 8, 'Dawn of Egypt', '7786', 'slot', 'PlayFiver/Playngo/Dawn-of-Egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7786'),
(1012, 8, 'Danish Flip', '7785', 'slot', 'PlayFiver/Playngo/Danish-Flip.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7785'),
(1013, 8, 'Crystal Sun', '7784', 'slot', 'PlayFiver/Playngo/Crystal-Sun.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:39', '7784'),
(1014, 8, 'CopsnRobbers', '7783', 'slot', 'PlayFiver/Playngo/CopsnRobbers.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7783'),
(1015, 8, 'Coils of Cash', '7782', 'slot', 'PlayFiver/Playngo/Coils-of-Cash.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7782'),
(1016, 8, 'Charlie Chance', '7781', 'slot', 'PlayFiver/Playngo/Charlie-Chance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7781'),
(1017, 8, 'Cat Wilde and the Doom of Dead', '7780', 'slot', 'PlayFiver/Playngo/Cat-Wilde-and-the-Doom-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7780'),
(1018, 8, 'Book of Dead', '7779', 'slot', 'PlayFiver/Playngo/Book-of-Dead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:24:19', '7779'),
(1019, 8, 'Blinged', '7778', 'slot', 'PlayFiver/Playngo/Blinged.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7778'),
(1020, 8, 'Aztec Idols', '7777', 'slot', 'PlayFiver/Playngo/Aztec-Idols.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7777'),
(1021, 8, '5xMagic', '7776', 'slot', 'PlayFiver/Playngo/5xMagic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '7776'),
(1022, 8, '3 Clown Monty', '7775', 'slot', 'PlayFiver/Playngo/3-Clown-Monty.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:24:16', '7775'),
(1023, 8, 'Blazin Bullfrog', '8107', 'slot', 'PlayFiver/Playngo/Blazin-Bullfrog.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '8107'),
(1024, 8, 'Big win 777', '8106', 'slot', 'PlayFiver/Playngo/Big-win-777.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '8106'),
(1025, 8, 'Leprechauns Vault', '8127', 'slot', 'PlayFiver/Playngo/Leprechauns-Vault.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:27:41', '8127'),
(1026, 8, 'Athena Ascending', '8142', 'slot', 'PlayFiver/Playngo/Athena-Ascending.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:23:22', '8142'),
(1027, 9, 'Twin Spin', '72', 'slot', 'PlayFiver/NetEnt/Twin-Spin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:18:23', '72'),
(1028, 9, 'Twin Spin Deluxe', '7194', 'slot', 'PlayFiver/NetEnt/Twin-Spin-Deluxe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7194'),
(1029, 9, 'Twin Spin MegaWays', '7109', 'slot', 'PlayFiver/NetEnt/Twin-Spin-MegaWays.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7109'),
(1030, 9, 'Vegas Night Life', '7108', 'slot', 'PlayFiver/NetEnt/Vegas-Night-Life.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:18:39', '7108'),
(1031, 9, 'Victorious', '529', 'slot', 'PlayFiver/NetEnt/Victorious.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '529'),
(1032, 9, 'Vikings', '7160', 'slot', 'PlayFiver/NetEnt/Vikings.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7160'),
(1033, 9, 'Wild Bazaar', '7165', 'slot', 'PlayFiver/NetEnt/Wild-Bazaar.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7165'),
(1034, 9, 'Wilderland', '7107', 'slot', 'PlayFiver/NetEnt/Wilderland.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7107'),
(1035, 9, 'Wild Turkey', '7154', 'slot', 'PlayFiver/NetEnt/Wild-Turkey.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7154'),
(1036, 9, 'Wild Watér', '523', 'slot', 'PlayFiver/NetEnt/Wild-Watér.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '523'),
(1037, 9, 'Wild Worlds', '7150', 'slot', 'PlayFiver/NetEnt/Wild-Worlds.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7150'),
(1038, 9, 'Wings of Riches', '7123', 'slot', 'PlayFiver/NetEnt/Wings-of-Riches.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7123'),
(1039, 9, 'Wonderland Protector', '7102', 'slot', 'PlayFiver/NetEnt/Wonderland-Protector.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7102'),
(1040, 9, 'King of Slots', '441', 'slot', 'PlayFiver/NetEnt/King-of-Slots.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '441'),
(1041, 9, 'Lost Relics', '7178', 'slot', 'PlayFiver/NetEnt/Lost-Relics.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7178'),
(1042, 9, 'Lucky Angler', '7188', 'slot', 'PlayFiver/NetEnt/Lucky-Angler.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7188'),
(1043, 9, 'Magic Portals', '533', 'slot', 'PlayFiver/NetEnt/Magic-Portals.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '533'),
(1044, 9, 'Motorhead', '4164', 'slot', 'PlayFiver/NetEnt/Motorhead.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '4164'),
(1045, 9, 'Mr Green: Grand Tour', '7174', 'slot', 'PlayFiver/NetEnt/Mr-Green_-Grand-Tour.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7174'),
(1046, 9, 'Mr Green: Moonlight', '7173', 'slot', 'PlayFiver/NetEnt/Mr-Green_-Moonlight.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7173'),
(1047, 9, 'Ozzy Osbourne', '7125', 'slot', 'PlayFiver/NetEnt/Ozzy-Osbourne.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7125'),
(1048, 9, 'Piraté from the East', '7054', 'slot', 'PlayFiver/NetEnt/Piraté-from-the-East.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7054'),
(1049, 9, 'Planet of the Apes', '7186', 'slot', 'PlayFiver/NetEnt/Planet-of-the-Apes.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7186'),
(1050, 9, 'Reel Rush 2', '7127', 'slot', 'PlayFiver/NetEnt/Reel-Rush-2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7127'),
(1051, 9, 'Reel Rush', '26', 'slot', 'PlayFiver/NetEnt/Reel-Rush.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '26'),
(1052, 9, 'Riches of Midgard', '7106', 'slot', 'PlayFiver/NetEnt/Riches-of-Midgard.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:18:32', '7106'),
(1053, 9, 'Rise of Maya', '7122', 'slot', 'PlayFiver/NetEnt/Rise-of-Maya.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7122'),
(1054, 9, 'Robin Hood', '7152', 'slot', 'PlayFiver/NetEnt/Robin-Hood.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7152'),
(1055, 9, 'Santa vs Rudolf', '7124', 'slot', 'PlayFiver/NetEnt/Santa-vs-Rudolf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7124'),
(1056, 9, 'Scruffy Duck', '7197', 'slot', 'PlayFiver/NetEnt/Scruffy-Duck.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7197'),
(1057, 9, 'Secret Of The Stones', '7187', 'slot', 'PlayFiver/NetEnt/Secret-Of-The-Stones.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:19:36', '7187'),
(1058, 9, 'Secrets of Atlantis', '4163', 'slot', 'PlayFiver/NetEnt/Secrets-of-Atlantis.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '4163'),
(1059, 9, 'StarBurst', '179', 'slot', 'PlayFiver/NetEnt/StarBurst.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:19:19', '179');
INSERT INTO `games` (`id`, `provider_id`, `game_name`, `game_id`, `game_type`, `cover`, `status`, `technology`, `distribution`, `views`, `is_featured`, `show_home`, `created_at`, `updated_at`, `game_code`) VALUES
(1060, 9, 'Street Fighter II: The World Warrior', '7112', 'slot', 'PlayFiver/NetEnt/Street-Fighter-II_-The-World-Warrior.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7112'),
(1061, 9, 'Strolling Staxx', '7157', 'slot', 'PlayFiver/NetEnt/Strolling-Staxx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7157'),
(1062, 9, 'Super Striker', '7111', 'slot', 'PlayFiver/NetEnt/Super-Striker.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:25', '7111'),
(1063, 9, 'Sweety Honey Fruity', '7053', 'slot', 'PlayFiver/NetEnt/Sweety-Honey-Fruity.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7053'),
(1064, 9, 'Swipe & Roll', '7172', 'slot', 'PlayFiver/NetEnt/Swipe-&-Roll.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-17 16:34:18', '7172'),
(1065, 9, 'The Wish Master', '7130', 'slot', 'PlayFiver/NetEnt/The-Wish-Master.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7130'),
(1066, 9, 'Trollpot 5000', '7110', 'slot', 'PlayFiver/NetEnt/Trollpot-5000.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:28', '7110'),
(1067, 9, 'Turn Your Fortune', '7158', 'slot', 'PlayFiver/NetEnt/Turn-Your-Fortune.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:20:17', '7158'),
(1068, 9, 'Twin Happiness', '7055', 'slot', 'PlayFiver/NetEnt/Twin-Happiness.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7055'),
(1069, 9, 'Jumanji', '7170', 'slot', 'PlayFiver/NetEnt/Jumanji.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7170'),
(1070, 9, 'King of 3 Kingdoms', '7133', 'slot', 'PlayFiver/NetEnt/King-of-3-Kingdoms.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:30', '7133'),
(1071, 9, 'Long Pao', '7126', 'slot', 'PlayFiver/NetEnt/Long-Pao.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7126'),
(1072, 9, 'Magic Maid Cafe', '7128', 'slot', 'PlayFiver/NetEnt/Magic-Maid-Cafe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7128'),
(1073, 9, 'Reel Steal', '544', 'slot', 'PlayFiver/NetEnt/Reel-Steal.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:30', '544'),
(1074, 9, 'Jimi Hendrix', '489', 'slot', 'PlayFiver/NetEnt/Jimi-Hendrix.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '489'),
(1075, 9, 'Jingle Spin', '7159', 'slot', 'PlayFiver/NetEnt/Jingle-Spin.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:25:20', '7159'),
(1076, 10, 'Hit the Bank: Hold and Win', '8209', 'slot', 'PlayFiver/Playson/Hit-the-Bank_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8209'),
(1077, 10, 'Royal coins 2: Hold and Win', '8208', 'slot', 'PlayFiver/Playson/Royal-coins-2_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:36:02', '8208'),
(1078, 10, 'Ultra Fortunator: Hold and Win', '8207', 'slot', 'PlayFiver/Playson/Ultra-Fortunator_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8207'),
(1079, 10, 'Ruby Hit: Hold and Win', '8206', 'slot', 'PlayFiver/Playson/Ruby-Hit_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:22:22', '8206'),
(1080, 10, 'Luxor Gold: Hold and Win', '8205', 'slot', 'PlayFiver/Playson/Luxor-Gold_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8205'),
(1081, 10, 'Juice Inc', '8204', 'slot', 'PlayFiver/Playson/Juice-Inc.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8204'),
(1082, 10, 'Book del Sol: Multiplier', '8203', 'slot', 'PlayFiver/Playson/Book-del-Sol_-Multiplier.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8203'),
(1083, 10, 'Lion Gems: Hold and Win', '8202', 'slot', 'PlayFiver/Playson/Lion-Gems_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8202'),
(1084, 10, 'Jokers Coins: Hold and Win', '8201', 'slot', 'PlayFiver/Playson/Jokers-Coins_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8201'),
(1085, 10, 'Burning Fortunator', '8200', 'slot', 'PlayFiver/Playson/Burning-Fortunator.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:22:21', '8200'),
(1086, 10, 'Wolf Power Megaways', '8199', 'slot', 'PlayFiver/Playson/Wolf-Power-Megaways.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8199'),
(1087, 10, 'Wolf Power: Hold and Win', '8198', 'slot', 'PlayFiver/Playson/Wolf-Power_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8198'),
(1088, 10, 'Super Sunny Fruits: Hold and Win', '8197', 'slot', 'PlayFiver/Playson/Super-Sunny-Fruits_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:22:20', '8197'),
(1089, 10, 'Super Burning Wins: classic 5 lines', '8196', 'slot', 'PlayFiver/Playson/Super-Burning-Wins_-classic-5-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8196'),
(1090, 10, 'Sunny Fruits: Hold and Win', '8195', 'slot', 'PlayFiver/Playson/Sunny-Fruits_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8195'),
(1091, 10, 'Spirit of Egypt: Hold and Win', '8194', 'slot', 'PlayFiver/Playson/Spirit-of-Egypt_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8194'),
(1092, 10, 'Solar Temple', '8193', 'slot', 'PlayFiver/Playson/Solar-Temple.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8193'),
(1093, 10, 'Solar Queen', '8191', 'slot', 'PlayFiver/Playson/Solar-Queen.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8191'),
(1094, 10, 'Diamond Fortunator: Hold and Win', '8190', 'slot', 'PlayFiver/Playson/Diamond-Fortunator_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8190'),
(1095, 10, 'Solar King', '8189', 'slot', 'PlayFiver/Playson/Solar-King.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8189'),
(1096, 10, '5 Super Sevens Fruits 6', '8188', 'slot', 'PlayFiver/Playson/5-Super-Sevens-Fruits-6.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8188'),
(1097, 10, 'Sevens & Fruits: 20 lines', '8187', 'slot', 'PlayFiver/Playson/Sevens-&-Fruits_-20-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8187'),
(1098, 10, 'Royal Coins: Hold and Win', '8186', 'slot', 'PlayFiver/Playson/Royal-Coins_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:22:48', '8186'),
(1099, 10, 'Rise of Egypt', '8185', 'slot', 'PlayFiver/Playson/Rise-of-Egypt.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8185'),
(1100, 10, 'Rich Diamonds: Hold and Win', '8184', 'slot', 'PlayFiver/Playson/Rich-Diamonds_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8184'),
(1101, 10, 'Pearl Beauty: Hold and Win', '8183', 'slot', 'PlayFiver/Playson/Pearl-Beauty_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8183'),
(1102, 10, 'Legend of Cleopatra Megaways', '8182', 'slot', 'PlayFiver/Playson/Legend-of-Cleopatra-Megaways.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8182'),
(1103, 10, 'Legend of Cleopatra', '8181', 'slot', 'PlayFiver/Playson/Legend-of-Cleopatra.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8181'),
(1104, 10, 'Joker Expand: 5 lines', '8180', 'slot', 'PlayFiver/Playson/Joker-Expand_-5-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8180'),
(1105, 10, 'Imperial Fruits: 5 lines', '8179', 'slot', 'PlayFiver/Playson/Imperial-Fruits_-5-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8179'),
(1106, 10, 'Imperial Fruits: 40 lines', '8178', 'slot', 'PlayFiver/Playson/Imperial-Fruits_-40-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:36:09', '8178'),
(1107, 10, 'Imperial Fruits: 100 Lines', '8177', 'slot', 'PlayFiver/Playson/Imperial-Fruits_-100-Lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8177'),
(1108, 10, 'Hot Coins: Hold and Win', '8176', 'slot', 'PlayFiver/Playson/Hot-Coins_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8176'),
(1109, 10, 'Hot Burning Wins', '8175', 'slot', 'PlayFiver/Playson/Hot-Burning-Wins.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:54', '8175'),
(1110, 10, 'Fruits&Jokers: 40 lines', '8174', 'slot', 'PlayFiver/Playson/Fruits&Jokers_-40-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-07-19 15:35:56', '8174'),
(1111, 10, 'Fruits&Jokers: 20 lines', '8173', 'slot', 'PlayFiver/Playson/Fruits&Jokers_-20-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8173'),
(1112, 10, 'Fruits & Jokers: 100 lines', '8172', 'slot', 'PlayFiver/Playson/Fruits-&-Jokers_-100-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8172'),
(1113, 10, 'Eagle Power: Hold and Win', '8171', 'slot', 'PlayFiver/Playson/Eagle-Power_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8171'),
(1114, 10, 'Divine Dragon: Hold and Win', '8170', 'slot', 'PlayFiver/Playson/Divine-Dragon_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8170'),
(1115, 10, 'Diamond Wins: Hold & Win', '8169', 'slot', 'PlayFiver/Playson/Diamond-Wins_-Hold-&-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:13', '8169'),
(1116, 10, 'Crystal Land', '8168', 'slot', 'PlayFiver/Playson/Crystal-Land.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8168'),
(1117, 10, 'Burning Wins x2', '8166', 'slot', 'PlayFiver/Playson/Burning-Wins-x2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8166'),
(1118, 10, 'Buffalo Power: Megaways', '8165', 'slot', 'PlayFiver/Playson/Buffalo-Power_-Megaways.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8165'),
(1119, 10, 'Buffalo Power: Hold and Win', '8164', 'slot', 'PlayFiver/Playson/Buffalo-Power_-Hold-and-Win.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8164'),
(1120, 10, 'Book of Gold Double Chance', '8163', 'slot', 'PlayFiver/Playson/Book-of-Gold-Double-Chance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8163'),
(1121, 10, 'Book of Gold: Classic', '8162', 'slot', 'PlayFiver/Playson/Book-of-Gold_-Classic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8162'),
(1122, 10, 'Book of Gold Multichance', '8161', 'slot', 'PlayFiver/Playson/Book-of-Gold-Multichance.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8161'),
(1123, 10, '9 Happy Pharaohs', '8160', 'slot', 'PlayFiver/Playson/9-Happy-Pharaohs.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8160'),
(1124, 10, '5 Super Sevens & Fruits', '8159', 'slot', 'PlayFiver/Playson/5-Super-Sevens-&-Fruits.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8159'),
(1125, 10, '5 Fortunator', '8158', 'slot', 'PlayFiver/Playson/5-Fortunator.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8158'),
(1126, 10, '3 Fruits Win: 10 lines', '8157', 'slot', 'PlayFiver/Playson/3-Fruits-Win_-10-lines.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8157'),
(1127, 10, '100 Joker Staxx', '8156', 'slot', 'PlayFiver/Playson/100-Joker-Staxx.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8156'),
(1128, 3, 'Aviator', 'aviator', 'slot', 'PlayFiver/Spribe/Aviator.png', '1', 'html5', 'play_fiver', 0, 1, 1, '2024-03-28 17:55:33', '2024-07-18 19:23:03', 'aviator'),
(1129, 10, 'Buffalo Power Christmas', '8155', 'slot', 'PlayFiver/Playson/Buffalo-Power-Christmas.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-03-28 17:55:33', '2024-06-21 14:21:21', '8155'),
(1130, 2, 'Diamond Cascade', 'vs50dmdcascade', 'Pragmatic', 'PlayFiver/Pragmatic/vs50dmdcascade.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs50dmdcascade'),
(1131, 2, 'Piggy Bankers', 'vs20piggybank', 'Pragmatic', 'PlayFiver/Pragmatic/vs20piggybank.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs20piggybank'),
(1132, 2, 'Sweet Bonanza Dice', 'vs20bnnzdice', 'Pragmatic', 'PlayFiver/Pragmatic/vs20bnnzdice.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-28 20:47:19', 'vs20bnnzdice'),
(1133, 2, 'Gemstone', 'vs5gemstone', 'Pragmatic', 'PlayFiver/Pragmatic/vs5gemstone.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'vs5gemstone'),
(1134, 11, 'AUTO_MEGA_ROULETTE', '1hl323e1lxuqdrkr', 'Live', 'PlayFiver/Pragmaticlive/1hl323e1lxuqdrkr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:29:09', '1hl323e1lxuqdrkr'),
(1135, 11, 'MEGA_ROULETTE', '1hl65ce1lxuqdrkr', 'Live', 'PlayFiver/Pragmaticlive/1hl65ce1lxuqdrkr.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '1hl65ce1lxuqdrkr'),
(1136, 11, 'AUTO_ROULETTE', '5bzl2835s5ruvweg', 'Live', 'PlayFiver/Pragmaticlive/5bzl2835s5ruvweg.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:29:04', '5bzl2835s5ruvweg'),
(1137, 11, 'SPEED_AUTO_ROULETTE', 'autorwra311autor', 'Live', 'PlayFiver/Pragmaticlive/autorwra311autor.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'autorwra311autor'),
(1138, 11, 'ROULETTE_RUBY', 'chroma229rwltr22', 'Live', 'PlayFiver/Pragmaticlive/chroma229rwltr22.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'chroma229rwltr22'),
(1139, 11, 'SPEED_ROULETTE_1', 'fl9knouu0yjez2wi', 'Live', 'PlayFiver/Pragmaticlive/fl9knouu0yjez2wi.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'fl9knouu0yjez2wi'),
(1140, 11, 'ROULETTE_AZURE', 'g03y1t9vvuhrfytl', 'Live', 'PlayFiver/Pragmaticlive/g03y1t9vvuhrfytl.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'g03y1t9vvuhrfytl'),
(1141, 11, 'LUCKY_6_ROULETTE', 'lucky6roulettea3', 'Live', 'PlayFiver/Pragmaticlive/lucky6roulettea3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'lucky6roulettea3'),
(1142, 11, 'TURKISH_ROULETTE', 'p8l1j84prrmxzyic', 'Live', 'PlayFiver/Pragmaticlive/p8l1j84prrmxzyic.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'p8l1j84prrmxzyic'),
(1143, 11, 'SPEED_ROULETTE_2', 'r20speedrtwo201s', 'Live', 'PlayFiver/Pragmaticlive/r20speedrtwo201s.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'r20speedrtwo201s'),
(1144, 11, 'ROULETTE_INDIAN', 'rmycjoqq18k2r161', 'Live', 'PlayFiver/Pragmaticlive/rmycjoqq18k2r161.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'rmycjoqq18k2r161'),
(1145, 11, 'ROMANIAN_ROULETTE', 'romania233rwl291', 'Live', 'PlayFiver/Pragmaticlive/romania233rwl291.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'romania233rwl291'),
(1146, 11, 'SPANISH_ROULETTE', 'roulerw234rwl292', 'Live', 'PlayFiver/Pragmaticlive/roulerw234rwl292.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'roulerw234rwl292'),
(1147, 11, 'GERMAN_ROULETTE', 's2x6b4jdeqza2ge2', 'Live', 'PlayFiver/Pragmaticlive/s2x6b4jdeqza2ge2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 's2x6b4jdeqza2ge2'),
(1148, 11, 'RUSSIAN_ROULETTE', 't4jzencinod6iqwi', 'Live', 'PlayFiver/Pragmaticlive/t4jzencinod6iqwi.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 't4jzencinod6iqwi'),
(1149, 11, 'ROULETTE_ITALIA_TRICOLORE', 'v1c52fgw7yy02upz', 'Live', 'PlayFiver/Pragmaticlive/v1c52fgw7yy02upz.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'v1c52fgw7yy02upz'),
(1150, 11, 'ROULETTE_MACAO', 'yqpz3ichst2xg439', 'Live', 'PlayFiver/Pragmaticlive/yqpz3ichst2xg439.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'yqpz3ichst2xg439'),
(1151, 11, 'SPEED_BACCARAT_6', '2q57e43m4ivqwaq3', 'Live', 'PlayFiver/Pragmaticlive/2q57e43m4ivqwaq3.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '2q57e43m4ivqwaq3'),
(1152, 11, 'SPEED_BACCARAT_5', '886ewimul28yw14j', 'Live', 'PlayFiver/Pragmaticlive/886ewimul28yw14j.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '886ewimul28yw14j'),
(1153, 11, 'BACCARAT_2', '9j3eagurfwmml7z2', 'Live', 'PlayFiver/Pragmaticlive/9j3eagurfwmml7z2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', '9j3eagurfwmml7z2'),
(1154, 11, 'SPEED_BACCARAT_14', 'b0jf7rlboleibnap', 'Live', 'PlayFiver/Pragmaticlive/b0jf7rlboleibnap.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'b0jf7rlboleibnap'),
(1155, 11, 'PUNTO_BANCO_ITALIA_TRICOLORE', 'bcapuntobanco001', 'Live', 'PlayFiver/Pragmaticlive/bcapuntobanco001.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcapuntobanco001'),
(1156, 11, 'BACCARAT_7', 'bcpirpmfpeobc191', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc191.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc191'),
(1157, 11, 'BACCARAT_8', 'bcpirpmfpeobc192', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc192.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc192'),
(1158, 11, 'SPEED_BACCARAT_15', 'bcpirpmfpeobc193', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc193.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc193'),
(1159, 11, 'SPEED_BACCARAT_10', 'bcpirpmfpeobc194', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc194.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc194'),
(1160, 11, 'SPEED_BACCARAT_9', 'bcpirpmfpeobc196', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc196.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc196'),
(1161, 11, 'SPEED_BACCARAT_7', 'bcpirpmfpeobc197', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc197.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc197'),
(1162, 11, 'SPEED_BACCARAT_8', 'bcpirpmfpeobc198', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc198.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc198'),
(1163, 11, 'SUPER_8_BACCARAT', 'bcpirpmfpeobc199', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpeobc199.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpeobc199'),
(1164, 11, 'FORTUNE_6_BACCARAT', 'bcpirpmfpobc1910', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpobc1910.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpobc1910'),
(1165, 11, 'BACCARAT_9', 'bcpirpmfpobc1912', 'Live', 'PlayFiver/Pragmaticlive/bcpirpmfpobc1912.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'bcpirpmfpobc1912'),
(1166, 11, 'SPEED_BACCARAT_12', 'cbcf6qas8fscb221', 'Live', 'PlayFiver/Pragmaticlive/cbcf6qas8fscb221.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'cbcf6qas8fscb221'),
(1167, 11, 'BACCARAT_3', 'cbcf6qas8fscb222', 'Live', 'PlayFiver/Pragmaticlive/cbcf6qas8fscb222.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'cbcf6qas8fscb222'),
(1168, 11, 'SPEED_BACCARAT_11', 'cbcf6qas8fscb224', 'Live', 'PlayFiver/Pragmaticlive/cbcf6qas8fscb224.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'cbcf6qas8fscb224'),
(1169, 11, 'BACCARAT_1', 'h22z8qhp17sa0vkh', 'Live', 'PlayFiver/Pragmaticlive/h22z8qhp17sa0vkh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'h22z8qhp17sa0vkh'),
(1170, 11, 'SPEED_BACCARAT_2', 'kkqnazmd8ttq7fgd', 'Live', 'PlayFiver/Pragmaticlive/kkqnazmd8ttq7fgd.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'kkqnazmd8ttq7fgd'),
(1171, 11, 'SPEED_BACCARAT_13', 'm88hicogrzeod202', 'Live', 'PlayFiver/Pragmaticlive/m88hicogrzeod202.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'm88hicogrzeod202'),
(1172, 11, 'MEGA_BACCARAT', 'mbc371rpmfmbc371', 'Live', 'PlayFiver/Pragmaticlive/mbc371rpmfmbc371.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'mbc371rpmfmbc371'),
(1173, 11, 'BACCARAT_5', 'ne074fgn4bd1150i', 'Live', 'PlayFiver/Pragmaticlive/ne074fgn4bd1150i.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ne074fgn4bd1150i'),
(1174, 11, 'BACCARAT_6', 'oq808ojps709qqaf', 'Live', 'PlayFiver/Pragmaticlive/oq808ojps709qqaf.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'oq808ojps709qqaf'),
(1175, 11, 'SPEED_BACCARAT_1', 'pwnhicogrzeodk79', 'Live', 'PlayFiver/Pragmaticlive/pwnhicogrzeodk79.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'pwnhicogrzeodk79'),
(1176, 11, 'SPEED_BACCARAT_3', 's8s9f0quk3ygiyb1', 'Live', 'PlayFiver/Pragmaticlive/s8s9f0quk3ygiyb1.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 's8s9f0quk3ygiyb1'),
(1177, 11, 'MEGA_SIC_BO', 'lc419kkmr2sxfpbk', 'Live', 'PlayFiver/Pragmaticlive/lc419kkmr2sxfpbk.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'lc419kkmr2sxfpbk'),
(1178, 11, 'SICBO', 'sba71kkmr2ssba71', 'Live', 'PlayFiver/Pragmaticlive/sba71kkmr2ssba71.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:28:55', 'sba71kkmr2ssba71'),
(1179, 11, 'MEGA_WHEEL', 'md500q83g7cdefw1', 'Live', 'PlayFiver/Pragmaticlive/md500q83g7cdefw1.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'md500q83g7cdefw1'),
(1180, 11, 'DRAGON_TIGER', 'ge49e4os88bp4bi5', 'Live', 'PlayFiver/Pragmaticlive/ge49e4os88bp4bi5.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'ge49e4os88bp4bi5'),
(1181, 11, 'SWEET_BONANZA_CANDYLAND', 'pbvzrfk1fyft4dwe', 'Live', 'PlayFiver/Pragmaticlive/pbvzrfk1fyft4dwe.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:29:41', 'pbvzrfk1fyft4dwe'),
(1182, 11, 'ANDAR_BAHAR', 'jzbzy021lg8xy9i2', 'Live', 'PlayFiver/Pragmaticlive/jzbzy021lg8xy9i2.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-05-27 07:27:59', 'jzbzy021lg8xy9i2'),
(1183, 11, 'BIG_BASS_CRASH', 'bigbassnewbb1320', 'Pragmatic', 'PlayFiver/Pragmaticlive/bigbassnewbb1320.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 15:33:09', 'bigbassnewbb1320'),
(1184, 11, 'SPACEMAN', 'spacemanyxe123nh', 'Pragmatic', 'PlayFiver/Pragmaticlive/spacemanyxe123nh.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 17:14:20', 'spacemanyxe123nh'),
(1185, 11, 'SPACEMAN', 'spacemanyxeabn02', 'Pragmatic', 'PlayFiver/Pragmaticlive/spacemanyxeabn02.png', '1', 'html5', 'play_fiver', 0, 0, 1, '2024-05-27 07:25:59', '2024-07-19 14:13:38', 'spacemanyxeabn02'),
(1186, 3, 'teste', 'teste', 'teste', '01J3GHED1V888TJKS31TKHD8B2.png', '0', 'html5', 'play_fiver', 2, 0, 0, '2024-07-23 20:35:12', '2024-07-23 20:35:12', 'teste');

-- --------------------------------------------------------

--
-- Estrutura para tabela `games_keys`
--

CREATE TABLE `games_keys` (
  `id` bigint UNSIGNED NOT NULL,
  `playfiver_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_rtp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `playfiver_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `games_keys`
--

INSERT INTO `games_keys` (`id`, `playfiver_url`, `playfiver_rtp`, `playfiver_secret`, `playfiver_code`, `playfiver_token`, `updated_at`) VALUES
(1, 'https://api.playfiver.com', '50', '', '', '', '2024-07-23 20:47:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_favorites`
--

CREATE TABLE `game_favorites` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_likes`
--

CREATE TABLE `game_likes` (
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `game_reviews`
--

CREATE TABLE `game_reviews` (
  `user_id` bigint UNSIGNED NOT NULL,
  `game_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint UNSIGNED NOT NULL,
  `suitpay_uri` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `suitpay_cliente_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `suitpay_cliente_secret` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_production` tinyint DEFAULT '0',
  `stripe_public_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_secret_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `stripe_webhook_key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_uri` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_cliente_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bspay_cliente_secret` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `public_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `private_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mp_client_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mp_client_secret` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mp_public_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mp_access_token` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digitopay_uri` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digitopay_cliente_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `digitopay_cliente_secret` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `gateways`
--

INSERT INTO `gateways` (`id`, `suitpay_uri`, `suitpay_cliente_id`, `suitpay_cliente_secret`, `stripe_production`, `stripe_public_key`, `stripe_secret_key`, `stripe_webhook_key`, `bspay_uri`, `bspay_cliente_id`, `bspay_cliente_secret`, `created_at`, `updated_at`, `public_key`, `private_key`, `mp_client_id`, `mp_client_secret`, `mp_public_key`, `mp_access_token`, `digitopay_uri`, `digitopay_cliente_id`, `digitopay_cliente_secret`) VALUES
(1, 'https://ws.suitpay.app/api/v1/', '', '', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-30 21:05:51', '2024-07-23 20:45:58', NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.digitopayoficial.com.br/', 'f8f57f0c-6676-4693-9492-e3188c9316cd', '6abbdaff-05e0-4b30-9625-6fbf5d17683f');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_config`
--

CREATE TABLE `ggds_spin_config` (
  `id` bigint UNSIGNED NOT NULL,
  `prizes` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_config`
--

INSERT INTO `ggds_spin_config` (`id`, `prizes`, `created_at`, `updated_at`) VALUES
(1, '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":2},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":3},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":1},{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":0},{\"currency\":\"BRL\",\"value\":10}]', '2024-01-11 20:52:59', '2024-04-13 11:07:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggds_spin_runs`
--

CREATE TABLE `ggds_spin_runs` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `possibilities` text COLLATE utf8mb4_general_ci NOT NULL,
  `prize` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `ggds_spin_runs`
--

INSERT INTO `ggds_spin_runs` (`id`, `key`, `nonce`, `possibilities`, `prize`, `created_at`, `updated_at`) VALUES
(1, '526db7d417473d56275f7dffa72c0c3382aa76df7adcfe7216951fca7dc5e810', '11bea414-f850-460a-91d2-a9703e47ca2e', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":25},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":40},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":90},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":140},{\"currency\":\"BRL\",\"value\":15},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":500},{\"currency\":\"BRL\",\"value\":1000},{\"currency\":\"BRL\",\"value\":1500},{\"currency\":\"BRL\",\"value\":2000},{\"currency\":\"BRL\",\"value\":2500}]', '{\"currency\":\"BRL\",\"value\":15}', '2024-06-10 21:48:09', '2024-06-10 21:48:09'),
(2, '2c35774a073f9e945a91b9b12b5147639cca66234af69b34b0d6656595372c96', '2b712589-b2ad-40af-82c3-ea01fec5f308', '[{\"currency\":\"BRL\",\"value\":5},{\"currency\":\"BRL\",\"value\":10},{\"currency\":\"BRL\",\"value\":25},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":40},{\"currency\":\"BRL\",\"value\":50},{\"currency\":\"BRL\",\"value\":90},{\"currency\":\"BRL\",\"value\":100},{\"currency\":\"BRL\",\"value\":140},{\"currency\":\"BRL\",\"value\":15},{\"currency\":\"BRL\",\"value\":30},{\"currency\":\"BRL\",\"value\":500},{\"currency\":\"BRL\",\"value\":1000},{\"currency\":\"BRL\",\"value\":1500},{\"currency\":\"BRL\",\"value\":2000},{\"currency\":\"BRL\",\"value\":2500}]', '{\"currency\":\"BRL\",\"value\":5}', '2024-06-10 21:48:20', '2024-06-10 21:48:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games`
--

CREATE TABLE `ggr_games` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `game` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `aggregator` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `ggr_games_world_slots`
--

CREATE TABLE `ggr_games_world_slots` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `provider` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `game` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `balance_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_win` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BRL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `likes`
--

CREATE TABLE `likes` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `liked_user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0000_00_00_000000_create_websockets_statistics_entries_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(15, '2023_10_30_034921_create_settings_table', 6),
(7, '2023_11_03_205251_create_sport_categories_table', 1),
(8, '2023_11_03_205252_create_sports_table', 1),
(10, '2023_11_04_001342_create_sport_events_table', 2),
(11, '2023_11_04_213841_add_fields_to_users_table', 3),
(12, '2023_11_07_202919_create_currencies_table', 4),
(13, '2023_11_07_210310_create_wallets_table', 5),
(16, '2023_11_07_214236_create_withdrawals_table', 7),
(17, '2023_11_07_214240_create_deposits_table', 7),
(18, '2023_11_07_214244_create_orders_table', 7),
(19, '2023_11_07_214708_create_suit_pay_payments_table', 7),
(20, '2023_11_07_215204_create_notifications_table', 8),
(21, '2023_11_07_202919_create_currency_alloweds_table', 9),
(22, '2023_11_11_205824_create_casino_categories_table', 9),
(23, '2023_11_11_205834_create_casino_providers_table', 9),
(24, '2023_11_11_205938_create_casino_games_slotgrators_table', 9),
(25, '2023_11_11_210018_create_casino_games_kscinuses_table', 9),
(26, '2023_11_12_225424_create_transactions_table', 10),
(27, '2023_11_12_225431_create_affiliate_histories_table', 10),
(28, '2023_11_12_234643_add_field_to_wallet_table', 11),
(29, '2023_11_14_203632_create_likes_table', 12),
(30, '2023_09_27_214903_create_wallet_changes_table', 13),
(31, '2023_11_16_155140_create_permission_tables', 14),
(32, '2023_11_17_012533_add_language_to_users_table', 15),
(33, '2023_11_22_171616_create_football_leagues_table', 16),
(34, '2023_11_22_175530_create_football_venues_table', 17),
(35, '2023_11_22_175547_create_football_teams_table', 17),
(36, '2023_11_23_143637_create_football_events_table', 18),
(38, '2023_11_29_134520_create_sport_bets_table', 19),
(39, '2023_11_29_135451_create_sport_bets_odds_table', 19),
(40, '2023_11_30_195548_create_gateways_table', 20),
(41, '2023_11_30_195557_create_games_keys_table', 20),
(42, '2023_11_30_195609_create_setting_mails_table', 20),
(43, '2023_10_08_111755_add_fields_to_game_exclusives_table', 20),
(44, '2023_10_07_183921_create_game_exclusives_table', 21),
(45, '2023_10_11_144956_create_system_wallets_table', 22),
(46, '2023_12_18_172721_create_banners_table', 23),
(47, '2023_12_20_135908_create_casino_games_salsas_table', 24),
(48, '2023_12_23_224032_create_fivers_providers_table', 25),
(49, '2023_12_23_224105_create_fivers_games_table', 25),
(50, '2023_12_31_121453_create_custom_layouts_table', 26),
(51, '2024_01_01_193712_create_g_g_r_games_fivers_table', 27),
(52, '2024_01_14_155144_create_missions_table', 28),
(53, '2024_01_14_155150_create_mission_users_table', 28),
(54, '2024_01_19_120728_create_ka_gamings_table', 29),
(55, '2024_01_19_170650_create_categories_table', 30),
(56, '2024_01_19_170657_create_providers_table', 30),
(57, '2024_01_19_170658_create_games_table', 31),
(58, '2023_10_07_183920_create_categories_table', 32),
(59, '2023_10_07_183921_create_providers_table', 33),
(60, '2023_10_07_183922_create_games_table', 34),
(61, '2024_01_20_144529_create_category_games_table', 35),
(62, '2024_01_20_182155_add_vibra_to_games_keys_table', 36),
(63, '2024_01_21_173742_create_game_favorites_table', 37),
(64, '2024_01_21_173752_create_game_likes_table', 37),
(65, '2024_01_21_173803_create_game_reviews_table', 37),
(66, '2024_01_11_231932_create_vibra_casino_games_table', 38),
(69, '2024_01_28_194456_add_vip_to_wallet_table', 40),
(68, '2024_01_28_194645_create_vips_table', 39),
(70, '2024_01_28_231843_create_vip_users_table', 41),
(71, '2024_01_29_102939_add_paid_to_limits_table', 41),
(72, '2024_01_10_001705_create_sub_affiliates_table', 42),
(73, '2024_01_30_120547_create_affiliate_withdraws_table', 43),
(74, '2024_02_09_233936_add_worldslot_to_games_keys_table', 44),
(75, '2024_02_10_191215_add_disable_spin_to_settings_table', 45),
(76, '2024_02_17_210822_add_games2_to_games_keys_table', 46),
(78, '2024_02_20_004853_add_sub_to_settings_table', 47),
(79, '2024_02_24_121146_add_header_to_custom_layouts_table', 48),
(80, '2024_02_26_144235_create_ggr_games_world_slots_table', 49),
(81, '2024_03_01_172613_add_evergame_to_games_keys_table', 50),
(82, '2024_03_03_201700_add_venixkey_to_games_keys_table', 51),
(83, '2024_03_08_201557_add_play_gaming_to_games_keys_table', 52),
(84, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 53),
(85, '2024_03_21_154342_add_headerbody_to_custom_layouts_table', 54),
(86, '2024_03_21_223739_add_sharkpay_to_gateways_table', 55),
(87, '2024_03_21_230017_add_reference_to_transactions_table', 56),
(88, '2024_03_24_125025_add_rollver_protection_to_settings_table', 57),
(89, '2024_03_24_134101_add_accept_bonus_to_transactions_table', 58),
(90, '2024_03_24_172243_add_receita_to_affiliate_histories_table', 59),
(91, '2024_03_26_161932_add_baseline_column_to_settings_table', 60),
(92, '2024_03_26_234226_add_playigaming_column_to_games_key_table', 61),
(93, '2024_03_25_231103_add_mercado_pago_column_to_gateways_table', 62),
(94, '2024_03_30_215051_add_social_to_custom_layouts_table', 63),
(98, '2024_03_30_225900_create_digito_pay_payments_table', 66),
(96, '2024_03_30_225929_add_digitopay_to_gateways_table', 64),
(97, '2024_03_31_124211_add_digitopay_to_settings_table', 65),
(99, '2024_04_02_140932_add_default_gateway_to_settings_table', 67),
(100, '2024_03_08_201557_add_imperium_games_to_games_keys_table', 68),
(101, '2024_04_12_201402_add_hash_to_transactions_table', 69);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missions`
--

CREATE TABLE `missions` (
  `id` bigint UNSIGNED NOT NULL,
  `challenge_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `challenge_description` text COLLATE utf8mb4_general_ci NOT NULL,
  `challenge_rules` text COLLATE utf8mb4_general_ci NOT NULL,
  `challenge_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'game',
  `challenge_link` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `challenge_start_date` datetime NOT NULL,
  `challenge_end_date` datetime NOT NULL,
  `challenge_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `challenge_total` bigint NOT NULL DEFAULT '1',
  `challenge_currency` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `challenge_provider` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `challenge_gameid` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mission_users`
--

CREATE TABLE `mission_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `mission_id` int UNSIGNED NOT NULL,
  `rounds` bigint DEFAULT '0',
  `rewards` decimal(10,2) DEFAULT '0.00',
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_general_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `session_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `game` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `game_uuid` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `type_money` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `providers` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `refunded` tinyint NOT NULL DEFAULT '0',
  `status` tinyint NOT NULL DEFAULT '0',
  `round_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(1, 1, '9c5d729d8ba3c748', 'e956a800-fe86-4ffa-9adb-f7ddab1d9dbb', '126', '126', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '9c5d729d8ba3c748', '2024-07-12 07:34:27', '2024-07-12 07:34:27'),
(2, 1, '3545538289998d0b', '4750866f-4da0-4d52-bd20-1044bab1efe1', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '3545538289998d0b', '2024-07-12 07:34:45', '2024-07-12 07:34:45'),
(3, 1, '6c8ba4b5ee433437', '3e92d2c8-6852-4511-8df3-ccd4229e6014', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '6c8ba4b5ee433437', '2024-07-12 07:34:57', '2024-07-12 07:34:57'),
(4, 1, 'b64cd3fa5e6af223', '059cbb43-37e8-4126-a413-5e9137e67a8d', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'b64cd3fa5e6af223', '2024-07-12 07:34:58', '2024-07-12 07:34:58'),
(5, 1, 'a4757f334a5846c9', 'fc47a414-a060-4aa1-9f0b-708b3d7ccca4', '126', '126', 'win', 'balance_bonus', 0.88, 'play_fiver', 0, 1, 'a4757f334a5846c9', '2024-07-12 07:35:00', '2024-07-12 07:35:00'),
(6, 1, '6b9e3fa78aa9c422', 'ada29656-fc7d-41e9-b7f1-b572ac3b76c5', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6b9e3fa78aa9c422', '2024-07-12 07:35:14', '2024-07-12 07:35:14'),
(7, 1, '95a4b8731bcbc15a', 'bab71209-267a-49e2-8c67-779a552274b8', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '95a4b8731bcbc15a', '2024-07-12 07:35:21', '2024-07-12 07:35:21'),
(8, 1, '670204c3a1785b94', '21a642d4-409a-4b8d-a6b6-a4cf72b2f07a', '126', '126', 'win', 'balance_bonus', 0.48, 'play_fiver', 0, 1, '670204c3a1785b94', '2024-07-12 07:35:24', '2024-07-12 07:35:24'),
(9, 1, 'e5addaa4cad294e2', '28874bbc-8971-4917-9c87-6e1580c96964', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'e5addaa4cad294e2', '2024-07-12 07:43:14', '2024-07-12 07:43:14'),
(10, 1, '1578b8eb02b1fe60', 'bc9a8c65-a275-4742-9190-1e620eedfd57', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '1578b8eb02b1fe60', '2024-07-12 07:43:25', '2024-07-12 07:43:25'),
(11, 1, '3fdeb36a691e3196', 'c99b3f5d-2900-41e9-a4c1-f761702fe9ee', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '3fdeb36a691e3196', '2024-07-12 07:43:28', '2024-07-12 07:43:28'),
(12, 1, '8e98485efa7e3305', '9423f770-05b2-429c-a048-d1f30d41f0de', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '8e98485efa7e3305', '2024-07-12 07:48:41', '2024-07-12 07:48:41'),
(13, 1, '36bb034a67fc5bd3', 'f03be1d5-6737-402e-b13b-cd37103db52f', '126', '126', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '36bb034a67fc5bd3', '2024-07-12 07:48:46', '2024-07-12 07:48:46'),
(14, 1, 'dad4bd5170223895', '5f940038-aaff-41ae-9a92-021308d13704', '126', '126', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, 'dad4bd5170223895', '2024-07-12 07:48:47', '2024-07-12 07:48:47'),
(15, 1, 'c89a1926a394a50b', 'c4418224-6d73-4f78-b6c4-4c2397880c48', '126', '126', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, 'c89a1926a394a50b', '2024-07-12 08:02:54', '2024-07-12 08:02:54'),
(16, 1, '78e74362b355480d', 'a999b299-3aaa-4bde-9f6f-733705dad16c', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '78e74362b355480d', '2024-07-12 08:02:57', '2024-07-12 08:02:57'),
(17, 1, '9436de691c101f32', 'd2ced1a3-1404-4f59-96b5-f48fc7b283c4', '126', '126', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '9436de691c101f32', '2024-07-12 08:02:58', '2024-07-12 08:02:58'),
(18, 272, '5e49205e5ab7f337', '534aa6f2-0b38-42da-9996-8d2603e8de17', '126', '126', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '5e49205e5ab7f337', '2024-07-12 08:10:17', '2024-07-12 08:10:17'),
(19, 272, '81cad852aa75700e', 'a49fb0ed-1132-459f-838f-c7c4a598a395', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '81cad852aa75700e', '2024-07-12 08:10:20', '2024-07-12 08:10:20'),
(20, 272, '78e679e85af92725', '5b66155e-fcc4-45e9-9537-f151c3fec23b', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '78e679e85af92725', '2024-07-12 08:10:23', '2024-07-12 08:10:23'),
(21, 272, '8ca75a2d7d42b0a8', 'f5f474cd-aff2-4119-8b47-a8e4f8c661ae', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '8ca75a2d7d42b0a8', '2024-07-12 08:10:24', '2024-07-12 08:10:24'),
(22, 272, 'ce36d1c5b97e4662', '85d3e238-23f0-4f2c-940e-789857653552', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ce36d1c5b97e4662', '2024-07-12 08:10:26', '2024-07-12 08:10:26'),
(23, 272, 'f0656fd9c20b1a8d', 'b0c16048-0e14-4808-b0e3-bfe32e02c6ae', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'f0656fd9c20b1a8d', '2024-07-12 08:10:27', '2024-07-12 08:10:27'),
(24, 272, '6b5339d27e6d5e52', '79d5922c-02f1-4d4e-b9dc-492dd113ee1e', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '6b5339d27e6d5e52', '2024-07-12 08:10:28', '2024-07-12 08:10:28'),
(25, 272, 'eab46be776c21237', '7bf3546b-d52a-4c99-8ed8-8fc22afc6d58', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'eab46be776c21237', '2024-07-12 08:10:30', '2024-07-12 08:10:30'),
(26, 272, '8d5a297764e80f30', '24a43bca-de7a-4a76-bbf9-1b5e27a8935b', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '8d5a297764e80f30', '2024-07-12 08:10:31', '2024-07-12 08:10:31'),
(27, 272, '2b4c5c24e91d735b', '3c64160a-154c-497e-a678-834a4027cca0', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '2b4c5c24e91d735b', '2024-07-12 08:10:32', '2024-07-12 08:10:32'),
(28, 272, 'bebbb6fe577af8b6', '0406abbb-ef91-4b4d-b58f-b8fbcf1dcd7e', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'bebbb6fe577af8b6', '2024-07-12 08:10:34', '2024-07-12 08:10:34'),
(29, 272, 'c7edb2c6ee36181a', '0c492b69-99a1-46fe-ae35-8a119ed107d0', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'c7edb2c6ee36181a', '2024-07-12 08:10:35', '2024-07-12 08:10:35'),
(30, 272, 'e63f42b6ae580b74', '9dcc08af-a81a-4325-aa8f-e5f3e7ac4af6', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'e63f42b6ae580b74', '2024-07-12 08:10:39', '2024-07-12 08:10:39'),
(31, 272, '067ac44d36d34181', '18e03ac9-e404-4183-8142-78f3e091ef4f', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '067ac44d36d34181', '2024-07-12 08:10:40', '2024-07-12 08:10:40'),
(32, 272, '1572b52d25fc7bab', '6956801e-2a02-43e2-a7c5-cb2c13767909', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1572b52d25fc7bab', '2024-07-12 08:10:41', '2024-07-12 08:10:41'),
(33, 272, '8edfdfe4a9268878', 'c6cf8eec-191e-46ae-bf0c-78afa64a9b5c', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '8edfdfe4a9268878', '2024-07-12 08:10:42', '2024-07-12 08:10:42'),
(34, 272, '12a15f981d4ad5ba', '31767acb-f198-4ba1-a8bb-12acabe54de2', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '12a15f981d4ad5ba', '2024-07-12 08:10:43', '2024-07-12 08:10:43'),
(35, 272, 'ad8ce182c805600e', 'ac6c8072-0104-4319-bab0-e4055efdccb7', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ad8ce182c805600e', '2024-07-12 08:10:44', '2024-07-12 08:10:44'),
(36, 272, '64dcc2dfb0dbdf61', '3dd02f51-f011-426e-bd4b-ae82ac27be80', '126', '126', 'win', 'balance', 6.00, 'play_fiver', 0, 1, '64dcc2dfb0dbdf61', '2024-07-12 08:10:45', '2024-07-12 08:10:45'),
(37, 272, '8baf96d9388df21d', 'dd6a7ef8-874f-483f-8ba6-2c0661a9b42d', '126', '126', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8baf96d9388df21d', '2024-07-12 08:10:48', '2024-07-12 08:10:48'),
(38, 272, '5a6f61ab8ca82a2a', 'bdaaf74d-6ec1-4ffe-806f-48f5f736aa3d', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '5a6f61ab8ca82a2a', '2024-07-12 08:10:50', '2024-07-12 08:10:50'),
(39, 272, 'cd4906207b15d282', 'e4280b9b-2135-4541-916a-b12ed76912d3', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'cd4906207b15d282', '2024-07-12 08:10:51', '2024-07-12 08:10:51'),
(40, 272, '37a904cf999a4278', 'c6e1de51-b0d8-4cf9-9a23-f8eb489e9505', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '37a904cf999a4278', '2024-07-12 08:10:52', '2024-07-12 08:10:52'),
(41, 272, '6f23eb6564d70897', '4f542bde-7658-4f29-a10c-1bc06b8dad33', '126', '126', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '6f23eb6564d70897', '2024-07-12 08:10:53', '2024-07-12 08:10:53'),
(42, 272, '359ec2f98a48973e', '85ad6ca8-8d36-4237-ac89-5fbf75bc5ff8', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '359ec2f98a48973e', '2024-07-12 08:10:54', '2024-07-12 08:10:54'),
(43, 272, '54c6472b7ac6bab9', 'dd624afd-9dbf-4dbd-8ab2-4ebefd8a42b2', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '54c6472b7ac6bab9', '2024-07-12 08:10:55', '2024-07-12 08:10:55'),
(44, 272, '2e38f06645fb4738', '1c24e667-0215-428e-ab2b-5ac712246c62', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '2e38f06645fb4738', '2024-07-12 08:10:56', '2024-07-12 08:10:56'),
(45, 272, 'b08f25baf6168001', 'bd32ba70-fe99-4c80-8cf0-71589f53bf6d', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'b08f25baf6168001', '2024-07-12 08:10:57', '2024-07-12 08:10:57'),
(46, 272, '1b012136be2e38ac', '2d7625f9-6254-422b-a88c-10801cb98e38', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1b012136be2e38ac', '2024-07-12 08:10:58', '2024-07-12 08:10:58'),
(47, 272, '33d3266264fd853e', 'a165cc6b-9279-4c40-957e-07461718947a', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '33d3266264fd853e', '2024-07-12 08:10:59', '2024-07-12 08:10:59'),
(48, 272, 'a06c7285712ccd2d', '2654402c-d116-48f7-b8ca-cce7adc3d1e3', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'a06c7285712ccd2d', '2024-07-12 08:11:00', '2024-07-12 08:11:00'),
(49, 272, '240684fd11bfadb6', '6da2faf8-9825-4893-b9a0-89a2bba78719', '126', '126', 'win', 'balance', 4.00, 'play_fiver', 0, 1, '240684fd11bfadb6', '2024-07-12 08:11:01', '2024-07-12 08:11:01'),
(50, 272, '790689658b75067e', '212e75a9-5672-42f4-b9eb-663f17dab281', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '790689658b75067e', '2024-07-12 08:11:03', '2024-07-12 08:11:03'),
(51, 272, '2f8f23936fe090e4', '11c88b3c-9fd3-42ae-b451-624652c9bc8f', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '2f8f23936fe090e4', '2024-07-12 08:11:04', '2024-07-12 08:11:04'),
(52, 272, 'bb267feba210643d', 'fcfe46f8-57db-41e6-894e-7f81c867b7d4', '126', '126', 'win', 'balance', 2.00, 'play_fiver', 0, 1, 'bb267feba210643d', '2024-07-12 08:11:05', '2024-07-12 08:11:05'),
(53, 272, 'a6498807b5dffa44', 'd33d1c88-25e9-4fc5-b152-0bea77a3fe95', '126', '126', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, 'a6498807b5dffa44', '2024-07-12 08:11:07', '2024-07-12 08:11:07'),
(54, 272, '2edb0ef4098a5a77', 'd9e74664-77bd-4b8f-8cd1-4e99c08a7172', '126', '126', 'bet', 'balance', 2.00, 'play_fiver', 0, 1, '2edb0ef4098a5a77', '2024-07-12 08:11:08', '2024-07-12 08:11:08'),
(55, 272, '4c08c31cd7249e91', 'e0622afa-408b-41bd-8c91-e16b88e5088b', '126', '126', 'bet', 'balance', 2.00, 'play_fiver', 0, 1, '4c08c31cd7249e91', '2024-07-12 08:11:10', '2024-07-12 08:11:10'),
(56, 272, '023d2e4b02e577c3', 'c4c8c2fe-1037-4a8f-90a6-4881d4328229', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, '023d2e4b02e577c3', '2024-07-12 08:11:11', '2024-07-12 08:11:11'),
(57, 272, 'd9412aa548a987ee', 'fc7d0874-e69c-4f95-8d49-e74045569db2', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, 'd9412aa548a987ee', '2024-07-12 08:11:12', '2024-07-12 08:11:12'),
(58, 272, 'ee19384549039a99', '6e9bf1a4-b314-4e76-9342-0af586bb70e2', '126', '126', 'bet', 'balance', 4.00, 'play_fiver', 0, 1, 'ee19384549039a99', '2024-07-12 08:11:14', '2024-07-12 08:11:14'),
(59, 272, '1674cd02ea594d2b', '9f6cb017-80d1-4920-b36a-cf62b5315b99', '126', '126', 'bet', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '1674cd02ea594d2b', '2024-07-12 08:11:15', '2024-07-12 08:11:15'),
(60, 272, 'e19c5df5c2c75fb9', 'd6d64bfa-6e4a-42a3-b4d0-6d6dce04e84a', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, 'e19c5df5c2c75fb9', '2024-07-12 08:11:16', '2024-07-12 08:11:16'),
(61, 272, '9fe335e66f80c522', '375ff8c4-67de-4403-8058-d1cd3d44412c', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '9fe335e66f80c522', '2024-07-12 08:11:17', '2024-07-12 08:11:17'),
(62, 272, 'c9a8db4fcab24d1c', '46c753e6-4779-4fdd-ae32-9ac79dae3af7', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, 'c9a8db4fcab24d1c', '2024-07-12 08:11:18', '2024-07-12 08:11:18'),
(63, 272, '42479c2d80b17485', '62c0cc07-4b76-4acf-847f-08e780cc10dd', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '42479c2d80b17485', '2024-07-12 08:11:19', '2024-07-12 08:11:19'),
(64, 272, 'dbbde5c9a09b0490', 'f705648b-3a08-4d44-b77c-8ac478f8046d', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, 'dbbde5c9a09b0490', '2024-07-12 08:11:20', '2024-07-12 08:11:20'),
(65, 272, 'ac158108f7d07052', '644addcb-e649-4574-8b71-115b7edc5e3a', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, 'ac158108f7d07052', '2024-07-12 08:11:22', '2024-07-12 08:11:22'),
(66, 272, '38be2950034544d8', '9f8314da-1d07-4045-871c-0ed52a9b2976', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '38be2950034544d8', '2024-07-12 08:11:23', '2024-07-12 08:11:23'),
(67, 272, '95c5bad74e9e228e', '6fbb6751-2ab7-4711-835b-7ad3330da5dc', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '95c5bad74e9e228e', '2024-07-12 08:11:24', '2024-07-12 08:11:24'),
(68, 272, '7225dbcde2f9af8a', '70249525-0844-42ce-aa6d-127fc8e66c82', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '7225dbcde2f9af8a', '2024-07-12 08:11:25', '2024-07-12 08:11:25'),
(69, 272, '0fbd963ed25ebe7b', 'c231253b-9e8e-466a-95bd-9677a91738fa', '126', '126', 'bet', 'balance', 0.80, 'play_fiver', 0, 1, '0fbd963ed25ebe7b', '2024-07-12 08:11:26', '2024-07-12 08:11:26'),
(70, 272, '851e4d6c34aaf52a', '6f52bb5c-8a94-44c1-90c3-fbdae0124807', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '851e4d6c34aaf52a', '2024-07-12 08:11:30', '2024-07-12 08:11:30'),
(71, 272, '1e9c512ab105be85', '3cdda04d-2271-498e-9fe6-5dea4ae8a849', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1e9c512ab105be85', '2024-07-12 08:11:31', '2024-07-12 08:11:31'),
(72, 272, '1ec68459fca245ae', 'f7dccb9a-f1cc-4b11-bbd3-3ea872613019', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1ec68459fca245ae', '2024-07-12 08:11:32', '2024-07-12 08:11:32'),
(73, 272, 'db44b721f946f4fa', '31787db0-4d5b-4502-a836-fb4a44882bc5', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'db44b721f946f4fa', '2024-07-12 08:11:36', '2024-07-12 08:11:36'),
(74, 272, '376f1e4bc747d8f9', '0f5a8114-ed5c-4a0f-8303-1e1b262dc28a', '126', '126', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '376f1e4bc747d8f9', '2024-07-12 08:11:37', '2024-07-12 08:11:37'),
(75, 272, '5b0cb2467490a351', 'c8d28a85-aec5-4949-a9c1-c503ac88ce57', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '5b0cb2467490a351', '2024-07-12 08:12:04', '2024-07-12 08:12:04'),
(76, 272, '17d287819692e8a8', '26567652-c1d0-4221-8ea9-27716eda3b39', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '17d287819692e8a8', '2024-07-12 08:12:07', '2024-07-12 08:12:07'),
(77, 272, '14f1285d39c2381e', '9d866899-0418-49a6-a30c-e2fb9dbaf7d1', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '14f1285d39c2381e', '2024-07-12 08:12:08', '2024-07-12 08:12:08'),
(78, 272, '06acafbe4a8ba98b', '413c0957-ee75-4c7f-b8d2-8c2d64f95e4c', '1543462', '1543462', 'win', 'balance', 0.16, 'play_fiver', 0, 1, '06acafbe4a8ba98b', '2024-07-12 08:12:09', '2024-07-12 08:12:09'),
(79, 272, '204dd74a826cf487', '25cb1904-714b-4667-a917-a75c21870336', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '204dd74a826cf487', '2024-07-12 08:12:11', '2024-07-12 08:12:11'),
(80, 272, 'b768ad66944c7533', 'aa52ebd3-7423-4a6a-9705-e54dded88a78', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'b768ad66944c7533', '2024-07-12 08:12:12', '2024-07-12 08:12:12'),
(81, 272, '3a8d0dd0cf7ed96b', '64837641-cfae-46e0-8ec3-5bb3488bcdb4', '1543462', '1543462', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '3a8d0dd0cf7ed96b', '2024-07-12 08:12:13', '2024-07-12 08:12:13'),
(82, 272, 'a9e18a7144ad04e9', '91ae83af-cd4c-44f3-a4b1-f3ddec65ef76', '1543462', '1543462', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a9e18a7144ad04e9', '2024-07-12 08:12:15', '2024-07-12 08:12:15'),
(83, 272, 'a228aa1857a25f09', '8501ccd3-0519-4985-ac07-a836ae6e02e0', '1543462', '1543462', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a228aa1857a25f09', '2024-07-12 08:12:17', '2024-07-12 08:12:17'),
(84, 272, 'b85df0b88644c7b7', 'ce7d4d0e-e514-4872-9e4d-b4328442c41f', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b85df0b88644c7b7', '2024-07-12 08:12:19', '2024-07-12 08:12:19'),
(85, 272, '53bbe48ec8673503', 'e011303c-bc46-481d-bf39-af0399c648fe', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '53bbe48ec8673503', '2024-07-12 08:12:21', '2024-07-12 08:12:21'),
(86, 272, '7c7328f9cbe2ff1d', '6da8ee14-d5fa-40be-8d89-db0fdfb42c14', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '7c7328f9cbe2ff1d', '2024-07-12 08:12:22', '2024-07-12 08:12:22'),
(87, 272, '677349821aabe256', '1d810f91-c018-402c-88ef-ba8372187284', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '677349821aabe256', '2024-07-12 08:12:23', '2024-07-12 08:12:23'),
(88, 272, 'dc4df057e8b62542', '4f20612c-1bd8-4d8e-b037-86fea4287f83', '1543462', '1543462', 'win', 'balance', 1.44, 'play_fiver', 0, 1, 'dc4df057e8b62542', '2024-07-12 08:12:24', '2024-07-12 08:12:24'),
(89, 272, '69099869329e6893', '0ff2a6ef-1138-409b-98fd-1bfd9d4caa97', '1543462', '1543462', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '69099869329e6893', '2024-07-12 08:12:26', '2024-07-12 08:12:26'),
(90, 272, 'c0b564a1a7f1814a', '1b8bb070-e7d8-41e4-bd45-e1dd8efbd112', '1543462', '1543462', 'win', 'balance', 0.96, 'play_fiver', 0, 1, 'c0b564a1a7f1814a', '2024-07-12 08:12:27', '2024-07-12 08:12:27'),
(91, 272, '362cfe2241ca1566', 'c88b44a4-a3ab-49ca-b036-41122c0c8ac5', '1543462', '1543462', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '362cfe2241ca1566', '2024-07-12 08:12:30', '2024-07-12 08:12:30'),
(92, 272, '54cfd0d28417bf83', 'ed6ddda5-f456-4a58-8164-a1e4a187c099', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '54cfd0d28417bf83', '2024-07-12 08:12:32', '2024-07-12 08:12:32'),
(93, 272, '72a6714830600fa5', '6e14819e-598f-418e-9ccf-5d10fa255024', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '72a6714830600fa5', '2024-07-12 08:12:34', '2024-07-12 08:12:34'),
(94, 272, 'f93b8e083c9cb793', '8f181cf9-9dde-4352-b980-dbed82c657a1', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'f93b8e083c9cb793', '2024-07-12 08:12:35', '2024-07-12 08:12:35'),
(95, 272, 'e975690e2f5b95af', '44b7af14-b7e2-47fb-a5d4-6e9a955e7901', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'e975690e2f5b95af', '2024-07-12 08:12:35', '2024-07-12 08:12:35'),
(96, 272, '86866e159b4c422f', '9a8ab3fe-0d0d-4c34-bc05-85c2500feff2', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '86866e159b4c422f', '2024-07-12 08:12:36', '2024-07-12 08:12:36'),
(97, 272, '04d3e4c13f4c5c4d', '9315a627-16d9-4c6e-9a3d-d3bf8d630ff8', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '04d3e4c13f4c5c4d', '2024-07-12 08:12:37', '2024-07-12 08:12:37'),
(98, 272, '3dc5e8e8082be7fb', '7183a81e-62db-42af-b320-209c07f15f78', '1543462', '1543462', 'win', 'balance', 0.96, 'play_fiver', 0, 1, '3dc5e8e8082be7fb', '2024-07-12 08:12:38', '2024-07-12 08:12:38'),
(99, 272, '9734b5203f721645', '61568743-812f-42d0-a3f7-8bc7730e0d78', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '9734b5203f721645', '2024-07-12 08:12:40', '2024-07-12 08:12:40'),
(100, 272, 'f7ba1eda77ca4d7c', '101a5b08-44d6-40a0-899b-c758f343f63a', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'f7ba1eda77ca4d7c', '2024-07-12 08:12:42', '2024-07-12 08:12:42'),
(101, 272, '9210a1b76e527619', '2d58b9b8-d337-442c-8539-5eb963767fdd', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '9210a1b76e527619', '2024-07-12 08:12:43', '2024-07-12 08:12:43'),
(102, 272, '0c0b9b193bb76dc6', 'd1d8a0b5-bc92-49f0-8b6d-ab75671c1be9', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '0c0b9b193bb76dc6', '2024-07-12 08:12:44', '2024-07-12 08:12:44'),
(103, 272, '811d0d9c7f4fbfbb', '05b42159-484c-40c2-9b6b-726cbda0ab60', '1543462', '1543462', 'win', 'balance', 1.44, 'play_fiver', 0, 1, '811d0d9c7f4fbfbb', '2024-07-12 08:12:45', '2024-07-12 08:12:45'),
(104, 272, '9f09feb189b0f451', '1e30ddbb-1c92-46b0-b35d-b60fc6fc8086', '1543462', '1543462', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '9f09feb189b0f451', '2024-07-12 08:12:47', '2024-07-12 08:12:47'),
(105, 272, 'fdddab499c3bcf68', 'bbc90de3-7c14-4d2a-a353-71fd7f07d135', '1543462', '1543462', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'fdddab499c3bcf68', '2024-07-12 08:12:48', '2024-07-12 08:12:48'),
(106, 272, '1ba099ffb01d921b', '4201b704-c589-4503-85f7-4dc1095da4a6', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1ba099ffb01d921b', '2024-07-12 08:12:49', '2024-07-12 08:12:49'),
(107, 272, '48b1f5d8f302828b', '8abe76f6-3594-4069-a003-887129cef8e6', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '48b1f5d8f302828b', '2024-07-12 08:12:50', '2024-07-12 08:12:50'),
(108, 272, '2619b4bcfc770614', 'b24d2104-35ac-4ce4-be45-628a31abcdb5', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '2619b4bcfc770614', '2024-07-12 08:12:52', '2024-07-12 08:12:52'),
(109, 272, 'fa8348f01c32a682', '38520e40-ef9a-4bae-9dc5-da35976bc5f6', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'fa8348f01c32a682', '2024-07-12 08:12:53', '2024-07-12 08:12:53'),
(110, 272, '4f090bb53b08e977', '4145bea8-9151-49a2-b547-8349832067c9', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '4f090bb53b08e977', '2024-07-12 08:12:54', '2024-07-12 08:12:54'),
(111, 272, 'fb6e61f15d77bf1f', '4c8ec022-9564-4f15-b700-513dfa1515f0', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'fb6e61f15d77bf1f', '2024-07-12 08:12:55', '2024-07-12 08:12:55'),
(112, 272, '457449dd9b23bb3b', 'ccd66f49-1579-4360-bca8-30566f5d28f8', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '457449dd9b23bb3b', '2024-07-12 08:12:56', '2024-07-12 08:12:56'),
(113, 272, '88ab967095db6cf6', '6045ddfd-a882-4c85-923d-51a2f2561b53', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '88ab967095db6cf6', '2024-07-12 08:12:58', '2024-07-12 08:12:58'),
(114, 272, '1ff0c6219aa525fa', 'da16d651-80e5-4f9f-9200-7e6c6c0f3cb2', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '1ff0c6219aa525fa', '2024-07-12 08:12:59', '2024-07-12 08:12:59'),
(115, 272, 'bf0a72d48f6d045d', '91612f1c-b0f0-4c06-a88c-11ebb62ed7a8', '1543462', '1543462', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'bf0a72d48f6d045d', '2024-07-12 08:13:00', '2024-07-12 08:13:00'),
(116, 272, '9bdfab2efd63f6dc', '9fd6d774-e2b4-4744-b76d-5dd83101088d', '1695365', '1695365', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '9bdfab2efd63f6dc', '2024-07-12 08:14:06', '2024-07-12 08:14:06'),
(117, 272, '0cdfe10ffd90110f', '5cb6bebe-0f46-4270-a328-748f97fef4ad', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '0cdfe10ffd90110f', '2024-07-12 08:14:11', '2024-07-12 08:14:11'),
(118, 272, 'ef21b75a0905e8e8', 'bdc12a3b-4d6a-4dd2-86c9-fa3bf4e16043', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'ef21b75a0905e8e8', '2024-07-12 08:14:13', '2024-07-12 08:14:13'),
(119, 272, '6f97f58f4ef8c28f', '37b72b3b-1c32-42c7-9e1a-24932ed0f638', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6f97f58f4ef8c28f', '2024-07-12 08:14:16', '2024-07-12 08:14:16'),
(120, 272, '633f08d98f15d871', '063fa215-2720-4342-a0ae-d525b2ef02ea', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '633f08d98f15d871', '2024-07-12 08:14:18', '2024-07-12 08:14:18'),
(121, 272, '94a600c6bfcc0b1f', 'f38455b3-5266-46a0-a2d9-666b2978458d', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '94a600c6bfcc0b1f', '2024-07-12 08:14:23', '2024-07-12 08:14:23'),
(122, 272, '9ddd154af1bc9118', '3614b6f6-a5c3-4c76-855a-436235b0d47a', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '9ddd154af1bc9118', '2024-07-12 08:14:24', '2024-07-12 08:14:24'),
(123, 1, '315cd36c2d8ba938', '71f7c720-a490-4b43-b8cf-fb63040a0578', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '315cd36c2d8ba938', '2024-07-12 13:47:15', '2024-07-12 13:47:15'),
(124, 1, '788f33c345852e17', '35155b03-98ea-483b-aaa3-45f1836398cf', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '788f33c345852e17', '2024-07-12 13:47:17', '2024-07-12 13:47:17'),
(125, 1, 'e2b57d77a85d7c31', 'a98115a3-6f24-4db9-bab3-8eb92169b718', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'e2b57d77a85d7c31', '2024-07-12 13:47:20', '2024-07-12 13:47:20'),
(126, 1, 'ef9e4a7459f69f2f', '742fe48e-b1af-44f2-8dfa-3577956f4c73', '1543462', '1543462', 'win', 'balance_bonus', 1.20, 'play_fiver', 0, 1, 'ef9e4a7459f69f2f', '2024-07-12 13:47:22', '2024-07-12 13:47:22'),
(127, 1, '480ec927c4331dc0', 'e2cae55a-6435-4a98-8d2f-f18e15614e43', '1543462', '1543462', 'win', 'balance_withdrawal', 5.00, 'play_fiver', 0, 1, '480ec927c4331dc0', '2024-07-12 13:47:26', '2024-07-12 13:47:26'),
(128, 1, '227866b95709d539', 'e2cae55a-6435-4a98-8d2f-f18e15614e43', '1543462', '1543462', 'win', 'balance', 5.00, 'play_fiver', 0, 1, '227866b95709d539', '2024-07-12 13:47:26', '2024-07-12 13:47:26'),
(129, 1, '123abec56756c4be', 'dabea592-adbe-4480-8d24-5b2f5a60aab3', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '123abec56756c4be', '2024-07-12 14:46:06', '2024-07-12 14:46:06'),
(130, 1, '674e1bd8abe00c78', '54774d00-6074-435d-a674-593a52a91db1', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '674e1bd8abe00c78', '2024-07-12 14:46:07', '2024-07-12 14:46:07'),
(131, 1, '8aa0688d87854cff', '9316b8b1-11f1-4f09-a246-0e4331d28912', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '8aa0688d87854cff', '2024-07-12 14:46:08', '2024-07-12 14:46:08'),
(132, 1, 'adff6df56395569b', 'f8237a9e-f806-40bd-af80-ce85bd1d0b9a', '1543462', '1543462', 'win', 'balance', 8.80, 'play_fiver', 0, 1, 'adff6df56395569b', '2024-07-12 15:28:24', '2024-07-12 15:28:24'),
(133, 1, '91a682893f543b1f', '4ef83a79-8050-4de1-8351-4bcd2cef720a', '1543462', '1543462', 'win', 'balance', 6.60, 'play_fiver', 0, 1, '91a682893f543b1f', '2024-07-12 15:28:35', '2024-07-12 15:28:35'),
(134, 1, '888f4b9938fa550e', '45d33d5c-93ee-48f5-bbb3-3b645e2101a9', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '888f4b9938fa550e', '2024-07-12 15:31:43', '2024-07-12 15:31:43'),
(135, 1, '5926d269c35d3575', '513215ea-9a18-4ba2-9383-2e49601eaee0', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '5926d269c35d3575', '2024-07-12 15:31:46', '2024-07-12 15:31:46'),
(136, 1, '0d1ae97d98937df2', 'dc49fe5c-1d7a-4e2d-b25f-713cecd17443', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '0d1ae97d98937df2', '2024-07-12 15:31:47', '2024-07-12 15:31:47'),
(137, 1, 'f43dc6102c81d44e', 'f1ae217b-7a7e-406f-9ced-b9a50751f1ea', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'f43dc6102c81d44e', '2024-07-12 15:31:51', '2024-07-12 15:31:51'),
(138, 1, '608ff33d57b815a0', '99f3739f-ee66-4c90-89a3-33f86b5413e6', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '608ff33d57b815a0', '2024-07-12 15:31:53', '2024-07-12 15:31:53'),
(139, 1, 'f546464dd3c15c1c', '319df072-4c04-4592-a2f7-7b9c731123be', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'f546464dd3c15c1c', '2024-07-12 15:31:56', '2024-07-12 15:31:56'),
(140, 1, '406aaaf2d0ed2fe0', 'c77ca22a-e14e-4dda-b2dd-dd148cd33bcf', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '406aaaf2d0ed2fe0', '2024-07-12 15:32:02', '2024-07-12 15:32:02'),
(141, 1, '5e06a837711be8a1', 'd1453c00-f547-4e8f-8baa-4bd53ddfc129', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '5e06a837711be8a1', '2024-07-12 15:32:03', '2024-07-12 15:32:03'),
(142, 1, 'ef23a6eadf5b3dc4', 'c7b5baab-4601-43ce-800d-4caf1b0a28f5', '1695365', '1695365', 'win', 'balance', 4.80, 'play_fiver', 0, 1, 'ef23a6eadf5b3dc4', '2024-07-12 15:32:12', '2024-07-12 15:32:12'),
(143, 1, '431dd1c9f51cba64', '75f2f979-39e2-4875-8b7e-f4a64fdb21d7', '1695365', '1695365', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '431dd1c9f51cba64', '2024-07-12 15:32:19', '2024-07-12 15:32:19'),
(144, 1, '5f47f55420bb9e63', 'f85c5021-f392-4a77-8eda-1a712fb8499e', '1695365', '1695365', 'win', 'balance', 8.64, 'play_fiver', 0, 1, '5f47f55420bb9e63', '2024-07-12 15:32:32', '2024-07-12 15:32:32'),
(145, 1, '7ed2c82df9fa156c', 'b7c8ca5c-1be9-4bd3-9a97-1e63ca06ec5f', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '7ed2c82df9fa156c', '2024-07-12 15:32:47', '2024-07-12 15:32:47'),
(146, 1, '3275c39595ff767a', '7cf09586-7298-45f0-b7a2-75bde6462572', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '3275c39595ff767a', '2024-07-12 15:32:49', '2024-07-12 15:32:49'),
(147, 1, '8ec6833f4632a1ef', 'fc108417-c7db-4b3f-bb1e-687e4e789bb6', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '8ec6833f4632a1ef', '2024-07-12 15:32:52', '2024-07-12 15:32:52'),
(148, 1, 'b2bb79eb92c28909', '3e7c6279-e0ab-4f8a-9d64-62e00d330264', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b2bb79eb92c28909', '2024-07-12 15:32:54', '2024-07-12 15:32:54'),
(149, 1, '1ea01d09e9ff0eb3', 'f618087e-9df4-4a07-b552-3c1d272b8f10', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '1ea01d09e9ff0eb3', '2024-07-12 15:32:56', '2024-07-12 15:32:56'),
(150, 1, 'a1dd1a3b6f005147', 'a6ef5433-a458-4000-9696-6a335d054693', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a1dd1a3b6f005147', '2024-07-12 15:33:08', '2024-07-12 15:33:08'),
(151, 1, '30583412ffaab061', '793204a0-f65b-4dc2-83d1-c2a5e8584c22', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '30583412ffaab061', '2024-07-12 15:33:09', '2024-07-12 15:33:09'),
(152, 1, 'fd5ba3503150b105', '43bd6bb3-dfcd-4965-b71a-edcbac958b01', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'fd5ba3503150b105', '2024-07-12 15:33:10', '2024-07-12 15:33:10'),
(153, 1, '080e29d1d044d808', '4f0724cc-10e1-4af3-8881-8c5819fe6610', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '080e29d1d044d808', '2024-07-12 15:33:11', '2024-07-12 15:33:11'),
(154, 1, '96d74ce3a2fe4f80', 'ada072de-31a6-4d19-a1c4-3132f10c4c47', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '96d74ce3a2fe4f80', '2024-07-12 15:33:12', '2024-07-12 15:33:12'),
(155, 1, 'fa33e0d0b291c043', '0631a28f-a7fe-4819-8011-43f574390a6e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'fa33e0d0b291c043', '2024-07-12 15:33:14', '2024-07-12 15:33:14'),
(156, 1, '03233d94c9a99863', '3f2572ea-a555-4963-b8f4-9e6e20d32c46', '1695365', '1695365', 'win', 'balance_withdrawal', 0.16, 'play_fiver', 0, 1, '03233d94c9a99863', '2024-07-12 15:33:15', '2024-07-12 15:33:15'),
(157, 1, 'eca02a403afe9bb7', '02433070-edb8-49a3-8546-5131d5eef685', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'eca02a403afe9bb7', '2024-07-12 15:33:16', '2024-07-12 15:33:16'),
(158, 1, 'd6289e59334531b5', 'feae4dcf-cf13-4d07-b042-dfbd39331e10', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'd6289e59334531b5', '2024-07-12 15:33:18', '2024-07-12 15:33:18'),
(159, 1, '248ca358c822c88c', 'acf31c9c-07b0-4b1e-ab0b-6a84c8a96b5f', '1695365', '1695365', 'win', 'balance_withdrawal', 10.00, 'play_fiver', 0, 1, '248ca358c822c88c', '2024-07-12 15:33:19', '2024-07-12 15:33:19'),
(160, 1, '79b2d9cc82797427', '0b432561-4f3f-4d10-9ff6-e8f7af8ddbce', '98', '98', 'win', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '79b2d9cc82797427', '2024-07-12 15:34:49', '2024-07-12 15:34:49'),
(161, 1, '03f217546ffc261a', 'ab400651-2708-487b-ad2a-a7697de58737', '98', '98', 'win', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '03f217546ffc261a', '2024-07-12 15:35:07', '2024-07-12 15:35:07'),
(162, 1, '17be6ba3f6df0038', '42175b6c-740a-4a62-9b15-4355d6a19f1b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '17be6ba3f6df0038', '2024-07-12 15:37:39', '2024-07-12 15:37:39'),
(163, 1, 'f4cd4637f633161c', '334ca158-0983-4189-9abc-d954cd3fdeb2', '1695365', '1695365', 'win', 'balance', 3.20, 'play_fiver', 0, 1, 'f4cd4637f633161c', '2024-07-12 15:37:47', '2024-07-12 15:37:47'),
(164, 1, '302c18a28a614115', 'dd435163-589d-4cbc-8235-fba2156fef40', '1695365', '1695365', 'win', 'balance', 1.68, 'play_fiver', 0, 1, '302c18a28a614115', '2024-07-12 15:37:55', '2024-07-12 15:37:55'),
(165, 1, '40b8b1ff785c2bb2', '84e34c17-fbc6-457a-b5bc-eb27527e8511', '1695365', '1695365', 'win', 'balance', 3.84, 'play_fiver', 0, 1, '40b8b1ff785c2bb2', '2024-07-12 15:38:10', '2024-07-12 15:38:10'),
(166, 1, '0fd289d9a3945e64', 'b5b364d7-5258-4a7c-ab6e-e86a7293587f', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '0fd289d9a3945e64', '2024-07-12 15:38:26', '2024-07-12 15:38:26'),
(167, 1, '773749fa2d9dc0d0', '25a5f90c-63b2-4db6-bace-06d1f151f479', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '773749fa2d9dc0d0', '2024-07-12 15:38:29', '2024-07-12 15:38:29'),
(168, 1, '96656fd9a7f7879b', '3ad4af34-aa3d-463a-8732-a90a149132c9', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '96656fd9a7f7879b', '2024-07-12 15:38:32', '2024-07-12 15:38:32'),
(169, 1, 'e2fd3cec996e7b1c', '8f6a0277-6080-4f80-8c15-88f75f702f0b', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, 'e2fd3cec996e7b1c', '2024-07-12 15:38:41', '2024-07-12 15:38:41'),
(170, 1, 'a7204ebcdef6bbcb', '5dc9b80f-d5ff-4a3f-9818-860147ce3b85', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, 'a7204ebcdef6bbcb', '2024-07-12 15:38:44', '2024-07-12 15:38:44'),
(171, 1, '747dee6403cd54da', 'd838888e-2cb5-4292-a0f1-7d2fe581d3ac', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '747dee6403cd54da', '2024-07-12 15:38:46', '2024-07-12 15:38:46'),
(172, 1, '67041075fbf19fa0', 'ad011ee8-ab74-49fa-9ce9-de9c3d601f58', '1695365', '1695365', 'win', 'balance', 14.40, 'play_fiver', 0, 1, '67041075fbf19fa0', '2024-07-12 15:38:55', '2024-07-12 15:38:55'),
(173, 1, '1c976eb22b08abd2', 'e45f3e78-7b0a-4d8a-aed2-47703712d3e4', '1695365', '1695365', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '1c976eb22b08abd2', '2024-07-12 15:39:03', '2024-07-12 15:39:03'),
(174, 1, 'e45a95d72d5df48f', '3d8123c3-0573-49c1-8557-83f5c28aa36c', '1695365', '1695365', 'win', 'balance', 25.92, 'play_fiver', 0, 1, 'e45a95d72d5df48f', '2024-07-12 15:39:18', '2024-07-12 15:39:18'),
(175, 1, '5180bd98298ba9b5', '7e01e15b-3539-48eb-8106-ea225df67f95', '1695365', '1695365', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '5180bd98298ba9b5', '2024-07-12 15:39:44', '2024-07-12 15:39:44'),
(176, 1, '3a0927e4c35c1dbb', 'affeee6d-b098-4602-b54e-26d14e0ee00e', '1695365', '1695365', 'win', 'balance_withdrawal', 0.96, 'play_fiver', 0, 1, '3a0927e4c35c1dbb', '2024-07-12 15:39:47', '2024-07-12 15:39:47'),
(177, 1, '619b179045c825b5', '36a5a650-fc6c-449f-bce3-d2a86807d691', '1695365', '1695365', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '619b179045c825b5', '2024-07-12 15:39:53', '2024-07-12 15:39:53'),
(178, 1, '7bfe6c1684bacda5', '196ad22c-0d17-4eb7-9d07-eb259f4b8a69', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '7bfe6c1684bacda5', '2024-07-12 15:40:43', '2024-07-12 15:40:43'),
(179, 1, '1dfd3db89618f2ac', '40f81937-f27b-4351-b5e6-5cbcf17898aa', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '1dfd3db89618f2ac', '2024-07-12 15:40:44', '2024-07-12 15:40:44'),
(180, 1, 'eca458ca1cab36b4', '00b7cd3a-f3e9-4688-8729-91c7f124b293', '1543462', '1543462', 'win', 'balance_withdrawal', 0.32, 'play_fiver', 0, 1, 'eca458ca1cab36b4', '2024-07-12 15:40:45', '2024-07-12 15:40:45'),
(181, 1, '6f6544b6a1f7000b', 'ca6daa8f-f57f-4c76-993b-63901b7b1020', '1543462', '1543462', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6f6544b6a1f7000b', '2024-07-12 15:40:50', '2024-07-12 15:40:50'),
(182, 1, '5434cf9aa49910fa', '7aab39cc-8d74-45e1-a8b0-182389398a70', '1543462', '1543462', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '5434cf9aa49910fa', '2024-07-12 15:40:54', '2024-07-12 15:40:54'),
(183, 1, '4d51da08ae4912a6', 'ccdac6a0-956b-43d0-8f67-baf53c25282e', '1543462', '1543462', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '4d51da08ae4912a6', '2024-07-12 15:40:57', '2024-07-12 15:40:57'),
(184, 1, 'b1e7162f07325170', 'f0a80413-76e4-47fc-93e9-1e5ced8ea94b', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b1e7162f07325170', '2024-07-12 15:45:36', '2024-07-12 15:45:36'),
(185, 1, 'f746f2b28741a0d5', 'ecc0ad3f-a31b-4116-b3ce-409914f35fc1', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'f746f2b28741a0d5', '2024-07-12 15:45:38', '2024-07-12 15:45:38'),
(186, 1, '790a4866389ada68', '9cbef2da-3f00-422e-b797-cfc3a0ce0c95', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '790a4866389ada68', '2024-07-12 15:45:39', '2024-07-12 15:45:39'),
(187, 1, '70935eb5e9f63024', 'ce73a42e-40aa-4c80-aea0-17dba4dcbde5', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '70935eb5e9f63024', '2024-07-12 15:45:41', '2024-07-12 15:45:41'),
(188, 1, 'b0f2a4ca7097a414', 'bf602130-759f-4e3d-ba1a-62939147fa3f', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b0f2a4ca7097a414', '2024-07-12 15:45:43', '2024-07-12 15:45:43'),
(189, 1, '67b520bffd3b80b6', 'f0ef9b19-add5-499b-a5d3-a0cd7077d931', '1695365', '1695365', 'win', 'balance_withdrawal', 0.16, 'play_fiver', 0, 1, '67b520bffd3b80b6', '2024-07-12 15:45:46', '2024-07-12 15:45:46'),
(190, 1, '28429f8a75a0fa7d', '9def9db6-8788-4288-bf84-a90473ce29d8', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '28429f8a75a0fa7d', '2024-07-12 15:45:49', '2024-07-12 15:45:49'),
(191, 1, '6e183d82da3b71e7', 'c2d6b7af-dc6b-4f19-b893-7bf6820a0217', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6e183d82da3b71e7', '2024-07-12 15:45:55', '2024-07-12 15:45:55'),
(192, 1, 'ef029ae7122d8722', '4eb259b1-9485-43ac-92ec-b544e32fc442', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'ef029ae7122d8722', '2024-07-12 15:45:56', '2024-07-12 15:45:56'),
(193, 1, '6b1308bdb36cc426', 'fb093575-af76-485e-94b9-e8950907f9bc', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '6b1308bdb36cc426', '2024-07-12 15:45:57', '2024-07-12 15:45:57'),
(194, 1, '4811397120226bcb', '36df5898-94cd-4652-875e-a62f35e3bad6', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '4811397120226bcb', '2024-07-12 15:46:03', '2024-07-12 15:46:03'),
(195, 1, '82cfa0994d99001b', 'c769bf6d-139b-499c-b722-cc469cf7a21a', '1695365', '1695365', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '82cfa0994d99001b', '2024-07-12 15:46:13', '2024-07-12 15:46:13'),
(196, 1, '905ccd9871fddfbd', 'a0da7e21-0599-481b-abd9-3576f8fb52d4', '1695365', '1695365', 'win', 'balance', 1.68, 'play_fiver', 0, 1, '905ccd9871fddfbd', '2024-07-12 15:46:22', '2024-07-12 15:46:22'),
(197, 1, '1be6f79e6a7de012', 'aa7f857e-05a3-4dc3-8d1c-99a7b65ef380', '1695365', '1695365', 'win', 'balance', 3.84, 'play_fiver', 0, 1, '1be6f79e6a7de012', '2024-07-12 15:46:39', '2024-07-12 15:46:39'),
(198, 1, 'b1db9d969300558a', 'f38f1989-fc1e-456d-8d80-efe372406820', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b1db9d969300558a', '2024-07-12 15:46:51', '2024-07-12 15:46:51'),
(199, 1, '9ce7722c9e1d6830', '15c7c8b6-8732-4c8f-91f3-51dec034cc00', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '9ce7722c9e1d6830', '2024-07-12 15:46:52', '2024-07-12 15:46:52'),
(200, 1, 'c78869cc4745bcc2', '7da8c7df-17a5-437f-a748-fdbaf2e104ef', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'c78869cc4745bcc2', '2024-07-12 15:46:54', '2024-07-12 15:46:54'),
(201, 1, 'a43477cf092d0306', '60feeafd-42f9-4b98-a7db-a40f5174f307', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a43477cf092d0306', '2024-07-12 15:46:55', '2024-07-12 15:46:55'),
(202, 1, '6e03eb0ca2454b95', '4ce57c08-5cbb-4949-b982-bd3ce70a759c', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6e03eb0ca2454b95', '2024-07-12 15:46:57', '2024-07-12 15:46:57'),
(203, 1, 'aa1380aefaf3128a', '62e878b1-1318-4df4-8cf6-034fc1486dd8', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'aa1380aefaf3128a', '2024-07-12 15:46:58', '2024-07-12 15:46:58'),
(204, 1, 'beeee541f1023af0', '3cf2dde1-ac68-4492-991c-1c20e374ad4a', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'beeee541f1023af0', '2024-07-12 15:49:04', '2024-07-12 15:49:04'),
(205, 1, '316123b40316f37b', 'b039bbe1-d947-44a3-b139-42573abfff47', '1695365', '1695365', 'win', 'balance_withdrawal', 6.00, 'play_fiver', 0, 1, '316123b40316f37b', '2024-07-12 15:56:13', '2024-07-12 15:56:13'),
(206, 1, 'a5eaa6cac1df8d8b', '6da29f9e-4d53-43a8-af3b-d3bc7c73d261', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a5eaa6cac1df8d8b', '2024-07-12 15:56:20', '2024-07-12 15:56:20'),
(207, 1, 'bad4168ad6d783ca', 'c4a2ddae-822b-4d62-baa4-181be54dfd4e', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'bad4168ad6d783ca', '2024-07-12 15:56:22', '2024-07-12 15:56:22'),
(208, 1, '0b4d05995d3a9db3', 'd171e9fd-b81f-455e-9560-818902bb7de2', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, '0b4d05995d3a9db3', '2024-07-12 15:56:24', '2024-07-12 15:56:24'),
(209, 1, '70353de007f5eca7', '9983cbcb-8f2b-460b-b569-c363511abab3', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '70353de007f5eca7', '2024-07-12 15:56:27', '2024-07-12 15:56:27'),
(210, 1, '9366d56ebc8a5c73', '0c7fcae4-54d6-444e-a7aa-88e61b68fa6c', '1695365', '1695365', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '9366d56ebc8a5c73', '2024-07-12 15:56:37', '2024-07-12 15:56:37'),
(211, 1, '114f8a4ffcc01241', '464b8d65-f726-4eb5-bcb3-44513198cb6b', '1695365', '1695365', 'win', 'balance', 1.68, 'play_fiver', 0, 1, '114f8a4ffcc01241', '2024-07-12 15:56:45', '2024-07-12 15:56:45'),
(212, 1, '9a4968e49141b13a', '19294388-1ada-46f2-9207-5992a9bbec4e', '1695365', '1695365', 'win', 'balance', 3.84, 'play_fiver', 0, 1, '9a4968e49141b13a', '2024-07-12 15:57:00', '2024-07-12 15:57:00'),
(213, 1, '938ecb7439a23437', '2ecd3a1e-a2ce-4206-8493-b7e2b418b59b', '1695365', '1695365', 'win', 'balance_withdrawal', 24.00, 'play_fiver', 0, 1, '938ecb7439a23437', '2024-07-12 15:57:18', '2024-07-12 15:57:18'),
(214, 1, '773833867d916c68', 'cc741922-ab8f-476c-92e2-6305dfcf1c46', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '773833867d916c68', '2024-07-12 15:57:27', '2024-07-12 15:57:27'),
(215, 1, '58b3ed1ebae5eb9a', '9132a15c-5dd6-4065-a302-a72e44e563da', '1695365', '1695365', 'win', 'balance', 14.40, 'play_fiver', 0, 1, '58b3ed1ebae5eb9a', '2024-07-12 15:57:36', '2024-07-12 15:57:36'),
(216, 1, 'f847d28cfb9c013f', 'acb89438-5d97-4c24-943c-50c0cc1b5210', '1695365', '1695365', 'win', 'balance', 1.92, 'play_fiver', 0, 1, 'f847d28cfb9c013f', '2024-07-12 15:57:44', '2024-07-12 15:57:44'),
(217, 1, 'ed11d278044dff6c', '1f2398de-f5a2-4f16-a7e4-9d7e5870cdfe', '1695365', '1695365', 'win', 'balance', 25.92, 'play_fiver', 0, 1, 'ed11d278044dff6c', '2024-07-12 15:57:59', '2024-07-12 15:57:59'),
(218, 1, '016c5eef71fadb88', '66ec5425-743b-48ae-b4dd-54e1f9726d09', '1695365', '1695365', 'win', 'balance_withdrawal', 1.68, 'play_fiver', 0, 1, '016c5eef71fadb88', '2024-07-12 15:59:12', '2024-07-12 15:59:12'),
(219, 1, '899bd9843668acbf', '8846d6c9-0dae-4d76-8f17-3edaf2e4346b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '899bd9843668acbf', '2024-07-12 15:59:15', '2024-07-12 15:59:15'),
(220, 1, '7521f489f2c13d94', 'd2e1359f-17ef-4d96-a977-8d8078dd8076', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7521f489f2c13d94', '2024-07-12 15:59:18', '2024-07-12 15:59:18'),
(221, 1, '3bcd3b3f9831864f', '0be68fe0-ce03-4a0d-9e5e-8e3bf5d6b89b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '3bcd3b3f9831864f', '2024-07-12 15:59:21', '2024-07-12 15:59:21'),
(222, 1, 'b14484145bed333b', 'b60b3b13-bbec-4b14-81b8-38a3e0c53096', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'b14484145bed333b', '2024-07-12 15:59:28', '2024-07-12 15:59:28'),
(223, 1, '269230b50f62e8e2', '8933c468-e29d-497f-a144-12383bc97941', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, '269230b50f62e8e2', '2024-07-12 15:59:29', '2024-07-12 15:59:29'),
(224, 1, 'dab7bb707b108b9c', '8bed744f-50a9-44e9-8a28-a87ccde0b70c', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, 'dab7bb707b108b9c', '2024-07-12 15:59:31', '2024-07-12 15:59:31'),
(225, 1, '43aea972ef7fa5f1', '506b0d77-7976-4cd2-aff1-c1cd807951f4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '43aea972ef7fa5f1', '2024-07-12 15:59:37', '2024-07-12 15:59:37'),
(226, 1, '61efb03fd3ae0843', 'bcee4f18-6017-47c8-a93d-13cf6894054e', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '61efb03fd3ae0843', '2024-07-12 15:59:38', '2024-07-12 15:59:38'),
(227, 1, '3eed77edd9618b7f', '619bc2d3-eac3-420a-bc71-f818bf24876b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '3eed77edd9618b7f', '2024-07-12 15:59:39', '2024-07-12 15:59:39'),
(228, 1, '8f0ca8bdbaae4f2c', '3d99a4c0-ffda-43cf-a193-0f2626416c3e', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '8f0ca8bdbaae4f2c', '2024-07-12 15:59:40', '2024-07-12 15:59:40'),
(229, 1, '39f4231807fdb1d2', '1481c7f8-c3f7-4234-85ca-2415e62f3cbf', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '39f4231807fdb1d2', '2024-07-12 15:59:41', '2024-07-12 15:59:41'),
(230, 1, '9b0643e911da75d1', '169e7bbe-9f82-4780-8819-6fcc23569ef6', '1695365', '1695365', 'win', 'balance', 14.40, 'play_fiver', 0, 1, '9b0643e911da75d1', '2024-07-12 15:59:55', '2024-07-12 15:59:55'),
(231, 1, '91786f5233bace61', '9672746c-94e7-4d62-b87d-08d9253933a4', '1695365', '1695365', 'win', 'balance', 1.92, 'play_fiver', 0, 1, '91786f5233bace61', '2024-07-12 16:00:08', '2024-07-12 16:00:08'),
(232, 1, '4db1ab93322c4bd9', '19a8d268-68ed-486a-a23e-cabfa0d9f9bb', '1695365', '1695365', 'win', 'balance', 25.92, 'play_fiver', 0, 1, '4db1ab93322c4bd9', '2024-07-12 16:00:22', '2024-07-12 16:00:22'),
(233, 1, '2e2bede68208440a', '386de823-a034-498f-8115-9afa91562fa0', '1695365', '1695365', 'win', 'balance_withdrawal', 0.96, 'play_fiver', 0, 1, '2e2bede68208440a', '2024-07-12 16:00:42', '2024-07-12 16:00:42'),
(234, 1, '3d46b91757b09989', '012ea8ea-f8f1-438f-9412-9408400d6d00', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '3d46b91757b09989', '2024-07-12 16:00:44', '2024-07-12 16:00:44'),
(235, 1, 'b82980bfb72c8511', '646b8d37-9629-478a-9175-4b2aacda66e6', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'b82980bfb72c8511', '2024-07-12 16:00:45', '2024-07-12 16:00:45'),
(236, 1, 'bae1e2f2833fc173', '48da6a6d-4236-4980-a5b5-f339d1c1bcb5', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, 'bae1e2f2833fc173', '2024-07-12 16:00:46', '2024-07-12 16:00:46'),
(237, 1, '0a48d63823859d78', '19f2b40a-8f0d-4680-a583-f00850bd6245', '1695365', '1695365', 'win', 'balance_withdrawal', 0.96, 'play_fiver', 0, 1, '0a48d63823859d78', '2024-07-12 16:00:49', '2024-07-12 16:00:49'),
(238, 1, '5c108f374bb0542c', '09350e02-e713-47fe-8f46-6d24b56ba02a', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '5c108f374bb0542c', '2024-07-12 16:00:54', '2024-07-12 16:00:54'),
(239, 1, '3d0188b9f39af447', 'b60d8cd1-2ef2-4cab-b5a2-3d6f63288b98', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '3d0188b9f39af447', '2024-07-12 16:00:55', '2024-07-12 16:00:55'),
(240, 1, '26d97eed2b2bffeb', '5bc5cc76-2417-4a17-b7f7-2af864103ab9', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '26d97eed2b2bffeb', '2024-07-12 16:00:57', '2024-07-12 16:00:57'),
(241, 1, '7a6b55c48d30cd04', '41b6181e-fa7f-4b27-a620-917d2e3600a2', '1695365', '1695365', 'win', 'balance', 14.40, 'play_fiver', 0, 1, '7a6b55c48d30cd04', '2024-07-12 16:01:11', '2024-07-12 16:01:11'),
(242, 1, 'bc988a9571fc342d', 'e4e26d0a-d559-40fe-a929-815fcf655196', '1695365', '1695365', 'win', 'balance', 1.92, 'play_fiver', 0, 1, 'bc988a9571fc342d', '2024-07-12 16:01:22', '2024-07-12 16:01:22'),
(243, 1, '07617acd1d42cc43', 'e39aadaf-351e-416d-bb6f-cfad2492f9b3', '1695365', '1695365', 'win', 'balance', 25.92, 'play_fiver', 0, 1, '07617acd1d42cc43', '2024-07-12 16:01:38', '2024-07-12 16:01:38'),
(244, 1, 'a31f2b31a2a31b53', 'f75cfe33-6130-4ce8-9b3c-6a44d6d1bccf', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'a31f2b31a2a31b53', '2024-07-12 16:01:54', '2024-07-12 16:01:54');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(245, 1, '05cc303ba3add765', '120d9e80-2fa9-41d8-bddb-9490d56bb83e', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '05cc303ba3add765', '2024-07-12 16:01:56', '2024-07-12 16:01:56'),
(246, 1, '63827bb448ff8b22', '9cfde87d-587a-44c5-b76a-f0b3a90fe456', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '63827bb448ff8b22', '2024-07-12 16:02:01', '2024-07-12 16:02:01'),
(247, 1, 'b3873a07b238cb21', 'eecc721a-7bf7-42f0-9cba-c1dd607a68cf', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, 'b3873a07b238cb21', '2024-07-12 16:02:04', '2024-07-12 16:02:04'),
(248, 1, '56de51c8a80abad8', '44304362-6cc0-4641-957a-b9181410cba4', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '56de51c8a80abad8', '2024-07-12 16:02:06', '2024-07-12 16:02:06'),
(249, 1, '98bd66c4a606ea9a', '5fa5feeb-9bf0-4e37-a6ce-0ae0262595dd', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '98bd66c4a606ea9a', '2024-07-12 16:02:06', '2024-07-12 16:02:06'),
(250, 1, '92c06a2608294940', 'cf82b6c3-212e-4573-bd70-6dbaf328f656', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '92c06a2608294940', '2024-07-12 16:02:10', '2024-07-12 16:02:10'),
(251, 1, '255c217d35a93e49', '08e484b1-53e8-45d3-bc45-3a830dac6a52', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '255c217d35a93e49', '2024-07-12 16:02:12', '2024-07-12 16:02:12'),
(252, 1, '018ef913b1c75b11', 'e41f5b02-5aad-40d2-9795-63fa8e639f41', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '018ef913b1c75b11', '2024-07-12 16:02:14', '2024-07-12 16:02:14'),
(253, 1, 'f51184ae80930df4', '7a795ac6-dc74-4cdc-ac66-13fc2b6fb211', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'f51184ae80930df4', '2024-07-12 16:02:24', '2024-07-12 16:02:24'),
(254, 1, 'aa747fcd8c68281e', '937fcd62-5019-4d2e-91e5-bb776767c3da', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'aa747fcd8c68281e', '2024-07-12 16:02:25', '2024-07-12 16:02:25'),
(255, 1, '9294c8bbfdc0057d', 'c5fbaf0c-ac01-40ec-8641-f0b0fe4e79fe', '1695365', '1695365', 'win', 'balance_withdrawal', 8.00, 'play_fiver', 0, 1, '9294c8bbfdc0057d', '2024-07-12 16:02:26', '2024-07-12 16:02:26'),
(256, 1, 'a872b8e41e203a1e', '024ccd1e-219e-4b0a-ad56-a6868b0bdee0', '1695365', '1695365', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, 'a872b8e41e203a1e', '2024-07-12 16:02:28', '2024-07-12 16:02:28'),
(257, 1, 'a3a117e5fa53093e', 'e9c23be6-1303-467f-be86-7243187fd146', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'a3a117e5fa53093e', '2024-07-12 16:02:31', '2024-07-12 16:02:31'),
(258, 1, 'c29e4ef07d62e777', 'ea05b289-66ea-4828-a7e6-511e5948cc2a', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'c29e4ef07d62e777', '2024-07-12 16:02:32', '2024-07-12 16:02:32'),
(259, 1, '2891d29e1370c714', 'f3fba51c-26d6-4843-ad87-7d6f0f69457b', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '2891d29e1370c714', '2024-07-12 16:02:34', '2024-07-12 16:02:34'),
(260, 1, '808282f81170ff7b', 'e0bd4ab4-d464-45a5-a174-576bb656413d', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '808282f81170ff7b', '2024-07-12 16:02:35', '2024-07-12 16:02:35'),
(261, 1, '4b47dfd842225626', 'dad143f4-0593-4ff1-a9eb-04f638f54efa', '1695365', '1695365', 'win', 'balance', 32.00, 'play_fiver', 0, 1, '4b47dfd842225626', '2024-07-12 16:02:44', '2024-07-12 16:02:44'),
(262, 1, '20f1d867ad5463f9', 'c864c48f-9a91-471f-ab2e-fc416fcd3bbb', '1695365', '1695365', 'win', 'balance', 16.80, 'play_fiver', 0, 1, '20f1d867ad5463f9', '2024-07-12 16:02:51', '2024-07-12 16:02:51'),
(263, 1, 'a8403d9d4c118747', '10912933-d799-4595-91a3-555e0ddaecf7', '1695365', '1695365', 'win', 'balance', 38.40, 'play_fiver', 0, 1, 'a8403d9d4c118747', '2024-07-12 16:03:05', '2024-07-12 16:03:05'),
(264, 1, '855fb567a1e1ecfa', '01af398f-24c7-4f6e-99f4-8b55a237e8fe', '1695365', '1695365', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '855fb567a1e1ecfa', '2024-07-12 16:03:16', '2024-07-12 16:03:16'),
(265, 1, '487a65505e316f45', '486fe9ee-e2b2-4c03-9b16-f8d63af54a87', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '487a65505e316f45', '2024-07-12 16:03:18', '2024-07-12 16:03:18'),
(266, 1, '20302734862681bb', '5efae9cc-1bec-4ae5-b037-4cf184fd5bc7', '1695365', '1695365', 'win', 'balance_withdrawal', 16.00, 'play_fiver', 0, 1, '20302734862681bb', '2024-07-12 16:03:20', '2024-07-12 16:03:20'),
(267, 1, 'be11488cc9fcaf5b', '1c14efcc-e1ce-4f22-b6a4-c96ba2fbfcd2', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, 'be11488cc9fcaf5b', '2024-07-12 16:03:26', '2024-07-12 16:03:26'),
(268, 1, 'f27577b146447d85', '7afbd8d3-4563-4128-ba43-e6f9eef48848', '1695365', '1695365', 'win', 'balance', 96.00, 'play_fiver', 0, 1, 'f27577b146447d85', '2024-07-12 16:03:41', '2024-07-12 16:03:41'),
(269, 1, '9ec15805cc22e4e1', 'cadfefae-1e84-4e26-8a4b-1ed50dc917be', '1695365', '1695365', 'win', 'balance', 50.40, 'play_fiver', 0, 1, '9ec15805cc22e4e1', '2024-07-12 16:03:48', '2024-07-12 16:03:48'),
(270, 1, '98309f5fc81a5669', 'b2f2eb45-039c-40f3-9cdc-15c33cd7a3ce', '1695365', '1695365', 'win', 'balance', 115.20, 'play_fiver', 0, 1, '98309f5fc81a5669', '2024-07-12 16:04:02', '2024-07-12 16:04:02'),
(271, 1, '8afdbbe450c5d41d', '133ed34b-8fda-467b-9614-e405fb97507f', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, '8afdbbe450c5d41d', '2024-07-12 16:04:15', '2024-07-12 16:04:15'),
(272, 1, 'e35606afac0b3fe3', '4e1fbd9c-14c8-4008-a95a-f82bdbbeeb34', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, 'e35606afac0b3fe3', '2024-07-12 16:04:20', '2024-07-12 16:04:20'),
(273, 1, 'e1f341d2d3a2b54b', 'd8552801-8ea9-4eb9-8e9b-689462274ea5', '1695365', '1695365', 'win', 'balance_withdrawal', 45.00, 'play_fiver', 0, 1, 'e1f341d2d3a2b54b', '2024-07-12 16:04:22', '2024-07-12 16:04:22'),
(274, 1, '0907103188fb988b', 'e14a18dc-221a-4f85-8c43-b85c79e9c3c0', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '0907103188fb988b', '2024-07-12 16:04:28', '2024-07-12 16:04:28'),
(275, 1, 'ec70acc782d5a429', '69756464-2caa-4908-aac8-a4b4e1db47be', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, 'ec70acc782d5a429', '2024-07-12 16:04:31', '2024-07-12 16:04:31'),
(276, 1, '1d80eb488c0229a7', '01247eda-9a9f-4734-ab25-ce5988769ca1', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '1d80eb488c0229a7', '2024-07-12 16:04:34', '2024-07-12 16:04:34'),
(277, 1, '313286f11817f69f', 'a0f80b71-e155-4cfc-92ef-c26fd4c69db4', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '313286f11817f69f', '2024-07-12 16:04:38', '2024-07-12 16:04:38'),
(278, 1, 'cb7e83c6a19690ef', '7382507c-b7c0-4915-b2dc-453246ba2771', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'cb7e83c6a19690ef', '2024-07-12 16:04:39', '2024-07-12 16:04:39'),
(279, 1, 'ddd44e13c7832621', 'a2902502-8e76-43ad-ae4d-75239ae8bd6b', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'ddd44e13c7832621', '2024-07-12 16:04:40', '2024-07-12 16:04:40'),
(280, 1, 'c2909363ac95049f', 'ecf285ed-6eb5-4cc1-a920-a8ef3642e611', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, 'c2909363ac95049f', '2024-07-12 16:04:46', '2024-07-12 16:04:46'),
(281, 1, '4e97d982a3f2bc4d', 'b674d3fd-57b1-4341-9ee7-69856d52071c', '1695365', '1695365', 'win', 'balance_withdrawal', 9.00, 'play_fiver', 0, 1, '4e97d982a3f2bc4d', '2024-07-12 16:04:48', '2024-07-12 16:04:48'),
(282, 1, 'bee952dc1231b5b5', '9cc788ca-af6b-4866-a95b-a5c8dcd58cac', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, 'bee952dc1231b5b5', '2024-07-12 16:04:49', '2024-07-12 16:04:49'),
(283, 1, '2bbe8eede01be0a6', 'b093b039-e9d0-4851-a73f-70780401ac6d', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '2bbe8eede01be0a6', '2024-07-12 16:04:51', '2024-07-12 16:04:51'),
(284, 1, 'c8773b85a14ac04e', 'a09eac8a-b41d-4bc0-8ac9-9aba23a87930', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'c8773b85a14ac04e', '2024-07-12 16:04:52', '2024-07-12 16:04:52'),
(285, 1, '87bde8c24bd15f42', 'bfc86871-f851-449c-95f1-5d51829f018a', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '87bde8c24bd15f42', '2024-07-12 16:04:53', '2024-07-12 16:04:53'),
(286, 1, 'd2deed8bd1bff2c0', '2d33074f-d7aa-4539-842b-544f7ecda957', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'd2deed8bd1bff2c0', '2024-07-12 16:04:54', '2024-07-12 16:04:54'),
(287, 1, '95f23d02ef3eadc2', '8af6d68c-9361-422e-830a-7de28e4bbaca', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '95f23d02ef3eadc2', '2024-07-12 16:04:55', '2024-07-12 16:04:55'),
(288, 1, 'd12761d98752cd72', 'c0880b71-a802-4257-868b-9377c9d476c8', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'd12761d98752cd72', '2024-07-12 16:04:56', '2024-07-12 16:04:56'),
(289, 1, 'ac96758835c13bdf', '066534c4-4a24-4536-954b-1b7bd360c9b6', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'ac96758835c13bdf', '2024-07-12 16:04:57', '2024-07-12 16:04:57'),
(290, 1, '405c78c58ac3280d', '2b2acc11-188d-428d-bdfb-e90d296bde10', '1695365', '1695365', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '405c78c58ac3280d', '2024-07-12 16:05:02', '2024-07-12 16:05:02'),
(291, 1, 'a927f128e8ce88e5', '2f85e272-66e4-4be2-a274-dba97feefa9f', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, 'a927f128e8ce88e5', '2024-07-12 16:05:07', '2024-07-12 16:05:07'),
(292, 1, 'e26c37975c8e7e60', '033b0e1c-fe04-4730-a3a8-9ec42863b4a8', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'e26c37975c8e7e60', '2024-07-12 16:05:11', '2024-07-12 16:05:11'),
(293, 1, '80e04d2edb3d7f7c', '8acc435e-6734-412d-8512-05454e7a4608', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '80e04d2edb3d7f7c', '2024-07-12 16:05:12', '2024-07-12 16:05:12'),
(294, 1, '24eefe9f92e28bbb', '346fb17e-8ed0-433c-88ae-8f4976a9c8b1', '1695365', '1695365', 'bet', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '24eefe9f92e28bbb', '2024-07-12 16:05:13', '2024-07-12 16:05:13'),
(295, 1, 'dbf6c288750ca9a1', '75204e75-f163-4e14-86ac-a5aa9458fa8f', '1695365', '1695365', 'win', 'balance_withdrawal', 3.20, 'play_fiver', 0, 1, 'dbf6c288750ca9a1', '2024-07-12 16:05:15', '2024-07-12 16:05:15'),
(296, 1, '6118601b0373ca12', '2fe38230-2914-4ff5-93af-67ad12df89aa', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '6118601b0373ca12', '2024-07-12 16:05:23', '2024-07-12 16:05:23'),
(297, 1, '023fee88c983a9a6', '8b4ed51d-cdd6-4443-9475-3a769b19409f', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '023fee88c983a9a6', '2024-07-12 16:05:24', '2024-07-12 16:05:24'),
(298, 1, '050c2bb4d1c5854f', '6e888b99-3136-40f7-bbfd-2c4890a1e2c5', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '050c2bb4d1c5854f', '2024-07-12 16:05:25', '2024-07-12 16:05:25'),
(299, 1, 'b2d8fe2efff8e11c', 'f0467649-1184-4118-a108-0ea0374542b2', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'b2d8fe2efff8e11c', '2024-07-12 16:05:27', '2024-07-12 16:05:27'),
(300, 1, '6cdf13a7722c63c6', '84022865-1513-481f-a69a-1d0a3a728962', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '6cdf13a7722c63c6', '2024-07-12 16:05:29', '2024-07-12 16:05:29'),
(301, 1, 'e21460e92835a15c', '278a85fc-eed2-434d-8921-dbaa88213fc4', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'e21460e92835a15c', '2024-07-12 16:05:32', '2024-07-12 16:05:32'),
(302, 1, '55edc06b433397bd', '1cc9a3cd-3c70-4687-b914-821f9a2f1400', '1695365', '1695365', 'win', 'balance_withdrawal', 30.00, 'play_fiver', 0, 1, '55edc06b433397bd', '2024-07-12 16:05:34', '2024-07-12 16:05:34'),
(303, 1, 'cc914b40afcd71d7', '0ac23a37-1be5-48dc-9277-09f339bbca6f', '1695365', '1695365', 'win', 'balance_withdrawal', 6.00, 'play_fiver', 0, 1, 'cc914b40afcd71d7', '2024-07-12 16:05:43', '2024-07-12 16:05:43'),
(304, 1, '524601e448ff4452', '7dcc3784-adc6-4e34-88ae-a925994cf401', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '524601e448ff4452', '2024-07-12 16:05:45', '2024-07-12 16:05:45'),
(305, 1, 'c1b6c9165a94951d', '52b49d5a-5354-4841-9e08-e172230f0c73', '1695365', '1695365', 'win', 'balance_withdrawal', 75.00, 'play_fiver', 0, 1, 'c1b6c9165a94951d', '2024-07-12 16:05:46', '2024-07-12 16:05:46'),
(306, 1, '9c51720c385cbd60', '55c84429-6915-46b6-b692-15761748d7a4', '1695365', '1695365', 'win', 'balance_withdrawal', 9.00, 'play_fiver', 0, 1, '9c51720c385cbd60', '2024-07-12 16:05:50', '2024-07-12 16:05:50'),
(307, 1, '626bcdaa3a87030d', '425c8476-45f6-4a8f-84d7-5c2e016ce9fc', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '626bcdaa3a87030d', '2024-07-12 16:05:53', '2024-07-12 16:05:53'),
(308, 1, '02f818d82e260ce2', 'f350a3e4-c3bb-4cef-8e26-e945da16d693', '1695365', '1695365', 'win', 'balance', 120.00, 'play_fiver', 0, 1, '02f818d82e260ce2', '2024-07-12 16:06:02', '2024-07-12 16:06:02'),
(309, 1, 'f3df42c6f245892f', 'ed523593-474a-400f-9992-c21054b11b28', '1695365', '1695365', 'win', 'balance', 63.00, 'play_fiver', 0, 1, 'f3df42c6f245892f', '2024-07-12 16:06:10', '2024-07-12 16:06:10'),
(310, 1, 'd1aa6ed4e9ec7dc8', 'ba4f46fd-aaee-4154-9ef6-d71c7d676edd', '1695365', '1695365', 'win', 'balance', 144.00, 'play_fiver', 0, 1, 'd1aa6ed4e9ec7dc8', '2024-07-12 16:06:24', '2024-07-12 16:06:24'),
(311, 1, '2deac190e1fdbb67', 'd0b89332-afaf-4016-a70a-d85ce6a7451a', '656', '656', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '2deac190e1fdbb67', '2024-07-12 16:07:55', '2024-07-12 16:07:55'),
(312, 1, '9cf0150a3eab2927', '10e72bdf-9dc7-4d6a-bf10-8f81951a5933', '98', '98', 'win', 'balance_withdrawal', 0.30, 'play_fiver', 0, 1, '9cf0150a3eab2927', '2024-07-12 16:08:42', '2024-07-12 16:08:42'),
(313, 1, '8a077bd42c415efa', '693fdf72-052d-4c05-8bb3-fd6044d53a4b', '1695365', '1695365', 'win', 'balance_withdrawal', 1.60, 'play_fiver', 0, 1, '8a077bd42c415efa', '2024-07-12 16:09:10', '2024-07-12 16:09:10'),
(314, 1, '186982503644b045', '6e99a5ad-b38e-4408-ab64-3bad64e99880', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '186982503644b045', '2024-07-12 16:09:14', '2024-07-12 16:09:14'),
(315, 1, 'b520585cb0c5b3f2', '27f46671-e48d-455f-97ba-c9e31ea05a72', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b520585cb0c5b3f2', '2024-07-12 16:09:15', '2024-07-12 16:09:15'),
(316, 1, '1570f0d771b8d30d', '9c838c68-2898-4491-98b2-cce8bbfbcbde', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '1570f0d771b8d30d', '2024-07-12 16:09:16', '2024-07-12 16:09:16'),
(317, 1, 'ba5f0ec930b7a133', '73d0316e-aeb8-4f6a-bc99-b1332aac3666', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'ba5f0ec930b7a133', '2024-07-12 16:09:17', '2024-07-12 16:09:17'),
(318, 1, '034ec484908bbad8', '4b61cf0a-b8e2-4ea7-aced-30a45cc6398a', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '034ec484908bbad8', '2024-07-12 16:09:18', '2024-07-12 16:09:18'),
(319, 1, 'b1e9093200781b4d', '83f9f586-fb4a-4670-bc90-79a843d03537', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b1e9093200781b4d', '2024-07-12 16:09:19', '2024-07-12 16:09:19'),
(320, 1, '6fd3ffc12a728608', '19fb2c7b-0128-40a6-9732-9b8610be5db3', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6fd3ffc12a728608', '2024-07-12 16:09:19', '2024-07-12 16:09:19'),
(321, 1, '0b4a89b683bd8654', '59a1565b-1558-4825-bed6-74970592b7a0', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '0b4a89b683bd8654', '2024-07-12 16:09:20', '2024-07-12 16:09:20'),
(322, 1, '36cae141c9c03fb2', '470921b6-62fd-4cac-bde5-3839a54ca0ab', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '36cae141c9c03fb2', '2024-07-12 16:09:22', '2024-07-12 16:09:22'),
(323, 1, '9417dfdfb6d3472f', '30288fdd-6147-4541-85bd-16eeda68c600', '1695365', '1695365', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '9417dfdfb6d3472f', '2024-07-12 16:09:41', '2024-07-12 16:09:41'),
(324, 1, '9f04a3a5c4ea618b', '690e3fec-9e08-4462-b4cb-c5217c2b275f', '1695365', '1695365', 'win', 'balance', 1.68, 'play_fiver', 0, 1, '9f04a3a5c4ea618b', '2024-07-12 16:09:48', '2024-07-12 16:09:48'),
(325, 1, 'a144e5fe5d8df704', 'abb5a59a-f086-4843-92da-26acc251ae6d', '1695365', '1695365', 'win', 'balance', 3.84, 'play_fiver', 0, 1, 'a144e5fe5d8df704', '2024-07-12 16:10:04', '2024-07-12 16:10:04'),
(326, 1, '37b27d1566c9a207', '0b70704e-9ec8-4a21-89ec-aa0e3b2db07f', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '37b27d1566c9a207', '2024-07-12 16:10:14', '2024-07-12 16:10:14'),
(327, 1, '0ec15a22a31c6e40', '331028f6-46da-4948-8e21-393d3b7fe2e8', '1695365', '1695365', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '0ec15a22a31c6e40', '2024-07-12 16:10:17', '2024-07-12 16:10:17'),
(328, 1, 'cf13917346f5a741', '866de3e0-3652-4ff8-9dbb-ec6c9d493521', '1695365', '1695365', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, 'cf13917346f5a741', '2024-07-12 16:10:20', '2024-07-12 16:10:20'),
(329, 1, '2dd0f8a0106aa10a', 'ff96e391-ab5c-4f80-9762-985bfc0c62ee', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '2dd0f8a0106aa10a', '2024-07-12 16:10:25', '2024-07-12 16:10:25'),
(330, 1, 'a69e5118384373c5', 'de1cf968-2253-42bf-b288-20bd429e855e', '1695365', '1695365', 'win', 'balance', 4.80, 'play_fiver', 0, 1, 'a69e5118384373c5', '2024-07-12 16:10:46', '2024-07-12 16:10:46'),
(331, 1, 'c5fb35935fa0698a', '49a6e9fb-8405-4177-939f-92a3825c6002', '1695365', '1695365', 'win', 'balance', 0.64, 'play_fiver', 0, 1, 'c5fb35935fa0698a', '2024-07-12 16:11:12', '2024-07-12 16:11:12'),
(332, 1, 'f1494d22c91a76e7', '5f09dc50-9f2a-4d8f-9ef4-c1b648281de8', '1695365', '1695365', 'win', 'balance', 8.64, 'play_fiver', 0, 1, 'f1494d22c91a76e7', '2024-07-12 16:11:30', '2024-07-12 16:11:30'),
(333, 1, '643b016b16a2a1a0', '89ef9190-cb62-4f87-a313-03865e668776', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '643b016b16a2a1a0', '2024-07-12 16:14:48', '2024-07-12 16:14:48'),
(334, 1, '0883af944b3cae31', '5e1b4621-e75c-4f50-b300-4c0b90ca91e3', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '0883af944b3cae31', '2024-07-12 16:14:51', '2024-07-12 16:14:51'),
(335, 1, '2c35d8c114d077a7', '94ab6ec5-b936-48ff-b262-89f778c79e29', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '2c35d8c114d077a7', '2024-07-12 16:14:53', '2024-07-12 16:14:53'),
(336, 1, 'ddb108d247ce6236', '1ab7623a-24c8-41b7-913a-d737f63a68ca', '1695365', '1695365', 'win', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'ddb108d247ce6236', '2024-07-12 16:14:57', '2024-07-12 16:14:57'),
(337, 1, '778b6e782ef2c9b9', 'a9db7465-4a61-4f73-872c-460a336f2974', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '778b6e782ef2c9b9', '2024-07-12 16:15:08', '2024-07-12 16:15:08'),
(338, 1, '404be9b84963b939', '327ecb03-0339-434d-a8de-1d934f85c3a9', '1695365', '1695365', 'win', 'balance', 4.80, 'play_fiver', 0, 1, '404be9b84963b939', '2024-07-12 16:15:47', '2024-07-12 16:15:47'),
(339, 1, '59f3b780612fa4e7', '8e387287-a845-4c53-bb82-5a4b87fc2f6a', '1695365', '1695365', 'win', 'balance', 0.64, 'play_fiver', 0, 1, '59f3b780612fa4e7', '2024-07-12 16:15:54', '2024-07-12 16:15:54'),
(340, 1, '5d72d5eea09ad4ca', '68875a05-9036-4c66-b2f2-fd2790f48b94', '1695365', '1695365', 'win', 'balance', 8.64, 'play_fiver', 0, 1, '5d72d5eea09ad4ca', '2024-07-12 16:16:13', '2024-07-12 16:16:13'),
(341, 1, '41061598afa34a57', '2cf07a56-c5ea-4ef2-9417-3d4940791764', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '41061598afa34a57', '2024-07-12 16:16:50', '2024-07-12 16:16:50'),
(342, 1, '62002355d3b0ae19', 'bfe45d18-a4ce-486b-9a18-790f9b73586a', '1695365', '1695365', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '62002355d3b0ae19', '2024-07-12 16:16:52', '2024-07-12 16:16:52'),
(343, 1, '96c4dc76bca9162e', 'd2b34350-ee8d-4b7c-94d9-169ab23e3ce8', '1695365', '1695365', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '96c4dc76bca9162e', '2024-07-12 16:17:00', '2024-07-12 16:17:00'),
(344, 1, 'cf48fd6519fec799', 'ab866256-8212-4f4b-b5a6-1d1a9ff02db0', '1695365', '1695365', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, 'cf48fd6519fec799', '2024-07-12 16:17:02', '2024-07-12 16:17:02'),
(345, 1, 'fc1d620335628f20', 'fc46a5dd-8b30-4e4e-aa5d-7fe8ad41095d', '1695365', '1695365', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, 'fc1d620335628f20', '2024-07-12 16:17:04', '2024-07-12 16:17:04'),
(346, 1, '1212aaeff499bf0d', 'e80c6d47-3a8c-4c80-9046-a8327c61840f', '1695365', '1695365', 'win', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '1212aaeff499bf0d', '2024-07-12 16:17:08', '2024-07-12 16:17:08'),
(347, 1, '8b52fde9af393263', '45da10e7-2675-4715-ba9e-b050de294c72', '1695365', '1695365', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '8b52fde9af393263', '2024-07-12 16:17:10', '2024-07-12 16:17:10'),
(348, 1, '4c783d93b0650cd3', '30bf1a8a-8462-475c-b407-a410fa7313a9', '1695365', '1695365', 'bet', 'balance_withdrawal', 2.00, 'play_fiver', 0, 1, '4c783d93b0650cd3', '2024-07-12 16:17:12', '2024-07-12 16:17:12'),
(349, 1, 'a5a862ab8d775beb', '4f843721-33ad-47ae-b76a-eff44430395b', '1695365', '1695365', 'win', 'balance', 24.00, 'play_fiver', 0, 1, 'a5a862ab8d775beb', '2024-07-12 16:17:46', '2024-07-12 16:17:46'),
(350, 1, '404cba3f1dd3dea3', 'bf2d3b7c-37cc-47c3-a9d7-e223ee26aa7f', '1695365', '1695365', 'win', 'balance', 3.20, 'play_fiver', 0, 1, '404cba3f1dd3dea3', '2024-07-12 16:17:53', '2024-07-12 16:17:53'),
(351, 1, '59fccb4d086c5de2', '6d1eb0b2-d872-42d1-8972-2c1efb16f1ae', '1695365', '1695365', 'win', 'balance', 43.20, 'play_fiver', 0, 1, '59fccb4d086c5de2', '2024-07-12 16:18:07', '2024-07-12 16:18:07'),
(352, 1, 'd0f14fdaf4eeeca8', 'bc579239-69a0-46b3-83c5-9ec36de97e96', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, 'd0f14fdaf4eeeca8', '2024-07-12 16:18:38', '2024-07-12 16:18:38'),
(353, 1, '62f43ec35e65d3e5', '3a792aae-fd3f-40cb-9436-31e86e0f446a', '1695365', '1695365', 'win', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '62f43ec35e65d3e5', '2024-07-12 16:18:44', '2024-07-12 16:18:44'),
(354, 1, '23eda609579ec4e2', '2d292196-ce77-438d-85d4-aaa8d824f7c6', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '23eda609579ec4e2', '2024-07-12 16:18:47', '2024-07-12 16:18:47'),
(355, 1, '4195dbe9255ca92b', '2a82c809-7bba-46b6-9876-130f5bea537d', '1695365', '1695365', 'win', 'balance', 120.00, 'play_fiver', 0, 1, '4195dbe9255ca92b', '2024-07-12 16:18:57', '2024-07-12 16:18:57'),
(356, 1, 'f5250f01d783b83d', 'd3df1355-25b4-4293-9136-3a9bfe4d20c5', '1695365', '1695365', 'win', 'balance', 63.00, 'play_fiver', 0, 1, 'f5250f01d783b83d', '2024-07-12 16:19:04', '2024-07-12 16:19:04'),
(357, 1, '79779cf8dad94aee', '0f09f444-105f-4c27-8ebb-aec1f0eb3acf', '1695365', '1695365', 'win', 'balance', 144.00, 'play_fiver', 0, 1, '79779cf8dad94aee', '2024-07-12 16:19:19', '2024-07-12 16:19:19'),
(358, 1, 'd86eb298c9646bec', '43b68505-fe9c-4e4c-bee1-625573276e07', '1695365', '1695365', 'bet', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'd86eb298c9646bec', '2024-07-12 16:19:48', '2024-07-12 16:19:48'),
(359, 1, '3fa522a6bd5ea398', '7077bada-c186-49ac-b625-7d0d29d98072', '1695365', '1695365', 'win', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, '3fa522a6bd5ea398', '2024-07-12 16:19:49', '2024-07-12 16:19:49'),
(360, 1, 'b16bbaa55cd84b8c', '85e0b070-eada-4598-b247-e48e6e095546', '1695365', '1695365', 'bet', 'balance_withdrawal', 40.00, 'play_fiver', 0, 1, 'b16bbaa55cd84b8c', '2024-07-12 16:19:56', '2024-07-12 16:19:56'),
(361, 1, '8be6b8f6153d45c3', '90da7771-94ee-4812-8b73-6d500bcc368e', '1695365', '1695365', 'win', 'balance', 480.00, 'play_fiver', 0, 1, '8be6b8f6153d45c3', '2024-07-12 16:20:56', '2024-07-12 16:20:56'),
(362, 1, 'f0fca0e4b188b6f1', '3145b5d6-8d5c-4cfc-a2b2-608a0e969da9', '98', '98', 'win', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, 'f0fca0e4b188b6f1', '2024-07-12 16:22:52', '2024-07-12 16:22:52'),
(363, 1, '99c614dd18dce467', '963b3a1b-b071-4882-891f-a21a650c5e5c', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '99c614dd18dce467', '2024-07-12 16:23:26', '2024-07-12 16:23:26'),
(364, 1, 'b0bb954653efda80', '576c5e2a-f3ea-4c47-8adc-8e94b31a2638', '98', '98', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, 'b0bb954653efda80', '2024-07-12 16:23:40', '2024-07-12 16:23:40'),
(365, 1, '00d3f2ffad4f8d6a', 'eefb5741-bbf3-4ce0-8383-47d8bf41f890', '98', '98', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '00d3f2ffad4f8d6a', '2024-07-12 16:23:41', '2024-07-12 16:23:41'),
(366, 1, '1666611b71448782', '6350cba9-fb96-468b-9a9b-06702d803945', '98', '98', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, '1666611b71448782', '2024-07-12 16:23:42', '2024-07-12 16:23:42'),
(367, 1, '303e548c7b8dc3d4', 'a46b987c-43e5-43f1-a2e4-e1263644980b', '98', '98', 'win', 'balance_withdrawal', 42.50, 'play_fiver', 0, 1, '303e548c7b8dc3d4', '2024-07-12 16:23:44', '2024-07-12 16:23:44'),
(368, 1, '4f82d6a5dfb88fae', '0cb50ad6-cfce-4a04-8803-35b9bef46caa', '98', '98', 'win', 'balance_withdrawal', 37.50, 'play_fiver', 0, 1, '4f82d6a5dfb88fae', '2024-07-12 16:23:49', '2024-07-12 16:23:49'),
(369, 1, 'baabcdb6ad708222', 'a37e1090-61bd-466e-9a15-b85e998095c1', '98', '98', 'bet', 'balance_withdrawal', 25.00, 'play_fiver', 0, 1, 'baabcdb6ad708222', '2024-07-12 16:23:52', '2024-07-12 16:23:52'),
(370, 1, '5fb1aada63681999', 'd393a651-0fb9-40d7-b710-c18adf0874d3', '98', '98', 'win', 'balance_withdrawal', 12.50, 'play_fiver', 0, 1, '5fb1aada63681999', '2024-07-12 16:23:53', '2024-07-12 16:23:53'),
(371, 1, '72d11c019816e4ae', '7177f485-9af8-47e2-91c5-58d01143b7fe', '98', '98', 'win', 'balance_withdrawal', 1250.00, 'play_fiver', 0, 1, '72d11c019816e4ae', '2024-07-12 16:24:46', '2024-07-12 16:24:46'),
(372, 273, '19ae0c9756387eec', '14490c10-af50-40a5-95ff-c34eaf7f76e5', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '19ae0c9756387eec', '2024-07-12 16:31:26', '2024-07-12 16:31:26'),
(373, 273, '351fb477547142e3', '6d683984-5f3e-4ed4-bc1b-7e26b279ddc5', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '351fb477547142e3', '2024-07-12 16:31:29', '2024-07-12 16:31:29'),
(374, 273, '0b264f8a0bc7dfbd', 'd57253ed-9929-4537-a3a9-6ee54ebc167a', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '0b264f8a0bc7dfbd', '2024-07-12 16:31:30', '2024-07-12 16:31:30'),
(375, 273, 'e92373de1f607fed', 'aef6f8cb-08cb-4e16-9ed6-0a9805af2b48', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'e92373de1f607fed', '2024-07-12 16:31:32', '2024-07-12 16:31:32'),
(376, 273, '688f9e250cfc03f5', '9eaf6f8b-0349-45e3-b4dd-74949cfc8d6f', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '688f9e250cfc03f5', '2024-07-12 16:31:35', '2024-07-12 16:31:35'),
(377, 273, '3660b59215ad40c7', 'a99367ff-c15a-4601-81b9-aefc901a9479', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '3660b59215ad40c7', '2024-07-12 16:31:38', '2024-07-12 16:31:38'),
(378, 273, '08b29fd8350a9851', 'eecc13a8-03ad-4104-8d35-6a0c86014bfc', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '08b29fd8350a9851', '2024-07-12 16:31:41', '2024-07-12 16:31:41'),
(379, 273, 'fe7bb89cec0b8887', 'da5129b3-e825-4344-b50a-461a79caf624', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'fe7bb89cec0b8887', '2024-07-12 16:31:42', '2024-07-12 16:31:42'),
(380, 273, '0d9770870bf51c73', 'e7125a52-256c-4b97-a17c-13ab42e12c50', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '0d9770870bf51c73', '2024-07-12 16:31:44', '2024-07-12 16:31:44'),
(381, 273, 'bd3283defe1b6dcf', '1326fe2f-6568-4f9c-891d-9da999ba5fd1', '1695365', '1695365', 'win', 'balance', 1.60, 'play_fiver', 0, 1, 'bd3283defe1b6dcf', '2024-07-12 16:31:50', '2024-07-12 16:31:50'),
(382, 273, 'f08f5d367d5421e9', 'e1d9adb7-fddd-4415-8b8e-204d5251d2e7', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'f08f5d367d5421e9', '2024-07-12 16:31:55', '2024-07-12 16:31:55'),
(383, 273, 'a9f29de47f36ff26', '463ca4dd-8bd1-4685-b53a-14234c1fac75', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, 'a9f29de47f36ff26', '2024-07-12 16:31:57', '2024-07-12 16:31:57'),
(384, 273, '4a93dca6d05a0bfd', '808c6b6b-aeb7-4496-847d-3328a1480368', '1695365', '1695365', 'win', 'balance_withdrawal', 4.00, 'play_fiver', 0, 1, '4a93dca6d05a0bfd', '2024-07-12 16:32:18', '2024-07-12 16:32:18'),
(385, 273, 'fdc4a3184a61ac18', '60ee7a83-8834-4a52-913c-5c3104cea668', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'fdc4a3184a61ac18', '2024-07-12 16:32:25', '2024-07-12 16:32:25'),
(386, 273, '0e0e7c6da98b1c0d', '22839431-c11c-40a7-9115-65836b6e9cf7', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0e0e7c6da98b1c0d', '2024-07-12 16:32:27', '2024-07-12 16:32:27'),
(387, 273, 'd53af8ac64377692', '7365ea61-b01a-4678-9bf2-a0ff3410d1cd', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd53af8ac64377692', '2024-07-12 16:32:28', '2024-07-12 16:32:28'),
(388, 273, 'e3e7a15eae617cff', '7eb8ec93-d7c5-468d-8ede-3da29769692b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'e3e7a15eae617cff', '2024-07-12 16:32:30', '2024-07-12 16:32:30'),
(389, 273, 'bdcb8b7f2f858d58', '36bc1464-0ccf-4641-a1c4-f12bd6f7b7a3', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'bdcb8b7f2f858d58', '2024-07-12 16:32:31', '2024-07-12 16:32:31'),
(390, 273, '554146c69bb1e44d', '750524c7-898d-4676-a42d-b7e42c2cf1ca', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '554146c69bb1e44d', '2024-07-12 16:32:32', '2024-07-12 16:32:32'),
(391, 273, 'cc570ba49c63a94d', 'b0cc6ff4-c42e-4f2a-8a4f-e9272ad20d8d', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'cc570ba49c63a94d', '2024-07-12 16:32:34', '2024-07-12 16:32:34'),
(392, 273, '66f3b576960c4181', '70c4213a-6940-44b4-b16c-9be56fa32c5b', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '66f3b576960c4181', '2024-07-12 16:32:35', '2024-07-12 16:32:35'),
(393, 273, 'ba1b5fc0d72a1728', '18852ec7-d3aa-423b-938d-196036ef7a22', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ba1b5fc0d72a1728', '2024-07-12 16:32:36', '2024-07-12 16:32:36'),
(394, 273, '9c4fc558d47cbeba', '40004b64-492b-4b54-9e3b-3e9c8b9f8ea3', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '9c4fc558d47cbeba', '2024-07-12 16:32:40', '2024-07-12 16:32:40'),
(395, 273, '7fb138a16418477b', '46d51a8b-7d0f-485f-a746-64c154a1de0b', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '7fb138a16418477b', '2024-07-12 16:32:41', '2024-07-12 16:32:41'),
(396, 273, 'e3ee6405610763b1', '78b5125e-6f0f-47c8-8494-e0ae19d4e93f', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'e3ee6405610763b1', '2024-07-12 16:32:43', '2024-07-12 16:32:43'),
(397, 273, '16f946b1c850cd91', 'c163d5e8-dea1-48fa-b88a-1dc492927a5c', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '16f946b1c850cd91', '2024-07-12 16:32:44', '2024-07-12 16:32:44'),
(398, 273, '3d4f6606df489261', '6fde26a5-62f1-48f4-9f46-dde6bfca9ac9', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '3d4f6606df489261', '2024-07-12 16:32:46', '2024-07-12 16:32:46'),
(399, 273, '243c9257bba7fba4', 'd8641935-0681-458d-8eb7-6c35b04b818d', '1695365', '1695365', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '243c9257bba7fba4', '2024-07-12 16:32:47', '2024-07-12 16:32:47'),
(400, 273, '25aa09fe1cd8e681', '45a76d93-b8cb-4b18-b207-3b9f6fc3df4b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '25aa09fe1cd8e681', '2024-07-12 16:32:50', '2024-07-12 16:32:50'),
(401, 273, '830cdf030497c3a4', '0b30290b-0aa4-4d46-bf59-fb8ce7d18c39', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '830cdf030497c3a4', '2024-07-12 16:32:51', '2024-07-12 16:32:51'),
(402, 273, 'd4f6cbdb689cff54', '332c454a-7e0b-4594-a030-388b23203f28', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'd4f6cbdb689cff54', '2024-07-12 16:32:55', '2024-07-12 16:32:55'),
(403, 273, '11342ccf35ea94d1', '19cb3a7a-47da-4a0b-9a2f-82564c96b5c9', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '11342ccf35ea94d1', '2024-07-12 16:32:57', '2024-07-12 16:32:57'),
(404, 273, 'bc93f60456e91eb3', '521d2dda-856a-405e-80ee-b3a82d38acaa', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'bc93f60456e91eb3', '2024-07-12 16:32:59', '2024-07-12 16:32:59'),
(405, 273, 'a136a0c4f8e07d47', '1cff8a3a-17e6-45d3-b141-480de503f341', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'a136a0c4f8e07d47', '2024-07-12 16:33:00', '2024-07-12 16:33:00'),
(406, 273, 'ac6bd1c2e1d8f608', '1db523b7-710e-4e9f-b34a-9825408e0fab', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ac6bd1c2e1d8f608', '2024-07-12 16:33:02', '2024-07-12 16:33:02'),
(407, 273, '7d0a32c78dbc4d64', '946fa759-b7a5-436d-a5e1-866582471897', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '7d0a32c78dbc4d64', '2024-07-12 16:33:03', '2024-07-12 16:33:03'),
(408, 273, 'b9528ec1c703a222', '5fe07fbb-88b3-4cad-ab83-fe0090d5fe4d', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'b9528ec1c703a222', '2024-07-12 16:33:04', '2024-07-12 16:33:04'),
(409, 273, '10aebcb530564f62', '53c943f8-38ad-4fcb-ace6-ffaae60ab5ac', '1695365', '1695365', 'win', 'balance', 30.00, 'play_fiver', 0, 1, '10aebcb530564f62', '2024-07-12 16:33:06', '2024-07-12 16:33:06'),
(410, 273, '484d0e7c14f49e89', '755db199-935b-4542-8386-3d30980209f5', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '484d0e7c14f49e89', '2024-07-12 16:33:16', '2024-07-12 16:33:16'),
(411, 273, 'cbea940f897c55f9', '168a9b6d-508b-43c3-b18e-c6b41961caf6', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, 'cbea940f897c55f9', '2024-07-12 16:33:18', '2024-07-12 16:33:18'),
(412, 273, '7e23d772ca1c425e', '37e4ba3a-c6a1-4fa8-9436-ca9870e275d9', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7e23d772ca1c425e', '2024-07-12 16:33:21', '2024-07-12 16:33:21'),
(413, 273, '002e67f4f52d62ce', '01067690-2666-4e06-ba5f-cbcfc0c7f830', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '002e67f4f52d62ce', '2024-07-12 16:33:22', '2024-07-12 16:33:22'),
(414, 273, '82e4ac7701693964', '80bbf486-d4e5-4f5a-aee4-2b7e48b3cebb', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '82e4ac7701693964', '2024-07-12 16:33:23', '2024-07-12 16:33:23'),
(415, 273, 'ec491199f36ea7ee', 'e4426a4c-68c1-4773-97bf-e8d6ea378e4a', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'ec491199f36ea7ee', '2024-07-12 16:33:25', '2024-07-12 16:33:25'),
(416, 273, 'e8b96677df4122b3', '939efd2b-75da-44e0-8ebe-db60b2ade181', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'e8b96677df4122b3', '2024-07-12 16:33:26', '2024-07-12 16:33:26'),
(417, 273, '67053645c0b85212', '1264d794-769e-4711-b017-1e3262694928', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '67053645c0b85212', '2024-07-12 16:33:28', '2024-07-12 16:33:28'),
(418, 273, 'a0deaf624b1258fe', '430ff648-6f06-4a6b-891a-2ffb5edb4ecd', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'a0deaf624b1258fe', '2024-07-12 16:33:29', '2024-07-12 16:33:29'),
(419, 273, 'aec9d86db0f53628', 'f17e0015-7547-4969-9895-9446f3794989', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'aec9d86db0f53628', '2024-07-12 16:33:31', '2024-07-12 16:33:31'),
(420, 273, '0c2224a53a83f602', '4c38ff3c-8cf3-4c92-a9ee-f3147c6b0cb4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0c2224a53a83f602', '2024-07-12 16:33:32', '2024-07-12 16:33:32'),
(421, 273, 'e64cd42ff92d2b2e', '321a9ba3-af61-463d-8024-6c8958aac2ed', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'e64cd42ff92d2b2e', '2024-07-12 16:33:33', '2024-07-12 16:33:33'),
(422, 273, 'd354af399d7be2c0', 'ba23a862-cbab-4ddf-a438-68bf9028e01b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd354af399d7be2c0', '2024-07-12 16:33:35', '2024-07-12 16:33:35'),
(423, 273, 'a6d0b4fbfbddede9', 'ca5da8d3-0450-41e3-b6ee-19da3a87b4c4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'a6d0b4fbfbddede9', '2024-07-12 16:33:36', '2024-07-12 16:33:36'),
(424, 273, '3e62dd9b593eb795', '75b0c88e-4830-4582-a153-8544a7009af8', '1695365', '1695365', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '3e62dd9b593eb795', '2024-07-12 16:33:38', '2024-07-12 16:33:38'),
(425, 273, '09214d6c8f1d172f', '74ae5968-b3eb-42cd-aa97-498cae50bbb9', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '09214d6c8f1d172f', '2024-07-12 16:33:48', '2024-07-12 16:33:48'),
(426, 273, '71f187b54112afde', '541414f5-4bc2-44fc-9f06-6b70f9d69ffd', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '71f187b54112afde', '2024-07-12 16:33:49', '2024-07-12 16:33:49'),
(427, 273, 'a2563464c0007686', 'c5bbdbf5-1e7e-49a6-b773-ced18aa02350', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, 'a2563464c0007686', '2024-07-12 16:33:50', '2024-07-12 16:33:50'),
(428, 273, 'd25a48534d0dfc8f', 'b99728c3-bae1-4ec1-b80b-e64c2894330e', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd25a48534d0dfc8f', '2024-07-12 16:33:53', '2024-07-12 16:33:53'),
(429, 273, '8b36b3b2f2aff6ca', '17941cfb-727f-4b94-8e9d-ea1453eebea7', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8b36b3b2f2aff6ca', '2024-07-12 16:33:54', '2024-07-12 16:33:54'),
(430, 273, 'bc8ff307e04d9442', 'f43afcd5-092e-445e-9958-23ecec065e7a', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'bc8ff307e04d9442', '2024-07-12 16:33:55', '2024-07-12 16:33:55'),
(431, 273, 'b3b1f55944ac8425', 'dbb7e3eb-05cb-4348-9305-4e73101f8417', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'b3b1f55944ac8425', '2024-07-12 16:33:57', '2024-07-12 16:33:57'),
(432, 273, '1acf9914565fe1cc', '8963af1f-799e-4ace-a7b0-4e4b800d466a', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1acf9914565fe1cc', '2024-07-12 16:33:58', '2024-07-12 16:33:58'),
(433, 273, '96e68dd985b08c5b', '1021b8d4-e441-4e09-bf17-6fed1fc700c0', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '96e68dd985b08c5b', '2024-07-12 16:34:00', '2024-07-12 16:34:00'),
(434, 273, '750f2e0038321bea', 'ea54183d-3085-4590-b2c4-2e4c6c80f176', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '750f2e0038321bea', '2024-07-12 16:34:01', '2024-07-12 16:34:01'),
(435, 273, '46148b4ce7f20c8d', '7b5bfcf2-5cea-4ed2-8255-422773cd8d92', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '46148b4ce7f20c8d', '2024-07-12 16:34:03', '2024-07-12 16:34:03'),
(436, 273, '1c67b147d7188315', '98c2c804-acf3-4779-8dd5-4c2b049431bb', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '1c67b147d7188315', '2024-07-12 16:34:05', '2024-07-12 16:34:05'),
(437, 273, '51c90ff4306366c0', 'c023295b-bbee-4599-9295-02f88a11fee0', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '51c90ff4306366c0', '2024-07-12 16:34:06', '2024-07-12 16:34:06'),
(438, 273, '4b2dfb4e4bfba3dd', '0d78b3a1-10b4-472c-8f7d-67534bb1819e', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '4b2dfb4e4bfba3dd', '2024-07-12 16:34:08', '2024-07-12 16:34:08'),
(439, 273, 'd8cdce613574d5ef', '1f69c447-6796-4976-a95c-16286ea1468c', '1695365', '1695365', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, 'd8cdce613574d5ef', '2024-07-12 16:34:09', '2024-07-12 16:34:09'),
(440, 273, 'dbd6588c3408d241', '33d44cd3-cf0c-40c0-8a06-14dbd2734715', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'dbd6588c3408d241', '2024-07-12 16:34:15', '2024-07-12 16:34:15'),
(441, 273, '2fbd3b5f1e35afb1', '5fa736ad-715e-4e0f-8c83-c763aed5c54b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '2fbd3b5f1e35afb1', '2024-07-12 16:34:17', '2024-07-12 16:34:17'),
(442, 273, '93c1d3bbda37f07c', '9a2109a9-d8cb-442a-acef-df47beafa276', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '93c1d3bbda37f07c', '2024-07-12 16:34:18', '2024-07-12 16:34:18'),
(443, 273, '479d89dc355472ce', '1683bf9e-b486-45ca-8666-7064ac45ea9d', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '479d89dc355472ce', '2024-07-12 16:34:20', '2024-07-12 16:34:20'),
(444, 273, '951b554563a95e96', '3253d7c3-fa5a-45d9-a7cb-107f271446a6', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '951b554563a95e96', '2024-07-12 16:34:22', '2024-07-12 16:34:22'),
(445, 273, '45b5e45c2b5eb38e', 'd110dd0a-d85d-4699-973d-8ad1a70076f1', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '45b5e45c2b5eb38e', '2024-07-12 16:34:24', '2024-07-12 16:34:24'),
(446, 273, '148dc5e682c0beee', '1fc58815-353e-44f9-ae84-098e91024deb', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '148dc5e682c0beee', '2024-07-12 16:34:25', '2024-07-12 16:34:25'),
(447, 273, '9a81708ed2b28fe2', '5e9348ff-e0f7-48a1-ada7-6969e723c4c4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '9a81708ed2b28fe2', '2024-07-12 16:34:27', '2024-07-12 16:34:27'),
(448, 273, '6466beb74f9db0e3', '81021c4d-7502-408d-8418-5d69bb8bbb3c', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '6466beb74f9db0e3', '2024-07-12 16:34:28', '2024-07-12 16:34:28'),
(449, 273, '4d75bf6bb137658e', 'eaf6e75c-ac73-4a45-98c5-3f4997e5bc16', '1695365', '1695365', 'win', 'balance_withdrawal', 36.00, 'play_fiver', 0, 1, '4d75bf6bb137658e', '2024-07-12 16:34:30', '2024-07-12 16:34:30'),
(450, 273, '09c8f99783cb4d16', '1b22d21c-74a9-4c65-a318-51bf7ad16a63', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '09c8f99783cb4d16', '2024-07-12 16:34:45', '2024-07-12 16:34:45'),
(451, 273, '3452fc582a1b4928', '69f5cecb-d6af-4abf-a754-17301ecb046d', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '3452fc582a1b4928', '2024-07-12 16:34:46', '2024-07-12 16:34:46'),
(452, 273, '5db0d24265a44105', '260bb68f-1353-4e09-9832-3497d4d2b4a1', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '5db0d24265a44105', '2024-07-12 16:34:51', '2024-07-12 16:34:51'),
(453, 273, 'c2f8ab967672d077', '77d58989-0896-48f1-a80b-34c689b8e8f4', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, 'c2f8ab967672d077', '2024-07-12 16:34:52', '2024-07-12 16:34:52'),
(454, 273, 'c853195f2e29d821', '67dc07aa-86b3-4a7a-a6ec-608300390f30', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'c853195f2e29d821', '2024-07-12 16:34:55', '2024-07-12 16:34:55'),
(455, 273, 'c324c48f36895c39', '89de07ea-7475-4a91-b75f-990a570e20b6', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'c324c48f36895c39', '2024-07-12 16:34:56', '2024-07-12 16:34:56'),
(456, 273, '600f7f44964a8bd6', '60fdf2ab-5da0-4938-ad56-0a6baecb156a', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '600f7f44964a8bd6', '2024-07-12 16:34:58', '2024-07-12 16:34:58'),
(457, 273, 'dc2fbf753b1707e5', '47e13ab1-0c8f-42ad-9d7d-a1d46f00be27', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'dc2fbf753b1707e5', '2024-07-12 16:35:02', '2024-07-12 16:35:02'),
(458, 273, '9940daa21394ea2b', '3cdf3d70-a5f9-46e3-9530-12bbc2605283', '1695365', '1695365', 'win', 'balance_withdrawal', 2.40, 'play_fiver', 0, 1, '9940daa21394ea2b', '2024-07-12 16:35:03', '2024-07-12 16:35:03'),
(459, 273, '7b6367f0615915bd', '4c9dabf2-951d-489e-baac-b479fca48de4', '1695365', '1695365', 'win', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7b6367f0615915bd', '2024-07-12 16:35:08', '2024-07-12 16:35:08'),
(460, 273, '9cd9cb671edac1fb', 'd130c398-add7-40e9-95da-8e50cc112b4b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '9cd9cb671edac1fb', '2024-07-12 16:35:10', '2024-07-12 16:35:10'),
(461, 273, '24a5144d69dd84b5', 'b185e8d5-5f15-4760-bfe7-918b769fc389', '1695365', '1695365', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '24a5144d69dd84b5', '2024-07-12 16:35:12', '2024-07-12 16:35:12'),
(462, 273, '43570377414906ab', '8cc21f80-c01b-4a6f-b504-6417134435a2', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '43570377414906ab', '2024-07-12 16:35:18', '2024-07-12 16:35:18'),
(463, 273, '8fc7213143f8034d', '7e881c46-026a-4605-a5a5-03bab05d78c2', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8fc7213143f8034d', '2024-07-12 16:35:19', '2024-07-12 16:35:19'),
(464, 273, '69a764b9b9f7a7c8', '14d1a4f3-4ee3-40b1-94f7-1a57001d07c7', '1695365', '1695365', 'win', 'balance_withdrawal', 4.80, 'play_fiver', 0, 1, '69a764b9b9f7a7c8', '2024-07-12 16:35:21', '2024-07-12 16:35:21'),
(465, 273, '7a842920ae0a7e44', '94ca60bb-cce4-45b4-b3cc-bf91e4cfda72', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, '7a842920ae0a7e44', '2024-07-12 16:35:23', '2024-07-12 16:35:23'),
(466, 273, 'dfdea693391e9a2f', '49dc0caf-7742-4b15-a398-48dd3d680c2e', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'dfdea693391e9a2f', '2024-07-12 16:35:25', '2024-07-12 16:35:25'),
(467, 273, 'c9a61ac1c5261ce4', 'a59ecdbe-c6cb-4b5b-b662-2b1d6ccebc2b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'c9a61ac1c5261ce4', '2024-07-12 16:35:27', '2024-07-12 16:35:27'),
(468, 273, 'e5271185c757af09', '0f262f3a-525d-4602-8290-b15665e5f977', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'e5271185c757af09', '2024-07-12 16:35:28', '2024-07-12 16:35:28'),
(469, 273, '679afb81350e9461', '490ea578-58a1-4d5c-8c16-0efe26b89381', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '679afb81350e9461', '2024-07-12 16:35:30', '2024-07-12 16:35:30'),
(470, 273, '7847dfccc0834c58', '0302501d-5192-458b-9efb-c0e6f1558573', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7847dfccc0834c58', '2024-07-12 16:35:31', '2024-07-12 16:35:31'),
(471, 273, '6fc557c74835c9b9', '56b71236-fa6b-4624-970c-95a91df3467e', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '6fc557c74835c9b9', '2024-07-12 16:35:33', '2024-07-12 16:35:33'),
(472, 273, '0fd44a38ebb122d7', '3ab67c4b-b50f-41e2-9bfd-f8f64dd290e4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0fd44a38ebb122d7', '2024-07-12 16:35:34', '2024-07-12 16:35:34'),
(473, 273, '7c9511c93b84c7bb', '14a3d5fa-ec79-46aa-97b6-9aafb9d07240', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7c9511c93b84c7bb', '2024-07-12 16:35:36', '2024-07-12 16:35:36'),
(474, 273, 'ba9dc9c45886ed6e', '65a4cabe-6aed-420c-9c9b-1af7688ddd51', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'ba9dc9c45886ed6e', '2024-07-12 16:35:37', '2024-07-12 16:35:37'),
(475, 273, '8ec73a00084be1c9', '546ff9fb-e7ae-4234-aaad-c04166727116', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8ec73a00084be1c9', '2024-07-12 16:35:38', '2024-07-12 16:35:38'),
(476, 273, '70fd6b03732b7194', '0f95b706-45fd-40cb-8e2a-3e69d1d15e66', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '70fd6b03732b7194', '2024-07-12 16:35:43', '2024-07-12 16:35:43'),
(477, 273, 'e3951fb64d465393', 'b43bc032-3e79-4ab3-87fb-fdcd0f25a448', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'e3951fb64d465393', '2024-07-12 16:35:45', '2024-07-12 16:35:45'),
(478, 273, '64ac91f7db5bcbb0', '96ccc21b-751d-41f2-ad96-84e8ba136e1b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '64ac91f7db5bcbb0', '2024-07-12 16:35:46', '2024-07-12 16:35:46'),
(479, 273, '979edaa393fea53c', 'fb337f62-18bf-4b3f-834e-2b11f1748f35', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '979edaa393fea53c', '2024-07-12 16:35:47', '2024-07-12 16:35:47'),
(480, 273, '62dc7dc4cdb6c001', '30a06fc1-f9cf-466d-bb6f-ebbc19091dd9', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '62dc7dc4cdb6c001', '2024-07-12 16:35:49', '2024-07-12 16:35:49'),
(481, 273, '87e4a8c377c6699b', '8d2da84a-2064-4239-a025-f7ed8a6d5a97', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '87e4a8c377c6699b', '2024-07-12 16:35:50', '2024-07-12 16:35:50');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(482, 273, '935b4175ebc3abe1', 'df03e43d-6efa-4ade-850a-1587f66b4df4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '935b4175ebc3abe1', '2024-07-12 16:35:52', '2024-07-12 16:35:52'),
(483, 273, '9fc334ec62b6cbee', '0e67b148-8eeb-4ded-a2f6-a96fb5725e93', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '9fc334ec62b6cbee', '2024-07-12 16:35:53', '2024-07-12 16:35:53'),
(484, 273, '9c405ef991d57426', 'b6ed11fa-1210-4f95-94e8-74bbe9badb9f', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '9c405ef991d57426', '2024-07-12 16:35:55', '2024-07-12 16:35:55'),
(485, 273, 'a760fdc72f5b7d46', '9e156d4a-299a-4c94-8e55-f35857613a84', '1695365', '1695365', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, 'a760fdc72f5b7d46', '2024-07-12 16:35:56', '2024-07-12 16:35:56'),
(486, 273, 'b373e42b61674b6e', '4a9c5218-6da2-4c5a-a1ee-fe9d0072f535', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'b373e42b61674b6e', '2024-07-12 16:36:00', '2024-07-12 16:36:00'),
(487, 273, '67b7c5852ff2d58d', '51b95dc1-00f6-4d6e-ab73-ea26bfa93ece', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '67b7c5852ff2d58d', '2024-07-12 16:36:01', '2024-07-12 16:36:01'),
(488, 273, 'ffca61567aec1e0f', '57c36427-d4f2-47bb-b484-2e73c7a16a01', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'ffca61567aec1e0f', '2024-07-12 16:36:02', '2024-07-12 16:36:02'),
(489, 273, 'd273d37f541ba3db', 'da5ebc87-1bb5-4efe-a562-9e8532563bbc', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd273d37f541ba3db', '2024-07-12 16:36:04', '2024-07-12 16:36:04'),
(490, 273, '07a1ada949d9d28d', '9b849693-e508-47b7-9a4e-fe0103607fa3', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '07a1ada949d9d28d', '2024-07-12 16:36:05', '2024-07-12 16:36:05'),
(491, 273, '485b563a4839af3f', '6cdec58a-6250-43c5-b101-f4508cbbfd33', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '485b563a4839af3f', '2024-07-12 16:36:07', '2024-07-12 16:36:07'),
(492, 273, '02e509f75d18be97', 'fc28b928-77ca-4741-a3fa-cca60e9495f8', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '02e509f75d18be97', '2024-07-12 16:36:08', '2024-07-12 16:36:08'),
(493, 273, 'f7023069cbba3837', 'f814a647-5e83-401c-b7c4-0619c392c5dc', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, 'f7023069cbba3837', '2024-07-12 16:36:10', '2024-07-12 16:36:10'),
(494, 273, '53b60e91691392c3', 'c841a027-d292-4f42-ae88-4b68c37aa07b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '53b60e91691392c3', '2024-07-12 16:36:12', '2024-07-12 16:36:12'),
(495, 273, '0ee72ef7af87d8cf', 'fab72eff-61fb-41b8-800e-66fb0dfa19d3', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0ee72ef7af87d8cf', '2024-07-12 16:36:13', '2024-07-12 16:36:13'),
(496, 273, '7c865372d3899c40', 'c50c07d3-59a7-49ea-8257-bafeee238871', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7c865372d3899c40', '2024-07-12 16:36:15', '2024-07-12 16:36:15'),
(497, 273, '061dde4438a30c70', 'ef1ff8fb-8fbb-4864-9fd6-9b49c76956a6', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '061dde4438a30c70', '2024-07-12 16:36:16', '2024-07-12 16:36:16'),
(498, 273, '0e08f87375ae74e6', 'e0a60ddd-19a5-496a-a1af-d20d2d9cb360', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0e08f87375ae74e6', '2024-07-12 16:36:18', '2024-07-12 16:36:18'),
(499, 273, '837d0ca51d430ec7', 'd2d8ad8d-04b5-4e3f-a5d0-4879427c5273', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '837d0ca51d430ec7', '2024-07-12 16:36:20', '2024-07-12 16:36:20'),
(500, 273, '0a9c16649f992b25', 'b35a3178-afd8-461d-aa80-cea7aa94b827', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0a9c16649f992b25', '2024-07-12 16:36:21', '2024-07-12 16:36:21'),
(501, 273, '937d273cf0508a34', 'c7938d38-d137-4f59-bdb4-44e37005d849', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '937d273cf0508a34', '2024-07-12 16:36:22', '2024-07-12 16:36:22'),
(502, 273, 'fd9bdc2f0e54748e', '9ac437ce-fdb1-410d-a412-f89f853d0469', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'fd9bdc2f0e54748e', '2024-07-12 16:36:24', '2024-07-12 16:36:24'),
(503, 273, '239d207e37f09694', '8a626ea8-d02d-4b0d-9c48-95a4e6addcb4', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '239d207e37f09694', '2024-07-12 16:36:25', '2024-07-12 16:36:25'),
(504, 273, '26b777dc2a633fba', '508c5493-e099-421b-8d94-a024cf5775f3', '1695365', '1695365', 'win', 'balance_withdrawal', 28.80, 'play_fiver', 0, 1, '26b777dc2a633fba', '2024-07-12 16:36:27', '2024-07-12 16:36:27'),
(505, 273, '5de3151c0f1ec2e0', 'e363ed0d-e4aa-4fb0-8cf2-f6d37abc6d41', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '5de3151c0f1ec2e0', '2024-07-12 16:37:42', '2024-07-12 16:37:42'),
(506, 273, '059fd08d077d6bd7', '79f24cda-9dc6-476b-845f-5b54d129fa81', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '059fd08d077d6bd7', '2024-07-12 16:37:45', '2024-07-12 16:37:45'),
(507, 273, 'e5449dc0958b57cc', '876c2a58-8058-472c-8639-9282436ad818', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'e5449dc0958b57cc', '2024-07-12 16:37:47', '2024-07-12 16:37:47'),
(508, 273, '1b54e45200121bbc', '11b2ea28-fb86-48b9-bb82-8f89d4eb22e2', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '1b54e45200121bbc', '2024-07-12 16:37:48', '2024-07-12 16:37:48'),
(509, 273, 'f67bea8cd38d5681', '7bd3198a-15db-4e47-8bb6-6947a3dfcf3f', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'f67bea8cd38d5681', '2024-07-12 16:37:49', '2024-07-12 16:37:49'),
(510, 273, '22b2bb87739f86d1', '51a52ede-7918-49b9-8dc9-cd565db3568a', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '22b2bb87739f86d1', '2024-07-12 16:37:51', '2024-07-12 16:37:51'),
(511, 273, 'bd4f102ba82dc750', '217624ac-ac4a-4713-842c-eeb5f9646fbf', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'bd4f102ba82dc750', '2024-07-12 16:37:51', '2024-07-12 16:37:51'),
(512, 273, '7bb15d595f8b7c10', '777532ca-a881-4ae1-9d3b-bf67708f34e7', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '7bb15d595f8b7c10', '2024-07-12 16:37:52', '2024-07-12 16:37:52'),
(513, 273, '6acf50985aa5ed89', '27c95878-9169-47de-a905-a672a9be3516', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '6acf50985aa5ed89', '2024-07-12 16:37:53', '2024-07-12 16:37:53'),
(514, 273, 'cfe8670f3cbf4f6c', 'ab27bc67-a657-4317-a094-2c2e61b67207', '98', '98', 'win', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'cfe8670f3cbf4f6c', '2024-07-12 16:37:54', '2024-07-12 16:37:54'),
(515, 273, 'be96abb5601c96bb', '5c497b9d-993c-44f4-8ed2-0342c247508b', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'be96abb5601c96bb', '2024-07-12 16:37:56', '2024-07-12 16:37:56'),
(516, 273, 'f5bfd03ae48422c8', '77992b64-bb08-42a1-ab8b-018bc898ee1b', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'f5bfd03ae48422c8', '2024-07-12 16:37:57', '2024-07-12 16:37:57'),
(517, 273, 'f5b9496c1b2b2b92', 'f669b929-976b-4f04-a40c-e63c06dc6fb7', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'f5b9496c1b2b2b92', '2024-07-12 16:37:59', '2024-07-12 16:37:59'),
(518, 273, '0e83d4358aced1e3', '6767a9c2-952b-4d2c-911d-878a3d1b6bff', '98', '98', 'win', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '0e83d4358aced1e3', '2024-07-12 16:38:22', '2024-07-12 16:38:22'),
(519, 273, '0af0a87956276eea', '54fb55b4-9beb-47e4-9fb2-0a7ce93e18fb', '98', '98', 'win', 'balance_withdrawal', 1.25, 'play_fiver', 0, 1, '0af0a87956276eea', '2024-07-12 16:38:29', '2024-07-12 16:38:29'),
(520, 273, 'b5dc4a81c0b7cdec', 'df871e81-2c39-409a-8250-449e19f8a616', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'b5dc4a81c0b7cdec', '2024-07-12 16:38:31', '2024-07-12 16:38:31'),
(521, 273, 'd28ba16cf16b02b8', '11931ad0-baa4-4b49-b728-d4be247a1043', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'd28ba16cf16b02b8', '2024-07-12 16:38:32', '2024-07-12 16:38:32'),
(522, 273, '10e9df3fe2d8fef6', '65f08855-4661-400c-8869-fe784c7431ee', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '10e9df3fe2d8fef6', '2024-07-12 16:38:33', '2024-07-12 16:38:33'),
(523, 273, '5e3999ad15a8be2d', '5042d95f-4a4e-483a-af97-d9a783a5a235', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '5e3999ad15a8be2d', '2024-07-12 16:38:34', '2024-07-12 16:38:34'),
(524, 273, '50591e62b89f6414', 'dff10cea-3ce3-4830-b01b-9e748457e291', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '50591e62b89f6414', '2024-07-12 16:38:36', '2024-07-12 16:38:36'),
(525, 273, '816c0e441ca957e0', '347f48f8-2b61-4e62-8165-bb8912a9552a', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '816c0e441ca957e0', '2024-07-12 16:38:37', '2024-07-12 16:38:37'),
(526, 273, '6625ef2627c1ec69', '47b66119-6d12-4c86-8e92-00444144bae9', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '6625ef2627c1ec69', '2024-07-12 16:38:39', '2024-07-12 16:38:39'),
(527, 273, 'baceef479b893642', '275378ec-2947-40f6-9705-864a627c0419', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'baceef479b893642', '2024-07-12 16:38:39', '2024-07-12 16:38:39'),
(528, 273, '28cfd34b0d0855aa', '57688675-50ad-43f6-aba8-3856c044ed81', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '28cfd34b0d0855aa', '2024-07-12 16:38:40', '2024-07-12 16:38:40'),
(529, 273, 'f15d65b0da19b45b', '67677657-2376-4aa5-91b4-8a63a6288c50', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'f15d65b0da19b45b', '2024-07-12 16:38:43', '2024-07-12 16:38:43'),
(530, 273, '944a6a4b4b5f4f1b', '99a9cb06-9fc6-4e49-8014-2792e874a8ec', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '944a6a4b4b5f4f1b', '2024-07-12 16:38:44', '2024-07-12 16:38:44'),
(531, 273, 'c453a041e8fc71a3', '0a8ca62a-72d9-408a-bb5d-2d62015e5498', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'c453a041e8fc71a3', '2024-07-12 16:38:45', '2024-07-12 16:38:45'),
(532, 273, 'd44a81e0534d2ec6', 'aba423d1-ee40-4907-ae34-25905225e0e7', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'd44a81e0534d2ec6', '2024-07-12 16:38:46', '2024-07-12 16:38:46'),
(533, 273, '1900abd4d35dbaf3', 'dacdb322-4cf4-4aee-8927-91083578dc45', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '1900abd4d35dbaf3', '2024-07-12 16:38:47', '2024-07-12 16:38:47'),
(534, 273, '9f4c46985b7a2588', 'abb2e034-e047-497e-a630-39fd40e3245a', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '9f4c46985b7a2588', '2024-07-12 16:38:48', '2024-07-12 16:38:48'),
(535, 273, '94c99f5d23e233de', '663fa9e3-55bf-45f2-b52f-c28296e3ed55', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '94c99f5d23e233de', '2024-07-12 16:38:49', '2024-07-12 16:38:49'),
(536, 273, 'c662c80c48a2ae2c', '61ca6db5-771c-4d3e-92c4-a01633d78d76', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'c662c80c48a2ae2c', '2024-07-12 16:38:51', '2024-07-12 16:38:51'),
(537, 273, '6b6bb21fc94c1003', '77f2d249-5709-4fb6-8d1e-209277d69905', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '6b6bb21fc94c1003', '2024-07-12 16:38:52', '2024-07-12 16:38:52'),
(538, 273, '410828604ae958e2', '785801b7-710e-478d-9c2c-226d13348768', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '410828604ae958e2', '2024-07-12 16:38:53', '2024-07-12 16:38:53'),
(539, 273, '697a62be96366c3f', '306a5d82-a57a-4e25-9629-f2dbc6ae6e0a', '98', '98', 'win', 'balance_withdrawal', 10.00, 'play_fiver', 0, 1, '697a62be96366c3f', '2024-07-12 16:38:55', '2024-07-12 16:38:55'),
(540, 273, '694cad1442755a2e', 'ac000139-263d-4537-8a3e-408ebf6ec63c', '98', '98', 'win', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '694cad1442755a2e', '2024-07-12 16:39:05', '2024-07-12 16:39:05'),
(541, 273, 'd45bddccaa5d052d', 'c45e815c-2824-452a-b5d2-78983180e2f9', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'd45bddccaa5d052d', '2024-07-12 16:39:07', '2024-07-12 16:39:07'),
(542, 273, 'bb99a0f177db9aa6', '1346b22d-1f00-40cd-928a-23457c3d84d9', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'bb99a0f177db9aa6', '2024-07-12 16:39:08', '2024-07-12 16:39:08'),
(543, 273, '27cb912f6085785c', 'f0d1543e-2b7c-45fc-bbd2-1a4e36e838f4', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '27cb912f6085785c', '2024-07-12 16:39:09', '2024-07-12 16:39:09'),
(544, 273, '3e824656106092e7', '7727646d-4cb9-4ef7-bb5e-d37d09d81b7d', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '3e824656106092e7', '2024-07-12 16:39:10', '2024-07-12 16:39:10'),
(545, 273, '5ff292179164b15e', '70e00691-b817-4ad3-98a3-323ef415564d', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '5ff292179164b15e', '2024-07-12 16:39:13', '2024-07-12 16:39:13'),
(546, 273, 'c407a209a87707cb', '61476ca9-32cf-4aea-83e1-aee6ff332f67', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'c407a209a87707cb', '2024-07-12 16:39:14', '2024-07-12 16:39:14'),
(547, 273, '82daf67c233129a5', 'd5810e99-e3cb-4eff-9239-3257d6fe5adc', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '82daf67c233129a5', '2024-07-12 16:39:15', '2024-07-12 16:39:15'),
(548, 273, '536706f1403ce135', '05cbb869-eac9-49d1-a731-ed210d426eb2', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '536706f1403ce135', '2024-07-12 16:39:16', '2024-07-12 16:39:16'),
(549, 273, '48b0b20d0879801f', '17103eda-4f76-4a71-a7b6-ae9b825890a9', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '48b0b20d0879801f', '2024-07-12 16:39:17', '2024-07-12 16:39:17'),
(550, 273, '65fd253e60e18d00', 'ce25e224-2a58-4531-8cab-a675aaeea525', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '65fd253e60e18d00', '2024-07-12 16:39:18', '2024-07-12 16:39:18'),
(551, 273, '98939898dd909e9c', 'fd53df4d-fe61-4a57-b359-783f7e99a64c', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '98939898dd909e9c', '2024-07-12 16:39:18', '2024-07-12 16:39:18'),
(552, 273, '8eb678eec1d04449', '2d67def1-34e4-4ad0-a3b6-bfba46649e08', '98', '98', 'win', 'balance_withdrawal', 2.50, 'play_fiver', 0, 1, '8eb678eec1d04449', '2024-07-12 16:39:19', '2024-07-12 16:39:19'),
(553, 273, '882452eac13392d5', '6e5382ea-7a85-4233-a2dd-d868f636c684', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '882452eac13392d5', '2024-07-12 16:39:24', '2024-07-12 16:39:24'),
(554, 273, 'b9ca5a718f37f289', 'bf8f4e2b-8bd5-42de-b165-b2a13bd3111e', '98', '98', 'win', 'balance_withdrawal', 3.00, 'play_fiver', 0, 1, 'b9ca5a718f37f289', '2024-07-12 16:39:25', '2024-07-12 16:39:25'),
(555, 273, '04f954246dbed527', '8304ee0f-ee8c-4863-b24b-23060c9ffb6f', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '04f954246dbed527', '2024-07-12 16:39:27', '2024-07-12 16:39:27'),
(556, 273, '012cd7ca49c5e96e', '69d83254-f225-4218-a612-69a9d0c75c65', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '012cd7ca49c5e96e', '2024-07-12 16:39:28', '2024-07-12 16:39:28'),
(557, 273, 'c85369632799d5da', '0aba7447-1308-43aa-94f5-0de7e22521a9', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'c85369632799d5da', '2024-07-12 16:39:30', '2024-07-12 16:39:30'),
(558, 273, 'aab618e82a31a955', 'c3213876-7ba7-4d32-a35c-576a18b4689a', '98', '98', 'win', 'balance_withdrawal', 15.00, 'play_fiver', 0, 1, 'aab618e82a31a955', '2024-07-12 16:39:31', '2024-07-12 16:39:31'),
(559, 273, 'af9cffd41300cd5a', '7a1fc6f7-d584-4472-b821-2f39d83b559f', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'af9cffd41300cd5a', '2024-07-12 16:39:35', '2024-07-12 16:39:35'),
(560, 273, '08bd8d4786f9a39c', '7aeba3bb-ee22-422b-9340-312db15b13a3', '98', '98', 'win', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '08bd8d4786f9a39c', '2024-07-12 16:39:36', '2024-07-12 16:39:36'),
(561, 273, '50fc47bd67060c25', 'b86b6444-dcc0-4aa8-8cd0-de135697a596', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '50fc47bd67060c25', '2024-07-12 16:39:39', '2024-07-12 16:39:39'),
(562, 273, 'c3bdec749695f262', 'fb4ebe66-78ab-4fd2-9215-4168a2e59db2', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'c3bdec749695f262', '2024-07-12 16:39:40', '2024-07-12 16:39:40'),
(563, 273, '38ed5b37c0db2922', 'bc5f25e5-9934-48f2-b96f-9429f1292fd2', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '38ed5b37c0db2922', '2024-07-12 16:39:42', '2024-07-12 16:39:42'),
(564, 273, 'bedaeee6e0948cf1', '54b0658d-5749-4c7b-bf81-3d43b34020e5', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'bedaeee6e0948cf1', '2024-07-12 16:39:43', '2024-07-12 16:39:43'),
(565, 273, '39f35f4c4cd6f64d', '053ac1b1-8286-4f62-8296-3693a4ac4ddf', '98', '98', 'win', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '39f35f4c4cd6f64d', '2024-07-12 16:39:45', '2024-07-12 16:39:45'),
(566, 273, 'b4e1ec62e52eed45', '43441461-e5d2-4fb9-ab40-94ba4d95cd48', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'b4e1ec62e52eed45', '2024-07-12 16:39:48', '2024-07-12 16:39:48'),
(567, 273, '9409b2750ad056e1', '306aa65b-2063-4e8f-82b1-0b1fa9e4b790', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '9409b2750ad056e1', '2024-07-12 16:39:49', '2024-07-12 16:39:49'),
(568, 273, '2e5d8e5268c85e0a', '043b92ae-fe1b-499c-8efb-1f24eb8a3f04', '98', '98', 'win', 'balance_withdrawal', 0.75, 'play_fiver', 0, 1, '2e5d8e5268c85e0a', '2024-07-12 16:39:50', '2024-07-12 16:39:50'),
(569, 273, '25d0a4ae1abfd377', '892b9c2b-1401-4df4-8d98-0535bcdecb37', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '25d0a4ae1abfd377', '2024-07-12 16:39:52', '2024-07-12 16:39:52'),
(570, 273, 'f62b1882089db7da', '421d5452-01ae-46b7-b6f2-08e397f9e516', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'f62b1882089db7da', '2024-07-12 16:39:54', '2024-07-12 16:39:54'),
(571, 273, 'c5249d530cd2ba3e', '46d243ed-c92c-42a3-9e70-a09c6d28f7ef', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'c5249d530cd2ba3e', '2024-07-12 16:39:55', '2024-07-12 16:39:55'),
(572, 273, 'ce8d588442f605e6', '4f4875ff-6da8-45ab-b71c-a1b41befb3aa', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'ce8d588442f605e6', '2024-07-12 16:39:56', '2024-07-12 16:39:56'),
(573, 273, '56b657ac79652399', '4a39fed0-40d1-4da6-8515-377bd799deca', '98', '98', 'win', 'balance_withdrawal', 0.90, 'play_fiver', 0, 1, '56b657ac79652399', '2024-07-12 16:39:57', '2024-07-12 16:39:57'),
(574, 273, '63983e4157af8134', '60a8aa77-2898-47e0-9642-a575a004609c', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '63983e4157af8134', '2024-07-12 16:39:59', '2024-07-12 16:39:59'),
(575, 273, 'fa10c404dd1535bd', '9758c653-ff57-4903-8cd7-400d48483000', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'fa10c404dd1535bd', '2024-07-12 16:40:07', '2024-07-12 16:40:07'),
(576, 273, 'e8ae7f1a125a3870', 'd5f074dd-8e65-4a0d-a7be-654f1356dd38', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'e8ae7f1a125a3870', '2024-07-12 16:40:08', '2024-07-12 16:40:08'),
(577, 273, '6b1086f3756f95fb', '4d211918-eaf0-4102-8e0e-ed5eca857f3e', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '6b1086f3756f95fb', '2024-07-12 16:40:09', '2024-07-12 16:40:09'),
(578, 273, '2fecc808dd4bef4f', 'f9eb5cfb-8b6e-43c6-9362-367e22286f8a', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '2fecc808dd4bef4f', '2024-07-12 16:40:10', '2024-07-12 16:40:10'),
(579, 273, 'cdf3a8221a46ef01', '848a1518-08f9-43ce-9bbc-711efc738b1b', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'cdf3a8221a46ef01', '2024-07-12 16:40:11', '2024-07-12 16:40:11'),
(580, 273, '30f2a589d404e64a', '10d16785-a0c7-46ea-8f8d-cc6cda6f4897', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '30f2a589d404e64a', '2024-07-12 16:40:13', '2024-07-12 16:40:13'),
(581, 273, 'e0c22b20948963a7', '30409adf-a1b1-4cef-98cf-e4af64659cc5', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'e0c22b20948963a7', '2024-07-12 16:40:15', '2024-07-12 16:40:15'),
(582, 273, '2e8ddd1bb78f464c', 'ee1b84e9-39a5-41c1-b7ec-798afd864874', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '2e8ddd1bb78f464c', '2024-07-12 16:40:15', '2024-07-12 16:40:15'),
(583, 273, 'd52bf7917cd38665', '263f5c79-8c57-4d3a-a2d8-f14d3b857a69', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'd52bf7917cd38665', '2024-07-12 16:40:16', '2024-07-12 16:40:16'),
(584, 273, '1d075a02de04371a', '2041ad07-6321-4cd0-8065-d1dc951a2d74', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '1d075a02de04371a', '2024-07-12 16:40:17', '2024-07-12 16:40:17'),
(585, 273, '8a5dc736e7790cad', '25175e85-e12b-4fe8-b482-3f6f7c0a9b6d', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '8a5dc736e7790cad', '2024-07-12 16:40:19', '2024-07-12 16:40:19'),
(586, 273, '477e1fd064d29cf0', 'e87a5330-85f8-4648-ba67-5a69692ed582', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '477e1fd064d29cf0', '2024-07-12 16:40:19', '2024-07-12 16:40:19'),
(587, 273, '69a2b7cd67d20e57', '9cee3104-5ab2-4bf2-a968-cc30ab191115', '98', '98', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '69a2b7cd67d20e57', '2024-07-12 16:40:20', '2024-07-12 16:40:20'),
(588, 273, '7d6b52483ecceac6', '0fb1ac94-c5d2-41e2-b374-6fb54bb08485', '98', '98', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '7d6b52483ecceac6', '2024-07-12 16:40:21', '2024-07-12 16:40:21'),
(589, 273, 'b6d1508901cc7ee6', 'c0d16549-c537-43dd-af34-a9e411d3c89d', '98', '98', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, 'b6d1508901cc7ee6', '2024-07-12 16:40:22', '2024-07-12 16:40:22'),
(590, 273, '09786304b8a9e135', '28dc19bb-beae-4796-a013-8bbcc49829cc', '98', '98', 'bet', 'balance', 50.00, 'play_fiver', 0, 1, '09786304b8a9e135', '2024-07-12 16:40:24', '2024-07-12 16:40:24'),
(591, 273, '95ff5b620a4d0622', 'd0b8b29c-edc7-42a2-9128-62e06831ddfc', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '95ff5b620a4d0622', '2024-07-12 16:40:27', '2024-07-12 16:40:27'),
(592, 273, 'bbc36ea841e75579', 'aee18896-bcc2-412a-923b-2e1be04147fa', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, 'bbc36ea841e75579', '2024-07-12 16:40:27', '2024-07-12 16:40:27'),
(593, 273, '2372e9568614a20d', '40ffd6b2-32c7-46ae-ac8a-f44383acc764', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '2372e9568614a20d', '2024-07-12 16:40:28', '2024-07-12 16:40:28'),
(594, 273, '855c785c32bddeda', '6b5c3a31-c442-4cab-812b-f25d87e3c2e2', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '855c785c32bddeda', '2024-07-12 16:40:31', '2024-07-12 16:40:31'),
(595, 273, '3c03bf1e866784bf', 'acbc9b51-d009-46fe-b1f7-966097829b27', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '3c03bf1e866784bf', '2024-07-12 16:40:31', '2024-07-12 16:40:31'),
(596, 273, 'd1d26cc2d42799a7', '910c45dc-12e0-4194-bb53-006533f337bd', '98', '98', 'win', 'balance', 2.50, 'play_fiver', 0, 1, 'd1d26cc2d42799a7', '2024-07-12 16:40:32', '2024-07-12 16:40:32'),
(597, 273, '5d4cf3dbcaae3fbe', '0c287347-fd0f-4520-ae41-79b00d6cfcb5', '98', '98', 'bet', 'balance_withdrawal', 2.50, 'play_fiver', 0, 1, '5d4cf3dbcaae3fbe', '2024-07-12 16:40:34', '2024-07-12 16:40:34'),
(598, 273, '8aff6062ad9a77a4', '59ffb2d8-6ef8-41cb-ac47-9802d260fe5d', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '8aff6062ad9a77a4', '2024-07-12 16:40:36', '2024-07-12 16:40:36'),
(599, 273, '989f1f6e817523f3', 'affff14c-b3fd-4d18-9369-3ccc1bfde2fc', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '989f1f6e817523f3', '2024-07-12 16:40:37', '2024-07-12 16:40:37'),
(600, 273, '30136c523e2e1e91', '1795f51b-ed89-4c5b-9478-7a2738f6b07a', '98', '98', 'win', 'balance_withdrawal', 0.25, 'play_fiver', 0, 1, '30136c523e2e1e91', '2024-07-12 16:40:39', '2024-07-12 16:40:39'),
(601, 273, '00a469d511abf741', '8199774e-327b-4461-8394-085da7216536', '98', '98', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '00a469d511abf741', '2024-07-12 16:40:41', '2024-07-12 16:40:41'),
(602, 1, '38b69ba8f04250a5', '1deba830-bb53-40ce-8bea-25df2048e14f', '1695365', '1695365', 'win', 'balance', 64.00, 'play_fiver', 0, 1, '38b69ba8f04250a5', '2024-07-12 17:03:53', '2024-07-12 17:03:53'),
(603, 273, '056f6ed799265633', 'a4d8582a-180c-4d3b-851c-6334defc947e', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '056f6ed799265633', '2024-07-12 19:35:10', '2024-07-12 19:35:10'),
(604, 278, '1b998fbd6967210e', '7c9561d4-06b4-44d7-89e9-95e2822b53e9', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '1b998fbd6967210e', '2024-07-12 21:44:01', '2024-07-12 21:44:01'),
(605, 278, 'ef057ba8549bcd01', '80be9883-f0ec-4c62-a2d8-c7c0697fa1fa', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'ef057ba8549bcd01', '2024-07-12 21:44:02', '2024-07-12 21:44:02'),
(606, 278, '03631ff3a13304b7', '2270e534-f9c6-4473-9732-c4a71d4bdfb7', '1695365', '1695365', 'win', 'balance_bonus', 1.60, 'play_fiver', 0, 1, '03631ff3a13304b7', '2024-07-12 21:44:03', '2024-07-12 21:44:03'),
(607, 278, '546b78676e5ebffa', '85d5c160-0258-464f-b387-231663a73f24', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '546b78676e5ebffa', '2024-07-12 21:44:06', '2024-07-12 21:44:06'),
(608, 278, '45dcabce93344995', '95f90254-e758-4ebe-8cab-7f0297ba9317', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '45dcabce93344995', '2024-07-12 21:44:08', '2024-07-12 21:44:08'),
(609, 278, '7d3223348b0d154a', 'c04227e0-be4d-437b-9d40-b5d08c184ad4', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '7d3223348b0d154a', '2024-07-12 21:44:10', '2024-07-12 21:44:10'),
(610, 278, '53895f4dbdd4e65c', 'e183824c-0176-4b62-a6bc-34a26ae12315', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '53895f4dbdd4e65c', '2024-07-12 21:44:19', '2024-07-12 21:44:19'),
(611, 278, 'cbae9a884735a90e', '8294cd1e-b75c-46e0-822f-d4bf07358379', '1695365', '1695365', 'win', 'balance_bonus', 0.80, 'play_fiver', 0, 1, 'cbae9a884735a90e', '2024-07-12 21:44:20', '2024-07-12 21:44:20'),
(612, 278, 'b2345487c9bf8399', '098a5a8d-3501-47fa-b64d-5601dd77259f', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'b2345487c9bf8399', '2024-07-12 21:44:22', '2024-07-12 21:44:22'),
(613, 278, '564e4ebb5cf6b28a', '4618741b-6212-496b-a7eb-6e8b817d84f5', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '564e4ebb5cf6b28a', '2024-07-12 21:44:22', '2024-07-12 21:44:22'),
(614, 278, 'ae03d779317a020c', '55f6378e-efd3-4e06-94ad-14dec05ec7a9', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'ae03d779317a020c', '2024-07-12 21:44:24', '2024-07-12 21:44:24'),
(615, 278, '9dcbf3631e8a0f60', '69bd75db-a311-48d4-91bf-ef3038fbeb10', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '9dcbf3631e8a0f60', '2024-07-12 21:44:25', '2024-07-12 21:44:25'),
(616, 278, '5f0f5430725fbb6b', '4f54fbd3-de87-4a9d-bc4d-b5ad41953cb7', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '5f0f5430725fbb6b', '2024-07-12 21:44:26', '2024-07-12 21:44:26'),
(617, 278, 'c7aa8058d6174eaa', '82768684-85cf-4529-a6c9-982d26a85b8b', '1695365', '1695365', 'win', 'balance_bonus', 0.24, 'play_fiver', 0, 1, 'c7aa8058d6174eaa', '2024-07-12 21:44:27', '2024-07-12 21:44:27'),
(618, 278, '77ba67cb30faf5ea', '684b3755-6210-44bc-b1af-961ef6030c9a', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '77ba67cb30faf5ea', '2024-07-12 21:44:28', '2024-07-12 21:44:28'),
(619, 278, 'e1315cb327dbf5a9', '3f405a8c-6dce-41cb-b45b-bd77d6645c9c', '1695365', '1695365', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'e1315cb327dbf5a9', '2024-07-12 21:44:29', '2024-07-12 21:44:29'),
(620, 278, '861faac6354c4dfc', '83d53d15-72d7-4ffd-a418-f00ad49d11ee', '1695365', '1695365', 'win', 'balance_bonus', 25.20, 'play_fiver', 0, 1, '861faac6354c4dfc', '2024-07-12 21:44:32', '2024-07-12 21:44:32'),
(621, 280, '0e916d08b75f929b', '95e915af-c484-4a36-9c83-d1013b215385', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '0e916d08b75f929b', '2024-07-12 22:07:45', '2024-07-12 22:07:45'),
(622, 280, '9b6b5ca9bb839a4e', '11a781c7-ac8c-4f92-a2b4-8ead897531d6', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '9b6b5ca9bb839a4e', '2024-07-12 22:07:48', '2024-07-12 22:07:48'),
(623, 280, '3d0bd3951988cb04', '83c3cfc8-ccf1-48ac-b5a1-e8dcbc857d7a', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '3d0bd3951988cb04', '2024-07-12 22:07:48', '2024-07-12 22:07:48'),
(624, 280, '057a54447ff38e21', 'c042ebf6-a910-4ef8-9c5b-f298f061e6b7', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '057a54447ff38e21', '2024-07-12 22:07:49', '2024-07-12 22:07:49'),
(625, 280, 'a7ba44938379812f', '2461ad1d-cc23-42ff-897c-0005cf3e6650', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'a7ba44938379812f', '2024-07-12 22:07:50', '2024-07-12 22:07:50'),
(626, 280, '6e6a0d39d514818e', '69746d0d-d68d-4c9b-84b7-242f6b751904', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6e6a0d39d514818e', '2024-07-12 22:07:51', '2024-07-12 22:07:51'),
(627, 280, 'e283610b07facec8', '4531a023-3e89-4ac4-b0f9-fb78e273590b', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'e283610b07facec8', '2024-07-12 22:07:52', '2024-07-12 22:07:52'),
(628, 280, 'e658d80f4f5ad008', '455662e7-dbfb-4e3e-b8bc-c242160026d6', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'e658d80f4f5ad008', '2024-07-12 22:07:53', '2024-07-12 22:07:53'),
(629, 280, '9cb6367a81214eb3', 'd4151117-118a-4825-b8ae-43b366a93a7e', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '9cb6367a81214eb3', '2024-07-12 22:07:54', '2024-07-12 22:07:54'),
(630, 280, '4d4ec6cd240c6eac', '7422ddb1-aad4-4c5c-b157-906b2ac7eb53', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '4d4ec6cd240c6eac', '2024-07-12 22:07:55', '2024-07-12 22:07:55'),
(631, 280, '8ebc1aee46a9c350', '1236874b-24f2-4853-80b2-2ff7c740b5df', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '8ebc1aee46a9c350', '2024-07-12 22:07:56', '2024-07-12 22:07:56'),
(632, 280, 'ce00570f2ea28469', '3d0f401a-c99d-4136-bcde-810b79ea8364', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'ce00570f2ea28469', '2024-07-12 22:07:57', '2024-07-12 22:07:57'),
(633, 280, '32a5dd5518127dc9', '3426698b-1ef2-4898-b85d-563a21aed19c', '1695365', '1695365', 'win', 'balance', 2.00, 'play_fiver', 0, 1, '32a5dd5518127dc9', '2024-07-12 22:07:58', '2024-07-12 22:07:58'),
(634, 280, 'fdb6f7ae9c39bb3c', '50ba5287-bf80-4ce7-a264-fd30008c23db', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'fdb6f7ae9c39bb3c', '2024-07-12 22:08:01', '2024-07-12 22:08:01'),
(635, 280, 'bde12c4c2a120c64', 'e802d097-ff52-4923-ba3f-2fe0d6bd700a', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'bde12c4c2a120c64', '2024-07-12 22:08:02', '2024-07-12 22:08:02'),
(636, 280, 'a55ef1441a7f011d', '6befc28f-b963-48f5-8016-365977381235', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a55ef1441a7f011d', '2024-07-12 22:08:03', '2024-07-12 22:08:03'),
(637, 280, '6de8095d15d9d6a7', '3010748b-e8e9-47af-a25d-f0a19cb238be', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '6de8095d15d9d6a7', '2024-07-12 22:08:07', '2024-07-12 22:08:07'),
(638, 280, 'e78d746c328aa237', '4f3218ef-a411-494d-9210-2374aa9b755c', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'e78d746c328aa237', '2024-07-12 22:08:08', '2024-07-12 22:08:08'),
(639, 280, '55f93d47cf2800f0', '8c72bf30-d17c-4292-be75-e8cbfad6ed10', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '55f93d47cf2800f0', '2024-07-12 22:08:12', '2024-07-12 22:08:12'),
(640, 280, '452181af6c6e391e', '211e6af9-699a-4bf0-bbf7-98b7b8441706', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '452181af6c6e391e', '2024-07-12 22:08:13', '2024-07-12 22:08:13'),
(641, 280, '1fb52146ce9e8455', 'd0c39bad-63ed-4ea0-869a-636db8a955a1', '1695365', '1695365', 'win', 'balance', 0.80, 'play_fiver', 0, 1, '1fb52146ce9e8455', '2024-07-12 22:08:14', '2024-07-12 22:08:14'),
(642, 280, 'c48078cb9501f6e7', 'a75c0143-5e8b-461d-b577-923fbbee7761', '1695365', '1695365', 'win', 'balance', 0.40, 'play_fiver', 0, 1, 'c48078cb9501f6e7', '2024-07-12 22:12:19', '2024-07-12 22:12:19'),
(643, 280, 'cb09f225b16fb660', '94c94061-3bf3-4270-9a3e-94cdacaed7cb', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'cb09f225b16fb660', '2024-07-12 22:12:22', '2024-07-12 22:12:22'),
(644, 280, '1889734bc56a7ebe', '6c879574-db6f-476c-9f4a-1435b35d09ea', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '1889734bc56a7ebe', '2024-07-12 22:12:23', '2024-07-12 22:12:23'),
(645, 280, '296b22ea36364230', '9e51dda2-918a-4748-9b41-b2ef8ee404ca', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '296b22ea36364230', '2024-07-12 22:12:24', '2024-07-12 22:12:24'),
(646, 280, '9513713ff0890fff', 'c472bc8f-d073-40b2-a2ec-f2276b5be522', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '9513713ff0890fff', '2024-07-12 22:12:25', '2024-07-12 22:12:25'),
(647, 280, '288eeec9b8814171', '0bd81e6c-7157-4e1f-9289-17071bef8ae9', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '288eeec9b8814171', '2024-07-12 22:12:26', '2024-07-12 22:12:26'),
(648, 280, '8d11fdac4aeb7ab0', 'b0e0cc2f-77c3-4c94-bfdb-a779edded7b9', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '8d11fdac4aeb7ab0', '2024-07-12 22:12:27', '2024-07-12 22:12:27'),
(649, 280, '791566379710dc39', '5ddd48d5-180b-4268-bd26-d0156e033b6e', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '791566379710dc39', '2024-07-12 22:12:28', '2024-07-12 22:12:28'),
(650, 280, 'c9942b4deef5116b', 'e0e10a2f-571b-454b-8809-113c4d138133', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'c9942b4deef5116b', '2024-07-12 22:12:32', '2024-07-12 22:12:32'),
(651, 280, '78126019217326b2', '90a433b8-c152-4e19-b1d3-e76e86147192', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '78126019217326b2', '2024-07-12 22:12:33', '2024-07-12 22:12:33'),
(652, 280, 'a9fd66ac14748cbe', 'd6d1a4f1-2d0a-4cf7-9437-b35e16cd55be', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'a9fd66ac14748cbe', '2024-07-12 22:12:34', '2024-07-12 22:12:34'),
(653, 280, 'ac0ccf929b2c2380', '93d3d479-1561-49ae-9601-de06413b007c', '1695365', '1695365', 'win', 'balance', 0.16, 'play_fiver', 0, 1, 'ac0ccf929b2c2380', '2024-07-12 22:12:36', '2024-07-12 22:12:36'),
(654, 280, '5c9f5c449d68279f', '31ae8f1c-68dc-4759-98f0-1047b6716d17', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, '5c9f5c449d68279f', '2024-07-12 22:12:38', '2024-07-12 22:12:38'),
(655, 280, '8b3af75f4b0ef6fd', '53f67fb8-a7e3-48a8-bb7c-b87d49229dbb', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '8b3af75f4b0ef6fd', '2024-07-12 22:12:39', '2024-07-12 22:12:39'),
(656, 280, '83e1b186aa59fe57', '2b73d873-1513-4a80-b961-afa87f8a9095', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '83e1b186aa59fe57', '2024-07-12 22:12:41', '2024-07-12 22:12:41'),
(657, 280, '7f078dedd26a4220', '110f4ef8-70be-40b0-a705-2b7656a152ec', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '7f078dedd26a4220', '2024-07-12 22:12:42', '2024-07-12 22:12:42'),
(658, 280, '842f216983332fa0', '438a0001-f746-40c7-8554-5e756e3ff072', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '842f216983332fa0', '2024-07-12 22:12:44', '2024-07-12 22:12:44'),
(659, 280, '5e9c3365a3a44290', '4e3fbd48-23b3-491e-bd30-8e9d9e24a0b8', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '5e9c3365a3a44290', '2024-07-12 22:12:45', '2024-07-12 22:12:45'),
(660, 280, 'a2a42dcfd2e20927', '0e81bad4-caeb-4d06-98aa-87e802ce43de', '1695365', '1695365', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'a2a42dcfd2e20927', '2024-07-12 22:12:46', '2024-07-12 22:12:46'),
(661, 280, '27a8a47c441440fb', 'b676c492-9894-4cd6-83e5-c2939889c0ae', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '27a8a47c441440fb', '2024-07-12 22:13:31', '2024-07-12 22:13:31'),
(662, 280, 'f472d7ed803e4416', 'e83ec728-5b10-4cc2-a871-4b8fe0701f6c', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'f472d7ed803e4416', '2024-07-12 22:13:32', '2024-07-12 22:13:32'),
(663, 280, '5acac68e2dd578e9', '67547e9b-e64c-4dbf-b11c-118c090b71e4', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '5acac68e2dd578e9', '2024-07-12 22:13:35', '2024-07-12 22:13:35'),
(664, 280, 'ea8655422d0c4cc1', 'e7eb58f1-9115-4ae3-839b-a55e4cd24a9e', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ea8655422d0c4cc1', '2024-07-12 22:13:37', '2024-07-12 22:13:37'),
(665, 280, '7dcdd1aa35d0097c', '5535522d-f5d7-4d3f-b581-3aad69154560', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '7dcdd1aa35d0097c', '2024-07-12 22:13:38', '2024-07-12 22:13:38'),
(666, 280, '35eedcd970ae3173', 'cf53067e-2fe6-4286-a3c8-7cb79c4dc05e', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '35eedcd970ae3173', '2024-07-12 22:13:39', '2024-07-12 22:13:39'),
(667, 280, '96675ca843bee10c', 'b731b05e-bbd0-4e07-b4ee-3606c32dca68', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '96675ca843bee10c', '2024-07-12 22:13:40', '2024-07-12 22:13:40'),
(668, 280, '15dfe609ac1c012f', '8dfe66b5-01d1-44b2-9420-e6d4492fd05f', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '15dfe609ac1c012f', '2024-07-12 22:13:42', '2024-07-12 22:13:42'),
(669, 280, 'a13cf79c1f0bd882', '3e44e9ec-647a-47c3-9441-238605407a9c', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'a13cf79c1f0bd882', '2024-07-12 22:13:43', '2024-07-12 22:13:43'),
(670, 280, 'ff8808397a482be8', 'b0af46dc-64c3-4c48-bff7-1750e8205679', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'ff8808397a482be8', '2024-07-12 22:13:45', '2024-07-12 22:13:45'),
(671, 280, '9ffb383538974145', '19b8577f-dfcf-4a4e-9885-e25e096bc12c', '1695365', '1695365', 'win', 'balance', 2.40, 'play_fiver', 0, 1, '9ffb383538974145', '2024-07-12 22:13:46', '2024-07-12 22:13:46'),
(672, 280, '23ffe0de096a8c3c', '89f8c86d-7153-45dc-bf40-d4ec90160bda', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '23ffe0de096a8c3c', '2024-07-12 22:13:48', '2024-07-12 22:13:48'),
(673, 280, 'b9808b861763b1ba', '71cecd32-c629-4d0b-8c15-42401783d8a7', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'b9808b861763b1ba', '2024-07-12 22:13:49', '2024-07-12 22:13:49'),
(674, 280, 'b19f3f02cebeeca4', '416099dd-5a6a-49da-9017-58d17897f8f4', '1695365', '1695365', 'win', 'balance', 0.48, 'play_fiver', 0, 1, 'b19f3f02cebeeca4', '2024-07-12 22:13:53', '2024-07-12 22:13:53'),
(675, 280, 'eba15b449e456259', '5a12ce3c-c2a8-4452-8570-112be97ececd', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'eba15b449e456259', '2024-07-12 22:13:54', '2024-07-12 22:13:54'),
(676, 280, '4e5ae3689cbc8754', '8c882a72-f165-46c5-8f03-5543e422b2cd', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '4e5ae3689cbc8754', '2024-07-12 22:13:56', '2024-07-12 22:13:56'),
(677, 280, '9d2938eb1b509aa1', '6c19b720-8b71-4fa4-a052-fa5f73c7eacd', '1695365', '1695365', 'win', 'balance', 0.72, 'play_fiver', 0, 1, '9d2938eb1b509aa1', '2024-07-12 22:13:57', '2024-07-12 22:13:57'),
(678, 280, 'd70408a6f7b4c5bc', 'f869ed42-90f8-4c24-a8cd-645cc303d203', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd70408a6f7b4c5bc', '2024-07-12 22:13:59', '2024-07-12 22:13:59'),
(679, 280, '27b9c40d8bc75245', '40d19ef7-0a29-4a12-b0d0-8aac602a8d13', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '27b9c40d8bc75245', '2024-07-12 22:14:00', '2024-07-12 22:14:00'),
(680, 280, '83d824490dcee946', '19b15130-8c07-47dc-9b2f-bf75dcd32599', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '83d824490dcee946', '2024-07-12 22:14:01', '2024-07-12 22:14:01'),
(681, 280, '06d452d6b6e549f2', 'df627891-39fb-4a75-bf9e-615babe86f95', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '06d452d6b6e549f2', '2024-07-12 22:14:02', '2024-07-12 22:14:02'),
(682, 280, 'efbeeab7750d509a', '66bb4d2d-7668-4d6f-bd53-3ca99dcf3736', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'efbeeab7750d509a', '2024-07-12 22:14:03', '2024-07-12 22:14:03'),
(683, 280, 'b363896280027524', '1edf6955-f073-4383-a749-a1fd428e78b5', '1695365', '1695365', 'win', 'balance', 2.40, 'play_fiver', 0, 1, 'b363896280027524', '2024-07-12 22:14:04', '2024-07-12 22:14:04'),
(684, 280, 'd2e74cdc276bf7ad', '57401e37-f481-4fbc-aa90-3ffa4c0ab1cc', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd2e74cdc276bf7ad', '2024-07-12 22:14:06', '2024-07-12 22:14:06'),
(685, 280, 'c09706e1e7bf9020', '072c44fb-575b-4ee9-96c5-76c907f2b570', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'c09706e1e7bf9020', '2024-07-12 22:14:06', '2024-07-12 22:14:06'),
(686, 280, '6d0345abfe066bcb', '1169581c-1a31-4e2d-990c-bfd3926ce287', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '6d0345abfe066bcb', '2024-07-12 22:14:10', '2024-07-12 22:14:10'),
(687, 280, 'c8514d3b02db6641', '38303deb-c5f8-439d-adaf-cefd36a5e3fa', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'c8514d3b02db6641', '2024-07-12 22:14:11', '2024-07-12 22:14:11'),
(688, 280, '5c837847eedfbb14', 'd701c4e4-62b4-4103-9122-0e5d3555db59', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '5c837847eedfbb14', '2024-07-12 22:14:12', '2024-07-12 22:14:12'),
(689, 280, '2218e9a0c2e64456', 'c9a59473-e899-4ce3-868b-b17ccb8b91eb', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '2218e9a0c2e64456', '2024-07-12 22:14:13', '2024-07-12 22:14:13'),
(690, 280, '0b41e857cc510222', '0938fcb5-6ae8-4197-be07-f835a1f3643f', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '0b41e857cc510222', '2024-07-12 22:14:13', '2024-07-12 22:14:13'),
(691, 280, '4e89fa1887d4ff47', '6d78561a-b48a-4772-b2c2-a9efa971d976', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '4e89fa1887d4ff47', '2024-07-12 22:14:14', '2024-07-12 22:14:14'),
(692, 280, '74d5b84d576bbf01', '66fefefb-632e-491c-9c37-928ac836a7ec', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '74d5b84d576bbf01', '2024-07-12 22:14:15', '2024-07-12 22:14:15'),
(693, 280, '8b25fbcfa9e04304', '8e379118-fb29-4cd5-b776-8d98fed21163', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '8b25fbcfa9e04304', '2024-07-12 22:14:16', '2024-07-12 22:14:16'),
(694, 280, '985c416f7b309efb', '2f4026f1-9e2f-4c5c-b840-66f9868b950e', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '985c416f7b309efb', '2024-07-12 22:14:17', '2024-07-12 22:14:17'),
(695, 280, '49f9154bee832c18', '8edbaf6c-4a02-44fd-841c-849e176b2918', '1695365', '1695365', 'win', 'balance', 1.20, 'play_fiver', 0, 1, '49f9154bee832c18', '2024-07-12 22:14:17', '2024-07-12 22:14:17'),
(696, 280, '163f41c2e07aece4', 'a0eaf701-4aae-4488-9bd4-beac1aca9871', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '163f41c2e07aece4', '2024-07-12 22:14:20', '2024-07-12 22:14:20'),
(697, 280, '66805566fab955ee', '97561d8f-b8bd-4590-b935-05d727325dab', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '66805566fab955ee', '2024-07-12 22:14:21', '2024-07-12 22:14:21'),
(698, 280, 'edd20c2d17261086', 'fb5b6ab9-997f-47b3-b638-6ac037d26cb1', '1695365', '1695365', 'win', 'balance', 12.00, 'play_fiver', 0, 1, 'edd20c2d17261086', '2024-07-12 22:14:22', '2024-07-12 22:14:22'),
(699, 280, '986a9a789a1bee1d', 'd5d51b33-507c-4b18-a03a-20686905b05c', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '986a9a789a1bee1d', '2024-07-12 22:14:25', '2024-07-12 22:14:25'),
(700, 280, 'a8bab742e99b4292', '127bc3a9-3988-41cb-acae-ce4c9b71e4e0', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'a8bab742e99b4292', '2024-07-12 22:14:27', '2024-07-12 22:14:27'),
(701, 280, 'de9a351d38e0e6d4', 'b67e90a1-477a-4c88-b3cf-b3f424964cc1', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'de9a351d38e0e6d4', '2024-07-12 22:14:28', '2024-07-12 22:14:28'),
(702, 280, 'ece016ce080423b8', '9b71ae96-89f9-4e78-b5ff-3d12eb8d01af', '1695365', '1695365', 'win', 'balance_withdrawal', 0.48, 'play_fiver', 0, 1, 'ece016ce080423b8', '2024-07-12 22:14:28', '2024-07-12 22:14:28'),
(703, 280, '8d5fbc37c2a292da', '9059eb4e-2627-4296-a492-5bbf241ec72b', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8d5fbc37c2a292da', '2024-07-12 22:14:30', '2024-07-12 22:14:30'),
(704, 280, '51fead2d4bd60210', '84abb0e9-677f-4f2f-8ddb-aa665e8e4e52', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '51fead2d4bd60210', '2024-07-12 22:14:31', '2024-07-12 22:14:31'),
(705, 280, 'd7e7b34e5d72f6ec', '3c060ceb-79bf-4a31-9bb4-9a4345dbcc43', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'd7e7b34e5d72f6ec', '2024-07-12 22:14:32', '2024-07-12 22:14:32'),
(706, 280, '389842cc3957e261', 'f5b44fe1-4171-465d-9d6a-dda13de2d19d', '1695365', '1695365', 'win', 'balance_withdrawal', 0.72, 'play_fiver', 0, 1, '389842cc3957e261', '2024-07-12 22:14:33', '2024-07-12 22:14:33'),
(707, 280, 'eec4847375220e9f', '2bd59254-fc28-49df-b3cc-297e8330f9aa', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, 'eec4847375220e9f', '2024-07-12 22:14:35', '2024-07-12 22:14:35'),
(708, 280, '8e3ff77685cc98cc', '8d809c9a-b19c-4480-9fab-738a75e128b5', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '8e3ff77685cc98cc', '2024-07-12 22:14:36', '2024-07-12 22:14:36'),
(709, 280, '0915682d565bb4b6', 'b956bf94-fefa-4701-addd-289b163745c0', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '0915682d565bb4b6', '2024-07-12 22:14:36', '2024-07-12 22:14:36'),
(710, 280, 'fbcfbe953fe2f1c7', '55629801-9ed3-4b34-8b71-dce8cb12f793', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'fbcfbe953fe2f1c7', '2024-07-12 22:14:40', '2024-07-12 22:14:40'),
(711, 280, '2b9679c6f91b99d0', '921ff25a-15bf-47d3-a8ba-a10f67c3c25a', '1695365', '1695365', 'win', 'balance', 0.48, 'play_fiver', 0, 1, '2b9679c6f91b99d0', '2024-07-12 22:14:41', '2024-07-12 22:14:41'),
(712, 280, 'b98adc7569ef8e7b', 'e321237b-82b9-45b8-b79e-620e749c8577', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'b98adc7569ef8e7b', '2024-07-12 22:14:43', '2024-07-12 22:14:43'),
(713, 280, 'bb75d2d96796d5ef', '5e5638a7-12c8-4805-83d2-7595b607fa90', '1695365', '1695365', 'win', 'balance', 0.48, 'play_fiver', 0, 1, 'bb75d2d96796d5ef', '2024-07-12 22:14:44', '2024-07-12 22:14:44'),
(714, 280, '4555b25a13b9b3f9', 'c3316ae1-b411-461b-aa00-ce756e1099fc', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '4555b25a13b9b3f9', '2024-07-12 22:14:46', '2024-07-12 22:14:46'),
(715, 280, 'd7a7b739cee65240', '452cc4f0-5561-42db-ae40-88559d2ae692', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'd7a7b739cee65240', '2024-07-12 22:14:48', '2024-07-12 22:14:48'),
(716, 280, '3e159e32adf55e91', '14545327-1ed2-4f17-8b07-e54f7b0aab26', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '3e159e32adf55e91', '2024-07-12 22:14:49', '2024-07-12 22:14:49'),
(717, 280, '4d69a2313f5a0079', '5f9e59c5-355b-4cae-a3ad-d701aca7046d', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '4d69a2313f5a0079', '2024-07-12 22:14:50', '2024-07-12 22:14:50'),
(718, 280, '457e1c6fac656704', '8ccb50c9-10fa-4358-bf2d-cb9911e1bb00', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '457e1c6fac656704', '2024-07-12 22:14:51', '2024-07-12 22:14:51'),
(719, 280, 'b94497d901df4b46', 'ac734da0-de47-423b-b282-6a7144aec238', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, 'b94497d901df4b46', '2024-07-12 22:14:52', '2024-07-12 22:14:52'),
(720, 280, '5ba315cc429b1783', 'fc80285c-e9a9-41b1-a86b-c10818e1fbc3', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '5ba315cc429b1783', '2024-07-12 22:14:52', '2024-07-12 22:14:52'),
(721, 280, '35565bcf9768dcdd', 'e971f789-1a45-4155-a060-26bc969b177f', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '35565bcf9768dcdd', '2024-07-12 22:14:53', '2024-07-12 22:14:53'),
(722, 280, '5554bad25f86f480', 'df1c80a4-860f-4a0e-9dd6-ce0313dfc7db', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '5554bad25f86f480', '2024-07-12 22:14:54', '2024-07-12 22:14:54'),
(723, 280, '413fd317a3f2a0ae', 'c7d69a3e-a3a9-49f7-838d-a66d54854eb1', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '413fd317a3f2a0ae', '2024-07-12 22:14:55', '2024-07-12 22:14:55'),
(724, 280, '902b39dee8820e30', '87196e74-7c28-4520-a53b-6f9952ab26b8', '1695365', '1695365', 'bet', 'balance', 1.20, 'play_fiver', 0, 1, '902b39dee8820e30', '2024-07-12 22:14:56', '2024-07-12 22:14:56');
INSERT INTO `orders` (`id`, `user_id`, `session_id`, `transaction_id`, `game`, `game_uuid`, `type`, `type_money`, `amount`, `providers`, `refunded`, `status`, `round_id`, `created_at`, `updated_at`) VALUES
(725, 1, 'b64d9dda2935b44a', '569f206b-3427-4c54-be0d-06fcdcda2388', '1695365', '1695365', 'win', 'balance', 864.00, 'play_fiver', 0, 1, 'b64d9dda2935b44a', '2024-07-12 22:16:37', '2024-07-12 22:16:37'),
(726, 1, '3d552c299b1761bc', '1ee5bfc9-b3c7-4dac-aaa3-2c3441226eb4', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '3d552c299b1761bc', '2024-07-12 22:17:18', '2024-07-12 22:17:18'),
(727, 1, '7994cc150f68d87d', '16aba426-e85e-4e07-8a2b-83fc95b463c2', '1695365', '1695365', 'bet', 'balance_withdrawal', 1.20, 'play_fiver', 0, 1, '7994cc150f68d87d', '2024-07-12 22:17:24', '2024-07-12 22:17:24'),
(728, 1, '65b0ed34a7d53498', 'a50d149c-f944-4bf0-8920-a3a455993e43', '1695365', '1695365', 'win', 'balance', 9.60, 'play_fiver', 0, 1, '65b0ed34a7d53498', '2024-07-12 22:17:32', '2024-07-12 22:17:32'),
(729, 1, 'fc743accba121263', 'c9b1ced4-f40e-4154-9c51-ee0fd07631c3', '1695365', '1695365', 'win', 'balance', 5.04, 'play_fiver', 0, 1, 'fc743accba121263', '2024-07-12 22:17:39', '2024-07-12 22:17:39'),
(730, 1, 'b00bf66cbae267a5', 'f78846d5-af3d-4bc3-9f91-4392fbd17a91', '1695365', '1695365', 'win', 'balance', 11.52, 'play_fiver', 0, 1, 'b00bf66cbae267a5', '2024-07-12 22:17:53', '2024-07-12 22:17:53'),
(731, 1, 'c6354a4af0cae6be', '3a691ffb-3d83-41d4-9efc-d83d0f5a2d3c', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'c6354a4af0cae6be', '2024-07-13 13:55:32', '2024-07-13 13:55:32'),
(732, 1, 'a2a51dbcc20b5292', 'e2afcf20-2208-48c6-9176-384cab5bf2aa', '1695365', '1695365', 'bet', 'balance_withdrawal', 0.40, 'play_fiver', 0, 1, 'a2a51dbcc20b5292', '2024-07-13 13:55:34', '2024-07-13 13:55:34'),
(733, 1, 'f90dd94f8f83a570', '03b16c4f-3595-44f7-92c3-20d26a71e0ce', '1695365', '1695365', 'win', 'balance_withdrawal', 0.80, 'play_fiver', 0, 1, 'f90dd94f8f83a570', '2024-07-13 13:55:37', '2024-07-13 13:55:37'),
(734, 1, 'b72fab7a64cb4c76', 'abd3759f-40e4-4cb9-b3cd-45391308fdba', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'b72fab7a64cb4c76', '2024-07-13 13:55:44', '2024-07-13 13:55:44'),
(735, 1, '7f40484a94050308', 'e12952e6-ef7d-43ab-a636-c2655eb40e65', '1695365', '1695365', 'win', 'balance', 4000.00, 'play_fiver', 0, 1, '7f40484a94050308', '2024-07-13 13:55:53', '2024-07-13 13:55:53'),
(736, 1, '2a6e15ebf20a13bf', 'e5a9bdc1-6561-4d19-ac29-74cd39990d55', '1695365', '1695365', 'win', 'balance', 2100.00, 'play_fiver', 0, 1, '2a6e15ebf20a13bf', '2024-07-13 13:56:00', '2024-07-13 13:56:00'),
(737, 1, '2de05ee23c474166', '4d7ae6cb-cf0b-4b81-abdd-7d2082a9b853', '1695365', '1695365', 'win', 'balance', 4800.00, 'play_fiver', 0, 1, '2de05ee23c474166', '2024-07-13 13:56:13', '2024-07-13 13:56:13'),
(738, 1, '43b187236ff1cb3f', '151aea59-6a84-470b-94c4-5f1f1f774d6a', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '43b187236ff1cb3f', '2024-07-13 13:56:26', '2024-07-13 13:56:26'),
(739, 1, 'd7c5dfbc1855fed8', 'b40c8f76-5f59-4656-a2ec-865c4ba23cf4', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'd7c5dfbc1855fed8', '2024-07-13 13:56:31', '2024-07-13 13:56:31'),
(740, 1, 'cfd40345e8a8d7b6', '693c2309-c2d2-41fd-9083-37329a3a15ba', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'cfd40345e8a8d7b6', '2024-07-13 13:56:32', '2024-07-13 13:56:32'),
(741, 1, '03141e349b4f3eae', 'c5a6fbb1-b97d-4acc-9721-26da2ca1b273', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '03141e349b4f3eae', '2024-07-13 13:56:33', '2024-07-13 13:56:33'),
(742, 1, '228065c2cc116897', '3e7937f5-4d9e-4927-9180-e1bbbc3de4d2', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '228065c2cc116897', '2024-07-13 13:56:34', '2024-07-13 13:56:34'),
(743, 1, 'ebdf6252e8f191c0', '6dfd3b71-6c19-4cde-81f1-c016003a1437', '1695365', '1695365', 'win', 'balance_withdrawal', 1000.00, 'play_fiver', 0, 1, 'ebdf6252e8f191c0', '2024-07-13 13:56:35', '2024-07-13 13:56:35'),
(744, 1, 'b054a53d694ef4fc', 'cf9cf3c0-c461-4441-941d-aee7708f200d', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'b054a53d694ef4fc', '2024-07-13 13:56:37', '2024-07-13 13:56:37'),
(745, 1, '6f59cd6e6a62e127', '8cde7a64-944c-43de-a699-a3971490f73b', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '6f59cd6e6a62e127', '2024-07-13 13:56:38', '2024-07-13 13:56:38'),
(746, 1, 'fc44cee8f78c43d8', '07af2674-cac4-4be0-8302-21cba7fd8161', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'fc44cee8f78c43d8', '2024-07-13 13:56:39', '2024-07-13 13:56:39'),
(747, 1, 'ee826bb7b152548f', '8cb46ac2-db27-4903-b8b1-a84bbb52cea0', '1695365', '1695365', 'win', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'ee826bb7b152548f', '2024-07-13 13:56:40', '2024-07-13 13:56:40'),
(748, 1, 'ed9db6ce448eed87', '0cd876fd-2eb0-49f5-87ce-3449d603135e', '1695365', '1695365', 'win', 'balance_withdrawal', 6500.00, 'play_fiver', 0, 1, 'ed9db6ce448eed87', '2024-07-13 13:56:42', '2024-07-13 13:56:42'),
(749, 1, '34a58f86027aa304', '65abcc54-1e60-4d74-a057-a9e7d784f311', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '34a58f86027aa304', '2024-07-13 13:56:48', '2024-07-13 13:56:48'),
(750, 1, '4071a713b72524ef', 'c215a968-e978-43c6-bab9-9d1c60a30b66', '1695365', '1695365', 'win', 'balance_withdrawal', 1000.00, 'play_fiver', 0, 1, '4071a713b72524ef', '2024-07-13 13:56:49', '2024-07-13 13:56:49'),
(751, 1, 'bfa4d849adb47266', 'c14735f3-b504-4aa5-87f4-e748bd4cdb50', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'bfa4d849adb47266', '2024-07-13 13:56:51', '2024-07-13 13:56:51'),
(752, 1, '9ed98ad1bef56a3d', '6adf50e2-db9c-4c70-83bd-0fc2e84a4050', '1695365', '1695365', 'win', 'balance', 4000.00, 'play_fiver', 0, 1, '9ed98ad1bef56a3d', '2024-07-13 13:56:59', '2024-07-13 13:56:59'),
(753, 1, 'd1c945ff0871aed0', '5167396e-61fd-4b1c-9493-b8f16d01e205', '1695365', '1695365', 'win', 'balance', 2100.00, 'play_fiver', 0, 1, 'd1c945ff0871aed0', '2024-07-13 13:57:06', '2024-07-13 13:57:06'),
(754, 1, 'f9b5041f4260b782', '70fedf04-8442-42c3-a8da-3daa6e1822cb', '1695365', '1695365', 'win', 'balance', 4800.00, 'play_fiver', 0, 1, 'f9b5041f4260b782', '2024-07-13 13:57:20', '2024-07-13 13:57:20'),
(755, 282, 'ac3be14faeda0802', '5ff7ab90-55f2-4b03-a979-bb7f5f71f68c', '98', '98', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'ac3be14faeda0802', '2024-07-13 23:24:07', '2024-07-13 23:24:07'),
(756, 282, 'e0d7c01c2c20a484', '007239a9-2ffc-40fa-8f14-3127a65c2b2d', '98', '98', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'e0d7c01c2c20a484', '2024-07-13 23:24:08', '2024-07-13 23:24:08'),
(757, 282, 'ca2594bd4bb6d32b', '8474d65a-7ba7-4c41-9479-1693a1e8b74a', '98', '98', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'ca2594bd4bb6d32b', '2024-07-13 23:24:09', '2024-07-13 23:24:09'),
(758, 282, 'dbedf06ec9bc4cd2', '6f2b05eb-9288-44c1-b742-65bc2ce6534f', '98', '98', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'dbedf06ec9bc4cd2', '2024-07-13 23:24:10', '2024-07-13 23:24:10'),
(759, 282, '4bc922bf2dcb9cce', '706d26a5-a354-434a-a765-f48bb6fc9915', '98', '98', 'bet', 'balance', 15.00, 'play_fiver', 0, 1, '4bc922bf2dcb9cce', '2024-07-13 23:24:12', '2024-07-13 23:24:12'),
(760, 282, '956b3cf49bb855d3', 'f2db3b10-a914-4a69-8e71-b615a3d7dbbe', '98', '98', 'bet', 'balance', 15.00, 'play_fiver', 0, 1, '956b3cf49bb855d3', '2024-07-13 23:24:12', '2024-07-13 23:24:12'),
(761, 282, '5cf485eb93b5ef96', '8ede6084-68a9-424e-a106-d1dc0524808a', '98', '98', 'bet', 'balance', 15.00, 'play_fiver', 0, 1, '5cf485eb93b5ef96', '2024-07-13 23:24:14', '2024-07-13 23:24:14'),
(762, 282, '227d9774ab692296', '018305fc-7358-4772-9cc4-f9b4f9e72ff1', '98', '98', 'bet', 'balance', 15.00, 'play_fiver', 0, 1, '227d9774ab692296', '2024-07-13 23:24:15', '2024-07-13 23:24:15'),
(763, 282, '6469b9f114e21b7b', 'b4f31a83-bd98-402c-ad83-4b6eecd0379a', '98', '98', 'bet', 'balance', 15.00, 'play_fiver', 0, 1, '6469b9f114e21b7b', '2024-07-13 23:24:16', '2024-07-13 23:24:16'),
(764, 282, '7c00ae60faf6efec', 'ad884644-9f2b-4fde-a7ba-6b121e4c4ea3', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '7c00ae60faf6efec', '2024-07-13 23:24:20', '2024-07-13 23:24:20'),
(765, 282, '57221933563ffe8a', '8bf9f958-3595-4b13-9aca-2b153b4e13f7', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '57221933563ffe8a', '2024-07-13 23:24:21', '2024-07-13 23:24:21'),
(766, 282, 'cbddb60d465ab928', '5d4f5278-d4fa-4112-8ff9-2a39e0a75429', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, 'cbddb60d465ab928', '2024-07-13 23:24:21', '2024-07-13 23:24:21'),
(767, 282, '6f0e47a3455a7ba8', '532583d5-ea65-4bb6-b77b-d64162ab4a77', '98', '98', 'bet', 'balance', 2.50, 'play_fiver', 0, 1, '6f0e47a3455a7ba8', '2024-07-13 23:24:23', '2024-07-13 23:24:23'),
(768, 282, '0f99952d01b0de81', '265f2d1e-400b-47a7-90b5-8f4e46ec6e9b', '656', '656', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '0f99952d01b0de81', '2024-07-13 23:26:55', '2024-07-13 23:26:55'),
(769, 282, '932baa9679f6e88c', '24520b50-5f21-4278-bcd0-5724533f29ae', '656', '656', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '932baa9679f6e88c', '2024-07-13 23:27:03', '2024-07-13 23:27:03'),
(770, 282, '6eede32ccf752e85', 'dbaa299b-c1a8-4c6c-b21c-a765d4d64d96', '656', '656', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '6eede32ccf752e85', '2024-07-13 23:27:11', '2024-07-13 23:27:11'),
(771, 1, '5e53681031daba8e', 'f16d7ee6-7781-4f07-a213-bb71168e9924', '1695365', '1695365', 'win', 'balance_withdrawal', 9.60, 'play_fiver', 0, 1, '5e53681031daba8e', '2024-07-13 23:40:59', '2024-07-13 23:40:59'),
(772, 1, '9eb5d47b823d3e3b', 'ae933584-26ba-4691-b17a-ea6b1ab88703', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '9eb5d47b823d3e3b', '2024-07-13 23:41:01', '2024-07-13 23:41:01'),
(773, 1, '1d0a718bdd40637f', '9b67314c-14a8-4e3e-a2e6-f37c41c76d24', '1695365', '1695365', 'win', 'balance_withdrawal', 48.00, 'play_fiver', 0, 1, '1d0a718bdd40637f', '2024-07-13 23:41:02', '2024-07-13 23:41:02'),
(774, 1, '1e233dde708031b3', '77a4ed11-8564-47c5-a4b6-6fcf61a9d9f0', '1695365', '1695365', 'win', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '1e233dde708031b3', '2024-07-13 23:41:05', '2024-07-13 23:41:05'),
(775, 1, '57bb0ff0e4b9125f', 'dd012367-447e-4d21-9350-0838b9ddf87f', '1695365', '1695365', 'win', 'balance_withdrawal', 48.00, 'play_fiver', 0, 1, '57bb0ff0e4b9125f', '2024-07-13 23:41:07', '2024-07-13 23:41:07'),
(776, 1, '4b2c86f8d19cb5a4', '76eac6c9-148c-421f-887f-66c2e620366d', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '4b2c86f8d19cb5a4', '2024-07-13 23:41:09', '2024-07-13 23:41:09'),
(777, 1, '71bf57f5b454a0ad', '7ead540a-4b0b-4d59-9683-318c9e84ef70', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '71bf57f5b454a0ad', '2024-07-13 23:41:10', '2024-07-13 23:41:10'),
(778, 1, 'e309525d7cace3f0', '23c426e6-ba6a-4a1d-90f4-b7d1e15dcec3', '1695365', '1695365', 'win', 'balance_withdrawal', 7.20, 'play_fiver', 0, 1, 'e309525d7cace3f0', '2024-07-13 23:41:11', '2024-07-13 23:41:11'),
(779, 1, '2a257bed5ca7a881', '1ca0843d-1544-4b44-8636-136c7aa62e99', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, '2a257bed5ca7a881', '2024-07-13 23:41:13', '2024-07-13 23:41:13'),
(780, 1, 'c070d47e5bc94c0d', '87793153-ced8-413b-8185-d0b2349c87cd', '1695365', '1695365', 'bet', 'balance_withdrawal', 12.00, 'play_fiver', 0, 1, 'c070d47e5bc94c0d', '2024-07-13 23:41:15', '2024-07-13 23:41:15'),
(781, 1, '9d028bf7130e62ab', '101c99eb-b5d8-4665-bc6f-88aa75c20ad8', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '9d028bf7130e62ab', '2024-07-13 23:41:19', '2024-07-13 23:41:19'),
(782, 1, '666747f2a5caabc0', 'e3e04487-8e3c-4b2e-ae37-f631674274e6', '1695365', '1695365', 'win', 'balance_withdrawal', 200.00, 'play_fiver', 0, 1, '666747f2a5caabc0', '2024-07-13 23:41:22', '2024-07-13 23:41:22'),
(783, 1, '0113316f8574fb41', '1699552d-6cb2-4af5-bf6d-01871c6e3a3c', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '0113316f8574fb41', '2024-07-13 23:41:23', '2024-07-13 23:41:23'),
(784, 1, '0223674897f4c631', '6206b753-c8f8-4e1b-8643-d8ce4f007141', '1695365', '1695365', 'win', 'balance', 6000.00, 'play_fiver', 0, 1, '0223674897f4c631', '2024-07-13 23:41:32', '2024-07-13 23:41:32'),
(785, 1, '3ba7faf713004c59', 'b2f2e1dc-3de8-40f6-9726-c4ebe474a817', '1695365', '1695365', 'win', 'balance', 800.00, 'play_fiver', 0, 1, '3ba7faf713004c59', '2024-07-13 23:41:38', '2024-07-13 23:41:38'),
(786, 1, '3d7a94e6cf34d8ec', 'e804bacf-d1dc-466f-954b-3e626280fb1d', '1695365', '1695365', 'win', 'balance', 10800.00, 'play_fiver', 0, 1, '3d7a94e6cf34d8ec', '2024-07-13 23:41:52', '2024-07-13 23:41:52'),
(787, 284, '69c7465baf38081b', 'f4371529-bd72-4a28-9aef-5a866d0c3c19', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '69c7465baf38081b', '2024-07-15 00:24:20', '2024-07-15 00:24:20'),
(788, 284, '996e0c4306308722', 'a55398ec-b161-48ea-9f29-4505310b6626', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '996e0c4306308722', '2024-07-15 00:24:33', '2024-07-15 00:24:33'),
(789, 284, 'ebeac8755b4261d7', 'bc0dca26-0a7f-4664-98a3-791846506f9f', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, 'ebeac8755b4261d7', '2024-07-15 00:24:35', '2024-07-15 00:24:35'),
(790, 284, '90f14393a21b2b3c', '5619a2fa-ab75-4eb2-abe6-9a9f93ee9b66', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '90f14393a21b2b3c', '2024-07-15 00:24:38', '2024-07-15 00:24:38'),
(791, 284, 'bff1d360bf2ec510', 'd1bed500-472b-4b60-a1d9-42974bb8acf5', '68', '68', 'win', 'balance', 1.00, 'play_fiver', 0, 1, 'bff1d360bf2ec510', '2024-07-15 00:24:40', '2024-07-15 00:24:40'),
(792, 284, '6a11188b0099ec60', 'c013170b-3610-4969-a23c-4faf4728e42e', '68', '68', 'win', 'balance', 1.00, 'play_fiver', 0, 1, '6a11188b0099ec60', '2024-07-15 00:24:48', '2024-07-15 00:24:48'),
(793, 284, '68cbd89bc6b814ac', 'e0889aa2-6a20-4075-8e9d-91b9a977c565', '68', '68', 'bet', 'balance_withdrawal', 1.00, 'play_fiver', 0, 1, '68cbd89bc6b814ac', '2024-07-15 00:24:54', '2024-07-15 00:24:54'),
(794, 284, 'bae81618d6380bfb', 'cf0466a8-481e-49c7-886a-426fd7514287', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, 'bae81618d6380bfb', '2024-07-15 00:24:56', '2024-07-15 00:24:56'),
(795, 284, '0f5c9b7d0874981a', '16d72929-d2bf-4a17-ab13-9a8eabf617be', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '0f5c9b7d0874981a', '2024-07-15 00:24:58', '2024-07-15 00:24:58'),
(796, 284, '976b41de8be622a6', '8a002b56-5608-4611-8630-fb508bf2d2e6', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '976b41de8be622a6', '2024-07-15 00:25:01', '2024-07-15 00:25:01'),
(797, 284, '6e1f74607eaed0dd', '3e85b1d4-6578-40cf-b2a6-283c82d2327b', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '6e1f74607eaed0dd', '2024-07-15 00:25:08', '2024-07-15 00:25:08'),
(798, 284, '9a92f7b58a3d0d82', '42359276-a61f-447d-acbc-6527eb8100a8', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '9a92f7b58a3d0d82', '2024-07-15 00:25:13', '2024-07-15 00:25:13'),
(799, 284, '42157c1f75a3db72', 'd435e034-dc28-4190-863a-7075c2a8777c', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '42157c1f75a3db72', '2024-07-15 00:25:16', '2024-07-15 00:25:16'),
(800, 284, '02d313e61f527299', '8eb3109a-8484-4048-b88c-b9e5944cbee8', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '02d313e61f527299', '2024-07-15 00:25:20', '2024-07-15 00:25:20'),
(801, 284, '3253c36539699cc2', '861cf905-a1f7-4da2-b5a5-9bd55a825041', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '3253c36539699cc2', '2024-07-15 00:25:24', '2024-07-15 00:25:24'),
(802, 284, 'c4e8f097064b8e99', 'af189bda-0299-4163-bd3b-0566976f5888', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, 'c4e8f097064b8e99', '2024-07-15 00:25:28', '2024-07-15 00:25:28'),
(803, 284, '00725efc6537c851', '601e90c9-a70e-42fc-b2e0-c1496f3b04ab', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, '00725efc6537c851', '2024-07-15 00:25:32', '2024-07-15 00:25:32'),
(804, 284, '22bb46e08ee6e0a2', 'bfb37114-2c7f-4ac8-9eea-8fd7be8cc87b', '68', '68', 'win', 'balance', 4.50, 'play_fiver', 0, 1, '22bb46e08ee6e0a2', '2024-07-15 00:25:38', '2024-07-15 00:25:38'),
(805, 284, '77a51aa3606637ee', 'c0ad7876-314c-44cb-a1f4-e11b262b3d98', '68', '68', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '77a51aa3606637ee', '2024-07-15 00:25:46', '2024-07-15 00:25:46'),
(806, 284, '673e104db776a0e7', '679f94ee-17c1-43de-953e-e3b5067d580c', '68', '68', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, '673e104db776a0e7', '2024-07-15 00:25:49', '2024-07-15 00:25:49'),
(807, 284, 'b3b50b4e02f52dac', '23dd8b0d-7862-486c-971f-46c446b09b39', '68', '68', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'b3b50b4e02f52dac', '2024-07-15 00:25:52', '2024-07-15 00:25:52'),
(808, 284, 'e3a8fd564cd996f0', '1b7ba7a2-e17d-4a5c-b5f4-f7f351dca797', '68', '68', 'bet', 'balance', 1.50, 'play_fiver', 0, 1, 'e3a8fd564cd996f0', '2024-07-15 00:25:54', '2024-07-15 00:25:54'),
(809, 284, '4547e7133e86738c', '69286427-2d7f-4db1-a32d-58b3a2911e6c', '68', '68', 'win', 'balance', 1.50, 'play_fiver', 0, 1, '4547e7133e86738c', '2024-07-15 00:25:58', '2024-07-15 00:25:58'),
(810, 284, 'a683e41748ecc071', 'c71f4cf3-718e-45c1-bdcb-5d576d47e1b8', '68', '68', 'bet', 'balance_withdrawal', 1.50, 'play_fiver', 0, 1, 'a683e41748ecc071', '2024-07-15 00:26:04', '2024-07-15 00:26:04'),
(811, 284, '7a08b1b57f6dca4f', '8752cdc1-c145-4658-8b69-96fb9af67a52', '68', '68', 'bet', 'balance_bonus', 1.50, 'play_fiver', 0, 1, '7a08b1b57f6dca4f', '2024-07-15 00:26:06', '2024-07-15 00:26:06'),
(812, 284, 'bb2427560c29a389', '717fd5fd-5772-4a70-ad54-5437cc85f6f3', '68', '68', 'bet', 'balance_bonus', 1.50, 'play_fiver', 0, 1, 'bb2427560c29a389', '2024-07-15 00:26:09', '2024-07-15 00:26:09'),
(813, 284, '52edf2a4d4b0f3e3', 'f9753bb2-43bf-43d7-af90-9cf31069bc47', '68', '68', 'bet', 'balance_bonus', 1.50, 'play_fiver', 0, 1, '52edf2a4d4b0f3e3', '2024-07-15 00:26:13', '2024-07-15 00:26:13'),
(814, 284, 'd1fa833e50529b8d', '295d2bfe-c2c6-4189-8e34-d3405a6fb8f8', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, 'd1fa833e50529b8d', '2024-07-15 00:26:17', '2024-07-15 00:26:17'),
(815, 284, 'c4efca463f1aefe5', '179ecad2-cd43-44ff-9eaa-d1b4605e1bea', '68', '68', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, 'c4efca463f1aefe5', '2024-07-15 00:26:19', '2024-07-15 00:26:19'),
(816, 284, '4257c81a9eb8c3e6', '9d790186-806e-4eb3-bad8-e71982a4e507', '68', '68', 'bet', 'balance', 1.00, 'play_fiver', 0, 1, '4257c81a9eb8c3e6', '2024-07-15 00:26:22', '2024-07-15 00:26:22'),
(817, 284, 'e10178e50d85dbab', 'f65ce8e4-c4db-4a7b-8640-cc166a23bd1c', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'e10178e50d85dbab', '2024-07-15 00:26:27', '2024-07-15 00:26:27'),
(818, 284, 'e2099d3433e9ade0', '844639cb-a3f3-44a8-888b-48b39996f20b', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'e2099d3433e9ade0', '2024-07-15 00:26:30', '2024-07-15 00:26:30'),
(819, 1, '27bcd39fbb59ac52', '6cb16f74-3247-4c45-8798-e3a99f1d74c5', '1695365', '1695365', 'win', 'balance_withdrawal', 0.24, 'play_fiver', 0, 1, '27bcd39fbb59ac52', '2024-07-15 08:11:38', '2024-07-15 08:11:38'),
(820, 1, '43ec9051f5381cda', '15757f9e-0475-4900-854e-e3be41184435', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '43ec9051f5381cda', '2024-07-15 08:11:46', '2024-07-15 08:11:46'),
(821, 1, '1dd9184d9cd61b47', '45d3f908-6c1e-46bc-8612-a9d8f5135595', '1695365', '1695365', 'win', 'balance', 6000.00, 'play_fiver', 0, 1, '1dd9184d9cd61b47', '2024-07-15 08:11:56', '2024-07-15 08:11:56'),
(822, 1, '67671d8e47e8b834', 'f26a168c-e6a4-43ff-985b-977924235cb7', '1695365', '1695365', 'win', 'balance', 800.00, 'play_fiver', 0, 1, '67671d8e47e8b834', '2024-07-15 08:12:04', '2024-07-15 08:12:04'),
(823, 1, 'b7fe796e432f91dc', '41820d34-418a-41b8-ba76-323b198e1f94', '1695365', '1695365', 'win', 'balance', 10800.00, 'play_fiver', 0, 1, 'b7fe796e432f91dc', '2024-07-15 08:12:19', '2024-07-15 08:12:19'),
(824, 1, '57939e5e4aff2863', 'ddf3b8ac-8cf5-4e46-86ff-1b7755afa47b', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '57939e5e4aff2863', '2024-07-15 08:13:22', '2024-07-15 08:13:22'),
(825, 1, '39bc70f6f9a4f498', '319ddb38-a4cd-4886-a75d-e6224597a591', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '39bc70f6f9a4f498', '2024-07-15 08:13:33', '2024-07-15 08:13:33'),
(826, 1, '127bc5b1c9199cf3', '82c2e4d5-5bd0-4f03-b78a-a67c09a77bc8', '1695365', '1695365', 'win', 'balance_withdrawal', 200.00, 'play_fiver', 0, 1, '127bc5b1c9199cf3', '2024-07-15 08:13:41', '2024-07-15 08:13:41'),
(827, 1, 'd07194c910d03877', 'b9116273-22c0-4d42-8e6c-b3fd449a16f0', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'd07194c910d03877', '2024-07-15 08:13:43', '2024-07-15 08:13:43'),
(828, 1, 'af1052fa8911e36a', 'beb51917-f8f2-4bbc-b669-36454b15de71', '1695365', '1695365', 'win', 'balance', 6000.00, 'play_fiver', 0, 1, 'af1052fa8911e36a', '2024-07-15 08:13:52', '2024-07-15 08:13:52'),
(829, 1, '6d5fbbf890231d95', '6e5fca19-1c9c-4072-9386-9bb88679af5e', '1695365', '1695365', 'win', 'balance', 800.00, 'play_fiver', 0, 1, '6d5fbbf890231d95', '2024-07-15 08:13:59', '2024-07-15 08:13:59'),
(830, 1, '5d4ce8efa1a20db8', '32220a79-42dd-4b0c-b328-1efb79ec6344', '1695365', '1695365', 'win', 'balance', 10800.00, 'play_fiver', 0, 1, '5d4ce8efa1a20db8', '2024-07-15 08:14:14', '2024-07-15 08:14:14'),
(831, 1, '24e6af1098494935', '5e5bb5ba-d0a0-475f-b0fd-1bfd74503937', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '24e6af1098494935', '2024-07-15 08:14:34', '2024-07-15 08:14:34'),
(832, 1, 'a922429e90fd3e37', '9ebddf5c-30f3-452e-b8df-3f6bb5034949', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'a922429e90fd3e37', '2024-07-15 08:14:35', '2024-07-15 08:14:35'),
(833, 1, '160a9d31d69b7b6b', '541e1a01-81bc-4284-af36-4c4321b705d2', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '160a9d31d69b7b6b', '2024-07-15 08:14:37', '2024-07-15 08:14:37'),
(834, 1, 'a838b5be5e52f231', 'e6347f04-255b-4891-b8ca-5e27637857d9', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'a838b5be5e52f231', '2024-07-15 08:14:38', '2024-07-15 08:14:38'),
(835, 1, 'de6840b30dbef62c', '35759eb9-d05a-4bd9-a816-8e3f5c7c2664', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'de6840b30dbef62c', '2024-07-15 08:14:40', '2024-07-15 08:14:40'),
(836, 1, 'dcf7d9edef486dc0', '42f649d0-b802-48af-b303-a3115f6fc365', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'dcf7d9edef486dc0', '2024-07-15 08:14:41', '2024-07-15 08:14:41'),
(837, 1, 'c6f39e7ab3b5e5e5', 'f54199c3-41d8-4973-a8cc-1e48ea6981ed', '1695365', '1695365', 'win', 'balance_withdrawal', 300.00, 'play_fiver', 0, 1, 'c6f39e7ab3b5e5e5', '2024-07-15 08:14:42', '2024-07-15 08:14:42'),
(838, 1, '1afd350bee940023', '7e34666e-8e29-4031-a873-00107d38ada1', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '1afd350bee940023', '2024-07-15 08:14:44', '2024-07-15 08:14:44'),
(839, 1, 'a13983910bbe7253', 'db0764a3-c9ef-4fd4-8f86-bc04d1a0f974', '1695365', '1695365', 'win', 'balance', 4000.00, 'play_fiver', 0, 1, 'a13983910bbe7253', '2024-07-15 08:14:54', '2024-07-15 08:14:54'),
(840, 1, 'cc0f2459e2e146b8', '77474700-4600-4a6c-9ba8-550d6658cd4d', '1695365', '1695365', 'win', 'balance', 2100.00, 'play_fiver', 0, 1, 'cc0f2459e2e146b8', '2024-07-15 08:15:01', '2024-07-15 08:15:01'),
(841, 1, 'edc0db277197d20a', '8d40a6ef-af9c-4878-a817-f5633555840a', '1695365', '1695365', 'win', 'balance', 4800.00, 'play_fiver', 0, 1, 'edc0db277197d20a', '2024-07-15 08:15:17', '2024-07-15 08:15:17'),
(842, 1, '49592d80bb8d6b21', 'c30ed41c-1692-4aa1-b3d2-3646b402d00d', '1695365', '1695365', 'win', 'balance_withdrawal', 10000.00, 'play_fiver', 0, 1, '49592d80bb8d6b21', '2024-07-15 08:15:35', '2024-07-15 08:15:35'),
(843, 1, '8185c2838219c796', 'c5fac5b1-2980-4c89-af0c-990bc854dd3b', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '8185c2838219c796', '2024-07-15 08:15:50', '2024-07-15 08:15:50'),
(844, 1, '9594f5292825f507', 'e64fe33f-714a-4abc-a0a7-5a8db0aeb3ca', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '9594f5292825f507', '2024-07-15 08:15:51', '2024-07-15 08:15:51'),
(845, 1, 'ac6ea52b204a924e', 'e0e5a883-dd28-4190-9e0b-aa09a471e78e', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'ac6ea52b204a924e', '2024-07-15 08:15:53', '2024-07-15 08:15:53'),
(846, 1, '24be147e869bf13a', 'cc8c38a4-30da-4f97-8660-93c0ce4355aa', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '24be147e869bf13a', '2024-07-15 08:15:54', '2024-07-15 08:15:54'),
(847, 1, 'a4bcd30550d6cda7', 'b9f2302d-fa0b-4986-be17-d1307b5c9e79', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'a4bcd30550d6cda7', '2024-07-15 08:15:55', '2024-07-15 08:15:55'),
(848, 1, 'dc52d7c70315036d', 'ab71dea7-3cb5-43fe-996c-d83fa0d15fa2', '1695365', '1695365', 'win', 'balance_withdrawal', 1200.00, 'play_fiver', 0, 1, 'dc52d7c70315036d', '2024-07-15 08:15:57', '2024-07-15 08:15:57'),
(849, 1, '886434fb8d2be30f', '0dd7379d-eec7-4747-b675-dbe2b2766d87', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '886434fb8d2be30f', '2024-07-15 08:16:01', '2024-07-15 08:16:01'),
(850, 1, '3dda01e1b1acc80b', '6e27cb10-a93f-444c-ab40-074b55bd68e7', '1695365', '1695365', 'win', 'balance_withdrawal', 2500.00, 'play_fiver', 0, 1, '3dda01e1b1acc80b', '2024-07-15 08:16:02', '2024-07-15 08:16:02'),
(851, 1, '5c50f80d88fd767c', 'ed411dc4-ffa1-4fd9-9de0-04c0f42b96b5', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '5c50f80d88fd767c', '2024-07-15 08:16:05', '2024-07-15 08:16:05'),
(852, 1, '2af4ded68cfa14de', '54c4a4fa-a7b7-4352-8347-fd449902d308', '1695365', '1695365', 'win', 'balance', 6000.00, 'play_fiver', 0, 1, '2af4ded68cfa14de', '2024-07-15 08:16:15', '2024-07-15 08:16:15'),
(853, 1, 'ed968747a31bea25', '135a460c-5f36-41bc-902b-407bffcf4a55', '1695365', '1695365', 'win', 'balance', 800.00, 'play_fiver', 0, 1, 'ed968747a31bea25', '2024-07-15 08:16:22', '2024-07-15 08:16:22'),
(854, 1, '78f62e3307f56576', 'a3c0618f-79f1-4efb-adca-670274bee7e8', '1695365', '1695365', 'win', 'balance', 10800.00, 'play_fiver', 0, 1, '78f62e3307f56576', '2024-07-15 08:16:37', '2024-07-15 08:16:37'),
(855, 1, 'dd78ae196e8e75fa', 'c3d5032c-537d-401f-b1bc-2b163da6d0ae', '1695365', '1695365', 'win', 'balance_withdrawal', 200.00, 'play_fiver', 0, 1, 'dd78ae196e8e75fa', '2024-07-15 08:17:06', '2024-07-15 08:17:06'),
(856, 1, '5a5a76cf91c7f080', '37e60003-ca25-493f-b41c-edfe3adfd8f3', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '5a5a76cf91c7f080', '2024-07-15 08:17:08', '2024-07-15 08:17:08'),
(857, 1, '3bcefb5278d036f3', '3625cbe1-d942-4943-a727-f84b1d4f47a5', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '3bcefb5278d036f3', '2024-07-15 08:17:10', '2024-07-15 08:17:10'),
(858, 1, '330fd875724948e7', '678c35c4-a165-474b-8e76-3fb1c19b5ffc', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '330fd875724948e7', '2024-07-15 08:17:11', '2024-07-15 08:17:11'),
(859, 1, 'f5de4e8aaff1fc76', '88138182-798b-4e65-b461-038365efeb2e', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'f5de4e8aaff1fc76', '2024-07-15 08:17:13', '2024-07-15 08:17:13'),
(860, 1, 'e111fc41f26bf939', '984facfb-a44e-49d7-bc9d-cf5b5497d884', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'e111fc41f26bf939', '2024-07-15 08:17:14', '2024-07-15 08:17:14'),
(861, 1, 'e315f10eb666a3a8', 'abee79c7-5075-4616-8d01-4cf9dfd9dad1', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'e315f10eb666a3a8', '2024-07-15 08:17:15', '2024-07-15 08:17:15'),
(862, 1, 'be4b7ce0ce03fbb4', 'c702ebac-31aa-440a-8fd1-d3a85a17d329', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, 'be4b7ce0ce03fbb4', '2024-07-15 08:17:17', '2024-07-15 08:17:17'),
(863, 1, '601953d605f7e85c', 'a5fe5e7d-492b-4594-9a93-dbadd97e4399', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '601953d605f7e85c', '2024-07-15 08:17:18', '2024-07-15 08:17:18'),
(864, 1, 'fb1b96225ee241fe', '7e26325c-cd63-4de1-af6b-9196cc149fb3', '1695365', '1695365', 'win', 'balance_withdrawal', 2000.00, 'play_fiver', 0, 1, 'fb1b96225ee241fe', '2024-07-15 08:17:20', '2024-07-15 08:17:20'),
(865, 1, '8ef6e9e358326145', 'ed261a15-fb38-4ca4-9e7e-1278eb48de03', '1695365', '1695365', 'win', 'balance_withdrawal', 1000.00, 'play_fiver', 0, 1, '8ef6e9e358326145', '2024-07-15 08:17:22', '2024-07-15 08:17:22'),
(866, 1, 'ef786106420c64f2', 'e1b41a1a-ff53-4d5d-ac8a-2808106a93d5', '1695365', '1695365', 'win', 'balance_withdrawal', 200.00, 'play_fiver', 0, 1, 'ef786106420c64f2', '2024-07-15 08:17:24', '2024-07-15 08:17:24'),
(867, 1, '39844513ac6a5443', '63fd35bc-7897-4edb-838f-c9ee2a9a2785', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '39844513ac6a5443', '2024-07-15 08:17:26', '2024-07-15 08:17:26'),
(868, 1, '7d85b406c9063370', '11efcc94-1cf2-4f79-a7c9-2f7b9aa523c7', '1695365', '1695365', 'win', 'balance', 6000.00, 'play_fiver', 0, 1, '7d85b406c9063370', '2024-07-15 08:17:36', '2024-07-15 08:17:36'),
(869, 1, 'f3598f64bbb6473e', 'e47b98ef-f06f-4c4b-b5cb-f0fcb47cd606', '1695365', '1695365', 'win', 'balance', 800.00, 'play_fiver', 0, 1, 'f3598f64bbb6473e', '2024-07-15 08:17:43', '2024-07-15 08:17:43'),
(870, 1, 'ed31139713c4cbcb', '4e031472-f5aa-4641-a389-cb30e6fee634', '1695365', '1695365', 'win', 'balance', 10800.00, 'play_fiver', 0, 1, 'ed31139713c4cbcb', '2024-07-15 08:17:59', '2024-07-15 08:17:59'),
(871, 1, 'b53b637dc138d00c', 'c1d9f8d9-15b4-4c7c-b0fb-71a2f89e1f5b', '1695365', '1695365', 'win', 'balance_withdrawal', 1000.00, 'play_fiver', 0, 1, 'b53b637dc138d00c', '2024-07-15 08:18:20', '2024-07-15 08:18:20'),
(872, 1, '6f5278f4155d9820', '6fb195ab-8cb3-4a64-a5f5-57a66eabe594', '1695365', '1695365', 'bet', 'balance_withdrawal', 500.00, 'play_fiver', 0, 1, '6f5278f4155d9820', '2024-07-15 08:18:22', '2024-07-15 08:18:22'),
(873, 286, 'd78a79a342bbbb7c', 'ea1d9e29-5c93-4f32-9711-fe1803344f2d', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'd78a79a342bbbb7c', '2024-07-17 13:04:12', '2024-07-17 13:04:12'),
(874, 286, 'b98aa064155a6c71', '5fdd88ba-b7c5-488f-888b-64da8f3b240b', '68', '68', 'win', 'balance', 0.50, 'play_fiver', 0, 1, 'b98aa064155a6c71', '2024-07-17 13:04:14', '2024-07-17 13:04:14'),
(875, 286, '39342e64ccfa5b97', '2f8604e3-aae4-4e5c-9aa2-9ea3931a3a89', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '39342e64ccfa5b97', '2024-07-17 13:04:19', '2024-07-17 13:04:19'),
(876, 286, 'f34ed340fbf5d84c', 'c87b63da-bfcb-4748-b0ea-12848f29ae40', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'f34ed340fbf5d84c', '2024-07-17 13:04:22', '2024-07-17 13:04:22'),
(877, 286, '7747385765d9490d', 'd5a70a9f-6c6c-484f-ac9c-e133ed2e1c04', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '7747385765d9490d', '2024-07-17 13:04:25', '2024-07-17 13:04:25'),
(878, 286, 'c103f22eb33f9aa6', 'f8ce3894-0e27-4488-a323-55e489d504f6', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'c103f22eb33f9aa6', '2024-07-17 13:04:27', '2024-07-17 13:04:27'),
(879, 286, 'a0ae7627a7369e45', '1bb079f0-426a-4ab7-9023-4c698373b2a9', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'a0ae7627a7369e45', '2024-07-17 13:04:28', '2024-07-17 13:04:28'),
(880, 286, 'c36ff646472cbd1f', 'd74355f7-b67c-4408-b2c0-d0a2346da219', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'c36ff646472cbd1f', '2024-07-17 13:04:29', '2024-07-17 13:04:29'),
(881, 286, 'c795ed27d36f2951', 'fbc6d014-0e03-475c-bdc9-0928546a11dc', '68', '68', 'win', 'balance', 0.50, 'play_fiver', 0, 1, 'c795ed27d36f2951', '2024-07-17 13:04:30', '2024-07-17 13:04:30'),
(882, 286, 'd9f7e6a25a944ac3', 'b13b62f9-270e-46f2-b3b7-8dfc130891e3', '68', '68', 'win', 'balance_withdrawal', 0.30, 'play_fiver', 0, 1, 'd9f7e6a25a944ac3', '2024-07-17 13:04:34', '2024-07-17 13:04:34'),
(883, 286, '4a38ef9759bc207d', '682714f2-2afe-4cf0-9380-3ba0204cb276', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '4a38ef9759bc207d', '2024-07-17 13:04:36', '2024-07-17 13:04:36'),
(884, 286, '91954e93f2dc663f', '882dd49b-4131-48a2-914d-c733c858222c', '68', '68', 'win', 'balance', 3.00, 'play_fiver', 0, 1, '91954e93f2dc663f', '2024-07-17 13:04:37', '2024-07-17 13:04:37'),
(885, 286, '760c42de636355c0', '01c142d9-8024-479b-9ae9-6325ca4485ae', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '760c42de636355c0', '2024-07-17 13:04:45', '2024-07-17 13:04:45'),
(886, 286, '9ccba6c2fa7fcdb0', 'acc17c6c-0ccd-4b07-9e4a-1a997b2aa03f', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '9ccba6c2fa7fcdb0', '2024-07-17 13:04:46', '2024-07-17 13:04:46'),
(887, 286, 'c0e0513f5a27f087', '80b96dcd-af41-4a9f-88bf-436c6299d5e2', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'c0e0513f5a27f087', '2024-07-17 13:06:59', '2024-07-17 13:06:59'),
(888, 286, '815bf2e32d0215ef', '7ec7c2cb-ad1e-4d6b-8b25-4c6cf09a927b', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '815bf2e32d0215ef', '2024-07-17 13:07:01', '2024-07-17 13:07:01'),
(889, 286, 'b20c573a120b663d', '6f077c85-a268-411e-ae48-740e7a46b86b', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, 'b20c573a120b663d', '2024-07-17 13:07:03', '2024-07-17 13:07:03'),
(890, 286, 'de91417155cc6a74', '14257434-ed57-4100-ba8f-452d38bb90b7', '68', '68', 'win', 'balance_withdrawal', 0.30, 'play_fiver', 0, 1, 'de91417155cc6a74', '2024-07-17 13:07:06', '2024-07-17 13:07:06'),
(891, 286, '944e02d5c0ab3716', '78b65cc6-0519-49e1-8d99-f91629a8cb9d', '68', '68', 'bet', 'balance_withdrawal', 0.50, 'play_fiver', 0, 1, '944e02d5c0ab3716', '2024-07-17 13:07:08', '2024-07-17 13:07:08'),
(892, 286, '6419459cc9c41948', '473c06cd-893b-44ca-95c0-587c251b5686', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '6419459cc9c41948', '2024-07-17 13:07:09', '2024-07-17 13:07:09'),
(893, 286, '00f52da50f639cef', 'bd10d70f-d505-43ea-b944-819adb199992', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '00f52da50f639cef', '2024-07-17 13:07:10', '2024-07-17 13:07:10'),
(894, 286, '03cf13504ba09ac1', 'b49aea85-8942-49b6-8298-04c786e2c892', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '03cf13504ba09ac1', '2024-07-17 13:07:11', '2024-07-17 13:07:11'),
(895, 286, '3448615262611cfc', '186bdf4d-b61a-4ec0-b2f5-56696b63bda2', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, '3448615262611cfc', '2024-07-17 13:07:12', '2024-07-17 13:07:12'),
(896, 286, 'a250c5e496c059fc', '41c82902-5f15-4575-8142-82544438941c', '68', '68', 'bet', 'balance', 0.50, 'play_fiver', 0, 1, 'a250c5e496c059fc', '2024-07-17 13:07:13', '2024-07-17 13:07:13'),
(897, 286, '6e76117b4acc6915', '83878abd-8be7-4df2-93e4-d4ccf9f2d313', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6e76117b4acc6915', '2024-07-17 13:11:02', '2024-07-17 13:11:02'),
(898, 286, '396f68ab5aaebd80', 'f1c225c8-d350-465d-a44c-377e466c87ff', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '396f68ab5aaebd80', '2024-07-17 13:11:05', '2024-07-17 13:11:05'),
(899, 286, '6965e4dc658751ed', '2307baa9-5f3e-47cb-9130-25c2fb740da5', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '6965e4dc658751ed', '2024-07-17 13:11:07', '2024-07-17 13:11:07'),
(900, 286, '33cdce885d1aabbd', 'd65fd5c9-56ad-40fd-86fc-2cbdfde46319', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '33cdce885d1aabbd', '2024-07-17 13:11:10', '2024-07-17 13:11:10'),
(901, 286, 'd13d49de543cbbe9', 'b82d5d0b-7e8f-41b4-ab7e-340b8c7dd36f', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, 'd13d49de543cbbe9', '2024-07-17 13:11:10', '2024-07-17 13:11:10'),
(902, 286, '28d7385db3b06668', '0871d112-90b2-4da8-aab0-5e2df95633be', '1543462', '1543462', 'bet', 'balance', 0.40, 'play_fiver', 0, 1, '28d7385db3b06668', '2024-07-17 13:11:12', '2024-07-17 13:11:12'),
(903, 286, 'f05da10d3255b1d8', 'acd430e8-387f-4397-b1e8-f40ec4512a73', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'f05da10d3255b1d8', '2024-07-17 13:11:12', '2024-07-17 13:11:12'),
(904, 286, 'bdb512a5b28ef4e5', 'e1c314e9-c428-40b1-9489-5febffb5d554', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'bdb512a5b28ef4e5', '2024-07-17 13:11:17', '2024-07-17 13:11:17'),
(905, 286, 'a448efdb524eb3c7', '271370aa-eaec-4d39-a388-3c629077d841', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'a448efdb524eb3c7', '2024-07-17 13:11:19', '2024-07-17 13:11:19'),
(906, 286, '9b9ebff37aca6adb', 'dee7c488-94bc-4ca0-88b4-1825cb38f086', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '9b9ebff37aca6adb', '2024-07-17 13:11:20', '2024-07-17 13:11:20'),
(907, 286, '4d6febd3d00b6ce5', '86b1883e-18d5-49c2-a125-30db12042469', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '4d6febd3d00b6ce5', '2024-07-17 13:12:01', '2024-07-17 13:12:01'),
(908, 286, 'ebc511b8a32f62d2', 'be2fc70f-b1a8-4be8-99b5-b2f555b5b1a6', '1543462', '1543462', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, 'ebc511b8a32f62d2', '2024-07-17 13:12:02', '2024-07-17 13:12:02'),
(909, 286, 'bbcc50a784ba9952', 'b63063c8-a60f-4c07-8373-34ab82432010', 'vs20bnnzdice', 'vs20bnnzdice', 'bet', 'balance', 0.20, 'play_fiver', 0, 1, 'bbcc50a784ba9952', '2024-07-22 19:44:33', '2024-07-22 19:44:33'),
(910, 1, '669ef82516b87', '1ef4889d-e695-609a-82dd-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669ef82516b87', '2024-07-23 01:24:05', '2024-07-23 01:24:05'),
(911, 1, '669ef82e4f0c8', '1ef4889e-3e9c-6d38-9121-bc241176b098', '126', '126', 'bet', 'balance_bonus', 1.00, 'play_fiver', 0, 1, '669ef82e4f0c8', '2024-07-23 01:24:14', '2024-07-23 01:24:14'),
(912, 1, '669ef87ddf279', '1ef488a1-35a4-6cbe-9a31-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '669ef87ddf279', '2024-07-23 01:25:34', '2024-07-23 01:25:34'),
(913, 1, '669ef88d738f1', '1ef488a1-ca07-6294-af97-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_bonus', 1.20, 'play_fiver', 0, 1, '669ef88d738f1', '2024-07-23 01:25:49', '2024-07-23 01:25:49'),
(914, 1, '669ef89659e44', '1ef488a2-1edb-6072-9f8d-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 3.00, 'play_fiver', 0, 1, '669ef89659e44', '2024-07-23 01:25:58', '2024-07-23 01:25:58'),
(915, 1, '669ef8a3cd5da', '1ef488a2-9f58-624a-8f49-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 19.80, 'play_fiver', 0, 1, '669ef8a3cd5da', '2024-07-23 01:26:12', '2024-07-23 01:26:12'),
(916, 1, '669ef8c0060d6', '1ef488a3-ac20-6954-9982-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '669ef8c0060d6', '2024-07-23 01:26:40', '2024-07-23 01:26:40'),
(917, 1, '669ef926cbfe3', '1ef488a7-809a-6434-926a-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'win', 'balance', 0.20, 'play_fiver', 0, 1, '669ef926cbfe3', '2024-07-23 01:28:23', '2024-07-23 01:28:23'),
(918, 1, '669ef930ed123', '1ef488a7-e142-6cfa-b21a-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_bonus', 0.40, 'play_fiver', 0, 1, '669ef930ed123', '2024-07-23 01:28:33', '2024-07-23 01:28:33'),
(919, 1, '669ef9d1a0cfc', '1ef488ad-ddb4-611e-8dff-bc241176b098', 'zombie-outbrk', 'zombie-outbrk', 'bet', 'balance_bonus', 2.00, 'play_fiver', 0, 1, '669ef9d1a0cfc', '2024-07-23 01:31:14', '2024-07-23 01:31:14'),
(920, 1, '669f04d64382b', '1ef48916-f135-6918-8719-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669f04d64382b', '2024-07-23 02:18:14', '2024-07-23 02:18:14'),
(921, 1, '669f050b9dd7a', '1ef48918-ee2f-6f28-9a1f-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669f050b9dd7a', '2024-07-23 02:19:08', '2024-07-23 02:19:08'),
(922, 1, '669f0512a7fb7', '1ef48919-3156-6e3c-9256-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669f0512a7fb7', '2024-07-23 02:19:15', '2024-07-23 02:19:15'),
(923, 1, '669f05144e42b', '1ef48919-40e7-68d8-9e74-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669f05144e42b', '2024-07-23 02:19:16', '2024-07-23 02:19:16'),
(924, 1, '669f0515f34be', '1ef48919-50e3-687c-a2de-bc241176b098', '126', '126', 'bet', 'balance_bonus', 0.50, 'play_fiver', 0, 1, '669f0515f34be', '2024-07-23 02:19:18', '2024-07-23 02:19:18');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'games-exclusive-edit', 'web', '2023-10-12 16:23:45', '2023-10-12 18:12:28'),
(2, 'games-exclusive-view', 'web', '2023-10-12 16:23:56', '2023-10-12 18:11:25'),
(3, 'games-exclusive-create', 'web', '2023-10-12 16:25:06', '2023-10-12 18:11:10'),
(4, 'admin-view', 'web', '2023-10-12 17:56:35', '2023-10-12 17:56:35'),
(5, 'admin-create', 'web', '2023-10-12 18:56:02', '2023-10-12 18:56:02'),
(6, 'admin-edit', 'web', '2023-10-12 18:56:27', '2023-10-12 18:56:27'),
(7, 'admin-delete', 'web', '2023-10-12 18:56:55', '2023-10-12 18:56:55'),
(8, 'category-view', 'web', '2023-10-12 19:01:31', '2023-10-12 19:01:31'),
(9, 'category-create', 'web', '2023-10-12 19:01:46', '2023-10-12 19:01:46'),
(10, 'category-edit', 'web', '2023-10-12 19:01:59', '2023-10-12 19:01:59'),
(11, 'category-delete', 'web', '2023-10-12 19:02:09', '2023-10-12 19:02:09'),
(12, 'game-view', 'web', '2023-10-12 19:02:27', '2023-10-12 19:02:27'),
(13, 'game-create', 'web', '2023-10-12 19:02:36', '2023-10-12 19:02:36'),
(14, 'game-edit', 'web', '2023-10-12 19:02:44', '2023-10-12 19:02:44'),
(15, 'game-delete', 'web', '2023-10-12 19:02:54', '2023-10-12 19:02:54'),
(16, 'wallet-view', 'web', '2023-10-12 19:05:49', '2023-10-12 19:05:49'),
(17, 'wallet-create', 'web', '2023-10-12 19:06:01', '2023-10-12 19:06:01'),
(18, 'wallet-edit', 'web', '2023-10-12 19:06:11', '2023-10-12 19:06:11'),
(19, 'wallet-delete', 'web', '2023-10-12 19:06:18', '2023-10-12 19:06:18'),
(20, 'deposit-view', 'web', '2023-10-12 19:06:44', '2023-10-12 19:06:44'),
(21, 'deposit-create', 'web', '2023-10-12 19:06:56', '2023-10-12 19:06:56'),
(22, 'deposit-edit', 'web', '2023-10-12 19:07:05', '2023-10-12 19:07:05'),
(23, 'deposit-update', 'web', '2023-10-12 19:08:00', '2023-10-12 19:08:00'),
(24, 'deposit-delete', 'web', '2023-10-12 19:08:11', '2023-10-12 19:08:11'),
(25, 'withdrawal-view', 'web', '2023-10-12 19:09:31', '2023-10-12 19:09:31'),
(26, 'withdrawal-create', 'web', '2023-10-12 19:09:40', '2023-10-12 19:09:40'),
(27, 'withdrawal-edit', 'web', '2023-10-12 19:09:51', '2023-10-12 19:09:51'),
(28, 'withdrawal-update', 'web', '2023-10-12 19:10:00', '2023-10-12 19:10:00'),
(29, 'withdrawal-delete', 'web', '2023-10-12 19:10:09', '2023-10-12 19:10:09'),
(30, 'order-view', 'web', '2023-10-12 19:12:36', '2023-10-12 19:12:36'),
(31, 'order-create', 'web', '2023-10-12 19:12:47', '2023-10-12 19:12:47'),
(32, 'order-edit', 'web', '2023-10-12 19:12:56', '2023-10-12 19:12:56'),
(33, 'order-update', 'web', '2023-10-12 19:13:06', '2023-10-12 19:13:06'),
(34, 'order-delete', 'web', '2023-10-12 19:13:19', '2023-10-12 19:13:19'),
(35, 'admin-menu-view', 'web', '2023-10-12 20:26:06', '2023-10-12 20:26:06'),
(36, 'setting-view', 'web', '2023-10-12 21:25:46', '2023-10-12 21:25:46'),
(37, 'setting-create', 'web', '2023-10-12 21:25:57', '2023-10-12 21:25:57'),
(38, 'setting-edit', 'web', '2023-10-12 21:26:06', '2023-10-12 21:26:06'),
(39, 'setting-update', 'web', '2023-10-12 21:26:19', '2023-10-12 21:26:19'),
(40, 'setting-delete', 'web', '2023-10-12 21:26:33', '2023-10-12 21:26:33');

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_general_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `providers`
--

CREATE TABLE `providers` (
  `id` bigint UNSIGNED NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `views` bigint DEFAULT '1',
  `distribution` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'play_fiver',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `providers`
--

INSERT INTO `providers` (`id`, `cover`, `code`, `name`, `status`, `views`, `distribution`, `created_at`, `updated_at`) VALUES
(2, NULL, 'PRAGMATIC', 'PRAGMATIC', 1, 1, 'play_fiver', '2024-04-16 02:51:14', '2024-05-09 01:18:26'),
(3, NULL, 'SPRIBE', 'SPRIBE', 1, 1, 'play_fiver', '2024-04-16 14:38:13', '2024-06-08 00:39:45'),
(9, NULL, 'NETENT', 'NETENT', 1, 1, 'play_fiver', '2024-04-16 15:30:19', '2024-05-06 17:13:19'),
(13, NULL, 'DREAMTECH', 'DREAMTECH', 1, 1, 'play_fiver', '2024-04-16 17:48:28', '2024-05-09 00:55:00'),
(1, NULL, 'PGSOFT', 'PGSOFT', 1, 1, 'play_fiver', '2024-05-02 13:49:33', '2024-07-23 00:25:36'),
(4, NULL, 'GALAXSYS', 'GALAXSYS', 1, 1, 'play_fiver', '2024-05-02 14:24:20', '2024-05-09 00:54:52'),
(5, NULL, 'NOVAMATIC', 'NOVAMATIC', 1, 1, 'play_fiver', '2024-05-02 14:42:14', '2024-05-06 17:07:08'),
(6, NULL, 'MICROGAMING', 'MICROGAMING', 1, 1, 'play_fiver', '2024-05-02 14:51:14', '2024-05-06 17:09:52'),
(7, NULL, 'HABANERO', 'HABANERO', 1, 1, 'play_fiver', '2024-05-02 16:15:37', '2024-05-06 17:10:28'),
(8, NULL, 'PLAYNGO', 'PLAYNGO', 1, 1, 'play_fiver', '2024-05-02 16:22:19', '2024-05-06 17:11:29'),
(10, NULL, 'PLAYSON', 'PLAYSON', 1, 1, 'play_fiver', '2024-05-02 16:49:33', '2024-05-06 17:14:01'),
(11, NULL, 'PRAGMATICLIVE', 'PRAGMATICLIVE', 1, 1, 'play_fiver', '2024-05-02 17:53:24', '2024-05-06 17:15:46'),
(12, NULL, 'TOPTREND', 'TOPTREND', 1, 1, 'play_fiver', '2024-05-02 17:58:52', '2024-05-06 17:17:12'),
(15, NULL, 'BOOONGO', 'BOOONGO', 1, 1, 'play_fiver', '2024-05-03 14:18:11', '2024-05-09 01:19:22'),
(14, NULL, 'EVOPLAY', 'EVOPLAY', 1, 1, 'play_fiver', '2024-05-03 14:25:49', '2024-07-15 20:29:21'),
(16, NULL, 'CQ9', 'CQ9', 1, 1, 'play_fiver', '2024-05-23 20:48:08', '2024-05-23 21:24:22'),
(17, NULL, 'REELKINGDOM', 'REELKINGDOM', 1, 1, 'play_fiver', '2024-05-29 18:30:55', '2024-05-29 18:30:55'),
(18, NULL, 'EVOLUTION', 'EVOLUTION', 1, 1, 'play_fiver', '2024-06-17 17:05:10', '2024-06-17 17:05:10');

-- --------------------------------------------------------

--
-- Estrutura para tabela `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

--
-- Despejando dados para a tabela `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 16:20:41', '2023-10-12 16:20:41'),
(2, 'afiliado', 'web', '2023-10-12 16:21:08', '2023-10-12 16:21:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estrutura para tabela `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `software_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_favicon` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_logo_white` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_logo_black` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_background` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'BRL',
  `decimal_format` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'dot',
  `currency_position` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'left',
  `revshare_percentage` bigint DEFAULT '20',
  `ngr_percent` bigint DEFAULT '20',
  `soccer_percentage` bigint DEFAULT '30',
  `prefix` varchar(191) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'R$',
  `storage` varchar(191) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'local',
  `initial_bonus` bigint DEFAULT '0',
  `min_deposit` int DEFAULT NULL,
  `max_deposit` int DEFAULT NULL,
  `min_withdrawal` int DEFAULT NULL,
  `max_withdrawal` int DEFAULT NULL,
  `rollover` bigint DEFAULT '10',
  `rollover_deposit` bigint DEFAULT '1',
  `suitpay_is_enable` tinyint DEFAULT '1',
  `stripe_is_enable` tinyint DEFAULT '1',
  `bspay_is_enable` tinyint DEFAULT '0',
  `sharkpay_is_enable` tinyint DEFAULT '1',
  `turn_on_football` tinyint DEFAULT '1',
  `revshare_reverse` tinyint(1) DEFAULT '1',
  `bonus_vip` bigint DEFAULT '100',
  `activate_vip_bonus` tinyint(1) DEFAULT '1',
  `updated_at` timestamp NULL DEFAULT NULL,
  `maintenance_mode` tinyint DEFAULT '0',
  `withdrawal_limit` bigint DEFAULT NULL,
  `withdrawal_period` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `disable_spin` tinyint(1) NOT NULL DEFAULT '0',
  `perc_sub_lv1` bigint NOT NULL DEFAULT '4',
  `perc_sub_lv2` bigint NOT NULL DEFAULT '2',
  `perc_sub_lv3` bigint NOT NULL DEFAULT '3',
  `disable_rollover` tinyint DEFAULT '0',
  `rollover_protection` bigint NOT NULL DEFAULT '1',
  `cpa_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_value` decimal(10,2) DEFAULT NULL,
  `cpa_percentage_baseline` decimal(10,2) DEFAULT NULL,
  `cpa_percentage` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mercadopago_is_enable` tinyint DEFAULT '0',
  `digitopay_is_enable` tinyint NOT NULL DEFAULT '0',
  `default_gateway` varchar(191) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'digitopay',
  `trunk_baseline` decimal(20,2) NOT NULL DEFAULT '20.00',
  `trunk_aposta` decimal(20,2) NOT NULL DEFAULT '20.00',
  `trunk_valor` decimal(20,2) NOT NULL DEFAULT '20.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `settings`
--

INSERT INTO `settings` (`id`, `software_name`, `software_description`, `software_favicon`, `software_logo_white`, `software_logo_black`, `software_background`, `currency_code`, `decimal_format`, `currency_position`, `revshare_percentage`, `ngr_percent`, `soccer_percentage`, `prefix`, `storage`, `initial_bonus`, `min_deposit`, `max_deposit`, `min_withdrawal`, `max_withdrawal`, `rollover`, `rollover_deposit`, `suitpay_is_enable`, `stripe_is_enable`, `bspay_is_enable`, `sharkpay_is_enable`, `turn_on_football`, `revshare_reverse`, `bonus_vip`, `activate_vip_bonus`, `updated_at`, `maintenance_mode`, `withdrawal_limit`, `withdrawal_period`, `disable_spin`, `perc_sub_lv1`, `perc_sub_lv2`, `perc_sub_lv3`, `disable_rollover`, `rollover_protection`, `cpa_baseline`, `cpa_value`, `cpa_percentage_baseline`, `cpa_percentage`, `mercadopago_is_enable`, `digitopay_is_enable`, `default_gateway`, `trunk_baseline`, `trunk_aposta`, `trunk_valor`) VALUES
(1, 'Onda Games', 'Os melhores jogos de cassino e slots com PIX automático.', 'uploads/33G35wXv3KOENX2MZmqffPON32ksR2xZS5fZSyAZ.png', 'uploads/lCEeI26vss6HED0D8H4opv28Khcuv63zvWuwF7Ql.png', 'uploads/Z6xSuvKyixZhfJGEk3M1GP9tTMHzkjlRmYfcYcyV.png', '[]', 'BRL', 'dot', 'left', 0, 0, 30, 'R$', 'local', 25, 10, 10000, 20, 2000, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, '2024-07-23 20:34:29', 0, 100, 'daily', 1, 10, 0, 0, 1, 0, 20.00, 15.00, 30.00, '50', 0, 1, 'suitpay', 50.00, 30.00, 50.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting_mails`
--

CREATE TABLE `setting_mails` (
  `id` bigint UNSIGNED NOT NULL,
  `software_smtp_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_host` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_port` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_username` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_encryption` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_from_address` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `software_smtp_mail_from_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sub_affiliates`
--

CREATE TABLE `sub_affiliates` (
  `id` bigint UNSIGNED NOT NULL,
  `affiliate_id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `suit_pay_payments`
--

CREATE TABLE `suit_pay_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `withdrawal_id` bigint UNSIGNED NOT NULL,
  `pix_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observation` text COLLATE utf8mb4_general_ci,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `system_wallets`
--

CREATE TABLE `system_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `label` char(32) COLLATE utf8mb4_general_ci NOT NULL,
  `balance` decimal(27,12) NOT NULL DEFAULT '0.000000000000',
  `balance_min` decimal(27,12) NOT NULL DEFAULT '10000.100000000000',
  `pay_upto_percentage` decimal(4,2) NOT NULL DEFAULT '45.00',
  `mode` enum('balance_min','percentage') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'percentage',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

--
-- Despejando dados para a tabela `system_wallets`
--

INSERT INTO `system_wallets` (`id`, `label`, `balance`, `balance_min`, `pay_upto_percentage`, `mode`, `created_at`, `updated_at`) VALUES
(1, 'system', 261.800000000000, 10000.100000000000, 45.00, 'percentage', '2023-10-11 16:11:15', '2023-10-16 18:42:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `payment_method` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `currency` varchar(20) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'usd',
  `status` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `accept_bonus` tinyint(1) NOT NULL DEFAULT '1',
  `hash` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `idUnico` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `transactions`
--

INSERT INTO `transactions` (`id`, `payment_id`, `user_id`, `payment_method`, `price`, `currency`, `status`, `created_at`, `updated_at`, `reference`, `accept_bonus`, `hash`, `idUnico`) VALUES
(62, '42f4ffcf-688f-48b2-8022-726c93130ba8', 1, 'pix', 50.00, 'BRL', 0, '2024-07-11 07:15:36', '2024-07-11 07:15:36', NULL, 1, '', NULL),
(63, 'b2eff74a-ebfb-4c1e-a263-e331e6065dd1', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 09:32:29', '2024-07-11 09:32:29', NULL, 1, '', '668f989c1a5ba'),
(64, '293f04f3-76f6-4956-a00e-f724c87b01a9', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 09:56:59', '2024-07-11 09:56:59', NULL, 1, '', '668f9e5a20e2f'),
(65, 'db643fa9-1d13-49f0-a412-d5f1af64e322', 1, 'pix', 10.00, 'BRL', 0, '2024-07-11 09:57:48', '2024-07-11 09:57:48', NULL, 1, '', '668f9e8b40244'),
(66, '3e3bff40-59ee-4b14-8a68-b8e61a1ace01', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 10:09:13', '2024-07-11 10:09:13', NULL, 1, '', '668fa1381699e'),
(67, 'd96fc2e4-8f9d-45f8-9469-df65f0913bb4', 1, 'pix', 10.00, 'BRL', 1, '2024-07-11 10:16:36', '2024-07-11 10:17:04', NULL, 1, '', '668fa2f2ed1b5'),
(68, '091aff02-dbc8-4c39-a7ec-e5397538b165', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 10:41:23', '2024-07-11 10:41:23', NULL, 1, '', '668fa8c27bfbf'),
(69, '8008cc97-9a0c-49fa-af0a-7f98a0f498d1', 1, 'pix', 50.00, 'BRL', 0, '2024-07-11 23:37:32', '2024-07-11 23:37:32', NULL, 1, '', '66905eaa296f9'),
(70, '04dc8db2-d7b5-47ec-8187-74db138fd7b7', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 23:37:54', '2024-07-11 23:37:54', NULL, 1, '', '66905ec10defb'),
(71, 'cabee6f1-c4b0-4d60-a5a4-99389e0e1198', 1, 'pix', 30.00, 'BRL', 0, '2024-07-11 23:39:24', '2024-07-11 23:39:24', NULL, 1, '', '66905f1ab843f'),
(88, '30dbb9fa-7013-4759-89a2-ed91049da7c7', 1, 'pix', 10.00, 'BRL', 0, '2024-07-12 13:43:40', '2024-07-12 13:43:40', NULL, 1, '', '669124fb2ff5f'),
(81, '4e8ec840-8eb5-4a6e-96bc-e17c4b909c2c', 1, 'pix', 30.00, 'BRL', 0, '2024-07-12 03:32:06', '2024-07-12 03:32:06', NULL, 1, '', '669095a44dec7'),
(82, '5ab74ad9-15d4-43d8-ad16-f6d3e81f9ba1', 1, 'pix', 30.00, 'BRL', 0, '2024-07-12 03:45:33', '2024-07-12 03:45:33', NULL, 1, '', '669098cb3f5d6'),
(86, '2f5d60d1-6874-4c84-930e-a1011f135694', 1, 'pix', 30.00, 'BRL', 0, '2024-07-12 08:13:30', '2024-07-12 08:13:30', NULL, 1, '', '6690d799133f7'),
(84, 'bb4f5a4c-11cd-4fbc-beed-da7d54d722ef', 1, 'pix', 30.00, 'BRL', 0, '2024-07-12 06:57:18', '2024-07-12 06:57:18', NULL, 1, '', '6690c5bd532ce'),
(85, '40568626-fecb-4afd-b9f2-fc8d244132da', 1, 'pix', 30.00, 'BRL', 0, '2024-07-12 07:58:20', '2024-07-12 07:58:20', NULL, 1, '', '6690d40a8af7f');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `oauth_id` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `oauth_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cpf` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logged_in` tinyint NOT NULL DEFAULT '0',
  `banned` tinyint NOT NULL DEFAULT '0',
  `inviter` int DEFAULT NULL,
  `inviter_code` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliate_revenue_share` bigint NOT NULL DEFAULT '2',
  `affiliate_revenue_share_fake` bigint DEFAULT NULL,
  `affiliate_cpa` decimal(20,2) NOT NULL DEFAULT '10.00',
  `affiliate_percentage_cpa` decimal(10,2) DEFAULT NULL,
  `affiliate_percentage_baseline` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `affiliate_baseline` decimal(20,2) NOT NULL DEFAULT '40.00',
  `is_demo_agent` tinyint NOT NULL DEFAULT '0',
  `status` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'active',
  `language` varchar(191) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pt_BR',
  `role_id` int DEFAULT '3',
  `affiliate_bau_baseline` decimal(20,2) NOT NULL DEFAULT '20.00',
  `affiliate_bau_value` decimal(20,2) NOT NULL DEFAULT '20.00',
  `affiliate_bau_aposta` decimal(20,2) NOT NULL DEFAULT '20.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `oauth_id`, `oauth_type`, `avatar`, `last_name`, `cpf`, `phone`, `logged_in`, `banned`, `inviter`, `inviter_code`, `affiliate_revenue_share`, `affiliate_revenue_share_fake`, `affiliate_cpa`, `affiliate_percentage_cpa`, `affiliate_percentage_baseline`, `affiliate_baseline`, `is_demo_agent`, `status`, `language`, `role_id`, `affiliate_bau_baseline`, `affiliate_bau_value`, `affiliate_bau_aposta`) VALUES
(1, 'Admin', '31992812273@gmail.com', NULL, '$2y$10$9pKziqD1XvAzwjfNBiVJ1uqsumKxzj3KAXoLKuVCEabxrJXXRxf6S', 'qVMR0ydCLreiMxIxpfXMHlvYeKaJXdfTBIGJm6tO7FBa1IvpGsgatauQPTHU', '2023-11-07 22:15:13', '2024-07-12 08:07:45', NULL, NULL, 'uploads/8lx3OeL0c6GX18GMIhbgf2Kj4JVew0NRmnTUYYSb.png', NULL, NULL, NULL, 0, 0, NULL, 'IL9O93HOCY', 20, NULL, 10.00, NULL, NULL, 40.00, 0, 'active', 'pt_BR', 1, 20.00, 20.00, 20.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vips`
--

CREATE TABLE `vips` (
  `id` bigint UNSIGNED NOT NULL,
  `bet_symbol` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `bet_level` bigint NOT NULL DEFAULT '1',
  `bet_required` bigint DEFAULT NULL,
  `bet_period` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bet_bonus` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vip_users`
--

CREATE TABLE `vip_users` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `vip_id` int UNSIGNED NOT NULL,
  `level` bigint NOT NULL,
  `points` bigint NOT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `currency` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `symbol` varchar(5) COLLATE utf8mb4_general_ci NOT NULL,
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_bonus_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_deposit_rollover` decimal(10,2) DEFAULT '0.00',
  `balance_withdrawal` decimal(10,2) DEFAULT '0.00',
  `balance_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `balance_cryptocurrency` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `balance_demo` decimal(20,8) DEFAULT '1000.00000000',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `hide_balance` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_bet` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_won` bigint NOT NULL DEFAULT '0',
  `total_lose` bigint NOT NULL DEFAULT '0',
  `last_won` bigint NOT NULL DEFAULT '0',
  `last_lose` bigint NOT NULL DEFAULT '0',
  `vip_level` bigint DEFAULT '0',
  `vip_points` bigint DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Despejando dados para a tabela `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `currency`, `symbol`, `balance`, `balance_bonus_rollover`, `balance_deposit_rollover`, `balance_withdrawal`, `balance_bonus`, `balance_cryptocurrency`, `balance_demo`, `refer_rewards`, `hide_balance`, `active`, `created_at`, `updated_at`, `total_bet`, `total_won`, `total_lose`, `last_won`, `last_lose`, `vip_level`, `vip_points`) VALUES
(1, 1, 'BRL', 'R$', 100.00, 25.00, 0.00, 25.50, 71.20, 0.00000000, 1000.00000000, 10.00, 0, 1, '2023-11-07 22:15:13', '2024-07-23 02:19:18', 0.00, 0, 0, 0, 0, 1, 10000);

-- --------------------------------------------------------

--
-- Estrutura para tabela `wallet_changes`
--

CREATE TABLE `wallet_changes` (
  `id` bigint UNSIGNED NOT NULL,
  `reason` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `change` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value_bonus` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_roi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `value_entry` decimal(20,2) NOT NULL DEFAULT '0.00',
  `refer_rewards` decimal(20,2) NOT NULL DEFAULT '0.00',
  `game` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int UNSIGNED NOT NULL,
  `app_id` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `peak_connection_count` int NOT NULL,
  `websocket_message_count` int NOT NULL,
  `api_message_count` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Estrutura para tabela `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint UNSIGNED NOT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `proof` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '0',
  `pix_key` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pix_type` varchar(191) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_general_ci,
  `currency` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `symbol` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_histories_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `affiliate_histories_inviter_index` (`inviter`) USING BTREE;

--
-- Índices de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `affiliate_withdraws_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `baus`
--
ALTER TABLE `baus`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `casino_categories_slug_unique` (`slug`) USING BTREE;

--
-- Índices de tabela `category_game`
--
ALTER TABLE `category_game`
  ADD KEY `category_games_category_id_foreign` (`category_id`) USING BTREE,
  ADD KEY `category_games_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `currency_alloweds_currency_id_foreign` (`currency_id`) USING BTREE;

--
-- Índices de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `deposits_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `digito_pay_payments_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `digito_pay_payments_withdrawal_id_index` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`) USING BTREE;

--
-- Índices de tabela `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`),
  ADD KEY `games_provider_id_index` (`provider_id`),
  ADD KEY `games_game_code_index` (`game_id`);

--
-- Índices de tabela `games_keys`
--
ALTER TABLE `games_keys`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `game_favorites_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_favorites_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_likes`
--
ALTER TABLE `game_likes`
  ADD UNIQUE KEY `game_likes_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_likes_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `game_reviews`
--
ALTER TABLE `game_reviews`
  ADD UNIQUE KEY `game_reviews_user_id_game_id_unique` (`user_id`,`game_id`) USING BTREE,
  ADD KEY `game_reviews_game_id_foreign` (`game_id`) USING BTREE;

--
-- Índices de tabela `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_fivers_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `ggr_games_world_slots_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `likes_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `likes_liked_user_id_foreign` (`liked_user_id`) USING BTREE;

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `missions`
--
ALTER TABLE `missions`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `mission_users`
--
ALTER TABLE `mission_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `mission_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `mission_users_mission_id_index` (`mission_id`) USING BTREE;

--
-- Índices de tabela `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE;

--
-- Índices de tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`) USING BTREE;

--
-- Índices de tabela `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `orders_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`) USING BTREE;

--
-- Índices de tabela `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`) USING BTREE,
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`) USING BTREE;

--
-- Índices de tabela `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`) USING BTREE;

--
-- Índices de tabela `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE;

--
-- Índices de tabela `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `sub_affiliates_affiliate_id_index` (`affiliate_id`) USING BTREE,
  ADD KEY `sub_affiliates_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `suit_pay_payments_user_id_foreign` (`user_id`) USING BTREE,
  ADD KEY `suit_pay_payments_withdrawal_id_foreign` (`withdrawal_id`) USING BTREE;

--
-- Índices de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `transactions_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `users_email_unique` (`email`) USING BTREE;

--
-- Índices de tabela `vips`
--
ALTER TABLE `vips`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `vip_users`
--
ALTER TABLE `vip_users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `vip_users_user_id_index` (`user_id`) USING BTREE,
  ADD KEY `vip_users_vip_id_index` (`vip_id`) USING BTREE;

--
-- Índices de tabela `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallets_user_id_index` (`user_id`) USING BTREE;

--
-- Índices de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `wallet_changes_user_id_foreign` (`user_id`) USING BTREE;

--
-- Índices de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Índices de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `withdrawals_user_id_foreign` (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `affiliate_histories`
--
ALTER TABLE `affiliate_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT de tabela `affiliate_withdraws`
--
ALTER TABLE `affiliate_withdraws`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `baus`
--
ALTER TABLE `baus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT de tabela `currency_alloweds`
--
ALTER TABLE `currency_alloweds`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `custom_layouts`
--
ALTER TABLE `custom_layouts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de tabela `digito_pay_payments`
--
ALTER TABLE `digito_pay_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1187;

--
-- AUTO_INCREMENT de tabela `games_keys`
--
ALTER TABLE `games_keys`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `game_favorites`
--
ALTER TABLE `game_favorites`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_config`
--
ALTER TABLE `ggds_spin_config`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ggds_spin_runs`
--
ALTER TABLE `ggds_spin_runs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ggr_games`
--
ALTER TABLE `ggr_games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `ggr_games_world_slots`
--
ALTER TABLE `ggr_games_world_slots`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de tabela `missions`
--
ALTER TABLE `missions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mission_users`
--
ALTER TABLE `mission_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=925;

--
-- AUTO_INCREMENT de tabela `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11125;

--
-- AUTO_INCREMENT de tabela `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `setting_mails`
--
ALTER TABLE `setting_mails`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sub_affiliates`
--
ALTER TABLE `sub_affiliates`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `suit_pay_payments`
--
ALTER TABLE `suit_pay_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `system_wallets`
--
ALTER TABLE `system_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT de tabela `vips`
--
ALTER TABLE `vips`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `vip_users`
--
ALTER TABLE `vip_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=292;

--
-- AUTO_INCREMENT de tabela `wallet_changes`
--
ALTER TABLE `wallet_changes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
