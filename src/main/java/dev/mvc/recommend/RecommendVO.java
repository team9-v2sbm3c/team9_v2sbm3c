package dev.mvc.recommend;

/*
 * recommendID                   		NUMBER(10)		 NOT NULL,
		guestno                       		NUMBER(10)		 NULL ,
		activecodeno                  		NUMBER(10)		 NULL ,
        seq                                 NUMBER(2)         DEFAULT 1         NOT NULL,
		rdate                         		DATE		 NULL 
 */
public class RecommendVO {
	private int recommendID;
	private int guestno;
	private int activecodeno;
	private int seq;
	private String rdate;
	private String gname;
	
	public int getRecommendID() {
		return recommendID;
	}
	public void setRecommendID(int recommendID) {
		this.recommendID = recommendID;
	}
	public int getGuestno() {
		return guestno;
	}
	public void setGuestno(int guestno) {
		this.guestno = guestno;
	}
	public int getActivecodeno() {
		return activecodeno;
	}
	public void setActivecodeno(int activecodeno) {
		this.activecodeno = activecodeno;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
}
