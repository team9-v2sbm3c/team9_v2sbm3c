package dev.mvc.plan;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component("dev.mvc.plan.PlanProc")
public class PlanProc implements PlanProcInter {
	private PlanDAOInter planDAO;
	
	@Override
	public int create_plan(PlanVO planVO) {
		int cnt = this.planDAO.create_plan(planVO);
		return cnt;
	}

	@Override
	public PlanVO read_plan(int planID) {
		PlanVO planVO = this.planDAO.read_plan(planID);
		return planVO;
	}

	@Override
	public ArrayList<PlanVO> list_all_plan() {
		ArrayList<PlanVO> list = this.planDAO.list_all_plan();
		return list;
	}

	@Override
	public int update_plan(PlanVO planVO) {
		int cnt = this.planDAO.update_plan(planVO);
		return cnt;
	}

	@Override
	public int delete_plan(int planVO) {
		int cnt = this.planDAO.delete_plan(planVO);
		return cnt;
	}
	
}
