package dev.mvc.guest;

/*
    guestID INT NOT NULL,
    gpassword INT,
    gname VARCHAR(25),
    gemail VARCHAR(10),
        PRIMARY KEY(guestID)
  */
public class GuestVO {
  private int guestID;
  private int gpassword;
  private String gname;
  private String gmail;
  
  public int getGuestID() {
    return guestID;
  }
  public void setGuestID(int guestID) {
    this.guestID = guestID;
  }
  public int getGpassword() {
    return gpassword;
  }
  public void setGpassword(int gpassword) {
    this.gpassword = gpassword;
  }
  public String getGname() {
    return gname;
  }
  public void setGname(String gname) {
    this.gname = gname;
  }
  public String getGmail() {
    return gmail;
  }
  public void setGmail(String gmail) {
    this.gmail = gmail;
  }
  @Override
  public String toString() {
    return "GuestVO [guestID=" + guestID + ", gpassword=" + gpassword + ", gname=" + gname + ", gmail=" + gmail + "]";
  }
  
  
}
