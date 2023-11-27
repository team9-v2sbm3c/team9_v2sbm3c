/**********************************/
/* Table Name: 이미지 */
/**********************************/
CREATE TABLE Image (
		imageID                       		INTEGER(10)		 NOT NULL,
		contentsID                    		NUMBER(10)		 NULL ,
		description                   		VARCHAR2(300)		 NULL ,
		path                          		VARCHAR2(50)		 NULL 
);

COMMENT ON TABLE Image  is '이미지';
COMMENT ON COLUMN Image .imageID is '이미지 번호';
COMMENT ON COLUMN Image .contentsID is '여행컨텐츠 번호';
COMMENT ON COLUMN Image .description is '설명';
COMMENT ON COLUMN Image .path is '이미지 경로';


ALTER TABLE Image  ADD CONSTRAINT IDX_Image _PK PRIMARY KEY (imageID);
ALTER TABLE Image  ADD CONSTRAINT IDX_Image _FK0 FOREIGN KEY (contentsID) REFERENCES contents (contentsID);


--Create

--Read

--Update

--Delete