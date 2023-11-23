/**********************************/
/* Table Name: Tag  */
/**********************************/

DROP TABLE TAG;

CREATE TABLE TAG(
		planID INT NOT NULL,
		tname VARCHAR(50),
        FOREIGN KEY (planID) REFERENCES PLAN(planID)
);

COMMENT ON TABLE TAG is '태그';
COMMENT ON COLUMN TAG.planID is '태그 번호';
COMMENT ON COLUMN TAG.tname is '태그 이름';

DROP SEQUENCE TAG_SEQ;

CREATE SEQUENCE TAG_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
  
1) 등록
--샘플 데이터 
INSERT INTO TAG(planID,tname) VALUES (1,'전통 체험');
INSERT INTO TAG(planID, tname) VALUES (2,'푸드 투어');


2)조회
SELECT * FROM TAG;

3)수정 
X

4)삭제
DELETE FROM TAG;


5)TCL
COMMIT;
