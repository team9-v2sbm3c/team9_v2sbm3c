package dev.mvc.team9_v2sbm3c;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import dev.mvc.plan.PlanDAOInter;
import dev.mvc.plan.PlanVO;

@SpringBootTest
class Team9V2sbm3cApplicationTests {
	@Autowired
	private PlanDAOInter planProc;
	
	@Test
	void contextLoads() {
	}
	@Test
	public void testRead() {
		PlanVO planVO = this.planProc.read(1);
		System.out.println(planVO.toString());
		
	}
}
