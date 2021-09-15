package com.lollol23.memo.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping("/signin_view")
	public String signinView() {
		return "user/signIn";
	}
	
	@GetMapping("/signup_view")
	public String signupView() {
		return "user/signUp";
	}
	
	@GetMapping("/signout_view")
	public String SignOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		
		return "redirect:/user/signin_view";
	}
}