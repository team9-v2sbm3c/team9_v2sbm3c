package dev.mvc.guest;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.guest.GuestProc")
public class GuestProc implements GuestProcInter {
  @Autowired
  private GuestDAOInter guestDAO;

  public GuestProc(){
    // System.out.println("-> GuestProc created.");
  }
  
  @Override
  public int checkID(String id) {
    int cnt = this.guestDAO.checkID(id);
    return cnt;
  }

  @Override
  public int create(GuestVO guestVO) {
    int cnt = this.guestDAO.create(guestVO);
    return cnt;
  }
  @Override
  public int update(GuestVO guestVO) {
    int cnt = this.guestDAO.update(guestVO);
    return cnt;
  }
  
  @Override
  public int delete(int guestno) {
    int cnt = this.guestDAO.delete(guestno);
    return cnt;
  }
  @Override
  public ArrayList<GuestVO> list() {
    ArrayList<GuestVO> list = this.guestDAO.list();
    return list;
  }
  @Override
  public GuestVO read(int guestno) {
    GuestVO guestVO = this.guestDAO.read(guestno);
    return guestVO;
  }
  @Override
  public GuestVO readById(String id) {
    GuestVO guestVO = this.guestDAO.readById(id);
    return guestVO;
  }
  
  @Override
  public boolean isGuest(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 20){ // 관리자 + 회원
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }
  @Override
  public boolean isGuestOwner(HttpSession session){
    boolean sw = false; // 로그인하지 않은 것으로 초기화
    int grade = 99;
    
    // System.out.println("-> grade: " + session.getAttribute("grade"));
    if (session != null) {
      String id = (String)session.getAttribute("id");
      if (session.getAttribute("grade") != null) {
        grade = (int)session.getAttribute("grade");
      }
      
      if (id != null && grade <= 10){ // 관리자 
        sw = true;  // 로그인 한 경우
      }
    }
    
    return sw;
  }
  @Override
  public int passwd_check(HashMap<String, Object> map) {
    int cnt = this.guestDAO.passwd_check(map);
    return cnt;
  }

  @Override
  public int passwd_update(HashMap<String, Object> map) {
    int cnt = this.guestDAO.passwd_update(map);
    return cnt;
  }
  
  @Override
  public int login(HashMap<String, Object> map) {
    int cnt = this.guestDAO.login(map);
    return cnt;
  }
}
