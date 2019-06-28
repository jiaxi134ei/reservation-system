-- ----------------------------
-- Table structure for wf_gen_table
-- ----------------------------
DROP TABLE
IF EXISTS wf_gen_table;

CREATE TABLE wf_gen_table (
	ID VARCHAR (64) NOT NULL,
	process_design_id VARCHAR (64),
	process_def_id VARCHAR (64),
	task_def_id VARCHAR (64),
	NAME VARCHAR (200),
	comments VARCHAR (500),
	class_name VARCHAR (100),
	style_type CHAR (1),
	parent_table VARCHAR (200),
	parent_table_fk VARCHAR (100),
	create_by VARCHAR (64),
	create_date TIMESTAMP (6),
	update_by VARCHAR (64),
	update_date TIMESTAMP (6),
	remarks VARCHAR (255),
	del_flag CHAR (1) NOT NULL
);

COMMENT ON TABLE wf_gen_table IS '业务表';

COMMENT ON COLUMN wf_gen_table. ID IS '编号';

COMMENT ON COLUMN wf_gen_table.process_design_id IS '流程方案id';

COMMENT ON COLUMN wf_gen_table.task_def_id IS '任务id';

COMMENT ON COLUMN wf_gen_table. NAME IS '名称';

COMMENT ON COLUMN wf_gen_table.comments IS '描述';

COMMENT ON COLUMN wf_gen_table.class_name IS '实体类名称';

COMMENT ON COLUMN wf_gen_table.style_type IS '表单样式(1:单列；0：双列)';

COMMENT ON COLUMN wf_gen_table.parent_table IS '关联父表';

COMMENT ON COLUMN wf_gen_table.parent_table_fk IS '关联父表外键';

COMMENT ON COLUMN wf_gen_table.create_by IS '创建者';

COMMENT ON COLUMN wf_gen_table.create_date IS '创建时间';

COMMENT ON COLUMN wf_gen_table.update_by IS '更新者';

COMMENT ON COLUMN wf_gen_table.update_date IS '更新时间';

COMMENT ON COLUMN wf_gen_table.remarks IS '备注信息';

COMMENT ON COLUMN wf_gen_table.del_flag IS '删除标记（0：正常；1：删除）';

-- ----------------------------
-- Table structure for wf_gen_table_column
-- ----------------------------
DROP TABLE
IF EXISTS wf_gen_table_column;

CREATE TABLE wf_gen_table_column (
	ID VARCHAR (64) NOT NULL,
	wf_gen_table_id VARCHAR (64),
	NAME VARCHAR (200),
	comments VARCHAR (500),
	jdbc_type VARCHAR (100),
	java_type VARCHAR (500),
	java_field VARCHAR (200),
	is_pk CHAR (1),
	is_null CHAR (1),
	is_insert CHAR (1),
	is_edit CHAR (1),
	is_list CHAR (1),
	is_query CHAR (1),
	query_type VARCHAR (200),
	show_type VARCHAR (200),
	dict_type VARCHAR (200),
	settings VARCHAR (2000),
	sort NUMERIC (10),
	create_by VARCHAR (64),
	create_date TIMESTAMP (6),
	update_by VARCHAR (64),
	update_date TIMESTAMP (6),
	remarks VARCHAR (255),
	del_flag CHAR (1) NOT NULL
);

COMMENT ON TABLE wf_gen_table_column IS '业务表字段';

COMMENT ON COLUMN wf_gen_table_column. ID IS '编号';

COMMENT ON COLUMN wf_gen_table_column.wf_gen_table_id IS '归属表编号';

COMMENT ON COLUMN wf_gen_table_column. NAME IS '名称';

COMMENT ON COLUMN wf_gen_table_column.comments IS '描述';

COMMENT ON COLUMN wf_gen_table_column.jdbc_type IS '列的数据类型的字节长度';

COMMENT ON COLUMN wf_gen_table_column.java_type IS 'JAVA类型';

COMMENT ON COLUMN wf_gen_table_column.java_field IS 'JAVA字段名';

COMMENT ON COLUMN wf_gen_table_column.is_pk IS '是否主键';

COMMENT ON COLUMN wf_gen_table_column.is_null IS '是否可为空';

COMMENT ON COLUMN wf_gen_table_column.is_insert IS '是否为插入字段';

COMMENT ON COLUMN wf_gen_table_column.is_edit IS '是否编辑字段';

COMMENT ON COLUMN wf_gen_table_column.is_list IS '是否列表字段';

COMMENT ON COLUMN wf_gen_table_column.is_query IS '是否查询字段';

COMMENT ON COLUMN wf_gen_table_column.query_type IS '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';

COMMENT ON COLUMN wf_gen_table_column.show_type IS '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';

COMMENT ON COLUMN wf_gen_table_column.dict_type IS '字典类型';

COMMENT ON COLUMN wf_gen_table_column.settings IS '其它设置（扩展字段JSON）';

COMMENT ON COLUMN wf_gen_table_column.sort IS '排序（升序）';

COMMENT ON COLUMN wf_gen_table_column.create_by IS '创建者';

COMMENT ON COLUMN wf_gen_table_column.create_date IS '创建时间';

COMMENT ON COLUMN wf_gen_table_column.update_by IS '更新者';

COMMENT ON COLUMN wf_gen_table_column.update_date IS '更新时间';

COMMENT ON COLUMN wf_gen_table_column.remarks IS '备注信息';

COMMENT ON COLUMN wf_gen_table_column.del_flag IS '删除标记（0：正常；1：删除）';

-- ----------------------------
-- Table structure for wf_hi_delegate
-- ----------------------------
DROP TABLE
IF EXISTS wf_hi_delegate;

CREATE TABLE wf_hi_delegate (
	ID VARCHAR (36) NOT NULL,
	ASSIGNEE VARCHAR (200),
	ATTORNEY VARCHAR (200),
	DELEGATE_TIME TIMESTAMP (6) NOT NULL,
	TASK_ID VARCHAR (100),
	STATUS int4 NOT NULL
);

COMMENT ON TABLE wf_hi_delegate IS '历史代理信息表';

COMMENT ON COLUMN wf_hi_delegate. ID IS 'ID';

COMMENT ON COLUMN wf_hi_delegate.ASSIGNEE IS '办理人';

COMMENT ON COLUMN wf_hi_delegate.ATTORNEY IS '代理人';

COMMENT ON COLUMN wf_hi_delegate.DELEGATE_TIME IS '设置代理信息时间';

COMMENT ON COLUMN wf_hi_delegate.TASK_ID IS '任务ID';

COMMENT ON COLUMN wf_hi_delegate.STATUS IS '状态';

-- ----------------------------
-- Table structure for wf_hi_task_expand_data
-- ----------------------------
DROP TABLE
IF EXISTS wf_hi_task_expand_data;

CREATE TABLE wf_hi_task_expand_data (
	ID VARCHAR (64) NOT NULL,
	task_expand_plan_id VARCHAR (64) NOT NULL,
	process_inst_id VARCHAR (64) NOT NULL,
	process_def_id VARCHAR (64) NOT NULL,
	task_id VARCHAR (64) NOT NULL,
	task_node_id VARCHAR (64) NOT NULL,
	field01 VARCHAR (256),
	field02 VARCHAR (256),
	field03 VARCHAR (256),
	field04 VARCHAR (256),
	field05 VARCHAR (256),
	field06 VARCHAR (256),
	field07 VARCHAR (256),
	field08 VARCHAR (256),
	field09 VARCHAR (256),
	field10 VARCHAR (256),
	field11 VARCHAR (256),
	field12 VARCHAR (256),
	field13 VARCHAR (256),
	field14 VARCHAR (256),
	field15 VARCHAR (256),
	field16 VARCHAR (256),
	field17 VARCHAR (256),
	field18 VARCHAR (256),
	field19 VARCHAR (256),
	field20 VARCHAR (256)
);

COMMENT ON TABLE wf_hi_task_expand_data IS '待办扩展历史数据表';

COMMENT ON COLUMN wf_hi_task_expand_data. ID IS 'ID';

COMMENT ON COLUMN wf_hi_task_expand_data.task_expand_plan_id IS '代办拓展方案ID';

COMMENT ON COLUMN wf_hi_task_expand_data.process_inst_id IS '流程实例ID';

COMMENT ON COLUMN wf_hi_task_expand_data.process_def_id IS '流程定义ID';

COMMENT ON COLUMN wf_hi_task_expand_data.task_id IS '待办任务ID';

COMMENT ON COLUMN wf_hi_task_expand_data.task_node_id IS '待办任务节点ID';

COMMENT ON COLUMN wf_hi_task_expand_data.field01 IS '拓展字段01';

COMMENT ON COLUMN wf_hi_task_expand_data.field02 IS '拓展字段02';

COMMENT ON COLUMN wf_hi_task_expand_data.field03 IS '拓展字段03';

COMMENT ON COLUMN wf_hi_task_expand_data.field04 IS '拓展字段04';

COMMENT ON COLUMN wf_hi_task_expand_data.field05 IS '拓展字段05';

COMMENT ON COLUMN wf_hi_task_expand_data.field06 IS '拓展字段06';

COMMENT ON COLUMN wf_hi_task_expand_data.field07 IS '拓展字段07';

COMMENT ON COLUMN wf_hi_task_expand_data.field08 IS '拓展字段08';

COMMENT ON COLUMN wf_hi_task_expand_data.field09 IS '拓展字段09';

COMMENT ON COLUMN wf_hi_task_expand_data.field10 IS '拓展字段10';

COMMENT ON COLUMN wf_hi_task_expand_data.field11 IS '拓展字段11';

COMMENT ON COLUMN wf_hi_task_expand_data.field12 IS '拓展字段12';

COMMENT ON COLUMN wf_hi_task_expand_data.field13 IS '拓展字段13';

COMMENT ON COLUMN wf_hi_task_expand_data.field14 IS '拓展字段14';

COMMENT ON COLUMN wf_hi_task_expand_data.field15 IS '拓展字段15';

COMMENT ON COLUMN wf_hi_task_expand_data.field16 IS '拓展字段16';

COMMENT ON COLUMN wf_hi_task_expand_data.field17 IS '拓展字段17';

COMMENT ON COLUMN wf_hi_task_expand_data.field18 IS '拓展字段18';

COMMENT ON COLUMN wf_hi_task_expand_data.field19 IS '拓展字段19';

COMMENT ON COLUMN wf_hi_task_expand_data.field20 IS '拓展字段20';

-- ----------------------------
-- Table structure for wf_process_classify
-- ----------------------------
DROP TABLE
IF EXISTS wf_process_classify;

CREATE TABLE wf_process_classify (
	ID VARCHAR (64) NOT NULL,
	parent_id VARCHAR (64) NOT NULL,
	parent_ids VARCHAR (2000) NOT NULL,
	NAME VARCHAR (100) NOT NULL,
	sort NUMERIC (10) NOT NULL,
	code VARCHAR (100) NOT NULL,
	TYPE CHAR (1) NOT NULL,
	USEABLE VARCHAR (64) NOT NULL,
	create_by VARCHAR (64) NOT NULL,
	create_date TIMESTAMP (6) NOT NULL,
	update_by VARCHAR (64) NOT NULL,
	update_date TIMESTAMP (6) NOT NULL,
	remarks VARCHAR (255),
	del_flag CHAR (1) NOT NULL
);

COMMENT ON TABLE wf_process_classify IS '流程分类表';

COMMENT ON COLUMN wf_process_classify. ID IS '编号';

COMMENT ON COLUMN wf_process_classify.parent_id IS '父级编号';

COMMENT ON COLUMN wf_process_classify.parent_ids IS '所有父级编号';

COMMENT ON COLUMN wf_process_classify. NAME IS '名称';

COMMENT ON COLUMN wf_process_classify.sort IS '排序';

COMMENT ON COLUMN wf_process_classify.code IS '分类编号';

COMMENT ON COLUMN wf_process_classify. TYPE IS '分类类型';

COMMENT ON COLUMN wf_process_classify.USEABLE IS '是否启用';

COMMENT ON COLUMN wf_process_classify.create_by IS '创建者';

COMMENT ON COLUMN wf_process_classify.create_date IS '创建时间';

COMMENT ON COLUMN wf_process_classify.update_by IS '更新者';

COMMENT ON COLUMN wf_process_classify.update_date IS '更新时间';

COMMENT ON COLUMN wf_process_classify.remarks IS '备注信息';

COMMENT ON COLUMN wf_process_classify.del_flag IS '删除标记';

INSERT INTO wf_process_classify VALUES ('738466264f304d15b9b57187546ec1b1', '0', '0,', '根分类', '30', 'root', '2', '1', '1', '2017-12-26 17:28:29.423', '1', '2017-12-26 17:28:29.423', '分类根节点', '0');


-- ----------------------------
-- Table structure for wf_process_config
-- ----------------------------
DROP TABLE
IF EXISTS wf_process_config;

CREATE TABLE wf_process_config (
	ID VARCHAR (64) NOT NULL,
	PROC_DEF_ID VARCHAR (64) NOT NULL,
	ACT_ID VARCHAR (64),
	ACT_NAME VARCHAR (64),
	PROCESS_STARTED_CLASS VARCHAR (255),
	PROCESS_COMPLETED_CLASS VARCHAR (255),
	BAS_RECEIVE_CLASS VARCHAR (255),
	BAS_INVOKE_TYPE VARCHAR (255),
	BAS_DISPOSE_TYPE VARCHAR (255),
	PAR_PARTICIPANT_MODE VARCHAR (255),
	PAR_NODE VARCHAR (255),
	PAR_ROLE VARCHAR (255),
	PAR_PERSONNL VARCHAR (255),
	PAR_RULE_PROJECT VARCHAR (255),
	PAR_RULE_CODE VARCHAR (255),
	TIME_TYPE VARCHAR (255),
	TIME_CALULATION VARCHAR (255),
	TIME_RELATIVE VARCHAR (255),
	TIME_DISPOSE_TYPE VARCHAR (255),
	TIME_REMIND_TIME VARCHAR (255),
	TIME_REMIND_FREQUENCY VARCHAR (255),
	TIME_REMIND_NUM VARCHAR (255),
	TIME_REMIND_TYPE VARCHAR (255),
	TIME_REMIND_TEXT VARCHAR (4000),
	USER_TASK_ASSIGNMENT VARCHAR (1000),
	NODE_FUNCTION VARCHAR (1000),
	PROCESS_STATUS VARCHAR (8)
);

COMMENT ON TABLE wf_process_config IS '流程配置表';

COMMENT ON COLUMN wf_process_config. ID IS 'ID';

COMMENT ON COLUMN wf_process_config.PROC_DEF_ID IS '流程定义ID';

COMMENT ON COLUMN wf_process_config.ACT_ID IS '节点ID';

COMMENT ON COLUMN wf_process_config.ACT_NAME IS '节点名称';

COMMENT ON COLUMN wf_process_config.PROCESS_STARTED_CLASS IS '流程启动处理类';

COMMENT ON COLUMN wf_process_config.PROCESS_COMPLETED_CLASS IS '流程结束处理类';

COMMENT ON COLUMN wf_process_config.BAS_RECEIVE_CLASS IS '业务处理类';

COMMENT ON COLUMN wf_process_config.BAS_INVOKE_TYPE IS '调用方式';

COMMENT ON COLUMN wf_process_config.BAS_DISPOSE_TYPE IS '处理方式';

COMMENT ON COLUMN wf_process_config.PAR_PARTICIPANT_MODE IS '参与者模式';

COMMENT ON COLUMN wf_process_config.PAR_NODE IS '节点';

COMMENT ON COLUMN wf_process_config.PAR_ROLE IS '角色';

COMMENT ON COLUMN wf_process_config.PAR_PERSONNL IS '人员';

COMMENT ON COLUMN wf_process_config.PAR_RULE_PROJECT IS '规则项目';

COMMENT ON COLUMN wf_process_config.PAR_RULE_CODE IS '规则编码';

COMMENT ON COLUMN wf_process_config.TIME_TYPE IS '时间类型';

COMMENT ON COLUMN wf_process_config.TIME_CALULATION IS '时间计算策略';

COMMENT ON COLUMN wf_process_config.TIME_RELATIVE IS '相对时间';

COMMENT ON COLUMN wf_process_config.TIME_DISPOSE_TYPE IS '处理方式';

COMMENT ON COLUMN wf_process_config.TIME_REMIND_TIME IS '提醒时间';

COMMENT ON COLUMN wf_process_config.TIME_REMIND_FREQUENCY IS '提醒频率';

COMMENT ON COLUMN wf_process_config.TIME_REMIND_NUM IS '提醒次数';

COMMENT ON COLUMN wf_process_config.TIME_REMIND_TYPE IS '提醒方式';

COMMENT ON COLUMN wf_process_config.TIME_REMIND_TEXT IS '提醒内容模板设置';

COMMENT ON COLUMN wf_process_config.USER_TASK_ASSIGNMENT IS '处理人配置';

COMMENT ON COLUMN wf_process_config.NODE_FUNCTION IS '节点功能';

COMMENT ON COLUMN wf_process_config.PROCESS_STATUS IS '任务或流程状态1或0';

-- ----------------------------
-- Table structure for wf_process_design
-- ----------------------------
DROP TABLE
IF EXISTS wf_process_design;

CREATE TABLE wf_process_design (
	ID VARCHAR (64) NOT NULL,
	design_name VARCHAR (255) NOT NULL,
	design_key VARCHAR (255) NOT NULL,
	design_status CHAR (1) NOT NULL,
	design_description VARCHAR (2000),
	process_def_id VARCHAR (64)
);

COMMENT ON COLUMN wf_process_design. ID IS 'ID';

COMMENT ON COLUMN wf_process_design.design_name IS '方案名称';

COMMENT ON COLUMN wf_process_design.design_key IS '方案Key';

COMMENT ON COLUMN wf_process_design.design_status IS '状态';

COMMENT ON COLUMN wf_process_design.design_description IS '方案描述';

COMMENT ON COLUMN wf_process_design.process_def_id IS '流程定义ID';

-- ----------------------------
-- Table structure for wf_process_variable
-- ----------------------------
DROP TABLE
IF EXISTS wf_process_variable;

CREATE TABLE wf_process_variable (
	ID VARCHAR (36) NOT NULL,
	task_def_id VARCHAR (64),
	process_def_id VARCHAR (64) NOT NULL,
	variable_key VARCHAR (64),
	variable_val VARCHAR (64),
	variable_name VARCHAR (32),
	task_def_name VARCHAR (64),
	process_design_id VARCHAR (255)
);

COMMENT ON TABLE wf_process_variable IS '变量配置';

COMMENT ON COLUMN wf_process_variable. ID IS 'ID';

COMMENT ON COLUMN wf_process_variable.task_def_id IS '任务定义ID';

COMMENT ON COLUMN wf_process_variable.process_def_id IS '流程定义ID';

COMMENT ON COLUMN wf_process_variable.variable_key IS '变量标识';

COMMENT ON COLUMN wf_process_variable.variable_val IS '变量值';

COMMENT ON COLUMN wf_process_variable.variable_name IS '变量名称';

COMMENT ON COLUMN wf_process_variable.task_def_name IS '任务定义名称';

COMMENT ON COLUMN wf_process_variable.process_design_id IS '流程设计方案id';

-- ----------------------------
-- Table structure for wf_ru_delegate
-- ----------------------------
DROP TABLE
IF EXISTS wf_ru_delegate;

CREATE TABLE wf_ru_delegate (
	ID VARCHAR (36) NOT NULL,
	ASSIGNEE VARCHAR (200),
	ATTORNEY VARCHAR (200),
	START_TIME TIMESTAMP (6),
	END_TIME TIMESTAMP (6),
	PROCESS_DEFINITION_ID VARCHAR (100),
	STATUS int4,
	PROCESS_DEFINITION_NAME VARCHAR (100)
);

COMMENT ON TABLE wf_ru_delegate IS '代理信息表';

COMMENT ON COLUMN wf_ru_delegate. ID IS 'ID';

COMMENT ON COLUMN wf_ru_delegate.ASSIGNEE IS '办理人';

COMMENT ON COLUMN wf_ru_delegate.ATTORNEY IS '代理人';

COMMENT ON COLUMN wf_ru_delegate.START_TIME IS '起始时间';

COMMENT ON COLUMN wf_ru_delegate.END_TIME IS '结束时间';

COMMENT ON COLUMN wf_ru_delegate.PROCESS_DEFINITION_ID IS '流程定义ID';

COMMENT ON COLUMN wf_ru_delegate.STATUS IS '状态';

COMMENT ON COLUMN wf_ru_delegate.PROCESS_DEFINITION_NAME IS '流程定义名称';

-- ----------------------------
-- Table structure for wf_task_expand_data
-- ----------------------------
DROP TABLE
IF EXISTS wf_task_expand_data;

CREATE TABLE wf_task_expand_data (
	ID VARCHAR (64) NOT NULL,
	task_expand_plan_id VARCHAR (64) NOT NULL,
	process_inst_id VARCHAR (64) NOT NULL,
	process_def_id VARCHAR (64) NOT NULL,
	task_id VARCHAR (64) NOT NULL,
	task_node_id VARCHAR (64) NOT NULL,
	field01 VARCHAR (256),
	field02 VARCHAR (256),
	field03 VARCHAR (256),
	field04 VARCHAR (256),
	field05 VARCHAR (256),
	field06 VARCHAR (256),
	field07 VARCHAR (256),
	field08 VARCHAR (256),
	field09 VARCHAR (256),
	field10 VARCHAR (256),
	field11 VARCHAR (256),
	field12 VARCHAR (256),
	field13 VARCHAR (256),
	field14 VARCHAR (256),
	field15 VARCHAR (256),
	field16 VARCHAR (256),
	field17 VARCHAR (256),
	field18 VARCHAR (256),
	field19 VARCHAR (256),
	field20 VARCHAR (256)
);

COMMENT ON TABLE wf_task_expand_data IS '流程待办扩展运行数据表';

COMMENT ON COLUMN wf_task_expand_data. ID IS 'ID';

COMMENT ON COLUMN wf_task_expand_data.task_expand_plan_id IS '代办拓展方案ID';

COMMENT ON COLUMN wf_task_expand_data.process_inst_id IS '流程实例ID';

COMMENT ON COLUMN wf_task_expand_data.process_def_id IS '流程定义ID';

COMMENT ON COLUMN wf_task_expand_data.task_id IS '待办任务ID';

COMMENT ON COLUMN wf_task_expand_data.task_node_id IS '待办任务节点ID';

COMMENT ON COLUMN wf_task_expand_data.field01 IS '拓展字段01';

COMMENT ON COLUMN wf_task_expand_data.field02 IS '拓展字段02';

COMMENT ON COLUMN wf_task_expand_data.field03 IS '拓展字段03';

COMMENT ON COLUMN wf_task_expand_data.field04 IS '拓展字段04';

COMMENT ON COLUMN wf_task_expand_data.field05 IS '拓展字段05';

COMMENT ON COLUMN wf_task_expand_data.field06 IS '拓展字段06';

COMMENT ON COLUMN wf_task_expand_data.field07 IS '拓展字段07';

COMMENT ON COLUMN wf_task_expand_data.field08 IS '拓展字段08';

COMMENT ON COLUMN wf_task_expand_data.field09 IS '拓展字段09';

COMMENT ON COLUMN wf_task_expand_data.field10 IS '拓展字段10';

COMMENT ON COLUMN wf_task_expand_data.field11 IS '拓展字段11';

COMMENT ON COLUMN wf_task_expand_data.field12 IS '拓展字段12';

COMMENT ON COLUMN wf_task_expand_data.field13 IS '拓展字段13';

COMMENT ON COLUMN wf_task_expand_data.field14 IS '拓展字段14';

COMMENT ON COLUMN wf_task_expand_data.field15 IS '拓展字段15';

COMMENT ON COLUMN wf_task_expand_data.field16 IS '拓展字段16';

COMMENT ON COLUMN wf_task_expand_data.field17 IS '拓展字段17';

COMMENT ON COLUMN wf_task_expand_data.field18 IS '拓展字段18';

COMMENT ON COLUMN wf_task_expand_data.field19 IS '拓展字段19';

COMMENT ON COLUMN wf_task_expand_data.field20 IS '拓展字段20';

-- ----------------------------
-- Table structure for wf_task_expand_plan
-- ----------------------------
DROP TABLE
IF EXISTS wf_task_expand_plan;

CREATE TABLE wf_task_expand_plan (
	ID VARCHAR (64) NOT NULL,
	wf_class_id VARCHAR (64) NOT NULL,
	wf_class_name VARCHAR (256) NOT NULL,
	field_key VARCHAR (64),
	field_name VARCHAR (256),
	field_value VARCHAR (256),
	field_type VARCHAR (256),
	field_url VARCHAR (2000),
	field_status VARCHAR (16)
);

COMMENT ON TABLE wf_task_expand_plan IS '流程待办扩展方案表';

COMMENT ON COLUMN wf_task_expand_plan. ID IS 'ID';

COMMENT ON COLUMN wf_task_expand_plan.wf_class_id IS '流程分类ID';

COMMENT ON COLUMN wf_task_expand_plan.wf_class_name IS '流程分类名称';

COMMENT ON COLUMN wf_task_expand_plan.field_key IS '拓展字段键值';

COMMENT ON COLUMN wf_task_expand_plan.field_name IS '拓展字段名称';

COMMENT ON COLUMN wf_task_expand_plan.field_value IS '拓展字段数值';

COMMENT ON COLUMN wf_task_expand_plan.field_type IS '类型';

COMMENT ON COLUMN wf_task_expand_plan.field_url IS '链接';

COMMENT ON COLUMN wf_task_expand_plan.field_status IS '是否隐藏';

-- ----------------------------
-- Table structure for wf_tenant
-- ----------------------------
DROP TABLE
IF EXISTS wf_tenant;

CREATE TABLE wf_tenant (
	ID VARCHAR (64) NOT NULL,
	tenant_id VARCHAR (256),
	NAME VARCHAR (256),
	create_by VARCHAR (256),
	create_date TIMESTAMP (6),
	update_by VARCHAR (64),
	update_date TIMESTAMP (6),
	remarks VARCHAR (256),
	del_flag CHAR (1) NOT NULL
);

COMMENT ON TABLE wf_tenant IS '租户表';

COMMENT ON COLUMN wf_tenant. ID IS '主键';

COMMENT ON COLUMN wf_tenant.tenant_id IS '租户标识';

COMMENT ON COLUMN wf_tenant. NAME IS '租户名称';

COMMENT ON COLUMN wf_tenant.create_by IS '创建者';

COMMENT ON COLUMN wf_tenant.create_date IS '创建时间';

COMMENT ON COLUMN wf_tenant.update_by IS '更新者';

COMMENT ON COLUMN wf_tenant.update_date IS '更新时间';

COMMENT ON COLUMN wf_tenant.remarks IS '备注信息';

COMMENT ON COLUMN wf_tenant.del_flag IS '删除标记（0：正常；1：删除）';

-- ----------------------------
-- Table structure for wf_view_config
-- ----------------------------
DROP TABLE
IF EXISTS wf_view_config;

CREATE TABLE wf_view_config (
	ID VARCHAR (36) NOT NULL,
	process_def_id VARCHAR (64) NOT NULL,
	task_def_id VARCHAR (64) NOT NULL,
	biz_detail_name VARCHAR (100),
	biz_detail_url VARCHAR (200),
	biz_detail_param VARCHAR (200),
	biz_operation VARCHAR (2000),
	process_design_id VARCHAR (64)
);

COMMENT ON COLUMN wf_view_config. ID IS 'ID';

COMMENT ON COLUMN wf_view_config.process_def_id IS '流程定义ID';

COMMENT ON COLUMN wf_view_config.task_def_id IS '任务定义ID';

COMMENT ON COLUMN wf_view_config.biz_detail_name IS '业务信息页面名称';

COMMENT ON COLUMN wf_view_config.biz_detail_url IS '业务信息页面地址';

COMMENT ON COLUMN wf_view_config.biz_detail_param IS '业务信息页面参数';

COMMENT ON COLUMN wf_view_config.biz_operation IS '操作权限控制';

COMMENT ON COLUMN wf_view_config.process_design_id IS '流程方案ID';

-- ----------------------------
-- Table structure for wf_view_related_links
-- ----------------------------
DROP TABLE
IF EXISTS wf_view_related_links;

CREATE TABLE wf_view_related_links (
	ID VARCHAR (36) NOT NULL,
	process_def_id VARCHAR (64),
	task_def_id VARCHAR (64) NOT NULL,
	link_name VARCHAR (100),
	link_url VARCHAR (200),
	link_param VARCHAR (200),
	sort_no NUMERIC (10)
);

COMMENT ON COLUMN wf_view_related_links. ID IS 'ID';

COMMENT ON COLUMN wf_view_related_links.process_def_id IS '流程定义ID';

COMMENT ON COLUMN wf_view_related_links.task_def_id IS '任务定义编号';

COMMENT ON COLUMN wf_view_related_links.link_name IS '链接名称';

COMMENT ON COLUMN wf_view_related_links.link_url IS '链接地址';

COMMENT ON COLUMN wf_view_related_links.link_param IS '链接参数';

COMMENT ON COLUMN wf_view_related_links.sort_no IS '排序';

-- ----------------------------
-- Table structure for WF_DEFINED_BUTTON
-- ----------------------------
CREATE TABLE WF_DEFINED_BUTTON (
  ID VARCHAR(36) NOT NULL,
  KEY VARCHAR(200) NULL,
  NAME VARCHAR(200) NULL,
  ALIAS VARCHAR(200) NULL,
  STATUS VARCHAR(8) NULL
);
COMMENT ON TABLE WF_DEFINED_BUTTON IS '按钮自定义设置表';

COMMENT ON COLUMN WF_DEFINED_BUTTON. ID IS 'ID';

COMMENT ON COLUMN WF_DEFINED_BUTTON. KEY IS '按钮key';

COMMENT ON COLUMN WF_DEFINED_BUTTON. NAME IS '按钮名称';

COMMENT ON COLUMN WF_DEFINED_BUTTON. ALIAS IS '按钮别名';

COMMENT ON COLUMN WF_DEFINED_BUTTON. STATUS IS '状态1失效0生效';

ALTER TABLE WF_DEFINED_BUTTON ADD PRIMARY KEY (ID);

INSERT INTO "WF_DEFINED_BUTTON" VALUES ('0a86e8a3526d4223afd3d8e3102c910c', 'nextTask', '下一步', '下一步', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('3f11484ccb5141bd84c304bcb4bf419b', 'processMsg', '查看流程过程信息', '查看流程过程信息', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('444ec5ae0d0a4f9681c9e6049483fe03', 'terminateProcess', '终止流程', '终止流程', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('4d13d7b836c547a4975cc5bf0438f259', 'lastTask', '回退至上一步', '回退至上一步', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('7290ac3e2842491e849a217cf395d816', 'suspendProcess', '挂起流程', '挂起流程', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('7caa66e5afa2431fb4da0ab5c57093f3', 'addGroupUser', '加签', '加签', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('afab98ffc20d474db2809bf12531c4b4', 'getTask', '获取任务', '获取任务', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('b3634ec91f2245428220ae79116ab98b', 'activateProcess', '激活流程', '激活流程', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('cbc443de2bf5494fb7e432ec5a2b869e', 'relay', '转发', '转发', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('cce811bab4974e93bfd83a53e8695ea7', 'releaseTask', '释放任务', '释放任务', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('eb6ca12f5002470094f1e798914c5df0', 'delGroupUser', '减签', '减签', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('f660c65a1ca44763a633e46bcb246356', 'firstTask', '退回第一步', '退回第一步', '1');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('fc0c5d20771147d7beab59717dba3e8e', 'getBack', '取回', '取回', '3');
INSERT INTO "WF_DEFINED_BUTTON" VALUES ('fc7ba9635f1948468ef0175c63d71dad', 'appointTask', '退回指定节点', '退回指定节点', '1');

-- ----------------------------
-- Alter Sequences Owned By
-- ----------------------------
-- ----------------------------
-- Indexes structure for table wf_gen_table
-- ----------------------------
CREATE INDEX wf_gen_table_del_flag ON wf_gen_table USING btree (del_flag);

CREATE INDEX wf_gen_table_name ON wf_gen_table USING btree (NAME);

-- ----------------------------
-- Primary Key structure for table wf_gen_table
-- ----------------------------
ALTER TABLE wf_gen_table ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table wf_gen_table_column
-- ----------------------------
CREATE INDEX wf_gen_table_column_del_flag ON wf_gen_table_column USING btree (del_flag);

CREATE INDEX wf_gen_table_column_name ON wf_gen_table_column USING btree (NAME);

CREATE INDEX wf_gen_table_column_sort ON wf_gen_table_column USING btree (sort);

CREATE INDEX wf_gen_table_column_table_id ON wf_gen_table_column USING btree (wf_gen_table_id);

-- ----------------------------
-- Primary Key structure for table wf_gen_table_column
-- ----------------------------
ALTER TABLE wf_gen_table_column ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_hi_delegate
-- ----------------------------
ALTER TABLE wf_hi_delegate ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_hi_task_expand_data
-- ----------------------------
ALTER TABLE wf_hi_task_expand_data ADD PRIMARY KEY (ID);

-- ----------------------------
-- Indexes structure for table wf_process_classify
-- ----------------------------
CREATE INDEX wf_process_del_flag ON wf_process_classify USING btree (del_flag);

CREATE INDEX wf_process_parent_id ON wf_process_classify USING btree (parent_id);

CREATE INDEX wf_process_type ON wf_process_classify USING btree (TYPE);

-- ----------------------------
-- Primary Key structure for table wf_process_classify
-- ----------------------------
ALTER TABLE wf_process_classify ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_process_config
-- ----------------------------
ALTER TABLE wf_process_config ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_process_design
-- ----------------------------
ALTER TABLE wf_process_design ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_process_variable
-- ----------------------------
ALTER TABLE wf_process_variable ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_ru_delegate
-- ----------------------------
ALTER TABLE wf_ru_delegate ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_task_expand_data
-- ----------------------------
ALTER TABLE wf_task_expand_data ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_task_expand_plan
-- ----------------------------
ALTER TABLE wf_task_expand_plan ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_tenant
-- ----------------------------
ALTER TABLE wf_tenant ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_view_config
-- ----------------------------
ALTER TABLE wf_view_config ADD PRIMARY KEY (ID);

-- ----------------------------
-- Primary Key structure for table wf_view_related_links
-- ----------------------------
ALTER TABLE wf_view_related_links ADD PRIMARY KEY (ID);

ALTER TABLE "wf_view_config"
ALTER COLUMN "process_def_id" DROP NOT NULL,
ALTER COLUMN "task_def_id" DROP NOT NULL;

ALTER TABLE "wf_process_design"
ALTER COLUMN "design_name" DROP NOT NULL,
ALTER COLUMN "design_key" DROP NOT NULL,
ALTER COLUMN "design_status" DROP NOT NULL;

-- ----------------------------
-- Table structure for wf_process_config
-- ----------------------------
DROP TABLE
IF EXISTS wf_timer_config;
CREATE TABLE wf_timer_config (
	id varchar(36) NOT NULL,
    proc_def_id varchar(64),
	task_def_key varchar(255),
	proc_inst_id varchar(64),
	execution_id varchar(64),
	cron_expression varchar(255),
    time_type varchar(64),
	begin_time TIMESTAMP(6),
	end_time TIMESTAMP(6),
	cfrequency NUMERIC(20),
    remind_num NUMERIC(20),
	send_type varchar(64),
	create_time TIMESTAMP(6),
	note varchar(2000),
	status varchar(8),
    template varchar(1000),
    tenant_id varchar(256)
);

COMMENT ON COLUMN wf_timer_config.id IS '定时配置信息ID';
COMMENT ON COLUMN wf_timer_config.proc_def_id IS '流程定义ID';
COMMENT ON COLUMN wf_timer_config.task_def_key IS '任务节点ID';
COMMENT ON COLUMN wf_timer_config.proc_inst_id IS '流程实例ID';
COMMENT ON COLUMN wf_timer_config.execution_id IS '执行实例ID';
COMMENT ON COLUMN wf_timer_config.cron_expression IS 'cron时间表达式';
COMMENT ON COLUMN wf_timer_config.time_type IS '时间类型：工作日,自然日';
COMMENT ON COLUMN wf_timer_config.begin_time IS '提醒相对时间';
COMMENT ON COLUMN wf_timer_config.end_time IS '结束相对时间';
COMMENT ON COLUMN wf_timer_config.cfrequency IS '提醒频率,单位秒';
COMMENT ON COLUMN wf_timer_config.remind_num IS '提醒次数';
COMMENT ON COLUMN wf_timer_config.send_type IS '提醒方式：email邮件shortMessage短信withinMessage';
COMMENT ON COLUMN wf_timer_config.create_time IS '创建时间';
COMMENT ON COLUMN wf_timer_config.note IS '定时任务备注';
COMMENT ON COLUMN wf_timer_config.status IS '状态0正常1失效';
COMMENT ON COLUMN wf_timer_config.template IS '消息模板';
COMMENT ON COLUMN wf_timer_config.tenant_id IS '租户标识';