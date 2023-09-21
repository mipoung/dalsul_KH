package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.manager.service.CommonManagerService;
import com.dalsul.manager.service.ManagerService;
import com.dalsul.manager.vo.ManagerCommonVO;
import com.dalsul.user.review.service.ReviewService;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/review/*")
public class ReviewManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	@Setter(onMethod_ = @Autowired)
	private CommonManagerService commonManagerService;
	
	
	/*********** 완성 **********/
	// 관리자페이지 보여주기
	@GetMapping("managerReviewList")
	public String managerReviewList(@SessionAttribute(name="UserLogin", required = false) UserVO user, CommonVO cvo, ReviewVO rvo, Model model){
		// 관리자 세션이 있으면 페이지 보여주기(실제 사용할 때는 주석 풀어줘야됨)
		/*
		if(user == null || !(user.getUser_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		*/
		// 세션이 있고 관리자 세션이면 출력
		log.info("관리자 입니다.");
		
		
		log.info("설정된 값"+ rvo.getSearchDate1() + rvo.getSearchDate2());
		
		List<ReviewVO> reviewList = null;
		
		reviewList = reviewService.managerReviewList(rvo);
		model.addAttribute("reviewList", reviewList);
		
		// 전체 레코드 수 반환
		int total = reviewService.reviewListCnt(rvo);
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "manager/reviewBoard/managerReviewList";
	}
	
	
	
	
	
	
	
	// 관리자페이지 삭제 기능
	@PostMapping("managerReviewDelete")
	public String managerReviewDelete(@SessionAttribute(name="UserLogin", required = false) UserVO user, ReviewVO rvo) {
		
		// 로그인하지 않은 사용자이거 관리자가 아니면 
		if(user == null || !(user.getUser_no() == 1)) {
			log.info("로그인하지 않았거나 관리자가 아닙니다.");
			return "common/error";
		}
			log.info("관리자입니다.");
			reviewService.myReviewDelete(rvo);

		return "redirect:/manager/review/managerReviewList";
	}
	
	
	
	
	
	
	
	// 리뷰 차트 및 통계
	@GetMapping("managerReviewChart")
	public String managerReviewChart(Model model) {
		List<ManagerCommonVO> reviewChartData = commonManagerService.managerReviewChart();
		log.info("데이터 값 : " + reviewChartData);
		model.addAttribute("revieweChartData", reviewChartData);
		
		
		List<ManagerCommonVO> reviewStaticsData = commonManagerService.managerReviewStatistics();
		model.addAttribute("reviewStaticsData", reviewStaticsData);
		
		return "manager/reviewBoard/managerReviewChart";
	}
	
	
}
