/**********************************/
/* Table Name: ChatBot */
/**********************************/
CREATE TABLE CHATBOT(
		chatbotID INT NOT NULL,
		guestno NUMERIC(10) NOT NULL,
		question VARCHAR(300) NOT NULL,
		answer VARCHAR(300) NOT NULL,
		talk VARCHAR(5000),
        cdate date,
        PRIMARY KEY(chatbotID),
        FOREIGN KEY (guestID) REFERENCES GUEST(guestID)
);

COMMENT ON TABLE CHATBOT is '챗봇';
COMMENT ON COLUMN CHATBOT.chatbotID is '사용자 번호';
COMMENT ON COLUMN CHATBOT.question is '질문';
COMMENT ON COLUMN CHATBOT.answer is '응답';
COMMENT ON COLUMN CHATBOT.talk is '전체 질의응답';
COMMENT ON COLUMN CHATBOT.cdate is '등록일';

DROP SEQUENCE CHATBOT_SEQ;

CREATE SEQUENCE CHATBOT_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
  
1) 등록

INSERT INTO chatbot(chatbotID, guestno, record, cdate)
VALUES (chatbot_seq.nextval, 1, '안녕 반가워', sysdate);

2) 목록
- 검색을 하지 않는 경우, 전체 목록 출력
 
SELECT chatbotID, guestno, record, cdate
FROM chatbot
ORDER BY guestno ASC, guestno ASC;
     
     
3. 조회
 
SELECT chatbotID, guestno, record, cdate
FROM chatbot
WHERE guestno = 1;

    
4. 수정
UPDATE chatbot 
SET record='국내 여행 추천해드릴까요?'
WHERE guestno=1;

COMMIT;

5. 삭제
1) 모두 삭제
DELETE FROM chatbot;
 
2) 특정 챗봇 삭제
DELETE FROM chatbot
WHERE chatbotID=1;

2) 특정 챗봇 삭제
DELETE FROM chatbot
WHERE chatbotID=1;


COMMIT;