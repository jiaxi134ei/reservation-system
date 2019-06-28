INSERT INTO "sys_menu" VALUES ('9f71543b63504e9998154a37b88f8821', '1', '0,1,', '工作流管理', '100', '', '', '', '1', '', '1', '2017-04-06 11:03:47', '1', '2017-04-06 11:03:47', '', '0');
INSERT INTO "sys_menu" VALUES ('752e36c35984466d9aadcecb745598e1', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '租户管理', '101', '/wf/tenant/list', '', '', '1', 'wf:tenant:view,wf:tenant:edit,sys:tenant:edit', '1', '2017-12-26 16:24:02.629', '1', '2017-12-26 16:24:02.629', '', '0');
INSERT INTO "sys_menu" VALUES ('8470ee78b5134128aa9b13748328960d', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程分类管理', '102', '/wf/wfProcessClassify/list', '', '', '1', 'sys:wfProcessClassify:view,sys:wfProcessClassify:edit', '1', '2017-10-13 09:49:20', '1', '2017-10-13 09:50:55', '', '0');
INSERT INTO "sys_menu" VALUES ('2b237c87a8e14253a057bab735da37dd', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '待办任务设置', '103', '/wf/wfTaskExpandPlan/taskExpandPlanList', '', '', '1', 'wf:wfTaskExpandPlan:view,wf:wfTaskExpandPlan:edit', '1', '2017-10-25 11:30:40', '1', '2017-10-25 11:30:40', '', '0');
INSERT INTO "sys_menu" VALUES ('378d3d0c92c24ed3a9a60bc8b8e5b018', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程设计方案', '104', '/wf/wfProcessDesign/list', '', '', '1', 'wf:wfProcessDesign:view,wf:wfProcessDesign:edit,wf:wfProcessDefinitionSelected:edit', '1', '2017-7-26 10:19:55', '1', '2017-7-26 10:19:55', '', '0');
INSERT INTO "sys_menu" VALUES ('fb77e7904c3a4db391cf4a525ea586bd', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程创建管理', '105', '/wf/wfProcessCreate/list', '', '', '1', 'wf:wfProcessCreate:view,wf:wfProcessCreate:edit', '1', '2017-10-16 14:25:06', '1', '2017-10-16 14:25:06', '', '0');
INSERT INTO "sys_menu" VALUES ('51b784bd5455418a973cb9d9d55e30f6', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '已办任务', '106', '/wf/task/taskList?status=3', '', '', '1', 'wf:task:view', '1', '2017-04-10 14:04:33', '1', '2017-07-22 18:31:01', '', '0');
INSERT INTO "sys_menu" VALUES ('c0884fdb19874af48f7ed3c341edb34f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '待办任务', '107', '/wf/task/taskList?status=1', '', '', '1', 'wf:task:view', '1', '2017-04-10 14:04:20', '1', '2017-07-22 18:30:40', '', '0');
INSERT INTO "sys_menu" VALUES ('571fdc3fe103494497311a87c0890b54', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程跟踪管理', '108', '/wf/instance/runningList', '', '', '1', 'wf:instance:view', '1', '2017-04-07 17:07:49', '1', '2017-04-10 09:41:02', '', '0');
INSERT INTO "sys_menu" VALUES ('d1b88955a45b49ab8e006e9c501bb45d', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '完成的流程', '109', '/wf/instance/completeProcess', '', '', '1', 'wf:instance:view', '1', '2017-04-10 09:41:41', '1', '2017-04-10 09:41:41', '', '0');

INSERT INTO "sys_menu" VALUES ('7af7cdba259d4a048fd4d84c49623346', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '监控性能分析', '110', '', '', '', '1', 'wf:wfProEff:view', '1', '2017-10-09 11:30:40', '1', '2017-10-09 11:30:40', '', '0');
INSERT INTO "sys_menu" VALUES ('995df149c8fa42e4a241e19c2c09167a', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '处理效率统计', '111', '/wf/wfProEff/wfProEffCount', '', '', '1', 'wf:wfProEff:view', '1', '2017-10-09 11:30:40', '1', '2017-10-09 11:30:40', '', '0');
INSERT INTO "sys_menu" VALUES ('4f300814ee1d49eb8c447edac41baefd', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '处理效率红榜', '112', '/wf/wfProEff/wfProEffRed', '', '', '1', 'wf:wfProEff:view', '1', '2017-10-09 11:30:40', '1', '2017-10-09 11:30:40', '', '0');
INSERT INTO "sys_menu" VALUES ('b8fef930d9314bcea23c957796f8ae9f', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '处理效率蓝榜', '113', '/wf/wfProEff/wfProEffBlue', '', '', '1', 'wf:wfProEff:view', '1', '2017-10-09 11:30:40', '1', '2017-10-09 11:30:40', '', '0');


INSERT INTO "sys_dict" VALUES ('35e70ce09ea64ee5a879c6db5391830c', '15', '红榜排名', 'wfProEffRedTop', '显示红榜排名配置', '0', '0', '1', '2017-10-11 19:15:05', '1', '2017-10-11 19:15:05', '', '0');
INSERT INTO "sys_dict" VALUES ('947fa0879fb44293a07fcd8ae5360078', '15', '蓝榜排名', 'wfProEffBlueTop', '显示蓝榜排名配置', '0', '0', '1', '2017-10-11 19:15:05', '1', '2017-10-11 19:15:05', '', '0');

INSERT INTO "sys_dict" VALUES ('9108bdda3cf94081883060316dcd4f9d', '1', '失效', 'STATUS', '状态', '20', '0', '1', '2017-07-31 19:15:05', '1', '2017-07-31 19:15:39', '', '0');
INSERT INTO "sys_dict" VALUES ('a58abca1ced341ea950c9bdb6151830e', '0', '生效', 'STATUS', '状态', '10', '0', '1', '2017-07-31 19:14:25', '1', '2017-07-31 19:15:33', '', '0');

INSERT INTO "sys_dict"  VALUES ('0093899f23854b2ba93c1c9bc7a9b541', '1', '单列', 'style_type', '表单样式', '10', '0', '1', '2017-04-16 12:58:30', '1', '2017-04-16 12:58:33', NULL, '0');
INSERT INTO "sys_dict"  VALUES ('1c58b790caba4ae782aebdca68b91048', '0', '双列', 'style_type', '表单样式', '20', '0', '1', '2017-04-16 12:59:14', '1', '2017-04-16 12:59:18', NULL, '0');

INSERT INTO "sys_dict" VALUES ('539b470f450441e1a8af9155faa0c0c0', '2', '数据字典', 'field_type', '数据字典', '2', '0', '1', '2017-12-27 13:51:14', '1', '2017-12-27 13:51:14', '', '0');
INSERT INTO "sys_dict" VALUES ('1ccb312a151a46318a26264298374bc4', '1', '字符串', 'field_type', '字符串', '1', '0', '1', '2017-12-27 13:50:19', '1', '2017-12-27 13:50:19', '', '0');

INSERT INTO "SYS_MENU" VALUES ('c9e022f206f74e068ad716e454ad74d8', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '自定义按钮配置', '5060', '/wf/wfDefinedButton/list', '', '', '1', 'wf:wfDefinedButton:view,wf:wfDefinedButton:edit', '1', '2017-12-22 11:02:38', '1', '2017-12-22 11:04:17', '', '0');

-- 2018-04-02 beta4
-- for sys_dict

INSERT INTO "sys_dict" VALUES ('bfb2dd97df5e42569ad4f16e23bf35f1', '3', '已办', 'task_status', '待办已办', '10', '0', '1', '2018-02-12 09:37:55', '1', '2018-02-12 10:03:52', '', '0');
INSERT INTO "sys_dict" VALUES ('ef489382573d4b43ac25244c6ff2afcb', '1', '待办', 'task_status', '待办已办', '10', '0', '1', '2018-02-12 09:37:34', '1', '2018-02-12 10:04:00', '', '0');

-- for sys_menu
INSERT INTO "SYS_MENU" VALUES ('c9e022f206f74e068ad716e454ad74d8', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '自定义按钮配置', '5060', '/wf/wfDefinedButton/list', '', '', '1', 'wf:wfDefinedButton:view,wf:wfDefinedButton:edit', '1', '2017-12-22 11:02:38', '1', '2017-12-22 11:04:17', '', '0');


