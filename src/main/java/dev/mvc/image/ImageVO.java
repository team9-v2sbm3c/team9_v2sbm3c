package dev.mvc.image;

/*
	imageID INT NOT NULL,
	planID INT,
	idescription VARCHAR(300),
	ipath VARCHAR(50),
    PRIMARY KEY(imageID),
    FOREIGN KEY (planID) REFERENCES PLAN(planID)
 */
public class ImageVO {
	private int imageID;
	private int planID;
	private String idescription;
	private String ipath;
	
	public int getImageID() {
		return imageID;
	}
	public void setImageID(int imageID) {
		this.imageID = imageID;
	}
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public String getIdescription() {
		return idescription;
	}
	public void setIdescription(String idescription) {
		this.idescription = idescription;
	}
	public String getIpath() {
		return ipath;
	}
	public void setIpath(String ipath) {
		this.ipath = ipath;
	}
	
	@Override
	public String toString() {
		return "ImageVO [imageID=" + imageID + ", planID=" + planID + ", idescription=" + idescription + ", ipath="
				+ ipath + "]";
	} 
}
