package dev.mvc.team9_v2sbm3c;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.plan.PlanProcInter;
import dev.mvc.plan.PlanVO;

@Controller
public class HomeCont {
	@Autowired
	@Qualifier("dev.mvc.plan.PlanProc")
	private PlanProcInter planProc;
	public HomeCont() {
		System.out.println("홈(Home) Cont 실행.");
	}

	// http://localhost:9093
	@RequestMapping(value = { "", "/", "/index.do" }, method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		ArrayList<PlanVO> third_sc = this.planProc.list_all_plan();
	    mav.addObject("third_sc", third_sc);
	    
		mav.setViewName("/index");
		return mav;
	}
}
