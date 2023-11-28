package dev.mvc.plan;
/**
 * planID                        		NUMBER(10)		 NOT NULL,
 * pname                         		VARCHAR2(50)		 NULL 
 * @author blenbre777
 *
 */
public class PlanVO {
	private int planID;
	private String pname;
	
	public int getPlanID() {
		return planID;
	}
	public void setPlanID(int planID) {
		this.planID = planID;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	
	@Override
	public String toString() {
		return "PlanVO [planID=" + planID + ", pname=" + pname + "]";
	}
	
	
}
