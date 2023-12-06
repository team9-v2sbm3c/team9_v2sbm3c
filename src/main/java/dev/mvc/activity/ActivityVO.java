package dev.mvc.activity;

/**
 * 
 * activityID                    		NUMBER(10)		 NOT NULL,
		planID                        		NUMBER(10)		 NULL ,
		aname                         		VARCHAR2(200)		 NULL ,
		activityCnt                   		NUMBER(10)		 NULL ,
		aDate                          		DATE		 NULL 
 * @author soldesk
 *
 */
public class ActivityVO {
	private int activityID;
	private int planID;
	private String aname;
	private int activityCnt;
	private String aDate;
	public int getActivityID() {
		return activityID;
	}
	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public int getActivityCnt() {
		return activityCnt;
	}
	public void setActivityCnt(int activityCnt) {
		this.activityCnt = activityCnt;
	}
	public String getaDate() {
		return aDate;
	}
	public void setaDate(String aDate) {
		this.aDate = aDate;
	}
	
	
	
}
