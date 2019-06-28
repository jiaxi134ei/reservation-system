-- Create table
create table ACT_EVT_LOG
(
  LOG_NR_       NUMBER(19) not null,
  TYPE_         NVARCHAR2(64),
  PROC_DEF_ID_  NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  EXECUTION_ID_ NVARCHAR2(64),
  TASK_ID_      NVARCHAR2(64),
  TIME_STAMP_   TIMESTAMP(6) not null,
  USER_ID_      NVARCHAR2(255),
  DATA_         BLOB,
  LOCK_OWNER_   NVARCHAR2(255),
  LOCK_TIME_    TIMESTAMP(6),
  IS_PROCESSED_ NUMBER(3) default 0
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_EVT_LOG
  add primary key (LOG_NR_);

create table ACT_RE_DEPLOYMENT
(
  ID_          NVARCHAR2(64) not null,
  NAME_        NVARCHAR2(255),
  CATEGORY_    NVARCHAR2(255),
  TENANT_ID_   NVARCHAR2(255) default '',
  DEPLOY_TIME_ TIMESTAMP(6)
)
;
alter table ACT_RE_DEPLOYMENT
  add primary key (ID_);

-- Create table
create table ACT_GE_BYTEARRAY
(
  ID_            NVARCHAR2(64) not null,
  REV_           INTEGER,
  NAME_          NVARCHAR2(255),
  DEPLOYMENT_ID_ NVARCHAR2(64),
  BYTES_         BLOB,
  GENERATED_     NUMBER(1)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_GE_BYTEARRAY
  add primary key (ID_);
alter table ACT_GE_BYTEARRAY
  add constraint ACT_FK_BYTEARR_DEPL foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_);
-- Create/Recreate check constraints 
alter table ACT_GE_BYTEARRAY
  add check (GENERATED_ IN (1,0));
-- Create/Recreate indexes 
create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY (DEPLOYMENT_ID_);

create table ACT_GE_PROPERTY
(
  NAME_  NVARCHAR2(64) not null,
  VALUE_ NVARCHAR2(300),
  REV_   INTEGER
)
;
alter table ACT_GE_PROPERTY
  add primary key (NAME_);


create table ACT_HI_ACTINST
(
  ID_                NVARCHAR2(64) not null,
  PROC_DEF_ID_       NVARCHAR2(64) not null,
  PROC_INST_ID_      NVARCHAR2(64) not null,
  EXECUTION_ID_      NVARCHAR2(64) not null,
  ACT_ID_            NVARCHAR2(255) not null,
  TASK_ID_           NVARCHAR2(64),
  CALL_PROC_INST_ID_ NVARCHAR2(64),
  ACT_NAME_          NVARCHAR2(255),
  ACT_TYPE_          NVARCHAR2(255) not null,
  ASSIGNEE_          NVARCHAR2(255),
  START_TIME_        TIMESTAMP(6) not null,
  END_TIME_          TIMESTAMP(6),
  DURATION_          NUMBER(19),
  TENANT_ID_         NVARCHAR2(255) default ''
)
;
alter table ACT_HI_ACTINST
  add primary key (ID_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST (END_TIME_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST (EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST (PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST (START_TIME_);


create table ACT_HI_ATTACHMENT
(
  ID_           NVARCHAR2(64) not null,
  REV_          INTEGER,
  USER_ID_      NVARCHAR2(255),
  NAME_         NVARCHAR2(255),
  DESCRIPTION_  NVARCHAR2(2000),
  TYPE_         NVARCHAR2(255),
  TASK_ID_      NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  URL_          NVARCHAR2(2000),
  CONTENT_ID_   NVARCHAR2(64),
  TIME_         TIMESTAMP(6)
)
;
alter table ACT_HI_ATTACHMENT
  add primary key (ID_);

-- Create table
create table ACT_HI_COMMENT
(
  ID_           NVARCHAR2(64) not null,
  TYPE_         NVARCHAR2(255),
  TIME_         TIMESTAMP(6) not null,
  USER_ID_      NVARCHAR2(255),
  TASK_ID_      NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  ACTION_       NVARCHAR2(255),
  MESSAGE_      NVARCHAR2(2000),
  FULL_MSG_     BLOB
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_HI_COMMENT
  add primary key (ID_);


create table ACT_HI_DETAIL
(
  ID_           NVARCHAR2(64) not null,
  TYPE_         NVARCHAR2(255) not null,
  PROC_INST_ID_ NVARCHAR2(64),
  EXECUTION_ID_ NVARCHAR2(64),
  TASK_ID_      NVARCHAR2(64),
  ACT_INST_ID_  NVARCHAR2(64),
  NAME_         NVARCHAR2(255) not null,
  VAR_TYPE_     NVARCHAR2(64),
  REV_          INTEGER,
  TIME_         TIMESTAMP(6) not null,
  BYTEARRAY_ID_ NVARCHAR2(64),
  DOUBLE_       NUMBER(20,10),
  LONG_         NUMBER(19),
  TEXT_         NVARCHAR2(2000),
  TEXT2_        NVARCHAR2(2000)
)
;
alter table ACT_HI_DETAIL
  add primary key (ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL (ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL (NAME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL (PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL (TASK_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL (TIME_);


create table ACT_HI_IDENTITYLINK
(
  ID_           NVARCHAR2(64) not null,
  GROUP_ID_     NVARCHAR2(255),
  TYPE_         NVARCHAR2(255),
  USER_ID_      NVARCHAR2(255),
  TASK_ID_      NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64)
)
;
alter table ACT_HI_IDENTITYLINK
  add primary key (ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK (TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK (USER_ID_);


create table ACT_HI_PROCINST
(
  ID_                        NVARCHAR2(64) not null,
  PROC_INST_ID_              NVARCHAR2(64) not null,
  BUSINESS_KEY_              NVARCHAR2(255),
  PROC_DEF_ID_               NVARCHAR2(64) not null,
  START_TIME_                TIMESTAMP(6) not null,
  END_TIME_                  TIMESTAMP(6),
  DURATION_                  NUMBER(19),
  START_USER_ID_             NVARCHAR2(255),
  START_ACT_ID_              NVARCHAR2(255),
  END_ACT_ID_                NVARCHAR2(255),
  SUPER_PROCESS_INSTANCE_ID_ NVARCHAR2(64),
  DELETE_REASON_             NVARCHAR2(2000),
  TENANT_ID_                 NVARCHAR2(255) default '',
  NAME_                      NVARCHAR2(255)
)
;
alter table ACT_HI_PROCINST
  add primary key (ID_);
alter table ACT_HI_PROCINST
  add unique (PROC_INST_ID_);
create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST (END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST (BUSINESS_KEY_);


create table ACT_HI_TASKINST
(
  ID_             NVARCHAR2(64) not null,
  PROC_DEF_ID_    NVARCHAR2(64),
  TASK_DEF_KEY_   NVARCHAR2(255),
  PROC_INST_ID_   NVARCHAR2(64),
  EXECUTION_ID_   NVARCHAR2(64),
  PARENT_TASK_ID_ NVARCHAR2(64),
  NAME_           NVARCHAR2(255),
  DESCRIPTION_    NVARCHAR2(2000),
  OWNER_          NVARCHAR2(255),
  ASSIGNEE_       NVARCHAR2(255),
  START_TIME_     TIMESTAMP(6) not null,
  CLAIM_TIME_     TIMESTAMP(6),
  END_TIME_       TIMESTAMP(6),
  DURATION_       NUMBER(19),
  DELETE_REASON_  NVARCHAR2(2000),
  PRIORITY_       INTEGER,
  DUE_DATE_       TIMESTAMP(6),
  FORM_KEY_       NVARCHAR2(255),
  CATEGORY_       NVARCHAR2(255),
  TENANT_ID_      NVARCHAR2(255) default ''
)
;
alter table ACT_HI_TASKINST
  add primary key (ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST (PROC_INST_ID_);


create table ACT_HI_VARINST
(
  ID_                NVARCHAR2(64) not null,
  PROC_INST_ID_      NVARCHAR2(64),
  EXECUTION_ID_      NVARCHAR2(64),
  TASK_ID_           NVARCHAR2(64),
  NAME_              NVARCHAR2(255) not null,
  VAR_TYPE_          NVARCHAR2(100),
  REV_               INTEGER,
  BYTEARRAY_ID_      NVARCHAR2(64),
  DOUBLE_            NUMBER(20,10),
  LONG_              NUMBER(19),
  TEXT_              NVARCHAR2(2000),
  TEXT2_             NVARCHAR2(2000),
  CREATE_TIME_       TIMESTAMP(6),
  LAST_UPDATED_TIME_ TIMESTAMP(6)
)
;
alter table ACT_HI_VARINST
  add primary key (ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST (NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST (PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST (TASK_ID_);


create table ACT_ID_GROUP
(
  ID_   NVARCHAR2(64) not null,
  REV_  INTEGER,
  NAME_ NVARCHAR2(255),
  TYPE_ NVARCHAR2(255)
)
;
alter table ACT_ID_GROUP
  add primary key (ID_);

-- Create table
create table ACT_ID_INFO
(
  ID_        NVARCHAR2(64) not null,
  REV_       INTEGER,
  USER_ID_   NVARCHAR2(64),
  TYPE_      NVARCHAR2(64),
  KEY_       NVARCHAR2(255),
  VALUE_     NVARCHAR2(255),
  PASSWORD_  BLOB,
  PARENT_ID_ NVARCHAR2(255)
);
-- Create/Recreate primary, unique and foreign key constraints 
alter table ACT_ID_INFO
  add primary key (ID_);


create table ACT_ID_USER
(
  ID_         NVARCHAR2(64) not null,
  REV_        INTEGER,
  FIRST_      NVARCHAR2(255),
  LAST_       NVARCHAR2(255),
  EMAIL_      NVARCHAR2(255),
  PWD_        NVARCHAR2(255),
  PICTURE_ID_ NVARCHAR2(64)
)
;
alter table ACT_ID_USER
  add primary key (ID_);


create table ACT_ID_MEMBERSHIP
(
  USER_ID_  NVARCHAR2(64) not null,
  GROUP_ID_ NVARCHAR2(64) not null
)
;
alter table ACT_ID_MEMBERSHIP
  add primary key (USER_ID_, GROUP_ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_GROUP foreign key (GROUP_ID_)
  references ACT_ID_GROUP (ID_);
alter table ACT_ID_MEMBERSHIP
  add constraint ACT_FK_MEMB_USER foreign key (USER_ID_)
  references ACT_ID_USER (ID_);
create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP (GROUP_ID_);
create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP (USER_ID_);


create table ACT_RE_PROCDEF
(
  ID_                     NVARCHAR2(64) not null,
  REV_                    INTEGER,
  CATEGORY_               NVARCHAR2(255),
  NAME_                   NVARCHAR2(255),
  KEY_                    NVARCHAR2(255) not null,
  VERSION_                INTEGER not null,
  DEPLOYMENT_ID_          NVARCHAR2(64),
  RESOURCE_NAME_          NVARCHAR2(2000),
  DGRM_RESOURCE_NAME_     VARCHAR2(4000),
  DESCRIPTION_            NVARCHAR2(2000),
  HAS_START_FORM_KEY_     NUMBER(1),
  HAS_GRAPHICAL_NOTATION_ NUMBER(1),
  SUSPENSION_STATE_       INTEGER,
  TENANT_ID_              NVARCHAR2(255) default ''
)
;
alter table ACT_RE_PROCDEF
  add primary key (ID_);
alter table ACT_RE_PROCDEF
  add constraint ACT_UNIQ_PROCDEF unique (KEY_, VERSION_, TENANT_ID_);
alter table ACT_RE_PROCDEF
  add check (HAS_START_FORM_KEY_ IN (1,0));
alter table ACT_RE_PROCDEF
  add check (HAS_GRAPHICAL_NOTATION_ IN (1,0));


create table ACT_PROCDEF_INFO
(
  ID_           NVARCHAR2(64) not null,
  PROC_DEF_ID_  NVARCHAR2(64) not null,
  REV_          INTEGER,
  INFO_JSON_ID_ NVARCHAR2(64)
)
;
alter table ACT_PROCDEF_INFO
  add primary key (ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_UNIQ_INFO_PROCDEF unique (PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_JSON_BA foreign key (INFO_JSON_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_PROCDEF_INFO
  add constraint ACT_FK_INFO_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO (INFO_JSON_ID_);
-- create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO (PROC_DEF_ID_);





create table ACT_RE_MODEL
(
  ID_                           NVARCHAR2(64) not null,
  REV_                          INTEGER,
  NAME_                         NVARCHAR2(255),
  KEY_                          NVARCHAR2(255),
  CATEGORY_                     NVARCHAR2(255),
  CREATE_TIME_                  TIMESTAMP(6),
  LAST_UPDATE_TIME_             TIMESTAMP(6),
  VERSION_                      INTEGER,
  META_INFO_                    NVARCHAR2(2000),
  DEPLOYMENT_ID_                NVARCHAR2(64),
  EDITOR_SOURCE_VALUE_ID_       NVARCHAR2(64),
  EDITOR_SOURCE_EXTRA_VALUE_ID_ NVARCHAR2(64),
  TENANT_ID_                    NVARCHAR2(255) default ''
)
;
alter table ACT_RE_MODEL
  add primary key (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_DEPLOYMENT foreign key (DEPLOYMENT_ID_)
  references ACT_RE_DEPLOYMENT (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE foreign key (EDITOR_SOURCE_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RE_MODEL
  add constraint ACT_FK_MODEL_SOURCE_EXTRA foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_)
  references ACT_GE_BYTEARRAY (ID_);
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL (DEPLOYMENT_ID_);
create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);


create table ACT_RU_EXECUTION
(
  ID_               NVARCHAR2(64) not null,
  REV_              INTEGER,
  PROC_INST_ID_     NVARCHAR2(64),
  BUSINESS_KEY_     NVARCHAR2(255),
  PARENT_ID_        NVARCHAR2(64),
  PROC_DEF_ID_      NVARCHAR2(64),
  SUPER_EXEC_       NVARCHAR2(64),
  ACT_ID_           NVARCHAR2(255),
  IS_ACTIVE_        NUMBER(1),
  IS_CONCURRENT_    NUMBER(1),
  IS_SCOPE_         NUMBER(1),
  IS_EVENT_SCOPE_   NUMBER(1),
  SUSPENSION_STATE_ INTEGER,
  CACHED_ENT_STATE_ INTEGER,
  TENANT_ID_        NVARCHAR2(255) default '',
  NAME_             NVARCHAR2(255),
  LOCK_TIME_        TIMESTAMP(6)
)
;
alter table ACT_RU_EXECUTION
  add primary key (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PARENT foreign key (PARENT_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add constraint ACT_FK_EXE_SUPER foreign key (SUPER_EXEC_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_EXECUTION
  add check (IS_ACTIVE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_CONCURRENT_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_SCOPE_ IN (1,0));
alter table ACT_RU_EXECUTION
  add check (IS_EVENT_SCOPE_ IN (1,0));
create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION (BUSINESS_KEY_);
create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION (PARENT_ID_);
create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION (PROC_DEF_ID_);
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION (PROC_INST_ID_);
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION (SUPER_EXEC_);


create table ACT_RU_EVENT_SUBSCR
(
  ID_            NVARCHAR2(64) not null,
  REV_           INTEGER,
  EVENT_TYPE_    NVARCHAR2(255) not null,
  EVENT_NAME_    NVARCHAR2(255),
  EXECUTION_ID_  NVARCHAR2(64),
  PROC_INST_ID_  NVARCHAR2(64),
  ACTIVITY_ID_   NVARCHAR2(64),
  CONFIGURATION_ NVARCHAR2(255),
  CREATED_       TIMESTAMP(6) not null,
  PROC_DEF_ID_   NVARCHAR2(64),
  TENANT_ID_     NVARCHAR2(255) default ''
)
;
alter table ACT_RU_EVENT_SUBSCR
  add primary key (ID_);
alter table ACT_RU_EVENT_SUBSCR
  add constraint ACT_FK_EVENT_EXEC foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR (CONFIGURATION_);


create table ACT_RU_TASK
(
  ID_               NVARCHAR2(64) not null,
  REV_              INTEGER,
  EXECUTION_ID_     NVARCHAR2(64),
  PROC_INST_ID_     NVARCHAR2(64),
  PROC_DEF_ID_      NVARCHAR2(64),
  NAME_             NVARCHAR2(255),
  PARENT_TASK_ID_   NVARCHAR2(64),
  DESCRIPTION_      NVARCHAR2(2000),
  TASK_DEF_KEY_     NVARCHAR2(255),
  OWNER_            NVARCHAR2(255),
  ASSIGNEE_         NVARCHAR2(255),
  DELEGATION_       NVARCHAR2(64),
  PRIORITY_         INTEGER,
  CREATE_TIME_      TIMESTAMP(6),
  DUE_DATE_         TIMESTAMP(6),
  CATEGORY_         NVARCHAR2(255),
  SUSPENSION_STATE_ INTEGER,
  TENANT_ID_        NVARCHAR2(255) default '',
  FORM_KEY_         NVARCHAR2(255)
)
;
alter table ACT_RU_TASK
  add primary key (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK (CREATE_TIME_);
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK (EXECUTION_ID_);
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK (PROC_DEF_ID_);
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK (PROC_INST_ID_);


create table ACT_RU_IDENTITYLINK
(
  ID_           NVARCHAR2(64) not null,
  REV_          INTEGER,
  GROUP_ID_     NVARCHAR2(255),
  TYPE_         NVARCHAR2(255),
  USER_ID_      NVARCHAR2(255),
  TASK_ID_      NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  PROC_DEF_ID_  NVARCHAR2(64)
)
;
alter table ACT_RU_IDENTITYLINK
  add primary key (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_ATHRZ_PROCEDEF foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_IDL_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_IDENTITYLINK
  add constraint ACT_FK_TSKASS_TASK foreign key (TASK_ID_)
  references ACT_RU_TASK (ID_);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK (GROUP_ID_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK (USER_ID_);
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK (PROC_INST_ID_);
create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK (TASK_ID_);


create table ACT_RU_JOB
(
  ID_                  NVARCHAR2(64) not null,
  REV_                 INTEGER,
  TYPE_                NVARCHAR2(255) not null,
  LOCK_EXP_TIME_       TIMESTAMP(6),
  LOCK_OWNER_          NVARCHAR2(255),
  EXCLUSIVE_           NUMBER(1),
  EXECUTION_ID_        NVARCHAR2(64),
  PROCESS_INSTANCE_ID_ NVARCHAR2(64),
  PROC_DEF_ID_         NVARCHAR2(64),
  RETRIES_             INTEGER,
  EXCEPTION_STACK_ID_  NVARCHAR2(64),
  EXCEPTION_MSG_       NVARCHAR2(2000),
  DUEDATE_             TIMESTAMP(6),
  REPEAT_              NVARCHAR2(255),
  HANDLER_TYPE_        NVARCHAR2(255),
  HANDLER_CFG_         NVARCHAR2(2000),
  TENANT_ID_           NVARCHAR2(255) default ''
)
;
alter table ACT_RU_JOB
  add primary key (ID_);
alter table ACT_RU_JOB
  add constraint ACT_FK_JOB_EXCEPTION foreign key (EXCEPTION_STACK_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_JOB
  add check (EXCLUSIVE_ IN (1,0));
create index ACT_IDX_JOB_EXCEPTION on ACT_RU_JOB (EXCEPTION_STACK_ID_);


create table ACT_RU_VARIABLE
(
  ID_           NVARCHAR2(64) not null,
  REV_          INTEGER,
  TYPE_         NVARCHAR2(255) not null,
  NAME_         NVARCHAR2(255) not null,
  EXECUTION_ID_ NVARCHAR2(64),
  PROC_INST_ID_ NVARCHAR2(64),
  TASK_ID_      NVARCHAR2(64),
  BYTEARRAY_ID_ NVARCHAR2(64),
  DOUBLE_       NUMBER(20,10),
  LONG_         NUMBER(19),
  TEXT_         NVARCHAR2(2000),
  TEXT2_        NVARCHAR2(2000)
)
;
alter table ACT_RU_VARIABLE
  add primary key (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_BYTEARRAY foreign key (BYTEARRAY_ID_)
  references ACT_GE_BYTEARRAY (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_EXE foreign key (EXECUTION_ID_)
  references ACT_RU_EXECUTION (ID_);
alter table ACT_RU_VARIABLE
  add constraint ACT_FK_VAR_PROCINST foreign key (PROC_INST_ID_)
  references ACT_RU_EXECUTION (ID_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE (TASK_ID_);
create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE (BYTEARRAY_ID_);
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE (EXECUTION_ID_);
create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE (PROC_INST_ID_);


insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('schema.version', '5.20.0.2', 1);
insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('schema.history', 'create(5.20.0.2)', 1);
insert into ACT_GE_PROPERTY (NAME_, VALUE_, REV_)
values ('next.dbid', '1', 1);
commit;

create sequence ACT_EVT_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;


