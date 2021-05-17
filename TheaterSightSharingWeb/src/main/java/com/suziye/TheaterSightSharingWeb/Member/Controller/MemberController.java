package com.suziye.TheaterSightSharingWeb.Member.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suziye.TheaterSightSharingWeb.Member.Member;
import com.suziye.TheaterSightSharingWeb.Member.Service.MemberService;



@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@ModelAttribute("cp")
	public String getContextPath(HttpServletRequest request) {
		return request.getContextPath();
	}
	
	// Join
	@RequestMapping("/join.do")
	public String joinForm(Member member) {
		return "/member/joinForm";
	}
	

	
	/*
	 * @RequestMapping(value = "/join", method = RequestMethod.POST) public String
	 * joinReg(Member member) {
	 * 
	 * service.memberRegister(member);
	 * 
	 * return "/member/joinOk"; }
	 */
	
	
		
	// Login	
	@RequestMapping(value="/login.do")
	public String loginForm() {
		
		
		return "/member/loginForm";
	}
	
	@RequestMapping("/login/google/auth")
	public String joinForm() {
		return "/member/loginGoogle";
	}
	
}
