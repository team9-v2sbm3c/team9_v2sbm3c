package dev.mvc.activecode;

public interface ActivecodeProcInt {
	/**
	 * 활동 생성
	 * @param activecodeno
	 * @return
	 */
	public int create_activecode(ActivecodeVO activecodeno);
	/**
	 * 활동 모두 조회
	 * @param activecodeno
	 * @return
	 */
	public ActivecodeVO read_activecode(int activecodeno);
	
	/**
	 * 활동명 업데이트
	 * @param activecodeVO
	 * @return
	 */
	public int update_activecode(ActivecodeVO activecodeVO);
	
	/**
	 * 활동 삭제
	 * @param activecodeno
	 * @return
	 */
	public int delete_activecode(int activecodeno);
}
