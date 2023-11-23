package dev.mvc.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class TagCont {
	@Autowired
	@Qualifier("dev.mvc.tag.TagProc")
	private TagProcInter tagProc;
	
	public TagCont() {
		System.out.println("태그(tag) Cont 실행");
	}
}
