/**********************************/
/* Table Name: Activity */
/**********************************/
CREATE TABLE ACTIVITY(
		activityID INT NOT NULL,
		planID INT,
		aname VARCHAR(50) NOT NULL,
		adescription VARCHAR(300) NOT NULL,
		adte DATE NOT NULL,
        PRIMARY KEY (activityID),
        FOREIGN KEY (planID) REFERENCES PLAN(planID)
);

COMMENT ON TABLE ACTIVITY is '활동';
COMMENT ON COLUMN ACTIVITY.activityID is '활동 번호';
COMMENT ON COLUMN ACTIVITY.planID is '여행 번호';
COMMENT ON COLUMN ACTIVITY.aname is '활동 이름';
COMMENT ON COLUMN ACTIVITY.adescription is '활동 설명';
COMMENT ON COLUMN ACTIVITY.adte is '활동 기간';

DROP SEQUENCE ACTIVITY_SEQ;

CREATE SEQUENCE ACTIVITY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
  
1) 삽입
INSERT INTO ACTIVITY(activityID, planID, aname, adescription, adte)
VALUES (ACTIVITY_SEQ.NEXTVAL, 1, '해변에서 휴식', '해변에서 휴식을 즐기는 계획입니다.', SYSDATE);


2) 조회
SELECT * FROM ACTIVITY;

3) 삭제
DELETE FROM ACTIVITY
WHERE activityID = 1;