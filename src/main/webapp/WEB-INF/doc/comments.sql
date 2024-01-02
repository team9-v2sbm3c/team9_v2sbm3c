/**********************************/
/* Table Name: 댓글 */
/**********************************/
CREATE TABLE comments(
		commentsID                    		NUMBER(10)		 NOT NULL,
		communityID                   		NUMBER(10)		 NULL ,
		guestno                       		NUMBER(10)		 NULL ,
		comments                            VARCHAR2(500) DEFAULT ' ' NULL,
		comments_date                         		DATE		 NULL 
);

COMMENT ON TABLE comments is '댓글';
COMMENT ON COLUMN comments.commentsID is '댓글 번호';
COMMENT ON COLUMN comments.communityID is '게시글번호';
COMMENT ON COLUMN comments.guestno is '사용자번호';
COMMENT ON COLUMN comments.comments is '댓글';
COMMENT ON COLUMN comments.comments_date is '댓글 등록일';


ALTER TABLE comments ADD CONSTRAINT IDX_comments_PK PRIMARY KEY (commentsID);
ALTER TABLE comments ADD CONSTRAINT IDX_comments_FK0 FOREIGN KEY (guestno) REFERENCES Guest (guestno);
ALTER TABLE comments ADD CONSTRAINT IDX_comments_FK1 FOREIGN KEY (communityID) REFERENCES community (communityID);

DROP SEQUENCE comments_seq;

CREATE SEQUENCE comments_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지
  
--Create
1) 사용자가 쓴 댓글 
INSERT INTO comments(commentsID, communityID, guestno, comments,comments_date) VALUES(comments_seq.nextval, 1,1,'재미있었당~',sysdate);
INSERT INTO comments(commentsID, communityID, guestno, comments,comments_date) VALUES(comments_seq.nextval, 11,1,'이것은 AJAX 여~',sysdate);

--Read
1) 사용자가 쓴 댓글 확인 
SELECT communityID,commentsID,comments,comments_date FROM comments WHERE guestno=1;

--Update
1) 사용자가 쓴 댓글 수정 
Update comments SET comments='힝구리퐁퐁' WHERE commentsID=1;

--DELETE
1)사용자가 쓴 댓글 삭제 
DELETE FROM comments WHERE commentsID=1;

2)community 에 해당하는 댓글 수 확인 및 삭제
SELECT COUNT(*) as cnt
FROM comments
WHERE communityID=1;

3)회원에 해당하는 댓글 수 확인 및 삭제 
SELECT COUNT(*) as cnt
FROM comments
WHERE guestno=1;

4)NULL 삭제
DELETE FROM comments WHERE comments is null;
--DLC
commit ;