/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : django_goods

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-12-31 23:36:52
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

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
INSERT INTO `auth_permission` VALUES ('19', 'Can add 留言', '7', 'add_commentmodel');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 留言', '7', 'change_commentmodel');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 留言', '7', 'delete_commentmodel');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 商品', '8', 'add_goods');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 商品', '8', 'change_goods');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 商品', '8', 'delete_goods');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 购买记录', '9', 'add_goodsrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 购买记录', '9', 'change_goodsrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 购买记录', '9', 'delete_goodsrecord');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_user_userprofile
-- ----------------------------
INSERT INTO `custom_user_userprofile` VALUES ('1', 'pbkdf2_sha256$36000$Rt20ChdRoZek$UvuomAUw2XNHY7RBb/sFsZQas79smCnHPYMjMHZVM6w=', '2018-12-31 23:29:44.857382', '1', 'admin', '', '', 'admin123@qq.com', '1', '1', '2018-12-31 23:29:33.842752', null, 'image/default.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('3', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('5', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('1', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('2', 'custom_user', 'userprofile');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('7', 'WebShop', 'commentmodel');
INSERT INTO `django_content_type` VALUES ('8', 'WebShop', 'goods');
INSERT INTO `django_content_type` VALUES ('9', 'WebShop', 'goodsrecord');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
INSERT INTO `django_migrations` VALUES ('15', 'WebShop', '0001_initial', '2018-12-31 23:22:17.717807');

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
INSERT INTO `django_session` VALUES ('wt3r0o4x2kbxewwr6s9man2xc4xd3qn9', 'YjNiNTI3ODc3ODNjYjU0MjJiY2M0Njk5YTkwZGFkMzlkOGY5NDZmYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiY3VzdG9tX3VzZXIudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjVkYjZiNGQzNTQwNDFjMTVmZmRiOTUzNjQ5YzQ1ZGYwMTY5MzY2MTkifQ==', '2019-01-14 23:29:44.939387');

-- ----------------------------
-- Table structure for `webshop_commentmodel`
-- ----------------------------
DROP TABLE IF EXISTS `webshop_commentmodel`;
CREATE TABLE `webshop_commentmodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(256) NOT NULL,
  `discription` longtext NOT NULL,
  `create_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webshop_commentmodel
-- ----------------------------

-- ----------------------------
-- Table structure for `webshop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `webshop_goods`;
CREATE TABLE `webshop_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classification` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `discription` longtext NOT NULL,
  `has_sale` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `counts` int(11) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webshop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `webshop_goodsrecord`
-- ----------------------------
DROP TABLE IF EXISTS `webshop_goodsrecord`;
CREATE TABLE `webshop_goodsrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(128) NOT NULL,
  `classification` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `discription` longtext NOT NULL,
  `pic` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `adress` varchar(256) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `create_at` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `WebShop_goodsrecord_user_id_f3f2338a_fk_custom_us` (`user_id`),
  CONSTRAINT `WebShop_goodsrecord_user_id_f3f2338a_fk_custom_us` FOREIGN KEY (`user_id`) REFERENCES `custom_user_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of webshop_goodsrecord
-- ----------------------------
