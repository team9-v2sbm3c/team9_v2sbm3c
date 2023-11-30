package dev.mvc.activity;

import java.util.ArrayList;

public interface ActivityDAOInter {
	/**
	 * 생성
	 * @param activityVO
	 * @return
	 */
	public int create_activity(ActivityVO activityVO);
	
	/**
	 * 활동 하나 조회
	 * @param activityID
	 * @return
	 */
	public ActivityVO read_activity(int activityID);
	
	/**
	 * 활동 전체 조회
	 * @return
	 */
	public ArrayList<ActivityVO> list_all_activity(int planID);
	
	/**
	 * 수정
	 * @param activityVO
	 * @return
	 */
	public int update_activity(ActivityVO activityVO);
	
	/**
	 * 삭제
	 * @param activityVO
	 * @return
	 */
	public int delete_activity(int activityVO);
	
	/**
	 * 자식 레코드 산출
	 * @param planID
	 * @return
	 */
	public int count_by_planID(int planID);
	
	/**
	 * 특정 카테고리에 속한 모든 레코드 삭제
	 * @param planID
	 * @return
	 */
	public int delete_by_planID(int planID);
	
}
