/**********************************/
/* Table Name: 활동 추천 */
/**********************************/
drop table recommend;

CREATE TABLE recommend (
		recommendID                   		NUMBER(10)		 NOT NULL,
		guestno                       		NUMBER(10)		 NULL ,
		activecodeno                  		NUMBER(10)		 NULL ,
        seq                                 NUMBER(2)         DEFAULT 1         NOT NULL,
		rdate                         		DATE		 NULL 
);

COMMENT ON TABLE recommend  is '활동 추천';
COMMENT ON COLUMN recommend .recommendID is '추천번호';
COMMENT ON COLUMN recommend .guestno is '사용자번호';
COMMENT ON COLUMN recommend .activecodeno is '활동종류 번호';
COMMENT ON COLUMN recommend.seq is '추천 우선순위';
COMMENT ON COLUMN recommend .rdate is '추천 등록일';


ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_PK PRIMARY KEY (recommendID);
ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_FK0 FOREIGN KEY (guestno) REFERENCES Guest (guestno);
ALTER TABLE recommend  ADD CONSTRAINT IDX_recommend_FK1 FOREIGN KEY (activecodeno) REFERENCES activecode (activecodeno);

DROP SEQUENCE recommend_seq;

CREATE SEQUENCE recommend_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지

--sample
INSERT INTO activecode (recommendID, guestno, activecodeno,seq, rdate) VALUES (recommend_seq.nextval, 1, 1,1, sysdate);

commit;

--Read
SELECT recommendID, guestno , activecodeno , seq , rdate FROM recommend ORDER BY rdate ASC;

SELECT recommendID, guestno , activecodeno , seq , rdate FROM recommend WHERE guestno = 1;

SELECT r.recommendID, r.guestno, r.activecodeno, r.seq, r.rdate, g.gname
FROM recommend r
INNER JOIN GUEST g ON r.guestno = g.guestno
ORDER BY r.rdate ASC;

--Delete
DELETE FROM recommend WHERE guestno=1;

