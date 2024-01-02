package dev.mvc.guest;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.owner.OwnerProcInter;
import dev.mvc.login.LoginProc;
import dev.mvc.login.LoginProcInter;
import dev.mvc.mail.MailTool;

import org.json.JSONObject;


@Controller
public class GuestCont {
  @Autowired
  @Qualifier("dev.mvc.owner.OwnerProc") // @Component("dev.mvc.owner.OwnerProc")
  private OwnerProcInter ownerProc;@Autowired
  @Qualifier("dev.mvc.guest.GuestProc")
  private GuestProcInter guestProc;
  @Autowired
  @Qualifier("dev.mvc.login.LoginProc")
  private LoginProcInter loginProc;

  public GuestCont() {
    System.out.println("사용자(Guest) Cont 실행");
  }
  
//http://localhost:9093/guest/checkID.do?id=user1@gmail.com
 /**
 * ID 중복 체크, JSON 출력
 * @return {"cnt":0}, {"cnt":1}
 */
 @ResponseBody
 @RequestMapping(value="/guest/checkID.do", method=RequestMethod.GET ,
                             produces = "text/plain;charset=UTF-8" )
 public String checkID(String id) {
   System.out.println("->id:"+id);
   try {
     Thread.sleep(3000); // 3 초 지연
   }catch(Exception e) {
     
   }
   
   int cnt = this.guestProc.checkID(id);
  
   JSONObject json = new JSONObject();
   json.put("cnt", cnt); // 키와 값 = HashMap
  
   return json.toString(); // {"cnt":1} 
 }

 // http://localhost:9093/guest/create.do
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
   int checkID_cnt = this.guestProc.checkID(guestVO.getId());
   if (checkID_cnt == 0) {
     // System.out.println("id: " + guestVO.getId());
     
     guestVO.setGrade(15); // 기본 회원 가입 등록 15 지정
     
     int cnt= guestProc.create(guestVO); // SQL insert
     
     if (cnt == 1) { // insert 레코드 개수, 회원 가입 성공
       mav.addObject("code", "create_success");
       mav.addObject("cname", guestVO.getGname());  // 홍길동님(user4) 회원 가입을 축하합니다.
       mav.addObject("id", guestVO.getId());
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
 * 목록 출력 가능
 * @param session
 * @return
 */
 @RequestMapping(value="/guest/list.do", method=RequestMethod.GET)
 public ModelAndView list(HttpSession session) {
   ModelAndView mav = new ModelAndView();
   
   if (this.ownerProc.isOwner(session) == true) {
     ArrayList<GuestVO> list = this.guestProc.list();
     mav.addObject("list", list);

     mav.setViewName("/guest/list"); // /webapp/WEB-INF/views/guest/list.jsp

   } else {
     mav.setViewName("/owner/login_need"); // /WEB-INF/views/owner/login_need.jsp
   }
       
   return mav;
 } 
 
 /**
  * localhost:9093/guest/read_info.do?guestno=1
  * 회원 조회
  * 관리자, 회원 본인만 가능
  * @param guestno
  * @return
  */
 @RequestMapping(value="/guest/read_info.do", method=RequestMethod.GET)
 public ModelAndView read_info(HttpSession session, HttpServletRequest request){
   ModelAndView mav = new ModelAndView();
   
   int guestno = 0;
   if (this.guestProc.isGuest(session) || this.ownerProc.isOwner(session)) { 
     // 로그인한 경우

     if (this.guestProc.isGuest(session)) { // 회원으로 로그인
       // session을 사용하여 현재 로그인한 사용자의 guestno 값만 읽음으로 다른 사용자의
       // 정보를 조회할 수 없음
       guestno = (int)session.getAttribute("guestno");
       
     } else if (this.ownerProc.isOwner(session)) { // 관리자로 로그인
       // 관리자는 모든 회원의 정보를 조회할 수 있어야 함으로 parameter로 회원번호를 이용하여 조회
       guestno = Integer.parseInt(request.getParameter("guestno"));
       
     }

     GuestVO guestVO = this.guestProc.read(guestno);
     mav.addObject("guestVO", guestVO);
     mav.setViewName("/guest/read_info"); // /guest/read.jsp
     
   } else {
     // 로그인을 하지 않은 경우
     mav.setViewName("/guest/login_need"); // /webapp/WEB-INF/views/guest/login_need.jsp
   }
   
   return mav; // forward
 }
 
 /**
  * localhost:9093/guest/read.do?guestno=1
  * 회원 조회
  * 관리자, 회원 본인만 가능
  * @param guestno
  * @return
  */
 @RequestMapping(value="/guest/read.do", method=RequestMethod.GET)
 public ModelAndView read(HttpSession session, HttpServletRequest request){
   ModelAndView mav = new ModelAndView();
   
   int guestno = 0;
   if (this.guestProc.isGuest(session) || this.ownerProc.isOwner(session)) { 
     // 로그인한 경우

     if (this.guestProc.isGuest(session)) { // 회원으로 로그인
       // session을 사용하여 현재 로그인한 사용자의 guestno 값만 읽음으로 다른 사용자의
       // 정보를 조회할 수 없음
       guestno = (int)session.getAttribute("guestno");
       
     } else if (this.ownerProc.isOwner(session)) { // 관리자로 로그인
       // 관리자는 모든 회원의 정보를 조회할 수 있어야 함으로 parameter로 회원번호를 이용하여 조회
       guestno = Integer.parseInt(request.getParameter("guestno"));
       
     }

     GuestVO guestVO = this.guestProc.read(guestno);
     mav.addObject("guestVO", guestVO);
     mav.setViewName("/guest/read"); // /guest/read.jsp
     
   } else {
     // 로그인을 하지 않은 경우
     mav.setViewName("/guest/login_need"); // /webapp/WEB-INF/views/guest/login_need.jsp
   }
   
   return mav; // forward
 }

 /**
  * 회원 정보 수정 처리
  * @param guestVO
  * @return
  */
 @RequestMapping(value="/guest/update.do", method=RequestMethod.POST)
 public ModelAndView update(GuestVO guestVO){
   ModelAndView mav = new ModelAndView();
   
   // System.out.println("id: " + guestVO.getId());
   
   int cnt= this.guestProc.update(guestVO);
   
   if (cnt == 1) {
     mav.addObject("code", "update_success");
     mav.addObject("gname", guestVO.getGname());  // 홍길동님(user4) 회원 정보를 변경했습니다.
     mav.addObject("id", guestVO.getId());
     mav.addObject("gemail", guestVO.getGemail());
   } else {
     mav.addObject("code", "update_fail");
   }

   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
   mav.addObject("url", "/guest/msg");  // /guest/msg -> /guest/msg.jsp
   
   mav.setViewName("redirect:/guest/msg.do");
   
   return mav;
 }
 
 /**
  * 회원 삭제
  * @param guestno
  * @return
  */
 @RequestMapping(value="/guest/delete.do", method=RequestMethod.GET)
 public ModelAndView delete(int guestno){
   ModelAndView mav = new ModelAndView();
   
   GuestVO guestVO = this.guestProc.read(guestno); // 삭제할 레코드를 사용자에게 출력하기위해 읽음.
   mav.addObject("guestVO", guestVO);
   
   mav.setViewName("/guest/delete"); // /guest/delete.jsp
   
   return mav; // forward
 }

 /**
  * 회원 삭제 처리
  * @param guestVO
  * @return
  */
 @RequestMapping(value="/guest/delete.do", method=RequestMethod.POST)
 public ModelAndView delete_proc(int guestno){
   ModelAndView mav = new ModelAndView();

   // 자식 테이블 레코드 삭제에 성공한 경우에만 부모 테이블 레코드 삭제 수행 로직

   GuestVO guestVO = this.guestProc.read(guestno);
   System.out.println("-> guestVO: " + guestVO);
   
   int cnt = this.guestProc.delete(guestno);
   System.out.println("-> cnt: " + cnt); 

   if (cnt == 1) {
       mav.addObject("code", "delete_success");
       mav.addObject("gname", guestVO.getGname());
       mav.addObject("id", guestVO.getId());
   } else {
      mav.addObject("code", "delete_fail");
   }
   mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
   mav.addObject("url", "/guest/msg");  // /guest/msg -> /guest/msg.jsp
   
   mav.setViewName("redirect:/guest/msg.do");
   
   return mav;
 }
 

 /**
  * 로그아웃 처리
  * @param session
  * @return
  */
 @RequestMapping(value="/guest/logout.do", 
                            method=RequestMethod.GET)
 public ModelAndView logout(HttpSession session){
   ModelAndView mav = new ModelAndView();
   session.invalidate(); // 모든 session 변수 삭제
   
   mav.setViewName("redirect:/index.do"); 
   
   return mav;
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
 
   mav.setViewName("/guest/login_form_ck"); // /guest/login_form_ck.jsp
   return mav;
 }
  
 /**
 * Cookie 기반 로그인 처리
 * @param request Cookie를 읽기위해 필요
 * @param response Cookie를 쓰기위해 필요
 * @param session 로그인 정보를 메모리에 기록
 * @param id  회원 아이디
 * @param passwd 회원 패스워드
 * @param id_save 회원 아이디 Cookie에 저장 여부
 * @param passwd_save 패스워드 Cookie에 저장 여부
 * @return
 */
 // http://localhost:guest/login.do 
 @RequestMapping(value = "/guest/login.do", 
                           method = RequestMethod.POST)
 public ModelAndView login_cookie_proc(
                           HttpServletRequest request,
                           HttpServletResponse response,
                           HttpSession session,
                           String id,
                           String passwd,
                           @RequestParam(value="id_save", defaultValue="") String id_save,
                           @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
   // client ip
   String ip=request.getRemoteAddr();
   System.out.println("-> ip: " + ip); // 자기자신은 0.0.0.0 으로 출력되고 외부 접속은 정상적으로 ip가 나옴
   
   
   ModelAndView mav = new ModelAndView();
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("id", id);
   map.put("passwd", passwd);
  
   int cnt =guestProc.login(map);
   if (cnt == 1) { // 로그인 성공
     // System.out.println(id + " 로그인 성공");
     GuestVO guestVO = guestProc.readById(id);
     session.setAttribute("guestno", guestVO.getGuestno()); // 서버의 메모리에 기록
     session.setAttribute("id", id);
     session.setAttribute("gname", guestVO.getGname());
     session.setAttribute("grade", guestVO.getGrade());
     
     HashMap<String, Object> lmap = new HashMap<String, Object>();
     
     lmap.put("guestno", (int)guestVO.getGuestno());  // map에 login의 매개변수인 guestno와 ip추가
     lmap.put("ip", ip);
     
     loginProc.login_cookie_proc(lmap);
     
     // -------------------------------------------------------------------
     // id 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (id_save.equals("Y")) { // id를 저장할 경우, Checkbox를 체크한 경우
       Cookie ck_id = new Cookie("ck_id", id);
       ck_id.setPath("/");  // root 폴더에 쿠키를 기록함으로 모든 경로에서 쿠기 접근 가능
       ck_id.setMaxAge(60 * 60 * 24 * 30); // 30 day, 초단위
       response.addCookie(ck_id); // id 저장
     } else { // N, id를 저장하지 않는 경우, Checkbox를 체크 해제한 경우
       Cookie ck_id = new Cookie("ck_id", "");
       ck_id.setPath("/");
       ck_id.setMaxAge(0);
       response.addCookie(ck_id); // id 저장
     }
     
     // id를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_id_save = new Cookie("ck_id_save", id_save);
     ck_id_save.setPath("/");
     ck_id_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
     response.addCookie(ck_id_save);
     // -------------------------------------------------------------------
 
     // -------------------------------------------------------------------
     // Password 관련 쿠기 저장
     // -------------------------------------------------------------------
     if (passwd_save.equals("Y")) { // 패스워드 저장할 경우
       Cookie ck_passwd = new Cookie("ck_passwd", passwd);
       ck_passwd.setPath("/");
       ck_passwd.setMaxAge(60 * 60 * 24 * 30); // 30 day
       response.addCookie(ck_passwd);
     } else { // N, 패스워드를 저장하지 않을 경우
       Cookie ck_passwd = new Cookie("ck_passwd", "");
       ck_passwd.setPath("/");
       ck_passwd.setMaxAge(0);
       response.addCookie(ck_passwd);
     }
     // passwd를 저장할지 선택하는  CheckBox 체크 여부
     Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
     ck_passwd_save.setPath("/");
     ck_passwd_save.setMaxAge(60 * 60 * 24 * 30); // 30 day
     response.addCookie(ck_passwd_save);
     // -------------------------------------------------------------------
  
     mav.setViewName("redirect:/index.do");  
   } else {
     mav.addObject("url", "/guest/login_fail_msg");
     mav.setViewName("redirect:/guest/msg.do"); 
   }
      
   return mav;
 }
 
 /**
  * 패스워드를 변경합니다.
  * @param guestno
  * @return
  */
 @RequestMapping(value="/guest/passwd_update.do", method=RequestMethod.GET)
 public ModelAndView passwd_update(){
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/guest/passwd_update"); // passwd_update.jsp
   
   return mav;
 }
 
 /**
  * 패스워드 검사 
  * 로그인 실행 -> http://localhost:9093/guest/passwd_check.do?current_passwd=1234
  * @param session
  * @param current_passwd 현재 패스워드
  * @return 1: 일치, 0: 불일치
  */
 @ResponseBody
 @RequestMapping(value="/guest/passwd_check.do", method=RequestMethod.GET)
 public String passwd_check(HttpSession session, String current_passwd) {
   try {
     Thread.sleep(2000);
   }catch(Exception e) {
     e.printStackTrace();
   }
   
   int guestno = (int)session.getAttribute("guestno");
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("guestno", guestno);
   map.put("passwd", current_passwd);
   int cnt = this.guestProc.passwd_check(map);
   
   JSONObject json = new JSONObject();
   json.put("cnt", cnt);
   
   return json.toString();
 }
 
 /**
  * 패스워드 변경 처리
  * @param guestno 회원 번호
  * @param current_passwd 현재 패스워드
  * @param new_passwd 새로운 패스워드
  * @return
  */
 @RequestMapping(value="/guest/passwd_update.do", method=RequestMethod.POST)
 public ModelAndView passwd_update(HttpSession session, String current_passwd, String new_passwd){
   ModelAndView mav = new ModelAndView();
   
   int guestno = (int)session.getAttribute("guestno"); // 현재 로그인한 회원의 정보만 패스워드 변경 가능
   //int guestno = 3; // 테스트
   
   GuestVO guestVO = this.guestProc.read(guestno); // 패스워드를 변경하려는 회원 정보를 읽음
   mav.addObject("gname", guestVO.getGname());  
   mav.addObject("id", guestVO.getId());
   
   // 현재 패스워드 검사용 데이터
   HashMap<String, Object> map = new HashMap<String, Object>();
   map.put("guestno", guestno);
   map.put("passwd", current_passwd);
   
   int cnt = guestProc.passwd_check(map); // 현재 패스워드 검사
   int update_cnt = 0; // 변경된 패스워드 수
   
   if (cnt == 1) { // 현재 패스워드가 일치하는 경우
     map.put("passwd", new_passwd); // 새로운 패스워드를 저장
     update_cnt = this.guestProc.passwd_update(map); // 패스워드 변경 처리
     
     if (update_cnt == 1) {
       mav.addObject("code", "passwd_update_success"); // 패스워드 변경 성공
     } else {
       cnt = 0;  // 패스워드는 일치했으나 변경하지는 못함.
       mav.addObject("code", "passwd_update_fail");       // 패스워드 변경 실패
     }
     
     mav.addObject("update_cnt", update_cnt);  // 변경된 패스워드의 갯수    
   } else {
     mav.addObject("code", "passwd_fail"); // 패스워드가 일치하지 않는 경우
   }

   mav.addObject("cnt", cnt); // 패스워드 일치 여부
   mav.addObject("url", "/guest/msg");  // /guest/msg -> /guest/msg.jsp
   
   mav.setViewName("redirect:/guest/msg.do");
   
   return mav;
 }
 /**
  * 아이디 찾기 폼
  */
 @RequestMapping(value="/guest/id_find.do", method=RequestMethod.GET )
 public ModelAndView id_find() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/guest/id_find"); // /WEB-INF/views/guest/id_find.jsp
  
   return mav; // forward
 }
 
//http://localhost:9093/guest/user_withdrawal.do
 /**
  * 회원 탈퇴
  * @param guestno 회원 번호
  */
 @RequestMapping(value="/guest/user_withdrawal.do", method=RequestMethod.POST)
 public ModelAndView user_withdrawal(HttpSession session){
   ModelAndView mav = new ModelAndView();
   
   int guestno = (int)session.getAttribute("guestno"); // 현재 로그인한 회원의 정보만 패스워드 변경 가능
   //int guestno = 3; // 테스트
   
   int cnt = this.guestProc.user_withdrawal(guestno);
   
   if (cnt == 1) {
     mav.addObject("code", "passwd_update_success"); // 탈퇴 성공
   } else {
     mav.addObject("code", "passwd_update_fail");       // 탈퇴 실패
   }


   mav.addObject("cnt", cnt); // 패스워드 일치 여부
   mav.addObject("url", "/guest/msg");  // /guest/msg -> /guest/msg.jsp
   
   mav.setViewName("redirect:/guest/msg.do");
   
   return mav;
 }
 
 
//http://localhost:9093/guest/id_find.do 아직 제작중
/**
 * 아이디 찾기
 * 
 * @return
 */
@RequestMapping(value = "/guest/id_find.do", method = RequestMethod.POST)
public ModelAndView id_find(String gname, String gemail) {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/guest/id_find"); // /WEB-INF/views/guest/create.jsp
  
  HashMap<String, Object> map = new HashMap<String, Object>();
  map.put("gname", gname);
  
  GuestVO guestVO = this.guestProc.id_find(map);
    if(guestVO == null) {
      mav.addObject("code", "no_guest");
      
      mav.addObject("url", "/guest/msg");
      mav.setViewName("redirect:/guest/msg.do");
    } else {
      String id = guestVO.getId();
      mav.addObject("id", id);
      
      MailTool mailTool = new MailTool();
      String from = "jin200112kr@gmail.com"; // 관리자 메일 주소
      String title = "여행 아이디";
      String content = gname + "님의 등록된 아이디는 [" + id + "] 입니다.";
      int cnt = mailTool.send(gemail, from, title, content); // 메일 전송
      
      if(cnt == 1) {
        mav.addObject("code", "mail_success");
      } else {
        mav.addObject("code", "mail_fail");
      }
      mav.addObject("cnt", cnt);
    }
    
    mav.addObject("url", "/guest/msg");
    mav.setViewName("redirect:/guest/msg.do");
    
    return mav; // forward
  }

 
}