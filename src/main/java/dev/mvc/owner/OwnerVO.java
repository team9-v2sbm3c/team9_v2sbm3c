package dev.mvc.owner;

public class OwnerVO {
  private int ownerno;
  private String ownerid;
  private String opassword;
  private String oname;
  private String rdate;
  private int grade;
  
  public int getOwnerno() {
    return ownerno;
  }
  public void setOwnerno(int ownerno) {
    this.ownerno = ownerno;
  }
  public String getOwnerid() {
    return ownerid;
  }
  public void setOwnerid(String ownerid) {
    this.ownerid = ownerid;
  }
  public String getOpassword() {
    return opassword;
  }
  public void setOpassword(String opassword) {
    this.opassword = opassword;
  }
  public String getOname() {
    return oname;
  }
  public void setOname(String oname) {
    this.oname = oname;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  @Override
  public String toString() {
    return "OwnerVO [ownerno=" + ownerno + ", ownerid=" + ownerid + ", opassword=" + opassword + ", oname=" + oname
        + ", rdate=" + rdate + ", grade=" + grade + "]";
  }
  
}
