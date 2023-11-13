/**********************************/
/* Table Name: Recommend  */
/**********************************/
CREATE TABLE RECOMMEND(
		recommendID INT NOT NULL,
		guestID INT NOT NULL,
		planID INT,
        PRIMARY KEY(recommendID),
        FOREIGN KEY (guestID) REFERENCES GUEST(guestID),
        FOREIGN KEY (planID) REFERENCES PLAN(planID)
);

COMMENT ON TABLE RECOMMEND is '추천';
COMMENT ON COLUMN TAG.guestID is '사용자 번호';
COMMENT ON COLUMN TAG.planID is '여행 번호';

DROP SEQUENCE RECOMMEND_SEQ;

CREATE SEQUENCE RECOMMEND_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지


