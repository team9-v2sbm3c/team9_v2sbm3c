package dev.mvc.guest;

import java.sql.SQLException;

/*
    guestno NUMERIC(10) NOT NULL,
    guestID VARCHAR(30),
    gpassword VARCHAR(60),
    gname VARCHAR(40),
    gemail VARCHAR(100),
     PRIMARY KEY(guestno)
  */
public class GuestVO {
  private int guestno;
  private String guestID = "";
  private String gpassword= "";
  private String gname = "";
  private String gemail= "";
  private int grade;
  public int getGuestno() {
    return guestno;
  }
  public void setGuestno(int guestno) {
    this.guestno = guestno;
  }
  public String getGuestID() {
    return guestID;
  }
  public void setGuestID(String guestID) {
    this.guestID = guestID;
  }
  public String getGpassword() {
    return gpassword;
  }
  public void setGpassword(String gpassword) {
    this.gpassword = gpassword;
  }
  public String getGname() {
    return gname;
  }
  public void setGname(String gname) {
    this.gname = gname;
  }
  public String getGemail() {
    return gemail;
  }
  public void setGemail(String gemail) {
    this.gemail = gemail;
  }
  public int getGrade() {
    return grade;
  }
  public void setGrade(int grade) {
    this.grade = grade;
  }
  @Override
  public String toString() {
    return "GuestVO [guestno=" + guestno + ", guestID=" + guestID + ", gpassword=" + gpassword + ", gname=" + gname
        + ", gemail=" + gemail + ", grade=" + grade + "]";
  }
  
  

}
