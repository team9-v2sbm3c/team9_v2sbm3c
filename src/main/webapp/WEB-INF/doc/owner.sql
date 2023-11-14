/**********************************/
/* Table Name: Owner */
/**********************************/
CREATE TABLE OWNER(
		ownerID INT NOT NULL,
		opassword INT,
		oname VARCHAR(25),
		oemail VARCHAR(10),
        PRIMARY KEY(ownerID)
);


COMMENT ON TABLE OWNER is '관리자';
COMMENT ON COLUMN OWNER.ownerID is '관리자 번호';
COMMENT ON COLUMN OWNER.opassword is '비밀번호';
COMMENT ON COLUMN OWNER.oname is '이름';
COMMENT ON COLUMN OWNER.oemail is '이메일';

DROP SEQUENCE OWNER_SEQ;

CREATE SEQUENCE OWNER_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

