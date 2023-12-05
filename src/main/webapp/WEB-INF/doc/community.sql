/**********************************/
/* Table Name: Community */
/**********************************/
CREATE TABLE COMMUNITY(
		communityID INT NOT NULL,
		guestno NUMERIC(10) NOT NULL,
		contents VARCHAR(1000),
		mainImage VARCHAR(100),
		mainImagePreview VARCHAR(500),
		cimage VARCHAR(200),
		map VARCHAR(500),
		youtube VARCHAR(500),
		date DATE,
        PRIMARY KEY(communityID),
        FOREIGN KEY (guestID) REFERENCES GUEST(guestID)
);

COMMENT ON TABLE COMMUNITY is '사용자';
COMMENT ON COLUMN COMMUNITY.communityID is '사용자 번호';
COMMENT ON COLUMN COMMUNITY.contents is '글';
COMMENT ON COLUMN COMMUNITY.mainImage is '메인이미지';
COMMENT ON COLUMN COMMUNITY.mainImagePreview is '메인이미지 프리뷰';
COMMENT ON COLUMN COMMUNITY.cimage is '커뮤니티 이미지';
COMMENT ON COLUMN COMMUNITY.map is '지도';
COMMENT ON COLUMN COMMUNITY.youtube is '유튜브';
COMMENT ON COLUMN COMMUNITY.date is '작성일자';

DROP SEQUENCE COMMUNITY_SEQ;

CREATE SEQUENCE COMMUNITY_SEQ
  START WITH 1              -- 시작 번호
  INCREMENT BY 1            -- 증가값
  MAXVALUE 99999            -- 최대값: 99999 --> NUMBER(5) 대응
  CACHE 2                   -- 2번은 메모리에서만 계산
  NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

