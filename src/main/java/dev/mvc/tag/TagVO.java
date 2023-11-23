package dev.mvc.tag;

/**
	tagID INT NOT NULL,
	tname VARCHAR(50),
    PRIMARY KEY(tagID)
**/
public class TagVO {
	private int tagID;
	private String tname;
	
	public int getTagID() {
		return tagID;
	}
	public void setTagID(int tagID) {
		this.tagID = tagID;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	@Override
	public String toString() {
		return "TagVO [tagID=" + tagID + ", tname=" + tname + "]";
	}
}
