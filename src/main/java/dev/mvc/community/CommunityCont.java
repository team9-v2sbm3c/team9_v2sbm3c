package dev.mvc.community;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.plan.PlanProcInter;
import dev.mvc.plan.PlanVO;
import dev.mvc.tools.Tool;
import dev.mvc.tools.Upload;

@Controller
public class CommunityCont {
	
	@Autowired
	@Qualifier("dev.mvc.plan.PlanProc")
	private PlanProcInter planProc;
	
	@Autowired
	@Qualifier("dev.mvc.community.CommunityProc")
	private CommunityProcInter communityProc;
	
//	@Autowired
//	@Qualifier("dev.mvc.관리자")
//	private 관리자 . 
	
	public CommunityCont() {
		System.out.println("커뮤니티(community) Cont 실행");
	}
	
	/**
	 * 커뮤니티 등록 폼 
	 * @param planID
	 * @return
	 */
	//http://localhost:9093/community/create.do?planID=1 
	@RequestMapping(value="/community/create.do" , method = RequestMethod.GET)
	public ModelAndView create_community(int planID) {
		ModelAndView mav = new ModelAndView();
		
		PlanVO planVO = this.planProc.read_plan(planID);
		mav.addObject("planVO", planVO);
		
		mav.setViewName("/community/create");
		
		return mav;
	}
	
	@RequestMapping(value = "/community/create.do", method = RequestMethod.POST)
	  public ModelAndView create(HttpServletRequest request, HttpSession session, CommunityVO communityVO) {
	    ModelAndView mav = new ModelAndView();
	    
	    //if (adminProc.isAdmin(session)) { // 관리자로 로그인한경우
	      // ------------------------------------------------------------------------------
	      // 파일 전송 코드 시작
	      // ------------------------------------------------------------------------------
	      String file1 = "";          // 원본 파일명 image
	      String file1saved = "";   // 저장된 파일명, image
	      String thumb1 = "";     // preview image

	      String upDir =  Community.getUploadDir(); // 파일을 업로드할 폴더 준비
	      System.out.println("-> upDir: " + upDir);
	      
	      // 전송 파일이 없어도 file1MF 객체가 생성됨.
	      // <input type='file' class="form-control" name='file1MF' id='file1MF' 
	      //           value='' placeholder="파일 선택">
	      MultipartFile mf = communityVO.getFile1MF();
	      
	      file1 = mf.getOriginalFilename(); // 원본 파일명 산출, 01.jpg
	      System.out.println("-> 원본 파일명 산출 file1: " + file1);
	      
	      if (Tool.checkUploadFile(file1) == true) { // 업로드 가능한 파일인지 검사
	        long size1 = mf.getSize();  // 파일 크기
	        
	        if (size1 > 0) { // 파일 크기 체크
	          // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
	          file1saved = Upload.saveFileSpring(mf, upDir); 
	          
	          if (Tool.isImage(file1saved)) { // 이미지인지 검사
	            // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
	            thumb1 = Tool.preview(upDir, file1saved, 200, 150); 
	          }
	          
	        }    
	        
	        communityVO.setMainImage(file1);   // 순수 원본 파일명
	        communityVO.setMainImagePreview(file1saved); // 저장된 파일명(파일명 중복 처리)
	        communityVO.setCimage(thumb1);      // 원본이미지 축소판
	        communityVO.setSize1(size1);  // 파일 크기
	        // ------------------------------------------------------------------------------
	        // 파일 전송 코드 종료
	        // ------------------------------------------------------------------------------
	        
	        // Call By Reference: 메모리 공유, Hashcode 전달
//	        int adminno = (int)session.getAttribute("adminno"); // adminno FK
//	        communityVO.setAdminno(adminno);
	        int cnt = this.communityProc.create_community(communityVO); 
	        
	        // ------------------------------------------------------------------------------
	        // PK의 return
	        // ------------------------------------------------------------------------------
	        // System.out.println("--> communityno: " + communityVO.getCommunityno());
	        // mav.addObject("communityno", communityVO.getCommunityno()); // redirect parameter 적용
	        // ------------------------------------------------------------------------------
	        
	        if (cnt == 1) {
	            mav.addObject("code", "create_success");
	            // cateProc.increaseCnt(communityVO.getCateno()); // 글수 증가
	        } else {
	            mav.addObject("code", "create_fail");
	        }
	        mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
	        
	        // System.out.println("--> cateno: " + communityVO.getCateno());
	        // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
	        mav.addObject("cateno", communityVO.getPlanID()); // redirect parameter 적용
	        
	        mav.addObject("url", "/community/msg"); // msg.jsp, redirect parameter 적용
	        mav.setViewName("redirect:/community/msg.do"); // Post -> Get - param...        
	      } else {
	        mav.addObject("cnt", "0"); // 업로드 할 수 없는 파일
	        mav.addObject("code", "check_upload_file_fail"); // 업로드 할 수 없는 파일
	        mav.addObject("url", "/community/msg"); // msg.jsp, redirect parameter 적용
	        mav.setViewName("redirect:/community/msg.do"); // Post -> Get - param...        
	      }
	    //} else {
	    //  mav.addObject("url", "/admin/login_need"); // /WEB-INF/views/admin/login_need.jsp
	    //  mav.setViewName("redirect:/community/msg.do"); 
	    //}
	    
	    return mav; // forward
	  }
}
