package dev.mvc.plan;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.activity.ActivityProcInter;

@Controller
public class PlanCont {
	@Autowired
	@Qualifier("dev.mvc.plan.PlanProc")
	private PlanProcInter planProc;
	
	@Autowired
	@Qualifier("dev.mvc.activity.ActivityProc")
	private ActivityProcInter activityProc;
	
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
			mav.setViewName("redirect:/plan/list_all.do");
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
	  public ModelAndView list_all_plan() {
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
	    ArrayList<PlanVO> list = this.planProc.list_all_plan();
    	mav.addObject("list",list);
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
	    mav.setViewName("/plan/read.do"); 
	    
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
	  public ModelAndView delete_plan(int planID) { 
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/plan/delete");
	    
	    PlanVO planVO = this.planProc.read_plan(planID);
	    mav.addObject("planVO",planVO);
	    
	    ArrayList<PlanVO> list = this.planProc.list_all_plan();
    	mav.addObject("list",list);
	    
    	int count_by_planID = this.activityProc.count_by_planID(planID);
    	mav.addObject("count_by_planID", count_by_planID);
	     
	    return mav;
	  }
	
	/**
	 * 여행지 삭제 처리 
	 * @param session
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/delete.do" , method = RequestMethod.POST)
	public ModelAndView delete_plan_proc(int planID) {
		ModelAndView mav = new ModelAndView();
		
		this.activityProc.delete_by_planID(planID);
		
		int cnt = this.planProc.delete_plan(planID);
		
		if(cnt ==1) {
			mav.setViewName("redirect:/plan/list_all.do");
		}
		mav.addObject("cnt", cnt);
		
		
		
		return mav;
	}
}
