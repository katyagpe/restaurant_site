-- phpMyAdmin SQL Dump
-- version 5.1.1-1.fc34
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 28-09-2021 a las 04:08:22
-- Versión del servidor: 8.0.26
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `alforno_v2021_nuevosistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_admin_user_menus`
--

CREATE TABLE `tbl_admin_user_menus` (
  `id` int NOT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `controller_name` varchar(50) DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_admin_user_menus`
--

INSERT INTO `tbl_admin_user_menus` (`id`, `menu_name`, `controller_name`, `del_status`) VALUES
(1, 'Sale', 'Sale', 'Live'),
(2, 'Purchase', 'Purchase', 'Live'),
(3, 'Inventory', 'Inventory', 'Live'),
(4, 'Waste', 'Waste', 'Live'),
(6, 'Expense', 'Expense', 'Live'),
(7, 'Report', 'Report', 'Live'),
(8, 'Dashboard', 'Dashboard', 'Live'),
(9, 'Master', 'Master', 'Live'),
(10, 'User', 'User', 'Live'),
(11, 'Supplier Payment', 'SupplierPayment', 'Live'),
(13, 'Inventory Adjustment', 'Inventory_adjustment', 'Live'),
(14, 'Short Message Service', 'Short_message_service', 'Live'),
(15, 'Customer Due Receive', 'Customer_due_receive', 'Live'),
(16, 'Attendance', 'Attendance', 'Live'),
(17, 'Bar', 'Bar', 'Live'),
(18, 'Kitchen', 'Kitchen', 'Live'),
(19, 'Waiter', 'Waiter', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `in_time` time DEFAULT NULL,
  `out_time` time DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_attendance`
--

INSERT INTO `tbl_attendance` (`id`, `reference_no`, `employee_id`, `date`, `in_time`, `out_time`, `note`, `user_id`, `company_id`, `del_status`) VALUES
(1, '000001', 9, '2021-06-11', '11:46:51', '00:00:00', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_companies`
--

CREATE TABLE `tbl_companies` (
  `id` int NOT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `date_format` varchar(50) DEFAULT NULL,
  `outlet_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_companies`
--

INSERT INTO `tbl_companies` (`id`, `currency`, `timezone`, `date_format`, `outlet_id`) VALUES
(1, '$', 'Asia/Dhaka', 'd/m/Y', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `area_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live',
  `date_of_birth` date DEFAULT NULL,
  `date_of_anniversary` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`id`, `name`, `phone`, `email`, `address`, `gst_number`, `area_id`, `user_id`, `company_id`, `del_status`, `date_of_birth`, `date_of_anniversary`) VALUES
(1, 'Consumidor Final', '', NULL, NULL, NULL, 0, 1, 1, 'Live', NULL, NULL),
(25, 'juan', '59648885', 'kike89mr@gmail.com', 'Zona 13 Guatemala', '', NULL, 1, 1, 'Live', '1969-12-31', '1969-12-31'),
(26, 'Henry', '4444444', '', 'direccion completa de entrega', '', NULL, 1, 1, 'Live', '1969-12-31', '1969-12-31'),
(27, 'Pedro', '888888888', '', 'ire', '', NULL, 1, 1, 'Live', '1969-12-31', '1969-12-31'),
(28, 'Victor Hugo', '50241889849', '', 'Aldea Chichimecas Lluvias Del Cielo', '', NULL, 1, 1, 'Live', '1969-12-31', '1969-12-31'),
(29, 'Alex Mazariegos', '54111592', '', 'Zona 5 Quetzaltenango', '54111592', NULL, 1, 1, 'Live', '1969-12-31', '1969-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customer_due_receives`
--

CREATE TABLE `tbl_customer_due_receives` (
  `id` int NOT NULL,
  `reference_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `only_date` date DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_expenses`
--

CREATE TABLE `tbl_expenses` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_expense_items`
--

CREATE TABLE `tbl_expense_items` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus`
--

CREATE TABLE `tbl_food_menus` (
  `id` int NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `sale_price` float(10,2) DEFAULT NULL,
  `tax_information` text,
  `vat_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `photo` varchar(250) DEFAULT NULL,
  `veg_item` varchar(50) DEFAULT 'Veg No',
  `beverage_item` varchar(50) DEFAULT 'Beverage No',
  `bar_item` varchar(50) DEFAULT 'Bar No',
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_food_menus`
--

INSERT INTO `tbl_food_menus` (`id`, `code`, `name`, `category_id`, `description`, `sale_price`, `tax_information`, `vat_id`, `user_id`, `company_id`, `photo`, `veg_item`, `beverage_item`, `bar_item`, `del_status`) VALUES
(1, '001', 'Chicharron 1', 1, '', 60.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '0df1b37f691645e67b946aed111c2af1.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(2, '002', 'Chicharron 1/2', 1, '', 30.00, '[]', NULL, 1, 1, 'fe34900ae3af1531ea2dc5d51054f23e.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(3, '003', 'Chicharron 1/4', 1, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'cc1ce7a0540bdaa41309d4ab17708880.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(4, '004', 'Chicharron 3/4', 1, '', 50.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '7c7df7fb42ac70216e503edb88058427.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(5, '005', 'Carnitas 1', 5, '', 65.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'ce952abf0ce69cb475b8b342738b7246.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(6, '006', 'Carnitas 3/4', 5, '', 55.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'bc2d214318350b2d572d1566995ba78c.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(7, '007', 'Carnitas 1/2', 5, '', 35.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '61d6ba50d124b2d25a4a868b3a69809f.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(8, '008', 'Carnitas 1/4', 5, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'c3d3233ba0a25cd575e5eb643c925627.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(9, '009', 'Agua pura', 2, '', 5.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'ed4cd849e0ac58afe01cfbf14c84de2b.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(10, '010', 'Chile Relleno', 7, '', 15.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '6e8fcf58bb26342a7aa446e76de34c7e.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(11, '011', 'JalapeÃ±o y cebollin', 3, '', 5.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '10d927ff8d6ab4463f07ba58ab8f1cbe.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(12, '012', 'Jugo del Valle', 2, '', 8.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '5a0058bebce5f9906bf35d7630d4052a.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(13, '013', 'Limon', 3, '', 1.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '6c8c4b7ef9e9c9e86db02c20b4f6874d.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(14, '014', 'Lengua de res con Huevo', 7, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '26fac337f82879344388ab3bf92e7056.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(15, '015', 'Morcilla 1', 6, '', 60.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '71fd5f7c3dbf387b074c617cf309cdb8.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(16, '016', 'Morcia 3/4', 6, '', 50.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'ee9f85517d8191a43dfe45154e8b935c.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(17, '017', 'Morcia 1/2', 6, '', 30.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '439eac14a04e01d648d4360c7567bbf8.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(18, '018', 'Morcia 1/4', 6, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '83256c08cf1fa18452b4f1567159dddc.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(19, '019', 'Rabano', 3, '', 5.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'a31531d013881d42a596e4b36314a33a.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(20, '020', 'Patitas de cerdo con Huevo', 7, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '6157ff700400cb6f559f4d5a1566d846.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(21, '021', 'Queso fresco 1/2', 3, '', 12.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'bd5f20d7113490fa66092d690c03cb45.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(22, '022', 'Soda desechable', 2, '', 10.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '93da3a1133f91cdbb65c5c112505123b.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(23, '023', 'Soda 1.5', 2, '', 15.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'c5577c6456a1e43adaa65c002f969b48.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(24, '024', 'Soda 2.5', 2, '', 20.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'a7599a0dc541afbed397d28131eadf64.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(25, '025', 'Soda vidrio', 2, '', 6.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '4e79dc57fb9c0517f6075ff1c64c2253.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(26, '026', 'Tortillas', 3, '', 1.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '74b5ea61b4ad349f23c095a9ba29a606.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(27, '027', 'PorciÃ³n Super Mixta', 8, '', 40.00, '[]', NULL, 1, 1, 'c1e151d26c46235bc2cf813468c942e6.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(28, '028', 'PorciÃ³n Mixta', 8, '', 35.00, '[]', NULL, 1, 1, '929a51f3c1a4ba007356dc2b46c9c503.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live'),
(29, '029', 'PorciÃ³n Simple', 9, '', 30.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '78774eeeb6bbb102ffb95a4d4115f7ad.jpg', 'Veg No', 'Bev No', 'Bar No', 'Deleted'),
(30, '030', 'Libra Mixta', 8, '', 65.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '197dcd1ba6ea2915f9b5b4caaa42b7ea.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(31, '031', '12 onzas Mixta', 8, '', 55.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '8b1abe205360e9e8ba1e71b24a444b25.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(32, '032', '1/2 Libra Mixta', 8, '', 35.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, '0b83e870e7404b2478cf5876cafb3aa7.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(33, '033', '1/4 Libra Mixta', 8, '', 20.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'd32207ad72c6ada0ebba4f02e310a05b.jpg', 'Veg No', 'Beverage No', 'Bar No', 'Live'),
(34, '034', 'PorciÃ³n Simple', 9, '', 30.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\"}]', NULL, 1, 1, 'f9b0154c3069606c48cb4a8f2fea127f.jpg', 'Veg No', 'Bev No', 'Bar No', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus_ingredients`
--

CREATE TABLE `tbl_food_menus_ingredients` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `food_menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_food_menus_ingredients`
--

INSERT INTO `tbl_food_menus_ingredients` (`id`, `ingredient_id`, `consumption`, `food_menu_id`, `user_id`, `company_id`, `del_status`) VALUES
(6, 2, 1.00, 1, 1, 1, 'Live'),
(7, 2, 0.50, 2, 1, 1, 'Live'),
(8, 2, 0.25, 3, 1, 1, 'Live'),
(10, 2, 0.75, 4, 1, 1, 'Live'),
(11, 3, 1.00, 5, 1, 1, 'Live'),
(12, 3, 0.50, 6, 1, 1, 'Live'),
(13, 3, 0.50, 7, 1, 1, 'Live'),
(14, 3, 0.25, 8, 1, 1, 'Live'),
(15, 4, 1.00, 9, 1, 1, 'Live'),
(17, 6, 1.00, 11, 1, 1, 'Live'),
(18, 7, 1.00, 12, 1, 1, 'Live'),
(19, 8, 1.00, 13, 1, 1, 'Live'),
(22, 10, 1.00, 15, 1, 1, 'Live'),
(23, 9, 1.00, 14, 1, 1, 'Live'),
(24, 5, 1.00, 10, 1, 1, 'Live'),
(25, 10, 0.75, 16, 1, 1, 'Live'),
(26, 10, 0.50, 17, 1, 1, 'Live'),
(27, 10, 0.25, 18, 1, 1, 'Live'),
(28, 12, 1.00, 19, 1, 1, 'Live'),
(29, 11, 1.00, 20, 1, 1, 'Live'),
(30, 13, 0.50, 21, 1, 1, 'Live'),
(31, 16, 1.00, 22, 1, 1, 'Live'),
(32, 14, 1.00, 23, 1, 1, 'Live'),
(33, 15, 1.00, 24, 1, 1, 'Live'),
(34, 17, 1.00, 25, 1, 1, 'Live'),
(35, 18, 1.00, 26, 1, 1, 'Live'),
(50, 12, 1.00, 28, 1, 1, 'Live'),
(51, 6, 1.00, 28, 1, 1, 'Live'),
(52, 12, 1.00, 27, 1, 1, 'Live'),
(53, 6, 1.00, 27, 1, 1, 'Live'),
(56, 6, 1.00, 30, 1, 1, 'Live'),
(57, 12, 1.00, 30, 1, 1, 'Live'),
(58, 6, 1.00, 31, 1, 1, 'Live'),
(59, 12, 1.00, 31, 1, 1, 'Live'),
(60, 6, 1.00, 32, 1, 1, 'Live'),
(61, 12, 1.00, 32, 1, 1, 'Live'),
(62, 6, 1.00, 33, 1, 1, 'Live'),
(63, 12, 1.00, 33, 1, 1, 'Live'),
(64, 12, 1.00, 29, 1, 1, 'Live'),
(65, 6, 1.00, 29, 1, 1, 'Live'),
(68, 6, 1.00, 34, 1, 1, 'Live'),
(69, 12, 1.00, 34, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menus_modifiers`
--

CREATE TABLE `tbl_food_menus_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int DEFAULT NULL,
  `food_menu_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_food_menu_categories`
--

CREATE TABLE `tbl_food_menu_categories` (
  `id` int NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int UNSIGNED DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_food_menu_categories`
--

INSERT INTO `tbl_food_menu_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Chicharrones', '', 1, 1, 'Live'),
(2, 'Bebidas', '', 1, 1, 'Live'),
(3, 'AcompaÃ±amientos', '', 1, 1, 'Live'),
(4, 'Extras', '', 1, 1, 'Deleted'),
(5, 'Carnitas', '', 1, 1, 'Live'),
(6, 'Morcia', '', 1, 1, 'Live'),
(7, 'Otros platos', '', 1, 1, 'Live'),
(8, 'Mixtas', '', 1, 1, 'Live'),
(9, 'Porciones', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds`
--

CREATE TABLE `tbl_holds` (
  `id` int NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `hold_no` varchar(30) NOT NULL DEFAULT '000000',
  `total_items` int DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `due_amount` double(10,2) DEFAULT NULL,
  `due_payment_date` date DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float(10,2) DEFAULT NULL,
  `vat` float(10,2) DEFAULT NULL,
  `total_payable` float(10,2) DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `table_id` int DEFAULT NULL,
  `total_item_discount_amount` float(10,2) NOT NULL,
  `sub_total_with_discount` float(10,2) NOT NULL,
  `sub_total_discount_amount` float(10,2) NOT NULL,
  `total_discount_amount` float(10,2) NOT NULL,
  `delivery_charge` float(10,2) NOT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `token_no` varchar(50) DEFAULT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_time` varchar(15) NOT NULL,
  `user_id` int DEFAULT NULL,
  `waiter_id` int DEFAULT '0',
  `outlet_id` int DEFAULT NULL,
  `order_status` tinyint(1) DEFAULT NULL COMMENT '1=new order, 2=cancelled order, 3=invoiced order',
  `sale_vat_objects` text,
  `order_type` tinyint(1) DEFAULT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds_details`
--

CREATE TABLE `tbl_holds_details` (
  `id` int NOT NULL,
  `food_menu_id` int DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `menu_price_without_discount` float(10,2) NOT NULL,
  `menu_price_with_discount` float(10,2) NOT NULL,
  `menu_unit_price` float(10,2) NOT NULL,
  `menu_vat_percentage` float(10,2) NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `discount_amount` double(10,2) DEFAULT NULL,
  `holds_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_holds_details_modifiers`
--

CREATE TABLE `tbl_holds_details_modifiers` (
  `id` int NOT NULL,
  `modifier_id` int NOT NULL,
  `modifier_price` float(10,2) NOT NULL,
  `food_menu_id` int NOT NULL,
  `holds_id` int NOT NULL,
  `holds_details_id` int NOT NULL,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ingredients`
--

CREATE TABLE `tbl_ingredients` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `purchase_price` float(10,2) DEFAULT NULL,
  `alert_quantity` float(10,2) DEFAULT NULL,
  `unit_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_ingredients`
--

INSERT INTO `tbl_ingredients` (`id`, `code`, `name`, `category_id`, `purchase_price`, `alert_quantity`, `unit_id`, `user_id`, `company_id`, `del_status`) VALUES
(1, '001', 'salsas', 1, 1500.00, 150.00, 1, 1, 1, 'Deleted'),
(2, '002', 'Chicharron', 1, 30.00, 5.00, 4, 1, 1, 'Live'),
(3, '003', 'Carnitas', 1, 25.00, 10.00, 4, 1, 1, 'Live'),
(4, '004', 'Agua pura', 3, 3.00, 5.00, 5, 1, 1, 'Live'),
(5, '005', 'Chile Relleno', 1, 8.00, 10.00, 5, 1, 1, 'Live'),
(6, '006', 'JalapeÃ±o y cebollin', 2, 3.00, 10.00, 5, 1, 1, 'Live'),
(7, '007', 'Jugo del Valle', 3, 4.00, 10.00, 5, 1, 1, 'Live'),
(8, '008', 'Limon', 2, 2.00, 10.00, 5, 1, 1, 'Live'),
(9, '009', 'Lengua de Res', 1, 7.00, 5.00, 5, 1, 1, 'Live'),
(10, '010', 'Morcia', 1, 25.00, 5.00, 4, 1, 1, 'Live'),
(11, '011', 'Patita de cerdo', 1, 9.00, 5.00, 5, 1, 1, 'Live'),
(12, '012', 'Rabano', 2, 2.00, 5.00, 5, 1, 1, 'Live'),
(13, '013', 'Queso Fresco', 2, 16.00, 2.00, 4, 1, 1, 'Live'),
(14, '014', 'Soda 1.5', 3, 9.00, 5.00, 5, 1, 1, 'Live'),
(15, '015', 'Soda 2.5', 3, 13.00, 5.00, 5, 1, 1, 'Live'),
(16, '016', 'Soda Desechable', 3, 6.00, 5.00, 5, 1, 1, 'Live'),
(17, '017', 'Soda vidrio', 3, 3.00, 10.00, 5, 1, 1, 'Live'),
(18, '018', 'Tortillas', 2, 1.00, 10.00, 5, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_ingredient_categories`
--

CREATE TABLE `tbl_ingredient_categories` (
  `id` int NOT NULL,
  `category_name` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_ingredient_categories`
--

INSERT INTO `tbl_ingredient_categories` (`id`, `category_name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Preparados', '', 1, 1, 'Live'),
(2, 'AcompaÃ±amientos', '', 1, 1, 'Live'),
(3, 'Bebidas', '', 1, 1, 'Live'),
(4, 'Mixtas', '', 1, 1, 'Live'),
(5, 'Porciones', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventory_adjustment`
--

CREATE TABLE `tbl_inventory_adjustment` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventory_adjustment_ingredients`
--

CREATE TABLE `tbl_inventory_adjustment_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption_amount` float(10,2) DEFAULT NULL,
  `inventory_adjustment_id` int DEFAULT NULL,
  `consumption_status` enum('Plus','Minus','') DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modifiers`
--

CREATE TABLE `tbl_modifiers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_modifier_ingredients`
--

CREATE TABLE `tbl_modifier_ingredients` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `modifier_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notifications`
--

CREATE TABLE `tbl_notifications` (
  `id` bigint NOT NULL,
  `notification` text NOT NULL,
  `outlet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_notification_bar_kitchen_panel`
--

CREATE TABLE `tbl_notification_bar_kitchen_panel` (
  `id` int NOT NULL,
  `notification` text NOT NULL,
  `outlet_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_orders_table`
--

CREATE TABLE `tbl_orders_table` (
  `id` bigint NOT NULL,
  `persons` int NOT NULL,
  `booking_time` datetime NOT NULL,
  `sale_id` int NOT NULL,
  `sale_no` varchar(20) NOT NULL,
  `outlet_id` int NOT NULL,
  `table_id` int NOT NULL,
  `del_status` varchar(20) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_orders_table`
--

INSERT INTO `tbl_orders_table` (`id`, `persons`, `booking_time`, `sale_id`, `sale_no`, `outlet_id`, `table_id`, `del_status`) VALUES
(2, 1, '2021-06-23 10:45:24', 15, '000015', 1, 1, 'Deleted'),
(3, 1, '2021-06-23 11:28:49', 16, '000016', 1, 1, 'Deleted'),
(4, 1, '2021-06-23 12:04:06', 17, '000017', 1, 1, 'Deleted'),
(6, 1, '2021-06-23 16:12:05', 23, '000023', 1, 2, 'Deleted'),
(7, 3, '2021-06-23 16:32:22', 25, '000025', 1, 1, 'Deleted'),
(8, 1, '2021-06-23 17:00:41', 27, '000027', 1, 2, 'Deleted'),
(9, 1, '2021-06-23 17:01:37', 28, '000028', 1, 2, 'Deleted'),
(10, 1, '2021-08-03 16:12:53', 257, '000257', 1, 1, 'Deleted'),
(11, 1, '2021-08-27 16:03:15', 259, '000259', 1, 1, 'Deleted');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_outlets`
--

CREATE TABLE `tbl_outlets` (
  `id` int NOT NULL,
  `outlet_name` varchar(50) DEFAULT NULL,
  `outlet_code` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `invoice_print` enum('Yes','No') DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `invoice_footer` varchar(500) DEFAULT NULL,
  `collect_tax` varchar(10) DEFAULT NULL,
  `tax_title` varchar(10) DEFAULT NULL,
  `tax_registration_no` varchar(30) DEFAULT NULL,
  `tax_is_gst` varchar(10) NOT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `pre_or_post_payment` varchar(500) DEFAULT 'Post Payment',
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_outlets`
--

INSERT INTO `tbl_outlets` (`id`, `outlet_name`, `outlet_code`, `address`, `phone`, `invoice_print`, `starting_date`, `invoice_footer`, `collect_tax`, `tax_title`, `tax_registration_no`, `tax_is_gst`, `state_code`, `pre_or_post_payment`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'La Escuintleca', '000001', 'Quetzaltenango', '41837020', 'Yes', '2018-02-18', 'Gracias Por Tu Compra Vuelve Pronto.', 'No', 'IVA', '', 'Yes', '', 'Pre Payment', 2, 1, 'Live'),
(2, 'Restaurant la Sexta', '001000', '6 AVenida Guatemala', '88889999', 'Yes', '2021-06-23', NULL, 'No', NULL, NULL, '', NULL, 'Post Payment', NULL, NULL, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_outlet_taxes`
--

CREATE TABLE `tbl_outlet_taxes` (
  `id` int NOT NULL,
  `tax` varchar(50) NOT NULL,
  `outlet_id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(100) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_outlet_taxes`
--

INSERT INTO `tbl_outlet_taxes` (`id`, `tax`, `outlet_id`, `user_id`, `company_id`, `del_status`) VALUES
(6, '', 1, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_payment_methods`
--

CREATE TABLE `tbl_payment_methods` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_payment_methods`
--

INSERT INTO `tbl_payment_methods` (`id`, `name`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(3, 'Efectivo', 'Efectivo', 1, 1, 'Live'),
(4, 'Tarjeta de Credito', 'Tarjeta de Credito', 1, 1, 'Live'),
(5, 'Credito', 'Credito', 1, 1, 'Live'),
(6, 'Pago Mixto', 'Pago Mixto', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase`
--

CREATE TABLE `tbl_purchase` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `date` varchar(15) NOT NULL,
  `subtotal` float(10,2) DEFAULT NULL,
  `other` float(10,2) DEFAULT NULL,
  `grand_total` float(10,2) DEFAULT NULL,
  `paid` float(10,2) DEFAULT NULL,
  `due` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_purchase`
--

INSERT INTO `tbl_purchase` (`id`, `reference_no`, `supplier_id`, `date`, `subtotal`, `other`, `grand_total`, `paid`, `due`, `note`, `user_id`, `outlet_id`, `del_status`) VALUES
(1, '000001', 1, '2021-06-22', NULL, NULL, 7643.00, 7643.00, 0.00, NULL, 1, 1, 'Live'),
(2, '000002', 1, '2021-09-14', NULL, NULL, 500.00, 500.00, 0.00, NULL, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase_ingredients`
--

CREATE TABLE `tbl_purchase_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `quantity_amount` float(10,2) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_purchase_ingredients`
--

INSERT INTO `tbl_purchase_ingredients` (`id`, `ingredient_id`, `unit_price`, `quantity_amount`, `total`, `purchase_id`, `outlet_id`, `del_status`) VALUES
(1, 4, 3.00, 50.00, 150.00, 1, 1, 'Live'),
(2, 3, 25.00, 75.00, 1875.00, 1, 1, 'Live'),
(3, 2, 30.00, 75.00, 2250.00, 1, 1, 'Live'),
(4, 5, 8.00, 25.00, 200.00, 1, 1, 'Live'),
(5, 6, 3.00, 25.00, 75.00, 1, 1, 'Live'),
(6, 7, 4.00, 50.00, 200.00, 1, 1, 'Live'),
(7, 9, 7.00, 25.00, 175.00, 1, 1, 'Live'),
(8, 8, 2.00, 100.00, 200.00, 1, 1, 'Live'),
(9, 10, 25.00, 25.00, 625.00, 1, 1, 'Live'),
(10, 11, 9.00, 25.00, 225.00, 1, 1, 'Live'),
(11, 13, 16.00, 10.00, 160.00, 1, 1, 'Live'),
(12, 12, 2.00, 30.00, 60.00, 1, 1, 'Live'),
(13, 14, 9.00, 40.00, 360.00, 1, 1, 'Live'),
(14, 15, 13.00, 40.00, 520.00, 1, 1, 'Live'),
(15, 16, 6.00, 30.00, 180.00, 1, 1, 'Live'),
(16, 17, 3.00, 96.00, 288.00, 1, 1, 'Live'),
(17, 18, 1.00, 100.00, 100.00, 1, 1, 'Live'),
(18, 3, 25.00, 20.00, 500.00, 2, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_register`
--

CREATE TABLE `tbl_register` (
  `id` int NOT NULL,
  `opening_balance` float(10,2) NOT NULL,
  `closing_balance` float(10,2) NOT NULL,
  `opening_balance_date_time` datetime NOT NULL,
  `closing_balance_date_time` datetime NOT NULL,
  `sale_paid_amount` float(10,2) NOT NULL,
  `customer_due_receive` float(10,2) NOT NULL,
  `payment_methods_sale` text NOT NULL,
  `register_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=open,2=closed',
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_register`
--

INSERT INTO `tbl_register` (`id`, `opening_balance`, `closing_balance`, `opening_balance_date_time`, `closing_balance_date_time`, `sale_paid_amount`, `customer_due_receive`, `payment_methods_sale`, `register_status`, `user_id`, `outlet_id`, `company_id`) VALUES
(25, 0.00, 0.00, '2021-06-22 22:55:28', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(26, 200.00, 275.00, '2021-06-23 08:23:19', '2021-06-23 09:54:00', 75.00, 0.00, '{\"Cash\": 75.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(27, 200.00, 300.00, '2021-06-23 09:54:55', '2021-06-23 11:59:27', 100.00, 0.00, '{\"Cash\": 100.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(28, 200.00, 733.00, '2021-06-23 12:00:10', '2021-06-23 13:02:55', 533.00, 0.00, '{\"Cash\": 533.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(29, 300.00, 0.00, '2021-06-23 13:03:08', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(30, 200.00, 0.00, '2021-06-25 09:18:17', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(31, 200.00, 0.00, '2021-06-26 09:03:12', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(32, 200.00, 0.00, '2021-06-26 09:03:15', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(33, 455.00, 0.00, '2021-06-27 10:57:45', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(34, 200.00, 2305.00, '2021-06-29 10:12:21', '2021-06-29 17:19:40', 2105.00, 0.00, '{\"Cash\": 2105.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(35, 425.00, 0.00, '2021-06-30 10:36:36', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(36, 425.00, 0.00, '2021-06-30 10:36:41', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(37, 200.00, 0.00, '2021-07-01 12:56:32', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(38, 200.00, 0.00, '2021-07-01 12:56:35', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(39, 0.00, 3863.00, '2021-07-02 09:57:06', '2021-07-02 17:45:28', 3863.00, 0.00, '{\"Cash\": 3863.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(40, 0.00, 0.00, '2021-07-02 18:16:40', '2021-07-02 18:31:55', 0.00, 0.00, '{\"Cash\": ,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(41, 0.00, 0.00, '2021-07-02 18:33:08', '2021-07-02 18:52:49', 0.00, 0.00, '{\"Cash\": ,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(42, 0.00, 0.00, '2021-07-02 18:33:11', '2021-07-02 18:34:06', 0.00, 0.00, '{\"Cash\": ,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(43, 397.00, 397.00, '2021-07-03 08:14:31', '2021-07-03 08:33:56', 0.00, 0.00, '{\"Cash\": ,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(44, 397.00, 4208.00, '2021-07-03 08:35:12', '2021-07-03 18:38:12', 3811.00, 0.00, '{\"Cash\": 3811.00,\"Paypal\": ,\"Card\": }', 2, 1, 1, 1),
(45, 440.00, 0.00, '2021-07-05 13:05:16', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(46, 0.00, 0.00, '2021-07-07 15:41:58', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(47, 0.00, 0.00, '2021-07-08 11:59:46', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(48, 100.00, 0.00, '2021-08-03 16:10:55', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(49, 25.00, 0.00, '2021-08-25 09:45:02', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(50, 100.00, 0.00, '2021-08-27 16:00:57', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(51, 100.00, 0.00, '2021-09-14 11:31:49', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(52, 100.00, 0.00, '2021-09-14 11:32:05', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(53, 100.00, 0.00, '2021-09-14 11:32:05', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(54, 100.00, 0.00, '2021-09-14 11:32:05', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(55, 100.00, 0.00, '2021-09-14 11:32:10', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(56, 100.00, 0.00, '2021-09-15 10:40:13', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(57, 1.00, 0.00, '2021-09-17 13:39:17', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(58, 1.00, 0.00, '2021-09-17 15:06:00', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(59, 1.00, 0.00, '2021-09-17 15:09:55', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(60, 1.00, 0.00, '2021-09-18 06:20:21', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(61, 1.00, 0.00, '2021-09-18 07:41:55', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 11, 1, 1),
(62, 1.00, 0.00, '2021-09-24 23:42:55', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(63, 1.00, 0.00, '2021-09-25 07:05:15', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(64, 1.00, 0.00, '2021-09-26 11:35:03', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1),
(65, 1.00, 0.00, '2021-09-27 11:50:30', '0000-00-00 00:00:00', 0.00, 0.00, '', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `id` int NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `sale_no` varchar(30) NOT NULL DEFAULT '000000',
  `total_items` int DEFAULT NULL,
  `sub_total` float(10,2) DEFAULT NULL,
  `paid_amount` double(10,2) DEFAULT NULL,
  `due_amount` float(10,2) DEFAULT NULL,
  `disc` varchar(50) DEFAULT NULL,
  `disc_actual` float(10,2) DEFAULT NULL,
  `vat` float(10,2) DEFAULT NULL,
  `total_payable` float(10,2) DEFAULT NULL,
  `payment_method_id` int DEFAULT NULL,
  `close_time` time NOT NULL,
  `table_id` int DEFAULT NULL,
  `total_item_discount_amount` float(10,2) NOT NULL,
  `sub_total_with_discount` float(10,2) NOT NULL,
  `sub_total_discount_amount` float(10,2) NOT NULL,
  `total_discount_amount` float(10,2) NOT NULL,
  `delivery_charge` float(10,2) NOT NULL,
  `sub_total_discount_value` varchar(10) NOT NULL,
  `sub_total_discount_type` varchar(20) NOT NULL,
  `sale_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_time` time NOT NULL,
  `cooking_start_time` datetime NOT NULL,
  `cooking_done_time` datetime NOT NULL,
  `modified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `user_id` int DEFAULT NULL,
  `waiter_id` int NOT NULL DEFAULT '0',
  `outlet_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order, 2=invoiced order, 3=closed order',
  `order_type` tinyint(1) NOT NULL COMMENT '1=dine in, 2 = take away, 3 = delivery',
  `del_status` varchar(50) DEFAULT 'Live',
  `sale_vat_objects` text,
  `pay_cash` float(10,2) NOT NULL,
  `pay_one` float(10,2) NOT NULL,
  `pay_two` float(10,2) NOT NULL,
  `pay_three` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_sales`
--

INSERT INTO `tbl_sales` (`id`, `customer_id`, `sale_no`, `total_items`, `sub_total`, `paid_amount`, `due_amount`, `disc`, `disc_actual`, `vat`, `total_payable`, `payment_method_id`, `close_time`, `table_id`, `total_item_discount_amount`, `sub_total_with_discount`, `sub_total_discount_amount`, `total_discount_amount`, `delivery_charge`, `sub_total_discount_value`, `sub_total_discount_type`, `sale_date`, `date_time`, `order_time`, `cooking_start_time`, `cooking_done_time`, `modified`, `user_id`, `waiter_id`, `outlet_id`, `order_status`, `order_type`, `del_status`, `sale_vat_objects`, `pay_cash`, `pay_one`, `pay_two`, `pay_three`) VALUES
(11, '26', '000011', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '11:30:32', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 16:42:54', '09:42:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(12, '26', '000012', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '12:01:08', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 16:45:31', '09:45:31', '0000-00-00 00:00:00', '2021-06-23 09:57:26', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(13, '26', '000013', 2, 75.00, 75.00, 0.00, NULL, NULL, 0.00, 75.00, 3, '09:47:51', NULL, 0.00, 75.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 16:47:16', '09:47:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(14, '26', '000014', 4, 82.00, 82.00, 0.00, NULL, NULL, 0.00, 82.00, 3, '12:01:13', NULL, 0.00, 82.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 16:52:09', '09:52:09', '2021-06-23 09:56:00', '2021-06-23 09:56:05', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(15, '28', '000015', 1, 60.00, 66.00, 0.00, NULL, NULL, 0.00, 66.00, 3, '12:02:02', NULL, 0.00, 60.00, 0.00, 0.00, 6.00, '', 'plain', '2021-06-23', '2021-06-23 17:45:24', '10:45:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 10, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(16, '1', '000016', 3, 100.00, 100.00, 0.00, NULL, NULL, 0.00, 100.00, 3, '12:02:05', NULL, 0.00, 100.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 18:28:49', '11:28:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 9, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(17, '26', '000017', 6, 54.00, 54.00, 0.00, NULL, NULL, 0.00, 54.00, 3, '12:19:08', NULL, 0.00, 54.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 19:04:06', '12:04:06', '0000-00-00 00:00:00', '2021-06-23 12:05:03', 'No', 1, 9, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(18, '25', '000018', 4, 151.00, 151.00, 0.00, NULL, NULL, 0.00, 151.00, 3, '12:08:04', NULL, 0.00, 151.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 19:06:24', '12:06:24', '2021-06-23 12:06:59', '2021-06-23 12:07:07', 'No', 1, 9, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(19, '25', '000019', 6, 182.00, 182.00, 0.00, NULL, NULL, 0.00, 182.00, 3, '12:22:30', NULL, 0.00, 182.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 19:08:22', '12:08:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(20, '1', '000020', 2, 66.00, 66.00, 0.00, NULL, NULL, 0.00, 66.00, 3, '13:02:04', NULL, 0.00, 66.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 19:34:45', '12:34:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 9, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(21, '28', '000021', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '13:02:08', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 20:00:40', '13:00:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(22, '1', '000022', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '16:11:14', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 23:00:05', '16:00:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(23, '1', '000023', 2, 43.00, 43.00, 0.00, NULL, NULL, 0.00, 43.00, 5, '20:36:23', NULL, 0.00, 43.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 23:12:05', '16:12:05', '0000-00-00 00:00:00', '2021-06-23 20:34:03', 'No', 1, 15, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(24, '1', '000024', 7, 75.00, 75.00, 0.00, NULL, NULL, 0.00, 75.00, 3, '16:32:55', NULL, 0.00, 75.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 23:29:19', '16:29:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(25, '1', '000025', 3, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '09:38:29', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 23:32:22', '16:32:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 15, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(26, '29', '000026', 2, 61.00, 61.00, 0.00, NULL, NULL, 0.00, 61.00, 3, '16:53:44', NULL, 0.00, 61.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-23', '2021-06-23 23:53:24', '16:53:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(27, '29', '000027', 3, 24.00, 26.40, 0.00, NULL, NULL, 0.00, 26.40, 3, '09:38:35', NULL, 0.00, 24.00, 0.00, 0.00, 2.40, '', 'plain', '2021-06-23', '2021-06-24 00:00:41', '17:00:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 15, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(28, '1', '000028', 2, 18.00, 18.00, 0.00, NULL, NULL, 0.00, 18.00, 3, '09:38:39', NULL, 0.00, 18.00, 0.00, 0.00, 1.80, '', 'plain', '2021-06-23', '2021-06-24 00:01:37', '17:01:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 15, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(29, '26', '000029', 2, 61.00, 61.00, 0.00, NULL, NULL, 0.00, 61.00, 3, '09:18:52', NULL, 0.00, 61.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 16:18:41', '09:18:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(30, '26', '000030', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '09:45:36', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 16:45:19', '09:45:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(31, '26', '000031', 2, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '09:51:03', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 16:50:55', '09:50:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(32, '26', '000032', 2, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '10:03:11', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 16:51:28', '09:51:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(33, '26', '000033', 2, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '10:08:33', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:08:22', '10:08:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(34, '1', '000034', 7, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '10:27:54', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:27:14', '10:27:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(35, '26', '000035', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '10:31:35', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:30:51', '10:30:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(36, '26', '000036', 3, 77.00, 77.00, 0.00, NULL, NULL, 0.00, 77.00, 3, '10:36:59', NULL, 0.00, 77.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:34:41', '10:34:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(37, '29', '000037', 1, 8.00, 8.00, 0.00, NULL, NULL, 0.00, 8.00, 3, '11:02:49', NULL, 0.00, 8.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:38:36', '10:38:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(38, '26', '000038', 2, 50.00, 50.00, 0.00, NULL, NULL, 0.00, 50.00, 3, '10:41:13', NULL, 0.00, 50.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:41:08', '10:41:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(39, '29', '000039', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '11:02:52', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:48:23', '10:48:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(40, '26', '000040', 5, 122.00, 122.00, 0.00, NULL, NULL, 0.00, 122.00, 3, '10:49:03', NULL, 0.00, 122.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 17:48:59', '10:48:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(41, '1', '000041', 3, 12.00, 12.00, 0.00, NULL, NULL, 0.00, 12.00, 3, '09:06:07', NULL, 0.00, 12.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 18:05:23', '11:05:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(42, '1', '000042', 4, 62.00, 62.00, 0.00, NULL, NULL, 0.00, 62.00, 3, '09:06:21', NULL, 0.00, 62.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 18:06:13', '11:06:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(43, '1', '000043', 3, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '09:06:26', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 18:06:45', '11:06:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(44, '29', '000044', 1, 1.00, 1.00, 0.00, NULL, NULL, 0.00, 1.00, 3, '14:27:04', NULL, 0.00, 1.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 18:14:56', '11:14:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(45, '25', '000045', 1, 1.00, 1.00, 0.00, NULL, NULL, 0.00, 1.00, 3, '14:26:50', NULL, 0.00, 1.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 18:41:12', '11:41:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 0, 1, 3, 3, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(46, '1', '000046', 5, 95.00, 104.50, 0.00, NULL, NULL, 0.00, 104.50, 3, '14:04:33', NULL, 0.00, 95.00, 0.00, 0.00, 9.50, '', 'plain', '2021-06-25', '2021-06-25 20:42:02', '13:42:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(47, '1', '000047', 4, 84.00, 92.40, 0.00, NULL, NULL, 0.00, 92.40, 3, '14:26:14', NULL, 0.00, 84.00, 0.00, 0.00, 8.40, '', 'plain', '2021-06-25', '2021-06-25 21:11:24', '14:11:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(49, '1', '000049', 1, 1.00, 1.00, 0.00, NULL, NULL, 0.00, 1.00, 3, '14:25:52', NULL, 0.00, 1.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 21:20:10', '14:20:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(50, '1', '000050', 3, 44.00, 44.00, 0.00, NULL, NULL, 0.00, 44.00, 3, '12:41:36', NULL, 0.00, 44.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-25', '2021-06-25 21:24:54', '14:24:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(51, '1', '000051', 4, 160.00, 176.00, 0.00, NULL, NULL, 0.00, 176.00, 3, '12:40:47', NULL, 0.00, 160.00, 0.00, 0.00, 16.00, '', 'plain', '2021-06-26', '2021-06-26 16:09:33', '09:09:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(52, '1', '000052', 5, 93.00, 93.00, 0.00, NULL, NULL, 0.00, 93.00, 3, '11:01:25', NULL, 0.00, 93.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-26', '2021-06-26 21:56:54', '14:56:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 15, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(53, '1', '000053', 2, 250.00, 250.00, 0.00, NULL, NULL, 0.00, 250.00, 3, '12:08:29', NULL, 0.00, 250.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:01:49', '11:01:49', '0000-00-00 00:00:00', '2021-06-29 11:27:10', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(54, '1', '000054', 2, 28.00, 28.00, 0.00, NULL, NULL, 0.00, 28.00, 3, '12:10:02', NULL, 0.00, 28.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:02:20', '11:02:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(55, '1', '000055', 1, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '12:42:58', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:02:53', '11:02:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(56, '1', '000056', 6, 125.00, 125.00, 0.00, NULL, NULL, 0.00, 125.00, 3, '12:43:22', NULL, 0.00, 125.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:04:22', '11:04:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(57, '1', '000057', 5, 70.00, 70.00, 0.00, NULL, NULL, 0.00, 70.00, 3, '12:43:39', NULL, 0.00, 70.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:06:22', '11:06:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(58, '1', '000058', 3, 24.00, 24.00, 0.00, NULL, NULL, 0.00, 24.00, 3, '12:43:57', NULL, 0.00, 24.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:06:43', '11:06:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(59, '1', '000059', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '12:44:19', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:15:11', '11:15:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(60, '1', '000060', 13, 114.00, 114.00, 0.00, NULL, NULL, 0.00, 114.00, 3, '12:44:41', NULL, 0.00, 114.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:19:53', '11:19:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(61, '1', '000061', 13, 212.00, 212.00, 0.00, NULL, NULL, 0.00, 212.00, 3, '12:44:52', NULL, 0.00, 212.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:55:40', '11:55:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(62, '1', '000062', 6, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '12:45:09', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:59:01', '11:59:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(63, '1', '000063', 1, 12.00, 12.00, 0.00, NULL, NULL, 0.00, 12.00, 3, '12:45:42', NULL, 0.00, 12.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 18:59:35', '11:59:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(64, '1', '000064', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '12:46:15', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:05:51', '12:05:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(65, '1', '000065', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '12:46:27', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:16:35', '12:16:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(66, '1', '000066', 7, 280.00, 280.00, 0.00, NULL, NULL, 0.00, 280.00, 3, '10:45:44', NULL, 0.00, 280.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:25:05', '12:25:05', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(67, '1', '000067', 3, 26.00, 26.00, 0.00, NULL, NULL, 0.00, 26.00, 3, '17:19:02', NULL, 0.00, 26.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:26:37', '12:26:37', '0000-00-00 00:00:00', '2021-06-29 14:41:55', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(68, '1', '000068', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 4, '16:51:31', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:27:47', '12:27:47', '0000-00-00 00:00:00', '2021-06-29 14:42:09', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(69, '1', '000069', 1, 6.00, 6.00, 0.00, NULL, NULL, 0.00, 6.00, 3, '16:50:14', NULL, 0.00, 6.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:28:57', '12:28:57', '0000-00-00 00:00:00', '2021-06-29 14:42:13', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(70, '1', '000070', 4, 190.00, 190.00, 0.00, NULL, NULL, 0.00, 190.00, 3, '16:49:34', NULL, 0.00, 190.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:44:41', '12:44:41', '0000-00-00 00:00:00', '2021-06-29 14:42:25', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(71, '1', '000071', 4, 72.00, 72.00, 0.00, NULL, NULL, 0.00, 72.00, 3, '16:47:35', NULL, 0.00, 72.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:47:32', '12:47:32', '2021-06-29 14:42:44', '2021-06-29 14:42:57', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(72, '1', '000072', 3, 105.00, 105.00, 0.00, NULL, NULL, 0.00, 105.00, 3, '16:46:51', NULL, 0.00, 105.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:48:46', '12:48:46', '2021-06-29 14:43:18', '2021-06-29 14:43:35', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(73, '1', '000073', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '16:46:08', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:49:43', '12:49:43', '0000-00-00 00:00:00', '2021-06-29 14:43:41', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(74, '1', '000074', 5, 5.00, 5.00, 0.00, NULL, NULL, 0.00, 5.00, 3, '14:37:54', NULL, 0.00, 5.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 19:53:07', '12:53:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(75, '1', '000075', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '14:37:25', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:02:15', '13:02:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(76, '1', '000076', 9, 136.00, 136.00, 0.00, NULL, NULL, 0.00, 136.00, 3, '14:37:11', NULL, 0.00, 136.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:03:16', '13:03:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(77, '1', '000077', 2, 70.00, 70.00, 0.00, NULL, NULL, 0.00, 70.00, 3, '14:28:25', NULL, 0.00, 70.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:04:25', '13:04:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(78, '1', '000078', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:28:40', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:06:27', '13:06:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(79, '1', '000079', 3, 90.00, 90.00, 0.00, NULL, NULL, 0.00, 90.00, 3, '14:28:58', NULL, 0.00, 90.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:09:23', '13:09:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(80, '1', '000080', 5, 5.00, 5.00, 0.00, NULL, NULL, 0.00, 5.00, 3, '14:29:13', NULL, 0.00, 5.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:09:43', '13:09:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(81, '1', '000081', 2, 70.00, 70.00, 0.00, NULL, NULL, 0.00, 70.00, 3, '14:29:30', NULL, 0.00, 70.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:11:09', '13:11:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(82, '1', '000082', 3, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '14:29:46', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:12:18', '13:12:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(83, '1', '000083', 1, 50.00, 50.00, 0.00, NULL, NULL, 0.00, 50.00, 3, '14:30:02', NULL, 0.00, 50.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:15:07', '13:15:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(84, '1', '000084', 7, 41.00, 41.00, 0.00, NULL, NULL, 0.00, 41.00, 3, '14:30:21', NULL, 0.00, 41.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:22:50', '13:22:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(85, '1', '000085', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '14:30:35', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:23:34', '13:23:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(86, '1', '000086', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '14:30:52', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:24:33', '13:24:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(87, '1', '000087', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:31:12', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:26:00', '13:26:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(88, '1', '000088', 2, 23.00, 23.00, 0.00, NULL, NULL, 0.00, 23.00, 3, '14:31:36', NULL, 0.00, 23.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:27:17', '13:27:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(89, '1', '000089', 1, 10.00, 10.00, 0.00, NULL, NULL, 0.00, 10.00, 3, '14:32:08', NULL, 0.00, 10.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:31:48', '13:31:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(90, '1', '000090', 3, 137.00, 137.00, 0.00, NULL, NULL, 0.00, 137.00, 3, '14:32:25', NULL, 0.00, 137.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:39:44', '13:39:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(91, '1', '000091', 15, 130.00, 130.00, 0.00, NULL, NULL, 0.00, 130.00, 3, '14:32:49', NULL, 0.00, 130.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:41:48', '13:41:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(92, '1', '000092', 8, 62.00, 62.00, 0.00, NULL, NULL, 0.00, 62.00, 3, '14:33:56', NULL, 0.00, 62.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:44:04', '13:44:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(93, '1', '000093', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '14:34:16', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:44:33', '13:44:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(94, '1', '000094', 2, 42.00, 42.00, 0.00, NULL, NULL, 0.00, 42.00, 3, '14:34:58', NULL, 0.00, 42.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:50:29', '13:50:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(95, '1', '000095', 6, 29.00, 29.00, 0.00, NULL, NULL, 0.00, 29.00, 3, '14:35:12', NULL, 0.00, 29.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:52:14', '13:52:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(96, '1', '000096', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '14:35:26', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:52:53', '13:52:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(97, '1', '000097', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '14:35:47', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 20:57:30', '13:57:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(98, '1', '000098', 6, 88.00, 88.00, 0.00, NULL, NULL, 0.00, 88.00, 3, '14:36:15', NULL, 0.00, 88.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:03:06', '14:03:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(99, '1', '000099', 6, 49.00, 49.00, 0.00, NULL, NULL, 0.00, 49.00, 3, '14:36:30', NULL, 0.00, 49.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:05:26', '14:05:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(100, '1', '000100', 3, 190.00, 190.00, 0.00, NULL, NULL, 0.00, 190.00, 3, '14:36:53', NULL, 0.00, 190.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:06:35', '14:06:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(101, '1', '000101', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:27:24', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:09:40', '14:09:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(102, '1', '000102', 3, 37.00, 37.00, 0.00, NULL, NULL, 0.00, 37.00, 3, '14:27:05', NULL, 0.00, 37.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:17:19', '14:17:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(103, '1', '000103', 21, 291.00, 291.00, 0.00, NULL, NULL, 0.00, 291.00, 3, '14:26:51', NULL, 0.00, 291.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:21:15', '14:21:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(104, '1', '000104', 6, 74.00, 74.00, 0.00, NULL, NULL, 0.00, 74.00, 3, '14:26:34', NULL, 0.00, 74.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:24:34', '14:24:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(105, '1', '000105', 12, 135.00, 135.00, 0.00, NULL, NULL, 0.00, 135.00, 3, '14:26:19', NULL, 0.00, 135.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:26:14', '14:26:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(106, '1', '000106', 3, 145.00, 145.00, 0.00, NULL, NULL, 0.00, 145.00, 3, '14:26:03', NULL, 0.00, 145.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:28:26', '14:28:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(107, '1', '000107', 7, 71.00, 71.00, 0.00, NULL, NULL, 0.00, 71.00, 3, '14:25:47', NULL, 0.00, 71.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:29:45', '14:29:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(108, '1', '000108', 9, 126.00, 138.60, 0.00, NULL, NULL, 0.00, 138.60, 3, '14:25:31', NULL, 0.00, 126.00, 0.00, 0.00, 12.60, '', 'plain', '2021-06-27', '2021-06-27 21:32:27', '14:32:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(109, '1', '000109', 7, 307.00, 307.00, 0.00, NULL, NULL, 0.00, 307.00, 3, '14:25:15', NULL, 0.00, 307.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:42:26', '14:42:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(110, '1', '000110', 10, 103.00, 103.00, 0.00, NULL, NULL, 0.00, 103.00, 3, '14:24:56', NULL, 0.00, 103.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:46:16', '14:46:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(111, '1', '000111', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '14:24:24', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:49:21', '14:49:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(112, '1', '000112', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:23:55', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:49:33', '14:49:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(113, '1', '000113', 1, 55.00, 55.00, 0.00, NULL, NULL, 0.00, 55.00, 3, '14:23:36', NULL, 0.00, 55.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:51:46', '14:51:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(114, '1', '000114', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '14:23:13', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 21:55:28', '14:55:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(115, '1', '000115', 5, 34.00, 34.00, 0.00, NULL, NULL, 0.00, 34.00, 3, '14:22:50', NULL, 0.00, 34.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 22:16:59', '15:16:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(116, '1', '000116', 3, 14.00, 14.00, 0.00, NULL, NULL, 0.00, 14.00, 3, '14:22:25', NULL, 0.00, 14.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 22:20:09', '15:20:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(117, '1', '000117', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '14:21:17', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 22:27:35', '15:27:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(118, '1', '000118', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '14:20:47', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-27', '2021-06-27 23:18:39', '16:18:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(119, '1', '000119', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '14:19:23', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 17:13:28', '10:13:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(120, '1', '000120', 1, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '14:19:12', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 18:50:54', '11:50:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(121, '1', '000121', 3, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '14:18:38', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 18:53:42', '11:53:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(122, '1', '000122', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '11:55:28', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 18:55:24', '11:55:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(123, '1', '000123', 3, 90.00, 90.00, 0.00, NULL, NULL, 0.00, 90.00, 3, '14:18:00', NULL, 0.00, 90.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 18:58:50', '11:58:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(124, '1', '000124', 2, 36.00, 36.00, 0.00, NULL, NULL, 0.00, 36.00, 3, '14:17:48', NULL, 0.00, 36.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 19:36:28', '12:36:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(125, '1', '000125', 2, 36.00, 36.00, 0.00, NULL, NULL, 0.00, 36.00, 3, '14:17:37', NULL, 0.00, 36.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 19:36:28', '12:36:28', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(126, '1', '000126', 2, 125.00, 125.00, 0.00, NULL, NULL, 0.00, 125.00, 3, '12:53:41', NULL, 0.00, 125.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 19:52:08', '12:52:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(127, '1', '000127', 3, 51.00, 51.00, 0.00, NULL, NULL, 0.00, 51.00, 3, '14:17:21', NULL, 0.00, 51.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 19:55:18', '12:55:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(128, '1', '000128', 5, 82.00, 82.00, 0.00, NULL, NULL, 0.00, 82.00, 3, '14:16:52', NULL, 0.00, 82.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 20:32:32', '13:32:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(129, '1', '000129', 2, 75.00, 75.00, 0.00, NULL, NULL, 0.00, 75.00, 3, '14:16:32', NULL, 0.00, 75.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 20:35:02', '13:35:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(130, '1', '000130', 2, 60.00, 66.00, 0.00, NULL, NULL, 0.00, 66.00, 3, '14:14:47', NULL, 0.00, 60.00, 0.00, 0.00, 6.00, '', 'plain', '2021-06-29', '2021-06-29 20:49:29', '13:49:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(131, '1', '000131', 6, 92.00, 92.00, 0.00, NULL, NULL, 0.00, 92.00, 3, '14:14:18', NULL, 0.00, 92.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 20:55:43', '13:55:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(132, '1', '000132', 6, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '14:13:59', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 21:05:06', '14:05:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(133, '1', '000133', 5, 113.00, 113.00, 0.00, NULL, NULL, 0.00, 113.00, 3, '14:10:05', NULL, 0.00, 113.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 21:09:40', '14:09:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(134, '1', '000134', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '14:13:34', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 21:13:15', '14:13:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(135, '1', '000135', 5, 202.00, 202.00, 0.00, NULL, NULL, 0.00, 202.00, 3, '15:22:27', NULL, 0.00, 202.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:04:27', '15:04:27', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(136, '1', '000136', 4, 94.00, 94.00, 0.00, NULL, NULL, 0.00, 94.00, 3, '15:22:22', NULL, 0.00, 94.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:19:15', '15:19:15', '2021-06-29 15:21:11', '2021-06-29 15:21:38', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(137, '1', '000137', 3, 46.00, 46.00, 0.00, NULL, NULL, 0.00, 46.00, 3, '15:26:16', NULL, 0.00, 46.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:23:37', '15:23:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(138, '1', '000138', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '16:45:37', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:26:44', '15:26:44', '0000-00-00 00:00:00', '2021-06-29 15:32:27', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(139, '1', '000139', 4, 169.00, 169.00, 0.00, NULL, NULL, 0.00, 169.00, 3, '15:34:38', NULL, 0.00, 169.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:33:35', '15:33:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(140, '1', '000140', 12, 333.00, 333.00, 0.00, NULL, NULL, 0.00, 333.00, 3, '16:44:21', NULL, 0.00, 333.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 22:39:04', '15:39:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(141, '1', '000141', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '16:43:02', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-29', '2021-06-29 23:34:15', '16:34:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(142, '1', '000142', 2, 70.00, 70.00, 0.00, NULL, NULL, 0.00, 70.00, 3, '09:57:38', NULL, 0.00, 70.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 17:39:13', '10:39:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(143, '1', '000143', 2, 21.00, 21.00, 0.00, NULL, NULL, 0.00, 21.00, 3, '09:58:02', NULL, 0.00, 21.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 17:48:51', '10:48:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(144, '1', '000144', 4, 100.00, 100.00, 0.00, NULL, NULL, 0.00, 100.00, 3, '11:02:21', NULL, 0.00, 100.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 17:52:00', '10:52:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(145, '1', '000145', 2, 85.00, 85.00, 0.00, NULL, NULL, 0.00, 85.00, 3, '09:58:12', NULL, 0.00, 85.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 18:30:41', '11:30:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(146, '1', '000146', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '09:58:24', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 18:30:57', '11:30:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(147, '1', '000147', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '09:58:37', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 18:42:18', '11:42:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(148, '1', '000148', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '09:58:48', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 18:45:39', '11:45:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(149, '1', '000149', 9, 77.00, 77.00, 0.00, NULL, NULL, 0.00, 77.00, 3, '09:58:59', NULL, 0.00, 77.00, 0.00, 0.00, 0.00, '', 'plain', '2021-06-30', '2021-06-30 23:27:49', '16:27:49', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(150, '1', '000150', 7, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '09:59:12', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-01', '2021-07-01 19:57:47', '12:57:47', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(151, '1', '000151', 4, 105.00, 105.00, 0.00, NULL, NULL, 0.00, 105.00, 3, '10:05:18', NULL, 0.00, 105.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:00:06', '10:00:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(152, '1', '000152', 3, 78.00, 78.00, 0.00, NULL, NULL, 0.00, 78.00, 3, '10:05:07', NULL, 0.00, 78.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:03:11', '10:03:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(153, '1', '000153', 3, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '10:08:20', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:07:07', '10:07:07', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(154, '1', '000154', 2, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '10:10:28', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:09:19', '10:09:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(155, '1', '000155', 1, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '10:13:27', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:10:56', '10:10:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(156, '1', '000156', 4, 52.00, 52.00, 0.00, NULL, NULL, 0.00, 52.00, 3, '17:44:12', NULL, 0.00, 52.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:15:02', '10:15:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(157, '1', '000157', 4, 52.00, 52.00, 0.00, NULL, NULL, 0.00, 52.00, 3, '17:43:51', NULL, 0.00, 52.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:16:16', '10:16:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(158, '1', '000158', 1, 45.00, 45.00, 0.00, NULL, NULL, 0.00, 45.00, 3, '14:24:54', NULL, 0.00, 45.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 17:19:06', '10:19:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(159, '1', '000159', 4, 85.00, 85.00, 0.00, NULL, NULL, 0.00, 85.00, 3, '14:24:22', NULL, 0.00, 85.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:22:29', '14:22:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(160, '1', '000160', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '14:26:09', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:25:46', '14:25:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(161, '1', '000161', 3, 69.00, 69.00, 0.00, NULL, NULL, 0.00, 69.00, 3, '14:27:57', NULL, 0.00, 69.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:27:38', '14:27:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(162, '1', '000162', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '14:28:37', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:28:23', '14:28:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(163, '1', '000163', 2, 190.00, 190.00, 0.00, NULL, NULL, 0.00, 190.00, 3, '14:29:39', NULL, 0.00, 190.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:29:24', '14:29:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(164, '1', '000164', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:30:22', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:30:04', '14:30:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(165, '1', '000165', 5, 340.00, 340.00, 0.00, NULL, NULL, 0.00, 340.00, 3, '14:32:27', NULL, 0.00, 340.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:32:13', '14:32:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(166, '1', '000166', 1, 45.00, 45.00, 0.00, NULL, NULL, 0.00, 45.00, 3, '14:33:55', NULL, 0.00, 45.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:33:35', '14:33:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(167, '1', '000167', 2, 44.00, 44.00, 0.00, NULL, NULL, 0.00, 44.00, 3, '14:35:56', NULL, 0.00, 44.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:35:36', '14:35:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(168, '1', '000168', 3, 135.00, 135.00, 0.00, NULL, NULL, 0.00, 135.00, 3, '14:37:02', NULL, 0.00, 135.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:36:48', '14:36:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(169, '1', '000169', 5, 160.00, 160.00, 0.00, NULL, NULL, 0.00, 160.00, 3, '14:38:37', NULL, 0.00, 160.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:37:58', '14:37:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(170, '1', '000170', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '14:39:18', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:39:06', '14:39:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(171, '1', '000171', 2, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '14:39:59', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:39:46', '14:39:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(172, '1', '000172', 2, 185.00, 185.00, 0.00, NULL, NULL, 0.00, 185.00, 3, '14:42:01', NULL, 0.00, 185.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:41:43', '14:41:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(173, '1', '000173', 1, 12.00, 12.00, 0.00, NULL, NULL, 0.00, 12.00, 3, '14:42:46', NULL, 0.00, 12.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:42:24', '14:42:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(174, '1', '000174', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:43:15', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:43:01', '14:43:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(175, '26', '000175', 5, 73.00, 73.00, 0.00, NULL, NULL, 0.00, 73.00, 3, '14:44:40', NULL, 0.00, 73.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:44:26', '14:44:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(176, '1', '000176', 3, 48.00, 48.00, 0.00, NULL, NULL, 0.00, 48.00, 3, '14:46:51', NULL, 0.00, 48.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:46:37', '14:46:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(177, '1', '000177', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:47:34', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:47:17', '14:47:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(178, '1', '000178', 5, 143.00, 143.00, 0.00, NULL, NULL, 0.00, 143.00, 3, '14:49:53', NULL, 0.00, 143.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:49:38', '14:49:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(179, '1', '000179', 1, 3.00, 3.00, 0.00, NULL, NULL, 0.00, 3.00, 3, '14:50:43', NULL, 0.00, 3.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:50:30', '14:50:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(180, '1', '000180', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '14:51:30', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:51:18', '14:51:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(181, '1', '000181', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '14:52:01', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:51:48', '14:51:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(182, '1', '000182', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '14:52:36', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:52:24', '14:52:24', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00);
INSERT INTO `tbl_sales` (`id`, `customer_id`, `sale_no`, `total_items`, `sub_total`, `paid_amount`, `due_amount`, `disc`, `disc_actual`, `vat`, `total_payable`, `payment_method_id`, `close_time`, `table_id`, `total_item_discount_amount`, `sub_total_with_discount`, `sub_total_discount_amount`, `total_discount_amount`, `delivery_charge`, `sub_total_discount_value`, `sub_total_discount_type`, `sale_date`, `date_time`, `order_time`, `cooking_start_time`, `cooking_done_time`, `modified`, `user_id`, `waiter_id`, `outlet_id`, `order_status`, `order_type`, `del_status`, `sale_vat_objects`, `pay_cash`, `pay_one`, `pay_two`, `pay_three`) VALUES
(183, '1', '000183', 1, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '14:53:25', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:52:54', '14:52:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(184, '1', '000184', 1, 24.00, 24.00, 0.00, NULL, NULL, 0.00, 24.00, 3, '14:54:07', NULL, 0.00, 24.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:53:55', '14:53:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(185, '1', '000185', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '14:54:45', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:54:34', '14:54:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(186, '1', '000186', 1, 55.00, 55.00, 0.00, NULL, NULL, 0.00, 55.00, 3, '14:55:24', NULL, 0.00, 55.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:55:11', '14:55:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(187, '1', '000187', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '14:55:53', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:55:40', '14:55:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(188, '1', '000188', 4, 53.00, 53.00, 0.00, NULL, NULL, 0.00, 53.00, 3, '14:57:13', NULL, 0.00, 53.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:57:01', '14:57:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(189, '1', '000189', 3, 72.00, 72.00, 0.00, NULL, NULL, 0.00, 72.00, 3, '14:58:17', NULL, 0.00, 72.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:57:59', '14:57:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(190, '1', '000190', 3, 150.00, 150.00, 0.00, NULL, NULL, 0.00, 150.00, 3, '14:59:25', NULL, 0.00, 150.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:59:08', '14:59:08', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(191, '1', '000191', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '15:00:06', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 21:59:56', '14:59:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(192, '1', '000192', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '15:01:17', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:01:04', '15:01:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(193, '1', '000193', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '15:01:56', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:01:42', '15:01:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(194, '1', '000194', 2, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '15:02:56', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:02:39', '15:02:39', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(195, '1', '000195', 2, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '15:03:42', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:03:29', '15:03:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(196, '1', '000196', 2, 44.00, 44.00, 0.00, NULL, NULL, 0.00, 44.00, 3, '15:22:53', NULL, 0.00, 44.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:12:55', '15:12:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(197, '1', '000197', 6, 156.00, 156.00, 0.00, NULL, NULL, 0.00, 156.00, 3, '17:43:33', NULL, 0.00, 156.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:14:59', '15:14:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(198, '1', '000198', 2, 80.00, 80.00, 0.00, NULL, NULL, 0.00, 80.00, 3, '15:24:42', NULL, 0.00, 80.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 22:24:31', '15:24:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(199, '1', '000199', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '16:02:03', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 23:01:19', '16:01:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(200, '1', '000200', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '16:03:23', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 23:03:06', '16:03:06', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(201, '1', '000201', 6, 159.00, 159.00, 0.00, NULL, NULL, 0.00, 159.00, 3, '16:08:06', NULL, 0.00, 159.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 23:07:38', '16:07:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(202, '1', '000202', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '16:30:21', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 23:30:02', '16:30:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(203, '1', '000203', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '16:33:27', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-02 23:33:13', '16:33:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(204, '1', '000204', 1, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '17:05:11', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-03 00:04:55', '17:04:55', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(205, '1', '000205', 3, 41.00, 41.00, 0.00, NULL, NULL, 0.00, 41.00, 3, '17:27:20', NULL, 0.00, 41.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-02', '2021-07-03 00:27:05', '17:27:05', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(206, '1', '000206', 1, 20.00, 22.00, 0.00, NULL, NULL, 0.00, 22.00, 3, '08:36:16', NULL, 0.00, 20.00, 0.00, 0.00, 2.00, '', 'plain', '2021-07-03', '2021-07-03 15:35:30', '08:35:30', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(207, '1', '000207', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '09:22:58', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 16:21:46', '09:21:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(208, '1', '000208', 2, 62.00, 62.00, 0.00, NULL, NULL, 0.00, 62.00, 3, '09:32:23', NULL, 0.00, 62.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 16:25:54', '09:25:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(209, '1', '000209', 3, 69.00, 69.00, 0.00, NULL, NULL, 0.00, 69.00, 3, '09:32:30', NULL, 0.00, 69.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 16:27:27', '09:27:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(210, '1', '000210', 6, 232.00, 232.00, 0.00, NULL, NULL, 0.00, 232.00, 3, '11:23:02', NULL, 0.00, 232.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:19:09', '10:19:09', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(211, '1', '000211', 5, 160.00, 160.00, 0.00, NULL, NULL, 0.00, 160.00, 3, '10:45:21', NULL, 0.00, 160.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:21:03', '10:21:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(212, '1', '000212', 1, 60.00, 60.00, 0.00, NULL, NULL, 0.00, 60.00, 3, '10:24:53', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:23:58', '10:23:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(213, '1', '000213', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '10:30:48', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:29:57', '10:29:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(214, '1', '000214', 4, 87.00, 87.00, 0.00, NULL, NULL, 0.00, 87.00, 3, '10:48:11', NULL, 0.00, 87.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:46:12', '10:46:12', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(215, '1', '000215', 3, 3.00, 3.00, 0.00, NULL, NULL, 0.00, 3.00, 3, '10:48:08', NULL, 0.00, 3.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 17:47:20', '10:47:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(216, '1', '000216', 4, 91.00, 91.00, 0.00, NULL, NULL, 0.00, 91.00, 3, '11:16:11', NULL, 0.00, 91.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:14:36', '11:14:36', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(217, '1', '000217', 2, 63.00, 63.00, 0.00, NULL, NULL, 0.00, 63.00, 3, '11:18:01', NULL, 0.00, 63.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:16:42', '11:16:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(218, '1', '000218', 3, 110.00, 110.00, 0.00, NULL, NULL, 0.00, 110.00, 3, '11:21:16', NULL, 0.00, 110.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:20:27', '11:20:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(219, '1', '000219', 3, 125.00, 125.00, 0.00, NULL, NULL, 0.00, 125.00, 3, '11:25:52', NULL, 0.00, 125.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:25:00', '11:25:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(220, '1', '000220', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '11:27:37', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:27:18', '11:27:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(221, '1', '000221', 2, 32.00, 32.00, 0.00, NULL, NULL, 0.00, 32.00, 3, '11:32:04', NULL, 0.00, 32.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:30:10', '11:30:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 11, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(222, '1', '000222', 2, 12.00, 12.00, 0.00, NULL, NULL, 0.00, 12.00, 3, '11:33:41', NULL, 0.00, 12.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:32:26', '11:32:26', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(223, '1', '000223', 2, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '11:44:19', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:43:31', '11:43:31', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(224, '1', '000224', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '11:45:48', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:44:51', '11:44:51', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(225, '1', '000225', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '11:46:55', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:46:11', '11:46:11', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(226, '1', '000226', 2, 39.00, 39.00, 0.00, NULL, NULL, 0.00, 39.00, 3, '11:50:20', NULL, 0.00, 39.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:49:59', '11:49:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(227, '1', '000227', 4, 130.00, 130.00, 0.00, NULL, NULL, 0.00, 130.00, 3, '11:57:48', NULL, 0.00, 130.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:56:58', '11:56:58', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(228, '1', '000228', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '12:00:16', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 18:58:45', '11:58:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(229, '1', '000229', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '12:02:14', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 19:00:46', '12:00:46', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(230, '1', '000230', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '12:09:17', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 19:08:19', '12:08:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(231, '1', '000231', 3, 77.00, 77.00, 0.00, NULL, NULL, 0.00, 77.00, 3, '13:02:33', NULL, 0.00, 77.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:01:42', '13:01:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(232, '1', '000232', 4, 100.00, 100.00, 0.00, NULL, NULL, 0.00, 100.00, 3, '13:08:15', NULL, 0.00, 100.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:06:56', '13:06:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(233, '1', '000233', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '13:09:48', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:08:33', '13:08:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(234, '1', '000234', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '13:43:11', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:12:40', '13:12:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(235, '1', '000235', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '13:14:51', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:13:17', '13:13:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(236, '1', '000236', 2, 100.00, 100.00, 0.00, NULL, NULL, 0.00, 100.00, 3, '13:43:21', NULL, 0.00, 100.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:17:56', '13:17:56', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(237, '1', '000237', 4, 127.00, 127.00, 0.00, NULL, NULL, 0.00, 127.00, 3, '13:43:07', NULL, 0.00, 127.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:19:54', '13:19:54', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(238, '1', '000238', 2, 45.00, 45.00, 0.00, NULL, NULL, 0.00, 45.00, 3, '15:20:28', NULL, 0.00, 45.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:22:03', '13:22:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(239, '1', '000239', 2, 40.00, 40.00, 0.00, NULL, NULL, 0.00, 40.00, 3, '15:20:23', NULL, 0.00, 40.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:23:32', '13:23:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(240, '1', '000240', 4, 310.00, 310.00, 0.00, NULL, NULL, 0.00, 310.00, 3, '15:20:17', NULL, 0.00, 310.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:25:27', '13:25:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(241, '1', '000241', 3, 75.00, 75.00, 0.00, NULL, NULL, 0.00, 75.00, 3, '14:47:08', NULL, 0.00, 75.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:27:27', '13:27:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(242, '1', '000242', 2, 90.00, 90.00, 0.00, NULL, NULL, 0.00, 90.00, 3, '14:47:01', NULL, 0.00, 90.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:29:16', '13:29:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(243, '26', '000243', 2, 95.00, 95.00, 0.00, NULL, NULL, 0.00, 95.00, 3, '14:46:56', NULL, 0.00, 95.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 20:30:44', '13:30:44', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(244, '1', '000244', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '14:46:51', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 21:45:33', '14:45:33', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(245, '1', '000245', 2, 65.00, 65.00, 0.00, NULL, NULL, 0.00, 65.00, 3, '14:47:51', NULL, 0.00, 65.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 21:47:34', '14:47:34', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(246, '1', '000246', 2, 43.00, 43.00, 0.00, NULL, NULL, 0.00, 43.00, 3, '14:52:40', NULL, 0.00, 43.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 21:52:21', '14:52:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(247, '1', '000247', 1, 3.00, 3.00, 0.00, NULL, NULL, 0.00, 3.00, 3, '14:54:33', NULL, 0.00, 3.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 21:54:21', '14:54:21', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(248, '1', '000248', 4, 120.00, 120.00, 0.00, NULL, NULL, 0.00, 120.00, 3, '15:13:58', NULL, 0.00, 120.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:10:53', '15:10:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(249, '1', '000249', 1, 24.00, 24.00, 0.00, NULL, NULL, 0.00, 24.00, 3, '15:14:05', NULL, 0.00, 24.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:12:50', '15:12:50', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(250, '1', '000250', 5, 200.00, 200.00, 0.00, NULL, NULL, 0.00, 200.00, 3, '15:20:08', NULL, 0.00, 200.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:18:00', '15:18:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(251, '1', '000251', 1, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '15:20:14', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:19:27', '15:19:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(252, '1', '000252', 2, 20.00, 20.00, 0.00, NULL, NULL, 0.00, 20.00, 3, '15:50:14', NULL, 0.00, 20.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:49:38', '15:49:38', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(253, '1', '000253', 1, 50.00, 50.00, 0.00, NULL, NULL, 0.00, 50.00, 3, '15:58:31', NULL, 0.00, 50.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 22:55:35', '15:55:35', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(254, '1', '000254', 5, 125.00, 125.00, 0.00, NULL, NULL, 0.00, 125.00, 3, '16:01:13', NULL, 0.00, 125.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 23:01:00', '16:01:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(255, '1', '000255', 2, 35.00, 35.00, 0.00, NULL, NULL, 0.00, 35.00, 3, '16:17:38', NULL, 0.00, 35.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 23:15:29', '16:15:29', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(256, '1', '000256', 1, 30.00, 30.00, 0.00, NULL, NULL, 0.00, 30.00, 3, '16:17:31', NULL, 0.00, 30.00, 0.00, 0.00, 0.00, '', 'plain', '2021-07-03', '2021-07-03 23:16:01', '16:16:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(257, '29', '000257', 7, 87.00, 87.00, 0.00, NULL, NULL, 0.00, 87.00, 3, '16:22:05', NULL, 0.00, 87.00, 0.00, 0.00, 8.70, '', 'plain', '2021-08-03', '2021-08-03 23:12:53', '16:12:53', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(258, '25', '000258', 1, 60.00, 56.00, 4.00, NULL, NULL, 0.00, 60.00, 6, '00:00:00', NULL, 0.00, 60.00, 0.00, 0.00, 0.00, '', 'plain', '2021-08-03', '2021-08-03 23:14:27', '16:14:27', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 2, 2, 'Live', '[]', 10.00, 12.00, 1.00, 33.00),
(259, '25', '000259', 2, 92.00, 92.00, 0.00, NULL, NULL, 0.00, 92.00, 4, '16:10:28', NULL, 0.00, 92.00, 0.00, 0.00, 0.00, '', 'plain', '2021-08-27', '2021-08-27 23:03:15', '16:03:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 1, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(260, '1', '000260', 5, 78.00, 85.80, 0.00, NULL, NULL, 0.00, 85.80, 3, '12:55:15', NULL, 0.00, 78.00, 0.00, 0.00, 7.80, '', 'plain', '2021-09-14', '2021-09-14 18:35:05', '11:35:05', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(261, '1', '000261', 1, 350.00, 350.00, 0.00, NULL, NULL, 0.00, 350.00, 3, '12:19:24', NULL, 0.00, 350.00, 0.00, 0.00, 0.00, '', 'plain', '2021-09-14', '2021-09-14 18:52:18', '11:52:18', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(262, '29', '000262', 1, 350.00, 350.00, 0.00, NULL, NULL, 0.00, 350.00, 4, '12:19:16', NULL, 0.00, 350.00, 0.00, 0.00, 0.00, '', 'plain', '2021-09-14', '2021-09-14 18:55:59', '11:55:59', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 14, 1, 3, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(263, '1', '000263', 3, 3.00, NULL, NULL, NULL, NULL, 0.00, 3.00, NULL, '00:00:00', NULL, 0.00, 3.00, 0.00, 0.00, 0.00, '', 'plain', '2021-09-14', '2021-09-14 20:41:57', '13:41:57', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 'No', 1, 12, 1, 1, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(264, '29', '000264', 4, 33.00, 33.00, 0.00, NULL, NULL, 0.00, 33.00, 6, '00:00:00', NULL, 0.00, 33.00, 0.00, 0.00, 0.00, '', 'plain', '2021-09-15', '2021-09-15 18:50:50', '11:50:50', '2021-09-15 11:58:44', '0000-00-00 00:00:00', 'No', 1, 12, 1, 2, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00),
(265, '1', '000265', 5, 145.00, 145.00, 0.00, NULL, NULL, 0.00, 145.00, 6, '00:00:00', NULL, 0.00, 145.00, 0.00, 0.00, 0.00, '', 'plain', '2021-09-15', '2021-09-15 18:51:31', '11:51:31', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 'No', 1, 14, 1, 2, 2, 'Live', '[]', 0.00, 0.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `id` bigint NOT NULL,
  `food_menu_id` int DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `menu_price_without_discount` float(10,2) NOT NULL,
  `menu_price_with_discount` float(10,2) NOT NULL,
  `menu_unit_price` float(10,2) NOT NULL,
  `menu_vat_percentage` float(10,2) NOT NULL,
  `menu_taxes` text,
  `menu_discount_value` varchar(20) DEFAULT NULL,
  `discount_type` varchar(20) NOT NULL,
  `menu_note` varchar(150) DEFAULT NULL,
  `discount_amount` double(10,2) DEFAULT NULL,
  `item_type` varchar(50) DEFAULT NULL,
  `cooking_status` varchar(30) DEFAULT NULL,
  `cooking_start_time` datetime NOT NULL,
  `cooking_done_time` datetime NOT NULL,
  `previous_id` bigint NOT NULL,
  `sales_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_sales_details`
--

INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(13, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 13, 11, 0, 1, 1, 'Live'),
(14, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-23 09:57:26', 14, 12, 0, 1, 1, 'Live'),
(15, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-23 09:57:26', 15, 12, 0, 1, 1, 'Live'),
(16, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '0', '0', 'plain', '', 0.00, 'Kitchen Item', 'undefined', '1969-12-31 18:00:00', '1969-12-31 18:00:00', 0, 13, 0, 1, 1, 'Live'),
(17, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '0', '0', 'plain', '', 0.00, 'Kitchen Item', 'undefined', '1969-12-31 18:00:00', '1969-12-31 18:00:00', 0, 13, 0, 1, 1, 'Live'),
(18, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 09:56:00', '2021-06-23 09:56:05', 18, 14, 0, 1, 1, 'Live'),
(19, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 09:56:00', '2021-06-23 09:56:05', 19, 14, 0, 1, 1, 'Live'),
(20, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 09:56:00', '2021-06-23 09:56:05', 20, 14, 0, 1, 1, 'Live'),
(21, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 09:56:00', '2021-06-23 09:56:05', 21, 14, 0, 1, 1, 'Live'),
(22, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 22, 15, 0, 1, 1, 'Live'),
(23, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 23, 16, 0, 1, 1, 'Live'),
(24, 9, 'Agua pura (009)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 24, 16, 0, 1, 1, 'Live'),
(25, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 25, 16, 0, 1, 1, 'Live'),
(26, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 26, 17, 0, 1, 1, 'Live'),
(27, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 27, 17, 0, 1, 1, 'Live'),
(28, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 28, 17, 0, 1, 1, 'Live'),
(29, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 29, 17, 0, 1, 1, 'Live'),
(30, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 30, 17, 0, 1, 1, 'Live'),
(31, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:04:36', '2021-06-23 12:05:03', 31, 17, 0, 1, 1, 'Live'),
(32, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:06:59', '2021-06-23 12:07:07', 32, 18, 0, 1, 1, 'Live'),
(33, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:06:59', '2021-06-23 12:07:07', 33, 18, 0, 1, 1, 'Live'),
(34, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:06:59', '2021-06-23 12:07:07', 34, 18, 0, 1, 1, 'Live'),
(35, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 12:06:59', '2021-06-23 12:07:07', 35, 18, 0, 1, 1, 'Live'),
(36, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 36, 19, 0, 1, 1, 'Live'),
(37, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 37, 19, 0, 1, 1, 'Live'),
(38, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 38, 19, 0, 1, 1, 'Live'),
(39, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 39, 19, 0, 1, 1, 'Live'),
(40, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 40, 19, 0, 1, 1, 'Live'),
(41, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 41, 19, 0, 1, 1, 'Live'),
(42, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 42, 20, 0, 1, 1, 'Live'),
(43, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 43, 20, 0, 1, 1, 'Live'),
(44, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 44, 21, 0, 1, 1, 'Live'),
(45, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 45, 21, 0, 1, 1, 'Live'),
(46, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 46, 22, 0, 1, 1, 'Live'),
(47, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 47, 22, 0, 1, 1, 'Live'),
(48, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 20:33:54', '2021-06-23 20:34:03', 48, 23, 0, 1, 1, 'Live'),
(49, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-23 20:33:54', '2021-06-23 20:34:03', 49, 23, 0, 1, 1, 'Live'),
(50, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 50, 24, 0, 1, 1, 'Live'),
(51, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 51, 24, 0, 1, 1, 'Live'),
(52, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 52, 24, 0, 1, 1, 'Live'),
(53, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 53, 24, 0, 1, 1, 'Live'),
(54, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 54, 24, 0, 1, 1, 'Live'),
(55, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 55, 24, 0, 1, 1, 'Live'),
(56, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 56, 24, 0, 1, 1, 'Live'),
(57, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 57, 25, 0, 1, 1, 'Live'),
(58, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 58, 25, 0, 1, 1, 'Live'),
(59, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 59, 25, 0, 1, 1, 'Live'),
(60, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 60, 26, 0, 1, 1, 'Live'),
(61, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 61, 26, 0, 1, 1, 'Live'),
(62, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62, 27, 0, 1, 1, 'Live'),
(63, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63, 27, 0, 1, 1, 'Live'),
(64, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64, 27, 0, 1, 1, 'Live'),
(65, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65, 28, 0, 1, 1, 'Live'),
(66, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66, 28, 0, 1, 1, 'Live'),
(67, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67, 29, 0, 1, 1, 'Live'),
(68, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68, 29, 0, 1, 1, 'Live'),
(69, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69, 30, 0, 1, 1, 'Live'),
(70, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70, 30, 0, 1, 1, 'Live'),
(71, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71, 31, 0, 1, 1, 'Live'),
(72, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72, 31, 0, 1, 1, 'Live'),
(73, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73, 32, 0, 1, 1, 'Live'),
(74, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 74, 32, 0, 1, 1, 'Live'),
(75, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 75, 33, 0, 1, 1, 'Live'),
(76, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76, 33, 0, 1, 1, 'Live'),
(77, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 77, 34, 0, 1, 1, 'Live'),
(78, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78, 34, 0, 1, 1, 'Live'),
(79, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79, 34, 0, 1, 1, 'Live'),
(80, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80, 34, 0, 1, 1, 'Live'),
(81, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81, 34, 0, 1, 1, 'Live'),
(82, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82, 34, 0, 1, 1, 'Live'),
(83, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83, 34, 0, 1, 1, 'Live'),
(84, 2, 'Chicharron 1/2 (002)', 2, 60.00, 60.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84, 35, 0, 1, 1, 'Live'),
(85, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85, 35, 0, 1, 1, 'Live'),
(86, 2, 'Chicharron 1/2 (002)', 2, 60.00, 60.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86, 36, 0, 1, 1, 'Live'),
(87, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87, 36, 0, 1, 1, 'Live'),
(88, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88, 36, 0, 1, 1, 'Live'),
(89, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89, 37, 0, 1, 1, 'Live'),
(90, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 90, 38, 0, 1, 1, 'Live'),
(91, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91, 38, 0, 1, 1, 'Live'),
(92, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92, 39, 0, 1, 1, 'Live'),
(93, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 93, 40, 0, 1, 1, 'Live'),
(94, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 94, 40, 0, 1, 1, 'Live'),
(95, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 95, 40, 0, 1, 1, 'Live'),
(96, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 96, 40, 0, 1, 1, 'Live'),
(97, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 97, 40, 0, 1, 1, 'Live'),
(98, 9, 'Agua pura (009)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 98, 41, 0, 1, 1, 'Live'),
(99, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 99, 41, 0, 1, 1, 'Live'),
(100, 9, 'Agua pura (009)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 100, 41, 0, 1, 1, 'Live'),
(101, 10, 'Chile Relleno (010)', 3, 45.00, 45.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 101, 42, 0, 1, 1, 'Live'),
(102, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 102, 42, 0, 1, 1, 'Live'),
(103, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 103, 42, 0, 1, 1, 'Live'),
(104, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 104, 42, 0, 1, 1, 'Live'),
(105, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 105, 43, 0, 1, 1, 'Live'),
(106, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 106, 43, 0, 1, 1, 'Live'),
(107, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 107, 43, 0, 1, 1, 'Live'),
(108, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 108, 44, 0, 1, 1, 'Live'),
(109, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 109, 45, 0, 1, 1, 'Live'),
(110, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 110, 46, 0, 1, 1, 'Live'),
(111, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 111, 46, 0, 1, 1, 'Live'),
(112, 19, 'Rabano (019)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 112, 46, 0, 1, 1, 'Live'),
(113, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 113, 46, 0, 1, 1, 'Live'),
(114, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 114, 46, 0, 1, 1, 'Live'),
(115, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 115, 47, 0, 1, 1, 'Live'),
(116, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 116, 47, 0, 1, 1, 'Live'),
(117, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 117, 47, 0, 1, 1, 'Live'),
(118, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 118, 47, 0, 1, 1, 'Live'),
(123, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 123, 49, 0, 1, 1, 'Live'),
(124, 26, 'Tortillas (026)', 9, 9.00, 9.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 124, 50, 0, 1, 1, 'Live'),
(125, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 125, 50, 0, 1, 1, 'Live'),
(126, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 126, 50, 0, 1, 1, 'Live'),
(127, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 127, 51, 0, 1, 1, 'Live'),
(128, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 128, 51, 0, 1, 1, 'Live'),
(129, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 129, 51, 0, 1, 1, 'Live'),
(130, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 130, 51, 0, 1, 1, 'Live'),
(131, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 131, 52, 0, 1, 1, 'Live'),
(132, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 132, 52, 0, 1, 1, 'Live'),
(133, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 133, 52, 0, 1, 1, 'Live'),
(134, 13, 'Limon (013)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 134, 52, 0, 1, 1, 'Live'),
(135, 19, 'Rabano (019)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 135, 52, 0, 1, 1, 'Live'),
(136, 5, 'Carnitas 1 (005)', 2, 130.00, 130.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 11:27:10', 136, 53, 0, 1, 1, 'Live'),
(137, 1, 'Chicharron 1 (001)', 2, 120.00, 120.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 11:27:10', 137, 53, 0, 1, 1, 'Live'),
(138, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 138, 54, 0, 1, 1, 'Live'),
(139, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 139, 54, 0, 1, 1, 'Live'),
(140, 22, 'Soda desechable (022)', 4, 40.00, 40.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 140, 55, 0, 1, 1, 'Live'),
(141, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 141, 56, 0, 1, 1, 'Live'),
(142, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 142, 56, 0, 1, 1, 'Live'),
(143, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 143, 56, 0, 1, 1, 'Live'),
(144, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 144, 56, 0, 1, 1, 'Live'),
(145, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 145, 56, 0, 1, 1, 'Live'),
(146, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 146, 56, 0, 1, 1, 'Live'),
(147, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 147, 57, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(148, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 148, 57, 0, 1, 1, 'Live'),
(149, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 149, 57, 0, 1, 1, 'Live'),
(150, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 150, 57, 0, 1, 1, 'Live'),
(151, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 151, 57, 0, 1, 1, 'Live'),
(152, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 152, 58, 0, 1, 1, 'Live'),
(153, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 153, 58, 0, 1, 1, 'Live'),
(154, 12, 'Jugo del Valle (012)', 1, 8.00, 8.00, 8.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 154, 58, 0, 1, 1, 'Live'),
(155, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 155, 59, 0, 1, 1, 'Live'),
(156, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 156, 60, 0, 1, 1, 'Live'),
(157, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 157, 60, 0, 1, 1, 'Live'),
(158, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 158, 60, 0, 1, 1, 'Live'),
(159, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 159, 60, 0, 1, 1, 'Live'),
(160, 29, 'PorciÃ³n Mixta Simple (029)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 160, 60, 0, 1, 1, 'Live'),
(161, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 161, 60, 0, 1, 1, 'Live'),
(162, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 162, 60, 0, 1, 1, 'Live'),
(163, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 163, 60, 0, 1, 1, 'Live'),
(164, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 164, 60, 0, 1, 1, 'Live'),
(165, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 165, 60, 0, 1, 1, 'Live'),
(166, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 166, 60, 0, 1, 1, 'Live'),
(167, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 167, 60, 0, 1, 1, 'Live'),
(168, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 168, 60, 0, 1, 1, 'Live'),
(169, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 169, 61, 0, 1, 1, 'Live'),
(170, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 170, 61, 0, 1, 1, 'Live'),
(171, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 171, 61, 0, 1, 1, 'Live'),
(172, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 172, 61, 0, 1, 1, 'Live'),
(173, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 173, 61, 0, 1, 1, 'Live'),
(174, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 174, 61, 0, 1, 1, 'Live'),
(175, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 175, 61, 0, 1, 1, 'Live'),
(176, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 176, 61, 0, 1, 1, 'Live'),
(177, 26, 'Tortillas (026)', 12, 12.00, 12.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 177, 61, 0, 1, 1, 'Live'),
(178, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 178, 61, 0, 1, 1, 'Live'),
(179, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 179, 61, 0, 1, 1, 'Live'),
(180, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 180, 61, 0, 1, 1, 'Live'),
(181, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 181, 61, 0, 1, 1, 'Live'),
(182, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 182, 62, 0, 1, 1, 'Live'),
(183, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 183, 62, 0, 1, 1, 'Live'),
(184, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 184, 62, 0, 1, 1, 'Live'),
(185, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 185, 62, 0, 1, 1, 'Live'),
(186, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 186, 62, 0, 1, 1, 'Live'),
(187, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 187, 62, 0, 1, 1, 'Live'),
(188, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 188, 63, 0, 1, 1, 'Live'),
(189, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 189, 64, 0, 1, 1, 'Live'),
(190, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 190, 65, 0, 1, 1, 'Live'),
(191, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 191, 65, 0, 1, 1, 'Live'),
(192, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 192, 66, 0, 1, 1, 'Live'),
(193, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 193, 66, 0, 1, 1, 'Live'),
(194, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 194, 66, 0, 1, 1, 'Live'),
(195, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 195, 66, 0, 1, 1, 'Live'),
(196, 26, 'Tortillas (026)', 20, 20.00, 20.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 196, 66, 0, 1, 1, 'Live'),
(197, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 197, 66, 0, 1, 1, 'Live'),
(198, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:57', 198, 66, 0, 1, 1, 'Live'),
(199, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:54', 199, 67, 0, 1, 1, 'Live'),
(200, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:54', 200, 67, 0, 1, 1, 'Live'),
(201, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:41:55', 201, 67, 0, 1, 1, 'Live'),
(202, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:09', 202, 68, 0, 1, 1, 'Live'),
(203, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:09', 203, 68, 0, 1, 1, 'Live'),
(204, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:13', 204, 69, 0, 1, 1, 'Live'),
(205, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:25', 205, 70, 0, 1, 1, 'Live'),
(206, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:25', 206, 70, 0, 1, 1, 'Live'),
(207, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:25', 207, 70, 0, 1, 1, 'Live'),
(208, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:42:25', 208, 70, 0, 1, 1, 'Live'),
(209, 29, 'PorciÃ³n Mixta Simple (029)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:42:44', '2021-06-29 14:42:57', 209, 71, 0, 1, 1, 'Live'),
(210, 29, 'PorciÃ³n Mixta Simple (029)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:42:44', '2021-06-29 14:42:57', 210, 71, 0, 1, 1, 'Live'),
(211, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:42:44', '2021-06-29 14:42:57', 211, 71, 0, 1, 1, 'Live'),
(212, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:42:44', '2021-06-29 14:42:57', 212, 71, 0, 1, 1, 'Live'),
(213, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:43:18', '2021-06-29 14:43:35', 213, 72, 0, 1, 1, 'Live'),
(214, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:43:18', '2021-06-29 14:43:35', 214, 72, 0, 1, 1, 'Live'),
(215, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 14:43:18', '2021-06-29 14:43:35', 215, 72, 0, 1, 1, 'Live'),
(216, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 14:43:41', 216, 73, 0, 1, 1, 'Live'),
(217, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 217, 74, 0, 1, 1, 'Live'),
(218, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 218, 74, 0, 1, 1, 'Live'),
(219, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 219, 74, 0, 1, 1, 'Live'),
(220, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 220, 74, 0, 1, 1, 'Live'),
(221, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 221, 74, 0, 1, 1, 'Live'),
(222, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 222, 75, 0, 1, 1, 'Live'),
(223, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 223, 75, 0, 1, 1, 'Live'),
(224, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 224, 76, 0, 1, 1, 'Live'),
(225, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 225, 76, 0, 1, 1, 'Live'),
(226, 16, 'Morcia 3/4 (016)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 226, 76, 0, 1, 1, 'Live'),
(227, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 227, 76, 0, 1, 1, 'Live'),
(228, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 228, 76, 0, 1, 1, 'Live'),
(229, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 229, 76, 0, 1, 1, 'Live'),
(230, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 230, 76, 0, 1, 1, 'Live'),
(231, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 231, 76, 0, 1, 1, 'Live'),
(232, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 232, 76, 0, 1, 1, 'Live'),
(233, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 233, 77, 0, 1, 1, 'Live'),
(234, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 234, 77, 0, 1, 1, 'Live'),
(235, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 235, 78, 0, 1, 1, 'Live'),
(236, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 236, 79, 0, 1, 1, 'Live'),
(237, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 237, 79, 0, 1, 1, 'Live'),
(238, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 238, 79, 0, 1, 1, 'Live'),
(239, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 239, 80, 0, 1, 1, 'Live'),
(240, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 240, 80, 0, 1, 1, 'Live'),
(241, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 241, 80, 0, 1, 1, 'Live'),
(242, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 242, 80, 0, 1, 1, 'Live'),
(243, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 243, 80, 0, 1, 1, 'Live'),
(244, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 244, 81, 0, 1, 1, 'Live'),
(245, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 245, 81, 0, 1, 1, 'Live'),
(246, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 246, 82, 0, 1, 1, 'Live'),
(247, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 247, 82, 0, 1, 1, 'Live'),
(248, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 248, 82, 0, 1, 1, 'Live'),
(249, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 249, 83, 0, 1, 1, 'Live'),
(250, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 250, 84, 0, 1, 1, 'Live'),
(251, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 251, 84, 0, 1, 1, 'Live'),
(252, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 252, 84, 0, 1, 1, 'Live'),
(253, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 253, 84, 0, 1, 1, 'Live'),
(254, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 254, 84, 0, 1, 1, 'Live'),
(255, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 255, 84, 0, 1, 1, 'Live'),
(256, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 256, 84, 0, 1, 1, 'Live'),
(257, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 257, 85, 0, 1, 1, 'Live'),
(258, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 258, 86, 0, 1, 1, 'Live'),
(259, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 259, 86, 0, 1, 1, 'Live'),
(260, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 260, 87, 0, 1, 1, 'Live'),
(261, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 261, 88, 0, 1, 1, 'Live'),
(262, 26, 'Tortillas (026)', 11, 11.00, 11.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 262, 88, 0, 1, 1, 'Live'),
(263, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 263, 89, 0, 1, 1, 'Live'),
(264, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 264, 90, 0, 1, 1, 'Live'),
(265, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 265, 90, 0, 1, 1, 'Live'),
(266, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 266, 90, 0, 1, 1, 'Live'),
(267, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 267, 91, 0, 1, 1, 'Live'),
(268, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 268, 91, 0, 1, 1, 'Live'),
(269, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 269, 91, 0, 1, 1, 'Live'),
(270, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 270, 91, 0, 1, 1, 'Live'),
(271, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 271, 91, 0, 1, 1, 'Live'),
(272, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 272, 91, 0, 1, 1, 'Live'),
(273, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 273, 91, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(274, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 274, 91, 0, 1, 1, 'Live'),
(275, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 275, 91, 0, 1, 1, 'Live'),
(276, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 276, 91, 0, 1, 1, 'Live'),
(277, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 277, 91, 0, 1, 1, 'Live'),
(278, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 278, 91, 0, 1, 1, 'Live'),
(279, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 279, 91, 0, 1, 1, 'Live'),
(280, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 280, 91, 0, 1, 1, 'Live'),
(281, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 281, 91, 0, 1, 1, 'Live'),
(282, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 282, 92, 0, 1, 1, 'Live'),
(283, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 283, 92, 0, 1, 1, 'Live'),
(284, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 284, 92, 0, 1, 1, 'Live'),
(285, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 285, 92, 0, 1, 1, 'Live'),
(286, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 286, 92, 0, 1, 1, 'Live'),
(287, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 287, 92, 0, 1, 1, 'Live'),
(288, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 288, 92, 0, 1, 1, 'Live'),
(289, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 289, 92, 0, 1, 1, 'Live'),
(290, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 290, 93, 0, 1, 1, 'Live'),
(291, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 291, 94, 0, 1, 1, 'Live'),
(292, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 292, 94, 0, 1, 1, 'Live'),
(293, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 293, 95, 0, 1, 1, 'Live'),
(294, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 294, 95, 0, 1, 1, 'Live'),
(295, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 295, 95, 0, 1, 1, 'Live'),
(296, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 296, 95, 0, 1, 1, 'Live'),
(297, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 297, 95, 0, 1, 1, 'Live'),
(298, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 298, 95, 0, 1, 1, 'Live'),
(299, 18, 'Morcia 1/4 (018)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 299, 96, 0, 1, 1, 'Live'),
(300, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 300, 97, 0, 1, 1, 'Live'),
(301, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 301, 97, 0, 1, 1, 'Live'),
(302, 6, 'Carnitas 3/4 (006)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 302, 98, 0, 1, 1, 'Live'),
(303, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 303, 98, 0, 1, 1, 'Live'),
(304, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 304, 98, 0, 1, 1, 'Live'),
(305, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 305, 98, 0, 1, 1, 'Live'),
(306, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 306, 98, 0, 1, 1, 'Live'),
(307, 18, 'Morcia 1/4 (018)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 307, 98, 0, 1, 1, 'Live'),
(308, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 308, 99, 0, 1, 1, 'Live'),
(309, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 309, 99, 0, 1, 1, 'Live'),
(310, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 310, 99, 0, 1, 1, 'Live'),
(311, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 311, 99, 0, 1, 1, 'Live'),
(312, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 312, 99, 0, 1, 1, 'Live'),
(313, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 313, 99, 0, 1, 1, 'Live'),
(314, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 314, 100, 0, 1, 1, 'Live'),
(315, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 315, 100, 0, 1, 1, 'Live'),
(316, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 316, 100, 0, 1, 1, 'Live'),
(317, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 317, 101, 0, 1, 1, 'Live'),
(318, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 318, 102, 0, 1, 1, 'Live'),
(319, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 319, 102, 0, 1, 1, 'Live'),
(320, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 320, 102, 0, 1, 1, 'Live'),
(321, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 321, 103, 0, 1, 1, 'Live'),
(322, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 322, 103, 0, 1, 1, 'Live'),
(323, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 323, 103, 0, 1, 1, 'Live'),
(324, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 324, 103, 0, 1, 1, 'Live'),
(325, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 325, 103, 0, 1, 1, 'Live'),
(326, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 326, 103, 0, 1, 1, 'Live'),
(327, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 327, 103, 0, 1, 1, 'Live'),
(328, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 328, 103, 0, 1, 1, 'Live'),
(329, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 329, 103, 0, 1, 1, 'Live'),
(330, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 330, 103, 0, 1, 1, 'Live'),
(331, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 331, 103, 0, 1, 1, 'Live'),
(332, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 332, 103, 0, 1, 1, 'Live'),
(333, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 333, 103, 0, 1, 1, 'Live'),
(334, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 334, 103, 0, 1, 1, 'Live'),
(335, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 335, 103, 0, 1, 1, 'Live'),
(336, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 336, 103, 0, 1, 1, 'Live'),
(337, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 337, 103, 0, 1, 1, 'Live'),
(338, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 338, 103, 0, 1, 1, 'Live'),
(339, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 339, 103, 0, 1, 1, 'Live'),
(340, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 340, 103, 0, 1, 1, 'Live'),
(341, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 341, 103, 0, 1, 1, 'Live'),
(342, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 342, 104, 0, 1, 1, 'Live'),
(343, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 343, 104, 0, 1, 1, 'Live'),
(344, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 344, 104, 0, 1, 1, 'Live'),
(345, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 345, 104, 0, 1, 1, 'Live'),
(346, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 346, 104, 0, 1, 1, 'Live'),
(347, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 347, 104, 0, 1, 1, 'Live'),
(348, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 348, 105, 0, 1, 1, 'Live'),
(349, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 349, 105, 0, 1, 1, 'Live'),
(350, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 350, 105, 0, 1, 1, 'Live'),
(351, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 351, 105, 0, 1, 1, 'Live'),
(352, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 352, 105, 0, 1, 1, 'Live'),
(353, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 353, 105, 0, 1, 1, 'Live'),
(354, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 354, 105, 0, 1, 1, 'Live'),
(355, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 355, 105, 0, 1, 1, 'Live'),
(356, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 356, 105, 0, 1, 1, 'Live'),
(357, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 357, 105, 0, 1, 1, 'Live'),
(358, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 358, 105, 0, 1, 1, 'Live'),
(359, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 359, 105, 0, 1, 1, 'Live'),
(360, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 360, 106, 0, 1, 1, 'Live'),
(361, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 361, 106, 0, 1, 1, 'Live'),
(362, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 362, 106, 0, 1, 1, 'Live'),
(363, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 363, 107, 0, 1, 1, 'Live'),
(364, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 364, 107, 0, 1, 1, 'Live'),
(365, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 365, 107, 0, 1, 1, 'Live'),
(366, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 366, 107, 0, 1, 1, 'Live'),
(367, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 367, 107, 0, 1, 1, 'Live'),
(368, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 368, 107, 0, 1, 1, 'Live'),
(369, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 369, 107, 0, 1, 1, 'Live'),
(370, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 370, 108, 0, 1, 1, 'Live'),
(371, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 371, 108, 0, 1, 1, 'Live'),
(372, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 372, 108, 0, 1, 1, 'Live'),
(373, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 373, 108, 0, 1, 1, 'Live'),
(374, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 374, 108, 0, 1, 1, 'Live'),
(375, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 375, 108, 0, 1, 1, 'Live'),
(376, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 376, 108, 0, 1, 1, 'Live'),
(377, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 377, 108, 0, 1, 1, 'Live'),
(378, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 378, 108, 0, 1, 1, 'Live'),
(379, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 379, 109, 0, 1, 1, 'Live'),
(380, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 380, 109, 0, 1, 1, 'Live'),
(381, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 381, 109, 0, 1, 1, 'Live'),
(382, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 382, 109, 0, 1, 1, 'Live'),
(383, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 383, 109, 0, 1, 1, 'Live'),
(384, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 384, 109, 0, 1, 1, 'Live'),
(385, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 385, 109, 0, 1, 1, 'Live'),
(386, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 386, 110, 0, 1, 1, 'Live'),
(387, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 387, 110, 0, 1, 1, 'Live'),
(388, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 388, 110, 0, 1, 1, 'Live'),
(389, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 389, 110, 0, 1, 1, 'Live'),
(390, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 390, 110, 0, 1, 1, 'Live'),
(391, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 391, 110, 0, 1, 1, 'Live'),
(392, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 392, 110, 0, 1, 1, 'Live'),
(393, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 393, 110, 0, 1, 1, 'Live'),
(394, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 394, 110, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(395, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 395, 110, 0, 1, 1, 'Live'),
(396, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 396, 111, 0, 1, 1, 'Live'),
(397, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 397, 112, 0, 1, 1, 'Live'),
(398, 6, 'Carnitas 3/4 (006)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 398, 113, 0, 1, 1, 'Live'),
(399, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 399, 114, 0, 1, 1, 'Live'),
(400, 29, 'PorciÃ³n Mixta Simple (029)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 400, 115, 0, 1, 1, 'Live'),
(401, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 401, 115, 0, 1, 1, 'Live'),
(402, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 402, 115, 0, 1, 1, 'Live'),
(403, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 403, 115, 0, 1, 1, 'Live'),
(404, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 404, 115, 0, 1, 1, 'Live'),
(405, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 405, 116, 0, 1, 1, 'Live'),
(406, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 406, 116, 0, 1, 1, 'Live'),
(407, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 407, 116, 0, 1, 1, 'Live'),
(408, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 408, 117, 0, 1, 1, 'Live'),
(409, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 409, 118, 0, 1, 1, 'Live'),
(410, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 410, 118, 0, 1, 1, 'Live'),
(411, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 411, 119, 0, 1, 1, 'Live'),
(412, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 412, 119, 0, 1, 1, 'Live'),
(413, 30, 'Libra Mixta (030)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 413, 120, 0, 1, 1, 'Live'),
(414, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 414, 121, 0, 1, 1, 'Live'),
(415, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 415, 121, 0, 1, 1, 'Live'),
(416, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 416, 121, 0, 1, 1, 'Live'),
(417, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 417, 122, 0, 1, 1, 'Live'),
(418, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 418, 123, 0, 1, 1, 'Live'),
(419, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 419, 123, 0, 1, 1, 'Live'),
(420, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 420, 123, 0, 1, 1, 'Live'),
(421, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 421, 124, 0, 1, 1, 'Live'),
(422, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 422, 124, 0, 1, 1, 'Live'),
(423, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 423, 125, 0, 1, 1, 'Live'),
(424, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 424, 125, 0, 1, 1, 'Live'),
(425, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 425, 126, 0, 1, 1, 'Live'),
(426, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 426, 126, 0, 1, 1, 'Live'),
(427, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 427, 127, 0, 1, 1, 'Live'),
(428, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 428, 127, 0, 1, 1, 'Live'),
(429, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 429, 127, 0, 1, 1, 'Live'),
(430, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 430, 128, 0, 1, 1, 'Live'),
(431, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 431, 128, 0, 1, 1, 'Live'),
(432, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 432, 128, 0, 1, 1, 'Live'),
(433, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 433, 128, 0, 1, 1, 'Live'),
(434, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 434, 128, 0, 1, 1, 'Live'),
(435, 6, 'Carnitas 3/4 (006)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 435, 129, 0, 1, 1, 'Live'),
(436, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 436, 129, 0, 1, 1, 'Live'),
(437, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 437, 130, 0, 1, 1, 'Live'),
(438, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 438, 130, 0, 1, 1, 'Live'),
(439, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 439, 131, 0, 1, 1, 'Live'),
(440, 18, 'Morcia 1/4 (018)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 440, 131, 0, 1, 1, 'Live'),
(441, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 441, 131, 0, 1, 1, 'Live'),
(442, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 442, 131, 0, 1, 1, 'Live'),
(443, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 443, 131, 0, 1, 1, 'Live'),
(444, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 444, 131, 0, 1, 1, 'Live'),
(445, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 445, 132, 0, 1, 1, 'Live'),
(446, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 446, 132, 0, 1, 1, 'Live'),
(447, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 447, 132, 0, 1, 1, 'Live'),
(448, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 448, 132, 0, 1, 1, 'Live'),
(449, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 449, 132, 0, 1, 1, 'Live'),
(450, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 450, 132, 0, 1, 1, 'Live'),
(451, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 451, 133, 0, 1, 1, 'Live'),
(452, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 452, 133, 0, 1, 1, 'Live'),
(453, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 453, 133, 0, 1, 1, 'Live'),
(454, 25, 'Soda vidrio (025)', 3, 18.00, 18.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 454, 133, 0, 1, 1, 'Live'),
(455, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 455, 133, 0, 1, 1, 'Live'),
(456, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 456, 134, 0, 1, 1, 'Live'),
(457, 28, 'PorciÃ³n Mixta (028)', 4, 140.00, 140.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 457, 135, 0, 1, 1, 'Live'),
(458, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 458, 135, 0, 1, 1, 'Live'),
(459, 25, 'Soda vidrio (025)', 4, 24.00, 24.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 459, 135, 0, 1, 1, 'Live'),
(460, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 460, 135, 0, 1, 1, 'Live'),
(461, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:20:55', 461, 135, 0, 1, 1, 'Live'),
(462, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 15:21:11', '2021-06-29 15:21:38', 462, 136, 0, 1, 1, 'Live'),
(463, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 15:21:11', '2021-06-29 15:21:38', 463, 136, 0, 1, 1, 'Live'),
(464, 22, 'Soda desechable (022)', 2, 20.00, 20.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 15:21:11', '2021-06-29 15:21:38', 464, 136, 0, 1, 1, 'Live'),
(465, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-06-29 15:21:11', '2021-06-29 15:21:38', 465, 136, 0, 1, 1, 'Live'),
(466, 10, 'Chile Relleno (010)', 2, 30.00, 30.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 466, 137, 0, 1, 1, 'Live'),
(467, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 467, 137, 0, 1, 1, 'Live'),
(468, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 468, 137, 0, 1, 1, 'Live'),
(469, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '0000-00-00 00:00:00', '2021-06-29 15:32:27', 469, 138, 0, 1, 1, 'Live'),
(470, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 470, 139, 0, 1, 1, 'Live'),
(471, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 471, 139, 0, 1, 1, 'Live'),
(472, 25, 'Soda vidrio (025)', 6, 36.00, 36.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 472, 139, 0, 1, 1, 'Live'),
(473, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 473, 139, 0, 1, 1, 'Live'),
(474, 2, 'Chicharron 1/2 (002)', 3, 90.00, 90.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 474, 140, 0, 1, 1, 'Live'),
(475, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 475, 140, 0, 1, 1, 'Live'),
(476, 18, 'Morcia 1/4 (018)', 2, 40.00, 40.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 476, 140, 0, 1, 1, 'Live'),
(477, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 477, 140, 0, 1, 1, 'Live'),
(478, 10, 'Chile Relleno (010)', 2, 30.00, 30.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 478, 140, 0, 1, 1, 'Live'),
(479, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 479, 140, 0, 1, 1, 'Live'),
(480, 13, 'Limon (013)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 480, 140, 0, 1, 1, 'Live'),
(481, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 481, 140, 0, 1, 1, 'Live'),
(482, 19, 'Rabano (019)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 482, 140, 0, 1, 1, 'Live'),
(483, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 483, 140, 0, 1, 1, 'Live'),
(484, 27, 'PorciÃ³n Super Mixta (027)', 1, 40.00, 40.00, 40.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 484, 140, 0, 1, 1, 'Live'),
(485, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 485, 140, 0, 1, 1, 'Live'),
(486, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 486, 141, 0, 1, 1, 'Live'),
(487, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 487, 141, 0, 1, 1, 'Live'),
(488, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 488, 142, 0, 1, 1, 'Live'),
(489, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 489, 142, 0, 1, 1, 'Live'),
(490, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 490, 143, 0, 1, 1, 'Live'),
(491, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 491, 143, 0, 1, 1, 'Live'),
(492, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 492, 144, 0, 1, 1, 'Live'),
(493, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 493, 144, 0, 1, 1, 'Live'),
(494, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 494, 144, 0, 1, 1, 'Live'),
(495, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 495, 144, 0, 1, 1, 'Live'),
(496, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 496, 145, 0, 1, 1, 'Live'),
(497, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 497, 145, 0, 1, 1, 'Live'),
(498, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 498, 146, 0, 1, 1, 'Live'),
(499, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 499, 147, 0, 1, 1, 'Live'),
(500, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 500, 148, 0, 1, 1, 'Live'),
(501, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 501, 148, 0, 1, 1, 'Live'),
(502, 18, 'Morcia 1/4 (018)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 502, 149, 0, 1, 1, 'Live'),
(503, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 503, 149, 0, 1, 1, 'Live'),
(504, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 504, 149, 0, 1, 1, 'Live'),
(505, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 505, 149, 0, 1, 1, 'Live'),
(506, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 506, 149, 0, 1, 1, 'Live'),
(507, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 507, 149, 0, 1, 1, 'Live'),
(508, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 508, 149, 0, 1, 1, 'Live'),
(509, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 509, 149, 0, 1, 1, 'Live'),
(510, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 510, 149, 0, 1, 1, 'Live'),
(511, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 511, 150, 0, 1, 1, 'Live'),
(512, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 512, 150, 0, 1, 1, 'Live'),
(513, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 513, 150, 0, 1, 1, 'Live'),
(514, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 514, 150, 0, 1, 1, 'Live'),
(515, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 515, 150, 0, 1, 1, 'Live'),
(516, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 516, 150, 0, 1, 1, 'Live'),
(517, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 517, 150, 0, 1, 1, 'Live'),
(518, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 518, 151, 0, 1, 1, 'Live'),
(519, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 519, 151, 0, 1, 1, 'Live'),
(520, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 520, 151, 0, 1, 1, 'Live'),
(521, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 521, 151, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(522, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 522, 152, 0, 1, 1, 'Live'),
(523, 26, 'Tortillas (026)', 3, 3.00, 3.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 523, 152, 0, 1, 1, 'Live'),
(524, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 524, 152, 0, 1, 1, 'Live'),
(525, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525, 153, 0, 1, 1, 'Live'),
(526, 22, 'Soda desechable (022)', 2, 20.00, 20.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 526, 153, 0, 1, 1, 'Live'),
(527, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 527, 153, 0, 1, 1, 'Live'),
(528, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 528, 154, 0, 1, 1, 'Live'),
(529, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 529, 154, 0, 1, 1, 'Live'),
(530, 22, 'Soda desechable (022)', 4, 40.00, 40.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 530, 155, 0, 1, 1, 'Live'),
(531, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 531, 156, 0, 1, 1, 'Live'),
(532, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 532, 156, 0, 1, 1, 'Live'),
(533, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 533, 156, 0, 1, 1, 'Live'),
(534, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 534, 156, 0, 1, 1, 'Live'),
(535, 10, 'Chile Relleno (010)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 535, 157, 0, 1, 1, 'Live'),
(536, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 536, 157, 0, 1, 1, 'Live'),
(537, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 537, 157, 0, 1, 1, 'Live'),
(538, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 538, 157, 0, 1, 1, 'Live'),
(539, 10, 'Chile Relleno (010)', 3, 45.00, 45.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 539, 158, 0, 1, 1, 'Live'),
(540, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 540, 159, 0, 1, 1, 'Live'),
(541, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 541, 159, 0, 1, 1, 'Live'),
(542, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 542, 159, 0, 1, 1, 'Live'),
(543, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 543, 159, 0, 1, 1, 'Live'),
(544, 30, 'Libra Mixta (030)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 544, 160, 0, 1, 1, 'Live'),
(545, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 545, 160, 0, 1, 1, 'Live'),
(546, 10, 'Chile Relleno (010)', 2, 30.00, 30.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 546, 161, 0, 1, 1, 'Live'),
(547, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 547, 161, 0, 1, 1, 'Live'),
(548, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 548, 161, 0, 1, 1, 'Live'),
(549, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 549, 162, 0, 1, 1, 'Live'),
(550, 1, 'Chicharron 1 (001)', 3, 180.00, 180.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 550, 163, 0, 1, 1, 'Live'),
(551, 9, 'Agua pura (009)', 2, 10.00, 10.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 551, 163, 0, 1, 1, 'Live'),
(552, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 552, 164, 0, 1, 1, 'Live'),
(553, 1, 'Chicharron 1 (001)', 3, 180.00, 180.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 553, 165, 0, 1, 1, 'Live'),
(554, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 554, 165, 0, 1, 1, 'Live'),
(555, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 555, 165, 0, 1, 1, 'Live'),
(556, 26, 'Tortillas (026)', 25, 25.00, 25.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 556, 165, 0, 1, 1, 'Live'),
(557, 19, 'Rabano (019)', 14, 70.00, 70.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 557, 165, 0, 1, 1, 'Live'),
(558, 10, 'Chile Relleno (010)', 3, 45.00, 45.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 558, 166, 0, 1, 1, 'Live'),
(559, 3, 'Chicharron 1/4 (003)', 2, 40.00, 40.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 559, 167, 0, 1, 1, 'Live'),
(560, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 560, 167, 0, 1, 1, 'Live'),
(561, 10, 'Chile Relleno (010)', 3, 45.00, 45.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 561, 168, 0, 1, 1, 'Live'),
(562, 20, 'Patitas de cerdo con Huevo (020)', 3, 60.00, 60.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 562, 168, 0, 1, 1, 'Live'),
(563, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 563, 168, 0, 1, 1, 'Live'),
(564, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 564, 169, 0, 1, 1, 'Live'),
(565, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 565, 169, 0, 1, 1, 'Live'),
(566, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 566, 169, 0, 1, 1, 'Live'),
(567, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 567, 169, 0, 1, 1, 'Live'),
(568, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 568, 169, 0, 1, 1, 'Live'),
(569, 26, 'Tortillas (026)', 20, 20.00, 20.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 569, 170, 0, 1, 1, 'Live'),
(570, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 570, 171, 0, 1, 1, 'Live'),
(571, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 571, 171, 0, 1, 1, 'Live'),
(572, 1, 'Chicharron 1 (001)', 2, 120.00, 120.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 572, 172, 0, 1, 1, 'Live'),
(573, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 573, 172, 0, 1, 1, 'Live'),
(574, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 574, 173, 0, 1, 1, 'Live'),
(575, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 575, 174, 0, 1, 1, 'Live'),
(576, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 576, 175, 0, 1, 1, 'Live'),
(577, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 577, 175, 0, 1, 1, 'Live'),
(578, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 578, 175, 0, 1, 1, 'Live'),
(579, 22, 'Soda desechable (022)', 2, 20.00, 20.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 579, 175, 0, 1, 1, 'Live'),
(580, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 580, 175, 0, 1, 1, 'Live'),
(581, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 581, 176, 0, 1, 1, 'Live'),
(582, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 582, 176, 0, 1, 1, 'Live'),
(583, 26, 'Tortillas (026)', 3, 3.00, 3.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 583, 176, 0, 1, 1, 'Live'),
(584, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 584, 177, 0, 1, 1, 'Live'),
(585, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 585, 178, 0, 1, 1, 'Live'),
(586, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 586, 178, 0, 1, 1, 'Live'),
(587, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 587, 178, 0, 1, 1, 'Live'),
(588, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 588, 178, 0, 1, 1, 'Live'),
(589, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 589, 178, 0, 1, 1, 'Live'),
(590, 26, 'Tortillas (026)', 3, 3.00, 3.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 590, 179, 0, 1, 1, 'Live'),
(591, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 591, 180, 0, 1, 1, 'Live'),
(592, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 592, 180, 0, 1, 1, 'Live'),
(593, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 593, 181, 0, 1, 1, 'Live'),
(594, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 594, 182, 0, 1, 1, 'Live'),
(595, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 595, 182, 0, 1, 1, 'Live'),
(596, 14, 'Lengua de res con Huevo (014)', 2, 40.00, 40.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 596, 183, 0, 1, 1, 'Live'),
(597, 21, 'Queso fresco 1/2 (021)', 2, 24.00, 24.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 597, 184, 0, 1, 1, 'Live'),
(598, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 598, 185, 0, 1, 1, 'Live'),
(599, 31, '12 onzas Mixta (031)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 599, 186, 0, 1, 1, 'Live'),
(600, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 600, 187, 0, 1, 1, 'Live'),
(601, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 601, 188, 0, 1, 1, 'Live'),
(602, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 602, 188, 0, 1, 1, 'Live'),
(603, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 603, 188, 0, 1, 1, 'Live'),
(604, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 604, 188, 0, 1, 1, 'Live'),
(605, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 605, 189, 0, 1, 1, 'Live'),
(606, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 606, 189, 0, 1, 1, 'Live'),
(607, 26, 'Tortillas (026)', 7, 7.00, 7.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 607, 189, 0, 1, 1, 'Live'),
(608, 34, 'PorciÃ³n Simple (034)', 4, 120.00, 120.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 608, 190, 0, 1, 1, 'Live'),
(609, 26, 'Tortillas (026)', 6, 6.00, 6.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 609, 190, 0, 1, 1, 'Live'),
(610, 25, 'Soda vidrio (025)', 4, 24.00, 24.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 610, 190, 0, 1, 1, 'Live'),
(611, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 611, 191, 0, 1, 1, 'Live'),
(612, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 612, 192, 0, 1, 1, 'Live'),
(613, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 613, 192, 0, 1, 1, 'Live'),
(614, 22, 'Soda desechable (022)', 2, 20.00, 20.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 614, 193, 0, 1, 1, 'Live'),
(615, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 615, 194, 0, 1, 1, 'Live'),
(616, 19, 'Rabano (019)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 616, 194, 0, 1, 1, 'Live'),
(617, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 617, 195, 0, 1, 1, 'Live'),
(618, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 618, 195, 0, 1, 1, 'Live'),
(619, 21, 'Queso fresco 1/2 (021)', 2, 24.00, 24.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 619, 196, 0, 1, 1, 'Live'),
(620, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 620, 196, 0, 1, 1, 'Live'),
(621, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 621, 197, 0, 1, 1, 'Live'),
(622, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 622, 197, 0, 1, 1, 'Live'),
(623, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 623, 197, 0, 1, 1, 'Live'),
(624, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 624, 197, 0, 1, 1, 'Live'),
(625, 13, 'Limon (013)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 625, 197, 0, 1, 1, 'Live'),
(626, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 626, 197, 0, 1, 1, 'Live'),
(627, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 627, 198, 0, 1, 1, 'Live'),
(628, 26, 'Tortillas (026)', 15, 15.00, 15.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 628, 198, 0, 1, 1, 'Live'),
(629, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 629, 199, 0, 1, 1, 'Live'),
(630, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 630, 200, 0, 1, 1, 'Live'),
(631, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 631, 200, 0, 1, 1, 'Live'),
(632, 27, 'PorciÃ³n Super Mixta (027)', 1, 40.00, 40.00, 40.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 632, 201, 0, 1, 1, 'Live'),
(633, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 633, 201, 0, 1, 1, 'Live'),
(634, 9, 'Agua pura (009)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 634, 201, 0, 1, 1, 'Live'),
(635, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 635, 201, 0, 1, 1, 'Live'),
(636, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 636, 201, 0, 1, 1, 'Live'),
(637, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 637, 201, 0, 1, 1, 'Live'),
(638, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 638, 202, 0, 1, 1, 'Live'),
(639, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 639, 203, 0, 1, 1, 'Live'),
(640, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 640, 204, 0, 1, 1, 'Live'),
(641, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 641, 205, 0, 1, 1, 'Live'),
(642, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 642, 205, 0, 1, 1, 'Live'),
(643, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 643, 205, 0, 1, 1, 'Live'),
(644, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 644, 206, 0, 1, 1, 'Live'),
(645, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 645, 207, 0, 1, 1, 'Live'),
(646, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 646, 207, 0, 1, 1, 'Live'),
(647, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 647, 208, 0, 1, 1, 'Live'),
(648, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 648, 208, 0, 1, 1, 'Live'),
(649, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 649, 209, 0, 1, 1, 'Live'),
(650, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 650, 209, 0, 1, 1, 'Live'),
(651, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 651, 209, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(652, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 652, 210, 0, 1, 1, 'Live'),
(653, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 653, 210, 0, 1, 1, 'Live'),
(654, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 654, 210, 0, 1, 1, 'Live'),
(655, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 655, 210, 0, 1, 1, 'Live'),
(656, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 656, 210, 0, 1, 1, 'Live'),
(657, 20, 'Patitas de cerdo con Huevo (020)', 2, 40.00, 40.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 657, 210, 0, 1, 1, 'Live'),
(658, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 658, 211, 0, 1, 1, 'Live'),
(659, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 659, 211, 0, 1, 1, 'Live'),
(660, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 660, 211, 0, 1, 1, 'Live'),
(661, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 661, 211, 0, 1, 1, 'Live'),
(662, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 662, 211, 0, 1, 1, 'Live'),
(663, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 663, 212, 0, 1, 1, 'Live'),
(664, 10, 'Chile Relleno (010)', 2, 30.00, 30.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 664, 213, 0, 1, 1, 'Live'),
(665, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 665, 213, 0, 1, 1, 'Live'),
(666, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 666, 214, 0, 1, 1, 'Live'),
(667, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 667, 214, 0, 1, 1, 'Live'),
(668, 18, 'Morcia 1/4 (018)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 668, 214, 0, 1, 1, 'Live'),
(669, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 669, 214, 0, 1, 1, 'Live'),
(670, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 670, 215, 0, 1, 1, 'Live'),
(671, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 671, 215, 0, 1, 1, 'Live'),
(672, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 672, 215, 0, 1, 1, 'Live'),
(673, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 673, 216, 0, 1, 1, 'Live'),
(674, 6, 'Carnitas 3/4 (006)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 674, 216, 0, 1, 1, 'Live'),
(675, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 675, 216, 0, 1, 1, 'Live'),
(676, 25, 'Soda vidrio (025)', 2, 12.00, 12.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 676, 216, 0, 1, 1, 'Live'),
(677, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 677, 217, 0, 1, 1, 'Live'),
(678, 26, 'Tortillas (026)', 3, 3.00, 3.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 678, 217, 0, 1, 1, 'Live'),
(679, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 679, 218, 0, 1, 1, 'Live'),
(680, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 680, 218, 0, 1, 1, 'Live'),
(681, 26, 'Tortillas (026)', 20, 20.00, 20.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 681, 218, 0, 1, 1, 'Live'),
(682, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 682, 219, 0, 1, 1, 'Live'),
(683, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 683, 219, 0, 1, 1, 'Live'),
(684, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 684, 219, 0, 1, 1, 'Live'),
(685, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 685, 220, 0, 1, 1, 'Live'),
(686, 34, 'PorciÃ³n Simple (034)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 686, 221, 0, 1, 1, 'Live'),
(687, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 687, 221, 0, 1, 1, 'Live'),
(688, 26, 'Tortillas (026)', 2, 2.00, 2.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 688, 222, 0, 1, 1, 'Live'),
(689, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 689, 222, 0, 1, 1, 'Live'),
(690, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 690, 223, 0, 1, 1, 'Live'),
(691, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 691, 223, 0, 1, 1, 'Live'),
(692, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 692, 224, 0, 1, 1, 'Live'),
(693, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 693, 225, 0, 1, 1, 'Live'),
(694, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 694, 225, 0, 1, 1, 'Live'),
(695, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 695, 226, 0, 1, 1, 'Live'),
(696, 26, 'Tortillas (026)', 4, 4.00, 4.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 696, 226, 0, 1, 1, 'Live'),
(697, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 697, 227, 0, 1, 1, 'Live'),
(698, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 698, 227, 0, 1, 1, 'Live'),
(699, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 699, 227, 0, 1, 1, 'Live'),
(700, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 700, 227, 0, 1, 1, 'Live'),
(701, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 701, 228, 0, 1, 1, 'Live'),
(702, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 702, 228, 0, 1, 1, 'Live'),
(703, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 703, 229, 0, 1, 1, 'Live'),
(704, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 704, 230, 0, 1, 1, 'Live'),
(705, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 705, 231, 0, 1, 1, 'Live'),
(706, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 706, 231, 0, 1, 1, 'Live'),
(707, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 707, 231, 0, 1, 1, 'Live'),
(708, 6, 'Carnitas 3/4 (006)', 1, 55.00, 55.00, 55.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 708, 232, 0, 1, 1, 'Live'),
(709, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 709, 232, 0, 1, 1, 'Live'),
(710, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 710, 232, 0, 1, 1, 'Live'),
(711, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 711, 232, 0, 1, 1, 'Live'),
(712, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 712, 233, 0, 1, 1, 'Live'),
(713, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 713, 233, 0, 1, 1, 'Live'),
(714, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 714, 234, 0, 1, 1, 'Live'),
(715, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 715, 235, 0, 1, 1, 'Live'),
(716, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 716, 236, 0, 1, 1, 'Live'),
(717, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 717, 236, 0, 1, 1, 'Live'),
(718, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 718, 237, 0, 1, 1, 'Live'),
(719, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 719, 237, 0, 1, 1, 'Live'),
(720, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 720, 237, 0, 1, 1, 'Live'),
(721, 14, 'Lengua de res con Huevo (014)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 721, 237, 0, 1, 1, 'Live'),
(722, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 722, 238, 0, 1, 1, 'Live'),
(723, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 723, 238, 0, 1, 1, 'Live'),
(724, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 724, 239, 0, 1, 1, 'Live'),
(725, 20, 'Patitas de cerdo con Huevo (020)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 725, 239, 0, 1, 1, 'Live'),
(726, 5, 'Carnitas 1 (005)', 3, 195.00, 195.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 726, 240, 0, 1, 1, 'Live'),
(727, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 727, 240, 0, 1, 1, 'Live'),
(728, 26, 'Tortillas (026)', 25, 25.00, 25.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 728, 240, 0, 1, 1, 'Live'),
(729, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 729, 240, 0, 1, 1, 'Live'),
(730, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 730, 241, 0, 1, 1, 'Live'),
(731, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 731, 241, 0, 1, 1, 'Live'),
(732, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 732, 241, 0, 1, 1, 'Live'),
(733, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 733, 242, 0, 1, 1, 'Live'),
(734, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 734, 242, 0, 1, 1, 'Live'),
(735, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 735, 243, 0, 1, 1, 'Live'),
(736, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 736, 243, 0, 1, 1, 'Live'),
(737, 32, '1/2 Libra Mixta (032)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"6\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 737, 244, 0, 1, 1, 'Live'),
(738, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 738, 245, 0, 1, 1, 'Live'),
(739, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 739, 245, 0, 1, 1, 'Live'),
(740, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 740, 246, 0, 1, 1, 'Live'),
(741, 26, 'Tortillas (026)', 8, 8.00, 8.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 741, 246, 0, 1, 1, 'Live'),
(742, 26, 'Tortillas (026)', 3, 3.00, 3.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 742, 247, 0, 1, 1, 'Live'),
(743, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 743, 248, 0, 1, 1, 'Live'),
(744, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 744, 248, 0, 1, 1, 'Live'),
(745, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 745, 248, 0, 1, 1, 'Live'),
(746, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 746, 248, 0, 1, 1, 'Live'),
(747, 21, 'Queso fresco 1/2 (021)', 2, 24.00, 24.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 747, 249, 0, 1, 1, 'Live'),
(748, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 748, 250, 0, 1, 1, 'Live'),
(749, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 749, 250, 0, 1, 1, 'Live'),
(750, 1, 'Chicharron 1 (001)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 750, 250, 0, 1, 1, 'Live'),
(751, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 751, 250, 0, 1, 1, 'Live'),
(752, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 752, 250, 0, 1, 1, 'Live'),
(753, 28, 'PorciÃ³n Mixta (028)', 1, 35.00, 35.00, 35.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 753, 251, 0, 1, 1, 'Live'),
(754, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 754, 252, 0, 1, 1, 'Live'),
(755, 9, 'Agua pura (009)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 755, 252, 0, 1, 1, 'Live'),
(756, 4, 'Chicharron 3/4 (004)', 1, 50.00, 50.00, 50.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 756, 253, 0, 1, 1, 'Live'),
(757, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 757, 254, 0, 1, 1, 'Live'),
(758, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 758, 254, 0, 1, 1, 'Live'),
(759, 7, 'Carnitas 1/2 (007)', 1, 35.00, 35.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 759, 254, 0, 1, 1, 'Live'),
(760, 26, 'Tortillas (026)', 10, 10.00, 10.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 760, 254, 0, 1, 1, 'Live'),
(761, 23, 'Soda 1.5 (023)', 1, 15.00, 15.00, 15.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 761, 254, 0, 1, 1, 'Live'),
(762, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 762, 255, 0, 1, 1, 'Live'),
(763, 26, 'Tortillas (026)', 5, 5.00, 5.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 763, 255, 0, 1, 1, 'Live'),
(764, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 764, 256, 0, 1, 1, 'Live'),
(765, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 765, 257, 0, 1, 1, 'Live'),
(766, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 766, 257, 0, 1, 1, 'Live'),
(767, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 767, 257, 0, 1, 1, 'Live'),
(768, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 768, 257, 0, 1, 1, 'Live'),
(769, 13, 'Limon (013)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 769, 257, 0, 1, 1, 'Live'),
(770, 11, 'JalapeÃ±o y cebollin (011)', 1, 5.00, 5.00, 5.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 770, 257, 0, 1, 1, 'Live'),
(771, 8, 'Carnitas 1/4 (008)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 771, 257, 0, 1, 1, 'Live'),
(772, 15, 'Morcilla 1 (015)', 1, 60.00, 60.00, 60.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 772, 258, 0, 1, 1, 'Live'),
(773, 14, 'Lengua de res con Huevo (014)', 4, 80.00, 80.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 773, 259, 0, 1, 1, 'Live'),
(774, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 774, 259, 0, 1, 1, 'Live'),
(775, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 775, 260, 0, 1, 1, 'Live'),
(776, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 776, 260, 0, 1, 1, 'Live'),
(777, 25, 'Soda vidrio (025)', 1, 6.00, 6.00, 6.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 777, 260, 0, 1, 1, 'Live'),
(778, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 778, 260, 0, 1, 1, 'Live'),
(779, 21, 'Queso fresco 1/2 (021)', 1, 12.00, 12.00, 12.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-14 11:36:13', '0000-00-00 00:00:00', 779, 260, 0, 1, 1, 'Live'),
(780, 7, 'Carnitas 1/2 (007)', 10, 350.00, 350.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 780, 261, 0, 1, 1, 'Live'),
(781, 7, 'Carnitas 1/2 (007)', 10, 350.00, 350.00, 35.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 781, 262, 0, 1, 1, 'Live'),
(782, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 782, 263, 0, 1, 1, 'Live'),
(783, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 783, 263, 0, 1, 1, 'Live');
INSERT INTO `tbl_sales_details` (`id`, `food_menu_id`, `menu_name`, `qty`, `menu_price_without_discount`, `menu_price_with_discount`, `menu_unit_price`, `menu_vat_percentage`, `menu_taxes`, `menu_discount_value`, `discount_type`, `menu_note`, `discount_amount`, `item_type`, `cooking_status`, `cooking_start_time`, `cooking_done_time`, `previous_id`, `sales_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(784, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 784, 263, 0, 1, 1, 'Live'),
(785, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-15 11:58:44', '0000-00-00 00:00:00', 785, 264, 0, 1, 1, 'Live'),
(786, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-15 11:58:44', '0000-00-00 00:00:00', 786, 264, 0, 1, 1, 'Live'),
(787, 26, 'Tortillas (026)', 1, 1.00, 1.00, 1.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-15 11:58:44', '0000-00-00 00:00:00', 787, 264, 0, 1, 1, 'Live'),
(788, 2, 'Chicharron 1/2 (002)', 1, 30.00, 30.00, 30.00, 0.00, '[]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Started Cooking', '2021-09-15 11:58:44', '0000-00-00 00:00:00', 788, 264, 0, 1, 1, 'Live'),
(789, 5, 'Carnitas 1 (005)', 1, 65.00, 65.00, 65.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 789, 265, 0, 1, 1, 'Live'),
(790, 22, 'Soda desechable (022)', 1, 10.00, 10.00, 10.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 790, 265, 0, 1, 1, 'Live'),
(791, 24, 'Soda 2.5 (024)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 791, 265, 0, 1, 1, 'Live'),
(792, 17, 'Morcia 1/2 (017)', 1, 30.00, 30.00, 30.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 792, 265, 0, 1, 1, 'Live'),
(793, 3, 'Chicharron 1/4 (003)', 1, 20.00, 20.00, 20.00, 0.00, '[{\"tax_field_id\":\"5\",\"tax_field_outlet_id\":\"1\",\"tax_field_company_id\":\"1\",\"tax_field_name\":\"\",\"tax_field_percentage\":\"0\",\"item_vat_amount_for_unit_item\":\"0.00\",\"item_vat_amount_for_all_quantity\":\"0.00\"}]', '0', 'plain', '', 0.00, 'Kitchen Item', 'Done', '2021-09-15 11:57:03', '2021-09-15 11:58:16', 793, 265, 0, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_details_modifiers`
--

CREATE TABLE `tbl_sales_details_modifiers` (
  `id` bigint NOT NULL,
  `modifier_id` int NOT NULL,
  `modifier_price` float(10,2) NOT NULL,
  `food_menu_id` int NOT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `sales_details_id` int NOT NULL,
  `user_id` int NOT NULL,
  `outlet_id` int NOT NULL,
  `customer_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions`
--

CREATE TABLE `tbl_sale_consumptions` (
  `id` bigint NOT NULL,
  `sale_id` int DEFAULT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_sale_consumptions`
--

INSERT INTO `tbl_sale_consumptions` (`id`, `sale_id`, `order_status`, `user_id`, `outlet_id`, `del_status`) VALUES
(1, 1, 0, 1, 1, 'Live'),
(2, 2, 0, 1, 1, 'Live'),
(3, 3, 0, 1, 1, 'Live'),
(4, 4, 0, 1, 1, 'Live'),
(5, 5, 0, 1, 1, 'Live'),
(6, 6, 0, 1, 1, 'Live'),
(7, 7, 0, 1, 1, 'Live'),
(8, 8, 0, 1, 1, 'Live'),
(9, 9, 0, 1, 1, 'Live'),
(10, 10, 0, 1, 1, 'Live'),
(11, 11, 0, 1, 1, 'Live'),
(12, 12, 0, 1, 1, 'Live'),
(13, 13, 0, 1, 1, 'Live'),
(14, 14, 0, 1, 1, 'Live'),
(15, 15, 0, 1, 1, 'Live'),
(16, 16, 0, 1, 1, 'Live'),
(17, 17, 0, 1, 1, 'Live'),
(18, 18, 0, 1, 1, 'Live'),
(19, 19, 0, 1, 1, 'Live'),
(20, 20, 0, 1, 1, 'Live'),
(21, 21, 0, 1, 1, 'Live'),
(22, 22, 0, 1, 1, 'Live'),
(23, 23, 0, 1, 1, 'Live'),
(24, 24, 0, 1, 1, 'Live'),
(25, 25, 0, 1, 1, 'Live'),
(26, 26, 0, 1, 1, 'Live'),
(27, 27, 0, 1, 1, 'Live'),
(28, 28, 0, 1, 1, 'Live'),
(29, 29, 0, 1, 1, 'Live'),
(30, 30, 0, 1, 1, 'Live'),
(31, 31, 0, 1, 1, 'Live'),
(32, 32, 0, 1, 1, 'Live'),
(33, 33, 0, 1, 1, 'Live'),
(34, 34, 0, 1, 1, 'Live'),
(35, 35, 0, 1, 1, 'Live'),
(36, 36, 0, 1, 1, 'Live'),
(37, 37, 0, 1, 1, 'Live'),
(38, 38, 0, 1, 1, 'Live'),
(39, 39, 0, 1, 1, 'Live'),
(40, 40, 0, 1, 1, 'Live'),
(41, 41, 0, 1, 1, 'Live'),
(42, 42, 0, 1, 1, 'Live'),
(43, 43, 0, 1, 1, 'Live'),
(44, 44, 0, 1, 1, 'Live'),
(45, 45, 0, 1, 1, 'Live'),
(46, 46, 0, 1, 1, 'Live'),
(47, 47, 0, 1, 1, 'Live'),
(49, 49, 0, 1, 1, 'Live'),
(50, 50, 0, 1, 1, 'Live'),
(51, 51, 0, 1, 1, 'Live'),
(52, 52, 0, 1, 1, 'Live'),
(53, 53, 0, 1, 1, 'Live'),
(54, 54, 0, 1, 1, 'Live'),
(55, 55, 0, 1, 1, 'Live'),
(56, 56, 0, 1, 1, 'Live'),
(57, 57, 0, 1, 1, 'Live'),
(58, 58, 0, 1, 1, 'Live'),
(59, 59, 0, 1, 1, 'Live'),
(60, 60, 0, 1, 1, 'Live'),
(61, 61, 0, 1, 1, 'Live'),
(62, 62, 0, 1, 1, 'Live'),
(63, 63, 0, 1, 1, 'Live'),
(64, 64, 0, 1, 1, 'Live'),
(65, 65, 0, 1, 1, 'Live'),
(66, 66, 0, 1, 1, 'Live'),
(67, 67, 0, 1, 1, 'Live'),
(68, 68, 0, 1, 1, 'Live'),
(69, 69, 0, 1, 1, 'Live'),
(70, 70, 0, 1, 1, 'Live'),
(71, 71, 0, 1, 1, 'Live'),
(72, 72, 0, 1, 1, 'Live'),
(73, 73, 0, 1, 1, 'Live'),
(74, 74, 0, 1, 1, 'Live'),
(75, 75, 0, 1, 1, 'Live'),
(76, 76, 0, 1, 1, 'Live'),
(77, 77, 0, 1, 1, 'Live'),
(78, 78, 0, 1, 1, 'Live'),
(79, 79, 0, 1, 1, 'Live'),
(80, 80, 0, 1, 1, 'Live'),
(81, 81, 0, 1, 1, 'Live'),
(82, 82, 0, 1, 1, 'Live'),
(83, 83, 0, 1, 1, 'Live'),
(84, 84, 0, 1, 1, 'Live'),
(85, 85, 0, 1, 1, 'Live'),
(86, 86, 0, 1, 1, 'Live'),
(87, 87, 0, 1, 1, 'Live'),
(88, 88, 0, 1, 1, 'Live'),
(89, 89, 0, 1, 1, 'Live'),
(90, 90, 0, 1, 1, 'Live'),
(91, 91, 0, 1, 1, 'Live'),
(92, 92, 0, 1, 1, 'Live'),
(93, 93, 0, 1, 1, 'Live'),
(94, 94, 0, 1, 1, 'Live'),
(95, 95, 0, 1, 1, 'Live'),
(96, 96, 0, 1, 1, 'Live'),
(97, 97, 0, 1, 1, 'Live'),
(98, 98, 0, 1, 1, 'Live'),
(99, 99, 0, 1, 1, 'Live'),
(100, 100, 0, 1, 1, 'Live'),
(101, 101, 0, 1, 1, 'Live'),
(102, 102, 0, 1, 1, 'Live'),
(103, 103, 0, 1, 1, 'Live'),
(104, 104, 0, 1, 1, 'Live'),
(105, 105, 0, 1, 1, 'Live'),
(106, 106, 0, 1, 1, 'Live'),
(107, 107, 0, 1, 1, 'Live'),
(108, 108, 0, 1, 1, 'Live'),
(109, 109, 0, 1, 1, 'Live'),
(110, 110, 0, 1, 1, 'Live'),
(111, 111, 0, 1, 1, 'Live'),
(112, 112, 0, 1, 1, 'Live'),
(113, 113, 0, 1, 1, 'Live'),
(114, 114, 0, 1, 1, 'Live'),
(115, 115, 0, 1, 1, 'Live'),
(116, 116, 0, 1, 1, 'Live'),
(117, 117, 0, 1, 1, 'Live'),
(118, 118, 0, 1, 1, 'Live'),
(119, 119, 0, 1, 1, 'Live'),
(120, 120, 0, 1, 1, 'Live'),
(121, 121, 0, 1, 1, 'Live'),
(122, 122, 0, 1, 1, 'Live'),
(123, 123, 0, 1, 1, 'Live'),
(124, 124, 0, 1, 1, 'Live'),
(125, 125, 0, 1, 1, 'Live'),
(126, 126, 0, 1, 1, 'Live'),
(127, 127, 0, 1, 1, 'Live'),
(128, 128, 0, 1, 1, 'Live'),
(129, 129, 0, 1, 1, 'Live'),
(130, 130, 0, 1, 1, 'Live'),
(131, 131, 0, 1, 1, 'Live'),
(132, 132, 0, 1, 1, 'Live'),
(133, 133, 0, 1, 1, 'Live'),
(134, 134, 0, 1, 1, 'Live'),
(135, 135, 0, 1, 1, 'Live'),
(136, 136, 0, 1, 1, 'Live'),
(137, 137, 0, 1, 1, 'Live'),
(138, 138, 0, 1, 1, 'Live'),
(139, 139, 0, 1, 1, 'Live'),
(140, 140, 0, 1, 1, 'Live'),
(141, 141, 0, 1, 1, 'Live'),
(142, 142, 0, 1, 1, 'Live'),
(143, 143, 0, 1, 1, 'Live'),
(144, 144, 0, 1, 1, 'Live'),
(145, 145, 0, 1, 1, 'Live'),
(146, 146, 0, 1, 1, 'Live'),
(147, 147, 0, 1, 1, 'Live'),
(148, 148, 0, 1, 1, 'Live'),
(149, 149, 0, 1, 1, 'Live'),
(150, 150, 0, 1, 1, 'Live'),
(151, 151, 0, 1, 1, 'Live'),
(152, 152, 0, 1, 1, 'Live'),
(153, 153, 0, 1, 1, 'Live'),
(154, 154, 0, 1, 1, 'Live'),
(155, 155, 0, 1, 1, 'Live'),
(156, 156, 0, 1, 1, 'Live'),
(157, 157, 0, 1, 1, 'Live'),
(158, 158, 0, 1, 1, 'Live'),
(159, 159, 0, 1, 1, 'Live'),
(160, 160, 0, 1, 1, 'Live'),
(161, 161, 0, 1, 1, 'Live'),
(162, 162, 0, 1, 1, 'Live'),
(163, 163, 0, 1, 1, 'Live'),
(164, 164, 0, 1, 1, 'Live'),
(165, 165, 0, 1, 1, 'Live'),
(166, 166, 0, 1, 1, 'Live'),
(167, 167, 0, 1, 1, 'Live'),
(168, 168, 0, 1, 1, 'Live'),
(169, 169, 0, 1, 1, 'Live'),
(170, 170, 0, 1, 1, 'Live'),
(171, 171, 0, 1, 1, 'Live'),
(172, 172, 0, 1, 1, 'Live'),
(173, 173, 0, 1, 1, 'Live'),
(174, 174, 0, 1, 1, 'Live'),
(175, 175, 0, 1, 1, 'Live'),
(176, 176, 0, 1, 1, 'Live'),
(177, 177, 0, 1, 1, 'Live'),
(178, 178, 0, 1, 1, 'Live'),
(179, 179, 0, 1, 1, 'Live'),
(180, 180, 0, 1, 1, 'Live'),
(181, 181, 0, 1, 1, 'Live'),
(182, 182, 0, 1, 1, 'Live'),
(183, 183, 0, 1, 1, 'Live'),
(184, 184, 0, 1, 1, 'Live'),
(185, 185, 0, 1, 1, 'Live'),
(186, 186, 0, 1, 1, 'Live'),
(187, 187, 0, 1, 1, 'Live'),
(188, 188, 0, 1, 1, 'Live'),
(189, 189, 0, 1, 1, 'Live'),
(190, 190, 0, 1, 1, 'Live'),
(191, 191, 0, 1, 1, 'Live'),
(192, 192, 0, 1, 1, 'Live'),
(193, 193, 0, 1, 1, 'Live'),
(194, 194, 0, 1, 1, 'Live'),
(195, 195, 0, 1, 1, 'Live'),
(196, 196, 0, 1, 1, 'Live'),
(197, 197, 0, 1, 1, 'Live'),
(198, 198, 0, 1, 1, 'Live'),
(199, 199, 0, 1, 1, 'Live'),
(200, 200, 0, 1, 1, 'Live'),
(201, 201, 0, 1, 1, 'Live'),
(202, 202, 0, 1, 1, 'Live'),
(203, 203, 0, 1, 1, 'Live'),
(204, 204, 0, 1, 1, 'Live'),
(205, 205, 0, 1, 1, 'Live'),
(206, 206, 0, 1, 1, 'Live'),
(207, 207, 0, 1, 1, 'Live'),
(208, 208, 0, 1, 1, 'Live'),
(209, 209, 0, 1, 1, 'Live'),
(210, 210, 0, 1, 1, 'Live'),
(211, 211, 0, 1, 1, 'Live'),
(212, 212, 0, 1, 1, 'Live'),
(213, 213, 0, 1, 1, 'Live'),
(214, 214, 0, 1, 1, 'Live'),
(215, 215, 0, 1, 1, 'Live'),
(216, 216, 0, 1, 1, 'Live'),
(217, 217, 0, 1, 1, 'Live'),
(218, 218, 0, 1, 1, 'Live'),
(219, 219, 0, 1, 1, 'Live'),
(220, 220, 0, 1, 1, 'Live'),
(221, 221, 0, 1, 1, 'Live'),
(222, 222, 0, 1, 1, 'Live'),
(223, 223, 0, 1, 1, 'Live'),
(224, 224, 0, 1, 1, 'Live'),
(225, 225, 0, 1, 1, 'Live'),
(226, 226, 0, 1, 1, 'Live'),
(227, 227, 0, 1, 1, 'Live'),
(228, 228, 0, 1, 1, 'Live'),
(229, 229, 0, 1, 1, 'Live'),
(230, 230, 0, 1, 1, 'Live'),
(231, 231, 0, 1, 1, 'Live'),
(232, 232, 0, 1, 1, 'Live'),
(233, 233, 0, 1, 1, 'Live'),
(234, 234, 0, 1, 1, 'Live'),
(235, 235, 0, 1, 1, 'Live'),
(236, 236, 0, 1, 1, 'Live'),
(237, 237, 0, 1, 1, 'Live'),
(238, 238, 0, 1, 1, 'Live'),
(239, 239, 0, 1, 1, 'Live'),
(240, 240, 0, 1, 1, 'Live'),
(241, 241, 0, 1, 1, 'Live'),
(242, 242, 0, 1, 1, 'Live'),
(243, 243, 0, 1, 1, 'Live'),
(244, 244, 0, 1, 1, 'Live'),
(245, 245, 0, 1, 1, 'Live'),
(246, 246, 0, 1, 1, 'Live'),
(247, 247, 0, 1, 1, 'Live'),
(248, 248, 0, 1, 1, 'Live'),
(249, 249, 0, 1, 1, 'Live'),
(250, 250, 0, 1, 1, 'Live'),
(251, 251, 0, 1, 1, 'Live'),
(252, 252, 0, 1, 1, 'Live'),
(253, 253, 0, 1, 1, 'Live'),
(254, 254, 0, 1, 1, 'Live'),
(255, 255, 0, 1, 1, 'Live'),
(256, 256, 0, 1, 1, 'Live'),
(257, 257, 0, 1, 1, 'Live'),
(258, 258, 0, 1, 1, 'Live'),
(259, 259, 0, 1, 1, 'Live'),
(260, 260, 0, 1, 1, 'Live'),
(261, 261, 0, 1, 1, 'Live'),
(262, 262, 0, 1, 1, 'Live'),
(263, 263, 0, 1, 1, 'Live'),
(264, 264, 0, 1, 1, 'Live'),
(265, 265, 0, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_menus` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_sale_consumptions_of_menus`
--

INSERT INTO `tbl_sale_consumptions_of_menus` (`id`, `ingredient_id`, `consumption`, `sale_consumption_id`, `sales_id`, `order_status`, `food_menu_id`, `user_id`, `outlet_id`, `del_status`) VALUES
(1, 1, 1.00, 1, 1, 0, 1, 1, 1, 'Live'),
(2, 1, 1.00, 2, 2, 0, 1, 1, 1, 'Live'),
(3, 1, 1.00, 3, 3, 0, 1, 1, 1, 'Live'),
(4, 1, 1.00, 4, 4, 0, 1, 1, 1, 'Live'),
(5, 1, 1.00, 5, 5, 0, 1, 1, 1, 'Live'),
(6, 1, 1.00, 6, 6, 0, 2, 1, 1, 'Live'),
(7, 1, 1.00, 7, 7, 0, 1, 1, 1, 'Live'),
(8, 1, 1.00, 8, 8, 0, 1, 1, 1, 'Live'),
(9, 1, 1.00, 9, 9, 0, 1, 1, 1, 'Live'),
(10, 1, 1.00, 9, 9, 0, 2, 1, 1, 'Live'),
(11, 1, 1.00, 10, 10, 0, 1, 1, 1, 'Live'),
(12, 1, 1.00, 10, 10, 0, 2, 1, 1, 'Live'),
(13, 15, 1.00, 11, 11, 0, 24, 1, 1, 'Live'),
(14, 15, 1.00, 12, 12, 0, 24, 1, 1, 'Live'),
(15, 2, 1.00, 12, 12, 0, 1, 1, 1, 'Live'),
(16, 2, 1.00, 13, 13, 0, 1, 1, 1, 'Live'),
(17, 14, 1.00, 13, 13, 0, 23, 1, 1, 'Live'),
(18, 2, 1.00, 14, 14, 0, 1, 1, 1, 'Live'),
(19, 15, 1.00, 14, 14, 0, 24, 1, 1, 'Live'),
(20, 18, 1.00, 14, 14, 0, 26, 1, 1, 'Live'),
(21, 18, 1.00, 14, 14, 0, 26, 1, 1, 'Live'),
(22, 2, 1.00, 15, 15, 0, 1, 1, 1, 'Live'),
(23, 2, 1.00, 16, 16, 0, 1, 1, 1, 'Live'),
(24, 4, 1.00, 16, 16, 0, 9, 1, 1, 'Live'),
(25, 3, 0.50, 16, 16, 0, 7, 1, 1, 'Live'),
(26, 2, 0.50, 17, 17, 0, 2, 1, 1, 'Live'),
(27, 15, 1.00, 17, 17, 0, 24, 1, 1, 'Live'),
(28, 18, 1.00, 17, 17, 0, 26, 1, 1, 'Live'),
(29, 18, 1.00, 17, 17, 0, 26, 1, 1, 'Live'),
(30, 18, 1.00, 17, 17, 0, 26, 1, 1, 'Live'),
(31, 18, 1.00, 17, 17, 0, 26, 1, 1, 'Live'),
(32, 18, 1.00, 18, 18, 0, 26, 1, 1, 'Live'),
(33, 2, 1.00, 18, 18, 0, 1, 1, 1, 'Live'),
(34, 2, 0.50, 18, 18, 0, 2, 1, 1, 'Live'),
(35, 2, 1.00, 18, 18, 0, 1, 1, 1, 'Live'),
(36, 2, 0.50, 19, 19, 0, 2, 1, 1, 'Live'),
(37, 2, 0.50, 19, 19, 0, 2, 1, 1, 'Live'),
(38, 2, 0.50, 19, 19, 0, 2, 1, 1, 'Live'),
(39, 2, 1.00, 19, 19, 0, 1, 1, 1, 'Live'),
(40, 13, 0.50, 19, 19, 0, 21, 1, 1, 'Live'),
(41, 15, 1.00, 19, 19, 0, 24, 1, 1, 'Live'),
(42, 2, 1.00, 20, 20, 0, 1, 1, 1, 'Live'),
(43, 17, 1.00, 20, 20, 0, 25, 1, 1, 'Live'),
(44, 2, 1.00, 21, 21, 0, 1, 1, 1, 'Live'),
(45, 15, 1.00, 21, 21, 0, 24, 1, 1, 'Live'),
(46, 2, 1.00, 22, 22, 0, 1, 1, 1, 'Live'),
(47, 2, 0.25, 22, 22, 0, 3, 1, 1, 'Live'),
(48, 3, 0.50, 23, 23, 0, 7, 1, 1, 'Live'),
(49, 7, 1.00, 23, 23, 0, 12, 1, 1, 'Live'),
(50, 2, 1.00, 24, 24, 0, 1, 1, 1, 'Live'),
(51, 16, 1.00, 24, 24, 0, 22, 1, 1, 'Live'),
(52, 18, 1.00, 24, 24, 0, 26, 1, 1, 'Live'),
(53, 18, 1.00, 24, 24, 0, 26, 1, 1, 'Live'),
(54, 18, 1.00, 24, 24, 0, 26, 1, 1, 'Live'),
(55, 18, 1.00, 24, 24, 0, 26, 1, 1, 'Live'),
(56, 18, 1.00, 24, 24, 0, 26, 1, 1, 'Live'),
(57, 2, 0.50, 25, 25, 0, 2, 1, 1, 'Live'),
(58, 14, 1.00, 25, 25, 0, 23, 1, 1, 'Live'),
(59, 3, 0.25, 25, 25, 0, 8, 1, 1, 'Live'),
(60, 2, 1.00, 26, 26, 0, 1, 1, 1, 'Live'),
(61, 18, 1.00, 26, 26, 0, 26, 1, 1, 'Live'),
(62, 7, 1.00, 27, 27, 0, 12, 1, 1, 'Live'),
(63, 7, 1.00, 27, 27, 0, 12, 1, 1, 'Live'),
(64, 7, 1.00, 27, 27, 0, 12, 1, 1, 'Live'),
(65, 17, 1.00, 28, 28, 0, 25, 1, 1, 'Live'),
(66, 13, 0.50, 28, 28, 0, 21, 1, 1, 'Live'),
(67, 2, 1.00, 29, 29, 0, 1, 1, 1, 'Live'),
(68, 18, 1.00, 29, 29, 0, 26, 1, 1, 'Live'),
(69, 2, 1.00, 30, 30, 0, 1, 1, 1, 'Live'),
(70, 15, 1.00, 30, 30, 0, 24, 1, 1, 'Live'),
(71, 2, 1.00, 31, 31, 0, 1, 1, 1, 'Live'),
(72, 2, 1.00, 31, 31, 0, 1, 1, 1, 'Live'),
(73, 2, 1.00, 32, 32, 0, 1, 1, 1, 'Live'),
(74, 2, 1.00, 32, 32, 0, 1, 1, 1, 'Live'),
(75, 2, 1.00, 33, 33, 0, 1, 1, 1, 'Live'),
(76, 2, 1.00, 33, 33, 0, 1, 1, 1, 'Live'),
(77, 2, 0.50, 34, 34, 0, 2, 1, 1, 'Live'),
(78, 2, 0.50, 34, 34, 0, 2, 1, 1, 'Live'),
(79, 18, 1.00, 34, 34, 0, 26, 1, 1, 'Live'),
(80, 18, 1.00, 34, 34, 0, 26, 1, 1, 'Live'),
(81, 18, 1.00, 34, 34, 0, 26, 1, 1, 'Live'),
(82, 18, 1.00, 34, 34, 0, 26, 1, 1, 'Live'),
(83, 18, 1.00, 34, 34, 0, 26, 1, 1, 'Live'),
(84, 2, 1.00, 35, 35, 0, 2, 1, 1, 'Live'),
(85, 18, 5.00, 35, 35, 0, 26, 1, 1, 'Live'),
(86, 2, 1.00, 36, 36, 0, 2, 1, 1, 'Live'),
(87, 18, 5.00, 36, 36, 0, 26, 1, 1, 'Live'),
(88, 13, 0.50, 36, 36, 0, 21, 1, 1, 'Live'),
(89, 7, 1.00, 37, 37, 0, 12, 1, 1, 'Live'),
(90, 2, 0.50, 38, 38, 0, 2, 1, 1, 'Live'),
(91, 3, 0.25, 38, 38, 0, 8, 1, 1, 'Live'),
(92, 2, 1.00, 39, 39, 0, 1, 1, 1, 'Live'),
(93, 2, 1.00, 40, 40, 0, 1, 1, 1, 'Live'),
(94, 18, 1.00, 40, 40, 0, 26, 1, 1, 'Live'),
(95, 18, 1.00, 40, 40, 0, 26, 1, 1, 'Live'),
(96, 2, 0.50, 40, 40, 0, 2, 1, 1, 'Live'),
(97, 2, 0.50, 40, 40, 0, 2, 1, 1, 'Live'),
(98, 4, 1.00, 41, 41, 0, 9, 1, 1, 'Live'),
(99, 18, 2.00, 41, 41, 0, 26, 1, 1, 'Live'),
(100, 4, 1.00, 41, 41, 0, 9, 1, 1, 'Live'),
(101, 5, 3.00, 42, 42, 0, 10, 1, 1, 'Live'),
(102, 17, 1.00, 42, 42, 0, 25, 1, 1, 'Live'),
(103, 17, 1.00, 42, 42, 0, 25, 1, 1, 'Live'),
(104, 18, 5.00, 42, 42, 0, 26, 1, 1, 'Live'),
(105, 2, 0.50, 43, 43, 0, 2, 1, 1, 'Live'),
(106, 2, 0.50, 43, 43, 0, 2, 1, 1, 'Live'),
(107, 18, 5.00, 43, 43, 0, 26, 1, 1, 'Live'),
(108, 18, 1.00, 44, 44, 0, 26, 1, 1, 'Live'),
(109, 18, 1.00, 45, 45, 0, 26, 1, 1, 'Live'),
(110, 3, 0.25, 46, 46, 0, 8, 1, 1, 'Live'),
(111, 2, 0.25, 46, 46, 0, 3, 1, 1, 'Live'),
(112, 12, 1.00, 46, 46, 0, 19, 1, 1, 'Live'),
(113, 15, 1.00, 46, 46, 0, 24, 1, 1, 'Live'),
(114, 10, 0.50, 46, 46, 0, 17, 1, 1, 'Live'),
(115, 2, 0.50, 47, 47, 0, 2, 1, 1, 'Live'),
(116, 3, 0.50, 47, 47, 0, 7, 1, 1, 'Live'),
(117, 14, 1.00, 47, 47, 0, 23, 1, 1, 'Live'),
(118, 18, 4.00, 47, 47, 0, 26, 1, 1, 'Live'),
(123, 18, 1.00, 49, 49, 0, 26, 1, 1, 'Live'),
(124, 18, 9.00, 50, 50, 0, 26, 1, 1, 'Live'),
(125, 14, 1.00, 50, 50, 0, 23, 1, 1, 'Live'),
(126, 9, 1.00, 50, 50, 0, 14, 1, 1, 'Live'),
(127, 2, 0.50, 51, 51, 0, 2, 1, 1, 'Live'),
(128, 2, 0.25, 51, 51, 0, 3, 1, 1, 'Live'),
(129, 2, 1.00, 51, 51, 0, 1, 1, 1, 'Live'),
(130, 2, 0.75, 51, 51, 0, 4, 1, 1, 'Live'),
(131, 2, 0.25, 52, 52, 0, 3, 1, 1, 'Live'),
(132, 3, 1.00, 52, 52, 0, 5, 1, 1, 'Live'),
(133, 18, 2.00, 52, 52, 0, 26, 1, 1, 'Live'),
(134, 8, 1.00, 52, 52, 0, 13, 1, 1, 'Live'),
(135, 12, 1.00, 52, 52, 0, 19, 1, 1, 'Live'),
(136, 3, 2.00, 53, 53, 0, 5, 1, 1, 'Live'),
(137, 2, 2.00, 53, 53, 0, 1, 1, 1, 'Live'),
(138, 18, 8.00, 54, 54, 0, 26, 1, 1, 'Live'),
(139, 3, 0.25, 54, 54, 0, 8, 1, 1, 'Live'),
(140, 16, 4.00, 55, 55, 0, 22, 1, 1, 'Live'),
(141, 10, 0.50, 56, 56, 0, 17, 1, 1, 'Live'),
(142, 2, 0.50, 56, 56, 0, 2, 1, 1, 'Live'),
(143, 18, 10.00, 56, 56, 0, 26, 1, 1, 'Live'),
(144, 5, 1.00, 56, 56, 0, 10, 1, 1, 'Live'),
(145, 9, 1.00, 56, 56, 0, 14, 1, 1, 'Live'),
(146, 11, 1.00, 56, 56, 0, 20, 1, 1, 'Live'),
(147, 5, 1.00, 57, 57, 0, 10, 1, 1, 'Live'),
(148, 5, 1.00, 57, 57, 0, 10, 1, 1, 'Live'),
(149, 11, 1.00, 57, 57, 0, 20, 1, 1, 'Live'),
(150, 16, 1.00, 57, 57, 0, 22, 1, 1, 'Live'),
(151, 16, 1.00, 57, 57, 0, 22, 1, 1, 'Live'),
(152, 7, 1.00, 58, 58, 0, 12, 1, 1, 'Live'),
(153, 7, 1.00, 58, 58, 0, 12, 1, 1, 'Live'),
(154, 7, 1.00, 58, 58, 0, 12, 1, 1, 'Live'),
(155, 2, 1.00, 59, 59, 0, 1, 1, 1, 'Live'),
(156, 17, 1.00, 60, 60, 0, 25, 1, 1, 'Live'),
(157, 17, 1.00, 60, 60, 0, 25, 1, 1, 'Live'),
(158, 17, 1.00, 60, 60, 0, 25, 1, 1, 'Live'),
(159, 17, 1.00, 60, 60, 0, 25, 1, 1, 'Live'),
(160, 12, 1.00, 60, 60, 0, 29, 1, 1, 'Live'),
(161, 6, 1.00, 60, 60, 0, 29, 1, 1, 'Live'),
(162, 9, 1.00, 60, 60, 0, 14, 1, 1, 'Live'),
(163, 9, 1.00, 60, 60, 0, 14, 1, 1, 'Live'),
(164, 5, 1.00, 60, 60, 0, 10, 1, 1, 'Live'),
(165, 18, 1.00, 60, 60, 0, 26, 1, 1, 'Live'),
(166, 18, 1.00, 60, 60, 0, 26, 1, 1, 'Live'),
(167, 18, 1.00, 60, 60, 0, 26, 1, 1, 'Live'),
(168, 18, 1.00, 60, 60, 0, 26, 1, 1, 'Live'),
(169, 18, 1.00, 60, 60, 0, 26, 1, 1, 'Live'),
(170, 5, 1.00, 61, 61, 0, 10, 1, 1, 'Live'),
(171, 5, 1.00, 61, 61, 0, 10, 1, 1, 'Live'),
(172, 5, 1.00, 61, 61, 0, 10, 1, 1, 'Live'),
(173, 11, 1.00, 61, 61, 0, 20, 1, 1, 'Live'),
(174, 11, 1.00, 61, 61, 0, 20, 1, 1, 'Live'),
(175, 11, 1.00, 61, 61, 0, 20, 1, 1, 'Live'),
(176, 11, 1.00, 61, 61, 0, 20, 1, 1, 'Live'),
(177, 2, 1.00, 61, 61, 0, 1, 1, 1, 'Live'),
(178, 18, 12.00, 61, 61, 0, 26, 1, 1, 'Live'),
(179, 18, 1.00, 61, 61, 0, 26, 1, 1, 'Live'),
(180, 18, 1.00, 61, 61, 0, 26, 1, 1, 'Live'),
(181, 18, 1.00, 61, 61, 0, 26, 1, 1, 'Live'),
(182, 13, 0.50, 61, 61, 0, 21, 1, 1, 'Live'),
(183, 3, 0.50, 62, 62, 0, 7, 1, 1, 'Live'),
(184, 18, 1.00, 62, 62, 0, 26, 1, 1, 'Live'),
(185, 18, 1.00, 62, 62, 0, 26, 1, 1, 'Live'),
(186, 18, 1.00, 62, 62, 0, 26, 1, 1, 'Live'),
(187, 18, 1.00, 62, 62, 0, 26, 1, 1, 'Live'),
(188, 18, 1.00, 62, 62, 0, 26, 1, 1, 'Live'),
(189, 13, 0.50, 63, 63, 0, 21, 1, 1, 'Live'),
(190, 2, 0.50, 64, 64, 0, 2, 1, 1, 'Live'),
(191, 2, 0.50, 65, 65, 0, 2, 1, 1, 'Live'),
(192, 3, 0.50, 65, 65, 0, 7, 1, 1, 'Live'),
(193, 2, 1.00, 66, 66, 0, 1, 1, 1, 'Live'),
(194, 3, 1.00, 66, 66, 0, 5, 1, 1, 'Live'),
(195, 3, 1.00, 66, 66, 0, 5, 1, 1, 'Live'),
(196, 2, 0.50, 66, 66, 0, 2, 1, 1, 'Live'),
(197, 18, 20.00, 66, 66, 0, 26, 1, 1, 'Live'),
(198, 15, 1.00, 66, 66, 0, 24, 1, 1, 'Live'),
(199, 15, 1.00, 66, 66, 0, 24, 1, 1, 'Live'),
(200, 5, 1.00, 67, 67, 0, 10, 1, 1, 'Live'),
(201, 18, 1.00, 67, 67, 0, 26, 1, 1, 'Live'),
(202, 16, 1.00, 67, 67, 0, 22, 1, 1, 'Live'),
(203, 2, 1.00, 68, 68, 0, 1, 1, 1, 'Live'),
(204, 9, 1.00, 68, 68, 0, 14, 1, 1, 'Live'),
(205, 17, 1.00, 69, 69, 0, 25, 1, 1, 'Live'),
(206, 2, 1.00, 70, 70, 0, 1, 1, 1, 'Live'),
(207, 3, 1.00, 70, 70, 0, 5, 1, 1, 'Live'),
(208, 3, 0.50, 70, 70, 0, 7, 1, 1, 'Live'),
(209, 2, 0.50, 70, 70, 0, 2, 1, 1, 'Live'),
(210, 12, 1.00, 71, 71, 0, 29, 1, 1, 'Live'),
(211, 6, 1.00, 71, 71, 0, 29, 1, 1, 'Live'),
(212, 12, 1.00, 71, 71, 0, 29, 1, 1, 'Live'),
(213, 6, 1.00, 71, 71, 0, 29, 1, 1, 'Live'),
(214, 17, 1.00, 71, 71, 0, 25, 1, 1, 'Live'),
(215, 17, 1.00, 71, 71, 0, 25, 1, 1, 'Live'),
(216, 2, 1.00, 72, 72, 0, 1, 1, 1, 'Live'),
(217, 3, 0.50, 72, 72, 0, 7, 1, 1, 'Live'),
(218, 18, 10.00, 72, 72, 0, 26, 1, 1, 'Live'),
(219, 3, 0.50, 73, 73, 0, 7, 1, 1, 'Live'),
(220, 18, 1.00, 74, 74, 0, 26, 1, 1, 'Live'),
(221, 18, 1.00, 74, 74, 0, 26, 1, 1, 'Live'),
(222, 18, 1.00, 74, 74, 0, 26, 1, 1, 'Live'),
(223, 18, 1.00, 74, 74, 0, 26, 1, 1, 'Live'),
(224, 18, 1.00, 74, 74, 0, 26, 1, 1, 'Live'),
(225, 2, 0.50, 75, 75, 0, 2, 1, 1, 'Live'),
(226, 3, 1.00, 75, 75, 0, 5, 1, 1, 'Live'),
(227, 3, 0.25, 76, 76, 0, 8, 1, 1, 'Live'),
(228, 2, 1.00, 76, 76, 0, 1, 1, 1, 'Live'),
(229, 10, 0.75, 76, 76, 0, 16, 1, 1, 'Live'),
(230, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(231, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(232, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(233, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(234, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(235, 18, 1.00, 76, 76, 0, 26, 1, 1, 'Live'),
(236, 12, 1.00, 77, 77, 0, 28, 1, 1, 'Live'),
(237, 6, 1.00, 77, 77, 0, 28, 1, 1, 'Live'),
(238, 12, 1.00, 77, 77, 0, 28, 1, 1, 'Live'),
(239, 6, 1.00, 77, 77, 0, 28, 1, 1, 'Live'),
(240, 2, 0.50, 78, 78, 0, 2, 1, 1, 'Live'),
(241, 2, 1.00, 79, 79, 0, 1, 1, 1, 'Live'),
(242, 5, 1.00, 79, 79, 0, 10, 1, 1, 'Live'),
(243, 5, 1.00, 79, 79, 0, 10, 1, 1, 'Live'),
(244, 18, 1.00, 80, 80, 0, 26, 1, 1, 'Live'),
(245, 18, 1.00, 80, 80, 0, 26, 1, 1, 'Live'),
(246, 18, 1.00, 80, 80, 0, 26, 1, 1, 'Live'),
(247, 18, 1.00, 80, 80, 0, 26, 1, 1, 'Live'),
(248, 18, 1.00, 80, 80, 0, 26, 1, 1, 'Live'),
(249, 3, 0.50, 81, 81, 0, 7, 1, 1, 'Live'),
(250, 3, 0.50, 81, 81, 0, 7, 1, 1, 'Live'),
(251, 3, 0.50, 82, 82, 0, 7, 1, 1, 'Live'),
(252, 2, 0.50, 82, 82, 0, 2, 1, 1, 'Live'),
(253, 2, 0.50, 82, 82, 0, 2, 1, 1, 'Live'),
(254, 2, 0.75, 83, 83, 0, 4, 1, 1, 'Live'),
(255, 3, 0.50, 84, 84, 0, 7, 1, 1, 'Live'),
(256, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(257, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(258, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(259, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(260, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(261, 18, 1.00, 84, 84, 0, 26, 1, 1, 'Live'),
(262, 2, 1.00, 85, 85, 0, 1, 1, 1, 'Live'),
(263, 2, 1.00, 86, 86, 0, 1, 1, 1, 'Live'),
(264, 3, 0.50, 86, 86, 0, 7, 1, 1, 'Live'),
(265, 2, 0.50, 87, 87, 0, 2, 1, 1, 'Live'),
(266, 13, 0.50, 88, 88, 0, 21, 1, 1, 'Live'),
(267, 18, 11.00, 88, 88, 0, 26, 1, 1, 'Live'),
(268, 16, 1.00, 89, 89, 0, 22, 1, 1, 'Live'),
(269, 2, 1.00, 90, 90, 0, 1, 1, 1, 'Live'),
(270, 3, 1.00, 90, 90, 0, 5, 1, 1, 'Live'),
(271, 13, 0.50, 90, 90, 0, 21, 1, 1, 'Live'),
(272, 2, 0.50, 91, 91, 0, 2, 1, 1, 'Live'),
(273, 3, 0.50, 91, 91, 0, 7, 1, 1, 'Live'),
(274, 16, 1.00, 91, 91, 0, 22, 1, 1, 'Live'),
(275, 5, 1.00, 91, 91, 0, 10, 1, 1, 'Live'),
(276, 2, 0.50, 91, 91, 0, 2, 1, 1, 'Live'),
(277, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(278, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(279, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(280, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(281, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(282, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(283, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(284, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(285, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(286, 18, 1.00, 91, 91, 0, 26, 1, 1, 'Live'),
(287, 3, 0.50, 92, 92, 0, 7, 1, 1, 'Live'),
(288, 18, 1.00, 92, 92, 0, 26, 1, 1, 'Live'),
(289, 18, 1.00, 92, 92, 0, 26, 1, 1, 'Live'),
(290, 18, 1.00, 92, 92, 0, 26, 1, 1, 'Live'),
(291, 18, 1.00, 92, 92, 0, 26, 1, 1, 'Live'),
(292, 18, 1.00, 92, 92, 0, 26, 1, 1, 'Live'),
(293, 13, 0.50, 92, 92, 0, 21, 1, 1, 'Live'),
(294, 16, 1.00, 92, 92, 0, 22, 1, 1, 'Live'),
(295, 3, 0.50, 93, 93, 0, 7, 1, 1, 'Live'),
(296, 2, 0.50, 94, 94, 0, 2, 1, 1, 'Live'),
(297, 13, 0.50, 94, 94, 0, 21, 1, 1, 'Live'),
(298, 5, 1.00, 95, 95, 0, 10, 1, 1, 'Live'),
(299, 16, 1.00, 95, 95, 0, 22, 1, 1, 'Live'),
(300, 18, 1.00, 95, 95, 0, 26, 1, 1, 'Live'),
(301, 18, 1.00, 95, 95, 0, 26, 1, 1, 'Live'),
(302, 18, 1.00, 95, 95, 0, 26, 1, 1, 'Live'),
(303, 18, 1.00, 95, 95, 0, 26, 1, 1, 'Live'),
(304, 10, 0.25, 96, 96, 0, 18, 1, 1, 'Live'),
(305, 3, 1.00, 97, 97, 0, 5, 1, 1, 'Live'),
(306, 5, 1.00, 97, 97, 0, 10, 1, 1, 'Live'),
(307, 3, 0.50, 98, 98, 0, 6, 1, 1, 'Live'),
(308, 18, 1.00, 98, 98, 0, 26, 1, 1, 'Live'),
(309, 18, 1.00, 98, 98, 0, 26, 1, 1, 'Live'),
(310, 18, 1.00, 98, 98, 0, 26, 1, 1, 'Live'),
(311, 16, 1.00, 98, 98, 0, 22, 1, 1, 'Live'),
(312, 10, 0.25, 98, 98, 0, 18, 1, 1, 'Live'),
(313, 2, 0.50, 99, 99, 0, 2, 1, 1, 'Live'),
(314, 18, 1.00, 99, 99, 0, 26, 1, 1, 'Live'),
(315, 18, 1.00, 99, 99, 0, 26, 1, 1, 'Live'),
(316, 18, 1.00, 99, 99, 0, 26, 1, 1, 'Live'),
(317, 18, 1.00, 99, 99, 0, 26, 1, 1, 'Live'),
(318, 14, 1.00, 99, 99, 0, 23, 1, 1, 'Live'),
(319, 2, 1.00, 100, 100, 0, 1, 1, 1, 'Live'),
(320, 3, 1.00, 100, 100, 0, 5, 1, 1, 'Live'),
(321, 3, 1.00, 100, 100, 0, 5, 1, 1, 'Live'),
(322, 10, 0.50, 101, 101, 0, 17, 1, 1, 'Live'),
(323, 12, 1.00, 102, 102, 0, 28, 1, 1, 'Live'),
(324, 6, 1.00, 102, 102, 0, 28, 1, 1, 'Live'),
(325, 18, 1.00, 102, 102, 0, 26, 1, 1, 'Live'),
(326, 18, 1.00, 102, 102, 0, 26, 1, 1, 'Live'),
(327, 3, 1.00, 103, 103, 0, 5, 1, 1, 'Live'),
(328, 2, 0.50, 103, 103, 0, 2, 1, 1, 'Live'),
(329, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(330, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(331, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(332, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(333, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(334, 11, 1.00, 103, 103, 0, 20, 1, 1, 'Live'),
(335, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(336, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(337, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(338, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(339, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(340, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(341, 16, 1.00, 103, 103, 0, 22, 1, 1, 'Live'),
(342, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(343, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(344, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(345, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(346, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(347, 18, 1.00, 103, 103, 0, 26, 1, 1, 'Live'),
(348, 2, 0.75, 104, 104, 0, 4, 1, 1, 'Live'),
(349, 3, 0.25, 104, 104, 0, 8, 1, 1, 'Live'),
(350, 18, 1.00, 104, 104, 0, 26, 1, 1, 'Live'),
(351, 18, 1.00, 104, 104, 0, 26, 1, 1, 'Live'),
(352, 18, 1.00, 104, 104, 0, 26, 1, 1, 'Live'),
(353, 18, 1.00, 104, 104, 0, 26, 1, 1, 'Live'),
(354, 2, 1.00, 105, 105, 0, 1, 1, 1, 'Live'),
(355, 3, 1.00, 105, 105, 0, 5, 1, 1, 'Live'),
(356, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(357, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(358, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(359, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(360, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(361, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(362, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(363, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(364, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(365, 18, 1.00, 105, 105, 0, 26, 1, 1, 'Live'),
(366, 2, 1.00, 106, 106, 0, 1, 1, 1, 'Live'),
(367, 3, 1.00, 106, 106, 0, 5, 1, 1, 'Live'),
(368, 9, 1.00, 106, 106, 0, 14, 1, 1, 'Live'),
(369, 3, 1.00, 107, 107, 0, 5, 1, 1, 'Live'),
(370, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(371, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(372, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(373, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(374, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(375, 18, 1.00, 107, 107, 0, 26, 1, 1, 'Live'),
(376, 12, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(377, 6, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(378, 12, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(379, 6, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(380, 12, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(381, 6, 1.00, 108, 108, 0, 28, 1, 1, 'Live'),
(382, 18, 1.00, 108, 108, 0, 26, 1, 1, 'Live'),
(383, 18, 1.00, 108, 108, 0, 26, 1, 1, 'Live'),
(384, 18, 1.00, 108, 108, 0, 26, 1, 1, 'Live'),
(385, 17, 1.00, 108, 108, 0, 25, 1, 1, 'Live'),
(386, 17, 1.00, 108, 108, 0, 25, 1, 1, 'Live'),
(387, 17, 1.00, 108, 108, 0, 25, 1, 1, 'Live'),
(388, 2, 1.00, 109, 109, 0, 1, 1, 1, 'Live'),
(389, 3, 1.00, 109, 109, 0, 5, 1, 1, 'Live'),
(390, 3, 1.00, 109, 109, 0, 5, 1, 1, 'Live'),
(391, 3, 1.00, 109, 109, 0, 5, 1, 1, 'Live'),
(392, 15, 1.00, 109, 109, 0, 24, 1, 1, 'Live'),
(393, 15, 1.00, 109, 109, 0, 24, 1, 1, 'Live'),
(394, 13, 0.50, 109, 109, 0, 21, 1, 1, 'Live'),
(395, 3, 0.50, 110, 110, 0, 7, 1, 1, 'Live'),
(396, 2, 1.00, 110, 110, 0, 1, 1, 1, 'Live'),
(397, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(398, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(399, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(400, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(401, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(402, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(403, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(404, 18, 1.00, 110, 110, 0, 26, 1, 1, 'Live'),
(405, 3, 0.50, 111, 111, 0, 7, 1, 1, 'Live'),
(406, 10, 0.50, 112, 112, 0, 17, 1, 1, 'Live'),
(407, 3, 0.50, 113, 113, 0, 6, 1, 1, 'Live'),
(408, 2, 0.25, 114, 114, 0, 3, 1, 1, 'Live'),
(409, 12, 1.00, 115, 115, 0, 29, 1, 1, 'Live'),
(410, 6, 1.00, 115, 115, 0, 29, 1, 1, 'Live'),
(411, 18, 1.00, 115, 115, 0, 26, 1, 1, 'Live'),
(412, 18, 1.00, 115, 115, 0, 26, 1, 1, 'Live'),
(413, 18, 1.00, 115, 115, 0, 26, 1, 1, 'Live'),
(414, 18, 1.00, 115, 115, 0, 26, 1, 1, 'Live'),
(415, 13, 0.50, 116, 116, 0, 21, 1, 1, 'Live'),
(416, 18, 1.00, 116, 116, 0, 26, 1, 1, 'Live'),
(417, 18, 1.00, 116, 116, 0, 26, 1, 1, 'Live'),
(418, 2, 1.00, 117, 117, 0, 1, 1, 1, 'Live'),
(419, 2, 0.50, 118, 118, 0, 2, 1, 1, 'Live'),
(420, 3, 0.50, 118, 118, 0, 7, 1, 1, 'Live'),
(421, 2, 1.00, 119, 119, 0, 1, 1, 1, 'Live'),
(422, 3, 0.25, 119, 119, 0, 8, 1, 1, 'Live'),
(423, 6, 1.00, 120, 120, 0, 30, 1, 1, 'Live'),
(424, 12, 1.00, 120, 120, 0, 30, 1, 1, 'Live'),
(425, 2, 1.00, 121, 121, 0, 1, 1, 1, 'Live'),
(426, 2, 0.50, 121, 121, 0, 2, 1, 1, 'Live'),
(427, 2, 0.50, 121, 121, 0, 2, 1, 1, 'Live'),
(428, 2, 0.50, 122, 122, 0, 2, 1, 1, 'Live'),
(429, 2, 1.00, 123, 123, 0, 1, 1, 1, 'Live'),
(430, 3, 0.25, 123, 123, 0, 8, 1, 1, 'Live'),
(431, 18, 10.00, 123, 123, 0, 26, 1, 1, 'Live'),
(432, 6, 1.00, 124, 124, 0, 34, 1, 1, 'Live'),
(433, 12, 1.00, 124, 124, 0, 34, 1, 1, 'Live'),
(434, 17, 1.00, 124, 124, 0, 25, 1, 1, 'Live'),
(435, 6, 1.00, 125, 125, 0, 34, 1, 1, 'Live'),
(436, 12, 1.00, 125, 125, 0, 34, 1, 1, 'Live'),
(437, 17, 1.00, 125, 125, 0, 25, 1, 1, 'Live'),
(438, 2, 1.00, 126, 126, 0, 1, 1, 1, 'Live'),
(439, 3, 1.00, 126, 126, 0, 5, 1, 1, 'Live'),
(440, 6, 1.00, 127, 127, 0, 32, 1, 1, 'Live'),
(441, 12, 1.00, 127, 127, 0, 32, 1, 1, 'Live'),
(442, 18, 4.00, 127, 127, 0, 26, 1, 1, 'Live'),
(443, 17, 2.00, 127, 127, 0, 25, 1, 1, 'Live'),
(444, 12, 1.00, 128, 128, 0, 28, 1, 1, 'Live'),
(445, 6, 1.00, 128, 128, 0, 28, 1, 1, 'Live'),
(446, 12, 1.00, 128, 128, 0, 28, 1, 1, 'Live'),
(447, 6, 1.00, 128, 128, 0, 28, 1, 1, 'Live'),
(448, 16, 1.00, 128, 128, 0, 22, 1, 1, 'Live'),
(449, 18, 1.00, 128, 128, 0, 26, 1, 1, 'Live'),
(450, 18, 1.00, 128, 128, 0, 26, 1, 1, 'Live'),
(451, 3, 0.50, 129, 129, 0, 6, 1, 1, 'Live'),
(452, 2, 0.25, 129, 129, 0, 3, 1, 1, 'Live'),
(453, 2, 0.50, 130, 130, 0, 2, 1, 1, 'Live'),
(454, 10, 0.50, 130, 130, 0, 17, 1, 1, 'Live'),
(455, 2, 0.75, 131, 131, 0, 4, 1, 1, 'Live'),
(456, 10, 0.25, 131, 131, 0, 18, 1, 1, 'Live'),
(457, 18, 1.00, 131, 131, 0, 26, 1, 1, 'Live'),
(458, 18, 1.00, 131, 131, 0, 26, 1, 1, 'Live'),
(459, 16, 1.00, 131, 131, 0, 22, 1, 1, 'Live'),
(460, 16, 1.00, 131, 131, 0, 22, 1, 1, 'Live'),
(461, 3, 0.50, 132, 132, 0, 7, 1, 1, 'Live'),
(462, 18, 1.00, 132, 132, 0, 26, 1, 1, 'Live'),
(463, 18, 1.00, 132, 132, 0, 26, 1, 1, 'Live'),
(464, 18, 1.00, 132, 132, 0, 26, 1, 1, 'Live'),
(465, 18, 1.00, 132, 132, 0, 26, 1, 1, 'Live'),
(466, 18, 1.00, 132, 132, 0, 26, 1, 1, 'Live'),
(467, 6, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(468, 12, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(469, 6, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(470, 12, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(471, 6, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(472, 12, 1.00, 133, 133, 0, 34, 1, 1, 'Live'),
(473, 17, 3.00, 133, 133, 0, 25, 1, 1, 'Live'),
(474, 18, 5.00, 133, 133, 0, 26, 1, 1, 'Live'),
(475, 6, 1.00, 134, 134, 0, 32, 1, 1, 'Live'),
(476, 12, 1.00, 134, 134, 0, 32, 1, 1, 'Live'),
(477, 12, 4.00, 135, 135, 0, 28, 1, 1, 'Live'),
(478, 6, 4.00, 135, 135, 0, 28, 1, 1, 'Live'),
(479, 3, 0.25, 135, 135, 0, 8, 1, 1, 'Live'),
(480, 17, 4.00, 135, 135, 0, 25, 1, 1, 'Live'),
(481, 16, 1.00, 135, 135, 0, 22, 1, 1, 'Live'),
(482, 18, 8.00, 135, 135, 0, 26, 1, 1, 'Live'),
(483, 3, 0.50, 136, 136, 0, 7, 1, 1, 'Live'),
(484, 3, 0.50, 136, 136, 0, 7, 1, 1, 'Live'),
(485, 16, 2.00, 136, 136, 0, 22, 1, 1, 'Live'),
(486, 18, 4.00, 136, 136, 0, 26, 1, 1, 'Live'),
(487, 5, 2.00, 137, 137, 0, 10, 1, 1, 'Live'),
(488, 17, 2.00, 137, 137, 0, 25, 1, 1, 'Live'),
(489, 18, 4.00, 137, 137, 0, 26, 1, 1, 'Live'),
(490, 2, 1.00, 138, 138, 0, 1, 1, 1, 'Live'),
(491, 2, 1.00, 139, 139, 0, 1, 1, 1, 'Live'),
(492, 3, 1.00, 139, 139, 0, 5, 1, 1, 'Live'),
(493, 17, 6.00, 139, 139, 0, 25, 1, 1, 'Live'),
(494, 18, 8.00, 139, 139, 0, 26, 1, 1, 'Live'),
(495, 2, 1.50, 140, 140, 0, 2, 1, 1, 'Live'),
(496, 3, 0.25, 140, 140, 0, 8, 1, 1, 'Live'),
(497, 10, 0.50, 140, 140, 0, 18, 1, 1, 'Live'),
(498, 9, 1.00, 140, 140, 0, 14, 1, 1, 'Live'),
(499, 5, 2.00, 140, 140, 0, 10, 1, 1, 'Live'),
(500, 18, 5.00, 140, 140, 0, 26, 1, 1, 'Live'),
(501, 8, 1.00, 140, 140, 0, 13, 1, 1, 'Live'),
(502, 13, 0.50, 140, 140, 0, 21, 1, 1, 'Live'),
(503, 12, 1.00, 140, 140, 0, 19, 1, 1, 'Live'),
(504, 12, 1.00, 140, 140, 0, 28, 1, 1, 'Live'),
(505, 6, 1.00, 140, 140, 0, 28, 1, 1, 'Live'),
(506, 12, 1.00, 140, 140, 0, 27, 1, 1, 'Live'),
(507, 6, 1.00, 140, 140, 0, 27, 1, 1, 'Live'),
(508, 6, 1.00, 140, 140, 0, 32, 1, 1, 'Live'),
(509, 12, 1.00, 140, 140, 0, 32, 1, 1, 'Live'),
(510, 2, 0.50, 141, 141, 0, 2, 1, 1, 'Live'),
(511, 3, 0.50, 141, 141, 0, 7, 1, 1, 'Live'),
(512, 2, 1.00, 142, 142, 0, 1, 1, 1, 'Live'),
(513, 18, 10.00, 142, 142, 0, 26, 1, 1, 'Live'),
(514, 2, 0.25, 143, 143, 0, 3, 1, 1, 'Live'),
(515, 18, 1.00, 143, 143, 0, 26, 1, 1, 'Live'),
(516, 2, 1.00, 144, 144, 0, 1, 1, 1, 'Live'),
(517, 3, 0.25, 144, 144, 0, 8, 1, 1, 'Live'),
(518, 18, 5.00, 144, 144, 0, 26, 1, 1, 'Live'),
(519, 14, 1.00, 144, 144, 0, 23, 1, 1, 'Live'),
(520, 3, 1.00, 145, 145, 0, 5, 1, 1, 'Live'),
(521, 15, 1.00, 145, 145, 0, 24, 1, 1, 'Live'),
(522, 2, 0.50, 146, 146, 0, 2, 1, 1, 'Live'),
(523, 3, 0.50, 147, 147, 0, 7, 1, 1, 'Live'),
(524, 3, 0.50, 148, 148, 0, 7, 1, 1, 'Live'),
(525, 2, 0.50, 148, 148, 0, 2, 1, 1, 'Live'),
(526, 10, 0.25, 149, 149, 0, 18, 1, 1, 'Live'),
(527, 5, 1.00, 149, 149, 0, 10, 1, 1, 'Live'),
(528, 5, 1.00, 149, 149, 0, 10, 1, 1, 'Live'),
(529, 18, 1.00, 149, 149, 0, 26, 1, 1, 'Live'),
(530, 18, 1.00, 149, 149, 0, 26, 1, 1, 'Live'),
(531, 18, 1.00, 149, 149, 0, 26, 1, 1, 'Live'),
(532, 17, 1.00, 149, 149, 0, 25, 1, 1, 'Live'),
(533, 17, 1.00, 149, 149, 0, 25, 1, 1, 'Live'),
(534, 13, 0.50, 149, 149, 0, 21, 1, 1, 'Live'),
(535, 3, 0.50, 150, 150, 0, 7, 1, 1, 'Live'),
(536, 5, 1.00, 150, 150, 0, 10, 1, 1, 'Live'),
(537, 18, 1.00, 150, 150, 0, 26, 1, 1, 'Live'),
(538, 18, 1.00, 150, 150, 0, 26, 1, 1, 'Live'),
(539, 18, 1.00, 150, 150, 0, 26, 1, 1, 'Live'),
(540, 17, 1.00, 150, 150, 0, 25, 1, 1, 'Live'),
(541, 17, 1.00, 150, 150, 0, 25, 1, 1, 'Live'),
(542, 3, 1.00, 151, 151, 0, 5, 1, 1, 'Live'),
(543, 13, 0.50, 151, 151, 0, 21, 1, 1, 'Live'),
(544, 18, 8.00, 151, 151, 0, 26, 1, 1, 'Live'),
(545, 15, 1.00, 151, 151, 0, 24, 1, 1, 'Live'),
(546, 3, 1.00, 152, 152, 0, 5, 1, 1, 'Live'),
(547, 18, 3.00, 152, 152, 0, 26, 1, 1, 'Live'),
(548, 16, 1.00, 152, 152, 0, 22, 1, 1, 'Live'),
(549, 9, 1.00, 153, 153, 0, 14, 1, 1, 'Live'),
(550, 16, 2.00, 153, 153, 0, 22, 1, 1, 'Live'),
(551, 3, 0.25, 153, 153, 0, 8, 1, 1, 'Live'),
(552, 3, 0.50, 154, 154, 0, 7, 1, 1, 'Live'),
(553, 18, 5.00, 154, 154, 0, 26, 1, 1, 'Live'),
(554, 16, 4.00, 155, 155, 0, 22, 1, 1, 'Live'),
(555, 5, 1.00, 156, 156, 0, 10, 1, 1, 'Live'),
(556, 9, 1.00, 156, 156, 0, 14, 1, 1, 'Live'),
(557, 18, 5.00, 156, 156, 0, 26, 1, 1, 'Live'),
(558, 17, 2.00, 156, 156, 0, 25, 1, 1, 'Live'),
(559, 5, 1.00, 157, 157, 0, 10, 1, 1, 'Live'),
(560, 9, 1.00, 157, 157, 0, 14, 1, 1, 'Live'),
(561, 17, 2.00, 157, 157, 0, 25, 1, 1, 'Live'),
(562, 18, 5.00, 157, 157, 0, 26, 1, 1, 'Live'),
(563, 5, 3.00, 158, 158, 0, 10, 1, 1, 'Live'),
(564, 3, 0.50, 159, 159, 0, 7, 1, 1, 'Live'),
(565, 2, 0.50, 159, 159, 0, 2, 1, 1, 'Live'),
(566, 14, 1.00, 159, 159, 0, 23, 1, 1, 'Live'),
(567, 18, 5.00, 159, 159, 0, 26, 1, 1, 'Live'),
(568, 6, 1.00, 160, 160, 0, 30, 1, 1, 'Live'),
(569, 12, 1.00, 160, 160, 0, 30, 1, 1, 'Live'),
(570, 14, 1.00, 160, 160, 0, 23, 1, 1, 'Live'),
(571, 5, 2.00, 161, 161, 0, 10, 1, 1, 'Live'),
(572, 6, 1.00, 161, 161, 0, 32, 1, 1, 'Live'),
(573, 12, 1.00, 161, 161, 0, 32, 1, 1, 'Live'),
(574, 18, 4.00, 161, 161, 0, 26, 1, 1, 'Live'),
(575, 2, 1.00, 162, 162, 0, 1, 1, 1, 'Live'),
(576, 2, 3.00, 163, 163, 0, 1, 1, 1, 'Live'),
(577, 4, 2.00, 163, 163, 0, 9, 1, 1, 'Live'),
(578, 2, 0.50, 164, 164, 0, 2, 1, 1, 'Live'),
(579, 2, 3.00, 165, 165, 0, 1, 1, 1, 'Live'),
(580, 3, 0.50, 165, 165, 0, 7, 1, 1, 'Live'),
(581, 10, 0.50, 165, 165, 0, 17, 1, 1, 'Live'),
(582, 18, 25.00, 165, 165, 0, 26, 1, 1, 'Live'),
(583, 12, 14.00, 165, 165, 0, 19, 1, 1, 'Live'),
(584, 5, 3.00, 166, 166, 0, 10, 1, 1, 'Live'),
(585, 2, 0.50, 167, 167, 0, 3, 1, 1, 'Live'),
(586, 18, 4.00, 167, 167, 0, 26, 1, 1, 'Live'),
(587, 5, 3.00, 168, 168, 0, 10, 1, 1, 'Live'),
(588, 11, 3.00, 168, 168, 0, 20, 1, 1, 'Live'),
(589, 2, 0.50, 168, 168, 0, 2, 1, 1, 'Live'),
(590, 3, 1.00, 169, 169, 0, 5, 1, 1, 'Live'),
(591, 2, 0.50, 169, 169, 0, 2, 1, 1, 'Live'),
(592, 14, 1.00, 169, 169, 0, 23, 1, 1, 'Live'),
(593, 15, 1.00, 169, 169, 0, 24, 1, 1, 'Live'),
(594, 10, 0.50, 169, 169, 0, 17, 1, 1, 'Live'),
(595, 18, 20.00, 170, 170, 0, 26, 1, 1, 'Live'),
(596, 10, 0.50, 171, 171, 0, 17, 1, 1, 'Live'),
(597, 2, 0.50, 171, 171, 0, 2, 1, 1, 'Live'),
(598, 2, 2.00, 172, 172, 0, 1, 1, 1, 'Live'),
(599, 3, 1.00, 172, 172, 0, 5, 1, 1, 'Live'),
(600, 13, 0.50, 173, 173, 0, 21, 1, 1, 'Live'),
(601, 2, 0.50, 174, 174, 0, 2, 1, 1, 'Live'),
(602, 11, 1.00, 175, 175, 0, 20, 1, 1, 'Live'),
(603, 9, 1.00, 175, 175, 0, 14, 1, 1, 'Live'),
(604, 13, 0.50, 175, 175, 0, 21, 1, 1, 'Live'),
(605, 16, 2.00, 175, 175, 0, 22, 1, 1, 'Live'),
(606, 18, 1.00, 175, 175, 0, 26, 1, 1, 'Live'),
(607, 6, 1.00, 176, 176, 0, 34, 1, 1, 'Live'),
(608, 12, 1.00, 176, 176, 0, 34, 1, 1, 'Live'),
(609, 14, 1.00, 176, 176, 0, 23, 1, 1, 'Live'),
(610, 18, 3.00, 176, 176, 0, 26, 1, 1, 'Live'),
(611, 2, 0.50, 177, 177, 0, 2, 1, 1, 'Live'),
(612, 3, 1.00, 178, 178, 0, 5, 1, 1, 'Live'),
(613, 18, 8.00, 178, 178, 0, 26, 1, 1, 'Live'),
(614, 15, 1.00, 178, 178, 0, 24, 1, 1, 'Live'),
(615, 10, 0.50, 178, 178, 0, 17, 1, 1, 'Live'),
(616, 11, 1.00, 178, 178, 0, 20, 1, 1, 'Live'),
(617, 18, 3.00, 179, 179, 0, 26, 1, 1, 'Live'),
(618, 3, 1.00, 180, 180, 0, 5, 1, 1, 'Live'),
(619, 2, 0.50, 180, 180, 0, 2, 1, 1, 'Live'),
(620, 2, 0.50, 181, 181, 0, 2, 1, 1, 'Live'),
(621, 2, 0.50, 182, 182, 0, 2, 1, 1, 'Live'),
(622, 3, 0.50, 182, 182, 0, 7, 1, 1, 'Live'),
(623, 9, 2.00, 183, 183, 0, 14, 1, 1, 'Live'),
(624, 13, 1.00, 184, 184, 0, 21, 1, 1, 'Live'),
(625, 12, 1.00, 185, 185, 0, 28, 1, 1, 'Live'),
(626, 6, 1.00, 185, 185, 0, 28, 1, 1, 'Live'),
(627, 6, 1.00, 186, 186, 0, 31, 1, 1, 'Live'),
(628, 12, 1.00, 186, 186, 0, 31, 1, 1, 'Live'),
(629, 15, 1.00, 187, 187, 0, 24, 1, 1, 'Live'),
(630, 9, 1.00, 188, 188, 0, 14, 1, 1, 'Live'),
(631, 2, 0.25, 188, 188, 0, 3, 1, 1, 'Live'),
(632, 18, 1.00, 188, 188, 0, 26, 1, 1, 'Live'),
(633, 17, 2.00, 188, 188, 0, 25, 1, 1, 'Live'),
(634, 6, 1.00, 189, 189, 0, 32, 1, 1, 'Live'),
(635, 12, 1.00, 189, 189, 0, 32, 1, 1, 'Live'),
(636, 10, 0.50, 189, 189, 0, 17, 1, 1, 'Live'),
(637, 18, 7.00, 189, 189, 0, 26, 1, 1, 'Live'),
(638, 6, 4.00, 190, 190, 0, 34, 1, 1, 'Live'),
(639, 12, 4.00, 190, 190, 0, 34, 1, 1, 'Live'),
(640, 18, 6.00, 190, 190, 0, 26, 1, 1, 'Live'),
(641, 17, 4.00, 190, 190, 0, 25, 1, 1, 'Live'),
(642, 3, 0.50, 191, 191, 0, 7, 1, 1, 'Live'),
(643, 2, 0.50, 192, 192, 0, 2, 1, 1, 'Live'),
(644, 3, 0.50, 192, 192, 0, 7, 1, 1, 'Live'),
(645, 16, 2.00, 193, 193, 0, 22, 1, 1, 'Live'),
(646, 3, 0.50, 194, 194, 0, 7, 1, 1, 'Live'),
(647, 12, 1.00, 194, 194, 0, 19, 1, 1, 'Live'),
(648, 2, 0.50, 195, 195, 0, 2, 1, 1, 'Live'),
(649, 18, 5.00, 195, 195, 0, 26, 1, 1, 'Live'),
(650, 13, 1.00, 196, 196, 0, 21, 1, 1, 'Live'),
(651, 9, 1.00, 196, 196, 0, 14, 1, 1, 'Live'),
(652, 2, 0.50, 197, 197, 0, 2, 1, 1, 'Live'),
(653, 10, 0.50, 197, 197, 0, 17, 1, 1, 'Live'),
(654, 3, 1.00, 197, 197, 0, 5, 1, 1, 'Live'),
(655, 18, 10.00, 197, 197, 0, 26, 1, 1, 'Live'),
(656, 8, 1.00, 197, 197, 0, 13, 1, 1, 'Live'),
(657, 15, 1.00, 197, 197, 0, 24, 1, 1, 'Live'),
(658, 3, 1.00, 198, 198, 0, 5, 1, 1, 'Live'),
(659, 18, 15.00, 198, 198, 0, 26, 1, 1, 'Live'),
(660, 6, 1.00, 199, 199, 0, 34, 1, 1, 'Live'),
(661, 12, 1.00, 199, 199, 0, 34, 1, 1, 'Live'),
(662, 3, 1.00, 200, 200, 0, 5, 1, 1, 'Live'),
(663, 2, 0.50, 200, 200, 0, 2, 1, 1, 'Live'),
(664, 12, 1.00, 201, 201, 0, 27, 1, 1, 'Live'),
(665, 6, 1.00, 201, 201, 0, 27, 1, 1, 'Live'),
(666, 12, 1.00, 201, 201, 0, 28, 1, 1, 'Live'),
(667, 6, 1.00, 201, 201, 0, 28, 1, 1, 'Live'),
(668, 4, 1.00, 201, 201, 0, 9, 1, 1, 'Live'),
(669, 16, 1.00, 201, 201, 0, 22, 1, 1, 'Live'),
(670, 18, 4.00, 201, 201, 0, 26, 1, 1, 'Live'),
(671, 3, 1.00, 201, 201, 0, 5, 1, 1, 'Live'),
(672, 2, 1.00, 202, 202, 0, 1, 1, 1, 'Live'),
(673, 2, 0.50, 203, 203, 0, 2, 1, 1, 'Live'),
(674, 2, 0.25, 204, 204, 0, 3, 1, 1, 'Live'),
(675, 6, 1.00, 205, 205, 0, 34, 1, 1, 'Live'),
(676, 12, 1.00, 205, 205, 0, 34, 1, 1, 'Live'),
(677, 16, 1.00, 205, 205, 0, 22, 1, 1, 'Live'),
(678, 18, 1.00, 205, 205, 0, 26, 1, 1, 'Live'),
(679, 3, 0.25, 206, 206, 0, 8, 1, 1, 'Live'),
(680, 3, 0.50, 207, 207, 0, 7, 1, 1, 'Live'),
(681, 2, 0.50, 207, 207, 0, 2, 1, 1, 'Live'),
(682, 2, 1.00, 208, 208, 0, 1, 1, 1, 'Live'),
(683, 18, 2.00, 208, 208, 0, 26, 1, 1, 'Live'),
(684, 2, 0.50, 209, 209, 0, 2, 1, 1, 'Live'),
(685, 3, 0.50, 209, 209, 0, 7, 1, 1, 'Live'),
(686, 18, 4.00, 209, 209, 0, 26, 1, 1, 'Live'),
(687, 10, 0.50, 210, 210, 0, 17, 1, 1, 'Live'),
(688, 2, 1.00, 210, 210, 0, 1, 1, 1, 'Live'),
(689, 3, 0.50, 210, 210, 0, 7, 1, 1, 'Live'),
(690, 3, 1.00, 210, 210, 0, 5, 1, 1, 'Live'),
(691, 18, 2.00, 210, 210, 0, 26, 1, 1, 'Live'),
(692, 11, 2.00, 210, 210, 0, 20, 1, 1, 'Live'),
(693, 3, 0.50, 211, 211, 0, 7, 1, 1, 'Live'),
(694, 3, 1.00, 211, 211, 0, 5, 1, 1, 'Live'),
(695, 2, 0.50, 211, 211, 0, 2, 1, 1, 'Live'),
(696, 18, 10.00, 211, 211, 0, 26, 1, 1, 'Live'),
(697, 15, 1.00, 211, 211, 0, 24, 1, 1, 'Live'),
(698, 2, 1.00, 212, 212, 0, 1, 1, 1, 'Live'),
(699, 5, 2.00, 213, 213, 0, 10, 1, 1, 'Live'),
(700, 3, 0.50, 213, 213, 0, 7, 1, 1, 'Live'),
(701, 2, 0.50, 214, 214, 0, 2, 1, 1, 'Live'),
(702, 3, 0.50, 214, 214, 0, 7, 1, 1, 'Live'),
(703, 10, 0.25, 214, 214, 0, 18, 1, 1, 'Live'),
(704, 18, 2.00, 214, 214, 0, 26, 1, 1, 'Live'),
(705, 18, 1.00, 215, 215, 0, 26, 1, 1, 'Live'),
(706, 18, 1.00, 215, 215, 0, 26, 1, 1, 'Live'),
(707, 18, 1.00, 215, 215, 0, 26, 1, 1, 'Live'),
(708, 2, 0.25, 216, 216, 0, 3, 1, 1, 'Live'),
(709, 3, 0.50, 216, 216, 0, 6, 1, 1, 'Live'),
(710, 18, 4.00, 216, 216, 0, 26, 1, 1, 'Live'),
(711, 17, 2.00, 216, 216, 0, 25, 1, 1, 'Live'),
(712, 2, 1.00, 217, 217, 0, 1, 1, 1, 'Live'),
(713, 18, 3.00, 217, 217, 0, 26, 1, 1, 'Live'),
(714, 2, 1.00, 218, 218, 0, 1, 1, 1, 'Live'),
(715, 2, 0.50, 218, 218, 0, 2, 1, 1, 'Live'),
(716, 18, 20.00, 218, 218, 0, 26, 1, 1, 'Live'),
(717, 10, 0.50, 219, 219, 0, 17, 1, 1, 'Live'),
(718, 2, 0.50, 219, 219, 0, 2, 1, 1, 'Live'),
(719, 3, 1.00, 219, 219, 0, 5, 1, 1, 'Live'),
(720, 3, 0.50, 220, 220, 0, 7, 1, 1, 'Live'),
(721, 6, 1.00, 221, 221, 0, 34, 1, 1, 'Live'),
(722, 12, 1.00, 221, 221, 0, 34, 1, 1, 'Live'),
(723, 18, 2.00, 221, 221, 0, 26, 1, 1, 'Live'),
(724, 18, 2.00, 222, 222, 0, 26, 1, 1, 'Live'),
(725, 16, 1.00, 222, 222, 0, 22, 1, 1, 'Live'),
(726, 2, 1.00, 223, 223, 0, 1, 1, 1, 'Live'),
(727, 2, 1.00, 223, 223, 0, 1, 1, 1, 'Live'),
(728, 2, 0.50, 224, 224, 0, 2, 1, 1, 'Live'),
(729, 3, 1.00, 225, 225, 0, 5, 1, 1, 'Live'),
(730, 2, 0.50, 225, 225, 0, 2, 1, 1, 'Live'),
(731, 6, 1.00, 226, 226, 0, 32, 1, 1, 'Live'),
(732, 12, 1.00, 226, 226, 0, 32, 1, 1, 'Live'),
(733, 18, 4.00, 226, 226, 0, 26, 1, 1, 'Live'),
(734, 2, 0.50, 227, 227, 0, 2, 1, 1, 'Live'),
(735, 2, 0.50, 227, 227, 0, 2, 1, 1, 'Live'),
(736, 3, 0.50, 227, 227, 0, 7, 1, 1, 'Live'),
(737, 3, 0.50, 227, 227, 0, 7, 1, 1, 'Live'),
(738, 2, 0.50, 228, 228, 0, 2, 1, 1, 'Live'),
(739, 3, 0.50, 228, 228, 0, 7, 1, 1, 'Live'),
(740, 2, 0.50, 229, 229, 0, 2, 1, 1, 'Live'),
(741, 3, 0.50, 230, 230, 0, 7, 1, 1, 'Live'),
(742, 2, 0.50, 231, 231, 0, 2, 1, 1, 'Live'),
(743, 13, 0.50, 231, 231, 0, 21, 1, 1, 'Live'),
(744, 3, 0.50, 231, 231, 0, 7, 1, 1, 'Live'),
(745, 3, 0.50, 232, 232, 0, 6, 1, 1, 'Live'),
(746, 2, 0.25, 232, 232, 0, 3, 1, 1, 'Live'),
(747, 18, 10.00, 232, 232, 0, 26, 1, 1, 'Live'),
(748, 14, 1.00, 232, 232, 0, 23, 1, 1, 'Live'),
(749, 2, 0.50, 233, 233, 0, 2, 1, 1, 'Live'),
(750, 3, 0.50, 233, 233, 0, 7, 1, 1, 'Live'),
(751, 2, 0.50, 234, 234, 0, 2, 1, 1, 'Live'),
(752, 6, 1.00, 235, 235, 0, 32, 1, 1, 'Live'),
(753, 12, 1.00, 235, 235, 0, 32, 1, 1, 'Live'),
(754, 3, 0.50, 236, 236, 0, 7, 1, 1, 'Live'),
(755, 3, 1.00, 236, 236, 0, 5, 1, 1, 'Live'),
(756, 3, 1.00, 237, 237, 0, 5, 1, 1, 'Live'),
(757, 2, 0.50, 237, 237, 0, 2, 1, 1, 'Live'),
(758, 13, 0.50, 237, 237, 0, 21, 1, 1, 'Live'),
(759, 9, 1.00, 237, 237, 0, 14, 1, 1, 'Live'),
(760, 6, 1.00, 238, 238, 0, 32, 1, 1, 'Live'),
(761, 12, 1.00, 238, 238, 0, 32, 1, 1, 'Live'),
(762, 18, 10.00, 238, 238, 0, 26, 1, 1, 'Live'),
(763, 11, 1.00, 239, 239, 0, 20, 1, 1, 'Live'),
(764, 11, 1.00, 239, 239, 0, 20, 1, 1, 'Live'),
(765, 3, 3.00, 240, 240, 0, 5, 1, 1, 'Live'),
(766, 2, 1.00, 240, 240, 0, 1, 1, 1, 'Live'),
(767, 18, 25.00, 240, 240, 0, 26, 1, 1, 'Live'),
(768, 10, 0.50, 240, 240, 0, 17, 1, 1, 'Live'),
(769, 2, 0.75, 241, 241, 0, 4, 1, 1, 'Live'),
(770, 3, 0.25, 241, 241, 0, 8, 1, 1, 'Live'),
(771, 18, 5.00, 241, 241, 0, 26, 1, 1, 'Live'),
(772, 2, 1.00, 242, 242, 0, 1, 1, 1, 'Live'),
(773, 2, 0.50, 242, 242, 0, 2, 1, 1, 'Live'),
(774, 2, 1.00, 243, 243, 0, 1, 1, 1, 'Live'),
(775, 3, 0.50, 243, 243, 0, 7, 1, 1, 'Live'),
(776, 6, 1.00, 244, 244, 0, 32, 1, 1, 'Live'),
(777, 12, 1.00, 244, 244, 0, 32, 1, 1, 'Live'),
(778, 2, 0.50, 245, 245, 0, 2, 1, 1, 'Live'),
(779, 3, 0.50, 245, 245, 0, 7, 1, 1, 'Live'),
(780, 3, 0.50, 246, 246, 0, 7, 1, 1, 'Live'),
(781, 18, 8.00, 246, 246, 0, 26, 1, 1, 'Live'),
(782, 18, 3.00, 247, 247, 0, 26, 1, 1, 'Live'),
(783, 2, 0.50, 248, 248, 0, 2, 1, 1, 'Live'),
(784, 3, 1.00, 248, 248, 0, 5, 1, 1, 'Live'),
(785, 18, 5.00, 248, 248, 0, 26, 1, 1, 'Live'),
(786, 15, 1.00, 248, 248, 0, 24, 1, 1, 'Live'),
(787, 13, 1.00, 249, 249, 0, 21, 1, 1, 'Live'),
(788, 3, 1.00, 250, 250, 0, 5, 1, 1, 'Live'),
(789, 3, 0.50, 250, 250, 0, 7, 1, 1, 'Live'),
(790, 2, 1.00, 250, 250, 0, 1, 1, 1, 'Live'),
(791, 2, 0.50, 250, 250, 0, 2, 1, 1, 'Live'),
(792, 18, 10.00, 250, 250, 0, 26, 1, 1, 'Live'),
(793, 12, 1.00, 251, 251, 0, 28, 1, 1, 'Live'),
(794, 6, 1.00, 251, 251, 0, 28, 1, 1, 'Live'),
(795, 14, 1.00, 252, 252, 0, 23, 1, 1, 'Live'),
(796, 4, 1.00, 252, 252, 0, 9, 1, 1, 'Live'),
(797, 2, 0.75, 253, 253, 0, 4, 1, 1, 'Live'),
(798, 2, 0.50, 254, 254, 0, 2, 1, 1, 'Live'),
(799, 3, 0.50, 254, 254, 0, 7, 1, 1, 'Live'),
(800, 3, 0.50, 254, 254, 0, 7, 1, 1, 'Live'),
(801, 18, 10.00, 254, 254, 0, 26, 1, 1, 'Live'),
(802, 14, 1.00, 254, 254, 0, 23, 1, 1, 'Live'),
(803, 2, 0.50, 255, 255, 0, 2, 1, 1, 'Live'),
(804, 18, 5.00, 255, 255, 0, 26, 1, 1, 'Live'),
(805, 2, 0.50, 256, 256, 0, 2, 1, 1, 'Live'),
(806, 18, 1.00, 257, 257, 0, 26, 1, 1, 'Live'),
(807, 2, 0.50, 257, 257, 0, 2, 1, 1, 'Live'),
(808, 2, 0.25, 257, 257, 0, 3, 1, 1, 'Live'),
(809, 16, 1.00, 257, 257, 0, 22, 1, 1, 'Live'),
(810, 8, 1.00, 257, 257, 0, 13, 1, 1, 'Live'),
(811, 6, 1.00, 257, 257, 0, 11, 1, 1, 'Live'),
(812, 3, 0.25, 257, 257, 0, 8, 1, 1, 'Live'),
(813, 10, 1.00, 258, 258, 0, 15, 1, 1, 'Live'),
(814, 9, 4.00, 259, 259, 0, 14, 1, 1, 'Live'),
(815, 13, 0.50, 259, 259, 0, 21, 1, 1, 'Live'),
(816, 2, 0.50, 260, 260, 0, 2, 1, 1, 'Live'),
(817, 16, 1.00, 260, 260, 0, 22, 1, 1, 'Live'),
(818, 17, 1.00, 260, 260, 0, 25, 1, 1, 'Live'),
(819, 15, 1.00, 260, 260, 0, 24, 1, 1, 'Live'),
(820, 13, 0.50, 260, 260, 0, 21, 1, 1, 'Live'),
(821, 3, 5.00, 261, 261, 0, 7, 1, 1, 'Live'),
(822, 3, 5.00, 262, 262, 0, 7, 1, 1, 'Live'),
(823, 18, 1.00, 263, 263, 0, 26, 1, 1, 'Live'),
(824, 18, 1.00, 263, 263, 0, 26, 1, 1, 'Live'),
(825, 18, 1.00, 263, 263, 0, 26, 1, 1, 'Live'),
(826, 18, 1.00, 264, 264, 0, 26, 1, 1, 'Live'),
(827, 18, 1.00, 264, 264, 0, 26, 1, 1, 'Live'),
(828, 18, 1.00, 264, 264, 0, 26, 1, 1, 'Live'),
(829, 2, 0.50, 264, 264, 0, 2, 1, 1, 'Live'),
(830, 3, 1.00, 265, 265, 0, 5, 1, 1, 'Live'),
(831, 16, 1.00, 265, 265, 0, 22, 1, 1, 'Live'),
(832, 15, 1.00, 265, 265, 0, 24, 1, 1, 'Live'),
(833, 10, 0.50, 265, 265, 0, 17, 1, 1, 'Live'),
(834, 2, 0.25, 265, 265, 0, 3, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--

CREATE TABLE `tbl_sale_consumptions_of_modifiers_of_menus` (
  `id` bigint NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `consumption` float(10,2) DEFAULT NULL,
  `sale_consumption_id` int DEFAULT NULL,
  `sales_id` int NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '1=new order,2=invoiced order, 3=closed order',
  `food_menu_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sessions`
--

CREATE TABLE `tbl_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_sessions`
--

INSERT INTO `tbl_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('ltgge5li375k6n0u4cduio0dksorpdsc', '::1', 1632771541, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737313534313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('ukt7hk2trutjdmlqfradou235dlc1uga', '::1', 1632771884, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737313838343b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('5f43uq8dthlfqimu7l7k7m5cqielj2sk', '::1', 1632772239, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737323233393b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('s9mmqocq27jdf28bh7hgbhmodpiuh60b', '::1', 1632772651, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737323635313b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('h76ot18mn287uvabqn7k7udc5573k8mo', '::1', 1632773115, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737333131353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('304k2tp5l8i9tpo11p2ob0oujbd20475', '::1', 1632773968, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737333936383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('ataoolpv20e46f03tjq0o7d3l2c13k0a', '::1', 1632779593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323737333936383b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('ake0m2te4a0mij3a0lm636ohlamqq90i', '127.0.0.1', 1632795602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739353630323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('7v5jkc1icvadim09e56lbh6ij7ju3c95', '::1', 1632794656, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739343635363b),
('l76lkohfpual1ss3s62fbkinprdjm62u', '127.0.0.1', 1632794914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739343931343b),
('7ig0udmhrrp1g3njnvjn6k5693bg8c6s', '127.0.0.1', 1632794914, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739343931343b),
('8ehtcaemk28hvtk8jgu4fatrrar9vh84', '127.0.0.1', 1632797066, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739373036353b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('o46r2c92csnmkamp9ibuo7e9ptup98j5', '127.0.0.1', 1632797392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739373339323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('5evb1bvu3vovt4c2fisjtu2k3i4c69la', '127.0.0.1', 1632799132, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739393133323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b),
('q4qi2q3kpbaicgh5tqtd2jicihiqkvft', '127.0.0.1', 1632800107, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633323739393133323b757365725f69647c733a313a2231223b6c616e67756167657c733a373a227370616e697368223b66756c6c5f6e616d657c733a31343a224c412045534355494e544c454341223b70686f6e657c733a383a223431383337303230223b656d61696c5f616464726573737c733a32343a22696e666f40736f6c7563696f6e6469676974616c2e6e6574223b726f6c657c733a353a2241646d696e223b636f6d70616e795f69647c733a313a2231223b6f75746c65745f69647c733a313a2231223b63757272656e63797c733a323a22512e223b74696d655f7a6f6e657c733a31373a22416d65726963612f47756174656d616c61223b646174655f666f726d61747c733a353a22642f6d2f59223b6d656e755f6163636573737c613a31393a7b693a303b733a343a2253616c65223b693a313b733a383a225075726368617365223b693a323b733a393a22496e76656e746f7279223b693a333b733a353a225761737465223b693a343b733a373a22457870656e7365223b693a353b733a363a225265706f7274223b693a363b733a393a2244617368626f617264223b693a373b733a363a224d6173746572223b693a383b733a343a2255736572223b693a393b733a363a224d6173746572223b693a31303b733a31353a22537570706c6965725061796d656e74223b693a31313b733a32303a22496e76656e746f72795f61646a7573746d656e74223b693a31323b733a32313a2253686f72745f6d6573736167655f73657276696365223b693a31333b733a32303a22437573746f6d65725f6475655f72656365697665223b693a31343b733a31303a22417474656e64616e6365223b693a31353b733a343a2255736572223b693a31363b733a333a22426172223b693a31373b733a373a224b69746368656e223b693a31383b733a363a22576169746572223b7d7461785f69735f6773747c733a333a22596573223b6773745f73746174655f636f64657c733a303a22223b6f75746c65745f6e616d657c733a31343a224c612045736375696e746c656361223b616464726573737c733a31343a22517565747a616c74656e616e676f223b636f6c6c6563745f7461787c733a323a224e6f223b7461785f726567697374726174696f6e5f6e6f7c733a303a22223b696e766f6963655f7072696e747c733a333a22596573223b696e766f6963655f666f6f7465727c733a33363a224772616369617320506f7220547520436f6d707261205675656c76652050726f6e746f2e223b7072655f6f725f706f73745f7061796d656e747c733a31313a22507265205061796d656e74223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `id` int NOT NULL,
  `date_format` varchar(20) DEFAULT NULL,
  `time_zone` varchar(50) DEFAULT NULL,
  `currency` varchar(50) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Volcado de datos para la tabla `tbl_settings`
--

INSERT INTO `tbl_settings` (`id`, `date_format`, `time_zone`, `currency`, `company_id`, `del_status`) VALUES
(4, 'd/m/Y', 'America/Guatemala', 'Q.', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sms_settings`
--

CREATE TABLE `tbl_sms_settings` (
  `id` int NOT NULL,
  `email_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_sms_settings`
--

INSERT INTO `tbl_sms_settings` (`id`, `email_address`, `password`, `company_id`, `del_status`) VALUES
(1, 'info@your-domain.com', '123456', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_suppliers`
--

CREATE TABLE `tbl_suppliers` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `contact_person` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_suppliers`
--

INSERT INTO `tbl_suppliers` (`id`, `name`, `contact_person`, `phone`, `email`, `address`, `description`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'Proveedor 1', 'Proveedor', '444444', '', '', '', 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_supplier_payments`
--

CREATE TABLE `tbl_supplier_payments` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tables`
--

CREATE TABLE `tbl_tables` (
  `id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `sit_capacity` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_tables`
--

INSERT INTO `tbl_tables` (`id`, `name`, `sit_capacity`, `position`, `description`, `user_id`, `outlet_id`, `company_id`, `del_status`) VALUES
(1, 'mesa 1', '6', '01', 'mesa amplia', 1, 1, 1, 'Live'),
(2, 'Mesa Principal', '10', '2', 'mesa principal', 1, 1, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_temp_kot`
--

CREATE TABLE `tbl_temp_kot` (
  `id` int NOT NULL,
  `temp_kot_info` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_time_zone`
--

CREATE TABLE `tbl_time_zone` (
  `id` int NOT NULL,
  `country_code` varchar(2) DEFAULT NULL,
  `zone_name` varchar(35) DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Volcado de datos para la tabla `tbl_time_zone`
--

INSERT INTO `tbl_time_zone` (`id`, `country_code`, `zone_name`, `del_status`) VALUES
(1, 'AD', 'Europe/Andorra', 'Live'),
(2, 'AE', 'Asia/Dubai', 'Live'),
(3, 'AF', 'Asia/Kabul', 'Live'),
(4, 'AG', 'America/Antigua', 'Live'),
(5, 'AI', 'America/Anguilla', 'Live'),
(6, 'AL', 'Europe/Tirane', 'Live'),
(7, 'AM', 'Asia/Yerevan', 'Live'),
(8, 'AO', 'Africa/Luanda', 'Live'),
(9, 'AQ', 'Antarctica/McMurdo', 'Live'),
(10, 'AQ', 'Antarctica/Casey', 'Live'),
(11, 'AQ', 'Antarctica/Davis', 'Live'),
(12, 'AQ', 'Antarctica/DumontDUrville', 'Live'),
(13, 'AQ', 'Antarctica/Mawson', 'Live'),
(14, 'AQ', 'Antarctica/Palmer', 'Live'),
(15, 'AQ', 'Antarctica/Rothera', 'Live'),
(16, 'AQ', 'Antarctica/Syowa', 'Live'),
(17, 'AQ', 'Antarctica/Troll', 'Live'),
(18, 'AQ', 'Antarctica/Vostok', 'Live'),
(19, 'AR', 'America/Argentina/Buenos_Aires', 'Live'),
(20, 'AR', 'America/Argentina/Cordoba', 'Live'),
(21, 'AR', 'America/Argentina/Salta', 'Live'),
(22, 'AR', 'America/Argentina/Jujuy', 'Live'),
(23, 'AR', 'America/Argentina/Tucuman', 'Live'),
(24, 'AR', 'America/Argentina/Catamarca', 'Live'),
(25, 'AR', 'America/Argentina/La_Rioja', 'Live'),
(26, 'AR', 'America/Argentina/San_Juan', 'Live'),
(27, 'AR', 'America/Argentina/Mendoza', 'Live'),
(28, 'AR', 'America/Argentina/San_Luis', 'Live'),
(29, 'AR', 'America/Argentina/Rio_Gallegos', 'Live'),
(30, 'AR', 'America/Argentina/Ushuaia', 'Live'),
(31, 'AS', 'Pacific/Pago_Pago', 'Live'),
(32, 'AT', 'Europe/Vienna', 'Live'),
(33, 'AU', 'Australia/Lord_Howe', 'Live'),
(34, 'AU', 'Antarctica/Macquarie', 'Live'),
(35, 'AU', 'Australia/Hobart', 'Live'),
(36, 'AU', 'Australia/Currie', 'Live'),
(37, 'AU', 'Australia/Melbourne', 'Live'),
(38, 'AU', 'Australia/Sydney', 'Live'),
(39, 'AU', 'Australia/Broken_Hill', 'Live'),
(40, 'AU', 'Australia/Brisbane', 'Live'),
(41, 'AU', 'Australia/Lindeman', 'Live'),
(42, 'AU', 'Australia/Adelaide', 'Live'),
(43, 'AU', 'Australia/Darwin', 'Live'),
(44, 'AU', 'Australia/Perth', 'Live'),
(45, 'AU', 'Australia/Eucla', 'Live'),
(46, 'AW', 'America/Aruba', 'Live'),
(47, 'AX', 'Europe/Mariehamn', 'Live'),
(48, 'AZ', 'Asia/Baku', 'Live'),
(49, 'BA', 'Europe/Sarajevo', 'Live'),
(50, 'BB', 'America/Barbados', 'Live'),
(51, 'BD', 'Asia/Dhaka', 'Live'),
(52, 'BE', 'Europe/Brussels', 'Live'),
(53, 'BF', 'Africa/Ouagadougou', 'Live'),
(54, 'BG', 'Europe/Sofia', 'Live'),
(55, 'BH', 'Asia/Bahrain', 'Live'),
(56, 'BI', 'Africa/Bujumbura', 'Live'),
(57, 'BJ', 'Africa/Porto-Novo', 'Live'),
(58, 'BL', 'America/St_Barthelemy', 'Live'),
(59, 'BM', 'Atlantic/Bermuda', 'Live'),
(60, 'BN', 'Asia/Brunei', 'Live'),
(61, 'BO', 'America/La_Paz', 'Live'),
(62, 'BQ', 'America/Kralendijk', 'Live'),
(63, 'BR', 'America/Noronha', 'Live'),
(64, 'BR', 'America/Belem', 'Live'),
(65, 'BR', 'America/Fortaleza', 'Live'),
(66, 'BR', 'America/Recife', 'Live'),
(67, 'BR', 'America/Araguaina', 'Live'),
(68, 'BR', 'America/Maceio', 'Live'),
(69, 'BR', 'America/Bahia', 'Live'),
(70, 'BR', 'America/Sao_Paulo', 'Live'),
(71, 'BR', 'America/Campo_Grande', 'Live'),
(72, 'BR', 'America/Cuiaba', 'Live'),
(73, 'BR', 'America/Santarem', 'Live'),
(74, 'BR', 'America/Porto_Velho', 'Live'),
(75, 'BR', 'America/Boa_Vista', 'Live'),
(76, 'BR', 'America/Manaus', 'Live'),
(77, 'BR', 'America/Eirunepe', 'Live'),
(78, 'BR', 'America/Rio_Branco', 'Live'),
(79, 'BS', 'America/Nassau', 'Live'),
(80, 'BT', 'Asia/Thimphu', 'Live'),
(81, 'BW', 'Africa/Gaborone', 'Live'),
(82, 'BY', 'Europe/Minsk', 'Live'),
(83, 'BZ', 'America/Belize', 'Live'),
(84, 'CA', 'America/St_Johns', 'Live'),
(85, 'CA', 'America/Halifax', 'Live'),
(86, 'CA', 'America/Glace_Bay', 'Live'),
(87, 'CA', 'America/Moncton', 'Live'),
(88, 'CA', 'America/Goose_Bay', 'Live'),
(89, 'CA', 'America/Blanc-Sablon', 'Live'),
(90, 'CA', 'America/Toronto', 'Live'),
(91, 'CA', 'America/Nipigon', 'Live'),
(92, 'CA', 'America/Thunder_Bay', 'Live'),
(93, 'CA', 'America/Iqaluit', 'Live'),
(94, 'CA', 'America/Pangnirtung', 'Live'),
(95, 'CA', 'America/Atikokan', 'Live'),
(96, 'CA', 'America/Winnipeg', 'Live'),
(97, 'CA', 'America/Rainy_River', 'Live'),
(98, 'CA', 'America/Resolute', 'Live'),
(99, 'CA', 'America/Rankin_Inlet', 'Live'),
(100, 'CA', 'America/Regina', 'Live'),
(101, 'CA', 'America/Swift_Current', 'Live'),
(102, 'CA', 'America/Edmonton', 'Live'),
(103, 'CA', 'America/Cambridge_Bay', 'Live'),
(104, 'CA', 'America/Yellowknife', 'Live'),
(105, 'CA', 'America/Inuvik', 'Live'),
(106, 'CA', 'America/Creston', 'Live'),
(107, 'CA', 'America/Dawson_Creek', 'Live'),
(108, 'CA', 'America/Fort_Nelson', 'Live'),
(109, 'CA', 'America/Vancouver', 'Live'),
(110, 'CA', 'America/Whitehorse', 'Live'),
(111, 'CA', 'America/Dawson', 'Live'),
(112, 'CC', 'Indian/Cocos', 'Live'),
(113, 'CD', 'Africa/Kinshasa', 'Live'),
(114, 'CD', 'Africa/Lubumbashi', 'Live'),
(115, 'CF', 'Africa/Bangui', 'Live'),
(116, 'CG', 'Africa/Brazzaville', 'Live'),
(117, 'CH', 'Europe/Zurich', 'Live'),
(118, 'CI', 'Africa/Abidjan', 'Live'),
(119, 'CK', 'Pacific/Rarotonga', 'Live'),
(120, 'CL', 'America/Santiago', 'Live'),
(121, 'CL', 'America/Punta_Arenas', 'Live'),
(122, 'CL', 'Pacific/Easter', 'Live'),
(123, 'CM', 'Africa/Douala', 'Live'),
(124, 'CN', 'Asia/Shanghai', 'Live'),
(125, 'CN', 'Asia/Urumqi', 'Live'),
(126, 'CO', 'America/Bogota', 'Live'),
(127, 'CR', 'America/Costa_Rica', 'Live'),
(128, 'CU', 'America/Havana', 'Live'),
(129, 'CV', 'Atlantic/Cape_Verde', 'Live'),
(130, 'CW', 'America/Curacao', 'Live'),
(131, 'CX', 'Indian/Christmas', 'Live'),
(132, 'CY', 'Asia/Nicosia', 'Live'),
(133, 'CY', 'Asia/Famagusta', 'Live'),
(134, 'CZ', 'Europe/Prague', 'Live'),
(135, 'DE', 'Europe/Berlin', 'Live'),
(136, 'DE', 'Europe/Busingen', 'Live'),
(137, 'DJ', 'Africa/Djibouti', 'Live'),
(138, 'DK', 'Europe/Copenhagen', 'Live'),
(139, 'DM', 'America/Dominica', 'Live'),
(140, 'DO', 'America/Santo_Domingo', 'Live'),
(141, 'DZ', 'Africa/Algiers', 'Live'),
(142, 'EC', 'America/Guayaquil', 'Live'),
(143, 'EC', 'Pacific/Galapagos', 'Live'),
(144, 'EE', 'Europe/Tallinn', 'Live'),
(145, 'EG', 'Africa/Cairo', 'Live'),
(146, 'EH', 'Africa/El_Aaiun', 'Live'),
(147, 'ER', 'Africa/Asmara', 'Live'),
(148, 'ES', 'Europe/Madrid', 'Live'),
(149, 'ES', 'Africa/Ceuta', 'Live'),
(150, 'ES', 'Atlantic/Canary', 'Live'),
(151, 'ET', 'Africa/Addis_Ababa', 'Live'),
(152, 'FI', 'Europe/Helsinki', 'Live'),
(153, 'FJ', 'Pacific/Fiji', 'Live'),
(154, 'FK', 'Atlantic/Stanley', 'Live'),
(155, 'FM', 'Pacific/Chuuk', 'Live'),
(156, 'FM', 'Pacific/Pohnpei', 'Live'),
(157, 'FM', 'Pacific/Kosrae', 'Live'),
(158, 'FO', 'Atlantic/Faroe', 'Live'),
(159, 'FR', 'Europe/Paris', 'Live'),
(160, 'GA', 'Africa/Libreville', 'Live'),
(161, 'GB', 'Europe/London', 'Live'),
(162, 'GD', 'America/Grenada', 'Live'),
(163, 'GE', 'Asia/Tbilisi', 'Live'),
(164, 'GF', 'America/Cayenne', 'Live'),
(165, 'GG', 'Europe/Guernsey', 'Live'),
(166, 'GH', 'Africa/Accra', 'Live'),
(167, 'GI', 'Europe/Gibraltar', 'Live'),
(168, 'GL', 'America/Godthab', 'Live'),
(169, 'GL', 'America/Danmarkshavn', 'Live'),
(170, 'GL', 'America/Scoresbysund', 'Live'),
(171, 'GL', 'America/Thule', 'Live'),
(172, 'GM', 'Africa/Banjul', 'Live'),
(173, 'GN', 'Africa/Conakry', 'Live'),
(174, 'GP', 'America/Guadeloupe', 'Live'),
(175, 'GQ', 'Africa/Malabo', 'Live'),
(176, 'GR', 'Europe/Athens', 'Live'),
(177, 'GS', 'Atlantic/South_Georgia', 'Live'),
(178, 'GT', 'America/Guatemala', 'Live'),
(179, 'GU', 'Pacific/Guam', 'Live'),
(180, 'GW', 'Africa/Bissau', 'Live'),
(181, 'GY', 'America/Guyana', 'Live'),
(182, 'HK', 'Asia/Hong_Kong', 'Live'),
(183, 'HN', 'America/Tegucigalpa', 'Live'),
(184, 'HR', 'Europe/Zagreb', 'Live'),
(185, 'HT', 'America/Port-au-Prince', 'Live'),
(186, 'HU', 'Europe/Budapest', 'Live'),
(187, 'ID', 'Asia/Jakarta', 'Live'),
(188, 'ID', 'Asia/Pontianak', 'Live'),
(189, 'ID', 'Asia/Makassar', 'Live'),
(190, 'ID', 'Asia/Jayapura', 'Live'),
(191, 'IE', 'Europe/Dublin', 'Live'),
(192, 'IL', 'Asia/Jerusalem', 'Live'),
(193, 'IM', 'Europe/Isle_of_Man', 'Live'),
(194, 'IN', 'Asia/Kolkata', 'Live'),
(195, 'IO', 'Indian/Chagos', 'Live'),
(196, 'IQ', 'Asia/Baghdad', 'Live'),
(197, 'IR', 'Asia/Tehran', 'Live'),
(198, 'IS', 'Atlantic/Reykjavik', 'Live'),
(199, 'IT', 'Europe/Rome', 'Live'),
(200, 'JE', 'Europe/Jersey', 'Live'),
(201, 'JM', 'America/Jamaica', 'Live'),
(202, 'JO', 'Asia/Amman', 'Live'),
(203, 'JP', 'Asia/Tokyo', 'Live'),
(204, 'KE', 'Africa/Nairobi', 'Live'),
(205, 'KG', 'Asia/Bishkek', 'Live'),
(206, 'KH', 'Asia/Phnom_Penh', 'Live'),
(207, 'KI', 'Pacific/Tarawa', 'Live'),
(208, 'KI', 'Pacific/Enderbury', 'Live'),
(209, 'KI', 'Pacific/Kiritimati', 'Live'),
(210, 'KM', 'Indian/Comoro', 'Live'),
(211, 'KN', 'America/St_Kitts', 'Live'),
(212, 'KP', 'Asia/Pyongyang', 'Live'),
(213, 'KR', 'Asia/Seoul', 'Live'),
(214, 'KW', 'Asia/Kuwait', 'Live'),
(215, 'KY', 'America/Cayman', 'Live'),
(216, 'KZ', 'Asia/Almaty', 'Live'),
(217, 'KZ', 'Asia/Qyzylorda', 'Live'),
(218, 'KZ', 'Asia/Aqtobe', 'Live'),
(219, 'KZ', 'Asia/Aqtau', 'Live'),
(220, 'KZ', 'Asia/Atyrau', 'Live'),
(221, 'KZ', 'Asia/Oral', 'Live'),
(222, 'LA', 'Asia/Vientiane', 'Live'),
(223, 'LB', 'Asia/Beirut', 'Live'),
(224, 'LC', 'America/St_Lucia', 'Live'),
(225, 'LI', 'Europe/Vaduz', 'Live'),
(226, 'LK', 'Asia/Colombo', 'Live'),
(227, 'LR', 'Africa/Monrovia', 'Live'),
(228, 'LS', 'Africa/Maseru', 'Live'),
(229, 'LT', 'Europe/Vilnius', 'Live'),
(230, 'LU', 'Europe/Luxembourg', 'Live'),
(231, 'LV', 'Europe/Riga', 'Live'),
(232, 'LY', 'Africa/Tripoli', 'Live'),
(233, 'MA', 'Africa/Casablanca', 'Live'),
(234, 'MC', 'Europe/Monaco', 'Live'),
(235, 'MD', 'Europe/Chisinau', 'Live'),
(236, 'ME', 'Europe/Podgorica', 'Live'),
(237, 'MF', 'America/Marigot', 'Live'),
(238, 'MG', 'Indian/Antananarivo', 'Live'),
(239, 'MH', 'Pacific/Majuro', 'Live'),
(240, 'MH', 'Pacific/Kwajalein', 'Live'),
(241, 'MK', 'Europe/Skopje', 'Live'),
(242, 'ML', 'Africa/Bamako', 'Live'),
(243, 'MM', 'Asia/Yangon', 'Live'),
(244, 'MN', 'Asia/Ulaanbaatar', 'Live'),
(245, 'MN', 'Asia/Hovd', 'Live'),
(246, 'MN', 'Asia/Choibalsan', 'Live'),
(247, 'MO', 'Asia/Macau', 'Live'),
(248, 'MP', 'Pacific/Saipan', 'Live'),
(249, 'MQ', 'America/Martinique', 'Live'),
(250, 'MR', 'Africa/Nouakchott', 'Live'),
(251, 'MS', 'America/Montserrat', 'Live'),
(252, 'MT', 'Europe/Malta', 'Live'),
(253, 'MU', 'Indian/Mauritius', 'Live'),
(254, 'MV', 'Indian/Maldives', 'Live'),
(255, 'MW', 'Africa/Blantyre', 'Live'),
(256, 'MX', 'America/Mexico_City', 'Live'),
(257, 'MX', 'America/Cancun', 'Live'),
(258, 'MX', 'America/Merida', 'Live'),
(259, 'MX', 'America/Monterrey', 'Live'),
(260, 'MX', 'America/Matamoros', 'Live'),
(261, 'MX', 'America/Mazatlan', 'Live'),
(262, 'MX', 'America/Chihuahua', 'Live'),
(263, 'MX', 'America/Ojinaga', 'Live'),
(264, 'MX', 'America/Hermosillo', 'Live'),
(265, 'MX', 'America/Tijuana', 'Live'),
(266, 'MX', 'America/Bahia_Banderas', 'Live'),
(267, 'MY', 'Asia/Kuala_Lumpur', 'Live'),
(268, 'MY', 'Asia/Kuching', 'Live'),
(269, 'MZ', 'Africa/Maputo', 'Live'),
(270, 'NA', 'Africa/Windhoek', 'Live'),
(271, 'NC', 'Pacific/Noumea', 'Live'),
(272, 'NE', 'Africa/Niamey', 'Live'),
(273, 'NF', 'Pacific/Norfolk', 'Live'),
(274, 'NG', 'Africa/Lagos', 'Live'),
(275, 'NI', 'America/Managua', 'Live'),
(276, 'NL', 'Europe/Amsterdam', 'Live'),
(277, 'NO', 'Europe/Oslo', 'Live'),
(278, 'NP', 'Asia/Kathmandu', 'Live'),
(279, 'NR', 'Pacific/Nauru', 'Live'),
(280, 'NU', 'Pacific/Niue', 'Live'),
(281, 'NZ', 'Pacific/Auckland', 'Live'),
(282, 'NZ', 'Pacific/Chatham', 'Live'),
(283, 'OM', 'Asia/Muscat', 'Live'),
(284, 'PA', 'America/Panama', 'Live'),
(285, 'PE', 'America/Lima', 'Live'),
(286, 'PF', 'Pacific/Tahiti', 'Live'),
(287, 'PF', 'Pacific/Marquesas', 'Live'),
(288, 'PF', 'Pacific/Gambier', 'Live'),
(289, 'PG', 'Pacific/Port_Moresby', 'Live'),
(290, 'PG', 'Pacific/Bougainville', 'Live'),
(291, 'PH', 'Asia/Manila', 'Live'),
(292, 'PK', 'Asia/Karachi', 'Live'),
(293, 'PL', 'Europe/Warsaw', 'Live'),
(294, 'PM', 'America/Miquelon', 'Live'),
(295, 'PN', 'Pacific/Pitcairn', 'Live'),
(296, 'PR', 'America/Puerto_Rico', 'Live'),
(297, 'PS', 'Asia/Gaza', 'Live'),
(298, 'PS', 'Asia/Hebron', 'Live'),
(299, 'PT', 'Europe/Lisbon', 'Live'),
(300, 'PT', 'Atlantic/Madeira', 'Live'),
(301, 'PT', 'Atlantic/Azores', 'Live'),
(302, 'PW', 'Pacific/Palau', 'Live'),
(303, 'PY', 'America/Asuncion', 'Live'),
(304, 'QA', 'Asia/Qatar', 'Live'),
(305, 'RE', 'Indian/Reunion', 'Live'),
(306, 'RO', 'Europe/Bucharest', 'Live'),
(307, 'RS', 'Europe/Belgrade', 'Live'),
(308, 'RU', 'Europe/Kaliningrad', 'Live'),
(309, 'RU', 'Europe/Moscow', 'Live'),
(310, 'RU', 'Europe/Simferopol', 'Live'),
(311, 'RU', 'Europe/Volgograd', 'Live'),
(312, 'RU', 'Europe/Kirov', 'Live'),
(313, 'RU', 'Europe/Astrakhan', 'Live'),
(314, 'RU', 'Europe/Saratov', 'Live'),
(315, 'RU', 'Europe/Ulyanovsk', 'Live'),
(316, 'RU', 'Europe/Samara', 'Live'),
(317, 'RU', 'Asia/Yekaterinburg', 'Live'),
(318, 'RU', 'Asia/Omsk', 'Live'),
(319, 'RU', 'Asia/Novosibirsk', 'Live'),
(320, 'RU', 'Asia/Barnaul', 'Live'),
(321, 'RU', 'Asia/Tomsk', 'Live'),
(322, 'RU', 'Asia/Novokuznetsk', 'Live'),
(323, 'RU', 'Asia/Krasnoyarsk', 'Live'),
(324, 'RU', 'Asia/Irkutsk', 'Live'),
(325, 'RU', 'Asia/Chita', 'Live'),
(326, 'RU', 'Asia/Yakutsk', 'Live'),
(327, 'RU', 'Asia/Khandyga', 'Live'),
(328, 'RU', 'Asia/Vladivostok', 'Live'),
(329, 'RU', 'Asia/Ust-Nera', 'Live'),
(330, 'RU', 'Asia/Magadan', 'Live'),
(331, 'RU', 'Asia/Sakhalin', 'Live'),
(332, 'RU', 'Asia/Srednekolymsk', 'Live'),
(333, 'RU', 'Asia/Kamchatka', 'Live'),
(334, 'RU', 'Asia/Anadyr', 'Live'),
(335, 'RW', 'Africa/Kigali', 'Live'),
(336, 'SA', 'Asia/Riyadh', 'Live'),
(337, 'SB', 'Pacific/Guadalcanal', 'Live'),
(338, 'SC', 'Indian/Mahe', 'Live'),
(339, 'SD', 'Africa/Khartoum', 'Live'),
(340, 'SE', 'Europe/Stockholm', 'Live'),
(341, 'SG', 'Asia/Singapore', 'Live'),
(342, 'SH', 'Atlantic/St_Helena', 'Live'),
(343, 'SI', 'Europe/Ljubljana', 'Live'),
(344, 'SJ', 'Arctic/Longyearbyen', 'Live'),
(345, 'SK', 'Europe/Bratislava', 'Live'),
(346, 'SL', 'Africa/Freetown', 'Live'),
(347, 'SM', 'Europe/San_Marino', 'Live'),
(348, 'SN', 'Africa/Dakar', 'Live'),
(349, 'SO', 'Africa/Mogadishu', 'Live'),
(350, 'SR', 'America/Paramaribo', 'Live'),
(351, 'SS', 'Africa/Juba', 'Live'),
(352, 'ST', 'Africa/Sao_Tome', 'Live'),
(353, 'SV', 'America/El_Salvador', 'Live'),
(354, 'SX', 'America/Lower_Princes', 'Live'),
(355, 'SY', 'Asia/Damascus', 'Live'),
(356, 'SZ', 'Africa/Mbabane', 'Live'),
(357, 'TC', 'America/Grand_Turk', 'Live'),
(358, 'TD', 'Africa/Ndjamena', 'Live'),
(359, 'TF', 'Indian/Kerguelen', 'Live'),
(360, 'TG', 'Africa/Lome', 'Live'),
(361, 'TH', 'Asia/Bangkok', 'Live'),
(362, 'TJ', 'Asia/Dushanbe', 'Live'),
(363, 'TK', 'Pacific/Fakaofo', 'Live'),
(364, 'TL', 'Asia/Dili', 'Live'),
(365, 'TM', 'Asia/Ashgabat', 'Live'),
(366, 'TN', 'Africa/Tunis', 'Live'),
(367, 'TO', 'Pacific/Tongatapu', 'Live'),
(368, 'TR', 'Europe/Istanbul', 'Live'),
(369, 'TT', 'America/Port_of_Spain', 'Live'),
(370, 'TV', 'Pacific/Funafuti', 'Live'),
(371, 'TW', 'Asia/Taipei', 'Live'),
(372, 'TZ', 'Africa/Dar_es_Salaam', 'Live'),
(373, 'UA', 'Europe/Kiev', 'Live'),
(374, 'UA', 'Europe/Uzhgorod', 'Live'),
(375, 'UA', 'Europe/Zaporozhye', 'Live'),
(376, 'UG', 'Africa/Kampala', 'Live'),
(377, 'UM', 'Pacific/Midway', 'Live'),
(378, 'UM', 'Pacific/Wake', 'Live'),
(379, 'US', 'America/New_York', 'Live'),
(380, 'US', 'America/Detroit', 'Live'),
(381, 'US', 'America/Kentucky/Louisville', 'Live'),
(382, 'US', 'America/Kentucky/Monticello', 'Live'),
(383, 'US', 'America/Indiana/Indianapolis', 'Live'),
(384, 'US', 'America/Indiana/Vincennes', 'Live'),
(385, 'US', 'America/Indiana/Winamac', 'Live'),
(386, 'US', 'America/Indiana/Marengo', 'Live'),
(387, 'US', 'America/Indiana/Petersburg', 'Live'),
(388, 'US', 'America/Indiana/Vevay', 'Live'),
(389, 'US', 'America/Chicago', 'Live'),
(390, 'US', 'America/Indiana/Tell_City', 'Live'),
(391, 'US', 'America/Indiana/Knox', 'Live'),
(392, 'US', 'America/Menominee', 'Live'),
(393, 'US', 'America/North_Dakota/Center', 'Live'),
(394, 'US', 'America/North_Dakota/New_Salem', 'Live'),
(395, 'US', 'America/North_Dakota/Beulah', 'Live'),
(396, 'US', 'America/Denver', 'Live'),
(397, 'US', 'America/Boise', 'Live'),
(398, 'US', 'America/Phoenix', 'Live'),
(399, 'US', 'America/Los_Angeles', 'Live'),
(400, 'US', 'America/Anchorage', 'Live'),
(401, 'US', 'America/Juneau', 'Live'),
(402, 'US', 'America/Sitka', 'Live'),
(403, 'US', 'America/Metlakatla', 'Live'),
(404, 'US', 'America/Yakutat', 'Live'),
(405, 'US', 'America/Nome', 'Live'),
(406, 'US', 'America/Adak', 'Live'),
(407, 'US', 'Pacific/Honolulu', 'Live'),
(408, 'UY', 'America/Montevideo', 'Live'),
(409, 'UZ', 'Asia/Samarkand', 'Live'),
(410, 'UZ', 'Asia/Tashkent', 'Live'),
(411, 'VA', 'Europe/Vatican', 'Live'),
(412, 'VC', 'America/St_Vincent', 'Live'),
(413, 'VE', 'America/Caracas', 'Live'),
(414, 'VG', 'America/Tortola', 'Live'),
(415, 'VI', 'America/St_Thomas', 'Live'),
(416, 'VN', 'Asia/Ho_Chi_Minh', 'Live'),
(417, 'VU', 'Pacific/Efate', 'Live'),
(418, 'WF', 'Pacific/Wallis', 'Live'),
(419, 'WS', 'Pacific/Apia', 'Live'),
(420, 'YE', 'Asia/Aden', 'Live'),
(421, 'YT', 'Indian/Mayotte', 'Live'),
(422, 'ZA', 'Africa/Johannesburg', 'Live'),
(423, 'ZM', 'Africa/Lusaka', 'Live'),
(424, 'ZW', 'Africa/Harare', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_units`
--

CREATE TABLE `tbl_units` (
  `id` int NOT NULL,
  `unit_name` varchar(10) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tbl_units`
--

INSERT INTO `tbl_units` (`id`, `unit_name`, `description`, `company_id`, `del_status`) VALUES
(1, 'kg', 'papas', 1, 'Deleted'),
(2, 'kg', 'arroz', 1, 'Deleted'),
(3, 'kg', 'platano', 1, 'Deleted'),
(4, 'Lb', '', 1, 'Live'),
(5, 'Unidad', '', 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int NOT NULL,
  `full_name` varchar(25) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `will_login` varchar(20) NOT NULL DEFAULT 'No',
  `role` varchar(25) NOT NULL,
  `outlet_id` int NOT NULL,
  `company_id` int NOT NULL,
  `account_creation_date` datetime NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT 'english',
  `last_login` datetime NOT NULL,
  `active_status` varchar(25) NOT NULL DEFAULT 'Active',
  `del_status` varchar(10) NOT NULL DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `full_name`, `phone`, `email_address`, `password`, `designation`, `will_login`, `role`, `outlet_id`, `company_id`, `account_creation_date`, `language`, `last_login`, `active_status`, `del_status`) VALUES
(1, 'LA ESCUINTLECA', '59648885', 'info@soluciondigital.net', 'demo', NULL, 'No', 'Admin', 1, 1, '2018-02-17 07:28:32', 'spanish', '2019-01-01 01:01:01', 'Active', 'Live'),
(9, 'Carmen', '322000000', 'administracion@gmail.com', '98042663387Jd', 'Encargada', 'No', 'User', 1, 1, '0000-00-00 00:00:00', 'spanish', '0000-00-00 00:00:00', 'Active', 'Deleted'),
(10, 'Alan', '2321233', 'mesero@m.com', 'meserodemo', 'Encargado', 'No', 'User', 1, 1, '0000-00-00 00:00:00', 'spanish', '0000-00-00 00:00:00', 'Active', 'Deleted'),
(11, 'Carmen', '33000581', 'carmen@1.com', '123456', 'waiter', 'Yes', 'User', 1, 1, '0000-00-00 00:00:00', 'spanish', '0000-00-00 00:00:00', 'Active', 'Live'),
(12, 'Alan', '888855555', 'alan@m.com', '123456', 'waiter', 'Yes', 'User', 1, 1, '0000-00-00 00:00:00', 'spanish', '0000-00-00 00:00:00', 'Active', 'Live'),
(13, 'Ariana', '456754567', 'Info@soluciondigital.com', '', 'Encargad', 'No', '', 1, 1, '0000-00-00 00:00:00', 'english', '0000-00-00 00:00:00', 'Active', 'Deleted'),
(14, 'Ariana', '9999999', 'ariana@1.com', '', 'waiter', 'No', '', 1, 1, '0000-00-00 00:00:00', 'english', '0000-00-00 00:00:00', 'Active', 'Live'),
(15, 'Karen', '888888', 'karen@1.com', '', 'waiter', 'No', '', 1, 1, '0000-00-00 00:00:00', 'english', '0000-00-00 00:00:00', 'Active', 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user_menu_access`
--

CREATE TABLE `tbl_user_menu_access` (
  `id` int NOT NULL,
  `menu_id` int DEFAULT '0',
  `user_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `tbl_user_menu_access`
--

INSERT INTO `tbl_user_menu_access` (`id`, `menu_id`, `user_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 9, 1),
(12, 11, 1),
(46, 13, 1),
(103, 14, 1),
(104, 15, 1),
(118, 16, 1),
(133, 5, 1),
(134, 10, 1),
(135, 12, 1),
(140, 17, 1),
(141, 18, 1),
(142, 19, 1),
(143, 16, 3),
(144, 17, 3),
(145, 15, 3),
(146, 8, 3),
(147, 6, 3),
(148, 3, 3),
(149, 13, 3),
(150, 18, 3),
(151, 9, 3),
(152, 2, 3),
(153, 7, 3),
(154, 1, 3),
(155, 14, 3),
(156, 11, 3),
(157, 10, 3),
(158, 19, 3),
(159, 4, 3),
(160, 17, 4),
(161, 18, 4),
(162, 19, 4),
(202, 1, 12),
(203, 15, 11),
(204, 18, 11),
(205, 1, 11),
(206, 19, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_vats`
--

CREATE TABLE `tbl_vats` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `percentage` float(10,2) NOT NULL,
  `user_id` float(10,2) NOT NULL DEFAULT '1.00',
  `company_id` int DEFAULT NULL,
  `del_status` varchar(6) DEFAULT 'Live'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbl_vats`
--

INSERT INTO `tbl_vats` (`id`, `name`, `percentage`, `user_id`, `company_id`, `del_status`) VALUES
(1, 'General VAT', 15.00, 0.00, 1, 'Live'),
(2, 'Sales Tax', 15.00, 1.00, 1, 'Live');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_wastes`
--

CREATE TABLE `tbl_wastes` (
  `id` int NOT NULL,
  `reference_no` varchar(50) DEFAULT NULL,
  `date` date NOT NULL,
  `total_loss` float(10,2) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(50) DEFAULT 'Live',
  `food_menu_id` int DEFAULT NULL,
  `food_menu_waste_qty` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_waste_ingredients`
--

CREATE TABLE `tbl_waste_ingredients` (
  `id` int NOT NULL,
  `ingredient_id` int DEFAULT NULL,
  `waste_amount` float(10,2) DEFAULT NULL,
  `last_purchase_price` float(10,2) DEFAULT NULL,
  `loss_amount` float(10,2) DEFAULT NULL,
  `waste_id` int DEFAULT NULL,
  `outlet_id` int DEFAULT NULL,
  `del_status` varchar(10) DEFAULT 'Live'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=COMPACT;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_companies`
--
ALTER TABLE `tbl_companies`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds`
--
ALTER TABLE `tbl_holds`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_outlet_taxes`
--
ALTER TABLE `tbl_outlet_taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_register`
--
ALTER TABLE `tbl_register`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sessions`
--
ALTER TABLE `tbl_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_sms_settings`
--
ALTER TABLE `tbl_sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_tables`
--
ALTER TABLE `tbl_tables`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_temp_kot`
--
ALTER TABLE `tbl_temp_kot`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_units`
--
ALTER TABLE `tbl_units`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_admin_user_menus`
--
ALTER TABLE `tbl_admin_user_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_companies`
--
ALTER TABLE `tbl_companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tbl_customer_due_receives`
--
ALTER TABLE `tbl_customer_due_receives`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_expenses`
--
ALTER TABLE `tbl_expenses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_expense_items`
--
ALTER TABLE `tbl_expense_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus`
--
ALTER TABLE `tbl_food_menus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus_ingredients`
--
ALTER TABLE `tbl_food_menus_ingredients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menus_modifiers`
--
ALTER TABLE `tbl_food_menus_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_food_menu_categories`
--
ALTER TABLE `tbl_food_menu_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tbl_holds`
--
ALTER TABLE `tbl_holds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_holds_details`
--
ALTER TABLE `tbl_holds_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_holds_details_modifiers`
--
ALTER TABLE `tbl_holds_details_modifiers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_ingredients`
--
ALTER TABLE `tbl_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_ingredient_categories`
--
ALTER TABLE `tbl_ingredient_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_inventory_adjustment`
--
ALTER TABLE `tbl_inventory_adjustment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_modifiers`
--
ALTER TABLE `tbl_modifiers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_modifier_ingredients`
--
ALTER TABLE `tbl_modifier_ingredients`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_notifications`
--
ALTER TABLE `tbl_notifications`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_notification_bar_kitchen_panel`
--
ALTER TABLE `tbl_notification_bar_kitchen_panel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_orders_table`
--
ALTER TABLE `tbl_orders_table`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_outlets`
--
ALTER TABLE `tbl_outlets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_outlet_taxes`
--
ALTER TABLE `tbl_outlet_taxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_payment_methods`
--
ALTER TABLE `tbl_payment_methods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase`
--
ALTER TABLE `tbl_purchase`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase_ingredients`
--
ALTER TABLE `tbl_purchase_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tbl_register`
--
ALTER TABLE `tbl_register`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=794;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_details_modifiers`
--
ALTER TABLE `tbl_sales_details_modifiers`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions`
--
ALTER TABLE `tbl_sale_consumptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=835;

--
-- AUTO_INCREMENT de la tabla `tbl_sale_consumptions_of_modifiers_of_menus`
--
ALTER TABLE `tbl_sale_consumptions_of_modifiers_of_menus`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_settings`
--
ALTER TABLE `tbl_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_sms_settings`
--
ALTER TABLE `tbl_sms_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_suppliers`
--
ALTER TABLE `tbl_suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_supplier_payments`
--
ALTER TABLE `tbl_supplier_payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_tables`
--
ALTER TABLE `tbl_tables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_temp_kot`
--
ALTER TABLE `tbl_temp_kot`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_time_zone`
--
ALTER TABLE `tbl_time_zone`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT de la tabla `tbl_units`
--
ALTER TABLE `tbl_units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `tbl_user_menu_access`
--
ALTER TABLE `tbl_user_menu_access`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT de la tabla `tbl_wastes`
--
ALTER TABLE `tbl_wastes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_waste_ingredients`
--
ALTER TABLE `tbl_waste_ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
