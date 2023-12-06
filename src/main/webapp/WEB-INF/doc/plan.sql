/**********************************/
/* Table Name: 여행지 */
/**********************************/
drop table plan CASCADE CONSTRAINTS;

CREATE TABLE plan(
		planID                        		NUMBER(10)		 NOT NULL,
		pname                         		VARCHAR2(50)		 NULL ,
		planCnt                       		NUMBER(10)		 NULL ,
		pdate                         		DATE		 NULL 
);

COMMENT ON TABLE plan is '여행지';
COMMENT ON COLUMN plan.planID is '여행지 번호';
COMMENT ON COLUMN plan.pname is '여행지 이름';
COMMENT ON COLUMN plan.planCnt is '여행지 자료수';
COMMENT ON COLUMN plan.pdate is '여행지 등록일';


ALTER TABLE plan ADD CONSTRAINT IDX_plan_PK PRIMARY KEY (planID);



DROP SEQUENCE plan_seq;

CREATE SEQUENCE plan_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO plan(planID, pname, planCnt, pdate) VALUES(plan_seq.nextval, '서울',0,sysdate); 
INSERT INTO plan(planID, pname, planCnt, pdate) VALUES(plan_seq.nextval, '경기도',0,sysdate); 
INSERT INTO plan(planID, pname, planCnt, pdate) VALUES(plan_seq.nextval, '부산',0,sysdate);

--Read
SELECT planID, pname FROM plan WHERE planID=1;

SELECT * FROM plan;

--Update
UPDATE plan SET planID=1 WHERE planID=4;

--Delete
DELETE FROM plan WHERE planID=1;

--DCL
commit ; 