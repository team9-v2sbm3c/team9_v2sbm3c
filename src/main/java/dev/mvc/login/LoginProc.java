package dev.mvc.login;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.login.LoginProc")
public class LoginProc implements LoginProcInter {
  @Autowired
  private LoginDAOInter loginDAO;

  @Override
  public int login_cookie_proc(HashMap<String, Object> map) {
    int cnt = this.loginDAO.login_cookie_proc(map);
    return cnt;
  }

  @Override
  public ArrayList<LoginVO> login_list() {
    ArrayList<LoginVO> list = this.loginDAO.login_list();
    return list;
  }


}