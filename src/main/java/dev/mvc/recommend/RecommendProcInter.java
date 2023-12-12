package dev.mvc.recommend;

import java.util.ArrayList;

public interface RecommendProcInter {
	/**
	 * 회원 전체 관심사 조회
	 * @return
	 */
	public ArrayList<RecommendVO> list_all_recommend();
	
	/**
	 * 회원 한명 관심사 조회
	 * @param guestno
	 * @return
	 */
	public RecommendVO read_recommend(int guestno);
	
	/**
	 * 회원 관심사 삭제
	 * @param guestno
	 * @return
	 */
	public int delete_recommend(int guestno);

	
	


	
}
