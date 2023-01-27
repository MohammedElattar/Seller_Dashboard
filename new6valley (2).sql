-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 05, 2023 at 03:26 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new6valley`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_role_id` bigint NOT NULL DEFAULT '2',
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `admin_role_id`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Admin', '01023456788', 1, '2022-11-07-63686fbba56e3.png', 'Everest@admin.com', NULL, '$2y$10$KH67ZITTOCg6clThe9UM/.ajqxkCCJ.PmiYSuYNxikxxFajK73JEu', '49gFZcnVjaBfATPjm4ibSeBbFU6OsxdJ0PyVjApSGI0edUCLYtvQlv5UReQc', NULL, '2022-12-13 11:42:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_access` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `module_access`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Master Admin', NULL, 1, NULL, NULL),
(7, 'Supper Admin', '[\"order_management\",\"product_management\",\"marketing_section\",\"business_section\",\"user_section\",\"support_section\",\"business_settings\",\"web_&_app_settings\",\"report\",\"employee_section\",\"dashboard\",\"pos_management\",\"refund_management\"]', 1, '2022-10-14 21:46:04', '2022-10-14 21:46:04'),
(8, 'Refund management', '[\"order_management\",\"product_management\",\"marketing_section\",\"business_section\",\"user_section\",\"support_section\",\"business_settings\",\"web_&_app_settings\",\"employee_section\",\"dashboard\",\"pos_management\"]', 1, '2022-10-14 21:47:16', '2022-11-15 09:10:29'),
(9, 'Employee', '[\"order_management\",\"product_management\",\"pos_management\"]', 1, '2022-10-14 21:48:47', '2022-10-14 21:48:47');

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallets`
--

CREATE TABLE `admin_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `inhouse_earning` double NOT NULL DEFAULT '0',
  `withdrawn` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_earned` double(8,2) NOT NULL DEFAULT '0.00',
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT '0.00',
  `pending_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `total_tax_collected` double(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_wallets`
--

INSERT INTO `admin_wallets` (`id`, `admin_id`, `inhouse_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_earned`, `delivery_charge_earned`, `pending_amount`, `total_tax_collected`) VALUES
(1, 1, 10, 0, NULL, '2022-10-27 17:54:34', 0.00, 5.00, 0.00, 0.60);

-- --------------------------------------------------------

--
-- Table structure for table `admin_wallet_histories`
--

CREATE TABLE `admin_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `admin_id` bigint DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adverts`
--

CREATE TABLE `adverts` (
  `id` bigint NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `added-by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `adverts`
--

INSERT INTO `adverts` (`id`, `name`, `image`, `status`, `added-by`, `created_at`, `updated_at`) VALUES
(23, 'Voyages & Tourisme', '2022-11-15-6373c5992f4a4.png', '1', NULL, '2022-11-15 16:00:09', '2022-11-15 16:00:09'),
(24, 'Soddim', '2022-11-15-6373c64626da0.png', '1', NULL, '2022-11-15 16:03:02', '2022-11-15 16:03:02'),
(25, 'tripledesign', '2022-11-15-6373c6abdc3f9.png', '1', NULL, '2022-11-15 16:04:43', '2022-11-15 16:04:43'),
(26, 'mix-nuts', '2022-11-15-6373c79346a86.png', '1', NULL, '2022-11-15 16:08:35', '2022-11-15 16:08:35'),
(27, 'SO GE LUX', '2022-11-15-6373c80a0cf10.png', '1', NULL, '2022-11-15 16:10:34', '2022-11-15 16:10:34'),
(28, 'Jumeaux', '2022-11-15-6373cb42da680.png', '1', NULL, '2022-11-15 16:24:18', '2022-11-15 16:24:18'),
(29, 'Orca', '2022-11-15-6373f33232e5a.png', '1', NULL, '2022-11-15 19:14:42', '2022-11-15 19:14:42'),
(30, 'LES IMMORTELS SOUVENIRS', '2022-11-15-6373f3f448c4b.png', '1', NULL, '2022-11-15 19:17:56', '2022-11-15 19:17:56'),
(31, 'Mamman Mia', '2022-11-16-63750e5a0022d.png', '1', NULL, '2022-11-16 15:22:50', '2022-11-16 15:22:50'),
(32, 'Azol', '2022-12-03-638bbf2e9a0b9.png', '1', NULL, '2022-12-03 20:27:10', '2022-12-03 20:27:10');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Size', '2022-10-08 16:56:42', '2022-10-08 16:56:42'),
(2, 'Weight', '2022-10-09 08:36:12', '2022-10-09 08:36:12'),
(3, 'Length', '2022-10-09 08:38:58', '2022-10-09 08:38:58'),
(4, 'Width', '2022-10-09 08:39:54', '2022-10-09 08:39:54'),
(5, 'Diameter', '2022-10-09 08:48:43', '2022-10-09 08:48:43'),
(6, 'Dimensions', '2022-10-09 08:49:15', '2022-10-09 08:49:15'),
(7, 'Depth', '2022-10-09 08:50:24', '2022-10-09 08:50:24'),
(8, 'stock', '2022-10-14 00:13:37', '2022-10-14 00:13:37'),
(9, 'Food', '2022-10-14 00:41:00', '2022-10-14 00:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint UNSIGNED NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing_addresses`
--

CREATE TABLE `billing_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED DEFAULT NULL,
  `contact_person_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` int UNSIGNED DEFAULT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nike', '2022-10-09-6342a298adc52.png', 1, '2022-10-08 16:51:44', '2022-10-09 08:29:44'),
(2, 'Adidass', '2022-10-09-6342a2fe86d93.png', 1, '2022-10-09 08:31:26', '2022-10-09 08:31:26'),
(3, 'Zara', '2022-10-09-6342a39b2fffb.png', 1, '2022-10-09 08:34:03', '2022-10-09 08:34:03'),
(4, 'Syrian', '2022-10-14-6348c2df9be25.png', 1, '2022-10-13 23:57:16', '2022-10-14 00:01:03'),
(5, 'Egypt', '2022-10-14-6348c32d0583d.png', 1, '2022-10-13 23:58:10', '2022-10-14 00:02:21'),
(6, 'cotonial', '2022-10-30-635e18401859d.png', 1, '2022-10-30 05:22:56', '2022-10-30 05:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `business_settings`
--

CREATE TABLE `business_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_settings`
--

INSERT INTO `business_settings` (`id`, `type`, `value`, `created_at`, `updated_at`) VALUES
(1, 'system_default_currency', '8', '2020-10-11 07:43:44', '2022-11-13 06:23:19'),
(2, 'language', '[{\"id\":\"1\",\"name\":\"English\",\"direction\":\"ltr\",\"code\":\"en\",\"status\":1,\"default\":false},{\"id\":3,\"name\":\"French\",\"direction\":\"ltr\",\"code\":\"fr\",\"status\":1,\"default\":false},{\"id\":4,\"name\":\"Arabic\",\"direction\":\"rtl\",\"code\":\"lb\",\"status\":1,\"default\":true}]', '2020-10-11 07:53:02', '2022-11-21 18:35:49'),
(3, 'mail_config', '{\"status\":0,\"name\":\"demo\",\"host\":\"mail.demo.com\",\"driver\":\"SMTP\",\"port\":\"587\",\"username\":\"info@demo.com\",\"email_id\":\"info@demo.com\",\"encryption\":\"TLS\",\"password\":\"demo\"}', '2020-10-12 10:29:18', '2021-07-06 12:32:01'),
(4, 'cash_on_delivery', '{\"status\":\"1\"}', NULL, '2021-05-25 21:21:15'),
(6, 'ssl_commerz_payment', '{\"status\":\"0\",\"environment\":\"sandbox\",\"store_id\":\"\",\"store_password\":\"\"}', '2020-11-09 08:36:51', '2022-06-05 09:35:46'),
(7, 'paypal', '{\"status\":\"0\",\"environment\":\"sandbox\",\"paypal_client_id\":\"\",\"paypal_secret\":\"\"}', '2020-11-09 08:51:39', '2022-06-05 09:35:46'),
(8, 'stripe', '{\"status\":\"0\",\"api_key\":null,\"published_key\":null}', '2020-11-09 09:01:47', '2021-07-06 12:30:05'),
(10, 'company_phone', '+2250788998998', NULL, '2020-12-08 14:15:01'),
(11, 'company_name', 'Everest', NULL, '2021-02-27 18:11:53'),
(12, 'company_web_logo', '2022-12-08-6391b555c98f5.png', NULL, '2022-12-08 08:58:45'),
(13, 'company_mobile_logo', '2022-10-14-6349f36061f5c.png', NULL, '2022-10-14 21:40:16'),
(14, 'terms_condition', '<p><strong>Conditions d&#39;Utilisation de notre Site Web</strong></p>\r\n\r\n<p>En utilisant notre site Web, vous &ecirc;tes soumis aux conditions suivantes ci-dessous, qui s&#39;appliquent &eacute;galement &agrave; votre utilisation de notre site. Vous pouvez utiliser ces termes et conditions dans leur int&eacute;gralit&eacute;. Si vous n&#39;&ecirc;tes pas d&#39;accord avec une partie de ces termes et conditions, veuillez ne pas utiliser notre site Internet. :</p>\r\n\r\n<ol>\r\n	<li>Le site Web et l&#39;application ne peuvent &ecirc;tre utilis&eacute;s d&#39;aucune mani&egrave;re qui viole les lois et r&egrave;gles g&eacute;n&eacute;rales.</li>\r\n	<li>Il est interdit de publier ou de transmettre des informations contraires &agrave; la morale publique, des allusions obsc&egrave;nes ou contenant une discrimination raciale, ethnique ou ill&eacute;gale.</li>\r\n	<li>Le site et l&#39;application ne sont pas responsables de l&#39;affichage d&#39;articles ill&eacute;gaux, vol&eacute;s ou douaniers. Le vendeur en assume l&#39;enti&egrave;re responsabilit&eacute; l&eacute;gale.</li>\r\n	<li>Le site et l&#39;application ne sont pas responsables de la modification des sp&eacute;cifications convenues.</li>\r\n	<li>Le site et l&#39;application ne sont pas responsables des d&eacute;fauts ou du remplacement de tout produit, et ne sont pas non plus responsables de la vente de tout produit en violation de ce qui a &eacute;t&eacute; pr&eacute;sent&eacute; sur le site et l&#39;application, et l&#39;exposant du produit en assume l&#39;enti&egrave;re responsabilit&eacute;.</li>\r\n	<li>La gestion du site et de l&#39;application a le droit d&#39;effectuer la maintenance du site et de l&#39;application pendant des p&eacute;riodes limit&eacute;es sans que l&#39;abonn&eacute; demande une quelconque indemnit&eacute; pendant la p&eacute;riode de maintenance</li>\r\n	<li>En cas de violation des conditions g&eacute;n&eacute;rales par l&#39;un des abonn&eacute;s, l&#39;administration du site et de l&#39;application a le droit d&#39;exclure l&#39;abonn&eacute; pour une dur&eacute;e temporaire ou d&eacute;finitive sans droit &agrave; aucune indemnit&eacute;.</li>\r\n	<li>Notre site s&#39;engage &agrave; maintenir et &agrave; prot&eacute;ger la confidentialit&eacute; des donn&eacute;es des utilisateurs du site et &agrave; ne pas partager les donn&eacute;es des utilisateurs avec d&#39;autres parties pour quelque raison que ce soit.</li>\r\n	<li>Les utilisateurs de notre site Web et les b&eacute;n&eacute;ficiaires de ses services doivent constamment consulter les conditions d&rsquo;utilisation de ce site et la confidentialit&eacute; des informations pour conna&icirc;tre les mises &agrave; jour effectu&eacute;es sur celui-ci.</li>\r\n</ol>\r\n\r\n<hr />\r\n<hr />\r\n<p><strong>Terms of Use of our Website</strong></p>\r\n\r\n<p><strong>&nbsp;</strong>By using our website, you are subject to the following conditions, which also apply to your use of our website. You may use these terms and conditions in their entirety. If you do not agree with any of these terms and conditions, please do not use our website.:</p>\r\n\r\n<ol>\r\n	<li>The website and application should not be used in any way that violates laws and general rules.</li>\r\n	<li>It is forbidden to publish or transmit information contrary to public morality, obscene allusions or containing racial, ethnic or illegal discrimination.</li>\r\n	<li>Our site and application are not responsible for the display of illegal, stolen or non-taxed items. The seller assumes full legal responsibility.</li>\r\n	<li>The site and application are not responsible for changing the agreed specifications.</li>\r\n	<li>The site and the application are not responsible for defects or replacement of any product, nor are they responsible for the sale of any product in violation of what was presented on the site and the application, and the exhibitor of the product assumes full responsibility.</li>\r\n	<li>Site and Application Management has the right to perform site and application maintenance for limited periods without the subscriber requesting any compensation during the maintenance period</li>\r\n	<li>In case of violation of the general conditions by one of the subscribers, the administration of the site and the application has the right to exclude the subscriber for a temporary or permanent period without right to any compensation.</li>\r\n	<li>Our site is committed to maintaining and protecting the privacy of site users&#39; data and not sharing user data with other parties for any reason.</li>\r\n	<li>Users of our website and beneficiaries of its services should constantly see the terms and conditions for using this site and the confidentiality of information to find out any updates made on it.</li>\r\n</ol>\r\n\r\n<hr />\r\n<hr />\r\n<p><span dir=\"rtl\">الشروط والاحكام</span></p>\r\n\r\n<ol>\r\n	<li><span dir=\"rtl\">لا يجوز استخدام الموقع والتطبيق باي طريقة فيها خرق للقوانين والاحكام والقواعد العامة.</span></li>\r\n	<li><span dir=\"rtl\">لا يجوز نشر أو إرسال اي معلومات مخالفة للآداب العامة او أي إيحاءات فاحشة او تمييز عنصري او عرقي او غير قانوني.</span></li>\r\n	<li><span dir=\"rtl\">&nbsp;الموقع والتطبيق غير مسئولين عن عرض المنتجات غير القانونية والمسروقة وغير المجمركة ويحمل البائع المسئولية القانونية كاملة.</span></li>\r\n	<li><span dir=\"rtl\">الموقع والتطبيق غير مسئولين عن تغير المواصفات المتفق عليها.</span></li>\r\n	<li><span dir=\"rtl\">الموقع والتطبيق غير مسئولين عن تبديل المنتج او اي عيوب في المنتج او ان يكون المنتج مخالفا لما تم عرضة على الموقع والتطبيق ويتحمل عارض المنتج وحدة المسئولية كاملة.</span></li>\r\n	<li><span dir=\"rtl\">يحق لإدارة الموقع والتطبيق اجراء صيانة الموقع والتطبيق لفترات محدودة دون طلب المشترك لاي تعويض في خلال فترة الصيانة.</span></li>\r\n	<li><span dir=\"rtl\">في حالة أي مخالفة للشروط والاحكام من قبل أحد المشتركين، يحق لإدارة الموقع والتطبيق حظر المشترك لفترة مؤقتة او بشكل دائم دون الحق بمطالبة باي تعويض.</span></li>\r\n	<li><span dir=\"rtl\">يلتزم موقعنا بالحفاظ وحماية سرية بيانات المستخدمين للموقع وعدم مشاركة أي بيانات للمستخدمين مع أي جهات أخرى لأي سبب كان.</span></li>\r\n	<li>\r\n	<p><span dir=\"rtl\">&nbsp;<a name=\"_Hlk116244376\">يجب على مستخدمين موقعنا والمستفيدين من خدماته الاطلاع بشكل مستمر على الشروط والاحكام الخاصة باستخدام الموقع وسرية المعلومات لمعرفة أية تحديثات تتم عليه</a>.</span></p>\r\n	</li>\r\n</ol>\r\n\r\n<hr />\r\n<hr />\r\n<p>&nbsp;</p>', NULL, '2022-10-09 17:33:03'),
(15, 'about_us', '<p>this is about us page. hello and hi from about page description..</p>', NULL, '2021-06-11 01:42:53'),
(16, 'sms_nexmo', '{\"status\":\"0\",\"nexmo_key\":\"custo5cc042f7abf4c\",\"nexmo_secret\":\"custo5cc042f7abf4c@ssl\"}', NULL, NULL),
(17, 'company_email', 'help@everest-ci.com', NULL, '2021-03-15 12:29:51'),
(18, 'colors', '{\"primary\":\"#05a165\",\"secondary\":\"#000000\"}', '2020-10-11 13:53:02', '2022-12-09 06:20:44'),
(19, 'company_footer_logo', '2022-12-09-6392e1ccb0cd7.png', NULL, '2022-12-09 06:20:44'),
(20, 'company_copyright_text', 'Doctor-code.net@2022', NULL, '2021-03-15 12:30:47'),
(21, 'download_app_apple_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/www.target.com\\/s\\/apple+store++now?ref=tgt_adv_XS000000&AFID=msn&fndsrc=tgtao&DFA=71700000012505188&CPNG=Electronics_Portable+Computers&adgroup=Portable+Computers&LID=700000001176246&LNM=apple+store+near+me+now&MT=b&network=s&device=c&location=12&targetid=kwd-81913773633608:loc-12&ds_rl=1246978&ds_rl=1248099&gclsrc=ds\"}', NULL, '2020-12-08 12:54:53'),
(22, 'download_app_google_stroe', '{\"status\":\"1\",\"link\":\"https:\\/\\/play.google.com\\/store\\/apps\\/developer?id=Dr-Code\"}', NULL, '2022-12-06 16:25:46'),
(23, 'company_fav_icon', '2022-10-14-6349f36079d7e.png', '2020-10-11 13:53:02', '2022-10-14 21:40:16'),
(24, 'fcm_topic', '', NULL, NULL),
(25, 'fcm_project_id', '', NULL, NULL),
(26, 'push_notification_key', 'Put your firebase server key here.', NULL, NULL),
(27, 'order_pending_message', '{\"status\":\"1\",\"message\":\"order pen message\"}', NULL, NULL),
(28, 'order_confirmation_msg', '{\"status\":\"1\",\"message\":\"Order con Message\"}', NULL, NULL),
(29, 'order_processing_message', '{\"status\":\"1\",\"message\":\"Order pro Message\"}', NULL, NULL),
(30, 'out_for_delivery_message', '{\"status\":\"1\",\"message\":\"Order ouut Message\"}', NULL, NULL),
(31, 'order_delivered_message', '{\"status\":\"1\",\"message\":\"Order del Message\"}', NULL, NULL),
(32, 'razor_pay', '{\"status\":\"0\",\"razor_key\":null,\"razor_secret\":null}', NULL, '2021-07-06 12:30:14'),
(33, 'sales_commission', '0', NULL, '2021-06-11 18:13:13'),
(34, 'seller_registration', '1', NULL, '2021-06-04 21:02:48'),
(35, 'pnc_language', '[\"en\",\"fr\",\"lb\"]', NULL, NULL),
(36, 'order_returned_message', '{\"status\":\"1\",\"message\":\"Order hh Message\"}', NULL, NULL),
(37, 'order_failed_message', '{\"status\":null,\"message\":\"Order fa Message\"}', NULL, NULL),
(40, 'delivery_boy_assign_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(41, 'delivery_boy_start_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(42, 'delivery_boy_delivered_message', '{\"status\":0,\"message\":\"\"}', NULL, NULL),
(43, 'terms_and_conditions', '', NULL, NULL),
(44, 'minimum_order_value', '1', NULL, NULL),
(45, 'privacy_policy', '<p>my privacy policy</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2021-07-06 11:09:07'),
(46, 'paystack', '{\"status\":\"0\",\"publicKey\":null,\"secretKey\":null,\"paymentUrl\":\"https:\\/\\/api.paystack.co\",\"merchantEmail\":null}', NULL, '2021-07-06 12:30:35'),
(47, 'senang_pay', '{\"status\":\"0\",\"secret_key\":null,\"merchant_id\":null}', NULL, '2021-07-06 12:30:23'),
(48, 'currency_model', 'single_currency', NULL, NULL),
(49, 'social_login', '[{\"login_medium\":\"google\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"},{\"login_medium\":\"facebook\",\"client_id\":\"\",\"client_secret\":\"\",\"status\":\"\"}]', NULL, NULL),
(50, 'digital_payment', '{\"status\":\"1\"}', NULL, NULL),
(51, 'phone_verification', '0', NULL, NULL),
(52, 'email_verification', '0', NULL, NULL),
(53, 'order_verification', '0', NULL, NULL),
(54, 'country_code', 'CI', NULL, NULL),
(55, 'pagination_limit', '10', NULL, NULL),
(56, 'shipping_method', 'sellerwise_shipping', NULL, NULL),
(57, 'paymob_accept', '{\"status\":\"0\",\"api_key\":\"\",\"iframe_id\":\"\",\"integration_id\":\"\",\"hmac\":\"\"}', NULL, NULL),
(58, 'bkash', '{\"status\":\"0\",\"environment\":\"sandbox\",\"api_key\":\"\",\"api_secret\":\"\",\"username\":\"\",\"password\":\"\"}', NULL, '2022-06-05 09:35:46'),
(59, 'forgot_password_verification', 'email', NULL, NULL),
(60, 'paytabs', '{\"status\":0,\"profile_id\":\"\",\"server_key\":\"\",\"base_url\":\"https:\\/\\/secure-egypt.paytabs.com\\/\"}', NULL, '2021-11-21 03:01:40'),
(61, 'stock_limit', '7', NULL, NULL),
(62, 'flutterwave', '{\"status\":1,\"public_key\":\"\",\"secret_key\":\"\",\"hash\":\"\"}', NULL, NULL),
(63, 'mercadopago', '{\"status\":1,\"public_key\":\"\",\"access_token\":\"\"}', NULL, NULL),
(64, 'announcement', '{\"status\":\"0\",\"color\":\"#000000\",\"text_color\":\"#fa0000\",\"announcement\":null}', NULL, NULL),
(65, 'fawry_pay', '{\"status\":0,\"merchant_code\":\"\",\"security_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(66, 'recaptcha', '{\"status\":0,\"site_key\":\"\",\"secret_key\":\"\"}', NULL, '2022-01-18 09:46:30'),
(67, 'seller_pos', '0', NULL, NULL),
(68, 'liqpay', '{\"status\":0,\"public_key\":\"\",\"private_key\":\"\"}', NULL, NULL),
(69, 'paytm', '{\"status\":0,\"environment\":\"sandbox\",\"paytm_merchant_key\":\"\",\"paytm_merchant_mid\":\"\",\"paytm_merchant_website\":\"\",\"paytm_refund_url\":\"\"}', NULL, '2022-06-05 09:35:46'),
(70, 'refund_day_limit', '0', NULL, NULL),
(71, 'business_mode', 'multi', NULL, NULL),
(72, 'mail_config_sendgrid', '{\"status\":0,\"name\":\"\",\"host\":\"\",\"driver\":\"\",\"port\":\"\",\"username\":\"\",\"email_id\":\"\",\"encryption\":\"\",\"password\":\"\"}', NULL, NULL),
(73, 'decimal_point_settings', '2', NULL, NULL),
(74, 'shop_address', '', NULL, NULL),
(75, 'billing_input_by_customer', '1', NULL, NULL),
(76, 'wallet_status', '0', NULL, NULL),
(77, 'loyalty_point_status', '0', NULL, NULL),
(78, 'wallet_add_refund', '0', NULL, NULL),
(79, 'loyalty_point_exchange_rate', '0', NULL, NULL),
(80, 'loyalty_point_item_purchase_point', '0', NULL, NULL),
(81, 'loyalty_point_minimum_point', '0', NULL, NULL),
(82, 'currency_symbol_position', 'right', '2022-10-02 16:11:30', '2022-11-07 01:18:34'),
(83, 'timezone', 'UTC', NULL, NULL),
(84, 'default_location', '{\"lat\":null,\"lng\":null}', NULL, NULL),
(85, 'loader_gif', '2022-10-14-6349f36085bc8.png', NULL, NULL),
(86, 'shop_banner', '2022-12-08-6391b567e4349.png', NULL, NULL),
(87, 'map_api_key', 'AIzaSyDfnUAEQtTSJ1ca2GZKF0_MPc16K6MixlI', NULL, NULL),
(88, 'map_api_key_server', 'AIzaSyDfnUAEQtTSJ1ca2GZKF0_MPc16K6MixlI', NULL, NULL),
(89, 'maintenance_mode', '0', '2022-11-07 01:18:10', '2022-11-07 01:18:10');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `cart_group_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `color` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variations` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variant` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `quantity` int NOT NULL DEFAULT '1',
  `price` double NOT NULL DEFAULT '1',
  `tax` double NOT NULL DEFAULT '1',
  `discount` double NOT NULL DEFAULT '1',
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `seller_is` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_info` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `shipping_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `customer_id`, `cart_group_id`, `product_id`, `color`, `choices`, `variations`, `variant`, `quantity`, `price`, `tax`, `discount`, `slug`, `name`, `thumbnail`, `seller_id`, `seller_is`, `created_at`, `updated_at`, `shop_info`, `shipping_cost`, `shipping_type`) VALUES
(13, 13, '13-0IFjg-1669209050', 34, '#F0F8FF', '{\"choice_1\":\"33\"}', '{\"color\":\"AliceBlue\",\"Size\":\"33\"}', 'AliceBlue-33', 1, 10, 0.1, 1, 'mens-underwear-JQC1fT', 'Men\'s underwear', '2022-10-14-6349c58a1ce3a.png', 1, 'admin', '2022-11-23 12:10:50', '2022-11-23 12:10:50', 'Everest', 0.00, 'order_wise'),
(16, 15, '15-wbOMz-1670497390', 20, '#7FFFD4', '{\"choice_3\":\"20\",\"choice_1\":\"30\"}', '{\"color\":\"Aquamarine\",\"Length\":\"20\",\"Size\":\"30\"}', 'Aquamarine-20-30', 1, 80, 4, 3, 'my-kids-pants-MaFQgh', 'my kids pants', '2022-10-14-6349b3fcd6eb7.png', 1, 'admin', '2022-12-08 10:04:48', '2022-12-08 10:04:48', 'Everest', 0.00, 'order_wise'),
(17, 16, '16-HymJl-1670680901', 18, '#0000FF', '{\"choice_3\":\"20\",\"choice_1\":\"35\"}', '{\"color\":\"Blue\",\"Length\":\"20\",\"Size\":\"35\"}', 'Blue-20-35', 1, 10, 0.3, 2, 'my-baby-girls-dress-UnGF4N', 'My baby girls dress', '2022-10-14-6349ae6254cde.png', 1, 'admin', '2022-12-10 13:01:41', '2022-12-10 13:01:41', 'Everest', 0.00, 'order_wise'),
(18, 16, '16-HymJl-1670680901', 20, '#7FFFD4', '{\"choice_3\":\"20\",\"choice_1\":\"30\"}', '{\"color\":\"Aquamarine\",\"Length\":\"20\",\"Size\":\"30\"}', 'Aquamarine-20-30', 1, 80, 4, 3, 'my-kids-pants-MaFQgh', 'my kids pants', '2022-10-14-6349b3fcd6eb7.png', 1, 'admin', '2022-12-10 13:01:47', '2022-12-10 13:01:47', 'Everest', 0.00, 'order_wise'),
(19, 16, '16-HymJl-1670680901', 21, '#FAEBD7', '{\"choice_1\":\"30\"}', '{\"color\":\"AntiqueWhite\",\"Size\":\"30\"}', 'AntiqueWhite-30', 1, 20, 1, 2, 'my-girls-tuxedo-famyIY', 'my girls\' tuxedo', '2022-10-14-6349b53272172.png', 1, 'admin', '2022-12-10 13:01:51', '2022-12-10 13:01:51', 'Everest', 0.00, 'order_wise'),
(20, 37, '37-CftsR-1670705468', 50, NULL, '[]', '[]', '', 1, 1000, 0, 0, 'plc-MKipoG', 'PLC', '2022-12-09-6392e45ba06ab.png', 37, 'seller', '2022-12-10 19:51:08', '2022-12-10 19:51:08', 'Everest-Saller', 0.00, 'order_wise');

-- --------------------------------------------------------

--
-- Table structure for table `cart_deliveries`
--

CREATE TABLE `cart_deliveries` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_method_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_deliveries`
--

INSERT INTO `cart_deliveries` (`id`, `cart_group_id`, `delivery_method_id`, `created_at`, `updated_at`) VALUES
(1, '12-anGZ1-1668683258', 1, '2022-11-23 14:03:53', '2022-11-23 14:03:53'),
(2, '12-1vjZ3-1669409766', 2, '2022-11-25 19:56:34', '2022-11-25 20:10:51');

-- --------------------------------------------------------

--
-- Table structure for table `cart_shippings`
--

CREATE TABLE `cart_shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `cart_group_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint DEFAULT NULL,
  `shipping_cost` double(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shippings`
--

INSERT INTO `cart_shippings` (`id`, `cart_group_id`, `shipping_method_id`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, '8-KkJOT-1666553330', 2, 5.00, '2022-10-25 16:41:28', '2022-10-25 16:41:28'),
(3, '12-anGZ1-1668683258', 2, 5.00, '2022-11-17 10:09:18', '2022-11-17 10:09:18'),
(6, '16-HymJl-1670680901', 2, 2000.00, '2022-12-10 13:02:00', '2022-12-10 19:41:47'),
(9, NULL, NULL, 0.00, '2022-12-15 06:19:18', '2022-12-15 06:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL,
  `position` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `home_status` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `icon`, `parent_id`, `position`, `created_at`, `updated_at`, `home_status`, `priority`) VALUES
(36, 'Supermarket', 'supermarket', '2022-11-26-638202132b401.png', 0, 0, '2022-11-20 19:06:57', '2022-11-26 11:09:55', 1, 1),
(37, 'Fashion', 'fashion', '2022-11-26-638201ed8703f.png', 0, 0, '2022-11-20 19:18:02', '2022-11-26 11:09:17', 1, 1),
(38, 'Health & Beauty', 'health-beauty', '2022-11-26-638201bb999a3.png', 0, 0, '2022-11-20 19:20:56', '2022-11-26 11:08:27', 1, 1),
(39, 'Baby Products', 'baby-products', '2022-11-26-638201551728e.png', 0, 0, '2022-11-20 19:25:05', '2022-11-26 11:06:45', 1, 1),
(40, 'Phones & Tablets', 'phones-tablets', '2022-11-26-6382012d416f3.png', 0, 0, '2022-11-20 19:27:28', '2022-11-26 11:06:05', 1, 1),
(41, 'Home & Office', 'home-office', '2022-11-26-638200ff1d560.png', 0, 0, '2022-11-20 19:29:18', '2022-11-26 11:05:19', 1, 1),
(42, 'Electronics', 'electronics', '2022-11-26-638200901927b.png', 0, 0, '2022-11-20 19:31:54', '2022-11-26 11:03:28', 1, 1),
(43, 'Computing', 'computing', '2022-11-26-638200655491b.png', 0, 0, '2022-11-20 19:34:39', '2022-11-26 11:02:45', 1, 1),
(44, 'Sporting Goods', 'sporting-goods', '2022-11-26-638200198e64a.png', 0, 0, '2022-11-20 19:38:20', '2022-11-26 11:01:29', 1, 1),
(45, 'Gaming', 'gaming', '2022-11-26-6382002fae9ef.png', 0, 0, '2022-11-20 19:48:13', '2022-11-26 11:01:51', 1, 1),
(46, 'Automobile', 'automobile', '2022-11-26-6381f45a0e3bc.png', 0, 0, '2022-11-20 19:50:06', '2022-11-26 10:11:22', 1, 1),
(47, 'Other categories', 'other-categories', '2022-11-26-6381f4139d546.png', 0, 0, '2022-11-20 19:51:53', '2022-11-26 10:10:11', 1, 1),
(48, 'Services', 'services', '2022-11-26-6381f3e08b7a3.png', 0, 0, '2022-11-20 19:53:46', '2022-11-26 10:09:20', 1, 1),
(49, 'Food Cupboard', 'food-cupboard', NULL, 36, 1, '2022-11-20 20:01:28', '2022-11-20 20:01:28', 0, 1),
(50, 'Beverages', 'beverages', NULL, 36, 1, '2022-11-20 20:02:34', '2022-11-20 20:02:34', 0, 1),
(51, 'Canned, Jarred & Packaged Foods', 'canned-jarred-packaged-foods', NULL, 36, 1, '2022-11-20 20:06:33', '2022-11-20 20:06:33', 0, 1),
(52, 'Breakfast Foods', 'breakfast-foods', NULL, 36, 1, '2022-11-20 20:07:38', '2022-11-20 20:07:38', 0, 1),
(53, 'Laundry', 'laundry', NULL, 36, 1, '2022-11-20 20:08:50', '2022-11-20 20:08:50', 0, 1),
(54, 'Household Cleaning', 'household-cleaning', NULL, 36, 1, '2022-11-20 20:09:55', '2022-11-20 20:09:55', 0, 1),
(55, 'Women\'s Fashion', 'womens-fashion', NULL, 37, 1, '2022-11-20 20:13:16', '2022-11-20 20:13:16', 0, 1),
(56, 'Men\'s Fashion', 'mens-fashion', NULL, 37, 1, '2022-11-20 20:15:22', '2022-11-20 20:15:22', 0, 1),
(57, 'Baby', 'baby', NULL, 37, 1, '2022-11-20 20:16:15', '2022-11-20 20:16:15', 0, 1),
(58, 'Kid\'s Fashion', 'kids-fashion', NULL, 37, 1, '2022-11-20 20:17:18', '2022-11-20 20:17:18', 0, 1),
(59, 'Top Brands', 'top-brands', NULL, 37, 1, '2022-11-20 20:18:26', '2022-11-20 20:18:26', 0, 1),
(60, 'Beauty & Personal Care', 'beauty-personal-care', NULL, 38, 1, '2022-11-20 20:19:21', '2022-11-20 20:19:21', 0, 1),
(61, 'Hair Care', 'hair-care', NULL, 38, 1, '2022-11-20 20:20:16', '2022-11-20 20:20:16', 0, 1),
(62, 'Fragrance', 'fragrance', NULL, 38, 1, '2022-11-20 20:21:28', '2022-11-20 20:21:28', 0, 1),
(63, 'Makeup', 'makeup', NULL, 38, 1, '2022-11-20 20:23:23', '2022-11-20 20:23:23', 0, 1),
(64, 'Health Care', 'health-care', NULL, 38, 1, '2022-11-20 20:28:26', '2022-11-20 20:28:26', 0, 1),
(65, 'Top Brands', 'top-brands', NULL, 38, 1, '2022-11-20 20:29:37', '2022-11-20 20:29:37', 0, 1),
(66, 'Diapering', 'diapering', NULL, 39, 1, '2022-11-20 21:26:09', '2022-11-20 21:26:09', 0, 1),
(67, 'Baby Feeding', 'baby-feeding', NULL, 39, 1, '2022-11-20 21:27:14', '2022-11-20 21:27:14', 0, 1),
(68, 'Bath & Skin Care', 'bath-skin-care', NULL, 39, 1, '2022-11-20 21:28:10', '2022-11-20 21:28:10', 0, 1),
(69, 'Baby Safety', 'baby-safety', NULL, 39, 1, '2022-11-20 21:29:15', '2022-11-20 21:29:15', 0, 1),
(70, 'Strollers & Accessories', 'strollers-accessories', NULL, 39, 1, '2022-11-20 21:30:15', '2022-11-20 21:30:15', 0, 1),
(71, 'Nuesery', 'nuesery', NULL, 39, 1, '2022-11-20 21:31:14', '2022-11-20 21:31:14', 0, 1),
(72, 'Baby &  Toys', 'baby-toys', NULL, 39, 1, '2022-11-20 21:32:14', '2022-11-20 21:32:14', 0, 1),
(73, 'Mobile Phones', 'mobile-phones', NULL, 40, 1, '2022-11-20 21:33:16', '2022-11-20 21:33:16', 0, 1),
(74, 'Tablets', 'tablets', NULL, 40, 1, '2022-11-20 21:34:02', '2022-11-20 21:34:02', 0, 1),
(75, 'Mobile Accessories', 'mobile-accessories', NULL, 40, 1, '2022-11-20 21:35:07', '2022-11-20 21:35:07', 0, 1),
(76, 'Top Brands', 'top-brands', NULL, 40, 1, '2022-11-20 21:36:14', '2022-11-20 21:36:14', 0, 1),
(77, 'Home & Kitchen', 'home-kitchen', NULL, 41, 1, '2022-11-20 21:37:08', '2022-11-20 21:37:08', 0, 1),
(78, 'Tools & Home Improvement', 'tools-home-improvement', NULL, 41, 1, '2022-11-20 21:40:05', '2022-11-20 21:40:05', 0, 1),
(79, 'Office Products', 'office-products', NULL, 41, 1, '2022-11-20 21:42:05', '2022-11-20 21:42:05', 0, 1),
(80, 'Small Appliances', 'small-appliances', NULL, 41, 1, '2022-11-20 21:43:39', '2022-11-20 21:43:39', 0, 1),
(81, 'Heating, Cooling & Air Quality', 'heating-cooling-air-quality', NULL, 41, 1, '2022-11-20 21:44:40', '2022-11-20 21:44:40', 0, 1),
(82, 'Appliances', 'appliances', NULL, 41, 1, '2022-11-20 21:46:10', '2022-11-20 21:46:10', 0, 1),
(83, 'Cooking Appliances', 'cooking-appliances', NULL, 41, 1, '2022-11-20 21:47:17', '2022-11-20 21:47:17', 0, 1),
(84, 'Television & Video', 'television-video', NULL, 42, 1, '2022-11-20 21:48:19', '2022-11-20 21:48:19', 0, 1),
(85, 'Cameras', 'cameras', NULL, 42, 1, '2022-11-20 21:49:07', '2022-11-20 21:49:07', 0, 1),
(86, 'Home Audio', 'home-audio', NULL, 42, 1, '2022-11-20 21:50:01', '2022-11-20 21:50:01', 0, 1),
(87, 'Other', 'other', NULL, 42, 1, '2022-11-20 21:50:56', '2022-11-20 21:50:56', 0, 1),
(88, 'Laptops', 'laptops', NULL, 43, 1, '2022-11-20 21:52:14', '2022-11-20 21:52:14', 0, 1),
(89, 'Data Storage', 'data-storage', NULL, 43, 1, '2022-11-20 21:52:45', '2022-11-20 21:52:45', 0, 1),
(90, 'Computers & Accessories', 'computers-accessories', NULL, 43, 1, '2022-11-20 21:53:43', '2022-11-20 21:53:43', 0, 1),
(91, 'Computer Components', 'computer-components', NULL, 43, 1, '2022-11-20 21:54:56', '2022-11-20 21:54:56', 0, 1),
(92, 'Computer Accessories', 'computer-accessories', NULL, 43, 1, '2022-11-20 21:55:50', '2022-11-20 21:55:50', 0, 1),
(93, 'Networking Products', 'networking-products', NULL, 43, 1, '2022-11-20 21:56:46', '2022-11-20 21:56:46', 0, 1),
(94, 'Top Brands', 'top-brands', NULL, 43, 1, '2022-11-20 21:57:35', '2022-11-20 21:57:35', 0, 1),
(95, 'Training Equipment', 'training-equipment', NULL, 44, 1, '2022-11-20 21:59:05', '2022-11-20 21:59:05', 0, 1),
(96, 'Accessories', 'accessories', NULL, 44, 1, '2022-11-20 22:00:19', '2022-11-20 22:00:19', 0, 1),
(97, 'Sports & Fitness', 'sports-fitness', NULL, 44, 1, '2022-11-20 22:02:40', '2022-11-20 22:02:40', 0, 1),
(98, 'Outdoor & Adventure', 'outdoor-adventure', NULL, 44, 1, '2022-11-20 22:03:49', '2022-11-20 22:03:49', 0, 1),
(99, 'PlayStation 5', 'playstation-5', NULL, 45, 1, '2022-11-20 22:04:44', '2022-11-20 22:04:44', 0, 1),
(100, 'PlayStation 4', 'playstation-4', NULL, 45, 1, '2022-11-20 22:05:39', '2022-11-20 22:05:39', 0, 1),
(101, 'XBOX', 'xbox', NULL, 45, 1, '2022-11-20 22:06:37', '2022-11-20 22:06:37', 0, 1),
(102, 'PC Gaming', 'pc-gaming', NULL, 45, 1, '2022-11-20 22:07:34', '2022-11-20 22:07:34', 0, 1),
(103, 'Car Care', 'car-care', NULL, 46, 1, '2022-11-20 22:09:08', '2022-11-20 22:09:08', 0, 1),
(104, 'Cleaning Kits', 'cleaning-kits', NULL, 46, 1, '2022-11-20 22:12:49', '2022-11-20 22:12:49', 0, 1),
(105, 'Car Electronics & Accessories', 'car-electronics-accessories', NULL, 46, 1, '2022-11-20 22:14:33', '2022-11-20 22:14:33', 0, 1),
(106, 'Lights & Lighting Accessories', 'lights-lighting-accessories', NULL, 46, 1, '2022-11-20 22:16:14', '2022-11-20 22:16:14', 0, 1),
(107, 'Oils & Fluids', 'oils-fluids', NULL, 46, 1, '2022-11-20 22:17:29', '2022-11-20 22:17:29', 0, 1),
(108, 'Exterior Accessories', 'exterior-accessories', NULL, 46, 1, '2022-11-20 22:18:20', '2022-11-20 22:18:20', 0, 1),
(109, 'Interior Accessories', 'interior-accessories', NULL, 46, 1, '2022-11-20 22:19:22', '2022-11-29 17:35:06', 0, 2),
(110, 'Garden & Outdoors', 'garden-outdoors', NULL, 47, 1, '2022-11-20 22:24:17', '2022-11-29 17:34:46', 0, 3),
(111, 'Books, Movies and Music', 'books-movies-and-music', NULL, 47, 1, '2022-11-20 22:26:47', '2022-11-20 22:26:47', 0, 1),
(112, 'Hand Crafted', 'hand-crafted', NULL, 47, 1, '2022-11-20 22:27:52', '2022-11-20 22:27:52', 0, 1),
(113, 'Industrial & Scientific', 'industrial-scientific', NULL, 47, 1, '2022-11-20 22:28:49', '2022-11-20 22:28:49', 0, 1),
(114, 'Pet Supplies', 'pet-supplies', NULL, 47, 1, '2022-11-20 22:29:43', '2022-11-20 22:29:43', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category_shipping_costs`
--

CREATE TABLE `category_shipping_costs` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_shipping_costs`
--

INSERT INTO `category_shipping_costs` (`id`, `seller_id`, `category_id`, `cost`, `multiply_qty`, `created_at`, `updated_at`) VALUES
(1, 0, 3, 0.00, NULL, '2022-10-09 17:11:19', '2022-10-09 17:11:19'),
(2, 0, 16, 0.00, NULL, '2022-10-09 17:11:19', '2022-10-09 17:11:19'),
(3, 0, 20, 0.00, NULL, '2022-10-09 17:11:19', '2022-10-09 17:11:19'),
(4, 0, 21, 0.00, NULL, '2022-10-09 17:11:19', '2022-10-09 17:11:19'),
(5, 0, 22, 0.00, NULL, '2022-10-09 17:11:19', '2022-10-09 17:11:19'),
(6, 0, 23, 0.00, NULL, '2022-10-23 06:35:49', '2022-10-23 06:35:49'),
(7, 1, 3, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(8, 1, 16, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(9, 1, 20, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(10, 1, 21, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(11, 1, 22, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(12, 1, 23, 0.00, NULL, '2022-11-15 01:43:39', '2022-11-15 01:43:39'),
(13, 5, 3, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(14, 5, 16, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(15, 5, 20, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(16, 5, 21, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(17, 5, 22, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(18, 5, 23, 0.00, NULL, '2022-11-18 11:32:30', '2022-11-18 11:32:30'),
(19, 4, 3, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(20, 4, 16, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(21, 4, 20, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(22, 4, 21, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(23, 4, 22, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(24, 4, 23, 0.00, 0, '2022-11-19 07:56:39', '2022-11-25 20:08:15'),
(25, 1, 36, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(26, 1, 37, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(27, 1, 38, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(28, 1, 39, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(29, 1, 40, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(30, 1, 41, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(31, 1, 42, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(32, 1, 43, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(33, 1, 44, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(34, 1, 45, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(35, 1, 46, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(36, 1, 47, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(37, 1, 48, 0.00, NULL, '2022-11-21 18:58:23', '2022-11-21 18:58:23'),
(38, 4, 36, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:09:44'),
(39, 4, 37, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(40, 4, 38, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(41, 4, 39, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(42, 4, 40, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(43, 4, 41, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(44, 4, 42, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(45, 4, 43, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(46, 4, 44, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(47, 4, 45, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(48, 4, 46, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(49, 4, 47, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(50, 4, 48, 0.00, 0, '2022-11-24 20:48:08', '2022-11-25 20:08:15'),
(51, 0, 36, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(52, 0, 37, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(53, 0, 38, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(54, 0, 39, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(55, 0, 40, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(56, 0, 41, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(57, 0, 42, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(58, 0, 43, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(59, 0, 44, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(60, 0, 45, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(61, 0, 46, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(62, 0, 47, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(63, 0, 48, 0.00, NULL, '2022-11-25 12:49:47', '2022-11-25 12:49:47'),
(64, 5, 36, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(65, 5, 37, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(66, 5, 38, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(67, 5, 39, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(68, 5, 40, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(69, 5, 41, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(70, 5, 42, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(71, 5, 43, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(72, 5, 44, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(73, 5, 45, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(74, 5, 46, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(75, 5, 47, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(76, 5, 48, 0.00, NULL, '2022-11-26 06:58:55', '2022-11-26 06:58:55'),
(77, 32, 36, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(78, 32, 37, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(79, 32, 38, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(80, 32, 39, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(81, 32, 40, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(82, 32, 41, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(83, 32, 42, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(84, 32, 43, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(85, 32, 44, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(86, 32, 45, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(87, 32, 46, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(88, 32, 47, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(89, 32, 48, 0.00, NULL, '2022-12-10 07:56:09', '2022-12-10 07:56:09'),
(90, 37, 36, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(91, 37, 37, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(92, 37, 38, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(93, 37, 39, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(94, 37, 40, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(95, 37, 41, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(96, 37, 42, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(97, 37, 43, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(98, 37, 44, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(99, 37, 45, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(100, 37, 46, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(101, 37, 47, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20'),
(102, 37, 48, 0.00, NULL, '2022-12-10 19:52:20', '2022-12-10 19:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `chattings`
--

CREATE TABLE `chattings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint NOT NULL,
  `seller_id` bigint NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `audio` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `video` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `type` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sent_by_customer` tinyint(1) NOT NULL DEFAULT '0',
  `sent_by_seller` tinyint(1) NOT NULL DEFAULT '0',
  `seen_by_customer` tinyint(1) NOT NULL DEFAULT '1',
  `seen_by_seller` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shop_id` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chattings`
--

INSERT INTO `chattings` (`id`, `user_id`, `seller_id`, `message`, `photo`, `audio`, `video`, `type`, `sent_by_customer`, `sent_by_seller`, `seen_by_customer`, `seen_by_seller`, `status`, `created_at`, `updated_at`, `shop_id`) VALUES
(51, 17, 37, 'test', NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, '2022-12-12 12:33:03', '2022-12-12 12:33:13', 24),
(52, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:33:43', NULL, 24),
(53, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:34:22', NULL, 24),
(54, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:35:17', NULL, 24),
(55, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:36:53', NULL, 24),
(56, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:37:45', NULL, 24),
(57, 17, 37, 'tset', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:43:56', '2022-12-12 12:43:56', 24),
(58, 17, 37, 'tset', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:45:37', '2022-12-12 12:45:37', 24),
(59, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:48:03', '2022-12-12 12:48:03', 24),
(60, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:51:20', '2022-12-12 12:51:20', 24),
(61, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:51:42', '2022-12-12 12:51:42', 24),
(62, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:54:48', '2022-12-12 12:54:48', 24),
(63, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 12:58:26', '2022-12-12 12:58:26', 24),
(64, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:00:40', '2022-12-12 13:00:40', 24),
(65, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:04:39', '2022-12-12 13:04:39', 24),
(66, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:09:47', '2022-12-12 13:09:47', 24),
(67, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:10:08', '2022-12-12 13:10:08', 24),
(68, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:10:43', '2022-12-12 13:10:43', 24),
(69, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:14:22', '2022-12-12 13:14:22', 24),
(70, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:14:33', '2022-12-12 13:14:33', 24),
(71, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:15:01', '2022-12-12 13:15:01', 24),
(72, 17, 37, 'hi', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:26:18', '2022-12-12 13:26:18', 24),
(73, 17, 37, 'hi', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:26:31', '2022-12-12 13:26:31', 24),
(74, 17, 37, 'test realtime', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:29:49', '2022-12-12 13:29:49', 24),
(75, 17, 37, 'test realtime 2', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:31:07', '2022-12-12 13:31:07', 24),
(76, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:31:27', '2022-12-12 13:31:27', 24),
(77, 17, 37, 'hi', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:31:30', '2022-12-12 13:31:30', 24),
(78, 17, 37, NULL, 'https://www.everest-ci.com/public/uploads/photo/1670855504.jpeg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-12 13:31:44', '2022-12-12 13:31:44', 24),
(79, 17, 37, NULL, NULL, 'https://www.everest-ci.com/public/uploads/audio/1670855514.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-12 13:31:54', '2022-12-12 13:31:54', 24),
(80, 17, 37, 'test realtime', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:37:20', '2022-12-12 13:37:20', 24),
(81, 17, 37, 'hi', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:37:32', '2022-12-12 13:37:32', 24),
(82, 17, 37, NULL, 'https://www.everest-ci.com/public/uploads/photo/1670855891.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-12 13:38:11', '2022-12-12 13:38:11', 24),
(83, 17, 37, NULL, NULL, 'https://www.everest-ci.com/public/uploads/audio/1670855903.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-12 13:38:23', '2022-12-12 13:38:23', 24),
(84, 17, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 13:38:33', '2022-12-12 13:38:33', 24),
(85, 17, 37, 'Effhh', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-12 18:51:50', '2022-12-12 18:51:50', 24),
(86, 19, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-14 17:28:00', '2022-12-14 17:28:00', 24),
(87, 19, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-14 17:29:52', '2022-12-14 17:29:52', 24),
(88, 19, 37, NULL, 'https://www.everest-ci.com/public/uploads/photo/1671042643.jfif', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-14 17:30:43', '2022-12-14 17:30:43', 24),
(89, 19, 37, NULL, NULL, NULL, 'https://www.everest-ci.com/public/uploads/video/1671042759.mp4', 'photo', 0, 1, 1, 0, 1, '2022-12-14 17:32:44', '2022-12-14 17:32:44', 24),
(90, 19, 37, NULL, NULL, 'https://www.everest-ci.com/public/uploads/audio/1671042953.mp3', NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-14 17:35:53', '2022-12-14 17:35:53', 24),
(91, 18, 37, 'sgddd', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 11:11:06', '2022-12-15 11:11:06', 24),
(92, 18, 37, 'fffddthh', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 11:11:29', '2022-12-15 11:11:29', 24),
(93, 18, 37, 'dg', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 11:11:50', '2022-12-15 11:11:50', 24),
(94, 18, 37, 'ffh', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 11:18:46', '2022-12-15 11:18:46', 24),
(95, 18, 37, 'egey', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 11:25:59', '2022-12-15 11:25:59', 24),
(96, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671110934.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-15 12:28:54', '2022-12-15 12:28:54', 24),
(97, 18, 37, 'fff', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 12:33:47', '2022-12-15 12:33:47', 24),
(98, 18, 37, 'ftsj', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 12:54:29', '2022-12-15 12:54:29', 24),
(99, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671114148.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-15 13:22:28', '2022-12-15 13:22:28', 24),
(100, 18, 37, 'ffgfdggh', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 13:55:07', '2022-12-15 13:55:07', 24),
(101, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671118811.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-15 14:40:11', '2022-12-15 14:40:11', 24),
(102, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671119769.mp4', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-15 14:56:09', '2022-12-15 14:56:09', 24),
(103, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671120180.mp4', 'video', 0, 1, 1, 0, 1, '2022-12-15 15:03:00', '2022-12-15 15:03:00', 24),
(104, 18, 37, 'f', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:17:45', '2022-12-15 15:17:45', 24),
(105, 18, 37, 'ddfv', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:33:16', '2022-12-15 15:33:16', 24),
(106, 18, 37, 'gggg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:35:42', '2022-12-15 15:35:42', 24),
(107, 18, 37, 'ddg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:38:29', '2022-12-15 15:38:29', 24),
(108, 18, 37, 'fi', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:47:12', '2022-12-15 15:47:12', 24),
(109, 18, 37, 'hg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:50:45', '2022-12-15 15:50:45', 24),
(110, 18, 37, 'ug', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:50:51', '2022-12-15 15:50:51', 24),
(111, 18, 37, 'fgg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:55:02', '2022-12-15 15:55:02', 24),
(112, 18, 37, 'fl', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:56:33', '2022-12-15 15:56:33', 24),
(113, 18, 37, 't', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:58:44', '2022-12-15 15:58:44', 24),
(114, 18, 37, 'fh', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:59:42', '2022-12-15 15:59:42', 24),
(115, 18, 37, 'ggg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 15:59:47', '2022-12-15 15:59:47', 24),
(116, 18, 37, 'dg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:00:21', '2022-12-15 16:00:21', 24),
(117, 18, 37, 'gi', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:00:34', '2022-12-15 16:00:34', 24),
(118, 18, 37, 'fg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:01:02', '2022-12-15 16:01:02', 24),
(119, 18, 37, 'fg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:01:15', '2022-12-15 16:01:15', 24),
(120, 18, 37, 'fy', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:04:38', '2022-12-15 16:04:38', 24),
(121, 19, 37, '0', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:13:21', '2022-12-15 16:13:21', 24),
(122, 19, 37, 'gg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:14:20', '2022-12-15 16:14:20', 24),
(123, 19, 37, 'yh', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:14:57', '2022-12-15 16:14:57', 24),
(124, 19, 37, 'fe', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:15:04', '2022-12-15 16:15:04', 24),
(125, 18, 37, 'fhf', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 16:19:24', '2022-12-15 16:19:24', 24),
(126, 19, 37, 'rr', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:31:47', '2022-12-15 16:31:47', 24),
(127, 18, 37, 'df', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-15 16:32:01', '2022-12-15 16:32:01', 24),
(128, 19, 37, NULL, 'https://www.everest-ci.com/public/uploads/photo/1671126179.pdf', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-15 16:42:59', '2022-12-15 16:42:59', 24),
(129, 19, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 20:28:50', '2022-12-15 20:28:50', 24),
(130, 19, 37, NULL, 'https://www.everest-ci.com/public/uploads/photo/1671139744.jfif', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-15 20:29:04', '2022-12-15 20:29:04', 24),
(131, 19, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 20:29:15', '2022-12-15 20:29:15', 24),
(132, 19, 37, 'test', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-15 20:29:30', '2022-12-15 20:29:30', 24),
(133, 18, 37, 'ggg', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 15:47:07', '2022-12-17 15:47:07', 24),
(134, 18, 37, 'ff', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 15:48:11', '2022-12-17 15:48:11', 24),
(135, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671296152.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-17 15:55:52', '2022-12-17 15:55:52', 24),
(136, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671296344.mp4', 'video', 1, 0, 1, 0, 1, '2022-12-17 15:59:04', '2022-12-17 15:59:04', 24),
(137, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671298151.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-17 16:29:11', '2022-12-17 16:29:11', 24),
(138, 18, 37, 'ffhgdf', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 16:32:44', '2022-12-17 16:32:44', 24),
(139, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671299052.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 16:44:12', '2022-12-17 16:44:12', 24),
(140, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671299099.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 16:44:59', '2022-12-17 16:44:59', 24),
(141, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671299168.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 16:46:08', '2022-12-17 16:46:08', 24),
(142, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671299380.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 16:49:40', '2022-12-17 16:49:40', 24),
(143, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671299843.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 16:57:23', '2022-12-17 16:57:23', 24),
(144, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671300120.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 17:02:00', '2022-12-17 17:02:00', 24),
(145, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671301312.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 17:21:52', '2022-12-17 17:21:52', 24),
(146, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671301329.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 17:22:09', '2022-12-17 17:22:09', 24),
(147, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671301558.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 17:25:58', '2022-12-17 17:25:58', 24),
(148, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671301661.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 17:27:42', '2022-12-17 17:27:42', 24),
(149, 18, 37, 'بسم الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 18:04:58', '2022-12-17 18:04:58', 24),
(150, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671304652.mp4', 'video', 1, 0, 1, 0, 1, '2022-12-17 18:17:32', '2022-12-17 18:17:32', 24),
(151, 18, 37, 'مش عايز يشتغل ليه', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 18:22:40', '2022-12-17 18:22:40', 24),
(152, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671305560.mp4', 'video', 1, 0, 1, 0, 1, '2022-12-17 18:32:40', '2022-12-17 18:32:40', 24),
(153, 18, 37, 'بسم الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 18:45:51', '2022-12-17 18:45:51', 24),
(154, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671306995.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 18:56:35', '2022-12-17 18:56:35', 24),
(155, 18, 37, 'الله اكبر', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 18:58:32', '2022-12-17 18:58:32', 24),
(156, 18, 37, 'بسم الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 19:04:02', '2022-12-17 19:04:02', 24),
(157, 18, 37, 'لا اله الا الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 19:06:10', '2022-12-17 19:06:10', 24),
(158, 18, 37, 'الحمدلله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 19:07:00', '2022-12-17 19:07:00', 24),
(159, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671307633.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-17 19:07:13', '2022-12-17 19:07:13', 24),
(160, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671307645.mp4', 'video', 1, 0, 1, 0, 1, '2022-12-17 19:07:25', '2022-12-17 19:07:25', 24),
(161, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671307655.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 19:07:35', '2022-12-17 19:07:35', 24),
(162, 18, 37, 'allah', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-17 19:19:34', '2022-12-17 19:19:34', 24),
(163, 18, 37, 'df', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-17 19:19:54', '2022-12-17 19:19:54', 24),
(164, 18, 37, 'ff', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-17 19:20:46', '2022-12-17 19:20:46', 24),
(165, 18, 37, 'gg', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-17 19:21:46', '2022-12-17 19:21:46', 24),
(166, 18, 37, 'لا', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 19:22:43', '2022-12-17 19:22:43', 24),
(167, 18, 37, 'message', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 19:42:57', '2022-12-17 19:42:57', 24),
(168, 18, 37, 'photo', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 20:03:11', '2022-12-17 20:03:11', 24),
(169, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671311082.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-17 20:04:42', '2022-12-17 20:04:42', 24),
(170, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671311342.mp4', 'video', 0, 1, 1, 0, 1, '2022-12-17 20:09:02', '2022-12-17 20:09:02', 24),
(171, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671313724.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-17 20:48:44', '2022-12-17 20:48:44', 24),
(172, 18, 37, 'اللهم لك الحمد', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 20:48:55', '2022-12-17 20:48:55', 24),
(173, 18, 37, 'الحمدلله شغال كويس', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 20:49:37', '2022-12-17 20:49:37', 24),
(174, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671313787.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-17 20:49:47', '2022-12-17 20:49:47', 24),
(175, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671313798.mp4', 'video', 0, 1, 1, 0, 1, '2022-12-17 20:49:58', '2022-12-17 20:49:58', 24),
(176, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671313819.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-17 20:50:19', '2022-12-17 20:50:19', 24),
(177, 18, 37, 'بسم الله ريال تايم', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 21:22:21', '2022-12-17 21:22:21', 24),
(178, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671315786.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-17 21:23:06', '2022-12-17 21:23:06', 24),
(179, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671315837.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-17 21:23:57', '2022-12-17 21:23:57', 24),
(180, 18, 37, 'بسم الله ريال؟', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 21:46:16', '2022-12-17 21:46:16', 24),
(181, 18, 37, 'الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 21:48:02', '2022-12-17 21:48:02', 24),
(182, 18, 37, 'لا', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 21:49:07', '2022-12-17 21:49:07', 24),
(183, 18, 37, 'بسم الله', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:00:54', '2022-12-17 22:00:54', 24),
(184, 18, 37, 'الله اكبر', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:01:53', '2022-12-17 22:01:53', 24),
(185, 18, 37, 'بسم الله الرحمن الرحيم', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:09:09', '2022-12-17 22:09:09', 24),
(186, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671319293.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-17 22:21:33', '2022-12-17 22:21:33', 24),
(187, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671319328.jpg', NULL, NULL, 'photo', 0, 1, 1, 0, 1, '2022-12-17 22:22:08', '2022-12-17 22:22:08', 24),
(188, 18, 37, 'كويس جدا ابعتلك فيديو ؟', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:22:32', '2022-12-17 22:22:32', 24),
(189, 18, 37, 'ok', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 22:22:42', '2022-12-17 22:22:42', 24),
(190, 18, 37, NULL, NULL, NULL, 'http://www.everest-ci.com/public/uploads/video/1671319384.mp4', 'video', 1, 0, 1, 0, 1, '2022-12-17 22:23:05', '2022-12-17 22:23:05', 24),
(191, 18, 37, 'حلو اوى كدا', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:23:38', '2022-12-17 22:23:38', 24),
(192, 18, 37, 'lets go', NULL, NULL, NULL, 'text', 1, 0, 1, 0, 1, '2022-12-17 22:39:15', '2022-12-17 22:39:15', 24),
(193, 18, 37, 'يلا يا صاحبى', NULL, NULL, NULL, 'text', 0, 1, 1, 0, 1, '2022-12-17 22:39:28', '2022-12-17 22:39:28', 24),
(194, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671320381.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-17 22:39:41', '2022-12-17 22:39:41', 24),
(195, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671320412.mp3', NULL, 'audio', 0, 1, 1, 0, 1, '2022-12-17 22:40:12', '2022-12-17 22:40:12', 24),
(196, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671320421.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-17 22:40:21', '2022-12-17 22:40:21', 24),
(197, 17, 37, 'dffff', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-21 06:41:41', '2022-12-21 06:41:41', 24),
(198, 17, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671609076.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-21 06:51:16', '2022-12-21 06:51:16', 24),
(199, 17, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671609084.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 06:51:24', '2022-12-21 06:51:24', 24),
(200, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671619815.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 09:50:15', '2022-12-21 09:50:15', 24),
(201, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671619837.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 09:50:37', '2022-12-21 09:50:37', 24),
(202, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671619857.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 09:50:57', '2022-12-21 09:50:57', 24),
(203, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671622238.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 10:30:38', '2022-12-21 10:30:38', 24),
(204, 18, 37, NULL, NULL, 'http://www.everest-ci.com/public/uploads/audio/1671622279.mp3', NULL, 'audio', 1, 0, 1, 0, 1, '2022-12-21 10:31:19', '2022-12-21 10:31:19', 24),
(205, 18, 37, NULL, 'http://www.everest-ci.com/public/uploads/photo/1671622305.jpg', NULL, NULL, 'photo', 1, 0, 1, 0, 1, '2022-12-21 10:31:45', '2022-12-21 10:31:45', 24),
(206, 17, 37, 'rghgegr', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-21 10:36:35', '2022-12-21 10:36:35', 24),
(207, 17, 37, 'effhh', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 1, '2022-12-21 10:36:37', '2022-12-21 10:36:37', 24);

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` int NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'IndianRed', '#CD5C5C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(2, 'LightCoral', '#F08080', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(3, 'Salmon', '#FA8072', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(4, 'DarkSalmon', '#E9967A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(5, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(6, 'Crimson', '#DC143C', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(7, 'Red', '#FF0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(8, 'FireBrick', '#B22222', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(9, 'DarkRed', '#8B0000', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(10, 'Pink', '#FFC0CB', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(11, 'LightPink', '#FFB6C1', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(12, 'HotPink', '#FF69B4', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(13, 'DeepPink', '#FF1493', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(14, 'MediumVioletRed', '#C71585', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(15, 'PaleVioletRed', '#DB7093', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(16, 'LightSalmon', '#FFA07A', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(17, 'Coral', '#FF7F50', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(18, 'Tomato', '#FF6347', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(19, 'OrangeRed', '#FF4500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(20, 'DarkOrange', '#FF8C00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(21, 'Orange', '#FFA500', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(22, 'Gold', '#FFD700', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(23, 'Yellow', '#FFFF00', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(24, 'LightYellow', '#FFFFE0', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(25, 'LemonChiffon', '#FFFACD', '2018-11-05 02:12:26', '2018-11-05 02:12:26'),
(26, 'LightGoldenrodYellow', '#FAFAD2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(27, 'PapayaWhip', '#FFEFD5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(28, 'Moccasin', '#FFE4B5', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(29, 'PeachPuff', '#FFDAB9', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(30, 'PaleGoldenrod', '#EEE8AA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(31, 'Khaki', '#F0E68C', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(32, 'DarkKhaki', '#BDB76B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(33, 'Lavender', '#E6E6FA', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(34, 'Thistle', '#D8BFD8', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(35, 'Plum', '#DDA0DD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(36, 'Violet', '#EE82EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(37, 'Orchid', '#DA70D6', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(38, 'Fuchsia', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(39, 'Magenta', '#FF00FF', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(40, 'MediumOrchid', '#BA55D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(41, 'MediumPurple', '#9370DB', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(42, 'Amethyst', '#9966CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(43, 'BlueViolet', '#8A2BE2', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(44, 'DarkViolet', '#9400D3', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(45, 'DarkOrchid', '#9932CC', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(46, 'DarkMagenta', '#8B008B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(47, 'Purple', '#800080', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(48, 'Indigo', '#4B0082', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(49, 'SlateBlue', '#6A5ACD', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(50, 'DarkSlateBlue', '#483D8B', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(51, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(52, 'GreenYellow', '#ADFF2F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(53, 'Chartreuse', '#7FFF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(54, 'LawnGreen', '#7CFC00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(55, 'Lime', '#00FF00', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(56, 'LimeGreen', '#32CD32', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(57, 'PaleGreen', '#98FB98', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(58, 'LightGreen', '#90EE90', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(59, 'MediumSpringGreen', '#00FA9A', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(60, 'SpringGreen', '#00FF7F', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(61, 'MediumSeaGreen', '#3CB371', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(62, 'SeaGreen', '#2E8B57', '2018-11-05 02:12:27', '2018-11-05 02:12:27'),
(63, 'ForestGreen', '#228B22', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(64, 'Green', '#008000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(65, 'DarkGreen', '#006400', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(66, 'YellowGreen', '#9ACD32', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(67, 'OliveDrab', '#6B8E23', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(68, 'Olive', '#808000', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(69, 'DarkOliveGreen', '#556B2F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(70, 'MediumAquamarine', '#66CDAA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(71, 'DarkSeaGreen', '#8FBC8F', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(72, 'LightSeaGreen', '#20B2AA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(73, 'DarkCyan', '#008B8B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(74, 'Teal', '#008080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(75, 'Aqua', '#00FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(77, 'LightCyan', '#E0FFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(78, 'PaleTurquoise', '#AFEEEE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(79, 'Aquamarine', '#7FFFD4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(80, 'Turquoise', '#40E0D0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(81, 'MediumTurquoise', '#48D1CC', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(82, 'DarkTurquoise', '#00CED1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(83, 'CadetBlue', '#5F9EA0', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(84, 'SteelBlue', '#4682B4', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(85, 'LightSteelBlue', '#B0C4DE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(86, 'PowderBlue', '#B0E0E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(87, 'LightBlue', '#ADD8E6', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(88, 'SkyBlue', '#87CEEB', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(89, 'LightSkyBlue', '#87CEFA', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(90, 'DeepSkyBlue', '#00BFFF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(91, 'DodgerBlue', '#1E90FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(92, 'CornflowerBlue', '#6495ED', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(93, 'MediumSlateBlue', '#7B68EE', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(94, 'RoyalBlue', '#4169E1', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(95, 'Blue', '#0000FF', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(96, 'MediumBlue', '#0000CD', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(97, 'DarkBlue', '#00008B', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(98, 'Navy', '#000080', '2018-11-05 02:12:28', '2018-11-05 02:12:28'),
(99, 'MidnightBlue', '#191970', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(100, 'Cornsilk', '#FFF8DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(101, 'BlanchedAlmond', '#FFEBCD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(102, 'Bisque', '#FFE4C4', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(103, 'NavajoWhite', '#FFDEAD', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(104, 'Wheat', '#F5DEB3', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(105, 'BurlyWood', '#DEB887', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(106, 'Tan', '#D2B48C', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(107, 'RosyBrown', '#BC8F8F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(108, 'SandyBrown', '#F4A460', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(109, 'Goldenrod', '#DAA520', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(110, 'DarkGoldenrod', '#B8860B', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(111, 'Peru', '#CD853F', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(112, 'Chocolate', '#D2691E', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(113, 'SaddleBrown', '#8B4513', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(114, 'Sienna', '#A0522D', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(115, 'Brown', '#A52A2A', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(116, 'Maroon', '#800000', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(117, 'White', '#FFFFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(118, 'Snow', '#FFFAFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(119, 'Honeydew', '#F0FFF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(120, 'MintCream', '#F5FFFA', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(121, 'Azure', '#F0FFFF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(122, 'AliceBlue', '#F0F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(123, 'GhostWhite', '#F8F8FF', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(124, 'WhiteSmoke', '#F5F5F5', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(125, 'Seashell', '#FFF5EE', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(126, 'Beige', '#F5F5DC', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(127, 'OldLace', '#FDF5E6', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(128, 'FloralWhite', '#FFFAF0', '2018-11-05 02:12:29', '2018-11-05 02:12:29'),
(129, 'Ivory', '#FFFFF0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(130, 'AntiqueWhite', '#FAEBD7', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(131, 'Linen', '#FAF0E6', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(132, 'LavenderBlush', '#FFF0F5', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(133, 'MistyRose', '#FFE4E1', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(134, 'Gainsboro', '#DCDCDC', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(135, 'LightGrey', '#D3D3D3', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(136, 'Silver', '#C0C0C0', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(137, 'DarkGray', '#A9A9A9', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(138, 'Gray', '#808080', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(139, 'DimGray', '#696969', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(140, 'LightSlateGray', '#778899', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(141, 'SlateGray', '#708090', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(142, 'DarkSlateGray', '#2F4F4F', '2018-11-05 02:12:30', '2018-11-05 02:12:30'),
(143, 'Black', '#000000', '2018-11-05 02:12:30', '2018-11-05 02:12:30');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `feedback` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reply` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `coupon_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `min_purchase` decimal(8,2) NOT NULL DEFAULT '0.00',
  `max_discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'percentage',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `limit` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_type`, `title`, `code`, `start_date`, `expire_date`, `min_purchase`, `max_discount`, `discount`, `discount_type`, `status`, `created_at`, `updated_at`, `limit`) VALUES
(1, 'discount_on_purchase', 'aaaa', '34afqvi3fv', '2022-10-12', '2022-10-19', '50.00', '2000.00', '2000.00', 'amount', 1, '2022-10-09 10:10:03', '2022-10-09 10:10:03', 10);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange_rate` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `symbol`, `code`, `exchange_rate`, `status`, `created_at`, `updated_at`) VALUES
(1, 'USD', '$', 'USD', '1', 1, NULL, '2021-06-27 13:39:37'),
(2, 'BDT', '৳', 'BDT', '84', 0, NULL, '2022-11-13 06:22:34'),
(3, 'Indian Rupi', '₹', 'INR', '60', 0, '2020-10-15 17:23:04', '2022-10-08 09:59:40'),
(4, 'Euro', '€', 'EUR', '100', 0, '2021-05-25 21:00:23', '2022-10-08 09:59:39'),
(5, 'YEN', '¥', 'JPY', '110', 0, '2021-06-10 22:08:31', '2022-10-08 09:59:37'),
(6, 'Ringgit', 'RM', 'MYR', '4.16', 0, '2021-07-03 11:08:33', '2022-10-08 09:59:36'),
(7, 'Rand', 'R', 'ZAR', '14.26', 0, '2021-07-03 11:12:38', '2022-10-08 09:59:35'),
(8, 'FCFA', 'FCFA', 'FCFA', '1', 1, '2022-10-08 09:59:20', '2022-11-19 19:36:35');

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallets`
--

CREATE TABLE `customer_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `balance` decimal(8,2) NOT NULL DEFAULT '0.00',
  `royality_points` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_wallet_histories`
--

CREATE TABLE `customer_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `transaction_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `transaction_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_method` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal_of_the_days`
--

CREATE TABLE `deal_of_the_days` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_histories`
--

CREATE TABLE `delivery_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `deliveryman_id` bigint DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_men`
--

CREATE TABLE `delivery_men` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `f_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identity_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n',
  `fcm_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_men`
--

INSERT INTO `delivery_men` (`id`, `seller_id`, `f_name`, `l_name`, `phone`, `email`, `identity_number`, `identity_type`, `identity_image`, `image`, `password`, `is_active`, `created_at`, `updated_at`, `auth_token`, `fcm_token`) VALUES
(1, 0, 'Mhd', 'Alhameed', '0757496206', 'Mhd@gmail.com', 'bfgj273563563', 'driving_license', '[\"2022-10-28-635c305b6e86a.png\"]', '2022-10-28-635c305b7f9c1.png', '$2y$10$uPhtFVNzWJ2XZQcuRSE5ke79yoVP5.3ta8uEluNsxYVKhoC2njfsm', 1, '2022-10-28 17:41:15', '2022-10-31 19:08:25', 'iMnUrCb1ZG21bS8EeHuWyWL2PMGj38vprCEuAJpHDIjRydHTxH', 'eWH3PZAoQxyMWuVitQgPzO:APA91bHhSKfkYKXCvBI1sIq5frtQWRXJ6u4BHlrkZ5Vguk4IxBhdL0q9XJ8kZMAG7VU7fGiRa_98xEl_NPE1vRwYEM04Awv8WVL8uZadYEu7_TivxUqFhxb9_UpcCBlZ63g8MWuWIP2g'),
(2, 0, 'Eslam', 'Shaban Elmekawey', '01148285012', 'eslamcode555@gmail.com', '29407122201475', 'driving_license', '[\"2022-11-14-6372c2d9c059a.png\"]', '2022-11-14-6372c2d9dc9b0.png', '$2y$10$E/nk2xjHG17lFUiT4wRj9epFZrDuhIBpDqkBFcynORwVmXj26ROsu', 1, '2022-11-14 21:36:10', '2022-12-21 06:39:12', 'D0i7s6w0n8mZcz76y1Z6XjbA3Nb2l9Mbs31nSyQescEAkQQadm', 'eSjLp0lsS6-1kv2KL73j1c:APA91bEtslauKmIY5xVpi5SAEn5v15GfyKbPxqTZY1QydhE20itDysCWuiOdHihkYE50bysmmtD6NDzvWmWxQInBmY0SOS9zt3q-8flAHuSYfYxCAjJCzDmqE7o4jSOXlkXzTlGrjPnv'),
(3, 0, 'Delivery', 'man', '07574962206', 'Delivery-man@gmail.com', 'bfgj273563563', 'passport', '[\"2022-12-15-639accc9aa9a2.png\"]', '2022-12-15-639accc9b8f3e.png', '$2y$10$u6jbLIFZZElrX7gKZVzdXOh0EerKkF7lYUM5N09yZUF2E3i2QuwOC', 1, '2022-12-15 06:29:13', '2022-12-15 06:29:13', '6yIRXJRRfp78qJsAoKZZ6TTqhzuNJ3TcdvPBmk6n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_methods`
--

CREATE TABLE `delivery_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `delivery_methods`
--

INSERT INTO `delivery_methods` (`id`, `name`, `created_at`, `updated_at`, `slug`) VALUES
(1, 'delivery', NULL, NULL, 'delivery'),
(2, 'pick up', NULL, NULL, 'pick up');

-- --------------------------------------------------------

--
-- Table structure for table `employs`
--

CREATE TABLE `employs` (
  `id` bigint NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `added` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` int NOT NULL,
  `roles_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employs`
--

INSERT INTO `employs` (`id`, `name`, `email`, `password`, `Status`, `added`, `created_at`, `updated_at`, `roles_name`) VALUES
(13, 'admin', 'admin@admin.com', '$2y$10$qUmDFHQx8N6ok/uK5edTRORiqHp8aDEr4KTSM1hWRVmX/p7kIw3ze', 'مفعل', 14, '2022-12-14 16:23:07', 2022, ''),
(14, 'Ira Cline', 'busi@mailinator.com', '$2y$10$YoAzN7nSbNyLpcHDPz8uPO.mYC8DyelvLEIoa8feAKr43SaG/gQpS', 'مفعل', 14, '2022-11-27 18:17:40', 2022, ''),
(15, 'Diana Ware', 'ritujir@mailinator.com', '$2y$10$L...bJ4L6zHuUncB24f74eWgYWDWyPzGidVoZopyek7fQzX2rp/pu', 'مفعل', 14, '2022-11-27 13:52:41', 2022, ''),
(16, 'Serena Barton', 'tihimisyke@mailinator.com', '$2y$10$VCbZF6FyvDVmgF3owlMpd.tAOjnBba6FqfMWlfNDUnXC/jqKHBwLe', 'غير مفعل', 14, '2022-11-27 13:55:04', 2022, ''),
(17, 'Dillon Holcomb', 'kusutybi@mailinator.com', '$2y$10$GOzGOJCobo2SF3k26Df/ZuekFR9Wz2leJX7NGZwm/ViRXXrJzI6Fa', 'مفعل', 31, '2022-11-28 14:05:35', 2022, 'employ');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature_deals`
--

CREATE TABLE `feature_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `url` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deals`
--

CREATE TABLE `flash_deals` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `background_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banner` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `deal_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `flash_deal_products`
--

CREATE TABLE `flash_deal_products` (
  `id` bigint UNSIGNED NOT NULL,
  `flash_deal_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `discount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `discount_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `help_topics`
--

CREATE TABLE `help_topics` (
  `id` bigint UNSIGNED NOT NULL,
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ranking` int NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_point_transactions`
--

CREATE TABLE `loyalty_point_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_09_08_105159_create_admins_table', 1),
(5, '2020_09_08_111837_create_admin_roles_table', 1),
(6, '2020_09_16_142451_create_categories_table', 2),
(7, '2020_09_16_181753_create_categories_table', 3),
(8, '2020_09_17_134238_create_brands_table', 4),
(9, '2020_09_17_203054_create_attributes_table', 5),
(10, '2020_09_19_112509_create_coupons_table', 6),
(11, '2020_09_19_161802_create_curriencies_table', 7),
(12, '2020_09_20_114509_create_sellers_table', 8),
(13, '2020_09_23_113454_create_shops_table', 9),
(14, '2020_09_23_115615_create_shops_table', 10),
(15, '2020_09_23_153822_create_shops_table', 11),
(16, '2020_09_21_122817_create_products_table', 12),
(17, '2020_09_22_140800_create_colors_table', 12),
(18, '2020_09_28_175020_create_products_table', 13),
(19, '2020_09_28_180311_create_products_table', 14),
(20, '2020_10_04_105041_create_search_functions_table', 15),
(21, '2020_10_05_150730_create_customers_table', 15),
(22, '2020_10_08_133548_create_wishlists_table', 16),
(23, '2016_06_01_000001_create_oauth_auth_codes_table', 17),
(24, '2016_06_01_000002_create_oauth_access_tokens_table', 17),
(25, '2016_06_01_000003_create_oauth_refresh_tokens_table', 17),
(26, '2016_06_01_000004_create_oauth_clients_table', 17),
(27, '2016_06_01_000005_create_oauth_personal_access_clients_table', 17),
(28, '2020_10_06_133710_create_product_stocks_table', 17),
(29, '2020_10_06_134636_create_flash_deals_table', 17),
(30, '2020_10_06_134719_create_flash_deal_products_table', 17),
(31, '2020_10_08_115439_create_orders_table', 17),
(32, '2020_10_08_115453_create_order_details_table', 17),
(33, '2020_10_08_121135_create_shipping_addresses_table', 17),
(34, '2020_10_10_171722_create_business_settings_table', 17),
(35, '2020_09_19_161802_create_currencies_table', 18),
(36, '2020_10_12_152350_create_reviews_table', 18),
(37, '2020_10_12_161834_create_reviews_table', 19),
(38, '2020_10_12_180510_create_support_tickets_table', 20),
(39, '2020_10_14_140130_create_transactions_table', 21),
(40, '2020_10_14_143553_create_customer_wallets_table', 21),
(41, '2020_10_14_143607_create_customer_wallet_histories_table', 21),
(42, '2020_10_22_142212_create_support_ticket_convs_table', 21),
(43, '2020_10_24_234813_create_banners_table', 22),
(44, '2020_10_27_111557_create_shipping_methods_table', 23),
(45, '2020_10_27_114154_add_url_to_banners_table', 24),
(46, '2020_10_28_170308_add_shipping_id_to_order_details', 25),
(47, '2020_11_02_140528_add_discount_to_order_table', 26),
(48, '2020_11_03_162723_add_column_to_order_details', 27),
(49, '2020_11_08_202351_add_url_to_banners_table', 28),
(50, '2020_11_10_112713_create_help_topic', 29),
(51, '2020_11_10_141513_create_contacts_table', 29),
(52, '2020_11_15_180036_add_address_column_user_table', 30),
(53, '2020_11_18_170209_add_status_column_to_product_table', 31),
(54, '2020_11_19_115453_add_featured_status_product', 32),
(55, '2020_11_21_133302_create_deal_of_the_days_table', 33),
(56, '2020_11_20_172332_add_product_id_to_products', 34),
(57, '2020_11_27_234439_add__state_to_shipping_addresses', 34),
(58, '2020_11_28_091929_create_chattings_table', 35),
(59, '2020_12_02_011815_add_bank_info_to_sellers', 36),
(60, '2020_12_08_193234_create_social_medias_table', 37),
(61, '2020_12_13_122649_shop_id_to_chattings', 37),
(62, '2020_12_14_145116_create_seller_wallet_histories_table', 38),
(63, '2020_12_14_145127_create_seller_wallets_table', 38),
(64, '2020_12_15_174804_create_admin_wallets_table', 39),
(65, '2020_12_15_174821_create_admin_wallet_histories_table', 39),
(66, '2020_12_15_214312_create_feature_deals_table', 40),
(67, '2020_12_17_205712_create_withdraw_requests_table', 41),
(68, '2021_02_22_161510_create_notifications_table', 42),
(69, '2021_02_24_154706_add_deal_type_to_flash_deals', 43),
(70, '2021_03_03_204349_add_cm_firebase_token_to_users', 44),
(71, '2021_04_17_134848_add_column_to_order_details_stock', 45),
(72, '2021_05_12_155401_add_auth_token_seller', 46),
(73, '2021_06_03_104531_ex_rate_update', 47),
(74, '2021_06_03_222413_amount_withdraw_req', 48),
(75, '2021_06_04_154501_seller_wallet_withdraw_bal', 49),
(76, '2021_06_04_195853_product_dis_tax', 50),
(77, '2021_05_27_103505_create_product_translations_table', 51),
(78, '2021_06_17_054551_create_soft_credentials_table', 51),
(79, '2021_06_29_212549_add_active_col_user_table', 52),
(80, '2021_06_30_212619_add_col_to_contact', 53),
(81, '2021_07_01_160828_add_col_daily_needs_products', 54),
(82, '2021_07_04_182331_add_col_seller_sales_commission', 55),
(83, '2021_08_07_190655_add_seo_columns_to_products', 56),
(84, '2021_08_07_205913_add_col_to_category_table', 56),
(85, '2021_08_07_210808_add_col_to_shops_table', 56),
(86, '2021_08_14_205216_change_product_price_col_type', 56),
(87, '2021_08_16_201505_change_order_price_col', 56),
(88, '2021_08_16_201552_change_order_details_price_col', 56),
(89, '2019_09_29_154000_create_payment_cards_table', 57),
(90, '2021_08_17_213934_change_col_type_seller_earning_history', 57),
(91, '2021_08_17_214109_change_col_type_admin_earning_history', 57),
(92, '2021_08_17_214232_change_col_type_admin_wallet', 57),
(93, '2021_08_17_214405_change_col_type_seller_wallet', 57),
(94, '2021_08_22_184834_add_publish_to_products_table', 57),
(95, '2021_09_08_211832_add_social_column_to_users_table', 57),
(96, '2021_09_13_165535_add_col_to_user', 57),
(97, '2021_09_19_061647_add_limit_to_coupons_table', 57),
(98, '2021_09_20_020716_add_coupon_code_to_orders_table', 57),
(99, '2021_09_23_003059_add_gst_to_sellers_table', 57),
(100, '2021_09_28_025411_create_order_transactions_table', 57),
(101, '2021_10_02_185124_create_carts_table', 57),
(102, '2021_10_02_190207_create_cart_shippings_table', 57),
(103, '2021_10_03_194334_add_col_order_table', 57),
(104, '2021_10_03_200536_add_shipping_cost', 57),
(105, '2021_10_04_153201_add_col_to_order_table', 57),
(106, '2021_10_07_172701_add_col_cart_shop_info', 57),
(107, '2021_10_07_184442_create_phone_or_email_verifications_table', 57),
(108, '2021_10_07_185416_add_user_table_email_verified', 57),
(109, '2021_10_11_192739_add_transaction_amount_table', 57),
(110, '2021_10_11_200850_add_order_verification_code', 57),
(111, '2021_10_12_083241_add_col_to_order_transaction', 57),
(112, '2021_10_12_084440_add_seller_id_to_order', 57),
(113, '2021_10_12_102853_change_col_type', 57),
(114, '2021_10_12_110434_add_col_to_admin_wallet', 57),
(115, '2021_10_12_110829_add_col_to_seller_wallet', 57),
(116, '2021_10_13_091801_add_col_to_admin_wallets', 57),
(117, '2021_10_13_092000_add_col_to_seller_wallets_tax', 57),
(118, '2021_10_13_165947_rename_and_remove_col_seller_wallet', 57),
(119, '2021_10_13_170258_rename_and_remove_col_admin_wallet', 57),
(120, '2021_10_14_061603_column_update_order_transaction', 57),
(121, '2021_10_15_103339_remove_col_from_seller_wallet', 57),
(122, '2021_10_15_104419_add_id_col_order_tran', 57),
(123, '2021_10_15_213454_update_string_limit', 57),
(124, '2021_10_16_234037_change_col_type_translation', 57),
(125, '2021_10_16_234329_change_col_type_translation_1', 57),
(126, '2021_10_27_091250_add_shipping_address_in_order', 58),
(127, '2021_01_24_205114_create_paytabs_invoices_table', 59),
(128, '2021_11_20_043814_change_pass_reset_email_col', 59),
(129, '2021_11_25_043109_create_delivery_men_table', 60),
(130, '2021_11_25_062242_add_auth_token_delivery_man', 60),
(131, '2021_11_27_043405_add_deliveryman_in_order_table', 60),
(132, '2021_11_27_051432_create_delivery_histories_table', 60),
(133, '2021_11_27_051512_add_fcm_col_for_delivery_man', 60),
(134, '2021_12_15_123216_add_columns_to_banner', 60),
(135, '2022_01_04_100543_add_order_note_to_orders_table', 60),
(136, '2022_01_10_034952_add_lat_long_to_shipping_addresses_table', 60),
(137, '2022_01_10_045517_create_billing_addresses_table', 60),
(138, '2022_01_11_040755_add_is_billing_to_shipping_addresses_table', 60),
(139, '2022_01_11_053404_add_billing_to_orders_table', 60),
(140, '2022_01_11_234310_add_firebase_toke_to_sellers_table', 60),
(141, '2022_01_16_121801_change_colu_type', 60),
(142, '2022_01_22_101601_change_cart_col_type', 61),
(143, '2022_01_23_031359_add_column_to_orders_table', 61),
(144, '2022_01_28_235054_add_status_to_admins_table', 61),
(145, '2022_02_01_214654_add_pos_status_to_sellers_table', 61),
(146, '2019_12_14_000001_create_personal_access_tokens_table', 62),
(147, '2022_02_11_225355_add_checked_to_orders_table', 62),
(148, '2022_02_14_114359_create_refund_requests_table', 62),
(149, '2022_02_14_115757_add_refund_request_to_order_details_table', 62),
(150, '2022_02_15_092604_add_order_details_id_to_transactions_table', 62),
(151, '2022_02_15_121410_create_refund_transactions_table', 62),
(152, '2022_02_24_091236_add_multiple_column_to_refund_requests_table', 62),
(153, '2022_02_24_103827_create_refund_statuses_table', 62),
(154, '2022_03_01_121420_add_refund_id_to_refund_transactions_table', 62),
(155, '2022_03_10_091943_add_priority_to_categories_table', 63),
(156, '2022_03_13_111914_create_shipping_types_table', 63),
(157, '2022_03_13_121514_create_category_shipping_costs_table', 63),
(158, '2022_03_14_074413_add_four_column_to_products_table', 63),
(159, '2022_03_15_105838_add_shipping_to_carts_table', 63),
(160, '2022_03_16_070327_add_shipping_type_to_orders_table', 63),
(161, '2022_03_17_070200_add_delivery_info_to_orders_table', 63),
(162, '2022_03_18_143339_add_shipping_type_to_carts_table', 63),
(163, '2022_04_06_020313_create_subscriptions_table', 64),
(164, '2022_04_12_233704_change_column_to_products_table', 64),
(165, '2022_04_19_095926_create_jobs_table', 64),
(166, '2022_05_12_104247_create_wallet_transactions_table', 65),
(167, '2022_05_12_104511_add_two_column_to_users_table', 65),
(168, '2022_05_14_063309_create_loyalty_point_transactions_table', 65),
(169, '2022_05_26_044016_add_user_type_to_password_resets_table', 65),
(170, '2021_05_19_115112_create_zones_table', 66),
(171, '2022_04_15_235820_add_provider', 66),
(172, '2022_07_21_101659_add_code_to_products_table', 66),
(173, '2022_07_26_103744_add_notification_count_to_notifications_table', 66),
(174, '2022_07_31_031541_add_minimum_order_qty_to_products_table', 66),
(175, '2022_09_29_094838_create_subscription_sellers_table', 66),
(176, '2022_11_19_231913_create_delivery_methods_table', 67),
(177, '2022_11_19_233852_create_cart_deliveries_table', 67),
(178, '2022_11_20_175952_add_slug_to_delivery_methods', 67),
(179, '2022_11_21_151549_add_delivery_method_to_orders', 67),
(180, '2022_11_26_141214_create_employs_table', 68),
(181, '2022_11_26_215437_create_permission_tables', 68);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Employ', 1),
(1, 'App\\Employ', 2),
(1, 'App\\Model\\Seller', 19),
(1, 'App\\Model\\Seller', 20),
(1, 'App\\Model\\Seller', 21),
(1, 'App\\Model\\Seller', 22),
(1, 'App\\Model\\Seller', 23),
(1, 'App\\Model\\Seller', 24),
(1, 'App\\Model\\Seller', 29),
(1, 'App\\Model\\Seller', 32),
(1, 'App\\Model\\Seller', 33),
(1, 'App\\Model\\Seller', 34),
(1, 'App\\Model\\Seller', 35),
(1, 'App\\Model\\Seller', 36),
(1, 'App\\Model\\Seller', 37),
(4, 'App\\Model\\Seller', 38),
(4, 'App\\Model\\Seller', 39);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_count` int NOT NULL DEFAULT '0',
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('045515c71e23b27b91b5643351eab43e41688dee1aa5e9ba5f8f56b4491620e4aa022d7c9eac235a', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-28 09:05:11', '2022-11-28 09:05:11', '2023-11-28 10:05:11'),
('0d6402c12f67ef2d9e6d383b38e864cf9db0f8013e4f1eca30c5047441d2995072e76967f8755c0a', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 15:14:38', '2022-12-14 15:14:38', '2023-12-14 16:14:38'),
('2f8f798f52dd0ce4cca035cd60725a6749b87445dce4fbf399c4657ef7116605d3425bc2704a656f', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 16:25:27', '2022-12-17 16:25:27', '2023-12-17 17:25:27'),
('3436851234514122838d51e930335e11a48f9680b85dba01e323edf16ea8e274c9681823c8db80d0', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 16:31:01', '2022-12-15 16:31:01', '2023-12-15 17:31:01'),
('4649c4aca349768c7e794b8d3a326ebec4bae6e94552ff834994ff02c3b8f62c8cb037d167f5d0b9', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 06:49:08', '2022-12-21 06:49:08', '2023-12-21 07:49:08'),
('51749bff845315dd02615535a718581c110a176a56f2db854bec87f0f6a05de0a103e993f64f49a2', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 15:14:36', '2022-12-14 15:14:36', '2023-12-14 16:14:36'),
('53ae60024f67a041740a77fc4c5fe295c38f05cad50392bace1ac7b2f9fca41cf41e98214f584e48', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-08 17:07:25', '2022-11-08 17:07:25', '2023-11-08 18:07:25'),
('5c22aa694d254d9a320a265cbce02f208a854186fc818dbb10d7d8b5e280b103140a7c0ed0198ec7', 12, 1, 'LaravelAuthApp', '[]', 0, '2022-11-28 08:59:38', '2022-11-28 08:59:38', '2023-11-28 09:59:38'),
('5e00725208bd22e6de60c79be723c2526fdf7b19cb25a000f41cdf989a5e83199422b4928fa9c31d', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-02 11:34:26', '2022-11-02 11:34:26', '2023-11-02 12:34:26'),
('5f40cb8ddefa2bf5e2ded59b2867a5c239f2cbf6315b8b00c9f63f4f6cecb89ad8c5016cac70ee79', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-10-27 17:08:08', '2022-10-27 17:08:08', '2023-10-27 19:08:08'),
('6840b7d4ed685bf2e0dc593affa0bd3b968065f47cc226d39ab09f1422b5a1d9666601f3f60a79c1', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:25:41', '2021-07-05 09:25:41', '2022-07-05 15:25:41'),
('68edc760107f96e58fa01e119fb0ec6b00d1b37260f471da47535090425b445be4196898c88c83aa', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-10-23 17:08:55', '2022-10-23 17:08:55', '2023-10-23 19:08:55'),
('699fd76d5bf8f768eb893c6aa04168e5af27fdc305621db0f796cd3148467f1d357c3c598350c60f', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 15:13:50', '2022-12-14 15:13:50', '2023-12-14 16:13:50'),
('6c58cf5705b0047fb01931f75ded6a074730a22e34837c5297d8935b90e71e69406bf0b3aeb6164c', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-10-31 18:36:50', '2022-10-31 18:36:50', '2023-10-31 19:36:50'),
('6f7a15ea817ee4c379f339aba37e2262fe2755b47335625e443c8e0a1a836018586362199bd9b10a', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-10 22:27:12', '2022-11-10 22:27:12', '2023-11-10 23:27:12'),
('70323a289499e96c3861b9b2515b60a970b2997afe138125ff06a68a0a55af910e7067280abbd144', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-10-23 17:22:03', '2022-10-23 17:22:03', '2023-10-23 19:22:03'),
('7892672e4efd533cc0f7bf18ffc8d826c09e234b8bbb89887a6b34143226123df69b2134307058c8', 17, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 10:52:30', '2022-12-21 10:52:30', '2023-12-21 11:52:30'),
('81da3b6fb259dbc830860c0f1ce1a4a456ee14796cd5cd4a9a9df9671ff49b09bb724b0f9772fdd7', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-10-28 16:46:41', '2022-10-28 16:46:41', '2023-10-28 18:46:41'),
('84878c044d3da8458bfa2e95f874b583c548791fa363651203ac6069296343d8da80aed5e2a14db4', 11, 1, 'LaravelAuthApp', '[]', 0, '2022-10-30 09:45:44', '2022-10-30 09:45:44', '2023-10-30 10:45:44'),
('89ee8f12900c405d94e47503cc22ae5a95632e7f8c82aa7df049cbbda84ce2d8480a711578ca93af', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-04 11:58:24', '2022-11-04 11:58:24', '2023-11-04 12:58:24'),
('9c4edfc05d880b5690181c1dc85f3b4860c21ca9363987935aa60e4f965698f41c80fa343b6cab3d', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 17:21:30', '2022-12-14 17:21:30', '2023-12-14 18:21:30'),
('a2fc2c4b8f642cbcbcd5356ddbe28fc2861130e1a115a275ab44e9994aa1afd82001dcdc98912ab5', 3, 1, 'LaravelAuthApp', '[]', 0, '2022-10-23 17:22:17', '2022-10-23 17:22:17', '2023-10-23 19:22:17'),
('bbe6ef9e75002afd06caf85b5c3515c69653a4740beedc247cef8ec7a641db780f941a1703a67990', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-19 04:31:57', '2022-11-19 04:31:57', '2023-11-19 05:31:57'),
('bee48c3ebaf892e779cdee3e7551e5c5404e6aa264b5682c1ef1936a983a85db069024c33cb0d35f', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-19 21:44:53', '2022-12-19 21:44:53', '2023-12-19 22:44:53'),
('c42cdd5ae652b8b2cbac4f2f4b496e889e1a803b08672954c8bbe06722b54160e71dce3e02331544', 98, 1, 'LaravelAuthApp', '[]', 1, '2021-07-05 09:24:36', '2021-07-05 09:24:36', '2022-07-05 15:24:36'),
('cd48fabd398fee90f5b6f9f34c8e23421a0ec67a9f697022edda11b733fa9531b9ac1063befa5dfa', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 15:22:18', '2022-12-14 15:22:18', '2023-12-14 16:22:18'),
('d2ae743cc9a4cfbc3bec883d2c11c51875474e77f33ad6976e9bdde18815e067648f70a4ca64642c', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 16:24:13', '2022-12-17 16:24:13', '2023-12-17 17:24:13'),
('d86e345313913e5ab78b619a7ba965fc41075fa444fcf7f28054ac897410ebfb08c49777eb2878ea', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-09 10:39:15', '2022-11-09 10:39:15', '2023-11-09 11:39:15'),
('da02936039814f745958520bac753f4c8d3343213db30fd17ab804770973dce01a83659103ea274d', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-04 19:14:15', '2022-11-04 19:14:15', '2023-11-04 20:14:15'),
('dacccffd7c71c155877c228a6ecc7b94ff1d895aaf9e431e7c7e591cb5ad9c07003165cff82e28c7', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-17 22:19:10', '2022-12-17 22:19:10', '2023-12-17 23:19:10'),
('e6c68939ae78b2939a351e34868ef1c854cabed50db842f56cbb0ba79ff0ec44b834950b88897e7e', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-04 12:03:49', '2022-11-04 12:03:49', '2023-11-04 13:03:49'),
('f634233d7f87a016d609a217398e2d0c548468059c6cb134d097d7d0f259ff139f2f8e23e72950c7', 18, 1, 'LaravelAuthApp', '[]', 0, '2022-12-14 15:50:40', '2022-12-14 15:50:40', '2023-12-14 16:50:40'),
('f8ed39c56d877aacfd44ef3709afaebfde58f0d4b0fb62fbf90f1fe48e8cdadf121056a2a74c2c89', 21, 1, 'LaravelAuthApp', '[]', 0, '2022-12-21 10:49:03', '2022-12-21 10:49:03', '2023-12-21 11:49:03'),
('fe0aa6dc235709da25dd7216738cd864f929800248aa2d6ee70a4d0154599dadd68cd0df3b694f05', 19, 1, 'LaravelAuthApp', '[]', 0, '2022-12-15 16:33:43', '2022-12-15 16:33:43', '2023-12-15 17:33:43'),
('febe249a4986895ae0eb3cfa9470adfeb900713d958260bf5f5d85d5f1170653ffb8302e72a11003', 8, 1, 'LaravelAuthApp', '[]', 0, '2022-11-28 08:58:21', '2022-11-28 08:58:21', '2023-11-28 09:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int UNSIGNED NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `provider` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`, `provider`) VALUES
(1, NULL, '6amtech', 'GEUx5tqkviM6AAQcz4oi1dcm1KtRdJPgw41lj0eI', 'http://localhost', 1, 0, 0, '2020-10-21 18:27:22', '2020-10-21 18:27:22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int UNSIGNED NOT NULL,
  `client_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-10-21 18:27:23', '2020-10-21 18:27:23');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `order_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_ref` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_amount` double NOT NULL DEFAULT '0',
  `shipping_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount_amount` double NOT NULL DEFAULT '0',
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method_id` bigint NOT NULL DEFAULT '0',
  `shipping_cost` double(8,2) NOT NULL DEFAULT '0.00',
  `order_group_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def-order-group',
  `verification_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `seller_id` bigint DEFAULT NULL,
  `seller_is` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `delivery_man_id` bigint DEFAULT NULL,
  `order_note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `billing_address` bigint UNSIGNED DEFAULT NULL,
  `billing_address_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `order_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default_type',
  `extra_discount` double(8,2) NOT NULL DEFAULT '0.00',
  `extra_discount_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_service_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `third_party_delivery_tracking_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_method_id` bigint UNSIGNED DEFAULT NULL,
  `shop_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `customer_type`, `payment_status`, `order_status`, `payment_method`, `transaction_ref`, `order_amount`, `shipping_address`, `created_at`, `updated_at`, `discount_amount`, `discount_type`, `coupon_code`, `shipping_method_id`, `shipping_cost`, `order_group_id`, `verification_code`, `seller_id`, `seller_is`, `shipping_address_data`, `delivery_man_id`, `order_note`, `billing_address`, `billing_address_data`, `order_type`, `extra_discount`, `extra_discount_type`, `checked`, `shipping_type`, `delivery_type`, `delivery_service_name`, `third_party_delivery_tracking_id`, `delivery_method_id`, `shop_id`) VALUES
(100001, '10', 'customer', 'paid', 'delivered', 'cash_on_delivery', '', 15.6, '1', '2022-10-27 17:51:06', '2022-10-27 17:54:34', 0, NULL, '0', 2, 5.00, '5102-ZKbUN-1666900266', '795370', 1, 'admin', '{\"id\":1,\"customer_id\":10,\"contact_person_name\":\"Roanna Morin\",\"address_type\":\"home\",\"address\":\"Lorem repellendus O\",\"city\":\"Laborum Vel exceptu\",\"zip\":\"54866\",\"phone\":\"+1 (872) 568-6996\",\"created_at\":\"2022-10-27T19:49:26.000000Z\",\"updated_at\":\"2022-10-27T19:49:26.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":0}', NULL, NULL, 3, '{\"id\":3,\"customer_id\":10,\"contact_person_name\":\"Ruth Weeks\",\"address_type\":\"others\",\"address\":\"Qui ducimus occaeca\",\"city\":\"Reiciendis eos enim \",\"zip\":\"84942\",\"phone\":\"+1 (287) 594-7849\",\"created_at\":\"2022-10-27T19:50:02.000000Z\",\"updated_at\":\"2022-10-27T19:50:02.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"\",\"longitude\":\"\",\"is_billing\":1}', 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL, NULL, NULL),
(100002, '12', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 180, NULL, '2022-11-25 20:13:27', '2022-11-25 20:16:02', 0, NULL, '0', 0, 0.00, '1495-IAhl0-1669410807', '897792', 4, 'seller', NULL, NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL, 2, 4),
(100003, '19', 'customer', 'unpaid', 'out_for_delivery', 'cash_on_delivery', '', 7711.95, '15', '2022-12-14 15:45:24', '2022-12-14 15:45:53', 0, NULL, '0', 8, 6711.95, '6045-nvAb2-1671036324', '746936', 37, 'seller', '{\"id\":15,\"customer_id\":19,\"contact_person_name\":\"test\",\"address_type\":\"permanent\",\"address\":\"test\",\"city\":\"test\",\"zip\":\"33453\",\"phone\":\"0200000000\",\"created_at\":\"2022-12-14T16:45:16.000000Z\",\"updated_at\":\"2022-12-14T16:45:16.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"7.1303809720770275\",\"longitude\":\"-5.574639467040765\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL, NULL, NULL),
(100004, '17', 'customer', 'unpaid', 'confirmed', 'cash_on_delivery', '', 1010, '16', '2022-12-15 06:21:18', '2022-12-15 06:34:50', 0, NULL, '0', 11, 10.00, '1910-d514o-1671088878', '688792', 37, 'seller', '{\"id\":16,\"customer_id\":0,\"contact_person_name\":\"ahmad alhameed\",\"address_type\":\"permanent\",\"address\":\"yopougon\",\"city\":\"abidjan\",\"zip\":\"225\",\"phone\":\"0757496206\",\"created_at\":\"2022-12-15T07:19:18.000000Z\",\"updated_at\":\"2022-12-15T07:19:18.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"7.288423257767905\",\"longitude\":\"-4.564688531200158\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL, NULL, NULL),
(100005, '19', 'customer', 'unpaid', 'pending', 'cash_on_delivery', '', 8212.41, '17', '2022-12-15 20:23:01', '2022-12-15 20:23:29', 0, NULL, '0', 10, 7212.41, '9985-5iFky-1671139381', '803710', 37, 'seller', '{\"id\":17,\"customer_id\":19,\"contact_person_name\":\"ahmed eid\",\"address_type\":\"permanent\",\"address\":\"New Nubaria City\\r\\nAly Ibn Abo Tablab Street\",\"city\":\"New Nubaria City\",\"zip\":\"04555\",\"phone\":\"+201005084569\",\"created_at\":\"2022-12-15T21:22:47.000000Z\",\"updated_at\":\"2022-12-15T21:22:47.000000Z\",\"state\":null,\"country\":null,\"latitude\":\"7.362884148914566\",\"longitude\":\"-5.574639467040765\",\"is_billing\":0}', NULL, NULL, NULL, NULL, 'default_type', 0.00, NULL, 1, 'order_wise', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `seller_id` bigint DEFAULT NULL,
  `product_details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `qty` int NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `tax` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `delivery_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `payment_status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shipping_method_id` bigint DEFAULT NULL,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_stock_decreased` tinyint(1) NOT NULL DEFAULT '1',
  `refund_request` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `seller_id`, `product_details`, `qty`, `price`, `tax`, `discount`, `delivery_status`, `payment_status`, `created_at`, `updated_at`, `shipping_method_id`, `variant`, `variation`, `discount_type`, `is_stock_decreased`, `refund_request`) VALUES
(1, 100001, 31, 1, '{\"id\":31,\"added_by\":\"admin\",\"user_id\":1,\"name\":\"\\u0645\\u0644\\u0627\\u0628\\u0633  \\u062f\\u0627\\u062e\\u0644\\u064a\\u0629 \\u0631\\u062c\\u0627\\u0644\\u064a\",\"slug\":\"mens-underwear-am9Tka\",\"category_ids\":\"[{\\\"id\\\":\\\"3\\\",\\\"position\\\":1},{\\\"id\\\":\\\"4\\\",\\\"position\\\":2},{\\\"id\\\":\\\"17\\\",\\\"position\\\":3}]\",\"brand_id\":5,\"unit\":\"ltrs\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-10-14-6349c1bf4b563.png\\\",\\\"2022-10-14-6349c1bf4c7d2.png\\\"]\",\"thumbnail\":\"2022-10-14-6349c1bf4d3d4.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[\\\"#FAEBD7\\\",\\\"#556B2F\\\"]\",\"variant_product\":\"0\",\"attributes\":\"[\\\"1\\\"]\",\"choice_options\":\"[{\\\"name\\\":\\\"choice_1\\\",\\\"title\\\":\\\"Size\\\",\\\"options\\\":[\\\"44\\\"]}]\",\"variation\":\"[{\\\"type\\\":\\\"AntiqueWhite-44\\\",\\\"price\\\":12,\\\"sku\\\":\\\"Mu-AntiqueWhite-44\\\",\\\"qty\\\":1},{\\\"type\\\":\\\"DarkOliveGreen-44\\\",\\\"price\\\":12,\\\"sku\\\":\\\"Mu-DarkOliveGreen-44\\\",\\\"qty\\\":1}]\",\"published\":0,\"unit_price\":12,\"purchase_price\":50,\"tax\":5,\"tax_type\":\"percent\",\"discount\":2,\"discount_type\":\"flat\",\"current_stock\":2,\"minimum_order_qty\":\"1\",\"details\":\"<p>\\u0645\\u0644\\u0627\\u0628\\u0633 &nbsp;\\u062f\\u0627\\u062e\\u0644\\u064a\\u0629 \\u0631\\u062c\\u0627\\u0644\\u064a&nbsp;<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-10-14T20:08:31.000000Z\",\"updated_at\":\"2022-10-14T20:08:34.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Men\'s underwear\",\"meta_description\":\"Men\'s underwear\",\"meta_image\":\"2022-10-14-6349c1bf4dfae.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":10,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"120360\",\"service\":null,\"phone\":\"\",\"reviews_count\":\"0\",\"translations\":[{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"31\",\"locale\":\"eg\",\"key\":\"name\",\"value\":\"\\u0645\\u0644\\u0627\\u0628\\u0633  \\u062f\\u0627\\u062e\\u0644\\u064a\\u0629 \\u0631\\u062c\\u0627\\u0644\\u064a\",\"id\":192},{\"translationable_type\":\"App\\\\Model\\\\Product\",\"translationable_id\":\"31\",\"locale\":\"eg\",\"key\":\"description\",\"value\":\"<p>\\u0645\\u0644\\u0627\\u0628\\u0633 &nbsp;\\u062f\\u0627\\u062e\\u0644\\u064a\\u0629 \\u0631\\u062c\\u0627\\u0644\\u064a&nbsp;<\\/p>\",\"id\":193}],\"reviews\":[]}', 1, 12, 0.6, 2, 'delivered', 'unpaid', '2022-10-27 17:51:06', '2022-10-27 17:54:34', NULL, 'AntiqueWhite-44', '{\"color\":\"AntiqueWhite\",\"Size\":\"44\"}', 'discount_on_product', 1, 0),
(2, 100002, 46, 4, '{\"id\":46,\"added_by\":\"seller\",\"user_id\":4,\"name\":\"Shawarma\",\"slug\":\"shawarma-u4we4s\",\"category_ids\":\"[{\\\"id\\\":\\\"36\\\",\\\"position\\\":1},{\\\"id\\\":\\\"52\\\",\\\"position\\\":2}]\",\"brand_id\":4,\"unit\":\"kg\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-11-23-637e670ed9814.png\\\",\\\"2022-11-23-637e670edac19.png\\\",\\\"2022-11-23-637e670edbf80.png\\\"]\",\"thumbnail\":\"2022-11-23-637e670edd32c.png\",\"featured\":null,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":\"cccc\",\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":20,\"purchase_price\":30,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"percent\",\"current_stock\":20,\"minimum_order_qty\":\"1\",\"details\":\"<p>Shawarma<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-11-23T18:31:42.000000Z\",\"updated_at\":\"2022-11-25T20:54:53.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"Syrian chicken\",\"meta_description\":\"Shawarma\",\"meta_image\":\"2022-11-23-637e670edeed0.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"135028\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 9, 20, 0, 0, 'pending', 'unpaid', '2022-11-25 20:13:27', '2022-11-25 20:13:27', NULL, '', '[]', 'discount_on_product', 1, 0),
(3, 100003, 50, 37, '{\"id\":50,\"added_by\":\"seller\",\"user_id\":37,\"name\":\"PLC\",\"slug\":\"plc-MKipoG\",\"category_ids\":\"[{\\\"id\\\":\\\"42\\\",\\\"position\\\":1},{\\\"id\\\":\\\"87\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-12-09-6392e45b99c67.png\\\"]\",\"thumbnail\":\"2022-12-09-6392e45ba06ab.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":900,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":9,\"minimum_order_qty\":\"1\",\"details\":\"<p>PLC<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-09T07:31:39.000000Z\",\"updated_at\":\"2022-12-10T20:47:43.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"PLC\",\"meta_description\":\"PLC\",\"meta_image\":\"2022-12-09-6392e45ba221b.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"162618\",\"emp_id\":\"0\",\"shipping_cat_id\":\"2\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1000, 0, 0, 'pending', 'unpaid', '2022-12-14 15:45:24', '2022-12-14 15:45:24', NULL, '', '[]', 'discount_on_product', 1, 0),
(4, 100004, 50, 37, '{\"id\":50,\"added_by\":\"seller\",\"user_id\":37,\"name\":\"PLC\",\"slug\":\"plc-MKipoG\",\"category_ids\":\"[{\\\"id\\\":\\\"42\\\",\\\"position\\\":1},{\\\"id\\\":\\\"87\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-12-09-6392e45b99c67.png\\\"]\",\"thumbnail\":\"2022-12-09-6392e45ba06ab.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":900,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":8,\"minimum_order_qty\":\"1\",\"details\":\"<p>PLC<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-09T07:31:39.000000Z\",\"updated_at\":\"2022-12-14T16:45:24.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"PLC\",\"meta_description\":\"PLC\",\"meta_image\":\"2022-12-09-6392e45ba221b.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"162618\",\"emp_id\":\"0\",\"shipping_cat_id\":\"2\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1000, 0, 0, 'pending', 'unpaid', '2022-12-15 06:21:18', '2022-12-15 06:21:18', NULL, '', '[]', 'discount_on_product', 1, 0),
(5, 100005, 50, 37, '{\"id\":50,\"added_by\":\"seller\",\"user_id\":37,\"name\":\"PLC\",\"slug\":\"plc-MKipoG\",\"category_ids\":\"[{\\\"id\\\":\\\"42\\\",\\\"position\\\":1},{\\\"id\\\":\\\"87\\\",\\\"position\\\":2}]\",\"brand_id\":1,\"unit\":\"pc\",\"min_qty\":1,\"refundable\":1,\"images\":\"[\\\"2022-12-09-6392e45b99c67.png\\\"]\",\"thumbnail\":\"2022-12-09-6392e45ba06ab.png\",\"featured\":1,\"flash_deal\":null,\"video_provider\":\"youtube\",\"video_url\":null,\"colors\":\"[]\",\"variant_product\":\"0\",\"attributes\":\"null\",\"choice_options\":\"[]\",\"variation\":\"[]\",\"published\":0,\"unit_price\":1000,\"purchase_price\":900,\"tax\":0,\"tax_type\":\"percent\",\"discount\":0,\"discount_type\":\"flat\",\"current_stock\":7,\"minimum_order_qty\":\"1\",\"details\":\"<p>PLC<\\/p>\",\"free_shipping\":0,\"attachment\":null,\"created_at\":\"2022-12-09T07:31:39.000000Z\",\"updated_at\":\"2022-12-15T07:21:19.000000Z\",\"status\":1,\"featured_status\":1,\"meta_title\":\"PLC\",\"meta_description\":\"PLC\",\"meta_image\":\"2022-12-09-6392e45ba221b.png\",\"request_status\":\"1\",\"denied_note\":null,\"shipping_cost\":0,\"multiply_qty\":0,\"temp_shipping_cost\":null,\"is_shipping_cost_updated\":null,\"code\":\"162618\",\"emp_id\":\"0\",\"shipping_cat_id\":\"2\",\"reviews_count\":\"0\",\"translations\":[],\"reviews\":[]}', 1, 1000, 0, 0, 'pending', 'unpaid', '2022-12-15 20:23:01', '2022-12-15 20:23:01', NULL, '', '[]', 'discount_on_product', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `seller_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `order_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `seller_amount` decimal(8,2) NOT NULL DEFAULT '0.00',
  `admin_commission` decimal(8,2) NOT NULL DEFAULT '0.00',
  `received_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_charge` decimal(8,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `seller_is` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_transactions`
--

INSERT INTO `order_transactions` (`seller_id`, `order_id`, `order_amount`, `seller_amount`, `admin_commission`, `received_by`, `status`, `delivery_charge`, `tax`, `created_at`, `updated_at`, `customer_id`, `seller_is`, `delivered_by`, `payment_method`, `transaction_id`, `id`) VALUES
(1, 100001, '10.00', '10.00', '0.00', 'admin', 'disburse', '5.00', '0.60', '2022-10-27 17:54:34', '2022-10-27 17:54:34', 10, 'admin', 'admin', 'cash_on_delivery', '9555-KSEzw-1666900474', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `identity` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`identity`, `token`, `created_at`, `user_type`) VALUES
('maiko194d6e8473@outlook.com', 'DdQoageYGFIQKKdw5shfJ8EJrgdzJSvRs716SpPmmyQmTjOXMG3Ar8b4Mruy9RuZ8t4WH7H0WTlPHSyiZG2G1XhF0RYNehYV1uDtF7FtlXX9xliH63SfdmPw', '2022-10-05 12:04:31', 'customer'),
('vladimirsam5ld@outlook.com', 'h1aucrYf3CqprTXLD4it5PNDRSIv0rrphJZtlVhTuYi16DUxc28msGZCZRrCb59QQYkHant550gDOS84Ou1hLt4NaEPhATdc6bInNYTH7l0oqXKka9MSj4oJ', '2022-10-17 11:16:48', 'customer'),
('alekseykbko@outlook.com', '3l3r4MGZhCb8Q7Bz4nJdNz6gD2NaS7t060dbJSiome0oZheZG66ryhAhPkqm554Qd62bbrQkA1SHo2U4pCeNpKZ35PM661bplYm9fYMV7dbGQFk2uTCKhGR7', '2022-10-20 00:51:16', 'customer'),
('vitaliyvo2m@outlook.com', 'f3IX8ze1JHUhqE0KVTnLWFkFjoHLQi2FrGs0FVmehxLn68I9ezC5Ov7V9k9RY6MmxUbIn4xOpfo0rfQ5xhdQMAlCT5M4W32x7cysZkxM9x6wZH2JeVPM7evm', '2022-10-20 17:22:01', 'customer'),
('artur5glvkn@outlook.com', '5an4D9yB7O3oOsi9r6s0V9WG8feDAHoJdI8dG7NygUweQToVLRMNnW3582rbfmRhs34wtjX7mNoL2HmNIznA8O9F2Vq12sk9N23cuyteuQkmKt1r3XLLMFxi', '2022-10-26 14:43:51', 'customer'),
('youssefaldiab1993@gmail.com', 'xUTqHyEL9p27yDXLeWRFjaWpEI23ZXf4djm0cFyh9Oj9SNrWjszICJn9d2M4ouzFpjyte44RbMZng3mEjEzxAAyMaxFAKvX1RbCoc2izhMxl1PHHXD6GNriU', '2022-11-16 06:33:09', 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `paytabs_invoices`
--

CREATE TABLE `paytabs_invoices` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `response_code` int UNSIGNED NOT NULL,
  `pt_invoice_id` int UNSIGNED DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `currency` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` int UNSIGNED DEFAULT NULL,
  `card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_first_six_digits` int UNSIGNED DEFAULT NULL,
  `card_last_four_digits` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'products', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(2, 'services', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(3, 'roles', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(4, 'orders', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(5, 'reviews', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(6, 'ORDER MANAGEMENT', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(7, 'PRODUCT MANAGEMENT', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(8, 'Refund request', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(9, 'Messages', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(10, 'My shop', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(11, 'My bank Info', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49'),
(12, 'BUSINESS SECTION', 'seller', '2022-11-30 18:34:49', '2022-11-30 18:34:49');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_or_email_verifications`
--

CREATE TABLE `phone_or_email_verifications` (
  `id` bigint UNSIGNED NOT NULL,
  `phone_or_email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `added_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_ids` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_qty` int DEFAULT '1',
  `refundable` tinyint(1) NOT NULL DEFAULT '1',
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `flash_deal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_provider` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `colors` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` tinyint(1) NOT NULL DEFAULT '0',
  `attributes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `choice_options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `variation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `unit_price` double NOT NULL DEFAULT '0',
  `purchase_price` double NOT NULL DEFAULT '0',
  `tax` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0.00',
  `tax_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `discount_type` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stock` int DEFAULT NULL,
  `minimum_order_qty` int DEFAULT '1',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `featured_status` tinyint(1) NOT NULL DEFAULT '1',
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request_status` tinyint(1) NOT NULL DEFAULT '0',
  `denied_note` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` double(8,2) DEFAULT NULL,
  `multiply_qty` tinyint(1) DEFAULT NULL,
  `temp_shipping_cost` double(8,2) DEFAULT NULL,
  `is_shipping_cost_updated` tinyint(1) DEFAULT NULL,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `emp_id` bigint NOT NULL,
  `shipping_category_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `brand_id`, `unit`, `min_qty`, `refundable`, `images`, `thumbnail`, `featured`, `flash_deal`, `video_provider`, `video_url`, `colors`, `variant_product`, `attributes`, `choice_options`, `variation`, `published`, `unit_price`, `purchase_price`, `tax`, `tax_type`, `discount`, `discount_type`, `current_stock`, `minimum_order_qty`, `details`, `free_shipping`, `attachment`, `created_at`, `updated_at`, `status`, `featured_status`, `meta_title`, `meta_description`, `meta_image`, `request_status`, `denied_note`, `shipping_cost`, `multiply_qty`, `temp_shipping_cost`, `is_shipping_cost_updated`, `code`, `emp_id`, `shipping_category_id`) VALUES
(50, 'seller', 37, 'PLC', 'plc-MKipoG', '[{\"id\":\"42\",\"position\":1},{\"id\":\"87\",\"position\":2}]', 1, 'pc', 1, 1, '[\"2022-12-09-6392e45b99c67.png\"]', '2022-12-09-6392e45ba06ab.png', '1', NULL, 'youtube', NULL, '[]', 0, 'null', '[]', '[]', 0, 1000, 900, '0', 'percent', '0', 'flat', 6, 1, '<p>PLC</p>', 0, NULL, '2022-12-09 06:31:39', '2022-12-15 20:23:01', 1, 1, 'PLC', 'PLC', '2022-12-09-6392e45ba221b.png', 1, NULL, 0.00, 0, NULL, NULL, '162618', 0, 2),
(51, 'admin', 1, 'test', 'test-IGnZKV', '[{\"id\":\"37\",\"position\":1},{\"id\":\"56\",\"position\":2}]', 5, 'kg', 1, 1, '[\"2023-01-03-63b4394f23ae4.png\",\"2023-01-03-63b4394f29ba0.png\"]', '2023-01-03-63b4394f2a621.png', '0', NULL, 'youtube', NULL, '[\"#000000\",\"#0000FF\",\"#228B22\"]', 0, '[\"3\",\"2\"]', '[{\"name\":\"choice_3\",\"title\":\"Length\",\"options\":[\"100\",\"200\",\"300\"]},{\"name\":\"choice_2\",\"title\":\"Weight\",\"options\":[\"400\",\"500\",\"600\"]}]', '[{\"type\":\"Black-100-400\",\"price\":1000,\"sku\":\"t-Black-100-400\",\"qty\":1},{\"type\":\"Black-100-500\",\"price\":1000,\"sku\":\"t-Black-100-500\",\"qty\":1},{\"type\":\"Black-100-600\",\"price\":1000,\"sku\":\"t-Black-100-600\",\"qty\":1},{\"type\":\"Black-200-400\",\"price\":1000,\"sku\":\"t-Black-200-400\",\"qty\":1},{\"type\":\"Black-200-500\",\"price\":1000,\"sku\":\"t-Black-200-500\",\"qty\":1},{\"type\":\"Black-200-600\",\"price\":1000,\"sku\":\"t-Black-200-600\",\"qty\":1},{\"type\":\"Black-300-400\",\"price\":1000,\"sku\":\"t-Black-300-400\",\"qty\":1},{\"type\":\"Black-300-500\",\"price\":1000,\"sku\":\"t-Black-300-500\",\"qty\":1},{\"type\":\"Black-300-600\",\"price\":1000,\"sku\":\"t-Black-300-600\",\"qty\":1},{\"type\":\"Blue-100-400\",\"price\":1000,\"sku\":\"t-Blue-100-400\",\"qty\":1},{\"type\":\"Blue-100-500\",\"price\":1000,\"sku\":\"t-Blue-100-500\",\"qty\":1},{\"type\":\"Blue-100-600\",\"price\":1000,\"sku\":\"t-Blue-100-600\",\"qty\":1},{\"type\":\"Blue-200-400\",\"price\":1000,\"sku\":\"t-Blue-200-400\",\"qty\":1},{\"type\":\"Blue-200-500\",\"price\":1000,\"sku\":\"t-Blue-200-500\",\"qty\":1},{\"type\":\"Blue-200-600\",\"price\":1000,\"sku\":\"t-Blue-200-600\",\"qty\":1},{\"type\":\"Blue-300-400\",\"price\":1000,\"sku\":\"t-Blue-300-400\",\"qty\":1},{\"type\":\"Blue-300-500\",\"price\":1000,\"sku\":\"t-Blue-300-500\",\"qty\":1},{\"type\":\"Blue-300-600\",\"price\":1000,\"sku\":\"t-Blue-300-600\",\"qty\":1},{\"type\":\"ForestGreen-100-400\",\"price\":1000,\"sku\":\"t-ForestGreen-100-400\",\"qty\":1},{\"type\":\"ForestGreen-100-500\",\"price\":1000,\"sku\":\"t-ForestGreen-100-500\",\"qty\":1},{\"type\":\"ForestGreen-100-600\",\"price\":1000,\"sku\":\"t-ForestGreen-100-600\",\"qty\":1},{\"type\":\"ForestGreen-200-400\",\"price\":1000,\"sku\":\"t-ForestGreen-200-400\",\"qty\":1},{\"type\":\"ForestGreen-200-500\",\"price\":1000,\"sku\":\"t-ForestGreen-200-500\",\"qty\":1},{\"type\":\"ForestGreen-200-600\",\"price\":1000,\"sku\":\"t-ForestGreen-200-600\",\"qty\":1},{\"type\":\"ForestGreen-300-400\",\"price\":1000,\"sku\":\"t-ForestGreen-300-400\",\"qty\":1},{\"type\":\"ForestGreen-300-500\",\"price\":1000,\"sku\":\"t-ForestGreen-300-500\",\"qty\":1},{\"type\":\"ForestGreen-300-600\",\"price\":1000,\"sku\":\"t-ForestGreen-300-600\",\"qty\":1}]', 0, 1000, 900, '10', 'percent', '10', 'percent', 27, 1, 'test', 0, NULL, '2023-01-03 12:18:55', '2023-01-03 12:21:04', 1, 1, 'tsety', 'test', '2023-01-03-63b4394f2b6fd.png', 1, NULL, 0.00, 0, NULL, NULL, '147201', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `variant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `qty` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_requests`
--

CREATE TABLE `refund_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `order_details_id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint UNSIGNED NOT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED NOT NULL,
  `refund_reason` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `approved_note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rejected_note` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payment_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `change_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_statuses`
--

CREATE TABLE `refund_statuses` (
  `id` bigint UNSIGNED NOT NULL,
  `refund_request_id` bigint UNSIGNED DEFAULT NULL,
  `change_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_by_id` bigint UNSIGNED DEFAULT NULL,
  `status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_transactions`
--

CREATE TABLE `refund_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `payment_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint UNSIGNED DEFAULT NULL,
  `payment_receiver_id` bigint UNSIGNED DEFAULT NULL,
  `paid_by` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint NOT NULL,
  `customer_id` bigint NOT NULL,
  `comment` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `service_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `product_id`, `customer_id`, `comment`, `attachment`, `rating`, `status`, `service_id`, `created_at`, `updated_at`) VALUES
(1, 31, 10, 'كويس جدا', '[]', 4, 1, 0, '2022-10-27 17:55:14', '2022-10-27 17:55:14');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'seller', 'seller', '2022-11-30 18:35:11', '2022-11-30 18:35:11'),
(4, 'Data Entry', 'seller', '2022-12-09 11:38:38', '2022-12-09 11:38:56');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(1, 4),
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `search_functions`
--

CREATE TABLE `search_functions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visible_for` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_functions`
--

INSERT INTO `search_functions` (`id`, `key`, `url`, `visible_for`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'admin/dashboard', 'admin', NULL, NULL),
(2, 'Order All', 'admin/orders/list/all', 'admin', NULL, NULL),
(3, 'Order Pending', 'admin/orders/list/pending', 'admin', NULL, NULL),
(4, 'Order Processed', 'admin/orders/list/processed', 'admin', NULL, NULL),
(5, 'Order Delivered', 'admin/orders/list/delivered', 'admin', NULL, NULL),
(6, 'Order Returned', 'admin/orders/list/returned', 'admin', NULL, NULL),
(7, 'Order Failed', 'admin/orders/list/failed', 'admin', NULL, NULL),
(8, 'Brand Add', 'admin/brand/add-new', 'admin', NULL, NULL),
(9, 'Brand List', 'admin/brand/list', 'admin', NULL, NULL),
(10, 'Banner', 'admin/banner/list', 'admin', NULL, NULL),
(11, 'Category', 'admin/category/view', 'admin', NULL, NULL),
(12, 'Sub Category', 'admin/category/sub-category/view', 'admin', NULL, NULL),
(13, 'Sub sub category', 'admin/category/sub-sub-category/view', 'admin', NULL, NULL),
(14, 'Attribute', 'admin/attribute/view', 'admin', NULL, NULL),
(15, 'Product', 'admin/product/list', 'admin', NULL, NULL),
(16, 'Coupon', 'admin/coupon/add-new', 'admin', NULL, NULL),
(17, 'Custom Role', 'admin/custom-role/create', 'admin', NULL, NULL),
(18, 'Employee', 'admin/employee/add-new', 'admin', NULL, NULL),
(19, 'Seller', 'admin/sellers/seller-list', 'admin', NULL, NULL),
(20, 'Contacts', 'admin/contact/list', 'admin', NULL, NULL),
(21, 'Flash Deal', 'admin/deal/flash', 'admin', NULL, NULL),
(22, 'Deal of the day', 'admin/deal/day', 'admin', NULL, NULL),
(23, 'Language', 'admin/business-settings/language', 'admin', NULL, NULL),
(24, 'Mail', 'admin/business-settings/mail', 'admin', NULL, NULL),
(25, 'Shipping method', 'admin/business-settings/shipping-method/add', 'admin', NULL, NULL),
(26, 'Currency', 'admin/currency/view', 'admin', NULL, NULL),
(27, 'Payment method', 'admin/business-settings/payment-method', 'admin', NULL, NULL),
(28, 'SMS Gateway', 'admin/business-settings/sms-gateway', 'admin', NULL, NULL),
(29, 'Support Ticket', 'admin/support-ticket/view', 'admin', NULL, NULL),
(30, 'FAQ', 'admin/helpTopic/list', 'admin', NULL, NULL),
(31, 'About Us', 'admin/business-settings/about-us', 'admin', NULL, NULL),
(32, 'Terms and Conditions', 'admin/business-settings/terms-condition', 'admin', NULL, NULL),
(33, 'Web Config', 'admin/business-settings/web-config', 'admin', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `f_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bank_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_no` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `holder_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auth_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sales_commission_percentage` double(8,2) DEFAULT NULL,
  `gst` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pos_status` tinyint(1) NOT NULL DEFAULT '0',
  `category_id` bigint DEFAULT NULL,
  `added` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`id`, `f_name`, `l_name`, `image`, `email`, `password`, `status`, `remember_token`, `created_at`, `updated_at`, `bank_name`, `branch`, `account_no`, `holder_name`, `auth_token`, `sales_commission_percentage`, `gst`, `cm_firebase_token`, `pos_status`, `category_id`, `added`) VALUES
(37, 'Everest-Saller', 'Everest-Saller', '2022-12-09-6392e2240bdcb.png', 'Everest-Saller@gmail.com', '$2y$10$MzsWknKKmIo/wqFCBqUV.ONijBcw9HPOIyx69p9wF4fr2fqxlI3wa', 'approved', 'wqdVrBiVLZqqeOQ1sdT58p8oBwOnuwTGdiskStaUPPpOLQ4ekhuiCuDUVHsV', '2022-12-09 06:22:12', '2022-12-21 10:42:44', NULL, NULL, NULL, NULL, 'Q0pXa8zu9Te2hWEv0QX6zxBfkLRgHC0I5jDuMAbhRTfITRBaUn', NULL, NULL, 'caqpMQ9XQSWshLrBowN7sl:APA91bEtBd4oF0ovfNncVWmpIYQ48dWhXksKUS_Le7gCUUE27bKcFku35cdZJ0qDIrJ5mFyCTJrMg47T9qSfA6HlQ6_bnsXjNpKrRF2scb7Ksu_06vhp5LyXlT4BcXNuUOxKi11ssasK', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallets`
--

CREATE TABLE `seller_wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `total_earning` double NOT NULL DEFAULT '0',
  `withdrawn` double NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_given` double(8,2) NOT NULL DEFAULT '0.00',
  `pending_withdraw` double(8,2) NOT NULL DEFAULT '0.00',
  `delivery_charge_earned` double(8,2) NOT NULL DEFAULT '0.00',
  `collected_cash` double(8,2) NOT NULL DEFAULT '0.00',
  `total_tax_collected` double(8,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seller_wallets`
--

INSERT INTO `seller_wallets` (`id`, `seller_id`, `total_earning`, `withdrawn`, `created_at`, `updated_at`, `commission_given`, `pending_withdraw`, `delivery_charge_earned`, `collected_cash`, `total_tax_collected`) VALUES
(1, 1, 0, 0, '2022-10-09 12:52:25', '2022-10-09 12:52:25', 0.00, 0.00, 0.00, 0.00, 0.00),
(2, 2, 0, 0, '2022-10-09 15:48:23', '2022-10-09 15:48:23', 0.00, 0.00, 0.00, 0.00, 0.00),
(3, 3, 0, 0, '2022-10-25 17:50:06', '2022-10-25 17:50:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(4, 4, 0, 0, '2022-11-14 21:59:13', '2022-11-14 21:59:13', 0.00, 0.00, 0.00, 0.00, 0.00),
(5, 5, 0, 0, '2022-11-16 06:22:59', '2022-11-16 06:22:59', 0.00, 0.00, 0.00, 0.00, 0.00),
(6, 6, 0, 0, '2022-11-16 06:27:28', '2022-11-16 06:27:28', 0.00, 0.00, 0.00, 0.00, 0.00),
(7, 11, 0, 0, '2022-11-19 18:39:02', '2022-11-19 18:39:02', 0.00, 0.00, 0.00, 0.00, 0.00),
(8, 14, 0, 0, '2022-11-19 18:49:05', '2022-11-19 18:49:05', 0.00, 0.00, 0.00, 0.00, 0.00),
(9, 16, 0, 0, '2022-11-19 19:01:41', '2022-11-19 19:01:41', 0.00, 0.00, 0.00, 0.00, 0.00),
(10, 17, 0, 0, '2022-11-24 17:45:32', '2022-11-24 17:45:32', 0.00, 0.00, 0.00, 0.00, 0.00),
(11, 18, 0, 0, '2022-11-25 06:14:54', '2022-11-25 06:14:54', 0.00, 0.00, 0.00, 0.00, 0.00),
(12, 19, 0, 0, '2022-11-30 19:47:04', '2022-11-30 19:47:04', 0.00, 0.00, 0.00, 0.00, 0.00),
(13, 20, 0, 0, '2022-12-01 06:46:26', '2022-12-01 06:46:26', 0.00, 0.00, 0.00, 0.00, 0.00),
(14, 21, 0, 0, '2022-12-01 16:21:06', '2022-12-01 16:21:06', 0.00, 0.00, 0.00, 0.00, 0.00),
(15, 22, 0, 0, '2022-12-02 09:10:13', '2022-12-02 09:10:13', 0.00, 0.00, 0.00, 0.00, 0.00),
(16, 23, 0, 0, '2022-12-02 09:57:38', '2022-12-02 09:57:38', 0.00, 0.00, 0.00, 0.00, 0.00),
(17, 24, 0, 0, '2022-12-02 10:52:53', '2022-12-02 10:52:53', 0.00, 0.00, 0.00, 0.00, 0.00),
(18, 28, 0, 0, '2022-12-02 11:27:45', '2022-12-02 11:27:45', 0.00, 0.00, 0.00, 0.00, 0.00),
(19, 29, 0, 0, '2022-12-02 12:00:42', '2022-12-02 12:00:42', 0.00, 0.00, 0.00, 0.00, 0.00),
(20, 30, 0, 0, '2022-12-02 12:11:15', '2022-12-02 12:11:15', 0.00, 0.00, 0.00, 0.00, 0.00),
(21, 32, 0, 0, '2022-12-03 19:41:37', '2022-12-03 19:41:37', 0.00, 0.00, 0.00, 0.00, 0.00),
(22, 33, 0, 0, '2022-12-04 12:47:43', '2022-12-04 12:47:43', 0.00, 0.00, 0.00, 0.00, 0.00),
(23, 34, 0, 0, '2022-12-08 09:49:39', '2022-12-08 09:49:39', 0.00, 0.00, 0.00, 0.00, 0.00),
(24, 35, 0, 0, '2022-12-08 20:04:31', '2022-12-08 20:04:31', 0.00, 0.00, 0.00, 0.00, 0.00),
(25, 36, 0, 0, '2022-12-08 20:53:45', '2022-12-08 20:53:45', 0.00, 0.00, 0.00, 0.00, 0.00),
(26, 37, 0, 0, '2022-12-09 06:22:12', '2022-12-09 06:22:12', 0.00, 0.00, 0.00, 0.00, 0.00),
(27, 38, 0, 0, '2022-12-09 11:46:09', '2022-12-09 11:46:09', 0.00, 0.00, 0.00, 0.00, 0.00),
(28, 39, 0, 0, '2022-12-09 20:34:19', '2022-12-09 20:34:19', 0.00, 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `seller_wallet_histories`
--

CREATE TABLE `seller_wallet_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `payment` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'received',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint NOT NULL,
  `added_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_ids` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumbnail` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint NOT NULL,
  `meta_title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_status` tinyint NOT NULL,
  `emp_id` bigint NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `added_by`, `user_id`, `name`, `slug`, `category_ids`, `images`, `thumbnail`, `status`, `meta_title`, `meta_description`, `meta_image`, `code`, `phone`, `price`, `details`, `request_status`, `emp_id`, `updated_at`, `created_at`) VALUES
(3, '0', 1, 'Sigourney Moses', 'sigourney-moses-6LJ14s', '[{\"id\":\"3\",\"position\":1}]', '[\"2022-11-08-636a03aa900b2.png\"]', '2022-11-08-636a03aa92ff9.png', 0, 'Culpa velit volupta', 'Quod dolore quas acc', '2022-11-08-636a03aa93bd6.png', '343345678', '11', '', '<p>zsxdcfvgbhn</p>', 1, 0, '2022-11-08 06:22:18', '2022-11-08 06:22:18'),
(4, '0', 1, 'Chava Mendoza', 'chava-mendoza-xEzyuZ', '[{\"id\":\"16\",\"position\":1}]', '[\"2022-11-08-636a03e74114e.png\"]', '2022-11-08-636a03e74232b.png', 0, 'Quo pariatur Et eni', 'Voluptas adipisicing', '2022-11-08-636a03e7426d5.png', '44745678', '48', '', '<p>azsxfgjnm</p>', 1, 0, '2022-11-08 06:23:19', '2022-11-08 06:23:19'),
(5, '0', 1, 'Janna Finch', 'janna-finch-bIIQHW', '[{\"id\":\"20\",\"position\":1}]', '[\"2022-11-08-636a042005ff0.png\"]', '2022-11-08-636a042006d9c.png', 0, 'Est illum qui nemo', 'Impedit lorem dolor', '2022-11-08-636a04200797a.png', '9501345', '82', '', '<p>azsxfgjnmszdxfgh</p>', 1, 0, '2022-11-08 06:24:16', '2022-11-08 06:24:16'),
(6, '0', 1, 'Mia Sims', 'mia-sims-yJW1QJ', '[{\"id\":\"21\",\"position\":1}]', '[\"2022-11-08-636a0517ab772.png\"]', '2022-11-08-636a0517ac21a.png', 0, 'Sequi aute corrupti', 'In eos aut et quisqu', '2022-11-08-636a0517aca07.png', '1543456789', '76', '', '<p>things</p>', 1, 0, '2022-11-08 06:28:23', '2022-11-08 06:28:23'),
(7, '0', 1, 'Mia Sims', 'mia-sims-gq9tNP', '[{\"id\":\"21\",\"position\":1}]', '[\"2022-11-08-636a05226db9e.png\"]', '2022-11-08-636a05226e9a0.png', 0, 'Sequi aute corrupti', 'In eos aut et quisqu', '2022-11-08-636a05226f198.png', '1543456789', '76', '', '<p>things</p>', 1, 0, '2022-11-08 06:28:34', '2022-11-08 06:28:34'),
(8, '0', 1, 'Mia Sims', 'mia-sims-b5qz9g', '[{\"id\":\"21\",\"position\":1}]', '[\"2022-11-08-636a052846518.png\"]', '2022-11-08-636a0528478f9.png', 0, 'Sequi aute corrupti', 'In eos aut et quisqu', '2022-11-08-636a0528480f1.png', '1543456789', '76', '', '<p>things</p>', 1, 0, '2022-11-08 06:28:40', '2022-11-08 06:28:40'),
(9, '0', 1, 'Courtney Cote', 'courtney-cote-YDL1ds', '[{\"id\":\"21\",\"position\":1}]', '[\"2022-11-08-636a072478ed0.png\"]', '2022-11-08-636a07247b506.png', 0, 'Enim assumenda harum', 'Eligendi voluptatem', '2022-11-08-636a07247c0e4.png', '143345678', '80', '', '<p>awsedfgj</p>', 1, 0, '2022-11-08 06:37:08', '2022-11-08 06:37:08'),
(10, 'seller', 4, 'test', 'test-fHwMsQ', '[{\"id\":\"3\",\"position\":1}]', '[\"2022-11-19-637896dbc79b7.png\"]', '2022-11-19-637896dbe38e5.png', 0, 'food', 'sredtfghjn', '2022-11-19-637896dbe5473.png', '34567567', '', '', '<p>good</p>', 0, 0, '2022-11-20 12:02:42', '2022-11-19 07:42:03'),
(11, 'admin', 1, 'Lee Ferrell', 'lee-ferrell-NqtRZi', '[{\"id\":\"43\",\"position\":1}]', '[\"2022-11-21-637be51f394df.png\"]', '2022-11-21-637be51f547ea.png', 0, 'Repellendus Elit a', 'Fuga Rerum culpa ut', '2022-11-21-637be51f553c5.png', '471345677', '9745678.05', '', '<p>good</p>', 1, 0, '2022-11-21 19:52:47', '2022-11-21 19:52:47'),
(12, 'admin', 1, 'Lee Ferrell', 'lee-ferrell-UTjmpA', '[{\"id\":\"43\",\"position\":1}]', '[\"2022-11-21-637be56d7e58a.png\"]', '2022-11-21-637be56d7ff3b.png', 0, 'Repellendus Elit a', 'Fuga Rerum culpa ut', '2022-11-21-637be56d80ef0.png', '471345677', '9745678.05', '', '<p>good</p>', 1, 0, '2022-11-21 19:54:05', '2022-11-21 19:54:05'),
(13, 'admin', 1, 'Blair Bender', 'blair-bender-DuS3IP', '[{\"id\":\"48\",\"position\":1}]', '[\"2022-11-23-637e6364ad340.png\"]', '2022-11-23-637e6364af8b1.png', 0, 'At sit consectetur', 'Aliqua Placeat off', '2022-11-23-637e6364b08a5.png', '40534567', '19', '', '<p>good</p>', 1, 0, '2022-11-23 17:16:04', '2022-11-23 17:16:04'),
(14, 'admin', 1, 'Dennis Mosley', 'dennis-mosley-T8k1Jm', '[{\"id\":\"48\",\"position\":1}]', '[\"2022-11-23-637e64116004c.png\"]', '2022-11-23-637e641161316.png', 0, 'Corporis eos qui ve', 'Lorem numquam ut ips', '2022-11-23-637e641161eee.png', '89845656', '64', '', '<p>drftgy</p>', 1, 0, '2022-11-23 17:18:57', '2022-11-23 17:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `service_orders`
--

CREATE TABLE `service_orders` (
  `id` bigint NOT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` bigint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_person_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'home',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `state` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_billing` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`id`, `customer_id`, `contact_person_name`, `address_type`, `address`, `city`, `zip`, `phone`, `created_at`, `updated_at`, `state`, `country`, `latitude`, `longitude`, `is_billing`) VALUES
(1, '10', 'Roanna Morin', 'home', 'Lorem repellendus O', 'Laborum Vel exceptu', '54866', '+1 (872) 568-6996', '2022-10-27 17:49:26', '2022-10-27 17:49:26', NULL, NULL, '', '', 0),
(2, '0', 'Jael Keller', 'home', 'Sit quis error omnis', 'Cum reprehenderit il', '79144', '+1 (441) 617-3612', '2022-10-27 17:49:26', '2022-10-27 17:49:26', NULL, NULL, '', '', 1),
(3, '10', 'Ruth Weeks', 'others', 'Qui ducimus occaeca', 'Reiciendis eos enim ', '84942', '+1 (287) 594-7849', '2022-10-27 17:50:02', '2022-10-27 17:50:02', NULL, NULL, '', '', 1),
(4, '16', 'ahmed eid', 'permanent', 'zone 28', 'Sadat City', '04555', '+201005084569', '2022-12-10 13:10:55', '2022-12-10 13:10:55', NULL, NULL, '7.420990718223729', '-6.189873842040765', 0),
(5, '16', 'ahmed eid', 'permanent', 'zone 28', 'Sadat City', '04555', '+201005084569', '2022-12-10 13:13:14', '2022-12-10 13:13:14', NULL, NULL, '7.420990718223729', '-6.189873842040765', 0),
(6, '16', 'ahmed eid', 'permanent', 'zone 28', 'Sadat City', '04555', '+201005084569', '2022-12-10 13:14:14', '2022-12-10 13:14:14', NULL, NULL, '7.420990718223729', '-6.189873842040765', 0),
(7, '0', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:33:05', '2022-12-14 15:33:05', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(8, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:33:19', '2022-12-14 15:33:19', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(9, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:33:32', '2022-12-14 15:33:32', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(10, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:34:34', '2022-12-14 15:34:34', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(11, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:36:38', '2022-12-14 15:36:38', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(12, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:38:00', '2022-12-14 15:38:00', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(13, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:39:44', '2022-12-14 15:39:44', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(14, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:42:38', '2022-12-14 15:42:38', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(15, '19', 'test', 'permanent', 'test', 'test', '33453', '0200000000', '2022-12-14 15:45:16', '2022-12-14 15:45:16', NULL, NULL, '7.1303809720770275', '-5.574639467040765', 0),
(16, '0', 'ahmad alhameed', 'permanent', 'yopougon', 'abidjan', '225', '0757496206', '2022-12-15 06:19:18', '2022-12-15 06:19:18', NULL, NULL, '7.288423257767905', '-4.564688531200158', 0),
(17, '19', 'ahmed eid', 'permanent', 'New Nubaria City\r\nAly Ibn Abo Tablab Street', 'New Nubaria City', '04555', '+201005084569', '2022-12-15 20:22:47', '2022-12-15 20:22:47', NULL, NULL, '7.362884148914566', '-5.574639467040765', 0);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_cats`
--

CREATE TABLE `shipping_cats` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `type` tinyint NOT NULL COMMENT '1->amount  2->percent',
  `amount` decimal(10,2) NOT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_cats`
--

INSERT INTO `shipping_cats` (`id`, `title`, `type`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'heavey', 2, '20.00', 2022, 2022),
(2, 'lite', 1, '15.00', 2022, 2022),
(3, 'so heavy', 2, '30.00', 2022, 2022),
(4, 'so lite', 1, '5.00', 2022, 2022);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_methods`
--

CREATE TABLE `shipping_methods` (
  `id` bigint UNSIGNED NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost` decimal(8,2) NOT NULL DEFAULT '0.00',
  `duration` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_methods`
--

INSERT INTO `shipping_methods` (`id`, `creator_id`, `creator_type`, `title`, `cost`, `duration`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 'admin', 'Test', '2000.00', '2 Day', 1, '2022-11-25 19:39:57', '2022-11-25 19:39:57'),
(9, 1, 'admin', 'Everest Express', '1500.00', '4', 1, '2022-11-25 19:38:34', '2022-11-25 19:38:34'),
(10, 4, 'seller', 'Elmekawey', '25.00', '2Day', 1, '2022-11-25 20:03:17', '2022-11-25 20:03:17'),
(11, 37, 'seller', 'test', '10.00', '10', 1, '2022-12-10 19:53:00', '2022-12-10 19:53:00');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_types`
--

CREATE TABLE `shipping_types` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint UNSIGNED DEFAULT NULL,
  `shipping_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_types`
--

INSERT INTO `shipping_types` (`id`, `seller_id`, `shipping_type`, `created_at`, `updated_at`) VALUES
(1, 4, 'order_wise', '2022-11-25 11:48:34', '2022-11-26 20:34:35'),
(2, 0, 'order_wise', '2022-11-25 19:47:00', '2022-11-25 19:47:29'),
(3, 5, 'order_wise', '2022-11-26 09:13:39', '2022-11-27 09:13:17'),
(4, 32, 'category_wise', '2022-12-10 08:34:41', '2022-12-10 08:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

CREATE TABLE `shops` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `banner` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscription` bigint NOT NULL,
  `latitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `whats_up` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shops`
--

INSERT INTO `shops` (`id`, `seller_id`, `name`, `address`, `contact`, `image`, `created_at`, `updated_at`, `banner`, `subscription`, `latitude`, `longitude`, `zone_id`, `whats_up`) VALUES
(1, 1, 'Desiree Patton', 'Laborum voluptate ne', '70', '2022-10-09-6342e0293d841.png', '2022-10-09 12:52:25', '2022-10-09 12:52:25', '2022-10-09-6342e0293dd6d.png', 6, '7.884808516237749', '-5.623314855138528', 4, ''),
(2, 2, 'shop', 'Rue De La Paix\r\nT66', '0757496206', '2022-10-09-6343318433ebf.png', '2022-10-09 15:48:23', '2022-10-09 18:39:32', 'def.png', 3, '5.3016381468686795', '-3.9857624008843717', 5, ''),
(3, 3, 'Noha Elsayed', 'no', '01027655889', '2022-10-25-63583dee091e3.png', '2022-10-25 17:50:06', '2022-10-25 17:50:06', '2022-10-25-63583dee0d8ce.png', 8, '5.411280932131692', '-4.120950809317292', 5, '13456789066'),
(4, 4, 'Twisty', 'faissal\r\nfaissal', '01148285012', '2022-11-26-638285f7e9526.png', '2022-11-14 21:59:13', '2022-11-26 20:32:39', '2022-11-26-638285f7f091b.png', 8, '6.353364964867043', '-3.4785387194554684', 4, '01148285012'),
(5, 5, 'Ahmad Alhameed', 'Rue De La Paix\r\nT66', '2550756496206', '2022-11-16-63748fd29f3e7.png', '2022-11-16 06:22:59', '2022-11-16 06:22:59', '2022-11-16-63748fd2e6c49.png', 8, '5.302033622900108', '-3.9828679867063976', 5, 'aaaaaa'),
(6, 6, 'Yamalesham', 'Abidjan', '2250554619065', '2022-11-16-637490e0326b2.png', '2022-11-16 06:27:28', '2022-11-16 06:27:28', '2022-11-16-637490e036b68.png', 8, '5.29871910621797', '-3.9792220440679804', 5, '2250554619065'),
(7, 11, 'shop', 'street', '1234556677', 'def.png', '2022-11-19 18:39:02', '2022-11-19 18:39:02', 'def.png', 8, '23.7529349264905', '90.37239452762628', 4, '0103456778'),
(8, 14, 'shop', 'street', '1234556677', 'def.png', '2022-11-19 18:49:05', '2022-11-19 18:49:05', 'def.png', 8, NULL, NULL, NULL, '0103456778'),
(9, 16, 'kk', 'kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk', '67567765', '2022-11-19-63793623a0859.png', '2022-11-19 19:01:41', '2022-11-19 19:01:41', '2022-11-19-63793625c3aa3.png', 8, NULL, NULL, NULL, '67567765'),
(10, 17, 'Thor Solis', 'Voluptatum quasi ut', '+1 (855) 818-6418', '2022-11-24-637fbbcce9809.png', '2022-11-24 17:45:32', '2022-11-24 17:45:32', '2022-11-24-637fbbccea230.png', 8, '5.324644495465604', '-4.061899295645417', 5, 'Sit hic voluptatem'),
(11, 18, 'Ahmad Alhameed', 'Rue De La Paix\r\nT66', '0757496206', '2022-11-25-63806b6e8b96e.png', '2022-11-25 06:14:54', '2022-11-25 06:14:54', '2022-11-25-63806b6e96a86.png', 8, '7.202869211423206', '-6.890892302135693', 4, '123646644'),
(12, 19, 'Elmekawy', 'فيصل', '01148285012', '2022-11-30-6387c14809afe.png', '2022-11-30 19:47:04', '2022-11-30 19:47:04', '2022-11-30-6387c1480a456.png', 8, '7.315325799343927', '-5.587913719455468', 4, '01148285012'),
(13, 20, 'shop', 'htrh', '0757496206', '2022-12-01-63885bd2a5a13.png', '2022-12-01 06:46:26', '2022-12-01 06:46:26', '2022-12-01-63885bd2bc453.png', 8, '5.348820776785002', '-4.032510876292945', 5, '0256498789'),
(14, 21, 'Eslam Shaban Elmekawey', 'faissal\r\nfaissal', '01148285012', '2022-12-01-6388e2824f7d0.png', '2022-12-01 16:21:06', '2022-12-01 16:21:06', '2022-12-01-6388e2825b178.png', 8, '7.772756331400866', '-5.631859031955468', 4, '01148285012'),
(15, 22, 'Eslam Shaban Elmekawey', 'الدقي', '01148285012', '2022-12-02-6389cf05a9ec2.png', '2022-12-02 09:10:13', '2022-12-02 09:10:13', '2022-12-02-6389cf05b56e9.png', 8, '8.403621546356298', '-4.862816063205468', 4, '01148285012'),
(16, 23, 'Sharon Bray', 'Assumenda ut irure c', '+1 (903) 891-1067', '2022-12-02-6389da22c621d.png', '2022-12-02 09:57:38', '2022-12-02 09:57:38', '2022-12-02-6389da22c67eb.png', 8, '7.0537243742618605', '-5.609886375705468', 4, 'At ut aut exercitati'),
(17, 24, 'Elmekawy', 'faissal\r\nfaissal', '01148285012', '2022-12-02-6389e7151b4bd.png', '2022-12-02 10:52:53', '2022-12-02 10:52:53', '2022-12-02-6389e715261dd.png', 8, '8.055679892910405', '-5.368187156955468', 4, '01148285012'),
(18, 29, 'abdo Elmekawey', 'souhag', '01148285012', '2022-12-02-6389f6fabed28.png', '2022-12-02 12:00:42', '2022-12-02 12:00:42', '2022-12-02-6389f6fac0259.png', 8, '7.772756331400866', '-5.587913719455468', 4, '01148285012'),
(19, 32, 'Twisty bee', '24 rue louis figuier', '00970595188418', '2022-12-03-638bb4811c24c.png', '2022-12-03 19:41:37', '2022-12-03 19:41:37', '2022-12-03-638bb48120fcb.png', 8, '5.403510730724608', '-4.103922009105445', 5, '00970595188418'),
(20, 33, 'test shop', 'test shop', '01065853677', '2022-12-04-638ca4ff7f756.png', '2022-12-04 12:47:43', '2022-12-04 12:47:43', '2022-12-04-638ca4ff9c887.png', 8, '5.403946530208617', '-4.232187381582917', 5, '01065895266'),
(21, 34, 'Amr', 'Amr', '00201017127818', '2022-12-08-6391c143dd564.png', '2022-12-08 09:49:39', '2022-12-08 09:49:39', '2022-12-08-6391c143e0244.png', 8, '8.343637240396165', '-5.352806364635693', 4, '00201017127818'),
(22, 35, 'shop 1', 'sadat', '201005084569', 'def.png', '2022-12-08 20:04:31', '2022-12-08 20:04:31', 'def.png', 8, '5.487723658465598', '-3.9964391464466464', 5, '201005084569'),
(23, 36, 'Berk Hayes', 'Voluptas ut quis exc', '+1 (931) 378-6748', '2022-12-08-63925ce931267.png', '2022-12-08 20:53:45', '2022-12-08 20:53:45', '2022-12-08-63925ce931cef.png', 8, '8.097064855928256', '-5.994407860080468', 4, 'Dolores veritatis po'),
(24, 37, 'Everest-Saller', 'Everest-Saller', '0757496206', '2022-12-09-6392e224207df.png', '2022-12-09 06:22:12', '2022-12-09 06:22:12', '2022-12-09-6392e22420b68.png', 8, '5.304840866838224', '-3.9849916538081698', 5, '0256498789');

-- --------------------------------------------------------

--
-- Table structure for table `social_medias`
--

CREATE TABLE `social_medias` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_medias`
--

INSERT INTO `social_medias` (`id`, `name`, `link`, `icon`, `active_status`, `status`, `created_at`, `updated_at`) VALUES
(1, 'twitter', 'https://twitter.com/EverestCi', 'fa fa-twitter', 1, 1, '2020-12-31 21:18:03', '2022-11-10 13:02:55'),
(2, 'linkedin', 'https://www.linkedin.com/in/everestci/', 'fa fa-linkedin', 1, 1, '2021-02-27 16:23:01', '2022-11-10 13:03:51'),
(3, 'google-plus', 'help@everest-ci.com', 'fa fa-google-plus-square', 1, 1, '2021-02-27 16:23:30', '2022-11-10 13:04:54'),
(4, 'pinterest', 'https://www.pinterest.com/everestci/', 'fa fa-pinterest', 1, 1, '2021-02-27 16:24:14', '2022-11-10 13:21:26'),
(5, 'instagram', 'https://www.instagram.com/everest.ci/', 'fa fa-instagram', 1, 1, '2021-02-27 16:24:36', '2022-11-10 14:09:36'),
(6, 'facebook', 'https://www.facebook.com/profile.php?id=100086751285599', 'fa fa-facebook', 1, 1, '2021-02-27 19:19:42', '2022-11-07 01:24:15');

-- --------------------------------------------------------

--
-- Table structure for table `soft_credentials`
--

CREATE TABLE `soft_credentials` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint UNSIGNED NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'maiko194d6e8473@outlook.com', '2022-10-05 12:03:27', '2022-10-05 12:03:27'),
(2, 'vladimirsam5ld@outlook.com', '2022-10-17 11:15:39', '2022-10-17 11:15:39'),
(3, 'alekseykbko@outlook.com', '2022-10-20 00:50:45', '2022-10-20 00:50:45'),
(4, 'vitaliyvo2m@outlook.com', '2022-10-20 17:11:58', '2022-10-20 17:11:58'),
(5, 'artur5glvkn@outlook.com', '2022-10-26 14:43:34', '2022-10-26 14:43:34'),
(6, 'laurelbsyqkim@hotmail.com', '2022-10-31 18:47:25', '2022-10-31 18:47:25'),
(7, 'sicvegutig@outlook.com', '2022-11-09 05:19:54', '2022-11-09 05:19:54'),
(8, 'torsasuhad@outlook.com', '2022-11-11 22:40:28', '2022-11-11 22:40:28'),
(9, 'qihzujesix@outlook.com', '2022-11-17 23:17:35', '2022-11-17 23:17:35'),
(10, 'rebricocap@outlook.com', '2022-12-03 13:15:27', '2022-12-03 13:15:27'),
(11, 'yujmegipik@outlook.com', '2022-12-20 20:42:53', '2022-12-20 20:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `subscription_sellers`
--

CREATE TABLE `subscription_sellers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscription_sellers`
--

INSERT INTO `subscription_sellers` (`id`, `name`, `value`, `time`, `created_at`, `updated_at`) VALUES
(8, 'GRATUITEMENT', '0', '2', '2022-10-25 16:35:12', '2022-12-04 16:18:21');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint DEFAULT NULL,
  `subject` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_ticket_convs`
--

CREATE TABLE `support_ticket_convs` (
  `id` bigint UNSIGNED NOT NULL,
  `support_ticket_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `customer_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_message` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traffic`
--

CREATE TABLE `traffic` (
  `id` bigint UNSIGNED NOT NULL,
  `ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `traffic`
--

INSERT INTO `traffic` (`id`, `ip`, `created_at`, `updated_at`) VALUES
(1, '102.45.119.21', '2022-12-22 14:32:48', '2022-12-22 13:32:48'),
(2, '36.40.72.66', '2022-12-22 14:51:32', '2022-12-22 13:51:32'),
(3, '54.36.149.93', '2022-12-22 15:02:14', '2022-12-22 14:02:14'),
(4, '69.171.231.118', '2022-12-22 15:15:50', '2022-12-22 14:15:50'),
(5, '54.36.148.185', '2022-12-22 15:19:10', '2022-12-22 14:19:10'),
(6, '54.36.148.33', '2022-12-22 15:55:51', '2022-12-22 14:55:51'),
(7, '205.185.116.25', '2022-12-22 16:00:33', '2022-12-22 15:00:33'),
(8, '209.141.35.128', '2022-12-22 16:00:35', '2022-12-22 15:00:35'),
(9, '54.36.148.103', '2022-12-22 16:07:58', '2022-12-22 15:07:58'),
(10, '54.36.148.202', '2022-12-22 16:36:20', '2022-12-22 15:36:20'),
(11, '54.36.148.255', '2022-12-22 16:37:58', '2022-12-22 15:37:58'),
(12, '54.36.149.82', '2022-12-22 16:44:46', '2022-12-22 15:44:46'),
(13, '54.36.148.203', '2022-12-22 17:04:15', '2022-12-22 16:04:15'),
(14, '93.159.230.89', '2022-12-22 17:25:46', '2022-12-22 16:25:46'),
(15, '157.55.39.176', '2022-12-22 18:07:05', '2022-12-22 17:07:05'),
(16, '54.36.149.10', '2022-12-22 18:27:50', '2022-12-22 17:27:50'),
(17, '::1', '2022-12-24 08:55:49', '2022-12-24 08:55:49');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `payment_for` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_id` bigint DEFAULT NULL,
  `payment_receiver_id` bigint DEFAULT NULL,
  `paid_by` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_to` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `amount` double(8,2) NOT NULL DEFAULT '0.00',
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_details_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `translationable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `translationable_id` bigint UNSIGNED NOT NULL,
  `locale` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`translationable_type`, `translationable_id`, `locale`, `key`, `value`, `id`) VALUES
('App\\Model\\Attribute', 1, 'eg', 'name', 'القياس', 41),
('App\\Model\\Attribute', 1, 'fr', 'name', 'Taille', 42),
('App\\Model\\Brand', 1, 'eg', 'name', 'Nike', 43),
('App\\Model\\Brand', 1, 'fr', 'name', 'Nike', 44),
('App\\Model\\Brand', 2, 'eg', 'name', 'Adidass', 45),
('App\\Model\\Brand', 2, 'fr', 'name', 'Adidass', 46),
('App\\Model\\Brand', 3, 'eg', 'name', 'Zara', 47),
('App\\Model\\Brand', 3, 'fr', 'name', 'Zara', 48),
('App\\Model\\Attribute', 2, 'eg', 'name', 'الوزن', 49),
('App\\Model\\Attribute', 2, 'fr', 'name', 'Poids', 50),
('App\\Model\\Attribute', 3, 'eg', 'name', 'الطول', 51),
('App\\Model\\Attribute', 3, 'fr', 'name', 'Longueur', 52),
('App\\Model\\Attribute', 4, 'eg', 'name', 'العرض', 53),
('App\\Model\\Attribute', 4, 'fr', 'name', 'Largeur', 54),
('App\\Model\\Attribute', 5, 'eg', 'name', 'القطر', 55),
('App\\Model\\Attribute', 5, 'fr', 'name', 'Diamètre', 56),
('App\\Model\\Attribute', 6, 'eg', 'name', 'الأبعاد', 57),
('App\\Model\\Attribute', 6, 'fr', 'name', 'Dimensions', 58),
('App\\Model\\Attribute', 7, 'eg', 'name', 'العمق', 59),
('App\\Model\\Attribute', 7, 'fr', 'name', 'Profondeur', 60),
('App\\Model\\Product', 1, 'eg', 'name', 'asaas', 61),
('App\\Model\\Product', 1, 'eg', 'description', '<p>dfghkjl;</p>', 62),
('App\\Model\\Product', 1, 'fr', 'name', 'sssss', 63),
('App\\Model\\Product', 1, 'fr', 'description', '<p>vjhbknlm,./</p>', 64),
('App\\Model\\Brand', 4, 'eg', 'name', 'سوري', 76),
('App\\Model\\Brand', 5, 'eg', 'name', 'مصري', 77),
('App\\Model\\Attribute', 8, 'eg', 'name', 'قطعة', 78),
('App\\Model\\Product', 2, 'eg', 'name', 'شاورما', 79),
('App\\Model\\Product', 2, 'fr', 'name', 'Shawarma', 80),
('App\\Model\\Product', 2, 'fr', 'description', '<p>Shawarma</p>', 81),
('App\\Model\\Product', 3, 'eg', 'name', 'كفتة صوري', 82),
('App\\Model\\Product', 3, 'eg', 'description', '<p>kofta soury</p>', 83),
('App\\Model\\Product', 3, 'fr', 'name', 'كفتة صوري', 84),
('App\\Model\\Product', 3, 'fr', 'description', '<p>kofta soury</p>', 85),
('App\\Model\\Product', 4, 'eg', 'name', 'سندوتشات السوري', 86),
('App\\Model\\Product', 4, 'eg', 'description', '<pre>\r\nSyrian sandwiches</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 87),
('App\\Model\\Product', 4, 'fr', 'name', 'Syrian sandwiches', 88),
('App\\Model\\Product', 4, 'fr', 'description', '<pre>\r\nSyrian sandwiches</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 89),
('App\\Model\\Product', 5, 'eg', 'name', 'الفراخ السوري', 90),
('App\\Model\\Product', 5, 'eg', 'description', '<pre>\r\nSyrian chicken</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 91),
('App\\Model\\Product', 5, 'fr', 'description', '<pre>\r\nSyrian chicken</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 92),
('App\\Model\\Product', 6, 'eg', 'name', 'عرض المائدة السوري', 93),
('App\\Model\\Product', 6, 'eg', 'description', '<p>عرض المائدة السوري&nbsp;</p>', 94),
('App\\Model\\Product', 6, 'fr', 'name', 'Syrian table show', 95),
('App\\Model\\Product', 6, 'fr', 'description', '<p>Syrian table show</p>', 96),
('App\\Model\\Product', 7, 'eg', 'name', 'عرض مطعم كرم الشام السوري الوحش', 97),
('App\\Model\\Product', 7, 'eg', 'description', '<p>عرض مطعم كرم الشام السوري الوحش&nbsp;</p>', 98),
('App\\Model\\Product', 7, 'fr', 'name', 'Karam Al-Sham, the Syrian restaurant, the beas', 99),
('App\\Model\\Product', 7, 'fr', 'description', '<pre>\r\nKaram Al-Sham, the Syrian restaurant, the beas</pre>', 100),
('App\\Model\\Product', 8, 'eg', 'name', 'عرض مطعم كرم الشام السوري فتة شاورما', 101),
('App\\Model\\Product', 8, 'eg', 'description', '<p>عرض مطعم كرم الشام السوري فتة شاورما &nbsp;</p>', 102),
('App\\Model\\Product', 8, 'fr', 'name', 'Karam Al Sham Syrian Restaurant offer Shawarma Fatteh', 103),
('App\\Model\\Product', 8, 'fr', 'description', '<pre>\r\nKaram Al Sham Syrian Restaurant offer Shawarma Fatteh</pre>', 104),
('App\\Model\\Product', 9, 'eg', 'name', 'وجبة كرم الشام', 105),
('App\\Model\\Product', 9, 'eg', 'description', '<p>وجبة كرم الشام&nbsp;</p>', 106),
('App\\Model\\Product', 9, 'fr', 'name', 'Karam Al Sham Meal', 107),
('App\\Model\\Product', 9, 'fr', 'description', '<pre>\r\nKaram Al Sham Meal</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 108),
('App\\Model\\Product', 10, 'eg', 'name', 'سندوتش ابو عمار السوري', 109),
('App\\Model\\Product', 10, 'eg', 'description', '<p>سندوتش ابو عمار السوري&nbsp;</p>', 110),
('App\\Model\\Product', 10, 'fr', 'name', 'Abu Ammar Syrian sandwich', 111),
('App\\Model\\Product', 10, 'fr', 'description', '<pre>\r\nAbu Ammar Syrian sandwich</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 112),
('App\\Model\\Product', 11, 'eg', 'name', 'جمبري النيل', 113),
('App\\Model\\Product', 11, 'eg', 'description', '<p>جمبري النيل&nbsp;</p>', 114),
('App\\Model\\Product', 11, 'fr', 'name', 'Nile shrimp', 115),
('App\\Model\\Product', 11, 'fr', 'description', '<pre>\r\nNile shrimp</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 116),
('App\\Model\\Product', 12, 'eg', 'name', 'سمك النيل للطاقة', 117),
('App\\Model\\Product', 12, 'eg', 'description', '<p>سمك النيل للطاقة&nbsp;</p>', 118),
('App\\Model\\Product', 12, 'fr', 'name', 'Nile fish for energy', 119),
('App\\Model\\Product', 12, 'fr', 'description', '<pre>\r\nNile fish for energy</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 120),
('App\\Model\\Product', 13, 'eg', 'name', 'شربة السي فود', 121),
('App\\Model\\Product', 13, 'eg', 'description', '<p>شربة السي فود&nbsp;</p>', 122),
('App\\Model\\Product', 13, 'fr', 'name', 'Seafood soup', 123),
('App\\Model\\Product', 13, 'fr', 'description', '<pre>\r\nSeafood soup</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 124),
('App\\Model\\Product', 14, 'eg', 'name', 'نجرسكو باسيفود', 125),
('App\\Model\\Product', 14, 'eg', 'description', '<pre>\r\nSeafood soup</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 126),
('App\\Model\\Product', 14, 'fr', 'name', 'Negresco Passefood', 127),
('App\\Model\\Product', 14, 'fr', 'description', '<pre>\r\nNegresco Passefood</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 128),
('App\\Model\\Product', 15, 'eg', 'name', 'شوربة بالسمك بالكريمة', 129),
('App\\Model\\Product', 15, 'eg', 'description', '<p>شوربة بالسمك بالكريمة&nbsp;</p>', 130),
('App\\Model\\Product', 15, 'fr', 'name', 'Creamy fish soup', 131),
('App\\Model\\Product', 16, 'eg', 'name', 'طبق سمك بالطاقة', 132),
('App\\Model\\Product', 16, 'eg', 'description', '<p>طبق سمك بالطاقة&nbsp;</p>', 133),
('App\\Model\\Product', 16, 'fr', 'name', 'Energy fish plate', 134),
('App\\Model\\Product', 16, 'fr', 'description', '<pre>\r\nEnergy fish plate</pre>\r\n\r\n<pre>\r\n\r\n&nbsp;</pre>\r\n\r\n<p><img alt=\"رمز &quot;تم التحقق منها بواسطة المنتدى&quot;\" src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAQAAAAngNWGAAAA/0lEQVR4AYXNMSiEcRyA4cfmGHQbCZIipkuxnJgMStlMNmeyD2dwmc8+sZgxYJd9ErIZFHUyYYD7fkr6l4/rnvmtl7+KitrqV/fq2Y5eLY3Z9S48eRLe7BmVZ9qhTLhQ0algzZWQOVKSsCF8OjAnwbxDTWFDUhPK/jMr1H6HE/IqRky2DyvCefuwItwZzodVoYRiLqMkVCXrwpJ9twZ+sgfDYEFYl8wIWxZ9uFf7zkallxlJh4YrLGsKjZRx7VGHhLqwgFUN45DGdb8MeXGpgB4ABZdeDcpZEY51A+hyLKz4S1W4MQWm3AibWtgWmk6dyISa1pSdyWTOlLXVp0+eL9D/ZPfBTNanAAAAAElFTkSuQmCC\" style=\"height:16px; width:16px\" /></p>', 135),
('App\\Model\\Product', 17, 'eg', 'name', 'قميص اطفالي', 136),
('App\\Model\\Product', 17, 'eg', 'description', '<p>قميص اطفالي&nbsp;</p>', 137),
('App\\Model\\Product', 17, 'fr', 'name', 'my kids shirt', 138),
('App\\Model\\Product', 17, 'fr', 'description', '<p>my kids shirt</p>', 139),
('App\\Model\\Product', 18, 'eg', 'name', 'فستان بناتي اطفالي', 140),
('App\\Model\\Product', 18, 'eg', 'description', '<p>فستان بناتي اطفالي&nbsp;</p>', 141),
('App\\Model\\Product', 18, 'fr', 'name', 'My baby girls dress', 142),
('App\\Model\\Product', 18, 'fr', 'description', '<p>My baby girls dress</p>', 143),
('App\\Model\\Product', 19, 'eg', 'name', 'ترنج اطفالي', 144),
('App\\Model\\Product', 19, 'eg', 'description', '<p>ترنج اطفالي&nbsp;</p>', 145),
('App\\Model\\Product', 19, 'fr', 'name', 'sting my kids', 146),
('App\\Model\\Product', 19, 'fr', 'description', '<p>sting my kids</p>', 147),
('App\\Model\\Product', 20, 'eg', 'name', 'بنطلون اطفالي', 148),
('App\\Model\\Product', 20, 'eg', 'description', '<p>بنطلون اطفالي&nbsp;</p>', 149),
('App\\Model\\Product', 20, 'fr', 'name', 'my kids pants', 150),
('App\\Model\\Product', 20, 'fr', 'description', '<p>my kids pants</p>', 151),
('App\\Model\\Product', 21, 'eg', 'name', 'بلطو بناتي', 152),
('App\\Model\\Product', 21, 'eg', 'description', '<p>بلطو بناتي&nbsp;</p>', 153),
('App\\Model\\Product', 21, 'fr', 'name', 'my girls\' tuxedo', 154),
('App\\Model\\Product', 21, 'fr', 'description', '<p>my girls&#39; tuxedo</p>', 155),
('App\\Model\\Product', 22, 'eg', 'name', 'بلطو بناتي', 156),
('App\\Model\\Product', 22, 'eg', 'description', '<p>بلطو بناتي&nbsp;</p>', 157),
('App\\Model\\Product', 22, 'fr', 'name', 'my girls\' tuxedo', 158),
('App\\Model\\Product', 22, 'fr', 'description', '<p>my girls&#39; tuxedo</p>', 159),
('App\\Model\\Product', 23, 'eg', 'name', 'بلطو رجالي', 160),
('App\\Model\\Product', 23, 'eg', 'description', '<p>بلطو رجالي&nbsp;</p>', 161),
('App\\Model\\Product', 23, 'fr', 'name', 'men\'s jacket', 162),
('App\\Model\\Product', 23, 'fr', 'description', '<p>men&#39;s jacket</p>', 163),
('App\\Model\\Product', 24, 'eg', 'name', 'بلطو رجالي', 164),
('App\\Model\\Product', 24, 'eg', 'description', '<p>بلطو رجالي&nbsp;</p>', 165),
('App\\Model\\Product', 24, 'fr', 'name', 'men\'s jacket', 166),
('App\\Model\\Product', 24, 'fr', 'description', '<p>men&#39;s jacket</p>', 167),
('App\\Model\\Product', 25, 'eg', 'name', 'بلطو رجالي', 168),
('App\\Model\\Product', 25, 'eg', 'description', '<p>بلطو رجالي&nbsp;</p>', 169),
('App\\Model\\Product', 25, 'fr', 'name', 'men\'s jacket', 170),
('App\\Model\\Product', 25, 'fr', 'description', '<p>men&#39;s jacket</p>', 171),
('App\\Model\\Product', 26, 'eg', 'name', 'بلطو حريمي', 172),
('App\\Model\\Product', 26, 'eg', 'description', '<p>بلطو حريمي &nbsp;</p>', 173),
('App\\Model\\Product', 26, 'fr', 'name', 'Women\'s tuxedo', 174),
('App\\Model\\Product', 26, 'fr', 'description', '<p>Women&#39;s tuxedo</p>', 175),
('App\\Model\\Product', 27, 'eg', 'name', 'طقم اطفالي', 176),
('App\\Model\\Product', 27, 'eg', 'description', '<p>طقم اطفالي&nbsp;</p>', 177),
('App\\Model\\Product', 27, 'fr', 'name', 'my kids set', 178),
('App\\Model\\Product', 27, 'fr', 'description', '<p>my kids set</p>', 179),
('App\\Model\\Product', 28, 'eg', 'name', 'ملابس  داخلية حريمي', 180),
('App\\Model\\Product', 28, 'eg', 'description', '<p>ملابس &nbsp;داخلية حريمي&nbsp;</p>', 181),
('App\\Model\\Product', 28, 'fr', 'name', 'Women\'s underwear', 182),
('App\\Model\\Product', 28, 'fr', 'description', '<p>Women&#39;s underwear</p>', 183),
('App\\Model\\Product', 29, 'eg', 'name', 'ملابس  داخلية حريمي', 184),
('App\\Model\\Product', 29, 'eg', 'description', '<p>ملابس &nbsp;داخلية حريمي&nbsp;</p>', 185),
('App\\Model\\Product', 29, 'fr', 'name', 'Women\'s underwear', 186),
('App\\Model\\Product', 29, 'fr', 'description', '<p>Women&#39;s underwear</p>', 187),
('App\\Model\\Product', 30, 'eg', 'name', 'ملابس  داخلية حريمي', 188),
('App\\Model\\Product', 30, 'eg', 'description', '<p>ملابس &nbsp;داخلية حريمي&nbsp;</p>', 189),
('App\\Model\\Product', 30, 'fr', 'name', 'Women\'s underwear', 190),
('App\\Model\\Product', 30, 'fr', 'description', '<p>Women&#39;s underwear</p>', 191),
('App\\Model\\Product', 31, 'eg', 'name', 'ملابس  داخلية رجالي', 192),
('App\\Model\\Product', 31, 'eg', 'description', '<p>ملابس &nbsp;داخلية رجالي&nbsp;</p>', 193),
('App\\Model\\Product', 31, 'fr', 'name', 'Men\'s underwear', 194),
('App\\Model\\Product', 31, 'fr', 'description', '<p>Men&#39;s underwear</p>', 195),
('App\\Model\\Product', 32, 'eg', 'name', 'ملابس  داخلية رجالي', 196),
('App\\Model\\Product', 32, 'eg', 'description', '<p>ملابس &nbsp;داخلية رجالي&nbsp;</p>', 197),
('App\\Model\\Product', 32, 'fr', 'name', 'Men\'s underwear', 198),
('App\\Model\\Product', 32, 'fr', 'description', '<p>Men&#39;s underwear</p>', 199),
('App\\Model\\Product', 33, 'eg', 'name', 'ملابس  داخلية رجالي', 200),
('App\\Model\\Product', 33, 'eg', 'description', '<p>ملابس &nbsp;داخلية رجالي&nbsp;</p>', 201),
('App\\Model\\Product', 33, 'fr', 'name', 'Men\'s underwear', 202),
('App\\Model\\Product', 33, 'fr', 'description', '<p>Men&#39;s underwear</p>', 203),
('App\\Model\\Product', 34, 'eg', 'name', 'ملابس  داخلية رجالي', 204),
('App\\Model\\Product', 34, 'eg', 'description', '<p>ملابس &nbsp;داخلية رجالي&nbsp;</p>', 205),
('App\\Model\\Product', 34, 'fr', 'name', 'Men\'s underwear', 206),
('App\\Model\\Product', 34, 'fr', 'description', '<p>Men&#39;s underwear</p>', 207),
('App\\Model\\Product', 35, 'eg', 'name', 'ميكانيكي كهربائي', 214),
('App\\Model\\Product', 35, 'eg', 'description', '<p>ميكانيكي كهربائي&nbsp;</p>', 215),
('App\\Model\\Product', 35, 'fr', 'name', 'Electro mechanic', 216),
('App\\Model\\Product', 35, 'fr', 'description', '<p>Electro mechanic</p>', 217),
('App\\Model\\Product', 36, 'eg', 'name', 'ميكانيكي كهربائي', 218),
('App\\Model\\Product', 36, 'eg', 'description', '<p>ميكانيكي كهربائي&nbsp;</p>', 219),
('App\\Model\\Product', 36, 'fr', 'name', 'Electro mechanic', 220),
('App\\Model\\Product', 36, 'fr', 'description', '<p>Electro mechanic</p>', 221),
('App\\Model\\Product', 37, 'eg', 'name', 'طباعة', 222),
('App\\Model\\Product', 37, 'eg', 'description', '<p>طباعة</p>', 223),
('App\\Model\\Product', 37, 'fr', 'name', 'Imprimer', 224),
('App\\Model\\Product', 37, 'fr', 'description', '<p>Imprimer</p>', 225),
('App\\Model\\Product', 39, 'eg', 'name', 'Nathaniel Simmons', 230),
('App\\Model\\Product', 39, 'fr', 'name', 'Marah Richards', 231),
('App\\Model\\Product', 40, 'eg', 'name', 'Nichole Rios', 232),
('App\\Model\\Product', 40, 'eg', 'description', '<p>sedrftgh</p>', 233),
('App\\Model\\Product', 40, 'fr', 'name', 'Derek Spears', 234),
('App\\Model\\Product', 40, 'fr', 'description', '<p>edrftgyhjmk</p>', 235),
('App\\Model\\Brand', 6, 'eg', 'name', 'قطونيل', 236),
('App\\Model\\Brand', 6, 'fr', 'name', 'cotonial', 237),
('App\\Model\\Advert', 0, 'eg', 'name', 'Phelan Romero', 238),
('App\\Model\\Advert', 0, 'fr', 'name', 'Aaron Guy', 239),
('App\\Model\\Service', 3, 'eg', 'name', 'TaShya Orr', 246),
('App\\Model\\Service', 3, 'eg', 'description', '<p>sxdfgvhnjmk</p>', 247),
('App\\Model\\Service', 3, 'fr', 'name', 'Phyllis Cash', 248),
('App\\Model\\Service', 3, 'fr', 'description', '<p>awsfgv</p>', 249),
('App\\Model\\Service', 4, 'eg', 'name', 'Farrah Oneil', 250),
('App\\Model\\Service', 4, 'fr', 'name', 'Sigourney Stout', 251),
('App\\Model\\Service', 5, 'eg', 'name', 'Jermaine Wallace', 252),
('App\\Model\\Service', 5, 'eg', 'description', '<p>qaeryuhzxdcf</p>', 253),
('App\\Model\\Service', 5, 'fr', 'name', 'Keefe Padilla', 254),
('App\\Model\\Service', 5, 'fr', 'description', '<p>3w54efgyjik</p>', 255),
('App\\Model\\Service', 6, 'eg', 'name', 'Emery Marsh', 256),
('App\\Model\\Service', 6, 'eg', 'description', '<p>thjbkjb</p>', 257),
('App\\Model\\Service', 6, 'fr', 'name', 'Clare Harrell', 258),
('App\\Model\\Service', 6, 'fr', 'description', '<p>ddrfthjjhjfg</p>', 259),
('App\\Model\\Service', 7, 'eg', 'name', 'Emery Marsh', 260),
('App\\Model\\Service', 7, 'eg', 'description', '<p>thjbkjb</p>', 261),
('App\\Model\\Service', 7, 'fr', 'name', 'Clare Harrell', 262),
('App\\Model\\Service', 7, 'fr', 'description', '<p>ddrfthjjhjfg</p>', 263),
('App\\Model\\Service', 8, 'eg', 'name', 'Emery Marsh', 264),
('App\\Model\\Service', 8, 'eg', 'description', '<p>thjbkjb</p>', 265),
('App\\Model\\Service', 8, 'fr', 'name', 'Clare Harrell', 266),
('App\\Model\\Service', 8, 'fr', 'description', '<p>ddrfthjjhjfg</p>', 267),
('App\\Model\\Service', 9, 'eg', 'name', 'Wyoming Ware', 268),
('App\\Model\\Service', 9, 'eg', 'description', '<p>asdfghj</p>', 269),
('App\\Model\\Service', 9, 'fr', 'name', 'Nissim Holder', 270),
('App\\Model\\Service', 9, 'fr', 'description', '<p>awsdfgvbh</p>', 271),
('App\\Model\\Advert', 23, 'eg', 'name', 'سياحة وسفر', 272),
('App\\Model\\Advert', 23, 'fr', 'name', 'Voyages & Tourisme', 273),
('App\\Model\\Advert', 24, 'eg', 'name', 'Soddim', 274),
('App\\Model\\Advert', 24, 'fr', 'name', 'Soddim', 275),
('App\\Model\\Advert', 25, 'eg', 'name', 'tripledesign', 276),
('App\\Model\\Advert', 25, 'fr', 'name', 'tripledesign', 277),
('App\\Model\\Advert', 26, 'eg', 'name', 'mix-nuts', 278),
('App\\Model\\Advert', 26, 'fr', 'name', 'mix-nuts', 279),
('App\\Model\\Advert', 27, 'eg', 'name', 'SO GE LUX', 280),
('App\\Model\\Advert', 27, 'fr', 'name', 'SO GE LUX', 281),
('App\\Model\\Advert', 28, 'eg', 'name', 'Jumeaux', 282),
('App\\Model\\Advert', 28, 'fr', 'name', 'Jumeaux', 283),
('App\\Model\\Advert', 29, 'eg', 'name', 'Orca', 284),
('App\\Model\\Advert', 29, 'fr', 'name', 'Orca', 285),
('App\\Model\\Advert', 30, 'eg', 'name', 'LES IMMORTELS SOUVENIRS', 286),
('App\\Model\\Advert', 30, 'fr', 'name', 'LES IMMORTELS SOUVENIRS', 287),
('App\\Model\\Advert', 31, 'eg', 'name', 'Mamman Mia', 288),
('App\\Model\\Advert', 31, 'fr', 'name', 'Mamman Mia', 289),
('App\\Model\\Product', 41, 'eg', 'name', 'Jerome Harvey', 290),
('App\\Model\\Product', 41, 'eg', 'description', '<p>sfedgrtfhgyjuh</p>', 291),
('App\\Model\\Product', 41, 'fr', 'name', 'Hannah Lee', 292),
('App\\Model\\Product', 41, 'fr', 'description', '<p>xacsfzdgsrhtfgyju</p>', 293),
('App\\Model\\Product', 42, 'eg', 'name', 'Jerome Harvey', 294),
('App\\Model\\Product', 42, 'eg', 'description', '<p>sfedgrtfhgyjuh</p>', 295),
('App\\Model\\Product', 42, 'fr', 'name', 'Hannah Lee', 296),
('App\\Model\\Product', 42, 'fr', 'description', '<p>xacsfzdgsrhtfgyju</p>', 297),
('App\\Model\\Product', 43, 'eg', 'name', '111', 298),
('App\\Model\\Product', 43, 'eg', 'description', '<p>1111</p>', 299),
('App\\Model\\Product', 43, 'fr', 'name', '1111', 300),
('App\\Model\\Product', 43, 'fr', 'description', '<p>1111</p>', 301),
('App\\Model\\Service', 10, 'eg', 'name', 'test', 302),
('App\\Model\\Service', 10, 'eg', 'description', '<p>good</p>', 303),
('App\\Model\\Service', 10, 'fr', 'name', 'test', 304),
('App\\Model\\Service', 10, 'fr', 'description', '<p>edrfghnj</p>', 305),
('App\\Model\\Category', 36, 'eg', 'name', 'سوبر ماركت', 306),
('App\\Model\\Category', 36, 'fr', 'name', 'Supermarché', 307),
('App\\Model\\Category', 37, 'eg', 'name', 'موضة', 308),
('App\\Model\\Category', 37, 'fr', 'name', 'Mode', 309),
('App\\Model\\Category', 38, 'eg', 'name', 'الجمال و النظافة', 310),
('App\\Model\\Category', 38, 'fr', 'name', 'Beauté & Hygiène', 311),
('App\\Model\\Category', 39, 'eg', 'name', 'منتجات الاطفال', 312),
('App\\Model\\Category', 39, 'fr', 'name', 'Produits bébé', 313),
('App\\Model\\Category', 40, 'eg', 'name', 'الهواتف', 314),
('App\\Model\\Category', 40, 'fr', 'name', 'Téléphones & Tablettes', 315),
('App\\Model\\Category', 41, 'eg', 'name', 'المنزل و المكتب', 316),
('App\\Model\\Category', 41, 'fr', 'name', 'Maison & Bureau', 317),
('App\\Model\\Category', 42, 'eg', 'name', 'إلكترونيات', 318),
('App\\Model\\Category', 42, 'fr', 'name', 'Électronique', 319),
('App\\Model\\Category', 43, 'eg', 'name', 'الكمبيوتر', 320),
('App\\Model\\Category', 43, 'fr', 'name', 'Informatique', 321),
('App\\Model\\Category', 44, 'eg', 'name', 'رياضة', 322),
('App\\Model\\Category', 44, 'fr', 'name', 'Sports', 323),
('App\\Model\\Category', 45, 'eg', 'name', 'ألعاب', 324),
('App\\Model\\Category', 45, 'fr', 'name', 'Jeux', 325),
('App\\Model\\Category', 46, 'eg', 'name', 'السيارات', 326),
('App\\Model\\Category', 46, 'fr', 'name', 'Automobile', 327),
('App\\Model\\Category', 47, 'eg', 'name', 'الفئات الأخرى', 328),
('App\\Model\\Category', 47, 'fr', 'name', 'Other categories', 329),
('App\\Model\\Category', 48, 'eg', 'name', 'خدمات', 330),
('App\\Model\\Category', 48, 'fr', 'name', 'Services', 331),
('App\\Model\\Category', 49, 'eg', 'name', 'مواد غذائية', 332),
('App\\Model\\Category', 49, 'fr', 'name', 'Produits Alimentaires', 333),
('App\\Model\\Category', 50, 'eg', 'name', 'مشروبات', 334),
('App\\Model\\Category', 50, 'fr', 'name', 'Boisson', 335),
('App\\Model\\Category', 51, 'eg', 'name', 'اطعمة معلبة', 336),
('App\\Model\\Category', 51, 'fr', 'name', 'Aliments en conserve', 337),
('App\\Model\\Category', 52, 'eg', 'name', 'فطور الصباح', 338),
('App\\Model\\Category', 52, 'fr', 'name', 'Petits-déjeuners', 339),
('App\\Model\\Category', 53, 'eg', 'name', 'غرفة الغسيل', 340),
('App\\Model\\Category', 53, 'fr', 'name', 'Buanderie', 341),
('App\\Model\\Category', 54, 'eg', 'name', 'Entretien ménager', 342),
('App\\Model\\Category', 54, 'fr', 'name', 'المنظفات المنزلية', 343),
('App\\Model\\Category', 55, 'eg', 'name', 'أزياء المراة', 344),
('App\\Model\\Category', 55, 'fr', 'name', 'Mode Femme', 345),
('App\\Model\\Category', 56, 'eg', 'name', 'أزياء الرجل', 346),
('App\\Model\\Category', 56, 'fr', 'name', 'Mode Homme', 347),
('App\\Model\\Category', 57, 'eg', 'name', 'طفل/رضيع', 348),
('App\\Model\\Category', 57, 'fr', 'name', 'Bébé', 349),
('App\\Model\\Category', 58, 'eg', 'name', 'أزياء الاطفال', 350),
('App\\Model\\Category', 58, 'fr', 'name', 'Mode Enfant', 351),
('App\\Model\\Category', 59, 'eg', 'name', 'أرقى الماركات', 352),
('App\\Model\\Category', 59, 'fr', 'name', 'Top Marques', 353),
('App\\Model\\Category', 60, 'eg', 'name', 'الجمال و العناية الشخصية', 354),
('App\\Model\\Category', 60, 'fr', 'name', 'Beauté & Soins Personnels', 355),
('App\\Model\\Category', 61, 'eg', 'name', 'Soin des cheveux', 356),
('App\\Model\\Category', 61, 'fr', 'name', 'Soin de cheveux', 357),
('App\\Model\\Category', 62, 'eg', 'name', 'عطور', 358),
('App\\Model\\Category', 62, 'fr', 'name', 'Parfum', 359),
('App\\Model\\Category', 63, 'eg', 'name', 'مكياج', 360),
('App\\Model\\Category', 63, 'fr', 'name', 'Maquillage', 361),
('App\\Model\\Category', 64, 'eg', 'name', 'العناية بالصحة', 362),
('App\\Model\\Category', 64, 'fr', 'name', 'Soins de santé', 363),
('App\\Model\\Category', 65, 'eg', 'name', 'أرقى الماركات', 364),
('App\\Model\\Category', 65, 'fr', 'name', 'Top Marques', 365),
('App\\Model\\Category', 66, 'eg', 'name', 'حفاظات', 366),
('App\\Model\\Category', 66, 'fr', 'name', 'Couches', 367),
('App\\Model\\Category', 67, 'eg', 'name', 'طعام للأطفال', 368),
('App\\Model\\Category', 67, 'fr', 'name', 'Alimentation pour bébé', 369),
('App\\Model\\Category', 68, 'eg', 'name', 'الاستحمام و العناية بالبشرة', 370),
('App\\Model\\Category', 68, 'fr', 'name', 'Bain et Soins de la Peau', 371),
('App\\Model\\Category', 69, 'eg', 'name', 'سلامة الطفل', 372),
('App\\Model\\Category', 69, 'fr', 'name', 'Sécurité pour bébé', 373),
('App\\Model\\Category', 70, 'eg', 'name', 'عربات الاطفال و الاكسسوارات', 374),
('App\\Model\\Category', 70, 'fr', 'name', 'Poussettes & Accessoires', 375),
('App\\Model\\Category', 71, 'eg', 'name', 'غرف الاطفال', 376),
('App\\Model\\Category', 71, 'fr', 'name', 'Chambre pour Bébé', 377),
('App\\Model\\Category', 72, 'eg', 'name', 'الأطفال و الالعاب', 378),
('App\\Model\\Category', 72, 'fr', 'name', 'Bébé & Jouets', 379),
('App\\Model\\Category', 73, 'eg', 'name', 'هاتف محمول', 380),
('App\\Model\\Category', 73, 'fr', 'name', 'Téléphones Portables', 381),
('App\\Model\\Category', 74, 'eg', 'name', 'جهاز لوحي', 382),
('App\\Model\\Category', 74, 'fr', 'name', 'Tablettes', 383),
('App\\Model\\Category', 75, 'eg', 'name', 'إكسسوارات  الهاتف', 384),
('App\\Model\\Category', 75, 'fr', 'name', 'Accessoires Téléphone', 385),
('App\\Model\\Category', 76, 'eg', 'name', 'أرقى الماركات', 386),
('App\\Model\\Category', 76, 'fr', 'name', 'Top Marques', 387),
('App\\Model\\Category', 77, 'eg', 'name', 'المنزل و المطبخ', 388),
('App\\Model\\Category', 77, 'fr', 'name', 'Maison & Cuisine', 389),
('App\\Model\\Category', 78, 'eg', 'name', 'الحرف و التجديدات', 390),
('App\\Model\\Category', 78, 'fr', 'name', 'Bricolage & Rénovation', 391),
('App\\Model\\Category', 79, 'eg', 'name', 'اللوازم المكتبية', 392),
('App\\Model\\Category', 79, 'fr', 'name', 'Fournitures de Bureau', 393),
('App\\Model\\Category', 80, 'eg', 'name', 'أجهزة صغيرة', 394),
('App\\Model\\Category', 80, 'fr', 'name', 'Petit Électroménager', 395),
('App\\Model\\Category', 81, 'eg', 'name', 'تكييف الهواء', 396),
('App\\Model\\Category', 81, 'fr', 'name', 'Air et Climatisation', 397),
('App\\Model\\Category', 82, 'eg', 'name', 'الأجهزة الرئيسية', 398),
('App\\Model\\Category', 82, 'fr', 'name', 'Gros Electroménager', 399),
('App\\Model\\Category', 83, 'eg', 'name', 'ادوات المطبخ', 400),
('App\\Model\\Category', 83, 'fr', 'name', 'Appareils de cuisine', 401),
('App\\Model\\Category', 84, 'eg', 'name', 'التلفاز و الفيديو', 402),
('App\\Model\\Category', 84, 'fr', 'name', 'Télévision & vidéo', 403),
('App\\Model\\Category', 85, 'eg', 'name', 'كاميرات', 404),
('App\\Model\\Category', 85, 'fr', 'name', 'Caméras', 405),
('App\\Model\\Category', 86, 'eg', 'name', 'اوديو', 406),
('App\\Model\\Category', 86, 'fr', 'name', 'Audio & Hifi', 407),
('App\\Model\\Category', 87, 'eg', 'name', 'اخرى', 408),
('App\\Model\\Category', 87, 'fr', 'name', 'Autres', 409),
('App\\Model\\Category', 88, 'eg', 'name', 'اللابتوبات', 410),
('App\\Model\\Category', 88, 'fr', 'name', 'Ordinateurs Portables', 411),
('App\\Model\\Category', 89, 'fr', 'name', 'Stockage de Données', 412),
('App\\Model\\Category', 90, 'eg', 'name', 'الاجهزة الطرفية و الاكسسوارات', 413),
('App\\Model\\Category', 90, 'fr', 'name', 'Périphériques & Accessoires', 414),
('App\\Model\\Category', 91, 'eg', 'name', 'مكونات الحاسوب', 415),
('App\\Model\\Category', 91, 'fr', 'name', 'Composants de l\'Ordinateur', 416),
('App\\Model\\Category', 92, 'eg', 'name', 'اكسسوارات للحاسوب', 417),
('App\\Model\\Category', 92, 'fr', 'name', 'Accessoires pour Ordinateur', 418),
('App\\Model\\Category', 93, 'eg', 'name', 'منتج الشبكات', 419),
('App\\Model\\Category', 93, 'fr', 'name', 'Produits de mise en réseau', 420),
('App\\Model\\Category', 94, 'eg', 'name', 'أرقى الماركات', 421),
('App\\Model\\Category', 94, 'fr', 'name', 'Top Marques', 422),
('App\\Model\\Category', 95, 'eg', 'name', 'معدات التدريب', 423),
('App\\Model\\Category', 95, 'fr', 'name', 'Équipement d\'Entraînement', 424),
('App\\Model\\Category', 96, 'eg', 'name', 'اكسسوارات', 425),
('App\\Model\\Category', 96, 'fr', 'name', 'Accessoires', 426),
('App\\Model\\Category', 97, 'eg', 'name', 'لرياضة و اللياقة البدنية', 427),
('App\\Model\\Category', 97, 'fr', 'name', 'Sports & Fitness', 428),
('App\\Model\\Category', 98, 'eg', 'name', 'التنزه و المغامرات', 429),
('App\\Model\\Category', 98, 'fr', 'name', 'Promonade et Aventure', 430),
('App\\Model\\Category', 99, 'eg', 'name', 'بلايستايشن 5', 431),
('App\\Model\\Category', 99, 'fr', 'name', 'PlayStation 5', 432),
('App\\Model\\Category', 100, 'eg', 'name', 'بلايستايشن4', 433),
('App\\Model\\Category', 100, 'fr', 'name', 'PlayStation 4', 434),
('App\\Model\\Category', 101, 'eg', 'name', 'اكس بوكس', 435),
('App\\Model\\Category', 101, 'fr', 'name', 'XBOX', 436),
('App\\Model\\Category', 102, 'eg', 'name', 'العاب للحاسوب', 437),
('App\\Model\\Category', 102, 'fr', 'name', 'Jeux pour PC', 438),
('App\\Model\\Category', 103, 'eg', 'name', 'صيانة السيارات', 439),
('App\\Model\\Category', 103, 'fr', 'name', 'Entretien Automobile', 440),
('App\\Model\\Category', 104, 'eg', 'name', 'مجموعات التنظيف', 441),
('App\\Model\\Category', 104, 'fr', 'name', 'Kits de Nettoyage', 442),
('App\\Model\\Category', 105, 'eg', 'name', 'اكسسوارات السيارة و ملحقاتها', 443),
('App\\Model\\Category', 105, 'fr', 'name', 'Électronique et accessoires de voiture', 444),
('App\\Model\\Category', 106, 'eg', 'name', 'المصابيح و مستلزماتها', 445),
('App\\Model\\Category', 106, 'fr', 'name', 'Lumières et accessoires d’éclairage', 446),
('App\\Model\\Category', 107, 'eg', 'name', 'الزيوت و السوائل', 447),
('App\\Model\\Category', 107, 'fr', 'name', 'Huiles & Fluides', 448),
('App\\Model\\Category', 108, 'eg', 'name', 'اكسسوارات خارجية', 449),
('App\\Model\\Category', 108, 'fr', 'name', 'Accessoires d\'Extérieurs', 450),
('App\\Model\\Category', 109, 'eg', 'name', 'اكسسوارات داخلية', 451),
('App\\Model\\Category', 109, 'fr', 'name', 'Accessoires d\'Intérieur', 452),
('App\\Model\\Category', 110, 'eg', 'name', 'البستنة والصيانة', 453),
('App\\Model\\Category', 110, 'fr', 'name', 'Jardinage & Bricolage', 454),
('App\\Model\\Category', 111, 'eg', 'name', 'كتب افلام و موسيقى', 455),
('App\\Model\\Category', 111, 'fr', 'name', 'Livres, Films et Musique', 456),
('App\\Model\\Category', 112, 'eg', 'name', 'صناعة يدوية', 457),
('App\\Model\\Category', 112, 'fr', 'name', 'Artisanal', 458),
('App\\Model\\Category', 113, 'eg', 'name', 'صناعي و علمي', 459),
('App\\Model\\Category', 113, 'fr', 'name', 'Industriel et scientifique', 460),
('App\\Model\\Category', 114, 'eg', 'name', 'مستلزمات الحيوانات', 461),
('App\\Model\\Category', 114, 'fr', 'name', 'Accessoires pour Animaux', 462),
('App\\Model\\Service', 11, 'fr', 'name', 'Micah Rosario', 463),
('App\\Model\\Service', 11, 'fr', 'description', '<p>good</p>', 464),
('App\\Model\\Service', 11, 'lb', 'name', 'Alma Keller', 465),
('App\\Model\\Service', 11, 'lb', 'description', '<p>good</p>', 466),
('App\\Model\\Service', 12, 'fr', 'name', 'Micah Rosario', 467),
('App\\Model\\Service', 12, 'fr', 'description', '<p>good</p>', 468),
('App\\Model\\Service', 12, 'lb', 'name', 'Alma Keller', 469),
('App\\Model\\Service', 12, 'lb', 'description', '<p>good</p>', 470),
('App\\Model\\Service', 13, 'fr', 'name', 'Matthew Robertson', 471),
('App\\Model\\Service', 13, 'fr', 'description', '<p>good</p>', 472),
('App\\Model\\Service', 13, 'lb', 'name', 'Alfonso Mclean', 473),
('App\\Model\\Service', 13, 'lb', 'description', '<p>good</p>', 474),
('App\\Model\\Product', 44, 'fr', 'name', 'كرنشي', 475),
('App\\Model\\Product', 44, 'fr', 'description', '<p>كرنشي&nbsp;</p>', 476),
('App\\Model\\Product', 44, 'lb', 'name', 'cranshy', 477),
('App\\Model\\Product', 44, 'lb', 'description', '<p>cranshy</p>', 478),
('App\\Model\\Service', 14, 'fr', 'name', 'Dorothy Flores', 479),
('App\\Model\\Service', 14, 'fr', 'description', '<p>fgbh</p>', 480),
('App\\Model\\Service', 14, 'lb', 'name', 'Channing Richards', 481),
('App\\Model\\Service', 14, 'lb', 'description', '<p>cfvg</p>', 482),
('App\\Model\\Product', 45, 'fr', 'name', 'meet', 483),
('App\\Model\\Product', 45, 'fr', 'description', '<p>meet</p>', 484),
('App\\Model\\Product', 45, 'lb', 'name', 'لحمة', 485),
('App\\Model\\Product', 45, 'lb', 'description', '<p>لحمة</p>', 486),
('App\\Model\\Product', 46, 'fr', 'name', 'Shawarma', 487),
('App\\Model\\Product', 46, 'fr', 'description', '<p>Shawarma</p>', 488),
('App\\Model\\Product', 46, 'lb', 'name', 'شاورما', 489),
('App\\Model\\Product', 46, 'lb', 'description', '<p>شاورما&nbsp;</p>', 490),
('App\\Model\\Product', 48, 'fr', 'name', 'qqq', 491),
('App\\Model\\Product', 48, 'fr', 'description', '<p>qqqq</p>', 492),
('App\\Model\\Product', 48, 'lb', 'name', 'aaaa', 493),
('App\\Model\\Product', 48, 'lb', 'description', '<p>aaaa</p>', 494),
('App\\Model\\Category', 39, 'lb', 'name', 'منتجات اطفال', 495),
('App\\Model\\Category', 48, 'lb', 'name', 'خدمات', 496),
('App\\Model\\Category', 47, 'lb', 'name', 'الفئات الأخرى', 497),
('App\\Model\\Category', 46, 'lb', 'name', 'السيارات', 498),
('App\\Model\\Category', 45, 'lb', 'name', 'ألعاب', 499),
('App\\Model\\Category', 44, 'lb', 'name', 'رياضة', 500),
('App\\Model\\Category', 43, 'lb', 'name', 'الكمبيوتر', 501),
('App\\Model\\Category', 42, 'lb', 'name', 'إلكترونيات', 502),
('App\\Model\\Category', 41, 'lb', 'name', 'المنزل و المكتب', 503),
('App\\Model\\Category', 40, 'lb', 'name', 'الهواتف', 504),
('App\\Model\\Category', 38, 'lb', 'name', 'الجمال و النظافة', 505),
('App\\Model\\Category', 37, 'lb', 'name', 'موضة', 506),
('App\\Model\\Category', 36, 'lb', 'name', 'سوبر ماركت', 507),
('App\\Model\\Category', 114, 'lb', 'name', 'مستلزمات الحيوانات', 508),
('App\\Model\\Category', 113, 'lb', 'name', 'صناعي و علمي', 509),
('App\\Model\\Category', 112, 'lb', 'name', 'صناعة يدوية', 510),
('App\\Model\\Category', 111, 'lb', 'name', 'كتب افلام و موسيقى', 511),
('App\\Model\\Category', 110, 'lb', 'name', 'البستنة والصيانة', 512),
('App\\Model\\Category', 109, 'lb', 'name', 'اكسسوارات داخلية', 513),
('App\\Model\\Category', 108, 'lb', 'name', 'اكسسوارات خارجية', 514),
('App\\Model\\Category', 107, 'lb', 'name', 'الزيوت و السوائل', 515),
('App\\Model\\Category', 106, 'lb', 'name', 'المصابيح و مستلزماتها', 516),
('App\\Model\\Category', 105, 'lb', 'name', 'اكسسوارات السيارة و ملحقاتها', 517),
('App\\Model\\Category', 104, 'lb', 'name', 'مجموعات التنظيف', 518),
('App\\Model\\Category', 103, 'lb', 'name', 'صيانة السيارات', 519),
('App\\Model\\Category', 102, 'lb', 'name', 'العاب للحاسوب', 520),
('App\\Model\\Category', 101, 'lb', 'name', 'اكس بوكس', 521),
('App\\Model\\Category', 100, 'lb', 'name', 'بلايستايشن4', 522),
('App\\Model\\Category', 99, 'lb', 'name', 'بلايستايشن 5', 523),
('App\\Model\\Category', 98, 'lb', 'name', 'التنزه و المغامرات', 524),
('App\\Model\\Category', 97, 'lb', 'name', 'الرياضة و اللياقة البدنية', 525),
('App\\Model\\Category', 96, 'lb', 'name', 'اكسسوارات', 526),
('App\\Model\\Category', 95, 'lb', 'name', 'معدات التدريب', 527),
('App\\Model\\Category', 94, 'lb', 'name', 'أرقى الماركات', 528),
('App\\Model\\Category', 93, 'lb', 'name', 'منتج الشبكات', 529),
('App\\Model\\Category', 92, 'lb', 'name', 'اكسسوارات للحاسوب', 530),
('App\\Model\\Category', 91, 'lb', 'name', 'مكونات الحاسوب', 531),
('App\\Model\\Category', 90, 'lb', 'name', 'الاجهزة الطرفية و الاكسسوارات', 532),
('App\\Model\\Category', 89, 'lb', 'name', 'مخزنات البيانات', 533),
('App\\Model\\Category', 88, 'lb', 'name', 'اللابتوبات', 534),
('App\\Model\\Category', 87, 'lb', 'name', 'اخرى', 535),
('App\\Model\\Category', 86, 'lb', 'name', 'اوديو', 536),
('App\\Model\\Category', 85, 'lb', 'name', 'كاميرات', 537),
('App\\Model\\Category', 84, 'lb', 'name', 'التلفاز و الفيديو', 538),
('App\\Model\\Category', 83, 'lb', 'name', 'ادوات المطبخ', 539),
('App\\Model\\Category', 82, 'lb', 'name', 'الأجهزة الرئيسية', 540),
('App\\Model\\Category', 81, 'lb', 'name', 'تكييف الهواء', 541),
('App\\Model\\Category', 80, 'lb', 'name', 'أجهزة صغيرة', 542),
('App\\Model\\Category', 79, 'lb', 'name', 'اللوازم المكتبية', 543),
('App\\Model\\Category', 78, 'lb', 'name', 'الحرف و التجديدات', 544),
('App\\Model\\Category', 77, 'lb', 'name', 'المنزل و المطبخ', 545),
('App\\Model\\Category', 76, 'lb', 'name', 'أرقى الماركات', 546),
('App\\Model\\Category', 75, 'lb', 'name', 'إكسسوارات  الهاتف', 547),
('App\\Model\\Category', 74, 'lb', 'name', 'جهاز لوحي', 548),
('App\\Model\\Category', 73, 'lb', 'name', 'هاتف محمول', 549),
('App\\Model\\Category', 72, 'lb', 'name', 'الأطفال و الالعاب', 550),
('App\\Model\\Category', 71, 'lb', 'name', 'غرف الاطفال', 551),
('App\\Model\\Category', 70, 'lb', 'name', 'عربات الاطفال و الاكسسوارات', 552),
('App\\Model\\Category', 69, 'lb', 'name', 'سلامة الطفل', 553),
('App\\Model\\Category', 68, 'lb', 'name', 'الاستحمام و العناية بالبشرة', 554),
('App\\Model\\Category', 67, 'lb', 'name', 'طعام للأطفال', 555),
('App\\Model\\Category', 66, 'lb', 'name', 'حفاظات', 556),
('App\\Model\\Category', 65, 'lb', 'name', 'أرقى الماركات', 557),
('App\\Model\\Category', 64, 'lb', 'name', 'العناية بالصحة', 558),
('App\\Model\\Category', 63, 'lb', 'name', 'مكياج', 559),
('App\\Model\\Category', 62, 'lb', 'name', 'عطور', 560),
('App\\Model\\Category', 61, 'lb', 'name', 'العناية بالشعر', 561),
('App\\Model\\Category', 60, 'lb', 'name', 'الجمال و العناية الشخصية', 562),
('App\\Model\\Category', 59, 'lb', 'name', 'أرقى الماركات', 563),
('App\\Model\\Category', 58, 'lb', 'name', 'أزياء الاطفال', 564),
('App\\Model\\Category', 57, 'lb', 'name', 'طفل/رضيع', 565),
('App\\Model\\Category', 56, 'lb', 'name', 'أزياء الرجل', 566),
('App\\Model\\Category', 55, 'lb', 'name', 'أزياء المراة', 567),
('App\\Model\\Category', 54, 'lb', 'name', 'المنظفات المنزلية', 568),
('App\\Model\\Category', 53, 'lb', 'name', 'غرفة الغسيل', 569),
('App\\Model\\Category', 52, 'lb', 'name', 'فطور الصباح', 570),
('App\\Model\\Category', 51, 'lb', 'name', 'اطعمة معلبة', 571),
('App\\Model\\Category', 50, 'lb', 'name', 'مشروبات', 572),
('App\\Model\\Category', 49, 'lb', 'name', 'مواد غذائية', 573),
('App\\Model\\Advert', 32, 'fr', 'name', 'Azol', 574),
('App\\Model\\Advert', 32, 'lb', 'name', 'Azol', 575);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `l_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'def.png',
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `street_address` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `apartment_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cm_firebase_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `payment_card_last_four` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_brand` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_card_fawry_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `login_medium` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_phone_verified` tinyint(1) NOT NULL DEFAULT '0',
  `temporary_token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_email_verified` tinyint(1) NOT NULL DEFAULT '0',
  `wallet_balance` double(8,2) DEFAULT NULL,
  `loyalty_point` double(8,2) DEFAULT NULL,
  `zone_id` bigint DEFAULT NULL,
  `longitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `f_name`, `l_name`, `phone`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `street_address`, `country`, `city`, `zip`, `house_no`, `apartment_no`, `cm_firebase_token`, `is_active`, `payment_card_last_four`, `payment_card_brand`, `payment_card_fawry_token`, `login_medium`, `social_id`, `is_phone_verified`, `temporary_token`, `is_email_verified`, `wallet_balance`, `loyalty_point`, `zone_id`, `longitude`, `latitude`, `type`, `age`) VALUES
(17, NULL, 'Everest-Customer', 'Everest-Customer', '0757496206', '2022-12-09-6392e9d065e20.png', 'Everest-Customer@gmail.com', NULL, '$2y$10$8hjeV7rpj/nKNYoedkpW4.fCjRp1YfPuCJOTrIvLEuwUAo4UTQgQy', 'nFWWnzJTkt38RMjbB0iwCvFq1xv3cK49gM0Y4ZGwCZG4FvAIkqpBRfHFWnGE', '2022-12-09 06:29:11', '2022-12-21 10:52:30', NULL, NULL, NULL, NULL, NULL, NULL, 'A98B65588CD2F185DDA70A8E936769FEADF0304061D5BDAB1B5CD2FBFD884664', 1, NULL, NULL, NULL, NULL, NULL, 0, 'WaVdw8usO0UWiDxHIhOyl3fFbf2263fr3byNJE1U', 0, NULL, NULL, 5, '-3.9746601738018805', '5.301173294300269', '1', '1981-08-20'),
(18, NULL, 'Amr', 'Darwish', '00201017127818', 'def.png', 'amr.dar810@gmail.com', NULL, '$2y$10$6UdMBVQCS0y1xP/vWs1f8O3s5OCyVr0umGV2V2zw1cSw4auMUhCBe', NULL, '2022-12-11 19:16:31', '2022-12-19 21:44:53', NULL, NULL, NULL, NULL, NULL, NULL, 'eMsCObPYSOaTCtT_-y_aWb:APA91bHEXT0-peNTgivSZlzDMhjtMJ_uVFPgHDRPenGy4T_LCfJfPNhZ5rl9TSsFrhINKjtg7I7QB8J4AquAX8K3cFIFCW-MwhPkSnCn6BrJ-Sn8MJ7Lnn-Tq_kjJE0tedVRs8q-NtEq', 1, NULL, NULL, NULL, NULL, NULL, 0, '8i5WjDDuRAVtSky3uUUh7Qnu6YMtZXGTdmcDJ7RM', 0, NULL, NULL, 4, '-5.00124419991182', '8.039702634427227', '1', '2001-01-11'),
(19, NULL, 'Amr', 'Darwish', '01017127810', 'def.png', 'amrdarwish171@gmail.com', NULL, '$2y$10$pXq3T7McGSklL/bMarkl6OCw0WuGIqgPIbNjXCAkc0XJlG53XTIE2', 'Sif95cEHjGsWa9sp1EbVUdMxtL8bISR0am6g6ucIUQRwTiNuMlbqCKAo2Nsm', '2022-12-13 13:26:02', '2022-12-17 16:24:13', NULL, NULL, NULL, NULL, NULL, NULL, 'dk1QNCa-R1eukptZa08cnn:APA91bGjJKpFVfVesnSj6vyva5whjkMtfKbpEBvz1PQd1e0IhgacVpTALbOnEZE6LoNq5yKDowKb8tGRKekl0dGvA6biH1pQ7IbwbwnHXsMJ9tKSyig4XUxwivJBKWbFfk8EjtaSe9VI', 1, NULL, NULL, NULL, NULL, NULL, 0, 'joPwq8Lw3ePTX64xwTO6YiJHCJYYGtWtdB3yUu4l', 0, NULL, NULL, 4, '-5.37477935616182', '7.430068990911771', '0', '2001-06-29'),
(20, NULL, 'amgad', 'anwar', '01277112438', 'def.png', 'amgad.anwar.dev@gmail.com', NULL, '$2y$10$HJjzWLRV2lvZKBZBh7UfDu.jY1.jDQeon8y8DgdrTfj3KvATjYKpq', NULL, '2022-12-13 13:49:06', '2022-12-13 13:53:12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, 'kfdOTrPKDcOFwgF65ooGe2YYpOOLAsxh5v8z23Xu', 0, NULL, NULL, 4, '-4.390403953830468', '8.081038777416836', '1', '2022-12-07'),
(21, NULL, 'Test', 'Test', '+225432123456', 'def.png', 'test1234@test.com', NULL, '$2y$10$ORxJnVec12Y70KX9.V.FBuQUrlcU8lg/H.t1jrNCG9BXei5NKumbm', NULL, '2022-12-21 10:49:03', '2022-12-21 10:49:03', NULL, NULL, NULL, NULL, NULL, NULL, 'A98B65588CD2F185DDA70A8E936769FEADF0304061D5BDAB1B5CD2FBFD884664', 1, NULL, NULL, NULL, NULL, NULL, 0, 'rORaW3ZzdQkY1ZM77iXepiJR8zZdA7IkBYzW7ZkR', 0, NULL, NULL, NULL, '-4.024450799999999', '5.3460012', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wallet_transactions`
--

CREATE TABLE `wallet_transactions` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `debit` decimal(24,3) NOT NULL DEFAULT '0.000',
  `admin_bonus` decimal(24,3) NOT NULL DEFAULT '0.000',
  `balance` decimal(24,3) NOT NULL DEFAULT '0.000',
  `transaction_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `customer_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 8, 33, '2022-10-24 05:27:30', '2022-10-24 05:27:30'),
(6, 8, 40, '2022-10-26 00:30:17', '2022-10-26 00:30:17'),
(8, 8, 22, '2022-11-04 16:10:23', '2022-11-04 16:10:23'),
(9, 8, 39, '2022-11-06 10:26:05', '2022-11-06 10:26:05'),
(10, 8, 20, '2022-11-06 10:27:00', '2022-11-06 10:27:00'),
(11, 8, 32, '2022-11-16 18:43:46', '2022-11-16 18:43:46'),
(12, 12, 34, '2022-11-17 10:07:35', '2022-11-17 10:07:35'),
(13, 12, 46, '2022-11-25 11:42:53', '2022-11-25 11:42:53'),
(14, 12, 45, '2022-11-25 11:43:10', '2022-11-25 11:43:10'),
(15, 17, 50, '2022-12-12 18:48:06', '2022-12-12 18:48:06');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_requests`
--

CREATE TABLE `withdraw_requests` (
  `id` bigint UNSIGNED NOT NULL,
  `seller_id` bigint DEFAULT NULL,
  `admin_id` bigint DEFAULT NULL,
  `amount` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.00',
  `transaction_note` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coordinates` polygon DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `name`, `coordinates`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Côté d\'ivoire', 0x0000000001030000000100000005000000fccb6bbb6a751ec000a5ab5075fa1140fee5b55d358c20c03bc14ff445672440f897d776d59806c0ccf36a2c545d2340f897d776d50008c0d8fdaddbeaa71540fccb6bbb6a751ec000a5ab5075fa1140, 1, '2022-10-08 17:12:03', '2022-10-08 17:12:03'),
(5, 'Abidjan', 0x000000000103000000010000000d00000033ce7a4a8db410c00eb6fd63d7eb144005ceca48fdd710c032d84af8e0e214403dceca486de010c086b06b5b1826154005ceca48dd1511c044f16ba21718154005ceca48dd4211c0f6e61e461ba4154005ceca481d2111c0f9880e0381d615403dceca48adcc11c05999c6fb4a1f164005ceca48dd9c11c0c58a4a27466516403dceca486d6711c05f45de554849164005ceca489db010c04ecfe446df6a16407b9c95911a830fc0f72b7471e05c16400a9c9591faa40dc0271ebadedfd4144033ce7a4a8db410c00eb6fd63d7eb1440, 1, '2022-10-09 07:49:01', '2022-10-09 07:49:01');

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
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adverts`
--
ALTER TABLE `adverts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_settings`
--
ALTER TABLE `business_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_deliveries`
--
ALTER TABLE `cart_deliveries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_deliveries_delivery_method_id_foreign` (`delivery_method_id`);

--
-- Indexes for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chattings`
--
ALTER TABLE `chattings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_men`
--
ALTER TABLE `delivery_men`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `delivery_men_phone_unique` (`phone`);

--
-- Indexes for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employs`
--
ALTER TABLE `employs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feature_deals`
--
ALTER TABLE `feature_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deals`
--
ALTER TABLE `flash_deals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `help_topics`
--
ALTER TABLE `help_topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_delivery_method_id_foreign` (`delivery_method_id`),
  ADD KEY `orders_shop_id_foreign` (`shop_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`identity`);

--
-- Indexes for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_requests`
--
ALTER TABLE `refund_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `search_functions`
--
ALTER TABLE `search_functions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sellers_email_unique` (`email`);

--
-- Indexes for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_orders`
--
ALTER TABLE `service_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_cats`
--
ALTER TABLE `shipping_cats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shipping_types`
--
ALTER TABLE `shipping_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shops`
--
ALTER TABLE `shops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_medias`
--
ALTER TABLE `social_medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscription_sellers`
--
ALTER TABLE `subscription_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `traffic`
--
ALTER TABLE `traffic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD UNIQUE KEY `transactions_id_unique` (`id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `translations_translationable_id_index` (`translationable_id`),
  ADD KEY `translations_locale_index` (`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zones_name_unique` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `admin_wallets`
--
ALTER TABLE `admin_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_wallet_histories`
--
ALTER TABLE `admin_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `adverts`
--
ALTER TABLE `adverts`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing_addresses`
--
ALTER TABLE `billing_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `business_settings`
--
ALTER TABLE `business_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `cart_deliveries`
--
ALTER TABLE `cart_deliveries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_shippings`
--
ALTER TABLE `cart_shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `category_shipping_costs`
--
ALTER TABLE `category_shipping_costs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `chattings`
--
ALTER TABLE `chattings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=208;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `customer_wallets`
--
ALTER TABLE `customer_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_wallet_histories`
--
ALTER TABLE `customer_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deal_of_the_days`
--
ALTER TABLE `deal_of_the_days`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_histories`
--
ALTER TABLE `delivery_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_men`
--
ALTER TABLE `delivery_men`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `delivery_methods`
--
ALTER TABLE `delivery_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employs`
--
ALTER TABLE `employs`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feature_deals`
--
ALTER TABLE `feature_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deals`
--
ALTER TABLE `flash_deals`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flash_deal_products`
--
ALTER TABLE `flash_deal_products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help_topics`
--
ALTER TABLE `help_topics`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_point_transactions`
--
ALTER TABLE `loyalty_point_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100006;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `paytabs_invoices`
--
ALTER TABLE `paytabs_invoices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `phone_or_email_verifications`
--
ALTER TABLE `phone_or_email_verifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_requests`
--
ALTER TABLE `refund_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_statuses`
--
ALTER TABLE `refund_statuses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_transactions`
--
ALTER TABLE `refund_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `search_functions`
--
ALTER TABLE `search_functions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `seller_wallets`
--
ALTER TABLE `seller_wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `seller_wallet_histories`
--
ALTER TABLE `seller_wallet_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `service_orders`
--
ALTER TABLE `service_orders`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `shipping_cats`
--
ALTER TABLE `shipping_cats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shipping_methods`
--
ALTER TABLE `shipping_methods`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `shipping_types`
--
ALTER TABLE `shipping_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shops`
--
ALTER TABLE `shops`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `social_medias`
--
ALTER TABLE `social_medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `soft_credentials`
--
ALTER TABLE `soft_credentials`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `subscription_sellers`
--
ALTER TABLE `subscription_sellers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_ticket_convs`
--
ALTER TABLE `support_ticket_convs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `traffic`
--
ALTER TABLE `traffic`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=576;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `wallet_transactions`
--
ALTER TABLE `wallet_transactions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `withdraw_requests`
--
ALTER TABLE `withdraw_requests`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_deliveries`
--
ALTER TABLE `cart_deliveries`
  ADD CONSTRAINT `cart_deliveries_delivery_method_id_foreign` FOREIGN KEY (`delivery_method_id`) REFERENCES `delivery_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_delivery_method_id_foreign` FOREIGN KEY (`delivery_method_id`) REFERENCES `delivery_methods` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_shop_id_foreign` FOREIGN KEY (`shop_id`) REFERENCES `shops` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
