-- 테이블 삭제 --
DROP TABLE USER_TB;
DROP TABLE ANIMAL_TB;
DROP TABLE BOOKING_TB;
DROP TABLE FACILITY_TB;
DROP TABLE DONATION_TB;
DROP TABLE BOARD_TB;
DROP TABLE MISSING_ANIMAL_TB;

-- 테이블 생성 -- 
CREATE TABLE USER_TB(
  USER_NUM              NUMBER         PRIMARY KEY,
  USER_TYPE             VARCHAR2(10)   NOT NULL,
  ID                    VARCHAR2(20)   NOT NULL UNIQUE,
  PW                    NVARCHAR2(200) NOT NULL,
  NAME                  NVARCHAR2(100) NOT NULL,
  NICKNAME              NVARCHAR2(30)  NOT NULL UNIQUE,
  BIRTHDAY              DATE,
  EMAIL                 VARCHAR2(50),
  PHONE                 VARCHAR2(20)   NOT NULL,
  TEL                   VARCHAR2(20),
  POST_NUM              VARCHAR2(10)   NOT NULL,
  ADDRESS               NVARCHAR2(300) NOT NULL,
  SIGNUP_DATE           DATE,
  BUSI_NUM              NVARCHAR2(50),
  PROFILE_FILENAME      NVARCHAR2(100),
  SHELTER_DES_FILENAME  NVARCHAR2(100),
  QUES1                 NVARCHAR2(100)  NOT NULL,
  QUES2                 NVARCHAR2(100)  NOT NULL,
  QUES3                 NVARCHAR2(100)  NOT NULL
);

CREATE TABLE ANIMAL_TB(
  ANIMAL_NUM          NUMBER         PRIMARY KEY,
  SHELTER_NUM         NUMBER         REFERENCES USER_TB(USER_NUM) ON DELETE SET NULL,
  NAME                NVARCHAR2(50)  NOT NULL,
  AGE                 NUMBER         NOT NULL,
  SPECIES             VARCHAR2(10)   NOT NULL,
  BREED               NVARCHAR2(50),
  GENDER              VARCHAR2(10),
  NEUTRALIZATION      VARCHAR2(10),
  VACCINATION         VARCHAR2(10),
  ENTER_DATE          DATE           NOT NULL,
  PROTECT_END_DATE    DATE           NOT NULL,
  ADOPT_STEP          VARCHAR2(10),
  PROFILE_FILENAME    NVARCHAR2(100)
);

CREATE TABLE BOOKING_TB(
  BOOKING_NUM  NUMBER PRIMARY KEY,
  BOOKER_NUM   NUMBER REFERENCES USER_TB(USER_NUM) ON DELETE SET NULL,
  SHELTER_NUM  NUMBER REFERENCES USER_TB(USER_NUM) ON DELETE SET NULL,
  ANIMAL_NUM   NUMBER REFERENCES ANIMAL_TB(ANIMAL_NUM) ON DELETE SET NULL,
  BOOKING_DATE DATE   NOT NULL
);

CREATE TABLE FACILITY_TB(
  FAC_NUM           NUMBER PRIMARY KEY,
  FAC_TYPE          VARCHAR2(10),
  NAME              NVARCHAR2(100),
  OFFICE_HOURS      NVARCHAR2(100),
  ADDRESS           NVARCHAR2(300),
  HOMEPAGE          NVARCHAR2(100),
  TEL               VARCHAR2(20),
  RATING            NUMBER,
  INSTA             NVARCHAR2(100),
  KAKAO             NVARCHAR2(100),
  TREAT_SPECIES     VARCHAR2(50),
  ALLDAY            VARCHAR2(10),
  EMERGENCY         VARCHAR2(10),
  AMBULANCE         VARCHAR2(10),
  HOTEL_BIG_PRICE   NUMBER,
  HOTEL_MID_PRICE   NUMBER,
  HOTEL_SMALL_PRICE NUMBER,
  PG_SCALE             VARCHAR2(10),
  Holiday              VARCHAR2(20),
  PG_BIG_POSSIBLE      VARCHAR2(10),
  FEST_STATUS          VARCHAR2(10),
  FEST_START_DATE      DATE,
  FEST_END_DATE        DATE
);

CREATE TABLE BOARD_TB(
  BOARD_NUM            NUMBER          PRIMARY KEY,
  WRITER_NUM           NUMBER          REFERENCES USER_TB(USER_NUM) ON DELETE SET NULL,
  BOARD_TYPE           VARCHAR2(10)    NOT NULL,
  TITLE                NVARCHAR2(100)  NOT NULL,
  REG_DATE             DATE            NOT NULL,
  READ_CNT             NUMBER          NOT NULL,
  CONTENT              NVARCHAR2(1000) NOT NULL,
  GRP                  NUMBER          NOT NULL,
  GRP_LEVEL            NUMBER          NOT NULL,
  GRP_STEP             NUMBER          NOT NULL,
  PHOTO_FILENAME       NVARCHAR2(100),
  VIDEO_FILENAME       NVARCHAR2(100),
  ETC_FILENAME         NVARCHAR2(100)  
);

CREATE TABLE DONATION_TB(
  DONA_NUM         NUMBER         PRIMARY KEY,
  DONOR_NUM        NUMBER         REFERENCES USER_TB(USER_NUM) ON DELETE SET NULL,
  DONOR_TYPE       VARCHAR2(10)   NOT NULL,
  DONOR_NAME       NVARCHAR2(100) NOT NULL,
  DONOR_EMAIL      NVARCHAR2(50)  NOT NULL,
  DONOR_TEL        VARCHAR2(20)   NOT NULL,
  DONA_AMOUNT      NUMBER         NOT NULL,
  DONA_TYPE        VARCHAR2(10)   NOT NULL,
  PAY_METHOD       VARCHAR2(10)   NOT NULL,
  BANK_NAME        NVARCHAR2(50),
  ACCOUNT_NUM      VARCHAR2(50),
  DEPOSITOR_NAME   NVARCHAR2(100),
  WITH_DATE        DATE,
  DEDUCT_TYPE      VARCHAR2(10),
  DEDUCT_NUM       VARCHAR2(50),
  CARD_NAME        NVARCHAR2(50),
  CARD_NUM         VARCHAR2(50),
  EXP_DATE         DATE,
  CARD_OWNER       NVARCHAR2(100),
  BIRTHDAY         DATE,
  CARD_REGPAY_DATE NUMBER,
  CARD_PAY_DATE    DATE,
  INSTALLMENT      VARCHAR(10)
);

CREATE TABLE MISSING_ANIMAL_TB(
  MISSING_ANIMAL_NUM   NUMBER PRIMARY KEY,
  WRITER_NUM           NUMBER REFERENCES USER_TB(USER_NUM),
  STATUS               VARCHAR2(10) NOT NULL,
  SPECIES              VARCHAR2(10),
  BREED                NVARCHAR2(50),
  GENDER               VARCHAR2(10),
  LOCATION             NVARCHAR2(50) NOT NULL,
  REG_DATE             DATE,
  DESCRIPTION          VARCHAR2(500),
  PHOTO_FILENAME       NVARCHAR2(100)
);
