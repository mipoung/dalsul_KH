package com.dalsul.common.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/edit/*")
@SessionAttributes("userLogin")
public class UserInfoController {
	
	@GetMapping("/updatePasswordView")
	public String updatePasswordView() {
		log.info("updatePasswordView() 실행...");

		return "/account/edit/updatePasswordForm";
	}
	
	@GetMapping("/deleteUserView")
	public String deleteUserView() {
		log.info("deleteUserView() 실행...");
		
		return "/account/edit/deleteUserForm";
	}
	
	@PostMapping
	@ResponseBody
	public String updatePassword() {
		log.info("updatePassword() 실행...");
		String result = "FAIL";
		
		
		return result;
	}
	
}