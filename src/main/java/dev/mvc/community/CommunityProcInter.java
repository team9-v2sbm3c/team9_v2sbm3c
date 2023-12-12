package dev.mvc.community;

import java.util.ArrayList;
import java.util.HashMap;

public interface CommunityProcInter {

	/**
	 * 등록 
	 * @param communityVO
	 * @return
	 */
	public int create_community(CommunityVO communityVO);
	
	/**
	 * 모든 게시글 출력 
	 * @return
	 */
	public ArrayList<CommunityVO> list_all_community();
	
	/**
	 * 지역별 게시글 출력
	 * @param planID
	 * @return
	 */
	public ArrayList<CommunityVO> list_by_planID(int planID);
	
	/**
	 * 활동별 게시글 출력
	 * @param activecodeno
	 * @return
	 */
	public ArrayList<CommunityVO> list_by_activecodeno(int activecodeno);
	
	/**
	 * 글 조회 
	 * @param communityID
	 * @return
	 */
	public CommunityVO read_community(int communityID);
	
	/**
	   * map 등록, 수정, 삭제
	   * @param map
	   * @return 수정된 레코드 갯수
	   */
	  public int map(HashMap<String, Object> map);

	  /**
	   * youtube 등록, 수정, 삭제
	   * @param youtube
	   * @return 수정된 레코드 갯수
	   */
	  public int youtube(HashMap<String, Object> map);
	  
	  /**
	   * 지역별 검색 목록
	   * @param map
	   * @return
	   */
	  public ArrayList<CommunityVO> list_by_planID_search(HashMap<String, Object> hashMap);
	  
	  /**
	   * 지역별 검색된 레코드 갯수
	   * @param map
	   * @return
	   */
	  public int search_count(HashMap<String, Object> hashMap);
	  
	  /**
	   * 지역별 검색 목록 + 페이징
	   * @param contentsVO
	   * @return
	   */
	  public ArrayList<CommunityVO> list_by_planID_search_paging(CommunityVO communityVO);
	  
	  /**
	   * 게시글 삭제 
	   * @param communityID
	   */
	  public int delete_community(int communityID);
	  
	  
	  public String pagingBox(int planID, int now_page, String list_file, int search_count);
	  
	  /**
	   * 지역 게시물 자료수 출력 
	   * @param planID
	   * @return
	   */
	  public int count_by_planID(int planID);
	  
	  /**
	   * 지역 관련 모든 레코드 삭제 
	   * @param planID
	   * @return
	   */
	  public int delete_by_planID(int planID);
}
