/**********************************/
/* Table Name: Itinerary  */
/**********************************/
CREATE TABLE ITRINERARY(
		itineraryID INT NOT NULL,
		planID INT,
		activityID INT,
		iname VARCHAR(50) NOT NULL,
		idate DATE NOT NULL,
		memo VARCHAR(100),
        PRIMARY KEY (itineraryID),
        FOREIGN KEY (planID) REFERENCES PLAN(planID),
        FOREIGN KEY (activityID) REFERENCES ACTIVITY(activityID)
);

COMMENT ON TABLE ITRINERARY is '일정';
COMMENT ON COLUMN ITRINERARY.itineraryID is '일정 번호';
COMMENT ON COLUMN ITRINERARY.planID is '여행 번호';
COMMENT ON COLUMN ITRINERARY.activityID is '활동 번호';
COMMENT ON COLUMN ITRINERARY.iname is '일정 이름';
COMMENT ON COLUMN ITRINERARY.idate is '일자';
COMMENT ON COLUMN ITRINERARY.memo is '메모';

DROP SEQUENCE ITRINERARY_SEQ;

CREATE SEQUENCE ITRINERARY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지