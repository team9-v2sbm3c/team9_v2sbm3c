/**********************************/
/* Table Name: Tag  */
/**********************************/
CREATE TABLE TAG(
		tagID INT NOT NULL,
		tname VARCHAR(50),
        PRIMARY KEY(tagID)
);

COMMENT ON TABLE TAG is '태그';
COMMENT ON COLUMN TAG.tagID is '태그 번호';
COMMENT ON COLUMN TAG.tname is '태그 이름';

DROP SEQUENCE TAG_SEQ;

CREATE SEQUENCE TAG_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지