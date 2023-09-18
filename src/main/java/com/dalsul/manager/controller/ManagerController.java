package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.user.review.service.ReviewService;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/*")
public class ManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	// 관리자페이지 메인으로 이동
	@GetMapping("managerMain")
	public String managerMain() {
		
		return "manager/managerPage";
	}
	

	
	/*********** 완성 **********/
	// 관리자페이지 보여주기
	@GetMapping("managerReviewList")
	public String managerReviewList(@SessionAttribute(name="UserLogin", required = false) UserVO user, CommonVO cvo, ReviewVO rvo, Model model){
		// 관리자 세션이 있으면 페이지 보여주기
		if(user == null || !(user.getUser_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		
		// 세션이 있고 관리자 세션이면 출력
		log.info("관리자 입니다.");
		
		
		List<ReviewVO> reviewList = null;
		
	
		
		reviewList = reviewService.managerReviewList(rvo);
		model.addAttribute("reviewList", reviewList);

		System.out.println(reviewList.toString());
		
		// 전체 레코드 수 반환
		int total = reviewService.reviewListCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		log.info(reviewList.toString());
		
		
		return "manager/reviewBoard/managerReviewList";
	}
	
	
}
