package dev.mvc.guest;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

public interface GuestDAOInter {
  /**
   * 중복 아이디 검사
   * @param guestID
   * @return 중복 아이디 갯수
   */
  public int checkID(String id);
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
  /**
   * id로 회원 정보 조회
   * @param id
   * @return
   */
  public GuestVO readById(String id);
  
  /**
   * 로그인된 회원 계정인지 검사합니다.
   * @param session
   * @return true: 사용자
   */
  public boolean isGuest(HttpSession session);

  /**
   * 로그인된 회원 관리자 계정인지 검사합니다.
   * @param session
   * @return true: 사용자
   */
  public boolean isGuestOwner(HttpSession session);
  /**
   * 현재 패스워드 검사
   * @param map
   * @return 0: 일치하지 않음, 1: 일치함
   */
  public int passwd_check(HashMap<String, Object> map);
  
  /**
   * 패스워드 변경
   * @param map
   * @return 변경된 패스워드 갯수
   */
  public int passwd_update(HashMap<String, Object> map);
  
  /**
   * 로그인 처리
   */
  public int login(HashMap<String, Object> map);
  /**
   * 회원 정보 찾기
   * @param gname
   * @return
   */
  public GuestVO id_find(HashMap<String, Object> map);
  /**
   * 회원 탈퇴
   * @param guestno
   * @return
   */
  public int user_withdrawal(int guestno);
}
