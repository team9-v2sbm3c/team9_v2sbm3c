package dev.mvc.owner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.owner.OwnerProc")
public class OwnerProc implements OwnerProcInter{
  @Autowired
  private OwnerDAOInter ownerDAO;
  
  @Override
  public int login(OwnerVO ownerVO) {
    int cnt = this.ownerDAO.login(ownerVO);
    return cnt;
  }

  @Override
  public OwnerVO read_by_id(String id) {
    OwnerVO ownerVO = this.ownerDAO.read_by_id(id);
    return ownerVO;
  }

  @Override
  public boolean isOwner(HttpSession session) {
    boolean owner = false;
    
    if (session != null) {
      String owner_id = (String)session.getAttribute("owner_id");
      
      if (owner_id != null) {
        owner = true;
      }
    }
    
    return owner;
    
  }

  @Override
  public OwnerVO read(int ownerno) {
    OwnerVO ownerVO = this.ownerDAO.read(ownerno);
    return ownerVO;
  }
  

}
