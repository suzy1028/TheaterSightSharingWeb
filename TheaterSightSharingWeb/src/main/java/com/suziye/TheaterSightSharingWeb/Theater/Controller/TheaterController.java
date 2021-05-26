package com.suziye.TheaterSightSharingWeb.Theater.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.suziye.TheaterSightSharingWeb.Theater.Service.TheaterService;
import com.suziye.TheaterSightSharingWeb.Theater.Vo.TheaterVo;

@Controller
@RequestMapping("/theater")
public class TheaterController {
	
	@Autowired
	TheaterService service;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView index() throws Exception {
		List<TheaterVo> theaters=service.getTheaterList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("theaters",theaters);
		mav.setViewName("theater/main");
		
		
		return mav;
	}
}
