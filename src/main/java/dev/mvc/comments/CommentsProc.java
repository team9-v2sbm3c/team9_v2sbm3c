package dev.mvc.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.tool.Tool;

@Component("dev.mvc.comments.CommentsProc")
public class CommentsProc implements CommentsProcInter {
	
	@Autowired
	private CommentDAOInter commentsDAO;
	
	
	@Override
	public int create(CommentsVO commentsVO) {
		int cnt = this.commentsDAO.create(commentsVO);
		return cnt;
	}

	@Override
	public List<CommentsVO> list() {
		List<CommentsVO> list = commentsDAO.list();
		return list;
	}

	@Override
	public List<CommentsVO> list_by_communityID(int communityID) {
		List<CommentsVO> list = commentsDAO.list_by_communityID(communityID);
	    String content = "";
	    
	    // 특수 문자 변경
	    for (CommentsVO commentsVO:list) {
	      content = commentsVO.getComments();
	      content = Tool.convertChar(content);
	      commentsVO.setComments(content);
	    }
	    return list;
	}

	@Override
	public List<CommentsGuestVO> list_by_communityID_join(int communityID) {
		List<CommentsGuestVO> list = commentsDAO.list_by_communityID_join(communityID);
	    String content = "";
	    
	    // 특수 문자 변경
	    for (CommentsGuestVO commentsGuestVO:list) {
	      content = commentsGuestVO.getComments();
	      content = Tool.convertChar(content);
	      commentsGuestVO.setComments(content);
	    }
	    return list;
	}

	@Override
	public int delete(int commentsno) {
		int count = commentsDAO.delete(commentsno);
	    return count;
	}

}
