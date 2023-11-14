/**********************************/
/* Table Name: Guest */
/**********************************/
CREATE TABLE GUEST(
		guestID INT NOT NULL,
		gpassword INT,
		gname VARCHAR(25),
		gemail VARCHAR(10),
        PRIMARY KEY(guestID)
);

COMMENT ON TABLE GUEST is '사용자';
COMMENT ON COLUMN GUEST.guestID is '사용자 번호';
COMMENT ON COLUMN GUEST.gpassword is '비밀번호';
COMMENT ON COLUMN GUEST.gname is '이름';
COMMENT ON COLUMN GUEST.gemail is '이메일';

DROP SEQUENCE GUEST_SEQ;

CREATE SEQUENCE GUEST_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

