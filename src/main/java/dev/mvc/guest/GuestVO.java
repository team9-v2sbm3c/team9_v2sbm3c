package dev.mvc.guest;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

/*
    guestno NUMERIC(10) NOT NULL,
    id VARCHAR(30),
    passwd VARCHAR(60),
    gname VARCHAR(40),
    gemail VARCHAR(100),
     PRIMARY KEY(guestno)
  */
public class GuestVO {
  private int guestno;
  private String id = "";
  private String passwd= "";
  private String gname = "";
  private String gemail= "";
  private String gdate ="";
  private int grade = 0;
  
  /** 등록된 패스워드 */
  private String old_passwd = "";
  /** id 저장 여부 */
  private String id_save = "";
  /** passwd 저장 여부 */
  private String passwd_save = "";
  
  public int getGuestno() {
    return guestno;
  }
  public void setGuestno(int guestno) {
    this.guestno = guestno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
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
  public String getGdate() {
    return gdate;
  }
  public void setGdate(String gdate) {
    this.gdate = gdate;
  }
 
    public static GuestVO getLoggedInMember() {
      ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
      HttpSession session = attributes.getRequest().getSession(false);
  
      if (session != null) {
        GuestVO loggedInGuest = (GuestVO) session.getAttribute("guestVO");
        if (loggedInGuest != null) {
            // 세션에 guestVO가 있는 경우 로그 출력
            System.out.println("로그인된 사용자: " + loggedInGuest.getGname());
            return loggedInGuest;
        }
    }
  
    // 세션이 없거나 세션에 guestVO가 없는 경우
    System.out.println("로그인된 사용자 없음");
    return null;
  }

}
