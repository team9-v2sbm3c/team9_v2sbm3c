package dev.mvc.guest;

import java.util.ArrayList;

public interface GuestDAOInter {
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
}
