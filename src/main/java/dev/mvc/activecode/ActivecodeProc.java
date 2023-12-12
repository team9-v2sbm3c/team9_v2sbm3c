package dev.mvc.activecode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.activecode.ActivecodeProc")
public class ActivecodeProc implements ActivecodeProcInt {
	@Autowired
	private ActivecodeDAOInter activecodeDAO;

	@Override
	public int create_activecode(ActivecodeVO activecodeno) {
		int cnt = this.activecodeDAO.create_activecode(activecodeno);
		return cnt;
	}

	@Override
	public ActivecodeVO read_activecode(int activecodeno) {
		ActivecodeVO planVO = this.activecodeDAO.read_activecode(activecodeno);
		return planVO;
	}

	@Override
	public int update_activecode(ActivecodeVO activecodeVO) {
		int cnt = this.activecodeDAO.update_activecode(activecodeVO);
		return cnt;
	}

	@Override
	public int delete_activecode(int activecodeno) {
		int cnt = this.activecodeDAO.delete_activecode(activecodeno);
		return cnt;
	}
}
