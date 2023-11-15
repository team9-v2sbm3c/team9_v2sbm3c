package dev.mvc.plan;

import java.util.ArrayList;

public interface PlanProcInter {
	/**
	 * 여행 전체 리스트 
	 * @return
	 */
	public ArrayList<PlanVO> list_all();
	
	/**
	 * 여행 조회
	 * @param planID
	 * @return
	 */
	public PlanVO read(int planID);
	
	/**
	 * 여행 수정
	 * @param planVO
	 * @return
	 */
	public int update_plan(PlanVO planVO);
	
	/**
	 * 여행 삭제
	 * @param planID
	 * @return
	 */
	public int delete_plan(int planID);
}
