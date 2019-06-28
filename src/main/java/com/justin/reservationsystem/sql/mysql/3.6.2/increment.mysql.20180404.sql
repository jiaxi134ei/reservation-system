-- ----------------------------
-- alter Table date 20180313
-- v 3.6.2
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wf_process_config`
-- ----------------------------

-- DROP TABLE IF EXISTS `wf_process_config`;

-- ----------------------------
-- Table structure for `wf_defined_button`
-- ----------------------------
DROP TABLE IF EXISTS `wf_defined_button`;
CREATE TABLE `wf_defined_button` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `KEY` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮key',
  `NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮名称',
  `ALIAS` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '按钮别名',
  `STATUS` varchar(8) COLLATE utf8_bin DEFAULT NULL COMMENT '状态1失效0生效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='按钮自定义设置表';

-- ----------------------------
-- Records of wf_defined_button
-- ----------------------------
INSERT INTO `wf_defined_button` VALUES ('0a86e8a3526d4223afd3d8e3102c910c', 'nextTask', '下一步', '下一步,提交', '1');
INSERT INTO `wf_defined_button` VALUES ('3f11484ccb5141bd84c304bcb4bf419b', 'processMsg', '查看流程过程信息', '查看流程过程信息', '1');
INSERT INTO `wf_defined_button` VALUES ('444ec5ae0d0a4f9681c9e6049483fe03', 'terminateProcess', '终止流程', '终止流程', '1');
INSERT INTO `wf_defined_button` VALUES ('4d13d7b836c547a4975cc5bf0438f259', 'lastTask', '回退至上一步', '回退至上一步,回退', '1');
INSERT INTO `wf_defined_button` VALUES ('7290ac3e2842491e849a217cf395d816', 'suspendProcess', '挂起流程', '挂起流程', '1');
INSERT INTO `wf_defined_button` VALUES ('7caa66e5afa2431fb4da0ab5c57093f3', 'addGroupUser', '加签', '加签', '1');
INSERT INTO `wf_defined_button` VALUES ('afab98ffc20d474db2809bf12531c4b4', 'getTask', '获取任务', '获取任务', '1');
INSERT INTO `wf_defined_button` VALUES ('b3634ec91f2245428220ae79116ab98b', 'activateProcess', '激活流程', '激活流程', '1');
INSERT INTO `wf_defined_button` VALUES ('cbc443de2bf5494fb7e432ec5a2b869e', 'relay', '转发', '转发', '1');
INSERT INTO `wf_defined_button` VALUES ('cce811bab4974e93bfd83a53e8695ea7', 'releaseTask', '释放任务', '释放任务', '1');
INSERT INTO `wf_defined_button` VALUES ('eb6ca12f5002470094f1e798914c5df0', 'delGroupUser', '减签', '减签', '1');
INSERT INTO `wf_defined_button` VALUES ('f660c65a1ca44763a633e46bcb246356', 'firstTask', '退回第一步', '退回第一步', '1');
INSERT INTO `wf_defined_button` VALUES ('fc0c5d20771147d7beab59717dba3e8e', 'getBack', '取回', '取回', '3');
INSERT INTO `wf_defined_button` VALUES ('fc7ba9635f1948468ef0175c63d71dad', 'appointTask', '退回指定节点', '退回指定节点', '1');


-- for sys_dict

INSERT INTO `sys_dict` VALUES ('bfb2dd97df5e42569ad4f16e23bf35f1', '3', '已办', 'task_status', '待办已办', '10', '0', '1', '2018-02-12 09:37:55', '1', '2018-02-12 10:03:52', '', '0');
INSERT INTO `sys_dict` VALUES ('ef489382573d4b43ac25244c6ff2afcb', '1', '待办', 'task_status', '待办已办', '10', '0', '1', '2018-02-12 09:37:34', '1', '2018-02-12 10:04:00', '', '0');

-- for sys_menu
INSERT INTO `SYS_MENU` VALUES ('c9e022f206f74e068ad716e454ad74d8', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '自定义按钮配置', '5060', '/wf/wfDefinedButton/list', '', '', '1', 'wf:wfDefinedButton:view,wf:wfDefinedButton:edit', '1', '2017-12-22 11:02:38', '1', '2017-12-22 11:04:17', '', '0');


-- alter  20180404
ALTER TABLE wf_task_expand_plan add COLUMN field_type VARCHAR(256) DEFAULT NULL; 
ALTER TABLE wf_task_expand_plan add COLUMN field_url VARCHAR(2000) DEFAULT NULL; 
ALTER TABLE wf_task_expand_plan add COLUMN field_status VARCHAR(16) DEFAULT NULL; 

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

-- 索引
CREATE INDEX parent_task_id_index ON act_ru_task(parent_task_id_); 
CREATE INDEX task_id_index ON wf_task_expand_data (task_id); 
CREATE INDEX proc_inst_id_index ON act_ru_identitylink(proc_inst_id_); 
CREATE INDEX task_id_index ON act_ru_identitylink(task_id_); 
CREATE INDEX name_index ON act_ru_variable(name_); 
CREATE INDEX execution_id_index ON act_ru_variable(execution_id_);