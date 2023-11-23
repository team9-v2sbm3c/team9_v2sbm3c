package dev.mvc.itinerary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ItineraryCont {
	@Autowired
	@Qualifier("dev.mvc.itinerary.ItineraryProc")
	private ItineraryProcInter itineraryProc;
	
	public ItineraryCont() {
		System.out.println("계획(itinerary) Cont 실행");
	}
}
