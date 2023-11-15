package dev.mvc.plan;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.plan.PlanProc")
public class PlanProc implements PlanProcInter{
	@Autowired
	private PlanDAOInter planDAO;
	
	@Override
	public ArrayList<PlanVO> list_all() {
		ArrayList<PlanVO> list = this.planDAO.list_all();
		return list;
	}

	@Override
	public PlanVO read(int planID) {
		PlanVO planVO= this.planDAO.read(planID);
		return planVO;
	}

	@Override
	public int update_plan(PlanVO planVO) {
		int cnt=this.planDAO.update_plan(planVO);
		return cnt;
	}

	@Override
	public int delete_plan(int planID) {
		int cnt=this.planDAO.delete_plan(planID);
		return cnt;
	}
	
}
