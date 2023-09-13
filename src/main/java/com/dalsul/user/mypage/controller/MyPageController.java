package com.dalsul.user.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@GetMapping("/userInfo")
	public String mypageView() {
		log.info("mypageView() 메소드 실행");
		
		return "/mypage/userInfo";
	}
	
	
}
