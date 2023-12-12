package dev.mvc.login;
/*
   loginno                    NUMBER(10) NOT NULL PRIMARY KEY,
  guestno                NUMBER(10) NOT NULL,
  ip                            VARCHAR2(30) NOT NULL,
  logindate                  DATE NOT NULL,
  FOREIGN KEY (guestno) REFERENCES guest (guestno)
 */
public class LoginVO {
  private int loginno;
  private int guestno;
  private String ip;
  private String logindate;
  
  public int getLoginno() {
    return loginno;
  }
  public void setLoginno(int loginno) {
    this.loginno = loginno;
  }
  public int getGuestno() {
    return guestno;
  }
  public void setGuestno(int guestno) {
    this.guestno = guestno;
  }
  public String getIp() {
    return ip;
  }
  public void setIp(String ip) {
    this.ip = ip;
  }
  public String getLogindate() {
    return logindate;
  }
  public void setLogindate(String logindate) {
    this.logindate = logindate;
  }
  
  
}
