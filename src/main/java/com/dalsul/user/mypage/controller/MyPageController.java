package com.dalsul.user.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@GetMapping("/userInfoDetailView")
	public String userInfoDetailView() {
		log.info("userInfoDetailView() 메소드 실행");
		
		return "/mypage/userInfo";
	}
	
	@GetMapping("/orderlistDetailView")
	public String orderlistDetailView() {
		log.info("orderlistDetailView() 메소드 실행");
		
		return "/mypage/orderlist";
	}
	
	@GetMapping("/refundDetailView")
	public String refundDetailView() {
		log.info("refundDetailView() 메소드 실행");
		
		return "/mypage/refund";
	}
	
	@GetMapping("/reviewDetailView")
	public String reviewDetailView() {
		log.info("reviewDetailView() 메소드 실행");
		
		return "/mypage/review";
	}
	
	@GetMapping("/deleveryDetailView")
	public String deleveryDetailView() {
		log.info("deleveryDetailView() 메소드 실행");
		
		return "/mypage/delevery";
	}
	
}
