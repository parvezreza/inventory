/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 100132
Source Host           : localhost:3306
Source Database       : inventory_new

Target Server Type    : MYSQL
Target Server Version : 100132
File Encoding         : 65001

Date: 2018-08-09 01:32:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attributes
-- ----------------------------
INSERT INTO `attributes` VALUES ('4', 'Color', '1');
INSERT INTO `attributes` VALUES ('5', 'Size', '1');
INSERT INTO `attributes` VALUES ('7', 'Test', '1');

-- ----------------------------
-- Table structure for attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value`;
CREATE TABLE `attribute_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `attribute_parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attribute_value
-- ----------------------------
INSERT INTO `attribute_value` VALUES ('5', 'Blue', '2');
INSERT INTO `attribute_value` VALUES ('6', 'White', '2');
INSERT INTO `attribute_value` VALUES ('7', 'M', '3');
INSERT INTO `attribute_value` VALUES ('8', 'L', '3');
INSERT INTO `attribute_value` VALUES ('9', 'Green', '2');
INSERT INTO `attribute_value` VALUES ('10', 'Black', '2');
INSERT INTO `attribute_value` VALUES ('12', 'Grey', '2');
INSERT INTO `attribute_value` VALUES ('13', 'S', '3');
INSERT INTO `attribute_value` VALUES ('14', 'Green', '4');
INSERT INTO `attribute_value` VALUES ('15', 'Blue', '4');
INSERT INTO `attribute_value` VALUES ('16', 'Red', '4');
INSERT INTO `attribute_value` VALUES ('17', 'sammy', '5');
INSERT INTO `attribute_value` VALUES ('18', 'Sammy Double', '5');
INSERT INTO `attribute_value` VALUES ('19', 'Parvez 4', '4');
INSERT INTO `attribute_value` VALUES ('21', 'test', '7');

-- ----------------------------
-- Table structure for brands
-- ----------------------------
DROP TABLE IF EXISTS `brands`;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of brands
-- ----------------------------
INSERT INTO `brands` VALUES ('26', 'Parvez  sdf', '1');
INSERT INTO `brands` VALUES ('29', 'sohag ', '1');
INSERT INTO `brands` VALUES ('30', 'Tomal 3', '1');
INSERT INTO `brands` VALUES ('31', 'Mamun y', '1');
INSERT INTO `brands` VALUES ('32', 'Rashed ', '1');
INSERT INTO `brands` VALUES ('35', 'farukd ', '1');
INSERT INTO `brands` VALUES ('55', 'Wali ', '1');
INSERT INTO `brands` VALUES ('64', 'Hello', '1');
INSERT INTO `brands` VALUES ('66', 'Imran Khan ', '1');
INSERT INTO `brands` VALUES ('82', 'test', '1');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('4', 'Cori3', '1');
INSERT INTO `categories` VALUES ('5', 'Dual Core', '1');
INSERT INTO `categories` VALUES ('6', 'Corei5', '1');
INSERT INTO `categories` VALUES ('7', 'Corei7', '1');
INSERT INTO `categories` VALUES ('8', 'Dell', '1');
INSERT INTO `categories` VALUES ('10', 'Parvez', '1');
INSERT INTO `categories` VALUES ('15', 'Parvez Reza', '0');
INSERT INTO `categories` VALUES ('17', 'sdfs', '1');
INSERT INTO `categories` VALUES ('18', 'Parvez', '1');
INSERT INTO `categories` VALUES ('19', 'White', '1');
INSERT INTO `categories` VALUES ('20', 'Parvez Reza', '1');
INSERT INTO `categories` VALUES ('21', 'Corei3 ', '1');
INSERT INTO `categories` VALUES ('25', 'Parvez Reza', '1');
INSERT INTO `categories` VALUES ('31', 'Mamun', '1');
INSERT INTO `categories` VALUES ('32', 'sohag', '1');

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) NOT NULL,
  `service_charge_value` varchar(255) NOT NULL,
  `vat_charge_value` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `currency` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'Infosys private', '13', '10', 'Madrid', '758676851', 'Spain', 'hello everyone one', 'USD');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES ('1', 'Administrator', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}');
INSERT INTO `groups` VALUES ('2', 'Editor', 'a:6:{i:0;s:11:\"createBrand\";i:1;s:14:\"createCategory\";i:2;s:11:\"createStore\";i:3;s:15:\"createAttribute\";i:4;s:13:\"createProduct\";i:5;s:11:\"createOrder\";}');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_no` varchar(255) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_address` varchar(255) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `gross_amount` varchar(255) NOT NULL,
  `service_charge_rate` varchar(255) NOT NULL,
  `service_charge` varchar(255) NOT NULL,
  `vat_charge_rate` varchar(255) NOT NULL,
  `vat_charge` varchar(255) NOT NULL,
  `net_amount` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `paid_status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for orders_item
-- ----------------------------
DROP TABLE IF EXISTS `orders_item`;
CREATE TABLE `orders_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `rate` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders_item
-- ----------------------------

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `qty` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `description` text NOT NULL,
  `attribute_value_id` varchar(255) NOT NULL,
  `brand_id` text NOT NULL,
  `category_id` text NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('2', 'Cori3 laptop', 'cori3-laptop', '34000', '100', 'assets/images/product_image/5b51b3f7339d6.jpg', '<p>This is description model</p>', '[\"14\",\"18\"]', '[\"4\"]', '[\"4\"]', '3', '1', null);
INSERT INTO `products` VALUES ('3', 'Cori3 laptop', 'cori3laptop', '38000', '150', '<p>You did not select a file to upload.</p>', '', '[\"15\",\"17\"]', '[\"6\"]', '[\"5\"]', '3', '1', null);
INSERT INTO `products` VALUES ('6', 'product test', 'prodct', '100', '200', '', '<p>dfsfs</p>', '6', '26', '5', '3', '0', '2018-08-06 16:55:48');
INSERT INTO `products` VALUES ('8', 'Photo product', 'Photo-product', '200', '30', 'assets/images/product_image/5b688c6a6b9ed5.45927866.jpg', '<p>\r\n\r\nà¦†à¦²à¦¹à¦¾à¦®à¦¦à§à¦°à¦¿à¦²à§à¦²à¦¾à¦¹ à¥¤ à¦†à¦²à§à¦²à¦¾à¦¹à§ à¦¤à¦¾à¦²à¦¾ à¦°à¦¾à¦¬à§à¦¬à§à¦²à¦†à¦² à¦†à¦®à¦¿à¦¨à§‡à¦° à¦…à¦¶à§‡à¦· à¦¦à¦¯à¦¼à¦¾à¦¯à¦¼ à¦†à¦®à¦°à¦¾ à¦®à¦¾ à¦“ à¦›à§‡à¦²à§‡ à¦­à¦¾à¦² à¦†à¦›à¦¿à¥¤ à¦¸à¦¬à¦¾à¦‡ à¦†à¦®à¦¾à¦° à¦•à¦²à¦¿à¦œà¦¾à¦° à¦œà¦¨à§à¦¯ à¦¦à§‹à¦¯à¦¼à¦¾ à¦•à¦°à¦¬à§‡à¦¨ à¥¤\r\n\r\n<br></p>', '6', '29', '5', '3', '1', '2018-08-06 19:59:06');
INSERT INTO `products` VALUES ('9', 'Product test', 'product-test', 'price', '200', 'assets/images/product_image/5b6962ad32ec79.61759075.jpg', '<p>\r\n\r\n</p><ul><li>PHP Extension curl.</li><li>PHP Extension gd.</li><li>PHP Extension iconv.</li><li>PHP Extension mcrypt.</li><li>PHP Extension simplexml.</li><li>PHP Extension spl.</li><li>PHP Extension xsl.</li><li>PHP Extension dom.</li><li>PHP Extension intl.</li><li>PHP Extension mbstring.</li><li>PHP Extension ctype.</li><li>PHP Extension hash.</li><li>PHP Extension pdo_mysql.</li><li>PHP Extension soap.</li><li>PHP Extension openssl.</li><li>PHP Extension zip.</li><li>PHP Extension phar.</li><li>PHP Extension libxml.</li><li>PHP Extension xmlwriter.</li><li>PHP Extension pcre.</li><li>PHP Extension bcmath.</li></ul>\r\n\r\n<br><p></p>', '0', '31', '5', '3', '1', '2018-08-07 11:13:17');
INSERT INTO `products` VALUES ('10', 'test3', 'test3', '454', '12', 'assets/images/product_image/5b6967ac2713e4.67790215.jpg', '<p></p><pre>à¦¬à¦¿à¦Ÿà¦¿à¦­à¦¿à¦° à¦®à¦¤ à¦¸à¦¬à¦¾à¦°à¦‡ à¦à¦•à¦Ÿà¦¾ à¦¬à¦‰ à¦šà¦¾à¦‡!<br><br>à¦¸à¦¾à¦°à¦¾à¦¦à¦¿à¦¨ à¦ªà¦¿à¦Ÿà¦¾à¦‡à¦²à§‡à¦“ à¦¬à¦²à¦¬à§‡ à¦ªà¦°à¦¿à¦¸à§à¦¥à¦¿à¦¤à¦¿ à¦¸à§à¦¬à¦¾à¦­à¦¾à¦¬à¦¿à¦•\r\n\r\n<br></pre><br><p></p>', '0', '30', '7', '3', '1', '2018-08-07 11:34:36');
INSERT INTO `products` VALUES ('11', 'test3', 'test3', '454', '12', 'assets/images/product_image/5b6968035cfdc4.21485088.jpg', '<p></p><pre>à¦¬à¦¿à¦Ÿà¦¿à¦­à¦¿à¦° à¦®à¦¤ à¦¸à¦¬à¦¾à¦°à¦‡ à¦à¦•à¦Ÿà¦¾ à¦¬à¦‰ à¦šà¦¾à¦‡!<br><br>à¦¸à¦¾à¦°à¦¾à¦¦à¦¿à¦¨ à¦ªà¦¿à¦Ÿà¦¾à¦‡à¦²à§‡à¦“ à¦¬à¦²à¦¬à§‡ à¦ªà¦°à¦¿à¦¸à§à¦¥à¦¿à¦¤à¦¿ à¦¸à§à¦¬à¦¾à¦­à¦¾à¦¬à¦¿à¦•\r\n\r\n<br></pre><br><p></p>', '0', '30', '7', '3', '1', '2018-08-07 11:36:03');
INSERT INTO `products` VALUES ('12', 'test5', 'tees', '400', '100', 'assets/images/product_image/5b696ae9080fa2.11325201.jpg', '<p>dsfds</p>', '0', '26', '4', '3', '1', '2018-08-07 11:48:25');
INSERT INTO `products` VALUES ('13', 'test6', 'test6', '100', '200', 'assets/images/product_image/5b696c4ad54730.20777472.jpg', '<p>dfgdg</p>', '0', '26', '4', '3', '1', '2018-08-07 11:54:18');
INSERT INTO `products` VALUES ('14', 'test7', 'test7', '100', '39', 'assets/images/product_image/5b69777100caa4.78138084.jpg', '<p>fgd</p>', '5', '32', '5', '3', '1', '2018-08-07 12:41:53');
INSERT INTO `products` VALUES ('15', 'test8', 'test8', '1000', '10', 'assets/images/product_image/5b6a7032307411.34142041.jpg', '<p>dsds</p>', '5', '26', '4', '3', '1', '2018-08-08 06:23:14');

-- ----------------------------
-- Table structure for stores
-- ----------------------------
DROP TABLE IF EXISTS `stores`;
CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stores
-- ----------------------------
INSERT INTO `stores` VALUES ('3', 'Stor1', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'adminknst', '$2y$10$yfi5nUQGXUZtMdl27dWAyOd/jMOmATBpiUvJDmUu9hJ5Ro6BE5wsK', 'admin@admin.com', 'john', 'doe', '80789998', '1');
INSERT INTO `users` VALUES ('2', 'mamun', '$2y$10$a0TwZeg/FUrpsrMZphUgUu47uIUz0jkBYSj8Evbck37IOk3zLcJqO', 'mamunzet@gmail.com', 'Mamun', 'Rashed', '01722945055', '1');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_group
-- ----------------------------
