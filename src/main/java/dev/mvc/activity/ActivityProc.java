package dev.mvc.activity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.activity.ActivityProc")
public class ActivityProc implements ActivityProcInter {
	@Autowired
	private ActivityDAOInter activityDAO;
}
