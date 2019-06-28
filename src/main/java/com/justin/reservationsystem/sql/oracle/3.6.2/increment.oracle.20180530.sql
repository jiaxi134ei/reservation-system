-- ----------------------------
-- alter Table date 20180530
-- v 3.6.2
-- ----------------------------

-- Create table 
CREATE TABLE WF_LEAVE_TRANSFER (
  ID NVARCHAR2(36) NOT NULL,
  CLASSIFY_ID NVARCHAR2(60) NOT NULL,
  CLASSIFY_NAME NVARCHAR2(100),
  USER_ID NVARCHAR2(200) NOT NULL,
  TRANSFER_ID NVARCHAR2(200) NOT NULL,
  START_TIME TIMESTAMP(8) NOT NULL,
  END_TIME TIMESTAMP(8) NOT NULL,
  DESCRIBE_ NVARCHAR2(2000),
  STATUS NVARCHAR2(8) NOT NULL,
  START_STATUS NVARCHAR2(8) NOT NULL
);
COMMENT ON TABLE WF_LEAVE_TRANSFER IS '离岗移交信息表';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. ID IS 'ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. CLASSIFY_ID IS '流程分类ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. CLASSIFY_NAME IS '流程分类名称';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. USER_ID IS 'login_name登录名';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. TRANSFER_ID IS '交接人ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. START_TIME IS '开始时间';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. END_TIME IS '结束时间';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. DESCRIBE_ IS '描述';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. STATUS IS '状态1失效0生效';

COMMENT ON COLUMN WF_LEAVE_TRANSFER. START_STATUS IS '离岗移交执行状态1未执行0已执行';

ALTER TABLE WF_LEAVE_TRANSFER ADD PRIMARY KEY (ID);

-- ----------------------------
-- for sys_menu 
-- ----------------------------
INSERT INTO SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
VALUES ('cfdd62b3b9574bfdb636d8774b81cf7f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '离岗移交设置', '5120', '/wf/wfLeaveTransfer/list', '', '', '1', 'wf:wfLeaveTransfer:view,wf:wfLeaveTransfer:edit', '1', to_timestamp('04-06-2017 15:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1', to_timestamp('04-06-2017 15:16:19.000000', 'dd-mm-yyyy hh24:mi:ss.ff'), '', '0');
