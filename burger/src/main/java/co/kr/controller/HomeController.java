package co.kr.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale) {
		logger.info("Welcome home! The client locale is {}.", locale);

		return "index";
	}
	
	
	@RequestMapping(value = "/story", method = RequestMethod.GET)
	public String story() throws Exception {
		logger.info("story");
		
		return "story";
	}
	
	@RequestMapping(value = "/why", method = RequestMethod.GET)
	public String why_bgk() throws Exception {
		logger.info("why");
		
		return "why";
	}
	
	@RequestMapping(value = "/searchstore", method = RequestMethod.GET)
	public String search_store() throws Exception {
		logger.info("search store");
		
		return "searchstore";
	}
}
