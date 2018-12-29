/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : django_goods

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-28 00:15:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '3', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '3', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '3', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '4', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '4', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '4', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '5', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '5', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '5', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '1', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '1', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '1', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add 用户信息', '2', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('17', 'Can change 用户信息', '2', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete 用户信息', '2', 'delete_userprofile');

-- ----------------------------
-- Table structure for `custom_user_userprofile`
-- ----------------------------
DROP TABLE IF EXISTS `custom_user_userprofile`;
CREATE TABLE `custom_user_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_user_userprofile
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_user_userprofile_groups`
-- ----------------------------
DROP TABLE IF EXISTS `custom_user_userprofile_groups`;
CREATE TABLE `custom_user_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_userprofile__userprofile_id_group_id_1e7cac9e_uniq` (`userprofile_id`,`group_id`),
  KEY `custom_user_userprof_group_id_c64c4830_fk_auth_grou` (`group_id`),
  CONSTRAINT `custom_user_userprof_group_id_c64c4830_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `custom_user_userprof_userprofile_id_85b5ca69_fk_custom_us` FOREIGN KEY (`userprofile_id`) REFERENCES `custom_user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_user_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `custom_user_userprofile_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `custom_user_userprofile_user_permissions`;
CREATE TABLE `custom_user_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_userprofile__userprofile_id_permissio_59bf8298_uniq` (`userprofile_id`,`permission_id`),
  KEY `custom_user_userprof_permission_id_ecb03db0_fk_auth_perm` (`permission_id`),
  CONSTRAINT `custom_user_userprof_permission_id_ecb03db0_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `custom_user_userprof_userprofile_id_954fc757_fk_custom_us` FOREIGN KEY (`userprofile_id`) REFERENCES `custom_user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_user_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_custom_user_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('3', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('5', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('1', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('2', 'custom_user', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-12-28 00:02:16.436762');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2018-12-28 00:06:11.070182');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2018-12-28 00:06:11.965233');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2018-12-28 00:06:12.086240');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2018-12-28 00:06:12.097241');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2018-12-28 00:06:12.107241');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2018-12-28 00:06:12.117242');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2018-12-28 00:06:12.121242');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2018-12-28 00:06:12.131243');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2018-12-28 00:06:12.141243');
INSERT INTO `django_migrations` VALUES ('11', 'custom_user', '0001_initial', '2018-12-28 00:06:14.345369');
INSERT INTO `django_migrations` VALUES ('12', 'admin', '0001_initial', '2018-12-28 00:14:36.619098');
INSERT INTO `django_migrations` VALUES ('13', 'admin', '0002_logentry_remove_auto_add', '2018-12-28 00:14:36.635099');
INSERT INTO `django_migrations` VALUES ('14', 'sessions', '0001_initial', '2018-12-28 00:14:36.718103');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
