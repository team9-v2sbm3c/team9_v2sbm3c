package dev.mvc.itinerary;

/*
 		itineraryID INT NOT NULL,
		planID INT,
		activityID INT,
		iname VARCHAR(50) NOT NULL,
		idate DATE NOT NULL,
		memo VARCHAR(100),
        longitude INT NOT NULL,
        latitude INT NOT NULL,
        PRIMARY KEY (itineraryID),
        FOREIGN KEY (planID) REFERENCES PLAN(planID),
        FOREIGN KEY (activityID) REFERENCES ACTIVITY(activityID)
 */
public class ItineraryVO {
	private int itineraryID;
	private int planID;
	private int activityID;
	private String iname;
	private String idate;
	private String memo;
	private int longitude;
	private int latitude;
	
	public int getItineraryID() {
		return itineraryID;
	}
	public void setItineraryID(int itineraryID) {
		this.itineraryID = itineraryID;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public int getActivityID() {
		return activityID;
	}
	public void setActivityID(int activityID) {
		this.activityID = activityID;
	}
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
	}
	public String getIdate() {
		return idate;
	}
	public void setIdate(String idate) {
		this.idate = idate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	
	@Override
	public String toString() {
		return "ItineraryVO [itineraryID=" + itineraryID + ", planID=" + planID + ", activityID=" + activityID
				+ ", iname=" + iname + ", idate=" + idate + ", memo=" + memo + ", longitude=" + longitude
				+ ", latitude=" + latitude + "]";
	}
	
}
