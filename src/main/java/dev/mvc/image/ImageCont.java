package dev.mvc.image;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ImageCont {
	@Autowired
	@Qualifier("dev.mvc.image.ImageProc")
	private ImageProcInter imageProc;
	
	public ImageCont() {
		System.out.println("여행 이미지(image) Cont 실행");
	}
}
