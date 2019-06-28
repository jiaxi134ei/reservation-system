-- ----------------------------
-- alter Table date 20180530
-- v 3.6.2
-- ----------------------------

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `wf_leave_transfer`;
CREATE TABLE `wf_leave_transfer` (
  `ID` varchar(36) COLLATE utf8_bin NOT NULL COMMENT 'ID',
  `CLASSIFY_ID` varchar(60) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '流程分类ID',
  `CLASSIFY_NAME` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '流程分类名称',
  `USER_ID` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'login_name登录名',
  `TRANSFER_ID` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '交接人ID',
  `START_TIME` datetime NOT NULL COMMENT '开始时间',
  `END_TIME` datetime NOT NULL COMMENT '结束时间',
  `DESCRIBE_` varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `STATUS` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '状态1失效0生效',
  `START_STATUS` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '离岗移交执行状态1未执行0已执行',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='离岗移交信息表';

-- ----------------------------
-- for sys_menu 
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('cfdd62b3b9574bfdb636d8774b81cf7f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '离岗移交设置', '5120', '/wf/wfLeaveTransfer/list', '', '', '1', 'wf:wfLeaveTransfer:view,wf:wfLeaveTransfer:edit', '1', '2018-04-09 15:45:18', '1', '2018-04-09 15:45:18', '', '0');
