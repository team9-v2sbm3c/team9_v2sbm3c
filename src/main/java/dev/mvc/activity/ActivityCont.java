package dev.mvc.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ActivityCont {
	@Autowired
	@Qualifier("dev.mvc.activity.ActivityProc")
	private ActivityProcInter activityProc;
	
	public ActivityCont() {
		System.out.println("활동(activity) Cont실행");
	}
}
