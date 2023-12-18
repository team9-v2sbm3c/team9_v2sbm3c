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
		map                           		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
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

ALTER TABLE community
MODIFY map VARCHAR2(1000);

ALTER TABLE community
MODIFY youtube VARCHAR2(1000);

DROP SEQUENCE COMMUNITY_SEQ;

CREATE SEQUENCE COMMUNITY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

--Create
INSERT INTO community 
VALUES (community_seq.nextval, 1, 2, 1, 'Sample Title 1', 'Sample Content 1', 'image1.jpg', 'preview_image1.jpg', 'community_image1.jpg', 500, 'Sample Map 1', 'https://www.youtube.com/sample1', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 5);

-- 두 번째 데이터
INSERT INTO community 
VALUES (community_seq.nextval, 2, 1, 2, 'Sample Title 2', 'Sample Content 2', 'image2.jpg', 'preview_image2.jpg', 'community_image2.jpg', 600, 'Sample Map 2', 'https://www.youtube.com/sample2', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 8);

-- 세 번째 데이터
INSERT INTO community 
VALUES (community_seq.nextval, 3, 1, 3, 'Sample Title 4', 'Sample Content 4', 'image3.jpg', 'preview_image3.jpg', 'community_image3.jpg', 700, 'Sample Map 3', 'https://www.youtube.com/sample3', TO_DATE('2023-01-03', 'YYYY-MM-DD'), 10);
--Read
SELECT communityID, guestno, content, mainImage, cdate
FROM community
WHERE planID = 1;

--seach
SELECT * FROM community
ORDER BY cdate DESC;

SELECT COUNT(*)
FROM community
WHERE planID=1;

SELECT * FROM community
WHERE planID = 3 AND LOWER(content) LIKE '%스키%';

SELECT COUNT(*)
FROM community
WHERE planID = 3 AND LOWER(content) LIKE '%스키%';

SELECT *
FROM community
WHERE planID = 1
ORDER BY communityID DESC;

--Update

--Delete
DELETE FROM community
WHERE communityID = 2;

--DCL
commit;

--paging
SELECT communityID, guestno, activecodeno , planID, title, content, mainImage, mainImagePreview, cimage, size1, map, youtube, cdate, replycnt
FROM (
    SELECT communityID, guestno, activecodeno , planID, title, content, mainImage, mainImagePreview, cimage, size1, map, youtube, cdate, replycnt, rownum as r
    FROM (
        SELECT communityID, guestno, activecodeno , planID, title, content, mainImage, mainImagePreview, cimage, size1, map, youtube, cdate, replycnt
        FROM community
        ORDER BY communityID DESC
    )
)
WHERE r >= 1 AND r <= 3;


