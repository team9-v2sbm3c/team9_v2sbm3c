package dev.mvc.comments;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.guest.GuestProc;

@Controller
public class CommentCont {
	@Autowired
	@Qualifier("dev.mvc.comments.CommentsProc")
	private CommentsProcInter commentsProc;
	
	@Autowired
	@Qualifier("dev.mvc.guest.GuestProc")
	private GuestProc guestProc;
	
	public CommentCont() {
		System.out.println("댓글(Comment) 실행");
	}
	
	@ResponseBody
	@RequestMapping(value = "/comments/create.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String create(CommentsVO commentsVO) {
		int cnt = commentsProc.create(commentsVO);

		JSONObject obj = new JSONObject();
		obj.put("cnt", cnt);
		return obj.toString(); // {"cnt":1}
	}

	@RequestMapping(value = "/comments/list.do", method = RequestMethod.GET)
	public ModelAndView list(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (guestProc.isGuestOwner(session)) {
			List<CommentsVO> list = commentsProc.list();

			mav.addObject("list", list);
			mav.setViewName("/comments/list"); // /webapp/comments/list.jsp

		} else {
			mav.addObject("return_url", "/comments/list.do"); // 로그인 후 이동할 주소 ★

			mav.setViewName("redirect:/guest/login.do"); // /WEB-INF/views/guest/login_ck_form.jsp
		}

		return mav;
	}

	/**
	 * <xmp>
	 * 
	 * 글이 없는 경우: {"list":[]} 글이 있는 경우 {"list":[ {"guestno":1,"rdate":"2019-12-18
	 * 16:46:43","passwd":"123","commentsno":3,"content":"댓글 3","communityID":1} ,
	 * {"guestno":1,"rdate":"2019-12-18
	 * 16:46:39","passwd":"123","commentsno":2,"content":"댓글 2","communityID":1} ,
	 * {"guestno":1,"rdate":"2019-12-18
	 * 16:46:35","passwd":"123","commentsno":1,"content":"댓글 1","communityID":1} ] }
	 * </xmp>
	 * 
	 * @param communityID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/comments/list_by_communityID.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String list_by_communityID(int communityID) {
		List<CommentsVO> list = commentsProc.list_by_communityID(communityID);

		JSONObject obj = new JSONObject();
		obj.put("list", list);

		return obj.toString();
	}

	/**
	 * {"list":[ {"guestno":1, "rdate":"2019-12-18 16:46:35", "passwd":"123",
	 * "commentsno":1, "id":"user1", "content":"댓글 1", "communityID":1} ,
	 * {"guestno":1, "rdate":"2019-12-18 16:46:35", "passwd":"123", "commentsno":1,
	 * "id":"user1", "content":"댓글 1", "communityID":1} ] }
	 * 
	 * @param communityID
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/comments/list_by_communityID_join.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String list_by_communityID_join(int communityID) {
		// String msg="JSON 출력";
		// return msg;

		List<CommentsGuestVO> list = commentsProc.list_by_communityID_join(communityID);

		JSONObject obj = new JSONObject();
		obj.put("list", list);

		return obj.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/comments/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String deleteComment(int commentsID) {
	    int cnt = commentsProc.delete(commentsID);

	    JSONObject obj = new JSONObject();
	    obj.put("cnt", cnt);

	    return obj.toString();
	}
	
}
