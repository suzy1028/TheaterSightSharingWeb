package com.suziye.TheaterSightSharingWeb;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suziye.TheaterSightSharingWeb.Theater.Theater;
import com.suziye.TheaterSightSharingWeb.Theater.Service.TheaterService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		if(true) {
//			
//		}
//		
//		return "home";
//	}
	

	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
	
		return "/index";
	}
	
	@RequestMapping(value = "/favicon.ico",method = RequestMethod.GET)
	public void favicon(HttpServletRequest request,HttpServletResponse response) {
		try {
			response.sendRedirect("/resources/favicon.ico");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
