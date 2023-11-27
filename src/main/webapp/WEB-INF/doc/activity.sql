/**********************************/
/* Table Name: 활동 */
/**********************************/

DROP TABLE activity CASCADE CONSTRAINTS;

CREATE TABLE activity(
		activityID                    		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		aname                         		VARCHAR2(200)		 NULL 
);

COMMENT ON TABLE activity is '활동';
COMMENT ON COLUMN activity.activityID is '활동 번호';
COMMENT ON COLUMN activity.planID is '여행지 번호';
COMMENT ON COLUMN activity.aname is '활동 이름';

ALTER TABLE activity ADD CONSTRAINT IDX_activity_PK PRIMARY KEY (activityID);
ALTER TABLE activity ADD CONSTRAINT IDX_activity_FK0 FOREIGN KEY (planID) REFERENCES plan (planID);

DROP SEQUENCE activity_seq;

CREATE SEQUENCE activity_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO activity(activityID, planID,aname) VALUES(activity_seq.nextval,1,'문화체험'); 
INSERT INTO activity(activityID, planID,aname) VALUES(activity_seq.nextval,2,'스포츠'); 
INSERT INTO activity(activityID, planID,aname) VALUES(activity_seq.nextval,3,'문화체험'); 

--Read
SELECT activityID, planID, aname FROM activity WHERE activityID=1;

SELECT activityID, planID, aname FROM activity WHERE aname='스포츠';

SELECT * FROM activity;

--Update
UPDATE activity SET aname='스포츠' WHERE planID=1;

--Delete
DELETE FROM activity WHERE planID=1;