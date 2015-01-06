-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 11, 2011 at 06:17 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mtreedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_adjacency`
--

DROP TABLE IF EXISTS `menu_adjacency`;
CREATE TABLE IF NOT EXISTS `menu_adjacency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(2) NOT NULL,
  `tooltip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visible` int(1) NOT NULL,
  `task` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `options` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_parent` (`parent_id`),
  KEY `task` (`task`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=36 ;

--
-- Dumping data for table `menu_adjacency`
--

INSERT INTO `menu_adjacency` (`id`, `parent_id`, `title`, `position`, `tooltip`, `url`, `icon`, `visible`, `task`, `options`) VALUES
(1, NULL, 'Home', 0, NULL, '#', 'house.png', 1, NULL, '{"style":"background-color:RED"}'),
(2, 1, 'Profile', 1, 'view your profile', '', 'user.png', 1, NULL, ''),
(3, 2, 'View Profile', 0, 'view the details of your profile', '#', 'user_go.png', 1, 'User.Profile.Profile', ''),
(4, 2, 'Update Profile', 1, 'update the details of your profile', '#', 'user_edit.png', 1, 'User.ProfileField.Update', ''),
(5, 2, 'Change Password', 2, 'change your password access to the system', '#', 'lock_edit.png', 1, 'User.Profile.Changepassword', ''),
(6, NULL, 'Personnel Management', 1, 'module to manage all the information about applicants and employees', '', 'folder_user.png', 1, NULL, ''),
(7, 6, 'Manage Personnel', 1, 'list, add, edit, or delete personnel', '#', 'group_gear.png', 1, 'User.Admin.Admin', ''),
(8, 7, 'Add Personnel', 1, 'create a new record of a personnel', '#', 'user_add.png', 1, 'User.Admin.Create', ''),
(9, 7, 'List Personnel', 0, 'list all the personnel available in the database', '#', 'gif/list_users.gif', 1, 'User.Default.Index', ''),
(11, 13, 'Menu Management', 3, 'add.edit.delete, or arrange system menu options', '', 'cog.png', 1, NULL, ''),
(12, 13, 'System Access Rights', 2, 'assign permissions to roles, tasks,or permissions ', '', 'key.png', 1, NULL, ''),
(13, NULL, 'Back Office', 3, 'system maintenance module', '', 'wrench_orange.png', 1, NULL, ''),
(14, 26, 'Roles', 1, 'view, create, update or delete system role', '#', 'group.png', 1, NULL, ''),
(15, 14, 'Add Role', 0, 'create a new role', '#', 'group_add.png', 1, NULL, ''),
(16, 13, 'Reference Tables', 0, 'manage all tables used as reference', '', 'table_multiple.png', 1, NULL, ''),
(19, 16, 'Municipalities', 0, 'add,edit, or delete Municipalities', '#', 'table.png', 1, 'Admin.Municipality.Index', ''),
(20, 21, 'Add Menu', 1, 'create a new module for the system', '#', 'cog_add.png', 1, NULL, ''),
(21, 11, 'Manage Menu', 0, 'search, list, edit, or delete all the menus', '#', 'cog_edit.png', 1, NULL, ''),
(22, 21, 'Arrange Menus', 0, 'change the order of the menus', '#', 'cog_edit.png', 1, NULL, ''),
(23, 12, 'Permissions', 1, 'manage permissions', '#', 'folder_key.png', 1, NULL, ''),
(24, 23, 'Generate Permissions', 0, 'select items which needs permissions', '#', 'folder_add.png', 1, NULL, ''),
(25, 26, 'Assignments', 0, 'manage assignments', '#', 'gif/key_go.gif', 1, NULL, ''),
(26, 12, 'Manage Auth Items', 3, 'add, edit, or delete authorization items', '', 'gif/application_key.gif', 1, NULL, ''),
(27, 26, 'Tasks', 2, 'manage tasks', '#', 'application_key.png', 1, NULL, ''),
(28, 27, 'Add Task', 0, 'create a new task', '#', 'application_key.png', 1, NULL, ''),
(29, 26, 'Operations', 3, 'manage operations', '#', 'shield.png', 1, NULL, ''),
(30, 29, 'Add Operation', 0, 'create a new operation', '#', 'shield_add.png', 1, NULL, ''),
(31, 33, 'Manage Profile Fields', 0, 'manage fields for personnel profile', '#', '', 1, NULL, ''),
(32, 31, 'Add Profile Field', 0, 'create a new profile field', '#', '', 1, NULL, ''),
(33, 13, 'Profile Table Maintenance', 1, 'manage everything related to profile fields', '', '', 1, NULL, ''),
(34, 33, 'Profile Fields Group', 1, 'manage profile fields grouping', '#', '', 1, NULL, ''),
(35, 34, 'Manage Fields Group', 0, 'manage profile fields grouping', '#', '', 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `menu_nested`
--

DROP TABLE IF EXISTS `menu_nested`;
CREATE TABLE IF NOT EXISTS `menu_nested` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `lft` int(10) unsigned NOT NULL,
  `rgt` int(10) unsigned NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `visible` int(1) NOT NULL,
  `task` varchar(64) DEFAULT NULL,
  `htmlOptions` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `menu_nested`
--

INSERT INTO `menu_nested` (`id`, `title`, `lft`, `rgt`, `url`, `visible`, `task`, `htmlOptions`) VALUES
(1, 'CEO', 1, 16, '', 1, '', ''),
(2, 'Senior managers', 2, 15, '#', 1, '', '{"style":"font-weight:bold"}'),
(3, 'Technical team leader', 3, 6, '#', 1, '', ''),
(4, 'Technical team', 4, 5, '#', 1, '', '{"style":"color:cyan"}'),
(5, 'Sales team leader', 7, 10, '#', 1, '', ''),
(6, 'Sales team', 8, 9, '#', 1, '', ''),
(7, 'Customer service team leader', 11, 14, '#', 1, '', ''),
(8, 'Customer service team', 12, 13, '#', 1, '', '');
