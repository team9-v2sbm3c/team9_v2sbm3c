package dev.mvc.itinerary;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.itinerary.ItineraryProc")
public class ItineraryProc implements ItineraryProcInter {
	@Autowired
	private ItineraryDAOInter itineraryDAO;
}
