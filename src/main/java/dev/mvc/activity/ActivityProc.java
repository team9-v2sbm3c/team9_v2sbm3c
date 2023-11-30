package dev.mvc.activity;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.activity.ActivityProc")
public class ActivityProc implements ActivityProcInter {
	@Autowired
	private ActivityDAOInter activityDAO;
	
	@Override
	public int create_activity(ActivityVO activityVO) {
		int cnt = this.activityDAO.create_activity(activityVO);
		return cnt;
	}

	@Override
	public ActivityVO read_activity(int activityID) {
		ActivityVO activityVO = this.activityDAO.read_activity(activityID);
		return activityVO;
	}

	@Override
	public ArrayList<ActivityVO> list_all_activity(int planID) {
		ArrayList<ActivityVO> list = this.activityDAO.list_all_activity(planID);
		return list;
	}

	@Override
	public int update_activity(ActivityVO activityVO) {
		int cnt = this.activityDAO.update_activity(activityVO);
		return cnt;
	}

	@Override
	public int delete_activity(int activityVO) {
		int cnt = this.activityDAO.delete_activity(activityVO);
		return cnt;
	}

	@Override
	public int count_by_planID(int planID) {
		int cnt = this.activityDAO.count_by_planID(planID);
		return cnt;
	}

	@Override
	public int delete_by_planID(int planID) {
		int cnt = this.activityDAO.delete_by_planID(planID);
		return cnt;
	}

}
