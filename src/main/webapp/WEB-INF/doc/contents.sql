/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
CREATE TABLE contents(
		contentsID                    		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		activityID                    		NUMBER(10)		 NULL ,
		guestno                       		NUMBER(10)		 NULL ,
		contents                      		VARCHAR2(200)		 NULL 
);

COMMENT ON TABLE contents is '컨텐츠';
COMMENT ON COLUMN contents.contentsID is '여행컨텐츠 번호';
COMMENT ON COLUMN contents.planID is '여행지 번호';
COMMENT ON COLUMN contents.activityID is '활동 번호';
COMMENT ON COLUMN contents.guestno is '사용자번호';
COMMENT ON COLUMN contents.contents is '여행 글 ';


ALTER TABLE contents ADD CONSTRAINT IDX_contents_PK PRIMARY KEY (contentsID);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK0 FOREIGN KEY (planID) REFERENCES plan (planID);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK1 FOREIGN KEY (activityID) REFERENCES activity (activityID);
ALTER TABLE contents ADD CONSTRAINT IDX_contents_FK2 FOREIGN KEY (guestno) REFERENCES Guest (guestno);

DROP SEQUENCE contents_seq;

CREATE SEQUENCE contents_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO contents(contentsID, planID,activityID,guestno,contents) VALUES(contents_seq.nextval, 1,1,1,'경기도 스근한 스포츠 추천'); 
INSERT INTO contents(contentsID, planID,activityID,guestno,contents) VALUES(contents_seq.nextval, 2,1,1,'하이원으로 스키 꿀팁'); 
INSERT INTO contents(contentsID, planID,activityID,guestno,contents) VALUES(contents_seq.nextval, 3,2,1,'추운날 데이트 장소');

--Read
1)모든 글
SELECT * FROM contents;

2)작성자
SELECT contentsID, planID,activityID,guestno,contents FROM contents WHERE guestno=1;

3)여행지별 출력
SELECT contentsID, planID,activityID,guestno,contents FROM contents WHERE planID=1;

4)활동별 출력
SELECT contentsID, planID,activityID,guestno,contents FROM contents WHERE activityID=1;

--Update
1)글 수정 
UPDATE contents SET content='히히' WHERE contentsID=1;

--Delete
1)글 삭제
DELETE FROM contents WHERE contentsID=1;