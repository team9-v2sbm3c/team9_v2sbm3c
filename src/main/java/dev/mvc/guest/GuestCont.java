package dev.mvc.guest;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.json.JSONObject;


@Controller
public class GuestCont {
  @Autowired
  @Qualifier("dev.mvc.guest.GuestProc")
  private GuestProcInter guestProc;

  public GuestCont() {
    System.out.println("사용자(Guest) Cont 실행");
  }
  
  /**
   * 
   * ID 중복 체크 
   * @return {"cnt":0}, {"cnt":1}
   */
  @ResponseBody
  @RequestMapping(value="/guest/checkID.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8"  )
  public String checkID(String guestID) {
    System.out.println("-> id: " + guestID);
    
    try {
      Thread.sleep(3000); // 3 초 지연
    }catch(Exception e) {
      
    }
    
    int cnt = this.guestProc.checkID(guestID);
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt); // 키와 값 = HashMap
   
    return json.toString(); // {"cnt":1} 
  }  
  
  /**
  * 등록 폼
  * @return
  */
  @RequestMapping(value="/guest/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/guest/create"); // /WEB-INF/views/guest/create.jsp
   
    return mav; // forward
  }
  
  /**
   * 등록 처리
   * @param guestVO
   * @return
   */
  @RequestMapping(value="/guest/create.do", method=RequestMethod.POST)
  public ModelAndView create(GuestVO guestVO){
    ModelAndView mav = new ModelAndView();
    
 // 중복 ID 검사
    int checkID_cnt = guestProc.checkID(String.valueOf(guestVO.getGuestID()));
    if (checkID_cnt == 0) {
      // System.out.println("id: " + guestVO.getId());
      guestVO.setGrade(1);
      
      int cnt= guestProc.create(guestVO); // SQL insert
      
      if (cnt == 1) { // insert 레코드 개수, 회원 가입 성공
        mav.addObject("code", "create_success");
        mav.addObject("gname", guestVO.getGname());  // 홍길동님(user4) 회원 가입을 축하합니다.
        mav.addObject("guestID", guestVO.getGuestID());
      } else { // 회원 가입 실패
        mav.addObject("code", "create_fail");
        // mav.addObject("cnt", 0);  // 추가된 레코드 없음.  
      }
      
      mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
      
    } else {
      mav.addObject("code", "duplicate_fail"); // 이미 사용중인 id임으로 가입 실패
      mav.addObject("cnt", 0);                       // 추가된 레코드 없음.      
    }

    mav.addObject("url", "/guest/msg");  // /guest/msg -> /guest/msg.jsp
    
    mav.setViewName("redirect:/guest/msg.do"); // POST -> GET -> /guest/msg.jsp
    
    return mav;
  }
  
  /**
   * 새로고침 방지, EL에서 param으로 접근, POST -> GET -> /guest/msg.jsp
   * @return
   */
  @RequestMapping(value="/guest/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  /**
   * 로그인 폼
   * @return
   */
  // http://localhost:9093/guest/login.do 
  @RequestMapping(value = "/guest/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login_cookie(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
  
    String ck_id = ""; // id 저장
    String ck_id_save = ""; // id 저장 여부를 체크
    String ck_passwd = ""; // passwd 저장
    String ck_passwd_save = ""; // passwd 저장 여부를 체크
  
    if (cookies != null) { // 쿠키가 존재한다면
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
      
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
  
    //    <input type='text' class="form-control" name='id' id='id' 
    //            value='${ck_id }' required="required" 
    //            style='width: 30%;' placeholder="아이디" autofocus="autofocus">
    mav.addObject("ck_id", ck_id);
  
    //    <input type='checkbox' name='id_save' value='Y' 
    //            ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 저장
    mav.addObject("ck_id_save", ck_id_save);
  
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
  
    mav.setViewName("/guest/login"); // /guest/login.jsp
    return mav;
  }

}
