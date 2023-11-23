package dev.mvc.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.image.ImageProc")
public class ImageProc implements ImageProcInter {
	@Autowired
	private ImageDAOInter imageDAO;
}
