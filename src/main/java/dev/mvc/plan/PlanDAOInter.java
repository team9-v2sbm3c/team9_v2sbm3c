package dev.mvc.plan;

import java.util.ArrayList;

public interface PlanDAOInter {
	
	/**
	 * 여행 등록 
	 * @param planVO
	 * @return
	 */
	public int create_plan(PlanVO planVO);
	
	/**
	 * 여행 전체 리스트 
	 * @return
	 */
	public ArrayList<PlanVO> list_all_plan();
	
	/**
	 * 여행 조회
	 * @param planID
	 * @return
	 */
	public PlanVO read_plan(int planID);
	
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
