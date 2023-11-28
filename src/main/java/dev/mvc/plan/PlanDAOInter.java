package dev.mvc.plan;

import java.util.ArrayList;

public interface PlanDAOInter {
	
	/**
	 * 생성
	 * @param planVO
	 * @return
	 */
	public int create_plan(PlanVO planVO);
	
	/**
	 * 여행 하나 조회
	 * @param planID
	 * @return
	 */
	public PlanVO read_plan(int planID);
	
	/**
	 * 여행 전체 조회
	 * @return
	 */
	public ArrayList<PlanVO> list_all_plan();
	
	/**
	 * 수정
	 * @param planVO
	 * @return
	 */
	public int update_plan(PlanVO planVO);
	
	/**
	 * 삭제
	 * @param planVO
	 * @return
	 */
	public int delete_plan(int planVO);
}
