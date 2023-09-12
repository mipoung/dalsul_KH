package com.dalsul.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/session/*")
@Controller
public class TestSessionHandler {
	
	@Autowired
	static HttpSession session;
	
	@GetMapping("/createUserSession")
	public void createUserSession() {
		System.out.println("userSession 생성");
		session.setAttribute("userSession", true);
	}
	
	@GetMapping("/sessionCheck")
	public boolean getUserSession() {
		System.out.println("userSession 호출");
		return (boolean) session.getAttribute("userSession");
	}
	
	@GetMapping("/createManagerSession")
	public void createManagerSession() {
		System.out.println("managerSession 생성");
		session.setAttribute("managerSession", true);
	}
	
	@GetMapping("/getManagerSession")
	public boolean getManagerSession() {
		System.out.println("managerSession 호출");
		return (boolean) session.getAttribute("managerSession");
	}
	
}
