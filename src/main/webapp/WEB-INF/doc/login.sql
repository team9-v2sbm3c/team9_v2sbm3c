DROP TABLE glogin;

CREATE TABLE glogin(
  gloginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  guestno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(30) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (guestno) REFERENCES guest (guestno)
);

COMMENT ON TABLE glogin is '로그인 내역';
COMMENT ON COLUMN glogin.gloginno is '로그인 번호';
COMMENT ON COLUMN glogin.guestno is '사용자 번호';
COMMENT ON COLUMN glogin.ip is '접속 ip';
COMMENT ON COLUMN glogin.logindate is '로그인 날짜';

