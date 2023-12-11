package dev.mvc.activecode;

/*
 * CREATE TABLE activecode(
		activecodeno                  		NUMBER(10)		 NOT NULL,
		aname                         		VARCHAR2(50)		 NOT NULL
);
 */
public class ActivecodeVO {
	private int activecodeno;
	private String aname;
	
	public int getActivecodeno() {
		return activecodeno;
	}
	public void setActivecodeno(int activecodeno) {
		this.activecodeno = activecodeno;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
}
