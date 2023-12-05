/**********************************/
/* Table Name: 추천 */
/**********************************/
drop table recommend;

CREATE TABLE recommend (
		recommendID                   		NUMBER(10)		 NOT NULL,
		guestno                       		NUMBER(10)		 NULL ,
		activityID                    		NUMBER(10)		 NULL ,
		rdate                         		DATE		 NULL 
);

COMMENT ON TABLE recommend  is '추천';
COMMENT ON COLUMN recommend .recommendID is '추천번호';
COMMENT ON COLUMN recommend .guestno is '사용자번호';
COMMENT ON COLUMN recommend .activityID is '활동 번호';
COMMENT ON COLUMN recommend .rdate is '추천 등록일';


ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_PK PRIMARY KEY (recommendID);
ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_FK0 FOREIGN KEY (guestno) REFERENCES Guest (guestno);
ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_FK1 FOREIGN KEY (activityID) REFERENCES activity (activityID);

DROP SEQUENCE recommend_seq;

CREATE SEQUENCE recommend_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지
