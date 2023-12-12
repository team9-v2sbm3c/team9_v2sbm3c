package dev.mvc.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.community.CommunityProc")
public class CommunityProc implements CommunityProcInter {
	@Autowired
	private CommunityDAOInter communityDAO;
	
	@Override
	public int create_community(CommunityVO communityVO) {
		int cnt = this.communityDAO.create_community(communityVO);
		return cnt;
	}

}
