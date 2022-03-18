/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50631
 Source Host           : localhost:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 50631
 File Encoding         : 65001

 Date: 11/03/2022 19:13:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT 'member_id',
  `order_sn` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?????',
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT 'ʹ?õ??Ż?ȯ',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create_time',
  `member_username` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?û???',
  `total_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?????ܶ',
  `pay_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT 'Ӧ???ܶ',
  `freight_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?˷ѽ',
  `promotion_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?????Ż?????????ۡ??????????ݼۣ?',
  `integration_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '???ֵֿ۽',
  `coupon_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?Ż?ȯ?ֿ۽',
  `discount_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '??̨????????ʹ?õ??ۿ۽',
  `pay_type` tinyint(4) NULL DEFAULT NULL COMMENT '֧????ʽ??1->֧??????2->΢?ţ?3->?????? 4->?????????',
  `source_type` tinyint(4) NULL DEFAULT NULL COMMENT '??????Դ[0->PC??????1->app????]',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????',
  `delivery_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????˾(???ͷ?ʽ)',
  `delivery_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '???????',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '?Զ?ȷ??ʱ?䣨?죩',
  `integration` int(11) NULL DEFAULT NULL COMMENT '???Ի??õĻ??',
  `growth` int(11) NULL DEFAULT NULL COMMENT '???Ի??õĳɳ?ֵ',
  `bill_type` tinyint(4) NULL DEFAULT NULL COMMENT '??Ʊ????[0->??????Ʊ??1->???ӷ?Ʊ??2->ֽ?ʷ?Ʊ]',
  `bill_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʊ̧ͷ',
  `bill_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʊ???',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʊ?˵绰',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʊ?????',
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?ջ???????',
  `receiver_phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?ջ??˵绰',
  `receiver_post_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '?ջ????ʱ',
  `receiver_province` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ʡ??/ֱϽ?',
  `receiver_city` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '???',
  `receiver_region` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??ϸ??ַ',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????ע',
  `confirm_status` tinyint(4) NULL DEFAULT NULL COMMENT 'ȷ???ջ?״̬[0->δȷ?ϣ?1->??ȷ??]',
  `delete_status` tinyint(4) NULL DEFAULT NULL COMMENT 'ɾ??״̬??0->δɾ????1->??ɾ????',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '?µ?ʱʹ?õĻ??',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '֧??ʱ?',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '????ʱ?',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT 'ȷ???ջ?ʱ?',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '????ʱ?',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '?޸?ʱ?',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '????' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT 'order_id',
  `order_sn` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'order_sn',
  `spu_id` bigint(20) NULL DEFAULT NULL COMMENT 'spu_id',
  `spu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spu_name',
  `spu_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'spu_pic',
  `spu_brand` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Ʒ?',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '??Ʒ????id',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '??Ʒsku???',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʒsku???',
  `sku_pic` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??ƷskuͼƬ',
  `sku_price` decimal(18, 4) NULL DEFAULT NULL COMMENT '??Ʒsku?۸',
  `sku_quantity` int(11) NULL DEFAULT NULL COMMENT '??Ʒ??????????',
  `sku_attrs_vals` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??Ʒ???????????ϣ?JSON??',
  `promotion_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '??Ʒ?????ֽ??',
  `coupon_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?Ż?ȯ?Żݷֽ??',
  `integration_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '?????Żݷֽ??',
  `real_amount` decimal(18, 4) NULL DEFAULT NULL COMMENT '????Ʒ?????Żݺ??ķֽ??',
  `gift_integration` int(11) NULL DEFAULT NULL COMMENT '???ͻ??',
  `gift_growth` int(11) NULL DEFAULT NULL COMMENT '???ͳɳ?ֵ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '????????Ϣ' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '????id',
  `operate_man` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??????[?û???ϵͳ????̨????Ա]',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '????ʱ?',
  `order_status` tinyint(4) NULL DEFAULT NULL COMMENT '????״̬??0->?????1->????????2->?ѷ?????3->?????ɣ?4->?ѹرգ?5->??Ч??????',
  `note` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '??ע',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '??????????ʷ??¼' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup`;
CREATE TABLE `t_checkgroup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkgroup
-- ----------------------------
INSERT INTO `t_checkgroup` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无');
INSERT INTO `t_checkgroup` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', NULL);
INSERT INTO `t_checkgroup` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', NULL);
INSERT INTO `t_checkgroup` VALUES (8, '0004', '尿常规', 'NCG', '0', '尿常规', NULL);
INSERT INTO `t_checkgroup` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', NULL);
INSERT INTO `t_checkgroup` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', NULL);
INSERT INTO `t_checkgroup` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', NULL);
INSERT INTO `t_checkgroup` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', NULL);
INSERT INTO `t_checkgroup` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', NULL);

-- ----------------------------
-- Table structure for t_checkgroup_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup_checkitem`;
CREATE TABLE `t_checkgroup_checkitem`  (
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  `checkitem_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`checkgroup_id`, `checkitem_id`) USING BTREE,
  INDEX `item_id`(`checkitem_id`) USING BTREE,
  CONSTRAINT `group_id` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `item_id` FOREIGN KEY (`checkitem_id`) REFERENCES `t_checkitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkgroup_checkitem
-- ----------------------------
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 28);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 29);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 30);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 31);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 32);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 33);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 34);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 35);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 36);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 37);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 38);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 39);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 40);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 41);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 42);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 43);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 44);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 45);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 46);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 47);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 48);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 49);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 50);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 51);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 52);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 53);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 54);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 55);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 56);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 57);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 58);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 59);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 60);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 61);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 62);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 63);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 64);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 65);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 66);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 67);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 68);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 69);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 70);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 71);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 72);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 73);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 74);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 75);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 76);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 77);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 78);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 79);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 80);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 81);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 82);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 83);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 84);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 85);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 86);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 87);
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 88);
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 89);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 90);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 91);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 92);

-- ----------------------------
-- Table structure for t_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkitem`;
CREATE TABLE `t_checkitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '查检项类型,分为检查和检验两种',
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_checkitem
-- ----------------------------
INSERT INTO `t_checkitem` VALUES (28, '0001', '身高', '0', '0-100', 5, '1', '无', '身高');
INSERT INTO `t_checkitem` VALUES (29, '0002', '体重', '0', '0-100', 5, '1', '无', '体重');
INSERT INTO `t_checkitem` VALUES (30, '0003', '体重指数', '0', '0-100', 5, '1', '无', '体重指数');
INSERT INTO `t_checkitem` VALUES (31, '0004', '收缩压', '0', '0-100', 5, '1', '无', '收缩压');
INSERT INTO `t_checkitem` VALUES (32, '0005', '舒张压', '0', '0-100', 5, '1', '无', '舒张压');
INSERT INTO `t_checkitem` VALUES (33, '0006', '裸视力（右）', '0', '0-100', 5, '1', '无', '裸视力（右）');
INSERT INTO `t_checkitem` VALUES (34, '0007', '裸视力（左）', '0', '0-100', 5, '1', '无', '裸视力（左）');
INSERT INTO `t_checkitem` VALUES (35, '0008', '矫正视力（右）', '0', '0-100', 5, '1', '无', '矫正视力（右）');
INSERT INTO `t_checkitem` VALUES (36, '0009', '矫正视力（左）', '0', '0-100', 5, '1', '无', '矫正视力（左）');
INSERT INTO `t_checkitem` VALUES (37, '0010', '色觉', '0', '0-100', 5, '1', '无', '色觉');
INSERT INTO `t_checkitem` VALUES (38, '0011', '白细胞计数', '0', '0-100', 10, '2', '无', '白细胞计数');
INSERT INTO `t_checkitem` VALUES (39, '0012', '红细胞计数', '0', '0-100', 10, '2', NULL, '红细胞计数');
INSERT INTO `t_checkitem` VALUES (40, '0013', '血红蛋白', '0', '0-100', 10, '2', NULL, '血红蛋白');
INSERT INTO `t_checkitem` VALUES (41, '0014', '红细胞压积', '0', '0-100', 10, '2', NULL, '红细胞压积');
INSERT INTO `t_checkitem` VALUES (42, '0015', '平均红细胞体积', '0', '0-100', 10, '2', NULL, '平均红细胞体积');
INSERT INTO `t_checkitem` VALUES (43, '0016', '平均红细胞血红蛋白含量', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白含量');
INSERT INTO `t_checkitem` VALUES (44, '0017', '平均红细胞血红蛋白浓度', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白浓度');
INSERT INTO `t_checkitem` VALUES (45, '0018', '红细胞分布宽度-变异系数', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-变异系数');
INSERT INTO `t_checkitem` VALUES (46, '0019', '血小板计数', '0', '0-100', 10, '2', NULL, '血小板计数');
INSERT INTO `t_checkitem` VALUES (47, '0020', '平均血小板体积', '0', '0-100', 10, '2', NULL, '平均血小板体积');
INSERT INTO `t_checkitem` VALUES (48, '0021', '血小板分布宽度', '0', '0-100', 10, '2', NULL, '血小板分布宽度');
INSERT INTO `t_checkitem` VALUES (49, '0022', '淋巴细胞百分比', '0', '0-100', 10, '2', NULL, '淋巴细胞百分比');
INSERT INTO `t_checkitem` VALUES (50, '0023', '中间细胞百分比', '0', '0-100', 10, '2', NULL, '中间细胞百分比');
INSERT INTO `t_checkitem` VALUES (51, '0024', '中性粒细胞百分比', '0', '0-100', 10, '2', NULL, '中性粒细胞百分比');
INSERT INTO `t_checkitem` VALUES (52, '0025', '淋巴细胞绝对值', '0', '0-100', 10, '2', NULL, '淋巴细胞绝对值');
INSERT INTO `t_checkitem` VALUES (53, '0026', '中间细胞绝对值', '0', '0-100', 10, '2', NULL, '中间细胞绝对值');
INSERT INTO `t_checkitem` VALUES (54, '0027', '中性粒细胞绝对值', '0', '0-100', 10, '2', NULL, '中性粒细胞绝对值');
INSERT INTO `t_checkitem` VALUES (55, '0028', '红细胞分布宽度-标准差', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-标准差');
INSERT INTO `t_checkitem` VALUES (56, '0029', '血小板压积', '0', '0-100', 10, '2', NULL, '血小板压积');
INSERT INTO `t_checkitem` VALUES (57, '0030', '尿比重', '0', '0-100', 10, '2', NULL, '尿比重');
INSERT INTO `t_checkitem` VALUES (58, '0031', '尿酸碱度', '0', '0-100', 10, '2', NULL, '尿酸碱度');
INSERT INTO `t_checkitem` VALUES (59, '0032', '尿白细胞', '0', '0-100', 10, '2', NULL, '尿白细胞');
INSERT INTO `t_checkitem` VALUES (60, '0033', '尿亚硝酸盐', '0', '0-100', 10, '2', NULL, '尿亚硝酸盐');
INSERT INTO `t_checkitem` VALUES (61, '0034', '尿蛋白质', '0', '0-100', 10, '2', NULL, '尿蛋白质');
INSERT INTO `t_checkitem` VALUES (62, '0035', '尿糖', '0', '0-100', 10, '2', NULL, '尿糖');
INSERT INTO `t_checkitem` VALUES (63, '0036', '尿酮体', '0', '0-100', 10, '2', NULL, '尿酮体');
INSERT INTO `t_checkitem` VALUES (64, '0037', '尿胆原', '0', '0-100', 10, '2', NULL, '尿胆原');
INSERT INTO `t_checkitem` VALUES (65, '0038', '尿胆红素', '0', '0-100', 10, '2', NULL, '尿胆红素');
INSERT INTO `t_checkitem` VALUES (66, '0039', '尿隐血', '0', '0-100', 10, '2', NULL, '尿隐血');
INSERT INTO `t_checkitem` VALUES (67, '0040', '尿镜检红细胞', '0', '0-100', 10, '2', NULL, '尿镜检红细胞');
INSERT INTO `t_checkitem` VALUES (68, '0041', '尿镜检白细胞', '0', '0-100', 10, '2', NULL, '尿镜检白细胞');
INSERT INTO `t_checkitem` VALUES (69, '0042', '上皮细胞', '0', '0-100', 10, '2', NULL, '上皮细胞');
INSERT INTO `t_checkitem` VALUES (70, '0043', '无机盐类', '0', '0-100', 10, '2', NULL, '无机盐类');
INSERT INTO `t_checkitem` VALUES (71, '0044', '尿镜检蛋白定性', '0', '0-100', 10, '2', NULL, '尿镜检蛋白定性');
INSERT INTO `t_checkitem` VALUES (72, '0045', '丙氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '丙氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (73, '0046', '天门冬氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '天门冬氨酸氨基转移酶');
INSERT INTO `t_checkitem` VALUES (74, '0047', 'Y-谷氨酰转移酶', '0', '0-100', 10, '2', NULL, 'Y-谷氨酰转移酶');
INSERT INTO `t_checkitem` VALUES (75, '0048', '尿素', '0', '0-100', 10, '2', NULL, '尿素');
INSERT INTO `t_checkitem` VALUES (76, '0049', '肌酐', '0', '0-100', 10, '2', NULL, '肌酐');
INSERT INTO `t_checkitem` VALUES (77, '0050', '尿酸', '0', '0-100', 10, '2', NULL, '尿酸');
INSERT INTO `t_checkitem` VALUES (78, '0051', '总胆固醇', '0', '0-100', 10, '2', NULL, '总胆固醇');
INSERT INTO `t_checkitem` VALUES (79, '0052', '甘油三酯', '0', '0-100', 10, '2', NULL, '甘油三酯');
INSERT INTO `t_checkitem` VALUES (80, '0053', '高密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '高密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (81, '0054', '低密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '低密度脂蛋白胆固醇');
INSERT INTO `t_checkitem` VALUES (82, '0055', '磷酸肌酸激酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶');
INSERT INTO `t_checkitem` VALUES (83, '0056', '磷酸肌酸激酶同工酶', '0', '0-100', 10, '2', NULL, '磷酸肌酸激酶同工酶');
INSERT INTO `t_checkitem` VALUES (84, '0057', '乳酸脱氢酶', '0', '0-100', 10, '2', NULL, '乳酸脱氢酶');
INSERT INTO `t_checkitem` VALUES (85, '0058', '三碘甲状腺原氨酸', '0', '0-100', 10, '2', NULL, '三碘甲状腺原氨酸');
INSERT INTO `t_checkitem` VALUES (86, '0059', '甲状腺素', '0', '0-100', 10, '2', NULL, '甲状腺素');
INSERT INTO `t_checkitem` VALUES (87, '0060', '促甲状腺激素', '0', '0-100', 10, '2', NULL, '促甲状腺激素');
INSERT INTO `t_checkitem` VALUES (88, '0061', '子宫', '2', '0-100', 10, '2', NULL, '子宫');
INSERT INTO `t_checkitem` VALUES (89, '0062', '附件', '2', '0-100', 10, '2', NULL, '附件');
INSERT INTO `t_checkitem` VALUES (90, '0063', '总胆红素', '0', '0-100', 10, '2', NULL, '总胆红素');
INSERT INTO `t_checkitem` VALUES (91, '0064', '直接胆红素', '0', '0-100', 10, '2', NULL, '直接胆红素');
INSERT INTO `t_checkitem` VALUES (92, '0065', '间接胆红素', '0', '0-100', 10, '2', NULL, '间接胆红素');
INSERT INTO `t_checkitem` VALUES (98, '00001', '身高', '0', '0-100', 100, '1', '别踮脚', '量身高');
INSERT INTO `t_checkitem` VALUES (102, '123', '123', '0', '123', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_member
-- ----------------------------
DROP TABLE IF EXISTS `t_member`;
CREATE TABLE `t_member`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileNumber` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idCard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regTime` date NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11034 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_member
-- ----------------------------
INSERT INTO `t_member` VALUES (82, NULL, '小明', '1', '123456789000999999', '18511279942', '2019-03-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (83, NULL, '王美丽', '1', '132333333333333', '13412345678', '2019-03-11', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (84, NULL, 'test', NULL, NULL, '18511279942', '2019-03-13', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (85, NULL, NULL, NULL, NULL, NULL, '2019-03-06', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (86, NULL, NULL, NULL, NULL, NULL, '2019-04-04', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (87, NULL, NULL, NULL, NULL, NULL, '2019-02-06', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (88, NULL, NULL, NULL, NULL, NULL, '2019-04-10', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (89, NULL, NULL, NULL, NULL, NULL, '2018-12-01', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (90, NULL, NULL, NULL, NULL, NULL, '2018-12-02', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (91, NULL, NULL, NULL, NULL, NULL, '2018-02-01', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (92, NULL, '333', '2', '234234145432121345', '18019286521', '2019-04-19', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (93, NULL, '崔源耕', '1', '220323199912024519', '17649886919', '2022-03-04', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (94, NULL, '石佳宁', '1', '123123412341234', '16622507470', '2022-03-07', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1001, NULL, 'test', '1', '111111111111111', '', '2019-05-16', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1002, NULL, NULL, NULL, NULL, NULL, '2019-05-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1003, NULL, NULL, NULL, NULL, NULL, '2019-04-04', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1004, NULL, NULL, NULL, NULL, NULL, '2019-05-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1005, NULL, NULL, NULL, NULL, NULL, '2019-04-05', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1006, NULL, NULL, NULL, NULL, NULL, '2019-04-10', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1007, NULL, NULL, NULL, NULL, NULL, '2019-03-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1008, NULL, NULL, NULL, NULL, NULL, '2019-03-09', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (1009, NULL, NULL, NULL, NULL, NULL, '2019-03-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10010, NULL, NULL, NULL, NULL, NULL, '2019-03-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10011, NULL, NULL, NULL, NULL, NULL, '2019-03-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10012, NULL, NULL, NULL, NULL, NULL, '2019-02-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10013, NULL, NULL, NULL, NULL, NULL, '2019-02-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10014, NULL, NULL, NULL, NULL, NULL, '2019-02-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10015, NULL, NULL, NULL, NULL, NULL, '2019-02-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10016, NULL, NULL, NULL, NULL, NULL, '2019-01-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10017, NULL, NULL, NULL, NULL, NULL, '2019-01-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10018, NULL, NULL, NULL, NULL, NULL, '2019-01-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10019, NULL, NULL, NULL, NULL, NULL, '2019-01-15', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10020, NULL, NULL, NULL, NULL, NULL, '2018-12-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10021, NULL, NULL, NULL, NULL, NULL, '2018-12-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10022, NULL, NULL, NULL, NULL, NULL, '2018-11-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10023, NULL, NULL, NULL, NULL, NULL, '2018-11-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10024, NULL, NULL, NULL, NULL, NULL, '2018-10-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10025, NULL, NULL, NULL, NULL, NULL, '2018-10-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10026, NULL, NULL, NULL, NULL, NULL, '2018-09-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10027, NULL, NULL, NULL, NULL, NULL, '2018-09-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10028, NULL, NULL, NULL, NULL, NULL, '2018-08-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10029, NULL, NULL, NULL, NULL, NULL, '2018-07-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10030, NULL, NULL, NULL, NULL, NULL, '2018-06-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10031, NULL, NULL, NULL, NULL, NULL, '2018-05-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10032, NULL, NULL, NULL, NULL, NULL, '2018-05-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10033, NULL, NULL, NULL, NULL, NULL, '2018-05-08', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (10106, NULL, NULL, NULL, NULL, NULL, '2021-12-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11001, NULL, 'test', '1', '111111111111111', '', '2019-05-16', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11002, NULL, NULL, NULL, NULL, NULL, '2022-02-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11003, NULL, NULL, NULL, NULL, NULL, '2022-01-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11004, NULL, NULL, NULL, NULL, NULL, '2022-03-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11005, NULL, NULL, NULL, NULL, NULL, '2021-12-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11007, NULL, NULL, NULL, NULL, NULL, '2021-12-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11008, NULL, NULL, NULL, NULL, NULL, '2021-11-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11009, NULL, NULL, NULL, NULL, NULL, '2021-11-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11010, NULL, NULL, NULL, NULL, NULL, '2021-11-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11011, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11012, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11013, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11014, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11015, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11016, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11017, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11018, NULL, NULL, NULL, NULL, NULL, '2021-10-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11019, NULL, NULL, NULL, NULL, NULL, '2021-09-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11020, NULL, NULL, NULL, NULL, NULL, '2021-09-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11021, NULL, NULL, NULL, NULL, NULL, '2021-09-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11022, NULL, NULL, NULL, NULL, NULL, '2021-09-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11023, NULL, NULL, NULL, NULL, NULL, '2021-08-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11024, NULL, NULL, NULL, NULL, NULL, '2021-08-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11025, NULL, NULL, NULL, NULL, NULL, '2021-08-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11026, NULL, NULL, NULL, NULL, NULL, '2021-07-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11027, NULL, NULL, NULL, NULL, NULL, '2021-06-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11028, NULL, NULL, NULL, NULL, NULL, '2021-06-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11029, NULL, NULL, NULL, NULL, NULL, '2021-06-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11030, NULL, NULL, NULL, NULL, NULL, '2021-06-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11031, NULL, NULL, NULL, NULL, NULL, '2021-05-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11032, NULL, NULL, NULL, NULL, NULL, '2021-04-03', NULL, NULL, NULL, NULL);
INSERT INTO `t_member` VALUES (11033, NULL, NULL, NULL, NULL, NULL, '2021-01-03', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `linkUrl` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parentMenuId` int(11) NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_13`(`parentMenuId`) USING BTREE,
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`parentMenuId`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '会员管理', NULL, '2', 1, 'fa-user-md', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (2, '会员档案', 'member.html', '/2-1', 1, NULL, NULL, 1, 2);
INSERT INTO `t_menu` VALUES (3, '体检上传', NULL, '/2-2', 2, NULL, NULL, 1, 2);
INSERT INTO `t_menu` VALUES (4, '会员统计', NULL, '/2-3', 3, NULL, NULL, 1, 2);
INSERT INTO `t_menu` VALUES (5, '预约管理', NULL, '3', 2, 'fa-tty', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (6, '预约列表', 'ordersettinglist.html', '/3-1', 1, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (7, '预约设置', 'ordersetting.html', '/3-2', 2, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (8, '套餐管理', 'setmeal.html', '/3-3', 3, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (9, '检查组管理', 'checkgroup.html', '/3-4', 4, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (10, '检查项管理', 'checkitem.html', '/3-5', 5, NULL, NULL, 5, 2);
INSERT INTO `t_menu` VALUES (11, '健康评估', NULL, '4', 3, 'fa-stethoscope', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (12, '中医体质辨识', NULL, '/4-1', 1, NULL, NULL, 11, 2);
INSERT INTO `t_menu` VALUES (13, '统计分析', NULL, '5', 4, 'fa-heartbeat', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (14, '会员数量', 'report_member.html', '/5-1', 1, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (15, '系统设置', NULL, '6', 5, 'fa-users', NULL, NULL, 1);
INSERT INTO `t_menu` VALUES (16, '菜单管理', 'menu.html', '/6-1', 1, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (17, '权限管理', 'permission.html', '/6-2', 2, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (18, '角色管理', 'role.html', '/6-3', 3, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (19, '用户管理', 'user.html', '/6-4', 4, NULL, NULL, 15, 2);
INSERT INTO `t_menu` VALUES (20, '套餐占比', 'report_setmeal.html', '/5-2', 2, NULL, NULL, 13, 2);
INSERT INTO `t_menu` VALUES (21, '运营数据', 'report_business.html', '/5-3', 3, NULL, NULL, 13, 2);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '员会id',
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `orderType` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约预类型 电话预约/微信预约',
  `orderStatus` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预约状态（是否到诊）',
  `setmeal_id` int(11) NULL DEFAULT NULL COMMENT '餐套id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key_member_id`(`member_id`) USING BTREE,
  INDEX `key_setmeal_id`(`setmeal_id`) USING BTREE,
  CONSTRAINT `key_member_id` FOREIGN KEY (`member_id`) REFERENCES `t_member` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `key_setmeal_id` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (17, 84, '2019-04-28', '微信预约', '未到诊', 12);
INSERT INTO `t_order` VALUES (20, 93, '2022-03-05', '微信预约', '未到诊', 14);
INSERT INTO `t_order` VALUES (21, 93, '2022-03-06', '微信预约', '未到诊', 14);
INSERT INTO `t_order` VALUES (30, 93, '2022-03-08', '微信预约', '未到诊', 13);
INSERT INTO `t_order` VALUES (31, 94, '2022-03-10', '微信预约', '未到诊', 13);

-- ----------------------------
-- Table structure for t_ordersetting
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersetting`;
CREATE TABLE `t_ordersetting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` date NULL DEFAULT NULL COMMENT '约预日期',
  `number` int(11) NULL DEFAULT NULL COMMENT '可预约人数',
  `reservations` int(11) NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_ordersetting
-- ----------------------------
INSERT INTO `t_ordersetting` VALUES (13, '2019-03-04', 100, 100);
INSERT INTO `t_ordersetting` VALUES (14, '2019-03-05', 200, 0);
INSERT INTO `t_ordersetting` VALUES (15, '2019-03-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (16, '2019-03-07', 200, 0);
INSERT INTO `t_ordersetting` VALUES (17, '2019-03-08', 200, 1);
INSERT INTO `t_ordersetting` VALUES (18, '2019-03-09', 200, 0);
INSERT INTO `t_ordersetting` VALUES (19, '2019-03-10', 200, 0);
INSERT INTO `t_ordersetting` VALUES (20, '2019-03-11', 200, 3);
INSERT INTO `t_ordersetting` VALUES (21, '2019-03-13', 300, 1);
INSERT INTO `t_ordersetting` VALUES (22, '2019-03-14', 600, 0);
INSERT INTO `t_ordersetting` VALUES (23, '2019-03-15', 500, 1);
INSERT INTO `t_ordersetting` VALUES (24, '2019-03-16', 500, 0);
INSERT INTO `t_ordersetting` VALUES (25, '2019-03-17', 400, 0);
INSERT INTO `t_ordersetting` VALUES (26, '2019-03-19', 300, 1);
INSERT INTO `t_ordersetting` VALUES (27, '2019-04-01', 300, 0);
INSERT INTO `t_ordersetting` VALUES (28, '2019-04-02', 300, 0);
INSERT INTO `t_ordersetting` VALUES (29, '2019-04-19', 300, 0);
INSERT INTO `t_ordersetting` VALUES (30, '2019-03-20', 200, 1);
INSERT INTO `t_ordersetting` VALUES (31, '2019-05-01', 300, 0);
INSERT INTO `t_ordersetting` VALUES (32, '2019-03-28', 200, 1);
INSERT INTO `t_ordersetting` VALUES (33, '2019-04-03', 400, 0);
INSERT INTO `t_ordersetting` VALUES (34, '2019-09-30', 800, 0);
INSERT INTO `t_ordersetting` VALUES (35, '2019-04-04', 400, 0);
INSERT INTO `t_ordersetting` VALUES (36, '2019-04-05', 300, 0);
INSERT INTO `t_ordersetting` VALUES (37, '2019-04-14', 200, 1);
INSERT INTO `t_ordersetting` VALUES (38, '2019-04-13', 200, 0);
INSERT INTO `t_ordersetting` VALUES (39, '2019-04-17', 400, 0);
INSERT INTO `t_ordersetting` VALUES (40, '2019-04-18', 1, 1);
INSERT INTO `t_ordersetting` VALUES (41, '2019-04-20', 300, 1);
INSERT INTO `t_ordersetting` VALUES (42, '2019-04-21', 300, 1);
INSERT INTO `t_ordersetting` VALUES (43, '2019-04-22', 300, 1);
INSERT INTO `t_ordersetting` VALUES (44, '2019-04-23', 300, 0);
INSERT INTO `t_ordersetting` VALUES (45, '2019-04-24', 300, 0);
INSERT INTO `t_ordersetting` VALUES (46, '2019-04-25', 400, 0);
INSERT INTO `t_ordersetting` VALUES (47, '2019-04-26', 300, 0);
INSERT INTO `t_ordersetting` VALUES (48, '2019-04-27', 300, 0);
INSERT INTO `t_ordersetting` VALUES (49, '2019-04-28', 300, 2);
INSERT INTO `t_ordersetting` VALUES (50, '2019-04-29', 300, 0);
INSERT INTO `t_ordersetting` VALUES (51, '2019-04-30', 300, 0);
INSERT INTO `t_ordersetting` VALUES (52, '2019-05-02', 300, 0);
INSERT INTO `t_ordersetting` VALUES (53, '2019-05-03', 300, 0);
INSERT INTO `t_ordersetting` VALUES (54, '2019-05-04', 300, 0);
INSERT INTO `t_ordersetting` VALUES (55, '2019-05-05', 300, 0);
INSERT INTO `t_ordersetting` VALUES (56, '2019-05-06', 300, 0);
INSERT INTO `t_ordersetting` VALUES (57, '2019-05-07', 300, 0);
INSERT INTO `t_ordersetting` VALUES (58, '2019-05-08', 300, 0);
INSERT INTO `t_ordersetting` VALUES (59, '2019-05-09', 300, 0);
INSERT INTO `t_ordersetting` VALUES (60, '2019-05-10', 300, 0);
INSERT INTO `t_ordersetting` VALUES (61, '2019-05-11', 300, 0);
INSERT INTO `t_ordersetting` VALUES (69, '2022-01-01', 22, 0);
INSERT INTO `t_ordersetting` VALUES (70, '2022-01-02', 22, 0);
INSERT INTO `t_ordersetting` VALUES (71, '2022-01-03', 22, 0);
INSERT INTO `t_ordersetting` VALUES (72, '2022-01-04', 33, 0);
INSERT INTO `t_ordersetting` VALUES (73, '2022-01-05', 44, 0);
INSERT INTO `t_ordersetting` VALUES (74, '2022-01-06', 22, 0);
INSERT INTO `t_ordersetting` VALUES (75, '2022-01-07', 23, 0);
INSERT INTO `t_ordersetting` VALUES (76, '2022-01-08', 24, 0);
INSERT INTO `t_ordersetting` VALUES (77, '2022-01-09', 25, 0);
INSERT INTO `t_ordersetting` VALUES (78, '2022-01-10', 26, 0);
INSERT INTO `t_ordersetting` VALUES (79, '2022-01-11', 27, 0);
INSERT INTO `t_ordersetting` VALUES (80, '2022-01-12', 28, 0);
INSERT INTO `t_ordersetting` VALUES (81, '2022-01-13', 29, 0);
INSERT INTO `t_ordersetting` VALUES (82, '2022-01-14', 30, 0);
INSERT INTO `t_ordersetting` VALUES (83, '2022-01-15', 31, 0);
INSERT INTO `t_ordersetting` VALUES (84, '2022-01-16', 32, 0);
INSERT INTO `t_ordersetting` VALUES (85, '2022-01-17', 33, 0);
INSERT INTO `t_ordersetting` VALUES (86, '2022-01-18', 34, 0);
INSERT INTO `t_ordersetting` VALUES (87, '2022-01-19', 35, 0);
INSERT INTO `t_ordersetting` VALUES (88, '2022-01-20', 36, 0);
INSERT INTO `t_ordersetting` VALUES (89, '2022-01-21', 37, 0);
INSERT INTO `t_ordersetting` VALUES (90, '2022-01-22', 38, 0);
INSERT INTO `t_ordersetting` VALUES (91, '2022-01-23', 39, 0);
INSERT INTO `t_ordersetting` VALUES (92, '2022-01-24', 40, 0);
INSERT INTO `t_ordersetting` VALUES (93, '2022-01-25', 41, 0);
INSERT INTO `t_ordersetting` VALUES (94, '2022-01-26', 42, 0);
INSERT INTO `t_ordersetting` VALUES (95, '2022-01-27', 43, 0);
INSERT INTO `t_ordersetting` VALUES (96, '2022-01-28', 44, 0);
INSERT INTO `t_ordersetting` VALUES (97, '2022-01-29', 45, 0);
INSERT INTO `t_ordersetting` VALUES (98, '2022-01-30', 46, 0);
INSERT INTO `t_ordersetting` VALUES (99, '2022-01-31', 47, 0);
INSERT INTO `t_ordersetting` VALUES (100, '2022-02-01', 48, 0);
INSERT INTO `t_ordersetting` VALUES (101, '2022-02-02', 49, 0);
INSERT INTO `t_ordersetting` VALUES (102, '2022-02-03', 50, 0);
INSERT INTO `t_ordersetting` VALUES (103, '2022-02-04', 51, 0);
INSERT INTO `t_ordersetting` VALUES (104, '2022-02-05', 52, 0);
INSERT INTO `t_ordersetting` VALUES (105, '2022-02-06', 53, 0);
INSERT INTO `t_ordersetting` VALUES (106, '2022-02-07', 54, 0);
INSERT INTO `t_ordersetting` VALUES (107, '2022-02-08', 55, 0);
INSERT INTO `t_ordersetting` VALUES (108, '2022-02-09', 56, 0);
INSERT INTO `t_ordersetting` VALUES (109, '2022-02-10', 57, 0);
INSERT INTO `t_ordersetting` VALUES (110, '2022-02-11', 58, 0);
INSERT INTO `t_ordersetting` VALUES (111, '2022-02-12', 59, 0);
INSERT INTO `t_ordersetting` VALUES (112, '2022-02-13', 60, 0);
INSERT INTO `t_ordersetting` VALUES (113, '2022-02-14', 61, 0);
INSERT INTO `t_ordersetting` VALUES (114, '2022-02-15', 62, 0);
INSERT INTO `t_ordersetting` VALUES (115, '2022-02-16', 63, 0);
INSERT INTO `t_ordersetting` VALUES (116, '2022-02-17', 64, 0);
INSERT INTO `t_ordersetting` VALUES (117, '2022-02-18', 65, 0);
INSERT INTO `t_ordersetting` VALUES (118, '2022-02-19', 66, 0);
INSERT INTO `t_ordersetting` VALUES (119, '2022-02-20', 67, 0);
INSERT INTO `t_ordersetting` VALUES (120, '2022-02-21', 68, 0);
INSERT INTO `t_ordersetting` VALUES (121, '2022-02-22', 69, 0);
INSERT INTO `t_ordersetting` VALUES (122, '2022-02-24', 300, 0);
INSERT INTO `t_ordersetting` VALUES (123, '2022-03-05', 300, 3);
INSERT INTO `t_ordersetting` VALUES (124, '2022-03-06', 500, 1);
INSERT INTO `t_ordersetting` VALUES (125, '2022-03-07', 222, 0);
INSERT INTO `t_ordersetting` VALUES (126, '2022-03-08', 2222, 9);
INSERT INTO `t_ordersetting` VALUES (127, '2022-03-09', 22, 0);
INSERT INTO `t_ordersetting` VALUES (128, '2022-03-10', 222, 1);
INSERT INTO `t_ordersetting` VALUES (129, '2022-03-11', 111, 0);
INSERT INTO `t_ordersetting` VALUES (130, '2022-03-12', 22, 0);
INSERT INTO `t_ordersetting` VALUES (131, '2022-03-13', 213, 0);
INSERT INTO `t_ordersetting` VALUES (132, '2022-03-14', 123123, 0);
INSERT INTO `t_ordersetting` VALUES (133, '2022-03-15', 21212, 0);
INSERT INTO `t_ordersetting` VALUES (134, '2022-03-16', 23213, 0);
INSERT INTO `t_ordersetting` VALUES (135, '2022-03-17', 3123, 0);
INSERT INTO `t_ordersetting` VALUES (136, '2022-03-18', 21312, 0);
INSERT INTO `t_ordersetting` VALUES (137, '2022-03-19', 3123, 0);
INSERT INTO `t_ordersetting` VALUES (138, '2022-03-20', 12312, 0);
INSERT INTO `t_ordersetting` VALUES (139, '2022-03-21', 312321, 0);

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, '新增检查项', 'CHECKITEM_ADD', NULL);
INSERT INTO `t_permission` VALUES (2, '删除检查项', 'CHECKITEM_DELETE', NULL);
INSERT INTO `t_permission` VALUES (3, '编辑检查项', 'CHECKITEM_EDIT', NULL);
INSERT INTO `t_permission` VALUES (4, '查询检查项', 'CHECKITEM_QUERY', NULL);
INSERT INTO `t_permission` VALUES (5, '新增检查组', 'CHECKGROUP_ADD', NULL);
INSERT INTO `t_permission` VALUES (6, '删除检查组', 'CHECKGROUP_DELETE', NULL);
INSERT INTO `t_permission` VALUES (7, '编辑检查组', 'CHECKGROUP_EDIT', NULL);
INSERT INTO `t_permission` VALUES (8, '查询检查组', 'CHECKGROUP_QUERY', NULL);
INSERT INTO `t_permission` VALUES (9, '新增套餐', 'SETMEAL_ADD', NULL);
INSERT INTO `t_permission` VALUES (10, '删除套餐', 'SETMEAL_DELETE', NULL);
INSERT INTO `t_permission` VALUES (11, '编辑套餐', 'SETMEAL_EDIT', NULL);
INSERT INTO `t_permission` VALUES (12, '查询套餐', 'SETMEAL_QUERY', NULL);
INSERT INTO `t_permission` VALUES (13, '预约设置', 'ORDERSETTING', NULL);
INSERT INTO `t_permission` VALUES (14, '查看统计报表', 'REPORT_VIEW', NULL);
INSERT INTO `t_permission` VALUES (15, '新增菜单', 'MENU_ADD', NULL);
INSERT INTO `t_permission` VALUES (16, '删除菜单', 'MENU_DELETE', NULL);
INSERT INTO `t_permission` VALUES (17, '编辑菜单', 'MENU_EDIT', NULL);
INSERT INTO `t_permission` VALUES (18, '查询菜单', 'MENU_QUERY', NULL);
INSERT INTO `t_permission` VALUES (19, '新增角色', 'ROLE_ADD', NULL);
INSERT INTO `t_permission` VALUES (20, '删除角色', 'ROLE_DELETE', NULL);
INSERT INTO `t_permission` VALUES (21, '编辑角色', 'ROLE_EDIT', NULL);
INSERT INTO `t_permission` VALUES (22, '查询角色', 'ROLE_QUERY', NULL);
INSERT INTO `t_permission` VALUES (23, '新增用户', 'USER_ADD', NULL);
INSERT INTO `t_permission` VALUES (24, '删除用户', 'USER_DELETE', NULL);
INSERT INTO `t_permission` VALUES (25, '编辑用户', 'USER_EDIT', NULL);
INSERT INTO `t_permission` VALUES (26, '查询用户', 'USER_QUERY', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keyword` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', 'ROLE_ADMIN', NULL);
INSERT INTO `t_role` VALUES (2, '健康管理师', 'ROLE_HEALTH_MANAGER', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FK_Reference_10`(`menu_id`) USING BTREE,
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (2, 1);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (2, 3);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (2, 4);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 7);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 9);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK_Reference_12`(`permission_id`) USING BTREE,
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1);
INSERT INTO `t_role_permission` VALUES (2, 1);
INSERT INTO `t_role_permission` VALUES (1, 2);
INSERT INTO `t_role_permission` VALUES (2, 2);
INSERT INTO `t_role_permission` VALUES (1, 3);
INSERT INTO `t_role_permission` VALUES (2, 3);
INSERT INTO `t_role_permission` VALUES (1, 4);
INSERT INTO `t_role_permission` VALUES (2, 4);
INSERT INTO `t_role_permission` VALUES (1, 5);
INSERT INTO `t_role_permission` VALUES (2, 5);
INSERT INTO `t_role_permission` VALUES (1, 6);
INSERT INTO `t_role_permission` VALUES (2, 6);
INSERT INTO `t_role_permission` VALUES (1, 7);
INSERT INTO `t_role_permission` VALUES (2, 7);
INSERT INTO `t_role_permission` VALUES (1, 8);
INSERT INTO `t_role_permission` VALUES (2, 8);
INSERT INTO `t_role_permission` VALUES (1, 9);
INSERT INTO `t_role_permission` VALUES (2, 9);
INSERT INTO `t_role_permission` VALUES (1, 10);
INSERT INTO `t_role_permission` VALUES (2, 10);
INSERT INTO `t_role_permission` VALUES (1, 11);
INSERT INTO `t_role_permission` VALUES (2, 11);
INSERT INTO `t_role_permission` VALUES (1, 12);
INSERT INTO `t_role_permission` VALUES (2, 12);
INSERT INTO `t_role_permission` VALUES (1, 13);
INSERT INTO `t_role_permission` VALUES (2, 13);
INSERT INTO `t_role_permission` VALUES (1, 14);
INSERT INTO `t_role_permission` VALUES (2, 14);
INSERT INTO `t_role_permission` VALUES (1, 15);
INSERT INTO `t_role_permission` VALUES (1, 16);
INSERT INTO `t_role_permission` VALUES (1, 17);
INSERT INTO `t_role_permission` VALUES (1, 18);
INSERT INTO `t_role_permission` VALUES (1, 19);
INSERT INTO `t_role_permission` VALUES (1, 20);
INSERT INTO `t_role_permission` VALUES (1, 21);
INSERT INTO `t_role_permission` VALUES (1, 22);
INSERT INTO `t_role_permission` VALUES (1, 23);
INSERT INTO `t_role_permission` VALUES (1, 24);
INSERT INTO `t_role_permission` VALUES (1, 25);
INSERT INTO `t_role_permission` VALUES (1, 26);

-- ----------------------------
-- Table structure for t_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal`;
CREATE TABLE `t_setmeal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `helpCode` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `attention` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `img` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setmeal
-- ----------------------------
INSERT INTO `t_setmeal` VALUES (12, '入职无忧体检套餐（男女通用）', '0001', 'RZTJ', '0', '18-60', 300, '入职体检套餐', '入职体检', '03a36073-a140-4942-9b9b-712cecb144901.jpg');
INSERT INTO `t_setmeal` VALUES (13, '粉红珍爱(女)升级TM12项筛查体检套餐', '0002', 'FHZA', '2', '18-60', 1200, '本套餐针对宫颈(TCT检查、HPV乳头瘤病毒筛查）、乳腺（彩超，癌抗125），甲状腺（彩超，甲功验血）以及胸片，血常规肝功等有全面检查，非常适合女性全面疾病筛查使用。', NULL, '3bd90d2c-4e82-42a1-a401-882c88b06a1a2.jpg');
INSERT INTO `t_setmeal` VALUES (14, '阳光爸妈升级肿瘤12项筛查（男女单人）体检套餐', '0003', 'YGBM', '0', '55-100', 1400, '本套餐主要针对常见肿瘤筛查，肝肾、颈动脉、脑血栓、颅内血流筛查，以及风湿、颈椎、骨密度检查', NULL, 'test02.jpg');
INSERT INTO `t_setmeal` VALUES (15, '珍爱高端升级肿瘤12项筛查（男女单人）', '0004', 'ZAGD', '0', '14-20', 2400, '本套餐是一款针对生化五项检查，心，肝，胆，胃，甲状腺，颈椎，肺功能，脑部检查（经颅多普勒）以及癌症筛查，适合大众人群体检的套餐', NULL, '\r\nac3b5a4d-33a5-4f37-bd49-99e06ce17d202.jpg');
INSERT INTO `t_setmeal` VALUES (21, '全面体检', '0005', 'QMTJ', '0', '18-60', 99, '全身体检', '没事看看病', 'ba938f0a-c8f2-40ab-bf5c-6af5defdfe780.jpg');
INSERT INTO `t_setmeal` VALUES (22, '不孕不育检查', '0006', 'BYBY', '1', '3-14', 1, '222', '222', '5982b76e-adac-4d6a-ad35-7dceb96679dd0.jpg');

-- ----------------------------
-- Table structure for t_setmeal_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal_checkgroup`;
CREATE TABLE `t_setmeal_checkgroup`  (
  `setmeal_id` int(11) NOT NULL DEFAULT 0,
  `checkgroup_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setmeal_id`, `checkgroup_id`) USING BTREE,
  INDEX `checkgroup_key`(`checkgroup_id`) USING BTREE,
  CONSTRAINT `checkgroup_key` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `setmeal_key` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_setmeal_checkgroup
-- ----------------------------
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 6);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 6);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (22, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (12, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (14, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 13);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (15, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (22, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (13, 15);
INSERT INTO `t_setmeal_checkgroup` VALUES (21, 15);
INSERT INTO `t_setmeal_checkgroup` VALUES (22, 15);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `station` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, NULL, NULL, 'admin', '$2a$10$u/BcsUUqZNWUxdmDhbnoeeobJy6IBsL1Gn/S0dMxI2RbSgnMKJ.4a', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (2, NULL, NULL, 'cyg', '$2a$10$3xW2nBjwBM3rx1LoYprVsemNri5bvxeOd/QfmO7UDFQhW2HRHLi.C', NULL, NULL, NULL);
INSERT INTO `t_user` VALUES (3, NULL, NULL, 'test', '$2a$10$zYJRscVUgHX1wqwu90WereuTmIg6h/JGirGG4SWBsZ60wVPCgtF8W', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK_Reference_8`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
