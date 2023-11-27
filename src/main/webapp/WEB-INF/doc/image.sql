/**********************************/
/* Table Name: 이미지 */
/**********************************/
CREATE TABLE image (
		imageID                       		INTEGER(10)		 NOT NULL,
		contentsID                    		NUMBER(10)		 NULL ,
		description                   		VARCHAR2(300)		 NULL ,
		path                          		VARCHAR2(50)		 NULL 
);

COMMENT ON TABLE image  is '이미지';
COMMENT ON COLUMN image .imageID is '이미지 번호';
COMMENT ON COLUMN image .contentsID is '여행컨텐츠 번호';
COMMENT ON COLUMN image .description is '설명';
COMMENT ON COLUMN image .path is '이미지 경로';


ALTER TABLE image  ADD CONSTRAINT IDX_image _PK PRIMARY KEY (imageID);
ALTER TABLE image  ADD CONSTRAINT IDX_image _FK0 FOREIGN KEY (contentsID) REFERENCES contents (contentsID);

DROP SEQUENCE image_seq;

CREATE SEQUENCE image_seq
  START WITH 1         -- 시작 번호
  INCREMENT BY 1       -- 증가값
  MAXVALUE 9999999999  -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2              -- 2번은 메모리에서만 계산
  NOCYCLE;             -- 다시 1부터 생성되는 것을 방지
  
--Create
INSERT INTO image(imageID, contentsID, description, path) VALUES(image_seq.nextval, 1, 'test Image','./deploy/contents/images/..'); 

--Read
1)글에 해당하는 모든 이미지 가져오기 
SELECT imageID, contentsID, description , path FROM image WHERE contents=1;

2)모든 이미지 
SELECT * FROM image;

--Update
1)이미지 변경
UPDATE image SET path='..?' WHERE imageID=1;

--Delete
DELETE FROM image WHERE imageID=1;