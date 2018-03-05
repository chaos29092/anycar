/*
Navicat MySQL Data Transfer

Source Server         : localhost_33060
Source Server Version : 50717
Source Host           : localhost:33060
Source Database       : anycar

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-05 09:49:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `published_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', null, 'article 1', 'article 1 excerpt', '<p>article 1</p>', 'articles/December2017/8njUeiNjG5fRj14rt4jQ.jpg', 'article-1', 'article 1 seo', 'article 1', 'article 1', '1', '2017-12-20 00:00:00', '2017-12-20 02:49:00', '2017-12-22 01:33:46');
INSERT INTO `articles` VALUES ('2', null, 'article 2', 'article 2 excerpt', '<p>article 2&nbsp;article 2</p>', 'articles/December2017/87evtourhfzF2aIjuVjP.jpg', 'article-2', 'article 2 seo', 'article 2', 'article 2', '0', '2017-12-20 00:00:00', '2017-12-20 02:55:37', '2017-12-20 02:55:37');
INSERT INTO `articles` VALUES ('4', null, 'article 4', 'article 4 excerpt 1', '<p>article 4</p>', 'articles/December2017/cZar87icIanlxs6LcmEh.jpg', 'article-4', 'article 4 seo', 'article 4', 'article 4', '0', '2017-12-21 00:00:00', '2017-12-21 07:14:00', '2017-12-21 09:10:11');
INSERT INTO `articles` VALUES ('5', null, 'article 5', 'article 5 excerpt', '<p>article 5</p>', 'articles/December2017/8SMxC7BCLiAvJbOxw4KM.jpg', 'article-5', 'article 5 seo', 'article 5', 'article 5', '1', '2017-12-21 00:00:00', '2017-12-21 09:28:37', '2017-12-21 09:28:37');
INSERT INTO `articles` VALUES ('6', null, 'article 3 3', 'article 3 excerpt', '<p>article 3</p>', 'articles/December2017/iGxhkQUj5Thca7ILw6bw.jpg', 'article-3-3', 'article 3 seo', 'article 3', 'article 3', '1', '2017-12-22 00:00:00', '2017-12-22 05:53:00', '2017-12-22 05:55:49');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_adwords` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', null, '1', 'news', 'news', '2017-12-20 02:45:24', '2017-12-20 02:45:24', 'news seo', 'news', 'news', null);

-- ----------------------------
-- Table structure for data_rows
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES ('14', '2', 'id', 'number', 'id', '1', '1', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('15', '2', 'author_id', 'text', 'author_id', '1', '0', '0', '0', '0', '0', null, '2');
INSERT INTO `data_rows` VALUES ('16', '2', 'title', 'text', 'title', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '3');
INSERT INTO `data_rows` VALUES ('17', '2', 'excerpt', 'text_area', 'excerpt', '0', '0', '1', '1', '1', '1', null, '8');
INSERT INTO `data_rows` VALUES ('18', '2', 'body', 'rich_text_box', 'body', '0', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('19', '2', 'slug', 'text', 'slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"title\"},\"display\":{\"width\":\"6\"}}', '4');
INSERT INTO `data_rows` VALUES ('20', '2', 'meta_description', 'text_area', 'meta_description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '6');
INSERT INTO `data_rows` VALUES ('21', '2', 'meta_keywords', 'text_area', 'meta_keywords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '7');
INSERT INTO `data_rows` VALUES ('23', '2', 'created_at', 'timestamp', 'created_at', '0', '1', '1', '0', '0', '0', null, '11');
INSERT INTO `data_rows` VALUES ('24', '2', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', null, '12');
INSERT INTO `data_rows` VALUES ('25', '2', 'image', 'image', 'image', '0', '0', '1', '1', '1', '1', null, '10');
INSERT INTO `data_rows` VALUES ('26', '3', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('27', '3', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('28', '3', 'email', 'text', 'email', '1', '1', '1', '1', '1', '1', '', '3');
INSERT INTO `data_rows` VALUES ('29', '3', 'password', 'password', 'password', '0', '0', '0', '1', '1', '0', '', '4');
INSERT INTO `data_rows` VALUES ('30', '3', 'user_belongsto_role_relationship', 'relationship', 'Role', '0', '1', '1', '1', '1', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"roles\",\"pivot\":\"0\"}', '10');
INSERT INTO `data_rows` VALUES ('31', '3', 'remember_token', 'text', 'remember_token', '0', '0', '0', '0', '0', '0', '', '5');
INSERT INTO `data_rows` VALUES ('32', '3', 'created_at', 'timestamp', 'created_at', '0', '1', '1', '0', '0', '0', '', '6');
INSERT INTO `data_rows` VALUES ('33', '3', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '7');
INSERT INTO `data_rows` VALUES ('34', '3', 'avatar', 'image', 'avatar', '0', '1', '1', '1', '1', '1', '', '8');
INSERT INTO `data_rows` VALUES ('35', '5', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('36', '5', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('37', '5', 'created_at', 'timestamp', 'created_at', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `data_rows` VALUES ('38', '5', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `data_rows` VALUES ('39', '4', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('40', '4', 'parent_id', 'select_dropdown', 'parent_id', '0', '0', '0', '0', '0', '0', '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', '2');
INSERT INTO `data_rows` VALUES ('41', '4', 'order', 'text', 'order', '1', '1', '1', '1', '1', '1', '{\"default\":1,\"display\":{\"width\":\"1\"}}', '3');
INSERT INTO `data_rows` VALUES ('42', '4', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '4');
INSERT INTO `data_rows` VALUES ('43', '4', 'slug', 'text', 'slug', '1', '1', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"},\"display\":{\"width\":\"5\"}}', '5');
INSERT INTO `data_rows` VALUES ('44', '4', 'created_at', 'timestamp', 'created_at', '0', '0', '1', '0', '0', '0', null, '7');
INSERT INTO `data_rows` VALUES ('45', '4', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', null, '8');
INSERT INTO `data_rows` VALUES ('46', '6', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `data_rows` VALUES ('47', '6', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `data_rows` VALUES ('48', '6', 'created_at', 'timestamp', 'created_at', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `data_rows` VALUES ('49', '6', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `data_rows` VALUES ('50', '6', 'display_name', 'text', 'Display Name', '1', '1', '1', '1', '1', '1', '', '5');
INSERT INTO `data_rows` VALUES ('53', '3', 'role_id', 'text', 'role_id', '1', '1', '1', '1', '1', '1', '', '9');
INSERT INTO `data_rows` VALUES ('54', '4', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('55', '4', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '10');
INSERT INTO `data_rows` VALUES ('56', '4', 'meta_adwords', 'text_area', 'Meta Adwords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '11');
INSERT INTO `data_rows` VALUES ('57', '4', 'image', 'image', 'Image', '0', '0', '1', '1', '1', '1', '{\"resize\":{\"width\":\"600\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"description\":\"标注下最佳尺寸\"}', '6');
INSERT INTO `data_rows` VALUES ('58', '7', 'id', 'number', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('59', '7', 'parent_id', 'select_dropdown', '父分类', '0', '0', '1', '1', '1', '1', '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', '2');
INSERT INTO `data_rows` VALUES ('60', '7', 'name', 'text', '分类名称', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '4');
INSERT INTO `data_rows` VALUES ('61', '7', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"},\"display\":{\"width\":\"5\"}}', '5');
INSERT INTO `data_rows` VALUES ('62', '7', 'image', 'image', 'Image', '0', '0', '1', '1', '1', '1', '{\"resize\":{\"width\":\"300\",\"height\":\"300\"},\"quality\":\"70%\",\"upsize\":true,\"description\":\"300*300\"}', '6');
INSERT INTO `data_rows` VALUES ('63', '7', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '7');
INSERT INTO `data_rows` VALUES ('64', '7', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '8');
INSERT INTO `data_rows` VALUES ('65', '7', 'meta_keywords', 'text_area', 'Meta Keywords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '9');
INSERT INTO `data_rows` VALUES ('66', '7', 'order', 'text', 'Order(小到大)', '0', '1', '1', '1', '1', '1', '{\"default\":1,\"display\":{\"width\":\"1\"}}', '3');
INSERT INTO `data_rows` VALUES ('67', '7', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', null, '10');
INSERT INTO `data_rows` VALUES ('68', '7', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '11');
INSERT INTO `data_rows` VALUES ('70', '8', 'id', 'checkbox', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('71', '8', 'product_category_id', 'checkbox', 'Product Category Id', '1', '0', '0', '0', '0', '0', null, '3');
INSERT INTO `data_rows` VALUES ('72', '8', 'name', 'text', '产品名', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"5\"}}', '4');
INSERT INTO `data_rows` VALUES ('73', '8', 'excerpt', 'text_area', '简介', '0', '0', '1', '1', '1', '1', null, '15');
INSERT INTO `data_rows` VALUES ('74', '8', 'image', 'image', '主图', '0', '0', '1', '1', '1', '1', '{\"resize\":{\"width\":\"600\",\"height\":\"600\"},\"quality\":\"70%\",\"upsize\":true,\"description\":\"600*600较好，即1:1大于600\",\"thumbnails\":[{\"name\":\"small\",\"crop\":{\"width\":\"300\",\"height\":\"300\"}}]}', '14');
INSERT INTO `data_rows` VALUES ('75', '8', 'featured', 'checkbox', '是否重要', '0', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"1\"}}', '7');
INSERT INTO `data_rows` VALUES ('76', '8', 'body', 'rich_text_box', '详情', '0', '0', '1', '1', '1', '1', null, '16');
INSERT INTO `data_rows` VALUES ('77', '8', 'parameter', 'rich_text_box', '参数', '0', '0', '1', '1', '1', '1', null, '17');
INSERT INTO `data_rows` VALUES ('78', '8', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"},\"display\":{\"width\":\"5\"}}', '5');
INSERT INTO `data_rows` VALUES ('79', '8', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '18');
INSERT INTO `data_rows` VALUES ('80', '8', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '19');
INSERT INTO `data_rows` VALUES ('81', '8', 'meta_keywords', 'text_area', 'Meta Keywords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '20');
INSERT INTO `data_rows` VALUES ('82', '8', 'order', 'text', '排序', '0', '1', '1', '1', '1', '1', '{\"default\":1,\"display\":{\"width\":\"1\"}}', '6');
INSERT INTO `data_rows` VALUES ('83', '8', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', null, '21');
INSERT INTO `data_rows` VALUES ('84', '8', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '22');
INSERT INTO `data_rows` VALUES ('85', '8', 'product_belongsto_product_category_relationship', 'relationship', '产品分类', '0', '1', '1', '1', '1', '1', '{\"model\":\"App\\\\Models\\\\ProductCategory\",\"table\":\"product_categories\",\"type\":\"belongsTo\",\"column\":\"product_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"categories\",\"pivot\":\"0\"}', '2');
INSERT INTO `data_rows` VALUES ('86', '9', 'id', 'number', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('87', '9', 'category_id', 'select_dropdown', 'Category Id', '0', '0', '0', '0', '0', '0', null, '2');
INSERT INTO `data_rows` VALUES ('88', '9', 'name', 'text', '标题', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"5\"}}', '5');
INSERT INTO `data_rows` VALUES ('89', '9', 'excerpt', 'text_area', '简介', '0', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('90', '9', 'body', 'rich_text_box', '正文', '0', '0', '1', '1', '1', '1', null, '10');
INSERT INTO `data_rows` VALUES ('91', '9', 'image', 'image', 'Image', '0', '0', '1', '1', '1', '1', '{\"resize\":{\"width\":\"800\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"description\":\"最好800像素以上\",\"thumbnails\":[{\"name\":\"small\",\"crop\":{\"width\":\"400\",\"height\":\"300\"}}]}', '8');
INSERT INTO `data_rows` VALUES ('92', '9', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"},\"display\":{\"width\":\"4\"}}', '6');
INSERT INTO `data_rows` VALUES ('93', '9', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '11');
INSERT INTO `data_rows` VALUES ('94', '9', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '12');
INSERT INTO `data_rows` VALUES ('95', '9', 'meta_keywords', 'text_area', 'Meta Keywords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '13');
INSERT INTO `data_rows` VALUES ('96', '9', 'featured', 'checkbox', '是否重要', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"1\"}}', '7');
INSERT INTO `data_rows` VALUES ('97', '9', 'published_at', 'date', '发布时间（必填！）', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"2\"}}', '4');
INSERT INTO `data_rows` VALUES ('98', '9', 'created_at', 'timestamp', 'Created At', '0', '0', '1', '1', '0', '1', null, '14');
INSERT INTO `data_rows` VALUES ('99', '9', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '15');
INSERT INTO `data_rows` VALUES ('100', '9', 'article_belongsto_category_relationship', 'relationship', '分类', '0', '0', '0', '0', '0', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Category\",\"table\":\"categories\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"articles\",\"pivot\":\"0\"}', '3');
INSERT INTO `data_rows` VALUES ('107', '13', 'id', 'checkbox', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('108', '13', 'name', 'text', '分类名', '1', '1', '1', '1', '1', '1', null, '3');
INSERT INTO `data_rows` VALUES ('109', '13', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"}}', '4');
INSERT INTO `data_rows` VALUES ('110', '13', 'order', 'text', 'Order', '0', '1', '1', '1', '1', '1', '{\"default\":1}', '2');
INSERT INTO `data_rows` VALUES ('111', '13', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', null, '5');
INSERT INTO `data_rows` VALUES ('112', '13', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '6');
INSERT INTO `data_rows` VALUES ('113', '14', 'id', 'checkbox', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('114', '14', 'order', 'text', 'Order', '0', '1', '1', '1', '1', '1', '{\"default\":1,\"display\":{\"width\":\"1\"}}', '3');
INSERT INTO `data_rows` VALUES ('115', '14', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '4');
INSERT INTO `data_rows` VALUES ('116', '14', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"},\"display\":{\"width\":\"5\"}}', '5');
INSERT INTO `data_rows` VALUES ('117', '14', 'gallery_category_id', 'checkbox', 'Gallery Category Id', '0', '0', '0', '0', '0', '0', null, '6');
INSERT INTO `data_rows` VALUES ('118', '14', 'image', 'image', 'Image', '0', '0', '1', '1', '1', '1', '{\"resize\":{\"width\":\"1200\",\"height\":null},\"quality\":\"70%\",\"upsize\":true,\"description\":\"大于1200较好\",\"thumbnails\":[{\"name\":\"small\",\"crop\":{\"width\":\"400\",\"height\":\"400\"}}]}', '7');
INSERT INTO `data_rows` VALUES ('119', '14', 'body', 'rich_text_box', 'Body', '0', '0', '1', '1', '1', '1', null, '8');
INSERT INTO `data_rows` VALUES ('120', '14', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('121', '14', 'meta_description', 'text_area', 'Meta Description', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '10');
INSERT INTO `data_rows` VALUES ('122', '14', 'meta_keywords', 'text_area', 'Meta Keywords', '0', '0', '1', '1', '1', '1', '{\"display\":{\"width\":\"6\"}}', '11');
INSERT INTO `data_rows` VALUES ('123', '14', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', null, '12');
INSERT INTO `data_rows` VALUES ('124', '14', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '13');
INSERT INTO `data_rows` VALUES ('125', '14', 'gallery_belongsto_gallery_category_relationship', 'relationship', 'gallery_categories', '0', '1', '1', '1', '1', '1', '{\"model\":\"App\\\\Models\\\\GalleryCategory\",\"table\":\"gallery_categories\",\"type\":\"belongsTo\",\"column\":\"gallery_category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"articles\",\"pivot\":\"0\"}', '2');
INSERT INTO `data_rows` VALUES ('126', '2', 'seo_title', 'text', 'Seo Title', '0', '0', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('142', '16', 'id', 'number', 'Id', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('143', '16', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '2');
INSERT INTO `data_rows` VALUES ('144', '16', 'email', 'text', 'Email', '0', '1', '1', '1', '1', '1', null, '3');
INSERT INTO `data_rows` VALUES ('145', '16', 'phone', 'text', 'Phone', '0', '0', '1', '1', '1', '1', null, '4');
INSERT INTO `data_rows` VALUES ('146', '16', 'subject', 'text', 'Subject', '0', '1', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('147', '16', 'message', 'text', 'Message', '0', '1', '1', '1', '1', '1', null, '6');
INSERT INTO `data_rows` VALUES ('148', '16', 'url', 'text', 'Url', '0', '0', '1', '1', '1', '1', null, '7');
INSERT INTO `data_rows` VALUES ('149', '16', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', null, '8');
INSERT INTO `data_rows` VALUES ('150', '16', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '9');

-- ----------------------------
-- Table structure for data_types
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES ('2', 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', null, null, null, '1', '0', '2017-09-20 02:12:44', '2017-12-15 08:15:07');
INSERT INTO `data_types` VALUES ('3', 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', '', '', '1', '0', '2017-09-20 02:12:44', '2017-09-20 02:12:44');
INSERT INTO `data_types` VALUES ('4', 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', null, null, null, '1', '0', '2017-09-20 02:12:44', '2017-12-15 00:59:28');
INSERT INTO `data_types` VALUES ('5', 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', null, '', '', '1', '0', '2017-09-20 02:12:44', '2017-09-20 02:12:44');
INSERT INTO `data_types` VALUES ('6', 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', null, '', '', '1', '0', '2017-09-20 02:12:44', '2017-09-20 02:12:44');
INSERT INTO `data_types` VALUES ('7', 'product_categories', 'product-categories', 'Product Category', 'Product Categories', null, 'App\\Models\\ProductCategory', null, null, null, '1', '0', '2017-12-15 05:24:56', '2017-12-15 05:24:56');
INSERT INTO `data_types` VALUES ('8', 'products', 'products', 'Product', 'Products', null, 'App\\Models\\Product', null, null, null, '1', '0', '2017-12-15 05:49:49', '2017-12-15 05:49:49');
INSERT INTO `data_types` VALUES ('9', 'articles', 'articles', 'Article', 'Articles', null, 'App\\Models\\Article', null, null, null, '1', '0', '2017-12-15 06:12:19', '2017-12-15 06:12:19');
INSERT INTO `data_types` VALUES ('13', 'gallery_categories', 'gallery-categories', 'Gallery Category', 'Gallery Categories', null, 'App\\Models\\GalleryCategory', null, null, null, '1', '0', '2017-12-15 07:07:07', '2017-12-15 07:07:07');
INSERT INTO `data_types` VALUES ('14', 'galleries', 'galleries', 'Gallery', 'Galleries', null, 'App\\Models\\Gallery', null, null, null, '1', '0', '2017-12-15 07:13:12', '2017-12-15 07:13:12');
INSERT INTO `data_types` VALUES ('16', 'orders', 'orders', 'Order', 'Orders', null, 'App\\Models\\Order', null, null, null, '1', '0', '2017-12-26 03:11:08', '2017-12-26 03:11:08');

-- ----------------------------
-- Table structure for galleries
-- ----------------------------
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gallery_category_id` int(11) DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `galleries_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of galleries
-- ----------------------------
INSERT INTO `galleries` VALUES ('1', '1', 'gallery 1', 'gallery-1-1', '1', 'galleries/December2017/WSRrVrhyodKPkiJH9NyA.jpg', '<p>gallery 1</p>', 'gallery 1 seo', 'gallery 1', 'gallery 1', '2017-12-20 06:08:00', '2017-12-22 07:42:27');
INSERT INTO `galleries` VALUES ('2', '1', 'gallery 2', 'gallery-2', '2', 'galleries/December2017/yf6z1sti6N3fUFxoy9KY.jpg', '<p>gallery 2</p>', 'gallery 2 seo', 'gallery 2', 'gallery 2', '2017-12-20 06:09:39', '2017-12-20 06:09:39');
INSERT INTO `galleries` VALUES ('3', '1', 'gallery 3', 'gallery-3', '1', 'galleries/December2017/VqJWLGX7PleLrgnPBne4.jpg', '<p>gallery 3</p>', 'gallery 3 seo', 'gallery 3', 'gallery 3', '2017-12-20 06:23:24', '2017-12-20 06:23:24');

-- ----------------------------
-- Table structure for gallery_categories
-- ----------------------------
DROP TABLE IF EXISTS `gallery_categories`;
CREATE TABLE `gallery_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gallery_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gallery_categories
-- ----------------------------
INSERT INTO `gallery_categories` VALUES ('1', 'ipl', 'ipl', '1', '2017-12-20 06:06:11', '2017-12-20 06:06:11');
INSERT INTO `gallery_categories` VALUES ('2', 'elight', 'elight', '1', '2017-12-20 06:06:27', '2017-12-20 06:06:27');

-- ----------------------------
-- Table structure for menu_items
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES ('1', '1', 'Dashboard', '', '_self', 'voyager-boat', null, null, '1', '2017-09-20 02:12:44', '2017-09-20 02:12:44', 'voyager.dashboard', null);
INSERT INTO `menu_items` VALUES ('2', '1', 'Media', '', '_self', 'voyager-images', null, null, '4', '2017-09-20 02:12:44', '2017-12-15 07:18:54', 'voyager.media.index', null);
INSERT INTO `menu_items` VALUES ('4', '1', 'Users', '', '_self', 'voyager-person', null, null, '3', '2017-09-20 02:12:44', '2017-09-20 02:12:44', 'voyager.users.index', null);
INSERT INTO `menu_items` VALUES ('5', '1', '文章分类', '', '_self', 'voyager-file-text', '#000000', '20', '4', '2017-09-20 02:12:44', '2017-12-15 07:24:14', 'voyager.categories.index', 'null');
INSERT INTO `menu_items` VALUES ('6', '1', '主要页面', '', '_self', 'voyager-file-text', '#000000', '20', '7', '2017-09-20 02:12:44', '2017-12-15 07:22:53', 'voyager.pages.index', 'null');
INSERT INTO `menu_items` VALUES ('7', '1', 'Roles', '', '_self', 'voyager-lock', null, null, '2', '2017-09-20 02:12:44', '2017-09-20 02:12:44', 'voyager.roles.index', null);
INSERT INTO `menu_items` VALUES ('8', '1', 'Tools', '', '_self', 'voyager-tools', null, null, '7', '2017-09-20 02:12:44', '2017-12-26 01:14:39', null, null);
INSERT INTO `menu_items` VALUES ('9', '1', 'Menu Builder', '', '_self', 'voyager-list', null, '8', '1', '2017-09-20 02:12:44', '2017-12-15 07:18:54', 'voyager.menus.index', null);
INSERT INTO `menu_items` VALUES ('10', '1', 'Database', '', '_self', 'voyager-data', null, '8', '2', '2017-09-20 02:12:44', '2017-12-15 07:18:54', 'voyager.database.index', null);
INSERT INTO `menu_items` VALUES ('11', '1', 'Compass', '/admin/compass', '_self', 'voyager-compass', null, '8', '3', '2017-09-20 02:12:44', '2017-12-15 07:18:54', null, null);
INSERT INTO `menu_items` VALUES ('12', '1', 'Hooks', '/admin/hooks', '_self', 'voyager-hook', null, '8', '4', '2017-09-20 02:12:44', '2017-12-15 07:18:54', null, null);
INSERT INTO `menu_items` VALUES ('13', '1', 'Settings', '', '_self', 'voyager-settings', null, null, '8', '2017-09-20 02:12:44', '2017-12-26 01:14:33', 'voyager.settings.index', null);
INSERT INTO `menu_items` VALUES ('14', '1', '产品分类', '/admin/product-categories', '_self', 'voyager-shop', '#000000', '20', '2', '2017-12-15 05:24:57', '2017-12-15 07:23:33', null, '');
INSERT INTO `menu_items` VALUES ('15', '1', '产品', '/admin/products', '_self', 'voyager-shop', '#000000', '20', '1', '2017-12-15 05:49:51', '2017-12-15 07:23:21', null, '');
INSERT INTO `menu_items` VALUES ('16', '1', '文章', '/admin/articles', '_self', 'voyager-file-text', '#000000', '20', '3', '2017-12-15 06:12:21', '2017-12-15 07:23:51', null, '');
INSERT INTO `menu_items` VALUES ('18', '1', '案例分类', '/admin/gallery-categories', '_self', 'voyager-images', '#000000', '20', '6', '2017-12-15 07:07:08', '2017-12-15 07:25:10', null, '');
INSERT INTO `menu_items` VALUES ('19', '1', '案例', '/admin/galleries', '_self', 'voyager-images', '#000000', '20', '5', '2017-12-15 07:13:14', '2017-12-15 07:24:56', null, '');
INSERT INTO `menu_items` VALUES ('20', '1', '发布管理', '', '_self', 'voyager-folder', '#000000', null, '5', '2017-12-15 07:18:41', '2017-12-15 07:20:51', null, '');
INSERT INTO `menu_items` VALUES ('22', '1', '留言', '/admin/orders', '_self', 'voyager-heart', '#000000', null, '6', '2017-12-26 03:11:10', '2017-12-26 03:12:18', null, '');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'admin', '2017-09-20 02:12:44', '2017-09-20 02:12:44');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2016_01_01_000000_add_voyager_user_fields', '1');
INSERT INTO `migrations` VALUES ('4', '2016_01_01_000000_create_data_types_table', '1');
INSERT INTO `migrations` VALUES ('5', '2016_01_01_000000_create_pages_table', '1');
INSERT INTO `migrations` VALUES ('6', '2016_01_01_000000_create_posts_table', '1');
INSERT INTO `migrations` VALUES ('7', '2016_02_15_204651_create_categories_table', '1');
INSERT INTO `migrations` VALUES ('8', '2016_05_19_173453_create_menu_table', '1');
INSERT INTO `migrations` VALUES ('9', '2016_10_21_190000_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('10', '2016_10_21_190000_create_settings_table', '1');
INSERT INTO `migrations` VALUES ('11', '2016_11_30_135954_create_permission_table', '1');
INSERT INTO `migrations` VALUES ('12', '2016_11_30_141208_create_permission_role_table', '1');
INSERT INTO `migrations` VALUES ('13', '2016_12_26_201236_data_types__add__server_side', '1');
INSERT INTO `migrations` VALUES ('14', '2017_01_13_000000_add_route_to_menu_items_table', '1');
INSERT INTO `migrations` VALUES ('15', '2017_01_14_005015_create_translations_table', '1');
INSERT INTO `migrations` VALUES ('16', '2017_01_15_000000_add_permission_group_id_to_permissions_table', '1');
INSERT INTO `migrations` VALUES ('17', '2017_01_15_000000_create_permission_groups_table', '1');
INSERT INTO `migrations` VALUES ('18', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '1');
INSERT INTO `migrations` VALUES ('19', '2017_03_06_000000_add_controller_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('20', '2017_04_21_000000_add_order_to_data_rows_table', '1');
INSERT INTO `migrations` VALUES ('21', '2017_07_05_210000_add_policyname_to_data_types_table', '1');
INSERT INTO `migrations` VALUES ('22', '2017_08_05_000000_add_group_to_settings_table', '1');
INSERT INTO `migrations` VALUES ('23', '2017_11_04_000000_alter_post_nullable_fields_table', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('13', '11', '11@qq.com', 'das', 'dsa', 'a', 'http://anycar.test/contact_us', '2017-12-26 08:22:39', '2017-12-26 08:22:39');
INSERT INTO `orders` VALUES ('14', '111', '111@q.com', '11', '111', '111', 'http://anycar.test/contact_us', '2017-12-26 08:23:41', '2017-12-26 08:23:41');
INSERT INTO `orders` VALUES ('15', '111', '111@q.com', '11', '111', '111', 'http://anycar.test/contact_us', '2017-12-26 08:24:05', '2017-12-26 08:24:05');

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', '1', 'index title', 'index', '<p>index index</p>', null, 'index-title', 'index', 'index', '2017-12-15 08:24:37', '2017-12-15 08:24:37', 'index seo title');
INSERT INTO `pages` VALUES ('2', '1', 'about us', 'about us', '<p>about us 1 2 3</p>', null, 'about-us', 'about us', 'about us', '2017-12-15 08:26:07', '2017-12-21 08:41:20', 'about us title');
INSERT INTO `pages` VALUES ('3', '1', 'contact us', 'contact us', '<p>contact us&nbsp;contact us</p>', null, 'contact-us', 'contact us', 'contact us', '2017-12-15 08:26:43', '2017-12-15 08:26:43', 'contact us seo title');
INSERT INTO `pages` VALUES ('4', '1', 'service', 'service excerpt', '<p>service body</p>', null, 'service', 'service', 'service', '2017-12-20 05:37:55', '2017-12-20 05:37:55', 'service seo');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permission_groups
-- ----------------------------
DROP TABLE IF EXISTS `permission_groups`;
CREATE TABLE `permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_groups
-- ----------------------------

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('1', '2');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('10', '2');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('11', '2');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('12', '2');
INSERT INTO `permission_role` VALUES ('13', '1');
INSERT INTO `permission_role` VALUES ('14', '1');
INSERT INTO `permission_role` VALUES ('15', '1');
INSERT INTO `permission_role` VALUES ('16', '1');
INSERT INTO `permission_role` VALUES ('17', '1');
INSERT INTO `permission_role` VALUES ('18', '1');
INSERT INTO `permission_role` VALUES ('19', '1');
INSERT INTO `permission_role` VALUES ('20', '1');
INSERT INTO `permission_role` VALUES ('21', '1');
INSERT INTO `permission_role` VALUES ('22', '1');
INSERT INTO `permission_role` VALUES ('23', '1');
INSERT INTO `permission_role` VALUES ('24', '1');
INSERT INTO `permission_role` VALUES ('30', '1');
INSERT INTO `permission_role` VALUES ('30', '2');
INSERT INTO `permission_role` VALUES ('31', '1');
INSERT INTO `permission_role` VALUES ('31', '2');
INSERT INTO `permission_role` VALUES ('32', '1');
INSERT INTO `permission_role` VALUES ('32', '2');
INSERT INTO `permission_role` VALUES ('33', '1');
INSERT INTO `permission_role` VALUES ('33', '2');
INSERT INTO `permission_role` VALUES ('34', '1');
INSERT INTO `permission_role` VALUES ('34', '2');
INSERT INTO `permission_role` VALUES ('35', '1');
INSERT INTO `permission_role` VALUES ('35', '2');
INSERT INTO `permission_role` VALUES ('36', '1');
INSERT INTO `permission_role` VALUES ('36', '2');
INSERT INTO `permission_role` VALUES ('37', '1');
INSERT INTO `permission_role` VALUES ('37', '2');
INSERT INTO `permission_role` VALUES ('38', '1');
INSERT INTO `permission_role` VALUES ('39', '1');
INSERT INTO `permission_role` VALUES ('40', '1');
INSERT INTO `permission_role` VALUES ('40', '2');
INSERT INTO `permission_role` VALUES ('41', '1');
INSERT INTO `permission_role` VALUES ('41', '2');
INSERT INTO `permission_role` VALUES ('42', '1');
INSERT INTO `permission_role` VALUES ('42', '2');
INSERT INTO `permission_role` VALUES ('43', '1');
INSERT INTO `permission_role` VALUES ('43', '2');
INSERT INTO `permission_role` VALUES ('44', '1');
INSERT INTO `permission_role` VALUES ('44', '2');
INSERT INTO `permission_role` VALUES ('45', '1');
INSERT INTO `permission_role` VALUES ('45', '2');
INSERT INTO `permission_role` VALUES ('46', '1');
INSERT INTO `permission_role` VALUES ('46', '2');
INSERT INTO `permission_role` VALUES ('47', '1');
INSERT INTO `permission_role` VALUES ('47', '2');
INSERT INTO `permission_role` VALUES ('48', '1');
INSERT INTO `permission_role` VALUES ('48', '2');
INSERT INTO `permission_role` VALUES ('49', '1');
INSERT INTO `permission_role` VALUES ('49', '2');
INSERT INTO `permission_role` VALUES ('50', '1');
INSERT INTO `permission_role` VALUES ('50', '2');
INSERT INTO `permission_role` VALUES ('51', '1');
INSERT INTO `permission_role` VALUES ('51', '2');
INSERT INTO `permission_role` VALUES ('52', '1');
INSERT INTO `permission_role` VALUES ('52', '2');
INSERT INTO `permission_role` VALUES ('53', '1');
INSERT INTO `permission_role` VALUES ('53', '2');
INSERT INTO `permission_role` VALUES ('54', '1');
INSERT INTO `permission_role` VALUES ('54', '2');
INSERT INTO `permission_role` VALUES ('60', '1');
INSERT INTO `permission_role` VALUES ('60', '2');
INSERT INTO `permission_role` VALUES ('61', '1');
INSERT INTO `permission_role` VALUES ('61', '2');
INSERT INTO `permission_role` VALUES ('62', '1');
INSERT INTO `permission_role` VALUES ('62', '2');
INSERT INTO `permission_role` VALUES ('63', '1');
INSERT INTO `permission_role` VALUES ('63', '2');
INSERT INTO `permission_role` VALUES ('64', '1');
INSERT INTO `permission_role` VALUES ('64', '2');
INSERT INTO `permission_role` VALUES ('65', '1');
INSERT INTO `permission_role` VALUES ('65', '2');
INSERT INTO `permission_role` VALUES ('66', '1');
INSERT INTO `permission_role` VALUES ('66', '2');
INSERT INTO `permission_role` VALUES ('67', '1');
INSERT INTO `permission_role` VALUES ('67', '2');
INSERT INTO `permission_role` VALUES ('68', '1');
INSERT INTO `permission_role` VALUES ('68', '2');
INSERT INTO `permission_role` VALUES ('69', '1');
INSERT INTO `permission_role` VALUES ('69', '2');
INSERT INTO `permission_role` VALUES ('75', '1');
INSERT INTO `permission_role` VALUES ('76', '1');
INSERT INTO `permission_role` VALUES ('77', '1');
INSERT INTO `permission_role` VALUES ('78', '1');
INSERT INTO `permission_role` VALUES ('79', '1');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'browse_admin', null, '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('2', 'browse_database', null, '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('3', 'browse_media', null, '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('4', 'browse_compass', null, '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('5', 'browse_menus', 'menus', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('6', 'read_menus', 'menus', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('7', 'edit_menus', 'menus', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('8', 'add_menus', 'menus', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('9', 'delete_menus', 'menus', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('10', 'browse_pages', 'pages', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('11', 'read_pages', 'pages', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('12', 'edit_pages', 'pages', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('13', 'add_pages', 'pages', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('14', 'delete_pages', 'pages', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('15', 'browse_roles', 'roles', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('16', 'read_roles', 'roles', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('17', 'edit_roles', 'roles', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('18', 'add_roles', 'roles', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('19', 'delete_roles', 'roles', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('20', 'browse_users', 'users', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('21', 'read_users', 'users', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('22', 'edit_users', 'users', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('23', 'add_users', 'users', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('24', 'delete_users', 'users', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('30', 'browse_categories', 'categories', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('31', 'read_categories', 'categories', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('32', 'edit_categories', 'categories', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('33', 'add_categories', 'categories', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('34', 'delete_categories', 'categories', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('35', 'browse_settings', 'settings', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('36', 'read_settings', 'settings', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('37', 'edit_settings', 'settings', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('38', 'add_settings', 'settings', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('39', 'delete_settings', 'settings', '2017-09-20 02:12:44', '2017-09-20 02:12:44', null);
INSERT INTO `permissions` VALUES ('40', 'browse_product_categories', 'product_categories', '2017-12-15 05:24:57', '2017-12-15 05:24:57', null);
INSERT INTO `permissions` VALUES ('41', 'read_product_categories', 'product_categories', '2017-12-15 05:24:57', '2017-12-15 05:24:57', null);
INSERT INTO `permissions` VALUES ('42', 'edit_product_categories', 'product_categories', '2017-12-15 05:24:57', '2017-12-15 05:24:57', null);
INSERT INTO `permissions` VALUES ('43', 'add_product_categories', 'product_categories', '2017-12-15 05:24:57', '2017-12-15 05:24:57', null);
INSERT INTO `permissions` VALUES ('44', 'delete_product_categories', 'product_categories', '2017-12-15 05:24:57', '2017-12-15 05:24:57', null);
INSERT INTO `permissions` VALUES ('45', 'browse_products', 'products', '2017-12-15 05:49:51', '2017-12-15 05:49:51', null);
INSERT INTO `permissions` VALUES ('46', 'read_products', 'products', '2017-12-15 05:49:51', '2017-12-15 05:49:51', null);
INSERT INTO `permissions` VALUES ('47', 'edit_products', 'products', '2017-12-15 05:49:51', '2017-12-15 05:49:51', null);
INSERT INTO `permissions` VALUES ('48', 'add_products', 'products', '2017-12-15 05:49:51', '2017-12-15 05:49:51', null);
INSERT INTO `permissions` VALUES ('49', 'delete_products', 'products', '2017-12-15 05:49:51', '2017-12-15 05:49:51', null);
INSERT INTO `permissions` VALUES ('50', 'browse_articles', 'articles', '2017-12-15 06:12:20', '2017-12-15 06:12:20', null);
INSERT INTO `permissions` VALUES ('51', 'read_articles', 'articles', '2017-12-15 06:12:20', '2017-12-15 06:12:20', null);
INSERT INTO `permissions` VALUES ('52', 'edit_articles', 'articles', '2017-12-15 06:12:20', '2017-12-15 06:12:20', null);
INSERT INTO `permissions` VALUES ('53', 'add_articles', 'articles', '2017-12-15 06:12:20', '2017-12-15 06:12:20', null);
INSERT INTO `permissions` VALUES ('54', 'delete_articles', 'articles', '2017-12-15 06:12:20', '2017-12-15 06:12:20', null);
INSERT INTO `permissions` VALUES ('60', 'browse_gallery_categories', 'gallery_categories', '2017-12-15 07:07:07', '2017-12-15 07:07:07', null);
INSERT INTO `permissions` VALUES ('61', 'read_gallery_categories', 'gallery_categories', '2017-12-15 07:07:07', '2017-12-15 07:07:07', null);
INSERT INTO `permissions` VALUES ('62', 'edit_gallery_categories', 'gallery_categories', '2017-12-15 07:07:07', '2017-12-15 07:07:07', null);
INSERT INTO `permissions` VALUES ('63', 'add_gallery_categories', 'gallery_categories', '2017-12-15 07:07:08', '2017-12-15 07:07:08', null);
INSERT INTO `permissions` VALUES ('64', 'delete_gallery_categories', 'gallery_categories', '2017-12-15 07:07:08', '2017-12-15 07:07:08', null);
INSERT INTO `permissions` VALUES ('65', 'browse_galleries', 'galleries', '2017-12-15 07:13:13', '2017-12-15 07:13:13', null);
INSERT INTO `permissions` VALUES ('66', 'read_galleries', 'galleries', '2017-12-15 07:13:13', '2017-12-15 07:13:13', null);
INSERT INTO `permissions` VALUES ('67', 'edit_galleries', 'galleries', '2017-12-15 07:13:14', '2017-12-15 07:13:14', null);
INSERT INTO `permissions` VALUES ('68', 'add_galleries', 'galleries', '2017-12-15 07:13:14', '2017-12-15 07:13:14', null);
INSERT INTO `permissions` VALUES ('69', 'delete_galleries', 'galleries', '2017-12-15 07:13:14', '2017-12-15 07:13:14', null);
INSERT INTO `permissions` VALUES ('75', 'browse_orders', 'orders', '2017-12-26 03:11:09', '2017-12-26 03:11:09', null);
INSERT INTO `permissions` VALUES ('76', 'read_orders', 'orders', '2017-12-26 03:11:09', '2017-12-26 03:11:09', null);
INSERT INTO `permissions` VALUES ('77', 'edit_orders', 'orders', '2017-12-26 03:11:09', '2017-12-26 03:11:09', null);
INSERT INTO `permissions` VALUES ('78', 'add_orders', 'orders', '2017-12-26 03:11:10', '2017-12-26 03:11:10', null);
INSERT INTO `permissions` VALUES ('79', 'delete_orders', 'orders', '2017-12-26 03:11:10', '2017-12-26 03:11:10', null);

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `order` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_categories_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('1', null, 'product category 11', 'product-category-1-1', 'product-categories/December2017/y4PNBJMIIp3x9fK9gAJ1.jpg', 'product category 1 1seo', 'product category 11', 'product category 11', '1', '2017-12-20 02:33:00', '2017-12-22 03:11:05');
INSERT INTO `product_categories` VALUES ('2', null, 'product category 2 2', 'product-category-2', 'product-categories/December2017/2f6QETLafRaQfPadnBA8.jpg', 'product category 2 seo', 'product category 2', 'product category 2', '1', '2017-12-20 02:33:00', '2017-12-22 02:59:21');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `image` text COLLATE utf8_unicode_ci,
  `featured` tinyint(4) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `parameter` text COLLATE utf8_unicode_ci,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `order` tinyint(4) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '2', 'product  1', 'product  11 excerpt', 'products/December2017/fvzO6spGVKap3JaoXVf1.jpg', '1', '<p>product&nbsp; 1&nbsp;product&nbsp; 1</p>', '<p>product&nbsp; 1 tech</p>', 'product-1', 'product  1 seo', 'product  1', 'product  1', '1', '2017-12-20 05:20:00', '2018-03-05 01:47:17');
INSERT INTO `products` VALUES ('2', '1', 'product 2', 'product 2 excerpt', 'products/December2017/KKdbx6UY1BqKc4gwadcB.jpg', '1', '<p>product 2</p>', '<p>product 2 tech</p>', 'product-2', 'product 2 seo', 'product 2', 'product 2', '2', '2017-12-20 05:23:00', '2017-12-20 07:06:46');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', '2017-09-20 02:12:44', '2017-09-20 02:12:44');
INSERT INTO `roles` VALUES ('2', 'user', 'Normal User', '2017-09-20 02:12:44', '2017-09-20 02:12:44');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'index.company_name', '公司名称', 'maomao', null, 'text', '0', 'index');
INSERT INTO `settings` VALUES ('2', 'index.welcome', '欢迎语', 'welcome to maomao site, can call 1893283222', null, 'text', '1', 'index');
INSERT INTO `settings` VALUES ('3', 'index.logo', 'logo(原版为透明底白字,185*30)', 'settings/December2017/5x7E4szDcxMIyZUHSW1o.png', null, 'image', '2', 'index');
INSERT INTO `settings` VALUES ('4', 'index.slide_1', '幻灯片1（像素需为1480*400）', 'settings/December2017/LMLHEzCPNZa6so94cjl9.jpg', null, 'image', '3', 'index');
INSERT INTO `settings` VALUES ('5', 'index.slide_2', '幻灯片2（像素需为1480*400）', 'settings/December2017/ivTp9WkXseSsG6ewngAq.jpg', null, 'image', '4', 'index');
INSERT INTO `settings` VALUES ('6', 'index.about_us', '首页 - 关于我们图像(350*200)', 'settings/December2017/D6hao6ZiCTyJ2gdICIQN.jpg', null, 'image', '5', 'index');
INSERT INTO `settings` VALUES ('7', 'index.about_us_excerpt', '首页 - 关于我们简介', 'about us excerpt', null, 'text', '6', 'index');
INSERT INTO `settings` VALUES ('8', 'index.tech', '首页 - 技术服务图像(350*200)', 'settings/December2017/dK6U9KIeGnLAIjNl170d.jpg', null, 'image', '7', 'index');
INSERT INTO `settings` VALUES ('9', 'index.tech_excerpt', '首页 - 技术服务简介', 'our tech excerpt', null, 'text', '8', 'index');
INSERT INTO `settings` VALUES ('10', 'index.foot', '底部信息', '<p> 24 hour response service,welcome to inquire at any time!</p>\r\n                                <div class=\"two-columns row\">\r\n                                    <div class=\"object\">\r\n                                        <i class=\"fa fa-map-marker\"></i>\r\n                                        <strong>Add:</strong> xx Street, Zhengzhou, China<br>\r\n                                        <i class=\"fa fa-phone\"></i>\r\n                                        <strong>Tel:</strong> <a href=\"tel:0086-371-1111111\">0086-371-111111</a>\r\n                                    </div>\r\n                                    <div class=\"object ft-phone\">\r\n                                        <i class=\"fa fa-tablet\"></i>\r\n                                        <strong>Phone: </strong> <a href=\"tel:0086-11111\">0086-11111</a><br>\r\n                                        <i class=\"fa fa-envelope\"></i>\r\n                                        <strong>E-mail:</strong>\r\n                                        <a href=\"mailto:info@111.com\">info@111.com</a>\r\n                                    </div>\r\n                                </div><!-- /.row -->\r\n                                <a href=\"/contact_us\" class=\"button\">contact us</a>', null, 'code_editor', '9', 'index');
INSERT INTO `settings` VALUES ('11', 'index.copyright', '底部版权信息', '版权所有：maomao 备案号:豫ICP备12131号 ', null, 'text', '10', 'index');

-- ----------------------------
-- Table structure for translations
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translations
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'chaos', 'chaos29092@gmail.com', 'users/September2017/chaos.jpg', '$2y$10$Hn5.NiTyB5uE4eLv.lOJDeNcmLMkhBHh5t6CGJAbfiP.ubYTc5Hi6', null, '2017-09-20 02:14:03', '2017-09-20 02:23:43');
