package com.dalsul.manager.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.ManagerVO;
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
	public String managerReviewList(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo, CommonVO cvo, ReviewVO rvo, Model model){
		// 관리자 세션이 있으면 페이지 보여주기(실제 사용할 때는 주석 풀어줘야됨)
		/*
		if(user == null || !(user.getUser_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		
		
		*/
		if(mvo==null) {
			return "account/login/managerLoginForm";
		}
		
		if(rvo.getSearchDate1() == null || rvo.getSearchDate2() == null) {
			
			// 오늘 날짜를 얻기
	        LocalDate today = LocalDate.now();
	        // 오늘 날짜에 1일을 더하기
	        LocalDate tomorrow = today.plusDays(1);
	        // 날짜를 문자열로 변환 (예: "2023-09-25")
	        String formattedDate = tomorrow.format(DateTimeFormatter.ISO_LOCAL_DATE);

			
			
			rvo.setSearchDate1("2000-09-09");
	        rvo.setSearchDate2(formattedDate);
		
		}
		
		// String을 LocalDate로 변환
        LocalDate date = LocalDate.parse(rvo.getSearchDate2());
        // 1일을 더함
        LocalDate nextDate = date.plusDays(1);
        // LocalDate를 String으로 변환
        String resultDateString = nextDate.format(DateTimeFormatter.ISO_LOCAL_DATE);
        rvo.setSearchDate2(resultDateString);
		
		
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
	public String managerReviewDelete(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo, ReviewVO rvo) {
		
		// 로그인하지 않은 사용자이거 관리자가 아니면 || !(user.getUser_no() == 1)
		if(mvo==null) {
			return "account/login/managerLoginForm";
		}
		
		
			log.info("관리자입니다.");
			reviewService.myReviewDelete(rvo);

		return "redirect:/manager/review/managerReviewList";
	}
	
	
	
	
	
	
	
	// 리뷰 차트 및 통계
	@GetMapping("managerReviewChart")
	public String managerReviewChart(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo, Model model) {
		if(mvo==null) {
			return "account/login/managerLoginForm";
		}
		
		
		List<ManagerCommonVO> reviewChartData = commonManagerService.managerReviewChart();
		log.info("데이터 값 : " + reviewChartData);
		model.addAttribute("revieweChartData", reviewChartData);
		
		
		List<ManagerCommonVO> reviewStaticsData = commonManagerService.managerReviewStatistics();
		model.addAttribute("reviewStaticsData", reviewStaticsData);
		
		return "manager/reviewBoard/managerReviewChart";
	}
	
	
}
