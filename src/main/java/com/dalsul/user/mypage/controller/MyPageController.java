package com.dalsul.user.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.mypage.service.MyPageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private MyPageService mypageService;
	
	@GetMapping("/userInfoDetailView")
	public String userInfoDetailView(@SessionAttribute(name = "userLogin", required = true) UserVO uvo, Model model) {
		log.info("userInfoDetailView() 메소드 실행");
		
		UserVO userInfo = (UserVO) session.getAttribute("userLogin");
		
		model.addAttribute("uvo", userInfo);
		
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
	
	@ResponseBody
	@PostMapping("/getUserInfo")
	public UserVO getUserInfo(@RequestParam("user_no") int user_no) {
		
		UserVO userInfo = mypageService.getUserInfo(user_no);
		
		return userInfo;
	}
	
}
