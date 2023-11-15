package dev.mvc.plan;

import java.util.ArrayList;

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
	 * 여행 전체 
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/index.do",method = RequestMethod.GET)
	public ModelAndView list_all(int planID) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		
		ArrayList<PlanVO> list = this.planProc.list_all();
		mav.addObject("list",list);
		
		return mav;
	}
	/**
	 * 여행 
	 * @param planID
	 * @return
	 */
	/*
	@RequestMapping(value="/index.do",method = RequestMethod.GET)
	public ModelAndView read(int planID) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		
		PlanVO planVO = this.planProc.read(planID);
		mav.addObject("planVO",planVO);
		return mav;
	}
	*/
}
