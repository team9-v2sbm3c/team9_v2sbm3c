/**********************************/
/* Table Name: Owner */
/**********************************/
DROP TABLE OWNER;

CREATE TABLE OWNER(
		ownerno                       		NUMBER(10)		 NOT NULL,
		id                       		VARCHAR2(20)		 NOT NULL UNIQUE,
		passwd                     		VARCHAR2(15)		 NOT NULL,
		mname                         		VARCHAR2(25)		 NOT NULL,
		mdate                          		DATE		 NOT NULL,
		grade                         		NUMBER(5)		 NOT NULL,
        PRIMARY KEY(ownerno)
);


COMMENT ON TABLE Owner is '관리자';
COMMENT ON COLUMN Owner.ownerno is '관리자번호';
COMMENT ON COLUMN Owner.id is '관리자아이디';
COMMENT ON COLUMN Owner.passwd is '비밀번호';
COMMENT ON COLUMN Owner.mname is '이름';
COMMENT ON COLUMN Owner.mdate is '가입일';
COMMENT ON COLUMN Owner.grade is '등급';

DROP SEQUENCE OWNER_SEQ;

CREATE SEQUENCE OWNER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

INSERT INTO owner(ownerno, id, passwd, mname, mdate, grade)
VALUES(owner_seq.nextval, 'owner', '1234', '관리자1', sysdate, 1);

commit;

SELECT ownerno, id, passwd, mname, mdate, grade
FROM owner
WHERE ownerno=1;

SELECT COUNT(*) as cnt
FROM owner
WHERE id='owner' AND passwd='1234'; 

-- DELETE
DELETE FROM owner WHERE ownerno=4;
