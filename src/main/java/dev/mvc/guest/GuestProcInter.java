package dev.mvc.guest;

import java.util.ArrayList;

public interface GuestProcInter {
  /**
   * 중복 아이디 검사
   * @param guestID
   * @return 중복 아이디 갯수
   */
  public int checkID(String guestID);
  /**
   * 회원 가입
   * @param guestVO
   * @return 추가한 레코드 갯수
   */
  public int create(GuestVO guestVO);
  /**
   * 수정 처리
   * @param guestVO
   * @return
   */
  public int update(GuestVO guestVO);
  /**
   * 회원 삭제 처리
   * @param guestno
   * @return
   */
  public int delete(int guestno);
  /**
   * 회원 전체 목록
   * @return
   */
  public ArrayList<GuestVO> list();
  /**
   * guestno로 회원 정보 조회
   * @param guestno
   * @return
   */
  public GuestVO read(int guestno);
}
