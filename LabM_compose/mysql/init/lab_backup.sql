/*
 Navicat Premium Data Transfer

 Source Server         : lab
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 192.168.1.190:3306
 Source Schema         : lab_test

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 11/10/2021 10:20:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (22, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (23, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (24, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (25, '审核订单', 6, 'web__check_orders');
INSERT INTO `auth_permission` VALUES (26, '修改历史订单', 6, 'web__edit_history_orders');
INSERT INTO `auth_permission` VALUES (27, '修改用户信息', 6, 'web__edit_user_info');
INSERT INTO `auth_permission` VALUES (28, 'Can add 公司', 7, 'add_companyinfo');
INSERT INTO `auth_permission` VALUES (29, 'Can change 公司', 7, 'change_companyinfo');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 公司', 7, 'delete_companyinfo');
INSERT INTO `auth_permission` VALUES (31, 'Can view 公司', 7, 'view_companyinfo');
INSERT INTO `auth_permission` VALUES (32, 'Can add 值日表', 8, 'add_dutytable');
INSERT INTO `auth_permission` VALUES (33, 'Can change 值日表', 8, 'change_dutytable');
INSERT INTO `auth_permission` VALUES (34, 'Can delete 值日表', 8, 'delete_dutytable');
INSERT INTO `auth_permission` VALUES (35, 'Can view 值日表', 8, 'view_dutytable');
INSERT INTO `auth_permission` VALUES (36, 'Can add 商品', 9, 'add_goodsdetail');
INSERT INTO `auth_permission` VALUES (37, 'Can change 商品', 9, 'change_goodsdetail');
INSERT INTO `auth_permission` VALUES (38, 'Can delete 商品', 9, 'delete_goodsdetail');
INSERT INTO `auth_permission` VALUES (39, 'Can view 商品', 9, 'view_goodsdetail');
INSERT INTO `auth_permission` VALUES (40, 'Can add 订单', 10, 'add_order');
INSERT INTO `auth_permission` VALUES (41, 'Can change 订单', 10, 'change_order');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 订单', 10, 'delete_order');
INSERT INTO `auth_permission` VALUES (43, 'Can view 订单', 10, 'view_order');
INSERT INTO `auth_permission` VALUES (44, 'Can add 消息', 11, 'add_message');
INSERT INTO `auth_permission` VALUES (45, 'Can change 消息', 11, 'change_message');
INSERT INTO `auth_permission` VALUES (46, 'Can delete 消息', 11, 'delete_message');
INSERT INTO `auth_permission` VALUES (47, 'Can view 消息', 11, 'view_message');
INSERT INTO `auth_permission` VALUES (48, 'Can add 值日人', 12, 'add_dutyitem');
INSERT INTO `auth_permission` VALUES (49, 'Can change 值日人', 12, 'change_dutyitem');
INSERT INTO `auth_permission` VALUES (50, 'Can delete 值日人', 12, 'delete_dutyitem');
INSERT INTO `auth_permission` VALUES (51, 'Can view 值日人', 12, 'view_dutyitem');
INSERT INTO `auth_permission` VALUES (52, 'Can add 基因信息', 13, 'add_geneinfo');
INSERT INTO `auth_permission` VALUES (53, 'Can change 基因信息', 13, 'change_geneinfo');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 基因信息', 13, 'delete_geneinfo');
INSERT INTO `auth_permission` VALUES (55, 'Can view 基因信息', 13, 'view_geneinfo');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_web_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_web_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'web', 'companyinfo');
INSERT INTO `django_content_type` VALUES (12, 'web', 'dutyitem');
INSERT INTO `django_content_type` VALUES (8, 'web', 'dutytable');
INSERT INTO `django_content_type` VALUES (13, 'web', 'geneinfo');
INSERT INTO `django_content_type` VALUES (9, 'web', 'goodsdetail');
INSERT INTO `django_content_type` VALUES (11, 'web', 'message');
INSERT INTO `django_content_type` VALUES (10, 'web', 'order');
INSERT INTO `django_content_type` VALUES (6, 'web', 'userprofile');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-01-04 11:54:46.269216');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-01-04 11:54:46.361744');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-01-04 11:54:46.445647');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-01-04 11:54:47.174689');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-01-04 11:54:47.192293');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-01-04 11:54:47.208887');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-01-04 11:54:47.225579');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-01-04 11:54:47.233216');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-01-04 11:54:47.249643');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-01-04 11:54:47.266875');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-01-04 11:54:47.286396');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-01-04 11:54:47.377944');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-01-04 11:54:47.395646');
INSERT INTO `django_migrations` VALUES (14, 'web', '0001_initial', '2021-01-04 11:54:47.862193');
INSERT INTO `django_migrations` VALUES (15, 'admin', '0001_initial', '2021-01-04 11:54:49.099672');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0002_logentry_user', '2021-01-04 11:54:49.237888');
INSERT INTO `django_migrations` VALUES (17, 'sessions', '0001_initial', '2021-01-04 11:54:49.380888');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0002_logentry_remove_auto_add', '2021-01-26 17:51:26.630724');
INSERT INTO `django_migrations` VALUES (19, 'admin', '0003_logentry_add_action_flag_choices', '2021-01-26 17:51:26.643787');
INSERT INTO `django_migrations` VALUES (20, 'web', '0002_auto_20210126_1751', '2021-01-26 17:51:26.754541');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('06dwxu8v41qz1s79zkzjg2gonp971sn1', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-02-02 15:28:58.127131');
INSERT INTO `django_session` VALUES ('0fplgzr9jvg72bfketykndl3h7srb1zt', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-03-08 09:36:42.557940');
INSERT INTO `django_session` VALUES ('0ggah1aaykopqzzizy8vc0ueef6nu3mi', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-24 15:31:55.160357');
INSERT INTO `django_session` VALUES ('0min2ec4b4dhnux5dgm6vw6vq6ma3vqs', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-09-15 12:53:26.134289');
INSERT INTO `django_session` VALUES ('0vlnh0prrpjs08ccft9byl3kbywldcoh', 'MWQxN2E2YmUzYzc1OTAyMTlkNTQ1NzZhODMyYTkxNGFlMmRhYzdlZTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGViNTVjNTE1YTUyZGYwMTFlZTAxZGNkOWE2OGEyMDNkNDY5ZGY4YSJ9', '2021-03-29 21:32:12.448572');
INSERT INTO `django_session` VALUES ('128zsp6k6qzx8dwnenhbetfvta1hrvfj', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-09-16 16:23:56.870191');
INSERT INTO `django_session` VALUES ('1fa7p2rtq62nm87sherlvm595m77wx25', 'ZmJlODU0YWJmMmY5YTY2OTcxZmFmODk2MmRhOTEzY2M5OTIwZDA3MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTdhMGRhMGFiNTBjZDU1YzI0N2JmMjZkNGQ4YTM1Nzg0YTM0OGYzZiJ9', '2021-06-15 20:38:35.936754');
INSERT INTO `django_session` VALUES ('1jtcw39533wro1ake1u9hqnn3pt5woln', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-06-25 23:49:23.162461');
INSERT INTO `django_session` VALUES ('1mit78q3tv40oxhb08i7g4xp9dvm10bm', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-02-16 16:56:30.687424');
INSERT INTO `django_session` VALUES ('1xpc4ugn05uklltttwspsxnosjmwz7v1', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-09-23 16:55:02.434970');
INSERT INTO `django_session` VALUES ('23h4k50gatj1d6qyagr36o5rbs5tqos5', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-19 12:48:13.197315');
INSERT INTO `django_session` VALUES ('29gv486srlxhdp3tint4rfw5eidhn8wg', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-10-18 20:10:08.813326');
INSERT INTO `django_session` VALUES ('2dppnkrrqokcp47b5z9molhiem1zfpzx', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-06-04 16:40:52.020234');
INSERT INTO `django_session` VALUES ('389j5yy56nwotrpt7cgkvw6x3jdlfyk3', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 19:01:54.974224');
INSERT INTO `django_session` VALUES ('3fk25ajjkp8287298l3u51uxalayh2wo', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-19 16:33:05.804965');
INSERT INTO `django_session` VALUES ('3ln04lrcfzozly5fmvpgdagm0bap9tz9', 'ZmJlODU0YWJmMmY5YTY2OTcxZmFmODk2MmRhOTEzY2M5OTIwZDA3MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTdhMGRhMGFiNTBjZDU1YzI0N2JmMjZkNGQ4YTM1Nzg0YTM0OGYzZiJ9', '2021-02-10 17:07:06.523238');
INSERT INTO `django_session` VALUES ('3mresomiui7xg5hto1ttj7rpa50mvh6g', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-22 17:07:08.095877');
INSERT INTO `django_session` VALUES ('3n04ai9d08v9r9ocgk880l7weywophf1', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-06-17 10:12:11.003789');
INSERT INTO `django_session` VALUES ('3zuxq4iq5ujyk2o3p1upgo2p3y40xcsu', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-07-23 10:39:09.442393');
INSERT INTO `django_session` VALUES ('4eqv2x52f2l2uenafs2b4pxity9c857n', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-18 17:02:54.368790');
INSERT INTO `django_session` VALUES ('4f90y9aczweuk30a426y722bp2d06zuy', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-04-30 11:05:07.962171');
INSERT INTO `django_session` VALUES ('5ee19aarrcu50h8vsd8qta2myltkab75', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-05-20 10:44:01.051158');
INSERT INTO `django_session` VALUES ('5phvk0m4kmkpw5qh5dw6gb4ju2kn6df4', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-09-29 21:13:19.326985');
INSERT INTO `django_session` VALUES ('5tz5nozmvw5d09y5p47bixq3l5b7tcm1', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-20 19:16:33.249591');
INSERT INTO `django_session` VALUES ('5x1qmoe4m7mhfvh7oy67744mcnixmom0', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-04-21 16:48:33.015650');
INSERT INTO `django_session` VALUES ('6572z0n55gmjnzu205od7vo5r5fb65kk', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-04-20 10:13:43.680090');
INSERT INTO `django_session` VALUES ('66j7kflkqwdf3gybv3h25oekviczil2o', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-02-08 14:50:05.309380');
INSERT INTO `django_session` VALUES ('66q67tefpikjf54vix99dqazxsqt2rwz', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-05-10 01:47:48.159125');
INSERT INTO `django_session` VALUES ('6b4vxdyhudbs4hfhix7w6dn9usu9d9yx', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-08-23 19:32:11.231251');
INSERT INTO `django_session` VALUES ('6dh6u8ukawpzsxvsxydq7cawjqr2up4t', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-04-05 15:22:02.621333');
INSERT INTO `django_session` VALUES ('6id2941isg4kebz6behvtkld1edsvfwk', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-05-25 11:12:31.240387');
INSERT INTO `django_session` VALUES ('6jmjhcoq53dpinl7etqycshbxydceivj', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-06-14 17:27:48.767782');
INSERT INTO `django_session` VALUES ('6mqschpo8p1lwya6xypq82cckgrbjyp1', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-03-06 13:49:32.917727');
INSERT INTO `django_session` VALUES ('6ogpzxiihidej3904jz9n1r60f9r56ng', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-20 09:56:53.041597');
INSERT INTO `django_session` VALUES ('6s0y2ad5taksvqood7h8hwq4rh76lukq', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-21 10:06:12.371795');
INSERT INTO `django_session` VALUES ('6s8d1zxkzymla2fpar3yn0il95c6ftxg', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-04-01 15:22:59.806161');
INSERT INTO `django_session` VALUES ('719aku4poqajbhf7f8c3lw9diw4huepb', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-05-06 09:22:36.103831');
INSERT INTO `django_session` VALUES ('71z8njn873v4msl8brr5c45syf9vtj66', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-22 10:59:17.547706');
INSERT INTO `django_session` VALUES ('76q61bu11lex5c56fevvz3pu0k21r18o', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-03-29 17:30:23.126191');
INSERT INTO `django_session` VALUES ('77kp8ef4stsh7nzt56ngmpb13raocqer', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-03-29 12:00:05.473548');
INSERT INTO `django_session` VALUES ('7hc7a0ixwvmp75ihovmrstzkp82zmf4o', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-08-31 10:31:04.466310');
INSERT INTO `django_session` VALUES ('7w0a4xfxz0vbk9dfjoo5ycopj1hoj4pc', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-05-04 11:33:55.248380');
INSERT INTO `django_session` VALUES ('7xeg6gnnslblel7gvmlx9hdiku8ic8j8', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-04-16 17:41:22.201739');
INSERT INTO `django_session` VALUES ('84qstq8bwb6yp40wge5it2rc9d7fdjoj', 'ZmJlODU0YWJmMmY5YTY2OTcxZmFmODk2MmRhOTEzY2M5OTIwZDA3MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTdhMGRhMGFiNTBjZDU1YzI0N2JmMjZkNGQ4YTM1Nzg0YTM0OGYzZiJ9', '2021-05-10 16:15:11.478368');
INSERT INTO `django_session` VALUES ('864uqicjow5umy18cm4wqqndq68zr95d', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-01-21 10:29:41.883640');
INSERT INTO `django_session` VALUES ('88llkl9he5er02p63lcc565yuoq1fqz4', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 14:27:24.754771');
INSERT INTO `django_session` VALUES ('8rew0zren748ppgzrzl5pks5hp23xl66', 'NWJmNmMyZGY1OGQ5NDM4OGI3NjhjZWQ2ODY2ZjRmZjc4MDg1NTViMDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNjNzQxZDFmYjhmZTRlN2U5MDY4MzY4OTU4N2I3ZDgzOGZkMWM0ZiJ9', '2021-02-10 17:39:09.486488');
INSERT INTO `django_session` VALUES ('994anazj9nwwh7vd56j9ze3scoziw6oy', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-10-14 11:23:07.748779');
INSERT INTO `django_session` VALUES ('9fum4qnxa4utfrco490diwlczp5e9px4', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-21 14:42:12.661317');
INSERT INTO `django_session` VALUES ('9jao0etaupvt5yvgfh54dl4oj5mq1ey7', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-09-09 17:08:13.588150');
INSERT INTO `django_session` VALUES ('9ldswc8cl8k96fzk6h0kjy1b2cvrnawz', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-03-09 14:42:52.206306');
INSERT INTO `django_session` VALUES ('a6yjzd1jeer1b32jeb8jx5t075ncajgh', 'MWQxN2E2YmUzYzc1OTAyMTlkNTQ1NzZhODMyYTkxNGFlMmRhYzdlZTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGViNTVjNTE1YTUyZGYwMTFlZTAxZGNkOWE2OGEyMDNkNDY5ZGY4YSJ9', '2021-01-20 18:09:09.010078');
INSERT INTO `django_session` VALUES ('awh8ju4z34joaexiuivm2d9kyw6ewdms', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-01-22 16:35:21.184768');
INSERT INTO `django_session` VALUES ('awng5pxxv2uogvoxx9vn07ysjjemz0i5', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-05-02 20:39:37.911513');
INSERT INTO `django_session` VALUES ('baazd5ovqmtvkj32b8xvgsydq9t1vpr6', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-08-19 11:16:05.220514');
INSERT INTO `django_session` VALUES ('bopkfklc6wxpk5vmcvfbyu6q1k4onc85', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-03-08 21:08:26.024672');
INSERT INTO `django_session` VALUES ('box8j2qvd8yls9k3735k3mtr2ggpwqlx', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-10-11 17:45:16.901673');
INSERT INTO `django_session` VALUES ('btavphpxy9zb3ee534nsun6m0bssq750', 'MzVlYjRlNDFlYThmMWUxMzcyYzRhMDJiODQ0MmRjYjYwMDc3YmI0ODp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzZDVhMmY3ZDQzYjc0NDNlODY0ODA1NGQxZmUxYTI5YTQ1YzU5NjQyIn0=', '2021-01-18 16:51:25.319286');
INSERT INTO `django_session` VALUES ('c304lp3a6357to4u84fv4ojowlmuqrz4', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-10-01 12:32:21.055149');
INSERT INTO `django_session` VALUES ('c5ylkymmut2mgshtxzlnqjqbsih9xwie', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-10-12 17:54:53.475922');
INSERT INTO `django_session` VALUES ('c9btpakouwwon20o6c2x9bjr93q44w72', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-06-29 16:30:17.874947');
INSERT INTO `django_session` VALUES ('cm0j6l5xm5fhapx755etuv3umx7vvk4p', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-21 16:36:09.711207');
INSERT INTO `django_session` VALUES ('cth7fv4g1eqy7v1xxf6hizuuztxnfzyh', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-04-13 15:43:00.614351');
INSERT INTO `django_session` VALUES ('cx119z1k8dcv5wivxqirrzbaobvwh2mo', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-05-05 10:38:37.423629');
INSERT INTO `django_session` VALUES ('cx59ofnhe7v9ifblbkt563f08itdkbr9', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-01-19 16:55:53.307065');
INSERT INTO `django_session` VALUES ('d52tloknevsjqb18yjwgwx3czzg8hl3z', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-02-16 17:20:16.143140');
INSERT INTO `django_session` VALUES ('d5s8ei3efk0jf2k9iuod6wmkye41l6pe', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-07-02 17:27:23.266945');
INSERT INTO `django_session` VALUES ('dedo6su33w1rwed8fciut6sg113weo95', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-08-16 19:15:44.624147');
INSERT INTO `django_session` VALUES ('dlselcyyw9p6jyk5ww7cbg809zkph4zr', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-20 19:40:59.551339');
INSERT INTO `django_session` VALUES ('dn70yurektldzxs6mej7pwrnzous8sao', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-05-25 11:33:11.364254');
INSERT INTO `django_session` VALUES ('dr73tmfffgt0dcx3bvgamgrs5fcoytio', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-22 19:07:04.797178');
INSERT INTO `django_session` VALUES ('droa3dk4au4q7eqylti2rcy4t3cvac9j', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-22 18:40:13.634690');
INSERT INTO `django_session` VALUES ('dtcekkkydjtm1qjlyil2jxa4be15mpja', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-09-29 21:13:16.808795');
INSERT INTO `django_session` VALUES ('ena4wgufmgz9xvyzteqrfaqtztiidc9t', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-07-22 11:09:41.718754');
INSERT INTO `django_session` VALUES ('er1jcnm4fb0hokoyh0gbskuatpnxwfxy', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-18 16:06:53.871551');
INSERT INTO `django_session` VALUES ('f9r9945bpzb1o9a0z01jk00fxq9nmpkx', 'ZTk4ZGFiYjUzNGI5NjlmMDNiOGI0ZGJhOTI5YjAxM2YzNDQyZTU2YTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmZmZmNTk0ZjZiYzgzNjRlNDIyMmViZjhiZWJmZTk3ZTI4ZTJiMSJ9', '2021-10-06 16:28:35.886642');
INSERT INTO `django_session` VALUES ('fay0tw87bjjdyfdr66hwntisked0ewtw', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-22 17:07:36.859727');
INSERT INTO `django_session` VALUES ('ffrtgi68h6irvdoh9444xw25uijfhd6m', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-01-18 18:42:53.523484');
INSERT INTO `django_session` VALUES ('fjkd3tdcda1roj2ivyiq74diziurpfxl', 'ZTJhNGZmYzIyZjg1ZGMwNWEwYjQ4YTI0ZmQ2OWNhNTZlOGVhY2U3NDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQzYmEzMWFlODBhZTFiYWRiOWYxZGI2MmJlOWE3MDg3N2IyOWQxMCJ9', '2021-08-20 11:40:17.886722');
INSERT INTO `django_session` VALUES ('g3pxxss1lcianh0z6i520h2wn9tbohfc', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-06-11 16:59:20.197331');
INSERT INTO `django_session` VALUES ('g599ezj7y7l45dyd3kft3lsh4q0rkz04', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-01-19 16:55:39.569261');
INSERT INTO `django_session` VALUES ('gbuw1r7ekks2zegh0dtyarmb9y0s3f0y', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-09-14 19:06:18.787490');
INSERT INTO `django_session` VALUES ('go5j3m0ju427fvdfhwl6qokwqje7je97', 'MWQxN2E2YmUzYzc1OTAyMTlkNTQ1NzZhODMyYTkxNGFlMmRhYzdlZTp7Il9hdXRoX3VzZXJfaWQiOiIxNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGViNTVjNTE1YTUyZGYwMTFlZTAxZGNkOWE2OGEyMDNkNDY5ZGY4YSJ9', '2021-03-29 21:29:39.968343');
INSERT INTO `django_session` VALUES ('gpgsm5vxo8xnskmestnma57irsda82bn', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-05-21 15:33:21.947727');
INSERT INTO `django_session` VALUES ('guuwquzl78qbnmj68zu7vsjgukz5o494', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-02-01 17:58:51.765440');
INSERT INTO `django_session` VALUES ('gv0qnuxsrh9g5wkw5l9lec1xo4y4petb', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-04-13 12:10:55.201070');
INSERT INTO `django_session` VALUES ('gz5fioz30svt9to5c7enaoz0ueqnrmzh', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-06-29 10:34:15.261765');
INSERT INTO `django_session` VALUES ('h5xpzd3eynay403n4xz6ft0mu3ci3zfi', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-04-05 11:16:12.936676');
INSERT INTO `django_session` VALUES ('hio62uxfzyynwxx57knrxdha0tw9suz0', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-07-19 17:45:30.279771');
INSERT INTO `django_session` VALUES ('hkblywxg3ygs3fbbkfwz5792ipzcuxq2', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-09-29 21:13:17.299751');
INSERT INTO `django_session` VALUES ('hkh4qrya5skwdgu60r37ifilxi4lpfp9', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-01-18 17:09:01.213483');
INSERT INTO `django_session` VALUES ('hq1xz81iqkpqw2idkt66hbt0m38funzt', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-18 16:48:04.195299');
INSERT INTO `django_session` VALUES ('ipc4qiaoqxm61zvyyqs4t9c48zmqxanu', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-06-25 23:49:23.691865');
INSERT INTO `django_session` VALUES ('ivauxfs4ep2ygdx1mefff955ogkrrmj8', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-19 18:28:03.171480');
INSERT INTO `django_session` VALUES ('iwazcp1cakvbqbknyveh9pffav5l6pun', 'ZTJhNGZmYzIyZjg1ZGMwNWEwYjQ4YTI0ZmQ2OWNhNTZlOGVhY2U3NDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQzYmEzMWFlODBhZTFiYWRiOWYxZGI2MmJlOWE3MDg3N2IyOWQxMCJ9', '2021-08-06 11:16:50.658165');
INSERT INTO `django_session` VALUES ('j4htqn3z679tur16q97nvqkcnj2htw85', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-07-22 09:40:09.988969');
INSERT INTO `django_session` VALUES ('j6u4846w3itkgcms3scex2nfrqdq5zfk', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-06-10 09:53:40.963821');
INSERT INTO `django_session` VALUES ('jm9jt6w8qmgf0i58g6otnrol2hxojbaa', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-10-11 15:31:32.390079');
INSERT INTO `django_session` VALUES ('jto53epvo37rbyusekgzhghgkvmuspdy', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-05-31 11:06:04.894852');
INSERT INTO `django_session` VALUES ('jwz3aoy4gg9pb26imjayfhrw3328ao70', 'MmQ5NzhiYTFmYmYzYzEzNTljZmM4NGNjNzFlYWIyZWFiMDU5NmQxNzp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNjkzYTA3Y2JmMmRhZjY5YjY5YmMyYjIwNjdjMjQ0NGZjYjYyZDExIn0=', '2021-01-18 16:47:39.131320');
INSERT INTO `django_session` VALUES ('kjkxgmuydttyir207fbwtg5mem7kgyvh', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-01-18 16:51:33.464296');
INSERT INTO `django_session` VALUES ('knbrqsmfy98h7356znb6il582yhwng3e', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-08-06 15:20:41.016616');
INSERT INTO `django_session` VALUES ('kpfs6jtzoc9171s1vpfp11liiwy2kam6', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-08-06 20:17:44.214170');
INSERT INTO `django_session` VALUES ('l1cia4xoemhvsq3su63oj47gegjuxjg8', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-01-18 18:58:45.384217');
INSERT INTO `django_session` VALUES ('l28cmi4c9rqqooxagr1o9om041oi6181', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-09-24 14:48:36.637046');
INSERT INTO `django_session` VALUES ('l4xfgo9unk5elp071xdczj8pikz6ko6j', 'ZmJlODU0YWJmMmY5YTY2OTcxZmFmODk2MmRhOTEzY2M5OTIwZDA3MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTdhMGRhMGFiNTBjZDU1YzI0N2JmMjZkNGQ4YTM1Nzg0YTM0OGYzZiJ9', '2021-01-19 12:16:06.346461');
INSERT INTO `django_session` VALUES ('lnvnp64xurbn9demuu716lnsqrb6zhd0', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-01-25 18:43:23.361787');
INSERT INTO `django_session` VALUES ('luuon3jq3wo0h04fvgji109y56lualuz', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-05-13 15:35:47.184459');
INSERT INTO `django_session` VALUES ('lx7bru3peulnsdvcq4uw8slvr0x0g2yt', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-07-15 18:17:18.587716');
INSERT INTO `django_session` VALUES ('m7740ug1rhyeoblkkfg5rjcp6qec4oqs', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-26 11:18:02.937454');
INSERT INTO `django_session` VALUES ('mex41ff02zkpp4qeqhqh8itmfqs42kox', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-22 19:07:04.781472');
INSERT INTO `django_session` VALUES ('mh3xj9qt3g756f06ulobjd1pfeefiwqw', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 18:57:50.508775');
INSERT INTO `django_session` VALUES ('mn0dq1o2jfndukwijel3ktpa11renmsh', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-04-30 18:37:12.441027');
INSERT INTO `django_session` VALUES ('mt152xjrmemy3wikwe0mz36bv2fytu31', 'ZTk4ZGFiYjUzNGI5NjlmMDNiOGI0ZGJhOTI5YjAxM2YzNDQyZTU2YTp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzlmZmZmNTk0ZjZiYzgzNjRlNDIyMmViZjhiZWJmZTk3ZTI4ZTJiMSJ9', '2021-10-06 16:24:59.664935');
INSERT INTO `django_session` VALUES ('n4wubf99irqya5vysui08nv2ooleug63', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-09-17 17:09:11.493567');
INSERT INTO `django_session` VALUES ('niigqmu4l4c47msdw68158zx8y11sbvv', 'NWJmNmMyZGY1OGQ5NDM4OGI3NjhjZWQ2ODY2ZjRmZjc4MDg1NTViMDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNjNzQxZDFmYjhmZTRlN2U5MDY4MzY4OTU4N2I3ZDgzOGZkMWM0ZiJ9', '2021-04-23 16:05:49.445704');
INSERT INTO `django_session` VALUES ('njmsfws2vcithjgplkmbzjsui6e0sc94', 'YWM3YjIyMWI3MTI1NDc2MTgxMmVkMDU5OGE1NzY4ZjE2YTg4YTUyNzp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTNkY2IxMzExMmM5YTJhMDYxYzlkNmNlOWExZTBhOWExN2U4NzI3NyJ9', '2021-02-09 09:14:30.283565');
INSERT INTO `django_session` VALUES ('nnntysbjuvykqaa1mqnzp9x5em2rbhkr', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-18 16:16:24.326150');
INSERT INTO `django_session` VALUES ('ofssua3e0tgotb11sjvxh7rmlcryc5qj', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-03-30 09:01:40.538479');
INSERT INTO `django_session` VALUES ('om0atj7j82zwb2wnzsfer7ape95lc8c7', 'ZmJlODU0YWJmMmY5YTY2OTcxZmFmODk2MmRhOTEzY2M5OTIwZDA3MTp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTdhMGRhMGFiNTBjZDU1YzI0N2JmMjZkNGQ4YTM1Nzg0YTM0OGYzZiJ9', '2021-01-19 12:31:51.285629');
INSERT INTO `django_session` VALUES ('oov6clqszo70a3k983dlsb381v1bdypg', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-19 23:07:42.645449');
INSERT INTO `django_session` VALUES ('ose7m679thshlrb9dptghxkh6nit5ebc', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-05-14 22:40:19.777512');
INSERT INTO `django_session` VALUES ('oyoipkfkcc5hjzjzdo2u8aubjndhw93w', 'NWJmNmMyZGY1OGQ5NDM4OGI3NjhjZWQ2ODY2ZjRmZjc4MDg1NTViMDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNjNzQxZDFmYjhmZTRlN2U5MDY4MzY4OTU4N2I3ZDgzOGZkMWM0ZiJ9', '2021-04-24 15:44:42.915022');
INSERT INTO `django_session` VALUES ('pcv3dyi4mrl0hawxaus5wmapwz0llean', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 15:24:08.109357');
INSERT INTO `django_session` VALUES ('pqwqe9ap81v2krkxfotpcump77gf6ytc', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-08-31 09:55:28.428537');
INSERT INTO `django_session` VALUES ('ps4pakz968ynx9bx3aboxctznno9tn6u', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-09-02 23:00:53.631446');
INSERT INTO `django_session` VALUES ('q8pmo68ln50wm05ggb6kffz6e3jndg2z', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-06-24 18:01:11.548197');
INSERT INTO `django_session` VALUES ('qb7eepxxvyqmlf1efwq73ajvicisl53g', 'NWJmNmMyZGY1OGQ5NDM4OGI3NjhjZWQ2ODY2ZjRmZjc4MDg1NTViMDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNjNzQxZDFmYjhmZTRlN2U5MDY4MzY4OTU4N2I3ZDgzOGZkMWM0ZiJ9', '2021-05-15 17:49:25.684847');
INSERT INTO `django_session` VALUES ('qctphgqddjhrb5tww92gj16veseuxv1e', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-08-06 11:15:57.603299');
INSERT INTO `django_session` VALUES ('qllul3gsska66bsggh0ns9bnbxfteo1y', 'Mjg0N2VmNmQ1NDIxNzNlZGNiYjdkZjVjMzVhMWQ4ZmY5ZmUxYzYxNDp7Il9hdXRoX3VzZXJfaWQiOiIxMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZGFlNmY5MmUyZWY5YzQ3NzQ2MDgzYzMzMDU0Y2VkN2ZhNTI1OTQwYiJ9', '2021-03-29 20:33:51.768697');
INSERT INTO `django_session` VALUES ('qn7wqc4ebq02zfbxwfagqr7k0fia9cig', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-18 11:59:22.564120');
INSERT INTO `django_session` VALUES ('qnjryrkcmtvvb9n2zwo4it0565i07532', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-07-21 16:42:31.175037');
INSERT INTO `django_session` VALUES ('qu3m56pbi8px1ug4zqrwfswsy2vs32mg', 'YTU5OTlkYmE1MTVkMDMzNmQ2YTVlODhiMmI1NTU5ZGZmZWY4YTQxMzp7Il9hdXRoX3VzZXJfaWQiOiIxNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiODhkMDIxNGU3MjdkYjM5N2M4YjQ1MWYyMWNlY2IwNjk1NDU0ZjUwMSJ9', '2021-08-22 22:19:03.540220');
INSERT INTO `django_session` VALUES ('qy484ns9256e1imhtlqr5naebyoy70c5', 'NThiMDgwMDVmNWUwOWVkMDgzNDBlYTBlOGUzNjRiZGZjZjZhMmVkOTp7Il9hdXRoX3VzZXJfaWQiOiIxOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWQ4OTU3ZTE0N2EwYmNlMDRjMDJhYTlmMDE4MDZlNTYyMGE5MWU1YyJ9', '2021-01-22 18:45:46.774064');
INSERT INTO `django_session` VALUES ('rgznygyggtx388chtzv192xwcv8w88cc', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-02-13 14:15:39.834996');
INSERT INTO `django_session` VALUES ('rrlcynjis88kr78rm1tqsprlav354wn2', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-08-16 16:48:23.427636');
INSERT INTO `django_session` VALUES ('s5s5rur1lt9wbm3e4vuughowbzmgywbr', 'ZjliZmNlNDlkMmI1YWI2Y2U5MWVlNjAzNDBjNDhiYjY4YjI3ZTg1MDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODdmODJkNDU5OGMwMzZlZTg3ZDQ4ZWU5YjhiYjQ3ZDI3YWEzY2QxIn0=', '2021-01-18 16:48:41.446632');
INSERT INTO `django_session` VALUES ('se4xcpo6oqotxzqnwec0kp8uadxv0umg', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-01-20 14:14:36.691982');
INSERT INTO `django_session` VALUES ('slh7aigmdsa6r2sgdv6vvyu8wditxkua', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-01-19 11:08:26.542548');
INSERT INTO `django_session` VALUES ('ss6h8iewgpz7kaqcdi28s29mv0bia47u', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-10-02 16:04:27.092566');
INSERT INTO `django_session` VALUES ('t1ae8tab8aupsxsj4fhc0gqcgud9zqsy', 'ZjliZmNlNDlkMmI1YWI2Y2U5MWVlNjAzNDBjNDhiYjY4YjI3ZTg1MDp7Il9hdXRoX3VzZXJfaWQiOiI4IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkODdmODJkNDU5OGMwMzZlZTg3ZDQ4ZWU5YjhiYjQ3ZDI3YWEzY2QxIn0=', '2021-01-18 16:50:05.619304');
INSERT INTO `django_session` VALUES ('t1wy1krv3b1uyze6tiluuq7gswlkdabz', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-07-10 17:12:35.129976');
INSERT INTO `django_session` VALUES ('ta1j9bj9ofaw7nb1ilek7dpxililmrk9', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-01-19 15:35:48.685725');
INSERT INTO `django_session` VALUES ('tlk89bgr3ll04vz6dav7xsf241np1iri', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-07-26 22:27:39.196683');
INSERT INTO `django_session` VALUES ('tqjsiosl9wko6d8ljklnej1i9c00u5ff', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-07-22 16:13:11.481874');
INSERT INTO `django_session` VALUES ('twuqey8inax8pzlgr503t11id9fwdc0g', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-18 16:21:03.030262');
INSERT INTO `django_session` VALUES ('tzxwxvveeaujrqw7hhi5d4iq9aclnj7s', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 14:28:10.862749');
INSERT INTO `django_session` VALUES ('u63il5c0tojds8twwcy0qvt6m42yp0rp', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-08-31 11:40:28.595762');
INSERT INTO `django_session` VALUES ('u6v5556gxj9o8xbflzvmt9vnjz2zfqg5', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-10-01 10:29:52.697102');
INSERT INTO `django_session` VALUES ('u8tlbdxw0oji97o0o6cn3m0qc248rfuk', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-08-03 19:40:29.406222');
INSERT INTO `django_session` VALUES ('uar3qopvrqsa6aqv30nxghpss8uq1xmi', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-04-02 17:11:43.870194');
INSERT INTO `django_session` VALUES ('ucwvsmrvq2o2jwzez3vkpggwxodiijg3', 'ZTJhNGZmYzIyZjg1ZGMwNWEwYjQ4YTI0ZmQ2OWNhNTZlOGVhY2U3NDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQzYmEzMWFlODBhZTFiYWRiOWYxZGI2MmJlOWE3MDg3N2IyOWQxMCJ9', '2021-10-12 19:17:25.147371');
INSERT INTO `django_session` VALUES ('ue4jjknjreql85hi9bn4ufclg0f4d71h', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-07-31 10:44:17.028690');
INSERT INTO `django_session` VALUES ('umiwb73ijjsthrkrf5kmnyorwve3i89a', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-09-23 16:50:44.349655');
INSERT INTO `django_session` VALUES ('uus4tm8z5lszdhl2uqphlz1evmefjhoc', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-19 16:56:10.522741');
INSERT INTO `django_session` VALUES ('v3qro747smq85rnr8rh4739zkon6je9w', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-05-10 00:29:28.481685');
INSERT INTO `django_session` VALUES ('v5s4cjsylxzd0giwyq3hg81tdhnrk981', 'ZmQ0MmFiYmRiNzdkM2VjNDUyMTA5OWYyNjA5MDJjNmQyZWNiM2EwYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZmIxYWZjMTc1NzAxMGUyYTZlNzYwNGVhODRmOGVjZmRjZGVlMDJjIn0=', '2021-01-18 16:08:15.118514');
INSERT INTO `django_session` VALUES ('vb7v7iz3pee73ytvpv0aqsn570e9ohwi', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-05-24 10:11:41.431221');
INSERT INTO `django_session` VALUES ('ve82dqj5ct1a82zryp0felxi1lbuk5xm', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-09-27 16:11:59.251710');
INSERT INTO `django_session` VALUES ('vmi7iqvqqtkq5hp2js6pkqj38lwp1hs0', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 18:57:32.153216');
INSERT INTO `django_session` VALUES ('vsh8mfhzueod9o0mt6rdh8ek4nzd2ckj', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-09-29 10:03:53.526880');
INSERT INTO `django_session` VALUES ('w376nwq6qiezkhgx0mtjaa4i9zjuda5k', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-02-06 11:12:57.749890');
INSERT INTO `django_session` VALUES ('wdajobxupsgqbt3hi86wl05mbdyunwxh', 'MzE4NzE0YmUwZjNjYjRiNmJmZmZmOWVkNmU0ZjRmYTdmYjUyNDg1MTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1NTEwY2M5ZjNlZWVhNjU4Y2VkNjc1NzBkZmZhNzE0YjE5YTBkNzZhIn0=', '2021-01-25 19:00:23.961810');
INSERT INTO `django_session` VALUES ('wlzvdjr1ogdic1ijir63gugavhyfssrg', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-09-27 16:09:21.555418');
INSERT INTO `django_session` VALUES ('wzwbuhxidylvpc5ee130bhjyw29z8jdz', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-05-28 11:17:25.075343');
INSERT INTO `django_session` VALUES ('x05jh7fcrkmbxdfruics1eeu0m3bhryd', 'OTg5MDY1MjVhYjI5ZDczMzA3NDE5YWZhN2YxYmY1ZDYwMTAyYWQyZTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjY0YTNmZjg0ZmRjNGQ1MTM3Mzg1MjMxMzQ4Njc1M2FhYTU4MThiNSJ9', '2021-05-07 16:30:09.256727');
INSERT INTO `django_session` VALUES ('x303tvk9wufitpnqaw9aekd2rd4n9cej', 'Y2Q4OGY2Njc4NjFmOGRhNTI3MTQwMWVkZDEwMjhhOGI3YWFiZmYyYzp7Il9hdXRoX3VzZXJfaWQiOiIyMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGVhYWJjMWY1OTVjMzBkZGE3MDkzZmNhOWM4YWJhMTk2ZjMwOTJkYyJ9', '2021-10-06 16:23:45.351766');
INSERT INTO `django_session` VALUES ('x6nhxio6dp12h1hxhjpj1nglhkh77iqj', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-04-27 17:37:54.320852');
INSERT INTO `django_session` VALUES ('xjzqtffr80z5c19amfvi36hiw6n0h8sa', 'M2IzZjIwOWY0NTE1NTU5ZGZmOTdhMDIzODJlODBhZWViMzUyNzdmYjp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjMGIyYmE2OTg2ZGYzMGNkNWVlMDE3MGRhYmQ5YmQxYjkxNDE0MjEyIn0=', '2021-04-16 11:57:43.329640');
INSERT INTO `django_session` VALUES ('xtq0mxt5fw9ojcgjue4vx67yay0o896h', 'OTQxYjdjOGQxMGFjYjkyMTQ0ZTE5ODY2YzdhYWExZjczMjYyMTFmMjp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMDZmMDFkNWMxNzMyZDk4ZGVkZTU5ZTA1NDgxMDcwYWE0YjUyMDRlNSJ9', '2021-01-20 16:43:11.139502');
INSERT INTO `django_session` VALUES ('yaf1l8umh1m40rb1ok5gdzltla3mv62h', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-02-04 23:19:12.456653');
INSERT INTO `django_session` VALUES ('yb53u8vx8rw0zgtp74fiouikege6f5ki', 'ZTJhNGZmYzIyZjg1ZGMwNWEwYjQ4YTI0ZmQ2OWNhNTZlOGVhY2U3NDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQzYmEzMWFlODBhZTFiYWRiOWYxZGI2MmJlOWE3MDg3N2IyOWQxMCJ9', '2021-07-21 09:45:29.920855');
INSERT INTO `django_session` VALUES ('yc78yey2alrvixbd64xop39yjsziheja', 'NWJmNmMyZGY1OGQ5NDM4OGI3NjhjZWQ2ODY2ZjRmZjc4MDg1NTViMDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNDNjNzQxZDFmYjhmZTRlN2U5MDY4MzY4OTU4N2I3ZDgzOGZkMWM0ZiJ9', '2021-04-02 17:11:29.020452');
INSERT INTO `django_session` VALUES ('zb5zaiankry2r3rq333wovf49bt6z18v', 'YzMyNmQ0YTAyZTVlNjk2MTQzZDY1YjgzZDM5MmEzYTkyNjU4MTIzZDp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMmFjNjFmYThiNTEzOGIxZWExYzI2NzA0ZDcxM2NkMDEwMTIzMGQ1In0=', '2021-04-27 15:07:14.915611');
INSERT INTO `django_session` VALUES ('zfnd0ukgzd2sfqlwucwdxmpei63a931z', 'OWVjZGMwYWNlYzAxMWVjMDBlOWIxY2E0ZmJhZTNkNmI1ODU5MWU2Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3OGVhYjQzYmE1ZmJjZmE5M2M2MGJhZmRjMmZhMDk1OTcxODY5NTk2In0=', '2021-09-14 15:39:00.370443');
INSERT INTO `django_session` VALUES ('zksqoriq3bnf9phutfv1njyzmtem2qco', 'MWU2YTdlZTViYzU4YTdiZTYzY2FiZDUxMGM0NzRkZjc2YjkxMWIzMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2M2Q2YzIwYjY0MTQ5MjQ1ZTlmMTU4YTFlZjdhOGM4MGJhMzcyOTdiIn0=', '2021-01-20 19:49:01.542753');
INSERT INTO `django_session` VALUES ('zutni79l67esvtsfo0i5fbutd2gfww75', 'ZTJhNGZmYzIyZjg1ZGMwNWEwYjQ4YTI0ZmQ2OWNhNTZlOGVhY2U3NDp7Il9hdXRoX3VzZXJfaWQiOiIxOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjQzYmEzMWFlODBhZTFiYWRiOWYxZGI2MmJlOWE3MDg3N2IyOWQxMCJ9', '2021-09-08 14:13:24.439755');

-- ----------------------------
-- Table structure for web_companyinfo
-- ----------------------------
DROP TABLE IF EXISTS `web_companyinfo`;
CREATE TABLE `web_companyinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_companyinfo
-- ----------------------------
INSERT INTO `web_companyinfo` VALUES (1, '其他');
INSERT INTO `web_companyinfo` VALUES (3, '艾伯泰科');
INSERT INTO `web_companyinfo` VALUES (4, '有康');
INSERT INTO `web_companyinfo` VALUES (5, '溶海华康');
INSERT INTO `web_companyinfo` VALUES (6, '康博瑞');
INSERT INTO `web_companyinfo` VALUES (7, '爱博泰克');
INSERT INTO `web_companyinfo` VALUES (8, '成都金线科技');
INSERT INTO `web_companyinfo` VALUES (9, '武汉艾博');
INSERT INTO `web_companyinfo` VALUES (10, '毕奥图');
INSERT INTO `web_companyinfo` VALUES (11, '成都海曦');
INSERT INTO `web_companyinfo` VALUES (12, '海门永和');
INSERT INTO `web_companyinfo` VALUES (13, '\"成都海曦	2箱\"');
INSERT INTO `web_companyinfo` VALUES (14, '佩晨子');
INSERT INTO `web_companyinfo` VALUES (15, '微克天泰');
INSERT INTO `web_companyinfo` VALUES (16, '信标生物');
INSERT INTO `web_companyinfo` VALUES (17, '武汉三鹰');
INSERT INTO `web_companyinfo` VALUES (18, '宝科生物');
INSERT INTO `web_companyinfo` VALUES (19, '奥克');
INSERT INTO `web_companyinfo` VALUES (20, '百汇科创');
INSERT INTO `web_companyinfo` VALUES (21, '晟百诺');
INSERT INTO `web_companyinfo` VALUES (22, '成都派克生物公司');
INSERT INTO `web_companyinfo` VALUES (23, '正能');
INSERT INTO `web_companyinfo` VALUES (24, '成都正能生物');
INSERT INTO `web_companyinfo` VALUES (25, '擎科');
INSERT INTO `web_companyinfo` VALUES (26, '佳仕杰');
INSERT INTO `web_companyinfo` VALUES (27, '成都微时空生物科技有限公司');
INSERT INTO `web_companyinfo` VALUES (28, '成都艺萌');
INSERT INTO `web_companyinfo` VALUES (29, '诺唯真');
INSERT INTO `web_companyinfo` VALUES (30, '欣亿维');
INSERT INTO `web_companyinfo` VALUES (31, '成都硕博精英科技有限公司');
INSERT INTO `web_companyinfo` VALUES (32, '生工');
INSERT INTO `web_companyinfo` VALUES (33, '康百德');
INSERT INTO `web_companyinfo` VALUES (34, '灭菌条');
INSERT INTO `web_companyinfo` VALUES (35, '翊圣');
INSERT INTO `web_companyinfo` VALUES (36, 'bimake');
INSERT INTO `web_companyinfo` VALUES (37, '豪乙生物');
INSERT INTO `web_companyinfo` VALUES (38, '手套中号');
INSERT INTO `web_companyinfo` VALUES (39, 'Takara');
INSERT INTO `web_companyinfo` VALUES (40, '诺维赞');
INSERT INTO `web_companyinfo` VALUES (41, '吉马基因');
INSERT INTO `web_companyinfo` VALUES (42, '吉玛基因');
INSERT INTO `web_companyinfo` VALUES (43, '达硕');
INSERT INTO `web_companyinfo` VALUES (44, 'selleck');
INSERT INTO `web_companyinfo` VALUES (45, '陶术');
INSERT INTO `web_companyinfo` VALUES (46, '佩晨');
INSERT INTO `web_companyinfo` VALUES (47, '维奥鑫城');
INSERT INTO `web_companyinfo` VALUES (48, '金沙生物');
INSERT INTO `web_companyinfo` VALUES (49, '赛默飞');

-- ----------------------------
-- Table structure for web_dutyitem
-- ----------------------------
DROP TABLE IF EXISTS `web_dutyitem`;
CREATE TABLE `web_dutyitem`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order` smallint(0) NOT NULL,
  `table_id` int(0) NOT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_dutyitem_table_id_5fdc26a1_fk_web_dutytable_id`(`table_id`) USING BTREE,
  INDEX `web_dutyitem_user_id_1e3ff019_fk_web_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `web_dutyitem_table_id_5fdc26a1_fk_web_dutytable_id` FOREIGN KEY (`table_id`) REFERENCES `web_dutytable` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_dutyitem_user_id_1e3ff019_fk_web_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_dutytable
-- ----------------------------
DROP TABLE IF EXISTS `web_dutytable`;
CREATE TABLE `web_dutytable`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `duty_type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `sep_weeks` smallint(0) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_geneinfo
-- ----------------------------
DROP TABLE IF EXISTS `web_geneinfo`;
CREATE TABLE `web_geneinfo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `species` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `web_geneinfo_name_species_0ffef94b_uniq`(`name`, `species`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_geneinfo
-- ----------------------------
INSERT INTO `web_geneinfo` VALUES (103, '1000-NDUFV1', 'Human');
INSERT INTO `web_geneinfo` VALUES (105, '300-NDUFV1', 'Human');
INSERT INTO `web_geneinfo` VALUES (20, '330-5\'UTR', '人类');
INSERT INTO `web_geneinfo` VALUES (58, '330Mut F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (36, '330Q-FR', '人类');
INSERT INTO `web_geneinfo` VALUES (34, '330RTmRNA', '人类');
INSERT INTO `web_geneinfo` VALUES (39, '36B4 u/d', '人类');
INSERT INTO `web_geneinfo` VALUES (104, '600-NDUFV1', 'Human');
INSERT INTO `web_geneinfo` VALUES (59, '642 Mut F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (21, '642a-5’UTR', '人类');
INSERT INTO `web_geneinfo` VALUES (37, '642Q-FR', '人类');
INSERT INTO `web_geneinfo` VALUES (35, '642RTmRNA', '人类');
INSERT INTO `web_geneinfo` VALUES (87, 'ACSM3', '人源');
INSERT INTO `web_geneinfo` VALUES (51, 'AKAP1-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (111, 'AMPK', '涡虫');
INSERT INTO `web_geneinfo` VALUES (102, 'ATF2', '人');
INSERT INTO `web_geneinfo` VALUES (63, 'ATF2', '人类');
INSERT INTO `web_geneinfo` VALUES (123, 'AURKA', '涡虫');
INSERT INTO `web_geneinfo` VALUES (112, 'b-catenin', '人');
INSERT INTO `web_geneinfo` VALUES (101, 'BDNF F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (134, 'BMC', '人');
INSERT INTO `web_geneinfo` VALUES (132, 'BMC-F', 'human');
INSERT INTO `web_geneinfo` VALUES (133, 'BMC-H-F1', '人');
INSERT INTO `web_geneinfo` VALUES (91, 'BMC/HC', 'human');
INSERT INTO `web_geneinfo` VALUES (93, 'BMC/HC&LC', 'human');
INSERT INTO `web_geneinfo` VALUES (92, 'BMC/LC', 'human');
INSERT INTO `web_geneinfo` VALUES (78, 'BRD4', '涡虫');
INSERT INTO `web_geneinfo` VALUES (27, 'c-Myc', '人类');
INSERT INTO `web_geneinfo` VALUES (15, 'CAPN6', '人类');
INSERT INTO `web_geneinfo` VALUES (5, 'CAPN6-3xFLAG', '人类');
INSERT INTO `web_geneinfo` VALUES (61, 'Cat-colF/R', '人类');
INSERT INTO `web_geneinfo` VALUES (95, 'CD44', '人');
INSERT INTO `web_geneinfo` VALUES (73, 'cdc25a', 'human');
INSERT INTO `web_geneinfo` VALUES (128, 'CLCN7', '人');
INSERT INTO `web_geneinfo` VALUES (1, 'CO1', '人类');
INSERT INTO `web_geneinfo` VALUES (126, 'CTSD', '人');
INSERT INTO `web_geneinfo` VALUES (97, 'CYCLIND1', '人');
INSERT INTO `web_geneinfo` VALUES (2, 'dhfr', '人类');
INSERT INTO `web_geneinfo` VALUES (79, 'DjBRD4', '涡虫');
INSERT INTO `web_geneinfo` VALUES (81, 'DjBRD4（T7引物）', '涡虫');
INSERT INTO `web_geneinfo` VALUES (147, 'DjCHAT', '涡虫');
INSERT INTO `web_geneinfo` VALUES (148, 'DjGAD', '涡虫');
INSERT INTO `web_geneinfo` VALUES (149, 'Djglutaminase', '涡虫');
INSERT INTO `web_geneinfo` VALUES (47, 'Djlnhba', '人类');
INSERT INTO `web_geneinfo` VALUES (151, 'DjPC2', '涡虫');
INSERT INTO `web_geneinfo` VALUES (44, 'DjSTAT3-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (150, 'Djsyt', '涡虫');
INSERT INTO `web_geneinfo` VALUES (145, 'DjTBH', '涡虫');
INSERT INTO `web_geneinfo` VALUES (144, 'DjTH', '涡虫');
INSERT INTO `web_geneinfo` VALUES (146, 'DjTPH', '涡虫');
INSERT INTO `web_geneinfo` VALUES (80, 'Djβ-actin', '涡虫');
INSERT INTO `web_geneinfo` VALUES (60, 'Dog-colF/R', '人类');
INSERT INTO `web_geneinfo` VALUES (82, 'DRB', '人类');
INSERT INTO `web_geneinfo` VALUES (109, 'DRP1', 'human');
INSERT INTO `web_geneinfo` VALUES (124, 'drp1', '涡虫');
INSERT INTO `web_geneinfo` VALUES (108, 'DRP1 promoter', '人类');
INSERT INTO `web_geneinfo` VALUES (67, 'E-CAD', 'HUMAN');
INSERT INTO `web_geneinfo` VALUES (66, 'e-cad/n/cad/slug/twist1/snail/p21/cdc25a', 'homo');
INSERT INTO `web_geneinfo` VALUES (84, 'eGFP', '报告基因');
INSERT INTO `web_geneinfo` VALUES (157, 'EMD', '人');
INSERT INTO `web_geneinfo` VALUES (106, 'EMD-EGFP', '人');
INSERT INTO `web_geneinfo` VALUES (28, 'EpCAM', '人类');
INSERT INTO `web_geneinfo` VALUES (11, 'F81', '人类');
INSERT INTO `web_geneinfo` VALUES (117, 'FIS1', '人');
INSERT INTO `web_geneinfo` VALUES (158, 'FLP', 'pOG44');
INSERT INTO `web_geneinfo` VALUES (155, 'FRT', 'CHO');
INSERT INTO `web_geneinfo` VALUES (131, 'GLA', '人');
INSERT INTO `web_geneinfo` VALUES (55, 'GLIPRILI-T7', '人类');
INSERT INTO `web_geneinfo` VALUES (74, 'IFNB1', '人类');
INSERT INTO `web_geneinfo` VALUES (89, 'JNK1/2', 'Homo sapiens (human)');
INSERT INTO `web_geneinfo` VALUES (65, 'lacz', 'CHO');
INSERT INTO `web_geneinfo` VALUES (64, 'lacz', '人类');
INSERT INTO `web_geneinfo` VALUES (115, 'lacz探针', 'CHO');
INSERT INTO `web_geneinfo` VALUES (129, 'LAMP1', '人');
INSERT INTO `web_geneinfo` VALUES (114, 'LKB1', '涡虫');
INSERT INTO `web_geneinfo` VALUES (57, 'LKBI-T7', '人类');
INSERT INTO `web_geneinfo` VALUES (90, 'luc2', '报告基因');
INSERT INTO `web_geneinfo` VALUES (43, 'LUC2-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (127, 'MCOLN1', '人');
INSERT INTO `web_geneinfo` VALUES (12, 'MDCK', '人类');
INSERT INTO `web_geneinfo` VALUES (119, 'MFN1', '人');
INSERT INTO `web_geneinfo` VALUES (110, 'MID49', 'human');
INSERT INTO `web_geneinfo` VALUES (77, 'mir-15a-5p inhibitor', '人');
INSERT INTO `web_geneinfo` VALUES (140, 'miR-653-3p', 'Human');
INSERT INTO `web_geneinfo` VALUES (139, 'miR105-5p', 'Human');
INSERT INTO `web_geneinfo` VALUES (94, 'MYC', '人');
INSERT INTO `web_geneinfo` VALUES (68, 'N-CAD', 'human');
INSERT INTO `web_geneinfo` VALUES (26, 'Nanog', '人类');
INSERT INTO `web_geneinfo` VALUES (32, 'NCFI F', '人类');
INSERT INTO `web_geneinfo` VALUES (33, 'NCFI R', '人类');
INSERT INTO `web_geneinfo` VALUES (49, 'NDUFV1-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (45, 'New-EGRP-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (46, 'New-L-R/F', '人类');
INSERT INTO `web_geneinfo` VALUES (22, 'NHEI330-5P F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (23, 'NHEI642-5P F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (16, 'NLK', '人类');
INSERT INTO `web_geneinfo` VALUES (100, 'NLK', '涡虫');
INSERT INTO `web_geneinfo` VALUES (56, 'NLK-T7', '人类');
INSERT INTO `web_geneinfo` VALUES (98, 'NLK-T7', '涡虫');
INSERT INTO `web_geneinfo` VALUES (76, 'NRF1', 'Human');
INSERT INTO `web_geneinfo` VALUES (107, 'NRF1-sh1-F', '人类');
INSERT INTO `web_geneinfo` VALUES (24, 'OCT4', '人类');
INSERT INTO `web_geneinfo` VALUES (118, 'OPA1', '人');
INSERT INTO `web_geneinfo` VALUES (42, 'OraTI-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (122, 'ovo', '涡虫');
INSERT INTO `web_geneinfo` VALUES (72, 'P21', 'human');
INSERT INTO `web_geneinfo` VALUES (121, 'p38', '涡虫');
INSERT INTO `web_geneinfo` VALUES (159, 'PCBP2', '人类');
INSERT INTO `web_geneinfo` VALUES (125, 'PDK1', '涡虫');
INSERT INTO `web_geneinfo` VALUES (153, 'PES1', '人源');
INSERT INTO `web_geneinfo` VALUES (120, 'PKA基因', '涡虫');
INSERT INTO `web_geneinfo` VALUES (156, 'plenti-EMD-F', '人');
INSERT INTO `web_geneinfo` VALUES (88, 'PLK1', 'Homo sapiens (human)');
INSERT INTO `web_geneinfo` VALUES (113, 'Plk1', '（Dugesia japonica）');
INSERT INTO `web_geneinfo` VALUES (3, 'pLKO-RFG/SIRT4', '人类');
INSERT INTO `web_geneinfo` VALUES (7, 'PMD-19-330', '人类');
INSERT INTO `web_geneinfo` VALUES (8, 'PMD-19-642', '人类');
INSERT INTO `web_geneinfo` VALUES (83, 'pmirGLO', 'human');
INSERT INTO `web_geneinfo` VALUES (4, 'pmriGLO', '人类');
INSERT INTO `web_geneinfo` VALUES (9, 'pmriGLO-330', '人类');
INSERT INTO `web_geneinfo` VALUES (18, 'pmriGLO-330FL-10', '人类');
INSERT INTO `web_geneinfo` VALUES (17, 'pmriGLO-330FL-6', '人类');
INSERT INTO `web_geneinfo` VALUES (10, 'pmriGLO-642', '人类');
INSERT INTO `web_geneinfo` VALUES (19, 'pmriGLO-mut-8-330', '人类');
INSERT INTO `web_geneinfo` VALUES (99, 'poul4', '涡虫');
INSERT INTO `web_geneinfo` VALUES (31, 'PPP3CA-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (136, 'QP-PLK1', 'planarian');
INSERT INTO `web_geneinfo` VALUES (54, 'QP-RFC2', '人类');
INSERT INTO `web_geneinfo` VALUES (53, 'QP-SIRT4', '人类');
INSERT INTO `web_geneinfo` VALUES (86, 'RAB35', '人类');
INSERT INTO `web_geneinfo` VALUES (62, 'Rat-colF/R', '人类');
INSERT INTO `web_geneinfo` VALUES (6, 'RFG-UTR/SIRT4-UTR', '人类');
INSERT INTO `web_geneinfo` VALUES (50, 'SDHA-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (40, 'SERCA2-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (154, 'shPCBP2', '人类');
INSERT INTO `web_geneinfo` VALUES (137, 'SIRT1', 'Human');
INSERT INTO `web_geneinfo` VALUES (141, 'sirt1', '涡虫');
INSERT INTO `web_geneinfo` VALUES (152, 'sirt1-wish', '涡虫');
INSERT INTO `web_geneinfo` VALUES (29, 'SIRT4 RFG3\'UTR', '人类');
INSERT INTO `web_geneinfo` VALUES (14, 'SIRT4-PCDNA3.1', '人类');
INSERT INTO `web_geneinfo` VALUES (52, 'SIRT4-R', '人类');
INSERT INTO `web_geneinfo` VALUES (38, 'SIRT4-XhOI', '人类');
INSERT INTO `web_geneinfo` VALUES (69, 'SLUG', 'human');
INSERT INTO `web_geneinfo` VALUES (71, 'SNAI', 'human');
INSERT INTO `web_geneinfo` VALUES (25, 'SOX', '人类');
INSERT INTO `web_geneinfo` VALUES (135, 'SPAG9（JLP）', 'Homo sapiens (human)]');
INSERT INTO `web_geneinfo` VALUES (41, 'STIMI-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (142, 'SURVIVIN', '人');
INSERT INTO `web_geneinfo` VALUES (138, 'TAF2', 'Human');
INSERT INTO `web_geneinfo` VALUES (96, 'TCF4', '人');
INSERT INTO `web_geneinfo` VALUES (130, 'TPP1', '人');
INSERT INTO `web_geneinfo` VALUES (70, 'TWIST', 'human');
INSERT INTO `web_geneinfo` VALUES (85, 'TXN2', '人类');
INSERT INTO `web_geneinfo` VALUES (143, 'U6', 'Human');
INSERT INTO `web_geneinfo` VALUES (48, 'UQ-F/R', '人类');
INSERT INTO `web_geneinfo` VALUES (75, 'UQCRC1', 'Human');
INSERT INTO `web_geneinfo` VALUES (30, 'XbaI NheI', '人类');
INSERT INTO `web_geneinfo` VALUES (13, 'XF', '人类');
INSERT INTO `web_geneinfo` VALUES (116, 'β-actin', 'CHO');

-- ----------------------------
-- Table structure for web_goodsdetail
-- ----------------------------
DROP TABLE IF EXISTS `web_goodsdetail`;
CREATE TABLE `web_goodsdetail`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brand` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `specification` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CAS_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `web_goodsdetail_name_brand_29182540_uniq`(`name`, `brand`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_goodsdetail
-- ----------------------------
INSERT INTO `web_goodsdetail` VALUES (1, '培养皿', '50mm', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (2, 'snd1抗体', '艾伯泰科', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (3, '血清', '溶海华康', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (4, '血清', 'Excell', '3瓶', NULL);
INSERT INTO `web_goodsdetail` VALUES (5, 'IMDM培养基', 'Gibco', '500ml/瓶', NULL);
INSERT INTO `web_goodsdetail` VALUES (6, 'DMEM培养基', 'Hyclone', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (7, '转染试剂', 'Higene', '2ml', NULL);
INSERT INTO `web_goodsdetail` VALUES (8, 'FLAG-IP磁珠', 'Bimake', '1ml', NULL);
INSERT INTO `web_goodsdetail` VALUES (9, '质粒提取试剂盒', '天根', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (10, '96孔板', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (11, '小号手套', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (12, '6孔板', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (13, '15ml离心管', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (14, '50ml离心管', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (15, '6cm皿', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (16, '1.5ml离心管', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (17, '冻存管', 'NEST', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (18, '反转录试剂盒', 'Takara', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (19, 'Trizol', 'Takara', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (20, 'BamH1 内切酶', ' Thermo', '800μl', NULL);
INSERT INTO `web_goodsdetail` VALUES (21, '0.22μm过滤膜', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (22, '细菌培养板', 'NEST', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (23, 'NheI 内切酶 ', 'Thermo', '50μl', NULL);
INSERT INTO `web_goodsdetail` VALUES (24, 'T4连接酶', 'Takara', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (25, 'STRT1 Antibody', 'Proteintech', '50μl', NULL);
INSERT INTO `web_goodsdetail` VALUES (26, 'qPCR管', 'Nest', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (27, 'Triton-X-100', 'Biofrox', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (28, 'HT-Supplement', 'Gibco', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (29, 'CD CHO Medium', 'Gibco', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (30, '异丙醇', '科隆', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (31, 'QPCR Mix', '诺唯真', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (32, '84消毒液', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (33, '泡腾片', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (34, 'DMEM培养基', 'Gibco', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (35, '200ul黄枪头', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (36, '1ml枪头', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (37, '荧光二抗（R）红色', '正能', '1ml', NULL);
INSERT INTO `web_goodsdetail` VALUES (38, '粪便DNA提取试剂盒', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (39, '6cm细胞培养皿', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (40, '双抗', '浩特', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (41, '胰酶', 'Hyclone', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (42, 'β-LacZ检测试剂盒', '默认', '', NULL);
INSERT INTO `web_goodsdetail` VALUES (43, 'PVDF', '默认', '0.45μm', NULL);
INSERT INTO `web_goodsdetail` VALUES (44, 'minz', 'aaa', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (45, 'Fetal Bovine Serium 南美血清', 'Excell', '500ml/瓶', 'PSP500');
INSERT INTO `web_goodsdetail` VALUES (46, '涡虫神经系统免疫组化抗体3C11 (anti SYNORF1)', 'DSHB', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (47, '胎牛血清', 'Excell', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (48, '3C11 (anti SYNORF1)', 'DSHB', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (49, 'FITC（鼠抗）', '正能', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (50, 'WB蛋白Maker', 'Bio-Rad', '500ul/管', NULL);
INSERT INTO `web_goodsdetail` VALUES (51, 'IFNB（β干扰素）ELISA试剂盒', '酶免', '96T', NULL);
INSERT INTO `web_goodsdetail` VALUES (52, 'CTAB', '麦克林', '100g/瓶', '57-09-0');
INSERT INTO `web_goodsdetail` VALUES (53, '手套小号和中号', '海门市永和', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (54, '细胞培养皿6cm', '成都海曦', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (55, '10cm细胞培养皿', '浩特', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (56, '中号和小号手套', '施瑞康', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (57, 'anti-digoxigenin-Fluorescein', 'roche', '200ug', NULL);
INSERT INTO `web_goodsdetail` VALUES (58, 'Bcul（SpeⅠ）内切酶', 'ThermoFisher', '40ul', NULL);
INSERT INTO `web_goodsdetail` VALUES (59, 'speⅠ', 'takra', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (60, 'IMDM培养基', 'Hyclone', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (61, '细胞核质分离试剂盒', '碧云天', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (62, '甲氨蝶呤MTX', 'solarbio', NULL, '59-05-2');
INSERT INTO `web_goodsdetail` VALUES (63, 'Goat Anti-Rabbit IgG (H&L) FITC', '正能', '100ul', NULL);
INSERT INTO `web_goodsdetail` VALUES (64, 'beta Catenin Rabbit mAb', 'R22820', '50ul', NULL);
INSERT INTO `web_goodsdetail` VALUES (65, 'PCR-MIX高保真', '康为世纪', '10ml', 'CW2965');
INSERT INTO `web_goodsdetail` VALUES (66, 'L-蛋氨酸磺酸盐（MSX）', '源叶', '50mg', NULL);
INSERT INTO `web_goodsdetail` VALUES (67, '胶回收试剂盒', '擎科生物', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (68, '一次性手套', '塑料', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (69, '共聚焦培养皿', '3', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (70, '共聚焦培养皿', 'con', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (71, 'beta Catenin (7E2) Mouse mAb', '250110', '50ul', NULL);
INSERT INTO `web_goodsdetail` VALUES (72, 'EMD-EGFP', '无', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (73, 'EMD-EGFP', 'no', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (74, '感受态', '擎科', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (75, '双荧光素试剂盒', 'promega', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (76, '灭菌条', '未知', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (77, '便签纸', '未知', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (78, 'qpcr mix', '翊圣', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (79, 'Protein A/G免疫沉淀磁珠', 'bimake', '1mL', 'B23201');
INSERT INTO `web_goodsdetail` VALUES (80, '葡萄糖', '索莱宝', '250g', NULL);
INSERT INTO `web_goodsdetail` VALUES (81, '0.45μm过滤膜', '默认', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (82, 'DMEM培养基 -L-谷氨酰胺', 'gibico', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (83, 'DMEM -Glutamine 培养基', 'gibco', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (84, '手套', '海门永和', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (85, 'RNase inhibitor', 'Takara', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (86, 'T7 RNA 聚合酶', 'Thermo', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (87, '乳胶手套', '艺萌', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (88, 'Clarity™ Western ECL Substrate', 'Bio-Rad', '250mL', 'Bio-Rad');
INSERT INTO `web_goodsdetail` VALUES (89, 'PCR高保真酶 I-5', '擎科', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (90, '同源重组酶', 'Exnase II', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (91, 'hsa-miR105-3p', 'mimics', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (92, 'hsa-miR-105-5p', 'mimics', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (93, 'hsa-miR-105-5p', 'inhibitor', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (94, 'hsa-miR-653-3p', 'mimics', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (95, 'hsa-miR-653-3p', 'inhibitor', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (96, 'Tris-Base', '佩晨子', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (97, 'BALB nu 裸鼠', '达硕', '只', NULL);
INSERT INTO `web_goodsdetail` VALUES (98, 'SPF裸鼠饲料', '达硕', 'kg', NULL);
INSERT INTO `web_goodsdetail` VALUES (99, 'SPF玉米芯垫料', '达硕', 'kg', NULL);
INSERT INTO `web_goodsdetail` VALUES (100, '纸', '淘宝买', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (101, '绿酶pcr-Mix', '唯赞', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (102, 'XAV939', 'Selleck', '10mg', '284028-89-3');
INSERT INTO `web_goodsdetail` VALUES (103, 'Volasertib (BI 6727)', 'selleck', '5mg', NULL);
INSERT INTO `web_goodsdetail` VALUES (104, 'BI 2536', 'selleck', '5mg', NULL);
INSERT INTO `web_goodsdetail` VALUES (105, 'Selisistat (EX 527)', 'selleck', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (106, 'Fetal Bovine Serium 南美血清 Excell', '溶海华康', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (107, 'PDK1抑制剂', '陶术', '5mg', NULL);
INSERT INTO `web_goodsdetail` VALUES (108, 'BX795', '陶术', '5mg', NULL);
INSERT INTO `web_goodsdetail` VALUES (109, 'Tryptone', '未知', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (110, 'PVDF膜', 'Immobilon-P/0.45um', '1', 'no');
INSERT INTO `web_goodsdetail` VALUES (111, '1.0ml移液枪', '国产品牌', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (112, 'DNA marker', '诺唯赞', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (113, '中号手套', '施睿康', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (114, '双抗P/S', '索莱宝', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (115, '胰酶', '索莱宝', NULL, NULL);
INSERT INTO `web_goodsdetail` VALUES (116, 'FastDigest XbaI', 'Thermo Fisher', '300 reactions', 'FD0684');

-- ----------------------------
-- Table structure for web_message
-- ----------------------------
DROP TABLE IF EXISTS `web_message`;
CREATE TABLE `web_message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `has_read` tinyint(1) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `brief` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `to_user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_message_to_user_id_49407941_fk_web_userprofile_id`(`to_user_id`) USING BTREE,
  CONSTRAINT `web_message_to_user_id_49407941_fk_web_userprofile_id` FOREIGN KEY (`to_user_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_order
-- ----------------------------
DROP TABLE IF EXISTS `web_order`;
CREATE TABLE `web_order`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_type` smallint(0) NOT NULL,
  `gene_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `primer1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `primer2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `unit_price` decimal(8, 2) NOT NULL,
  `count` int(0) NOT NULL,
  `total_price` decimal(8, 2) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `checked_date` datetime(6) NULL DEFAULT NULL,
  `status` smallint(0) NOT NULL,
  `memo` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `bill_received` tinyint(1) NOT NULL,
  `review` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company_id` int(0) NULL DEFAULT NULL,
  `detail_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `primer_product_length` int(0) NULL DEFAULT NULL,
  `gene_info_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `web_order_company_id_7f5c96f9_fk_web_companyinfo_id`(`company_id`) USING BTREE,
  INDEX `web_order_detail_id_b827c333_fk_web_goodsdetail_id`(`detail_id`) USING BTREE,
  INDEX `web_order_user_id_ea2d4a3f_fk_web_userprofile_id`(`user_id`) USING BTREE,
  INDEX `web_order_gene_info_id_9589f317_fk_web_geneinfo_id`(`gene_info_id`) USING BTREE,
  CONSTRAINT `web_order_company_id_7f5c96f9_fk_web_companyinfo_id` FOREIGN KEY (`company_id`) REFERENCES `web_companyinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_order_detail_id_b827c333_fk_web_goodsdetail_id` FOREIGN KEY (`detail_id`) REFERENCES `web_goodsdetail` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_order_gene_info_id_9589f317_fk_web_geneinfo_id` FOREIGN KEY (`gene_info_id`) REFERENCES `web_geneinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_order_user_id_ea2d4a3f_fk_web_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 428 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_order
-- ----------------------------
INSERT INTO `web_order` VALUES (5, 0, NULL, NULL, NULL, 1160.00, 1, 1160.00, '2021-01-05 13:50:42.115349', '2021-01-05 15:36:39.521558', 3, '这个原来早的时候是950，现在涨价变成1160了', 1, NULL, 7, 2, 14, NULL, NULL);
INSERT INTO `web_order` VALUES (6, 1, 'CO1', NULL, NULL, 10.00, 1, 10.00, '2021-01-05 15:02:44.154682', '2021-01-05 15:36:22.848205', 3, '公司细胞核学分析', 0, NULL, 4, NULL, 9, NULL, 1);
INSERT INTO `web_order` VALUES (7, 0, NULL, NULL, NULL, 1950.00, 3, 5850.00, '2021-01-05 17:36:26.254297', '2021-01-13 14:33:51.588618', 3, '1', 1, NULL, 5, 45, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (8, 0, NULL, NULL, NULL, 65.00, 5, 325.00, '2021-01-06 09:33:47.111797', '2021-01-11 18:28:12.655664', 3, '1', 0, NULL, 6, 5, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (9, 2, 'dhfr', 'ACCAGGCCACCTCAGACT', 'GAGAGGACGCCTGGGTATT', 0.30, 37, 11.10, '2021-01-06 11:18:40.171094', '2021-01-11 18:28:00.248433', 3, '1', 0, NULL, 4, NULL, 13, NULL, 2);
INSERT INTO `web_order` VALUES (10, 1, 'CO1', NULL, NULL, 10.00, 1, 10.00, '2021-01-07 10:27:14.256786', '2021-01-11 18:27:40.887175', 3, '公司LMH细胞CO1扩增产物验证', 0, NULL, 4, NULL, 9, NULL, 1);
INSERT INTO `web_order` VALUES (11, 1, 'CO1', NULL, NULL, 10.00, 2, 20.00, '2021-01-08 18:16:45.740864', '2021-01-11 18:27:32.277949', 3, '公司LMH细胞核学鉴定第二、三次测序', 0, NULL, 4, NULL, 9, NULL, 1);
INSERT INTO `web_order` VALUES (12, 1, 'pLKO-RFG/SIRT4', NULL, NULL, 10.00, 3, 30.00, '2020-10-31 00:00:00.000000', '2020-10-31 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 16, NULL, 3);
INSERT INTO `web_order` VALUES (13, 1, 'pmriGLO', NULL, NULL, 10.00, 1, 10.00, '2020-10-31 00:00:00.000000', '2020-10-31 12:00:00.000000', 3, '正/反', 0, NULL, 1, NULL, 16, NULL, 4);
INSERT INTO `web_order` VALUES (14, 1, 'pmriGLO', NULL, NULL, 10.00, 1, 10.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 4);
INSERT INTO `web_order` VALUES (15, 1, 'CAPN6-3xFLAG', NULL, NULL, 10.00, 1, 10.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 11, NULL, 5);
INSERT INTO `web_order` VALUES (16, 1, 'RFG-UTR/SIRT4-UTR', NULL, NULL, 10.00, 2, 20.00, '2020-11-08 00:00:00.000000', '2020-11-08 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 16, NULL, 6);
INSERT INTO `web_order` VALUES (17, 1, 'PMD-19-330', NULL, NULL, 10.00, 1, 10.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 7);
INSERT INTO `web_order` VALUES (18, 1, 'PMD-19-642', NULL, NULL, 10.00, 1, 10.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 8);
INSERT INTO `web_order` VALUES (19, 1, 'pmriGLO-330', NULL, NULL, 10.00, 1, 10.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 9);
INSERT INTO `web_order` VALUES (20, 1, 'pmriGLO-642', NULL, NULL, 10.00, 1, 10.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 10);
INSERT INTO `web_order` VALUES (21, 1, 'F81', NULL, NULL, 10.00, 1, 10.00, '2020-12-11 00:00:00.000000', '2020-12-11 12:00:00.000000', 3, '正/反', 0, NULL, 1, NULL, 11, NULL, 11);
INSERT INTO `web_order` VALUES (22, 1, 'MDCK', NULL, NULL, 10.00, 1, 10.00, '2020-12-11 00:00:00.000000', '2020-12-11 12:00:00.000000', 3, '正/反', 0, NULL, 1, NULL, 11, NULL, 12);
INSERT INTO `web_order` VALUES (23, 1, 'XF', NULL, NULL, 10.00, 1, 10.00, '2020-12-11 00:00:00.000000', '2020-12-11 12:00:00.000000', 3, '正/反', 0, NULL, 1, NULL, 11, NULL, 13);
INSERT INTO `web_order` VALUES (24, 1, 'SIRT4-PCDNA3.1', NULL, NULL, 10.00, 1, 10.00, '2020-12-21 00:00:00.000000', '2020-12-21 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 16, NULL, 14);
INSERT INTO `web_order` VALUES (25, 1, 'pmriGLO-330', NULL, NULL, 10.00, 1, 10.00, '2020-12-21 00:00:00.000000', '2020-12-21 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 9);
INSERT INTO `web_order` VALUES (26, 1, 'CAPN6', NULL, NULL, 10.00, 1, 10.00, '2020-12-23 00:00:00.000000', '2020-12-23 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 11, NULL, 15);
INSERT INTO `web_order` VALUES (27, 1, 'NLK', NULL, NULL, 10.00, 1, 10.00, '2020-12-23 00:00:00.000000', '2020-12-23 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 4, NULL, 16);
INSERT INTO `web_order` VALUES (28, 1, 'pmriGLO-330', NULL, NULL, 10.00, 2, 20.00, '2020-12-24 00:00:00.000000', '2020-12-24 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 9);
INSERT INTO `web_order` VALUES (29, 1, 'F81', NULL, NULL, 10.00, 11, 110.00, '2020-12-29 00:00:00.000000', '2020-12-29 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 11, NULL, 11);
INSERT INTO `web_order` VALUES (30, 1, 'pmriGLO-330FL-6', NULL, NULL, 10.00, 1, 10.00, '2020-12-29 00:00:00.000000', '2020-12-29 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 17);
INSERT INTO `web_order` VALUES (31, 1, 'pmriGLO-330FL-10', NULL, NULL, 10.00, 1, 10.00, '2020-12-29 00:00:00.000000', '2020-12-29 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 18);
INSERT INTO `web_order` VALUES (32, 1, 'pmriGLO-mut-8-330', NULL, NULL, 10.00, 1, 10.00, '2020-12-29 00:00:00.000000', '2020-12-29 12:00:00.000000', 3, '正', 0, NULL, 1, NULL, 14, NULL, 19);
INSERT INTO `web_order` VALUES (33, 2, '330-5\'UTR', NULL, NULL, 0.50, 36, 18.00, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '扩增3\'UTR区', 0, NULL, 1, NULL, 14, NULL, 20);
INSERT INTO `web_order` VALUES (34, 2, '642a-5’UTR', NULL, NULL, 0.50, 37, 18.50, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '扩增3\'UTR区', 0, NULL, 1, NULL, 14, NULL, 21);
INSERT INTO `web_order` VALUES (35, 2, 'NHEI330-5P F/R', NULL, NULL, 0.50, 52, 26.00, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '加酶切位点', 0, NULL, 1, NULL, 14, NULL, 22);
INSERT INTO `web_order` VALUES (36, 2, 'NHEI642-5P F/R', NULL, NULL, 0.50, 54, 27.00, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '加酶切位点', 0, NULL, 1, NULL, 14, NULL, 23);
INSERT INTO `web_order` VALUES (37, 2, 'OCT4', NULL, NULL, 0.50, 46, 23.00, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '干性和EMT Marker q-', 0, NULL, 1, NULL, 9, NULL, 24);
INSERT INTO `web_order` VALUES (38, 2, 'SOX', NULL, NULL, 0.50, 43, 21.50, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '引物', 0, NULL, 1, NULL, 9, NULL, 25);
INSERT INTO `web_order` VALUES (39, 2, 'Nanog', NULL, NULL, 0.50, 43, 21.50, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '引物', 0, NULL, 1, NULL, 9, NULL, 26);
INSERT INTO `web_order` VALUES (40, 2, 'c-Myc', NULL, NULL, 0.50, 43, 21.50, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '引物', 0, NULL, 1, NULL, 9, NULL, 27);
INSERT INTO `web_order` VALUES (41, 2, 'EpCAM', NULL, NULL, 0.50, 43, 21.50, '2020-11-02 00:00:00.000000', '2020-11-02 12:00:00.000000', 3, '引物', 0, NULL, 1, NULL, 9, NULL, 28);
INSERT INTO `web_order` VALUES (42, 2, 'SIRT4 RFG3\'UTR', NULL, NULL, 0.50, 52, 26.00, '2020-11-03 00:00:00.000000', '2020-11-03 12:00:00.000000', 3, '加酶切位点', 0, NULL, 1, NULL, 16, NULL, 29);
INSERT INTO `web_order` VALUES (43, 2, 'XbaI NheI', NULL, NULL, 0.50, 54, 27.00, '2020-11-03 00:00:00.000000', '2020-11-03 12:00:00.000000', 3, '加酶切位点', 0, NULL, 1, NULL, 16, NULL, 30);
INSERT INTO `web_order` VALUES (44, 2, 'PPP3CA-F/R', NULL, NULL, 0.50, 43, 21.50, '2020-11-11 00:00:00.000000', '2020-11-11 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 31);
INSERT INTO `web_order` VALUES (45, 2, 'NCFI F', NULL, NULL, 0.50, 42, 21.00, '2020-11-11 00:00:00.000000', '2020-11-11 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 32);
INSERT INTO `web_order` VALUES (46, 2, 'NCFI R', NULL, NULL, 0.50, 42, 21.00, '2020-11-11 00:00:00.000000', '2020-11-11 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 33);
INSERT INTO `web_order` VALUES (47, 2, '330RTmRNA', NULL, NULL, 0.50, 44, 22.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, '反转录', 0, NULL, 1, NULL, 14, NULL, 34);
INSERT INTO `web_order` VALUES (48, 2, '642RTmRNA', NULL, NULL, 0.50, 44, 22.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, '反转录', 0, NULL, 1, NULL, 14, NULL, 35);
INSERT INTO `web_order` VALUES (49, 2, '330Q-FR', NULL, NULL, 0.50, 38, 19.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 14, NULL, 36);
INSERT INTO `web_order` VALUES (50, 2, '642Q-FR', NULL, NULL, 0.50, 38, 19.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 14, NULL, 37);
INSERT INTO `web_order` VALUES (51, 2, 'SIRT4-XhOI', NULL, NULL, 0.50, 54, 27.00, '2020-11-19 00:00:00.000000', '2020-11-19 12:00:00.000000', 3, '构建载体', 0, NULL, 1, NULL, 16, NULL, 38);
INSERT INTO `web_order` VALUES (52, 2, '36B4 u/d', NULL, NULL, 0.50, 48, 24.00, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 10, NULL, 39);
INSERT INTO `web_order` VALUES (53, 2, 'SERCA2-F/R', NULL, NULL, 0.50, 42, 21.00, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 40);
INSERT INTO `web_order` VALUES (54, 2, 'STIMI-F/R', NULL, NULL, 0.50, 42, 21.00, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 41);
INSERT INTO `web_order` VALUES (55, 2, 'OraTI-F/R', NULL, NULL, 0.50, 41, 20.50, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 6, NULL, 42);
INSERT INTO `web_order` VALUES (56, 2, 'LUC2-F/R', NULL, NULL, 0.50, 56, 28.00, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, '加酶切位点', 0, NULL, 1, NULL, 17, NULL, 43);
INSERT INTO `web_order` VALUES (57, 2, 'DjSTAT3-F/R', NULL, NULL, 0.50, 42, 21.00, '2020-12-07 00:00:00.000000', '2020-12-07 12:00:00.000000', 3, 'QPCR', 0, NULL, 1, NULL, 4, NULL, 44);
INSERT INTO `web_order` VALUES (58, 2, 'New-EGRP-F/R', NULL, NULL, 0.50, 82, 41.00, '2020-12-09 00:00:00.000000', '2020-12-09 12:00:00.000000', 3, '改进knock in片段', 0, NULL, 1, NULL, 12, NULL, 45);
INSERT INTO `web_order` VALUES (59, 2, 'New-L-R/F', NULL, NULL, 0.50, 88, 44.00, '2020-12-09 00:00:00.000000', '2020-12-09 12:00:00.000000', 3, '改进knock in片段', 0, NULL, 1, NULL, 12, NULL, 46);
INSERT INTO `web_order` VALUES (60, 2, 'Djlnhba', NULL, NULL, 0.50, 40, 20.00, '2020-12-09 00:00:00.000000', '2020-12-09 12:00:00.000000', 3, '扩增Llnhba基因', 0, NULL, 1, NULL, 18, NULL, 47);
INSERT INTO `web_order` VALUES (61, 2, 'UQ-F/R', NULL, NULL, 0.50, 41, 20.50, '2020-12-10 00:00:00.000000', '2020-12-10 12:00:00.000000', 3, 'Oxphos genes', 0, NULL, 1, NULL, 3, NULL, 48);
INSERT INTO `web_order` VALUES (62, 2, 'NDUFV1-F/R', NULL, NULL, 0.50, 42, 21.00, '2020-12-10 00:00:00.000000', '2020-12-10 12:00:00.000000', 3, 'Oxphos genes', 0, NULL, 1, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (63, 2, 'SDHA-F/R', NULL, NULL, 0.50, 41, 20.50, '2020-12-10 00:00:00.000000', '2020-12-10 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 3, NULL, 50);
INSERT INTO `web_order` VALUES (64, 2, 'AKAP1-F/R', NULL, NULL, 0.50, 42, 21.00, '2020-12-10 00:00:00.000000', '2020-12-10 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 3, NULL, 51);
INSERT INTO `web_order` VALUES (65, 2, 'SIRT4-R', NULL, NULL, 0.50, 46, 23.00, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 16, NULL, 52);
INSERT INTO `web_order` VALUES (66, 2, 'QP-SIRT4', NULL, NULL, 0.50, 41, 20.50, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 16, NULL, 53);
INSERT INTO `web_order` VALUES (67, 2, 'QP-RFC2', NULL, NULL, 0.50, 41, 20.50, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'Q-PCR', 0, NULL, 1, NULL, 16, NULL, 54);
INSERT INTO `web_order` VALUES (68, 2, 'GLIPRILI-T7', NULL, NULL, 0.50, 78, 39.00, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'RNAi', 0, NULL, 1, NULL, 4, NULL, 55);
INSERT INTO `web_order` VALUES (69, 2, 'NLK-T7', NULL, NULL, 0.50, 78, 39.00, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'RNAi', 0, NULL, 1, NULL, 4, NULL, 56);
INSERT INTO `web_order` VALUES (70, 2, 'LKBI-T7', NULL, NULL, 0.50, 78, 39.00, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, 'RNAi', 0, NULL, 1, NULL, 4, NULL, 57);
INSERT INTO `web_order` VALUES (71, 2, '330Mut F/R', NULL, NULL, 0.50, 69, 34.50, '2020-12-21 00:00:00.000000', '2020-12-21 12:00:00.000000', 3, '突变序列', 0, NULL, 1, NULL, 14, NULL, 58);
INSERT INTO `web_order` VALUES (72, 2, '642 Mut F/R', NULL, NULL, 0.50, 65, 32.50, '2020-12-21 00:00:00.000000', '2020-12-21 12:00:00.000000', 3, '突变序列', 0, NULL, 1, NULL, 14, NULL, 59);
INSERT INTO `web_order` VALUES (73, 2, 'Dog-colF/R', NULL, NULL, 0.50, 40, 20.00, '2020-12-24 00:00:00.000000', '2020-12-24 12:00:00.000000', 3, '扩Col', 0, NULL, 1, NULL, 11, NULL, 60);
INSERT INTO `web_order` VALUES (74, 2, 'Cat-colF/R', NULL, NULL, 0.50, 43, 21.50, '2020-12-24 00:00:00.000000', '2020-12-24 12:00:00.000000', 3, '扩Col', 0, NULL, 1, NULL, 11, NULL, 61);
INSERT INTO `web_order` VALUES (75, 2, 'Rat-colF/R', NULL, NULL, 0.50, 42, 21.00, '2020-12-24 00:00:00.000000', '2020-12-24 12:00:00.000000', 3, '扩Col', 0, NULL, 1, NULL, 11, NULL, 62);
INSERT INTO `web_order` VALUES (76, 0, NULL, NULL, NULL, 50.00, 20, 1000.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 8, 6, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (77, 0, NULL, NULL, NULL, 1800.00, 1, 1800.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, NULL, 0, NULL, 9, 7, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (78, 0, NULL, NULL, NULL, 1704.65, 1, 1704.65, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 10, 8, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (79, 0, NULL, NULL, NULL, 360.00, 1, 360.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 1, 9, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (80, 0, NULL, NULL, NULL, 570.00, 2, 1140.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 11, 10, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (81, 0, NULL, NULL, NULL, 850.00, 1, 850.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, NULL, 0, NULL, 12, 11, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (82, 0, NULL, NULL, NULL, 570.00, 2, 1140.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 11, 12, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (83, 0, NULL, NULL, NULL, 270.00, 2, 540.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 11, 13, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (84, 0, NULL, NULL, NULL, 435.00, 2, 870.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 13, 14, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (85, 0, NULL, NULL, NULL, 585.00, 2, 1170.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 11, 15, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (86, 0, NULL, NULL, NULL, 420.00, 1, 420.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, '', 1, NULL, 12, 16, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (87, 0, NULL, NULL, NULL, 500.00, 1, 500.00, '2020-11-16 00:00:00.000000', '2020-11-16 12:00:00.000000', 3, NULL, 0, NULL, 14, 17, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (88, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, NULL, 0, NULL, 15, 18, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (89, 0, NULL, NULL, NULL, 701.00, 1, 701.00, '2020-11-06 00:00:00.000000', '2020-11-06 12:00:00.000000', 3, NULL, 0, NULL, 15, 19, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (90, 0, NULL, NULL, NULL, 352.80, 1, 352.80, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 16, 20, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (91, 0, NULL, NULL, NULL, 7.00, 20, 140.00, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 14, 21, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (92, 0, NULL, NULL, NULL, 350.00, 1, 350.00, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 14, 22, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (93, 0, NULL, NULL, NULL, 312.90, 1, 312.90, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 16, 23, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (94, 0, NULL, NULL, NULL, 130.00, 1, 130.00, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 15, 24, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (95, 0, NULL, NULL, NULL, 945.00, 1, 945.00, '2020-11-25 00:00:00.000000', '2020-11-25 12:00:00.000000', 3, NULL, 0, NULL, 17, 25, 8, NULL, NULL);
INSERT INTO `web_order` VALUES (96, 0, NULL, NULL, NULL, 310.00, 3, 930.00, '2020-11-27 00:00:00.000000', '2020-11-27 12:00:00.000000', 3, NULL, 0, NULL, 14, 26, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (97, 0, NULL, NULL, NULL, 35.00, 1, 35.00, '2020-11-24 00:00:00.000000', '2020-11-24 12:00:00.000000', 3, NULL, 0, NULL, 14, 27, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (98, 0, NULL, NULL, NULL, 1950.00, 3, 5850.00, '2020-11-30 00:00:00.000000', '2020-11-30 12:00:00.000000', 3, '', 1, NULL, 5, 4, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (99, 0, NULL, NULL, NULL, 602.00, 1, 602.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '', 1, NULL, 18, 28, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (100, 0, NULL, NULL, NULL, 756.00, 1, 756.00, '2020-12-02 00:00:00.000000', '2020-12-02 12:00:00.000000', 3, '', 1, NULL, 18, 29, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (101, 0, NULL, NULL, NULL, 28.00, 2, 56.00, '2020-12-03 00:00:00.000000', '2020-12-03 12:00:00.000000', 3, NULL, 0, NULL, 1, 30, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (102, 0, NULL, NULL, NULL, 380.00, 2, 760.00, '2020-12-07 00:00:00.000000', '2020-12-07 12:00:00.000000', 3, NULL, 0, NULL, 19, 31, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (103, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2020-12-07 00:00:00.000000', '2020-12-07 12:00:00.000000', 3, NULL, 0, NULL, 15, 18, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (104, 0, NULL, NULL, NULL, 35.00, 6, 210.00, '2020-12-08 00:00:00.000000', '2020-12-08 12:00:00.000000', 3, '', 1, NULL, 1, 32, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (105, 0, NULL, NULL, NULL, 10.00, 5, 50.00, '2020-12-08 00:00:00.000000', '2020-12-08 12:00:00.000000', 3, '', 1, NULL, 1, 33, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (106, 0, NULL, NULL, NULL, 65.00, 20, 1300.00, '2020-12-14 00:00:00.000000', '2020-12-14 12:00:00.000000', 3, '', 1, NULL, 18, 34, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (107, 0, NULL, NULL, NULL, 960.00, 1, 960.00, '2020-12-08 00:00:00.000000', '2020-12-08 12:00:00.000000', 3, NULL, 0, NULL, 12, 35, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (108, 0, NULL, NULL, NULL, 1000.00, 2, 2000.00, '2020-12-08 00:00:00.000000', '2020-12-08 12:00:00.000000', 3, NULL, 0, NULL, 12, 36, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (109, 0, NULL, NULL, NULL, 144.00, 1, 144.00, '2020-12-17 00:00:00.000000', '2020-12-17 12:00:00.000000', 3, '', 1, NULL, 20, 37, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (110, 0, NULL, NULL, NULL, 888.00, 1, 888.00, '2020-12-21 00:00:00.000000', '2020-12-21 12:00:00.000000', 3, '', 1, NULL, 21, 38, 10, NULL, NULL);
INSERT INTO `web_order` VALUES (111, 0, NULL, NULL, NULL, 585.00, 2, 1170.00, '2020-12-22 00:00:00.000000', '2020-12-22 12:00:00.000000', 3, NULL, 0, NULL, 11, 39, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (112, 0, NULL, NULL, NULL, 70.00, 4, 280.00, '2020-12-22 00:00:00.000000', '2020-12-22 12:00:00.000000', 3, '', 1, NULL, 18, 40, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (113, 0, NULL, NULL, NULL, 55.00, 6, 330.00, '2020-12-22 00:00:00.000000', '2020-12-22 12:00:00.000000', 3, '', 1, NULL, 18, 41, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (114, 0, NULL, NULL, NULL, 570.00, 2, 1140.00, '2020-12-22 00:00:00.000000', '2020-12-22 12:00:00.000000', 3, '', 1, NULL, 11, 12, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (115, 0, NULL, NULL, NULL, 436.00, 1, 436.00, '2020-12-24 00:00:00.000000', '2020-12-24 12:00:00.000000', 3, '', 1, NULL, 18, 42, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (116, 0, NULL, NULL, NULL, 270.00, 2, 540.00, '2020-12-28 00:00:00.000000', '2020-12-28 12:00:00.000000', 3, '', 1, NULL, 11, 13, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (117, 0, NULL, NULL, NULL, 1550.00, 1, 1550.00, '2020-12-29 00:00:00.000000', '2020-12-29 12:00:00.000000', 3, '', 1, NULL, 14, 43, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (118, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2021-01-12 21:35:27.861212', NULL, 2, '用于反转录', 0, '有试剂盒', 15, 18, 16, NULL, NULL);
INSERT INTO `web_order` VALUES (119, 0, NULL, NULL, NULL, 1300.00, 1, 1300.00, '2021-01-13 16:24:48.423720', '2021-01-18 16:28:36.738737', 3, '涡虫神经系统免疫组化抗体。', 1, NULL, 22, 48, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (120, 0, NULL, NULL, NULL, 144.00, 1, 144.00, '2021-01-13 16:33:29.660684', '2021-01-18 16:28:43.020602', 3, '涡虫神经系统免疫组化荧光二抗。', 0, NULL, 24, 49, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (121, 2, 'ATF2', 'GTTCCAGATTACGCTGAATTCAAATTCAAGTTACATGTGAATTCTG', 'AACGGGCCCTCTAGACTCGAGTCAACTTCCTGAGGGCTGTGA', 0.30, 88, 26.40, '2021-01-14 18:39:50.858623', '2021-01-18 16:28:49.973322', 3, '构载体', 0, NULL, 25, NULL, 6, NULL, 63);
INSERT INTO `web_order` VALUES (122, 0, NULL, NULL, NULL, 900.00, 2, 1800.00, '2021-01-14 18:45:13.203838', '2021-01-18 16:29:00.460535', 3, '细胞转染', 0, NULL, 9, 7, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (123, 0, NULL, NULL, NULL, 65.00, 18, 1170.00, '2021-01-15 09:38:21.872472', '2021-01-18 16:29:07.052736', 3, '基础细胞培养基', 1, NULL, 18, 34, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (124, 0, NULL, NULL, NULL, 1900.00, 1, 1900.00, '2021-01-16 13:59:58.478822', '2021-01-18 16:29:19.469419', 3, '一袋蛋白Maker 包含5管,规格500ul/管。总共2.5ml', 1, NULL, 26, 50, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (125, 0, NULL, NULL, NULL, 1350.00, 1, 1350.00, '2021-01-18 15:08:42.922476', '2021-01-18 16:30:11.761200', 3, '定量检测IFNB蛋白', 1, NULL, 27, 51, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (126, 1, 'ATF2', NULL, NULL, 10.00, 1, 10.00, '2021-01-22 09:31:32.964965', '2021-01-25 14:50:27.560184', 3, '载体测序', 0, NULL, 25, NULL, 6, NULL, 63);
INSERT INTO `web_order` VALUES (127, 0, NULL, NULL, NULL, 93.00, 1, 93.00, '2021-01-26 09:40:03.214182', '2021-01-26 11:09:26.787054', 3, '用于提取毛囊DNA', 1, NULL, 6, 52, 10, NULL, NULL);
INSERT INTO `web_order` VALUES (128, 0, NULL, NULL, NULL, 850.00, 2, 1700.00, '2021-01-26 10:57:54.624175', '2021-01-26 11:10:47.923508', 3, '实验手套', 0, NULL, 28, 56, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (129, 0, NULL, NULL, NULL, 445.00, 1, 445.00, '2021-01-26 11:02:08.984559', '2021-01-26 11:10:41.513314', 3, '细胞培养', 1, NULL, 11, 55, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (130, 0, NULL, NULL, NULL, 585.00, 2, 1160.00, '2021-01-26 11:03:07.757768', '2021-01-26 11:10:33.337872', 3, '细胞培养', 0, NULL, 11, 39, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (131, 0, NULL, NULL, NULL, 50.00, 5, 250.00, '2021-01-26 11:03:43.834753', '2021-01-26 11:10:10.826654', 3, '细胞冻存', 1, NULL, 14, 17, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (132, 0, NULL, NULL, NULL, 270.00, 2, 540.00, '2021-01-26 11:05:56.584691', '2021-01-26 11:09:54.125890', 3, '细胞培养离心', 1, NULL, 11, 13, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (133, 2, NULL, 'AAA', 'CCC', 12.00, 1, 12.00, '2021-01-26 17:55:56.923971', NULL, 0, 'ee', 0, NULL, 11, NULL, 2, 22, 36);
INSERT INTO `web_order` VALUES (135, 0, NULL, NULL, NULL, 2568.00, 1, 2568.00, '2021-01-27 10:08:41.309978', '2021-01-27 17:28:09.217650', 3, '抗地高辛荧光抗体，用于荧光原位杂交', 1, NULL, 27, 57, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (136, 2, NULL, 'GGCGGTGATTTTGGCGATAC', 'TAATACGACTCACTATAGGAATGCGGGTCGCTTCACTTA', 0.30, 59, 17.70, '2021-01-27 10:54:25.500271', '2021-01-27 17:29:55.261454', 3, 'FISH探针引物', 0, NULL, 4, NULL, 13, 658, 65);
INSERT INTO `web_order` VALUES (137, 2, NULL, 'TGGAGGAATTCTTGCTTTGC', 'CGCTCTCCTCCGAAGAAAC', 0.30, 1, 12.00, '2021-01-27 17:18:46.362067', '2021-01-27 17:28:35.097107', 3, 'EMT相关引物', 0, NULL, 4, NULL, 14, 40, 67);
INSERT INTO `web_order` VALUES (138, 2, NULL, 'CCTGCAGATTTTAAGGTGGAT', 'TTACTGCCACTTGCCACTTTTC', 0.30, 1, 12.90, '2021-01-27 17:20:36.175617', '2021-01-27 17:28:45.037802', 3, 'emt相关', 0, NULL, 4, NULL, 14, 43, 68);
INSERT INTO `web_order` VALUES (139, 2, NULL, 'CCATGCCTGTCATACCACAA', 'ACAGTGATGGGGCTGTATGC', 0.30, 40, 12.00, '2021-01-27 17:22:11.637814', '2021-01-27 17:29:03.884630', 3, 'EMT相关引物', 0, NULL, 4, NULL, 14, 173, 69);
INSERT INTO `web_order` VALUES (140, 2, NULL, 'TGAGCAAGATTCAGACCCTCA', 'ATCCTCCAGACCGAGAAGG', 0.30, 40, 12.00, '2021-01-27 17:23:11.473634', '2021-01-27 17:29:09.976085', 3, 'EMT相关引物', 0, NULL, 4, NULL, 14, 180, 70);
INSERT INTO `web_order` VALUES (141, 2, NULL, 'GCTGCAGGACTCTAATCCAGA', 'ATCTCCGGAGGTGGGATG', 0.30, 39, 11.70, '2021-01-27 17:24:15.251423', '2021-01-27 17:29:21.437178', 3, 'EMT相关引物', 0, NULL, 4, NULL, 14, 180, 71);
INSERT INTO `web_order` VALUES (142, 2, NULL, 'TGTCCGTCAGAACCCATGC', 'AAAGTCGAAGTTCCATCGCTC', 0.30, 40, 12.00, '2021-01-27 17:25:15.027907', '2021-01-27 17:29:29.999413', 3, '周期相关蛋白验证', 0, NULL, 4, NULL, 14, 190, 72);
INSERT INTO `web_order` VALUES (143, 2, NULL, 'TTCCTCTTTTTACACCCCAGTCA', 'TCGGTTGTCAAGGTTTGTAGTTC', 0.30, 46, 13.80, '2021-01-27 17:26:09.653128', '2021-01-27 17:29:49.336988', 3, '周期基因验证', 0, NULL, 4, NULL, 14, 160, 73);
INSERT INTO `web_order` VALUES (144, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-01-29 17:05:17.825944', '2021-02-01 10:16:46.432500', 3, 'LacZ FISH探针模板', 0, NULL, 25, NULL, 13, NULL, 65);
INSERT INTO `web_order` VALUES (145, 0, NULL, NULL, NULL, 380.00, 2, 760.00, '2021-02-01 09:03:50.291214', '2021-02-01 10:16:53.005685', 3, 'Q-pcr mix', 0, NULL, 29, 31, 14, NULL, NULL);
INSERT INTO `web_order` VALUES (146, 0, NULL, NULL, NULL, 360.00, 1, 360.00, '2021-02-01 09:50:47.249138', '2021-02-01 10:16:59.929132', 3, '质粒提取', 1, NULL, 30, 9, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (148, 0, NULL, NULL, NULL, 130.00, 1, 130.00, '2021-02-02 10:06:43.602980', '2021-02-22 09:37:09.624038', 3, 'speⅠ', 0, NULL, 15, 59, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (149, 0, NULL, NULL, NULL, 585.00, 2, 1170.00, '2021-02-02 14:19:14.566667', '2021-02-22 09:37:20.179853', 3, '细胞培养', 1, NULL, 11, 10, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (150, 2, NULL, 'CGGGATCCATGACCAACAAGTGTCTCC', 'GGACTAGTTCAGTTTCGGAGGTAACCTG', 0.30, 55, 16.50, '2021-02-04 20:02:58.743897', '2021-02-22 09:37:26.974475', 3, 'IFNB探针制备', 0, NULL, 4, NULL, 13, 581, 74);
INSERT INTO `web_order` VALUES (151, 0, NULL, NULL, NULL, 50.00, 30, 1500.00, '2021-02-22 09:19:31.192736', '2021-02-22 09:37:33.879519', 3, '细胞培养基', 0, NULL, 8, 6, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (152, 0, NULL, NULL, NULL, 50.00, 5, 250.00, '2021-02-22 09:38:21.905525', '2021-02-22 09:44:40.419400', 3, '培养基', 0, NULL, 8, 60, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (154, 0, NULL, NULL, NULL, 848.00, 1, 848.00, '2021-03-11 09:45:11.889266', '2021-03-15 12:01:28.006826', 3, '细胞核质分离100T', 1, NULL, 18, 61, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (155, 2, NULL, 'CTCCTGGGAGATGACATCAGAG', 'ACCAGCCGAGCAGCCGCCGTGTTG', 0.30, 46, 18.40, '2021-03-11 09:53:39.957175', '2021-03-15 12:01:19.923344', 3, '引物合成', 0, NULL, 4, NULL, 3, 2100, 49);
INSERT INTO `web_order` VALUES (156, 2, NULL, 'GTAGAGACGGGGTTTCACCATGTTA', 'CGCAATAGCACTTGTGCCCCGGC', 0.30, 48, 19.20, '2021-03-11 09:55:15.900765', '2021-03-15 12:01:09.495140', 3, '引物合成', 0, NULL, 4, NULL, 3, 2100, 75);
INSERT INTO `web_order` VALUES (157, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCTCCTGGGAGATGACATCAGAGTG', 'TTACCAACAGTACCGGAATTCACCAGCCGAGCAGCCGCC', 0.30, 90, 27.00, '2021-03-13 10:49:11.850355', '2021-03-15 12:01:02.196086', 3, '引物合成NDUFV1', 0, NULL, 4, NULL, 3, 2100, 49);
INSERT INTO `web_order` VALUES (158, 2, NULL, 'CGGCGTAGAGGATCGAGATCTGTAGAGACGGGGTTTCACC', 'TTACCAACAGTACCGGAATTCCGCAATAGCACTTGTGCCCC', 0.30, 90, 27.00, '2021-03-13 10:50:22.374203', '2021-03-15 12:00:33.756988', 3, 'UQCRC1', 0, NULL, 4, NULL, 3, 2100, 75);
INSERT INTO `web_order` VALUES (159, 2, NULL, 'ATGGAGGAACACGGAGTGACC', 'CTGTTCCAATGTCACCACCTC', 0.30, 42, 12.60, '2021-03-15 10:35:20.247799', '2021-03-15 12:00:27.450671', 3, 'NRF1载体构建', 0, NULL, 4, NULL, 3, 1600, 76);
INSERT INTO `web_order` VALUES (160, 2, NULL, 'CTTGGTACCGAGCTCGGATCCATGGAGGAACACGGAGTGACC', 'CTTGGTACCGAGCTCGGATCCATGGAGGAACACGGAGTGACC', 0.30, 85, 25.50, '2021-03-15 10:37:29.011869', '2021-03-15 12:00:20.752592', 3, 'NRF1引物', 0, NULL, 4, NULL, 3, 1600, 76);
INSERT INTO `web_order` VALUES (162, 2, NULL, 'TAGCAGCACATAATGGTTTGTG', 'CACAAACCATTATGTGCTGCTA', 350.00, 1, 350.00, '2021-03-15 21:35:53.902912', '2021-03-15 21:56:11.088691', 3, 'miR-15a-5p inhibitor合成', 0, NULL, 25, NULL, 16, 22, 77);
INSERT INTO `web_order` VALUES (163, 2, NULL, 'TCTTCTCGGAATCTTAT', 'TTGATAGCAACGCATAT', 0.50, 1, 17.00, '2021-03-18 15:31:16.459728', '2021-03-19 10:23:49.358690', 3, '涡虫BRD4抑制后BRD4的RNA水平改变', 0, NULL, 25, NULL, 4, 126, 79);
INSERT INTO `web_order` VALUES (164, 2, NULL, 'TAATACGACTCACTATAGGACAGATTCGCTTCCACTT', 'TAATACGACTCACTATAGGAGCAAAGCACCGACTAA', 0.50, 1, 36.50, '2021-03-18 15:33:10.133368', '2021-03-19 10:23:41.970854', 3, '涡虫BRD4的RNAi', 0, NULL, 25, NULL, 4, 733, 81);
INSERT INTO `web_order` VALUES (165, 2, NULL, 'TGCTCCTGAAGAACATCC', 'CAGTTGTTCGACCCGATG', 0.50, 1, 18.00, '2021-03-18 16:13:47.675180', '2021-03-19 10:23:36.088537', 3, '涡虫qPCR的内参', 0, NULL, 25, NULL, 4, 153, 80);
INSERT INTO `web_order` VALUES (166, 2, NULL, 'TCGCGTCCCCACAGCACATT', 'GCCGCTGCACACTGAAACTCTCAC', 0.30, 44, 13.20, '2021-03-22 17:05:43.612217', '2021-03-25 10:26:27.310605', 3, '扩增大熊猫核基因', 0, NULL, 4, NULL, 10, 281, 82);
INSERT INTO `web_order` VALUES (167, 0, NULL, NULL, NULL, 288.00, 1, 288.00, '2021-03-24 10:36:39.343173', '2021-03-25 10:26:20.489207', 3, 'MTX筛选', 1, NULL, 31, 62, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (168, 2, NULL, 'CTGTCTGCTGCCGT', 'GATCGCG', 0.30, 21, 6.30, '2021-03-25 10:00:06.640004', '2021-03-25 10:26:14.133613', 3, 'pmirGLO通用测序引物', 0, NULL, 4, NULL, 3, 0, 83);
INSERT INTO `web_order` VALUES (169, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-03-26 15:02:01.803523', '2021-03-29 09:49:08.809522', 3, '基因长度1600bp，需要两个反应', 0, NULL, 4, NULL, 3, NULL, 76);
INSERT INTO `web_order` VALUES (170, 1, NULL, NULL, NULL, 10.00, 1, 30.00, '2021-03-26 15:02:55.783598', '2021-03-29 09:49:02.328354', 3, '基因长度2100bp。需要三个反应测序。', 0, NULL, 4, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (171, 2, NULL, 'GAACTTCAAGCTTATGGTGAGCAAGGGC', 'CCCTTCGAATTACTTGTACAGCTCGTCC', 0.40, 56, 22.40, '2021-03-30 17:20:48.219562', '2021-04-02 11:59:21.947129', 3, '加酶切位点', 0, NULL, 25, NULL, 17, 742, 84);
INSERT INTO `web_order` VALUES (172, 0, NULL, NULL, NULL, 150.00, 1, 150.00, '2021-04-02 11:41:30.938013', '2021-04-02 11:59:15.331622', 3, '免疫荧光', 1, NULL, 23, 63, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (173, 0, NULL, NULL, NULL, 1024.00, 1, 1024.00, '2021-04-02 11:53:53.217883', '2021-04-02 11:59:09.445445', 3, 'WB,IP', 1, NULL, 23, 64, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (174, 2, NULL, 'CCAAGCTGGCTAGCGTTTAAAC', 'CCTCGGCCCCAGGATACACCACTGTGCGTGGAAAT', 0.70, 57, 39.90, '2021-04-02 18:16:18.529397', '2021-04-06 15:52:11.618812', 3, 'TXN2突变体第一部分', 0, NULL, 32, NULL, 12, 387, 85);
INSERT INTO `web_order` VALUES (175, 2, NULL, 'CACGCACAGTGGTGTATCCTGGGGCCGAGGTTAG', 'ACTGTGCTGGATATCTGCAGAATTC', 0.70, 59, 41.30, '2021-04-02 18:18:01.213363', '2021-04-06 15:52:06.098979', 3, 'TXN2突变体第二部分', 0, NULL, 32, NULL, 12, 259, 85);
INSERT INTO `web_order` VALUES (176, 2, NULL, 'AAACTTAAGCTTGGTACCGAGCTCG', 'CACGGTCCGGATCTTGTTGTCTGCAAAACGCAACA', 0.70, 60, 42.00, '2021-04-02 18:19:42.078310', '2021-04-06 15:51:59.824456', 3, 'RAB35突变体1第一部分', 0, NULL, 32, NULL, 12, 146, 86);
INSERT INTO `web_order` VALUES (177, 2, NULL, 'CGTTTTGCAGACAACAAGATCCGGACCGTGGAGATC', 'GCGGGTTTAAACGGGCCCTCTAGAC', 0.70, 61, 42.70, '2021-04-02 18:21:22.204934', '2021-04-06 15:51:53.669547', 3, 'RAB35突变体1第二部分', 0, NULL, 32, NULL, 12, 545, 86);
INSERT INTO `web_order` VALUES (178, 2, NULL, 'GTGGGTCCCCCGATATGTGTCCCAGATCTGCAGC', 'CAGATCTGGGACACATATCGGGGGACCCACGGGG', 0.70, 68, 47.60, '2021-04-02 18:23:42.115878', '2021-04-06 15:51:47.346277', 3, 'RAB35突变体2突变位点两端引物', 0, NULL, 32, NULL, 12, 705, 86);
INSERT INTO `web_order` VALUES (179, 2, NULL, 'GAAGCGAATCTGTATGA', 'TTAAATGGGGTTTGTAC', 0.30, 1, 10.20, '2021-04-06 10:53:34.735250', '2021-04-06 15:51:36.537324', 3, '之前的引物设计有问题，扩不出来', 0, NULL, 4, NULL, 4, 200, 79);
INSERT INTO `web_order` VALUES (180, 2, NULL, 'TAATACGACTCACTATAGGGAAGCGAATCTGTATGA', 'TAATACGACTCACTATAGGAACATTATCTGGTGGAA', 0.30, 1, 21.60, '2021-04-06 10:55:19.657503', '2021-04-06 15:51:30.088477', 3, '之前的引物设计有问题，扩不出来', 0, NULL, 4, NULL, 4, 807, 81);
INSERT INTO `web_order` VALUES (181, 0, NULL, NULL, NULL, 998.00, 10, 998.00, '2021-04-06 16:10:48.497394', '2021-04-06 17:05:46.855431', 3, '高保真酶，长片段，快速扩增MIX，买一送一，一共10ml', 0, NULL, 28, 65, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (182, 2, NULL, 'ATGCTAGCTCGTGTCACCAGGA', 'AATTGTCTTCCATTCTTTCTTCCTC', 0.30, 47, 14.10, '2021-04-07 16:54:59.098032', '2021-04-07 17:09:43.897832', 3, '大创引物设计', 0, NULL, 25, NULL, 15, 1758, 87);
INSERT INTO `web_order` VALUES (183, 2, NULL, 'CGCGGATCCCGTTCCTGCAGTCCTGG', 'CGCGGATCCACATAAGTTAGCATCCAT', 0.30, 115, 34.50, '2021-04-08 17:55:48.846077', '2021-04-08 20:17:31.885221', 3, 'JNK1/2分段扩增反向PLK1-IP实验，载体构建', 0, NULL, 25, NULL, 15, 763, 89);
INSERT INTO `web_order` VALUES (184, 1, NULL, NULL, NULL, 10.00, 2, 40.00, '2021-04-08 18:56:46.601459', '2021-04-08 20:17:18.736416', 3, '两个反应，', 0, NULL, 25, NULL, 3, NULL, 76);
INSERT INTO `web_order` VALUES (185, 1, NULL, NULL, NULL, 10.00, 1, 30.00, '2021-04-09 16:10:57.857669', '2021-04-12 09:51:38.748188', 3, '2100bp,需要测序三个反应', 0, NULL, 25, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (186, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-09 16:19:41.455558', '2021-04-12 09:51:24.493894', 3, '无', 0, NULL, 25, NULL, 17, NULL, 90);
INSERT INTO `web_order` VALUES (187, 0, NULL, NULL, NULL, 60.00, 10, 600.00, '2021-04-12 09:50:28.678705', '2021-04-12 09:51:47.565205', 3, '培养基', 0, NULL, 8, 60, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (188, 0, NULL, NULL, NULL, 55.00, 6, 330.00, '2021-04-12 09:55:47.658279', '2021-04-12 09:58:51.779996', 3, '细胞培养', 1, NULL, 18, 41, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (189, 0, NULL, NULL, NULL, 70.00, 5, 350.00, '2021-04-12 09:56:20.352437', '2021-04-12 09:58:57.609235', 3, '细胞培养', 0, NULL, 18, 40, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (190, 2, NULL, 'ATGCTAGCTCGTGTCACCAGGA', 'ATGACCTCTCCATCATCTTGTGG', 0.30, 23, 6.90, '2021-04-12 15:26:04.579868', '2021-04-12 16:54:38.588846', 3, '本科毕业论文实验（仅仅一条引物加酶切位点）', 0, NULL, 25, NULL, 15, 1844, 87);
INSERT INTO `web_order` VALUES (191, 0, NULL, NULL, NULL, 252.00, 1, 252.00, '2021-04-12 16:13:11.640965', '2021-04-13 23:52:43.848109', 3, 'GS抑制剂 用于MSX筛选', 1, NULL, 14, 66, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (192, 2, NULL, 'CCTGGATTATTGGGGCCAGG', 'GTCACCGGTTCCGGGAAATA', 0.30, 40, 12.00, '2021-04-12 18:01:40.341551', '2021-04-13 23:52:50.794218', 3, 'BMC 重链qPCR引物', 0, NULL, 25, NULL, 13, 156, 91);
INSERT INTO `web_order` VALUES (193, 2, NULL, 'TGGATAACGCCCTCCAATCG', 'TTCGCAGGCGTAGACTTTGT', 0.30, 40, 12.00, '2021-04-12 18:03:21.062612', '2021-04-13 23:52:57.264540', 3, 'BMC轻链qPCR引物', 0, NULL, 25, NULL, 13, 137, 92);
INSERT INTO `web_order` VALUES (196, 2, NULL, 'GCACTCGAGGGAATGCTAGCTCGTGTCACCCCGGCCTGCTTTCGATGTTAAGATTCTCGAGAATCTTAACATCGAAAGCAGGTTTTTGCCGGCCTGGACCAATGGACTGATAACTCGAGTTATCAGTCCATTGGTCCAGGTTTTTG', 'TGCGAATTCGCTAAATTGTCTTCCATTCTTTCTTCCAATTCAAAAACCTGCTTTCGATGTTAAGATTCTCGAGAATCTTAACATCGAAAGCAGGAATTCAAAAACCTGGACCAATGGACTGATAACTCGAGTTATCAGTCCATTGGTCCAGG', 0.30, 298, 89.40, '2021-04-13 21:39:53.246867', '2021-04-13 23:53:17.088236', 3, '本科生毕业设计', 0, NULL, 4, NULL, 15, 1800, 87);
INSERT INTO `web_order` VALUES (197, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-04-14 19:29:02.794424', '2021-04-15 10:02:09.920765', 3, 'JNK1/2-PCDNA3.1-质粒构建测序', 0, NULL, 4, NULL, 15, NULL, 89);
INSERT INTO `web_order` VALUES (198, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-04-14 19:31:53.017587', '2021-04-15 10:02:16.773998', 3, 'JNK2-PCDNA3.1-质粒测序', 0, NULL, 4, NULL, 15, NULL, 89);
INSERT INTO `web_order` VALUES (199, 2, NULL, 'GGCTCCTGGCAAAAGGTCA', 'CTGCGTAGTTGTGCTGATGT', 0.30, 39, 11.70, '2021-04-15 15:54:00.578207', '2021-04-16 10:15:31.855134', 3, 'QPCR', 0, NULL, 25, NULL, 6, 119, 94);
INSERT INTO `web_order` VALUES (200, 2, NULL, 'CTGCCGCTTTGCAGGTGTA', 'CATTGTGGGCAAGGTGCTATT', 0.30, 40, 12.00, '2021-04-15 15:55:31.621299', '2021-04-16 10:15:37.489743', 3, 'QPCR', 0, NULL, 25, NULL, 6, 109, 95);
INSERT INTO `web_order` VALUES (201, 2, NULL, 'CAAGCACTGCCGACTACAATA', 'CCAGGCTGATTCATCCCACTG', 0.30, 42, 12.60, '2021-04-15 15:56:38.209765', '2021-04-16 10:15:43.489018', 3, 'QPCR', 0, NULL, 25, NULL, 6, 145, 96);
INSERT INTO `web_order` VALUES (202, 2, NULL, 'GCTGCGAAGTGGAAACCATC', 'CCTCCTTCTGCACACATTTGAA', 0.30, 42, 12.60, '2021-04-15 15:57:42.970669', '2021-04-16 10:15:49.267439', 3, 'QPCR', 0, NULL, 25, NULL, 6, 135, 97);
INSERT INTO `web_order` VALUES (203, 0, NULL, NULL, NULL, 380.00, 1, 380.00, '2021-04-15 16:37:37.169934', '2021-04-16 10:15:55.880667', 3, '250T', 0, NULL, 25, 67, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (204, 0, NULL, NULL, NULL, 1000.00, 1, 1000.00, '2021-04-15 16:38:26.958775', '2021-04-16 10:24:10.077398', 3, '实验室耗材', 1, NULL, 12, 36, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (205, 0, NULL, NULL, NULL, 220.00, 2, 440.00, '2021-04-15 16:39:21.352885', '2021-04-16 10:24:04.881563', 3, '实验室耗材', 1, NULL, 12, 68, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (206, 0, NULL, NULL, NULL, 585.00, 1, 585.00, '2021-04-15 16:39:58.358512', '2021-04-16 10:23:59.614553', 3, '实验室耗材', 1, NULL, 11, 39, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (207, 0, NULL, NULL, NULL, 570.00, 1, 570.00, '2021-04-15 16:40:36.966731', '2021-04-16 10:23:54.255167', 3, '实验室耗材', 1, NULL, 11, 12, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (210, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-04-16 13:40:33.107464', '2021-04-19 14:35:08.914237', 3, 'RAB35突变体1和突变体2的菌液各一个样品', 0, NULL, 32, NULL, 12, NULL, 86);
INSERT INTO `web_order` VALUES (211, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-16 13:41:24.768832', '2021-04-19 14:35:14.662184', 3, 'TXN2突变体菌液样品', 0, NULL, 32, NULL, 12, NULL, 85);
INSERT INTO `web_order` VALUES (212, 1, NULL, NULL, NULL, 10.00, 3, 30.00, '2021-04-18 20:40:46.312966', '2021-04-19 14:38:19.677663', 3, '本科生毕业论文实验-过表达/干扰质粒构建', 0, NULL, 4, NULL, 15, NULL, 87);
INSERT INTO `web_order` VALUES (213, 2, NULL, 'CTTCAACTCTACGAGGCA', 'GTGTTCATTCAGGGCATT', 0.30, 36, 10.80, '2021-04-18 20:42:10.525728', '2021-04-19 14:38:13.927468', 3, '本科生毕业实验，qpcr引物设计', 0, NULL, 4, NULL, 15, 155, 87);
INSERT INTO `web_order` VALUES (214, 0, NULL, NULL, NULL, 900.00, 2, 1800.00, '2021-04-20 17:59:15.327991', '2021-04-21 11:55:21.753910', 3, '细胞转染', 0, NULL, 7, 7, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (215, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-21 16:24:24.343125', '2021-04-21 21:00:22.085157', 3, '第一次送TXN2测序出现了一个缺失和一个同义突变，所以想再送个样测最后一次', 0, NULL, 32, NULL, 12, NULL, 85);
INSERT INTO `web_order` VALUES (216, 2, NULL, 'CGAGTTCATCCTCCTCAATC', 'TCTTTCAGCTTCTTCGAGCC', 0.30, 40, 12.00, '2021-04-21 17:10:34.065265', '2021-04-21 21:00:29.615683', 3, '金青春、肖渝霖科研训练', 0, NULL, 4, NULL, 4, 506, 99);
INSERT INTO `web_order` VALUES (217, 2, NULL, 'AATCAGTATTGCCACCTCTC', 'ACTCCTGCGTGAATACGTTG', 0.30, 40, 12.00, '2021-04-21 20:51:07.562498', '2021-04-21 21:00:37.320355', 3, '涡虫神经系统相关基因', 0, NULL, 4, NULL, 4, 669, 100);
INSERT INTO `web_order` VALUES (218, 0, NULL, NULL, NULL, 10.00, 20, 170.00, '2021-04-22 09:13:52.263275', '2021-04-22 19:42:29.159275', 3, '拍共聚焦用皿', 1, NULL, 14, 70, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (219, 2, NULL, 'TCGGTTGCATGAAGGC', 'TTGCTATCCATGGTAAGGG', 0.30, 35, 10.50, '2021-04-22 09:26:47.267853', '2021-04-22 19:42:37.270221', 3, '大熊猫核基因', 0, NULL, 4, NULL, 10, 631, 101);
INSERT INTO `web_order` VALUES (220, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2021-04-23 09:59:13.036347', '2021-04-25 13:40:03.594756', 3, 'RNA反转录试剂盒', 0, NULL, 15, 18, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (221, 2, NULL, 'CCGGGCGAAATCTGTGGTTGTAAATCTCGAGATTTACAACCACAGATTTCGCTTTTTTG', 'AATTCAAAAAAGCGAAATCTGTGGTTGTAAATCTCGAGATTTACAACCACAGATTTCGC', 0.30, 118, 35.40, '2021-04-25 16:07:47.954351', '2021-04-25 16:15:30.363894', 3, '构建干扰载体', 0, NULL, 25, NULL, 6, 21, 102);
INSERT INTO `web_order` VALUES (222, 0, NULL, NULL, NULL, 1024.00, 1, 1024.00, '2021-04-25 16:11:38.126165', '2021-04-25 16:15:35.734496', 3, '免疫荧光', 1, NULL, 23, 71, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (223, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCACTCTTATCACGAGGACCACAGC', 'AAA', 0.30, 44, 13.20, '2021-04-26 15:37:03.512659', '2021-04-26 16:04:49.001389', 3, 'Luciferase assay, 截断NDUFV1启动子区域', 0, NULL, 4, NULL, 3, 1100, 103);
INSERT INTO `web_order` VALUES (224, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCTGCATCCTCTCTGCCTCACC', 'AAA', 0.30, 42, 12.60, '2021-04-26 15:37:56.350256', '2021-04-26 16:04:57.133887', 3, 'NDUFV1启动子', 0, NULL, 4, NULL, 3, 698, 104);
INSERT INTO `web_order` VALUES (225, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCGACATGCGAGGTTTGTTTACTT', 'AAA', 0.30, 45, 13.50, '2021-04-26 15:44:28.242121', '2021-04-26 16:05:05.022705', 3, 'NDUFV1启动子-300-100', 0, NULL, 4, NULL, 3, 400, 105);
INSERT INTO `web_order` VALUES (226, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-28 15:09:17.976107', '2021-04-28 17:08:31.188401', 3, '双荧光', 0, NULL, 4, NULL, 3, NULL, 105);
INSERT INTO `web_order` VALUES (227, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-28 15:09:46.558699', '2021-04-28 17:08:38.198750', 3, '双荧光', 0, NULL, 4, NULL, 3, NULL, 103);
INSERT INTO `web_order` VALUES (228, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-28 15:10:13.478935', '2021-04-28 17:09:44.077507', 3, '双荧光', 0, NULL, 4, NULL, 3, NULL, 104);
INSERT INTO `web_order` VALUES (229, 2, NULL, 'CTACCGGACTCAGATCTCGAGGCCACCATGGACAACTACGC', 'ATGGTGGCGACCGGTGGATCCGCGAAGGGGTTGCCTTCTTCAGC', 0.30, 85, 25.50, '2021-04-29 15:41:26.041492', '2021-04-29 15:44:37.365917', 3, '构载体', 0, NULL, 25, NULL, 6, 762, 106);
INSERT INTO `web_order` VALUES (230, 0, NULL, NULL, NULL, 100.00, 2, 200.00, '2021-04-30 08:41:22.373205', '2021-04-30 10:04:45.069876', 3, '一包10管，', 0, NULL, 25, 74, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (231, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-04-30 14:48:27.060178', '2021-04-30 18:09:38.381323', 3, '验证载体是否构建成功', 0, NULL, 4, NULL, 6, NULL, 102);
INSERT INTO `web_order` VALUES (232, 2, NULL, 'CCCAAGCTTATGGTGAGCAAGGGCGAG', 'A', 0.30, 27, 8.10, '2021-05-01 18:10:54.425060', NULL, 2, '无', 0, '实验室有现成的', 4, NULL, 17, 738, 84);
INSERT INTO `web_order` VALUES (233, 0, NULL, NULL, NULL, 360.00, 1, 360.00, '2021-05-02 11:14:27.380574', '2021-05-06 10:21:22.201241', 3, '质粒小提试剂盒', 1, NULL, 30, 9, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (234, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-05-05 15:58:13.243312', '2021-05-10 14:26:50.619768', 3, '验证载体', 0, NULL, 25, NULL, 17, NULL, 84);
INSERT INTO `web_order` VALUES (236, 2, NULL, 'CCCAAGTAGTTGGGGCCACAG', 'AGCTTGTTTATGACAGGAATTAG', 0.30, 44, 13.20, '2021-05-07 15:40:50.655427', '2021-05-07 21:18:02.356975', 3, '同源重组第一次扩增', 0, NULL, 4, NULL, 10, 2100, 108);
INSERT INTO `web_order` VALUES (237, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCCCAAGTAGTTGGGGCCACA', 'TTACCAACAGTACCGGAATTCAGCTTGTTTATGACAGGAATTAG', 0.30, 85, 25.50, '2021-05-07 15:42:31.008655', '2021-05-07 21:17:49.360365', 3, '同源重组第二次扩增', 0, NULL, 4, NULL, 10, 2100, 108);
INSERT INTO `web_order` VALUES (238, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-05-07 16:01:10.049865', '2021-05-07 21:17:33.609789', 3, '鉴定载体是否构建成功', 0, NULL, 25, NULL, 6, NULL, 106);
INSERT INTO `web_order` VALUES (239, 0, NULL, NULL, NULL, 436.00, 1, 436.00, '2021-05-11 11:15:01.201569', '2021-05-11 11:34:24.413177', 3, '实验室用50ML离心管', 1, NULL, 13, 14, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (240, 0, NULL, NULL, NULL, 1950.00, 2, 4200.00, '2021-05-11 11:17:29.900268', '2021-05-11 11:34:30.471830', 3, '细胞培养', 1, NULL, 5, 4, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (241, 2, NULL, 'TGTAGAGACTGGGTTTTGCCGTGTTGCGGCGTAGAGGATCGAGATCTTGTAGAGACTGGGTTTTGCCG', 'TTACCAACAGTACCGGAATTCACAGGAATTAGCGCCTCCATGACAGGAATTAGCGCCTCCATGACTCT', 0.30, 137, 41.10, '2021-05-14 10:31:39.984350', '2021-05-14 10:50:36.452080', 3, 'DRP1启动子区域从基因组扩增，', 0, NULL, 4, NULL, 3, 2100, 109);
INSERT INTO `web_order` VALUES (242, 0, NULL, NULL, NULL, 1650.00, 1, 1650.00, '2021-05-14 10:49:12.324006', '2021-05-14 10:50:52.880420', 3, '双荧光素酶试剂盒', 1, NULL, 33, 75, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (243, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-05-16 14:59:02.066396', '2021-05-17 09:43:12.253583', 3, 'p3Flag-CMV7.1菌液测序', 0, NULL, 4, NULL, 3, NULL, 110);
INSERT INTO `web_order` VALUES (244, 0, NULL, NULL, NULL, 15.00, 3, 45.00, '2021-05-18 09:51:55.856516', '2021-05-18 13:52:40.929040', 3, '灭菌条已用完', 0, NULL, 14, 76, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (245, 0, NULL, NULL, NULL, 10.00, 3, 30.00, '2021-05-18 09:52:39.077920', '2021-05-18 13:52:35.559244', 3, '便签纸已用完', 0, NULL, 14, 77, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (246, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCTGCTTCTGCTTCCTAAAGTG', 'CTCTTCTGCTTCCCTAAAGTGCTGGAGCAGAAGCAGGAGGATCGCTTGAGC', 0.30, 94, 28.20, '2021-05-20 16:37:25.294212', '2021-05-20 17:35:28.624978', 3, 'DRP1启动子区域，2100长度扩增不出来，合成引物分段扩增', 0, NULL, 4, NULL, 3, 1100, 108);
INSERT INTO `web_order` VALUES (247, 0, NULL, NULL, NULL, 1704.65, 1, 1704.65, '2021-05-20 17:37:35.594104', '2021-05-21 17:09:17.960300', 3, 'Flag免疫磁珠', 1, NULL, 10, 8, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (248, 0, NULL, NULL, NULL, 332.00, 1, 332.00, '2021-05-21 17:05:33.203671', '2021-05-21 17:08:31.064928', 3, 'QPCR MIX', 0, NULL, 35, 78, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (249, 0, NULL, NULL, NULL, 351.00, 1, 351.00, '2021-05-21 17:13:59.512564', '2021-05-21 17:17:15.322601', 3, '免疫共沉淀', 1, NULL, 36, 79, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (250, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-05-24 20:40:13.737069', '2021-05-25 16:02:44.142212', 3, 'DRP1promoter区域', 0, NULL, 4, NULL, 3, NULL, 109);
INSERT INTO `web_order` VALUES (251, 0, NULL, NULL, NULL, 500.00, 1, 500.00, '2021-05-26 11:13:28.790651', NULL, 0, '细胞冻存', 0, NULL, 14, 17, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (252, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-05-27 09:55:08.799870', '2021-05-27 18:32:58.365520', 3, '本科生科研训练', 0, NULL, 4, NULL, 4, NULL, 111);
INSERT INTO `web_order` VALUES (253, 0, NULL, NULL, NULL, 56.00, 1, 56.00, '2021-05-31 17:34:36.111217', '2021-05-31 17:38:56.543087', 3, '葡萄糖', 0, NULL, 37, 80, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (254, 0, NULL, NULL, NULL, 7.00, 25, 175.00, '2021-05-31 19:20:04.914822', '2021-06-01 19:02:55.252870', 3, '过滤膜', 0, NULL, 14, 21, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (255, 0, NULL, NULL, NULL, 7.00, 25, 175.00, '2021-05-31 19:21:03.646703', '2021-06-01 19:03:04.581962', 3, '过滤膜', 0, NULL, 14, 81, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (257, 0, NULL, NULL, NULL, 65.00, 20, 1300.00, '2021-06-02 10:15:50.710831', '2021-06-02 13:19:12.581465', 3, '细胞培养基', 1, NULL, 18, 34, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (258, 2, NULL, 'GCCACCATGGCTACTCAAGCTGATTTGA', 'CAGGTCAGTATCAAACCAGGC', 0.30, 49, 14.70, '2021-06-02 10:58:54.088081', '2021-06-02 13:19:22.916491', 3, '载体构建', 0, NULL, 25, NULL, 6, 2346, 112);
INSERT INTO `web_order` VALUES (259, 2, NULL, 'CTAGCGTTTAAACTTAAGCTTGCCACCATGGCTACTCAAGC', 'GTGATCCTTGTAATCGGATCCCAGGTCAGTATCAAACCAGGCC', 0.30, 84, 25.20, '2021-06-02 11:00:27.440864', '2021-06-02 13:19:35.996312', 3, '载体构建', 0, NULL, 25, NULL, 6, 2346, 112);
INSERT INTO `web_order` VALUES (260, 0, NULL, NULL, NULL, 100.00, 3, 300.00, '2021-06-02 11:21:33.982662', '2021-06-02 13:19:50.587930', 3, '不含谷氨酰胺培养基，用于筛选', 0, NULL, 6, 83, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (261, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-06-03 20:44:27.532032', '2021-06-07 14:45:20.883894', 3, '本科科研训练', 0, NULL, 4, NULL, 4, NULL, 111);
INSERT INTO `web_order` VALUES (262, 1, NULL, NULL, NULL, 10.00, 3, 30.00, '2021-06-07 14:43:24.612274', '2021-06-07 14:45:30.199564', 3, '测通，鉴定载体是否构建成功', 0, NULL, 25, NULL, 6, NULL, 112);
INSERT INTO `web_order` VALUES (263, 2, NULL, 'TCCAAACAAATAGCCAAAGC', 'TAATACGACTCACTATAGGTGTCCTCCATAAGATCCAACA', 0.30, 60, 18.00, '2021-06-10 12:30:11.681249', '2021-06-11 09:51:58.971089', 3, '无', 0, NULL, 25, NULL, 11, 763, 113);
INSERT INTO `web_order` VALUES (264, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-06-10 18:02:31.540164', '2021-06-11 09:51:48.883493', 3, '涡虫RNAi', 0, NULL, 4, NULL, 4, NULL, 114);
INSERT INTO `web_order` VALUES (265, 1, NULL, NULL, NULL, 10.00, 3, 30.00, '2021-06-11 09:37:01.286314', '2021-06-11 09:51:39.122866', 3, '鉴定载体是否构建成功', 0, NULL, 4, NULL, 6, NULL, 112);
INSERT INTO `web_order` VALUES (267, 0, NULL, NULL, NULL, 585.00, 1, 585.00, '2021-06-15 10:08:04.977423', '2021-06-15 10:17:23.332186', 3, '细胞培养', 0, NULL, 11, 15, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (268, 2, NULL, 'GTCATCCTTGTAATCGAATTC', 'GTCATCCTTGTAATCGAATTCCTGTTCCAATGTCACCACCTCC', 0.30, 43, 12.90, '2021-06-16 11:32:35.464109', '2021-06-16 11:55:11.341984', 3, '构建NRF1-Flag载体', 0, NULL, 4, NULL, 3, 1500, 76);
INSERT INTO `web_order` VALUES (269, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-06-16 17:32:10.238160', '2021-06-16 17:34:02.697792', 3, '无', 0, NULL, 4, NULL, 11, NULL, 113);
INSERT INTO `web_order` VALUES (270, 0, NULL, NULL, NULL, 950.00, 1, 950.00, '2021-06-17 16:16:00.135884', NULL, 2, '中号绿色手套', 0, NULL, 12, 84, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (271, 0, NULL, NULL, NULL, 471.00, 1, 471.00, '2021-06-17 16:17:51.433869', '2021-06-18 11:43:16.837257', 3, '涡虫RNA干扰合成dsRNA', 0, NULL, 15, 85, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (272, 0, NULL, NULL, NULL, 640.00, 1, 640.00, '2021-06-17 16:18:53.885772', '2021-06-18 11:43:10.784626', 3, '涡虫RNA干扰合成dsRNA', 0, NULL, 16, 86, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (273, 2, NULL, 'AGCTGAGAGGGAAATTGTGCG', 'GCAACGGAACCGCTCATT', 0.30, 40, 12.00, '2021-06-17 19:33:13.603851', '2021-06-18 11:38:00.463454', 3, 'β-actin qPCR内参 CHO细胞', 0, NULL, 4, NULL, 13, 163, 116);
INSERT INTO `web_order` VALUES (274, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-06-18 16:15:40.288306', '2021-06-18 17:27:41.567790', 3, 'NRF1-Flag标签载体', 0, NULL, 25, NULL, 3, NULL, 76);
INSERT INTO `web_order` VALUES (275, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-06-18 16:20:01.949044', '2021-06-18 17:27:34.187960', 3, '测序', 0, NULL, 4, NULL, 4, NULL, 114);
INSERT INTO `web_order` VALUES (276, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-06-20 13:53:07.072079', '2021-06-21 09:45:58.222052', 3, '无', 0, NULL, 4, NULL, 11, NULL, 113);
INSERT INTO `web_order` VALUES (277, 2, NULL, 'AGCGGGATTACGTCTTCTACC', 'CATGCCCACGAGTCCATCTTT', 0.30, 42, 12.60, '2021-06-20 18:59:01.211115', '2021-06-21 09:46:04.814978', 3, 'QPCR', 0, NULL, 25, NULL, 6, 170, 117);
INSERT INTO `web_order` VALUES (278, 2, NULL, 'CGACCCCAATTAAGGACATCC', 'GCGAGGCTGGTAGCCATATTT', 0.30, 42, 12.60, '2021-06-20 19:00:09.130873', '2021-06-21 09:46:11.968330', 3, 'QPCR', 0, NULL, 25, NULL, 6, 102, 118);
INSERT INTO `web_order` VALUES (279, 2, NULL, 'GAGGTGCTATCTCGGAGACAC', 'GCCAATCCCACTAGGGAGAAC', 0.30, 42, 12.60, '2021-06-20 19:01:14.986748', '2021-06-21 09:46:17.555474', 3, 'QPCR', 0, NULL, 25, NULL, 6, 114, 119);
INSERT INTO `web_order` VALUES (280, 0, NULL, NULL, NULL, 310.00, 1, 310.00, '2021-06-20 19:06:35.686952', '2021-06-21 09:46:22.767284', 3, 'QPCR', 0, NULL, 14, 26, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (281, 2, NULL, 'TAATACGACTCACTATAGGACCTCACAAACTTAGCGAATG', 'TAATACGACTCACTATAGGAATAGACGCCGGACCAA', 0.30, 76, 22.80, '2021-06-22 10:56:02.034452', '2021-06-22 11:22:45.180954', 3, '涡虫神经系统相关基因', 0, NULL, 4, NULL, 4, 784, 120);
INSERT INTO `web_order` VALUES (282, 2, NULL, 'TAATACGACTCACTATAGGGATAATATGTCCGAGTTCC', 'TAATACGACTCACTATAGGTCTTCATCAGTCTGCCTTG', 0.30, 76, 22.80, '2021-06-22 10:57:28.553514', '2021-06-22 11:22:40.669112', 3, '涡虫神经系统相关基因', 0, NULL, 4, NULL, 4, 527, 121);
INSERT INTO `web_order` VALUES (283, 2, NULL, 'TAATACGACTCACTATAGGATGATTGTCAGACATGTGTTGC', 'TAATACGACTCACTATAGGCCTTCTCAATTGTCATGGTTG', 0.30, 81, 24.30, '2021-06-22 10:58:33.089661', '2021-06-22 11:22:35.754318', 3, '涡虫神经系统相关基因', 0, NULL, 4, NULL, 4, 585, 122);
INSERT INTO `web_order` VALUES (284, 2, NULL, 'TAATACGACTCACTATAGGTCATAACCGGATGCTCAA', 'TAATACGACTCACTATAGGGCCAACGCAAGACTCTGT', 0.30, 74, 22.20, '2021-06-22 11:00:06.616804', '2021-06-22 11:22:31.061651', 3, '涡虫神经系统相关基因', 0, NULL, 4, NULL, 4, 626, 123);
INSERT INTO `web_order` VALUES (285, 2, NULL, 'TAATACGACTCACTATAGGCAATGGCATTATTGCTGAG', 'TAATACGACTCACTATAGGGCGGCATGTTGAAAGTGAA', 0.30, 76, 22.80, '2021-06-22 11:01:47.712250', NULL, 2, '涡虫神经系统相关基因', 0, NULL, 25, NULL, 4, 829, 114);
INSERT INTO `web_order` VALUES (286, 2, NULL, 'TAATACGACTCACTATAGGAATAAACCCGAGGACGAG', 'TAATACGACTCACTATAGGAAGATGCTGCCATAGGAA', 0.30, 74, 22.20, '2021-06-22 11:03:34.729062', '2021-06-22 11:22:25.839286', 3, '涡虫神经系统相关基因', 0, NULL, 25, NULL, 4, 610, 124);
INSERT INTO `web_order` VALUES (287, 2, NULL, 'TAATACGACTCACTATAGGGGAAGTACCCGGACACG', 'TAATACGACTCACTATAGGAGACATTCTCGGCACGA', 0.30, 72, 21.60, '2021-06-22 11:05:06.357255', '2021-06-22 11:22:21.079258', 3, '涡虫神经系统再生相关基因', 0, NULL, 25, NULL, 4, 566, 125);
INSERT INTO `web_order` VALUES (289, 0, NULL, NULL, NULL, 560.00, 1, 560.00, '2021-06-24 15:37:46.983377', '2021-06-24 15:49:52.356383', 3, '实验室用大号手套', 0, NULL, 28, 87, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (290, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-06-25 11:02:50.145332', '2021-06-25 11:25:51.096021', 3, 'NRF1-Flag标签载体构建', 0, NULL, 25, NULL, 3, NULL, 76);
INSERT INTO `web_order` VALUES (291, 2, NULL, 'AACTGCTGGACATCGCTTGCT', 'CATTCTTCACGTAGGTGCTGGA', 0.30, 43, 12.90, '2021-06-25 12:00:10.441454', '2021-06-25 12:16:07.782393', 3, 'QPCR', 0, NULL, 25, NULL, 6, 100, 126);
INSERT INTO `web_order` VALUES (292, 2, NULL, 'TTGCTCTCTGCCAGCGGTACTA', 'GCAGTCAGTAACCACCATCGGA', 0.30, 44, 13.20, '2021-06-25 12:01:12.906370', '2021-06-25 12:16:01.788939', 3, 'qpcr', 0, NULL, 25, NULL, 6, 110, 127);
INSERT INTO `web_order` VALUES (293, 2, NULL, 'TGATCTCCACGTTCACCCTGA', 'TCTCCGAGTCAAACCTTCCGA', 0.30, 42, 12.60, '2021-06-25 12:02:19.844371', '2021-06-25 12:15:56.676377', 3, 'qpcr', 0, NULL, 25, NULL, 6, 100, 128);
INSERT INTO `web_order` VALUES (294, 2, NULL, 'ACGTTACAGCGTCCAGCTCAT', 'TCTTTGGAGCTCGCATTGG', 0.30, 40, 12.00, '2021-06-25 12:03:17.041508', '2021-06-25 12:15:51.094680', 3, 'qpcr', 0, NULL, 25, NULL, 6, 110, 129);
INSERT INTO `web_order` VALUES (295, 2, NULL, 'GATCCCAGCTCTCCTCAATACG', 'GCCATTTTTGCACCGTGTG', 0.30, 41, 12.30, '2021-06-25 12:04:13.034892', '2021-06-25 12:15:44.588436', 3, 'qpcr', 0, NULL, 25, NULL, 6, 105, 130);
INSERT INTO `web_order` VALUES (296, 2, NULL, 'AGCCAGATTCCTGCATCAGTG', 'ATAACCTGCATCCTTCCAGCC', 0.30, 42, 12.60, '2021-06-25 12:05:10.389340', '2021-06-25 12:15:39.015524', 3, 'qpcr', 0, NULL, 25, NULL, 6, 100, 131);
INSERT INTO `web_order` VALUES (297, 0, NULL, NULL, NULL, 1900.00, 1, 1900.00, '2021-06-25 12:13:02.032821', '2021-06-28 10:59:16.792841', 3, 'Western曝光', 0, NULL, 26, 88, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (298, 0, NULL, NULL, NULL, 2100.00, 2, 4200.00, '2021-06-28 10:57:37.910878', '2021-06-28 10:59:10.253331', 3, '.', 1, NULL, 5, 4, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (299, 2, NULL, 'TTCAACTGGTACGTGGACGG', 'GTGCTCGCCGCATAAATCAG', 0.30, 40, 12.00, '2021-06-29 10:45:17.545423', '2021-06-29 11:18:57.167959', 3, 'BMC', 0, NULL, 4, NULL, 13, 821, 134);
INSERT INTO `web_order` VALUES (300, 2, NULL, 'CGGGAGGAGCAGTACAACAG', 'GTACACCTGTGGTTCTCGGG', 0.30, 40, 12.00, '2021-06-29 10:49:42.598869', '2021-06-29 11:19:04.590123', 3, 'BMC', 0, NULL, 4, NULL, 13, 174, 134);
INSERT INTO `web_order` VALUES (301, 0, NULL, NULL, NULL, 130.00, 1, 130.00, '2021-06-29 19:11:52.287789', '2021-06-29 19:14:22.837565', 3, '实验室公共试剂', 0, NULL, 39, 24, 15, NULL, NULL);
INSERT INTO `web_order` VALUES (303, 0, NULL, NULL, NULL, 100.00, 1, 100.00, '2021-06-29 19:15:07.792639', '2021-07-01 19:27:43.226630', 3, '实验室公共试剂', 0, NULL, 25, 74, 15, NULL, NULL);
INSERT INTO `web_order` VALUES (304, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-07-01 18:19:33.440972', '2021-07-01 19:27:51.177766', 3, '测序', 0, NULL, 4, NULL, 4, NULL, 125);
INSERT INTO `web_order` VALUES (305, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-07-01 18:20:02.064272', '2021-07-01 19:27:35.382033', 3, '测序', 0, NULL, 4, NULL, 4, NULL, 120);
INSERT INTO `web_order` VALUES (306, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-07-01 18:20:37.689719', '2021-07-01 19:27:28.294003', 3, '测序', 0, NULL, 4, NULL, 4, NULL, 123);
INSERT INTO `web_order` VALUES (307, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-07-01 18:21:01.436774', '2021-07-01 19:27:21.337560', 3, '测序', 0, NULL, 4, NULL, 4, NULL, 122);
INSERT INTO `web_order` VALUES (308, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-07-02 15:43:50.477913', '2021-07-02 15:45:55.834221', 3, '测序', 0, NULL, 25, NULL, 4, NULL, 121);
INSERT INTO `web_order` VALUES (309, 2, NULL, 'ATGGAGCTGGAGGACGGTGTGGGCACATGTTCAGAAGGAAGACGG', 'CCTGCACTCTACCGTCTTCCTCTCATTGCCATACATCACTTGCC', 0.30, 89, 26.70, '2021-07-05 16:57:45.617684', '2021-07-05 17:45:38.485146', 3, 'JLP分段扩增，载体构建（验证JLP与PLK1互作）', 0, NULL, 25, NULL, 15, 3933, 135);
INSERT INTO `web_order` VALUES (310, 2, NULL, 'ACTTCTGAGGCAGACTCCAGC', 'ACTTCTGAGGCAGACTCCAGC', 0.30, 21, 6.30, '2021-07-06 19:14:11.671068', '2021-07-07 12:18:54.589005', 3, 'JLP分段载体构建，反向引物设计', 0, NULL, 25, NULL, 15, 1930, 135);
INSERT INTO `web_order` VALUES (311, 2, NULL, 'CACAGCGAACAATCAGAATC', 'TGAACCAAGCCTTGACATAA', 0.30, 79, 23.70, '2021-07-07 14:05:33.826811', '2021-07-07 16:27:31.728310', 3, 'plk1QPCR引物，检测PLK1是否抑制成功', 0, NULL, 25, NULL, 11, 212, 136);
INSERT INTO `web_order` VALUES (313, 2, NULL, 'CTTGGTACCGAGCTCGGATCCATGTTTGATATTGAATATTTCAGAAAAGAT', 'GTCATCCTTGTAATCGAATTCTGATTTGTTTGATGGATAGTTCATGT', 0.30, 1, 29.40, '2021-07-07 17:12:29.471689', '2021-07-08 09:50:47.558413', 3, 'SIRT1-FLAG，同源重组', 0, NULL, 4, NULL, 19, 98, 137);
INSERT INTO `web_order` VALUES (314, 2, NULL, 'ATGCCGCTGACTGGTGTAGA', 'GTCTGAAAGGGAAGGAGAAC', 0.30, 1, 12.00, '2021-07-07 17:15:34.311326', '2021-07-08 09:50:52.660990', 3, '扩增TAF2-CDS；TAF2,  TATA-box binding protein associated factor 2; HitPredict 网站预测TAF2与SIRT1互作。', 0, NULL, 4, NULL, 19, 40, 138);
INSERT INTO `web_order` VALUES (315, 2, NULL, 'CTTGGTACCGAGCTCGGATCCATGCCGCTGACTGGTGTAGAG', 'AACATCGTATGGGTAGAATTCGTCTGAAAGGGAAGGAGAACGA', 0.30, 1, 25.50, '2021-07-07 17:18:16.075145', '2021-07-08 09:50:59.211863', 3, '无TAF2的抗体，给TAF2加HA标签；同源重组加HA。', 0, NULL, 4, NULL, 19, 85, 138);
INSERT INTO `web_order` VALUES (316, 2, NULL, 'CTCAACTGGTGTCGTGGAGTCGGCAATTCAGTTGAGACCACA', 'GCCGAGTCAAATGCTCAGAC', 0.30, 1, 18.60, '2021-07-07 17:33:04.910255', '2021-07-08 09:51:05.042274', 3, 'hsa-miR-105-5p 逆转录引物。\nDIANA TOOLS 预测 hsa-miR-105-5p 与TAF2互作，Score 0.9887; 与 SIRT1互作，Score 0.9157。\n\nhsa-miR-105-5p qPCR 正向引物。', 0, NULL, 4, NULL, 19, 62, 139);
INSERT INTO `web_order` VALUES (317, 2, NULL, 'CTCAACTGGTGTCGTGGAGTCGGCAATTCAGTTGAGTATTGA', 'GCCGAGTTCACTGGAGTTTG', 0.30, 1, 18.60, '2021-07-07 17:37:34.756515', '2021-07-08 09:51:14.419751', 3, 'hsa-miR-653-3p 逆转录引物。\nDIANA TOOLS 预测 hsa-miR-653-3p 与TAF2互作，Score 0.9744; 与 SIRT1互作，Score 0.7684。\n\nhsa-miR-653-3p qPCR 正向引物。', 0, NULL, 4, NULL, 19, 62, 140);
INSERT INTO `web_order` VALUES (318, 0, NULL, NULL, NULL, 500.00, 1, 500.00, '2021-07-08 09:49:13.155704', NULL, 2, '500一箱', 0, NULL, 14, 17, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (320, 0, NULL, NULL, NULL, 585.00, 1, 585.00, '2021-07-08 11:09:37.269004', '2021-07-08 11:16:50.809808', 3, '细胞培养板', 0, NULL, 11, 12, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (321, 2, NULL, 'TCCGCTTGCCACCATGGA', 'TCCGCTTGCCACCATGGA', 0.30, 18, 5.40, '2021-07-08 11:13:14.114345', '2021-07-08 11:16:27.010174', 3, 'JLP正相引物合成前后两段拼接', 0, NULL, 25, NULL, 15, 1916, 135);
INSERT INTO `web_order` VALUES (322, 2, NULL, 'GTGTTAATGAGTACCGCCAT', 'GGAAGCCGGATTATCCTTCT', 0.30, 1, 12.00, '2021-07-08 11:14:54.400212', '2021-07-08 11:16:39.069754', 3, 'TAF qPCR 引物', 0, NULL, 4, NULL, 19, 40, 138);
INSERT INTO `web_order` VALUES (323, 2, NULL, 'CCATCACTTGGACACAAGT', 'AATCCCTGCAACCTGTTC', 0.30, 37, 11.10, '2021-07-08 11:19:58.360251', '2021-07-08 11:20:55.379288', 3, '涡虫sirt1基因的qPCR引物', 0, NULL, 25, NULL, 4, 102, 141);
INSERT INTO `web_order` VALUES (324, 0, NULL, NULL, NULL, 25.00, 20, 500.00, '2021-07-08 11:24:06.134569', '2021-07-08 11:25:34.997665', 3, '细胞冻存', 0, NULL, 11, 17, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (325, 0, NULL, NULL, NULL, 851.00, 1, 851.00, '2021-07-08 16:09:13.003690', '2021-07-08 16:53:49.428820', 3, '实验室公用RNA提取试剂', 0, NULL, 15, 19, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (326, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2021-07-08 16:46:22.530474', '2021-07-08 16:53:44.215655', 3, 'RNA反转试剂盒', 0, NULL, 15, 18, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (327, 2, NULL, 'AGGACCACCGCATCTCTACAT', 'AAGTCTGGCTCGTTCTCAGTG', 0.30, 42, 12.60, '2021-07-08 18:50:24.009690', '2021-07-13 11:24:55.306644', 3, 'QPCR', 0, NULL, 25, NULL, 6, 118, 142);
INSERT INTO `web_order` VALUES (328, 0, NULL, NULL, NULL, 650.00, 1, 650.00, '2021-07-13 11:29:02.326843', NULL, 2, 'PCR酶，一包5个，1mL/个', 0, NULL, 25, 89, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (329, 2, NULL, 'CGCTTCACGAATTTGCGTGTC', 'A', 0.30, 1, 6.30, '2021-07-13 13:46:47.752638', '2021-07-14 10:49:00.670127', 3, 'U6反转录引物。U6作为miRNA-qPCR的对照。', 0, NULL, 4, NULL, 19, 21, 143);
INSERT INTO `web_order` VALUES (330, 0, NULL, NULL, NULL, 800.00, 1, 800.00, '2021-07-14 10:30:01.043296', '2021-08-01 20:44:04.899877', 3, '可用100次。\n（我目前的基因由于序列内有酶切位点，只能通过同源重组来连接。王画妮）', 0, NULL, 40, 90, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (331, 0, NULL, NULL, NULL, 360.00, 1, 360.00, '2021-07-15 16:12:32.709827', '2021-07-15 16:15:04.159098', 3, '质粒提取试剂盒', 0, NULL, 30, 9, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (332, 1, NULL, NULL, NULL, 10.00, 4, 40.00, '2021-07-20 19:30:05.990383', '2021-07-20 19:40:36.748673', 3, '菌液PCR有条带', 0, NULL, 25, NULL, 19, NULL, 138);
INSERT INTO `web_order` VALUES (333, 1, NULL, NULL, NULL, 10.00, 4, 40.00, '2021-07-22 11:07:53.712555', '2021-07-23 11:32:16.281755', 3, 'BMC测序', 0, NULL, 25, NULL, 13, NULL, 134);
INSERT INTO `web_order` VALUES (334, 0, NULL, NULL, NULL, 900.00, 2, 1800.00, '2021-07-23 10:36:16.982240', '2021-07-23 11:33:27.352369', 3, '实验室用转染试剂', 0, NULL, 9, 7, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (335, 0, NULL, NULL, NULL, 585.00, 1, 585.00, '2021-07-23 10:37:35.142126', '2021-07-23 11:33:43.387495', 3, '细胞培养皿', 0, NULL, 11, 15, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (336, 0, NULL, NULL, NULL, 310.00, 1, 310.00, '2021-07-23 11:18:29.065885', '2021-07-23 11:33:51.030666', 3, 'qPCR管 Nest ，以前买的单价是310', 0, NULL, 14, 26, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (337, 0, NULL, NULL, NULL, 593.00, 1, 593.00, '2021-07-27 17:20:20.734614', '2021-07-27 17:29:25.268496', 3, '实验室耗材', 0, NULL, 11, 10, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (338, 0, NULL, NULL, NULL, 1000.00, 1, 1000.00, '2021-07-27 17:24:24.329653', '2021-07-27 17:29:32.774686', 3, '1.0ml枪头', 1, NULL, 12, 36, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (339, 0, NULL, NULL, NULL, 436.00, 1, 436.00, '2021-07-27 17:24:57.004126', '2021-07-27 17:29:44.387666', 3, '细胞培养', 0, NULL, 11, 14, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (340, 0, NULL, NULL, NULL, 270.00, 1, 270.00, '2021-07-27 17:25:29.418929', NULL, 0, '细胞培养', 0, NULL, 11, 13, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (341, 0, NULL, NULL, NULL, 560.00, 1, 560.00, '2021-07-27 17:27:29.305662', '2021-07-27 17:29:52.275720', 3, '实验室用品', 0, NULL, 28, 11, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (342, 0, NULL, NULL, NULL, 350.00, 1, 350.00, '2021-07-28 11:18:31.882365', '2021-07-28 11:24:11.258791', 3, 'hsa-miR-105-5p-mimics（序列：UCAAAUGCUCAGACUCCUGUGGU），2 OD，350元。\n赠mimics-NC 0.5 OD.', 1, NULL, 41, 92, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (343, 0, NULL, NULL, NULL, 350.00, 1, 350.00, '2021-07-28 11:20:00.971742', '2021-07-28 11:24:25.279724', 3, 'hsa-miR-105-5p-inhibitor（序列：ACCACAGGAGUCUGAGCAUUUGA），2 OD，350元。 赠inhibitor-NC 0.5 OD.', 1, NULL, 42, 93, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (344, 0, NULL, NULL, NULL, 350.00, 1, 350.00, '2021-07-28 11:22:35.946133', '2021-07-28 11:24:33.373350', 3, 'hsa-miR-653-3p-mimics（序列：UUCACUGGAGUUUGUUUCAAUA），2 OD，350元。 赠mimics-NC 0.5 OD.', 1, NULL, 42, 94, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (345, 0, NULL, NULL, NULL, 350.00, 1, 350.00, '2021-07-28 11:24:08.290226', '2021-08-01 20:44:49.807253', 3, 'hsa-miR-653-3p-inhibitor（序列：UAUUGAAACAAACUCCAGUGAA），2 OD，350元。 赠inhibitor-NC 0.5 OD.', 1, NULL, 42, 95, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (346, 1, NULL, NULL, NULL, 10.00, 2, 40.00, '2021-07-29 16:58:03.943279', '2021-08-01 20:44:32.502334', 3, '一个样测通，需要两个反应，10元一个反应。测两个样就是40元。', 0, NULL, 4, NULL, 19, NULL, 137);
INSERT INTO `web_order` VALUES (347, 0, NULL, NULL, NULL, 130.00, 2, 260.00, '2021-07-30 10:29:49.082922', '2021-08-01 20:44:24.705968', 3, 'Tise-Base一瓶/500g, TAE，sds-page跑胶用试剂。', 0, NULL, 14, 96, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (348, 2, NULL, 'TATGCGTTCAAAGGTGCTG', 'TTTCATCGTCCTCGTCCAA', 0.30, 38, 11.40, '2021-08-02 16:49:48.871530', '2021-08-02 17:57:48.125280', 3, '涡虫qPCR引物', 0, NULL, 4, NULL, 4, 148, 141);
INSERT INTO `web_order` VALUES (349, 0, NULL, NULL, NULL, 110.00, 20, 2200.00, '2021-08-02 19:04:51.450581', '2021-08-05 11:17:08.549625', 3, '雌性裸鼠', 0, NULL, 43, 97, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (350, 0, NULL, NULL, NULL, 16.00, 10, 160.00, '2021-08-02 19:06:13.581274', '2021-08-05 11:17:14.926389', 3, '10公斤/件', 0, NULL, 43, 98, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (351, 0, NULL, NULL, NULL, 9.00, 10, 90.00, '2021-08-02 19:07:11.983907', '2021-08-05 11:17:20.650878', 3, '10公斤/件', 0, NULL, 43, 99, 12, NULL, NULL);
INSERT INTO `web_order` VALUES (352, 2, NULL, 'AGAAGGATAATCCGGCTTCC', 'A', 0.30, 1, 6.00, '2021-08-02 19:20:24.847920', '2021-08-05 11:17:40.118532', 3, '引物名称：TAF2-OL-F\n邹老师，TAF2基因有约3600bp，直接扩整个基因CDS，我扩不出来。\n所以准备换用Overlap的方式。\n我今天用之前合成的qPCR的引物已经扩出来了CDS 1-1287的片段，现在就要另合成对应的那条引物，来扩增CDS1288-3618的片段。\n两段分别扩增出来后，overlap形成最终的3618bp的完整CDS。', 0, NULL, 4, NULL, 19, 20, 138);
INSERT INTO `web_order` VALUES (353, 2, NULL, 'ATGCTGGCAACACGGCGGCTGCCTTGGTACCGAGCTCGGATCCATGCTGGCAACACGGCGG', 'AGAGGCAGCCTGCCGGGCCTGATGCTGAACATCGTATGGGTAGAATTCAGAGGCAGCCTGCCGGGC', 0.30, 127, 38.10, '2021-08-05 11:03:47.149330', '2021-08-05 11:17:47.693357', 3, '构建NDUFV1-HA标签载体', 0, NULL, 4, NULL, 3, 1365, 49);
INSERT INTO `web_order` VALUES (354, 0, NULL, NULL, NULL, 36.80, 5, 184.00, '2021-08-05 11:14:27.543805', '2021-08-05 11:18:00.160164', 3, '开发票，淘宝购买', 1, NULL, 1, 100, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (355, 0, NULL, NULL, NULL, 21.00, 15, 319.00, '2021-08-06 10:50:02.008911', '2021-08-08 18:52:13.782013', 3, '普通PCR Mix.用于菌落pcr和普通PCR扩增\n1ml/只', 0, NULL, 40, 101, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (356, 0, NULL, NULL, NULL, 100.00, 2, 200.00, '2021-08-08 16:41:32.989432', '2021-08-08 18:52:20.867904', 3, '实验室质粒转化用感受态', 0, NULL, 25, 74, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (357, 2, NULL, 'GTCCGCTTGCCACCATGGA', 'GGTCTGAGATAGACAGGCACAG', 0.30, 41, 12.30, '2021-08-08 22:22:02.109834', '2021-08-08 22:38:15.596266', 3, '构建JLP-EGFP载体引物设计', 0, NULL, 25, NULL, 15, 2014, 135);
INSERT INTO `web_order` VALUES (358, 1, NULL, NULL, NULL, 10.00, 2, 40.00, '2021-08-09 13:59:49.283678', '2021-08-11 13:50:43.621873', 3, 'NDUFV1基因载体测序，菌落PCR测定', 0, NULL, 25, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (359, 0, NULL, NULL, NULL, 1128.00, 1, 1128.00, '2021-08-09 16:57:43.593223', '2021-08-11 13:50:58.460630', 3, '邹老师，我的miRNA mimics/inhibititor, 我转染了，RNA提好了，发现反转录试剂没了。请您批准购买一个新的，谢谢您。', 0, NULL, 39, 18, 19, NULL, NULL);
INSERT INTO `web_order` VALUES (360, 0, NULL, NULL, NULL, 465.14, 1, 465.14, '2021-08-10 18:44:16.126756', '2021-08-11 13:51:06.426598', 3, 'wnt通路抑制剂', 1, NULL, 44, 102, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (361, 1, NULL, NULL, NULL, 10.00, 2, 40.00, '2021-08-16 09:10:13.186472', '2021-08-16 10:10:20.520101', 3, 'NDUFV1构建载体测序', 0, NULL, 25, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (362, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-08-17 10:25:59.445707', '2021-08-17 10:29:36.500541', 3, '基因测序', 0, NULL, 25, NULL, 3, NULL, 49);
INSERT INTO `web_order` VALUES (363, 0, NULL, NULL, NULL, 779.28, 1, 779.28, '2021-08-17 10:28:00.244060', '2021-08-17 10:52:23.150956', 3, 'PLK1抑制剂', 0, NULL, 44, 103, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (365, 0, NULL, NULL, NULL, 517.60, 1, 517.60, '2021-08-17 10:33:48.817881', '2021-08-17 10:36:26.816418', 3, 'sirt1抑制剂', 0, NULL, 44, 105, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (366, 0, NULL, NULL, NULL, 60.00, 20, 1200.00, '2021-08-19 09:47:25.536192', '2021-08-19 23:01:04.465677', 3, '细胞培养', 1, NULL, 18, 6, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (368, 2, NULL, 'CCGGCCTCATGTATTTGAGTCTAATCTCGAGATTAGACTCAAATACATGAGGTTTTTG', 'AATTCAAAAACCTCATGTATTTGAGTCTAATCTCGAGATTAGACTCAAATACATGAGG', 0.30, 116, 34.80, '2021-08-25 09:27:16.337509', '2021-08-26 18:07:03.343704', 3, '干扰NRF1基因', 0, NULL, 4, NULL, 3, 58, 107);
INSERT INTO `web_order` VALUES (369, 0, NULL, NULL, NULL, 70.00, 5, 350.00, '2021-08-26 17:11:50.389242', '2021-08-26 18:06:47.551739', 3, 'IMDM培养基', 0, NULL, 6, 5, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (370, 2, NULL, 'CAATGTACACAATACACCAGGCATCAT', 'ACATCGGAACATGGCCAAGTAAT', 0.30, 50, 15.00, '2021-08-26 17:27:30.860451', '2021-08-26 18:07:08.953757', 3, '多巴胺能神经元标记基因', 0, NULL, 4, NULL, 4, 102, 144);
INSERT INTO `web_order` VALUES (371, 2, NULL, 'ACCACGATTGGAACAAAAGCATCACAT', 'CCCATTGGTTTGCTTTCTGCATTACAC', 0.30, 54, 16.20, '2021-08-26 17:29:14.937201', '2021-08-26 18:07:14.896257', 3, '涡虫章鱼胺能神经元标记物', 0, NULL, 4, NULL, 4, 90, 145);
INSERT INTO `web_order` VALUES (372, 2, NULL, 'AATTGGCAACGATAACAAATGCAT', 'TTTTCCTATATTGATTGATCGGCC', 0.30, 48, 14.40, '2021-08-26 17:55:15.276709', '2021-08-26 18:07:26.282324', 3, '涡虫血清素胺能标记基因', 0, NULL, 4, NULL, 4, 103, 146);
INSERT INTO `web_order` VALUES (373, 2, NULL, 'AGCAGCATCGATTCCAGCTTTGA', 'TGCCCCATAGCACATAAATGCGT', 0.30, 46, 13.80, '2021-08-26 17:56:48.345079', '2021-08-26 18:07:31.160815', 3, '胆碱能神经-涡虫神经系统标记基因', 0, NULL, 4, NULL, 4, 92, 147);
INSERT INTO `web_order` VALUES (374, 2, NULL, 'AAGAGGAAAAATGGATACTGAAAACC', 'ATTTTCAATTCCATTCAGTAAATAGCG', 0.30, 53, 15.90, '2021-08-26 17:58:40.598364', '2021-08-26 18:07:35.991025', 3, 'GABAergic涡虫神经系统标记基因', 0, NULL, 4, NULL, 4, 115, 148);
INSERT INTO `web_order` VALUES (375, 2, NULL, 'AATTGGTTTATGGTCTCCACCTCTT', 'ATTTCTGCACAAGTTCCATGCA', 0.30, 47, 14.10, '2021-08-26 18:00:40.566880', '2021-08-26 18:07:40.656309', 3, '涡虫谷氨酸能神经元标记基因', 0, NULL, 4, NULL, 4, 98, 149);
INSERT INTO `web_order` VALUES (376, 2, NULL, 'GTGTTCGTACATCCTATGGCGATATAACAT', 'TAGACTAATCACAATGGCTATGACGAATGT', 0.30, 60, 18.00, '2021-08-26 18:02:41.950421', '2021-08-26 18:07:45.547363', 3, '涡虫泛神经元标记基因', 0, NULL, 4, NULL, 4, 112, 150);
INSERT INTO `web_order` VALUES (377, 2, NULL, 'CTCATGTGAGTTCAATTCCAAGTTGGA', 'TGGAAGTGGAATACGATCTTGCTTCTT', 0.30, 54, 16.20, '2021-08-26 18:03:56.564767', '2021-08-26 18:07:50.522624', 3, '涡虫泛神经标记基因', 0, NULL, 4, NULL, 4, 112, 151);
INSERT INTO `web_order` VALUES (378, 2, NULL, 'ACTCTGAGATGGAGGTTGG', 'TAATACGACTCACTATAGGTAGCAAATGCAAATGACCC', 0.30, 57, 17.10, '2021-08-26 18:05:28.612748', '2021-08-26 18:07:56.387972', 3, '涡虫sirt1基因引物', 0, NULL, 4, NULL, 4, 648, 152);
INSERT INTO `web_order` VALUES (379, 2, NULL, 'TTACCAACAGTACCGGAATTCACGATGGATGTGACAGTGCTGG', 'TTACCAACAGTACCGGAATTCTGTAGTTCTGGAGCGGAGGAAC', 0.30, 84, 25.20, '2021-08-27 14:48:28.313590', '2021-08-27 16:37:28.175121', 3, 'DRP1启动子区域截断载体构建', 0, NULL, 4, NULL, 3, 600, 108);
INSERT INTO `web_order` VALUES (380, 2, NULL, 'CGGCGTAGAGGATCGAGATCTTGGGGAGTAGCGTTCCTCCG', 'TTACCAACAGTACCGGAATTCTCCCAGCCTTTGATGCCACAA', 0.30, 83, 24.90, '2021-08-27 14:50:04.486430', '2021-08-27 16:37:33.435641', 3, 'DRP1 promter启动子截断载体构建', 0, NULL, 4, NULL, 3, 300, 108);
INSERT INTO `web_order` VALUES (381, 2, NULL, 'TTACCAACAGTACCGGAATTCTGCGCCCCTTCAACTTCGCCA', 'CGGCGTAGAGGATCGAGATCTCTGGCGAAGTTGAAGGGGCGCA', 0.30, 84, 25.20, '2021-08-27 14:51:20.594466', '2021-08-27 16:37:40.171922', 3, 'NDUFV1启动子区域截断载体构建', 0, NULL, 4, NULL, 3, 600, 49);
INSERT INTO `web_order` VALUES (382, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-08-29 16:52:41.174391', '2021-09-01 13:23:18.006767', 3, 'DRP1-Promoter截断测序', 0, NULL, 25, NULL, 3, NULL, 105);
INSERT INTO `web_order` VALUES (383, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-08-29 16:53:06.147496', '2021-09-01 13:23:25.628535', 3, 'DRP1-Promoter截断测序', 0, NULL, 25, NULL, 3, NULL, 105);
INSERT INTO `web_order` VALUES (384, 1, NULL, NULL, NULL, 10.00, 1, 20.00, '2021-08-29 16:53:37.084731', '2021-09-01 13:23:30.584876', 3, 'DRP1-Promoter截断测序', 0, NULL, 25, NULL, 3, NULL, 105);
INSERT INTO `web_order` VALUES (385, 0, NULL, NULL, NULL, 2100.00, 2, 4200.00, '2021-08-30 17:32:27.403713', '2021-09-01 13:23:35.450937', 3, '血清', 0, NULL, 5, 106, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (386, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-08-31 15:39:39.725668', '2021-09-01 13:23:41.366947', 3, 'sirt1测序', 0, NULL, 4, NULL, 4, NULL, 152);
INSERT INTO `web_order` VALUES (387, 2, NULL, 'CCGGGGACAAGCCACAAGATTACAACTCGAGTTGTAATCTTGTGGCTTGTCCTTTTTTG', 'AATTCAAAAAAGGACAAGCCACAAGATTACAACTCGAGTTGTAATCTTGTGGCTTGTCC', 0.30, 118, 35.40, '2021-09-01 15:16:51.519634', '2021-09-03 11:21:07.335740', 3, '载体构建', 0, NULL, 25, NULL, 6, 100, 112);
INSERT INTO `web_order` VALUES (388, 0, NULL, NULL, NULL, 349.05, 1, 349.05, '2021-09-01 16:07:33.524941', '2021-09-03 11:21:20.339874', 3, 'PDK1抑制剂', 1, NULL, 45, 108, 11, NULL, NULL);
INSERT INTO `web_order` VALUES (389, 0, NULL, NULL, NULL, 270.00, 1, 270.00, '2021-09-03 11:16:01.164927', '2021-09-03 11:21:25.393836', 3, 'LB培养基配置成分。', 0, NULL, 46, 109, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (390, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-03 17:06:00.794853', '2021-09-03 17:17:05.623907', 3, '涡虫sirt1基因', 0, NULL, 25, NULL, 4, NULL, 141);
INSERT INTO `web_order` VALUES (391, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-03 17:11:00.196044', '2021-09-03 17:17:21.498165', 3, 'PCDNA3.1-flag-质粒验证（已做完菌液PCR）', 0, NULL, 25, NULL, 15, NULL, 153);
INSERT INTO `web_order` VALUES (392, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-04 16:15:06.688976', '2021-09-06 11:46:13.025977', 3, '鉴定构建的载体', 0, NULL, 25, NULL, 6, NULL, 112);
INSERT INTO `web_order` VALUES (393, 0, NULL, NULL, NULL, 1550.00, 1, 1550.00, '2021-09-04 16:16:46.199837', '2021-09-09 17:06:56.905222', 3, 'PVDF膜', 0, NULL, 14, 110, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (394, 2, NULL, 'CAGCGATACCGGTGCATATCGCTGGCGTC', 'TTACCAACAGTACCGGAATTCACCAGCCGAGCAGCTGCCGTGT', 0.30, 72, 21.60, '2021-09-06 10:51:45.876147', '2021-09-06 11:46:06.860239', 3, '启动子突变', 0, NULL, 4, NULL, 3, 200, 105);
INSERT INTO `web_order` VALUES (395, 2, NULL, 'CGGGATCCATGGCGGACGAGGCGGCCCTCG', 'GCTCTAGATGATTTGTTTGATGGATAGTTCATGT', 0.30, 1, 19.20, '2021-09-06 10:55:21.279422', '2021-09-06 11:46:00.785707', 3, '扩增 SIRT1- transcript variant 1', 0, NULL, 4, NULL, 19, 64, 137);
INSERT INTO `web_order` VALUES (396, 2, NULL, 'CGGCGTAGAGGATCGAGATCTCAGCGATACCGGTGCATATCG', 'CAGCGATACCGGTGCATATCG', 0.30, 42, 12.60, '2021-09-06 10:56:25.435302', '2021-09-06 11:45:54.871546', 3, '启动子点突变', 0, NULL, 4, NULL, 3, 200, 105);
INSERT INTO `web_order` VALUES (397, 2, NULL, 'CGGCTAGCCTACTTATAAGATGTCTCAAT', 'GCTCTAGAGTCAAATGACAATTTTAATAG', 0.30, 1, 17.40, '2021-09-06 10:57:35.551033', '2021-09-06 11:45:49.175248', 3, '扩增 SIRT1 UTR3 部分 （311bp）', 0, NULL, 4, NULL, 19, 58, 137);
INSERT INTO `web_order` VALUES (398, 2, NULL, 'GGCAATGAATAAGGCCGGGGCCCACA', 'TTACCAACAGTACCGGAATTCGGCAATGAATAAGGCCGG', 0.30, 65, 19.50, '2021-09-06 15:08:07.659879', '2021-09-09 17:06:45.306021', 3, '启动子突变', 0, NULL, 4, NULL, 3, 238, 108);
INSERT INTO `web_order` VALUES (399, 2, NULL, 'CCGGTGTGATTGAAGGTGGATTAAACTCGAGTTTAATCCACCTTCAATCACATTTTTG', 'AATTCAAAAATGTGATTGAAGGTGGATTAAACTCGAGTTTAATCCACCTTCAATCACA', 0.30, 116, 34.80, '2021-09-07 18:02:11.597374', '2021-09-09 17:06:31.894565', 3, '敲低PCBP2', 0, NULL, 4, NULL, 10, 58, 154);
INSERT INTO `web_order` VALUES (400, 1, NULL, NULL, NULL, 10.00, 3, 30.00, '2021-09-09 16:57:22.460197', '2021-09-09 17:06:23.483025', 3, '突变载体构建', 0, NULL, 25, NULL, 3, NULL, 103);
INSERT INTO `web_order` VALUES (401, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-09 16:58:24.863781', '2021-09-09 17:06:17.247818', 3, '干扰RNA构建', 0, NULL, 25, NULL, 3, NULL, 107);
INSERT INTO `web_order` VALUES (402, 0, NULL, NULL, NULL, 310.00, 2, 620.00, '2021-09-09 17:19:22.780454', NULL, 2, 'qPCR管', 0, '数量1', 46, 26, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (403, 0, NULL, NULL, NULL, 310.00, 1, 310.00, '2021-09-13 10:47:04.771112', '2021-09-13 10:48:07.405059', 3, 'qPCR管', 0, NULL, 14, 26, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (404, 2, NULL, 'GCATGTGTCAGAGGTTTTCACCG', 'TAATTCGCGTCTGGCCTTCC', 0.30, 42, 12.60, '2021-09-13 16:13:35.113974', '2021-09-13 16:47:05.954462', 3, 'FRT位点', 0, NULL, 4, NULL, 13, 844, 155);
INSERT INTO `web_order` VALUES (405, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-09-13 16:14:09.147926', '2021-09-13 16:47:10.976027', 3, 'FRT位点', 0, NULL, 4, NULL, 13, NULL, 155);
INSERT INTO `web_order` VALUES (406, 0, NULL, NULL, NULL, 797.00, 1, 797.00, '2021-09-13 17:05:01.580899', '2021-09-15 09:01:51.608324', 3, 'CD CHO', 0, NULL, 47, 29, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (407, 0, NULL, NULL, NULL, 585.00, 1, 585.00, '2021-09-15 09:53:22.913936', '2021-09-16 17:09:55.093144', 3, '实验室细胞培养', 0, NULL, 11, 12, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (408, 0, NULL, NULL, NULL, 580.00, 1, 580.00, '2021-09-15 09:56:20.700995', '2021-09-16 17:10:04.125195', 3, '细胞培养', 0, NULL, 11, 15, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (411, 0, NULL, NULL, NULL, 332.00, 1, 332.00, '2021-09-16 10:33:39.490799', '2021-09-16 17:10:40.546188', 3, 'qPCR mix', 0, NULL, 35, 78, 4, NULL, NULL);
INSERT INTO `web_order` VALUES (412, 2, NULL, 'TTTGAGAAATCTAGACTCGAGGACAACTACGCAGATCTTTCGGA', 'GAGGCTGATCAGCAGGTTTAAACCTAGAAGGGGTTGCCTTCTTCA', 0.30, 89, 26.70, '2021-09-16 11:41:43.366817', '2021-09-16 17:10:50.177242', 3, '构建载体', 0, NULL, 25, NULL, 6, 897, 156);
INSERT INTO `web_order` VALUES (413, 2, NULL, 'TATTCAACATTTCCGTGTCGCC', 'TCCTGCTCAAACTGTAACCCC', 0.30, 42, 12.60, '2021-09-16 11:51:10.819089', '2021-09-16 17:11:00.911446', 3, 'bmc', 0, NULL, 4, NULL, 13, 2300, 134);
INSERT INTO `web_order` VALUES (414, 1, NULL, NULL, NULL, 10.00, 4, 40.00, '2021-09-17 10:15:56.639818', '2021-09-17 10:30:14.987386', 3, 'BMC基因测序', 0, NULL, 4, NULL, 13, NULL, 134);
INSERT INTO `web_order` VALUES (415, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-18 16:38:44.192949', '2021-09-24 10:23:17.921275', 3, '鉴定载体是否构建成功', 0, NULL, 25, NULL, 6, NULL, 157);
INSERT INTO `web_order` VALUES (416, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-09-24 10:25:51.517771', '2021-09-24 10:35:28.145958', 3, 'FRT序列检测', 0, NULL, 4, NULL, 13, NULL, 155);
INSERT INTO `web_order` VALUES (417, 2, NULL, 'GGACCGGCAATTCTTCAAGC', 'TGCGGGGTATCGTATGCTTC', 0.30, 40, 12.00, '2021-09-24 10:27:26.426019', '2021-09-24 10:35:33.380141', 3, 'flp检测', 0, NULL, 4, NULL, 13, 1272, 158);
INSERT INTO `web_order` VALUES (418, 0, NULL, NULL, NULL, 110.00, 10, 1100.00, '2021-09-24 10:36:52.470814', '2021-09-24 10:58:57.763374', 3, '雌性裸鼠', 0, NULL, 43, 97, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (419, 0, NULL, NULL, NULL, 450.00, 2, 900.00, '2021-09-24 17:44:15.028099', '2021-09-27 11:44:24.901452', 3, '移液枪以旧换新', 0, NULL, 48, 111, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (420, 0, NULL, NULL, NULL, 224.00, 1, 224.00, '2021-09-25 11:28:34.697746', '2021-09-27 11:44:30.989408', 3, 'DL2000、DL5000、DL15000', 0, NULL, 40, 112, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (421, 0, NULL, NULL, NULL, 560.00, 1, 560.00, '2021-09-26 10:40:23.508725', NULL, 0, '实验室用品', 0, NULL, 28, 113, 13, NULL, NULL);
INSERT INTO `web_order` VALUES (422, 0, NULL, NULL, NULL, 70.00, 1, 70.00, '2021-09-27 11:42:03.269133', '2021-09-27 11:44:44.570973', 3, '细胞培养', 0, NULL, 18, 114, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (423, 0, NULL, NULL, NULL, 40.00, 2, 80.00, '2021-09-27 11:43:07.807559', '2021-09-27 11:44:51.125802', 3, '细胞培养', 0, NULL, 18, 115, 3, NULL, NULL);
INSERT INTO `web_order` VALUES (424, 1, NULL, NULL, NULL, 10.00, 1, 10.00, '2021-09-27 11:45:41.251704', '2021-09-28 09:53:33.184859', 3, '构建敲低PCBP2载体', 0, NULL, 4, NULL, 10, NULL, 159);
INSERT INTO `web_order` VALUES (425, 0, NULL, NULL, NULL, 90.00, 1, 90.00, '2021-09-28 08:47:45.001116', '2021-09-28 09:53:25.307436', 3, '10公斤/件', 0, NULL, 43, 99, 6, NULL, NULL);
INSERT INTO `web_order` VALUES (426, 1, NULL, NULL, NULL, 10.00, 2, 20.00, '2021-09-28 19:18:46.183285', '2021-09-29 15:51:32.005414', 3, 'PmirGLO-SIRT1-UTR 测序', 0, NULL, 4, NULL, 19, NULL, 137);
INSERT INTO `web_order` VALUES (427, 0, NULL, NULL, NULL, 235.30, 1, 235.30, '2021-09-30 11:16:23.453040', '2021-09-30 11:22:28.174616', 3, 'XbaI酶只剩大约2ul。\n后续构建双荧光素酶的载体，还需要这个酶。\n \n300个反应的一支，原价360，销售那边询价为235.3', 0, NULL, 49, 116, 19, NULL, NULL);

-- ----------------------------
-- Table structure for web_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `web_userprofile`;
CREATE TABLE `web_userprofile`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_type` smallint(0) NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stu_number` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `motto` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_userprofile
-- ----------------------------
INSERT INTO `web_userprofile` VALUES (1, '2021-01-04 16:22:21.841446', 0, '101@qq.com', 'admin', 'pbkdf2_sha256$150000$F8ubfJZaxRQ9$YheZtLSz8xhwGuH9QoGJPjzBLU+Gfq7e/LX6hhm1ti4=', 4, 0, 1, '', '---', NULL);
INSERT INTO `web_userprofile` VALUES (2, '2021-09-18 16:04:27.086742', 0, '1014518525@qq.com', '王浩杰', 'pbkdf2_sha256$150000$QBS2LJPsgeER$u1ZYjwwtRfTBM8vjI9dLZXReAktHjuIAPPjD0DApnxE=', 2, 1, 0, 'avatars/avatar_2_E4e7ccO.blob', '2019222040091', '苟利国家生死以, 岂因祸福避趋之');
INSERT INTO `web_userprofile` VALUES (3, '2021-09-30 11:23:07.742913', 0, 'zllblue@126.com', '赵莉莉', 'pbkdf2_sha256$150000$lAEzMLA1pbi2$LBeNtpKOiBTDHjBxtAS2jWf+ySXAcZjdXODJvKZ3fq0=', 1, 1, 0, 'avatars/avatar_3_C44bj6L.blob', '2018322040044', '没有');
INSERT INTO `web_userprofile` VALUES (4, '2021-09-15 21:13:19.259295', 0, 'zhanghua8928@163.com', '张华', 'pbkdf2_sha256$150000$gscXOwphGhWC$zntuij1MF12lblhBXFNrkQZziCWh4QQDurw+pmTPWBo=', 2, 1, 0, 'avatars/avatar_4.blob', '2019222040061', 'None');
INSERT INTO `web_userprofile` VALUES (5, '2021-09-17 10:29:52.691223', 0, 'fundzou@scu.edu.cn', '邹方东', 'pbkdf2_sha256$150000$Hxp9InWEQZzF$7Z2tCzMHSBikpUXhbEk47VmowKl43sPCH4wEjZWQ5EA=', 5, 1, 1, '', '---', NULL);
INSERT INTO `web_userprofile` VALUES (6, '2021-10-04 20:10:08.808426', 0, '1484731422@qq.com', '韩丽萍', 'pbkdf2_sha256$150000$gmKbKVQsKwFx$z6fRa1mI306MrsqPLlcdDIWm4Z0W+I4TjPpMswDD9xc=', 1, 1, 0, '', '2017322040041', 'None');
INSERT INTO `web_userprofile` VALUES (7, '2021-01-04 16:47:39.127988', 0, '15908121504@163.com', '张霞', 'pbkdf2_sha256$150000$uCJ6w0LQvcRO$5N4PD2rhhcf57uFFRK1nYnbqM1/O59ovnDjuA1Rr9U0=', 5, 1, 0, '', '2020222040035', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (8, '2021-04-27 12:02:19.556118', 0, '275051851@qq.com', '王画妮', 'pbkdf2_sha256$150000$VZnn1QpsAygt$hj6e4OuaucGk7yInybGNi3ATP0iUWGWGYudkivy6Y34=', 1, 0, 0, 'avatars/avatar_8.blob', '2019322040041', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (9, '2021-01-04 16:51:25.314152', 0, '1406061918@qq.com', '张珍华', 'pbkdf2_sha256$150000$AHZgLOlvVTLb$dJ5Mfd2qOVObPdN4Hx5j56IpSvQKy7yWwraWHbshuYw=', 2, 0, 0, 'avatars/avatar_9.blob', '2018222040078', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (10, '2021-09-27 15:31:32.384572', 0, '753801368@qq.com', '严言', 'pbkdf2_sha256$150000$QwDiI3szxBsw$rxhKtdihBt3hsmRWRFleMcuAbTCnQ+ucA1bvtyRdXmc=', 2, 1, 0, '', '2020222040078', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (11, '2021-09-28 17:54:53.470206', 0, '610933209@QQ.COM', '赵瑜璇', 'pbkdf2_sha256$150000$AWaD9GjIkNNg$O7+8MHEqLl8OOSS0seOZcZ/VoH6fJ7UPzFVPXd7RmuQ=', 5, 1, 0, 'avatars/avatar_11.blob', '2019222040019', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (12, '2021-09-17 12:32:21.050085', 0, '2016519954@qq.com', '施俊仰', 'pbkdf2_sha256$150000$ueZuguKCrlTJ$szifozPnLpgPH0DPBwaSDSENt0q3mr5m+AhNd/FfYeQ=', 2, 1, 0, '', '2019222040112', '这一切都是基因决定的');
INSERT INTO `web_userprofile` VALUES (13, '2021-09-27 17:45:16.896494', 0, '1028667242@qq.com', '曾敏', 'pbkdf2_sha256$150000$RjyrxwmGx778$ipfndrDiml1VFJpZO7zuIBzmbmyvKkcyjn9tlaY+pf4=', 5, 1, 0, '', '---', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (14, '2021-06-01 20:38:35.840217', 0, '906933715@qq.com', '留盛鹏', 'pbkdf2_sha256$150000$xM7GvlFSFlJJ$GbVq7d31SFAXOYqdh/R1IsOlI32ylLEAgP9o7Cxvo9c=', 2, 0, 0, '', '2018222040087', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (15, '2021-09-03 17:09:11.488022', 0, '492952712@qq.com', '李琰', 'pbkdf2_sha256$150000$GwVKHZPkmObI$29dvxBSLSCYjnQv2Z0muVwfC3Fp6oH/sg25WAiGMqpg=', 1, 1, 0, '', '2020322040059', '');
INSERT INTO `web_userprofile` VALUES (16, '2021-03-15 21:32:12.445478', 0, '707262240@qq.com', '梁雨桐', 'pbkdf2_sha256$150000$Z07wj9vhotJW$zqYXy2kwXXeU0p2DBjze/vDC8sLEMKBQPYzU3R1nxWQ=', 5, 0, 0, '', '---', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (17, '2021-05-01 17:49:25.679879', 0, '943992483@qq.com', '王泓力', 'pbkdf2_sha256$150000$BEHPtOLjh8sh$JJk1yqOLsGDGPspE+RhaBIU+/8iMR8RKqYhybywXEpE=', 3, 1, 0, '', '2018141501180', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (18, '2021-01-08 18:45:46.767041', 0, '1111@qq.com', '武文杰', 'pbkdf2_sha256$150000$ruglZ5kPfMkb$cCKFLfHF3VeYCdN7kdiMdl4ya5856+HBi2g69hHIngc=', 5, 1, 0, '', '---', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (19, '2021-09-28 19:17:25.142335', 0, 'haohaowang@163.com', '王画妮', 'pbkdf2_sha256$150000$lwmQIEKcbXoS$VlNXWpmiC9H+tsmlUevbb2P5E7QEz/Ymw9JMg9b7fsk=', 1, 1, 0, 'avatars/avatar_19.blob', '2019322040041', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (20, '2021-09-22 16:23:45.346473', 0, '18408205642@163.com', '邓嘉强', 'pbkdf2_sha256$150000$RkbDdCJtNGf5$n/+7w1F4z4DwKTbvdrbbnhdkfrpSDpbn3YfgQMlZEck=', 1, 1, 0, '', '2021322040042', '好好学习, 天天向上');
INSERT INTO `web_userprofile` VALUES (21, '2021-09-22 16:28:35.881702', 0, 'zhh15528411935@163.com', '赵红', 'pbkdf2_sha256$150000$YGgPejQcepkF$8mP1FjZvVODRsy5pdTINGXsPT88XXFH5ykscuEc2iEA=', 2, 1, 0, '', '2021222040069', '好好学习, 天天向上');

-- ----------------------------
-- Table structure for web_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `web_userprofile_groups`;
CREATE TABLE `web_userprofile_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `web_userprofile_groups_userprofile_id_group_id_f0cf56e5_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `web_userprofile_groups_group_id_5e57a1ef_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `web_userprofile_grou_userprofile_id_e2cc8eaf_fk_web_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_userprofile_groups_group_id_5e57a1ef_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for web_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `web_userprofile_user_permissions`;
CREATE TABLE `web_userprofile_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `web_userprofile_user_per_userprofile_id_permissio_980c6b17_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `web_userprofile_user_permission_id_b97547de_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `web_userprofile_user_permission_id_b97547de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `web_userprofile_user_userprofile_id_7f30863a_fk_web_userp` FOREIGN KEY (`userprofile_id`) REFERENCES `web_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_userprofile_user_permissions
-- ----------------------------
INSERT INTO `web_userprofile_user_permissions` VALUES (1, 3, 25);
INSERT INTO `web_userprofile_user_permissions` VALUES (2, 3, 26);
INSERT INTO `web_userprofile_user_permissions` VALUES (3, 3, 27);

SET FOREIGN_KEY_CHECKS = 1;
