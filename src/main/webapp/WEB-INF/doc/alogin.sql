DROP TABLE login;

CREATE TABLE login(
  loginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  guestno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(30) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (guestno) REFERENCES guest (guestno)
);

COMMENT ON TABLE login is '로그인 내역';
COMMENT ON COLUMN login.loginno is '로그인 번호';
COMMENT ON COLUMN login.guestno is '사용자 번호';
COMMENT ON COLUMN login.ip is '접속 ip';
COMMENT ON COLUMN login.logindate is '로그인 날짜';

DROP SEQUENCE login_SEQ;

CREATE SEQUENCE login_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지



