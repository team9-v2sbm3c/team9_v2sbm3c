package dev.mvc.activity;

/**
 	activityID INT NOT NULL,
	planID INT,
	aname VARCHAR(50) NOT NULL,
	adescription VARCHAR(300) NOT NULL,
	adte DATE NOT NULL,
    PRIMARY KEY (activityID),
    FOREIGN KEY (planID) REFERENCES PLAN(planID)
 */

public class ActivityVO {
	private int activityID;
	private int planID;
	private String anme;
	private String adescription;
	private String adate;
	
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
	public String getAnme() {
		return anme;
	}
	public void setAnme(String anme) {
		this.anme = anme;
	}
	public String getAdescription() {
		return adescription;
	}
	public void setAdescription(String adescription) {
		this.adescription = adescription;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	
	@Override
	public String toString() {
		return "ActivityVO [activityID=" + activityID + ", planID=" + planID + ", anme=" + anme + ", adescription="
				+ adescription + ", adate=" + adate + "]";
	}
}
