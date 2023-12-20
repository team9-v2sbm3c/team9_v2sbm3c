package dev.mvc.comments;

import java.util.List;

public interface CommentsProcInter {
	  public int create(CommentsVO commentsVO);
	  
	  public List<CommentsVO> list();
	  
	  public List<CommentsVO> list_by_communityID(int communityID);
	  
	  public List<CommentsGuestVO> list_by_communityID_join(int communityID);
	  
	  public int delete(int commentsno);
}
