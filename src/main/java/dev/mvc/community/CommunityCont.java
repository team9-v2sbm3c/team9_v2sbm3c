package dev.mvc.community;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.plan.PlanVO;
import dev.mvc.plan.PlanVO;
import dev.mvc.community.Community;
import dev.mvc.community.CommunityVO;
import dev.mvc.community.CommunityVO;
import dev.mvc.owner.OwnerProcInter;
import dev.mvc.plan.PlanProcInter;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class CommunityCont {

	@Autowired
	@Qualifier("dev.mvc.plan.PlanProc")
	private PlanProcInter planProc;

	@Autowired
	@Qualifier("dev.mvc.community.CommunityProc")
	private CommunityProcInter communityProc;

	@Autowired
	@Qualifier("dev.mvc.owner.OwnerProc")
	private OwnerProcInter ownerProc;

	public CommunityCont() {
		System.out.println("커뮤니티(community) Cont 실행");
	}

	/**
	 * POST 요청시 JSP 페이지에서 JSTL 호출 기능 지원 , 새로고침 방지
	 * 
	 * @param url
	 * @return
	 */
	@RequestMapping(value = "/community/msg.do", method = RequestMethod.GET)
	public ModelAndView msg(String url) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName(url); // forward

		return mav; // forward
	}

	/**
	 * 등록 폼
	 * 
	 * @param planID
	 * @return
	 */
	// http://localhost:9093/community/create.do?planID=1
	@RequestMapping(value = "/community/create.do", method = RequestMethod.GET)
	public ModelAndView create_community(int planID) {
		ModelAndView mav = new ModelAndView();

		PlanVO planVO = this.planProc.read_plan(planID);
		mav.addObject("planVO", planVO);
		
		

		mav.setViewName("/community/create");

		return mav;
	}

	/**
	 * 등록 처리
	 * 
	 * @param communityVO
	 * @return
	 */
	@RequestMapping(value = "/community/create.do", method = RequestMethod.POST)
	public ModelAndView create(HttpServletRequest request, HttpSession session, CommunityVO communityVO) {
		ModelAndView mav = new ModelAndView();

		if (ownerProc.isOwner(session)) {
			// ------------------------------------------------------------------------------
			// 파일 전송 코드 시작
			// ------------------------------------------------------------------------------
			String file1 = ""; // 원본 파일명 image
			String file1saved = ""; // 저장된 파일명, image
			String thumb1 = ""; // preview image

			String upDir = Community.getUploadDir(); // 파일을 업로드할 폴더 준비
			System.out.println("-> upDir: " + upDir);

			// 전송 파일이 없어도 file1MF 객체가 생성됨.
			// <input type='file' class="form-control" name='file1MF' id='file1MF'
			// value='' placeholder="파일 선택">
			MultipartFile mf = communityVO.getFile1MF();

			file1 = mf.getOriginalFilename(); // 원본 파일명 산출, 01.jpg
			System.out.println("-> 원본 파일명 산출 file1: " + file1);

			if (Tool.checkUploadFile(file1) == true) { // 업로드 가능한 파일인지 검사
				long size1 = mf.getSize(); // 파일 크기

				if (size1 > 0) { // 파일 크기 체크
					// 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
					file1saved = Upload.saveFileSpring(mf, upDir);

					if (Tool.isImage(file1saved)) { // 이미지인지 검사
						// thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
						thumb1 = Tool.preview(upDir, file1saved, 200, 150);
					}

				}

				communityVO.setMainImage(file1); // 순수 원본 파일명
				communityVO.setMainImagePreview(file1saved); // 저장된 파일명(파일명 중복 처리)
				communityVO.setCimage(thumb1); // 원본이미지 축소판
				communityVO.setSize1(size1); // 파일 크기
				// ------------------------------------------------------------------------------
				// 파일 전송 코드 종료
				// ------------------------------------------------------------------------------

				// Call By Reference: 메모리 공유, Hashcode 전달
				//int guestno = (int) session.getAttribute("guestno"); // adminno FK
				communityVO.setGuestno(1);

				int cnt = this.communityProc.create_community(communityVO);

				// ------------------------------------------------------------------------------
				// PK의 return
				// ------------------------------------------------------------------------------
				// System.out.println("--> communityID: " + communityVO.getCommunityno());
				// mav.addObject("communityID", communityVO.getCommunityno()); // redirect
				// parameter 적용
				// ------------------------------------------------------------------------------

				if (cnt == 1) {
					mav.addObject("code", "create_success");
					// planProc.increaseCnt(communityVO.getPlanID()); // 글수 증가
				} else {
					mav.addObject("code", "create_fail");
				}
				mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

				// System.out.println("--> planID: " + communityVO.getPlanID());
				// redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
				mav.addObject("planID", communityVO.getPlanID()); // redirect parameter 적용

				mav.addObject("url", "/community/msg"); // msg.jsp, redirect parameter 적용
				mav.setViewName("redirect:/community/msg.do"); // Post -> Get - param...
			} else {
				mav.addObject("cnt", "0"); // 업로드 할 수 없는 파일
				mav.addObject("code", "check_upload_file_fail"); // 업로드 할 수 없는 파일
				mav.addObject("planID",communityVO.getPlanID());
				mav.addObject("url", "/community/msg"); // msg.jsp, redirect parameter 적용
				mav.setViewName("redirect:/community/msg.do"); // Post -> Get - param...
			}
		} else {
			mav.addObject("url", "/owner/login_need"); //
			mav.setViewName("redirect:/community/msg.do");
		}
		return mav; // forward
	}

	/**
	 * 전체 목록
	 * 
	 * @return
	 */
	@RequestMapping(value = "/community/list_all.do", method = RequestMethod.GET)
	public ModelAndView list_all_community(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (this.ownerProc.isOwner(session) == true) {
			mav.setViewName("/community/list_all");

			ArrayList<CommunityVO> list = this.communityProc.list_all_community();

			// for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
			for (CommunityVO communityVO : list) {
				String title = communityVO.getTitle();
				String content = communityVO.getContent();

				title = Tool.convertChar(title); // 특수 문자 처리
				content = Tool.convertChar(content);

				communityVO.setTitle(title);
				communityVO.setContent(content);
			}
			mav.addObject("list", list);
		} else {
			mav.setViewName("/owner/login_need");
		}
		return mav;
	}
	
	@RequestMapping(value = "/community/list_by_planID.do", method = RequestMethod.GET)
	public ModelAndView list_by_planID(int planID) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/community/list_by_planID");
		
		PlanVO planVO = this.planProc.read_plan(planID);
		mav.addObject("planVO", planVO);
		
		ArrayList<CommunityVO> list=this.communityProc.list_by_planID(planID);
		
		for (CommunityVO communityVO : list) {
			String title = communityVO.getTitle();
			String content = communityVO.getContent();

			title = Tool.convertChar(title); // 특수 문자 처리
			content = Tool.convertChar(content);

			communityVO.setTitle(title);
			communityVO.setContent(content);
		}
		
		mav.addObject("list", list);
		
		return mav;
	}

//	/**
//	 * 목록 + 검색 + 페이징
//	 * 
//	 * @param communityVO
//	 * @return
//	 */
//	@RequestMapping(value = "/community/list_by_planID.do", method = RequestMethod.GET)
//	public ModelAndView list_by_planID(CommunityVO communityVO) {
//		ModelAndView mav = new ModelAndView();
//
//		// 검색 목록
//		ArrayList<CommunityVO> list = communityProc.list_by_planID_search_paging(communityVO);
//
//		// for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
//		for (CommunityVO vo : list) {
//			String title = vo.getTitle();
//			String content = vo.getContent();
//
//			title = Tool.convertChar(title); // 특수 문자 처리
//			content = Tool.convertChar(content);
//
//			vo.setTitle(title);
//			vo.setContent(content);
//
//		}
//
//		mav.addObject("list", list);
//
//		PlanVO planVO = planProc.read_plan(communityVO.getPlanID());
//		mav.addObject("planVO", planVO);
//
//		HashMap<String, Object> hashMap = new HashMap<String, Object>();
//		hashMap.put("planID", communityVO.getPlanID());
//
//		int search_count = this.communityProc.search_count(hashMap); // 검색된 레코드 갯수 -> 전체 페이지 규모 파악
//		mav.addObject("search_count", search_count);
//
//		/*
//		 * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
//		 * 18 19 20 [다음]
//		 * 
//		 * @param planID 카테고리번호
//		 * 
//		 * @param now_page 현재 페이지
//		 * 
//		 * @param word 검색어
//		 * 
//		 * @param list_file 목록 파일명
//		 * 
//		 * @return 페이징용으로 생성된 HTML/CSS tag 문자열
//		 */
//		String paging = communityProc.pagingBox(communityVO.getPlanID(), communityVO.getNow_page(), "list_by_planID.do",
//				search_count);
//		mav.addObject("paging", paging);
//
//		// mav.addObject("now_page", now_page);
//
//		mav.setViewName("/community/list_by_planID"); // /community/list_by_planID.jsp
//
//		return mav;
//	}
	
	/**
	 * 목록 + 검색 + 페이징 + GRID
	 * @param communityVO
	 * @return
	 */
	@RequestMapping(value = "/community/list_by_planID_grid.do", method = RequestMethod.GET)
	  public ModelAndView list_by_planID_grid(CommunityVO communityVO) {
	     ModelAndView mav = new ModelAndView();
	   
	   // 검색 목록
	   ArrayList<CommunityVO> list = communityProc.list_by_planID_search_paging(communityVO);
	   
	   // for문을 사용하여 객체를 추출, Call By Reference 기반의 원본 객체 값 변경
	   for (CommunityVO vo : list) {
	     String title = vo.getTitle();
	     String content = vo.getContent();
	     
	     title = Tool.convertChar(title);  // 특수 문자 처리
	       content = Tool.convertChar(content); 
	       
	       vo.setTitle(title);
	       vo.setContent(content);  
	   
	     }
	     
	     mav.addObject("list", list);
	   
	     PlanVO planVO = planProc.read_plan(communityVO.getPlanID());
	     mav.addObject("planVO", planVO);
	     
	     HashMap<String, Object> hashMap = new HashMap<String, Object>();
	     hashMap.put("planID", communityVO.getPlanID());
	     
	     
	     int search_count = this.communityProc.search_count(hashMap);  // 검색된 레코드 갯수 ->  전체 페이지 규모 파악
	     mav.addObject("search_count", search_count);
	   
	     /*
	  * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
	  * 18 19 20 [다음]
	  * @param planID 카테고리번호
	  * @param now_page 현재 페이지
	  * @param word 검색어
	  * @param list_file 목록 파일명
	  * @return 페이징용으로 생성된 HTML/CSS tag 문자열
	  */
	   String paging = communityProc.pagingBox(communityVO.getPlanID(), communityVO.getNow_page(), "list_by_planID_grid.do", search_count);
	   mav.addObject("paging", paging);
	   
	     // mav.addObject("now_page", now_page);
	   
	   mav.setViewName("/community/list_by_planID_grid");  // /community/list_by_planID_grid.jsp
	   
	     return mav;
	   }

	/**
	 * 글 조회
	 * 
	 * @param communityID
	 * @return
	 */
	@RequestMapping(value = "/community/read.do", method = RequestMethod.GET)
	public ModelAndView read_community(int communityID) { // int planID = (int)request.getParameter("planID");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/community/read"); // /WEB-INF/views/community/read.jsp

		CommunityVO communityVO = this.communityProc.read_community(communityID);

		String title = communityVO.getTitle();
		String content = communityVO.getContent();

		title = Tool.convertChar(title); // 특수 문자 처리
		content = Tool.convertChar(content);

		communityVO.setTitle(title);
		communityVO.setContent(content);

		long size1 = communityVO.getSize1();
		String size1_label = Tool.unit(size1);
		communityVO.setSize1_label(size1_label);

		mav.addObject("communityVO", communityVO);

		PlanVO planVO = this.planProc.read_plan(communityVO.getPlanID());
		mav.addObject("planVO", planVO);

		return mav;
	}
	
	/**
	 * MAP 폼 
	 * @param communityID
	 * @return
	 */
	@RequestMapping(value="/community/map.do", method=RequestMethod.GET )
	  public ModelAndView map(int communityID) {
	    ModelAndView mav = new ModelAndView();

	    CommunityVO communityVO = this.communityProc.read_community(communityID); // map 정보 읽어 오기
	    mav.addObject("communityVO", communityVO); // request.setAttribute("communityVO", communityVO);

	    PlanVO planVO = this.planProc.read_plan(communityVO.getPlanID()); // 그룹 정보 읽기
	    mav.addObject("planVO", planVO); 

	    mav.setViewName("/community/map"); // /WEB-INF/views/community/map.jsp
	        
	    return mav;
	  }
	
	/**
	 * MAP 처리
	 * @param communityID
	 * @return
	 */
	@RequestMapping(value="/community/map.do", method=RequestMethod.POST )
	  public ModelAndView map_proc(int communityID,String map) {
		ModelAndView mav = new ModelAndView();
	    
	    HashMap<String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("communityID", communityID);
	    hashMap.put("map", map);
	    
	    this.communityProc.map(hashMap);
	    
	    mav.setViewName("redirect:/community/read.do?communityID=" + communityID); 
	    // /webapp/WEB-INF/views/community/read.jsp
	    
	    return mav;
	  }
	
	/**
	 * YOUTUBE 폼
	 * @param communityID
	 * @return
	 */
	@RequestMapping(value="/community/youtube.do", method=RequestMethod.GET )
	  public ModelAndView youtube(int communityID) {
	    ModelAndView mav = new ModelAndView();

	    CommunityVO communityVO = this.communityProc.read_community(communityID); // map 정보 읽어 오기
	    mav.addObject("communityVO", communityVO); // request.setAttribute("communityVO", communityVO);

	    PlanVO planVO = this.planProc.read_plan(communityVO.getPlanID()); // 그룹 정보 읽기
	    mav.addObject("planVO", planVO); 

	    mav.setViewName("/community/youtube"); // /WEB-INF/views/community/map.jsp
	        
	    return mav;
	  }
	
	
	/**
	 * YOUTUBE 처리
	 * @param communityID
	 * @param youtube
	 * @return
	 */
	@RequestMapping(value="/community/youtube.do", method=RequestMethod.POST )
	  public ModelAndView youtube_proc(int communityID,String youtube) {
		ModelAndView mav = new ModelAndView();
	    
	    HashMap<String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("communityID", communityID);
	    hashMap.put("youtube", youtube);
	    
	    this.communityProc.youtube(hashMap);
	    
	    mav.setViewName("redirect:/community/read.do?communityID=" + communityID); 
	    // /webapp/WEB-INF/views/community/read.jsp
	    
	    return mav;
	  }
	
	/**
	 * 삭제 폼
	 * @param session
	 * @param communityID
	 * @return
	 */
	 @RequestMapping(value = "/community/delete.do", method = RequestMethod.GET)
	  public ModelAndView delete(HttpSession session, int communityID) {
	    ModelAndView mav = new ModelAndView();
	    
	    if (ownerProc.isOwner(session)) { // 관리자로 로그인한경우
	      CommunityVO communityVO = this.communityProc.read_community(communityID);
	      mav.addObject("communityVO", communityVO);
	      
	      PlanVO planVO = this.planProc.read_plan(communityVO.getPlanID());
	      mav.addObject("planVO", planVO);
	      
	      mav.setViewName("/community/delete"); // /WEB-INF/views/community/delete.jsp
	      
	    } else {
	      mav.addObject("url", "/owner/login_need"); // /WEB-INF/views/admin/login_need.jsp
	      mav.setViewName("redirect:/community/msg.do"); 
	    }


	    return mav; // forward
	  }
	
	/**
	 * 글 삭제 
	 * @param communityVO
	 * @return
	 */
	 @RequestMapping(value = "/community/delete.do", method = RequestMethod.POST)
	  public ModelAndView delete(CommunityVO communityVO) {
	    ModelAndView mav = new ModelAndView();
	    
	    // -------------------------------------------------------------------
	    // 파일 삭제 시작
	    // -------------------------------------------------------------------
	    // 삭제할 파일 정보를 읽어옴.
	    CommunityVO communityVO_read = communityProc.read_community(communityVO.getCommunityID());
	        
	    String file1saved = communityVO.getMainImagePreview();
	    String thumb1 = communityVO.getCimage();
	    
	    String uploadDir = Community.getUploadDir();
	    Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
	    Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
	    // -------------------------------------------------------------------
	    // 파일 삭제 종료
	    // -------------------------------------------------------------------
	        
	    this.communityProc.delete_community(communityVO.getCommunityID()); // DBMS 삭제
	        
	    // -------------------------------------------------------------------------------------
	    // 마지막 페이지의 마지막 레코드 삭제시의 페이지 번호 -1 처리
	    // -------------------------------------------------------------------------------------    
	    // 마지막 페이지의 마지막 10번째 레코드를 삭제후
	    // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
	    // 페이지수를 4 -> 3으로 감소 시켜야함, 마지막 페이지의 마지막 레코드 삭제시 나머지는 0 발생
	    int now_page = communityVO.getNow_page();
	    
	    HashMap<String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("planID", communityVO.getPlanID());
	    
	    if (communityProc.search_count(hashMap) % Community.RECORD_PER_PAGE == 0) {
	      now_page = now_page - 1; // 삭제시 DBMS는 바로 적용되나 크롬은 새로고침등의 필요로 단계가 작동 해야함.
	      if (now_page < 1) {
	        now_page = 1; // 시작 페이지
	      }
	    }
	    // -------------------------------------------------------------------------------------

	    mav.addObject("planID", communityVO.getPlanID());
	    mav.addObject("now_page", now_page);
	    mav.setViewName("redirect:/community/list_by_planID.do"); 
	    
	    return mav;
	  }   
	      
	  // http://localhost:9091/community/delete_by_planID.do?planID=1
	  // 파일 삭제 -> 레코드 삭제
	  @RequestMapping(value = "/community/delete_by_planID.do", method = RequestMethod.GET)
	  public String delete_by_planID(int planID) {
	    ArrayList<CommunityVO> list = this.communityProc.list_by_planID(planID);
	    
	    for(CommunityVO communityVO : list) {
	      // -------------------------------------------------------------------
	      // 파일 삭제 시작
	      // -------------------------------------------------------------------
	      String file1saved = communityVO.getMainImagePreview();
	      String thumb1 = communityVO.getCimage();
	      
	      String uploadDir = Community.getUploadDir();
	      Tool.deleteFile(uploadDir, file1saved);  // 실제 저장된 파일삭제
	      Tool.deleteFile(uploadDir, thumb1);     // preview 이미지 삭제
	      // -------------------------------------------------------------------
	      // 파일 삭제 종료
	      // -------------------------------------------------------------------
	    }
	    
	    int cnt = this.communityProc.delete_by_planID(planID);
	    System.out.println("-> count: " + cnt);
	    
	    return "";
	  
	  }
}
