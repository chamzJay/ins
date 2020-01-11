-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 26, 2019 at 07:21 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ins`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE IF NOT EXISTS `administrators` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `a_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `a_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `a_type` int(11) NOT NULL,
  `a_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `a_affilate` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `a_registered_by` int(11) DEFAULT NULL,
  `a_master_by` int(11) DEFAULT NULL,
  `a_admin_by` int(11) DEFAULT NULL,
  `a_updated_by` int(11) DEFAULT NULL,
  `a_updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `a_status` int(11) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `administrators`
--

INSERT INTO `administrators` (`a_id`, `a_username`, `a_password`, `a_name`, `a_type`, `a_register_date`, `a_affilate`, `a_registered_by`, `a_master_by`, `a_admin_by`, `a_updated_by`, `a_updated_date`, `a_status`) VALUES
(1, 'admin', '$2y$10$/I9MEz5RGC3mTJ4vj2EDs.B5D63XEw1/T.VMOWYBvGnh6snL7ExPW', 'System Admin', 4, '2018-08-23 17:58:28', '', NULL, NULL, NULL, NULL, '2019-12-19 06:02:18', 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_setting`
--

DROP TABLE IF EXISTS `admin_setting`;
CREATE TABLE IF NOT EXISTS `admin_setting` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT,
  `as_topup_limit` decimal(13,4) NOT NULL,
  `as_withdraw_limit` decimal(13,4) NOT NULL,
  `as_withdraw_service` decimal(13,4) NOT NULL,
  `as_trading_min` decimal(13,5) DEFAULT NULL,
  `as_trading_max` decimal(13,5) DEFAULT NULL,
  `as_updated_by` int(11) NOT NULL,
  `as_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `as_status` int(11) NOT NULL DEFAULT '1',
  `as_fund_payout_per` decimal(11,2) NOT NULL,
  `as_gp_expiry_date` int(11) NOT NULL,
  `as_share_rate` double(11,2) NOT NULL,
  `as_tranfee_per` float NOT NULL DEFAULT '0',
  `as_transfer_min_amount` float NOT NULL DEFAULT '0',
  `as_reward_amount` double(11,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`as_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_setting`
--

INSERT INTO `admin_setting` (`as_id`, `as_topup_limit`, `as_withdraw_limit`, `as_withdraw_service`, `as_trading_min`, `as_trading_max`, `as_updated_by`, `as_date`, `as_status`, `as_fund_payout_per`, `as_gp_expiry_date`, `as_share_rate`, `as_tranfee_per`, `as_transfer_min_amount`, `as_reward_amount`) VALUES
(1, '1.0000', '1.0000', '0.0000', '0.00000', '0.00000', 13, '2019-07-28 17:31:33', 1, '0.20', 5, 5.00, 0, 50, 120.00);

-- --------------------------------------------------------

--
-- Table structure for table `admin_types`
--

DROP TABLE IF EXISTS `admin_types`;
CREATE TABLE IF NOT EXISTS `admin_types` (
  `at_id` int(11) NOT NULL AUTO_INCREMENT,
  `at_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `at_lang` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_types`
--

INSERT INTO `admin_types` (`at_id`, `at_name`, `at_lang`) VALUES
(1, 'master', 'en'),
(2, 'admin', 'en'),
(3, 'reseller', 'en'),
(4, 'super master', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `announcement_1`
--

DROP TABLE IF EXISTS `announcement_1`;
CREATE TABLE IF NOT EXISTS `announcement_1` (
  `a1_id` int(11) NOT NULL AUTO_INCREMENT,
  `a1_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `a1_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `a1_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `a1_status` int(11) NOT NULL DEFAULT '1',
  `a1_created_by` int(11) NOT NULL,
  PRIMARY KEY (`a1_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_2`
--

DROP TABLE IF EXISTS `announcement_2`;
CREATE TABLE IF NOT EXISTS `announcement_2` (
  `a2_id` int(11) NOT NULL AUTO_INCREMENT,
  `a2_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `a2_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `a2_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `a2_status` int(11) NOT NULL DEFAULT '1',
  `a2_created_by` int(11) NOT NULL,
  PRIMARY KEY (`a2_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_data`
--

DROP TABLE IF EXISTS `chart_data`;
CREATE TABLE IF NOT EXISTS `chart_data` (
  `cd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cd_value` float NOT NULL,
  `cd_time` datetime NOT NULL,
  `cd_created_by` int(11) DEFAULT NULL,
  `config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chart_data`
--

INSERT INTO `chart_data` (`cd_id`, `cd_value`, `cd_time`, `cd_created_by`, `config_id`) VALUES
(2281, 0.01, '2019-07-22 10:05:00', 1, 2),
(2282, 0.023, '2019-07-22 10:10:00', 1, 2),
(2283, 0.028, '2019-07-22 10:15:00', 1, 2),
(2284, 0.0257, '2019-07-22 10:20:00', 1, 2),
(2285, 0.029, '2019-07-22 10:25:00', 1, 2),
(2286, 0.036, '2019-07-22 10:30:00', 1, 2),
(2287, 0.05, '2019-07-22 10:35:00', 1, 2),
(2288, 0.0477, '2019-07-22 10:40:00', 1, 2),
(2289, 0.06, '2019-07-22 10:45:00', 1, 2),
(2290, 0.063, '2019-07-22 10:50:00', 1, 2),
(2291, 0.065, '2019-07-22 10:55:00', 1, 2),
(2292, 0.0627, '2019-07-22 11:00:00', 1, 2),
(2293, 0.079, '2019-07-22 11:05:00', 1, 2),
(2294, 0.089, '2019-07-22 11:10:00', 1, 2),
(2295, 0.101, '2019-07-22 11:15:00', 1, 2),
(2296, 0.0987, '2019-07-22 11:20:00', 1, 2),
(2297, 0.109, '2019-07-22 11:25:00', 1, 2),
(2298, 0.109, '2019-07-22 11:30:00', 1, 2),
(2299, 0.123, '2019-07-22 11:35:00', 1, 2),
(2300, 0.1207, '2019-07-22 11:40:00', 1, 2),
(2301, 0.126, '2019-07-22 11:45:00', 1, 2),
(2302, 0.146, '2019-07-22 11:50:00', 1, 2),
(2303, 0.159, '2019-07-22 11:55:00', 1, 2),
(2304, 0.1567, '2019-07-22 12:00:00', 1, 2),
(2305, 0.17, '2019-07-22 12:05:00', 1, 2),
(2306, 0.178, '2019-07-22 12:10:00', 1, 2),
(2307, 0.181, '2019-07-22 12:15:00', 1, 2),
(2308, 0.1787, '2019-07-22 12:20:00', 1, 2),
(2309, 0.198, '2019-07-22 12:25:00', 1, 2),
(2310, 0.21, '2019-07-22 12:30:00', 1, 2),
(2311, 0.22, '2019-07-22 12:35:00', 1, 2),
(2312, 0.2177, '2019-07-22 12:40:00', 1, 2),
(2313, 0.222, '2019-07-22 12:45:00', 1, 2),
(2314, 0.225, '2019-07-22 12:50:00', 1, 2),
(2315, 0.228, '2019-07-22 12:55:00', 1, 2),
(2316, 0.2257, '2019-07-22 13:00:00', 1, 2),
(2317, 0.244, '2019-07-22 13:05:00', 1, 2),
(2318, 0.257, '2019-07-22 13:10:00', 1, 2),
(2319, 0.267, '2019-07-22 13:15:00', 1, 2),
(2320, 0.2647, '2019-07-22 13:20:00', 1, 2),
(2321, 0.273, '2019-07-22 13:25:00', 1, 2),
(2322, 0.276, '2019-07-22 13:30:00', 1, 2),
(2323, 0.279, '2019-07-22 13:35:00', 1, 2),
(2324, 0.2767, '2019-07-22 13:40:00', 1, 2),
(2325, 0.291, '2019-07-22 13:45:00', 1, 2),
(2326, 0.302, '2019-07-22 13:50:00', 1, 2),
(2327, 0.302, '2019-07-22 13:55:00', 1, 2),
(2328, 0.2997, '2019-07-22 14:00:00', 1, 2),
(2329, 0.304, '2019-07-22 14:05:00', 1, 2),
(2330, 0.312, '2019-07-22 14:10:00', 1, 2),
(2331, 0.315, '2019-07-22 14:15:00', 1, 2),
(2332, 0.3127, '2019-07-22 14:20:00', 1, 2),
(2333, 0.332, '2019-07-22 14:25:00', 1, 2),
(2334, 0.34, '2019-07-22 14:30:00', 1, 2),
(2335, 0.347, '2019-07-22 14:35:00', 1, 2),
(2336, 0.3447, '2019-07-22 14:40:00', 1, 2),
(2337, 0.35, '2019-07-22 14:45:00', 1, 2),
(2338, 0.361, '2019-07-22 14:50:00', 1, 2),
(2339, 0.377, '2019-07-22 14:55:00', 1, 2),
(2340, 0.3747, '2019-07-22 15:00:00', 1, 2),
(2341, 0.383, '2019-07-22 15:05:00', 1, 2),
(2342, 0.391, '2019-07-22 15:10:00', 1, 2),
(2343, 0.396, '2019-07-22 15:15:00', 1, 2),
(2344, 0.3937, '2019-07-22 15:20:00', 1, 2),
(2345, 0.406, '2019-07-22 15:25:00', 1, 2),
(2346, 0.413, '2019-07-22 15:30:00', 1, 2),
(2347, 0.426, '2019-07-22 15:35:00', 1, 2),
(2348, 0.4237, '2019-07-22 15:40:00', 1, 2),
(2349, 0.439, '2019-07-22 15:45:00', 1, 2),
(2350, 0.448, '2019-07-22 15:50:00', 1, 2),
(2351, 0.452, '2019-07-22 15:55:00', 1, 2),
(2352, 0.4497, '2019-07-22 16:00:00', 1, 2),
(2353, 0.467, '2019-07-22 16:05:00', 1, 2),
(2354, 0.484, '2019-07-22 16:10:00', 1, 2),
(2355, 0.496, '2019-07-22 16:15:00', 1, 2),
(2356, 0.4937, '2019-07-22 16:20:00', 1, 2),
(2357, 0.504, '2019-07-22 16:25:00', 1, 2),
(2358, 0.517, '2019-07-22 16:30:00', 1, 2),
(2359, 0.524, '2019-07-22 16:35:00', 1, 2),
(2360, 0.5217, '2019-07-22 16:40:00', 1, 2),
(2361, 0.533, '2019-07-22 16:45:00', 1, 2),
(2362, 0.54, '2019-07-22 16:50:00', 1, 2),
(2363, 0.559, '2019-07-22 16:55:00', 1, 2),
(2364, 0.5567, '2019-07-22 17:00:00', 1, 2),
(2365, 0.573, '2019-07-22 17:05:00', 1, 2),
(2366, 0.586, '2019-07-22 17:10:00', 1, 2),
(2367, 0.595, '2019-07-22 17:15:00', 1, 2),
(2368, 0.5927, '2019-07-22 17:20:00', 1, 2),
(2369, 0.602, '2019-07-22 17:25:00', 1, 2),
(2370, 0.609, '2019-07-22 17:30:00', 1, 2),
(2371, 0.616, '2019-07-22 17:35:00', 1, 2),
(2372, 0.6137, '2019-07-22 17:40:00', 1, 2),
(2373, 0.615, '2019-07-22 17:45:00', 1, 2),
(2374, 0.62, '2019-07-22 17:50:00', 1, 2),
(2375, 0.622, '2019-07-22 17:55:00', 1, 2),
(2376, 0.6197, '2019-07-22 18:00:00', 1, 2),
(2377, 0.637, '2019-07-22 18:05:00', 1, 2),
(2378, 0.653, '2019-07-22 18:10:00', 1, 2),
(2379, 0.672, '2019-07-22 18:15:00', 1, 2),
(2380, 0.6697, '2019-07-22 18:20:00', 1, 2),
(2381, 0.672, '2019-07-22 18:25:00', 1, 2),
(2382, 0.687, '2019-07-22 18:30:00', 1, 2),
(2383, 0.688, '2019-07-22 18:35:00', 1, 2),
(2384, 0.6857, '2019-07-22 18:40:00', 1, 2),
(2385, 0.699, '2019-07-22 18:45:00', 1, 2),
(2386, 0.719, '2019-07-22 18:50:00', 1, 2),
(2387, 0.727, '2019-07-22 18:55:00', 1, 2),
(2388, 0.7247, '2019-07-22 19:00:00', 1, 2),
(2389, 0.741, '2019-07-22 19:05:00', 1, 2),
(2390, 0.745, '2019-07-22 19:10:00', 1, 2),
(2391, 0.75, '2019-07-22 19:15:00', 1, 2),
(2392, 0.7477, '2019-07-22 19:20:00', 1, 2),
(2393, 0.752, '2019-07-22 19:25:00', 1, 2),
(2394, 0.767, '2019-07-22 19:30:00', 1, 2),
(2395, 0.779, '2019-07-22 19:35:00', 1, 2),
(2396, 0.7767, '2019-07-22 19:40:00', 1, 2),
(2397, 0.794, '2019-07-22 19:45:00', 1, 2),
(2398, 0.813, '2019-07-22 19:50:00', 1, 2),
(2399, 0.813, '2019-07-22 19:55:00', 1, 2),
(2400, 0.8107, '2019-07-22 20:00:00', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `c_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `c_lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`c_id`, `c_name`, `c_code`, `c_lang`) VALUES
(1, 'Thailand', '+66', 'en'),
(2, 'China', '+86', 'en'),
(3, 'Japan', '+81', 'en'),
(4, 'Malaysia', '+60', 'en'),
(5, 'Taiwan', '+886', 'en'),
(7, 'South Korea', '+82', 'en'),
(8, 'Singapore', '+65', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
CREATE TABLE IF NOT EXISTS `currency` (
  `cu_id` int(11) NOT NULL AUTO_INCREMENT,
  `cu_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cu_rate` decimal(13,8) NOT NULL,
  `cu_withdraw_rate` decimal(13,8) NOT NULL,
  `cu_decimal` int(11) NOT NULL,
  `cu_master_by` int(11) NOT NULL,
  `cu_type` int(11) NOT NULL,
  `cu_type_details` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cu_created_by` int(11) NOT NULL,
  `cu_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cu_updated_by` int(11) DEFAULT NULL,
  `cu_updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cu_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`cu_id`, `cu_name`, `cu_rate`, `cu_withdraw_rate`, `cu_decimal`, `cu_master_by`, `cu_type`, `cu_type_details`, `cu_created_by`, `cu_created_date`, `cu_updated_by`, `cu_updated_date`, `cu_status`) VALUES
(13, 'USD ($)', '1.00000000', '0.90000000', 2, 26, 1, 'å†œä¸šé“¶è¡Œ â€” å¹¿è¥¿å—å®é‡‘å‡¯æ”¯è¡Œ\r\nâ€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”\r\né—­ç¥–å›½\r\n6230-5208-3002-9803-572', 13, '2018-10-19 09:38:49', 13, '2019-07-08 15:27:29', 1),
(14, 'äººæ°‘å¸ï¼ˆÂ¥ï¼‰', '7.00000000', '6.00000000', 2, 23, 1, 'my account\r\n10000001000012929', 13, '2019-06-27 22:52:06', 13, '2019-07-28 17:11:01', 0),
(15, 'SGDï¼ˆ$)', '1.65000000', '1.25000000', 3, 29, 1, 'Please Contact your Leadership For Transfer Detail :', 13, '2019-06-28 22:12:27', 13, '2019-07-19 16:57:30', 1),
(16, 'äººæ°‘å¸ï¼ˆÂ¥ï¼‰', '7.00000000', '6.00000000', 2, 26, 1, 'å†œä¸šé“¶è¡Œ â€” å¹¿è¥¿å—å®é‡‘å‡¯æ”¯è¡Œ\r\nâ€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”â€”\r\né—­ç¥–å›½\r\n6230-5208-3002-9803-572', 13, '2019-07-04 03:45:26', 13, '2019-07-08 15:28:34', 1),
(17, 'USD($)', '1.00000000', '0.90000000', 2, 29, 2, 'Please Contact Your Leader For detail >', 13, '2019-07-11 19:34:50', NULL, '2019-07-11 19:34:50', 1),
(18, 'KRW (â‚©)', '1250.00000000', '1050.00000000', 2, 29, 1, 'Please Contact Your Leadership For Transfer Detail :', 13, '2019-07-12 12:51:38', 13, '2019-07-12 12:58:06', 1),
(19, 'BITCOIN', '0.00010531', '0.00010531', 8, 23, 2, '3MJyKQwnkdxhs2pmpjrWZKRBMZCRrkkthG', 13, '2019-07-22 23:25:19', 13, '2019-07-28 17:46:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `display_values`
--

DROP TABLE IF EXISTS `display_values`;
CREATE TABLE IF NOT EXISTS `display_values` (
  `dv_id` int(11) NOT NULL AUTO_INCREMENT,
  `dv_trader_value` decimal(13,4) NOT NULL,
  `dv_trader_percent` decimal(13,4) NOT NULL,
  `dv_trader_arrow` int(11) NOT NULL,
  `dv_rolling_value` decimal(13,4) NOT NULL,
  `dv_rolling_percent` decimal(13,4) NOT NULL,
  `dv_rolling_arrow` int(11) NOT NULL,
  `dv_partner_value` decimal(13,4) NOT NULL,
  `dv_partner_percent` decimal(13,4) NOT NULL,
  `dv_partner_arrow` int(11) NOT NULL,
  `dv_splits_value` decimal(13,4) NOT NULL,
  `dv_splits_percent` decimal(13,4) NOT NULL,
  `dv_splits_arrow` int(11) NOT NULL,
  `dv_current_trading` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dv_current_scrolling` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `dv_partner_joined` decimal(13,4) NOT NULL,
  `dv_max_partner` decimal(13,4) NOT NULL,
  `dv_trader_done` decimal(13,4) NOT NULL,
  `dv_max_trader_done` decimal(13,4) NOT NULL,
  `dv_scroll_unit_done` decimal(13,4) NOT NULL,
  `dv_max_scroll_unit_done` decimal(13,4) NOT NULL,
  `dv_bonus_splits` decimal(13,4) NOT NULL,
  `dv_max_bonus_splits` decimal(13,4) NOT NULL,
  `dv_updated_by` int(11) NOT NULL,
  `dv_update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `display_values`
--

INSERT INTO `display_values` (`dv_id`, `dv_trader_value`, `dv_trader_percent`, `dv_trader_arrow`, `dv_rolling_value`, `dv_rolling_percent`, `dv_rolling_arrow`, `dv_partner_value`, `dv_partner_percent`, `dv_partner_arrow`, `dv_splits_value`, `dv_splits_percent`, `dv_splits_arrow`, `dv_current_trading`, `dv_current_scrolling`, `dv_partner_joined`, `dv_max_partner`, `dv_trader_done`, `dv_max_trader_done`, `dv_scroll_unit_done`, `dv_max_scroll_unit_done`, `dv_bonus_splits`, `dv_max_bonus_splits`, `dv_updated_by`, `dv_update_date`) VALUES
(1, '0.0000', '0.0000', 0, '0.0000', '0.0000', 0, '0.0000', '0.0000', 0, '0.0000', '0.0000', 0, 'ðŸ”¥ðŸ”¥ The First A.I. Trader For Crypto Currency Market Option  !! ðŸ’°ðŸ’°ðŸ’°', '22/08/2019 10AM ~ 22PM', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-08-22 17:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `dividend`
--

DROP TABLE IF EXISTS `dividend`;
CREATE TABLE IF NOT EXISTS `dividend` (
  `div_id` int(11) NOT NULL AUTO_INCREMENT,
  `div_deposit_amount` decimal(65,8) NOT NULL,
  `div_deposit_id` int(11) NOT NULL,
  `div_deposit_by` int(11) NOT NULL,
  `div_level` int(11) NOT NULL,
  `div_bonus_amount` decimal(65,8) NOT NULL,
  `div_bonus_message` varchar(100) NOT NULL,
  `div_bonus_paid_to` int(11) NOT NULL,
  `div_percent` decimal(13,4) NOT NULL,
  `div_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `div_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`div_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `latest_news`
--

DROP TABLE IF EXISTS `latest_news`;
CREATE TABLE IF NOT EXISTS `latest_news` (
  `ln_id` int(11) NOT NULL AUTO_INCREMENT,
  `ln_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ln_date` datetime NOT NULL,
  `ln_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ln_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ln_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ln_status` int(11) NOT NULL DEFAULT '1',
  `ln_created_by` int(11) NOT NULL,
  PRIMARY KEY (`ln_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `latest_news`
--

INSERT INTO `latest_news` (`ln_id`, `ln_title`, `ln_date`, `ln_description`, `ln_pic`, `ln_link`, `ln_status`, `ln_created_by`) VALUES
(1, 'MG 3 - GRAND REWARDS FOR LEADER CHALLENGING', '2019-02-03 00:00:00', '@ GREAT LEADER MG 3 CAR REWARDS CHALLENGING PROGRAM !!\r\n\r\n** Term & Condition **\r\nComing Soon Announcement !!\r\n\r\nMore info , Please Contact Your Nearly Agency or Officer for Detail.\r\n\r\nThank you & good date \r\nSCG CAPITAL & Co Officer Team', '1549157058.jpg', 'kavinda.php', 0, 13),
(2, 'SCG VIP BUSINESS WELCOME TRIPS', '2018-10-01 17:44:00', '.\r\n**Dear All Value SCG VIP Memberships **\r\n\r\nTo Get Business Trips Promotions Ticket\r\n@ 14/02/2019 ~ 17/02/2019 [ 4 Date 3 Nite ]\r\nMore information Please Contact your Agency for Detail\r\n\r\nThank you & Good date\r\nscg management team', '1540014115.jpg', 'kavinda.php', 1, 13),
(3, '@ PROOF JUNKETS TRIPS [ RESORT WORLD ] MANILA', '2018-10-01 17:43:00', '.\r\n**Dear All Value  S CLUB 4 STAR Member **\r\n\r\nMore information Please Contact your Agency for Detail\r\n\r\nThank you & Good date\r\nscg management team', '1537253637.png', 'kavinda.php', 1, 13),
(4, 'Sample 02', '2019-06-12 08:47:00', '<p>KAVINDA INSHA</p>', '1560309432.jpg', 'kavinda.php', 1, 13),
(5, 'Sample 01', '2019-06-12 09:01:00', '<p>KAVINDA INUSHA</p>', '1560310297.jpg', 'kavinda.php', 1, 13);

-- --------------------------------------------------------

--
-- Table structure for table `lottoconfig`
--

DROP TABLE IF EXISTS `lottoconfig`;
CREATE TABLE IF NOT EXISTS `lottoconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enddate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `drawno` varchar(50) NOT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `lott_date` enum('Wednesday','Tuesday','Saturday') NOT NULL,
  `minnum` int(11) NOT NULL,
  `maxnum` int(11) NOT NULL,
  `colcnt` int(11) NOT NULL,
  `rowcnt` int(11) NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `created_id` int(11) NOT NULL DEFAULT '0',
  `updated_id` int(11) NOT NULL DEFAULT '0',
  `created_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_dt` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `factive` int(11) DEFAULT '0',
  `lotto_pic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lottoconfig`
--

INSERT INTO `lottoconfig` (`id`, `enddate`, `drawno`, `cat`, `lott_date`, `minnum`, `maxnum`, `colcnt`, `rowcnt`, `amount`, `created_id`, `updated_id`, `created_dt`, `updated_dt`, `factive`, `lotto_pic`) VALUES
(9, '2019-12-27 01:59:00', 'A111', 'lotto-1', 'Wednesday', 1, 9, 2, 3, 1, 0, 0, '2019-12-18 11:07:54', '2019-12-18 11:07:54', 1, '../../uploads/lotto/15766384741.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `lottodetails`
--

DROP TABLE IF EXISTS `lottodetails`;
CREATE TABLE IF NOT EXISTS `lottodetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `master_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT '0',
  `colm` varchar(50) DEFAULT NULL,
  `rowm` varchar(50) DEFAULT NULL,
  `acept` int(11) DEFAULT '0',
  `factive` bit(1) NOT NULL DEFAULT b'1',
  `reject` int(11) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=483 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `lottodetails`
--

INSERT INTO `lottodetails` (`id`, `number`, `master_id`, `amount`, `colm`, `rowm`, `acept`, `factive`, `reject`) VALUES
(475, 9, 138, 1, '1', '1', 0, b'0', 0),
(476, 5, 138, 1, '2', '1', 1, b'0', 0),
(477, 1, 138, 1, '1', '2', 1, b'1', 0),
(478, 7, 138, 1, '2', '2', 1, b'1', 0),
(479, 9, 138, 1, '1', '3', 1, b'1', 0),
(480, 5, 138, 1, '2', '3', 1, b'1', 0),
(481, 6, 138, 1, '1', '4', 1, b'1', 0),
(482, 8, 138, 1, '2', '4', 1, b'1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `lottomaster`
--

DROP TABLE IF EXISTS `lottomaster`;
CREATE TABLE IF NOT EXISTS `lottomaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refno` varchar(50) NOT NULL DEFAULT '0',
  `usrid` int(11) DEFAULT NULL,
  `config_id` int(11) NOT NULL,
  `colcnt` int(11) DEFAULT NULL,
  `rowcnt` int(11) DEFAULT NULL,
  `minnum` int(11) DEFAULT NULL,
  `maxnum` int(11) DEFAULT NULL,
  `factive` bit(1) NOT NULL DEFAULT b'1',
  `reject` varchar(255) NOT NULL DEFAULT '0',
  `acept` int(11) NOT NULL DEFAULT '0',
  `lt_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cat` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `lottomaster`
--

INSERT INTO `lottomaster` (`id`, `refno`, `usrid`, `config_id`, `colcnt`, `rowcnt`, `minnum`, `maxnum`, `factive`, `reject`, `acept`, `lt_created_date`, `cat`) VALUES
(138, 'A111-1', 798, 9, 2, 4, 1, 9, b'1', '0', 0, '2019-12-15 20:13:55', 'lotto-1');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_username` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_password` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_email` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_dob` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_phone_country` int(11) DEFAULT NULL,
  `m_phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_pic` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_otp` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_bank_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_bank_account_no` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_bank_branch` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_bitcoin` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_litecoin` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_lineid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_wechatid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_whatsapp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_register_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `m_end_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_referal` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_master_by` int(11) DEFAULT NULL,
  `m_admin_by` int(11) DEFAULT NULL,
  `m_reseller_by` int(11) DEFAULT NULL,
  `m_upline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_register_by` int(11) DEFAULT NULL,
  `m_updated_by` int(11) DEFAULT NULL,
  `m_updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `m_updated_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_status` int(11) DEFAULT '1',
  `m_address` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_act` datetime DEFAULT NULL,
  `m_lst_payreward` date DEFAULT NULL,
  `m_side` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_level` int(11) DEFAULT '0',
  `m_new_ref` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `m_currency` int(11) DEFAULT '0',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=822 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`m_id`, `m_username`, `m_password`, `m_email`, `m_name`, `m_dob`, `m_phone_country`, `m_phone`, `m_pic`, `m_otp`, `m_bank_name`, `m_bank_account_no`, `m_bank_branch`, `m_bitcoin`, `m_litecoin`, `m_lineid`, `m_wechatid`, `m_whatsapp`, `m_register_date`, `m_end_date`, `m_referal`, `m_master_by`, `m_admin_by`, `m_reseller_by`, `m_upline`, `m_register_by`, `m_updated_by`, `m_updated_date`, `m_updated_type`, `m_status`, `m_address`, `last_act`, `m_lst_payreward`, `m_side`, `m_type`, `m_level`, `m_new_ref`, `m_currency`) VALUES
(798, 'amila', '$2y$10$PmyxVa5ljsKyKb8IcrLUvuyxQtugKD.gUht63KjdyQ5ROpB7uBW9S', 'dsa.amilashanaka@gmail.com', 'Amila', '2019-11-08', NULL, '23423', '157735633515.jpg', '4681', 'ddd', '1322313', 'retretret', NULL, NULL, '3122432435345', NULL, '234324', '2019-11-04 09:11:00', NULL, NULL, NULL, NULL, 0, '800', NULL, NULL, '2019-12-26 18:32:14', NULL, 1, 'no 56576, la1  xxx, bbbb1', NULL, NULL, NULL, 'delegator', 0, '1234', 0),
(800, 'scgc', '$2y$10$Cg.YhRYbP7AJzsRFhg5o7.fhYR3hzbKK2Tv9/bVH5DxT7YIj88LAW', 'scgc2722@gmail.com', 'Scgc', NULL, NULL, '43254532', NULL, '7315', 'vhhh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-11-07 11:11:00', NULL, NULL, NULL, NULL, NULL, '798', NULL, NULL, '2019-12-24 16:23:03', NULL, 1, NULL, NULL, NULL, NULL, 'delegator', 2, NULL, 0),
(802, 'eewde', '$2y$10$mHqZTnqDKz//zJaAzuMzSeHdcDOufX0fLt5tKzDVQvJS2u3yxZMAa', NULL, 'wfewf', NULL, NULL, '123123', NULL, '2157', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-07 10:12:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-24 16:23:11', NULL, 1, NULL, NULL, NULL, NULL, 'delegator', 1, '8898', 0),
(803, 'xxx', '$2y$10$tb3Wp20s79z6e8YUwfFhMOcsPLDxJ3QxzxPyUxREMgpERu.aVhB4q', NULL, 'wefewfw', NULL, NULL, '1231234', '157570632059.jpg', '9392', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-07 10:12:00', NULL, NULL, NULL, NULL, NULL, '800', NULL, NULL, '2019-12-12 21:24:38', NULL, 1, NULL, NULL, NULL, NULL, 'Player', 3, '2175', 0),
(804, 'saman', '$2y$10$WCnHITaaD7dtbsZ.xYEmZ.X9l0oqxEBr3vlCFeHj7uoLhM95UtP8S', NULL, 'wfef', NULL, NULL, '12323434324', NULL, '4372', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-07 02:12:00', NULL, NULL, NULL, NULL, NULL, '798', NULL, NULL, '2019-12-14 13:00:05', NULL, 1, NULL, NULL, NULL, NULL, 'Player', 2, '6472', 0),
(805, 'dewdewdew', '$2y$10$FA2VW2KnOsHyQh4y5Rynx.cqOmtm.whyxEbfY6n6wEekdAk1nhLkm', 'sdfshanaka@gmail.com', 'svdsvevewver', NULL, NULL, '0777548249', NULL, '3764', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-08 06:12:00', NULL, NULL, NULL, NULL, NULL, 'amilas', NULL, NULL, '2019-12-14 13:05:43', NULL, 1, NULL, NULL, NULL, NULL, 'Player', 2, '3909', 0),
(806, 'user1', '$2y$10$SSp.jlfjaokcM/KHPIZ.QeP0z358eehvUkpVZDs3GfFiyLa1JfL4W', 'asda@gm.com', 'user sample', '', NULL, '09090', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:06:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:06:06', NULL, 1, '', NULL, NULL, NULL, NULL, 0, NULL, 0),
(807, 'user2', '$2y$10$QQrcidogEDDhL2PVfDsPAuoFUDbb0nmNB1jM96AjI9m5xU4S7uxgC', 'user10@scg.com', 'user2', '', NULL, '878787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:09:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:09:41', NULL, 1, '', NULL, NULL, NULL, '', 0, NULL, 0),
(808, 'user11', '$2y$10$2d0g6WCM37LT.MjtO7qapeBfXL1GaSgQ8kPELZr9ll8aoDlmyxsY.', 'users10@scg.com', 'user21', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:11:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 13:04:50', NULL, 0, '', NULL, NULL, NULL, '', 0, NULL, 0),
(809, 'user17', '$2y$10$Z.IiE/1YnJMkTrOt8JzJr.ISbQiMSv5oIN4hPavcumxC1F1sjVBEK', 'asda@gm.com', 'user sample', '', NULL, '23424324', '157615044365.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:15:05', NULL, NULL, NULL, NULL, NULL, '798', NULL, NULL, '2019-12-14 12:58:17', NULL, 1, '', NULL, NULL, NULL, 'Player', 0, NULL, 0),
(810, 'user27', '$2y$10$/AoDBrsTGaP0IzlfItCwg.Vz6QLxsSi7NPGAcHa2bRK8drTZ5.scK', 'seeeaxsax@gmail.com', 'SAdwqd', '', NULL, '', '1576138864.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-12 16:21:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 17:30:27', NULL, 0, '', NULL, NULL, NULL, 'Player', 0, NULL, 0),
(811, 'user14', '$2y$10$hAVtB4VQVm59X7lQiEM05OAq04Tj.N9Ls/SJYya2jl2eRCz/TO.Vy', 'user14@scg.com', 'User14 Name', '2019-12-27', NULL, '123122', '1576624413.jpg', '1233', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-18 07:13:32', NULL, NULL, NULL, NULL, NULL, '798', NULL, NULL, '2019-12-18 07:20:58', NULL, 1, 'werwerew', NULL, NULL, NULL, 'Player', 0, '5678', 0),
(812, 'usert1', '$2y$10$aGe.UcjAC84GrujuUn1IgeIDzJxalWzhcAC7HXd1wD4AJiCIjGNjS', '', '', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 05:45:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 05:45:47', NULL, 1, '', NULL, NULL, NULL, '', 0, NULL, 0),
(813, 'wert', '$2y$10$vRgf1W2ms6HDjNUcLZWETOdexVAFKW1726O5H567u8MLhf8pasGRy', 'wfwefw@gmail.com', '', '2019-12-28', NULL, '23423', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 06:29:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 06:29:33', NULL, 1, 'ssfsdfs', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(814, 'dg1', '$2y$10$PYhqSpbs4jaCIa0yj2GmfuVsOsuONWH4f5.nI/eZ0VJ.pbZbKb3we', 'dg@dg.com', '', '2019-12-13', NULL, '23423', '../../uploads/profile/15772266531.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 06:30:53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 08:02:05', NULL, 1, 'ssfsdfs', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(815, 'dg2', '$2y$10$Hc35rx3g3hcdqr8XBkGFOeEfwdL6mJK07CpHYsjJosV3NGMYwksVq', 'wfwefw@gmail.com', '', '2019-12-21', NULL, '23423', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:20:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:20:58', NULL, 1, 'ssfsdfs', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(816, 'dg3', '$2y$10$1tNUvyv2bAkjbxNbn0rkN.8sDoC6Kyt0Tm7qn8uQTnAtbwuXTyVMC', '', '', '', NULL, '', '../../uploads/profile/15772296941.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:21:34', NULL, NULL, NULL, NULL, NULL, '812', NULL, NULL, '2019-12-25 07:24:05', NULL, 1, '', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(817, 'dg4', '$2y$10$CpO3gazuuAbYEwDH9TWFAeKLMD3mvNH3i4FcX8nuwz2lFQVpxT.tC', 'dg@dg.com', '', '2019-12-07', NULL, '23423', '../../uploads/profile/15772314691.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:51:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:51:09', NULL, 1, '24234', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(818, 'dg5', '$2y$10$soCr5yJrWcmIFTWbv9M5KecyXC17ox8HxFgl5DH66AophvGCM6hJ2', 'wfwefw@gmail.com', '', '2019-12-19', NULL, '23423', '../../uploads/profile/15772316211.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:53:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:53:41', NULL, 1, 'ssfsdfs', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(819, 'dg6', '$2y$10$NA2pepzBPUpvGc/vntWGyevntdNTh/i6E7et7P.CGhbMq5rJ3fKR.', 'dg@dg.com', '', '2019-12-21', NULL, '23423', '../../uploads/profile/15772317401.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:55:40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:55:40', NULL, 1, 'ssfsdfs', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(820, 'dg7', '$2y$10$iB1Fqtkb2tAHLPX/rgRZLeu/CsWYH5DpCc08bkxtkNofwsxITBZC.', 'wfwefw@gmail.com', '', '', NULL, '', '../../uploads/profile/15772319751.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:59:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-25 07:59:35', NULL, 1, '3444444453', NULL, NULL, NULL, 'delegator', 0, NULL, 0),
(821, 'us1', '$2y$10$lsV2o8g19gegONGAGNS9Qubs1iYO0nctcttRXq2Ic67KoAmgUZ6Zm', 'wfwefw@gmail.com', 'DG1 Name ', '2019-12-12', NULL, '23423', '../../uploads/profile/15772329781.jpg', NULL, 'cimb', '77979799', 'kl', NULL, NULL, '99977', NULL, '23432', '2019-12-25 08:16:18', NULL, NULL, NULL, NULL, NULL, '817', NULL, NULL, '2019-12-25 11:19:58', NULL, 1, '34324', NULL, NULL, NULL, 'user', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_capital_tranfer`
--

DROP TABLE IF EXISTS `member_capital_tranfer`;
CREATE TABLE IF NOT EXISTS `member_capital_tranfer` (
  `mct_id` int(11) NOT NULL AUTO_INCREMENT,
  `mct_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mct_member_id` int(11) NOT NULL,
  `mct_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mct_amount` decimal(13,4) NOT NULL DEFAULT '0.0000',
  `mct_fundamt` decimal(13,4) NOT NULL DEFAULT '0.0000',
  `mct_service` decimal(13,4) NOT NULL DEFAULT '0.0000',
  `mct_actual_amount` decimal(13,4) DEFAULT '0.0000',
  `mct_status` int(11) NOT NULL DEFAULT '0',
  `mct_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mct_approved_by` int(11) DEFAULT NULL,
  `mct_approved_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mct_message` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mct_method` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_deposit`
--

DROP TABLE IF EXISTS `member_deposit`;
CREATE TABLE IF NOT EXISTS `member_deposit` (
  `md_id` int(11) NOT NULL AUTO_INCREMENT,
  `md_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `md_member` int(11) NOT NULL,
  `md_package` int(11) DEFAULT NULL,
  `md_amount` decimal(65,8) NOT NULL,
  `md_currency` int(11) NOT NULL,
  `md_slip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `md_actual_amount` decimal(65,8) NOT NULL DEFAULT '0.00000000',
  `md_rewards_percent` decimal(13,4) DEFAULT NULL,
  `md_rewards_amount` decimal(65,8) DEFAULT NULL,
  `md_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `md_expiry` datetime NOT NULL,
  `md_status` int(11) NOT NULL DEFAULT '0',
  `md_approved_by` int(11) DEFAULT NULL,
  `md_approved_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `md_message` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md_depost_type` int(11) NOT NULL DEFAULT '0',
  `md_fund_amount` decimal(10,0) NOT NULL DEFAULT '0',
  `md_actual_dp_amount` decimal(10,0) NOT NULL DEFAULT '0',
  `m_flg_game` int(11) NOT NULL DEFAULT '0',
  `md_flg_gfund` int(11) NOT NULL DEFAULT '0',
  `md_reward_expdt` datetime DEFAULT NULL,
  `md_debit_reward_amount` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`md_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1329 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_deposit`
--

INSERT INTO `member_deposit` (`md_id`, `md_reference`, `md_member`, `md_package`, `md_amount`, `md_currency`, `md_slip`, `md_type`, `md_actual_amount`, `md_rewards_percent`, `md_rewards_amount`, `md_date`, `md_expiry`, `md_status`, `md_approved_by`, `md_approved_date`, `md_message`, `md_depost_type`, `md_fund_amount`, `md_actual_dp_amount`, `m_flg_game`, `md_flg_gfund`, `md_reward_expdt`, `md_debit_reward_amount`) VALUES
(1323, 'GP000001', 803, 1, '1000.00000000', 13, '1576156252.jpg', 'Topup', '1000.00000000', NULL, NULL, '2019-12-12 21:10:52', '1970-01-01 00:00:00', 0, 13, '2019-12-15 08:34:15', '', 1, '0', '1000', 0, 0, NULL, '0.00'),
(1324, 'GP001324', 800, 1, '1000.00000000', 13, '1576156819.jpg', 'Topup', '1000.00000000', NULL, NULL, '2019-12-12 21:20:19', '1970-01-01 00:00:00', 1, 13, '2019-12-15 08:38:30', '', 1, '0', '1000', 0, 0, NULL, '0.00'),
(1325, 'GP001325', 798, 1, '1000.00000000', 13, '1576157330.jpg', 'Topup', '20.00000000', NULL, NULL, '2019-12-12 21:28:50', '1970-01-01 00:00:00', 1, 13, '2019-12-15 17:19:12', '', 1, '0', '1000', 0, 0, NULL, '0.00'),
(1328, 'GP001328', 798, 1, '1000.00000000', 13, '1576292328.jpg', 'Topup', '1000.00000000', NULL, NULL, '2019-12-14 10:58:48', '1970-01-01 00:00:00', 0, 13, '2019-12-15 17:18:59', '', 1, '0', '1000', 0, 0, NULL, '0.00');

-- --------------------------------------------------------

--
-- Table structure for table `member_deposit_renew`
--

DROP TABLE IF EXISTS `member_deposit_renew`;
CREATE TABLE IF NOT EXISTS `member_deposit_renew` (
  `mdr_id` int(11) NOT NULL AUTO_INCREMENT,
  `mdr_desposit_id` int(11) NOT NULL,
  `mdr_member_id` int(11) NOT NULL,
  `mdr_amount` decimal(13,4) NOT NULL,
  `mdr_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mdr_created_by` int(11) NOT NULL,
  `mdr_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_eshare`
--

DROP TABLE IF EXISTS `member_eshare`;
CREATE TABLE IF NOT EXISTS `member_eshare` (
  `mges_id` int(11) NOT NULL AUTO_INCREMENT,
  `mges_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mges_member_id` int(11) NOT NULL,
  `mges_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mges_amount` decimal(13,4) NOT NULL,
  `mges_status` int(11) NOT NULL DEFAULT '1',
  `mges_issue_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mges_unit` int(11) NOT NULL,
  `mges_approved_by` int(11) NOT NULL,
  `mges_approved_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mges_message` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mges_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_gf_transfer`
--

DROP TABLE IF EXISTS `member_gf_transfer`;
CREATE TABLE IF NOT EXISTS `member_gf_transfer` (
  `mgft_id` int(11) NOT NULL AUTO_INCREMENT,
  `mgft_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mgft_member_id` int(11) NOT NULL,
  `mgft_type` int(11) NOT NULL,
  `mgft_amount` decimal(13,4) NOT NULL,
  `mgft_status` int(11) NOT NULL DEFAULT '1',
  `mgft_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mgtf_percentage` decimal(10,0) NOT NULL,
  PRIMARY KEY (`mgft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_package`
--

DROP TABLE IF EXISTS `member_package`;
CREATE TABLE IF NOT EXISTS `member_package` (
  `mp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mp_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mp_price_dollar` decimal(13,4) NOT NULL,
  `mp_price_rc` decimal(13,4) NOT NULL,
  `mp_ratio_bp` decimal(13,4) NOT NULL,
  `mp_unfrozen` int(11) NOT NULL,
  `mp_robot` int(11) NOT NULL,
  `mp_closed_account` int(11) NOT NULL,
  `mp_bonus_level` int(11) DEFAULT NULL,
  `mp_register_by` int(11) NOT NULL,
  `mp_register_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mp_pic` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mp_expiry` int(11) NOT NULL,
  `mp_rewards_percent` decimal(13,4) DEFAULT '0.0000',
  `mp_rewards_start` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mp_rewards_end` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mp_referal_1` decimal(13,4) DEFAULT NULL,
  `mp_referal_2` decimal(13,4) DEFAULT NULL,
  `mp_referal_3` decimal(13,4) DEFAULT NULL,
  `mp_referal_4` decimal(13,4) DEFAULT NULL,
  `mp_referal_5` decimal(13,4) DEFAULT NULL,
  `mp_referal_6` decimal(13,4) DEFAULT NULL,
  `mp_referal_7` decimal(13,4) DEFAULT NULL,
  `mp_referal_8` decimal(13,4) DEFAULT NULL,
  `mp_referal_9` decimal(13,4) DEFAULT NULL,
  `mp_referal_10` decimal(13,4) DEFAULT NULL,
  `mp_referal_11` decimal(13,4) DEFAULT NULL,
  `mp_referal_12` decimal(13,4) DEFAULT NULL,
  `mp_referal_13` decimal(13,4) DEFAULT NULL,
  `mp_referal_14` decimal(13,4) DEFAULT NULL,
  `mp_referal_15` decimal(13,4) DEFAULT NULL,
  `mp_referal_16` decimal(13,4) DEFAULT NULL,
  `mp_referal_17` decimal(13,4) DEFAULT NULL,
  `mp_referal_18` decimal(13,4) DEFAULT NULL,
  `mp_referal_19` decimal(13,4) DEFAULT NULL,
  `mp_referal_20` decimal(13,4) DEFAULT NULL,
  `mp_referal_21` decimal(13,4) DEFAULT NULL,
  `mp_referal_registered_by` int(11) DEFAULT NULL,
  `mp_referal_registered_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mp_updated_by` int(11) DEFAULT NULL,
  `mp_updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mp_status` int(11) NOT NULL DEFAULT '1',
  `mp_order` int(11) NOT NULL,
  `mp_payoutx` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_package`
--

INSERT INTO `member_package` (`mp_id`, `mp_name`, `mp_price_dollar`, `mp_price_rc`, `mp_ratio_bp`, `mp_unfrozen`, `mp_robot`, `mp_closed_account`, `mp_bonus_level`, `mp_register_by`, `mp_register_date`, `mp_pic`, `mp_expiry`, `mp_rewards_percent`, `mp_rewards_start`, `mp_rewards_end`, `mp_referal_1`, `mp_referal_2`, `mp_referal_3`, `mp_referal_4`, `mp_referal_5`, `mp_referal_6`, `mp_referal_7`, `mp_referal_8`, `mp_referal_9`, `mp_referal_10`, `mp_referal_11`, `mp_referal_12`, `mp_referal_13`, `mp_referal_14`, `mp_referal_15`, `mp_referal_16`, `mp_referal_17`, `mp_referal_18`, `mp_referal_19`, `mp_referal_20`, `mp_referal_21`, `mp_referal_registered_by`, `mp_referal_registered_date`, `mp_updated_by`, `mp_updated_date`, `mp_status`, `mp_order`, `mp_payoutx`) VALUES
(1, 'STAR', '80.0000', '120.0000', '100.0000', 365, 1, 1, 3, 13, '2019-06-26 22:15:33', '1564287784.png', 365, '0.0000', '', '', '5.0000', '3.0000', '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-26 22:15:33', 13, '2019-12-10 09:33:31', 1, 7, 0),
(2, '1 STAR', '240.0000', '480.0000', '100.0000', 365, 1, 1, 6, 13, '2019-06-28 21:45:05', '1575941654.jpg', 365, '0.0000', '', '', '5.0000', '3.0000', '2.0000', '1.0000', '0.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:45:05', 13, '2019-12-10 09:34:14', 1, 2, 0),
(3, '2 STAR', '960.0000', '1440.0000', '100.0000', 365, 1, 1, 7, 13, '2019-06-28 21:48:26', '', 365, '0.0000', '', '', '5.0000', '4.0000', '3.0000', '2.0000', '1.0000', '0.5000', '0.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '1.0000', 13, '2019-06-28 21:48:26', 13, '2019-12-11 12:57:44', 1, 3, 0),
(4, '3 STAR', '2880.0000', '4320.0000', '100.0000', 365, 1, 1, 10, 13, '2019-06-28 21:49:32', '', 365, '0.0000', '', '', '8.0000', '5.0000', '4.0000', '3.0000', '2.0000', '1.0000', '1.0000', '0.5000', '0.5000', '0.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:49:32', 13, '2019-07-21 03:20:58', 1, 4, 0),
(5, '4 STAR', '5760.0000', '8640.0000', '100.0000', 365, 1, 1, 13, 13, '2019-06-28 21:51:19', '', 365, '0.0000', '', '', '10.0000', '8.0000', '6.0000', '5.0000', '4.0000', '3.0000', '2.0000', '1.0000', '1.0000', '1.0000', '0.5000', '0.5000', '0.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:51:19', 13, '2019-07-21 03:21:08', 1, 5, 0),
(6, '5 STAR', '11520.0000', '17280.0000', '100.0000', 365, 1, 1, 15, 13, '2019-06-28 21:52:08', '', 365, '0.0000', '', '', '12.0000', '10.0000', '8.0000', '6.0000', '4.0000', '3.0000', '2.0000', '2.0000', '1.0000', '1.0000', '1.0000', '0.5000', '0.5000', '0.5000', '0.5000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:52:08', 13, '2019-07-21 03:21:17', 1, 6, 0),
(7, '6 STAR', '23040.0000', '34560.0000', '100.0000', 365, 1, 1, 18, 13, '2019-06-28 21:53:08', '', 365, '0.0000', '', '', '15.0000', '12.0000', '8.0000', '7.0000', '6.0000', '5.0000', '4.0000', '3.0000', '3.0000', '2.0000', '2.0000', '1.0000', '1.0000', '0.5000', '0.5000', '0.5000', '0.5000', '0.5000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:53:08', 13, '2019-07-21 03:21:28', 1, 7, 0),
(8, '7 STAR', '46080.0000', '69120.0000', '100.0000', 365, 1, 1, 18, 13, '2019-06-28 21:53:54', '', 365, '0.0000', '', '', '20.0000', '15.0000', '12.0000', '10.0000', '8.0000', '7.0000', '6.0000', '5.0000', '5.0000', '3.0000', '3.0000', '3.0000', '2.0000', '2.0000', '2.0000', '1.0000', '1.0000', '1.0000', '0.0000', '0.0000', '0.0000', 13, '2019-06-28 21:53:54', 13, '2019-12-11 15:23:38', 1, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_referal_bonus`
--

DROP TABLE IF EXISTS `member_referal_bonus`;
CREATE TABLE IF NOT EXISTS `member_referal_bonus` (
  `rb_id` int(11) NOT NULL AUTO_INCREMENT,
  `rb_deposit_amount` decimal(65,8) NOT NULL,
  `rb_deposit_id` int(11) NOT NULL,
  `rb_deposit_by` int(11) NOT NULL,
  `rb_level` int(11) NOT NULL,
  `rb_bonus_amount` decimal(65,8) NOT NULL,
  `rb_bonus_message` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rb_bonus_paid_to` int(11) NOT NULL,
  `rb_percent` decimal(13,4) NOT NULL,
  `rb_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rb_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_referal_bonus`
--

INSERT INTO `member_referal_bonus` (`rb_id`, `rb_deposit_amount`, `rb_deposit_id`, `rb_deposit_by`, `rb_level`, `rb_bonus_amount`, `rb_bonus_message`, `rb_bonus_paid_to`, `rb_percent`, `rb_date`, `rb_status`) VALUES
(26, '1000.00000000', 1325, 798, 2, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-13 13:12:47', 1),
(27, '1000.00000000', 1325, 798, 4, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-13 13:12:47', 1),
(28, '1000.00000000', 1325, 798, 6, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-13 13:12:47', 1),
(29, '1000.00000000', 1325, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(30, '1000.00000000', 1325, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(31, '1000.00000000', 1325, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(32, '1000.00000000', 1325, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(33, '1000.00000000', 1325, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(34, '1000.00000000', 1325, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(35, '1000.00000000', 1325, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:12:47', 1),
(36, '1000.00000000', 1324, 800, 1, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-13 13:26:46', 1),
(37, '1000.00000000', 1324, 800, 3, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-13 13:26:46', 1),
(38, '1000.00000000', 1324, 800, 5, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-13 13:26:46', 1),
(39, '1000.00000000', 1324, 800, 7, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-13 13:26:46', 1),
(40, '1000.00000000', 1324, 800, 9, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(41, '1000.00000000', 1324, 800, 11, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(42, '1000.00000000', 1324, 800, 13, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(43, '1000.00000000', 1324, 800, 15, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(44, '1000.00000000', 1324, 800, 17, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(45, '1000.00000000', 1324, 800, 19, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:26:46', 1),
(46, '1000.00000000', 1324, 800, 21, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-13 13:26:46', 1),
(47, '1000.00000000', 1323, 803, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-13 13:27:08', 1),
(48, '1000.00000000', 1323, 803, 2, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-13 13:27:08', 1),
(49, '1000.00000000', 1323, 803, 4, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-13 13:27:08', 1),
(50, '1000.00000000', 1323, 803, 6, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-13 13:27:08', 1),
(51, '1000.00000000', 1323, 803, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(52, '1000.00000000', 1323, 803, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(53, '1000.00000000', 1323, 803, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(54, '1000.00000000', 1323, 803, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(55, '1000.00000000', 1323, 803, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(56, '1000.00000000', 1323, 803, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(57, '1000.00000000', 1323, 803, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-13 13:27:08', 1),
(58, '1000.00000000', 1328, 798, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-14 10:59:22', 1),
(59, '1000.00000000', 1328, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 10:59:22', 1),
(60, '1000.00000000', 1328, 798, 3, '30.00000000', 'exact bonus', 800, '3.0000', '2019-12-14 10:59:22', 1),
(61, '1000.00000000', 1328, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 10:59:22', 1),
(62, '1000.00000000', 1328, 798, 5, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 10:59:22', 1),
(63, '1000.00000000', 1328, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 10:59:22', 1),
(64, '1000.00000000', 1328, 798, 7, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 10:59:22', 1),
(65, '1000.00000000', 1328, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 10:59:22', 1),
(66, '1000.00000000', 1328, 798, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(67, '1000.00000000', 1328, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 10:59:22', 1),
(68, '1000.00000000', 1328, 798, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(69, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 10:59:22', 1),
(70, '1000.00000000', 1328, 798, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(71, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 10:59:22', 1),
(72, '1000.00000000', 1328, 798, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(73, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 10:59:22', 1),
(74, '1000.00000000', 1328, 798, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(75, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 10:59:22', 1),
(76, '1000.00000000', 1328, 798, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 10:59:22', 1),
(77, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 10:59:22', 1),
(78, '1000.00000000', 1328, 798, 21, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 10:59:22', 1),
(79, '1000.00000000', 1328, 798, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-14 11:24:22', 1),
(80, '1000.00000000', 1328, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:24:22', 1),
(81, '1000.00000000', 1328, 798, 3, '30.00000000', 'exact bonus', 800, '3.0000', '2019-12-14 11:24:22', 1),
(82, '1000.00000000', 1328, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:24:22', 1),
(83, '1000.00000000', 1328, 798, 5, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:24:22', 1),
(84, '1000.00000000', 1328, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:24:22', 1),
(85, '1000.00000000', 1328, 798, 7, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 11:24:22', 1),
(86, '1000.00000000', 1328, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:24:22', 1),
(87, '1000.00000000', 1328, 798, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(88, '1000.00000000', 1328, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:24:22', 1),
(89, '1000.00000000', 1328, 798, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(90, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:24:22', 1),
(91, '1000.00000000', 1328, 798, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(92, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:24:22', 1),
(93, '1000.00000000', 1328, 798, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(94, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:24:22', 1),
(95, '1000.00000000', 1328, 798, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(96, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:24:22', 1),
(97, '1000.00000000', 1328, 798, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:24:22', 1),
(98, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:24:22', 1),
(99, '1000.00000000', 1328, 798, 21, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:24:22', 1),
(100, '1000.00000000', 1328, 798, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-14 11:26:06', 1),
(101, '1000.00000000', 1328, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:26:06', 1),
(102, '1000.00000000', 1328, 798, 3, '30.00000000', 'exact bonus', 800, '3.0000', '2019-12-14 11:26:06', 1),
(103, '1000.00000000', 1328, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:26:06', 1),
(104, '1000.00000000', 1328, 798, 5, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:26:06', 1),
(105, '1000.00000000', 1328, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:26:06', 1),
(106, '1000.00000000', 1328, 798, 7, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 11:26:06', 1),
(107, '1000.00000000', 1328, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:26:06', 1),
(108, '1000.00000000', 1328, 798, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(109, '1000.00000000', 1328, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:26:06', 1),
(110, '1000.00000000', 1328, 798, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(111, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:26:06', 1),
(112, '1000.00000000', 1328, 798, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(113, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:26:06', 1),
(114, '1000.00000000', 1328, 798, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(115, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:26:06', 1),
(116, '1000.00000000', 1328, 798, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(117, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:26:06', 1),
(118, '1000.00000000', 1328, 798, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:26:06', 1),
(119, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:26:06', 1),
(120, '1000.00000000', 1328, 798, 21, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:26:06', 1),
(121, '-3.00000000', 1327, 798, 1, '-0.15000000', 'exact bonus', 800, '5.0000', '2019-12-14 11:32:03', 1),
(122, '-3.00000000', 1327, 798, 2, '-0.15000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:32:03', 1),
(123, '-3.00000000', 1327, 798, 3, '-0.09000000', 'exact bonus', 800, '3.0000', '2019-12-14 11:32:03', 1),
(124, '-3.00000000', 1327, 798, 4, '-0.09000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:32:03', 1),
(125, '-3.00000000', 1327, 798, 5, '-0.03000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:32:03', 1),
(126, '-3.00000000', 1327, 798, 6, '-0.03000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:32:03', 1),
(127, '-3.00000000', 1327, 798, 7, '-0.01500000', 'exact bonus', 800, '0.5000', '2019-12-14 11:32:03', 1),
(128, '-3.00000000', 1327, 798, 8, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 11:32:03', 1),
(129, '-3.00000000', 1327, 798, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(130, '-3.00000000', 1327, 798, 10, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 11:32:03', 1),
(131, '-3.00000000', 1327, 798, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(132, '-3.00000000', 1327, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:32:03', 1),
(133, '-3.00000000', 1327, 798, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(134, '-3.00000000', 1327, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:32:03', 1),
(135, '-3.00000000', 1327, 798, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(136, '-3.00000000', 1327, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:32:03', 1),
(137, '-3.00000000', 1327, 798, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(138, '-3.00000000', 1327, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:32:03', 1),
(139, '-3.00000000', 1327, 798, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:32:03', 1),
(140, '-3.00000000', 1327, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:32:03', 1),
(141, '-3.00000000', 1327, 798, 21, '-0.03000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:32:03', 1),
(142, '1000.00000000', 1328, 798, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-14 11:42:12', 1),
(143, '1000.00000000', 1328, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:42:12', 1),
(144, '1000.00000000', 1328, 798, 3, '30.00000000', 'exact bonus', 800, '3.0000', '2019-12-14 11:42:12', 1),
(145, '1000.00000000', 1328, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:42:12', 1),
(146, '1000.00000000', 1328, 798, 5, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:42:12', 1),
(147, '1000.00000000', 1328, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:42:12', 1),
(148, '1000.00000000', 1328, 798, 7, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 11:42:12', 1),
(149, '1000.00000000', 1328, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:42:12', 1),
(150, '1000.00000000', 1328, 798, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(151, '1000.00000000', 1328, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:42:12', 1),
(152, '1000.00000000', 1328, 798, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(153, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:42:12', 1),
(154, '1000.00000000', 1328, 798, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(155, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:42:12', 1),
(156, '1000.00000000', 1328, 798, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(157, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:42:12', 1),
(158, '1000.00000000', 1328, 798, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(159, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:42:12', 1),
(160, '1000.00000000', 1328, 798, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:42:12', 1),
(161, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:42:12', 1),
(162, '1000.00000000', 1328, 798, 21, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:42:12', 1),
(163, '1000.00000000', 1328, 798, 2, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:44:45', 1),
(164, '1000.00000000', 1328, 798, 4, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:44:45', 1),
(165, '1000.00000000', 1328, 798, 6, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:44:45', 1),
(166, '1000.00000000', 1328, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(167, '1000.00000000', 1328, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(168, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(169, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(170, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(171, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(172, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:45', 1),
(173, '-3.00000000', 1327, 798, 2, '-0.12000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:44:56', 1),
(174, '-3.00000000', 1327, 798, 4, '-0.06000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:44:56', 1),
(175, '-3.00000000', 1327, 798, 6, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 11:44:56', 1),
(176, '-3.00000000', 1327, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(177, '-3.00000000', 1327, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(178, '-3.00000000', 1327, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(179, '-3.00000000', 1327, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(180, '-3.00000000', 1327, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(181, '-3.00000000', 1327, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(182, '-3.00000000', 1327, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:44:56', 1),
(183, '-3.00000000', 1326, 798, 2, '-0.12000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:45:39', 1),
(184, '-3.00000000', 1326, 798, 4, '-0.06000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:45:39', 1),
(185, '-3.00000000', 1326, 798, 6, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 11:45:39', 1),
(186, '-3.00000000', 1326, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(187, '-3.00000000', 1326, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(188, '-3.00000000', 1326, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(189, '-3.00000000', 1326, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(190, '-3.00000000', 1326, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(191, '-3.00000000', 1326, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(192, '-3.00000000', 1326, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:45:39', 1),
(193, '1000.00000000', 1325, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:46:13', 1),
(194, '1000.00000000', 1325, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:46:13', 1),
(195, '1000.00000000', 1325, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:46:13', 1),
(196, '1000.00000000', 1325, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:46:13', 1),
(197, '1000.00000000', 1325, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:46:13', 1),
(198, '1000.00000000', 1325, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:46:13', 1),
(199, '1000.00000000', 1325, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:46:13', 1),
(200, '1000.00000000', 1325, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:46:13', 1),
(201, '1000.00000000', 1325, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:46:13', 1),
(202, '1000.00000000', 1325, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:46:13', 1),
(203, '1000.00000000', 1324, 800, 1, '80.00000000', 'exact bonus', 798, '8.0000', '2019-12-14 11:47:20', 1),
(204, '1000.00000000', 1324, 800, 2, '40.00000000', 'exact bonus', 800, '4.0000', '2019-12-14 11:47:20', 1),
(205, '1000.00000000', 1324, 800, 3, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:47:20', 1),
(206, '1000.00000000', 1324, 800, 4, '20.00000000', 'exact bonus', 800, '2.0000', '2019-12-14 11:47:20', 1),
(207, '1000.00000000', 1324, 800, 5, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:47:20', 1),
(208, '1000.00000000', 1324, 800, 6, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 11:47:20', 1),
(209, '1000.00000000', 1324, 800, 7, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:47:20', 1),
(210, '1000.00000000', 1324, 800, 8, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(211, '1000.00000000', 1324, 800, 9, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:47:20', 1),
(212, '1000.00000000', 1324, 800, 10, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(213, '1000.00000000', 1324, 800, 11, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(214, '1000.00000000', 1324, 800, 12, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(215, '1000.00000000', 1324, 800, 13, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(216, '1000.00000000', 1324, 800, 14, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(217, '1000.00000000', 1324, 800, 15, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(218, '1000.00000000', 1324, 800, 16, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(219, '1000.00000000', 1324, 800, 17, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(220, '1000.00000000', 1324, 800, 18, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(221, '1000.00000000', 1324, 800, 19, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(222, '1000.00000000', 1324, 800, 20, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:47:20', 1),
(223, '1000.00000000', 1324, 800, 21, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:47:20', 1),
(224, '1000.00000000', 1323, 803, 1, '50.00000000', 'exact bonus', 800, '5.0000', '2019-12-14 11:48:58', 1),
(225, '1000.00000000', 1323, 803, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 11:48:58', 1),
(226, '1000.00000000', 1323, 803, 3, '30.00000000', 'exact bonus', 800, '3.0000', '2019-12-14 11:48:58', 1),
(227, '1000.00000000', 1323, 803, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 11:48:58', 1),
(228, '1000.00000000', 1323, 803, 5, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:48:58', 1),
(229, '1000.00000000', 1323, 803, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 11:48:58', 1),
(230, '1000.00000000', 1323, 803, 7, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 11:48:58', 1),
(231, '1000.00000000', 1323, 803, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:48:58', 1),
(232, '1000.00000000', 1323, 803, 9, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(233, '1000.00000000', 1323, 803, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:48:58', 1),
(234, '1000.00000000', 1323, 803, 11, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(235, '1000.00000000', 1323, 803, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:48:58', 1),
(236, '1000.00000000', 1323, 803, 13, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(237, '1000.00000000', 1323, 803, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:48:58', 1),
(238, '1000.00000000', 1323, 803, 15, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(239, '1000.00000000', 1323, 803, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:48:58', 1),
(240, '1000.00000000', 1323, 803, 17, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(241, '1000.00000000', 1323, 803, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:48:58', 1),
(242, '1000.00000000', 1323, 803, 19, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 11:48:58', 1),
(243, '1000.00000000', 1323, 803, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:48:58', 1),
(244, '1000.00000000', 1323, 803, 21, '10.00000000', 'exact bonus', 800, '1.0000', '2019-12-14 11:48:58', 1),
(245, '1000.00000000', 1328, 798, 2, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:49:39', 1),
(246, '1000.00000000', 1328, 798, 4, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:49:39', 1),
(247, '1000.00000000', 1328, 798, 6, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 11:49:39', 1),
(248, '1000.00000000', 1328, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(249, '1000.00000000', 1328, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(250, '1000.00000000', 1328, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(251, '1000.00000000', 1328, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(252, '1000.00000000', 1328, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(253, '1000.00000000', 1328, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(254, '1000.00000000', 1328, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:39', 1),
(255, '-3.00000000', 1327, 798, 2, '-0.12000000', 'exact bonus', 798, '4.0000', '2019-12-14 11:49:48', 1),
(256, '-3.00000000', 1327, 798, 4, '-0.06000000', 'exact bonus', 798, '2.0000', '2019-12-14 11:49:48', 1),
(257, '-3.00000000', 1327, 798, 6, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 11:49:48', 1),
(258, '-3.00000000', 1327, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(259, '-3.00000000', 1327, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(260, '-3.00000000', 1327, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(261, '-3.00000000', 1327, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(262, '-3.00000000', 1327, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(263, '-3.00000000', 1327, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(264, '-3.00000000', 1327, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 11:49:48', 1),
(265, '-3.00000000', 1326, 798, 2, '-0.12000000', 'exact bonus', 798, '4.0000', '2019-12-14 12:25:22', 1),
(266, '-3.00000000', 1326, 798, 4, '-0.06000000', 'exact bonus', 798, '2.0000', '2019-12-14 12:25:22', 1),
(267, '-3.00000000', 1326, 798, 6, '-0.01500000', 'exact bonus', 798, '0.5000', '2019-12-14 12:25:22', 1),
(268, '-3.00000000', 1326, 798, 8, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(269, '-3.00000000', 1326, 798, 10, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(270, '-3.00000000', 1326, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(271, '-3.00000000', 1326, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(272, '-3.00000000', 1326, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(273, '-3.00000000', 1326, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(274, '-3.00000000', 1326, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:25:22', 1),
(275, '1000.00000000', 1325, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-14 12:26:17', 1),
(276, '1000.00000000', 1325, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-14 12:26:17', 1),
(277, '1000.00000000', 1325, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 12:26:17', 1),
(278, '1000.00000000', 1325, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 12:26:17', 1),
(279, '1000.00000000', 1325, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 12:26:17', 1),
(280, '1000.00000000', 1325, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:26:17', 1),
(281, '1000.00000000', 1325, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:26:17', 1),
(282, '1000.00000000', 1325, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:26:17', 1),
(283, '1000.00000000', 1325, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:26:17', 1),
(284, '1000.00000000', 1325, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:26:17', 1),
(285, '1000.00000000', 1324, 800, 1, '80.00000000', 'exact bonus', 798, '8.0000', '2019-12-14 12:31:09', 1),
(286, '1000.00000000', 1324, 800, 2, '40.00000000', 'exact bonus', 800, '4.0000', '2019-12-14 12:31:09', 1),
(287, '1000.00000000', 1324, 800, 3, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-14 12:31:09', 1),
(288, '1000.00000000', 1324, 800, 4, '20.00000000', 'exact bonus', 800, '2.0000', '2019-12-14 12:31:09', 1),
(289, '1000.00000000', 1324, 800, 5, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-14 12:31:09', 1),
(290, '1000.00000000', 1324, 800, 6, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-14 12:31:09', 1),
(291, '1000.00000000', 1324, 800, 7, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-14 12:31:09', 1),
(292, '1000.00000000', 1324, 800, 8, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(293, '1000.00000000', 1324, 800, 9, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-14 12:31:09', 1),
(294, '1000.00000000', 1324, 800, 10, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(295, '1000.00000000', 1324, 800, 11, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(296, '1000.00000000', 1324, 800, 12, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(297, '1000.00000000', 1324, 800, 13, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(298, '1000.00000000', 1324, 800, 14, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(299, '1000.00000000', 1324, 800, 15, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(300, '1000.00000000', 1324, 800, 16, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(301, '1000.00000000', 1324, 800, 17, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(302, '1000.00000000', 1324, 800, 18, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(303, '1000.00000000', 1324, 800, 19, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(304, '1000.00000000', 1324, 800, 20, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-14 12:31:09', 1),
(305, '1000.00000000', 1324, 800, 21, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-14 12:31:09', 1),
(306, '1000.00000000', 1325, 798, 2, '50.00000000', 'exact bonus', 798, '5.0000', '2019-12-15 08:35:55', 1),
(307, '1000.00000000', 1325, 798, 4, '30.00000000', 'exact bonus', 798, '3.0000', '2019-12-15 08:35:55', 1),
(308, '1000.00000000', 1325, 798, 6, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-15 08:35:55', 1),
(309, '1000.00000000', 1325, 798, 8, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-15 08:35:55', 1),
(310, '1000.00000000', 1325, 798, 10, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-15 08:35:55', 1),
(311, '1000.00000000', 1325, 798, 12, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:35:55', 1),
(312, '1000.00000000', 1325, 798, 14, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:35:55', 1),
(313, '1000.00000000', 1325, 798, 16, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:35:55', 1),
(314, '1000.00000000', 1325, 798, 18, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:35:55', 1),
(315, '1000.00000000', 1325, 798, 20, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:35:55', 1),
(316, '1000.00000000', 1324, 800, 1, '80.00000000', 'exact bonus', 798, '8.0000', '2019-12-15 08:38:30', 1),
(317, '1000.00000000', 1324, 800, 2, '40.00000000', 'exact bonus', 800, '4.0000', '2019-12-15 08:38:30', 1),
(318, '1000.00000000', 1324, 800, 3, '40.00000000', 'exact bonus', 798, '4.0000', '2019-12-15 08:38:30', 1),
(319, '1000.00000000', 1324, 800, 4, '20.00000000', 'exact bonus', 800, '2.0000', '2019-12-15 08:38:30', 1),
(320, '1000.00000000', 1324, 800, 5, '20.00000000', 'exact bonus', 798, '2.0000', '2019-12-15 08:38:30', 1),
(321, '1000.00000000', 1324, 800, 6, '5.00000000', 'exact bonus', 800, '0.5000', '2019-12-15 08:38:30', 1),
(322, '1000.00000000', 1324, 800, 7, '10.00000000', 'exact bonus', 798, '1.0000', '2019-12-15 08:38:30', 1),
(323, '1000.00000000', 1324, 800, 8, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:30', 1),
(324, '1000.00000000', 1324, 800, 9, '5.00000000', 'exact bonus', 798, '0.5000', '2019-12-15 08:38:30', 1),
(325, '1000.00000000', 1324, 800, 10, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:30', 1),
(326, '1000.00000000', 1324, 800, 11, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:30', 1),
(327, '1000.00000000', 1324, 800, 12, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:30', 1),
(328, '1000.00000000', 1324, 800, 13, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:30', 1),
(329, '1000.00000000', 1324, 800, 14, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:30', 1),
(330, '1000.00000000', 1324, 800, 15, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:30', 1),
(331, '1000.00000000', 1324, 800, 16, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:30', 1),
(332, '1000.00000000', 1324, 800, 17, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:30', 1),
(333, '1000.00000000', 1324, 800, 18, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:31', 1),
(334, '1000.00000000', 1324, 800, 19, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:31', 1),
(335, '1000.00000000', 1324, 800, 20, '0.00000000', 'exact bonus', 800, '0.0000', '2019-12-15 08:38:31', 1),
(336, '1000.00000000', 1324, 800, 21, '0.00000000', 'exact bonus', 798, '0.0000', '2019-12-15 08:38:31', 1),
(337, '-10.00000000', 101, 13, 0, '-10.00000000', 'ok', 101, '5.0000', '2019-12-15 11:06:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_reward`
--

DROP TABLE IF EXISTS `member_reward`;
CREATE TABLE IF NOT EXISTS `member_reward` (
  `m_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` int(11) NOT NULL,
  `amt` decimal(8,2) NOT NULL,
  `remark` varchar(250) COLLATE utf8_bin NOT NULL,
  `mem_rw_entdt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dep_id` int(11) NOT NULL,
  PRIMARY KEY (`m_reward_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `member_sd_transfer`
--

DROP TABLE IF EXISTS `member_sd_transfer`;
CREATE TABLE IF NOT EXISTS `member_sd_transfer` (
  `msdt_id` int(11) NOT NULL AUTO_INCREMENT,
  `msdt_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `msdt_member_id` int(11) NOT NULL,
  `msdt_type` int(11) NOT NULL,
  `msdt_amount` decimal(13,4) NOT NULL,
  `msdt_status` int(11) NOT NULL DEFAULT '1',
  `msdt_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `msdf_percentage` decimal(10,0) NOT NULL,
  PRIMARY KEY (`msdt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_support`
--

DROP TABLE IF EXISTS `member_support`;
CREATE TABLE IF NOT EXISTS `member_support` (
  `ms_id` int(11) NOT NULL AUTO_INCREMENT,
  `ms_subject` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ms_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ms_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ms_status` int(11) NOT NULL DEFAULT '0',
  `ms_admin_id` int(11) DEFAULT NULL,
  `ms_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ms_member_id` int(11) NOT NULL,
  `ms_reply` longtext COLLATE utf8_unicode_ci,
  `ms_reply_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member_trading`
--

DROP TABLE IF EXISTS `member_trading`;
CREATE TABLE IF NOT EXISTS `member_trading` (
  `mt_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mt_market` int(11) NOT NULL,
  `mt_amount` decimal(13,4) NOT NULL,
  `mt_member` int(11) NOT NULL,
  `mt_type` int(11) NOT NULL,
  `mt_status` int(11) NOT NULL DEFAULT '0',
  `mt_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mt_delete` int(11) NOT NULL DEFAULT '0',
  `mt_mkttype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`mt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_trading`
--

INSERT INTO `member_trading` (`mt_id`, `mt_reference`, `mt_market`, `mt_amount`, `mt_member`, `mt_type`, `mt_status`, `mt_date`, `mt_delete`, `mt_mkttype`) VALUES
(83, 'OR000000083', 11, '1000.0000', 786, 1, 2, '2019-07-08 13:41:23', 0, 1),
(109, 'OR000000109', 11, '200.0000', 786, 1, 0, '2019-07-10 00:56:59', 1, 1),
(110, 'OR000000110', 11, '200.0000', 786, 1, 0, '2019-07-10 00:56:59', 1, 1),
(111, 'OR000000111', 11, '200.0000', 786, 1, 0, '2019-07-10 00:57:00', 1, 1),
(112, 'OR000000112', 11, '200.0000', 786, 1, 0, '2019-07-10 00:57:00', 1, 1),
(113, 'OR000000113', 11, '200.0000', 786, 1, 0, '2019-07-10 00:57:00', 1, 1),
(114, 'OR000000114', 11, '17240.0000', 786, 1, 0, '2019-07-10 00:58:53', 1, 1),
(115, 'OR000000115', 11, '300.0000', 786, 1, 2, '2019-07-10 03:14:59', 0, 2),
(117, 'OR000000116', 10, '80.0000', 789, 1, 1, '2019-07-10 12:36:52', 0, 1),
(118, 'OR000000118', 11, '80.0000', 791, 1, 2, '2019-07-11 16:00:02', 0, 1),
(119, 'OR000000119', 10, '40.0000', 795, 1, 2, '2019-06-12 11:17:00', 0, 1),
(120, 'OR000000120', 10, '40.0000', 795, 1, 2, '2019-06-12 11:17:02', 0, 1),
(121, 'OR000000121', 9, '3000.0000', 738, 1, 2, '2019-07-13 11:51:18', 0, 2),
(122, 'OR000000122', 10, '1000.0000', 764, 1, 1, '2019-07-13 11:55:08', 0, 1),
(123, 'OR000000123', 9, '4000.0000', 764, 1, 2, '2019-07-13 11:56:15', 0, 2),
(124, 'OR000000124', 10, '20000.0000', 797, 1, 1, '2019-07-13 12:18:06', 0, 1),
(125, 'OR000000125', 11, '13160.0000', 797, 1, 2, '2019-07-13 12:18:19', 0, 1),
(126, 'OR000000126', 9, '13000.0000', 797, 1, 2, '2019-07-13 12:18:25', 0, 1),
(127, 'OR000000127', 9, '100.0000', 791, 1, 0, '2019-07-13 20:50:22', 1, 2),
(128, 'OR000000128', 9, '100.0000', 791, 1, 0, '2019-07-13 20:50:25', 1, 2),
(129, 'OR000000129', 9, '100.0000', 791, 1, 0, '2019-07-13 20:50:27', 1, 1),
(130, 'OR000000130', 11, '1000.0000', 791, 1, 0, '2019-07-13 20:50:45', 1, 1),
(131, 'OR000000131', 9, '366.0000', 791, 1, 0, '2019-07-13 20:51:17', 1, 2),
(132, 'OR000000132', 11, '300.0000', 791, 1, 0, '2019-07-13 20:51:50', 1, 1),
(133, 'OR000000133', 10, '3920.0000', 795, 1, 2, '2019-06-13 10:22:45', 0, 1),
(134, 'OR000000134', 11, '3920.0000', 795, 1, 2, '2019-06-24 10:38:12', 0, 2),
(135, 'OR000000135', 11, '3920.0000', 795, 1, 2, '2019-06-25 11:00:00', 0, 1),
(136, 'OR000000136', 11, '3920.0000', 795, 1, 2, '2019-06-26 11:48:36', 0, 2),
(137, 'OR000000137', 10, '3920.0000', 795, 1, 1, '2019-06-27 10:51:36', 0, 1),
(138, 'OR000000138', 10, '5840.0000', 838, 1, 1, '2019-06-15 10:41:07', 0, 1),
(140, 'OR000000140', 10, '5840.0000', 839, 1, 1, '2019-06-15 10:58:21', 0, 2),
(141, 'OR000000141', 10, '300.0000', 791, 1, 1, '2019-07-15 15:37:00', 0, 1),
(142, 'OR000000142', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:28:46', 0, 1),
(143, 'OR000000143', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:29:03', 0, 1),
(144, 'OR000000144', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:29:05', 0, 1),
(145, 'OR000000145', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:29:06', 0, 1),
(146, 'OR000000146', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:29:11', 0, 2),
(147, 'OR000000147', 11, '1000.0000', 791, 1, 2, '2019-07-16 15:29:11', 0, 2),
(148, 'OR000000148', 10, '1000.0000', 848, 1, 1, '2019-06-16 15:55:57', 0, 1),
(149, 'OR000000149', 11, '2080.0000', 792, 1, 2, '2019-06-17 12:47:13', 0, 1),
(150, 'OR000000150', 11, '2080.0000', 792, 1, 2, '2019-06-17 00:00:00', 0, 1),
(151, 'OR000000151', 9, '520.0000', 851, 1, 2, '2019-07-18 10:58:28', 0, 1),
(152, 'OR000000152', 11, '520.0000', 851, 1, 2, '2019-07-18 10:59:19', 0, 2),
(153, 'OR000000153', 9, '520.0000', 855, 1, 2, '2019-07-18 11:33:19', 0, 1),
(154, 'OR000000154', 11, '520.0000', 855, 1, 2, '2019-07-18 11:33:27', 0, 2),
(155, 'OR000000155', 11, '520.0000', 856, 1, 2, '2019-07-18 11:34:33', 0, 2),
(156, 'OR000000156', 9, '520.0000', 856, 1, 2, '2019-07-18 11:34:42', 0, 1),
(157, 'OR000000157', 11, '520.0000', 853, 1, 2, '2019-07-18 11:37:24', 0, 1),
(158, 'OR000000158', 9, '520.0000', 853, 1, 2, '2019-07-18 11:37:39', 0, 1),
(159, 'OR000000159', 11, '520.0000', 854, 1, 2, '2019-07-18 11:38:25', 0, 2),
(160, 'OR000000160', 9, '520.0000', 854, 1, 2, '2019-07-18 11:38:35', 0, 1),
(161, 'OR000000161', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:48', 0, 2),
(162, 'OR000000162', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:50', 0, 2),
(163, 'OR000000163', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:50', 0, 2),
(164, 'OR000000164', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:51', 0, 2),
(165, 'OR000000165', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:54', 0, 2),
(166, 'OR000000166', 9, '2000.0000', 792, 1, 2, '2019-06-17 12:47:55', 0, 2),
(167, 'OR000000167', 10, '2960.0000', 815, 1, 1, '2019-07-18 13:43:18', 0, 1),
(168, 'OR000000168', 10, '2960.0000', 816, 1, 1, '2019-07-18 13:46:23', 0, 1),
(169, 'OR000000169', 10, '2960.0000', 814, 1, 1, '2019-07-18 13:51:22', 0, 1),
(170, 'OR000000170', 10, '2960.0000', 813, 1, 1, '2019-07-18 13:54:07', 0, 1),
(171, 'OR000000171', 10, '2960.0000', 812, 1, 1, '2019-07-18 13:59:18', 0, 1),
(172, 'OR000000172', 10, '2960.0000', 811, 1, 1, '2019-07-18 14:03:30', 0, 2),
(173, 'OR000000173', 10, '2960.0000', 810, 1, 1, '2019-07-18 14:05:30', 0, 1),
(174, 'OR000000174', 10, '2960.0000', 809, 1, 1, '2019-07-18 14:07:23', 0, 1),
(175, 'OR000000175', 10, '2960.0000', 808, 1, 1, '2019-07-18 14:10:03', 0, 2),
(176, 'OR000000176', 10, '2960.0000', 807, 1, 1, '2019-07-18 14:11:48', 0, 2),
(177, 'OR000000177', 10, '2960.0000', 806, 1, 1, '2019-07-18 14:19:24', 0, 2),
(178, 'OR000000178', 10, '2960.0000', 805, 1, 1, '2019-07-18 14:21:31', 0, 1),
(179, 'OR000000179', 10, '2960.0000', 804, 1, 1, '2019-07-18 14:23:34', 0, 2),
(180, 'OR000000180', 10, '2960.0000', 803, 1, 1, '2019-07-18 14:35:48', 0, 1),
(181, 'OR000000181', 10, '2960.0000', 802, 1, 1, '2019-07-18 14:38:02', 0, 2),
(182, 'OR000000182', 10, '2960.0000', 798, 1, 1, '2019-07-18 14:45:00', 0, 2),
(183, 'OR000000183', 10, '2960.0000', 799, 1, 1, '2019-07-18 14:45:32', 0, 1),
(184, 'OR000000184', 10, '1300.0000', 800, 1, 1, '2019-07-18 14:48:34', 0, 2),
(185, 'OR000000185', 10, '1000.0000', 801, 1, 1, '2019-07-18 14:52:28', 0, 1),
(186, 'OR000000186', 11, '1500.0000', 801, 1, 2, '2019-07-18 14:52:44', 0, 2),
(187, 'OR000000187', 10, '10000.0000', 792, 1, 1, '2019-06-17 00:00:00', 0, 1),
(190, 'OR000000188', 11, '13000.0000', 792, 1, 2, '2019-07-19 11:28:03', 0, 2),
(191, 'OR000000191', 11, '1040.0000', 851, 1, 2, '2019-07-19 13:16:22', 0, 1),
(192, 'OR000000192', 11, '1040.0000', 855, 1, 2, '2019-07-19 13:18:47', 0, 1),
(193, 'OR000000193', 11, '1040.0000', 853, 1, 2, '2019-07-19 13:19:13', 0, 1),
(194, 'OR000000194', 11, '1040.0000', 860, 1, 2, '2019-07-19 13:19:20', 0, 1),
(195, 'OR000000195', 11, '1040.0000', 856, 1, 2, '2019-07-19 13:19:53', 0, 1),
(196, 'OR000000196', 11, '1040.0000', 854, 1, 2, '2019-07-19 13:20:37', 0, 1),
(197, 'OR000000197', 11, '1040.0000', 853, 1, 2, '2019-07-20 13:07:22', 0, 1),
(198, 'OR000000198', 11, '1040.0000', 854, 1, 2, '2019-07-20 13:08:23', 0, 1),
(199, 'OR000000199', 11, '520.0000', 851, 1, 2, '2019-07-20 13:09:05', 0, 1),
(200, 'OR000000200', 9, '520.0000', 851, 1, 2, '2019-07-20 13:09:22', 0, 1),
(201, 'OR000000201', 11, '1040.0000', 855, 1, 2, '2019-07-20 13:10:18', 0, 1),
(202, 'OR000000202', 11, '1040.0000', 856, 1, 2, '2019-07-20 13:10:56', 0, 1),
(203, 'OR000000203', 11, '1040.0000', 860, 1, 2, '2019-07-20 13:26:30', 0, 1),
(204, 'OR000000204', 11, '160.0000', 737, 1, 0, '2019-07-28 00:51:42', 1, 1),
(205, 'OR000000205', 11, '160.0000', 737, 1, 2, '2019-07-28 00:53:03', 0, 1),
(206, 'OR000000206', 11, '666.0000', 737, 1, 2, '2019-07-28 17:25:22', 0, 1),
(207, 'OR000000207', 9, '826.6700', 737, 1, 1, '2019-08-03 21:41:18', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `member_trading_interest`
--

DROP TABLE IF EXISTS `member_trading_interest`;
CREATE TABLE IF NOT EXISTS `member_trading_interest` (
  `mti_id` int(11) NOT NULL AUTO_INCREMENT,
  `mti_trading_id` int(11) NOT NULL,
  `mti_member` int(11) NOT NULL,
  `mti_amount` decimal(13,4) NOT NULL,
  `mti_interest_percent` decimal(13,4) NOT NULL,
  `mti_interest_amount` decimal(13,4) NOT NULL,
  `mti_created_by` int(11) NOT NULL,
  `mti_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mti_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mti_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_trading_interest`
--

INSERT INTO `member_trading_interest` (`mti_id`, `mti_trading_id`, `mti_member`, `mti_amount`, `mti_interest_percent`, `mti_interest_amount`, `mti_created_by`, `mti_created_date`, `mti_type`) VALUES
(1, 206, 737, '666.0000', '30.0000', '199.8000', 13, '2019-07-28 17:25:49', 0),
(2, 206, 737, '666.0000', '0.0000', '0.0000', 13, '2019-08-03 21:40:24', 0),
(3, 205, 737, '160.0000', '0.0000', '0.0000', 13, '2019-08-03 21:40:30', 0),
(4, 207, 737, '826.6700', '0.1000', '0.8267', 13, '2019-08-03 21:43:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_transfer`
--

DROP TABLE IF EXISTS `member_transfer`;
CREATE TABLE IF NOT EXISTS `member_transfer` (
  `mt_id` int(11) NOT NULL AUTO_INCREMENT,
  `mt_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mt_member_id` int(11) NOT NULL,
  `mt_type` int(11) NOT NULL,
  `mt_amount` decimal(13,4) NOT NULL,
  `mt_status` int(11) NOT NULL DEFAULT '1',
  `mt_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mt_actual_amount` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mt_tran_fee` decimal(11,2) NOT NULL DEFAULT '0.00',
  `mt_tranfee_per` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`mt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_transfer`
--

INSERT INTO `member_transfer` (`mt_id`, `mt_reference`, `mt_member_id`, `mt_type`, `mt_amount`, `mt_status`, `mt_created_date`, `mt_actual_amount`, `mt_tran_fee`, `mt_tranfee_per`) VALUES
(1, 'G-TM000001', 798, 1, '56.0000', 1, '2019-12-16 13:50:28', '0.00', '0.00', 0),
(2, 'G-TM000002', 798, 1, '1000.0000', 1, '2019-12-16 14:08:08', '0.00', '0.00', 0),
(3, 'G-TM000003', 798, 1, '500.0000', 1, '2019-12-16 20:36:56', '0.00', '0.00', 0),
(4, 'G-TM000004', 798, 1, '10.0000', 1, '2019-12-16 23:26:17', '0.00', '0.00', 0),
(5, 'G-TM000005', 798, 1, '10.0000', 1, '2019-12-16 23:28:03', '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `member_withdraw`
--

DROP TABLE IF EXISTS `member_withdraw`;
CREATE TABLE IF NOT EXISTS `member_withdraw` (
  `mw_id` int(11) NOT NULL AUTO_INCREMENT,
  `mw_reference` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `mw_member_id` int(11) NOT NULL,
  `mw_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mw_amount` decimal(13,4) NOT NULL,
  `mw_amount_currency` decimal(13,8) NOT NULL,
  `mw_currency_rate` decimal(13,8) NOT NULL,
  `mw_service` decimal(13,4) NOT NULL,
  `mw_actual_amount_currency` decimal(13,8) NOT NULL,
  `mw_method` int(11) NOT NULL,
  `mw_status` int(11) NOT NULL DEFAULT '0',
  `mw_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mw_approved_by` int(11) DEFAULT NULL,
  `mw_approved_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mw_message` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`mw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `member_withdraw`
--

INSERT INTO `member_withdraw` (`mw_id`, `mw_reference`, `mw_member_id`, `mw_type`, `mw_amount`, `mw_amount_currency`, `mw_currency_rate`, `mw_service`, `mw_actual_amount_currency`, `mw_method`, `mw_status`, `mw_created_date`, `mw_approved_by`, `mw_approved_date`, `mw_message`) VALUES
(1, 'WM000001', 737, '2', '120.0000', '0.01263720', '0.00010531', '0.0000', '0.01263720', 19, 1, '2019-07-28 18:18:42', 13, '2019-08-12 13:26:14', '');

-- --------------------------------------------------------

--
-- Table structure for table `posts_comments`
--

DROP TABLE IF EXISTS `posts_comments`;
CREATE TABLE IF NOT EXISTS `posts_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `factive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts_data`
--

DROP TABLE IF EXISTS `posts_data`;
CREATE TABLE IF NOT EXISTS `posts_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `type` enum('BUSINESS','FASHION','GAME','TRAINING','TECHNOLOGY','FINANCIAL') NOT NULL,
  `factive` bit(1) NOT NULL DEFAULT b'1',
  `fapproved` bit(1) NOT NULL DEFAULT b'0',
  `approved_by` tinyint(4) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts_likes`
--

DROP TABLE IF EXISTS `posts_likes`;
CREATE TABLE IF NOT EXISTS `posts_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `flike` bit(1) NOT NULL DEFAULT b'1',
  `add_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `upd_dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `factive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
CREATE TABLE IF NOT EXISTS `promotion` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `p_description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `p_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `p_status` int(11) NOT NULL DEFAULT '1',
  `p_created_by` int(11) NOT NULL,
  `p_date` datetime NOT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `promotion`
--

INSERT INTO `promotion` (`p_id`, `p_title`, `p_description`, `p_pic`, `p_status`, `p_created_by`, `p_date`) VALUES
(3, 'ç½‘åšèµ„æœ¬ 2019 å¼€ç›˜å¤§ä¼˜æƒ ', '\r\nç½‘åšèµ„æœ¬ 2019 å¼€ç›˜å¤§ä¼˜æƒ  ï¼Œ é©¬ä¸Šæ³¨å†Œæˆä¸ºå®˜æ–¹ä¼šå‘˜å“¦ï¼ï¼\r\n\r\n.', '1563382358.jpg', 1, 13, '2019-07-07 01:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `reseller_fund`
--

DROP TABLE IF EXISTS `reseller_fund`;
CREATE TABLE IF NOT EXISTS `reseller_fund` (
  `rf_id` int(11) NOT NULL AUTO_INCREMENT,
  `rf_amount` decimal(13,4) NOT NULL,
  `rf_reseller_id` int(11) NOT NULL,
  `rf_created_by` int(11) NOT NULL,
  `rf_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roller_market_trade`
--

DROP TABLE IF EXISTS `roller_market_trade`;
CREATE TABLE IF NOT EXISTS `roller_market_trade` (
  `rmt_id` int(11) NOT NULL,
  `rmt_status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmt_market_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmt_rolling_time` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmt_pic_1` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmt_pic_2` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rmt_chips` decimal(65,2) NOT NULL,
  `rmt_amount` decimal(65,2) NOT NULL,
  `rmt_sign` int(11) NOT NULL,
  `rmt_rolling` decimal(65,2) NOT NULL,
  `rmt_target_roll` decimal(65,2) NOT NULL,
  `rmt_current_roll` decimal(65,2) NOT NULL,
  `rmt_rolling_com` decimal(65,2) NOT NULL,
  `rmt_deleted` int(11) NOT NULL,
  `rmt_rolling_min_com` decimal(10,2) NOT NULL,
  `rmt_rolling_insurance` double(11,2) NOT NULL,
  `rmt_rolling_win_min` double(11,2) NOT NULL,
  `rmt_rolling_win_max` double(11,2) NOT NULL,
  PRIMARY KEY (`rmt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `share_rate_setting`
--

DROP TABLE IF EXISTS `share_rate_setting`;
CREATE TABLE IF NOT EXISTS `share_rate_setting` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `share_rate` double NOT NULL,
  `share_rem` varchar(100) NOT NULL,
  `share_updated_by` int(11) NOT NULL,
  `share_created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

DROP TABLE IF EXISTS `system_log`;
CREATE TABLE IF NOT EXISTS `system_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adddt` datetime NOT NULL,
  `dbtbl` varchar(50) NOT NULL,
  `dml_type` enum('INSERT','UPDATE','DELETE','SEARCH') NOT NULL,
  `log_code` varchar(50) NOT NULL,
  `log_desc` text NOT NULL,
  `adduser` int(11) NOT NULL,
  `fread` bit(1) NOT NULL,
  `factive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_log`
--

INSERT INTO `system_log` (`id`, `adddt`, `dbtbl`, `dml_type`, `log_code`, `log_desc`, `adduser`, `fread`, `factive`) VALUES
(62, '2019-07-30 02:58:42', 'INSERT', 'INSERT', 'Approved', 'ur top up is done. thank u', 737, b'0', 1),
(61, '2019-07-22 23:28:46', 'INSERT', 'INSERT', 'Reject', '', 737, b'0', 1),
(60, '2019-07-21 03:05:58', 'INSERT', 'INSERT', 'Approved', 'USD ($) 69120.00 Approved', 737, b'0', 1),
(63, '2019-11-06 23:37:33', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(64, '2019-11-08 13:08:10', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(65, '2019-12-11 17:38:20', 'INSERT', 'INSERT', 'Approved', 'dewdewde', 798, b'0', 1),
(66, '2019-12-12 05:57:53', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(67, '2019-12-12 06:00:46', 'INSERT', 'INSERT', 'Approved', 'wfewfew', 798, b'0', 1),
(68, '2019-12-12 06:07:55', 'INSERT', 'INSERT', 'Approved', 'kk', 798, b'0', 1),
(69, '2019-12-12 06:38:59', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(70, '2019-12-12 06:41:20', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(71, '2019-12-12 06:42:15', 'INSERT', 'INSERT', 'Approved', 'dgrg', 798, b'0', 1),
(72, '2019-12-12 06:42:24', 'INSERT', 'INSERT', 'Approved', 'dfgdg', 798, b'0', 1),
(73, '2019-12-12 06:43:54', 'INSERT', 'INSERT', 'Approved', 'ok', 798, b'0', 1),
(74, '2019-12-12 06:55:34', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(75, '2019-12-12 06:56:53', 'INSERT', 'INSERT', 'Approved', 'frefre', 798, b'0', 1),
(76, '2019-12-12 21:30:25', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(77, '2019-12-12 21:32:53', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(78, '2019-12-12 21:33:02', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(79, '2019-12-12 21:33:59', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(80, '2019-12-12 21:35:11', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(81, '2019-12-12 21:37:51', 'INSERT', 'INSERT', 'Approved', 'kk', 800, b'0', 1),
(82, '2019-12-12 21:38:59', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(83, '2019-12-12 21:41:18', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(84, '2019-12-12 21:42:27', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(85, '2019-12-12 21:43:16', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(86, '2019-12-12 21:45:46', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(87, '2019-12-12 21:46:25', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(88, '2019-12-12 21:46:52', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(89, '2019-12-12 21:48:25', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(90, '2019-12-12 21:48:55', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(91, '2019-12-12 21:49:32', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(92, '2019-12-12 21:51:47', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(93, '2019-12-12 21:53:34', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(94, '2019-12-12 21:54:18', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(95, '2019-12-13 06:38:24', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(96, '2019-12-13 06:40:44', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(97, '2019-12-13 06:43:31', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(98, '2019-12-13 06:44:04', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(99, '2019-12-13 06:46:59', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(100, '2019-12-13 06:48:04', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(101, '2019-12-13 06:49:36', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(102, '2019-12-13 06:50:48', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(103, '2019-12-13 06:55:19', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(104, '2019-12-13 06:56:00', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(105, '2019-12-13 06:57:20', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(106, '2019-12-13 06:59:37', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(107, '2019-12-13 07:00:14', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(108, '2019-12-13 07:07:55', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(109, '2019-12-13 07:08:46', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(110, '2019-12-13 07:09:23', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(111, '2019-12-13 07:09:46', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(112, '2019-12-13 07:10:22', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(113, '2019-12-13 07:17:01', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(114, '2019-12-13 07:22:23', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(115, '2019-12-13 07:47:27', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(116, '2019-12-13 07:56:34', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(117, '2019-12-13 07:57:45', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(118, '2019-12-13 07:58:50', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(119, '2019-12-13 07:59:39', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(120, '2019-12-13 08:01:20', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(121, '2019-12-13 08:02:45', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(122, '2019-12-13 08:23:44', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(123, '2019-12-13 09:54:14', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(124, '2019-12-13 09:57:46', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(125, '2019-12-13 09:58:23', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(126, '2019-12-13 09:59:15', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(127, '2019-12-13 10:12:20', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(128, '2019-12-13 10:13:37', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(129, '2019-12-13 10:15:26', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(130, '2019-12-13 10:16:21', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(131, '2019-12-13 10:19:20', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(132, '2019-12-13 10:20:54', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(133, '2019-12-13 10:21:25', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(134, '2019-12-13 10:22:29', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(135, '2019-12-13 10:24:18', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(136, '2019-12-13 10:52:09', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(137, '2019-12-13 10:52:30', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(138, '2019-12-13 11:31:14', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(139, '2019-12-13 11:37:21', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(140, '2019-12-13 11:39:00', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(141, '2019-12-13 11:40:30', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(142, '2019-12-13 11:40:38', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(143, '2019-12-13 11:40:56', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(144, '2019-12-13 11:41:57', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(145, '2019-12-13 11:41:59', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(146, '2019-12-13 11:42:03', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(147, '2019-12-13 11:56:25', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(148, '2019-12-13 11:56:28', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(149, '2019-12-13 11:56:31', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(150, '2019-12-13 11:57:03', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(151, '2019-12-13 11:58:34', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(152, '2019-12-13 12:00:42', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(153, '2019-12-13 12:02:12', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(154, '2019-12-13 12:02:41', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(155, '2019-12-13 12:17:16', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(156, '2019-12-13 12:19:28', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(157, '2019-12-13 12:20:30', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(158, '2019-12-13 12:51:16', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(159, '2019-12-13 12:52:59', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(160, '2019-12-13 12:54:12', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(161, '2019-12-13 12:55:45', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(162, '2019-12-13 12:56:24', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(163, '2019-12-13 12:57:07', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(164, '2019-12-13 12:58:56', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(165, '2019-12-13 12:59:32', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(166, '2019-12-13 13:00:11', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(167, '2019-12-13 13:01:08', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(168, '2019-12-13 13:01:36', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(169, '2019-12-13 13:02:14', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(170, '2019-12-13 13:08:52', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(171, '2019-12-13 13:09:31', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(172, '2019-12-13 13:11:53', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(173, '2019-12-13 13:12:47', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(174, '2019-12-13 13:26:46', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(175, '2019-12-13 13:27:08', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(176, '2019-12-14 10:59:22', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(177, '2019-12-14 11:24:22', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(178, '2019-12-14 11:26:06', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(179, '2019-12-14 11:32:03', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(180, '2019-12-14 11:42:12', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(181, '2019-12-14 11:44:45', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(182, '2019-12-14 11:44:56', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(183, '2019-12-14 11:45:39', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(184, '2019-12-14 11:46:13', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(185, '2019-12-14 11:47:20', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(186, '2019-12-14 11:48:58', 'INSERT', 'INSERT', 'Approved', '', 803, b'0', 1),
(187, '2019-12-14 11:49:39', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(188, '2019-12-14 11:49:48', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(189, '2019-12-14 12:25:22', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(190, '2019-12-14 12:26:17', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(191, '2019-12-14 12:31:08', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1),
(192, '2019-12-14 12:31:20', 'INSERT', 'INSERT', 'Reject', '', 803, b'0', 1),
(193, '2019-12-15 08:35:55', 'INSERT', 'INSERT', 'Approved', '', 798, b'0', 1),
(194, '2019-12-15 08:38:30', 'INSERT', 'INSERT', 'Approved', '', 800, b'0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topup_amt_config`
--

DROP TABLE IF EXISTS `topup_amt_config`;
CREATE TABLE IF NOT EXISTS `topup_amt_config` (
  `topup_amt` double(11,2) NOT NULL,
  `rem` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topup_amt_config`
--

INSERT INTO `topup_amt_config` (`topup_amt`, `rem`) VALUES
(120.00, ''),
(480.00, ''),
(1440.00, ''),
(4320.00, ''),
(8640.00, ''),
(17280.00, ''),
(34560.00, ''),
(69120.00, '');

-- --------------------------------------------------------

--
-- Table structure for table `topup_settings`
--

DROP TABLE IF EXISTS `topup_settings`;
CREATE TABLE IF NOT EXISTS `topup_settings` (
  `ts_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_from_amount` decimal(13,4) NOT NULL,
  `ts_to_amount` decimal(13,4) NOT NULL,
  `ts_expiry` int(11) NOT NULL,
  `ts_created_by` int(11) NOT NULL,
  `ts_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ts_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `topup_settings`
--

INSERT INTO `topup_settings` (`ts_id`, `ts_from_amount`, `ts_to_amount`, `ts_expiry`, `ts_created_by`, `ts_created_date`, `ts_status`) VALUES
(1, '120.0000', '1000000.0000', 365, 13, '2019-07-06 15:35:48', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trade_settings`
--

DROP TABLE IF EXISTS `trade_settings`;
CREATE TABLE IF NOT EXISTS `trade_settings` (
  `tr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tr_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `tr_max` decimal(13,4) NOT NULL,
  `tr_status` int(11) NOT NULL DEFAULT '1',
  `tr_created_by` int(11) NOT NULL,
  `tr_created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tr_win_min` double(11,2) NOT NULL DEFAULT '0.00',
  `tr_win_max` double(11,2) NOT NULL DEFAULT '0.00',
  `tr_rollcom_min` double(11,2) NOT NULL DEFAULT '0.00',
  `tr_rollcom_max` double(11,2) NOT NULL DEFAULT '0.00',
  `tr_bet_amt` double(11,2) NOT NULL DEFAULT '0.00',
  `tr_pic` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `trval` double(11,2) NOT NULL DEFAULT '0.00',
  `bnkval` double(11,2) NOT NULL DEFAULT '0.00',
  `plval` double(11,2) NOT NULL DEFAULT '0.00',
  `winloss` double(11,2) NOT NULL DEFAULT '0.00',
  `roll` double(11,2) NOT NULL DEFAULT '0.00',
  `pwinloss` double(11,2) NOT NULL DEFAULT '0.00',
  `proll` double(11,2) NOT NULL DEFAULT '0.00',
  `playwinloss` decimal(11,2) NOT NULL,
  `pplaywinloss` decimal(11,2) NOT NULL,
  `tr_fixmarket` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `trade_settings`
--

INSERT INTO `trade_settings` (`tr_id`, `tr_name`, `tr_max`, `tr_status`, `tr_created_by`, `tr_created_date`, `tr_win_min`, `tr_win_max`, `tr_rollcom_min`, `tr_rollcom_max`, `tr_bet_amt`, `tr_pic`, `trval`, `bnkval`, `plval`, `winloss`, `roll`, `pwinloss`, `proll`, `playwinloss`, `pplaywinloss`, `tr_fixmarket`) VALUES
(9, 'MONTHLY FIXED RATE [3% ]', '2000000.0000', 1, 13, '2019-06-28 22:20:08', 0.00, 0.00, 0.10, 0.10, 80.00, '1564290524.png', 2000000.00, 120750.00, 156800.00, 0.08, 0.03, 5.56, 0.51, '0.00', '-0.54', 0),
(10, 'CRYPTO 1.0 ~ 4.8% OPTION', '1000000.0000', 1, 13, '2019-06-28 22:20:42', 1.00, 4.80, 0.00, 0.00, 80.00, '1564290417.png', 2000000.00, 180500.00, 298100.00, 3.00, 0.30, 3.00, 0.30, '0.00', '0.00', 0),
(11, '1.8% = FIXED RATE OPTION', '2000000.0000', 1, 13, '2019-06-29 22:12:32', 0.00, 0.00, 1.80, 1.80, 80.00, '1564290608.png', 2000000.00, 289700.00, 378700.00, 0.15, 0.03, 0.10, 0.03, '-0.30', '-0.30', 0),
(12, 'MEGA888 1.0 - 3.5% OPTION', '2000000.0000', 0, 13, '2019-08-08 17:53:55', 1.00, 3.50, 0.30, 0.60, 80.00, '1565258036.png', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '0.00', '0.00', 0),
(13, 'SPORTBOOK 0.8 - 3.0% OPTION', '2000000.0000', 0, 13, '2019-08-08 17:57:19', 0.80, 3.00, 0.50, 0.50, 80.00, '1565258239.png', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '0.00', '0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `trading_config`
--

DROP TABLE IF EXISTS `trading_config`;
CREATE TABLE IF NOT EXISTS `trading_config` (
  `id` int(11) NOT NULL,
  `configDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `minNumber` double NOT NULL DEFAULT '0',
  `maxNumber` double NOT NULL DEFAULT '0',
  `increValue` double NOT NULL DEFAULT '0',
  `decreValue` double NOT NULL DEFAULT '0',
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `timeIntervalMins` double NOT NULL DEFAULT '0',
  `startValue` float NOT NULL DEFAULT '0',
  `decreFlow` int(11) NOT NULL DEFAULT '0',
  `noOfDecre` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `trading_config`
--

INSERT INTO `trading_config` (`id`, `configDate`, `minNumber`, `maxNumber`, `increValue`, `decreValue`, `startTime`, `endTime`, `timeIntervalMins`, `startValue`, `decreFlow`, `noOfDecre`) VALUES
(2, '2019-07-08 14:24:55', 1, 18, 0.02, 0.002, '10:00:00', '20:00:00', 5, 0.01, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `treeview`
--

DROP TABLE IF EXISTS `treeview`;
CREATE TABLE IF NOT EXISTS `treeview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) DEFAULT NULL,
  `m_id` int(11) NOT NULL DEFAULT '0',
  `position` enum('L','R') DEFAULT NULL,
  `leftcnt` int(11) NOT NULL DEFAULT '0',
  `rightcnt` int(11) NOT NULL DEFAULT '0',
  `create_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_by` int(11) NOT NULL DEFAULT '0',
  `org_parentid` int(11) NOT NULL DEFAULT '0',
  `factive` int(11) NOT NULL DEFAULT '1',
  `mem_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentID` (`parentID`),
  KEY `m_id` (`m_id`),
  KEY `mem_id` (`mem_id`)
) ENGINE=InnoDB AUTO_INCREMENT=819 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `treeview`
--

INSERT INTO `treeview` (`id`, `parentID`, `m_id`, `position`, `leftcnt`, `rightcnt`, `create_date`, `create_by`, `org_parentid`, `factive`, `mem_id`) VALUES
(767, 0, 737, 'L', 1, 0, '2019-09-01 21:32:26', 0, 737, 1, 784),
(768, 0, 737, 'R', 0, 1, '2019-09-01 21:33:00', 0, 737, 1, 785),
(791, 767, 784, 'L', 1, 0, '2019-09-01 21:34:24', 784, 737, 1, 787),
(792, 767, 784, 'R', 0, 1, '2019-09-01 21:37:07', 784, 784, 1, 789),
(793, 768, 785, 'L', 1, 0, '2019-09-02 10:40:26', 785, 785, 1, 797),
(794, 768, 785, 'R', 0, 1, '2019-09-01 21:33:45', 785, 737, 1, 786),
(795, 794, 786, 'L', 0, 0, '2019-09-01 21:33:45', 786, 737, 1, 0),
(796, 794, 786, 'R', 0, 1, '2019-09-02 10:39:34', 786, 785, 1, 796),
(797, 791, 787, 'L', 1, 0, '2019-09-01 21:35:30', 787, 784, 1, 788),
(798, 791, 787, 'R', 0, 0, '2019-09-01 21:34:24', 787, 737, 1, 0),
(799, 797, 788, 'L', 1, 0, '2019-09-01 23:38:23', 788, 784, 1, 795),
(800, 797, 788, 'R', 0, 0, '2019-09-01 21:35:30', 788, 784, 1, 0),
(801, 792, 789, 'L', 1, 0, '2019-09-01 23:32:40', 789, 789, 1, 790),
(802, 792, 789, 'R', 0, 1, '2019-09-01 23:33:23', 789, 789, 1, 791),
(803, 801, 790, 'L', 1, 0, '2019-09-01 23:36:11', 790, 790, 1, 792),
(804, 801, 790, 'R', 0, 1, '2019-09-01 23:37:00', 790, 790, 1, 794),
(805, 802, 791, 'L', 0, 0, '2019-09-01 23:33:23', 791, 789, 1, 0),
(806, 802, 791, 'R', 0, 0, '2019-09-01 23:33:23', 791, 789, 1, 0),
(807, 803, 792, 'L', 1, 0, '2019-09-01 23:36:27', 792, 790, 1, 793),
(808, 803, 792, 'R', 0, 0, '2019-09-01 23:36:11', 792, 790, 1, 0),
(809, 807, 793, 'L', 0, 0, '2019-09-01 23:36:27', 793, 790, 1, 0),
(810, 807, 793, 'R', 0, 0, '2019-09-01 23:36:27', 793, 790, 1, 0),
(811, 804, 794, 'L', 0, 0, '2019-09-01 23:37:00', 794, 790, 1, 0),
(812, 804, 794, 'R', 0, 0, '2019-09-01 23:37:00', 794, 790, 1, 0),
(813, 799, 795, 'L', 0, 0, '2019-09-01 23:38:23', 795, 784, 1, 0),
(814, 799, 795, 'R', 0, 0, '2019-09-01 23:38:23', 795, 784, 1, 0),
(815, 796, 796, 'L', 0, 0, '2019-09-02 10:39:33', 796, 785, 1, 0),
(816, 796, 796, 'R', 0, 0, '2019-09-02 10:39:33', 796, 785, 1, 0),
(817, 793, 797, 'L', 0, 0, '2019-09-02 10:40:26', 797, 785, 1, 0),
(818, 793, 797, 'R', 0, 0, '2019-09-02 10:40:26', 797, 785, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_cat`
--

DROP TABLE IF EXISTS `user_cat`;
CREATE TABLE IF NOT EXISTS `user_cat` (
  `usr_cat_id` int(8) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(50) DEFAULT NULL,
  `main_cat` varchar(255) DEFAULT NULL,
  `ref_per` float DEFAULT NULL,
  `cat_level` int(11) DEFAULT '0',
  `status` varchar(5) DEFAULT '0',
  PRIMARY KEY (`usr_cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_cat`
--

INSERT INTO `user_cat` (`usr_cat_id`, `cat_name`, `main_cat`, `ref_per`, `cat_level`, `status`) VALUES
(142, 'delegator', 'Admin', 10, 1, '1'),
(143, 'user', 'delegator', 10, 2, '1');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view1`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view1`;
CREATE TABLE IF NOT EXISTS `view1` (
`usrid` int(11)
,`master_id` int(11)
,`amt` double
);

-- --------------------------------------------------------

--
-- Structure for view `view1`
--
DROP TABLE IF EXISTS `view1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view1`  AS  select `lottomaster`.`usrid` AS `usrid`,`lottodetails`.`master_id` AS `master_id`,min(`lottodetails`.`amount`) AS `amt` from (`lottodetails` join `lottomaster` on((`lottodetails`.`master_id` = `lottodetails`.`master_id`))) where (`lottodetails`.`factive` = 1) group by `lottomaster`.`usrid`,`lottodetails`.`master_id`,`lottodetails`.`rowm` ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
