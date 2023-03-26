-- phpMyAdmin SQL Dump
-- version 5.0.4deb2~bpo10+1+bionic1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2021 at 01:11 PM
-- Server version: 5.7.35-0ubuntu0.18.04.1
-- PHP Version: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `charity-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin99@yahoo.com', '$2y$10$pJ/jLRdUzTo6DzjfLRypIuKyTSipf/0yuhptb4k8K2R9wNIS6wzL.', '', NULL, NULL),
(2, '', 'sahil99@yahoo.com', '$2y$10$Ga017iTDtFMzoumsCO.P7.Sm.dgoKBO1IZVph0NP2E2xguPVCXSli', '95cRTmX6KiHs3kYPtO4WlKkQt7vk3HaBB8lbFW4I1W96zRN6nq3gHIVDIxpy', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bank_details`
--

CREATE TABLE `bank_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iban_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_details`
--

INSERT INTO `bank_details` (`id`, `account_holder_name`, `bank_name`, `account_no`, `iban_no`, `created_at`, `updated_at`) VALUES
(1, 'Test Admin Tawoon', 'Test Bank USA\r\nDescription:- Something Description\r\nName:-  Something Name\r\nSome Info:-  Some other Info', 'TEST Account 3212', 'FGHV 78237612', NULL, '2021-08-03 05:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_messages`
--

CREATE TABLE `bulk_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matter_id` int(11) DEFAULT NULL,
  `send_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulk_messages`
--

INSERT INTO `bulk_messages` (`id`, `title`, `title_ar`, `description`, `description_ar`, `image`, `city`, `country`, `state`, `platform`, `users`, `matter_id`, `send_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sahil Testing Case Title', NULL, 'Sahil Testing Case Description', 'وصف حالة اختبار الساحل', NULL, 'all', 'all', 'all', 'all', 'all', 30, '2021-08-02 17:28:47', 1, '2021-08-02 11:00:13', '2021-08-02 11:00:13'),
(2, 'Test From Case', NULL, 'Test case', 'وصف حالة اختبار الساحل', 'public/profile/ZAb3uBzbjiOshVUN4RTRJssYY9klwxVGxMGNZ6l6.png', 'all', 'all', 'all', 'all', 'all', 18, '2021-08-02 17:31:18', 1, '2021-08-02 11:02:15', '2021-08-02 11:02:15'),
(3, 'Tesrt Case Title', NULL, 'Sahil Testing Case Description', 'وصف حالة اختبار الساحل', 'public/profile/dcRJgTKeSytI9LUMZZuFH1WhHM0eUU5UhTfSRcXI.png', 'all', 'all', 'all', 'all', 'initiator', 30, '2021-08-02 17:33:14', 1, '2021-08-02 11:04:06', '2021-08-02 11:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_arabic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `type` enum('Money','Unit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#59b7b4',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `serial_no`, `title`, `title_arabic`, `status`, `type`, `image`, `color`, `created_at`, `updated_at`) VALUES
(6, 'SEC 1232', 'Medicines', 'الأدوية', 1, 'Money', 'public/profile/qXCflsUoW1ApQl6jHKMELGMGKXLv2a5iZRtsQyzX.png', '#59b7b4', NULL, '2021-08-03 09:33:31'),
(7, 'SEC 7564', 'Surgeries', 'العمليات الجراحية', 1, 'Money', 'public/profile/C38wgQdDo1VyZ0QvLunlNFieT21n2dr6fz8HN52d.png', '#59b7b4', NULL, '2021-07-21 04:48:26'),
(8, 'SEC 4291', 'Seasonal Campaign', 'الحملات الموسمية', 1, 'Money', 'public/profile/IfE7mLHF9PTppHZVoDTQqeaL0547J0R2ECR5Fk5C.png', '#59b7b4', '2021-07-21 04:52:36', '2021-08-03 05:27:01'),
(9, 'SEC 8893', 'Orphans Sponsorship', 'كفالة الأيتامالأيتام', 1, 'Money', 'public/profile/h19laTn4018vyDr3BSqvtPw05VoagPCa7lR6oK4f.png', '#59b7b4', '2021-07-21 04:54:41', '2021-07-30 12:58:59'),
(10, 'SEC 8198', 'Blood Donation', 'دم', 1, 'Unit', 'public/profile/yYKxa5vwpy5Uv1GDmEvoiPFEjaOyOojnNnUTmPrO.png', '#59b7b4', '2021-07-23 04:39:41', '2021-07-28 12:10:22'),
(11, 'SEC 4683', 'Schools', 'المدارس', 1, 'Unit', 'public/profile/8aPdKYrQIYtxGtlmhCKLtkW1f9uyrEoDMyz70CWH.png', '#59b7b4', '2021-07-30 18:35:09', '2021-08-02 05:58:41'),
(12, 'SEC 4668', 'Test', 'اختبار', 1, 'Unit', 'public/profile/XIjY2yVsDWks1aaR17RNYo8sFomqn5TW7x7riE8Y.jpg', '#59b7b4', '2021-08-02 06:03:43', '2021-08-04 11:57:15'),
(13, 'SEC 2281', 'Test', 'اختبار', 1, 'Unit', 'public/profile/wSRe4eNcnlap5o6WS5Sip8zfmRFabEnilfiz8s2j.png', '#59b7b4', '2021-08-02 06:09:58', '2021-08-04 11:57:07'),
(14, 'SEC 1467', 'Test Two', 'اختبار اثنين', 1, 'Unit', 'public/profile/krSLnHaENozPvVh2mVIyvIkA3F6L8jWDTlD6pYDz.png', '#59b7b4', '2021-08-03 04:55:47', '2021-08-04 11:56:46'),
(15, 'SEC 1331', 'Nishant', 'اختبار اثنين', 1, 'Money', 'public/profile/ElNRHIXbziczWmpMhIF2PvVUkC68NXGiUjGu0iS1.png', '#59b7b4', '2021-08-03 04:56:10', '2021-08-04 11:56:58'),
(16, 'SEC 8868', 'Test Two', 'اختبار اثنين', 1, 'Unit', 'public/profile/z1S2cJQ7G7MlgJFJplkcpvWvMQnUho67EpW5NfWP.jpg', '#59b7b4', '2021-08-03 05:01:52', '2021-08-04 11:56:36'),
(17, 'SEC 1844', 'Test', 'اختبار 2', 1, 'Unit', 'public/profile/lpik8xELrk0FMEw4kgd9wll4s3iUS3MNqTco8cBq.png', '#59b7b4', '2021-08-03 05:26:14', '2021-08-04 09:19:21'),
(18, 'SEC 6990', 'Test', 'اختبار 2', 1, 'Money', 'public/profile/T9Wm3qvv0OWuEOKjsbVRu9FPPSMbMsFY4C8JF21l.png', '#59b7b4', '2021-08-03 06:11:37', '2021-08-04 09:19:17'),
(19, 'SEC 1803', 'Charity schools', 'نيوزيلاندا', 1, 'Unit', 'public/profile/ZlU1bcnPYUs11mOToKUzfAUb0xCoN1aspOpIMVR1.png', '#59b7b4', '2021-08-03 06:49:10', '2021-08-04 06:44:55'),
(20, 'SEC 9194', 'Test', 'Test 123', 0, 'Unit', 'public/profile/DFzSQN6YHJqxkd1v0KHpZ567bDW7xoElZ6xnewL7.png', '#59b7b4', '2021-08-04 09:29:12', '2021-08-05 09:24:10'),
(21, 'SEC 8905', 'Test', 'قطاع 88 ABC', 0, 'Money', 'public/profile/B0RKb6msTHFhM63VlEI99GgESNWd7LOGB60Fc7fS.png', '#59b7b4', '2021-08-05 09:31:45', '2021-08-05 11:21:13'),
(22, 'SEC 1091', 'Test Sector', 'الاء', 1, 'Money', 'public/profile/eVJF0iTX5wmnmoNe5p0k8JuYxAXFP0X5awd8YrEq.png', '#59b7b4', '2021-08-05 09:38:31', '2021-08-05 10:42:14');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `countrie_id` bigint(20) UNSIGNED NOT NULL,
  `state_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_arabic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `countrie_id`, `state_id`, `title`, `title_arabic`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Bilaspur', 'بيلاسبور', 1, '2021-07-14 11:24:52', '2021-07-05 13:11:15'),
(2, 1, 4, 'Abhoar', '', 1, '2021-07-14 11:24:52', NULL),
(3, 1, 4, 'Amritsar', '', 1, '2021-07-14 11:24:52', NULL),
(4, 1, 4, 'Moga', '', 1, '2021-07-14 11:24:52', NULL),
(5, 1, 4, 'Barnala', '', 1, '2021-07-14 11:24:52', NULL),
(6, 3, 3, 'Banga', 'حية', 1, '2021-07-14 11:24:52', '2021-07-14 11:43:56'),
(7, 1, 4, 'Mohali', 'موهالي', 1, '2021-07-21 09:05:37', '2021-07-21 09:05:37'),
(8, 1, 5, 'Ambala', 'Ambala', 1, '2021-07-21 11:39:24', '2021-07-21 11:39:24'),
(9, 7, 6, 'Khartoum', 'الخرطوم', 1, '2021-07-23 23:13:00', '2021-07-23 23:13:00'),
(10, 7, 6, 'Omdurman', 'أمدرمان', 1, '2021-07-23 23:13:23', '2021-07-23 23:13:23'),
(11, 3, 3, 'Bahriaaa', 'بحري', 1, '2021-07-23 23:13:41', '2021-07-29 12:45:10'),
(12, 8, 8, 'Abu al Abyad', 'أبو الأبيض', 1, '2021-07-30 18:24:12', '2021-08-02 09:28:09'),
(13, 12, 9, 'Manurewa', 'مانوريوا', 1, '2021-08-03 09:05:07', '2021-08-03 09:33:01'),
(14, 1, 4, 'Mohali', 'موهالي', 1, '2021-08-03 09:16:02', '2021-08-03 09:40:54'),
(15, 11, 10, 'Manurewa', 'مانوريوا', 1, '2021-08-03 10:24:58', '2021-08-05 08:52:57'),
(16, 7, 7, 'Madani', 'مدني', 1, '2021-08-05 09:04:56', '2021-08-05 11:20:33');

-- --------------------------------------------------------

--
-- Table structure for table `content_pages`
--

CREATE TABLE `content_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longText` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `content_pages`
--

INSERT INTO `content_pages` (`id`, `title`, `longText`, `created_at`, `updated_at`) VALUES
(1, 'Terms And Conditions', '<p><a href=\"http://facebook.com\">Lorem ipsum</a> is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne v vvv vvLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>', NULL, '2021-06-02 12:58:53'),
(2, 'Privacy Policy', '<p><a href=\"http://facebook.com\">Lorem ipsum</a> is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne v vvv vvLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>', NULL, '2021-06-03 13:11:24'),
(3, 'Faqs', '<p><a href=\"http://facebook.com\">Lorem ipsum</a> is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne v vvv vvLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>', NULL, '2021-06-03 13:11:35'),
(4, 'About Us', '<p><a href=\"http://facebook.com\">Lorem ipsum</a> is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne&nbsp;Lorem ipsum is a dummy conetne v vvv vvLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Lorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetneLorem ipsum is a dummy conetne</p>', NULL, '2021-06-04 12:59:21');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `title`, `title_ar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'India', 'الهند', 1, '2021-06-22 06:15:27', '2021-08-03 06:29:11'),
(3, 'Bangladesh', 'بنغلاديش', 1, '2021-06-22 06:15:27', '2021-08-03 06:22:24'),
(4, 'Pakistan', 'باكستان', 1, '2021-07-13 12:26:06', '2021-07-13 12:26:06'),
(5, 'Sri Lanka', 'asasasas', 1, '2021-07-21 06:38:01', '2021-07-21 06:38:01'),
(6, 'canadanmm', 'canada', 1, '2021-07-21 11:34:36', '2021-07-21 11:35:17'),
(7, 'Sudan', 'السودان', 1, '2021-07-23 23:11:57', '2021-07-23 23:11:57'),
(8, 'The United Arab Emirates', 'الإمارات العربية المتحدة', 1, '2021-07-30 18:19:48', '2021-08-03 06:03:06'),
(9, 'Test Two', 'الاختبار الثاني', 1, '2021-08-03 06:06:35', '2021-08-03 06:17:47'),
(10, 'Test', 'الاختبار', 1, '2021-08-03 06:18:11', '2021-08-03 06:18:11'),
(11, 'Australia', 'أستراليا', 1, '2021-08-03 06:18:42', '2021-08-03 06:18:42'),
(12, 'New Zealand', 'نيوزيلاندا', 1, '2021-08-03 06:19:10', '2021-08-03 06:19:10'),
(13, 'Dubai', 'الاختبار الثاني', 1, '2021-08-03 06:46:00', '2021-08-05 08:26:52'),
(14, 'Egypt', 'مصر', 1, '2021-08-05 08:27:46', '2021-08-05 08:28:10'),
(15, 'UK', 'المملكة المتحدة', 1, '2021-08-05 08:30:23', '2021-08-05 12:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `email_notifications`
--

CREATE TABLE `email_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `matter_id` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_notifications`
--

INSERT INTO `email_notifications` (`id`, `title`, `title_ar`, `description`, `description_ar`, `matter_id`, `city`, `country`, `state`, `platform`, `users`, `send_at`, `status`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Welcome', 'Welcome', 'Welcome', 'Welcome', NULL, 'all', 'all', 'all', 'ios', 'initiator', '2021-07-30 22:34:24', 1, NULL, '2021-07-30 16:04:37', '2021-07-30 16:04:37'),
(2, 'Welcome', 'Welcome', 'Welcome', 'Welcome', NULL, 'all', 'all', 'all', 'all', 'all', '2021-07-30 22:34:24', 1, NULL, '2021-07-30 16:04:43', '2021-07-30 16:04:43'),
(3, 'email notifications', 'email notifications', 'email notifications', 'email notifications', NULL, 'all', 'all', 'all', 'all', 'all', '2021-07-30 23:19:41', 1, NULL, '2021-07-30 16:50:10', '2021-07-30 16:50:10'),
(4, 'Test2', 'Test', 'Test new', 'Test New', 8, '1', '1', '2', 'ios', 'initiator', '2021-08-04 18:46:31', 1, NULL, '2021-08-04 12:17:47', '2021-08-04 12:17:47'),
(5, 'Test', 'Test', 'Test', 'Test', 12, '1', '1', '2', 'ios', 'initiator', '2021-08-04 18:48:47', 1, NULL, '2021-08-04 12:19:08', '2021-08-04 12:19:08'),
(6, 'Test', 'Test', 'Test', 'Test', 26, '1', '1', '2', 'ios', 'initiator', '2021-08-04 18:50:42', 1, NULL, '2021-08-04 12:20:55', '2021-08-04 12:20:55'),
(7, 'Test', 'Test', 'Tset', 'Test123', 24, '1', '1', '2', 'ios', 'initiator', '2021-08-04 18:52:49', 1, NULL, '2021-08-04 12:23:05', '2021-08-04 12:23:05'),
(8, 'Test', 'Tset', 'Test', 'Test123', 28, '1', '1', '2', 'ios', 'initiator', '2021-08-04 18:53:54', 1, NULL, '2021-08-04 12:24:07', '2021-08-04 12:24:07'),
(9, 'Test', 'Test', 'Test', 'Test', 24, '1', '1', '2', 'android', 'initiator', '2021-08-05 19:21:29', 0, NULL, '2021-08-04 12:52:00', '2021-08-04 12:52:00'),
(10, 'Test', 'Test', 'Test1', 'Test2', 25, '1', '1', '2', 'ios', 'initiator', '2021-08-04 19:23:26', 1, NULL, '2021-08-04 12:53:52', '2021-08-04 12:53:52'),
(11, 'Test', 'Tset', 'Test', 'Testq', 9, '1', '1', '2', 'ios', 'initiator', '2021-08-05 19:23:58', 0, NULL, '2021-08-04 12:54:47', '2021-08-04 12:54:47'),
(12, 'Test', 'Test', 'Test', 'Tse', NULL, 'all', 'all', 'all', 'ios', 'initiator', '2021-08-04 19:26:12', 1, 'public/profile/n4BlprB2fhBEUSHU7WWokyCgEgfj3rjtObJSVHpp.jpg', '2021-08-04 12:57:26', '2021-08-04 12:57:26'),
(13, 'Test', 'Test', 'Test', 'Test', NULL, 'all', 'all', 'all', 'ios', 'initiator', '2021-08-04 19:27:38', 1, 'public/profile/giUEQzMQyTtLOTEUqJngMWeTs6aDKBSTcuQv8o2P.jpg', '2021-08-04 12:57:48', '2021-08-04 12:57:48'),
(14, 'Tset', 'Tset', 'Test', 'Test', 19, '1', '1', '2', 'ios', 'initiator', '2021-08-04 19:28:09', 1, 'public/profile/pQqYO1Ji753w3fO8uorUZIOyATmH78zIoR4Lxczn.png', '2021-08-04 12:58:55', '2021-08-04 12:58:55'),
(15, 'Test123', 'Test Bulk', 'Test123', 'Test123', 12, '4', '1', '4', 'all', 'all', '2021-08-04 19:58:10', 1, NULL, '2021-08-04 13:28:50', '2021-08-04 13:28:50'),
(16, 'Sahil Testing email', NULL, 'Testing bulk email', NULL, 14, 'Moga', 'India', 'Punjab', 'all', 'initiator', '2021-08-06 18:13:42', 1, 'public/profile/qJyXEwPsSdG0qoOTbLFT9s9n48b8G7RuGl94PiQD.png', '2021-08-06 11:45:29', '2021-08-06 11:45:29'),
(17, 'sddfsf', 'sdfsf', 'sdsd', 'dsdsd', 17, 'Abhoar', 'India', 'Punjab', 'all', 'initiator', '2021-08-06 18:20:13', 1, 'public/profile/gEvoZGrtIo9dGJJyFClUFKXcouf4OUtAYs85BR8S.png', '2021-08-06 11:50:38', '2021-08-06 11:50:38'),
(18, 'Sahil Testing from admin', NULL, 'Testing from admin', NULL, 16, 'Moga', 'India', 'Punjab', 'all', 'initiator', '2021-08-06 18:55:54', 1, 'public/profile/N8nVqWrEzl4vtFb95d0CIrX2DIJWCcChfT8LVCW5.jpg', '2021-08-06 12:26:28', '2021-08-06 12:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE `followers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`id`, `matter_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(5, 7, 11, 1, '2021-07-12 13:38:40', '2021-07-29 13:46:54'),
(8, 13, 5, 1, '2021-07-21 07:13:40', '2021-07-21 07:13:40'),
(9, 14, 21, 1, '2021-07-21 09:51:27', '2021-07-21 09:51:27'),
(10, 16, 22, 1, '2021-07-21 12:14:16', '2021-07-21 12:14:16'),
(11, 18, 5, 1, '2021-07-23 09:22:27', '2021-07-23 09:22:46'),
(12, 22, 23, 1, '2021-07-23 21:56:27', '2021-07-23 21:56:27'),
(13, 21, 5, 1, '2021-07-25 04:57:15', '2021-07-25 04:57:15'),
(14, 20, 5, 1, '2021-07-25 05:10:09', '2021-07-25 05:10:09'),
(15, 14, 5, 1, '2021-07-25 05:10:31', '2021-07-25 05:10:31'),
(16, 14, 11, 0, '2021-07-25 06:30:04', '2021-07-30 14:58:57'),
(17, 24, 5, 1, '2021-07-26 06:13:52', '2021-07-26 06:13:52'),
(18, 24, 20, 1, '2021-07-26 06:15:50', '2021-07-26 06:15:50'),
(19, 24, 20, 1, '2021-07-26 06:18:15', '2021-07-26 06:18:15'),
(20, 24, 20, 1, '2021-07-26 06:18:51', '2021-07-26 06:18:51'),
(21, 24, 20, 1, '2021-07-26 06:18:55', '2021-07-26 06:18:55'),
(22, 24, 20, 1, '2021-07-26 06:19:49', '2021-07-26 06:19:49'),
(23, 24, 20, 1, '2021-07-26 06:20:20', '2021-07-26 06:20:20'),
(24, 24, 20, 1, '2021-07-26 06:21:02', '2021-07-26 06:21:02'),
(25, 24, 20, 1, '2021-07-26 06:21:04', '2021-07-26 06:21:04'),
(26, 7, 20, 1, '2021-07-26 06:21:15', '2021-07-26 06:21:15'),
(27, 7, 20, 1, '2021-07-26 06:21:34', '2021-07-26 06:21:34'),
(28, 7, 20, 1, '2021-07-26 06:22:11', '2021-07-26 06:22:11'),
(29, 7, 20, 1, '2021-07-26 06:22:52', '2021-07-26 06:22:52'),
(30, 7, 20, 1, '2021-07-26 06:25:19', '2021-07-26 06:25:19'),
(31, 7, 20, 1, '2021-07-26 06:25:34', '2021-07-26 06:25:34'),
(32, 7, 20, 1, '2021-07-26 06:25:35', '2021-07-26 06:25:35'),
(33, 7, 20, 1, '2021-07-26 06:25:47', '2021-07-26 06:25:47'),
(34, 21, 11, 0, '2021-07-26 10:46:45', '2021-08-02 11:27:54'),
(35, 20, 11, 0, '2021-07-26 10:52:29', '2021-07-26 10:52:36'),
(36, 16, 11, 1, '2021-07-26 12:32:08', '2021-07-26 12:32:08'),
(37, 15, 11, 1, '2021-07-26 12:32:22', '2021-07-26 12:32:22'),
(38, 23, 5, 1, '2021-07-27 04:05:35', '2021-08-04 06:38:31'),
(39, 26, 11, 0, '2021-07-27 13:46:59', '2021-08-02 13:32:59'),
(40, 26, 5, 1, '2021-07-27 14:13:06', '2021-07-27 14:13:09'),
(41, 21, 23, 0, '2021-07-28 13:40:14', '2021-07-28 13:40:40'),
(42, 28, 11, 1, '2021-07-29 12:58:17', '2021-08-04 10:01:18'),
(43, 24, 11, 0, '2021-07-30 14:34:08', '2021-07-30 14:34:30'),
(44, 22, 11, 1, '2021-07-30 14:35:40', '2021-08-03 10:12:16'),
(45, 7, 20, 1, '2021-07-30 14:47:30', '2021-07-30 14:47:30'),
(46, 7, 20, 1, '2021-07-30 14:54:15', '2021-07-30 14:54:15'),
(47, 7, 20, 1, '2021-07-30 14:54:41', '2021-07-30 14:54:41'),
(48, 7, 20, 1, '2021-07-30 14:55:07', '2021-07-30 14:55:07'),
(49, 7, 20, 1, '2021-07-30 14:56:31', '2021-07-30 14:56:31'),
(50, 7, 20, 1, '2021-07-30 14:56:34', '2021-07-30 14:56:34'),
(51, 7, 20, 1, '2021-07-30 14:58:37', '2021-07-30 14:58:37'),
(52, 27, 11, 1, '2021-08-03 10:44:25', '2021-08-03 10:44:28'),
(53, 33, 11, 1, '2021-08-03 11:45:16', '2021-08-03 14:33:34'),
(54, 33, 5, 1, '2021-08-03 13:16:26', '2021-08-04 04:18:48'),
(55, 25, 11, 0, '2021-08-04 10:02:54', '2021-08-04 10:02:55'),
(56, 34, 11, 1, '2021-08-04 10:14:40', '2021-08-04 10:14:40'),
(57, 18, 23, 0, '2021-08-05 04:16:55', '2021-08-05 04:16:57'),
(58, 12, 23, 1, '2021-08-05 09:12:14', '2021-08-05 09:12:14'),
(59, 27, 23, 1, '2021-08-05 09:34:06', '2021-08-05 09:34:06'),
(60, 36, 44, 1, '2021-08-05 12:37:24', '2021-08-05 12:37:24'),
(61, 29, 44, 1, '2021-08-05 12:39:17', '2021-08-05 12:39:17'),
(62, 8, 44, 1, '2021-08-05 12:57:15', '2021-08-05 12:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `matters`
--

CREATE TABLE `matters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `serial_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `goal` double(16,2) NOT NULL,
  `national_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `national_certificate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Pending','Approved','Completed','Deleted') COLLATE utf8mb4_unicode_ci NOT NULL,
  `contributed` double(8,2) NOT NULL DEFAULT '0.00',
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matters`
--

INSERT INTO `matters` (`id`, `provider_id`, `categorie_id`, `serial_no`, `title`, `title_ar`, `description`, `description_ar`, `city`, `city_ar`, `country`, `country_ar`, `state`, `location`, `goal`, `national_number`, `national_certificate`, `status`, `contributed`, `end_date`, `start_date`, `created_at`, `updated_at`) VALUES
(7, 20, 7, NULL, 'Testing case', 'testing case arabic', 'Checking testing case in English', NULL, 'Hamirpur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 250.00, '9999999999', 'public/case-document/oGIZqdcGcplLMqN1mLZttlydvsHXVs2HqJfF7JxM.jpg', 'Pending', 20.00, NULL, NULL, '2021-07-01 05:46:39', '2021-07-26 12:30:34'),
(8, 22, 6, NULL, 'Title 1 English', 'Title 2 Arabic', 'Testing English', NULL, 'Chandigarh', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 500.00, '9999989988', 'public/case-document/scQ1arte27XjITeDOM0nzNYj4OGNbJSm6Ho8nqyT.jpg', 'Approved', 10.00, NULL, NULL, '2021-07-01 10:23:14', '2021-07-01 10:23:14'),
(9, 22, 6, NULL, 'Title English 2', 'Title Arabic 2', 'description English', 'Description Arabic', 'Chandigarh', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 650.00, '67884457899', 'public/case-document/MkQABHMXxS8xZnzdJ5OVLpe1XkHbyQGYUGEi5eIx.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-01 10:33:19', '2021-08-04 11:32:42'),
(10, 25, 7, NULL, 'yvyvyv', 'شتسوي', 'cycycyc', 'مش', 'New London County', NULL, 'United States', NULL, NULL, 'Esferasoft Mohali', 200000.00, '567889', 'public/case-document/EYqIsbqbQD1EuWPyBBnYz8SsR0YlFiS88QbISE9h.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-12 11:03:55', '2021-08-05 12:02:42'),
(12, 27, 6, NULL, 'Not Test2', 'eggdf', 'fddfgfg', 'fgdfgfg', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 258.00, '4565656', 'public/case-document/fDmkHsnZCCuxEZ46FipjUceRb2AeUKsnyYDU3CV8.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-20 10:52:03', '2021-08-04 11:33:00'),
(13, 28, 6, NULL, 'Testing', 'سشصض', 'hfjrjfjfjf fjfjfjfj', 'سبتةسبسب', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 200.00, '4u47474', 'public/case-document/dnRb21V6RDjYysuMQch8lg2dMQnqrzejnp7yixjU.jpg', 'Approved', 100.00, NULL, NULL, '2021-07-21 06:54:42', '2021-08-04 11:32:51'),
(14, 29, 7, NULL, 'Gal Blader MMM', 'ghjjkj', 'fghjlkhgg', 'ftfg', 'Mohali', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 50000.00, '919814856008', 'public/case-document/3gomnb63eLayGFlglxG4ndGp21PiOOmUOq9bsjOP.png', 'Approved', 3600.00, NULL, NULL, '2021-07-21 09:49:16', '2021-08-05 12:03:08'),
(15, 30, 6, NULL, 'Testing demo case', 'صحصحت', 'testing desc', 'سشصض', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 2000.00, '3773733', 'public/case-document/EeZeA9MstCpwiWf4lNJHEJIjm9L3ptgAvL5jJeyA.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-21 12:02:33', '2021-08-04 11:32:29'),
(16, 30, 6, NULL, 'testing 2', 'testing 2', 'testing deac 2', 'testing desc 2', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 3000.00, '636363', 'public/case-document/7tfuqgXEvpERHHlYSOBwkiwMuH8sJlSncBUibZBN.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-21 12:03:40', '2021-08-04 11:12:42'),
(17, 10, 6, NULL, 'trying l', 'jhe', 'Describe the update in Englishhdhfjf', 'Describe the update in Arabic', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 100000.00, '636649487', 'public/case-document/mn1oysUYCRyC5uRNSX8LbPBvra7aBE0xkykZgZoG.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-22 05:47:10', '2021-08-03 11:08:09'),
(18, 25, 6, NULL, 'rndhch', 'hdjfjjf', 'bdnjfjjf', 'bbxncnf', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 10600.00, 'bsbdh5363', 'public/case-document/AW7WAjzslAjVXqpdXXpYLHr1G8eYQlTyMepH8RoB.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-22 05:50:40', '2021-07-22 09:12:56'),
(19, 10, 10, NULL, 'trying l', 'jhe', 'Describe the update in Englishhdhfjfjdjrhhd', 'Describe the update in Arabichdhhdhf', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 100000.00, '636649487', 'public/case-document/MjAFWeVofj4IiI2Rf7bOAbVD4BUDdSLAI2SEAQ0n.jpg', 'Approved', 11561.00, NULL, NULL, '2021-07-22 12:54:03', '2021-08-04 11:14:42'),
(20, 25, 10, NULL, 'Testing Blood Unit', '.......', 'This is for testing purpose only.', '............', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 5000.00, '2345678', 'public/case-document/DOJcHU3oLUoEtAGE0CeJuBp75QATriBdYq4OJysk.jpg', 'Approved', 3000.00, NULL, NULL, '2021-07-23 06:10:07', '2021-08-04 11:12:54'),
(21, 29, 10, NULL, 'ھدھفھ', 'دببفبفبف', 'دبفبجف', 'ھدجدئدف', 'Mohali', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 15000.00, 'dgdhdjd', 'public/case-document/PQywI6d8cMG3pCVGit4nePD3BJwEptw0uVDQW3WT.jpg', 'Approved', 14080.00, NULL, NULL, '2021-07-23 12:12:28', '2021-08-04 11:18:01'),
(22, 10, 6, NULL, 'revert', 'referrer', 'Ertertertert', 'Ertertertert', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 100000.00, '636649487', 'public/case-document/sp0eSR45v2lW00U7gPyVb2KZucnudbdmZaj9yNbx.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-23 12:58:21', '2021-07-23 21:15:51'),
(23, 31, 6, NULL, 'Malaria Medicine', 'دواء ملاريا', 'urgent need', 'حوجه عاجله', 'Moga', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 50000.00, '18818191919', 'public/case-document/JFifnS30SWWQqNbkuKAdzGmEsoKFUeiUzHMpTNAV.jpg', 'Approved', 16971.00, NULL, NULL, '2021-07-23 21:48:45', '2021-08-04 12:15:07'),
(24, 10, 7, NULL, 'Test case 1', 'حالة الاختبار 1', 'Case to trest all stuff', NULL, 'asr', NULL, 'India', NULL, NULL, 'Esferasoft Mohali', 10000.00, 'NAT 5412', 'public/case-document/vCvX4SVsRzJjWuAHtqYna8qLqT7jdJTWK9tAv830.png', 'Approved', 0.00, NULL, NULL, '2021-07-26 05:08:22', '2021-08-03 11:07:26'),
(25, 23, 7, NULL, 'Test Case from admin', 'حالة الاختبار من المشرف', 'Test Case Description from admin', 'اختبار الحالة الوصف من المشرف', 'Bilaspur', NULL, 'India', NULL, 'Himachal', 'Esferasoft Mohali', 23312.00, 'ASDQW  121234', 'public/case-document/hSj7VhaaZuQH1DDNro1SEuSK5b9uRADVjfTrAWdH.jpg', 'Approved', 0.00, '2021-11-30', NULL, '2021-07-26 10:12:23', '2021-08-03 11:06:51'),
(26, 23, 7, '1976', 'Test  from admin', 'حالة الاختبار من المشرف', 'Test  Description from admin', 'اختبار الحالة الوصف من المشرف', 'Bilaspur', NULL, 'India', NULL, 'Himachal', 'Esferasoft Mohali', 233122.00, 'ASDQW  1212342', 'public/case-document/F2D78ZdKOaoS0N28oxssFY7lS3cH35EikT07aIGP.png', 'Approved', 16749.00, '2021-11-29', NULL, '2021-07-26 10:13:17', '2021-08-05 08:57:52'),
(27, 29, 8, '9123', 'SSS', 'ggg', 'SSSSS', 'Ssss', 'Mohali', NULL, 'India', NULL, 'Himachal', 'Esferasoft Mohali', 1500000.00, 'ysywywywy', 'public/case-document/etPvwY2vjRPrfNqlkN5P4GHiryk5PtcBw0QEKnu8.jpg', 'Approved', 0.00, '2021-07-28', NULL, '2021-07-26 11:13:37', '2021-07-30 12:38:45'),
(28, 29, 10, '9176', 'vvv', 'vvv', 'bbnkjhfcg', 'yutgjiy', 'Abhoar', NULL, 'India', NULL, 'Himachal', 'Chandigarh 32 GMCH', 5000.00, '346789', 'public/case-document/sphn1RZ4b7ZCJyC8GRXtizKg0HHP32TreMDjlnY8.jpg', 'Approved', 0.00, '2021-09-29', NULL, '2021-07-29 12:50:15', '2021-08-03 11:06:34'),
(29, 29, 6, '1428', 'CNN’s', 'mvmvmg', 'Hdhdhd', 'Hdhdhd', 'Bilaspur', NULL, 'India', NULL, NULL, 'Mohali', 22222222.00, 'hdhdhd', 'public/case-document/oU2MsUmsq9v0eX1S7KcD4uGCVErLwh9nbTDK0oBL.jpg', 'Approved', 0.00, NULL, NULL, '2021-07-30 14:10:13', '2021-08-04 10:54:47'),
(30, 29, 6, '6109', 'test notification', 'bnjk', 'fghjk', 'ryii', 'Moga', NULL, 'India', NULL, NULL, '32jjg', 25000.00, '23457890', 'public/case-document/LlqZeWembwwAGZ48Ix27xU2X2y8H5kXaD00G8Djx.jpg', 'Completed', 49878.00, NULL, NULL, '2021-07-30 14:44:03', '2021-08-03 10:26:20'),
(31, 10, 6, '8700', 'I’ll', 'I’ll', 'I’ll', 'I’ll', 'Bilaspur', NULL, 'India', NULL, NULL, 'mohali', 123456.00, 'hyjghj', 'public/case-document/GOXCBomXmUmCw1yDjpI4KiXDcCh7PNCEU0Mf5wg7.jpg', 'Approved', 0.00, '2021-08-03', NULL, '2021-08-03 08:38:51', '2021-08-04 11:00:28'),
(32, 39, 6, '6005', 'Treatment', 'غغعهخحجوىرىوزنلان', 'ghhjkkkj', 'لتمخاللننت', 'Ambala', NULL, 'India', NULL, 'Himachal', 'Ambala', 50040.00, '467898', 'public/case-document/Aajpe9iZCNrEirwU6uIgoDXUEWmjRSCROXyJQ0hi.jpg', 'Completed', 50040.00, '2021-08-20', NULL, '2021-08-03 09:39:25', '2021-08-03 11:13:56'),
(33, 39, 7, '8389', 'stones surgery', 'ssddd', 'ghjkkk', 'cghjkkk', 'Moga', NULL, 'India', NULL, NULL, 'hhhhh', 750000.00, '45678', 'public/case-document/wBWVXRFz3FH0evNwwlNidvgoh7uHWbxVdrFd4o45.jpg', 'Completed', 900000.00, '2021-08-27', NULL, '2021-08-03 11:31:12', '2021-08-04 09:37:19'),
(34, 39, 6, '2537', 'Medicine test', 'medicine', 'My friend need medicine', 'Medicine', 'Abhoar', NULL, 'India', NULL, NULL, 'new sector', 250.00, '234567899887', 'public/case-document/SZfSpzIbU9OJZqapJQ6RTklEyrDNy2BiR82ykY2F.jpg', 'Completed', 250.00, '2021-12-07', NULL, '2021-08-04 10:07:51', '2021-08-04 10:21:40'),
(35, 39, 7, '5842', 'surgery test', 'surgery', 'surgery', 'surgery', 'Mohali', NULL, 'India', NULL, NULL, 'Dashmesh Nagar, Kharar, Punjab 140301, India', 2500.00, '45789', 'public/case-document/Va9Gls7ZyFGp6R6chDNormWfmSZFQG11zoNxejuy.jpg', 'Approved', 250.00, '2021-08-20', NULL, '2021-08-04 11:57:59', '2021-08-04 13:20:49'),
(36, 39, 6, '3642', 'Medicine 💊💊💊💊💊', 'medicine', 'medicine💊', 'medicine', 'Banga', NULL, 'Bangladesh', NULL, NULL, 'vkoih_', 5000.00, '3567890965', 'public/case-document/VWIQlCDmKZIRktxXe1EDuRtJCgOZZw2t8IFByslZ.jpg', 'Approved', 0.00, '2021-08-12', NULL, '2021-08-04 12:05:58', '2021-08-04 12:10:23'),
(37, 39, 7, '5223', 'surgery test data', 'قفغهخجججحححح', 'surgery test data', 'قفغهخجججحححح', 'Bahriaaa', NULL, 'Bangladesh', NULL, 'Himachal', 'Dashmesh Nagar, Kharar, Punjab 140301, India', 2525.00, '56789875436', 'public/case-document/n7PtVX8zUxgga4OtEZkR3dFXYfuFfgRqu4Qr1XS7.jpg', 'Approved', 0.00, '2021-08-19', NULL, '2021-08-04 13:17:20', '2021-08-06 09:26:53'),
(38, 25, 10, '3190', 'Assad', 'asdasdasdasd', 'Asdasdasdaasdasd', 'Adsasdasdasd', 'Bilaspur', NULL, 'India', NULL, NULL, 'Esferasoft, Mohali', 1223456.00, '123123123123', 'public/case-document/GNPQHqbVVuvGM5W4yAvecY2JJtU7CHgup96uv5x4.jpg', 'Approved', 0.00, '2021-08-31', NULL, '2021-08-06 10:28:49', '2021-08-06 10:43:18');

-- --------------------------------------------------------

--
-- Table structure for table `matter_attachments`
--

CREATE TABLE `matter_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matter_attachments`
--

INSERT INTO `matter_attachments` (`id`, `matter_id`, `attachment`, `created_at`, `updated_at`) VALUES
(12, 7, 'public/case-document/QDdKHySEA5peVu3rB57PhDtynhvAVYqgp9n0tnJ5.jpg', '2021-07-01 05:46:39', '2021-07-01 05:46:39'),
(13, 7, 'public/case-document/v4tstcCpRLxQ4mb2h9KESrGu81lsGEI63bInrkem.jpg', '2021-07-01 05:46:39', '2021-07-01 05:46:39'),
(14, 8, 'public/case-document/QPO9p5PJUVsqWcOfWxb8EdPkYPAcSrjWJJKXTvrS.jpg', '2021-07-01 10:23:14', '2021-07-01 10:23:14'),
(15, 9, 'public/case-document/PRKIyxXgfkeN13pH7DzGTTp3GajgIWd4uNKgukRS.jpg', '2021-07-01 10:33:19', '2021-07-01 10:33:19'),
(16, 10, 'public/case-document/KvKxwkhk9S0czzM62SlmbfLTUZeN6ycX46D1yXiZ.jpg', '2021-07-12 11:03:55', '2021-07-12 11:03:55'),
(17, 10, 'public/case-document/CQKgVOrkECp17qvjoi7ffIoiU2Z6QOt9VrjpawIe.png', '2021-07-12 11:03:55', '2021-07-12 11:03:55'),
(18, 10, 'public/case-document/5hFR50IzwplFiRViD8XYivDrcJJAEbDQ7yOGweeI.jpg', '2021-07-12 11:03:55', '2021-07-12 11:03:55'),
(20, 12, 'public/case-document/T8Pu731xWEiioSKBws6Rs7gdGp3IE2GH9c1wllqQ.jpg', '2021-07-20 10:52:03', '2021-07-20 10:52:03'),
(21, 13, 'public/case-document/tF3YxVD46OiSJMmddNeCj0S9zqNDfmvhER6IQXfi.jpg', '2021-07-21 06:54:42', '2021-07-21 06:54:42'),
(22, 14, 'public/case-document/lcsw7n332l1DQf4Wz883kxLfyEk9CqtVjwJIrezH.jpg', '2021-07-21 09:49:16', '2021-07-21 09:49:16'),
(23, 15, 'public/case-document/MXB4wJ07lfV9bV5jCUyJ06yvlqPKH2coXS53GTek.jpg', '2021-07-21 12:02:33', '2021-07-21 12:02:33'),
(24, 15, 'public/case-document/getBsht2ySb43v47M6lBR5oIhpruvofyYK2UCmzh.png', '2021-07-21 12:02:33', '2021-07-21 12:02:33'),
(25, 16, 'public/case-document/jLLHSPZJspnG8jkRMRXCKRgqRuYjCHdCR3jwpRVz.jpg', '2021-07-21 12:03:40', '2021-07-21 12:03:40'),
(26, 18, 'public/case-document/bq4jaH3SEHzTCSYBRc2xq3Dpwnkh5ulw4HgF1FSq.jpg', '2021-07-22 05:50:40', '2021-07-22 05:50:40'),
(27, 18, 'public/case-document/Uc3itiT6duQBaUfzh6PnUIuH5XkPuHSKwR9BAW62.jpg', '2021-07-22 05:50:40', '2021-07-22 05:50:40'),
(28, 20, 'public/case-document/o9ExLPEY9VSp3tmPQ9GPLSkWcsSyCzGtsgSMOxmz.jpg', '2021-07-23 06:10:07', '2021-07-23 06:10:07'),
(29, 21, 'public/case-document/NoC5Gy6GKsvDhO996sizDgri2Ccm36HYTa60R436.jpg', '2021-07-23 12:12:28', '2021-07-23 12:12:28'),
(30, 23, 'public/case-document/pxwmdiyX1ZCXcnMahO4qrE8qEcVDEanPcyd4ewbo.jpg', '2021-07-23 21:48:45', '2021-07-23 21:48:45'),
(31, 23, 'public/case-document/tktH1n2lH9KNCKAPGbKE6pGlsyFnCXkwd5aX4aS3.jpg', '2021-07-23 21:48:45', '2021-07-23 21:48:45'),
(32, 23, 'public/case-document/s3tU1MHxRlkDcuCU29LqSPDr6IJHMLJapQJCYbUn.jpg', '2021-07-23 21:48:45', '2021-07-23 21:48:45'),
(33, 23, 'public/case-document/erP7I7xdP1Z693PmA8fEi9bMPhycXDO1Pukhbmyt.jpg', '2021-07-23 21:48:45', '2021-07-23 21:48:45'),
(34, 26, 'public/case-document/MZ0CdCOMu8HLMexgnWW1vxmM8haW3ONJvSMfL6xP.png', '2021-07-26 10:13:17', '2021-07-27 05:14:14'),
(35, 26, 'public/case-document/ix10J6uQO3hCBYMh6DtysAtYCiiiZGGtE8I7kwOt.jpg', '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(36, 26, 'public/case-document/NcnEUlqEvj04kFuKXv4cQ5LKTAhJw6E79BZuVazv.png', '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(37, 26, 'public/case-document/MoZmFFOHZavRjT4oVXnql26fL3s1BlhQ2uValJkG.png', '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(38, 26, 'public/case-document/Fg46G9OdmZkzX6Jv7HRoPGp8lpNJkHkumpNijy8k.png', '2021-07-26 10:13:17', '2021-07-27 05:12:49'),
(39, 27, 'public/case-document/gB3J50266E3P0LU9YtJcCkPRgKmQ6FvkGs7DWnKC.png', '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(40, 27, 'public/case-document/XKUldJiNwGym9slXifIk0xBo9ggSxuBHjixYTJ9Y.jpg', '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(41, 28, 'public/case-document/khqB62MRWjPvFbGnd9r2CUj3M77IbM0xbPDaSOQx.jpg', '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(42, 28, 'public/case-document/PWfmbNlfPCbyI6m9ILSyVT4ttWcbeXf8prMbLaJs.png', '2021-07-30 03:56:52', '2021-07-30 03:56:52'),
(43, 27, 'public/case-document/UjzvG4xv8Q91P4ATXjR7SSeZV1CfWV8WtgtUSaYO.jpg', '2021-07-30 12:39:03', '2021-07-30 12:39:03'),
(44, 30, 'public/case-document/jySajeTepbkzwfsriSMfVEGEFTE8o5Euzop9QoDu.jpg', '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(45, 32, 'public/case-document/uIOICoMnwAgT8UxsPAdF5NQxDp4d82Q4B0O08BWw.jpg', '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(46, 33, 'public/case-document/qBq6I2IVVZBPQ9LRFsIqI6LTywKsBmfc1QZxAboG.jpg', '2021-08-03 11:31:12', '2021-08-03 11:31:12'),
(47, 35, 'public/case-document/lz5RD80LbdE53O8xIVpphFzx68NGdgBfWc6W3ZDO.jpg', '2021-08-04 11:57:59', '2021-08-04 11:57:59'),
(48, 36, 'public/case-document/SGd19CTK8zzZISowLPuAZwEP2NULTg1j0qdIThKM.jpg', '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(49, 37, 'public/case-document/zxpbFEIFnCYbB7JKPZ3RHjY8lqX6wNkAYrIsHjoc.jpg', '2021-08-04 13:17:20', '2021-08-06 09:26:53');

-- --------------------------------------------------------

--
-- Table structure for table `matter_contributors`
--

CREATE TABLE `matter_contributors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `amount` double(8,2) NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mode` enum('Cash','Online') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matter_contributors`
--

INSERT INTO `matter_contributors` (`id`, `user_id`, `matter_id`, `status`, `amount`, `transaction_id`, `mode`, `transaction_image`, `created_at`, `updated_at`) VALUES
(7, 20, 12, 0, 25.00, '46777', 'Cash', 'public/transaction/1uNvfviofAdmo8L16s7B6l7DFQv07fDHfxwNqf1l.jpg', '2021-07-20 10:54:18', '2021-07-20 10:54:18'),
(8, 5, 13, 1, 100.00, 'dfg4566', 'Cash', 'public/transaction/E8aMNHAbgc0TqX4HoRHN2ECnW5L0BL2qBhFcvCtO.jpg', '2021-07-21 07:12:46', '2021-07-22 09:19:53'),
(9, 21, 8, 1, 5.00, '123456789', 'Cash', 'public/transaction/IRID1zAaNw6bbEq6rrotvewMZdfZonoxAfJsYsXg.jpg', '2021-07-21 09:15:35', '2021-07-22 04:17:08'),
(10, 21, 14, 0, 20000.00, '122356788', 'Cash', 'public/transaction/BYv0ffasOKALVD1xwoCdhPxNXoljt6mkBr9UDTJ1.jpg', '2021-07-21 09:52:32', '2021-07-21 09:52:32'),
(11, 22, 16, 1, 200.00, '466778', 'Cash', 'public/transaction/qPgh41jiMcMknwcf2J8AwJZODQrxa9P54ZTqXZqa.jpg', '2021-07-21 12:14:56', '2021-07-22 04:23:40'),
(12, 5, 14, 1, 100.00, 'gdhdhhdf', 'Cash', 'public/transaction/7WqD67nAidU9EoWkCthOs6PM7qqHqxj6ezfvhlak.jpg', '2021-07-23 09:20:22', '2021-07-26 12:30:28'),
(13, 5, 18, 0, 200.00, '2234324324', 'Cash', 'public/transaction/Pw5KAOGmxju463Sb45cHF8QPu73agikOHRestCmb.jpg', '2021-07-23 12:34:38', '2021-07-23 12:34:38'),
(14, 5, 18, 0, 250.00, '123123123', 'Cash', 'public/transaction/KlpfHLplWF0GqPktvE2AGkiHzyc7ng6mUY2GXmqN.jpg', '2021-07-23 12:39:45', '2021-07-23 12:39:45'),
(15, 23, 23, 1, 12000.00, '11111', 'Cash', 'public/transaction/tANxPhTfT3CP7PltM3mC6oPAhuNqbm9qp3XMqkfR.jpg', '2021-07-23 21:54:37', '2021-07-23 21:55:15'),
(16, 5, 21, 1, 5.00, '1223', 'Cash', 'public/transaction/OtL63xYO5JUpcJLGTaFCtowZu5ZMX9jnDgAWpvmM.jpg', '2021-07-25 05:08:35', '2021-08-03 06:43:01'),
(17, 5, 21, 1, 25.00, '1234445', 'Cash', 'public/transaction/wcI4elM6m9mMiwyoYNgcAcrlukj9TFGOXNaxeBG9.jpg', '2021-07-25 05:09:52', '2021-07-30 19:00:04'),
(20, 20, 7, 1, 20.00, 'TRAN 452387', 'Cash', 'public/transaction/YaF0Xtx4C9ryr1oCB6ycyRKZSW9CTaOetcg6IvJI.png', '2021-07-26 06:36:00', '2021-07-26 12:30:34'),
(21, 11, 26, 1, 2000.00, '123334444', 'Cash', 'public/transaction/wQS7Sgakna3vEUu3AN6Gy9ysibhWg0kQkPZUOXUE.jpg', '2021-07-26 10:54:30', '2021-07-28 12:37:01'),
(22, 11, 14, 1, 1000.00, '12333455688', 'Cash', 'public/transaction/DTgUEnoJ4jmZF0NAcDq08TJhKw99N37prL4BPV64.jpg', '2021-07-26 11:04:18', '2021-07-26 11:04:56'),
(23, 5, 26, 0, 500.00, 'test', 'Cash', 'public/transaction/d6Epnq41GyWLqMGWmOtWqLkzT2giiM4WXYjJz3Tl.jpg', '2021-07-27 04:35:57', '2021-07-27 04:35:57'),
(24, 5, 26, 0, 500.00, 'test', 'Cash', 'public/transaction/iyp2I1gNcRJSU8h1Btadw7SHcNGr6xilSQysmBu4.jpg', '2021-07-27 05:05:41', '2021-07-27 05:05:41'),
(25, 11, 8, 1, 5.00, '123456789', 'Cash', 'public/transaction/IRID1zAaNw6bbEq6rrotvewMZdfZonoxAfJsYsXg.jpg', '2021-07-21 09:15:35', '2021-07-22 04:17:08'),
(26, 5, 22, 0, 100.00, 'urhrjkfjt', 'Cash', 'public/transaction/8wwzwTI54YBdUeHTlbvTurXbHLdOpoq1vu8xEyZ4.jpg', '2021-07-27 11:44:07', '2021-07-27 11:44:07'),
(27, 5, 23, 0, 111.00, 'hhh', 'Cash', 'public/transaction/tMctuzwc6ebWrfQWkCgWi6u7lKzOMfgCOS9aFv8B.jpg', '2021-07-27 11:55:34', '2021-07-27 11:55:34'),
(28, 5, 23, 0, 124.00, 'hdhdhd', 'Cash', 'public/transaction/oLuQgJkpIJAfHez01qnoNw9UR661vg0LLk2W9kNT.jpg', '2021-07-27 12:08:26', '2021-07-27 12:08:26'),
(29, 5, 23, 0, 1234.00, 'dfsdfsdgf', 'Cash', 'public/transaction/PSi9IDLDQuXn6XGLOEbWkvZy4VRYnCe2QfcXQgCb.jpg', '2021-07-27 12:19:35', '2021-07-27 12:19:35'),
(30, 5, 23, 0, 1234.00, 'dfsdfsdgf', 'Cash', 'public/transaction/GFqxmuGMPdNWeC3UH9Z0NXOD5K50FekeqPYVfXiA.jpg', '2021-07-27 12:20:31', '2021-07-27 12:20:31'),
(31, 5, 23, 0, 121.00, 'dfgdfgd', 'Cash', 'public/transaction/yGaEJOgdHEdTxen86UCDishRbY2cKjmR153YVwV0.jpg', '2021-07-27 12:22:15', '2021-07-27 12:22:15'),
(32, 5, 23, 0, 232.00, 'dfgdfgd', 'Cash', 'public/transaction/NjYMPVmdBS1puTzNzeAMTQ4vYExbTuOYs1H9SU9I.jpg', '2021-07-27 12:23:37', '2021-07-27 12:23:37'),
(33, 5, 23, 0, 232.00, 'dfgdfgd', 'Cash', 'public/transaction/woXPRajQn4eBY7EJdrzif1UnGHwNnRscB6lxZYOU.jpg', '2021-07-27 12:24:21', '2021-07-27 12:24:21'),
(34, 5, 23, 0, 333.00, 'dfgdfgd', 'Cash', 'public/transaction/RxYqBn67oUv2OW07CBP9dDnOyS6qDAbDKeJi6S1X.jpg', '2021-07-27 12:27:15', '2021-07-27 12:27:15'),
(35, 11, 26, 0, 200.00, 'dryuioo', 'Cash', 'public/transaction/vKOg9QFwYHpPVBX3MT5DPSlLUMMbfltb3jJu5bzk.jpg', '2021-07-27 13:55:16', '2021-07-27 13:55:16'),
(36, 5, 20, 0, 321.00, 'jdjjfjv', 'Cash', 'public/transaction/NCncGWg8XOCizpYaByzpzAoH9eWdWnkTBfGu7C2o.jpg', '2021-07-28 06:11:41', '2021-07-28 06:11:41'),
(37, 5, 23, 0, 321.00, 'dfh', 'Cash', 'public/transaction/S4816hmURX6YxC6Hi2rMGlmVOEiiArPW0VCJOj08.jpg', '2021-07-28 09:29:17', '2021-07-28 09:29:17'),
(38, 5, 23, 0, 321.00, 'vvjko', 'Cash', 'public/transaction/flt89ZOpABmXUmAzYDvKzKGQ6MKbPMdDm8HhsOsy.jpg', '2021-07-28 09:55:52', '2021-07-28 09:55:52'),
(39, 11, 21, 1, 2000.00, 'fgghhh', 'Cash', 'public/transaction/kMKwAg3fW4ECpjUeoMUaMzZEm87TOX6ujhA03RZo.jpg', '2021-07-28 12:13:14', '2021-07-28 12:31:02'),
(40, 11, 21, 0, 222.00, '5667889', 'Cash', 'public/transaction/yZfkM3cQrmmvq1ovit2zyPnYUOzllKO0rVQYPlYn.png', '2021-07-28 12:28:27', '2021-07-28 12:28:27'),
(41, 11, 21, 0, 50.00, 'yyyy', 'Cash', 'public/transaction/H4wZlK47ZCN8QC9DVlhJUivfpeBYgBTwFIw3dra8.png', '2021-07-28 12:29:13', '2021-08-03 10:48:55'),
(42, 11, 20, 1, 2000.00, '5565666', 'Cash', 'public/transaction/347ofVHzRiACYseIVEkeIULyNq7bJCTRwzCpm7vg.jpg', '2021-07-28 12:30:32', '2021-07-28 12:34:46'),
(43, 11, 26, 0, 2000.00, '6drtyuu', 'Cash', 'public/transaction/UzKq9SPkm5MRP6V8vs4xTKJEev3TtmDLNbQ6HnBE.jpg', '2021-07-28 12:33:54', '2021-07-28 12:33:54'),
(44, 11, 26, 1, 12749.00, '456788888', 'Cash', 'public/transaction/GqBjdyXw1IdzaJwLQ7SOGD3p9xK62XJ7dxk2JasT.jpg', '2021-07-28 12:36:27', '2021-08-05 08:57:52'),
(45, 11, 21, 1, 12000.00, 'dghjk', 'Cash', 'public/transaction/ZH9Fa3y0zv3pIMfNqU34pA8rLgAgPDTzOadx6ZCr.png', '2021-07-28 12:46:13', '2021-07-28 12:48:18'),
(46, 5, 27, 0, 122.00, '1dfgdfg', 'Cash', 'public/transaction/3z8nV9TEPNCQGOB4fECtGGOLrQvZddMAJElKVEQQ.jpg', '2021-07-30 07:13:08', '2021-07-30 07:13:08'),
(47, 11, 26, 1, 500.00, '1234566745667', 'Cash', 'public/transaction/MnEsKYhVoKho0seJ0AgmWwy050qX9qKFKxf5u6xb.jpg', '2021-07-30 13:54:42', '2021-08-03 10:49:40'),
(48, 11, 26, 1, 500.00, '1234566745667', 'Cash', 'public/transaction/0NjiL8fhxdLWOH8lgGUE9p76dzbeUnF8QX6fBXud.jpg', '2021-07-30 14:06:46', '2021-08-03 10:53:31'),
(49, 11, 14, 1, 2500.00, '12334566', 'Cash', 'public/transaction/6xINMfITgfBIValDaEhstSrfpD7UJXE63E2YYj6l.png', '2021-07-30 14:20:34', '2021-07-30 14:21:57'),
(50, 35, 30, 1, 122.00, 'sddfsdf', 'Cash', 'public/transaction/B4Ex2mmsVrzI748GOPtthrbN0MvuCgcVFKWrFwUs.jpg', '2021-08-02 09:19:59', '2021-08-02 11:50:08'),
(51, 11, 32, 1, 50000.00, '345677888', 'Cash', 'public/transaction/RQQgqNZiUXe1XYzMgQTlHydaybpDnx7WUwFVHXty.jpg', '2021-08-03 09:44:54', '2021-08-03 09:45:25'),
(52, 11, 32, 1, 20.00, '356788', 'Cash', 'public/transaction/fdhuUhSbvwE3absKU7HKI3mT41MqvrVADsTz4md6.jpg', '2021-08-03 10:02:15', '2021-08-03 10:03:22'),
(53, 11, 30, 1, 24878.00, '45678', 'Cash', 'public/transaction/Io6gpetaXg983o4XNcyIU5eRYYuLpzjuZDgylSQN.jpg', '2021-08-03 10:25:00', '2021-08-03 10:26:20'),
(54, 11, 33, 1, 50000.00, '45688986', 'Cash', 'public/transaction/uskp3eBccPFo2jEdAFgF79Mwsk9b160cLZbM7wEq.jpg', '2021-08-03 12:17:21', '2021-08-03 12:22:53'),
(55, 5, 33, 1, 250000.00, '3567', 'Cash', 'public/transaction/PnmWIxD5fcU7gkfMrvCHwc1Cua9qnTuBd1OUY3VH.jpg', '2021-08-03 13:03:15', '2021-08-03 13:06:03'),
(56, 5, 23, 1, 121.00, 'wddsdfs', 'Cash', 'public/transaction/TxAbMfeyIX1Pw0Z83hR9wcWnOYMP0ycWXkiCiuA6.jpg', '2021-08-04 06:45:10', '2021-08-04 12:15:07'),
(57, 5, 23, 1, 355.00, 'dfgdfg', 'Cash', 'public/transaction/TjFN7e1tfO9INARTVKO9BHSKGz8TIxuPf7wcPJLu.jpg', '2021-08-04 06:50:42', '2021-08-04 12:15:02'),
(58, 5, 23, 1, 2333.00, 'dsfsdf', 'Cash', 'public/transaction/xXgGXrjHhj5BjrO61cb31MSPbhIwsgiWfPYheGuS.jpg', '2021-08-04 07:00:10', '2021-08-04 12:14:57'),
(59, 5, 23, 1, 1212.00, 'assist', 'Cash', 'public/transaction/yNcttUG86LNOmJwTJRB2CS2WWq3lmQnWx8AcLkJ8.jpg', '2021-08-04 07:01:45', '2021-08-04 12:14:52'),
(60, 5, 23, 1, 432.00, 'dfgdfgd', 'Cash', 'public/transaction/Kf4lgjW591vj6lKp6slpDhobSyyRF41EtnAyyKXy.jpg', '2021-08-04 07:05:18', '2021-08-04 12:01:26'),
(61, 5, 23, 1, 431.00, 'dfgdfgd', 'Cash', 'public/transaction/RIw2PxGqDt7PAeD4D266A1dON6Y1G9bvroRXbuvY.jpg', '2021-08-04 07:06:18', '2021-08-04 12:01:23'),
(62, 5, 23, 1, 87.00, 'dfgdfg', 'Cash', 'public/transaction/XzpTuCpLAScOuM9OAL51wFVx37yInBi0Z9bccm4M.jpg', '2021-08-04 07:08:20', '2021-08-04 12:01:18'),
(63, 11, 33, 1, 150000.00, '556788', 'Cash', 'public/transaction/BnqEoBs1SoTCRtm8Jp99ty4XUEVUrlsPBhzuYeSh.jpg', '2021-08-04 09:36:09', '2021-08-04 09:37:19'),
(64, 11, 34, 1, 200.00, '66778', 'Cash', 'public/transaction/UUn8U1HEYYdnRB7UM3piTLmhtYXvNSB9NkPjYYSk.jpg', '2021-08-04 10:13:27', '2021-08-04 10:14:23'),
(65, 11, 34, 1, 50.00, '678900', 'Cash', 'public/transaction/4BdkVLpRHpZPc3pePbzM4B4hvi4bSVu19bBuJ96x.jpg', '2021-08-04 10:19:20', '2021-08-04 10:21:40'),
(66, 11, 35, 1, 250.00, '56789', 'Cash', 'public/transaction/ek0haTUpVBt5NEadlgK7hkphVeecpahuMh1lv1Gy.jpg', '2021-08-04 12:20:04', '2021-08-04 13:20:49'),
(67, 44, 36, 0, 10.00, 'gj246788hjj', 'Cash', 'public/transaction/mt4Mq30OpIVYVKlT3MG8YQNGdERpIzue1k2xSm1c.jpg', '2021-08-05 12:52:01', '2021-08-05 12:52:01'),
(68, 44, 36, 2, 20.00, 'bshhn1467ghjj', 'Cash', 'public/transaction/krA8bLUr15jC0OHRzj1LCzvZmYwoDqcB0C9D7yUR.jpg', '2021-08-05 12:52:54', '2021-08-06 04:56:14'),
(69, 44, 8, 0, 2.00, 'ghhg', 'Cash', 'public/transaction/MCRTAvJmYTqlQ2g49Ke2QOHSbgcXbJ5261gndgbD.png', '2021-08-05 12:57:58', '2021-08-05 12:57:58'),
(70, 5, 37, 0, 258.00, '55677899', 'Cash', 'public/transaction/cGbPA133Yj89oCPAQs2x4XZ1gebtEee5XjRootiX.jpg', '2021-08-06 13:10:25', '2021-08-06 13:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `matter_updates`
--

CREATE TABLE `matter_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matter_updates`
--

INSERT INTO `matter_updates` (`id`, `provider_id`, `categorie_id`, `matter_id`, `description`, `description_ar`, `created_at`, `updated_at`) VALUES
(8, 22, 7, 7, 'Checking testing case in English testing', 'Checking testing case in English testing', '2021-07-01 10:02:48', '2021-07-01 10:02:48'),
(9, 22, 7, 7, 'Checking testing case in English', 'Checking testing case in English', '2021-07-01 10:03:11', '2021-07-01 10:03:11'),
(10, 22, 6, 8, 'Testing English', 'Testing English', '2021-07-01 10:25:58', '2021-07-01 10:25:58'),
(11, 22, 6, 8, 'Testing English', 'Testing English', '2021-07-01 10:27:13', '2021-07-01 10:27:13'),
(12, 22, 6, 8, 'Testing English 25', 'Testing English 25', '2021-07-01 10:27:38', '2021-07-01 10:27:38'),
(13, 22, 6, 9, 'description English', 'description English', '2021-07-01 10:33:47', '2021-07-01 10:33:47'),
(14, 25, 7, 10, 'ciciicx', 'ciciicx', '2021-07-12 11:08:34', '2021-07-12 11:08:34'),
(15, 25, 7, 10, 'tttttt', 'tttttt', '2021-07-12 11:28:12', '2021-07-12 11:28:12'),
(16, 27, 6, 12, 'fddfgfgf', 'fddfgfgf', '2021-07-20 10:52:29', '2021-07-20 10:52:29'),
(17, 27, 6, 12, 'fddfgfgf', 'fddfgfgf', '2021-07-20 10:54:23', '2021-07-20 10:54:23'),
(18, 27, 6, 12, 'fddfgffgf', 'fddfgffgf', '2021-07-20 10:54:39', '2021-07-20 10:54:39'),
(19, 27, 6, 12, 'fddfgfgfdf', 'fddfgfgfdf', '2021-07-20 10:54:58', '2021-07-20 10:54:58'),
(20, 27, 6, 12, 'fddfgfg', 'fddfgfg', '2021-07-20 10:56:17', '2021-07-20 10:56:17'),
(21, 27, 6, 12, NULL, 'Test Test Test', '2021-07-20 10:57:47', '2021-07-20 10:57:47'),
(22, 27, 6, 12, NULL, 'Test Test Test', '2021-07-20 11:03:04', '2021-07-20 11:03:04'),
(23, 28, 6, 13, 'hfjrjfjfjf fjfjfdjrjr', 'hfjrjfjfjf fjfjfdjrjr', '2021-07-21 06:55:31', '2021-07-21 06:55:31'),
(24, 28, 6, 13, 'hfjrjfjfjf fjfjfjfj', 'hfjrjfjfjf fjfjfjfj', '2021-07-21 06:57:06', '2021-07-21 06:57:06'),
(25, 25, 6, 18, 'bdnjfjjf', 'bdnjfjjf', '2021-07-22 06:50:01', '2021-07-22 06:50:01'),
(26, 27, 6, 12, NULL, 'Test Test Test', '2021-07-22 06:57:52', '2021-07-22 06:57:52'),
(27, 27, 6, 12, NULL, 'Test Test Test', '2021-07-22 07:00:54', '2021-07-22 07:00:54'),
(28, 10, 6, 19, 'Describe the update in Englishhdhfjfjdjrhhd', 'Describe the update in Arabichdhhdhf', '2021-07-22 12:54:31', '2021-07-22 12:54:31'),
(29, 25, 10, 20, 'updated is for testing purpose only.', 'updated is for testing purpose only.', '2021-07-23 06:18:13', '2021-07-23 06:18:13'),
(32, 22, 6, 8, 'Sahil Testing Admin with attachment', 'اختبار التحديث مع مرفق من المسؤول', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(33, 27, 6, 12, NULL, 'Test Test Test', '2021-07-26 05:13:38', '2021-07-26 05:13:38'),
(34, 27, 6, 12, NULL, 'Test Test Test', '2021-07-26 05:14:12', '2021-07-26 05:14:12'),
(35, 27, 6, 12, NULL, 'Test Test Test', '2021-07-26 05:41:35', '2021-07-26 05:41:35'),
(36, 27, 6, 12, NULL, 'Test Test Test', '2021-07-26 05:43:03', '2021-07-26 05:43:03'),
(37, 25, 10, 20, 'This is for testing purpose only. for this only', 'This is for testing purpose only. for this only', '2021-07-28 06:13:04', '2021-07-28 06:13:04'),
(38, 29, 10, 28, 'bbnkjhfcg', 'bbnkjhfcg', '2021-07-29 13:04:22', '2021-07-29 13:04:22'),
(39, 29, 10, 28, 'SsSsSsS', 'sSsS', '2021-07-29 13:13:29', '2021-07-29 13:13:29'),
(40, 29, 10, 28, 'yhggt', 'tttt', '2021-07-30 12:41:11', '2021-07-30 12:41:11'),
(41, 29, 10, 28, 'gfvnhfghfg', 'fgvhfghfghjfgnjhfghj', '2021-07-30 12:42:45', '2021-07-30 12:42:45'),
(42, 29, 10, 28, 'sasas', 'sasas', '2021-07-30 12:42:50', '2021-07-30 12:42:50'),
(43, 39, 6, 36, 'medicine💊', 'medicine💊', '2021-08-04 13:11:49', '2021-08-04 13:11:49'),
(44, 31, 6, 23, 'urgent need', 'حوجه عاجله .', '2021-08-05 09:57:23', '2021-08-05 09:57:23'),
(45, 39, 7, 37, 'Sahil Testing', 'Sahil Testing', '2021-08-06 08:56:07', '2021-08-06 08:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `matter_update_attachments`
--

CREATE TABLE `matter_update_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matter_update_id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `matter_update_attachments`
--

INSERT INTO `matter_update_attachments` (`id`, `matter_update_id`, `attachment`, `created_at`, `updated_at`) VALUES
(7, 8, 'public/case-document/n6UR50xKHADJzoBCH9YXiKF9qXqh1hfTO1dLzJEC.jpg', '2021-07-01 10:02:48', '2021-07-01 10:02:48'),
(8, 9, 'public/case-document/KoeFMSQIejaCxycOzWoDgRfpd6Mnewy1bU4YPvqO.jpg', '2021-07-01 10:03:11', '2021-07-01 10:03:11'),
(9, 10, 'public/case-document/QJv3UhY4xU5MR1etKQMHBbDjzFtQvk3yMNBfLEDj.jpg', '2021-07-01 10:25:58', '2021-07-01 10:25:58'),
(10, 11, 'public/case-document/cymNCtaLRjlxRqIYQU4XD8AMZbLPsrQbHKE7jFQr.jpg', '2021-07-01 10:27:13', '2021-07-01 10:27:13'),
(11, 12, 'public/case-document/w0riIrMGvuN0bLrpeOaUxepVjNlQq9x8mnUkeRgz.jpg', '2021-07-01 10:27:38', '2021-07-01 10:27:38'),
(12, 13, 'public/case-document/Dl60zdu2rLX138zrGMaUR9bE31AsDCbnv0vZHU8X.jpg', '2021-07-01 10:33:47', '2021-07-01 10:33:47'),
(13, 14, 'public/case-document/aGS3SrLfBLznfhrDTvLZqzetgpyDAUhYsldPjTBV.jpg', '2021-07-12 11:08:34', '2021-07-12 11:08:34'),
(14, 14, 'public/case-document/3t1rkRPiK6J29fx2rTvvbehy0EWrTrT01BqFjC8q.jpg', '2021-07-12 11:08:34', '2021-07-12 11:08:34'),
(15, 15, 'public/case-document/WAyEV2hSYCMGUyCGg8NNflWBOeHYjFy8tGldFtKb.jpg', '2021-07-12 11:28:12', '2021-07-12 11:28:12'),
(16, 16, 'public/case-document/OZP9D1rnjBGMw3pjPhahhgiIs5YlRRo17dMVvxYw.jpg', '2021-07-20 10:52:29', '2021-07-20 10:52:29'),
(17, 17, 'public/case-document/US9Z30NGGqO2Tq8TAFf97H47Z6UEx4ppfBwAlj0W.jpg', '2021-07-20 10:54:23', '2021-07-20 10:54:23'),
(18, 18, 'public/case-document/AIkkTi9Rhv5ovJbdbftXQGB6Hwf0qPRlwMaEJtwi.jpg', '2021-07-20 10:54:39', '2021-07-20 10:54:39'),
(19, 19, 'public/case-document/kPhs5mVsatfJFQ3Iuju9nsasF0dNSU5IrQdo6ooo.jpg', '2021-07-20 10:54:58', '2021-07-20 10:54:58'),
(20, 20, 'public/case-document/t9SdI0g5dGyItLGDQPaplnKpntvAUpVHs6wQ8Snf.jpg', '2021-07-20 10:56:17', '2021-07-20 10:56:17'),
(21, 21, 'public/case-document/YRS9pRjWmaLn5GsdKm5YzvXL0zB1h6KztKMrsFVW.png', '2021-07-20 10:57:47', '2021-07-20 10:57:47'),
(22, 22, 'public/case-document/v8L88AULmGConmwYvGtsk7Tev54P23E3tOagESKO.png', '2021-07-20 11:03:04', '2021-07-20 11:03:04'),
(23, 23, 'public/case-document/5FDeil0PGXGYIPNmNYWp7EZTTZJbmVODCHjDUbAI.jpg', '2021-07-21 06:55:31', '2021-07-21 06:55:31'),
(24, 24, 'public/case-document/QlMArpa45dbbTXy2nzXARLuEztDCAgYH1K6Sw5Qo.jpg', '2021-07-21 06:57:06', '2021-07-21 06:57:06'),
(25, 25, 'public/case-document/mAgkSU5QHQ4mdBzQR7fzj2POMcziosPqmNziwQfV.jpg', '2021-07-22 06:50:01', '2021-07-22 06:50:01'),
(26, 26, 'public/case-document/CYb6cvGqASEjDeJzpFFKxUT7uJmB2mYKVrsVzUBK.png', '2021-07-22 06:57:52', '2021-07-22 06:57:52'),
(27, 27, 'public/case-document/1EWdt1hHGTqDDJCY5xuNl9KfoYRoDoQdK4UY9PeS.png', '2021-07-22 07:00:54', '2021-07-22 07:00:54'),
(28, 27, 'public/case-document/id2CDSkvfvl7DjTcp58G6qmXlhJwvSdJ9GkQXArc.png', '2021-07-22 07:00:54', '2021-07-22 07:00:54'),
(29, 29, 'public/case-document/MWFdr8K5QM22ngUwoPN7aOXjEDt97ShC3pkp4ROp.jpg', '2021-07-23 06:18:13', '2021-07-23 06:18:13'),
(30, 8, 'public/case-document/n6UR50xKHADJzoBCH9YXiKF9qXqh1hfTO1dLzJEC.jpg', '2021-07-01 10:02:48', '2021-07-01 10:02:48'),
(31, 32, 'public/case-document/5UYV3pikvEGQi0BNtEDvhJAwrbi384wHrY9reFp6.jpg', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(32, 32, 'public/case-document/97KhJqP8syu4MRLhovjt9nRU8zz6NueYn6aiTC8J.jpg', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(33, 32, 'public/case-document/XZCEkh5Ugs51vuo1kJExNaNsSQO2aEX86silfVXD.png', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(34, 32, 'public/case-document/KY6RpOONNeTXA8GfCLertLo3o86NGy1wFufvFNO0.png', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(35, 32, 'public/case-document/g9x2HCmxekXiMWNCdDTrE2FcneGgRmn9BeiSThOy.png', '2021-07-23 12:08:51', '2021-07-23 12:08:51'),
(36, 33, 'public/case-document/vPn8179gpMmYTx96PcWxuFT01ti7STSlKFNeN41y.png', '2021-07-26 05:13:38', '2021-07-26 05:13:38'),
(37, 33, 'public/case-document/ZvmXW90pHoDV9U1UX6jo4fWDqtFAjxldezMXAE2t.png', '2021-07-26 05:13:38', '2021-07-26 05:13:38'),
(38, 34, 'public/case-document/nxjNHj5f7QcE6dq0tBPjaYzr3dYcpG6kgF5trsfB.png', '2021-07-26 05:14:12', '2021-07-26 05:14:12'),
(39, 34, 'public/case-document/Qaq7pUk7cXTmcAmuI5SNZ2C0Mj4YjxfkkfCKXUS0.png', '2021-07-26 05:14:12', '2021-07-26 05:14:12'),
(40, 35, 'public/case-document/MTIAoPqwhTsH6UgaN4qGIa8SxKU4rkXnoyoNX1AD.png', '2021-07-26 05:41:35', '2021-07-26 05:41:35'),
(41, 35, 'public/case-document/K4OKnRmCPlNUUfR44vdca6dMCa2cfBCDTlMj7jxY.png', '2021-07-26 05:41:35', '2021-07-26 05:41:35'),
(42, 36, 'public/case-document/pPjp9ICX3735RX6hT1Jbbf40Ou5TIi9ZPpxTjIdk.png', '2021-07-26 05:43:03', '2021-07-26 05:43:03'),
(43, 36, 'public/case-document/Xe6oXriThfI16AkGf8InCLhzb4PrNoBx8bUJxHv4.png', '2021-07-26 05:43:03', '2021-07-26 05:43:03'),
(44, 37, 'public/case-document/kqTunphjAdN3oRscfEVNaE1OAxZ23uM5layoyoYR.jpg', '2021-07-28 06:13:04', '2021-07-28 06:13:04'),
(45, 38, 'public/case-document/o3FgnKUfEgy5pcpmOcEmiEIvS9DHeLMi34mpWOOA.jpg', '2021-07-29 13:04:22', '2021-07-29 13:04:22'),
(46, 39, 'public/case-document/0Xbj1oNTwam4yaavc8J0ozMxV7MoXgl8fVvtG6iD.jpg', '2021-07-29 13:13:29', '2021-07-29 13:13:29'),
(47, 40, 'public/case-document/7M8ouOvX4UGVYP5tphN6sU1qiPYThXxFlIVWA6DD.jpg', '2021-07-30 12:41:11', '2021-07-30 12:41:11'),
(48, 41, 'public/case-document/eBpiattHLLFkRwVQOYobybBpvZQ6eURp71JPeVZO.jpg', '2021-07-30 12:42:45', '2021-07-30 12:42:45'),
(49, 41, 'public/case-document/Hxjk6InAwTsMcc25jro0nboxm5zQNuOAjhBcfLfn.png', '2021-07-30 12:42:45', '2021-07-30 12:42:45'),
(50, 42, 'public/case-document/neqymIpmOhS45ZE9DgzMSxJS43APFkQhOyEfeFmq.jpg', '2021-07-30 12:42:50', '2021-07-30 12:42:50'),
(51, 43, 'public/case-document/S4457oPlgayMTtkwWBCXM2wEYovfp54lx05oj3ne.jpg', '2021-08-04 13:11:49', '2021-08-04 13:11:49'),
(52, 45, 'public/case-document/9ziiWg5zwzJZYuRCDSi4BnTHhhLwq8EjkubqXcq6.png', '2021-08-06 08:56:07', '2021-08-06 08:56:07'),
(53, 45, 'public/case-document/OrxJeH0mY1AhiT9nUet2P1L5UbOw00oV2Sdci9uP.png', '2021-08-06 08:56:07', '2021-08-06 08:56:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2021_05_11_061230_create_admins_table', 1),
(10, '2014_10_12_000000_create_users_table', 2),
(11, '2021_05_13_062602_create_categories_table', 3),
(13, '2021_05_13_094731_create_shipments_table', 4),
(14, '2021_05_17_042458_create_providers_table', 5),
(15, '2021_05_20_043127_create_account_details_table', 6),
(16, '2021_05_25_050732_create_shipment_bids_table', 7),
(18, '2021_06_02_064640_create_provider_ratings_table', 9),
(19, '2021_06_02_064604_create_content_pages_table', 10),
(20, '2021_06_15_090150_create_matters_table', 11),
(21, '2021_06_15_090157_create_matter_attachments_table', 11),
(22, '2021_06_16_115635_create_countries_table', 12),
(23, '2021_06_17_065413_create_states_table', 13),
(24, '2021_06_22_062615_create_cities_table', 14),
(25, '2021_06_28_103652_create_provider_notification_settings_table', 15),
(26, '2021_06_30_103400_create_matter_updates_table', 16),
(27, '2021_06_30_103402_create_matter_update_attachments_table', 16),
(28, '2021_06_30_114943_create_followers_table', 17),
(29, '2021_07_08_094851_create_settings_table', 18),
(30, '2021_07_12_101253_create_matter_contributors_table', 19),
(31, '2021_07_12_114920_create_bank_details_table', 20),
(32, '2021_07_15_105953_create_user_notification_settings_table', 21),
(33, '2021_07_26_044107_create_user_notifications_table', 22),
(34, '2021_07_26_055039_create_provider_notifications_table', 23),
(35, '2021_07_27_060443_create_user_views_table', 24),
(36, '2021_07_29_063602_create_email_notifications_table', 25),
(37, '2021_07_30_051830_create_push_notifications_table', 26),
(38, '2021_08_02_053648_create_bulk_messages_table', 27);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0034e7b2fd24f4cc3dea857d871a3bb4568e378c663cfac3c0225ce66338dcda3beaa4d20b383fa6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 10:47:56', '2021-07-22 10:47:56', '2022-07-22 10:47:56'),
('00f40135de0b5003e31913d8cf75201a21e9ee9f1aacdf44bcdf47c41d940bedd71afbca12504c73', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 04:46:19', '2021-07-22 04:46:19', '2022-07-22 04:46:19'),
('01e89172263b8569e51fb7ea724cdcf16de84bde4657c60eb696078a1eeadb88bce415d02379516d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:28:34', '2021-07-22 11:28:34', '2022-07-22 11:28:34'),
('028555f8295b587ebe548c3ece5733e47be30319a48b7a9efc23ea7c342abf1163c0542f40498a3f', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-25 15:31:48', '2021-07-25 15:31:48', '2022-07-25 15:31:48'),
('02e4d53c6854b8d6c8a07967d59734c6f97770f309c43971debd92ed9a0c7b13b5ad795260e117b9', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:57:15', '2021-07-09 11:57:15', '2022-07-09 11:57:15'),
('0380e57f4c0cff57d0fc6943a178e219108fbd5a2ffe574ab6868fbfff4ed77ec1d231f851a689b1', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 15:29:23', '2021-07-30 15:29:23', '2022-07-30 15:29:23'),
('03b7d90e99101e032dbc0cb75690956b08cf26934caa08b733d3f937ea38099adbe5b1b52c07a8f3', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 09:50:01', '2021-07-21 09:50:01', '2022-07-21 09:50:01'),
('041ec8f21a10ce928996226692025fb15e65f5f94b6f4177b339f82e2c3f88e39d130df05c2cb83a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 13:00:16', '2021-07-27 13:00:16', '2022-07-27 13:00:16'),
('0499f17fed74272be333dfac582426d4cb7f6b751c790fcff775e14dee72d471a286e12b03071a89', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-06 12:25:17', '2021-07-06 12:25:17', '2022-07-06 12:25:17'),
('0520b4670c44297feb768a286d04784ebb4ec2b34e81f4e7b49246b3bb6e356a2972e352758bc188', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 09:02:04', '2021-07-30 09:02:04', '2022-07-30 09:02:04'),
('05cf0bea2f3be63760d708c8139316c7715b4f3a5be80cbddf654524f27fde15d1fe5da80fc69a6a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:38:28', '2021-07-22 11:38:28', '2022-07-22 11:38:28'),
('063abe7a823e143b8d28cf6bcc5deebd19d20a4df02ea7541f9352106e9fa3579b92f9d5a79f1044', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-28 12:53:57', '2021-06-28 12:53:57', '2022-06-28 12:53:57'),
('063f0007f92361fdc91c1c901433390a8fb01f32e8dbc8ac164207e7aab51e9e5242e432a72261c7', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-25 15:30:16', '2021-07-25 15:30:16', '2022-07-25 15:30:16'),
('065058a51adf3752dfb752e84ac6e8e63e072e0c6b5d4c936f552df5af0434aa27e86f45a9919d60', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 10:14:35', '2021-06-29 10:14:35', '2022-06-29 10:14:35'),
('06beed150945cc8c6fb9247da19243436c8e545b0519c5d93b6cd17d75df79d356e5320a1e9915ab', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 11:48:27', '2021-06-29 11:48:27', '2022-06-29 11:48:27'),
('0716bfaea3d8f5f44bbe7148acd52187eb66d806599338fd8b2627a6f65f45ff60929c0172f3bb3d', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:08:15', '2021-07-28 13:08:15', '2022-07-28 13:08:15'),
('074696fefebce64fee881712e4fef2d07fab4522d27c2c41025982f9fb96b162a982e1f6fe795ead', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:13:36', '2021-07-21 06:13:36', '2022-07-21 06:13:36'),
('0812521d3bf1298225295a39e088ad42ad8dfbefab8f7fa075d3ec216cdb8d29cc25c5df8c97e87a', 12, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-17 05:06:50', '2021-05-17 05:06:50', '2022-05-17 05:06:50'),
('08487cf93f933503f342c7f9904830798ea0c383c76de6ed4f85e06a3608251f3c32c36d8aec0bb5', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 09:20:44', '2021-07-30 09:20:44', '2022-07-30 09:20:44'),
('0852e6a5a6c7cba45110b6472350a03a502ffdd52282f7d7a74118efa843535e9b0777b195a6ef39', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-28 12:46:50', '2021-06-28 12:46:50', '2022-06-28 12:46:50'),
('086c1d1781af430022a30d325a74a9e9423ee52ed658e4b1fa4a15f477b75023dad588561039ace9', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-25 06:30:22', '2021-06-25 06:30:22', '2022-06-25 06:30:22'),
('08cf3c18f84ce1abc6df431cbcbda72a9f201dd225c82872b12939771a7410b6d1a9210e432ca377', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 07:23:03', '2021-07-21 07:23:03', '2022-07-21 07:23:03'),
('0948ac372ff4aeda0edefdc32ac9b50f28d464a7349b6c2ffd11f56af372a6b8580497c83e73f396', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 10:52:35', '2021-06-29 10:52:35', '2022-06-29 10:52:35'),
('0a37d769a6e837eb6068c9d8b57ccc274be1c0e24ccfc7a03331bd714a9e8dd07c6b1fdb3a3441b5', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 12:07:51', '2021-07-23 12:07:51', '2022-07-23 12:07:51'),
('0ab0fbc27c1c59b9effd7adc0db29fb513fd1dd7658901d5b948e13b4d34b4cb4f94a53b531b065f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:10:19', '2021-07-21 06:10:19', '2022-07-21 06:10:19'),
('0b4b815fa20a542d9c516e342d0fcfded1e46c15fda7df20194ce152b77978ee28f6ac28e5a5bf76', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 11:12:21', '2021-06-29 11:12:21', '2022-06-29 11:12:21'),
('0b9bfac099e47d7a3ef489bfe53ee0de0a40c4e348e44b79ec01cb28d5fa9c68f00afb18c5756bad', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-03 09:39:16', '2021-08-03 09:39:16', '2022-08-03 09:39:16'),
('0bfa0c5eff3fc13cd6ab8db73ef782b35c11a29ac17353c8542f58fd3697ae8f516cb33cbe30445d', 30, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 12:14:21', '2021-07-21 12:14:21', '2022-07-21 12:14:21'),
('0c0b866a5d7c36129c835cddcaeec62ec44df433221b777b0a9039c9cd7b5b4e0f8597f2996257dc', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:56:40', '2021-07-19 10:56:40', '2022-07-19 10:56:40'),
('0cdef8b5a08342d7c86d73c9f4b27b55aeac00e4acde975b4efed78c277eb94115c8136dfb14d7af', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 09:56:12', '2021-07-02 09:56:12', '2022-07-02 09:56:12'),
('0cdf55d7560597e11a05e42b1f5f38e747275a14392bd22036b9e8efd8bf91a5ab4d9f254ae3c473', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-31 11:59:28', '2021-05-31 11:59:28', '2022-05-31 11:59:28'),
('0dd9c2e3abddc1623d5e1ef6c51bb9ece5e54886ebebe09004a2466acbf72d19ae350b92fd0d3059', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:56:31', '2021-07-23 06:56:31', '2022-07-23 06:56:31'),
('0e82438a79af77a0d3bf46fa8f34f36d78aa05fd06b8211e1ac7516fb525fcbaa48e7a5eafeff3c3', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 13:52:25', '2021-08-03 13:52:25', '2022-08-03 13:52:25'),
('0f5fb6feea98bed30c6237748f93fea548d74677797b4add6bf8711b570ee5cf76846c8f941e1b3c', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:20:32', '2021-07-28 13:20:32', '2022-07-28 13:20:32'),
('10279c1f1a5582cf04bd4f844124d4b7f239c1f9d5bd51ec0283ba01c7b0808baf70787bde6d7c5f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:17:16', '2021-07-02 10:17:16', '2022-07-02 10:17:16'),
('1091dc0dcec49280ee8efc33088e02aeaddbd5c51229ca7cef2cbcfed6f329c3e12dffcd62a48f6e', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-28 07:04:26', '2021-05-28 07:04:26', '2022-05-28 07:04:26'),
('10b63fabf5dbc21524ecd5d876885ab0f0699dbe87be2e7133e7111251d5f0c97fa632772529b010', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 06:42:00', '2021-07-30 06:42:00', '2022-07-30 06:42:00'),
('111140818fdab53701676b60a6961e17922867c968c59c7394f7534bb8dfaf6504a21533d6f3f8cc', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-01 12:29:34', '2021-06-01 12:29:34', '2022-06-01 12:29:34'),
('11a87d3ec2d69a4a5468c3ac5f9607958b3f1bb15bf84e0c79fc15727659580082c31a6c4d676551', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:49:02', '2021-08-04 08:49:02', '2022-08-04 08:49:02'),
('11b5c6b1228f39fcec59bc606a226dbc19b104fb1e2c25d75cb1a438cd8f3206cdc230b28ac86b13', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:36:07', '2021-08-04 08:36:07', '2022-08-04 08:36:07'),
('11de3a98769c3dd3ce8198e7fcbcd737bd8b104eacf76a9c1aed50cc91210472532b5eec1d8d6dfd', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:50:44', '2021-08-04 08:50:44', '2022-08-04 08:50:44'),
('11dfb481d650e481f0c62c141f742b59dc81cdb0ff44327bc79f652b47e852ab95e374102440dc21', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 09:47:36', '2021-07-19 09:47:36', '2022-07-19 09:47:36'),
('123301f728474d3f3101fd2fc8b9322ebc740e2f82170cdf142f4b44e86409396cd7f0a0aec58f4a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:23:34', '2021-07-22 09:23:34', '2022-07-22 09:23:34'),
('12336df716dfc32ccaf35daa2a983f8873c0e5cd30692092f839a7c83aa64d5d744c8f3942635134', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:26:36', '2021-07-28 13:26:36', '2022-07-28 13:26:36'),
('124946fdf61509d02b133bf4e6eb145acaf08e47a994150de0be9575724c85a91e2310c29648d6f5', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-30 07:27:04', '2021-06-30 07:27:04', '2022-06-30 07:27:04'),
('12f06af155f2f3846a02ec8769b84b307e96ffe78a4be9833ee77d4a9cc49a353a53ff97b71fbae6', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-14 16:57:21', '2021-06-14 16:57:21', '2022-06-14 16:57:21'),
('134ba7ddb75edf188ce3dec510dda7fc8615140308aacc7e51d1d7b637b0ba4a81624b3d7476e57b', 32, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-01 08:14:53', '2021-08-01 08:14:53', '2022-08-01 08:14:53'),
('140371f13feed67d757aa4081ea5e8d2e0c45cd821dbb200bc5f48aefaaed28f86f00d9e80f30e02', 30, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 12:00:31', '2021-07-21 12:00:31', '2022-07-21 12:00:31'),
('140b80ed3cbbf19068696220bd5f8d1d428d75998013a35b505e44bdd6cfc68058e80bf7a9a0c62a', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 11:38:41', '2021-07-27 11:38:41', '2022-07-27 11:38:41'),
('1437c51bd269e8fc7f562957a661c2e5d7781c3e40959bc1c675e5ea9f71c197887f8e1e37e63c6a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:22:22', '2021-07-09 10:22:22', '2022-07-09 10:22:22'),
('152f84f4aba54e39d09bf62ec4a79f886d21b43a20774cd3266e7f8fc711efdcd62f19ed15bf27b1', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-17 06:52:58', '2021-05-17 06:52:58', '2022-05-17 06:52:58'),
('15a8e5300bbd0a50502bfc02bb9e23b972a9ac5db6287819c9baa748fa5411d1a1059594c729cb83', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 13:38:52', '2021-07-22 13:38:52', '2022-07-22 13:38:52'),
('15aef85dd4bcbfa10e6ec1a6f54d227396ee9ca10852aa46f8984a863c5ea0965b24cc6d5d3ab983', 7, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-05-31 05:30:19', '2021-05-31 05:30:19', '2022-05-31 05:30:19'),
('16d4528160e1b0bf1d35a8a3ab6ce09136f368862ff3a14fc8cba012c6b9ce02c82060beb91d3ef3', 27, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-20 10:05:02', '2021-07-20 10:05:02', '2022-07-20 10:05:02'),
('16e1147186a2a88c43794f084ef6c934798a2f12fb373512e5f5cec6a48352c8cdafbf6e12d80620', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 12:38:16', '2021-07-21 12:38:16', '2022-07-21 12:38:16'),
('17963a16bfb689cc7e75761ebcdde1978b53e9ce68da72feda92f541ae78890313555f63cc3ca163', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:25:25', '2021-07-01 10:25:25', '2022-07-01 10:25:25'),
('180b27a1af649180156e278574118fec6186058c7d5cab3959742fd85e0611bbe6ac2fdd53dfbd3d', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-05 09:50:06', '2021-08-05 09:50:06', '2022-08-05 09:50:06'),
('1875fef537ce0b93f74d4084f15ca49d127512226f47152ca32a2fa81971b1186e32f40a684b0c48', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 09:44:35', '2021-07-09 09:44:35', '2022-07-09 09:44:35'),
('1915c90bfdf3ff91976fdd73ff58fddb98fea89419f307184b3e7b78de48507e555820ee0435ca20', 19, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-22 14:15:50', '2021-07-22 14:15:50', '2022-07-22 14:15:50'),
('1949134aba82dafd5136ae22ea859510d33da6bf0a1ef7031a99caeb21930a88a87bcfb20b23fb56', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 08:21:14', '2021-08-01 08:21:14', '2022-08-01 08:21:14'),
('196d0f12f02537a10401ef6f2b7d1bdaf3189493b5af643047742d4a8f4f7bbc6325624175629043', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-19 04:11:53', '2021-07-19 04:11:53', '2022-07-19 04:11:53'),
('1988b7fb4ef637bb8135cf13c8fb272cd0a9c2643abe8a0c41f054a430c1270b10d566897bc81454', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-01 16:34:39', '2021-08-01 16:34:39', '2022-08-01 16:34:39'),
('1c246097fedbb632d5f3268019d20a9a968ce752db58771795175143c3881545eeddfd1cc2b8d217', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 11:41:54', '2021-08-02 11:41:54', '2022-08-02 11:41:54'),
('1c2b0f32ea7876359fb98291d1dbd4791232f67d69aa996dfd824362e8bdb2f38470fee4114d578c', 16, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-31 04:46:48', '2021-05-31 04:46:48', '2022-05-31 04:46:48'),
('1c2eade047f4cd1b89f7cd6522198307794bec0873cbf46e728a8cd885ae9087bfcc1d1f12a7fb3d', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 07:04:20', '2021-05-11 07:04:20', '2022-05-11 07:04:20'),
('1c7f194e1e27e47c838ea77c7a325d07ec285e053d7c62ba09bda93df2cf44e03a4de5ea53d743f0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:07:23', '2021-07-19 10:07:23', '2022-07-19 10:07:23'),
('1d14e1fe2d44cacb8ee2629b08a5c511095cd335e18e5aea4a12b7335e2a97e5d73385f77b10cb4c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:58:12', '2021-07-21 06:58:12', '2022-07-21 06:58:12'),
('1d3ba24d6c96059e5c604ca0f3a69b94e267dd6d7cb391ea68ed1495f221f71441b0d8f60a18a33d', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-24 06:45:49', '2021-06-24 06:45:49', '2022-06-24 06:45:49'),
('1d72e1bc2b5ffa03eb28ae32b085deb032507a6abcbcad25327061669eeff0222a85bd638ec36c20', 9, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-02 09:07:30', '2021-07-02 09:07:30', '2022-07-02 09:07:30'),
('1ea2c939be0b450bf9a93207cd1a706a1b5fdc477c990bea4abef1410316434f4ab88945c373f290', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 10:46:15', '2021-07-27 10:46:15', '2022-07-27 10:46:15'),
('1f21ba16e0b8146b4193a7f246a88dfc4be344dcf3810bfdf59e72ef81c3a108a58931982c810bce', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:42:07', '2021-07-22 12:42:07', '2022-07-22 12:42:07'),
('201b02d564639d02131f3925507448c393530e8f22fb96b52c34f0ad5b20f42462ba7384dd8ff9dd', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 10:13:24', '2021-07-27 10:13:24', '2022-07-27 10:13:24'),
('21200a5b01afeaf5600d06be7985fda80ab7d8bbecf7cb0bd915cb41f695886c275ea246b305f63f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:28:46', '2021-07-22 11:28:46', '2022-07-22 11:28:46'),
('2120fd2aab84fa94b3c8f1803ca8557b50ad85da2c8ee2d8aaede9ba8cb0f5941afafdc361d60600', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:20:46', '2021-07-09 12:20:46', '2022-07-09 12:20:46'),
('22c82b5df9a16a9f7cce05f6c26abcbaee408319fa88a05bb31100762c9cf80eb501ba7b17a04b40', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:29:52', '2021-07-23 06:29:52', '2022-07-23 06:29:52'),
('243e09df980fac2527dfe9b7c0ca9f762c17fbd38904b5f42923b09e701f5b75ae0d9f8b55d8c6fd', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 07:25:08', '2021-07-30 07:25:08', '2022-07-30 07:25:08'),
('24693816f3356412a13fd7a5ae36cf5320e88bfd410b523d137be671991a63ae51f5a0b2e5a94b80', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-06 11:40:51', '2021-08-06 11:40:51', '2022-08-06 11:40:51'),
('247faa18ea0ab7a6ec1dc35bf7401f39ee7887fc465155e158440a18c59771f96b3766a8ddbd25f4', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-17 09:32:54', '2021-05-17 09:32:54', '2022-05-17 09:32:54'),
('2570e50f49d42763bcc8e5c362b8b66c61df834d6457bc48fe8d3da578ffa7f0e4ec15587f5d97ae', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 05:53:35', '2021-07-28 05:53:35', '2022-07-28 05:53:35'),
('2646c4748220d9e5105acbfe1e029fdc09def47e13d9a392e3874663ade04fb299a72e3d70ca39ef', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 17:45:29', '2021-08-01 17:45:29', '2022-08-01 17:45:29'),
('26ee9e5c8476b36ba0170432aec6d942294a8353ae5650ddbdc103eb3e1f502cd5336a18f8b8d6d7', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-29 10:05:04', '2021-06-29 10:05:04', '2022-06-29 10:05:04'),
('2767a2fafe964ccf8be309546fd5e55659f8fa96c273d794509afcb4d951db77062d76a98830ccc4', 4, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-11 12:36:24', '2021-05-11 12:36:24', '2022-05-11 12:36:24'),
('276dc96455ab247d548026116ef56501ff33949f51312d6084b1d9257300a81f7692ed5b56be3a81', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:23:03', '2021-07-09 12:23:03', '2022-07-09 12:23:03'),
('277706fa7681ddf9a7be28ad8b4144cb63fdf9d23e6ba9fdebd35908d7f073673676879413d327bf', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 10:09:02', '2021-08-03 10:09:02', '2022-08-03 10:09:02'),
('277e77d8115a7a627440440dfc4f9aca46ad87a130554e5f294b8627822ca436a193efbe3a3a84fc', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 11:08:43', '2021-08-03 11:08:43', '2022-08-03 11:08:43'),
('28601df194dfa881fc97a578114740c10c8186909705133ef467bb0c51f352a3a05980ce4be4a3b0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 04:48:18', '2021-07-09 04:48:18', '2022-07-09 04:48:18'),
('29fc911f9b1f7614c5934fa517e891d4d6eeb49adb359e584b4aadac72f4b81c029a318cfa29218c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:04:10', '2021-07-21 11:04:10', '2022-07-21 11:04:10'),
('2b1e6e79bc3e31a80d1a4459e20cc1a5b8f26c4d1a48ff2c577a4dc5ad6f9ecb6dbf8cdd429f887a', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 10:27:05', '2021-08-02 10:27:05', '2022-08-02 10:27:05'),
('2b350d6af1644c41c2f7f8425ae4185890a334e38b8517900e28c33ea326a1b98a4abbe00481a94e', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 11:27:19', '2021-08-03 11:27:19', '2022-08-03 11:27:19'),
('2b8a19db872001da11be3da3087982642b36a959cea3496d7e94fbf5b6201009ed7c690d7700bd8e', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 05:15:43', '2021-07-23 05:15:43', '2022-07-23 05:15:43'),
('2b8b86abc142f476a245ff320755415be6c43065f327b03a72f7657549d52c5c7e3a43fcfea7ab5b', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-20 09:24:09', '2021-07-20 09:24:09', '2022-07-20 09:24:09'),
('2c8054e77839605e48328c751f970318a1ff7252aa53c07f609fb9b169fad1c7a4c97e02bd7ce1c0', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 05:56:08', '2021-07-28 05:56:08', '2022-07-28 05:56:08'),
('2c8f9a62ae732424936637f0cf9a3a4da0668272c4d0326947272cd0b42939fb5071f2d77c6212b6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:03:56', '2021-07-01 10:03:56', '2022-07-01 10:03:56'),
('2d1acf3273314afccfc78f7e3f5a75d73b85bdc23e60b20b21afb3e02e43fd2413b0eace935b99f1', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-28 10:12:31', '2021-06-28 10:12:31', '2022-06-28 10:12:31'),
('2e514dbab902a8386e3393d6bde7a6c2310c5b8cb8fa56a6344aeab441197e95d1c66e6d0654c112', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 04:46:21', '2021-07-09 04:46:21', '2022-07-09 04:46:21'),
('2ea09f35ac6dd7dddd038f5f8984606371a4864642d005b7715a18873b2a88b8fee6829079e95e3c', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-28 10:36:19', '2021-07-28 10:36:19', '2022-07-28 10:36:19'),
('2f12a011d2c34ad226dde5e76a5bc6a3fe54e503b198dea6c708b06aa7299bb30ba498fccfeb3f39', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 09:34:35', '2021-08-04 09:34:35', '2022-08-04 09:34:35'),
('2f4e8c9b6cf488751142e72ab6137fcfd80daddce8709b4d43455e24c313bce1c5a8fe4745d3154d', 5, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-06 13:08:10', '2021-08-06 13:08:10', '2022-08-06 13:08:10'),
('2f6602f56fedb0ec0f0fc5ada6688c75cb0ecf780e5375835b2611db97791cee55dbd50022d61ab0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:19:07', '2021-07-19 10:19:07', '2022-07-19 10:19:07'),
('3267bb2383fa20f845a71a3393d07e9539cae8aba0a8ee1ba33d5e4eb5818ea32065a5f3e3a41167', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-26 09:11:15', '2021-07-26 09:11:15', '2022-07-26 09:11:15'),
('32a31210ec231c8fefe2276d5931c08a59decc28faaaf6554a190477c2bfb1256bd97f92582c0831', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:51:12', '2021-07-02 10:51:12', '2022-07-02 10:51:12'),
('32a55a9dcbb1623d927fd3f2e3b610a16f55debeba722400fa04713c8352d8aa8a465a17f5e65ffe', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-03 09:47:39', '2021-08-03 09:47:39', '2022-06-03 09:47:39'),
('33207a3c0595b14477c5d124ce1684aaf22bc006dd6c863c6e29acaa31e25a99207a558df1d240db', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-28 10:13:30', '2021-06-28 10:13:30', '2022-06-28 10:13:30'),
('34c270a1c65d3c76215027026554f92e4be2cc18deaf2936694db8df3052cce6de0cc5e273180126', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:24:36', '2021-07-09 12:24:36', '2022-07-09 12:24:36'),
('34e5f61881d82d59d0dffb83674d3044e5b4aefee9e487de76fe4240bcd024cde6bd8b0ecf205acd', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:33:17', '2021-07-22 11:33:17', '2022-07-22 11:33:17'),
('35bd76ef56646c66cd44e97fe35a577dc7bb67c135e8dd619ff9b06b3d3f8dcb8e3931955b8e9662', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 14:04:08', '2021-08-03 14:04:08', '2022-08-03 14:04:08'),
('361feab3990107d274426f89e6c19fb0b53d60f51dc3e9b07e424455384e2a09aad72599db006c82', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:32:17', '2021-07-09 12:32:17', '2022-07-09 12:32:17'),
('3635c13e42171e5f852ae8a3c27ad0b1c9fcac2513188547bc6563c94879b0f9b54e9957961799ed', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-30 11:52:14', '2021-07-30 11:52:14', '2022-07-30 11:52:14'),
('36ea174f6a1cca1e1fa07c4adb4d1f5dfbae199b9b86a1c15a8ea6d8752c856afd083f5ffa0b0b26', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 13:05:02', '2021-07-22 13:05:02', '2022-07-22 13:05:02'),
('36f454da4e4d39cdb3df5a2337cd28e8aa6f7d9951033f278d104b85db99b71e08ad2253ff7d12ee', 32, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-01 08:19:19', '2021-08-01 08:19:19', '2022-08-01 08:19:19'),
('37476b936086ce9e6989cfc76d962eed835dc5638aa88dd822c3cd65e5e4fb6ed0a2ccfca79be510', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 12:59:17', '2021-07-27 12:59:17', '2022-07-27 12:59:17'),
('376d5ae7ca5960cf1657bc4d1fb72c4dfb6de350d9680a3e8836abc4f2102834eb3f8769cb4e25cf', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 12:21:26', '2021-07-30 12:21:26', '2022-07-30 12:21:26'),
('376db68431b28ed00bd970e261a4bdbc037338a0d7f0c29b0af1b1dc0edc8485655440df56591793', 40, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-03 11:06:43', '2021-08-03 11:06:43', '2022-08-03 11:06:43'),
('3869cdcfa75a05c1061991e0a16eefda82c10dfccbf26106d69fff153d3614c405623aedadfff9b0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 10:42:52', '2021-07-27 10:42:52', '2022-07-27 10:42:52'),
('387e4b9c3e873c95ed25d7d9c88cf37ce3dae683368dee37eee23b2537e8dd206adc61e613d7ac39', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 10:11:01', '2021-07-27 10:11:01', '2022-07-27 10:11:01'),
('38f7ca7484bbd5dfa4e874e4b08c32f1215ce5483b01a5ca7b3b8af22f7c6a891de1f56455de6296', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-28 08:53:00', '2021-05-28 08:53:00', '2022-05-28 08:53:00'),
('3aba4dc125e8ffdcca7f2e66fd07fcaddf00fefe73a22efb032106f97705e2c4f8654357ce1f60bb', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:09:53', '2021-07-23 06:09:53', '2022-07-23 06:09:53'),
('3c4636b3e31f8f8e46572ca5d6a2526125b180f7a3cb871ff09ada6f4e1ffdb670f507ff7bb2932e', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 04:57:38', '2021-07-09 04:57:38', '2022-07-09 04:57:38'),
('3cd6bc7777033180400ebd2cd94f4a19f15a02acc261df063c90075a0d565d0aafd9084bbe14c536', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:12:10', '2021-07-01 10:12:10', '2022-07-01 10:12:10'),
('3d7590163690e2afbb3736f4d182369a959d99a89fc07962f3e3f939286b300069f759d0687e0835', 41, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 10:39:41', '2021-08-05 10:39:41', '2022-08-05 10:39:41'),
('3db0a30082affc8bebc4e02cd4b727d9c04c49942e3a15b36ca0e7723213e2cf0f7efc86765a77ed', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-30 14:46:32', '2021-07-30 14:46:32', '2022-07-30 14:46:32'),
('3dbf4e2f6cd9cfbb6b64e79dce9820c6dc57b93cc658edb49c04ec2c95952431198429797193c718', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 03:59:35', '2021-07-22 03:59:35', '2022-07-22 03:59:35'),
('3f63e667288f69c446d753d94e1a8f4edadd87544d5d73a50fde57fc14299fbbe5e7661fa516d43c', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 13:51:37', '2021-07-29 13:51:37', '2022-07-29 13:51:37'),
('3f6bd605146670d1b0ee58ceb4a11ad74c32e1d22d4c3b3fa7c99b2afb318dd9f002ffad1f1c262c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:27:49', '2021-07-30 08:27:49', '2022-07-30 08:27:49'),
('3f850fc6947ea05b3623281a435d2f7a00e4b3c78832eb61b688fb4d7e22839994692f1eff92e8cb', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 06:20:57', '2021-07-27 06:20:57', '2022-07-27 06:20:57'),
('3fbd639f9a622b4036222dfcae7a02571594d721331f6c5ca1fd5d179e5ea9ab808f752f268150db', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-20 06:27:19', '2021-05-20 06:27:19', '2022-05-20 06:27:19'),
('3fd940e45909892423c81cff3d4fb87fb91db96d4437f5e46d4ae4644db0d86e9184f32628b9a217', 27, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-20 10:01:04', '2021-07-20 10:01:04', '2022-07-20 10:01:04'),
('3fea62c38c9ba405ba87ea3bd692363f4286615583e2d06571743823380e15aac13fd499125cf5c9', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 10:52:54', '2021-07-21 10:52:54', '2022-07-21 10:52:54'),
('4058ea30344cad98e3967ece3bfe6e33680f19d50e2fe432cfd9f1753f01ffc2bd7a754754209089', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 11:08:51', '2021-07-27 11:08:51', '2022-07-27 11:08:51'),
('40813a839239188b2dfdb08963410879de63f3a84a9df43936dfbd69611e085ba185878a5f60d8cb', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-01 06:24:44', '2021-07-01 06:24:44', '2022-07-01 06:24:44'),
('4092c3f2df261b2a3ef75d0679bc5fa645b8cfbad4e58f89931be94063f29900a3b5c4c062dddab9', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-14 16:41:57', '2021-06-14 16:41:57', '2022-06-14 16:41:57'),
('40af7f82aa534743376400c7c071d6afc4cdcd3556514b42f1975d3ec2e49fdf10518494cc9ab86b', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 13:41:50', '2021-07-27 13:41:50', '2022-07-27 13:41:50'),
('40c8149a0f50aabca47a6f0ba42e474b350660cd613c733ee740d3f56d1ac0359ea074b22b64fedd', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-14 10:21:32', '2021-07-14 10:21:32', '2022-07-14 10:21:32'),
('40ee71ca9c5d0b3b22fe465d911d6c70f892116023f7735035ebf47e7b3b75008e6ff1cd3373a935', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 13:33:52', '2021-08-02 13:33:52', '2022-08-02 13:33:52'),
('414d5b904f93cd3df2ec12b1f8feadeeb57c362eae556a40223dbb3cedb88cd5ca4274c7d0eb37bd', 39, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-06 13:11:00', '2021-08-06 13:11:00', '2022-08-06 13:11:00'),
('41d3c57beec50c99e8139693fce7531aed517ab39fbb47769f419986ac9fe4b7bf0128bb924df24d', 4, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-24 11:12:28', '2021-05-24 11:12:28', '2022-05-24 11:12:28'),
('423d1119ff81b90ec7a5f23cdc518c44c902a29c5a757f9eaeb08def16dab3100544c6e1d708eb8f', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 05:14:54', '2021-07-23 05:14:54', '2022-07-23 05:14:54'),
('42aa242128edaa2dcfbdf3dd288ebfff0811b268ed02cc646d0465b3236dce6101f5099391571d5f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 06:55:24', '2021-07-27 06:55:24', '2022-07-27 06:55:24'),
('42acc660b3ae08d241f3ce77008cf69739a58b27ac9852538d24878c0b087e6f7200e39e512fcdda', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 10:41:24', '2021-07-21 10:41:24', '2022-07-21 10:41:24'),
('431e54ed7d49598905a26b3fddba7a3eec16916de07a732e31d302120dd8806ac496e4cc7454b82a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 04:14:19', '2021-07-01 04:14:19', '2022-07-01 04:14:19'),
('43b2a44f59917937228dbf051ac657af2110fdb9f2cfb751cff1d4a43fa19974c2a61ce330fd4208', 34, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 17:27:55', '2021-07-30 17:27:55', '2022-07-30 17:27:55'),
('444187ea630ecdddea7ad726bfe0fdfeadf6c396575f8e9c285bdd8eb13ea22eb7966dc1f4bb334d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 12:16:17', '2021-07-21 12:16:17', '2022-07-21 12:16:17'),
('44809cd38f4b6ccbdd76b5fd225427e08f3c7de1dc5f2c3f829c1aa3d665f6bd8a5380510ac5a9cf', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 09:38:19', '2021-07-01 09:38:19', '2022-07-01 09:38:19'),
('44864555db93b435cda3100b9b93e75e12a4c876a1cc1cfc0959b29e1436ed45caa9a6fc7700550d', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 05:55:05', '2021-07-28 05:55:05', '2022-07-28 05:55:05'),
('44b82fe05132d062167e9df128777b9378a523bb3b45bc4922ffc620f651a795ee74dee2e44f8aeb', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 09:48:59', '2021-07-19 09:48:59', '2022-07-19 09:48:59'),
('44c034748ace195c3034f0225f0ff10d732ab0d581b0b51dfe405f53d08d21a364f5ae58fed1d1ef', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 10:00:09', '2021-07-09 10:00:09', '2022-07-09 10:00:09'),
('44df4f05076cf3146dbf0eca76f8aa0cf240a13de8c2fb0e0241dd046c4b5ee850f9fe9aaa906350', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 05:15:56', '2021-07-23 05:15:56', '2022-07-23 05:15:56'),
('4592edf1e497b534d8a2a8116900f2a5eeda3a43128a54ba2e65b4ac404f2c20548a8c4de8df077c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:17:30', '2021-07-21 06:17:30', '2022-07-21 06:17:30'),
('45e17ce9d1e297ae27020e03e4ada8ba0d67d1e6404a1f538564a8e3ddf3cf80aead09d1fa226782', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 04:57:22', '2021-07-22 04:57:22', '2022-07-22 04:57:22'),
('45f5b678a9f9ac0fa41dd7a9e78c9f0105bc6329456a6b2ac9acf532fb68c77f234919ec19eee129', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-01 09:04:28', '2021-07-01 09:04:28', '2022-07-01 09:04:28'),
('462609075589729246f88c8409739e988e4d0f4e43a148734110f266a1ed715ad0f136ffc911fb39', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 09:57:25', '2021-07-19 09:57:25', '2022-07-19 09:57:25'),
('464782562c5e09c0587c554afa3ff5044e2d0dd54d6b69d5ccb6a078709a6f21fe1d04c2770fad6a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:55:22', '2021-07-21 11:55:22', '2022-07-21 11:55:22'),
('4658f33b29b97d260f279793ac81ac83e4f4754e2f4efb796db417e38db3e75f36e7768c31f3a5c5', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-26 06:41:20', '2021-07-26 06:41:20', '2022-07-26 06:41:20'),
('46778cc661a38e554357fe5f3bbc7b557d20cfd7ae896afbb464c47454a476497e06587672078ea2', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:03:08', '2021-07-23 06:03:08', '2022-07-23 06:03:08'),
('46f53f08f79a8d93c5f2ec6395b92b72c5851f0edda56d10fa139b02ee48f039d86db7b2eff574eb', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 11:46:55', '2021-07-27 11:46:55', '2022-07-27 11:46:55'),
('470d38f547f8f9139d3bc0fb5ff1e46418d579f19866320590080519eda0df28139f33531bfa3a65', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-28 10:17:12', '2021-06-28 10:17:12', '2022-06-28 10:17:12'),
('47b38bdd518ae877c0f50b437b8e398c357e1130db20a6405a8dde79c40a1a9a01297d3044435d3c', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-13 09:48:42', '2021-07-13 09:48:42', '2022-07-13 09:48:42'),
('47c9427a15093db215affbd6bc421a9404980d4a18e576cafc35b83cd9ab71b585b9816179463337', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 12:21:55', '2021-08-04 12:21:55', '2022-08-04 12:21:55'),
('47f49096dbfd04ec1884cf43d4e926d035200c84114ad0a465896c01c7ee34b1cacec2ef60a840ea', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 07:25:35', '2021-08-03 07:25:35', '2022-08-03 07:25:35'),
('48245ae3483aebd6176a9d6dcfd8439130f57afd40d56cac9bd9564b38f66c62a5c34000d2c870f5', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:00:48', '2021-07-09 10:00:48', '2022-07-09 10:00:48'),
('493c8e6fdf8793d1cd5f0fdaf46ac754005ed2161f1f376af9bf224e64b32ffaac8194826351f3d2', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:09:05', '2021-07-02 10:09:05', '2022-07-02 10:09:05'),
('4b85937ba95889f0cfc50c56793616e932ef2f5d805c0e6df0fa19106622da6d2bc37b61d87b4aca', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 13:50:28', '2021-08-02 13:50:28', '2022-08-02 13:50:28'),
('4ba3d1412e4183ac84cd4b862ab0339973b42262917429e6bd62f8b56d2ee33ad7a0a0258aa9122c', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:07:26', '2021-07-30 14:07:26', '2022-07-30 14:07:26'),
('4c123fb43177b612dfdf7ba3597f6dfc3926368d478f801a7b7160d1d37531cdc65ba5f7386c757e', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-08 10:44:21', '2021-07-08 10:44:21', '2022-07-08 10:44:21'),
('4c64b343b87f7cd19f4f95020605916ca2e0f73ac0b72f341c852c1a109ff455e3d311e30f90943e', 12, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-17 05:05:17', '2021-05-17 05:05:17', '2022-05-17 05:05:17'),
('4c9bea4451c42093a22729048667b8b9d6e8ca97db8fe9b6ac4437a374ac60c4fc5ec398fafc949a', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 10:23:16', '2021-08-03 10:23:16', '2022-08-03 10:23:16'),
('4cbb5668173b5a9824f335e66b97bfbb4ee298e8197e439f0dd9f00e8972cc5a04e45dbc4b688ba1', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 05:45:35', '2021-07-21 05:45:35', '2022-07-21 05:45:35'),
('4ce95e771675302ab8f029ae72731010c10574a0ce535812d6e42f2d4ac6535ec6bf9c476fbb57e1', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 13:10:46', '2021-08-02 13:10:46', '2022-08-02 13:10:46'),
('4d5ac5b50875227173576f39750a10480df2c560f25423a5b706a67b4959d26809292524991551e0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 06:33:07', '2021-07-22 06:33:07', '2022-07-22 06:33:07'),
('4e98100fa50f37dab00fb88b52863ad55ed354f14e8c75db97292b1fd0c6854ded69134deb7bfe70', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:17:20', '2021-07-23 06:17:20', '2022-07-23 06:17:20'),
('4ec8fdaca6e6562c0d95aca3e1c0c9378aa5ab36ea9cfc727abe4fbc0b9796c0bdc676294f711ed3', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 12:44:09', '2021-08-04 12:44:09', '2022-08-04 12:44:09'),
('4f31c6e98982e48aec8caaa07c019a94f2d7766ebca3f0fb09a5c6066a4ef674ab46e5d5a5d9dc1b', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 05:09:06', '2021-07-09 05:09:06', '2022-07-09 05:09:06'),
('4f9dfe863e98141f955382ccc6ad2b06a4c709584d1294c00f0c593dc171ab456528f4d31cba8dfe', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 06:23:43', '2021-07-30 06:23:43', '2022-07-30 06:23:43'),
('4fa53c1652a1d86f3caa95b802821001d51c75f6be547d45553e473898c704418822bf39e94582f4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-28 03:47:51', '2021-07-28 03:47:51', '2022-07-28 03:47:51'),
('504279eb0c5ed768bf1cee96a91f64545b4f35cd40c31e0853e5f57199325b1fa533f3f903a39909', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:50:18', '2021-07-28 13:50:18', '2022-07-28 13:50:18'),
('50cf7b9512d2ef621b6e5df0462a9f95ef964f3230e624400ffa00ad2d2c73c152c65b736d2ce23f', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 07:15:27', '2021-07-30 07:15:27', '2022-07-30 07:15:27'),
('51e65fd3b9ba992661c2afb39623c5351089bfee7d6228c3b74755e8bedd367133c125de6e3fd3b0', 19, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-23 07:18:27', '2021-07-23 07:18:27', '2022-07-23 07:18:27'),
('5238a60baee9481843c21624a2bc71bc9b06bc7c9205d2dcf138b585f1e0b79aa7bff9dde1db1c6e', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 07:41:46', '2021-08-01 07:41:46', '2022-08-01 07:41:46'),
('52b93231a3f9578be9275c18033ae5600fe2ebf7428b9cb59feef7cc94b43296b7b8e51c9eaa58a9', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 13:29:24', '2021-08-03 13:29:24', '2022-08-03 13:29:24'),
('52cacf28dea87ffb08703ae6463da93a74a6c68d596a4ee0dcf99b264f4457e3c9cad2543eb757f5', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 07:40:28', '2021-08-01 07:40:28', '2022-08-01 07:40:28'),
('52ed8c0e0aa698967e3de4e68753f3932d1c550c19b7bf2331a728790b1d3598e2cdf50ff47cf450', 28, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 06:49:19', '2021-07-21 06:49:19', '2022-07-21 06:49:19'),
('5390d4979891d582860995dd591bc6c88edd9c5129c1217f7bd9ae74fde1d308acf831616a74cda0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 05:11:05', '2021-07-22 05:11:05', '2022-07-22 05:11:05'),
('53d10df78e527581de6c0fcf845ebfa7e426b5dadd43ca12fd752e29624702a9dc29b9939403931f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:27:31', '2021-07-09 12:27:31', '2022-07-09 12:27:31'),
('53d62f5d331e526508c6dca25be16e1dfd2f2bdd0a82dcb5e402540a7c82bee3c18a4548a6656389', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 09:38:41', '2021-07-21 09:38:41', '2022-07-21 09:38:41'),
('53f695f9f58f6ca492b7d26a4cb1df1daaf2c370271e55c0049ba114d5d14c66460dcc0fb80363ed', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:22:05', '2021-07-09 11:22:05', '2022-07-09 11:22:05'),
('5421ea8ef5cea4a96a3a499469cd38889cedc01417571d5bb8f48f70c4d346d7f55cef28416f73a8', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:45:07', '2021-08-04 08:45:07', '2022-08-04 08:45:07'),
('5455e41593a99070d16f38aa054ff00a81d5cc27b36aff909b7c649c195a7cdaf7ec79c2d7579a8a', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 12:22:10', '2021-08-04 12:22:10', '2022-08-04 12:22:10'),
('54b60abcab1f614cb9ff53772a13f440394b57bc09aca07b31aa463ed6a05616d1f2a1a2cd2d2a22', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:37:48', '2021-07-30 14:37:48', '2022-07-30 14:37:48'),
('5532804ed37c1d7546523a15267b41fdb4b23671228b2e85966c3c6a680984c8ddb1cb3a9f88b789', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:05:48', '2021-07-30 14:05:48', '2022-07-30 14:05:48'),
('556a5721bf3b569df554369d6292b5dec1c548490f6082b2080b80d101bf049966200a53d9b0afa2', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 09:39:26', '2021-08-05 09:39:26', '2022-08-05 09:39:26'),
('55c747d94102844360e3c766cccf022dbe444eac9f11601abe22d685398fff96903308b51a2873ba', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 13:45:53', '2021-08-03 13:45:53', '2022-08-03 13:45:53'),
('55fef7e1c04039c543027092996e0a21471bbe0ad2b2b82b7b3f8ad31c8063fb96690e365ed38469', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 04:01:07', '2021-07-27 04:01:07', '2022-07-27 04:01:07'),
('5615ac16e118c6838743653639b9d0d89b560cd1b758c606f92469e6405e56bc7d96bf3e84248d79', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 09:13:38', '2021-07-30 09:13:38', '2022-07-30 09:13:38'),
('575e9fcc8ea087092bb6e6e1dada289b105641ccac18c1e96f35c6eb6e9668c5edbad00159096b37', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:43:03', '2021-07-22 12:43:03', '2022-07-22 12:43:03'),
('587e52a731247b23ba8b7743a201ce1959585cc8436e75610ca638031b0adf145fa6c34235e41d2f', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:40:08', '2021-07-30 14:40:08', '2022-07-30 14:40:08'),
('5915101a462f74b33974bf3a49c1c6f29fb19530495bdba4dd4cb7388859a2b4aef1d377e37cb99d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 09:17:02', '2021-07-30 09:17:02', '2022-07-30 09:17:02'),
('591ed2cbcf469a2ed574a582884da7a86a9b4a6a766ba2daf351b27e2faccb5b0c94413f9fd69f29', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:46:47', '2021-07-22 12:46:47', '2022-07-22 12:46:47'),
('598ecbf17b4a3ea4b43ae4233e853dafc9540ea8946a1416de5943b53b318d332397bc1956a4db7b', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 06:59:31', '2021-07-28 06:59:31', '2022-07-28 06:59:31'),
('59c3801252808f650345d0972158d0ed8eeac524776d4008c0ec2f45104d09561b47697858572ef0', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 12:17:06', '2021-07-29 12:17:06', '2022-07-29 12:17:06'),
('59efa21000ed412566d23556546b3da5dd626bfd2d4fb1cc4dac5b2b071d7988e07d9e1382ffc001', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 09:27:04', '2021-06-29 09:27:04', '2022-06-29 09:27:04'),
('5b2d1b7faae3b0437cef0b419f48017528aa0f47e8acbe4b9516fbf1b577870ac0c9d4178299c77f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:16:40', '2021-07-09 10:16:40', '2022-07-09 10:16:40'),
('5c04c836ce0d2f70f35c6fd069a64ff2987ceaa4de8ac7b9a26eebfe268170d16d7050169b83889c', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-19 04:38:58', '2021-07-19 04:38:58', '2022-07-19 04:38:58'),
('5c0ab08dded188235206e904962159f1e68f2ef3f65506bb9281007c2cc8b1b529508eaa8b6918d4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 03:59:28', '2021-07-30 03:59:28', '2022-07-30 03:59:28'),
('5cb8e46dcdba3c114dc4c5cf28aea19a57a15816229cf18088db0e209a7dba45bd6948446be4f5f8', 1, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-05-20 05:12:28', '2021-05-20 05:12:28', '2022-05-20 05:12:28'),
('5cbc552131e9b53bc4f1e91e9d913d335e1b58c3ac4633535e323abd7f0dd88c22c43c72b0584206', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:33:04', '2021-07-22 09:33:04', '2022-07-22 09:33:04'),
('5d6389712e60f854741a890c87718629ee01a71eddf15b7cce1939d868719eb1f14e302dcbb529b9', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:38:08', '2021-07-21 06:38:08', '2022-07-21 06:38:08'),
('5dfdcb7d1c3279ce8dea24a29246dca4c7199fb7c26e266af9154f0d3a8e32348bab5bf911921a40', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-26 11:06:56', '2021-07-26 11:06:56', '2022-07-26 11:06:56'),
('5e9c83b5a216d70b106cc1a32ac599003c2cf8601e10e63e5509f2d802faa98f04f1ffd00cf0cc5f', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 11:17:07', '2021-06-29 11:17:07', '2022-06-29 11:17:07'),
('5eaf2acf8af6f3eda301d348ba0b5ce1985d2017dc5d5a65b77c2356b0feaba4fd5020027c3337e6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:11:42', '2021-07-21 06:11:42', '2022-07-21 06:11:42'),
('5fd492e48296f4ea5624fbe83fa0d118491dbc5c0d06208a59d640ddbdb9fe20d929e03c25a80b0a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:34:01', '2021-07-27 09:34:01', '2022-07-27 09:34:01'),
('5fe259253ae898d1ddbcd43e45fd1c32e20096d4d70c507e2bd5c6944ac43dc4a0ad6bf959472500', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-01 04:43:09', '2021-07-01 04:43:09', '2022-07-01 04:43:09'),
('60369c2dbb5fac2f29da0bd6877739d01079d2c840e3ec3008b0726b0b1439e018ebd53745395af6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 05:49:45', '2021-07-21 05:49:45', '2022-07-21 05:49:45'),
('606c9bed21ff2ed59eda8f18d4aa994f6cbbe1a81a2febb0f339fdaf5ac6fb939c112bbdbc976736', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 15:36:10', '2021-07-30 15:36:10', '2022-07-30 15:36:10'),
('615f4e8fe02fb2ed1552b40f316bfbbf0dba42236a58ca5e71ce71306fb60959986d202ccd6ef5ac', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-28 11:44:07', '2021-06-28 11:44:07', '2022-06-28 11:44:07'),
('61735b6057c8b6144d828004986bfa4ec33a35a1bd2937fe2ed410c21e87da5963dc2fe618b28d74', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 04:20:50', '2021-08-03 04:20:50', '2022-08-03 04:20:50'),
('61b417d68ff6fd457c3cf22855866ad179c48c9fdc7aaf717fad6026274c59ab784d7fd5ddcd91cc', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-07 10:57:45', '2021-07-07 10:57:45', '2022-07-07 10:57:45'),
('626f27795190f9c656a85116a7c1060145fd18cdff16d3f4a21ecf8d53e5df17c38c5a390fccfa91', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 09:30:20', '2021-08-04 09:30:20', '2022-08-04 09:30:20'),
('62bd2075b29dbef7297b10441b7208ed2d0a1d2e7891dc7bd4b3c3304f05d2f13e4e0e085bd91161', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-30 06:49:49', '2021-06-30 06:49:49', '2022-06-30 06:49:49'),
('634985709d481fc4d6e92791e53bb2c3753d598b43e6e726c50ec3c0f714e204583f61dae2b4e714', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:41:54', '2021-07-09 10:41:54', '2022-07-09 10:41:54'),
('637ef7ffbb1be060eea4296cda13468c0f82b233ae87bbd8270bd22c151e837005cb7b40c1cef417', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 06:48:55', '2021-07-22 06:48:55', '2022-07-22 06:48:55'),
('6389ecadc95ef61c69c9ffb6b4e6730ebcaee9545ab57d9592ae5ab978f697ef1985602442a019de', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 12:53:00', '2021-07-30 12:53:00', '2022-07-30 12:53:00'),
('647ed3e0b2f108dc04d67861768ac16f4fde17762f48731993bf80bc143cd8578653ee206e1e25ff', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 05:21:12', '2021-07-30 05:21:12', '2022-07-30 05:21:12'),
('65e1c607401d1d6c47d05cd1851bb3070b65ea304610ea9e275510058ff1acd78037fa8a1f13d166', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 05:59:51', '2021-07-28 05:59:51', '2022-07-28 05:59:51'),
('6746abbba9a1f5568a4187c56fd5fda8a93e0a0729ad8e90585fecfbc25f75a006b412c3cf7b6870', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 08:09:43', '2021-07-27 08:09:43', '2022-07-27 08:09:43'),
('6763ce91494ad05823067784a1d12d5262daddc71dfe0c9fc439b435a32a55abe93e47149d393f67', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 06:55:59', '2021-07-27 06:55:59', '2022-07-27 06:55:59'),
('679e9bbbf590e8bb45e324d36dfb86abd57cc8b4dea47f60712c0977fb96f3c4ae26dccf7c08e3f9', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 09:19:53', '2021-07-01 09:19:53', '2022-07-01 09:19:53'),
('67ca8d7802b8c8d9155c2dc6a04641ba325e0de40496765ee18f31df9f739ed7bd694f25f9fc4872', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 09:32:35', '2021-07-21 09:32:35', '2022-07-21 09:32:35'),
('67dffba6376296d95e8e37c501423c8806324b1870da5db436373ef52765a580b047138c40913ffd', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 04:57:00', '2021-07-21 04:57:00', '2022-07-21 04:57:00'),
('691e8d4af1210fbb76a1993a0b105868129a4c6dd76e4453c707890cf87ed8055bb831e75dfe0cc9', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:03:23', '2021-07-22 12:03:23', '2022-07-22 12:03:23'),
('6c5bf77af75aa9c6869eef901a3dce3c63022137ef74ff2b59a6e8d8b3e3b6a8a0f80d9f3a549801', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:25:58', '2021-07-30 08:25:58', '2022-07-30 08:25:58'),
('6d6fad45a89092be605c3190ff1abca56ba22ccf8828764e842e28c0149e2fc79bedce3b9f4310d4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:25:31', '2021-07-09 10:25:31', '2022-07-09 10:25:31'),
('6dce729b260d6f4408eb958f865006590d3eba1b1436e089a88c6ed60c0f0963ade0ec8793cde8a3', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:34:30', '2021-07-01 10:34:30', '2022-07-01 10:34:30'),
('6e5bb299d642dcc04c053b9ad52534e8b5c4c76ec99dbfc9dcb947d909812de7d39b67a9510ddbcc', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 09:46:54', '2021-07-01 09:46:54', '2022-07-01 09:46:54'),
('7119ff0242ce4256116b349af24801cfba128158d0747e898728326b7ccc2de3a83adae15f54cad2', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 10:23:31', '2021-08-02 10:23:31', '2022-08-02 10:23:31'),
('714270df81215d6519d7f053f48f67e963e79d40ed99ed11481c263ac5cc3ad34905ca1a6deb6d2d', 6, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-28 08:58:25', '2021-05-28 08:58:25', '2022-05-28 08:58:25'),
('714f1c563c87c55799227f53b87b848e16d5969bfff5fed5c7547593e20a49e225d85a3bbe631e35', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 04:23:21', '2021-08-04 04:23:21', '2022-08-04 04:23:21'),
('71db14c8d24e823ee93760d44d5f1ee3dbea068a2a8dc28a7aad657775117a16ce0b971a77025f4f', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 09:04:43', '2021-07-28 09:04:43', '2022-07-28 09:04:43'),
('7223bf177353a202f09b287fd164ad06a0d64d660937ad0214c9fce83d3f4b491b2810d93e070149', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 13:19:14', '2021-07-29 13:19:14', '2022-07-29 13:19:14'),
('72376120e491db2cb0a0943bd5231e6990b6715d7cc819001b0525755e6a933fb008605e34ea0c49', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:25:06', '2021-07-22 12:25:06', '2022-07-22 12:25:06'),
('72a5a9ce6155186598b526f9ec29ea8346b96b02caa89c434f6044be4f8a9ac2d7574c5fd75b1bf4', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 07:39:54', '2021-08-01 07:39:54', '2022-08-01 07:39:54'),
('72de7a62386080699de561dd36f760dfe54b4b547e18b7e8eb8a80719164fa1a48f046de104fd455', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:13:31', '2021-07-30 08:13:31', '2022-07-30 08:13:31'),
('738f75d43c11afae598c0d93a0710fe2e5aa487bc39fb0f71c29446020f18a7a40bf24270e9acf4d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:38:21', '2021-07-02 10:38:21', '2022-07-02 10:38:21'),
('73d0657e7167ba7d36c3e8b5466500f5ac6450077cb7e1545400596f82275b359ba54b0052d260c8', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-25 06:24:38', '2021-07-25 06:24:38', '2022-07-25 06:24:38'),
('7457915ba1244ef7d026f355863f773e9433f3cc56358e8c3e3ed71048474b6a99434a260e17080b', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 07:02:02', '2021-07-09 07:02:02', '2022-07-09 07:02:02'),
('74dc423cdb4ca7d3108ab4bb490ec9bea943b2fa55a4655c8efc3ce85c6998a811543a94dbc8272e', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 05:23:29', '2021-08-05 05:23:29', '2022-08-05 05:23:29'),
('75b99e780500565430ee8213a057e6145b47445f05a429bbc3d39c9dc5fd196e3785df367c99bc53', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 10:32:12', '2021-08-06 10:32:12', '2022-08-06 10:32:12'),
('75f58d45683dc3f44b3d75448f48cdb531a3656ca82d02fa06fc679ce73d59da0a8c1848d58519cc', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 13:48:25', '2021-08-02 13:48:25', '2022-08-02 13:48:25'),
('765938e397794582a0984aefb6433845a2f27566f6bd0cae42a4f9cb7db0b14ed2a223789fcb15a1', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:36:49', '2021-07-09 11:36:49', '2022-07-09 11:36:49'),
('765c6b71beab691386fdb1928e052c7ff99cc3dc7d9668b107bb4c5c2b733a56355b0da46999a570', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 14:32:15', '2021-07-30 14:32:15', '2022-07-30 14:32:15'),
('77d03272f3996f61c82f3a7c082c8e63a626334459779f201797029c671d9dcd4e7eb347f26b78ef', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 12:57:58', '2021-07-27 12:57:58', '2022-07-27 12:57:58'),
('77e52b5eb90ca60fe9cbcc597081258df7bf248d5e88c9ed324ee13ff8df12e768c71d8714b55c51', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 07:16:38', '2021-07-22 07:16:38', '2022-07-22 07:16:38'),
('7894ab1d63a7115c1bca0dc6fddfc8eb3096a024dabc848eba6e63aabb7a147b9e714644fe13f5a3', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 06:20:49', '2021-07-27 06:20:49', '2022-07-27 06:20:49'),
('790dddaa6825311d58c20587854222d6d6014a9423a681f2ca91acaa6ec4e4e15b43e3eb218bc3be', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-01 04:14:41', '2021-07-01 04:14:41', '2022-07-01 04:14:41');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('791a0cd835def924146bc033c990aeb25a0a5f824dd5f52a5f7196ccf8b71ac9a82a880a5b2ce097', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 12:47:49', '2021-07-29 12:47:49', '2022-07-29 12:47:49'),
('7976b547702f7389e64184f0e99c0a785b51cb3d2e6d21a3b7d0d80633c9c6181deedfcb2fa97b1f', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 05:23:35', '2021-07-23 05:23:35', '2022-07-23 05:23:35'),
('799c642afd3e90cc98464a321830562c273705bfb7524f4378b828ff0cd91de4c5e74b25673632c0', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 10:02:34', '2021-08-02 10:02:34', '2022-08-02 10:02:34'),
('7a271cfdaa49ee108720dc3852b951fd2e3eca4b01774141f84a1fc139a1b1b8b474d5d3748ff782', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-29 11:04:01', '2021-06-29 11:04:01', '2022-06-29 11:04:01'),
('7a9cf62f158813662b30453802d7eb5657f7173370d31527db98a840f9fd7e7c514e4fdb125c5dcc', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 09:23:20', '2021-08-03 09:23:20', '2022-08-03 09:23:20'),
('7aa5bd79a2f31ba278a8d04a8f2751a29a74fc1a1e90a8442df9c3d59f7a1834b107e59c76c2c515', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-26 06:40:58', '2021-07-26 06:40:58', '2022-07-26 06:40:58'),
('7c8988aa700840d6f574685b7b612b393fbb71c58e65e7dc011f64f10c735dc2975acb67005bb083', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-01 04:13:42', '2021-07-01 04:13:42', '2022-07-01 04:13:42'),
('7e1e000011084f3011fe4477b33f1645bc5de0694a6cc7a9313c8498c47ae2b61f4094a196447df3', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 10:51:44', '2021-06-29 10:51:44', '2022-06-29 10:51:44'),
('7e72073deeb466b04c21fd4e3dae77d20601bdeaba005df1818fa3332cbce87fcfb997f0b1bfe8ce', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:55:08', '2021-07-09 11:55:08', '2022-07-09 11:55:08'),
('7f546a7fe1c9037496bc7d020b0c60a521a422d7e421b69838d7099468e4cbabde1865ff154d3bc6', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 10:34:15', '2021-08-06 10:34:15', '2022-08-06 10:34:15'),
('802d8d96799e4e41a91fc98a32597e560ea7e31915e682f5f18ea5de9668bf8b9ffeef4db3df9b3f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:13:10', '2021-07-22 11:13:10', '2022-07-22 11:13:10'),
('80492b1032594255a98571cdf5d27990314980521645fc2f75c758bb3c633f9585e1a19df608bd3d', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-03 09:42:57', '2021-08-03 09:42:57', '2022-08-03 09:42:57'),
('809d2333a38a50650ba81f87b3f932591926d40f6cc4a63fa7f9e1f7a3c2ce85e283bebd08e00948', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-28 07:25:17', '2021-05-28 07:25:17', '2022-05-28 07:25:17'),
('82007fc71a4cb0bf876bdf464e7e97674780aacb4467c8de5fd5d577740c0d96f97fb03780259e6c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:06:19', '2021-07-21 11:06:19', '2022-07-21 11:06:19'),
('827ea091f9c2d73b9eb7028671aac33fd9c5454597564f7f8d23ea0139a78fb97a5e3328aba0e03b', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 09:57:01', '2021-06-29 09:57:01', '2022-06-29 09:57:01'),
('837b737ce7d51a8467221827306ace1d80cf1afbbf64c51d0626c277894ae2af75df0e0b6bb9da05', 41, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 10:34:24', '2021-08-05 10:34:24', '2022-08-05 10:34:24'),
('83a3524d72c051396e21d1ba05be3ae9abae072d0df20b8a7fc8aa3e18b9cf5ab0da944dfe06497b', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 03:57:15', '2021-07-23 03:57:15', '2022-07-23 03:57:15'),
('83e6f16851164fe455ebb82f33c6651d1adf45caa290d6edd8fae7eefb8b6dbb0b412e07cbbfeba5', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 13:01:53', '2021-07-30 13:01:53', '2022-07-30 13:01:53'),
('8425096e8709b4f97503b61dd2016a033e3b3c1b138db4aa2aa5e6a53dbc22e26235d77202e6c479', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 09:28:00', '2021-08-03 09:28:00', '2022-08-03 09:28:00'),
('84c9d2f968b6c0ab96204325420e77bdba97162d28aa89a87cfc306d71f0d8a9bce26eb5faf371d0', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-13 12:38:04', '2021-07-13 12:38:04', '2022-07-13 12:38:04'),
('84da9c3716cef099f9d44256e28d9d54868eadf7014af7bc0ac33128be3fe83b2d8152ad94cf9589', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:37:15', '2021-08-04 08:37:15', '2022-08-04 08:37:15'),
('84f4975685705b6415d94ca0c095e13c0b6ccb33d3bd78867f441b9c998bd976788e9eedd0a52585', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 14:14:39', '2021-07-27 14:14:39', '2022-07-27 14:14:39'),
('85750a9cc1db0ceaeedd1f0101bd4522ddd5b0606f06a167ef5144be6ece3a22130949c29e37b0c8', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 10:45:01', '2021-07-22 10:45:01', '2022-07-22 10:45:01'),
('85b888db4ca1bb86ffefb3a724f6f087fe99c43f45b79d0bbd39afd585b365a53f5b6f5ffb6d73b8', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 07:08:12', '2021-05-11 07:08:12', '2022-05-11 07:08:12'),
('85c9d45f2655adf878522c3c6b5cacce4f5f529b0df518d01fc06fbdc5248b3ffdab2b73514d206b', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 10:12:36', '2021-07-30 10:12:36', '2022-07-30 10:12:36'),
('86119a1b4e4f055238d6a60738454d0c64920f7927bee64a27b47c261e8c7827059b95b9a221e491', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-06 12:55:58', '2021-08-06 12:55:58', '2022-08-06 12:55:58'),
('86229fa413dcada8217eef9ed5bfd740de5d5a8d1c96770fd2d7f01831cac6955da89659b6d0bfbc', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 11:40:00', '2021-07-27 11:40:00', '2022-07-27 11:40:00'),
('8673e16b37f546b34d800e73fe54cf673e7805eb375c0063e3c8eff733f3235b6329927724e8791a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 10:58:04', '2021-07-21 10:58:04', '2022-07-21 10:58:04'),
('8739bdb0f673c40e51d216d43590518c4907e22699b4fbe3f512ca578ed2a9666c9abde5ea82b0b0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:30:39', '2021-07-30 08:30:39', '2022-07-30 08:30:39'),
('87442ab0627a8c92250ef2ccd9f8c04b8f1850cae3d5ed3f02898c49acb678ea04f524fdde947ccf', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 10:55:48', '2021-08-06 10:55:48', '2022-08-06 10:55:48'),
('88067a8e1a65e407b03972984a1350125005610359c35bfebf902dc6737e6ccf91e059b560f95336', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-30 11:53:35', '2021-07-30 11:53:35', '2022-07-30 11:53:35'),
('8874e62022713e1b5caefde330e91de045287c966243e70a6d2f6a97550036c259ed0cdaf4fef89e', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 08:59:42', '2021-07-28 08:59:42', '2022-07-28 08:59:42'),
('8885f18aa76fa5fc12917b778f8a5aa59f765945c4c5c51740bd3303a672334f9b195040f8ef4b96', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:40:56', '2021-07-02 10:40:56', '2022-07-02 10:40:56'),
('88be28d28cabb668ba31d78c0bd5a4748f8374b06215a596121c14d61ba4871872ce1bbe3dc07f55', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 12:48:49', '2021-08-03 12:48:49', '2022-08-03 12:48:49'),
('88f2296a110a9b1b0e0f6470685cee7ff871123d8c2b5b7d98b84e4af92a586da5f3af05b9b8e052', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 12:28:17', '2021-07-30 12:28:17', '2022-07-30 12:28:17'),
('89b092032103099bb68b17816bf2339090f7ca488ddc3a00ffe8c22c98b3ecd4b28cd349585fc5ad', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-21 09:10:00', '2021-06-21 09:10:00', '2022-06-21 09:10:00'),
('8aa16a7184b430c95e24b428bcecbd838140d24521568d0c658c42f3cab01469ef327e34420dbe5e', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 06:45:37', '2021-05-11 06:45:37', '2022-05-11 06:45:37'),
('8b27635aabeb46dba53f329d7b6158b8c92e3854404374528aed27ebc9a26a2da79771ac8a075578', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 10:11:02', '2021-07-22 10:11:02', '2022-07-22 10:11:02'),
('8b5d6dadf51043dfe470058f0c00366eb541c3bf676ccfc76a6805ab80249e734bfe8c31436a3f8a', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 13:03:19', '2021-07-29 13:03:19', '2022-07-29 13:03:19'),
('8b7261e57ba3f2db4553bea5c8d4324005091b2d99374cf53e90f82a8ea1b7e43a28783a7cf02a42', 32, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-01 08:11:07', '2021-08-01 08:11:07', '2022-08-01 08:11:07'),
('8be641546cafe7c4ea82ce3b976a7833902ceb94675ce04bb6e701c1b196387d2b255179676e140e', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 13:14:38', '2021-08-02 13:14:38', '2022-08-02 13:14:38'),
('8c3d4ccae12f4aab6752d936b7b71b451507cf10b6e90eedcbba5d5635dbcaf980868eef63ee5470', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 11:20:36', '2021-08-03 11:20:36', '2022-08-03 11:20:36'),
('8d4196de870b13b9d878a836b8a1efe906380a0dd298caf90d6eacc4c6d2783ebff40ba35fad3556', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 12:30:02', '2021-07-30 12:30:02', '2022-07-30 12:30:02'),
('8dc12397134bc1959ff8a577cc88a86214a2ba85397c0a2c839942d9238a9a65f155b9775cbc5ce0', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-28 12:23:44', '2021-06-28 12:23:44', '2022-06-28 12:23:44'),
('8e1bb702775efada0299955b67c79ae3019cbe4afba8376937ea8416b7906d442357d3f0328d39aa', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-13 09:21:42', '2021-07-13 09:21:42', '2022-07-13 09:21:42'),
('8f7642172472d66b1fb38417326bdee90d2ff99117c3eef771c3bed2891c8eaaaf471523c4d844b0', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 06:34:10', '2021-07-21 06:34:10', '2022-07-21 06:34:10'),
('8fb3f6e2220c4231ee776728fe55eb0fa8b5f1db13bea91093de12109862cbdeca2723adf24ebd5d', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-01 12:43:37', '2021-06-01 12:43:37', '2022-06-01 12:43:37'),
('8fd502c73cc94f898e8108d45cf4468098d3eea43f5e0cee7ae7a2b031141c6267108ee7d38b1994', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 08:52:23', '2021-07-28 08:52:23', '2022-07-28 08:52:23'),
('8fe1aae7d967165bbde2c56b9af10ef8bac139db64bf5d7f650b46b809807eb657199deffc46e88f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 06:06:35', '2021-07-21 06:06:35', '2022-07-21 06:06:35'),
('8ff786b93b7911bd3af6df627d807d04064376c0c2a495c246f959138924701913f74801b7d153ef', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 05:47:57', '2021-08-06 05:47:57', '2022-08-06 05:47:57'),
('90857e91c86e37e3086be30d94f71aa7243566fb2c84527e00d5bfa948d135cbbbb0196c80d1f401', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 08:04:32', '2021-08-01 08:04:32', '2022-08-01 08:04:32'),
('91031bca873b2508637ed070191f9ef7c0c4d4db1bedb8ee8d1832ab2fb54afc196e0041da8d57e3', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-20 03:46:04', '2021-07-20 03:46:04', '2022-07-20 03:46:04'),
('9105ea9457e862edbdaefe179d87c87db6ce15b228534e05c64cd506d9f1b990d44b7b26a5bd752e', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-13 12:22:17', '2021-07-13 12:22:17', '2022-07-13 12:22:17'),
('91c35b047511eac6e3f73ded1e3040a45a79594015b8991592d5f4f9493f83b53e3556ba09252d5c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:18:11', '2021-07-30 08:18:11', '2022-07-30 08:18:11'),
('9213885c8a19eede1cce4af3cce8c347722fa10bff9f4eaa9ff53263f86b4f9a80906d366bcb1ff4', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 07:25:57', '2021-08-04 07:25:57', '2022-08-04 07:25:57'),
('92221389adaf9edb7b525ab24b0d12c676ce05691b0a233370217306782d1ae185a7693ddfbfd0e8', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 06:59:59', '2021-07-23 06:59:59', '2022-07-23 06:59:59'),
('927703f62fd8cccaffa210c775945c1d50c09230ad0283d58c492bea194fa42cdbfffcf2e0eb9804', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 12:57:14', '2021-07-23 12:57:14', '2022-07-23 12:57:14'),
('92deed09ae53c8e523874852af99ec3680de9c5fc931ed0d9e4e1d016fc2118d577dae9b96efdd52', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 11:46:38', '2021-08-06 11:46:38', '2022-08-06 11:46:38'),
('93103ad38eb6f7b2bf96f188c6e3c4bacddcf994c4ecc638f9afc2cc42d4ab43fbb20a4c2344e324', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 08:37:11', '2021-07-21 08:37:11', '2022-07-21 08:37:11'),
('93839c14ed08a26e057a47dd695e7288cf3873db00456b8a5fd000872dcd65922be657f7bef7f852', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 05:54:55', '2021-07-21 05:54:55', '2022-07-21 05:54:55'),
('93a98ec56d3fd56fdb1da1cfb37ec468464cdf97d3a988c6171877bbef2fbc79354fb21f4433ac1f', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 07:09:24', '2021-07-30 07:09:24', '2022-07-30 07:09:24'),
('93e448f2f9686fe5e4c88e1c5db51835c644d9416ee32c66f866a3a99cc8d8890b31caa08e6acf2a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:03:44', '2021-07-19 11:03:44', '2022-07-19 11:03:44'),
('93e50bcd830626102c91ec8b0e5617429f8060ee2124e66aebfd75ec9ab4308b440573d61d6b5a34', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:30:00', '2021-07-09 11:30:00', '2022-07-09 11:30:00'),
('94412d385b1445a65f7967fc3b851adbc82feffdee3b88efb99c428ae218c392ff612b65806289a8', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 03:50:49', '2021-07-30 03:50:49', '2022-07-30 03:50:49'),
('945f92d13dc1881a7020b7d5d9280642626adff4aa9f8a3800935428240ebdf180a23073d73a018d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 12:09:47', '2021-07-23 12:09:47', '2022-07-23 12:09:47'),
('94e4bce830235f79f8b3cc0b9410ff5f63c5b7902d10bf955aff33d2478288a5266fc30adb7fb16c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:23:49', '2021-07-27 09:23:49', '2022-07-27 09:23:49'),
('95572f189ed5fb89776e5f5a787ee1caff0f1638ff56e54c3f53666b370ca9b7df6a032d272fe349', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 05:07:45', '2021-07-22 05:07:45', '2022-07-22 05:07:45'),
('95eecba4739f6e2cf1bd2b1149d2db66e887bb8fcea02828adb6b71c6374b7d6b73beaa5617a12eb', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 09:25:46', '2021-07-21 09:25:46', '2022-07-21 09:25:46'),
('968c8880c165529ac46395e238f038cc61cf72412fe03a32716971c492195f5eaba6a3aec7dafd4c', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 14:13:40', '2021-07-23 14:13:40', '2022-07-23 14:13:40'),
('978a1fb99b9d9da45861f149a8c4efd51f0b3f98b35dbe2ebccf3155de84e20a285fb9aac9c58af8', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 12:20:44', '2021-07-27 12:20:44', '2022-07-27 12:20:44'),
('9801cfdd0e669c1a0212d04d82d0271d46de233531bb0b73cb07edd798854edf3fe4bc96b4782eda', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 11:56:22', '2021-08-04 11:56:22', '2022-08-04 11:56:22'),
('988b49c6050e4226602aace8d29e33a6b791d04965bf27749cb33f68ed80b80f4d6f9e350d02c1d8', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 03:44:15', '2021-07-28 03:44:15', '2022-07-28 03:44:15'),
('98eb67ad06908928d734ebaa778eeb7745f68f142e31b709e140c8b4b97be245a8bf86b622be8696', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:04:36', '2021-07-19 11:04:36', '2022-07-19 11:04:36'),
('9a0059c64e8c6788a8b987e7299b4003765e756fb8267d8c03ecddff3925d8719629114da69a63a2', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:29:53', '2021-07-09 12:29:53', '2022-07-09 12:29:53'),
('9a3ceac57bd4e3c49c01fc4388ec0fea3b5fbc8aa2e7448de36d1c2e7b74d5838e22fdfccaca23a1', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:07:58', '2021-07-19 11:07:58', '2022-07-19 11:07:58'),
('9b168aabc775e090c67fbee9f6ec5ccba7766644e187a5328087f98e0fae13cd848de38752718a3e', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-24 10:28:23', '2021-06-24 10:28:23', '2022-06-24 10:28:23'),
('9bbcd15c4086cc23193312bd6e182f600a8d65a4879e0c3e417560517f8a9c7c79058f5c308323fb', 17, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-31 05:06:20', '2021-05-31 05:06:20', '2022-05-31 05:06:20'),
('9c7d0c3c89b20d48b42bc712bd164adff64eb91a9aa6615ae5a0a1fbf47dd11c9441e811b0564d20', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 11:23:51', '2021-06-29 11:23:51', '2022-06-29 11:23:51'),
('9ca49a61a541b341dc0a23a2b72cfdae9e6ff0130b2322c242e495c9306537fac2abdbe7d94a4001', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 09:09:18', '2021-07-30 09:09:18', '2022-07-30 09:09:18'),
('9cab09925c53104c97f0c14c954c226f18a01cd66372063b865bb5ec89f14b8f0aee2b4ddc90b891', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 11:32:57', '2021-07-23 11:32:57', '2022-07-23 11:32:57'),
('9ccaa629ac7315e51f7f7acb5bf4494307a58e689228b9d2e3022d4bf50f89901dabe7dd78527057', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:37:02', '2021-08-04 08:37:02', '2022-08-04 08:37:02'),
('9e4e50ed58ae5cc6b50bbfa5edc2e266766a626da1d4f728a6dd11049216ebc9a1b1c2611037c235', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 09:03:00', '2021-07-23 09:03:00', '2022-07-23 09:03:00'),
('9eacdb0b181e47eb330274c9a5c9f466b781245eeb158017a0d2d157a0cf273934d4e54990aa5544', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 07:10:29', '2021-05-11 07:10:29', '2022-05-11 07:10:29'),
('9f487baf551382745ccaa72de0606b1fef1b2686641208ecaf5f2a97192595ca0cf0cc35bf38390b', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 13:10:10', '2021-08-03 13:10:10', '2022-08-03 13:10:10'),
('9f71a4537943a61a16e26b91140f74fd96985aaf0c2e0199d6b8f63ac502a5089b029bc112b5e797', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 07:28:31', '2021-07-21 07:28:31', '2022-07-21 07:28:31'),
('a07739588144874a941383ec302acd554f509d08394300d23a346f4130577cdf828a6c508186f8e8', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 06:30:21', '2021-07-30 06:30:21', '2022-07-30 06:30:21'),
('a12b7266eed3c8f5bbe1f594103b51fdc86128b701c71f88cabb9de99f3648a17ebc194a7df04449', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:07:30', '2021-07-21 11:07:30', '2022-07-21 11:07:30'),
('a132dc1c92b384d3606bd8b4c6a8eb6d145fc42f1af09f6818ea1a832fe8510e9457ecc9d161b72e', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 05:52:56', '2021-07-28 05:52:56', '2022-07-28 05:52:56'),
('a20bd34d8c5330f0a876c07eebc8f9225b8d3bacabc5ed8a90a8869dce53f0dd25e6ba00be968af8', 4, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-11 12:27:44', '2021-05-11 12:27:44', '2022-05-11 12:27:44'),
('a22bb79f8225020dfe91df99c7c7bef924f3b605217037cdf149bd6edb2380daa834de663aabe585', 16, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-31 04:48:31', '2021-05-31 04:48:31', '2022-05-31 04:48:31'),
('a28e9bf49f24cc42877c560dcd4c6a0413126c1cc88525c918684bbdefbcd4a4446bada6ebdc07d2', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-27 06:56:13', '2021-07-27 06:56:13', '2022-07-27 06:56:13'),
('a2e0f7109f8ae513f1225385811d16252ed032fb258df6cd809c6263130fc8720f4747e5e51c37d7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:32:27', '2021-07-22 11:32:27', '2022-07-22 11:32:27'),
('a30aec9bc7db1d3f2a16bf144b7f44d46f50719126180bc2e8e5e6924ab77270726e7f06bcd6cb20', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 09:40:03', '2021-08-03 09:40:03', '2022-08-03 09:40:03'),
('a402d745ff208fb7eefc830e673f6019625746f0b6582b26892f6c78f46e33076f4789d3baaaf54f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 09:08:18', '2021-07-02 09:08:18', '2022-07-02 09:08:18'),
('a478acbf5ab1890330a850f61135b864ee7c1d644d3e601b6deee93a1920c0203917ff5eb7074154', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-29 08:52:33', '2021-06-29 08:52:33', '2022-06-29 08:52:33'),
('a4a786764dc5c1ce2d6ea8be8720e710661cd95ad75278eac41adb75c1b4a0d4180e069dc2c35cfb', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 12:53:24', '2021-07-28 12:53:24', '2022-07-28 12:53:24'),
('a4be66bc6aa7e9568b433282897ddb1849b8cdf047f90635a09a51f4a8e72e5475d63ce98a9b6850', 6, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-05-28 08:56:12', '2021-05-28 08:56:12', '2022-05-28 08:56:12'),
('a5e145346026b541667d2436be335607f91883ea5bf472ae375331880b0835696fb25c629470dc75', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:27:32', '2021-07-22 11:27:32', '2022-07-22 11:27:32'),
('a662c7f8ce15a5c886412b2a2f3a629a10de411b586cdd2ac5ca92632306b2e9905e9ea769f714ef', 26, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-12 13:50:07', '2021-07-12 13:50:07', '2022-07-12 13:50:07'),
('a668eb9f9ed6e78ca676bea9e4fa7425fa6c4f80e1f3c0ae3bf3e202e3dd37c730e3076aaf27c3fc', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-29 10:31:18', '2021-06-29 10:31:18', '2022-06-29 10:31:18'),
('a6aaf1e1afcdf2e51333a3153f5db233f5d6ebed14ced13b8c1491fb63109c0521ee9ceda42149d6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 06:51:30', '2021-07-22 06:51:30', '2022-07-22 06:51:30'),
('a732bbedaaf0d306d424a8163945df4d3f308016270812705346839ab381817b028814314a296b1e', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:54:12', '2021-08-04 08:54:12', '2022-08-04 08:54:12'),
('a894b0e4851cb3a81f9bc9b43e20a3f4209304a9bf0977259ef39011d550186478ae347f87745a75', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 12:11:42', '2021-07-23 12:11:42', '2022-07-23 12:11:42'),
('a8daec423fcb242fa7dbee95df1108dfa56bf97533da4ef9aa9d396a8fd62f175efe138e259f1ac3', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 13:36:30', '2021-08-02 13:36:30', '2022-08-02 13:36:30'),
('a9efcfe894c2bb726c609562b1703337d113d68822a5d3cff78280524a53e2cd90dd4cc4f5f3e118', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-29 05:10:27', '2021-06-29 05:10:27', '2022-06-29 05:10:27'),
('aa192c1fc988ec92487130df4f7bdeb5e946f9e521307e888ea5b078dd9cc24bc25feddd0f84a95c', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 07:56:41', '2021-08-01 07:56:41', '2022-08-01 07:56:41'),
('aa37b53e9b2302dbed0c1621cc04a351c88ea2fbc0b1a145035e1f8a392bdefbf04c2f8c77d7b980', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-28 12:28:40', '2021-06-28 12:28:40', '2022-06-28 12:28:40'),
('aacb3c001dd163f0d01859dc611ab17982cc3f671edaff7010b746e2d294ec7fde8ad89ac1523e9f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:02:49', '2021-07-19 10:02:49', '2022-07-19 10:02:49'),
('abda54f939e3919353dd8d9b209e08f7d725f75eb386564dd74f804202f88a947b2716bfcd418a7d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 06:11:13', '2021-07-01 06:11:13', '2022-07-01 06:11:13'),
('add09b3c75c3a1d372eda5bb785ff5d5283a572a8ce73f2b2a30ea1ab5303e030dffd02a2a7570b7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-28 05:56:54', '2021-07-28 05:56:54', '2022-07-28 05:56:54'),
('ae7332de99e9b6b032f61277b7f37fbe8a9ff588ff1edcc3e92b28a75bb7991c958d1d927b1d3b60', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-17 06:20:29', '2021-05-17 06:20:29', '2022-05-17 06:20:29'),
('aeda47246a4f93fc068a5650e1939677e8dedba3fb0ce123b0bfdd978fa555d6264d2f80ebcade3f', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:40:45', '2021-07-22 09:40:45', '2022-07-22 09:40:45'),
('aef7f86f8ca8fe5800142090d8d3201c0ed78f6f548a18f700f668ba93ceb0fe1147f6a7e71891c3', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 10:50:08', '2021-07-22 10:50:08', '2022-07-22 10:50:08'),
('aefd97dc6f0a2a8a87eb0a27780e3e9adb3c4735b4ef51537d160c67c6601742d5af3b998e71bb6c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:52:11', '2021-07-09 11:52:11', '2022-07-09 11:52:11'),
('affc4f367f37e0e1d59d408794a3ddfbb62c830b1c9c13a3ebfd00d69f81a3dece24772cef0a17c8', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-05-31 12:05:15', '2021-05-31 12:05:15', '2022-05-31 12:05:15'),
('b07fe289673de4bd71edef1d5d8791cf44ce3f5ab4d880886e4ed11495a6fddbee2fbf6d12e815b5', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-01 06:23:39', '2021-07-01 06:23:39', '2022-07-01 06:23:39'),
('b08986fac914dcdb189f2b776080ee41bb703451f288d1d585f31e5c3637b8fee03648d6f5c11469', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-29 05:13:32', '2021-06-29 05:13:32', '2022-06-29 05:13:32'),
('b0cc58d8cf819a6ae1da82dc2157dbb24e370426f1de2fb4df6702b4fcf8b9795f2246d2c17a3058', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 13:26:12', '2021-07-22 13:26:12', '2022-07-22 13:26:12'),
('b163991d06577743f510bad55842c5a634e74faca55ae401cf07fc7e57c38b9caaf239e3dbe13204', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:44:58', '2021-07-27 09:44:58', '2022-07-27 09:44:58'),
('b305e26ecb66bd35b0a4576a9cda5c2250c0ba6b9932c894481af5f221bedf07139da46d83f17df9', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-01 12:55:26', '2021-06-01 12:55:26', '2022-06-01 12:55:26'),
('b4042ceef24046ea8a894fc4cb31ef5fd0104982ef4362d274c3190c65af9561c8e1bf4f9b264224', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-25 15:40:39', '2021-07-25 15:40:39', '2022-07-25 15:40:39'),
('b4414ba3033017464d156011fc9622fe82555b6a9f6ea7530010e9ae765ac3a22f959d5b5b543720', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 04:59:30', '2021-07-23 04:59:30', '2022-07-23 04:59:30'),
('b493a93298eec4b3f2b2e9404a4376e858315b449ab32ee43d181c9996cf6f88a6685275593f3039', 37, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 10:16:02', '2021-08-03 10:16:02', '2022-08-03 10:16:02'),
('b4d09b2d89040bb45e793e4a5649017fb15533dc7292c1ed643d907852525a6ca6294c2bedcefbcd', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-13 11:26:01', '2021-07-13 11:26:01', '2022-07-13 11:26:01'),
('b50df7846b06065f56f0b8615f064aec693f1c34c4683fcb661197a9aa9d371823eaa79424e6bb74', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 06:45:56', '2021-07-30 06:45:56', '2022-07-30 06:45:56'),
('b5323e4403ac8ef88327ce8aa5d3759b70842e30fc25611a3b0ed1c5061f78d5da3a4833f9f95fa7', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 05:06:38', '2021-07-23 05:06:38', '2022-07-23 05:06:38'),
('b5c4b307bf95bf36cfbe9be7ff76ea7cc4d6ede1ae18cc57e3cb00f5850fa80059ca64ebf7e69e49', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 04:40:57', '2021-08-05 04:40:57', '2022-08-05 04:40:57'),
('b6487c38e09ee6f80f4fbfcc6dbb6496b59c918674e670d0ad1d4e6e5db6a0a9eccaa0e2d67f5ced', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:02:09', '2021-07-30 14:02:09', '2022-07-30 14:02:09'),
('b6cc6b90a5bf2fc8a13844f426302b8ad6696df3fb4025af87f62decafef3e7b459e87f9cb141fe2', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 06:38:29', '2021-07-22 06:38:29', '2022-07-22 06:38:29'),
('b6f8fc6421de7fde194f9dbad2383659b24f404d69575bef92ca80da9336e15cfdad160246e47bfc', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-23 11:42:14', '2021-07-23 11:42:14', '2022-07-23 11:42:14'),
('b75691be3a17ef948c19d228593f0cd6ddaf6901c618324ea3c16784670b40e5592bcf9820a5c5ff', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-02 10:25:29', '2021-08-02 10:25:29', '2022-08-02 10:25:29'),
('b953aebe1fd3f6c9e1097076b1172a47873850142ad6a63f610f59f9fb5bd29036b3f1b100441a92', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 07:11:53', '2021-07-30 07:11:53', '2022-07-30 07:11:53'),
('b9aef24250992426b44ed5dfe55d5f0028f11090d4570769d132a398d8a04bd6233f7b52256b3baa', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:33:32', '2021-07-30 14:33:32', '2022-07-30 14:33:32'),
('ba68de863f28022ed43c0488008cfc341b61a2aa8988dccbddc44b001566f1fec057d4238de6c11f', 19, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-23 07:10:33', '2021-07-23 07:10:33', '2022-07-23 07:10:33'),
('bb0710e57d2846230ec723b821b7296a037f1fe3ee8f89e7ec8d39c56a5f9d43108c6ea9e2f21dd6', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:21:16', '2021-07-22 09:21:16', '2022-07-22 09:21:16'),
('bbbca168e93bb8b59dc9892bd3b8d1774f7f3a5b055b49b0480a482eaab77bb906bc00e512375b95', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 08:53:58', '2021-08-04 08:53:58', '2022-08-04 08:53:58'),
('bbd9d89e56b7f8f895e43636839245cd4c37e48ca2f4401123008c0bda1a8bf122f5865c54ca9bd8', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-29 09:23:10', '2021-07-29 09:23:10', '2022-07-29 09:23:10'),
('bc1e1f61aa01318ff018739956b9ef1abf266ca917e02cb75312b7295cf8f2aa72ad6f4e5495c2b7', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 10:39:51', '2021-08-06 10:39:51', '2022-08-06 10:39:51'),
('bc412871501e07585f8351a1a22778043c09c641ce7955036f6bfb6f53d91e20bb69459d5a48daf1', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:29:13', '2021-07-28 13:29:13', '2022-07-28 13:29:13'),
('bcf5919bda596b2d712f12ebc3abe526b890ac5f240f5ce6ce025b040dfa9bd3073cc9feb9809a0e', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 08:24:46', '2021-07-30 08:24:46', '2022-07-30 08:24:46'),
('bf851983cba02143e650514848be20f4436cba1142eb6e90a97afbf74610bbfe1697ee5439df0c22', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:47:57', '2021-07-22 12:47:57', '2022-07-22 12:47:57'),
('c0502984069c3958cd023cfd1672e64a2c4eea57280b577b8d95d1b89f4cc4c08a068aa36211941d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 07:21:47', '2021-07-21 07:21:47', '2022-07-21 07:21:47'),
('c0da88adc32a52787c3eb1d949e3ac7de74dba4a0c6a30f674677de582f942dbb790b1b4d9103daa', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 05:03:03', '2021-07-22 05:03:03', '2022-07-22 05:03:03'),
('c101ec4f3e3cf183fd2f29f61a02a15205de2ec9c949701ad3f273b64cb4b2538d3d954dac6d3b3f', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-24 13:20:03', '2021-06-24 13:20:03', '2022-06-24 13:20:03'),
('c1a5bd25b21cdc16b4a41a612acd272dea3548bde9bad515a683612ebf3469970fb81fd8f81baad7', 32, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-01 07:54:15', '2021-08-01 07:54:15', '2022-08-01 07:54:15'),
('c1e98b29f10db47de03f9d9d1003ebddb3971e7efc44ec694d0ac2c5547b702c58575ee14398223f', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 09:40:47', '2021-07-21 09:40:47', '2022-07-21 09:40:47'),
('c21c1be5e672540dd5fcc71a47184637fc84c1e24c9d84e175402c29ca760a65a880353ed3e1e522', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 14:13:32', '2021-07-23 14:13:32', '2022-07-23 14:13:32'),
('c25e830c7b1a95c360168aef3ad47269bb8b31d9b936efa940ce284fefc295f2bb0827a949609ae4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-28 10:18:06', '2021-06-28 10:18:06', '2022-06-28 10:18:06'),
('c2d30b008281b0a4f28b2c2242603d9d4880b179028c02a8487e093bdc0903df7609c33ff0fcde27', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 12:18:26', '2021-07-21 12:18:26', '2022-07-21 12:18:26'),
('c3b526a8265687040ceafd43997323d0b02a48324e88fba001676e94e02a879028ba609ba42bd8e4', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 14:00:33', '2021-07-27 14:00:33', '2022-07-27 14:00:33'),
('c409ac843cebc5387f57a971783db2b43edbb6ef4fb17bc0bbdd1bf359cc5586becaa77ae3874b69', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-01 04:05:22', '2021-07-01 04:05:22', '2022-07-01 04:05:22'),
('c4140791b5e79640ae52f0b3ed540eaf0b846cca5c79690321ee3d9f32b26066c260ec1f74a43e95', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-01 12:36:26', '2021-06-01 12:36:26', '2022-06-01 12:36:26'),
('c42ac9ea3324adc2f707a5c6d2159f58a4de17911d955912f3184f39e35cf7a83026eba5534933aa', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 12:50:55', '2021-07-27 12:50:55', '2022-07-27 12:50:55'),
('c59a022d04c8f1d395ffa1f69bfc9fd4a6507ec33bf425f67c605b3b625f923f36473f3f8609a3c3', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 07:03:50', '2021-05-11 07:03:50', '2022-05-11 07:03:50'),
('c5caec462ddb4bb6e9186b66dbfeff38f07720eaeaf459c25b323cbba266a5bd42a3532deb3c620a', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:34:35', '2021-07-30 14:34:35', '2022-07-30 14:34:35'),
('c67a5b53e65cd6e536aecd70d4ef165c59adf88de317792c4ed9e2f5628bd5b6dbfade9a85f5f815', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:23:09', '2021-07-01 10:23:09', '2022-07-01 10:23:09'),
('c6a71e1da245b813eabe6075c7a51e734ce358c29e6e09071a2db95192f9171f91259c1ffbf04f45', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:42:04', '2021-07-27 09:42:04', '2022-07-27 09:42:04'),
('c877b8d1a838ec159efff58762de2ed39b91760a92db8293ec17b2e91ba7174532bab45cd0633cb6', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 06:55:28', '2021-05-11 06:55:28', '2022-05-11 06:55:28'),
('c8ed5d1f4e809ff69c130f7004c49b37be7048ba368d7911cdbddc4aa722de25739140443ea99ae4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:44:18', '2021-07-22 09:44:18', '2022-07-22 09:44:18'),
('c9d351f78477075237b5b127d7dcd9b887a7c7ea5b588cde5e7bf319695036aeea35e6f3a0125b33', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 10:48:04', '2021-07-21 10:48:04', '2022-07-21 10:48:04'),
('cc2e249cfb20377ced81cdbc9b7fc9b7a7748e7969785cc98307bff1022dafb65f9fbc0e439a10cd', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-26 12:58:19', '2021-07-26 12:58:19', '2022-07-26 12:58:19'),
('cc91bc844de817b703327d80d87c4b3917f60bc5863422f1e387ec8fe3dd9e73e05b5d514d03c090', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 04:41:49', '2021-08-05 04:41:49', '2022-08-05 04:41:49'),
('cc9b46215a63053ec92da095d90b0ab5b08d6e132951aab6696b9d1029f09399eac7fecd1526c48e', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:15:01', '2021-07-21 11:15:01', '2022-07-21 11:15:01'),
('cce831c8c06bd8abf6b988e3fc157cf80692537aad572b20575c61c8102b57a6f2612414ce5a6147', 4, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-11 12:51:27', '2021-05-11 12:51:27', '2022-05-11 12:51:27'),
('cceea39f6b86f1b91791b4ed482d57e608a503b61e58e738b4abe18ce64798580a41b1cd292a0b8c', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 07:07:36', '2021-07-23 07:07:36', '2022-07-23 07:07:36'),
('ccf36b386aef0d4581d35df0f5bfafadd0c50d28ec25efd0d826de61b40cfe49c64eede54c05cb32', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-30 07:25:30', '2021-06-30 07:25:30', '2022-06-30 07:25:30'),
('cd6f34bf4c48d69c6b8771d26d05b8d6f5966f85da71a6322d382151968a9eb07f457fd412128606', 25, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 09:46:44', '2021-06-29 09:46:44', '2022-06-29 09:46:44'),
('cd9ee1e7cd7f62ea0e36ba3d68c543ce62b76368f9872dedbeabf0f549e3840accfb25db3ccb8cb3', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 08:48:18', '2021-07-01 08:48:18', '2022-07-01 08:48:18'),
('ce743e5ba9dd9355c4e600560282228c41a5a6053edb4d58e97b81569e6d375d6c4170dc61fc77d1', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 05:47:27', '2021-07-21 05:47:27', '2022-07-21 05:47:27'),
('ce90e271f68bdcac3e32d65d6b94e505ac5832a3424c6b86ec0e71b5b5769fca911e617a5bda9514', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 06:03:15', '2021-07-28 06:03:15', '2022-07-28 06:03:15'),
('cf5e3087b3950afc29242835d20b5d42322517f916817147888d96ef44cbfd4e325ab77372cf37ce', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 13:19:58', '2021-07-22 13:19:58', '2022-07-22 13:19:58'),
('cf6f5057038ffe721e9eb124b0732988cceec66b5114f52621475f72573f23040ba27f97a5e3a66f', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 10:46:46', '2021-07-28 10:46:46', '2022-07-28 10:46:46'),
('cfcda71ad06234d082abf09f0fbf7b09876e53e6d1cc77361d464f733f26146fcba3ee125b52fa7d', 12, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-17 04:33:53', '2021-05-17 04:33:53', '2022-05-17 04:33:53'),
('d01c5d2228370b382fb0976849f6882f6683a827263a57e73b6168787096837fd7a6b118d2eb6eda', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 11:51:11', '2021-07-09 11:51:11', '2022-07-09 11:51:11'),
('d16a353a25a599b3ffe140780692d89a69d78ced278c63307dd80c6383666c9ed6d476e6d1f6b5a7', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-20 04:56:25', '2021-07-20 04:56:25', '2022-07-20 04:56:25'),
('d1cdf3833d87b11c872f796fde9e79c1a582752245a1d33b5cc6de8048bd8b68b280bcd0bf9b52cb', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 06:20:21', '2021-07-28 06:20:21', '2022-07-28 06:20:21'),
('d2fa5b386ad682f501c7006cfe9443ffb2abf30cf4c074f504b4495de62fcf6da19a34bfc5b2aac7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 10:44:23', '2021-07-02 10:44:23', '2022-07-02 10:44:23'),
('d31233bead3d588128b2e7ab6a4b76f692a5790533d4c0eb00dabca52f51b74a2f5dc4453e83482a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 06:22:31', '2021-07-30 06:22:31', '2022-07-30 06:22:31'),
('d3634dfdb0e4fd05b10316aa32e1d3e85b865f408f902779740415f6019199e5835adc193e2911ea', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 12:58:03', '2021-07-22 12:58:03', '2022-07-22 12:58:03'),
('d37c75737be5698e95c4e6d3f4b3de11087bfb69838da272f4981e47c949be3319926c1f508154ed', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-02 09:07:38', '2021-07-02 09:07:38', '2022-07-02 09:07:38'),
('d3de456ce9e4489fa6e0c78b739675102f0bd52811644689d887dbaa44d771a3aabd0ba0b0f9988e', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:49:25', '2021-07-27 09:49:25', '2022-07-27 09:49:25'),
('d41fe1b8eeb1d45ee4f138b1a9b72efe3f3a567a431cd76df305673ac80b55d2807fea4ec14f5a79', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-22 04:39:18', '2021-07-22 04:39:18', '2022-07-22 04:39:18'),
('d4803bf3dfe4b08e032d8e5640b59903fce1c5eff7bbd2b9dd7fdcf7767bf6f33e1129805604da46', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 10:03:44', '2021-07-09 10:03:44', '2022-07-09 10:03:44'),
('d539f1f6ff44808694ef18ab577ceb5b8003872639d93353d32aa3c35461e6097b8850f483b69348', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-12 12:58:45', '2021-07-12 12:58:45', '2022-07-12 12:58:45'),
('d5570d0eb9f79ea67ea98a4867451bdf2dda68d3d6cc6c2a269733839b607ea1b918c8932041a942', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-27 10:55:45', '2021-07-27 10:55:45', '2022-07-27 10:55:45'),
('d5eac547e4748430faa3dcfd51f0819ffb10cebc28f4378df45f541df6d5cb909d5a03a95316eb1c', 39, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-03 13:05:10', '2021-08-03 13:05:10', '2022-08-03 13:05:10'),
('d611a54e60ce37a8f79c459e0346e094a26bd264248f94a9d69ba74bcc69a78ba600d671d385caba', 9, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-01 12:54:36', '2021-06-01 12:54:36', '2022-06-01 12:54:36'),
('d65386400c7e9e91281c436ff1bac86e3f7e0c33d8f0d12e3d79f42731489d495284d60a06c62c08', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-02 11:23:05', '2021-07-02 11:23:05', '2022-07-02 11:23:05'),
('d67a85eee43d7297e4e3147a23338e1d929cbe028cb80817042033ca60d1a5fe12327280717d3b74', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-03 10:20:06', '2021-08-03 10:20:06', '2022-08-03 10:20:06'),
('d67aa2c8acef465fc92dec5e6422af2647a1ca402fcbf402b8949f568401945c039c66edcd016e37', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:01:01', '2021-07-19 10:01:01', '2022-07-19 10:01:01'),
('d68b3605536dd111ad610f8f0aef7d95081f1bb8048bbb1ac4fae9ddccf134d2ea087b7878d5523c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:10:23', '2021-07-19 11:10:23', '2022-07-19 11:10:23'),
('d69de54a233a28dc26caff1732722ad09c2e20c74d6fad0508d94e0087aaf2ffafb5a8fcbc8b2d1a', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 11:40:49', '2021-07-27 11:40:49', '2022-07-27 11:40:49'),
('d727e60e05a1c933455374e9052df35f57defd2f807833720cdb6bf5dbf933a4513e8dd7d21ce9be', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:40:56', '2021-07-22 12:40:56', '2022-07-22 12:40:56'),
('d754601fbc100cb388a34bb530434b5ffd08c6bd68eeaebd41a2e09315ec9dc5712207cc708dbad7', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 11:13:13', '2021-08-06 11:13:13', '2022-08-06 11:13:13'),
('d755ea9482dd47fdf0ee4fb461b6297d757e42d71f73614786c44718b11f32df4988d295a9276289', 27, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-20 09:43:21', '2021-07-20 09:43:21', '2022-07-20 09:43:21'),
('d7a48fee0b53aeebc76fb630a598a23cb39ebf7eb81d9437bb62d2f9c40119efcd70db08abda0224', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 17:47:07', '2021-08-01 17:47:07', '2022-08-01 17:47:07'),
('d7b0f37f66c9dd8d0b061a1409763a9a6a6ea41645a765d7da41e996b54c76d500f82e53d76caec3', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 15:29:51', '2021-07-30 15:29:51', '2022-07-30 15:29:51'),
('d7ed02e04a82283fcd0a3eae07551156db2a98cd9f570e714fe90eefe49edbee9cd02c001e589258', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 15:57:01', '2021-07-30 15:57:01', '2022-07-30 15:57:01'),
('d9672e7cc7b8d9baba163a529bda9c5f6da51d74ba53ef7920513cc171b8ada41e530814cc377415', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 10:45:57', '2021-07-21 10:45:57', '2022-07-21 10:45:57'),
('d9a1b5be6fc546b887fcf57988c351144ae8347d60e2d940731e8b63b3e770a7bf43a7ab147038fa', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 04:35:57', '2021-07-22 04:35:57', '2022-07-22 04:35:57'),
('d9e31011c94d16627e0bbd6af8916beb38e8a0089352f805afc7d10d904a59efb005116a393dcb38', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 05:45:09', '2021-07-22 05:45:09', '2022-07-22 05:45:09'),
('da3f592d583fe6ef42f884f1530ac06c53184b7f245d67becd9a73d338d1d2524f3318195a8b4c32', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-25 12:31:02', '2021-06-25 12:31:02', '2022-06-25 12:31:02'),
('dafc3bb7dbdc9134781aabf9aa8886008f3f5f492fcb0f88de311b9d4fda1b118d8e536fdf8782e5', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-30 09:22:56', '2021-06-30 09:22:56', '2022-06-30 09:22:56'),
('dbb47460bd62ec2365bd1f0bb69c58c2a0e19d5eef32319770a3a4e4a617089c40dede4df31c9638', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 12:38:57', '2021-08-06 12:38:57', '2022-08-06 12:38:57'),
('dbd012213d9bc47b7e086693dd688f9a82a17a93d2f56da01ec102208687511323ada45d90c79a31', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 09:07:02', '2021-07-30 09:07:02', '2022-07-30 09:07:02'),
('dcc7b3d03912c798ac5fa4ac9ddcad68bc488d9ae650ae1c05e8ae48f734fd4d18e7021d5691f2de', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-24 13:20:59', '2021-06-24 13:20:59', '2022-06-24 13:20:59'),
('dce9af5576b254e1324facd51c8ede7a6528a2ce147543a8fb2955b23d4dd35be36eed05c64d0044', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 13:11:03', '2021-08-04 13:11:03', '2022-08-04 13:11:03'),
('dd0612ee446882f25f3f83cc12445dd5ad2ca24905a9c8ce8d6ed9a81d39f450cdf55c31bdf6690c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 10:21:35', '2021-06-29 10:21:35', '2022-06-29 10:21:35'),
('dd20c96f7656585cf96497a4206adee6935a16feb5808769c547eb3eccfa1325086a1f44d2626faf', 41, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-05 10:38:22', '2021-08-05 10:38:22', '2022-08-05 10:38:22'),
('de7f215c34d96a531f97e99ee10fda9004983b9a936cb8d8d173d556a6c1d155a72f59123d89913e', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-02 11:58:54', '2021-07-02 11:58:54', '2022-07-02 11:58:54'),
('df30d609383221927e944dedc98dbf03ef23e0795780bbba0640a4c921bbdb0fee678b653edb3a8c', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-05 09:51:42', '2021-08-05 09:51:42', '2022-08-05 09:51:42'),
('e10421fa3ef3fe817e0a62d7d713ccfe45703dffacbc00a5f996ab82b83f3b16633776e0d468d6d4', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:31:54', '2021-07-19 11:31:54', '2022-07-19 11:31:54'),
('e151262c31a576cc931ea35582d1704042305aa2ef99966887c8da0a7e01e6bea3a87951582b0888', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-02 10:13:26', '2021-07-02 10:13:26', '2022-07-02 10:13:26'),
('e223f0c51e4cbd8d2781376790994e76c440079452fc5d2652c216637679645e2b4222463d3ec3e5', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-12 04:01:28', '2021-07-12 04:01:28', '2022-07-12 04:01:28'),
('e2f35d4294ca8587082f1d61e2784ea4d4b89d4f1cb65017d1814aa88c44262deb94073002882b60', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 09:58:25', '2021-06-29 09:58:25', '2022-06-29 09:58:25'),
('e328b19fa6d3de01e729f01002b9f4a03414d78fa1dcbe64edf4b320c2e6dfab58dcc4c740509a5b', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-02 05:05:06', '2021-08-02 05:05:06', '2022-08-02 05:05:06'),
('e41068a5b5f6cf150284116e620e14a90f6e4267f5b2cfdcb55c10410c8c95f70758a20d60ffbfee', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 10:55:23', '2021-07-19 10:55:23', '2022-07-19 10:55:23'),
('e494f42727f7ddbc15abc6acf3b478cd38e3f906b571636da37541a1ccfdfb7d7b05e5b6a37d9a7e', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 06:43:03', '2021-07-30 06:43:03', '2022-07-30 06:43:03'),
('e4ab35d7bf45beaf6aeb8bfdf153d79fd10647053cb118da8398dd2a0a747f727b5a023511145d91', 1, 1, 'Charity-app', '[\"user\"]', 0, '2021-06-24 13:24:13', '2021-06-24 13:24:13', '2022-06-24 13:24:13'),
('e4be1100c8296802f866b4e06f3785507233d7fca2b85a4c10471512e932f2cd6bb1a80a5e1de312', 29, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 17:44:17', '2021-08-01 17:44:17', '2022-08-01 17:44:17'),
('e4eeae3aa2cb6ee7a3a989748a9e4d46b8acc8694ad090237ec4dcfc2f10eee7bb41b9f15fd3fbbb', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-08-03 09:42:47', '2021-08-03 09:42:47', '2022-08-03 09:42:47'),
('e4fe260618ec0abd881514af3addb4164c4f5a3865892e26c3eceb6335cb9bca3949c01a0dafd82c', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 04:15:51', '2021-07-09 04:15:51', '2022-07-09 04:15:51'),
('e582b3aecfb9ecdff86fdb1817b380f5b2db2fdd2dc7448bc1bf9574587e3c1714394ae7705905cd', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 10:23:42', '2021-07-27 10:23:42', '2022-07-27 10:23:42'),
('e58ea248725c150e1a998da0ece61153ba6205104e9b01e88c388bb569de08b1b680b52ca16667c4', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 13:15:40', '2021-07-28 13:15:40', '2022-07-28 13:15:40'),
('e5bb38210174a506051b2e0c7340ffebf059145e8998b8fa50b42fb5e55d8411b50916838c8c5761', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-02 10:33:19', '2021-07-02 10:33:19', '2022-07-02 10:33:19'),
('e692017a8121e04628d3f5b2f90f13175a05401cc7b64742a9ec0054dcc331043c8d8fcc0f4a900b', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 12:56:27', '2021-07-30 12:56:27', '2022-07-30 12:56:27'),
('e7020ae78f1a131a40cc051f9bbd8951efd12ec4885b390eeb76f9a03d3128bd93f398ae8cb1ba59', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-06-30 06:57:19', '2021-06-30 06:57:19', '2022-06-30 06:57:19'),
('e8067891b728140056146a7bc54c2dc4a269a9e685ba66615fc0d50162f7e5fc08fd5b226fae4de4', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 10:13:45', '2021-07-21 10:13:45', '2022-07-21 10:13:45'),
('e8566b005a0693e2ab8df640f41ca56d72bb7be9473c80f6928c33d5fe50bda39b2bbc933e4a8006', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 04:07:14', '2021-07-30 04:07:14', '2022-07-30 04:07:14'),
('e8efa8efb9a741370e3e543c11148611c050727e416593309ec1b739204cc633b155c0a902505be7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-15 11:13:03', '2021-06-15 11:13:03', '2022-06-15 11:13:03'),
('e92a92d5bd3751563c12fbdcb5d81f49fc9066600c8fe33bb8e9eee7dd8d4a8f375b2017dafc348d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-29 10:00:39', '2021-06-29 10:00:39', '2022-06-29 10:00:39'),
('e9f70e33d455b9cdf674a5d1506accb6b6e72dfbf9856adeed0f52626cfece4b41b060d79c3a2204', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-06 07:11:57', '2021-07-06 07:11:57', '2022-07-06 07:11:57'),
('ea806ccb65dac376c93ee3bcf3acba33eaacc6ea03ca65f89637fe7863d530752c94059dfe659e90', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 12:19:44', '2021-07-21 12:19:44', '2022-07-21 12:19:44'),
('ea98c8549047cfbe7c1eec2813af8df615bb2ec45ed659d8bdceaabc965752658b2872d97880a049', 25, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-21 06:36:35', '2021-07-21 06:36:35', '2022-07-21 06:36:35'),
('eaab21e8669c995dd4941ee7efa261db972e03a48b547ef0365b42579390003c5321c2dc33ced85d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-26 08:42:29', '2021-07-26 08:42:29', '2022-07-26 08:42:29'),
('ead9c5f769cbfa0741ecbb3a30a625b86efeebab9a308bbfc311a89038071c9ce7b6c75970927e71', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:16:51', '2021-07-09 12:16:51', '2022-07-09 12:16:51'),
('eb1a5e5ede01e168b516ac9ef71019de0b6bd5ae06073e21f57b073a529287b4fd11ab76847216f3', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-30 11:52:59', '2021-07-30 11:52:59', '2022-07-30 11:52:59'),
('eb8bc8f3e3ab2050a3eeed660b3d7d3f3336204d439c3aae90c92f61e2e32e6f0f06ec8c6ec7d590', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-09 12:14:27', '2021-07-09 12:14:27', '2022-07-09 12:14:27'),
('eba96e2db46a5a33ed9c4805da83175bdf083f1ebd959b9d9322f70844a1707cc7a892096f64be79', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 09:33:59', '2021-07-21 09:33:59', '2022-07-21 09:33:59'),
('ebb8475b4b1d664ddbf3e6c41b0c47c4657622b23be23fbf9f4287766895db7f885690fbda26e237', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 05:18:30', '2021-07-22 05:18:30', '2022-07-22 05:18:30'),
('ebd17f756214102b34b53e1ec2357efea572289a5702e9a42066a0532d0de47e93a600d78fc8e1ac', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 09:44:21', '2021-07-30 09:44:21', '2022-07-30 09:44:21'),
('ec121caa43b53ee0928f4dc294054be09fdc6bb7cd592debb444ea50b2ad22ff75cb43a857bcdf7b', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 05:13:34', '2021-07-23 05:13:34', '2022-07-23 05:13:34'),
('ecc0c2e69f4b9adbad08e31221891432724fe2695655b31e110574129f0589b066194e8dffb65b67', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 09:27:51', '2021-07-22 09:27:51', '2022-07-22 09:27:51'),
('ece19f568f31cea8c9bd900742b6e8d5b8b252e87214883dff9f22b5356b8a3a1d39db50ce240409', 12, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-17 05:20:03', '2021-05-17 05:20:03', '2022-05-17 05:20:03'),
('ed3d735a622a77ea1daee1e48a8f9df57837619cb0e47b7d133c544ab37b88b40743523ca6a4b4b7', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-25 15:29:54', '2021-07-25 15:29:54', '2022-07-25 15:29:54'),
('ed50784a8e8939a94b3df98b48413c7e6997a33ff434b2482a21c2613060865d9d47e9e28b2e0c90', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 13:49:53', '2021-07-30 13:49:53', '2022-07-30 13:49:53'),
('ed528d55168975413ca5eaa0f627b5207cf192a58a100440d6b1a961ef2cf6f5eb4956553e4c592c', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-04 09:27:19', '2021-08-04 09:27:19', '2022-08-04 09:27:19'),
('edd27f1acfe1e32024aa7913bfaf52181cdeaf8a3acc4f6d30af6e65bc41eb63588afb8fff793482', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 06:52:10', '2021-07-30 06:52:10', '2022-07-30 06:52:10'),
('ede139c1d63ae8356420b50d2a01159c5f458eb9835b6b1145b6d33697dcb0eb9822c28d525e58a8', 1, 1, 'MyApp', '[\"user\"]', 0, '2021-05-11 07:01:15', '2021-05-11 07:01:15', '2022-05-11 07:01:15'),
('ee1fdbc50c388e06ea0b58723299018e34c10757f0238d4ccb7b0678573b921f1fa7771a19922aa9', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-28 09:00:51', '2021-07-28 09:00:51', '2022-07-28 09:00:51'),
('ee266b2074cfe096072de29b3c083bb3abcff49457a7ad2fdb00697b6df476a302f8ccb8cedcb9d7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 12:51:16', '2021-07-22 12:51:16', '2022-07-22 12:51:16'),
('efa307530c5c193dcea2aedd2750806df50d2c0a65a94c595a3df5946b27f08e6efe182b159684a1', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 11:44:11', '2021-07-21 11:44:11', '2022-07-21 11:44:11'),
('f05ed23440ed63323201521f04e4e62e9da007c0eb5981aa1e6bc468d2b889f2737492e591b08857', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-01 10:22:12', '2021-07-01 10:22:12', '2022-07-01 10:22:12');
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('f0bab3982d40ff2c5b8989d09c2772ab032b339dba4f9be1e863505ff3abcce1338b5b97e1dac65d', 31, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-08-01 07:48:10', '2021-08-01 07:48:10', '2022-08-01 07:48:10'),
('f11dd938c7237528da86e2ddb51d08cbeac19ed4d014a85987bc7f62f85eacd02d8f9cde658d1878', 39, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 11:44:20', '2021-08-06 11:44:20', '2022-08-06 11:44:20'),
('f18984811cfc39bd3ccddbb57e2ff1f6829a3e2442467cdea9e3aecd52babe5da8f1988d2e17318c', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-21 05:51:49', '2021-07-21 05:51:49', '2022-07-21 05:51:49'),
('f1adf385c8a6eae241300b778a4607e1c7f63a13e84327019b5162b7a382b5f084c0c2b7fc6f1e21', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-01 17:28:19', '2021-08-01 17:28:19', '2022-08-01 17:28:19'),
('f27f1b2e7a00e6275de6b7ba5834f860228182b0640170efe32ac2cf945ec6234a2d60d254b8e9ca', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-30 05:11:30', '2021-07-30 05:11:30', '2022-07-30 05:11:30'),
('f2a06911e819ff2cd7a76661305f2f7092101878ee6fbe2c1f22a8d29adb444c291dfe0b4e81dd2e', 16, 1, 'Delivery-app', '[\"user\"]', 0, '2021-05-31 04:48:25', '2021-05-31 04:48:25', '2022-05-31 04:48:25'),
('f2f9dea80a9d780031f8d9e2899eefbea13679a507605fcbfd9c08e6cadef7c16daac3aaef27665b', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:35:26', '2021-07-22 11:35:26', '2022-07-22 11:35:26'),
('f3f1ee300faf5216ee35c8d3aac64886f7a3d4dbb37760644dc40672be57f1bb1d4fd5c86a618a60', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 06:55:36', '2021-07-30 06:55:36', '2022-07-30 06:55:36'),
('f49f8e45105467e3a6bbd6d2e9b5e205c06570eb960ea670af5d0b76fb0808d19722574475162775', 29, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-30 14:42:10', '2021-07-30 14:42:10', '2022-07-30 14:42:10'),
('f4a15395fed6ba1e75430b94e8b26178a0710c0b1fb9fe7d9d313b759b6bfcefd8b439e0a6fbf8a7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 11:44:41', '2021-07-22 11:44:41', '2022-07-22 11:44:41'),
('f4ac00dee477ae6a092eee1bdeece500376732db75f9306c82b7cef8a64406febec5ffd6fc0904e0', 1, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-06-04 12:23:39', '2021-06-04 12:23:39', '2022-06-04 12:23:39'),
('f7bdb1a9f937f4e00f2764626e0f47f7e29ba79b642971a0517300a3f836fd2355f0267cda2b0bb7', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-27 09:47:32', '2021-07-27 09:47:32', '2022-07-27 09:47:32'),
('f7ebaaa24db921bbcf96aa2c385d711e1e1b9955682d7bfaa50a8800e0b0e8fd6ec0d81911983324', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-09 09:44:16', '2021-07-09 09:44:16', '2022-07-09 09:44:16'),
('faa0409dfc9923be0f2f62a63594a466bd571b5a756ab3316e6bdf427f1a0fdf827b4e78b0a83455', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-19 11:39:19', '2021-07-19 11:39:19', '2022-07-19 11:39:19'),
('fb11b9d76dcccb26b2021b6ac43f8dcea5477479745290d2d3ef12609b7f46f678a0b38f3a5229a9', 10, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-08-06 05:07:33', '2021-08-06 05:07:33', '2022-08-06 05:07:33'),
('fd4f797b77515336ef85e35866e197208ce2843a44bf9aff3450731bed46904e67c992c975fa8593', 31, 1, 'Delivery-app', '[\"provider\"]', 1, '2021-07-23 21:45:00', '2021-07-23 21:45:00', '2022-07-23 21:45:00'),
('fe20c9a3292ad02090a1f81ef5b8151a9f015f4d08152273692b7534de7fdbd76a60abc19049902d', 10, 1, 'Delivery-app', '[\"provider\"]', 0, '2021-07-22 06:05:09', '2021-07-22 06:05:09', '2022-07-22 06:05:09'),
('feaa0c23cda87e677b275e160753a02ada1cd7af425f8484e31584a2009966f537369648e2c7db5a', 20, 1, 'Charity-app', '[\"user\"]', 0, '2021-07-30 11:54:20', '2021-07-30 11:54:20', '2022-07-30 11:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Charity-app', 'Cm59v4rY93rukbJxj1Ib1qjNJwHGOdFDovTT20AQ', NULL, 'http://localhost', 1, 0, 0, '2021-05-11 06:45:31', '2021-05-11 06:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-05-11 06:45:31', '2021-05-11 06:45:31');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `otp` int(11) NOT NULL,
  `otp_verified` int(11) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Type` enum('Initiative','Broadcast','Sodality') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_otp` int(11) NOT NULL DEFAULT '0',
  `document_verified` int(11) NOT NULL DEFAULT '0',
  `name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang` enum('EN','AR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `registration_number`, `country`, `city`, `location`, `contact_name`, `contact_number`, `phone_number`, `country_code`, `email`, `email_verified_at`, `password`, `status`, `otp`, `otp_verified`, `image`, `register_image`, `Type`, `remember_token`, `forgot_otp`, `document_verified`, `name_ar`, `country_ar`, `city_ar`, `location_ar`, `contact_name_ar`, `lang`, `state`, `device_type`, `device_token`, `created_at`, `updated_at`) VALUES
(10, 'Initiative', 'INI 7812', 'India', 'Bilaspur', 'Asr', 'Initiative', '+2345657654', '9988826933', '+91', 'testinitiative@yahoo.com', NULL, '$2y$10$DlmbMcqTp2QvnAtppYKsV.0MjI33usAPjGOj9iiVAEvUwzeX/NKcG', 1, 1234, 1, 'public/profile/CGQcoByans4pAMHaIUXjhz3MBefaEODUzAw1vU4x.jpg', 'public/document/tfQxKu4tgOUI4l4J0uWTowdFem6A14A9zZeMWXND.jpg', 'Initiative', NULL, 1234, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'ios', 'csAhDhyq-k2eoOBIsaS1eq:APA91bE9aqAgGXOERlerNH4cCUC9tpD2Mtt1B1Gl-vja8xY0l9fQbtKgtvGqffqTV0mvlgUaVSIzkJ3C77Pal5MZToaCEn91KhWMlyEvCeBUBAzYBZw87LPEx6arKmvdFDRPc6qSR8Ew', '2021-06-04 11:42:18', '2021-08-06 05:07:33'),
(13, 'Test Iniative', 'INI 7812', 'India', 'Asr', '3b2 Mohali', 'Test Contact Name', '+2345657654', '9988826933', '+91', 'testinitiative1@yahoocom', NULL, '$2y$10$OQxjZQHm0h/Yd0FDOdZ72.AtSLxGg3l0AlpN2fs536HdYcioxv5O.', 1, 1234, 1, NULL, 'public/document/SwIgtm8y6p1Fumaiu3UceyMm3BMhD9P5c8o52IsO.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'AR', '', 'android', NULL, '2021-06-04 11:42:18', '2021-08-04 10:31:10'),
(15, 'Test Iniative', 'INI 7812', 'Pakistan', 'Karachi', '3b2 Mohali', 'Test Contact Name', '+2345657654', '9988826932', '+91', 'testinitiative2@yahoo.com', NULL, '$2y$10$OQxjZQHm0h/Yd0FDOdZ72.AtSLxGg3l0AlpN2fs536HdYcioxv5O.', 1, 1234, 1, NULL, 'public/document/SwIgtm8y6p1Fumaiu3UceyMm3BMhD9P5c8o52IsO.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-04 11:42:18', '2021-08-04 10:38:36'),
(16, 'Testing', 'Test No 4321 Register', 'India', 'Asr', 'House No 4562, Street 2', 'yushi f', '6144467051', '9164587392', '91', 'driver56789@yopmail.com', NULL, '$2y$10$WMjz9pOfdpTpUtCp4ltD2evuoBwwmmHgMWZDGjsPHn1NaSg0MnFUm', 0, 1234, 1, NULL, 'public/document/MfgfAIJBL6xuaimRenfAqQe9jz4QbLr4kzJwxH48.jpg', 'Initiative', NULL, 0, 0, NULL, 'alhind', 'أمريتسار', NULL, 'yushi f', 'EN', '', 'android', NULL, '2021-06-09 11:59:12', '2021-06-09 11:59:12'),
(17, 'Test Iniative for testing purpose and so on to check the lenght vallidation', 'INI 7812', 'India', 'Asr', '3b2 Mohali', 'Test Contact Name', '+2345657654', '9988826931', '+91', 'testinitiative1@yopmail.com', NULL, '$2y$10$ghxP9397Nirb8gbadl5BL.0PQJUXH1SV0V0SRnB4YxOFLMUPPN6za', 1, 1234, 0, NULL, 'public/document/1P9xGb9pvkP3XxFXbRuAMJsI6Y83B5IUxAXNA07u.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-18 09:18:21', '2021-08-02 10:17:35'),
(18, 'Manish Kuma', 'INI 7812', 'India', 'Asr', '3b2 Mohali', 'Test Contact Name', '+2345657654', '9988826937', '+91', 'testinitiative2@yopmail.com', NULL, '$2y$10$i58nZ8uPVR/CwjopJqoizOXl3cQD.CyBS/HpY6DsHvgGBSAKGUYAO', 0, 1234, 0, NULL, 'public/document/8JCT0ej1kPxZPFzclSummFV3T2GkPy7ZFMQO2Rwg.jpg', 'Initiative', NULL, 1234, 0, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-18 09:45:42', '2021-07-02 11:22:38'),
(19, 'Manish Kumar', 'INI 7812', 'India', 'Asr', '3b2 Mohali', 'Test Contact Name', '+2345657654', '9988826939', '+91', 'testinitiative4@yopmail.com', NULL, '$2y$10$Oi36GmX/tCfNiIrfEZeKGOLYEl98WJRyKnHN1PjY6JhG6jVCaICNO', 0, 1234, 0, NULL, 'public/document/taBI58mrgtzrdB7WHkoKC9jRZ5zv8EK0kS4AczTp.jpg', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-18 09:46:47', '2021-06-18 09:46:47'),
(20, 'Manish Kumar', 'Test102', 'India', 'Hamirpur', 'Mair, Hamirpur, Himachal Pradesh, India', 'Test Person', '+919857080340', '9857080341', '+91', 'test@yopmail.com', NULL, '$2y$10$pgfybXdg1I.QDETd1YEaU.DftEHwA/7g0IewNECkz2thIowy5Nu2W', 0, 1234, 0, NULL, 'public/document/mEq5K3kIZB3N8y8GTC5W98AfIKwcmPxwM7nseuh7.jpg', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'ios', 'eMZCixBzl0xhrT-Mm4I85B:APA91bHSCSuGIriyPdcUqhGe6pcXmFwyFOMymeBDFvW-nUUFZ3pe8M_OGSU8ZV5IVj4NpsZk4wSklXD1V0OysdDJEbDyOtkLrOu8P6U2spKSEaeEg8VOXkgAVc35YP7BC-LqOsokLg3v', '2021-06-18 10:01:11', '2021-06-18 10:01:11'),
(21, 'Manish Initiator', 'Test523', 'India', 'Hamirpur', 'Mair, Hamirpur, Himachal Pradesh, India', 'Test Person', '+919857080341', '9857080342', '+91', 'test1@yopmail.com', NULL, '$2y$10$XUQdPtgYXQPPPVpK8tGCD.tcTYAznsTZ8UrCgESNWRlhdX7pD8EO6', 0, 1234, 1, NULL, 'public/document/l8FcuFqJGiYLStC22uhIs3EZOoiXUltmcK5CRUyL.jpg', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-21 03:41:33', '2021-06-21 03:41:43'),
(22, 'Manish Kumar', 'Test123', 'India', 'Hamirpur', 'Mair, Hamirpur, Himachal Pradesh, India', 'Test Person', '+919857080300', '9857080301', '+91', 'test11@yopmail.com', NULL, '$2y$10$Dx9w52NyODsBSEmMn3e6Y.XP1VJqK8AfQetdJ5omPQzVQCsTh68yu', 1, 1234, 1, NULL, 'public/document/tQRPzv5PvkATlsVyfK6ufSBfQaOTOx123cLfbQaQ.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-22 09:40:01', '2021-06-22 10:07:29'),
(23, 'veejay', '12345678', 'India', 'Mohali', 'Chandigarh, India', 'middhas', '+2499501766002', '9814856002', '+249', 'middhas@yopmail.com', NULL, '$2y$10$bfXhgbe4ZhkhisONeF5Gj.VWWdfnkzF/g00AsFjSMMY/Vshg8jy7K', 1, 1234, 1, NULL, 'public/document/0sPc2RlsoyNDuEuxj6WACmu9rNsXNyIeO5VX4wdx.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', 'ddgonWeMQSeUb3HWhJXB-9:APA91bE6r4CSlMRYrGRm8RwYoXA2QIaNp8-sAXkWXSCyv1sZoAVD5jzCl-xHKxZ4kaBTJV6zK2iVyx2560ScFpYmGcbMJme2t7beIy6Q1xDamuYtjmy5hT8gT-Diq2y1rNGj3fLrSBvo', '2021-06-23 04:31:38', '2021-07-21 10:11:36'),
(24, 'initiator', '0987654321', 'India', 'Chandigarh', 'Chandigarh', 'Taawon Initiator', '1234509876', '1234567890', '+1', 'tester@yopmail.com', NULL, '$2y$10$wn8PB0hd8hMBjSIl/kr3Oe5qXSoIZNV3EEctFFisKnhHI0y7A6izS', 0, 1234, 0, NULL, 'public/document/h5LU0daQijgRKuT8O0bgqz6qPeCrLN3YVwccn7VL.jpg', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', '', 'android', NULL, '2021-06-23 12:13:03', '2021-06-23 12:13:03'),
(25, 'Munish Vas', '37373', 'India', 'Amritsar', 'Amritsar', 'Munish', '864356777753', '8556088299', '+91', 'munish@yopmail.com', NULL, '$2y$10$OPSy6R21UIM3CCJL2VTHIuAeAzfLkedgbTVO4UEmJCE/z3ZF9S6G.', 1, 1234, 1, 'https://vipankumar.in/charity-app/storage/app/public/profile/6ejR073hg8ZPA03Pee5xjWL2wGZW1LJIDT8JJC5s.jpg', 'public/document/zXChtXvbLjtBreIWJpbmvuWNvpRaWjGx2ANx4Joe.jpg', 'Initiative', NULL, 1234, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', 'cchvlWwITpmc7b2mj_kZ1v:APA91bFVIeKG8McbQuCHxkCPJDjBrYPbt-dJ2tnew81vrS4NBRGWu-zdBWTIz53-dnjDCTuuu6PB7Kbayqm0iVjsn-ymTcrLtaWMfSchMTxUtIN8T4jxB6ttFxmh8qeFjQ_7GL4eiJDS', '2021-06-24 10:22:31', '2021-08-06 11:40:51'),
(26, 'veejay', '123456', 'India', 'Sahibzada Ajit Singh Nagar', 'Sector 71, Sahibzada Ajit Singh Nagar, Punjab 160071, India', 'mmmm', '+2499501766008', '2580369741', '+249', 'vijay12@yopmail.com', NULL, '$2y$10$x7L6pbbmzuSed4hnBwiI0uWNF5vv6eWQuJNPE5ZdtgcsR54EBytRu', 1, 1234, 1, 'public/profile/kHMFx8QdvxzEmTUK2p4SJXjUPdtpjhYH9RGtBwlo.png', 'public/document/Lgy9MXcfTHle9x51WzGM3cC518AYLNHO7awN7AXl.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', NULL, '2021-07-12 13:45:25', '2021-07-19 04:43:24'),
(27, 'newmunish', '28838282', 'India', 'Bilaspur', 'ndndnd', 'hsjsjd', '+2498546499743', '8546646446', '+249', 'newmunish@yopmail.com', NULL, '$2y$10$fbN7vfVQB.9sZpVrqV/PguOHEsDVog/2VjUUwrsBYD6zKHfbpQF2i', 1, 1234, 1, NULL, 'public/document/qJSO6s4cxNt05ClYnVfkKytDAj8Zr8dK4ggl1mnL.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'android', 'etjfRldFTl2W5V17G2ZTLV:APA91bEJRvXHUaY1rpd4rXC44I74mYDFPWUNmlN-L0s9nm-AYtqeo5lU6HQndmcPzVwoZD-mM3WpG0xtf_vBP-B1VhWzYjz49PEJz1iZlCFwZDaDHPc7zKjVvUPTWAT4FGyjjOs-8Wd1', '2021-07-20 09:19:30', '2021-07-20 10:05:02'),
(28, 'sheenam', '36363737', 'India', 'Bilaspur', 'Sas', 'Sheenam', '+24985446463123', '95949464664', '+249', 'sheenam@yopmail.com', NULL, '$2y$10$PijOnX7O5ni3j4G9J3gsEOmGPn5Vq3uJ3hnuIzavl3VUn6xl.KnMq', 1, 1234, 1, NULL, 'public/document/zfyxXA38Gqmm0VCtrDuyl5C6USZFkeez5z50rsmv.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'android', 'fpHgntPkQyKCHcimwjPPLK:APA91bHWlzzuxQWDukNZgvcDHMRriTBGenCjJPitLeNZBJb2iGj3i6nDEqU69rrhR0Tf-23m2xQtw_JVXFq-jieOhHm-4uYM4S_bOIgEjGnHvXuAf9dxTHknqihmvgzX2S5L9ojU9Xky', '2021-07-21 06:47:27', '2021-07-21 07:07:41'),
(29, 'vvv  testing', '1234567890', 'India', 'Moga', '78 mohali', 'vijay', '+2497009860723', '7258369258', '+249', 'vjmohali@yopmailcom', NULL, '$2y$10$75IPU7Xo2uB9/EYTcV5oRegzbUegAcS4XkRRpKchzP9KGqdoqR0q6', 1, 1234, 1, 'public/profile/sDG9VyL9zZ3BoHC0eesQsCLRgPTGsBdim49RqiD9.jpg', 'public/document/Hwc4zuEXycs3Zfj7ytOxbmkugVOrlGUrIMFbsEeT.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', 'fLinkkMERByBKA1e8h-Aao:APA91bGRPkmq6MKPDjktJ11im7p0WVmC7bnbaQ94K0GDdCl6tQiqeTGVq0F7j-LvIxf67dheCWN3Y1eyh7kOvSPbxJpH4MIASDiZ2jdTtiUcBe8m2XzM6C1e7L0dWHeSRtyhmbQWHqup', '2021-07-21 09:35:39', '2021-08-06 10:34:15'),
(30, 'vijay', '3636262', 'India', 'Bilaspur', '1711, phase 5', 'Veejay Test', '+2498564312698', '5464343116', '+249', 'vijay11@yopmail.com', NULL, '$2y$10$GQ98Zq03MB2GfGRar6s7pey9luo.JTTc3sy9C80rLphPkrgUowIb6', 1, 1234, 1, NULL, 'public/document/Dmqy405gDt3knX7GjLAbKMUKuv52hIqBfvmobdq2.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'android', 'fz8i6dVhTNSJVxsWKwNuU-:APA91bGtbdV9TMKbAbh0ST-syfREqnRFW0hG9syXrviEzojZcs48CoFvh0TS90gdjLA9VgVrpET0diUwQbPLC0_y8OQ8A6vbeDJzD8ftkhg2sLOmEdfCf9ZzPY2W9F3Ru1lOccdY2cTm', '2021-07-21 11:58:12', '2021-07-21 12:14:21'),
(31, 'Initiative', '779292020', 'India', 'Mohali', 'Khartoum', 'Initiative', '+2499988099985', '912193538', '+249', 'ahmedamfa@gmail.com', NULL, '$2y$10$WjarqkxVbKzgLMrc2Up6Buqbl3O3hBzn//T7AlgYpOskwdV4gKsS6', 1, 1234, 1, 'public/profile/iKwHoBmozgaWogdvnWk6rLwRgJDODbRenDpeWvFB.jpg', 'public/document/5dJCyYrNxCY46YiTNazZ3WE7e0dBBF43GNxIqgeq.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'ios', 'e6a7LQW8wUt9nwD1T-Eow-:APA91bHOzvWIRpJp21UN93PXp10LvOrG5DVLct5qbVqlPWrcF56O6H5vtkYqzF89j1n0I0LC2Uuz0uHQrIRbwxFGSGBOG9SHDGJDXJD7qiaEmHaU0aTJQ_MEvXijGp7MPcdZpVAqzz07', '2021-07-23 21:42:12', '2021-08-05 09:53:05'),
(32, 'vijay21', '1525255363', 'India', 'Moga', 'moga', 'vijay21', '+2499814856008', '9501766885', '+249', 'vijay21@yopmail.com', NULL, '$2y$10$ksa8BrPYfCS1NAZ.5GOkBOCaq5cZH1xnMvCklrEg.ibCXFxhzMjB2', 1, 1234, 1, NULL, 'public/document/gu8Cr6SdklKPrMMmJka1eS6zhHqJsXx7NfF1fiZ0.png', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', NULL, '2021-07-26 13:03:15', '2021-07-26 13:05:25'),
(33, 'Manish Moudgil', 'test125', 'India', 'Bilaspur', 'Bilaspur India', 'Akhil Sir', '+2499857080300', '9857080300', '+249', 'manishtest@yopmail.com', NULL, '$2y$10$FtP2Sw2dAHD2/sqHM4VlOe9x93jFolqOQgVY3YPlS8pKYCVb5rswa', 0, 1234, 1, NULL, 'public/document/z199hE7RmelrjCRHHHzEnWKIqOznVrvVQEZrDkZr.jpg', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'android', NULL, '2021-07-30 16:03:58', '2021-07-30 17:43:05'),
(34, 'cause', 'uwuehdrhsj', 'Bangladesh', 'Banga', 'Ludhiana', 'behejeje', '9592529400', '9592529400', '+91', 'chandu@mailinator.com', NULL, '$2y$10$If1A1ToOs1gT3i6Rhv7GFOgCSVof940/3EBsuC.s.DSoH8Dfht8Ha', 1, 1234, 1, NULL, 'public/document/ooAn7o7R2V8ZxYjerGYgTV6DhWOY5reW3o1nqzre.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Dhaka', 'ios', 'eMZCixBzl0xhrT-Mm4I85B:APA91bHSCSuGIriyPdcUqhGe6pcXmFwyFOMymeBDFvW-nUUFZ3pe8M_OGSU8ZV5IVj4NpsZk4wSklXD1V0OysdDJEbDyOtkLrOu8P6U2spKSEaeEg8VOXkgAVc35YP7BC-LqOsokLg3v', '2021-07-30 17:17:40', '2021-07-30 17:27:56'),
(35, 'vvv', '3467888777', 'India', 'Ambala', 'bbjkkk', 'vvvvv', '985236478', '9814856008', '+91', 'vj@yopmail.com', NULL, '$2y$10$/GJY9rQp.Seh9E9DLlkljOeTQ9tBHesr29ABJG2cWO9rWmCR25VJW', 1, 1234, 1, NULL, 'public/document/WLXTYJ0VlHi79yr3ZXqM7w5FL7wHe8LZ7td84UMq.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'AR', 'Haryana', 'android', 'djA61cO7S6WljCejecLF1c:APA91bHF8P6vXLfJyaM5bzzShrPYSAxRT2_nb_qkWxWRwSxl4rJWrivq-gC5likmdZ2GIvPoCeRZvKSy0aUDTb6o8_FLk_zu8w-3XhkRhT0RxeBytEVYsTeV-VOi1R6jFx--4k-Mcqu0', '2021-07-30 17:37:01', '2021-08-02 10:12:46'),
(36, 'Test user', 'test', 'India', 'Bilaspur', 'Bilaspur Himachal Pradesh', 'test', '+2499857080350', '9857080351', '+249', 'test100@yopmail.com', NULL, '$2y$10$5w0RqCgl1cwRsAbo1Izi4u96wlEUkuStU.LHRcp3pihlLanpANMx2', 1, 1234, 1, NULL, 'public/document/HZQke8uKnP3B7Ezh5tHze930fVjDiyCSdfZWSIf0.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Himachal', 'android', NULL, '2021-08-02 05:57:03', '2021-08-02 10:17:16'),
(37, 'middhas', '8123455677', 'India', 'Moga', 'kk road moga', 'vvv', '+2499501766056', '9501458025', '+249', 'middhas11@yopmail.com', NULL, '$2y$10$zUVQRukaQX1Cyr/9vY3il.LUQFhfpnNnxwnzOoynIWusMmbDc9PDS', 1, 1234, 1, NULL, 'public/document/DnTDMQBMAHFnwslxffqf4V3tfBCHAikPk5V14LaH.jpg', 'Initiative', NULL, 1234, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', 'dS57qA7RRBaesUYPGqkHqY:APA91bF1NUAqIsQaBUWo0moPDbUbZvIA3wInEJHcQHv3XcMBHxH_a1rCY_grMljD5jlEKdqfvthWstyXjMN96trnHAkUc-AqFeLBfk2gekQaL9Wy3Dg7fupw-iSiAu9sPYg-Pv0RV99G', '2021-08-02 09:17:58', '2021-08-03 10:16:02'),
(38, 'middhas', '122344555', 'India', 'Mohali', 'mohali', 'mmm', '+249950146685', '952368412', '+249', 'middhas5@yopmail.com', NULL, '$2y$10$4i6chqH6GJDeF7k80sJQseKNaD8VqdWLNByvSmX7iMsGGGaKhxoGy', 1, 1234, 1, NULL, 'public/document/a4o8w4b2hUl47YAJPqOo2T63fhQpbJQ2owk65YbD.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', NULL, '2021-08-02 13:22:04', '2021-08-02 13:24:40'),
(39, 'vijay', '34567788', 'India', 'Mohali', 'mohali', 'vvv', '+2499501717095', '9814856005', '+249', 'vijayint@yopmail.com', NULL, '$2y$10$mJBwB3o3kJeCwLmn2VlYOOPVNHfUBQxRsQ8hsBZeY43tzdj/KXgnO', 1, 1234, 1, 'public/profile/418AP3LhQc3ydxXIWHjiRK8TAphrrlVSFkfn6qbQ.jpg', 'public/document/XkpMQwP5jJ3Rmn1hZbgJK1BNhWZYCZlINtzDZW0A.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Punjab', 'android', 'cRB7qbUISBOfucqyzZcuzR:APA91bEvdG_yuhzKpcoVzCmaHJMWVi9T3yhJbmnEcMPxkZKqONJgNAX58EJSUTpE3evXpb_PTeGg0N_FFKIQRz1RMOXLG7QYeFySYCKtvwlcGVYWDBht_Pt42TCA4ZlPC2qZJfPvpNPh', '2021-08-03 09:21:45', '2021-08-06 13:11:00'),
(40, 'renzy devin', 'rtgs0001', 'The United Arab Emirates', 'Abu al Abyad', 'gthhu. yuu uu.', 'sheikh abu ajmal', '+9717542758658', '7589536890', '+971', 'renzy001@yopmail.com', NULL, '$2y$10$PhUec5LqD.Wx/95o9mRAj.LesET.voTiKlD5O5AiCz.l3zNIfIu2a', 1, 1234, 1, NULL, 'public/document/qHv6CEVshj7BtrZG15MJrfzfpNv2f3PvuK5qMuFZ.jpg', 'Initiative', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Abu Dhabi', 'android', 'cZ4TmEJvQOugNxDK-XpG2v:APA91bF1a72oJZ2H1Mst8kF2H1EFnCEIENdVZrg0fXfNpJ8vIoM3xBEKwQolP8eGi8CkSISANHq-Buacvm9pbbyosIhwySVvnjsGF8h_H3OH3f3io4X5tF-JRcjpr--rWcCmvMrfSF8W', '2021-08-03 11:02:18', '2021-08-03 11:06:43'),
(41, 'nishant', '123457', 'Australia', 'Manurewa', '2188..Gold homes', 'Nishant', '+919988589823', '9856328656', '+249', 'nishant.pathania@yopmail.com', NULL, '$2y$10$QC1ZiKrMwbotJhdo8zyij.UY71MaKyiK59GmixB8YPjGHCflUNora', 1, 1234, 1, NULL, 'public/document/eIRmNBsZJqH25cH5pVF6U96pdkytRsJqBLJ5s7jc.jpg', 'Broadcast', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, 'EN', 'Sydney', 'android', 'c3SOKlusQZK1El4LAGCxze:APA91bGTl7WwZESCB1bo7T2WnbMPbw4fNOW_2u6mmSPKaSkukbCnrEfbNpfQ1YHzrkpj_RL6FSTWFXkvgmFyJm3uFenfs6ow5HBbr4uYTj2iwHKOLNh78e6Z4nuuRER49yTGnLhDX_Zm', '2021-08-05 10:29:52', '2021-08-05 10:40:47'),
(42, 'alaa', '123', 'Sudan', 'Khartoum', 'msm,', 'alaa', '123', '12345678977', 'mndn', 'alaa.abdelsamad@unisoft.ltd', NULL, '$2y$10$d65bWMmhjFmVkj8cF6KzzO7eAsVPrv3sRHwJCE5ljp7ic0Q2.QnKa', 0, 1234, 1, NULL, 'public/document/a0ptAJZspfMrptWm0hNXHcgElr3oNBawNojFvAwP.png', 'Initiative', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'EN', 'Khartoum', 'android', NULL, '2021-08-05 10:53:01', '2021-08-05 10:53:01');

-- --------------------------------------------------------

--
-- Table structure for table `provider_notifications`
--

CREATE TABLE `provider_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('case_followed','case_contributed','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_notifications`
--

INSERT INTO `provider_notifications` (`id`, `matter_id`, `provider_id`, `title`, `title_ar`, `description`, `description_ar`, `image`, `notification_text`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 7, 10, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 26-July-2021', 'case_followed', 1, '2021-07-26 06:25:47', '2021-07-26 06:25:47'),
(3, 7, 10, NULL, NULL, NULL, NULL, NULL, 'Testing case Case was contributed by a new contributor At 26-July-2021', 'case_contributed', 1, '2021-07-26 06:36:00', '2021-07-26 06:36:00'),
(4, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case was contributed by a new contributor At 26-July-2021', 'case_contributed', 1, '2021-07-26 11:04:18', '2021-07-26 11:04:18'),
(5, 16, 30, NULL, NULL, NULL, NULL, NULL, 'testing 2 Case  has a new follower At 26-July-2021', 'case_followed', 1, '2021-07-26 12:32:08', '2021-07-26 12:32:08'),
(6, 15, 30, NULL, NULL, NULL, NULL, NULL, 'Testing demo case Case  has a new follower At 26-July-2021', 'case_followed', 1, '2021-07-26 12:32:22', '2021-07-26 12:32:22'),
(7, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 27-July-2021', 'case_followed', 1, '2021-07-27 04:05:35', '2021-07-27 04:05:35'),
(8, 22, 10, NULL, NULL, NULL, NULL, NULL, 'revert Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 11:44:07', '2021-07-27 11:44:07'),
(9, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 11:55:34', '2021-07-27 11:55:34'),
(10, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:08:26', '2021-07-27 12:08:26'),
(11, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:19:35', '2021-07-27 12:19:35'),
(12, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:20:31', '2021-07-27 12:20:31'),
(13, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:22:15', '2021-07-27 12:22:15'),
(14, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:23:37', '2021-07-27 12:23:37'),
(15, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:24:21', '2021-07-27 12:24:21'),
(16, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 27-July-2021', 'case_contributed', 1, '2021-07-27 12:27:15', '2021-07-27 12:27:15'),
(17, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 28-July-2021', 'case_contributed', 1, '2021-07-28 09:29:17', '2021-07-28 09:29:17'),
(18, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 28-July-2021', 'case_contributed', 1, '2021-07-28 09:55:52', '2021-07-28 09:55:52'),
(19, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 28-July-2021', 'case_followed', 1, '2021-07-28 10:59:01', '2021-07-28 10:59:01'),
(20, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 29-July-2021', 'case_followed', 1, '2021-07-29 13:46:37', '2021-07-29 13:46:37'),
(21, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 29-July-2021', 'case_followed', 1, '2021-07-29 13:46:54', '2021-07-29 13:46:54'),
(22, 27, 29, NULL, NULL, NULL, NULL, NULL, 'SSS Case was contributed by a new contributor At 30-July-2021', 'case_contributed', 1, '2021-07-30 07:13:08', '2021-07-30 07:13:08'),
(36, 8, 10, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:35', '2021-07-30 09:21:35'),
(37, 8, 15, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(38, 8, 22, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(39, 8, 23, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(40, 8, 25, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(41, 8, 26, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(42, 8, 27, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(43, 8, 28, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(44, 8, 29, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:36', '2021-07-30 09:21:36'),
(45, 8, 30, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(46, 8, 31, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(47, 8, 32, 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(48, 18, 10, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(49, 18, 15, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(50, 18, 22, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(51, 18, 23, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(52, 18, 25, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(53, 18, 26, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(54, 18, 27, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(55, 18, 28, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(56, 18, 29, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(57, 18, 30, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(58, 18, 31, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(59, 18, 32, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(60, NULL, 10, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:33', '2021-07-30 10:55:33'),
(61, NULL, 15, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(62, NULL, 22, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(63, NULL, 23, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(64, NULL, 25, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(65, NULL, 26, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(66, NULL, 27, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(67, NULL, 28, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(68, NULL, 29, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(69, NULL, 30, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(70, NULL, 31, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(71, NULL, 32, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(72, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case was contributed by a new contributor At 30-July-2021', 'case_contributed', 1, '2021-07-30 14:20:34', '2021-07-30 14:20:34'),
(73, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:23:44', '2021-07-30 14:23:44'),
(74, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:23:50', '2021-07-30 14:23:50'),
(75, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:23:53', '2021-07-30 14:23:53'),
(76, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:23:57', '2021-07-30 14:23:57'),
(77, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:04', '2021-07-30 14:24:04'),
(78, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:19', '2021-07-30 14:24:19'),
(79, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:29', '2021-07-30 14:24:29'),
(80, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:31', '2021-07-30 14:24:31'),
(81, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:34', '2021-07-30 14:24:34'),
(82, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:39', '2021-07-30 14:24:39'),
(83, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:41', '2021-07-30 14:24:41'),
(84, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:44', '2021-07-30 14:24:44'),
(85, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:24:57', '2021-07-30 14:24:57'),
(86, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:25:57', '2021-07-30 14:25:57'),
(87, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:25:59', '2021-07-30 14:25:59'),
(88, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:01', '2021-07-30 14:26:01'),
(89, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:03', '2021-07-30 14:26:03'),
(90, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:13', '2021-07-30 14:26:13'),
(91, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:17', '2021-07-30 14:26:17'),
(92, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:19', '2021-07-30 14:26:19'),
(93, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:38', '2021-07-30 14:26:38'),
(94, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:26:50', '2021-07-30 14:26:50'),
(95, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:27:04', '2021-07-30 14:27:04'),
(96, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:29:37', '2021-07-30 14:29:37'),
(97, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:30:27', '2021-07-30 14:30:27'),
(98, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:30:30', '2021-07-30 14:30:30'),
(99, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:32:36', '2021-07-30 14:32:36'),
(100, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:33:09', '2021-07-30 14:33:09'),
(101, 24, 10, NULL, NULL, NULL, NULL, NULL, 'Test case 1 Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:34:08', '2021-07-30 14:34:08'),
(102, 22, 10, NULL, NULL, NULL, NULL, NULL, 'revert Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:35:40', '2021-07-30 14:35:40'),
(103, 14, 29, NULL, NULL, NULL, NULL, NULL, 'Gal Blader MMM Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:38:28', '2021-07-30 14:38:28'),
(104, 18, 10, 'sdfsfdsaf', 'dfsdfsdfsdfsdfsdf', 'sdfsdfsdf', NULL, 'public/profile/U0Ah6tMGCBeMgtMmECJtpTjt15tQwgsJL3IifOtu.jpg', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 14:40:29', '2021-07-30 14:40:29'),
(105, 18, 10, 'rtretre', 'rtreter', 'reterter', NULL, 'public/profile/H0xvJVl6kaGzHeQG0w4qrSwFEoLUS1BayAIwMd9D.png', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 14:41:12', '2021-07-30 14:41:12'),
(106, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:47:30', '2021-07-30 14:47:30'),
(107, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:54:15', '2021-07-30 14:54:15'),
(108, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:54:41', '2021-07-30 14:54:41'),
(109, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:55:07', '2021-07-30 14:55:07'),
(110, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:56:31', '2021-07-30 14:56:31'),
(111, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:56:34', '2021-07-30 14:56:34'),
(112, 7, 20, NULL, NULL, NULL, NULL, NULL, 'Testing case Case  has a new follower At 30-July-2021', 'case_followed', 1, '2021-07-30 14:58:37', '2021-07-30 14:58:37'),
(113, NULL, 10, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:17', '2021-07-30 15:03:17'),
(114, NULL, 15, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(115, NULL, 22, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(116, NULL, 23, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(117, NULL, 25, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(118, NULL, 26, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(119, NULL, 27, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(120, NULL, 28, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:18', '2021-07-30 15:03:18'),
(121, NULL, 29, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(122, NULL, 30, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(123, NULL, 31, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(124, NULL, 32, 'Hello', 'Hello', 'Hello', 'Hello', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(125, NULL, 10, 'Enjoy Nightshift', 'Enjoy Nightshift', 'Enjoy Nightshift', 'Enjoy Nightshift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:14:35', '2021-07-30 15:14:35'),
(126, NULL, 10, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:22', '2021-07-30 15:15:22'),
(127, NULL, 15, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(128, NULL, 22, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(129, NULL, 23, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(130, NULL, 25, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(131, NULL, 26, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(132, NULL, 27, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(133, NULL, 28, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:23', '2021-07-30 15:15:23'),
(134, NULL, 29, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(135, NULL, 30, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(136, NULL, 31, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(137, NULL, 32, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(138, NULL, 10, 'Happy sunday', 'Happy sunday', 'Happy sunday', 'Happy sunday', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:18:06', '2021-07-30 15:18:06'),
(139, NULL, 10, 'Happy sunday', 'Happy sunday', 'Happy sunday', 'Happy Sunday', '', ' New Notification from Admin At 30-July-2021', 'admin', 1, '2021-07-30 15:20:35', '2021-07-30 15:20:35'),
(140, 30, 29, NULL, NULL, NULL, NULL, NULL, 'test notification Case was contributed by a new contributor At 02-August-2021', 'case_contributed', 1, '2021-08-02 09:19:59', '2021-08-02 09:19:59'),
(141, 32, 39, NULL, NULL, NULL, NULL, NULL, 'Treatment Case was contributed by a new contributor At 03-August-2021', 'case_contributed', 1, '2021-08-03 09:44:54', '2021-08-03 09:44:54'),
(142, 32, 39, NULL, NULL, NULL, NULL, NULL, 'Treatment Case was contributed by a new contributor At 03-August-2021', 'case_contributed', 1, '2021-08-03 10:02:15', '2021-08-03 10:02:15'),
(143, 22, 10, NULL, NULL, NULL, NULL, NULL, 'revert Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 10:11:28', '2021-08-03 10:11:28'),
(144, 22, 10, NULL, NULL, NULL, NULL, NULL, 'revert Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 10:12:16', '2021-08-03 10:12:16'),
(145, 30, 29, NULL, NULL, NULL, NULL, NULL, 'test notification Case was contributed by a new contributor At 03-August-2021', 'case_contributed', 1, '2021-08-03 10:25:00', '2021-08-03 10:25:00'),
(146, 27, 29, NULL, NULL, NULL, NULL, NULL, 'SSS Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 10:44:25', '2021-08-03 10:44:25'),
(147, 27, 29, NULL, NULL, NULL, NULL, NULL, 'SSS Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 10:44:28', '2021-08-03 10:44:28'),
(148, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 11:45:16', '2021-08-03 11:45:16'),
(149, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 11:45:35', '2021-08-03 11:45:35'),
(150, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 12:05:01', '2021-08-03 12:05:01'),
(151, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case was contributed by a new contributor At 03-August-2021', 'case_contributed', 1, '2021-08-03 12:17:21', '2021-08-03 12:17:21'),
(152, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 12:35:21', '2021-08-03 12:35:21'),
(153, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 12:35:26', '2021-08-03 12:35:26'),
(154, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 12:35:56', '2021-08-03 12:35:56'),
(155, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case was contributed by a new contributor At 03-August-2021', 'case_contributed', 1, '2021-08-03 13:03:15', '2021-08-03 13:03:15'),
(156, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 13:16:26', '2021-08-03 13:16:26'),
(157, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 14:33:28', '2021-08-03 14:33:28'),
(158, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 14:33:31', '2021-08-03 14:33:31'),
(159, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 03-August-2021', 'case_followed', 1, '2021-08-03 14:33:34', '2021-08-03 14:33:34'),
(160, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 03:51:24', '2021-08-04 03:51:24'),
(161, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 04:11:23', '2021-08-04 04:11:23'),
(162, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 04:18:45', '2021-08-04 04:18:45'),
(163, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 04:18:48', '2021-08-04 04:18:48'),
(164, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 06:33:10', '2021-08-04 06:33:10'),
(165, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 06:38:16', '2021-08-04 06:38:16'),
(166, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 06:38:21', '2021-08-04 06:38:21'),
(167, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 06:38:24', '2021-08-04 06:38:24'),
(168, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 06:38:31', '2021-08-04 06:38:31'),
(169, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 06:45:10', '2021-08-04 06:45:10'),
(170, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 06:50:42', '2021-08-04 06:50:42'),
(171, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 07:00:10', '2021-08-04 07:00:10'),
(172, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 07:01:45', '2021-08-04 07:01:45'),
(173, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 07:05:18', '2021-08-04 07:05:18'),
(174, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 07:06:18', '2021-08-04 07:06:18'),
(175, 23, 31, NULL, NULL, NULL, NULL, NULL, 'Malaria Medicine Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 07:08:20', '2021-08-04 07:08:20'),
(176, 33, 39, NULL, NULL, NULL, NULL, NULL, 'stones surgery Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 09:36:09', '2021-08-04 09:36:09'),
(177, 34, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine test Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 10:13:27', '2021-08-04 10:13:27'),
(178, 34, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine test Case  has a new follower At 04-August-2021', 'case_followed', 1, '2021-08-04 10:14:40', '2021-08-04 10:14:40'),
(179, 34, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine test Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 10:19:20', '2021-08-04 10:19:20'),
(180, NULL, 10, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(181, NULL, 13, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(182, NULL, 15, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(183, NULL, 17, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(184, NULL, 22, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(185, NULL, 23, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(186, NULL, 25, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(187, NULL, 26, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(188, NULL, 27, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(189, NULL, 28, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(190, NULL, 29, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(191, NULL, 30, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(192, NULL, 31, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(193, NULL, 32, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(194, NULL, 34, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:36', '2021-08-04 10:27:36'),
(195, NULL, 35, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(196, NULL, 36, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(197, NULL, 37, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(198, NULL, 38, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(199, NULL, 39, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(200, NULL, 40, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(201, 35, 39, NULL, NULL, NULL, NULL, NULL, 'surgery test Case was contributed by a new contributor At 04-August-2021', 'case_contributed', 1, '2021-08-04 12:20:04', '2021-08-04 12:20:04'),
(202, 33, 10, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:49', '2021-08-04 13:02:49'),
(203, 33, 13, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(204, 33, 15, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(205, 33, 17, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(206, 33, 22, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(207, 33, 23, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(208, 33, 25, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(209, 33, 26, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(210, 33, 27, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:50', '2021-08-04 13:02:50'),
(211, 33, 28, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(212, 33, 29, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(213, 33, 30, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(214, 33, 31, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(215, 33, 32, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(216, 33, 34, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:51', '2021-08-04 13:02:51'),
(217, 33, 35, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:52', '2021-08-04 13:02:52'),
(218, 33, 36, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:52', '2021-08-04 13:02:52'),
(219, 33, 37, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:52', '2021-08-04 13:02:52'),
(220, 33, 38, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:52', '2021-08-04 13:02:52'),
(221, 33, 39, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:52', '2021-08-04 13:02:52'),
(222, 33, 40, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(223, 25, 10, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:17', '2021-08-04 13:06:17'),
(224, 25, 13, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:18', '2021-08-04 13:06:18'),
(225, 25, 15, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:18', '2021-08-04 13:06:18'),
(226, 25, 17, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:18', '2021-08-04 13:06:18'),
(227, 25, 22, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:18', '2021-08-04 13:06:18'),
(228, 25, 23, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:18', '2021-08-04 13:06:18'),
(229, 25, 25, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:20', '2021-08-04 13:06:20'),
(230, 25, 26, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:21', '2021-08-04 13:06:21'),
(231, 25, 27, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:21', '2021-08-04 13:06:21'),
(232, 25, 28, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:22', '2021-08-04 13:06:22'),
(233, 25, 29, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:23', '2021-08-04 13:06:23'),
(234, 25, 30, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:24', '2021-08-04 13:06:24'),
(235, 25, 31, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:25', '2021-08-04 13:06:25'),
(236, 25, 32, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:26', '2021-08-04 13:06:26'),
(237, 25, 34, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:26', '2021-08-04 13:06:26'),
(238, 25, 35, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:28', '2021-08-04 13:06:28'),
(239, 25, 36, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:29', '2021-08-04 13:06:29'),
(240, 25, 37, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:29', '2021-08-04 13:06:29'),
(241, 25, 38, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:30', '2021-08-04 13:06:30'),
(242, 25, 39, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:30', '2021-08-04 13:06:30'),
(243, 25, 40, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', ' New Notification from Admin At 04-August-2021', 'admin', 1, '2021-08-04 13:06:31', '2021-08-04 13:06:31'),
(244, 18, 25, NULL, NULL, NULL, NULL, NULL, 'rndhch Case  has a new follower At 05-August-2021', 'case_followed', 1, '2021-08-05 04:16:55', '2021-08-05 04:16:55'),
(245, 12, 27, NULL, NULL, NULL, NULL, NULL, 'Not Test2 Case  has a new follower At 05-August-2021', 'case_followed', 1, '2021-08-05 09:12:14', '2021-08-05 09:12:14'),
(246, 27, 29, NULL, NULL, NULL, NULL, NULL, 'SSS Case  has a new follower At 05-August-2021', 'case_followed', 1, '2021-08-05 09:34:06', '2021-08-05 09:34:06'),
(247, 36, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine 💊💊💊💊💊 Case  has a new follower At 05-August-2021', 'case_followed', 1, '2021-08-05 12:37:24', '2021-08-05 12:37:24'),
(248, 29, 29, NULL, NULL, NULL, NULL, NULL, 'CNN’s Case  has a new follower At 05-August-2021', 'case_followed', 1, '2021-08-05 12:39:17', '2021-08-05 12:39:17'),
(249, 36, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine 💊💊💊💊💊 Case was contributed by a new contributor At 05-August-2021', 'case_contributed', 1, '2021-08-05 12:52:01', '2021-08-05 12:52:01'),
(250, 36, 39, NULL, NULL, NULL, NULL, NULL, 'Medicine 💊💊💊💊💊 Case was contributed by a new contributor At 05-August-2021', 'case_contributed', 1, '2021-08-05 12:52:54', '2021-08-05 12:52:54'),
(251, 37, 39, NULL, NULL, NULL, NULL, NULL, 'surgery test data Case was contributed by a new contributor At 06-August-2021', 'case_contributed', 1, '2021-08-06 13:10:25', '2021-08-06 13:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `provider_notification_settings`
--

CREATE TABLE `provider_notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `all_settings` int(11) NOT NULL DEFAULT '0',
  `following_settings` int(11) NOT NULL DEFAULT '0',
  `urgent_settings` int(11) NOT NULL DEFAULT '0',
  `categorie_id` int(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_notification_settings`
--

INSERT INTO `provider_notification_settings` (`id`, `provider_id`, `status`, `all_settings`, `following_settings`, `urgent_settings`, `categorie_id`, `created_at`, `updated_at`) VALUES
(34, 25, 1, 0, 1, 0, 5, '2021-07-19 04:40:18', '2021-07-19 04:40:18'),
(35, 25, 1, 0, 1, 0, 6, '2021-07-19 04:40:18', '2021-07-19 04:40:18'),
(36, 27, 1, 1, 0, 0, 5, '2021-07-20 09:19:30', '2021-07-20 09:19:30'),
(37, 27, 1, 1, 0, 0, 6, '2021-07-20 09:19:30', '2021-07-20 09:19:30'),
(38, 27, 1, 1, 0, 0, 7, '2021-07-20 09:19:30', '2021-07-20 09:19:30'),
(39, 28, 1, 1, 0, 0, 6, '2021-07-21 06:47:27', '2021-07-21 06:47:27'),
(40, 28, 1, 1, 0, 0, 7, '2021-07-21 06:47:27', '2021-07-21 06:47:27'),
(41, 28, 1, 1, 0, 0, 8, '2021-07-21 06:47:27', '2021-07-21 06:47:27'),
(42, 28, 1, 1, 0, 0, 9, '2021-07-21 06:47:27', '2021-07-21 06:47:27'),
(43, 29, 1, 1, 0, 0, 6, '2021-07-21 09:35:39', '2021-07-21 09:35:39'),
(44, 29, 1, 1, 0, 0, 7, '2021-07-21 09:35:39', '2021-07-21 09:35:39'),
(45, 29, 1, 1, 0, 0, 8, '2021-07-21 09:35:39', '2021-07-21 09:35:39'),
(46, 29, 1, 1, 0, 0, 9, '2021-07-21 09:35:39', '2021-07-21 09:35:39'),
(55, 30, 1, 0, 1, 0, 6, '2021-07-21 12:08:36', '2021-07-21 12:08:36'),
(56, 30, 1, 0, 1, 0, 7, '2021-07-21 12:08:36', '2021-07-21 12:08:36'),
(62, 20, 1, 1, 1, 1, 7, NULL, NULL),
(63, 32, 1, 1, 0, 0, 6, '2021-07-26 13:03:15', '2021-07-26 13:03:15'),
(64, 32, 1, 1, 0, 0, 7, '2021-07-26 13:03:15', '2021-07-26 13:03:15'),
(65, 32, 1, 1, 0, 0, 8, '2021-07-26 13:03:15', '2021-07-26 13:03:15'),
(66, 32, 1, 1, 0, 0, 9, '2021-07-26 13:03:15', '2021-07-26 13:03:15'),
(67, 32, 1, 1, 0, 0, 10, '2021-07-26 13:03:15', '2021-07-26 13:03:15'),
(75, 10, 1, 1, 1, 1, 6, '2021-07-30 14:37:35', '2021-07-30 14:37:35'),
(76, 10, 1, 1, 1, 1, 7, '2021-07-30 14:37:35', '2021-07-30 14:37:35'),
(77, 10, 1, 1, 1, 1, 8, '2021-07-30 14:37:35', '2021-07-30 14:37:35'),
(78, 10, 1, 1, 1, 1, 9, '2021-07-30 14:37:35', '2021-07-30 14:37:35'),
(79, 10, 1, 1, 1, 1, 10, '2021-07-30 14:37:35', '2021-07-30 14:37:35'),
(80, 33, 1, 1, 0, 0, 6, '2021-07-30 16:03:58', '2021-07-30 16:03:58'),
(81, 33, 1, 1, 0, 0, 7, '2021-07-30 16:03:58', '2021-07-30 16:03:58'),
(82, 33, 1, 1, 0, 0, 8, '2021-07-30 16:03:58', '2021-07-30 16:03:58'),
(83, 33, 1, 1, 0, 0, 9, '2021-07-30 16:03:58', '2021-07-30 16:03:58'),
(84, 33, 1, 1, 0, 0, 10, '2021-07-30 16:03:58', '2021-07-30 16:03:58'),
(85, 34, 1, 1, 0, 0, 6, '2021-07-30 17:17:40', '2021-07-30 17:17:40'),
(86, 34, 1, 1, 0, 0, 7, '2021-07-30 17:17:40', '2021-07-30 17:17:40'),
(87, 34, 1, 1, 0, 0, 8, '2021-07-30 17:17:40', '2021-07-30 17:17:40'),
(88, 34, 1, 1, 0, 0, 9, '2021-07-30 17:17:40', '2021-07-30 17:17:40'),
(89, 34, 1, 1, 0, 0, 10, '2021-07-30 17:17:40', '2021-07-30 17:17:40'),
(90, 35, 1, 1, 0, 0, 6, '2021-07-30 17:37:01', '2021-07-30 17:37:01'),
(91, 35, 1, 1, 0, 0, 7, '2021-07-30 17:37:01', '2021-07-30 17:37:01'),
(92, 35, 1, 1, 0, 0, 8, '2021-07-30 17:37:01', '2021-07-30 17:37:01'),
(93, 35, 1, 1, 0, 0, 9, '2021-07-30 17:37:01', '2021-07-30 17:37:01'),
(94, 35, 1, 1, 0, 0, 10, '2021-07-30 17:37:01', '2021-07-30 17:37:01'),
(95, 36, 1, 1, 0, 0, 6, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(96, 36, 1, 1, 0, 0, 7, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(97, 36, 1, 1, 0, 0, 8, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(98, 36, 1, 1, 0, 0, 9, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(99, 36, 1, 1, 0, 0, 10, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(100, 36, 1, 1, 0, 0, 11, '2021-08-02 05:57:03', '2021-08-02 05:57:03'),
(101, 37, 1, 1, 0, 0, 6, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(102, 37, 1, 1, 0, 0, 7, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(103, 37, 1, 1, 0, 0, 8, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(104, 37, 1, 1, 0, 0, 9, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(105, 37, 1, 1, 0, 0, 10, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(106, 37, 1, 1, 0, 0, 11, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(107, 37, 1, 1, 0, 0, 12, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(108, 37, 1, 1, 0, 0, 13, '2021-08-02 09:17:58', '2021-08-02 09:17:58'),
(109, 38, 1, 1, 0, 0, 6, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(110, 38, 1, 1, 0, 0, 7, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(111, 38, 1, 1, 0, 0, 8, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(112, 38, 1, 1, 0, 0, 9, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(113, 38, 1, 1, 0, 0, 10, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(114, 38, 1, 1, 0, 0, 11, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(115, 38, 1, 1, 0, 0, 12, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(116, 38, 1, 1, 0, 0, 13, '2021-08-02 13:22:04', '2021-08-02 13:22:04'),
(117, 39, 1, 1, 0, 0, 6, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(118, 39, 1, 1, 0, 0, 7, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(119, 39, 1, 1, 0, 0, 8, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(120, 39, 1, 1, 0, 0, 9, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(121, 39, 1, 1, 0, 0, 10, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(122, 39, 1, 1, 0, 0, 11, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(123, 39, 1, 1, 0, 0, 19, '2021-08-03 09:21:45', '2021-08-03 09:21:45'),
(124, 40, 1, 1, 0, 0, 6, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(125, 40, 1, 1, 0, 0, 7, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(126, 40, 1, 1, 0, 0, 8, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(127, 40, 1, 1, 0, 0, 9, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(128, 40, 1, 1, 0, 0, 10, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(129, 40, 1, 1, 0, 0, 11, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(130, 40, 1, 1, 0, 0, 16, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(131, 40, 1, 1, 0, 0, 17, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(132, 40, 1, 1, 0, 0, 18, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(133, 40, 1, 1, 0, 0, 19, '2021-08-03 11:02:18', '2021-08-03 11:02:18'),
(134, 31, 1, 1, 1, 1, 6, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(135, 31, 1, 1, 1, 1, 7, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(136, 31, 1, 1, 1, 1, 8, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(137, 31, 1, 1, 1, 1, 9, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(138, 31, 1, 1, 1, 1, 10, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(139, 31, 1, 1, 1, 1, 12, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(140, 31, 1, 1, 1, 1, 13, '2021-08-05 10:00:00', '2021-08-05 10:00:00'),
(141, 41, 1, 1, 0, 0, 6, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(142, 41, 1, 1, 0, 0, 7, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(143, 41, 1, 1, 0, 0, 8, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(144, 41, 1, 1, 0, 0, 9, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(145, 41, 1, 1, 0, 0, 10, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(146, 41, 1, 1, 0, 0, 11, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(147, 41, 1, 1, 0, 0, 12, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(148, 41, 1, 1, 0, 0, 13, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(149, 41, 1, 1, 0, 0, 14, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(150, 41, 1, 1, 0, 0, 15, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(151, 41, 1, 1, 0, 0, 16, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(152, 41, 1, 1, 0, 0, 17, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(153, 41, 1, 1, 0, 0, 18, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(154, 41, 1, 1, 0, 0, 19, '2021-08-05 10:29:52', '2021-08-05 10:29:52'),
(155, 41, 1, 1, 0, 0, 22, '2021-08-05 10:29:52', '2021-08-05 10:29:52');

-- --------------------------------------------------------

--
-- Table structure for table `push_notifications`
--

CREATE TABLE `push_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matter_id` int(11) DEFAULT NULL,
  `send_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `push_notifications`
--

INSERT INTO `push_notifications` (`id`, `title`, `title_ar`, `description`, `description_ar`, `image`, `city`, `country`, `state`, `platform`, `users`, `matter_id`, `send_at`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', NULL, 'all', 'all', 'all', 'all', 'all', 18, '2021-07-30 09:56:51', 1, '2021-07-30 09:56:51', '2021-07-30 09:56:51'),
(2, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', NULL, 'all', 'all', 'all', 'all', 'all', 18, '2021-07-30 09:57:03', 1, '2021-07-30 09:57:03', '2021-07-30 09:57:03'),
(3, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', NULL, 'all', 'all', 'all', 'all', 'all', 18, '2021-07-30 09:58:25', 1, '2021-07-30 09:58:25', '2021-07-30 09:58:25'),
(4, 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', NULL, 'all', 'all', 'all', 'all', 'all', 18, '2021-07-30 10:00:22', 1, '2021-07-30 10:00:22', '2021-07-30 10:00:22'),
(5, 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'all', 'all', 'all', 'all', 'all', NULL, '2021-07-30 13:36:33', 1, '2021-07-30 10:55:33', '2021-07-30 13:35:56'),
(6, 'sdfsfdsaf', 'dfsdfsdfsdfsdfsdf', 'sdfsdfsdf', NULL, 'public/profile/U0Ah6tMGCBeMgtMmECJtpTjt15tQwgsJL3IifOtu.jpg', 'all', 'all', 'all', 'ios', 'initiator', 18, '2021-07-30 21:09:53', 1, '2021-07-30 14:40:29', '2021-07-30 14:40:29'),
(7, 'rtretre', 'rtreter', 'reterter', NULL, 'public/profile/H0xvJVl6kaGzHeQG0w4qrSwFEoLUS1BayAIwMd9D.png', 'all', 'all', 'all', 'ios', 'initiator', 18, '2021-07-30 21:10:59', 1, '2021-07-30 14:41:12', '2021-07-30 14:41:12'),
(8, 'Hello', 'Hello', 'Hello', 'Hello', NULL, 'all', 'all', 'all', 'all', 'all', NULL, '2021-07-30 21:32:14', 1, '2021-07-30 15:03:17', '2021-07-30 15:03:17'),
(9, 'VVV', 'vv', 'vvv', 'vvv', NULL, 'all', 'all', 'all', 'android', 'contributor', NULL, '2021-07-30 21:35:10', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(10, 'Enjoy Nightshift', 'Enjoy Nightshift', 'Enjoy Nightshift', 'Enjoy Nightshift', NULL, 'all', 'all', 'all', 'ios', 'initiator', NULL, '2021-07-30 21:39:57', 1, '2021-07-30 15:14:35', '2021-07-30 15:14:35'),
(11, 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', NULL, 'all', 'all', 'all', 'all', 'all', NULL, '2021-07-30 21:45:09', 1, '2021-07-30 15:15:22', '2021-07-30 15:15:22'),
(12, 'Happy sunday', 'Happy sunday', 'Happy sunday', 'Happy sunday', NULL, 'all', 'all', 'all', 'ios', 'initiator', NULL, '2021-07-30 21:47:31', 1, '2021-07-30 15:18:06', '2021-07-30 15:18:06'),
(13, 'Happy sunday', 'Happy sunday', 'Happy sunday', 'Happy Sunday', NULL, 'all', 'all', 'all', 'ios', 'initiator', NULL, '2021-07-30 21:48:59', 1, '2021-07-30 15:20:35', '2021-07-30 15:20:35'),
(14, 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', NULL, 'all', 'all', 'all', 'all', 'all', NULL, '2021-08-04 16:56:30', 1, '2021-08-04 10:27:35', '2021-08-04 10:27:35'),
(15, 'hello', NULL, 'hello', NULL, NULL, 'all', 'all', 'all', 'all', 'all', 23, '2021-08-04 19:27:38', 0, '2021-08-04 13:01:23', '2021-08-04 13:01:23'),
(16, NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', NULL, 'all', 'all', 'all', 'all', 'all', 33, '2021-08-04 19:32:02', 1, '2021-08-04 13:02:49', '2021-08-04 13:02:49'),
(17, NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'all', 'all', 'all', 'all', 'all', 25, '2021-08-04 19:34:02', 1, '2021-08-04 13:06:17', '2021-08-04 13:06:17');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'contact_phone', '+123431234', NULL, NULL),
(2, 'contact_phone1', '+123431234', NULL, NULL),
(3, 'mail', 'admin@support.com', NULL, NULL),
(4, 'address', ' Plot No. F5- F6, 3rd floor, Phase 8, Industrial Area, Sahibzada Ajit Singh Nagar, Punjab 160055', NULL, NULL),
(5, 'website', 'www.google.com', NULL, NULL),
(6, 'facebook', 'https://www.facebook.com/', NULL, NULL),
(7, 'instagram', 'https://www.instagram.com/', NULL, NULL),
(8, 'twitter', 'https://twitter.com/Twitter?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lenght` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `fragile` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Booked','Dispatched','Collected','Delivered') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `s_latitude` double DEFAULT NULL,
  `s_longitude` double DEFAULT NULL,
  `d_latitude` double DEFAULT NULL,
  `d_longitude` double DEFAULT NULL,
  `provider_id` int(11) NOT NULL DEFAULT '0',
  `final_price` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `countrie_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_arabic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `countrie_id`, `title`, `title_arabic`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'Himachal', 'هيماشال', 1, '2021-06-21 07:04:30', '2021-06-21 09:06:38'),
(3, 3, 'Dhaka', 'دكا', 1, '2021-06-22 06:18:07', '2021-08-03 07:27:39'),
(4, 1, 'Punjab', 'البنجاب', 1, '2021-07-13 12:26:33', '2021-07-13 12:26:33'),
(5, 1, 'Haryana', 'Haryana', 1, '2021-07-21 11:37:52', '2021-07-21 11:37:52'),
(6, 7, 'Khartoum', 'الخرطوم', 1, '2021-07-23 23:12:25', '2021-08-03 07:11:19'),
(7, 7, 'Gazira', 'الجزيرة', 1, '2021-07-26 13:21:48', '2021-07-29 12:44:26'),
(8, 8, 'Abu Dhabi', 'أبو ظبي', 1, '2021-07-30 18:23:00', '2021-07-30 18:23:00'),
(9, 12, 'Auckland', 'أوكلاند', 1, '2021-08-03 07:12:08', '2021-08-03 07:12:08'),
(10, 11, 'Sydney', 'سيدني', 1, '2021-08-03 07:12:45', '2021-08-03 07:12:45'),
(11, 1, 'Maharashtra', 'ماهاراشترا', 1, '2021-08-03 07:14:17', '2021-08-03 07:14:17'),
(12, 7, 'New South Wales', 'نيو ساوث ويلز', 1, '2021-08-03 07:15:15', '2021-08-04 12:08:23'),
(13, 12, 'Manurewa', 'مانوريوا', 1, '2021-08-03 08:58:26', '2021-08-03 08:58:39'),
(14, 11, 'Queensland', 'كوينزلاند', 1, '2021-08-03 08:59:57', '2021-08-05 11:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `otp` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `otp_verified` int(11) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forgot_otp` int(11) NOT NULL DEFAULT '0',
  `gender` enum('Male','Female','Other') COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Individual','Organization') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `lang` enum('EN','AR') COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device_type` enum('android','ios') COLLATE utf8mb4_unicode_ci NOT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_number`, `country_code`, `status`, `otp`, `image`, `otp_verified`, `remember_token`, `forgot_otp`, `gender`, `country`, `city`, `state`, `type`, `birth_date`, `lang`, `location`, `device_type`, `device_token`, `created_at`, `updated_at`) VALUES
(1, 'Test Contributor', 'contributor99@gmail.com', '$2y$10$jyWqp.BQshaVLFNFgYdeHu46a9DDH2barH5q8QbUVI71FWdHwbgXa', '9988826933', '+91', 1, 1234, NULL, 1, NULL, 1234, 'Male', 'india', 'Punjab', 'Asr', 'Individual', '1993-11-21', 'EN', NULL, 'android', NULL, '2021-06-24 05:38:09', '2021-07-02 11:52:13'),
(2, 'Munish', 'munishcontributor@yopmail.com', '$2y$10$m80JBsg.tN0ugxQb2Tics.HmQZbCCthCVMuXdqiSLGLZVV1i/xbby', '8556088295', '+249', 1, 1234, NULL, 0, NULL, 1234, 'Male', 'India', 'Sahibzada Ajit Singh Nagar', 'Punjab', 'Individual', '2021-06-14', 'EN', NULL, 'android', NULL, '2021-06-24 11:53:26', '2021-07-02 10:37:53'),
(3, 'Munish', 'munishcontributor2@yopmail.com', '$2y$10$E4arm10EWJNrtot45dOnuO8SvYY7Z14y4I7jcrUDANd1GQYhUoLF2', '8546797463', '+249', 0, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Mahendragarh', 'Haryana', 'Individual', '2021-06-15', 'EN', NULL, 'android', NULL, '2021-06-24 11:56:25', '2021-08-03 09:49:37'),
(4, 'Munish', 'munishcontributor3@yopmail.com', '$2y$10$vff.9cEA5AD/J8zXbNotOOWT6nftc2bgAJudgEIYllWtSEJcEejMa', '8464646463', '+91', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Sahibzada Ajit Singh Nagar', 'Punjab', 'Individual', '2021-06-15', 'EN', NULL, 'android', NULL, '2021-06-24 12:00:17', '2021-06-24 12:00:17'),
(5, 'Sahil Testing apis', 'munishcontributor4@yopmail.com', '$2y$10$27kibSyGF5OSRZpDfP1yyO4llQY4mNajOYqAr0BxSBweTYrVlwOdi', '8454643123', '+249', 1, 1234, 'public/profile/qL4DDdmaBHcC27J7lUYAPXawANiwmkog53pYapuS.jpg', 1, NULL, 1234, 'Female', 'India', 'Rupnagar', 'Punjab', 'Individual', '2021-11-21', 'EN', 'Nangal, Punjab, India', 'ios', 'dVBphUyS60IyvdYMZ2qhFv:APA91bHNESbvZmnyDCDvbO2MpMQO6CmwlobHz-mZ0gYm1yWIcwFZhLccvWW4Byn1-kOsw8XCS_mdSl_1DAqiqtqN3aqICHVk8rxY0L6S4jaqi2Kfh5aGEjA98j6HnUuE16sqJBeJNgTw', '2021-06-24 12:02:36', '2021-08-06 13:04:25'),
(6, 'Munish org', 'munishorg@yopmail.com', '$2y$10$3lTvLTSD0GPGzzX4TFQV5O5jZgZfE4sMPe0fHRkuPfqCkWoxYq9WK', '8546123696', '+249', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Rupnagar', 'Punjab', 'Organization', '2021-06-02', 'EN', NULL, 'android', NULL, '2021-06-25 12:21:37', '2021-06-25 12:21:37'),
(7, 'Munish', 'munish1@yopmail.com', '$2y$10$.jHZPWl/odkUuiEI7GSjyeM8qtGnd4GRBWFp6hLj6EDzpfpl9Lt0q', '8564913645', '+249', 1, 1234, NULL, 0, NULL, 0, 'Male', 'United States', 'Henry County', 'Georgia', 'Organization', '2021-06-16', 'EN', NULL, 'android', NULL, '2021-06-25 12:36:16', '2021-06-25 12:36:16'),
(8, 'Munish', 'munish2@yopmail.com', '$2y$10$./u5Atpl8D9knSzw9XFWdOaf1Ho4DzxWKRValGWjzbPr44nFfr6iS', '8546131269', '+249', 1, 1234, NULL, 0, NULL, 1234, 'Male', 'Nepal', 'Kaski', 'Gandaki Province', 'Organization', '2021-06-16', 'EN', NULL, 'android', NULL, '2021-06-25 12:38:11', '2021-07-13 10:28:25'),
(9, 'Test Contributer News', 'test12@yopmail.com', '$2y$10$jC8EGZqxGhA/Ic1ltRBz3udJNHA1w4TQUm6nWcbc4z6uC0wBGesTC', '9999911111', '+249', 1, 1234, 'public/profile/7FvVmuUavL6OERtjHS2wqeJhfGdqVWkgZighhRsC.jpg', 1, NULL, 0, 'Female', 'India', 'Mohali', 'Punjab', 'Individual', '1989-07-01', 'EN', 'Chandigarh, India', 'android', NULL, '2021-07-02 09:06:02', '2021-07-09 11:56:29'),
(11, 'vijay', 'vijay11@yopmail.com', '$2y$10$EhI8g3u/uepFwHhj1/TKVO900a3PEiDXzjwqBoGNB/kq8jYh6VHYq', '9501766002', '+249', 1, 1234, 'public/profile/E4b4vAHnoSX5DQAjGwkc8OV1hRlogJ3KgieWCBVM.jpg', 1, NULL, 1234, 'Male', 'India', 'Sahibzada Ajit Singh Nagar', 'Punjab', 'Organization', '1990-07-12', 'EN', '55, Sector 71, Sahibzada Ajit Singh Nagar, Punjab, India', 'android', 'cRB7qbUISBOfucqyzZcuzR:APA91bEvdG_yuhzKpcoVzCmaHJMWVi9T3yhJbmnEcMPxkZKqONJgNAX58EJSUTpE3evXpb_PTeGg0N_FFKIQRz1RMOXLG7QYeFySYCKtvwlcGVYWDBht_Pt42TCA4ZlPC2qZJfPvpNPh', '2021-07-12 13:27:43', '2021-08-06 12:55:19'),
(12, 'Ahmed Adam', 'ahmedamfa@gmail.com', '$2y$10$yV.TyflPPHT.I3BiIAu8Oe2YbqMMA4zyy.G9wGF5Nr4oi/Xu23ZmK', '912808000', '+249', 1, 1234, NULL, 0, NULL, 0, 'Male', 'Sudan', 'Khartoum', 'Khartoum', 'Individual', '1993-07-12', 'EN', 'Khartoum, Sudan', 'android', NULL, '2021-07-12 14:26:52', '2021-07-12 14:26:52'),
(13, 'Munish', 'munishcontributor5@yopmail.com', '$2y$10$dtEehjpunzSrFUkzwrs2aOmSJ8g1C8YhTUOY2KKKiJ3TMvs/4teCy', '8646464643', '+91', 1, 1234, 'public/profile/xAh21MJX5dQlazHTYiXK6JYNaB4ItCcvYTzTs3aj.jpg', 1, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-06', 'EN', 'mochi market', 'android', NULL, '2021-07-14 06:57:05', '2021-07-19 04:42:25'),
(14, 'tester', 'tester@yopmail.com', '$2y$10$ifDJUK8MRrYS09clq5dLO.6K/OydfuEMKUu.01/ZtA4KjxlkACHqe', '9876543210', '+1', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'android', NULL, '2021-07-20 06:03:27', '2021-07-20 06:03:27'),
(15, 'tester', 'tester1@yopmail.com', '$2y$10$S8Hzz.StHI75mZo3NGT1ZuuX59xoFitnvGLCBvdRfSDSQs4FWZJ/.', '9876543211', '+1', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'android', NULL, '2021-07-20 06:09:09', '2021-07-20 06:09:09'),
(16, 'loki', 'loki@yopmail.com', '$2y$10$NyMY7iZQwPi4.N2o6BytOereyDeXfUUJe.HCAyMEzkwmrSjO7Te2S', '9999999993', '+1', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'android', NULL, '2021-07-20 06:17:10', '2021-07-20 06:17:10'),
(17, 'kohli', 'kohli@yopmail.com', '$2y$10$poV1ZT3rF5aKuQK0tM2ozu/sGcrs.kyGC5MgT44jJz0UjEMNm/fFO', '9999999991', '+1', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'android', NULL, '2021-07-20 06:21:03', '2021-07-20 06:21:03'),
(18, 'Sin', 'sin@yopmail.com', '$2y$10$8zlpxhI9KAgeptlFMC3JeuLbqeO.hM20bKkzSWHsoJTQVi9hnyLD2', '9999999992', '+1', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'android', NULL, '2021-07-20 06:24:57', '2021-07-20 06:24:57'),
(19, 'johnny', 'johnny@yopmail.com', '$2y$10$bmScY9gCENZEPhZ77Z5tbOIGzhbVA9Ld4ErzZKnelOBdO7I5eKYom', '9999999994', '+1', 1, 1234, 'public/profile/9lSFRwPWpaAKgnpThf8CMCXdKlpNdbqaArysQjOo.jpg', 1, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-20', 'EN', 'mohali', 'ios', 'cMccgudFwEBUrK-9ZGHNUl:APA91bFgt2-ZIVwN0OItMSlJq_GGlTol4zdydQ4XN1FbftbmdDA8-PueuKF5SR-8vdHI_FwqmrxDzjWkG5NfWbsQApgQTKK9A4amC_b-jlYhi3dvKB0TKMQsnyAb3KP2qGrxOVxTnb8u', '2021-07-20 06:28:53', '2021-07-21 07:22:38'),
(20, 'newmunishcontributor4', 'newmunishcontributor4@yopmail.com', '$2y$10$27kibSyGF5OSRZpDfP1yyO4llQY4mNajOYqAr0BxSBweTYrVlwOdi', '1331346491', '+249', 1, 1234, NULL, 1, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-08', 'EN', 'sjjdjd', 'android', 'asdasasas', '2021-07-20 09:17:48', '2021-07-26 06:15:32'),
(21, 'vkmdd', 'middhas@yopmail.com', '$2y$10$Mkq4Q8YMpO5td.KZw5jnBeUwgMOt3vZiuMsEdcRedmT1lPu1BDWZq', '9501766006', '+249', 1, 1234, NULL, 1, NULL, 0, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '2021-07-21', 'EN', 'sec 70 mohali', 'android', 'ddgonWeMQSeUb3HWhJXB-9:APA91bE6r4CSlMRYrGRm8RwYoXA2QIaNp8-sAXkWXSCyv1sZoAVD5jzCl-xHKxZ4kaBTJV6zK2iVyx2560ScFpYmGcbMJme2t7beIy6Q1xDamuYtjmy5hT8gT-Diq2y1rNGj3fLrSBvo', '2021-07-21 09:12:11', '2021-07-21 11:48:06'),
(22, 'vijay', 'vijay12@yopmail.com', '$2y$10$oVCqH56pjeJca7ruUZJ.8e4TKUiCsqChOtQq5AK2lPnzTBtVvv15W', '8546461323', '+249', 1, 1234, NULL, 1, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-12', 'EN', 'sas 21', 'android', 'fpHgntPkQyKCHcimwjPPLK:APA91bHWlzzuxQWDukNZgvcDHMRriTBGenCjJPitLeNZBJb2iGj3i6nDEqU69rrhR0Tf-23m2xQtw_JVXFq-jieOhHm-4uYM4S_bOIgEjGnHvXuAf9dxTHknqihmvgzX2S5L9ojU9Xky', '2021-07-21 12:13:18', '2021-07-21 12:13:45'),
(23, 'Ahmed Adam', 'ahmed@unigroup.ltd', '$2y$10$tvlawXVggnSgWsbNGfjaWu4MOT7pmLobAWzr1F650DLiFEtgKSOvC', '9128080000', '+249', 1, 1234, NULL, 1, NULL, 0, 'Male', 'India', 'Moga', 'Punjab', 'Individual', '1993-07-23', 'EN', 'Khartoum', 'ios', 'e6a7LQW8wUt9nwD1T-Eow-:APA91bHOzvWIRpJp21UN93PXp10LvOrG5DVLct5qbVqlPWrcF56O6H5vtkYqzF89j1n0I0LC2Uuz0uHQrIRbwxFGSGBOG9SHDGJDXJD7qiaEmHaU0aTJQ_MEvXijGp7MPcdZpVAqzz07', '2021-07-23 21:52:08', '2021-08-05 09:10:18'),
(24, 'Alaa Abdelsamad', 'alaa.abdelsamad@unisoft.ltd', '$2y$10$OtDpfSQogLltM.zhNLIumey33S3ptuUYxzXt3luzH8pOvc.EKH6qi', '907046413', '+249', 1, 1234, NULL, 0, NULL, 1234, 'Female', 'Sudan', 'Khartoum', 'Khartoum', 'Individual', '2021-07-25', 'EN', 'Khartoum', 'android', NULL, '2021-07-25 11:38:26', '2021-08-01 08:18:54'),
(25, 'Waleed', 'wellimakki@gmail.com', '$2y$10$MjuBl8E069TzRA6l0gnD2.etTicFGJyeulF6MfWZ2ROztYdPZQWES', '908779558', '+249', 1, 1234, NULL, 0, NULL, 0, 'Male', 'Sudan', 'Bahri', 'Khartoum', 'Individual', '1996-07-25', 'EN', 'Al Steen', 'android', NULL, '2021-07-25 12:08:46', '2021-07-25 12:08:46'),
(26, 'Alaa', 'alaa_abdelsamad@yahoo.com', '$2y$10$mBRcxm/qClyvbMEfXYmzWOY5IWCvAr6vTPkj5K2q6TIZDlXguny7a', '900900810', '+249', 1, 1234, NULL, 1, NULL, 0, 'Female', 'Sudan', 'Khartoum', 'Khartoum', 'Individual', '2021-07-26', 'EN', 'Khartoum', 'android', NULL, '2021-07-26 12:52:51', '2021-07-27 08:07:32'),
(27, 'Alaa', 'Waleed.makki@unisoft.ltd', '$2y$10$3APKahmDV7z4LdncqhzdrebBJs6tJlLuGiQr5OW7YLv5wNyDBCj82', '9086877409', '+249', 1, 1234, NULL, 1, NULL, 0, 'Female', 'Sudanaaaa', 'Khartoum', 'Khartoum', 'Individual', '2021-07-26', 'EN', 'Khartoum', 'android', NULL, '2021-07-26 13:06:46', '2021-07-29 12:46:10'),
(28, 'demo user', 'demouser@yopmail.com', '$2y$10$D4HAILLuA7wPDwm4Mb4IS.TQoCiwbE8dSGFkj.eSbW2JPRQC8SDlC', '7589376374', '+91', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '1990-07-30', 'EN', 'ivy mohali', 'android', NULL, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(29, 'demo user', 'demouser11@yopmail.com', '$2y$10$98u8Jutc3PDm21Z76vEr8edXWwUVbPNwcpZ9eQsh7w/x4nRz7uwTq', '7589376378', '+91', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '1990-07-30', 'EN', 'ivy mohali', 'android', NULL, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(30, 'demo user', 'demouser22@yopmail.com', '$2y$10$ueJW40Ug7.4uVejsqUsAsOF.LyFuKO4F98o/fiHXJLHD43mS1dfvq', '7589376372', '+91', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '1990-07-30', 'EN', 'ivy mohali', 'android', NULL, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(31, 'demo user', 'demouser223@yopmail.com', '$2y$10$ibg4aezSn1RKsSgokbxQGu5xV2P6Au8QJ9O63NihTd5iDe9r7r6zK', '75893763754', '+91', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '1990-07-30', 'EN', 'ivy mohali', 'android', NULL, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(32, 'alaa', 'remaz@unisoft.ltd', '$2y$10$ITo9FxnYPa3tLe4nuv1HUuBnGwHEh.KSEqDqI/y77f0LutJ8gsNcq', '900900801', '+249', 1, 1234, NULL, 1, NULL, 1234, 'Female', 'Sudan', 'Khartoum', 'Khartoum', 'Individual', '2021-08-01', 'EN', 'khartoum', 'android', 'eQolI_xISPWmehVP1Ulqp1:APA91bHE7uvrnC_jGglwITrw5DD_m3X1r7NSUkGUKZo-8qwGy_McjPClS3g6Qhs90VGn3Yl7dHVmlQ7TGqUc9zvmW9Vjq82jnnOOVFVvbPDNITrMpN5VGhnXuiGTKWzZb_MQrekXG0kW', '2021-08-01 07:53:13', '2021-08-01 08:14:39'),
(33, 'sandy 001', 'sandy001@yopmail.com', '$2y$10$VJYKh0DV9SwPC0zwk925huZUTmeBAos4JSphyarQxV5k1TNPcSWTG', '7589376375', '+971', 1, 1234, NULL, 0, NULL, 0, 'Male', 'The United Arab Emirates', 'Abu al Abyad', 'Abu Dhabi', 'Individual', '1980-08-07', 'EN', 'hdh djjd djjdd', 'android', NULL, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(34, 'sandy002', 'sandy002@yopmail.com', '$2y$10$Fj.tVIIk4S0UA5LEayt16.xc2damBt9iRVuObPzuL96MaDAHR4kH6', '7589376854', '+971', 1, 1234, NULL, 0, NULL, 0, 'Male', 'The United Arab Emirates', 'Abu al Abyad', 'Abu Dhabi', 'Individual', '1980-08-02', 'EN', 'jfjd djjdh djjd djdb', 'android', NULL, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(35, 'chandan', 'chandan@yopmail.com', '$2y$10$ROK9ojQvHrS8bHskh1Gxze71ejtDJOJ/j7sWDoG1D1rSC1yYeNvV.', '9998887776', '+91', 1, 1234, NULL, 1, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-08-02', 'EN', 'mohali', 'ios', 'fXXIMtBrI0gtiHoj0dnw4O:APA91bEkVtkxQOB6HriycLbrYFc-W3Ea0lKOO4jwVP1bATMZMdukkijf81TJf6achVPCve67ltbs9GJVq0w_n4OXbmJfP5KQc2dX0VvvMb0f1pV2_ugX-fBSUvoviD4Ut7nRFBC4eY8Y', '2021-08-02 06:00:22', '2021-08-02 06:01:40'),
(36, 'lindsay Mac', 'lindsay001@yopmail.com', '$2y$10$DaVVA4nGJ4TeYddU1ayzE.NKzUBoQt8W22bgVyRjnlxfoEV2AL1O.', '7589678563', '+971', 1, 1234, NULL, 0, NULL, 0, 'Female', 'The United Arab Emirates', 'Abu al Abyad', 'Abu Dhabi', 'Individual', '1971-08-19', 'EN', 'near al alkzar motel', 'android', NULL, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(37, 'vvv', 'vvv@yopmail.com', '$2y$10$d2ZP4s/HLMFHgVSgoKfhLuPAydsTdAUjPFc8Z277VMAcEl7VzrEU.', '+919501766006', '+249', 1, 1234, NULL, 0, NULL, 1234, 'Male', 'India', 'Mohali', 'Punjab', 'Individual', '1990-08-03', 'EN', 'mmm', 'android', NULL, '2021-08-03 09:26:26', '2021-08-03 10:12:28'),
(38, 'Prashant', 'prashant@mailinator.com', '$2y$10$nFDCGSnZ5nlltGZgFl6z4OsTfzEFDHCKf5SgmQLYSy/iCbKXrCGBa', '985698745', '91', 1, 1234, NULL, 0, NULL, 0, 'Male', '11', '15', '10', 'Individual', '2021-01-31', 'EN', NULL, 'android', NULL, '2021-08-03 10:26:51', '2021-08-03 10:26:51'),
(39, 'Prashant', 'prashant@yopmail.com', '$2y$10$UTYRgzTNlhl39/xDXNrLmuGQ3GEqERCj9rPVR8sPG7OHpi3O0a6Fa', '998866552233', '61', 1, 1234, NULL, 0, NULL, 0, 'Male', '1', '1', '2', 'Individual', '2021-08-26', 'EN', NULL, 'android', NULL, '2021-08-03 10:31:42', '2021-08-03 10:31:42'),
(40, 'Prashant', 'Nishant@mailinator.com', '$2y$10$N9Md/Uy2jq50kb.2G/N87usWkFNi9s9wrc2Q3AezZNgB7QW1aaZ2W', '9988632541', '61', 1, 1234, NULL, 1, NULL, 0, 'Male', '11', '15', '10', 'Organization', '2021-05-04', 'EN', NULL, 'android', NULL, '2021-08-03 10:36:20', '2021-08-05 10:35:52'),
(41, 'Nishant Test', 'Test@yopmailcom', '$2y$10$Dtrt2wgDuX60ezGFnCzmiuAMrtjBFxoAH9b7jwY728X.flfPCCA8i', '996633225588', '61', 1, 1234, NULL, 0, NULL, 0, 'Male', 'New Zealand', 'Manurewa', 'Auckland', 'Organization', '2021-02-07', 'EN', NULL, 'android', NULL, '2021-08-03 11:00:44', '2021-08-03 11:38:58'),
(42, 'Prashant', 'prashant@mailinatorcom', '$2y$10$5cPqwcmIs3nLGmdxsgoCPeajgd7.36NRQA4nh9kxhElObtXCRSLYS', '998855622', '61', 1, 1234, NULL, 0, NULL, 0, 'Male', 'New Zealand', 'Manurewa', 'Auckland', 'Individual', '1998-06-04', 'EN', NULL, 'android', NULL, '2021-08-03 11:42:21', '2021-08-03 13:07:44'),
(44, 'Nishant Pathania', 'nishant@yopmail.com', '$2y$10$SvVmhLVAYLTEmNMo2Zggfuvkh5Wjw/ZlvIyFmPz88v3xf.UNJ6HMm', '9988589879', '+91', 1, 1234, NULL, 1, NULL, 0, 'Male', 'New Zealand', 'Manurewa', 'Auckland', 'Individual', '1996-08-05', 'EN', '#2184 SBP City of dreams', 'android', 'fz8i6dVhTNSJVxsWKwNuU-:APA91bGtbdV9TMKbAbh0ST-syfREqnRFW0hG9syXrviEzojZcs48CoFvh0TS90gdjLA9VgVrpET0diUwQbPLC0_y8OQ8A6vbeDJzD8ftkhg2sLOmEdfCf9ZzPY2W9F3Ru1lOccdY2cTm', '2021-08-05 10:26:36', '2021-08-05 12:31:46'),
(45, 'alaa', 'alaa_abdelsamad123@yahoo.com', '$2y$10$lCn3NRoFhwXxAAwGFwqcCOG.3gm5L2CsV8quPeCMkZ2IWuF11zove', '12345678974', '123g', 1, 1234, NULL, 0, NULL, 0, 'Male', 'India', 'Bilaspur', 'Himachal', 'Individual', '2021-07-14', 'EN', NULL, 'android', NULL, '2021-08-05 11:20:46', '2021-08-05 11:20:46');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `notification_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `description_ar` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('case_added','case_updated','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `matter_id`, `user_id`, `notification_text`, `title`, `title_ar`, `description`, `description_ar`, `image`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 24, 16, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(2, 24, 17, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(3, 24, 18, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(4, 24, 19, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(5, 24, 20, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(6, 24, 21, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(7, 24, 22, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(8, 24, 23, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(9, 24, 24, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(10, 24, 25, ' New Case Added At 26-July-2021 and case title is Test case 1', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 05:08:22', '2021-07-26 05:08:22'),
(11, 7, 20, ' was Updated by Initiator At 26-July-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-07-26 05:14:12', '2021-07-26 05:14:12'),
(12, 12, 20, 'Not Test2 was Updated by Initiator At 26-July-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-07-26 05:43:03', '2021-07-26 05:43:03'),
(13, 26, 16, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(14, 26, 17, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(15, 26, 18, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(16, 26, 19, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(17, 26, 20, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(18, 26, 21, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:17', '2021-07-26 10:13:17'),
(19, 26, 22, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:18', '2021-07-26 10:13:18'),
(20, 26, 23, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:18', '2021-07-26 10:13:18'),
(21, 26, 24, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:18', '2021-07-26 10:13:18'),
(22, 26, 25, ' New Case Added At 26-July-2021 and case title is Test Case from admin', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 10:13:18', '2021-07-26 10:13:18'),
(23, 27, 21, ' New Case Added At 26-July-2021 and case title is SSS', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(24, 27, 23, ' New Case Added At 26-July-2021 and case title is SSS', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(25, 27, 24, ' New Case Added At 26-July-2021 and case title is SSS', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(26, 27, 25, ' New Case Added At 26-July-2021 and case title is SSS', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-26 11:13:37', '2021-07-26 11:13:37'),
(27, 20, 5, 'Testing Blood Unit was Updated by Initiator At 28-July-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-07-28 06:13:04', '2021-07-28 06:13:04'),
(28, 28, 23, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(29, 28, 24, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(30, 28, 25, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(31, 28, 26, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(32, 28, 27, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(33, 28, 5, ' New Case Added At 29-July-2021 and case title is vvv', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-29 12:50:15', '2021-07-29 12:50:15'),
(60, 8, 1, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(61, 8, 2, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(62, 8, 3, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(63, 8, 4, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(64, 8, 5, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(65, 8, 6, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(66, 8, 7, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(67, 8, 8, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(68, 8, 9, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(69, 8, 11, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(70, 8, 12, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(71, 8, 13, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(72, 8, 14, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(73, 8, 15, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(74, 8, 16, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(75, 8, 17, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(76, 8, 18, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(77, 8, 19, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:37', '2021-07-30 09:21:37'),
(78, 8, 20, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(79, 8, 21, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(80, 8, 22, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(81, 8, 23, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(82, 8, 24, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(83, 8, 25, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(84, 8, 26, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(85, 8, 27, ' New Notification from Admin At 30-July-2021', 'Testing case   from admin', 'حالة الاختبار من المشرف', 'Testing case   from admin', NULL, 'public/profile/EROqVnjaH0SUetTmz2pwWQbRoowhDzcmu5O4ghr5.jpg', 'admin', 1, '2021-07-30 09:21:38', '2021-07-30 09:21:38'),
(86, 18, 1, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(87, 18, 2, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(88, 18, 3, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(89, 18, 4, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(90, 18, 5, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(91, 18, 6, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(92, 18, 7, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(93, 18, 8, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(94, 18, 9, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(95, 18, 11, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(96, 18, 12, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(97, 18, 13, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(98, 18, 14, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(99, 18, 15, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(100, 18, 16, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(101, 18, 17, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(102, 18, 18, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(103, 18, 19, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:23', '2021-07-30 10:00:23'),
(104, 18, 20, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(105, 18, 21, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(106, 18, 22, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(107, 18, 23, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(108, 18, 24, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(109, 18, 25, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(110, 18, 26, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(111, 18, 27, ' New Notification from Admin At 30-July-2021', 'Sahil  Testing from admin', 'اختبار الساحل من المشرف', NULL, 'اختبار الساحل من المشرف', '', 'admin', 1, '2021-07-30 10:00:24', '2021-07-30 10:00:24'),
(112, NULL, 1, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(113, NULL, 2, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(114, NULL, 3, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(115, NULL, 4, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(116, NULL, 5, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:34', '2021-07-30 10:55:34'),
(117, NULL, 6, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(118, NULL, 7, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(119, NULL, 8, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(120, NULL, 9, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(121, NULL, 11, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(122, NULL, 12, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(123, NULL, 13, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(124, NULL, 14, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(125, NULL, 15, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(126, NULL, 16, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(127, NULL, 17, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(128, NULL, 18, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(129, NULL, 19, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(130, NULL, 20, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(131, NULL, 21, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(132, NULL, 22, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:35', '2021-07-30 10:55:35'),
(133, NULL, 23, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:36', '2021-07-30 10:55:36'),
(134, NULL, 24, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:36', '2021-07-30 10:55:36'),
(135, NULL, 25, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:36', '2021-07-30 10:55:36'),
(136, NULL, 26, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:36', '2021-07-30 10:55:36'),
(137, NULL, 27, ' New Notification from Admin At 30-July-2021', 'Hello admin wishes you happy birthday', 'مرحبا المشرف يتمنى لك عيد ميلاد سعيد', 'Hello admin wishes you happy birthday with image', NULL, 'public/profile/osfr0akA8laEPzMYHZ7fXhXsr9u30DlwzxYrg373.jpg', 'admin', 1, '2021-07-30 10:55:36', '2021-07-30 10:55:36'),
(138, 29, 16, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(139, 29, 17, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(140, 29, 18, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(141, 29, 19, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(142, 29, 20, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(143, 29, 21, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(144, 29, 22, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:13', '2021-07-30 14:10:13'),
(145, 29, 23, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(146, 29, 24, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(147, 29, 25, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(148, 29, 26, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(149, 29, 27, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(150, 29, 5, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(151, 29, 28, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(152, 29, 29, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(153, 29, 30, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(154, 29, 31, ' New Case Added At 30-July-2021 and case title is CNN’s', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:10:14', '2021-07-30 14:10:14'),
(155, 30, 16, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(156, 30, 17, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(157, 30, 18, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(158, 30, 19, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(159, 30, 20, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(160, 30, 21, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(161, 30, 22, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:03', '2021-07-30 14:44:03'),
(162, 30, 23, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(163, 30, 24, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(164, 30, 25, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(165, 30, 26, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(166, 30, 27, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(167, 30, 5, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(168, 30, 28, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(169, 30, 29, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(170, 30, 30, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(171, 30, 31, ' New Case Added At 30-July-2021 and case title is test notification', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-07-30 14:44:04', '2021-07-30 14:44:04'),
(172, NULL, 1, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(173, NULL, 2, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(174, NULL, 3, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(175, NULL, 4, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(176, NULL, 5, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(177, NULL, 6, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(178, NULL, 7, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(179, NULL, 8, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(180, NULL, 9, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(181, NULL, 11, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(182, NULL, 12, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(183, NULL, 13, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(184, NULL, 14, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(185, NULL, 15, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(186, NULL, 16, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(187, NULL, 17, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(188, NULL, 18, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(189, NULL, 19, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:19', '2021-07-30 15:03:19'),
(190, NULL, 20, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(191, NULL, 21, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(192, NULL, 22, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(193, NULL, 23, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(194, NULL, 24, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(195, NULL, 25, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(196, NULL, 26, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(197, NULL, 27, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(198, NULL, 28, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(199, NULL, 29, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(200, NULL, 30, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(201, NULL, 31, ' New Notification from Admin At 30-July-2021', 'Hello', 'Hello', 'Hello', 'Hello', '', 'admin', 1, '2021-07-30 15:03:20', '2021-07-30 15:03:20'),
(202, NULL, 1, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(203, NULL, 2, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(204, NULL, 3, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(205, NULL, 4, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(206, NULL, 5, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(207, NULL, 6, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(208, NULL, 7, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(209, NULL, 8, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(210, NULL, 9, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(211, NULL, 11, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(212, NULL, 12, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(213, NULL, 13, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(214, NULL, 14, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(215, NULL, 15, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(216, NULL, 16, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(217, NULL, 17, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(218, NULL, 18, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(219, NULL, 20, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(220, NULL, 21, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(221, NULL, 22, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(222, NULL, 23, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(223, NULL, 24, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(224, NULL, 25, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(225, NULL, 26, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(226, NULL, 27, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:28', '2021-07-30 15:05:28'),
(227, NULL, 28, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:29', '2021-07-30 15:05:29'),
(228, NULL, 29, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:29', '2021-07-30 15:05:29'),
(229, NULL, 30, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:29', '2021-07-30 15:05:29'),
(230, NULL, 31, ' New Notification from Admin At 30-July-2021', 'VVV', 'vv', 'vvv', 'vvv', '', 'admin', 1, '2021-07-30 15:05:29', '2021-07-30 15:05:29'),
(231, NULL, 1, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(232, NULL, 2, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(233, NULL, 3, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(234, NULL, 4, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(235, NULL, 5, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(236, NULL, 6, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(237, NULL, 7, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(238, NULL, 8, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(239, NULL, 9, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(240, NULL, 11, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(241, NULL, 12, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(242, NULL, 13, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(243, NULL, 14, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(244, NULL, 15, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(245, NULL, 16, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(246, NULL, 17, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(247, NULL, 18, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(248, NULL, 19, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(249, NULL, 20, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:24', '2021-07-30 15:15:24'),
(250, NULL, 21, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(251, NULL, 22, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(252, NULL, 23, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(253, NULL, 24, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(254, NULL, 25, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(255, NULL, 26, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(256, NULL, 27, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(257, NULL, 28, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(258, NULL, 29, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(259, NULL, 30, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(260, NULL, 31, ' New Notification from Admin At 30-July-2021', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', 'Enjoy Night shift', '', 'admin', 1, '2021-07-30 15:15:25', '2021-07-30 15:15:25'),
(261, 31, 16, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:51', '2021-08-03 08:38:51'),
(262, 31, 17, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:51', '2021-08-03 08:38:51'),
(263, 31, 18, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:51', '2021-08-03 08:38:51'),
(264, 31, 19, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(265, 31, 20, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(266, 31, 21, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(267, 31, 22, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(268, 31, 23, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(269, 31, 24, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(270, 31, 25, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(271, 31, 26, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(272, 31, 27, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52');
INSERT INTO `user_notifications` (`id`, `matter_id`, `user_id`, `notification_text`, `title`, `title_ar`, `description`, `description_ar`, `image`, `type`, `status`, `created_at`, `updated_at`) VALUES
(273, 31, 5, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(274, 31, 28, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(275, 31, 29, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(276, 31, 30, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(277, 31, 31, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(278, 31, 32, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(279, 31, 33, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(280, 31, 34, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:52', '2021-08-03 08:38:52'),
(281, 31, 35, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:53', '2021-08-03 08:38:53'),
(282, 31, 36, ' New Case Added At 03-August-2021 and case title is I’ll', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 08:38:53', '2021-08-03 08:38:53'),
(283, 32, 16, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(284, 32, 17, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(285, 32, 18, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(286, 32, 19, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(287, 32, 20, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:25', '2021-08-03 09:39:25'),
(288, 32, 21, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(289, 32, 22, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(290, 32, 23, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(291, 32, 24, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(292, 32, 25, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(293, 32, 26, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(294, 32, 27, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(295, 32, 5, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(296, 32, 28, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(297, 32, 29, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(298, 32, 30, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(299, 32, 31, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(300, 32, 32, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(301, 32, 33, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(302, 32, 34, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(303, 32, 35, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(304, 32, 36, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(305, 32, 37, ' New Case Added At 03-August-2021 and case title is Treatment', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 09:39:26', '2021-08-03 09:39:26'),
(306, 33, 16, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:12', '2021-08-03 11:31:12'),
(307, 33, 17, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:12', '2021-08-03 11:31:12'),
(308, 33, 18, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:12', '2021-08-03 11:31:12'),
(309, 33, 19, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(310, 33, 20, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(311, 33, 21, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(312, 33, 22, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(313, 33, 23, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(314, 33, 24, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(315, 33, 25, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(316, 33, 26, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(317, 33, 27, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(318, 33, 5, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(319, 33, 28, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(320, 33, 29, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(321, 33, 30, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(322, 33, 31, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(323, 33, 32, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(324, 33, 33, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(325, 33, 34, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:13', '2021-08-03 11:31:13'),
(326, 33, 35, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:14', '2021-08-03 11:31:14'),
(327, 33, 36, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:14', '2021-08-03 11:31:14'),
(328, 33, 37, ' New Case Added At 03-August-2021 and case title is stones surgery', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-03 11:31:14', '2021-08-03 11:31:14'),
(329, 34, 16, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(330, 34, 17, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(331, 34, 18, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(332, 34, 19, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(333, 34, 20, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(334, 34, 21, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:51', '2021-08-04 10:07:51'),
(335, 34, 22, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(336, 34, 23, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(337, 34, 24, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(338, 34, 25, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(339, 34, 26, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(340, 34, 27, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(341, 34, 5, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(342, 34, 28, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(343, 34, 29, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(344, 34, 30, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(345, 34, 31, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(346, 34, 32, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(347, 34, 33, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(348, 34, 34, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(349, 34, 35, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(350, 34, 36, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(351, 34, 37, ' New Case Added At 04-August-2021 and case title is Medicine test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 10:07:52', '2021-08-04 10:07:52'),
(352, NULL, 1, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(353, NULL, 2, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(354, NULL, 4, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(355, NULL, 5, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:37', '2021-08-04 10:27:37'),
(356, NULL, 6, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(357, NULL, 7, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(358, NULL, 8, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(359, NULL, 9, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(360, NULL, 11, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(361, NULL, 12, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(362, NULL, 13, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(363, NULL, 14, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(364, NULL, 15, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(365, NULL, 16, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(366, NULL, 17, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(367, NULL, 18, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(368, NULL, 19, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(369, NULL, 20, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(370, NULL, 21, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:38', '2021-08-04 10:27:38'),
(371, NULL, 22, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(372, NULL, 23, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(373, NULL, 24, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(374, NULL, 25, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(375, NULL, 26, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(376, NULL, 27, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(377, NULL, 28, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(378, NULL, 29, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(379, NULL, 30, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(380, NULL, 31, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(381, NULL, 32, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(382, NULL, 33, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(383, NULL, 34, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(384, NULL, 35, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(385, NULL, 36, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(386, NULL, 37, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(387, NULL, 38, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(388, NULL, 39, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(389, NULL, 40, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(390, NULL, 41, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(391, NULL, 42, ' New Notification from Admin At 04-August-2021', 'Hello friends', 'مرحبا اصدقاء', 'Hello friends', 'مرحبا اصدقاء', '', 'admin', 1, '2021-08-04 10:27:39', '2021-08-04 10:27:39'),
(392, 35, 16, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:57:59', '2021-08-04 11:57:59'),
(393, 35, 17, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:57:59', '2021-08-04 11:57:59'),
(394, 35, 18, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:57:59', '2021-08-04 11:57:59'),
(395, 35, 19, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:00', '2021-08-04 11:58:00'),
(396, 35, 20, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:00', '2021-08-04 11:58:00'),
(397, 35, 21, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:00', '2021-08-04 11:58:00'),
(398, 35, 22, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:00', '2021-08-04 11:58:00'),
(399, 35, 23, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(400, 35, 24, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(401, 35, 25, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(402, 35, 26, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(403, 35, 27, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(404, 35, 5, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(405, 35, 28, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(406, 35, 29, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(407, 35, 30, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(408, 35, 31, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(409, 35, 32, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(410, 35, 33, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(411, 35, 34, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:01', '2021-08-04 11:58:01'),
(412, 35, 35, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:02', '2021-08-04 11:58:02'),
(413, 35, 36, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:02', '2021-08-04 11:58:02'),
(414, 35, 37, ' New Case Added At 04-August-2021 and case title is surgery test', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 11:58:02', '2021-08-04 11:58:02'),
(415, 36, 16, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(416, 36, 17, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(417, 36, 18, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(418, 36, 19, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(419, 36, 20, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(420, 36, 21, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(421, 36, 22, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(422, 36, 23, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(423, 36, 24, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(424, 36, 25, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(425, 36, 26, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(426, 36, 27, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:58', '2021-08-04 12:05:58'),
(427, 36, 5, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(428, 36, 28, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(429, 36, 29, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(430, 36, 30, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(431, 36, 31, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(432, 36, 32, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(433, 36, 33, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(434, 36, 34, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(435, 36, 35, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(436, 36, 36, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(437, 36, 37, ' New Case Added At 04-August-2021 and case title is Medicine 💊💊💊💊💊', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 12:05:59', '2021-08-04 12:05:59'),
(438, 33, 1, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(439, 33, 2, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(440, 33, 4, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(441, 33, 5, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(442, 33, 6, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(443, 33, 7, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(444, 33, 8, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(445, 33, 9, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(446, 33, 11, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(447, 33, 12, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(448, 33, 13, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(449, 33, 14, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(450, 33, 15, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(451, 33, 16, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(452, 33, 17, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(453, 33, 18, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(454, 33, 19, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:53', '2021-08-04 13:02:53'),
(455, 33, 20, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(456, 33, 21, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(457, 33, 22, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(458, 33, 23, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(459, 33, 24, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(460, 33, 25, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(461, 33, 26, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(462, 33, 27, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(463, 33, 28, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(464, 33, 29, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(465, 33, 30, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(466, 33, 31, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(467, 33, 32, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(468, 33, 33, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(469, 33, 34, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(470, 33, 35, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:54', '2021-08-04 13:02:54'),
(471, 33, 36, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(472, 33, 37, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(473, 33, 38, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(474, 33, 39, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(475, 33, 40, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(476, 33, 41, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(477, 33, 42, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', '', 'admin', 1, '2021-08-04 13:02:55', '2021-08-04 13:02:55'),
(478, 25, 1, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:32', '2021-08-04 13:06:32'),
(479, 25, 2, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:32', '2021-08-04 13:06:32'),
(480, 25, 4, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:32', '2021-08-04 13:06:32'),
(481, 25, 5, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:32', '2021-08-04 13:06:32'),
(482, 25, 6, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:33', '2021-08-04 13:06:33'),
(483, 25, 7, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:33', '2021-08-04 13:06:33'),
(484, 25, 8, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:33', '2021-08-04 13:06:33'),
(485, 25, 9, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:33', '2021-08-04 13:06:33'),
(486, 25, 11, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:33', '2021-08-04 13:06:33'),
(487, 25, 12, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(488, 25, 13, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(489, 25, 14, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(490, 25, 15, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(491, 25, 16, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(492, 25, 17, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(493, 25, 18, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(494, 25, 19, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:34', '2021-08-04 13:06:34'),
(495, 25, 20, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:36', '2021-08-04 13:06:36'),
(496, 25, 21, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:37', '2021-08-04 13:06:37'),
(497, 25, 22, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:38', '2021-08-04 13:06:38'),
(498, 25, 23, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:39', '2021-08-04 13:06:39'),
(499, 25, 24, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(500, 25, 25, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(501, 25, 26, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(502, 25, 27, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(503, 25, 28, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(504, 25, 29, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(505, 25, 30, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(506, 25, 31, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(507, 25, 32, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:40', '2021-08-04 13:06:40'),
(508, 25, 33, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:41', '2021-08-04 13:06:41'),
(509, 25, 34, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:41', '2021-08-04 13:06:41'),
(510, 25, 35, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:41', '2021-08-04 13:06:41'),
(511, 25, 36, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(512, 25, 37, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(513, 25, 38, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(514, 25, 39, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(515, 25, 40, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(516, 25, 41, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42');
INSERT INTO `user_notifications` (`id`, `matter_id`, `user_id`, `notification_text`, `title`, `title_ar`, `description`, `description_ar`, `image`, `type`, `status`, `created_at`, `updated_at`) VALUES
(517, 25, 42, ' New Notification from Admin At 04-August-2021', NULL, 'سلامسلامسلامسلام', NULL, 'سلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلامسلام', 'public/profile/NUdUuiUWNwKmmQfz4nSrAa5txemfy2zItcDK9O8L.jpg', 'admin', 1, '2021-08-04 13:06:42', '2021-08-04 13:06:42'),
(518, 37, 16, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:20', '2021-08-04 13:17:20'),
(519, 37, 17, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:20', '2021-08-04 13:17:20'),
(520, 37, 18, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:20', '2021-08-04 13:17:20'),
(521, 37, 19, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:20', '2021-08-04 13:17:20'),
(522, 37, 20, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:20', '2021-08-04 13:17:20'),
(523, 37, 21, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(524, 37, 22, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(525, 37, 23, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(526, 37, 24, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(527, 37, 25, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(528, 37, 26, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(529, 37, 27, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(530, 37, 5, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(531, 37, 28, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(532, 37, 29, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(533, 37, 30, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(534, 37, 31, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(535, 37, 32, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(536, 37, 33, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(537, 37, 34, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(538, 37, 35, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(539, 37, 36, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(540, 37, 37, ' New Case Added At 04-August-2021 and case title is surgery test data', NULL, NULL, NULL, NULL, NULL, 'case_added', 1, '2021-08-04 13:17:21', '2021-08-04 13:17:21'),
(541, 23, 23, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:23', '2021-08-05 09:57:23'),
(542, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:24', '2021-08-05 09:57:24'),
(543, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:24', '2021-08-05 09:57:24'),
(544, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:24', '2021-08-05 09:57:24'),
(545, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:24', '2021-08-05 09:57:24'),
(546, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:24', '2021-08-05 09:57:24'),
(547, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(548, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(549, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(550, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(551, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(552, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:25', '2021-08-05 09:57:25'),
(553, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26'),
(554, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26'),
(555, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26'),
(556, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26'),
(557, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26'),
(558, 23, 5, 'Malaria Medicine was Updated by Initiator At 05-August-2021', NULL, NULL, NULL, NULL, NULL, 'case_updated', 1, '2021-08-05 09:57:26', '2021-08-05 09:57:26');

-- --------------------------------------------------------

--
-- Table structure for table `user_notification_settings`
--

CREATE TABLE `user_notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `categorie_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `all_settings` int(11) NOT NULL DEFAULT '1',
  `urgent_settings` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notification_settings`
--

INSERT INTO `user_notification_settings` (`id`, `user_id`, `categorie_id`, `status`, `all_settings`, `urgent_settings`, `created_at`, `updated_at`) VALUES
(6, 16, 6, 1, 1, 0, '2021-07-20 06:17:10', '2021-07-20 06:17:10'),
(7, 16, 7, 1, 1, 0, '2021-07-20 06:17:10', '2021-07-20 06:17:10'),
(9, 17, 6, 1, 1, 0, '2021-07-20 06:21:03', '2021-07-20 06:21:03'),
(10, 17, 7, 1, 1, 0, '2021-07-20 06:21:03', '2021-07-20 06:21:03'),
(12, 18, 6, 1, 1, 0, '2021-07-20 06:24:57', '2021-07-20 06:24:57'),
(13, 18, 7, 1, 1, 0, '2021-07-20 06:24:57', '2021-07-20 06:24:57'),
(15, 19, 6, 1, 1, 0, '2021-07-20 06:28:53', '2021-07-20 06:28:53'),
(16, 19, 7, 1, 1, 0, '2021-07-20 06:28:53', '2021-07-20 06:28:53'),
(18, 20, 6, 1, 1, 0, '2021-07-20 09:17:48', '2021-07-20 09:17:48'),
(19, 20, 7, 1, 1, 0, '2021-07-20 09:17:48', '2021-07-20 09:17:48'),
(20, 21, 6, 1, 1, 0, '2021-07-21 09:12:11', '2021-07-21 09:12:11'),
(21, 21, 7, 1, 1, 0, '2021-07-21 09:12:11', '2021-07-21 09:12:11'),
(22, 21, 8, 1, 1, 0, '2021-07-21 09:12:11', '2021-07-21 09:12:11'),
(23, 21, 9, 1, 1, 0, '2021-07-21 09:12:11', '2021-07-21 09:12:11'),
(28, 22, 6, 1, 1, 1, '2021-07-21 12:16:41', '2021-07-21 12:16:41'),
(29, 22, 7, 1, 1, 1, '2021-07-21 12:16:41', '2021-07-21 12:16:41'),
(30, 22, 9, 1, 1, 1, '2021-07-21 12:16:41', '2021-07-21 12:16:41'),
(36, 24, 6, 1, 1, 0, '2021-07-25 11:38:26', '2021-07-25 11:38:26'),
(37, 24, 7, 1, 1, 0, '2021-07-25 11:38:26', '2021-07-25 11:38:26'),
(38, 24, 8, 1, 1, 0, '2021-07-25 11:38:26', '2021-07-25 11:38:26'),
(39, 24, 9, 1, 1, 0, '2021-07-25 11:38:26', '2021-07-25 11:38:26'),
(40, 24, 10, 1, 1, 0, '2021-07-25 11:38:26', '2021-07-25 11:38:26'),
(41, 25, 6, 1, 1, 0, '2021-07-25 12:08:46', '2021-07-25 12:08:46'),
(42, 25, 7, 1, 1, 0, '2021-07-25 12:08:47', '2021-07-25 12:08:47'),
(43, 25, 8, 1, 1, 0, '2021-07-25 12:08:47', '2021-07-25 12:08:47'),
(44, 25, 9, 1, 1, 0, '2021-07-25 12:08:47', '2021-07-25 12:08:47'),
(45, 25, 10, 1, 1, 0, '2021-07-25 12:08:47', '2021-07-25 12:08:47'),
(46, 26, 6, 1, 1, 0, '2021-07-26 12:52:51', '2021-07-26 12:52:51'),
(47, 26, 7, 1, 1, 0, '2021-07-26 12:52:51', '2021-07-26 12:52:51'),
(48, 26, 8, 1, 1, 0, '2021-07-26 12:52:51', '2021-07-26 12:52:51'),
(49, 26, 9, 1, 1, 0, '2021-07-26 12:52:51', '2021-07-26 12:52:51'),
(50, 26, 10, 1, 1, 0, '2021-07-26 12:52:51', '2021-07-26 12:52:51'),
(51, 27, 6, 1, 1, 0, '2021-07-26 13:06:46', '2021-07-26 13:06:46'),
(52, 27, 7, 1, 1, 0, '2021-07-26 13:06:46', '2021-07-26 13:06:46'),
(53, 27, 8, 1, 1, 0, '2021-07-26 13:06:46', '2021-07-26 13:06:46'),
(54, 27, 9, 1, 1, 0, '2021-07-26 13:06:46', '2021-07-26 13:06:46'),
(55, 27, 10, 1, 1, 0, '2021-07-26 13:06:46', '2021-07-26 13:06:46'),
(61, 28, 6, 1, 1, 0, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(62, 28, 7, 1, 1, 0, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(63, 28, 8, 1, 1, 0, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(64, 28, 9, 1, 1, 0, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(65, 28, 10, 1, 1, 0, '2021-07-30 13:58:13', '2021-07-30 13:58:13'),
(66, 29, 6, 1, 1, 0, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(67, 29, 7, 1, 1, 0, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(68, 29, 8, 1, 1, 0, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(69, 29, 9, 1, 1, 0, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(70, 29, 10, 1, 1, 0, '2021-07-30 14:00:02', '2021-07-30 14:00:02'),
(71, 30, 6, 1, 1, 0, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(72, 30, 7, 1, 1, 0, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(73, 30, 8, 1, 1, 0, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(74, 30, 9, 1, 1, 0, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(75, 30, 10, 1, 1, 0, '2021-07-30 14:04:23', '2021-07-30 14:04:23'),
(76, 31, 6, 1, 1, 0, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(77, 31, 7, 1, 1, 0, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(78, 31, 8, 1, 1, 0, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(79, 31, 9, 1, 1, 0, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(80, 31, 10, 1, 1, 0, '2021-07-30 14:06:02', '2021-07-30 14:06:02'),
(81, 32, 6, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(82, 32, 7, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(83, 32, 8, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(84, 32, 9, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(85, 32, 10, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(86, 32, 11, 1, 1, 0, '2021-08-01 07:53:13', '2021-08-01 07:53:13'),
(87, 33, 6, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(88, 33, 7, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(89, 33, 8, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(90, 33, 9, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(91, 33, 10, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(92, 33, 11, 1, 1, 0, '2021-08-02 03:47:40', '2021-08-02 03:47:40'),
(93, 34, 6, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(94, 34, 7, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(95, 34, 8, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(96, 34, 9, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(97, 34, 10, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(98, 34, 11, 1, 1, 0, '2021-08-02 03:51:23', '2021-08-02 03:51:23'),
(99, 35, 6, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(100, 35, 7, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(101, 35, 8, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(102, 35, 9, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(103, 35, 10, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(104, 35, 11, 1, 1, 0, '2021-08-02 06:00:22', '2021-08-02 06:00:22'),
(105, 36, 6, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(106, 36, 7, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(107, 36, 8, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(108, 36, 9, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(109, 36, 10, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(110, 36, 11, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(111, 36, 12, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(112, 36, 13, 1, 1, 0, '2021-08-02 09:39:11', '2021-08-02 09:39:11'),
(113, 37, 6, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(114, 37, 7, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(115, 37, 8, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(116, 37, 9, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(117, 37, 10, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(118, 37, 11, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(119, 37, 19, 1, 1, 0, '2021-08-03 09:26:26', '2021-08-03 09:26:26'),
(152, 23, 6, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(153, 23, 7, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(154, 23, 8, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(155, 23, 9, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(156, 23, 10, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(157, 23, 11, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(158, 23, 12, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(159, 23, 13, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(160, 23, 14, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(161, 23, 15, 1, 1, 1, '2021-08-05 09:22:14', '2021-08-05 09:22:14'),
(254, 5, 6, 1, 0, 1, '2021-08-06 05:17:36', '2021-08-06 05:17:36'),
(255, 5, 7, 1, 0, 1, '2021-08-06 05:17:36', '2021-08-06 05:17:36'),
(256, 5, 8, 1, 0, 1, '2021-08-06 05:17:36', '2021-08-06 05:17:36'),
(257, 5, 9, 1, 0, 1, '2021-08-06 05:17:36', '2021-08-06 05:17:36'),
(258, 5, 10, 1, 0, 1, '2021-08-06 05:17:36', '2021-08-06 05:17:36');

-- --------------------------------------------------------

--
-- Table structure for table `user_views`
--

CREATE TABLE `user_views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `matter_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_views`
--

INSERT INTO `user_views` (`id`, `user_id`, `matter_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 23, 1, '2021-07-27 06:35:54', '2021-07-27 06:35:54'),
(2, 5, 22, 1, '2021-07-27 06:38:30', '2021-07-27 06:38:30'),
(3, 20, 9, 1, '2021-07-27 06:56:30', '2021-07-27 06:56:30'),
(4, 20, 8, 1, '2021-07-27 06:58:45', '2021-07-27 06:58:45'),
(5, 20, 26, 1, '2021-07-27 07:02:38', '2021-07-27 07:02:38'),
(6, 5, 26, 1, '2021-07-27 07:08:25', '2021-07-27 07:08:25'),
(7, 5, 21, 1, '2021-07-27 07:08:52', '2021-07-27 07:08:52'),
(8, 5, 25, 1, '2021-07-27 07:11:05', '2021-07-27 07:11:05'),
(9, 5, 14, 1, '2021-07-27 09:10:43', '2021-07-27 09:10:43'),
(10, 5, 7, 1, '2021-07-27 09:10:52', '2021-07-27 09:10:52'),
(11, 11, 26, 1, '2021-07-27 13:46:58', '2021-07-27 13:46:58'),
(12, 5, 20, 1, '2021-07-28 06:11:20', '2021-07-28 06:11:20'),
(13, 23, 23, 1, '2021-07-28 11:28:51', '2021-07-28 11:28:51'),
(14, 23, 22, 1, '2021-07-28 11:49:39', '2021-07-28 11:49:39'),
(15, 23, 13, 1, '2021-07-28 11:56:29', '2021-07-28 11:56:29'),
(16, 23, 26, 1, '2021-07-28 11:58:06', '2021-07-28 11:58:06'),
(17, 23, 25, 1, '2021-07-28 11:58:33', '2021-07-28 11:58:33'),
(18, 23, 27, 1, '2021-07-28 12:02:57', '2021-07-28 12:02:57'),
(19, 23, 14, 1, '2021-07-28 12:03:55', '2021-07-28 12:03:55'),
(20, 23, 24, 1, '2021-07-28 12:04:09', '2021-07-28 12:04:09'),
(21, 23, 19, 1, '2021-07-28 12:07:46', '2021-07-28 12:07:46'),
(22, 11, 21, 1, '2021-07-28 12:12:31', '2021-07-28 12:12:31'),
(23, 11, 20, 1, '2021-07-28 12:29:46', '2021-07-28 12:29:46'),
(24, 5, 19, 1, '2021-07-28 12:39:39', '2021-07-28 12:39:39'),
(25, 11, 19, 1, '2021-07-28 12:49:02', '2021-07-28 12:49:02'),
(26, 23, 10, 1, '2021-07-28 13:39:35', '2021-07-28 13:39:35'),
(27, 23, 21, 1, '2021-07-28 13:40:04', '2021-07-28 13:40:04'),
(28, 11, 24, 1, '2021-07-29 10:32:06', '2021-07-29 10:32:06'),
(29, 11, 28, 1, '2021-07-29 12:53:27', '2021-07-29 12:53:27'),
(30, 20, 28, 1, '2021-07-29 12:53:41', '2021-07-29 12:53:41'),
(31, 5, 28, 1, '2021-07-29 12:55:32', '2021-07-29 12:55:32'),
(32, 11, 7, 1, '2021-07-29 13:46:27', '2021-07-29 13:46:27'),
(33, 5, 8, 1, '2021-07-30 05:40:26', '2021-07-30 05:40:26'),
(34, 5, 27, 1, '2021-07-30 07:11:11', '2021-07-30 07:11:11'),
(35, 11, 14, 1, '2021-07-30 14:08:58', '2021-07-30 14:08:58'),
(36, 11, 10, 1, '2021-07-30 14:35:16', '2021-07-30 14:35:16'),
(37, 11, 22, 1, '2021-07-30 14:35:38', '2021-07-30 14:35:38'),
(38, 5, 30, 1, '2021-07-30 15:00:32', '2021-07-30 15:00:32'),
(39, 11, 30, 1, '2021-08-03 10:11:18', '2021-08-03 10:11:18'),
(40, 11, 8, 1, '2021-08-03 10:12:58', '2021-08-03 10:12:58'),
(41, 11, 27, 1, '2021-08-03 10:44:23', '2021-08-03 10:44:23'),
(42, 11, 33, 1, '2021-08-03 11:45:15', '2021-08-03 11:45:15'),
(43, 11, 25, 1, '2021-08-03 12:24:09', '2021-08-03 12:24:09'),
(44, 11, 17, 1, '2021-08-03 12:36:33', '2021-08-03 12:36:33'),
(45, 5, 33, 1, '2021-08-03 13:00:56', '2021-08-03 13:00:56'),
(46, 11, 34, 1, '2021-08-04 10:14:38', '2021-08-04 10:14:38'),
(47, 11, 35, 1, '2021-08-04 12:19:44', '2021-08-04 12:19:44'),
(48, 11, 36, 1, '2021-08-04 12:54:22', '2021-08-04 12:54:22'),
(49, 11, 29, 1, '2021-08-04 12:55:10', '2021-08-04 12:55:10'),
(50, 23, 18, 1, '2021-08-05 04:15:10', '2021-08-05 04:15:10'),
(51, 23, 29, 1, '2021-08-05 04:19:36', '2021-08-05 04:19:36'),
(52, 23, 31, 1, '2021-08-05 04:37:08', '2021-08-05 04:37:08'),
(53, 23, 35, 1, '2021-08-05 04:38:47', '2021-08-05 04:38:47'),
(54, 23, 20, 1, '2021-08-05 04:45:41', '2021-08-05 04:45:41'),
(55, 23, 12, 1, '2021-08-05 09:11:59', '2021-08-05 09:11:59'),
(56, 23, 37, 1, '2021-08-05 09:15:14', '2021-08-05 09:15:14'),
(57, 5, 36, 1, '2021-08-05 09:25:17', '2021-08-05 09:25:17'),
(58, 5, 31, 1, '2021-08-05 09:26:48', '2021-08-05 09:26:48'),
(59, 5, 29, 1, '2021-08-05 09:26:52', '2021-08-05 09:26:52'),
(60, 44, 8, 1, '2021-08-05 11:15:26', '2021-08-05 11:15:26'),
(61, 44, 31, 1, '2021-08-05 12:36:58', '2021-08-05 12:36:58'),
(62, 44, 36, 1, '2021-08-05 12:37:16', '2021-08-05 12:37:16'),
(63, 44, 37, 1, '2021-08-05 12:38:18', '2021-08-05 12:38:18'),
(64, 44, 35, 1, '2021-08-05 12:38:26', '2021-08-05 12:38:26'),
(65, 44, 26, 1, '2021-08-05 12:38:30', '2021-08-05 12:38:30'),
(66, 44, 29, 1, '2021-08-05 12:39:10', '2021-08-05 12:39:10'),
(67, 44, 23, 1, '2021-08-05 12:55:37', '2021-08-05 12:55:37'),
(68, 5, 18, 1, '2021-08-06 05:49:20', '2021-08-06 05:49:20'),
(69, 5, 38, 1, '2021-08-06 10:44:22', '2021-08-06 10:44:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `bank_details`
--
ALTER TABLE `bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_messages`
--
ALTER TABLE `bulk_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cities_countrie_id_foreign` (`countrie_id`),
  ADD KEY `cities_state_id_foreign` (`state_id`);

--
-- Indexes for table `content_pages`
--
ALTER TABLE `content_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_notifications`
--
ALTER TABLE `email_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `followers`
--
ALTER TABLE `followers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `followers_matter_id_foreign` (`matter_id`),
  ADD KEY `followers_user_id_foreign` (`user_id`);

--
-- Indexes for table `matters`
--
ALTER TABLE `matters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matters_provider_id_foreign` (`provider_id`),
  ADD KEY `matters_categorie_id_foreign` (`categorie_id`);

--
-- Indexes for table `matter_attachments`
--
ALTER TABLE `matter_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matter_attachments_matter_id_foreign` (`matter_id`);

--
-- Indexes for table `matter_contributors`
--
ALTER TABLE `matter_contributors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matter_contributors_user_id_foreign` (`user_id`),
  ADD KEY `matter_contributors_matter_id_foreign` (`matter_id`);

--
-- Indexes for table `matter_updates`
--
ALTER TABLE `matter_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matter_updates_provider_id_foreign` (`provider_id`),
  ADD KEY `matter_updates_categorie_id_foreign` (`categorie_id`),
  ADD KEY `matter_updates_matter_id_foreign` (`matter_id`);

--
-- Indexes for table `matter_update_attachments`
--
ALTER TABLE `matter_update_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matter_update_attachments_matter_update_id_foreign` (`matter_update_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `providers_email_unique` (`email`);

--
-- Indexes for table `provider_notifications`
--
ALTER TABLE `provider_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_notifications_matter_id_foreign` (`matter_id`),
  ADD KEY `provider_notifications_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `provider_notification_settings`
--
ALTER TABLE `provider_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_notification_settings_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `push_notifications`
--
ALTER TABLE `push_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_user_id_foreign` (`user_id`),
  ADD KEY `shipments_categorie_id_foreign` (`categorie_id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `states_countrie_id_foreign` (`countrie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_matter_id_foreign` (`matter_id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notification_settings_user_id_foreign` (`user_id`),
  ADD KEY `user_notification_settings_categorie_id_foreign` (`categorie_id`);

--
-- Indexes for table `user_views`
--
ALTER TABLE `user_views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_views_user_id_foreign` (`user_id`),
  ADD KEY `user_views_matter_id_foreign` (`matter_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bank_details`
--
ALTER TABLE `bank_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bulk_messages`
--
ALTER TABLE `bulk_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `content_pages`
--
ALTER TABLE `content_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `email_notifications`
--
ALTER TABLE `email_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `followers`
--
ALTER TABLE `followers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `matters`
--
ALTER TABLE `matters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `matter_attachments`
--
ALTER TABLE `matter_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `matter_contributors`
--
ALTER TABLE `matter_contributors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `matter_updates`
--
ALTER TABLE `matter_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `matter_update_attachments`
--
ALTER TABLE `matter_update_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `provider_notifications`
--
ALTER TABLE `provider_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `provider_notification_settings`
--
ALTER TABLE `provider_notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `push_notifications`
--
ALTER TABLE `push_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=559;

--
-- AUTO_INCREMENT for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT for table `user_views`
--
ALTER TABLE `user_views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_countrie_id_foreign` FOREIGN KEY (`countrie_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cities_state_id_foreign` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `followers_matter_id_foreign` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `followers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matters`
--
ALTER TABLE `matters`
  ADD CONSTRAINT `matters_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matters_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matter_attachments`
--
ALTER TABLE `matter_attachments`
  ADD CONSTRAINT `matter_attachments_matter_id_foreign` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matter_contributors`
--
ALTER TABLE `matter_contributors`
  ADD CONSTRAINT `matter_contributors_matter_id_foreign` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matter_contributors_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matter_updates`
--
ALTER TABLE `matter_updates`
  ADD CONSTRAINT `matter_updates_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matter_updates_matter_id_foreign` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `matter_updates_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matter_update_attachments`
--
ALTER TABLE `matter_update_attachments`
  ADD CONSTRAINT `matter_update_attachments_matter_update_id_foreign` FOREIGN KEY (`matter_update_id`) REFERENCES `matter_updates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provider_notifications`
--
ALTER TABLE `provider_notifications`
  ADD CONSTRAINT `provider_notifications_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provider_notification_settings`
--
ALTER TABLE `provider_notification_settings`
  ADD CONSTRAINT `provider_notification_settings_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `shipments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `states_countrie_id_foreign` FOREIGN KEY (`countrie_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notification_settings`
--
ALTER TABLE `user_notification_settings`
  ADD CONSTRAINT `user_notification_settings_categorie_id_foreign` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_notification_settings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_views`
--
ALTER TABLE `user_views`
  ADD CONSTRAINT `user_views_matter_id_foreign` FOREIGN KEY (`matter_id`) REFERENCES `matters` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_views_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
