/**********************************/
/* Table Name: Guest */
/**********************************/
DROP TABLE GUEST;

CREATE TABLE GUEST(
        guestno NUMBER(10) NOT NULL,
		id VARCHAR(30) NOT NULL UNIQUE,
		passwd VARCHAR(60) NOT NULL,
		gname VARCHAR(40) NOT NULL,
		gemail VARCHAR(100) NOT NULL,
        gdate date NOT NULL,
        grade NUMBER(2) NOT NULL,
        PRIMARY KEY(guestno)
);

COMMENT ON TABLE GUEST is '사용자';
COMMENT ON COLUMN GUEST.guestno is '사용자번호';
COMMENT ON COLUMN GUEST.id is '아이디';
COMMENT ON COLUMN GUEST.passwd is '비밀번호';
COMMENT ON COLUMN GUEST.gname is '이름';
COMMENT ON COLUMN GUEST.gemail is '이메일';
COMMENT ON COLUMN GUEST.gdate is '가입일';
COMMENT ON COLUMN GUEST.grade is '등급';

DROP SEQUENCE GUEST_SEQ;

CREATE SEQUENCE GUEST_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지


1. 등록

1) id 중복 확인(null 값을 가지고 있으면 count에서 제외됨)
SELECT COUNT(id)
FROM guest
WHERE id='kd123';

SELECT COUNT(id) as cnt
FROM guest
WHERE id='kd123';

 cnt
 ---
   0   ← 중복 되지 않음.

2) 등록
-- 회원 관리용 계정, Q/A 용 계정
INSERT INTO GUEST(guestno, id, passwd, gname, gemail, gdate, grade)
VALUES (guest_seq.nextval, 'kdqna', '1234', '질문답변용', 'kd@naver.com', sysdate, 1);

-- 개인 회원 테스트 계정
INSERT INTO GUEST(guestno, id, passwd, gname, gemail, gdate, grade)
VALUES (guest_seq.nextval, 'kd123', '1234', '민철', 'kd@gmail.com', sysdate, 1);

COMMIT;

-- 목록 

SELECT guestno, id, passwd, gname, gemail, gdate ,grade
FROM guest
ORDER BY id ASC;
2. 조회
 
1) 정보 조회
SELECT guestno, id, passwd, gname, gemail, gdate, grade
FROM guest
WHERE guestno = 1;

SELECT guestno, id, passwd, gname, gemail, grade
FROM guest
WHERE guestID = 'kd@gmail.com';

3. 수정
UPDATE guest 
SET id='kd1234', gname='김민철', gemail='kd1@gmail.com' , grade =2
WHERE guestno=1;

COMMIT;

4. 삭제
1) 모두 삭제
DELETE FROM guest;
 
2) 특정 회원 삭제
DELETE FROM guest
WHERE guestno=5;

5.로그인
SELECT COUNT(*) as cnt
FROM guest
WHERE id='kd123' AND passwd='1234';

COMMIT;

   
6. 패스워드 변경

1) 패스워드 검사
SELECT COUNT(guestno) as cnt
FROM guest
WHERE guestno=1 AND passwd='1234';
 
2) 패스워드 수정
UPDATE guest
SET passwd='0000'
WHERE guestno=1;

COMMIT;

ALTER TABLE guest
MODIFY grade NULL;

ALTER TABLE guest
MODIFY passwd NOT NULL;