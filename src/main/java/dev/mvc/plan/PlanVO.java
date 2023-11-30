package dev.mvc.plan;
/**
 * planID                        		NUMBER(10)		 NOT NULL,
	pname                         		VARCHAR2(50)		 NULL ,
	planCnt                       		NUMBER(10)		 NULL ,
	pdate                         		DATE		 NULL 
 * @author soldesk
 *
 */
public class PlanVO {
	private int planID;
	private String pname;
	private int planCnt;
	private String pdate;
	
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
	public int getPlanCnt() {
		return planCnt;
	}
	public void setPlanCnt(int planCnt) {
		this.planCnt = planCnt;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
}
