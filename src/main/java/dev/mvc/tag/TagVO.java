package dev.mvc.tag;

/**
	planID INT NOT NULL,
	tname VARCHAR(50),
**/
public class TagVO {
	private int planID;
	private String tname;
	
	public int getTagID() {
		return planID;
	}
	public void setTagID(int tagID) {
		this.planID = tagID;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	@Override
	public String toString() {
		return "TagVO [tagID=" + planID + ", tname=" + tname + "]";
	}
}
