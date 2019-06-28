/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50636
Source Host           : localhost:3306
Source Database       : workflow

Target Server Type    : MYSQL
Target Server Version : 50636
File Encoding         : 65001

Date: 2017-08-11 10:14:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wf_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `wf_gen_table`;
CREATE TABLE `wf_gen_table` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `process_design_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程方案id',
  `process_def_id` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `task_def_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务id',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
  `style_type` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '表单样式(1:单列；0：双列)',
  `parent_table` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `wf_gen_table_name` (`name`) USING BTREE,
  KEY `wf_gen_table_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='业务表';

-- ----------------------------
-- Table structure for wf_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `wf_gen_table_column`;
CREATE TABLE `wf_gen_table_column` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `wf_gen_table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `wf_gen_table_column_table_id` (`wf_gen_table_id`) USING BTREE,
  KEY `wf_gen_table_column_name` (`name`) USING BTREE,
  KEY `wf_gen_table_column_sort` (`sort`) USING BTREE,
  KEY `wf_gen_table_column_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='业务表字段';

-- ----------------------------
-- Table structure for wf_hi_delegate
-- ----------------------------
DROP TABLE IF EXISTS `wf_hi_delegate`;
CREATE TABLE `wf_hi_delegate` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `ASSIGNEE` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '办理人',
  `ATTORNEY` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '代理人',
  `DELEGATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '设置代理信息时间',
  `TASK_ID` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '任务ID',
  `STATUS` int(11) NOT NULL COMMENT '状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='历史代理信息表';

-- ----------------------------
-- Table structure for wf_process_design
-- ----------------------------
DROP TABLE IF EXISTS `wf_process_design`;
CREATE TABLE `wf_process_design` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `design_name` varchar(255) NOT NULL COMMENT '方案名称',
  `design_key` varchar(255) NOT NULL COMMENT '方案Key',
  `design_status` char(1) NOT NULL COMMENT '状态',
  `design_description` varchar(2000) DEFAULT NULL COMMENT '方案描述',
  `process_def_id` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for `wf_process_variable`
-- ----------------------------
DROP TABLE IF EXISTS `wf_process_variable`;
CREATE TABLE `wf_process_variable` (
  `id` varchar(36) CHARACTER SET utf8 NOT NULL COMMENT 'ID',
  `task_def_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务定义ID',
  `variable_key` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变量标识',
  `variable_val` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变量值',
  `variable_name` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '变量名称',
  `task_def_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '任务定义名称',
  `process_design_id` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '流程设计方案id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='变量配置';

-- ----------------------------
-- Table structure for wf_ru_delegate
-- ----------------------------
DROP TABLE IF EXISTS `wf_ru_delegate`;
CREATE TABLE `wf_ru_delegate` (
  `id` varchar(36) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `ASSIGNEE` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '办理人',
  `ATTORNEY` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '代理人',
  `START_TIME` datetime DEFAULT NULL COMMENT '起始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `PROCESS_DEFINITION_ID` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '流程定义ID',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态',
  `PROCESS_DEFINITION_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '流程定义名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代理信息表';

-- ----------------------------
-- Table structure for wf_view_config
-- ----------------------------
DROP TABLE IF EXISTS `wf_view_config`;
CREATE TABLE `wf_view_config` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `process_def_id` varchar(64) NOT NULL COMMENT '流程定义ID',
  `task_def_id` varchar(64) NOT NULL COMMENT '任务定义ID',
  `biz_detail_name` varchar(100) DEFAULT NULL COMMENT '业务信息页面名称',
  `biz_detail_url` varchar(200) DEFAULT NULL COMMENT '业务信息页面地址',
  `biz_detail_param` varchar(200) DEFAULT NULL COMMENT '业务信息页面参数',
  `biz_operation` varchar(2000) DEFAULT NULL COMMENT '操作权限控制',
  `process_design_id` varchar(64) DEFAULT NULL COMMENT '流程方案ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wf_view_related_links
-- ----------------------------
DROP TABLE IF EXISTS `wf_view_related_links`;
CREATE TABLE `wf_view_related_links` (
  `id` varchar(36) NOT NULL COMMENT 'ID',
  `process_def_id` varchar(64) DEFAULT NULL COMMENT '流程定义ID',
  `task_def_id` varchar(64) NOT NULL COMMENT '任务定义编号',
  `link_name` varchar(100) DEFAULT NULL COMMENT '链接名称',
  `link_url` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `link_param` varchar(200) DEFAULT NULL COMMENT '链接参数',
  `sort_no` decimal(10,0) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wf_process_classify
-- ----------------------------
CREATE TABLE `wf_process_classify` (
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
  `parent_id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '分类编号',
  `type` char(1) COLLATE utf8_bin NOT NULL COMMENT '分类类型',
  `USEABLE` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '是否启用',
  `create_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `wf_process_parent_id` (`parent_id`) USING BTREE,
  KEY `wf_process_del_flag` (`del_flag`) USING BTREE,
  KEY `wf_process_type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程分类表';


-- ----------------------------
-- Table structure for wf_task_expand_data
-- ----------------------------
DROP TABLE IF EXISTS `wf_task_expand_data`;
CREATE TABLE `wf_task_expand_data` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `task_expand_plan_id` varchar(64) NOT NULL COMMENT '代办拓展方案ID',
  `process_inst_id` varchar(64) NOT NULL COMMENT '流程实例ID',
  `process_def_id` varchar(64) NOT NULL COMMENT '流程定义ID',
  `task_id` varchar(64) NOT NULL COMMENT '待办任务ID',
  `task_node_id` varchar(64) NOT NULL COMMENT '待办任务节点ID',
  `field01` varchar(256) DEFAULT NULL COMMENT '拓展字段01',
  `field02` varchar(256) DEFAULT NULL COMMENT '拓展字段02',
  `field03` varchar(256) DEFAULT NULL COMMENT '拓展字段03',
	`field04` varchar(256) DEFAULT NULL COMMENT '拓展字段04',
	`field05` varchar(256) DEFAULT NULL COMMENT '拓展字段05',
	`field06` varchar(256) DEFAULT NULL COMMENT '拓展字段06',
	`field07` varchar(256) DEFAULT NULL COMMENT '拓展字段07',
	`field08` varchar(256) DEFAULT NULL COMMENT '拓展字段08',
	`field09` varchar(256) DEFAULT NULL COMMENT '拓展字段09',
	`field10` varchar(256) DEFAULT NULL COMMENT '拓展字段10',
	`field11` varchar(256) DEFAULT NULL COMMENT '拓展字段11',
	`field12` varchar(256) DEFAULT NULL COMMENT '拓展字段12',
	`field13` varchar(256) DEFAULT NULL COMMENT '拓展字段13',
	`field14` varchar(256) DEFAULT NULL COMMENT '拓展字段14',
	`field15` varchar(256) DEFAULT NULL COMMENT '拓展字段15',
	`field16` varchar(256) DEFAULT NULL COMMENT '拓展字段16',
	`field17` varchar(256) DEFAULT NULL COMMENT '拓展字段17',
	`field18` varchar(256) DEFAULT NULL COMMENT '拓展字段18',
	`field19` varchar(256) DEFAULT NULL COMMENT '拓展字段19',
	`field20` varchar(256) DEFAULT NULL COMMENT '拓展字段20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程待办扩展运行数据表';

-- ----------------------------
-- Table structure for wf_task_expand_plan
-- ----------------------------
DROP TABLE IF EXISTS `wf_task_expand_plan`;
CREATE TABLE `wf_task_expand_plan` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `wf_class_id` varchar(64) NOT NULL COMMENT '流程分类ID',
  `wf_class_name` varchar(256) NOT NULL COMMENT '流程分类名称',
  `field_key` varchar(64) DEFAULT NULL COMMENT '拓展字段键值',
  `field_name` varchar(256) DEFAULT NULL COMMENT '拓展字段名称',
  `field_value` varchar(256) DEFAULT NULL COMMENT '拓展字段数值',
  `field_type` varchar(256) DEFAULT NULL COMMENT '类型',
  `field_url` varchar(2000) DEFAULT NULL COMMENT '链接',
  `field_status` varchar(16) DEFAULT NULL COMMENT '是否隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wf_time_content
-- ----------------------------
DROP TABLE IF EXISTS `wf_process_config`;
CREATE TABLE `wf_process_config` (
  `ID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `PROC_DEF_ID` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '流程定义ID',
  `ACT_ID` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '节点ID',
  `ACT_NAME` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '节点名称',
  `PROCESS_STARTED_CLASS` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '流程启动处理类',
  `PROCESS_COMPLETED_CLASS` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '流程结束处理类',
  `BAS_RECEIVE_CLASS` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '业务处理类',
  `BAS_INVOKE_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调用方式',
  `BAS_DISPOSE_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '处理方式',
  `PAR_PARTICIPANT_MODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '参与者模式',
  `PAR_NODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '节点',
  `PAR_ROLE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色',
  `PAR_PERSONNL` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人员',
  `PAR_RULE_PROJECT` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '规则项目',
  `PAR_RULE_CODE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '规则编码',
  `TIME_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '时间类型',
  `TIME_CALULATION` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '时间计算策略',
  `TIME_RELATIVE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相对时间',
  `TIME_DISPOSE_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '处理方式',
  `TIME_REMIND_TIME` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒时间',
  `TIME_REMIND_FREQUENCY` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒频率',
  `TIME_REMIND_NUM` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒次数',
  `TIME_REMIND_TYPE` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒方式',
  `TIME_REMIND_TEXT` varchar(4000) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒内容模板设置',
  `USER_TASK_ASSIGNMENT` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '处理人配置',
  `NODE_FUNCTION` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '节点功能',
  `PROCESS_STATUS` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '任务或流程状态1或0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='流程配置表';


-- ----------------------------
-- Table structure for wf_time_content
-- ----------------------------
DROP TABLE IF EXISTS `wf_hi_task_expand_data`;
CREATE TABLE `wf_hi_task_expand_data` (
  `id` varchar(64) NOT NULL COMMENT 'ID',
  `task_expand_plan_id` varchar(64) NOT NULL COMMENT '代办拓展方案ID',
  `process_inst_id` varchar(64) NOT NULL COMMENT '流程实例ID',
  `process_def_id` varchar(64) NOT NULL COMMENT '流程定义ID',
  `task_id` varchar(64) NOT NULL COMMENT '待办任务ID',
  `task_node_id` varchar(64) NOT NULL COMMENT '待办任务节点ID',
  `field01` varchar(256) DEFAULT NULL COMMENT '拓展字段01',
  `field02` varchar(256) DEFAULT NULL COMMENT '拓展字段02',
  `field03` varchar(256) DEFAULT NULL COMMENT '拓展字段03',
  `field04` varchar(256) DEFAULT NULL COMMENT '拓展字段04',
  `field05` varchar(256) DEFAULT NULL COMMENT '拓展字段05',
  `field06` varchar(256) DEFAULT NULL COMMENT '拓展字段06',
  `field07` varchar(256) DEFAULT NULL COMMENT '拓展字段07',
  `field08` varchar(256) DEFAULT NULL COMMENT '拓展字段08',
  `field09` varchar(256) DEFAULT NULL COMMENT '拓展字段09',
  `field10` varchar(256) DEFAULT NULL COMMENT '拓展字段10',
  `field11` varchar(256) DEFAULT NULL COMMENT '拓展字段11',
  `field12` varchar(256) DEFAULT NULL COMMENT '拓展字段12',
  `field13` varchar(256) DEFAULT NULL COMMENT '拓展字段13',
  `field14` varchar(256) DEFAULT NULL COMMENT '拓展字段14',
  `field15` varchar(256) DEFAULT NULL COMMENT '拓展字段15',
  `field16` varchar(256) DEFAULT NULL COMMENT '拓展字段16',
  `field17` varchar(256) DEFAULT NULL COMMENT '拓展字段17',
  `field18` varchar(256) DEFAULT NULL COMMENT '拓展字段18',
  `field19` varchar(256) DEFAULT NULL COMMENT '拓展字段19',
  `field20` varchar(256) DEFAULT NULL COMMENT '拓展字段20',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办扩展历史数据表';

-- ----------------------------
-- Table structure for wf_tenant
-- ----------------------------
DROP TABLE IF EXISTS `wf_tenant`;
CREATE TABLE `wf_tenant` (
  `id` varchar(64) collate utf8_bin NOT NULL COMMENT '主键',
  `tenant_id` varchar(256) collate utf8_bin default NULL COMMENT '租户标识',
  `name` varchar(256) collate utf8_bin default NULL COMMENT '租户名称',
  `create_by` varchar(256) collate utf8_bin default NULL COMMENT '创建者',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(64) collate utf8_bin default NULL COMMENT '更新者',
  `update_date` datetime default NULL COMMENT '更新时间',
  `remarks` varchar(256) collate utf8_bin default NULL COMMENT '备注信息',
  `del_flag` char(1) collate utf8_bin NOT NULL default '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='租户表';

-- ----------------------------
-- 定时配置表
-- ----------------------------
DROP TABLE IF EXISTS `wf_timer_config`;
CREATE TABLE `wf_timer_config` (	
  `id` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '定时配置信息ID',
	`proc_def_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程定义ID',
	`task_def_key` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '任务节点ID',
	`proc_inst_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
	`execution_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '执行实例ID',
	`cron_expression` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'cron时间表达式',
  `time_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '时间类型：工作日,自然日',
	`begin_time` datetime DEFAULT NULL COMMENT '提醒相对时间',
	`end_time` datetime DEFAULT NULL COMMENT '结束相对时间',
	`cfrequency` bigint(20) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒频率,单位秒',
  `remind_num` bigint(20) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒次数',
	`send_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '提醒方式：email邮件shortMessage短信withinMessage',
	`create_time` datetime NOT NULL COMMENT '创建时间',
	`note` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '定时任务备注',
	`status` varchar(8) DEFAULT NULL DEFAULT '0' COMMENT '状态0正常1失效',
  `template` varchar(1000) COLLATE utf8_bin default NULL COMMENT '消息模板',
  `tenant_id` varchar(256) COLLATE utf8_bin default NULL COMMENT '租户标识', 
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='定时配置信息表';

ALTER TABLE `wf_process_design`
MODIFY COLUMN `design_name`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案名称' AFTER `id`,
MODIFY COLUMN `design_key`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方案Key' AFTER `design_name`,
MODIFY COLUMN `design_status`  char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '状态' AFTER `design_key`;


ALTER TABLE `wf_view_config`
MODIFY COLUMN `process_def_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '流程定义ID' AFTER `id`,
MODIFY COLUMN `task_def_id`  varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '任务定义ID' AFTER `process_def_id`;

