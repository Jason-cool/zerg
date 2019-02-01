/*
Navicat MariaDB Data Transfer

Source Server         : hcj
Source Server Version : 100136
Source Host           : localhost:3306
Source Database       : zerg

Target Server Type    : MariaDB
Target Server Version : 100136
File Encoding         : 65001

Date: 2019-02-01 12:27:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '首页置顶', '首页轮播图', null, null);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES ('1', '65', '6', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('2', '2', '25', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('3', '3', '11', '1', null, '1', null);
INSERT INTO `banner_item` VALUES ('5', '1', '10', '1', null, '1', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('2', '果味', '6', null, null, null);
INSERT INTO `category` VALUES ('3', '蔬菜', '5', null, null, null);
INSERT INTO `category` VALUES ('4', '炒货', '7', null, null, null);
INSERT INTO `category` VALUES ('5', '点心', '4', null, null, null);
INSERT INTO `category` VALUES ('6', '粗茶', '8', null, null, null);
INSERT INTO `category` VALUES ('7', '淡饭', '9', null, null, null);

-- ----------------------------
-- Table structure for form_open_user_order
-- ----------------------------
DROP TABLE IF EXISTS `form_open_user_order`;
CREATE TABLE `form_open_user_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) DEFAULT NULL,
  `form_id` varchar(59) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of form_open_user_order
-- ----------------------------
INSERT INTO `form_open_user_order` VALUES ('1', null, 'the formId is a mock one', '80', '1');
INSERT INTO `form_open_user_order` VALUES ('2', null, '3e967e1cddf9c595ce760e0f3fbac983', '81', '1');
INSERT INTO `form_open_user_order` VALUES ('3', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', 'd4e21614a2bea281cbbc1b05ed2c9f34', '82', '1');
INSERT INTO `form_open_user_order` VALUES ('4', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', 'dd59c96ed6205d69a878d3b596b1dee8', '83', '1');
INSERT INTO `form_open_user_order` VALUES ('5', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', '56a28a3c1aad08a0a34f9e735c0d7cc3', '84', '1');
INSERT INTO `form_open_user_order` VALUES ('6', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', 'fb203c8a7d3197d6785d0642be865e8d', '85', '1');
INSERT INTO `form_open_user_order` VALUES ('7', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', 'b7856784cf87471c927b64bb9b1823d9', '86', '1');
INSERT INTO `form_open_user_order` VALUES ('8', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', 'b2a1b10ee9bdabf122a9f0d7a763a2f5', '87', '1');
INSERT INTO `form_open_user_order` VALUES ('9', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', '4e2f4be1eddf0c9e8a0469a046d86ba4', '88', '1');

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES ('1', '/banner-1a.png', '1', null, null);
INSERT INTO `image` VALUES ('2', '/banner-2a.png', '1', null, null);
INSERT INTO `image` VALUES ('3', '/banner-3a.png', '1', null, null);
INSERT INTO `image` VALUES ('4', '/category-cake.png', '1', null, null);
INSERT INTO `image` VALUES ('5', '/category-vg.png', '1', null, null);
INSERT INTO `image` VALUES ('6', '/category-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('7', '/category-fry-a.png', '1', null, null);
INSERT INTO `image` VALUES ('8', '/category-tea.png', '1', null, null);
INSERT INTO `image` VALUES ('9', '/category-rice.png', '1', null, null);
INSERT INTO `image` VALUES ('10', '/product-dryfruit@1.png', '1', null, null);
INSERT INTO `image` VALUES ('13', '/product-vg@1.png', '1', null, null);
INSERT INTO `image` VALUES ('14', '/product-rice@6.png', '1', null, null);
INSERT INTO `image` VALUES ('16', '/1@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('17', '/2@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('18', '/3@theme.png', '1', null, null);
INSERT INTO `image` VALUES ('19', '/detail-1@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('20', '/detail-2@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('21', '/detail-3@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('22', '/detail-4@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('23', '/detail-5@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('24', '/detail-6@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('25', '/detail-7@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('26', '/detail-8@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('27', '/detail-9@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('28', '/detail-11@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('29', '/detail-10@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('31', '/product-rice@1.png', '1', null, null);
INSERT INTO `image` VALUES ('32', '/product-tea@1.png', '1', null, null);
INSERT INTO `image` VALUES ('33', '/product-dryfruit@2.png', '1', null, null);
INSERT INTO `image` VALUES ('36', '/product-dryfruit@3.png', '1', null, null);
INSERT INTO `image` VALUES ('37', '/product-dryfruit@4.png', '1', null, null);
INSERT INTO `image` VALUES ('38', '/product-dryfruit@5.png', '1', null, null);
INSERT INTO `image` VALUES ('39', '/product-dryfruit-a@6.png', '1', null, null);
INSERT INTO `image` VALUES ('40', '/product-dryfruit@7.png', '1', null, null);
INSERT INTO `image` VALUES ('41', '/product-rice@2.png', '1', null, null);
INSERT INTO `image` VALUES ('42', '/product-rice@3.png', '1', null, null);
INSERT INTO `image` VALUES ('43', '/product-rice@4.png', '1', null, null);
INSERT INTO `image` VALUES ('44', '/product-fry@1.png', '1', null, null);
INSERT INTO `image` VALUES ('45', '/product-fry@2.png', '1', null, null);
INSERT INTO `image` VALUES ('46', '/product-fry@3.png', '1', null, null);
INSERT INTO `image` VALUES ('47', '/product-tea@2.png', '1', null, null);
INSERT INTO `image` VALUES ('48', '/product-tea@3.png', '1', null, null);
INSERT INTO `image` VALUES ('49', '/1@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('50', '/2@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('51', '/3@theme-head.png', '1', null, null);
INSERT INTO `image` VALUES ('52', '/product-cake@1.png', '1', null, null);
INSERT INTO `image` VALUES ('53', '/product-cake@2.png', '1', null, null);
INSERT INTO `image` VALUES ('54', '/product-cake-a@3.png', '1', null, null);
INSERT INTO `image` VALUES ('55', '/product-cake-a@4.png', '1', null, null);
INSERT INTO `image` VALUES ('56', '/product-dryfruit@8.png', '1', null, null);
INSERT INTO `image` VALUES ('57', '/product-fry@4.png', '1', null, null);
INSERT INTO `image` VALUES ('58', '/product-fry@5.png', '1', null, null);
INSERT INTO `image` VALUES ('59', '/product-rice@5.png', '1', null, null);
INSERT INTO `image` VALUES ('60', '/product-rice@7.png', '1', null, null);
INSERT INTO `image` VALUES ('62', '/detail-12@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('63', '/detail-13@1-dryfruit.png', '1', null, null);
INSERT INTO `image` VALUES ('65', '/banner-4a.png', '1', null, null);
INSERT INTO `image` VALUES ('66', '/product-vg@4.png', '1', null, null);
INSERT INTO `image` VALUES ('67', '/product-vg@5.png', '1', null, null);
INSERT INTO `image` VALUES ('68', '/product-vg@2.png', '1', null, null);
INSERT INTO `image` VALUES ('69', '/product-vg@3.png', '1', null, null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_no` (`order_no`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', 'B104330356369626', '1', null, null, '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', null, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('2', 'B104331158519824', '1', null, null, '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', null, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('3', 'B104331311628702', '1', null, null, '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', null, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('4', 'B104767069452860', '1', null, '1546576701', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546576701', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('5', 'B107386662612388', '1', null, '1546838664', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546838664', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('6', 'B107386700514047', '1', null, '1546838669', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546838669', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('7', 'B107387913664371', '1', null, '1546838790', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546838790', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('8', 'B107392593522276', '1', null, '1546839258', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839258', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('9', 'B107394634630640', '1', null, '1546839462', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839462', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('10', 'B107395250200076', '1', null, '1546839524', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839524', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('11', 'B107395861078411', '1', null, '1546839585', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839585', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('12', 'B107396739429706', '1', null, '1546839673', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839673', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('13', 'B107398370142277', '1', null, '1546839836', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839836', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('14', 'B107398811407598', '1', null, '1546839880', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839880', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('15', 'B107399643776546', '1', null, '1546839964', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546839964', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('16', 'B107401119443475', '1', null, '1546840111', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840111', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('17', 'B107401850514572', '1', null, '1546840184', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840184', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('18', 'B107402121410183', '1', null, '1546840211', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840211', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('19', 'B107402532961757', '1', null, '1546840253', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840253', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('20', 'B107402750111714', '1', null, '1546840274', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840274', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('21', 'B107403790638583', '1', null, '1546840378', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840378', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('22', 'B107403987494733', '1', null, '1546840398', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840398', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('23', 'B107407609835804', '1', null, '1546840760', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840760', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('24', 'B107409820836736', '1', null, '1546840981', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840981', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('25', 'B107409999290426', '1', null, '1546840999', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546840999', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('26', 'B107410087016172', '1', null, '1546841008', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841008', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('27', 'B107412309076386', '1', null, '1546841230', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841230', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('28', 'B107412861851199', '1', null, '1546841285', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841285', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('29', 'B107413216746382', '1', null, '1546841321', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841321', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('30', 'B107413913606769', '1', null, '1546841391', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841391', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('31', 'B107414446412475', '1', null, '1546841444', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841444', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('32', 'B107419161825193', '1', null, '1546841915', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841915', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('33', 'B107419974598881', '1', null, '1546841997', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546841997', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('34', 'B107591702181362', '1', null, '1546859169', '0.02', '1', 'http://z.cn/images/product-vg@1.png', '芹菜 半斤等', '2', '1546859169', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u563b\\u563b\\u54c8\\u54c8\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u63ed\\u9633\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u597d\\u770b\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('35', 'B123094657364195', '1', null, '1548209465', '0.01', '1', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548209465', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('36', 'B123101577854588', '1', null, '1548210157', '0.01', '1', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548210157', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('37', 'B123102583789695', '1', null, '1548210258', '0.04', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '4', '1548210258', '[{\"id\":4,\"haveStock\":true,\"count\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.04}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('38', 'B123136428562439', '1', null, '1548213642', '0.04', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '4', '1548213642', '[{\"id\":4,\"haveStock\":true,\"count\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.04}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('39', 'B123136749300198', '1', null, '1548213674', '0.04', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '4', '1548213674', '[{\"id\":4,\"haveStock\":true,\"count\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.04}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('40', 'B123137040836552', '1', null, '1548213703', '0.04', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '4', '1548213703', '[{\"id\":4,\"haveStock\":true,\"count\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.04}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('41', 'B123137266773350', '1', null, '1548213726', '0.04', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '4', '1548213726', '[{\"id\":4,\"haveStock\":true,\"count\":4,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.04}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('42', 'B123140054769817', '1', null, '1548214005', '0.01', '1', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548214005', '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('43', 'B123141254262397', '1', null, '1548214125', '0.01', '1', 'http://192.168.124.12/images/product-rice@1.png', '素米 327克', '1', '1548214125', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('44', 'B123142706117748', '1', null, '1548214270', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548214270', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('45', 'B123148009319810', '1', null, '1548214800', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548214800', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('46', 'B123149953729545', '1', null, '1548214995', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548214995', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('47', 'B123150567172934', '1', null, '1548215056', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548215056', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('48', 'B123152732960524', '1', null, '1548215273', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548215273', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('49', 'B123153132322574', '1', null, '1548215312', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548215312', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('50', 'B123158310829778', '1', null, '1548215830', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548215830', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('51', 'B123266052992358', '1', null, '1548226604', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548226604', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('52', 'B123267690450293', '1', null, '1548226768', '0.02', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个等', '2', '1548226768', '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('53', 'B123276999940616', '1', null, '1548227699', '0.01', '1', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548227699', '[{\"id\":1,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-vg@1.png\",\"price\":\"0.01\",\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('54', 'B124125027437064', '1', null, '1548312502', '0.01', '1', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548312502', '[{\"id\":1,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-vg@1.png\",\"price\":\"0.01\",\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('55', 'B124126227636060', '1', null, '1548312622', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548312622', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('56', 'B124131819597371', '1', null, '1548313181', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548313181', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('57', 'B124166182987845', '1', null, '1548316617', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548316617', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('58', 'B124170801489981', '1', null, '1548317079', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548317079', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('59', 'B124177074023738', '1', null, '1548317707', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548317707', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('60', 'B124177576072162', '1', null, '1548317757', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@3.png', '夏日芒果 3个', '1', '1548317757', '[{\"id\":8,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@3.png\",\"price\":\"0.01\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('61', 'B124198495975109', '1', null, '1548319849', '0.01', '2', 'http://192.168.124.12/images/product-dryfruit@3.png', '夏日芒果 3个', '1', '1548319849', '[{\"id\":8,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@3.png\",\"price\":\"0.01\",\"name\":\"\\u590f\\u65e5\\u8292\\u679c 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('62', 'B124199252117643', '1', null, '1548319924', '0.01', '2', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548319924', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('63', 'B128532893429622', '1', null, '1548653289', '0.01', '1', 'http://192.168.124.12/images/product-rice@3.png', '芝麻 50克', '1', '1548653289', '[{\"id\":14,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-rice@3.png\",\"price\":\"0.01\",\"name\":\"\\u829d\\u9ebb 50\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('64', 'B128534720939341', '1', null, '1548653471', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548653471', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('65', 'B128571740154903', '1', null, '1548657173', '0.01', '1', 'http://192.168.124.12/images/product-rice@1.png', '素米 327克', '1', '1548657173', '[{\"id\":3,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-rice@1.png\",\"price\":\"0.01\",\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('66', 'B128572498950878', '1', null, '1548657249', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657249', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('67', 'B128572933797009', '1', null, '1548657293', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657293', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('68', 'B128573333100720', '1', null, '1548657333', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657333', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('69', 'B128574212610336', '1', null, '1548657421', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657421', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('70', 'B128574738132926', '1', null, '1548657473', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657473', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('71', 'B128576303245145', '1', null, '1548657630', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657630', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('72', 'B128576660864391', '1', null, '1548657665', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657665', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('73', 'B128578077122334', '1', null, '1548657807', '0.01', '1', 'http://192.168.124.12/images/product-dryfruit@1.png', '梨花带雨 3个', '1', '1548657807', '[{\"id\":2,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@1.png\",\"price\":\"0.01\",\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('74', 'B128578453912008', '1', null, '1548657845', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548657845', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('75', 'B128579612200618', '1', null, '1548657961', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548657961', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('76', 'B128580352796776', '1', null, '1548658035', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548658035', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('77', 'B128585614384832', '1', null, '1548658561', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548658561', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('78', 'B128587228471774', '1', null, '1548658722', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548658722', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('79', 'B128587702122449', '1', null, '1548658770', '0.01', '1', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548658770', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('80', 'B128589528784753', '1', null, '1548658952', '0.01', '2', 'http://192.168.124.12/images/product-tea@1.png', '红袖枸杞 6克*3袋', '1', '1548658952', '[{\"id\":4,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-tea@1.png\",\"price\":\"0.01\",\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('81', 'B128590414780211', '1', null, '1548659041', '0.01', '2', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548659041', '[{\"id\":1,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-vg@1.png\",\"price\":\"0.01\",\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('82', 'B128693389218470', '1', null, '1548669338', '0.01', '2', 'http://192.168.124.12/images/product-vg@1.png', '芹菜 半斤', '1', '1548669338', '[{\"id\":1,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-vg@1.png\",\"price\":\"0.01\",\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('83', 'B128830731121175', '1', null, '1548683072', '0.01', '2', 'http://192.168.124.12/images/product-vg@2.png', '泥蒿 半斤', '1', '1548683072', '[{\"id\":7,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-vg@2.png\",\"price\":\"0.01\",\"name\":\"\\u6ce5\\u84bf \\u534a\\u65a4\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('84', 'B128836552407215', '1', null, '1548683655', '0.01', '2', 'http://192.168.124.12/images/product-cake@2.png', '小红的猪耳朵 120克', '1', '1548683655', '[{\"id\":6,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-cake@2.png\",\"price\":\"0.01\",\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('85', 'B128841781055525', '1', null, '1548684177', '0.01', '3', 'http://192.168.124.12/images/product-dryfruit-a@6.png', '贵妃笑 100克', '1', '1548684200', '[{\"id\":11,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit-a@6.png\",\"price\":\"0.01\",\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('86', 'B128842938366852', '1', null, '1548684293', '0.01', '3', 'http://192.168.124.12/images/product-rice@3.png', '芝麻 50克', '1', '1548684307', '[{\"id\":14,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-rice@3.png\",\"price\":\"0.01\",\"name\":\"\\u829d\\u9ebb 50\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('87', 'B128852848362058', '1', null, '1548685284', '0.01', '3', 'http://192.168.124.12/images/product-dryfruit@4.png', '冬木红枣 500克', '1', '1548685307', '[{\"id\":9,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@4.png\",\"price\":\"0.01\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);
INSERT INTO `order` VALUES ('88', 'B128857768661408', '1', null, '1548685776', '0.01', '3', 'http://192.168.124.12/images/product-dryfruit@4.png', '冬木红枣 500克', '1', '1548685839', '[{\"id\":9,\"haveStock\":true,\"counts\":1,\"main_img_url\":\"http:\\/\\/192.168.124.12\\/images\\/product-dryfruit@4.png\",\"price\":\"0.01\",\"name\":\"\\u51ac\\u6728\\u7ea2\\u67a3 500\\u514b\",\"totalPrice\":0.01}]', '{\"name\":\"\\u80e1\\u521b\\u5065\",\"mobile\":\"15820274350\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u5929\\u6cb3\\u533a\",\"detail\":\"\\u5e7f\\u4e1c\\u5de5\\u7a0b\\u804c\\u4e1a\\u6280\\u672f\\u5b66\\u9662\",\"update_time\":\"1970-01-01 08:00:00\"}', null);

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`,`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES ('1', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('2', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('3', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('4', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('5', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('6', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('7', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('8', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('9', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('10', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('11', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('12', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('13', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('14', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('15', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('16', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('17', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('18', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('19', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('20', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('21', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('22', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('23', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('24', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('25', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('26', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('27', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('28', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('29', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('30', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('31', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('32', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('33', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('34', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('35', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('36', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('42', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('53', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('54', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('81', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('82', '1', '1', null, null);
INSERT INTO `order_product` VALUES ('1', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('2', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('3', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('4', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('5', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('6', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('7', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('8', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('9', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('10', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('11', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('12', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('13', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('14', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('15', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('16', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('17', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('18', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('19', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('20', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('21', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('22', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('23', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('24', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('25', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('26', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('27', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('28', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('29', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('30', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('31', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('32', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('33', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('34', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('44', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('45', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('46', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('47', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('48', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('49', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('50', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('51', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('52', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('56', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('57', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('58', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('59', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('62', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('64', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('66', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('67', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('68', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('69', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('70', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('71', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('72', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('73', '2', '1', null, null);
INSERT INTO `order_product` VALUES ('43', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('44', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('45', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('46', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('47', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('48', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('49', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('50', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('51', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('52', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('65', '3', '1', null, null);
INSERT INTO `order_product` VALUES ('37', '4', '4', null, null);
INSERT INTO `order_product` VALUES ('38', '4', '4', null, null);
INSERT INTO `order_product` VALUES ('39', '4', '4', null, null);
INSERT INTO `order_product` VALUES ('40', '4', '4', null, null);
INSERT INTO `order_product` VALUES ('41', '4', '4', null, null);
INSERT INTO `order_product` VALUES ('55', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('74', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('75', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('76', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('77', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('78', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('79', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('80', '4', '1', null, null);
INSERT INTO `order_product` VALUES ('84', '6', '1', null, null);
INSERT INTO `order_product` VALUES ('83', '7', '1', null, null);
INSERT INTO `order_product` VALUES ('60', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('61', '8', '1', null, null);
INSERT INTO `order_product` VALUES ('87', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('88', '9', '1', null, null);
INSERT INTO `order_product` VALUES ('85', '11', '1', null, null);
INSERT INTO `order_product` VALUES ('63', '14', '1', null, null);
INSERT INTO `order_product` VALUES ('86', '14', '1', null, null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '芹菜 半斤', '0.01', '998', null, '3', '/product-vg@1.png', '1', null, null, null, '13');
INSERT INTO `product` VALUES ('2', '梨花带雨 3个', '0.01', '984', null, '2', '/product-dryfruit@1.png', '1', null, null, null, '10');
INSERT INTO `product` VALUES ('3', '素米 327克', '0.01', '996', null, '7', '/product-rice@1.png', '1', null, null, null, '31');
INSERT INTO `product` VALUES ('4', '红袖枸杞 6克*3袋', '0.01', '998', null, '6', '/product-tea@1.png', '1', null, null, null, '32');
INSERT INTO `product` VALUES ('5', '春生龙眼 500克', '0.01', '995', null, '2', '/product-dryfruit@2.png', '1', null, null, null, '33');
INSERT INTO `product` VALUES ('6', '小红的猪耳朵 120克', '0.01', '997', null, '5', '/product-cake@2.png', '1', null, null, null, '53');
INSERT INTO `product` VALUES ('7', '泥蒿 半斤', '0.01', '998', null, '3', '/product-vg@2.png', '1', null, null, null, '68');
INSERT INTO `product` VALUES ('8', '夏日芒果 3个', '0.01', '995', null, '2', '/product-dryfruit@3.png', '1', null, null, null, '36');
INSERT INTO `product` VALUES ('9', '冬木红枣 500克', '0.01', '996', null, '2', '/product-dryfruit@4.png', '1', null, null, null, '37');
INSERT INTO `product` VALUES ('10', '万紫千凤梨 300克', '0.01', '996', null, '2', '/product-dryfruit@5.png', '1', null, null, null, '38');
INSERT INTO `product` VALUES ('11', '贵妃笑 100克', '0.01', '994', null, '2', '/product-dryfruit-a@6.png', '1', null, null, null, '39');
INSERT INTO `product` VALUES ('12', '珍奇异果 3个', '0.01', '999', null, '2', '/product-dryfruit@7.png', '1', null, null, null, '40');
INSERT INTO `product` VALUES ('13', '绿豆 125克', '0.01', '999', null, '7', '/product-rice@2.png', '1', null, null, null, '41');
INSERT INTO `product` VALUES ('14', '芝麻 50克', '0.01', '999', null, '7', '/product-rice@3.png', '1', null, null, null, '42');
INSERT INTO `product` VALUES ('15', '猴头菇 370克', '0.01', '999', null, '7', '/product-rice@4.png', '1', null, null, null, '43');
INSERT INTO `product` VALUES ('16', '西红柿 1斤', '0.01', '999', null, '3', '/product-vg@3.png', '1', null, null, null, '69');
INSERT INTO `product` VALUES ('17', '油炸花生 300克', '0.01', '999', null, '4', '/product-fry@1.png', '1', null, null, null, '44');
INSERT INTO `product` VALUES ('18', '春泥西瓜子 128克', '0.01', '997', null, '4', '/product-fry@2.png', '1', null, null, null, '45');
INSERT INTO `product` VALUES ('19', '碧水葵花籽 128克', '0.01', '999', null, '4', '/product-fry@3.png', '1', null, null, null, '46');
INSERT INTO `product` VALUES ('20', '碧螺春 12克*3袋', '0.01', '999', null, '6', '/product-tea@2.png', '1', null, null, null, '47');
INSERT INTO `product` VALUES ('21', '西湖龙井 8克*3袋', '0.01', '998', null, '6', '/product-tea@3.png', '1', null, null, null, '48');
INSERT INTO `product` VALUES ('22', '梅兰清花糕 1个', '0.01', '997', null, '5', '/product-cake-a@3.png', '1', null, null, null, '54');
INSERT INTO `product` VALUES ('23', '清凉薄荷糕 1个', '0.01', '998', null, '5', '/product-cake-a@4.png', '1', null, null, null, '55');
INSERT INTO `product` VALUES ('25', '小明的妙脆角 120克', '0.01', '999', null, '5', '/product-cake@1.png', '1', null, null, null, '52');
INSERT INTO `product` VALUES ('26', '红衣青瓜 混搭160克', '0.01', '999', null, '2', '/product-dryfruit@8.png', '1', null, null, null, '56');
INSERT INTO `product` VALUES ('27', '锈色瓜子 100克', '0.01', '998', null, '4', '/product-fry@4.png', '1', null, null, null, '57');
INSERT INTO `product` VALUES ('28', '春泥花生 200克', '0.01', '999', null, '4', '/product-fry@5.png', '1', null, null, null, '58');
INSERT INTO `product` VALUES ('29', '冰心鸡蛋 2个', '0.01', '999', null, '7', '/product-rice@5.png', '1', null, null, null, '59');
INSERT INTO `product` VALUES ('30', '八宝莲子 200克', '0.01', '999', null, '7', '/product-rice@6.png', '1', null, null, null, '14');
INSERT INTO `product` VALUES ('31', '深涧木耳 78克', '0.01', '999', null, '7', '/product-rice@7.png', '1', null, null, null, '60');
INSERT INTO `product` VALUES ('32', '土豆 半斤', '0.01', '999', null, '3', '/product-vg@4.png', '1', null, null, null, '66');
INSERT INTO `product` VALUES ('33', '青椒 半斤', '0.01', '999', null, '3', '/product-vg@5.png', '1', null, null, null, '67');

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES ('4', '19', null, '1', '11');
INSERT INTO `product_image` VALUES ('5', '20', null, '2', '11');
INSERT INTO `product_image` VALUES ('6', '21', null, '3', '11');
INSERT INTO `product_image` VALUES ('7', '22', null, '4', '11');
INSERT INTO `product_image` VALUES ('8', '23', null, '5', '11');
INSERT INTO `product_image` VALUES ('9', '24', null, '6', '11');
INSERT INTO `product_image` VALUES ('10', '25', null, '7', '11');
INSERT INTO `product_image` VALUES ('11', '26', null, '8', '11');
INSERT INTO `product_image` VALUES ('12', '27', null, '9', '11');
INSERT INTO `product_image` VALUES ('13', '28', null, '11', '11');
INSERT INTO `product_image` VALUES ('14', '29', null, '10', '11');
INSERT INTO `product_image` VALUES ('18', '62', null, '12', '11');
INSERT INTO `product_image` VALUES ('19', '63', null, '13', '11');

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES ('1', '品名', '杨梅', '11', null, null);
INSERT INTO `product_property` VALUES ('2', '口味', '青梅味 雪梨味 黄桃味 菠萝味', '11', null, null);
INSERT INTO `product_property` VALUES ('3', '产地', '火星', '11', null, null);
INSERT INTO `product_property` VALUES ('4', '保质期', '180天', '11', null, null);
INSERT INTO `product_property` VALUES ('5', '品名', '梨子', '2', null, null);
INSERT INTO `product_property` VALUES ('6', '产地', '金星', '2', null, null);
INSERT INTO `product_property` VALUES ('7', '净含量', '100g', '2', null, null);
INSERT INTO `product_property` VALUES ('8', '保质期', '10天', '2', null, null);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '专题栏位一', '美味水果世界', '16', null, '49', null);
INSERT INTO `theme` VALUES ('2', '专题栏位二', '新品推荐', '17', null, '50', null);
INSERT INTO `theme` VALUES ('3', '专题栏位三', '做个干物女', '18', null, '18', null);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES ('1', '2');
INSERT INTO `theme_product` VALUES ('1', '5');
INSERT INTO `theme_product` VALUES ('1', '8');
INSERT INTO `theme_product` VALUES ('1', '10');
INSERT INTO `theme_product` VALUES ('1', '12');
INSERT INTO `theme_product` VALUES ('2', '1');
INSERT INTO `theme_product` VALUES ('2', '2');
INSERT INTO `theme_product` VALUES ('2', '3');
INSERT INTO `theme_product` VALUES ('2', '5');
INSERT INTO `theme_product` VALUES ('2', '6');
INSERT INTO `theme_product` VALUES ('2', '16');
INSERT INTO `theme_product` VALUES ('2', '33');
INSERT INTO `theme_product` VALUES ('3', '15');
INSERT INTO `theme_product` VALUES ('3', '18');
INSERT INTO `theme_product` VALUES ('3', '19');
INSERT INTO `theme_product` VALUES ('3', '27');
INSERT INTO `theme_product` VALUES ('3', '30');
INSERT INTO `theme_product` VALUES ('3', '31');

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES ('1', 'starcraft', '777*777', 'CMS', '32', 'Super', null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'oQTBd5eyH9L8nBX0CEXJzBpW5KE4', null, null, null, null, null);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES ('1', '胡创健', '15820274350', '广东省', '广州市', '天河区', '广东工程职业技术学院', null, '1', null);
