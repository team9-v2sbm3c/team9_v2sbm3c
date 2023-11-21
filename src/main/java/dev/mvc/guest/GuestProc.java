package dev.mvc.guest;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.guest.GuestProc")
public class GuestProc implements GuestProcInter {
  @Autowired
  private GuestDAOInter guestDAO;

  public GuestProc(){
    // System.out.println("-> GuestProc created.");
  }
  
  @Override
  public int checkID(String guestID) {
    int cnt = this.guestDAO.checkID(guestID);
    return cnt;
  }

  @Override
  public int create(GuestVO guestVO) {
    int cnt = this.guestDAO.create(guestVO);
    return cnt;
  }

}
