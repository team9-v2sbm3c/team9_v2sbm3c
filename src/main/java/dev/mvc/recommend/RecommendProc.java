package dev.mvc.recommend;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.recommend.RecommendProc")
public class RecommendProc implements RecommendProcInter {
	@Autowired
	private RecommendDAOInter recommendDAO;

	@Override
	public ArrayList<RecommendVO> list_all_recommend() {
		ArrayList<RecommendVO> list = this.recommendDAO.list_all_recommend();
		return list;
	}
	
	@Override
	public RecommendVO read_recommend(int guestno) {
		RecommendVO recommendVO = this.recommendDAO.read_recommend(guestno);
		return recommendVO;
	}

	@Override
	public int delete_recommend(int guestno) {
		int cnt = this.recommendDAO.delete_recommend(guestno);
		return cnt;
	}

	
}
