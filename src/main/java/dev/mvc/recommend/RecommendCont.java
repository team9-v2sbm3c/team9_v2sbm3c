package dev.mvc.recommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RecommendCont {
	@Autowired
	@Qualifier("dev.mvc.recommend.RecommendProc")
	private RecommendProcInter recommendProc;
	
	/**
	 * 유저 관심사 전체 조회 
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/recommend/list_all.do", method = RequestMethod.GET)
	  public ModelAndView list_all_recommend() {
	    ModelAndView mav = new ModelAndView();
	    
	    
	    ArrayList<RecommendVO> list = this.recommendProc.list_all_recommend();
    	mav.addObject("list",list);
	    return mav;
	  }
	
	/**
	 * 유저 한명의 관심사 조회 
	 * @param guestno
	 * @return
	 */
	@RequestMapping(value="/recommend/read.do", method = RequestMethod.GET)
	  public ModelAndView read_recommend(int guestno) {
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/recommend/read.do");
	    
	    RecommendVO recommendVO = this.recommendProc.read_recommend(guestno);
	    mav.addObject("recommendVO",recommendVO);
	    
	    return mav;
	  }
	
	/**
	 * 관심사 삭제 폼 
	 * @param session
	 * @param guestno
	 * @return
	 */
	@RequestMapping(value="/recommend/delete.do", method = RequestMethod.GET)
	  public ModelAndView delete_recommend(int guestno) { 
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("/recommend/delete");
	    
	    RecommendVO recommendVO = this.recommendProc.read_recommend(guestno);
	    mav.addObject("recommendVO",recommendVO);
	    
	    ArrayList<RecommendVO> list = this.recommendProc.list_all_recommend();
    	mav.addObject("list",list);
	     
	    return mav;
	  }
	
	/**
	 * 관심사 삭제 처리 
	 * @param session
	 * @param guestno
	 * @return
	 */
	@RequestMapping(value="/recommend/delete.do" , method = RequestMethod.POST)
	public ModelAndView delete_recommend_proc(int guestno) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = this.recommendProc.delete_recommend(guestno);
		
		if(cnt ==1) {
			mav.setViewName("redirect:/recommend/list_all.do");
		}
		mav.addObject("cnt", cnt);
		
		return mav;
	}
}
