package dev.mvc.login;

import java.util.ArrayList;
import java.util.HashMap;

public interface LoginProcInter {
  
  /**
   * 로그인 내역 저장
   * @param map
   * @return 
   */
  public int login_cookie_proc(HashMap<String, Object> map);
  
  /**
   * 로그인 내역
   * @return
   */
  public ArrayList<LoginVO> login_list();
  
}