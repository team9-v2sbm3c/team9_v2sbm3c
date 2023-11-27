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

--Create

--Read

--Update

--Delete