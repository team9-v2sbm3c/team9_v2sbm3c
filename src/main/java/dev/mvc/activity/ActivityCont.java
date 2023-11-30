package dev.mvc.activity;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.plan.PlanVO;

@Controller
public class ActivityCont {
	@Autowired
	@Qualifier("dev.mvc.activity.ActivityProc")
	private ActivityProcInter activityProc;
	
	public ActivityCont() {
		System.out.println("활동(Activity) Cont실행");
	}
	
	/**
	 * 특정 여행지 안에 있는 활동 모두 출력 
	 * @param planID
	 * @return
	 */
	@RequestMapping(value="/activity/list_all.do", method = RequestMethod.GET)
	  public ModelAndView list_all_activity(int planID) {
	    ModelAndView mav = new ModelAndView();
	    
	    ArrayList<ActivityVO> list = this.activityProc.list_all_activity(planID);
	    mav.addObject("list",list);
	    return mav;
	  }
}
