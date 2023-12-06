package dev.mvc.owner;

public interface OwnerDAOInter {
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
   * 회원 정보 조회
   * @param ownerno
   * @return
   */
  public OwnerVO read(int ownerno);
}
