/**********************************/
/* Table Name: 스케쥴 */
/**********************************/
CREATE TABLE schedule(
		scheduleID                    		INTEGER(10)		 NOT NULL,
		sdescription                  		VARCHAR2(300)		 NOT NULL,
		date                          		DATE		 NOT NULL,
		sname                         		VARCHAR2(200)		 NOT NULL,
		contentsID                    		NUMBER(10)		 NULL 
);

COMMENT ON TABLE schedule is '스케쥴';
COMMENT ON COLUMN schedule.scheduleID is '스케줄 번호';
COMMENT ON COLUMN schedule.sdescription is '스케줄 설명';
COMMENT ON COLUMN schedule.date is '기간';
COMMENT ON COLUMN schedule.sname is '스케줄 명';
COMMENT ON COLUMN schedule.contentsID is '여행컨텐츠 번호';


ALTER TABLE schedule ADD CONSTRAINT IDX_schedule_PK PRIMARY KEY (scheduleID);
ALTER TABLE schedule ADD CONSTRAINT IDX_schedule_FK0 FOREIGN KEY (contentsID) REFERENCES contents (contentsID);

DROP SEQUENCE schedule_seq;

CREATE SEQUENCE schedule_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO schedule(scheduleID, sdescription, date, sname,contentsID) VALUES(schedule_seq.nextval, '서울 야간 스키',sysdate,'서울 스키',1); 

--Read
SELECT scheduleID, pname FROM plan WHERE planID=1;

SELECT * FROM schedule;

--Update
1)스케줄 설명 변경
UPDATE schedule SET sdescription='' WHERE scheduleID=1;

2)스케줄 명 변경 
UPDATE schedule SET sname='' WHERE scheduleID=1;

3)스케줄 시간 변경
UPDATE schedule SET date='' WHERE scheduleID=1;

--Delete
1)스케줄 1개 삭제
DELETE FROM schedule WHERE scheduleID=1;

2)스케줄 전체 삭제
DELETE FROM schedule WHERE contentsID=1;