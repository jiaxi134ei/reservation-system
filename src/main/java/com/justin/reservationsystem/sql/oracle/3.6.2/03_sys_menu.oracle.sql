INSERT INTO SYS_MENU VALUES ('9f71543b63504e9998154a37b88f8821', '1', '0,1,', '工作流管理', '100', '', '', '', '1', '', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('752e36c35984466d9aadcecb745598e1', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '租户管理', '101', '/wf/tenant/list', '', '', '1', 'wf:tenant:view,wf:tenant:edit,sys:tenant:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('28d2dd7f7dc4428791ee16ac3a3ef262', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '模型列表', '30', '/wf/model/list', '', '', '1', 'wf:model:view,wf:model:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('2cd8b93cd3d946639db399d344b9d665', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程定义', '40', '/wf/processDefinition/list', '', '', '1', 'wf:processDefinition:view', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('571fdc3fe103494497311a87c0890b54', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程跟踪管理', '50', '/wf/instance/runningList', '', '', '1', 'wf:instance:view', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('d1b88955a45b49ab8e006e9c501bb45d', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '完成的流程', '80', '/wf/instance/completeProcess', '', '', '1', 'wf:instance:view', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('0390a660482b47f28c83ef116697bb9f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程变量配置', '5030', '/wf/wfProcessVariable', '', '', '0', 'wf:wfProcessVariable:view,wf:wfProcessVariable:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('3050874e9ae84ede8d06d22612f7dd85', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '业务页面配置链接', '200', '/wf/wfViewRelatedLinks/list', '', '', '0', 'wf:wfViewRelatedLinks:view,wf:wfViewRelatedLinks:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('33d6caf429d1417b8516e510fee0db84', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '业务页面配置', '170', '/wf/wfViewConfig/list', '', '', '0', 'wf:wfViewConfig:view,wf:wfViewConfig:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('ea5438903df649b2bf24df3ee2150e38', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程模型选择', '5030', '/wf/wfProcessDefinitionSelected/list', '', '', '0', 'wf:wfProcessDefinitionSelected:view,wf:wfProcessDefinitionSelected:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('378d3d0c92c24ed3a9a60bc8b8e5b018', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程设计方案', '5030', '/wf/wfProcessDesign/list', '', '', '1', 'wf:wfProcessDesign:view,wf:wfProcessDesign:edit,wf:wfProcessDefinitionSelected:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('51b784bd5455418a973cb9d9d55e30f6', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '已办任务', '140', '/wf/task/taskList?status=3', '', '', '1', 'wf:task:view', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('c0884fdb19874af48f7ed3c341edb34f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '待办任务', '110', '/wf/task/taskList?status=1', '', '', '1', 'wf:task:view', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

DELETE FROM SYS_MENU WHERE ID IN ('7af7cdba259d4a048fd4d84c49623346','995df149c8fa42e4a241e19c2c09167a','4f300814ee1d49eb8c447edac41baefd','d4530c4163744f229587250f617849f4','12a202d972bb4767aef5df5c7a3d8c37','4033514899f1441399c8398d39c8227d','b97deb8b57344d309fca35cf10a8c275');
INSERT INTO SYS_MENU VALUES ('7af7cdba259d4a048fd4d84c49623346', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '监控性能分析', '200', '', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('995df149c8fa42e4a241e19c2c09167a', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '处理效率统计', '201', '/wf/wfProEff/wfProEffCount', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('4f300814ee1d49eb8c447edac41baefd', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '人员处理效率榜', '202', '/wf/wfProEff/wfProEffRedAndBlue?orderType=desc', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('d4530c4163744f229587250f617849f4', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '机构处理效率榜', '203', '/wf/wfProEff/wfProEffRedAndBlueOrg?orderType=desc', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-10-09 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('12a202d972bb4767aef5df5c7a3d8c37', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '流程处理效率榜', '204', '/wf/wfProEff/wfProEffRedAndBlueProDef?orderType=desc', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('4033514899f1441399c8398d39c8227d', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '产品处理效率榜', '205', '/wf/wfProEff/wfProEffRedAndBlueProduct?orderType=desc', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('b97deb8b57344d309fca35cf10a8c275', '7af7cdba259d4a048fd4d84c49623346', '0,1,9f71543b63504e9998154a37b88f8821,7af7cdba259d4a048fd4d84c49623346,', '渠道处理效率榜', '206', '/wf/wfProEff/wfProEffRedAndBlueChannel?orderType=desc', '', '', '1', 'wf:wfProEff:view', '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2018-01-18 11:30:40:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_MENU VALUES ('fb77e7904c3a4db391cf4a525ea586bd', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程创建管理', '5090', '/wf/wfProcessCreate/list', '', '', '1', 'wf:wfProcessCreate:view,wf:wfProcessCreate:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_MENU VALUES ('8470ee78b5134128aa9b13748328960d', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '流程分类管理', '5060', '/wf/wfProcessClassify/list', '', '', '1', 'sys:wfProcessClassify:view,sys:wfProcessClassify:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_MENU VALUES ('2b237c87a8e14253a057bab735da37dd', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '待办任务设置', '210', '/wf/wfTaskExpandPlan/taskExpandPlanList', '', '', '1', 'wf:wfTaskExpandPlan:view,wf:wfTaskExpandPlan:edit', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_MENU VALUES ('c9e022f206f74e068ad716e454ad74d8', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '自定义按钮配置', '5060', '/wf/wfDefinedButton/list', '', '', '1', 'wf:wfDefinedButton:view,wf:wfDefinedButton:edit', '1',TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

UPDATE SYS_MENU SET name='流程跟踪管理' WHERE id='571fdc3fe103494497311a87c0890b54' AND name='运行中的流程';

INSERT INTO SYS_DICT VALUES ('35e70ce09ea64ee5a879c6db5391830c', '15', '红榜排名', 'wfProEffRedTop', '显示红榜排名配置', '0', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_DICT VALUES ('947fa0879fb44293a07fcd8ae5360078', '15', '蓝榜排名', 'wfProEffBlueTop', '显示蓝榜排名配置', '0', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_DICT VALUES ('9108bdda3cf94081883060316dcd4f9d', '1', '失效', 'STATUS', '状态', '20', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_DICT VALUES ('a58abca1ced341ea950c9bdb6151830e', '0', '生效', 'STATUS', '状态', '10', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_DICT  VALUES ('0093899f23854b2ba93c1c9bc7a9b541', '1', '单列', 'style_type', '表单样式', '10', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '0');
INSERT INTO SYS_DICT  VALUES ('1c58b790caba4ae782aebdca68b91048', '0', '双列', 'style_type', '表单样式', '20', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), NULL, '0');

INSERT INTO SYS_DICT VALUES ('539b470f450441e1a8af9155faa0c0c0', '2', '数据字典', 'field_type', '数据字典', '2', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_DICT VALUES ('1ccb312a151a46318a26264298374bc4', '1', '字符串', 'field_type', '字符串', '1', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

INSERT INTO SYS_DICT VALUES ('bfb2dd97df5e42569ad4f16e23bf35f1', '3', '已办', 'task_status', '待办已办', '10', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');
INSERT INTO SYS_DICT VALUES ('ef489382573d4b43ac25244c6ff2afcb', '1', '待办', 'task_status', '待办已办', '10', '0', '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '1', TO_TIMESTAMP('2017-04-06 11:03:47:000000', 'SYYYY-MM-DD HH24:MI:SS:FF6'), '', '0');

COMMIT ;

