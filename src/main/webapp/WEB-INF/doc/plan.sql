/**********************************/
/* Table Name: Plan */
/**********************************/

DROP TABLE PLAN CASCADE CONSTRAINTS; 

CREATE TABLE PLAN(
    planID INT NOT NULL,
    pname VARCHAR(50) NOT NULL,
    pdescription VARCHAR(300) NOT NULL,
    longitude INT NOT NULL,
    latitude INT NOT NULL,
    heart INT,
    PRIMARY KEY (planID) 
);

COMMENT ON TABLE PLAN is '여행';
COMMENT ON COLUMN PLAN.planID is '여행 번호';
COMMENT ON COLUMN PLAN.pname is '여행지 이름';
COMMENT ON COLUMN PLAN.pdescription is '여행지 설명';
COMMENT ON COLUMN PLAN.longitude is '경도';
COMMENT ON COLUMN PLAN.latitude is '위도';
COMMENT ON COLUMN PLAN.heart is '좋아요';

DROP SEQUENCE PLAN_SEQ;

CREATE SEQUENCE PLAN_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지






  








