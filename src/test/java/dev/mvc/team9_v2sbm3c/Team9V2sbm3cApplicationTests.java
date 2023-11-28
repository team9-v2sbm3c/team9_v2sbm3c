package dev.mvc.team9_v2sbm3c;

import java.util.ArrayList;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;

import dev.mvc.plan.PlanDAOInter;
import dev.mvc.plan.PlanVO;

@SpringBootTest
class Team9V2sbm3cApplicationTests {
	@Autowired
	private PlanDAOInter planProc;

	@Qualifier
	
	
	@Test
	void contextLoads() {
	}
	
	@Test
	public void testRead_all() {
		ArrayList<PlanVO> list = this.planProc.list_all_plan();
		System.out.println(list);
	}
}
