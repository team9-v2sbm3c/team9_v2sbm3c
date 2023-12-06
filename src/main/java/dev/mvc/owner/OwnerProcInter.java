package dev.mvc.owner;

import javax.servlet.http.HttpSession;

public interface OwnerProcInter {
  /**
  * 로그인
  * @param OwnerVO
  * @return
  */
 public int login(OwnerVO ownerVO);
 
 /**
  * 회원 정보
  * @param String
  * @return
  */
 public OwnerVO read_by_id(String id);
 
 /**
  * 관리자 로그인 체크
  * @param session
  * @return
  */
 public boolean isOwner(HttpSession session);
 
 /**
  * 회원 정보 조회
  * @param ownerno
  * @return
  */
 public OwnerVO read(int ownerno);

}
