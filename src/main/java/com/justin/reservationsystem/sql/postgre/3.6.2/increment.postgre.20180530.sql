-- ----------------------------
-- alter Table date 20180530
-- v 3.6.2
-- ----------------------------

-- ----------------------------
-- Table structure for WF_LEAVE_TRANSFER
-- ----------------------------
DROP TABLE
IF EXISTS WF_LEAVE_TRANSFER;

CREATE TABLE WF_LEAVE_TRANSFER (
	ID VARCHAR (36) NOT NULL,
	CLASSIFY_ID VARCHAR(60) NOT NULL,
  	CLASSIFY_NAME VARCHAR(100),
	USER_ID VARCHAR (64) NOT NULL,
	TRANSFER_ID VARCHAR (64) NOT NULL,
	START_TIME TIMESTAMP (6) NOT NULL,
	END_TIME TIMESTAMP (6) NOT NULL,
	DESCRIBE_ VARCHAR (200),
	STATUS VARCHAR (8) NOT NULL,
	START_STATUS VARCHAR(8) NOT NULL
);

COMMENT ON TABLE WF_LEAVE_TRANSFER IS '离岗移交信息表';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.ID IS 'ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.CLASSIFY_ID IS '流程分类ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.CLASSIFY_NAME IS '流程分类名称';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.USER_ID IS 'login_name登录名';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.TRANSFER_ID IS '交接人ID';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.START_TIME IS '开始时间';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.END_TIME IS '结束时间';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.DESCRIBE_ IS '描述';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.STATUS IS '状态1失效0生效';

COMMENT ON COLUMN WF_LEAVE_TRANSFER.START_STATUS IS '离岗移交执行状态1未执行0已执行';

-- ----------------------------
-- Primary Key structure for table WF_LEAVE_TRANSFER
-- ----------------------------
ALTER TABLE WF_LEAVE_TRANSFER ADD PRIMARY KEY (ID);

INSERT INTO SYS_MENU (ID, PARENT_ID, PARENT_IDS, NAME, SORT, HREF, TARGET, ICON, IS_SHOW, PERMISSION, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE, REMARKS, DEL_FLAG)
VALUES ('cfdd62b3b9574bfdb636d8774b81cf7f', '9f71543b63504e9998154a37b88f8821', '0,1,9f71543b63504e9998154a37b88f8821,', '离岗移交设置', '5120', '/wf/wfLeaveTransfer/list', '', '', '1', 'wf:wfLeaveTransfer:view,wf:wfLeaveTransfer:edit', '1', '2018-04-09 15:45:18', '1', '2018-04-09 15:45:18', '', '0');
