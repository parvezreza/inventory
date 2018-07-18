/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 100132
 Source Host           : localhost:3306
 Source Schema         : inventory

 Target Server Type    : MySQL
 Target Server Version : 100132
 File Encoding         : 65001

 Date: 18/07/2018 13:00:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (7, 'Asus', '2018-07-14 21:53:53', '2018-07-14 21:53:53');
INSERT INTO `categories` VALUES (8, 'Dell', '2018-07-14 21:54:07', '2018-07-14 21:54:07');
INSERT INTO `categories` VALUES (9, 'HP', '2018-07-14 21:54:12', '2018-07-14 21:54:12');
INSERT INTO `categories` VALUES (10, 'Daffodil', '2018-07-14 21:56:53', '2018-07-14 21:56:53');
INSERT INTO `categories` VALUES (11, 'A4Tech', '2018-07-16 19:09:08', '2018-07-16 19:09:08');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (6, 'Waliulla', '01743434453', 'parvezreza.cse@gmail.com', 'kushtia', '2018-07-15 17:29:48', '2018-07-15 17:29:48');
INSERT INTO `customers` VALUES (8, 'Parvez Reza', '01743434453', 'parvezreza.cse@gmail.com', 'kushtia', '2018-07-16 06:45:40', '2018-07-16 06:45:40');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `net_price` double(10, 2) NULL DEFAULT NULL,
  `sale_price` double(10, 2) NULL DEFAULT NULL,
  `storage` int(11) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  `modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 9, 'corei3', 64543.00, 4353.00, 35, '2018-07-14 22:32:31', '2018-07-16 06:37:33');
INSERT INTO `products` VALUES (2, 7, 'Corei5', 45000.00, 44000.00, 190, '2018-07-16 06:38:24', '2018-07-16 06:45:40');
INSERT INTO `products` VALUES (3, 8, 'Corei7', 55000.00, 54000.00, 200, '2018-07-16 06:40:59', '2018-07-16 06:40:59');
INSERT INTO `products` VALUES (4, 10, 'Cori3', 33000.00, 32000.00, 100, '2018-07-16 06:42:31', '2018-07-16 06:42:31');
INSERT INTO `products` VALUES (5, 11, 'Mouse', 300.00, 350.00, 90, '2018-07-16 19:10:30', '2018-07-16 19:13:04');

-- ----------------------------
-- Table structure for sales
-- ----------------------------
DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NULL DEFAULT NULL,
  `product_id` int(11) NULL DEFAULT NULL,
  `number_of_products` int(11) NULL DEFAULT NULL,
  `sale_price` double(10, 2) NULL DEFAULT NULL,
  `total_price` double(10, 2) NULL DEFAULT NULL,
  `created` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sales
-- ----------------------------
INSERT INTO `sales` VALUES (2, 6, 1, 100, 4353.00, 435300.00, '2018-07-15 17:29:48');
INSERT INTO `sales` VALUES (4, 6, 1, 5, 4353.00, 21765.00, '2018-07-16 06:37:33');
INSERT INTO `sales` VALUES (6, 8, 2, 10, 44000.00, 440000.00, '2018-07-16 06:45:40');
INSERT INTO `sales` VALUES (7, 6, 5, 10, 350.00, 3500.00, '2018-07-16 19:13:04');

SET FOREIGN_KEY_CHECKS = 1;
