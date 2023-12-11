/**********************************/
/* Table Name: 활동종류 */
/**********************************/
drop table activity;

CREATE TABLE activecode(
		activecodeno                  		NUMBER(10)		 NOT NULL,
		aname                         		VARCHAR2(50)		 NOT NULL
);

COMMENT ON TABLE activecode is '활동종류';
COMMENT ON COLUMN activecode.activecodeno is '활동종류 번호';
COMMENT ON COLUMN activecode.aname is '이름';


ALTER TABLE activecode ADD CONSTRAINT IDX_activecode_PK PRIMARY KEY (activecodeno);

--Create
INSERT INTO activecode (activecodeno, aname) VALUES (0, '문화체험');
INSERT INTO activecode (activecodeno, aname) VALUES (1, '자연감상');
INSERT INTO activecode (activecodeno, aname) VALUES (2, '활동과 스포츠');
INSERT INTO activecode (activecodeno, aname) VALUES (3, '역사 탐방');
INSERT INTO activecode (activecodeno, aname) VALUES (4, '쇼핑');
INSERT INTO activecode (activecodeno, aname) VALUES (5, '맛집 탐방');
INSERT INTO activecode (activecodeno, aname) VALUES (6, '휴양과 휴식');

--Read
SELECT * FROM activecode;

--Update
UPDATE activecode SET aname='스포츠' WHERE activecodeno=1;

--Delete
DELETE FROM activecode WHERE activecodeno=1;