package dev.mvc.tag;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.tag.TagProc")
public class TagProc implements TagProcInter {
	@Autowired
	private TagDAOInter tagDAO;

}
