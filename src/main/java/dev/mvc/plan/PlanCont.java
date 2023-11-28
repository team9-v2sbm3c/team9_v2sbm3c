package dev.mvc.plan;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanCont {
	@Autowired
	@Qualifier("dev.mvc.plan.PlanProc")
	private PlanProcInter planProc;
	
	public PlanCont() {
		System.out.println("여행지(Plan) Cont 실행");
	}
	
	/**
	 * 여행지 카테고리 폼 
	 * @return
	 */
	@RequestMapping(value="/plan/create.do" , method = RequestMethod.GET)
	public ModelAndView create_plan() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/plan/create");
		
		return mav;
	}
	
	/**
	 * 여행지 카테고리 데이터 처리  
	 * @param planVO
	 * @return
	 */
	@RequestMapping(value="/plan/create.do" , method = RequestMethod.POST)
	public ModelAndView create_plan(PlanVO planVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.planProc.create_plan(planVO);
		
		if(cnt==1) {
			mav.setViewName("redirect:/plan/index.do");
		}else {
			mav.addObject("code", "create_fail");
			mav.setViewName("/plan/msg");
		}
		
		mav.addObject("cnt", cnt);
		
		return mav;
	}
	
	/**
	 * 여행지 전체 조회 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/plan/list_all.do", method = RequestMethod.GET)
	  public ModelAndView list_all(HttpSession session) {
	    ModelAndView mav = new ModelAndView();
	    
	    /*
	     * 관리자만 이용 가능하도록 수정 해야함.
	    if() {
	    	mav.setViewName("/plan/list_all");
	    	
	    	ArrayList<PlanVO> list = this.planProc.list_all_plan();
	    	mav.addObject("list",list);
	    }else {
	    	mav.setViewName("#");
	    }
	    */
	 
	    return mav;
	  }
	
	/**
	 * 여행지 한개 조회 
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/read.do", method = RequestMethod.GET)
	  public ModelAndView read_plan(int planID) { 
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/plan/read"); 
	    
	    PlanVO planVO = this.planProc.read_plan(planID);
	    mav.addObject("planVO", planVO);
	    
	    return mav;
	  }
	
	/**
	 * 여행지 수정 폼  
	 * @param session
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/update.do", method = RequestMethod.GET)
	  public ModelAndView update_plan(HttpSession session, int planID) { 
	    ModelAndView mav = new ModelAndView();
	    
	    /*
	     * 관리자만 이용 가능하도록 수정 해야함 
	    if() {
	    	mav.setViewName("#");
	    	
	    	PlanVO planVO = this.planProc.read_plan(planID);
	    	mav.addObject("planVO", planVO);
	    	
	    	ArrayList<PlanVO> list = this.planProc.list_all_plan();
	    	mav.addObject("list",list);
	    }else {
	    	mav.setViewName("#");
	    }
	    */
	    
	        
	    return mav;
	  }
	
	/**
	 * 여행지 수정 처리 
	 * @param planVO
	 * @return
	 */
	@RequestMapping(value="/plan/update.do" , method = RequestMethod.POST)
	public ModelAndView update_plan(PlanVO planVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.planProc.update_plan(planVO);
		
		if(cnt==1) {
			mav.setViewName("redirect:/");
		}else {
			mav.addObject("code", "update_fail");
			mav.setViewName("/plan/msg");
		}
		
		mav.addObject("cnt", cnt);
		
		return mav;
	}
	
	/**
	 * 여행지 삭제 폼 
	 * @param session
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/delete.do", method = RequestMethod.GET)
	  public ModelAndView delete_plan(HttpSession session, int planID) { 
	    ModelAndView mav = new ModelAndView();
	    
	    
	    
	    /*
	     * 관리자일 경우 여행지를 삭제할 수 있도록 함 , 자식 테이블 삭제 여부에 대해서 물어보는 코드 작성 
	    if() {
	    	PlanVO planVO = this.planProc.read_plan(planID); 
		    mav.addObject("palnVO", planVO);
		    
		    ArrayList<PlanVO> list = this.planProc.list_all_plan();
		    mav.addObject("list",list);
	    }else {
	    	mav.setViewName("#"); // 관리자가 아닐경우 
	    }
	    */
	    
	     
	    return mav;
	  }
	
	/**
	 * 여행지 삭제 처리 
	 * @param session
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/delete.do" , method = RequestMethod.POST)
	public ModelAndView delete_plan_proc(HttpSession session, int planID) {
		ModelAndView mav = new ModelAndView();
		
 
		
		/*
		 * 여행지 삭제는 관리자만 할 수 있어야 함으로 만들면 추가적으로 수정 들어감 
		if() {
			
//			this.planProc.delete_by_planId(planId); // 자식 레코드 삭제 (activity) 삭제 
//			추후 자식 테이블 Contents 삭제 예정 코드 추가 요망 . 선생님께 질문 해봐야 할거 같음 .
			
			int cnt = this.planProc.delete_plan(planID);
			
			if(cnt == 1) {
				mav.setViewName("redirect:/");
			}else {
				mav.addObject("code", "delete_fail");
				mav.setViewName("/plan/msg");
			}
			mav.addObject("cnt", cnt);
		}else {
			mav.setViewName("#");
		}
		*/
		
		
		
		return mav;
	}
}
