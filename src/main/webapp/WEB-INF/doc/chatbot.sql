/**********************************/
/* Table Name: ChatBot */
/**********************************/
CREATE TABLE CHATBOT(
		chatbotID INT NOT NULL,
		guestID INT,
		question VARCHAR(300) NOT NULL,
		answer VARCHAR(300) NOT NULL,
		talk VARCHAR(5000),
        PRIMARY KEY(chatbotID),
        FOREIGN KEY (guestID) REFERENCES GUEST(guestID)
);

COMMENT ON TABLE CHATBOT is '챗봇';
COMMENT ON COLUMN CHATBOT.chatbotID is '사용자 번호';
COMMENT ON COLUMN CHATBOT.question is '질문';
COMMENT ON COLUMN CHATBOT.answer is '응답';
COMMENT ON COLUMN CHATBOT.talk is '전체 질의응답';

DROP SEQUENCE CHATBOT_SEQ;

CREATE SEQUENCE CHATBOT_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지
