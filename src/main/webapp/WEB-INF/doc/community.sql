/**********************************/
/* Table Name: 컨텐츠 */
/**********************************/
DROP TABLE community;

CREATE TABLE community(
		communityID                   		NUMBER(10)		 NOT NULL,
		activecodeno                  		NUMBER(10)		 NULL ,
		guestno                       		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		title                         		VARCHAR2(200)		 NULL ,
		content                       		CLOB		 NULL ,
		mainImage                     		VARCHAR2(100)		 NULL ,
		mainImagePreview              		VARCHAR2(500)		 NULL ,
		cimage                        		VARCHAR2(200)		 NULL ,
		size1                         		NUMBER(10)		 NULL ,
		map                           		VARCHAR2(500)		 NULL ,
		youtube                       		VARCHAR2(500)		 NULL ,
		cdate                         		DATE		 NULL ,
		replycnt                      		NUMBER(7)		 NULL 
);

COMMENT ON TABLE community is '컨텐츠';
COMMENT ON COLUMN community.communityID is '게시글번호';
COMMENT ON COLUMN community.activecodeno is '활동코드 번호';
COMMENT ON COLUMN community.guestno is '사용자번호';
COMMENT ON COLUMN community.planID is '여행지 번호';
COMMENT ON COLUMN community.title is '제목';
COMMENT ON COLUMN community.content  is '글';
COMMENT ON COLUMN community.mainImage is '메인이미지';
COMMENT ON COLUMN community.mainImagePreview is '메인이미지 프리뷰';
COMMENT ON COLUMN community.cimage is '커뮤니티 이미지';
COMMENT ON COLUMN community.size1 is '이미지 사이즈';
COMMENT ON COLUMN community.map is '지도';
COMMENT ON COLUMN community.youtube is '유튜브';
COMMENT ON COLUMN community.cdate is '작성일자';
COMMENT ON COLUMN community.replycnt is '댓글 수';


ALTER TABLE community ADD CONSTRAINT IDX_community_PK PRIMARY KEY (communityID);
ALTER TABLE community ADD CONSTRAINT IDX_community_FK0 FOREIGN KEY (guestno) REFERENCES Guest (guestno);
ALTER TABLE community ADD CONSTRAINT IDX_community_FK1 FOREIGN KEY (activecodeno) REFERENCES activecode (activecodeno);
ALTER TABLE community ADD CONSTRAINT IDX_community_FK2 FOREIGN KEY (planID) REFERENCES plan (planID);


DROP SEQUENCE COMMUNITY_SEQ;

CREATE SEQUENCE COMMUNITY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO community 
VALUES (COMMUNITY_SEQ.nextval, 1, 1, 1, 'Sample content', 'image.jpg', 'preview_image.jpg', 'community_image.jpg', 500, 'Sample map', 'https://www.youtube.com/sample', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 10);
INSERT INTO community 
VALUES (COMMUNITY_SEQ.nextval, 1, 1, 1, 'Another content', 'image2.jpg', 'preview_image2.jpg', 'community_image2.jpg', 600, 'Another map', 'https://www.youtube.com/another', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 15);
INSERT INTO community 
VALUES (COMMUNITY_SEQ.nextval, 1, 1, 1, 'Yet another content', 'image3.jpg', 'preview_image3.jpg', 'community_image3.jpg', 700, 'Yet another map', 'https://www.youtube.com/yetanother', TO_DATE('2023-01-03', 'YYYY-MM-DD'), 20);
INSERT INTO community 
VALUES (COMMUNITY_SEQ.nextval, 1, 1, 1, 'Fourth content', 'image4.jpg', 'preview_image4.jpg', 'community_image4.jpg', 800, 'Fourth map', 'https://www.youtube.com/fourth', TO_DATE('2023-01-04', 'YYYY-MM-DD'), 25);

--Read
SELECT communityID, guestno, content, mainImage, cdate
FROM community
WHERE planID = 1;

--seach
SELECT communityID, guestno, planID, title, content, cnt, replycnt, rdate, file1, file1saved, thumb1, size1
FROM community
ORDER BY communityID DESC;

SELECT COUNT(*)
FROM community
WHERE planID=1;

SELECT * FROM community
WHERE planID = 3 AND LOWER(content) LIKE '%스키%';

SELECT COUNT(*)
FROM community
WHERE planID = 3 AND LOWER(content) LIKE '%스키%';

--Update

--Delete
DELETE FROM community
WHERE communityID = 2;

