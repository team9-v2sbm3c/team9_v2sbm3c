/**********************************/
/* Table Name: Plan */
/**********************************/

DROP TABLE PLAN CASCADE CONSTRAINTS; 

CREATE TABLE PLAN(
    planID INT NOT NULL,
    pname VARCHAR(50) NOT NULL,
    pdescription VARCHAR(300) NOT NULL,
    longitude INT NOT NULL,
    latitude INT NOT NULL,
    heart INT,
    PRIMARY KEY (planID) 
);

COMMENT ON TABLE PLAN is '여행';
COMMENT ON COLUMN PLAN.planID is '여행 번호';
COMMENT ON COLUMN PLAN.pname is '여행지 이름';
COMMENT ON COLUMN PLAN.pdescription is '여행지 설명';
COMMENT ON COLUMN PLAN.longitude is '경도';
COMMENT ON COLUMN PLAN.latitude is '위도';
COMMENT ON COLUMN PLAN.heart is '좋아요';

DROP SEQUENCE PLAN_SEQ;

CREATE SEQUENCE PLAN_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

1) 등록
--sample
INSERT INTO PLAN(planID, pname, pdescription, longitude, latitude, heart)
VALUES (PLAN_SEQ.NEXTVAL, '여름 휴가', '여름 휴가를 즐기는 계획입니다.', 127, 37, 10);

INSERT INTO PLAN(planID, pname, pdescription, longitude, latitude, heart)
VALUES (PLAN_SEQ.NEXTVAL, '겨울 휴가', '겨울 휴가를 즐기는 계획입니다.', 127, 37, 0);

INSERT INTO PLAN(planID, pname, pdescription, longitude, latitude, heart)
VALUES (PLAN_SEQ.NEXTVAL, '커플들이 많이 가는 휴양지', '커플들이 오붓하게 싸고 좋게 놀 수 있는 휴양지.', 127, 47, 0);

INSERT INTO PLAN(planID, pname, pdescription, longitude, latitude, heart)
VALUES (PLAN_SEQ.NEXTVAL, '설악산 등산', '설악산 근처 맛집, 주차장 위치 , 가는 길 한번에 알려드립니다 !', 127, 37, 0);


2) 조회
SELECT * FROM PLAN;


3)수정
--여행지 수정 
UPDATE PLAN
SET pname='놀러가자고!',pdescription='오늘은 어디로 가야할까 ?',longitude=123,latitude=10
WHERE planID=1;

4)삭제 
--여행지 삭제 
DELETE FROM PLAN
WHERE planID=1;

5)TCL
COMMIT;


