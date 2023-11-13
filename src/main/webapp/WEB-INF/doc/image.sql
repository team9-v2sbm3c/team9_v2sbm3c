/**********************************/
/* Table Name: Image  */
/**********************************/
CREATE TABLE IMAGE(
		imageID INT NOT NULL,
		planID INT,
		idescription VARCHAR(300),
		ipath VARCHAR(50),
        PRIMARY KEY(imageID),
        FOREIGN KEY (planID) REFERENCES PLAN(planID)
);

COMMENT ON TABLE IMAGE is '이미지';
COMMENT ON COLUMN IMAGE.imageID is '이미지 번호';
COMMENT ON COLUMN IMAGE.planID is '여행 번호';
COMMENT ON COLUMN IMAGE.idescription is '설명';
COMMENT ON COLUMN IMAGE.ipath is '이미지 경로';

DROP SEQUENCE IMAGE_SEQ;

CREATE SEQUENCE IMAGE_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지