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
		System.out.println("여행(Plan) Cont 실행");
	}
	
	/**
	 * 여행 Create
	 * @return
	 */
	@RequestMapping(value="/plan/create.do",method = RequestMethod.GET)
	public ModelAndView create_plan() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/plan/create");
		return mav;
	}
	
	/**
	 * 여행 Create 데이터 처리 
	 * @param planVO
	 * @return
	 */
	@RequestMapping(value="/plan/create.do",method = RequestMethod.POST)
	public ModelAndView create_plan(PlanVO planVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt=this.planProc.create_plan(planVO);
		
		if(cnt==1) {
			//create 잘 되었을 경우 실행 페이지
		}else {
			//실패시 페이지 
		}
		
		mav.addObject("cnt",cnt);
		
		return mav;
	}
	
	/**
	 * 여행 Read 
	 * 여행 전체 
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/index.do",method = RequestMethod.GET)
	public ModelAndView list_all_plan() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		
		ArrayList<PlanVO> list = this.planProc.list_all_plan();
		mav.addObject("list",list);
		
		return mav;
	}
	
	@RequestMapping(value="/plan/update.do", method = RequestMethod.GET)
	  public ModelAndView update_plan(HttpSession session, int planID) { 
	    ModelAndView mav = new ModelAndView();
	    
	    /**
	     * 관리자시 여행을 수정할 수 있도록 변경할 예정 
	     */
	    return mav;
	  }
	
	/**
	 * 여행 Update 데이터 처리 
	 * @param planVO
	 * @return
	 */
	@RequestMapping(value="/plan/update.do",method = RequestMethod.POST)
	public ModelAndView update_plan(PlanVO planVO) {
		ModelAndView mav = new ModelAndView();
		
		int cnt=this.planProc.update_plan(planVO);
		
		if(cnt==1) {
			//update 잘 되었을 경우 실행 페이지
		}else {
			//실패시 페이지 
		}
		
		mav.addObject("cnt",cnt);
		
		return mav;
	}
	
	
	/**
	 * 여행 Delete 폼
	 * @param session
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/plan/delete.do", method = RequestMethod.GET)
	  public ModelAndView delete_plan(HttpSession session, int planID) { 
	    ModelAndView mav = new ModelAndView();
	    
	    
	    
	    return mav;
	  }
	
	/**
	 * 여행 Delete 데이터 처리 
	 * @param planVO
	 * @return
	 */
	@RequestMapping(value="/plan/delete.do",method = RequestMethod.POST)
	public ModelAndView delete_plan(PlanVO planVO) {
		ModelAndView mav = new ModelAndView();
		
		this.planProc.delete_plan(planVO.getPlanID());
		
		return mav;
	}
	
}
