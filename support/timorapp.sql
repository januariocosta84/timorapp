-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2024 at 09:09 AM
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
-- Database: `timorapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Parents');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add municipality', 7, 'add_municipality'),
(26, 'Can change municipality', 7, 'change_municipality'),
(27, 'Can delete municipality', 7, 'delete_municipality'),
(28, 'Can view municipality', 7, 'view_municipality'),
(29, 'Can add administrative post', 8, 'add_administrativepost'),
(30, 'Can change administrative post', 8, 'change_administrativepost'),
(31, 'Can delete administrative post', 8, 'delete_administrativepost'),
(32, 'Can view administrative post', 8, 'view_administrativepost'),
(33, 'Can add parent', 9, 'add_parent'),
(34, 'Can change parent', 9, 'change_parent'),
(35, 'Can delete parent', 9, 'delete_parent'),
(36, 'Can view parent', 9, 'view_parent'),
(37, 'Can add parentcode', 10, 'add_parentcode'),
(38, 'Can change parentcode', 10, 'change_parentcode'),
(39, 'Can delete parentcode', 10, 'delete_parentcode'),
(40, 'Can view parentcode', 10, 'view_parentcode'),
(41, 'Can add student', 11, 'add_student'),
(42, 'Can change student', 11, 'change_student'),
(43, 'Can delete student', 11, 'delete_student'),
(44, 'Can view student', 11, 'view_student'),
(45, 'Can add student activity log', 12, 'add_studentactivitylog'),
(46, 'Can change student activity log', 12, 'change_studentactivitylog'),
(47, 'Can delete student activity log', 12, 'delete_studentactivitylog'),
(48, 'Can view student activity log', 12, 'view_studentactivitylog'),
(49, 'Can add student code', 13, 'add_studentcode'),
(50, 'Can change student code', 13, 'change_studentcode'),
(51, 'Can delete student code', 13, 'delete_studentcode'),
(52, 'Can view student code', 13, 'view_studentcode'),
(53, 'Can add suco', 14, 'add_suco'),
(54, 'Can change suco', 14, 'change_suco'),
(55, 'Can delete suco', 14, 'delete_suco'),
(56, 'Can view suco', 14, 'view_suco'),
(57, 'Can add village', 15, 'add_village'),
(58, 'Can change village', 15, 'change_village'),
(59, 'Can delete village', 15, 'delete_village'),
(60, 'Can view village', 15, 'view_village');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(44, 'pbkdf2_sha256$720000$QxEXggFdCeOkuC2LmhgcPb$YTYh9mkiN0foKyUxwQDfDEsnEwG86qbiDYJIRHBw03s=', '2024-12-16 07:38:47.509410', 0, '+67077121173', 'Januario', 'Costa', 'jcosta@ibi-worldwide.com', 0, 1, '2024-12-16 06:36:50.715251'),
(45, 'pbkdf2_sha256$720000$RoyRCeDkGTozLP4YAPVtIH$fKHHmlJRtWeRPdjHf23LOOky9mdM/GiW5u2vpFimeJU=', '2024-12-16 07:54:10.286511', 0, '+821099728401', 'Januario', 'Costa', '', 0, 1, '2024-12-16 07:10:20.069288'),
(46, 'pbkdf2_sha256$720000$PLadF3JYIGDIuHQyesCepl$y03mfmh7uOefDRcBD7wc7LaVDP6Tw3wfjvb8ngtbCNE=', NULL, 0, '+61421133796', 'Mark', 'Lamount', '', 0, 1, '2024-12-16 07:41:27.539599'),
(47, 'pbkdf2_sha256$720000$Y5Y0pArViQLSK0tBFo7yYQ$vJUwjcGWMCfXQWFWDoqTA7O5NcJ/PElHFed3dxp5Pmw=', NULL, 0, '+67077707438', 'Esterlita', 'Moniz', '', 0, 1, '2024-12-16 07:42:56.652182');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 41, 1),
(2, 42, 1),
(3, 43, 2),
(4, 44, 3),
(5, 45, 3),
(6, 46, 3),
(7, 47, 3);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-09-30 02:03:26.454917', '1', 'Lautem', 1, '[{\"added\": {}}]', 7, 1),
(2, '2024-09-30 02:03:27.611148', '1', 'Luro', 1, '[{\"added\": {}}]', 8, 1),
(3, '2024-09-30 02:03:28.700113', '1', 'Luro', 1, '[{\"added\": {}}]', 14, 1),
(4, '2024-09-30 02:03:30.850848', '1', 'Hailarin', 1, '[{\"added\": {}}]', 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(8, 'parentregistrationApp', 'administrativepost'),
(7, 'parentregistrationApp', 'municipality'),
(9, 'parentregistrationApp', 'parent'),
(10, 'parentregistrationApp', 'parentcode'),
(11, 'parentregistrationApp', 'student'),
(12, 'parentregistrationApp', 'studentactivitylog'),
(13, 'parentregistrationApp', 'studentcode'),
(14, 'parentregistrationApp', 'suco'),
(15, 'parentregistrationApp', 'village'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-09-30 01:59:26.269119'),
(2, 'auth', '0001_initial', '2024-09-30 01:59:26.799425'),
(3, 'admin', '0001_initial', '2024-09-30 01:59:26.930563'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-09-30 01:59:26.942583'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-09-30 01:59:26.959137'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-09-30 01:59:27.040083'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-09-30 01:59:27.105831'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-09-30 01:59:27.128731'),
(9, 'auth', '0004_alter_user_username_opts', '2024-09-30 01:59:27.142721'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-09-30 01:59:27.198868'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-09-30 01:59:27.206857'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-09-30 01:59:27.222865'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-09-30 01:59:27.250882'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-09-30 01:59:27.270867'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-09-30 01:59:27.289918'),
(16, 'auth', '0011_update_proxy_permissions', '2024-09-30 01:59:27.303455'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-09-30 01:59:27.319451'),
(18, 'parentregistrationApp', '0001_initial', '2024-09-30 01:59:28.184001'),
(19, 'sessions', '0001_initial', '2024-09-30 01:59:28.222038');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('gl2z4cwur8hrfnjfwmd4d6wl7ioqar05', '.eJxVjEEOwiAQRe_C2hBgBDou3fcMZAYGWzVtUtqV8e7apAvd_vfef6lE2zqkrcmSxqIuCow6_Y5M-SHTTsqdptus8zyty8h6V_RBm-7nIs_r4f4dDNSGb51N11VryXqs0SJEV31wFWvlQkxCAizxzL50AMFFQgzOGwQMwuCien8ADRQ36w:1tLcy8:ZmXa8cRrtyVsCyghPntaN9h1cgaIVyOb54hJw7ttwJY', '2024-12-26 06:46:40.517586'),
('i94ba546e0ihz3b9g0el7z106cvrbwz9', '.eJxVjM0OgjAQhN-lZ9OU4i7Fo3efodmfYlEDCYWT8d0tCQe9TCbzzczbRNrWHLeSljiquRg0p9-MSZ5p2oE-aLrPVuZpXUa2e8UetNjbrOl1Pbp_B5lKruuOG3TQep98n6ADDIO2dHZBeKiekVEEeg-hKgRtpGVCASUVdIHM5wvV3zgT:1swbXD:HXV8g2UmIyD5td1MxH9jh0cdSzPMOFEGY-_A7Z19Soo', '2024-10-18 06:11:27.955050'),
('j5fxjhshcwwaeylzwcbfe0l4m8zg0mwy', '.eJxVjDsOwjAQBe_iGlnOxr-lpOcM1jpe4wCypTipEHeHSCmgfTPzXiLQtpawdV7CnMRZjOL0u0WaHlx3kO5Ub01Ora7LHOWuyIN2eW2Jn5fD_Tso1Mu3JgQPYBQpoghDBvbZOzRZe88JR8hJWWINyhrLjrMbJqe9MqgRyVnx_gDVPTcx:1syhJQ:WQPNOy2xYx61eGxIpYPXS65LOy_R_nV_jPe5oMdFuT8', '2024-10-24 00:45:52.831978'),
('kmwgf2gbehnfi3970o1nuay8xzv1nsiw', '.eJxVjDsOwjAQBe_iGlnOxr-lpOcM1jpe4wCypTipEHeHSCmgfTPzXiLQtpawdV7CnMRZjOL0u0WaHlx3kO5Ub01Ora7LHOWuyIN2eW2Jn5fD_Tso1Mu3JgQPYBQpoghDBvbZOzRZe88JR8hJWWINyhrLjrMbJqe9MqgRyVnx_gDVPTcx:1sz3cd:yxgTNEDU3JH9-FV3uSNEjEXlqUHfQiF_mi6lDZJqSDA', '2024-10-25 00:35:11.793409'),
('nmuvwrr07n0thidf6rngio9o5a4wgokb', '.eJxVjEEOwiAQAP_C2RAosC0evfsGAuyuVA0kpT0Z_25qetDrzGReIsRtLWHrtIQZxVnoUZx-YYr5QXU3eI_11mRudV3mJPdEHrbLa0N6Xo72b1BiL99vcuwZrMnKM0PicVDs1QQmqYnIekegCQgGBgeakVijyWRs1IhJvD8N3ziu:1synnd:I2e3-VVygI02vOHizcGU4OErC5Letn75HCFVmB2ZeQA', '2024-10-24 07:41:29.463433'),
('rm3c8wqjmkdbbw7pbvq6kwq021xdtgkq', '.eJxVjDsOwjAQBe_iGlnOxr-lpOcM1jpe4wCypTipEHeHSCmgfTPzXiLQtpawdV7CnMRZjOL0u0WaHlx3kO5Ub01Ora7LHOWuyIN2eW2Jn5fD_Tso1Mu3JgQPYBQpoghDBvbZOzRZe88JR8hJWWINyhrLjrMbJqe9MqgRyVnx_gDVPTcx:1syLpO:rSLr69rwIRs0veARsNOjJloWpLtm5ZcLrU6MVT8d8P4', '2024-10-23 01:49:26.588517'),
('ybj552oyfhzl1txa3thfgtk1q72xvbi1', '.eJxVjEEOgjAQAP_Ss2nowkrr0TtvaLa7i0VNSSicjH9XEg56nZnMy0Ta1hy3qkucxFxMh-b0CxPxQ8tu5E7lNluey7pMye6JPWy1wyz6vB7t3yBTzfvXtXB2vQu9QhNEtREfPPsErF-IHoVRYERpOwYBbAmVxoA9klfuzPsD8Cc37w:1tN5ve:dO30wgCRdtiijr6-hwHClKRr5PBSTSLjFT8bj4JK31c', '2024-12-30 07:54:10.294518'),
('zfwzetmv1kwwq7s6qyl2sn5kswl7os3f', '.eJxVjEsOwiAUAO_C2hDKk59L9z0DeTxAqgaS0q6Md1eSLnQ7M5kX87hvxe89rX6J7MIkO_2ygPRIdYh4x3prnFrd1iXwkfDDdj63mJ7Xo_0bFOxlbI1Q2mSpBZE2JIKMTpKYzOQ0kEaHCsCSik5JsmRQAmC0X30OGVxm7w-7_zcb:1sv5na:i0l_FEl1ygeZdTm3jhrXb2zPENlVMVCyzSgCLS9Z4B8', '2024-10-14 02:06:06.292376');

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_administrativepost`
--

CREATE TABLE `parentregistrationapp_administrativepost` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `municipality_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_administrativepost`
--

INSERT INTO `parentregistrationapp_administrativepost` (`id`, `name`, `municipality_id`) VALUES
(1, 'Luro', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_municipality`
--

CREATE TABLE `parentregistrationapp_municipality` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_municipality`
--

INSERT INTO `parentregistrationapp_municipality` (`id`, `name`) VALUES
(1, 'Lautem');

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_parent`
--

CREATE TABLE `parentregistrationapp_parent` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `full_name` varchar(250) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `administrative_post_id` bigint(20) DEFAULT NULL,
  `municipality_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `suco_id` bigint(20) DEFAULT NULL,
  `village_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_parent`
--

INSERT INTO `parentregistrationapp_parent` (`id`, `first_name`, `last_name`, `full_name`, `phone`, `email`, `administrative_post_id`, `municipality_id`, `user_id`, `suco_id`, `village_id`) VALUES
(44, 'Januario', 'Costa', 'Januario Costa', '+67077121173', 'jcosta@ibi-worldwide.com', 1, 1, 44, 1, 1),
(45, 'Januario', 'Costa', 'Januario Costa', '+821099728401', '', 1, 1, 45, 1, 1),
(46, 'Mark', 'Lamount', 'Mark Lamount', '+61421133796', '', 1, 1, 46, 1, 1),
(47, 'Esterlita', 'Moniz', 'Esterlita Moniz', '+67077707438', '', 1, 1, 47, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_parentcode`
--

CREATE TABLE `parentregistrationapp_parentcode` (
  `id` bigint(20) NOT NULL,
  `code` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `parent_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_parentcode`
--

INSERT INTO `parentregistrationapp_parentcode` (`id`, `code`, `phone`, `parent_id`) VALUES
(44, 'JACO1173', '67077121173', 44),
(45, 'JACO8401', '821099728401', 45),
(46, 'MALA3796', '61421133796', 46),
(47, 'ESMO7438', '67077707438', 47);

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_student`
--

CREATE TABLE `parentregistrationapp_student` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `full_name` varchar(250) DEFAULT NULL,
  `year_birth` int(11) NOT NULL,
  `parent_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_studentactivitylog`
--

CREATE TABLE `parentregistrationapp_studentactivitylog` (
  `id` bigint(20) NOT NULL,
  `activity_type` varchar(250) NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `details` longtext DEFAULT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_studentcode`
--

CREATE TABLE `parentregistrationapp_studentcode` (
  `id` bigint(20) NOT NULL,
  `code` varchar(250) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_studentcode`
--

INSERT INTO `parentregistrationapp_studentcode` (`id`, `code`, `student_id`) VALUES
(4, 'JADA4', 4),
(11, 'DADA11', 11),
(15, 'LUPO15', 15),
(16, 'JOBA16', 16),
(18, 'JODA18', 18),
(19, 'TEDA19', 19);

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_suco`
--

CREATE TABLE `parentregistrationapp_suco` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `posto_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_suco`
--

INSERT INTO `parentregistrationapp_suco` (`id`, `name`, `posto_id`) VALUES
(1, 'Luro', 1);

-- --------------------------------------------------------

--
-- Table structure for table `parentregistrationapp_village`
--

CREATE TABLE `parentregistrationapp_village` (
  `id` bigint(20) NOT NULL,
  `name` varchar(250) NOT NULL,
  `suco_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parentregistrationapp_village`
--

INSERT INTO `parentregistrationapp_village` (`id`, `name`, `suco_id`) VALUES
(1, 'Hailarin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `parentregistrationapp_administrativepost`
--
ALTER TABLE `parentregistrationapp_administrativepost`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentregistrationAp_municipality_id_c584cce0_fk_parentreg` (`municipality_id`);

--
-- Indexes for table `parentregistrationapp_municipality`
--
ALTER TABLE `parentregistrationapp_municipality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parentregistrationapp_parent`
--
ALTER TABLE `parentregistrationapp_parent`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `parentregistrationAp_suco_id_a0e263ef_fk_parentreg` (`suco_id`),
  ADD KEY `parentregistrationAp_village_id_7b0b7226_fk_parentreg` (`village_id`),
  ADD KEY `parentregistrationAp_administrative_post__b7b0c7ec_fk_parentreg` (`administrative_post_id`),
  ADD KEY `parentregistrationAp_municipality_id_9847a07d_fk_parentreg` (`municipality_id`);

--
-- Indexes for table `parentregistrationapp_parentcode`
--
ALTER TABLE `parentregistrationapp_parentcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `parent_id` (`parent_id`);

--
-- Indexes for table `parentregistrationapp_student`
--
ALTER TABLE `parentregistrationapp_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentregistrationAp_parent_id_957619bf_fk_parentreg` (`parent_id`);

--
-- Indexes for table `parentregistrationapp_studentactivitylog`
--
ALTER TABLE `parentregistrationapp_studentactivitylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentregistrationAp_student_id_55396d6b_fk_parentreg` (`student_id`);

--
-- Indexes for table `parentregistrationapp_studentcode`
--
ALTER TABLE `parentregistrationapp_studentcode`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `student_id` (`student_id`);

--
-- Indexes for table `parentregistrationapp_suco`
--
ALTER TABLE `parentregistrationapp_suco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentregistrationAp_posto_id_5609a5ba_fk_parentreg` (`posto_id`);

--
-- Indexes for table `parentregistrationapp_village`
--
ALTER TABLE `parentregistrationapp_village`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parentregistrationAp_suco_id_2b594f06_fk_parentreg` (`suco_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `parentregistrationapp_administrativepost`
--
ALTER TABLE `parentregistrationapp_administrativepost`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parentregistrationapp_municipality`
--
ALTER TABLE `parentregistrationapp_municipality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parentregistrationapp_parent`
--
ALTER TABLE `parentregistrationapp_parent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `parentregistrationapp_parentcode`
--
ALTER TABLE `parentregistrationapp_parentcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `parentregistrationapp_student`
--
ALTER TABLE `parentregistrationapp_student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `parentregistrationapp_studentactivitylog`
--
ALTER TABLE `parentregistrationapp_studentactivitylog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `parentregistrationapp_studentcode`
--
ALTER TABLE `parentregistrationapp_studentcode`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `parentregistrationapp_suco`
--
ALTER TABLE `parentregistrationapp_suco`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `parentregistrationapp_village`
--
ALTER TABLE `parentregistrationapp_village`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `parentregistrationapp_administrativepost`
--
ALTER TABLE `parentregistrationapp_administrativepost`
  ADD CONSTRAINT `parentregistrationAp_municipality_id_c584cce0_fk_parentreg` FOREIGN KEY (`municipality_id`) REFERENCES `parentregistrationapp_municipality` (`id`);

--
-- Constraints for table `parentregistrationapp_parent`
--
ALTER TABLE `parentregistrationapp_parent`
  ADD CONSTRAINT `parentregistrationAp_administrative_post__b7b0c7ec_fk_parentreg` FOREIGN KEY (`administrative_post_id`) REFERENCES `parentregistrationapp_administrativepost` (`id`),
  ADD CONSTRAINT `parentregistrationAp_municipality_id_9847a07d_fk_parentreg` FOREIGN KEY (`municipality_id`) REFERENCES `parentregistrationapp_municipality` (`id`),
  ADD CONSTRAINT `parentregistrationAp_suco_id_a0e263ef_fk_parentreg` FOREIGN KEY (`suco_id`) REFERENCES `parentregistrationapp_suco` (`id`),
  ADD CONSTRAINT `parentregistrationAp_village_id_7b0b7226_fk_parentreg` FOREIGN KEY (`village_id`) REFERENCES `parentregistrationapp_village` (`id`),
  ADD CONSTRAINT `parentregistrationApp_parent_user_id_6330a70c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `parentregistrationapp_parentcode`
--
ALTER TABLE `parentregistrationapp_parentcode`
  ADD CONSTRAINT `parentregistrationAp_parent_id_80af4518_fk_parentreg` FOREIGN KEY (`parent_id`) REFERENCES `parentregistrationapp_parent` (`id`);

--
-- Constraints for table `parentregistrationapp_student`
--
ALTER TABLE `parentregistrationapp_student`
  ADD CONSTRAINT `parentregistrationAp_parent_id_957619bf_fk_parentreg` FOREIGN KEY (`parent_id`) REFERENCES `parentregistrationapp_parent` (`id`);

--
-- Constraints for table `parentregistrationapp_studentactivitylog`
--
ALTER TABLE `parentregistrationapp_studentactivitylog`
  ADD CONSTRAINT `parentregistrationAp_student_id_55396d6b_fk_parentreg` FOREIGN KEY (`student_id`) REFERENCES `parentregistrationapp_student` (`id`);

--
-- Constraints for table `parentregistrationapp_studentcode`
--
ALTER TABLE `parentregistrationapp_studentcode`
  ADD CONSTRAINT `parentregistrationAp_student_id_94661fa7_fk_parentreg` FOREIGN KEY (`student_id`) REFERENCES `parentregistrationapp_student` (`id`);

--
-- Constraints for table `parentregistrationapp_suco`
--
ALTER TABLE `parentregistrationapp_suco`
  ADD CONSTRAINT `parentregistrationAp_posto_id_5609a5ba_fk_parentreg` FOREIGN KEY (`posto_id`) REFERENCES `parentregistrationapp_administrativepost` (`id`);

--
-- Constraints for table `parentregistrationapp_village`
--
ALTER TABLE `parentregistrationapp_village`
  ADD CONSTRAINT `parentregistrationAp_suco_id_2b594f06_fk_parentreg` FOREIGN KEY (`suco_id`) REFERENCES `parentregistrationapp_suco` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
