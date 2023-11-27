/**********************************/
/* Table Name: 활동 */
/**********************************/
CREATE TABLE activity(
		activityID                    		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		aname                         		VARCHAR2(200)		 NULL 
);

COMMENT ON TABLE activity is '활동';
COMMENT ON COLUMN activity.activityID is '활동 번호';
COMMENT ON COLUMN activity.planID is '여행지 번호';
COMMENT ON COLUMN activity.aname is '활동 이름';


ALTER TABLE activity ADD CONSTRAINT IDX_activity_PK PRIMARY KEY (activityID);
ALTER TABLE activity ADD CONSTRAINT IDX_activity_FK0 FOREIGN KEY (planID) REFERENCES plan (planID);


--Create

--Read

--Update

--Delete