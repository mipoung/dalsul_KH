package com.dalsul.user.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import com.dalsul.user.mypage.service.MyPageService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.review.service.ReviewService;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	

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
	
	
	
	
	
	/* ========================= 리뷰 ======================== */
	@GetMapping("/reviewDetailView")
	public String reviewDetailView(@SessionAttribute(name="UserLogin", required = false) UserVO user, Model model) {
		log.info("reviewDetailView() 메소드 실행");
		
		if(user == null) {
			
			model.addAttribute("msg", "로그인해주세요");
			return "common/error";
		}
		
		log.info("유저넘버 : "+user.getUser_no());
		
		
		
		// 세션 값이 있으면 값 받아와서 보여주기
		List<ReviewVO> reviewList = reviewService.myReviewList(user);
		log.info("담긴 값 : " + reviewList.toString());
		model.addAttribute("reviewList", reviewList);
		
		return "/reviewBoard/reviewMyPage";
	}
	
	
	
	// 리뷰 수정
	@PostMapping("/reviewUpdate")
	public String reviewUpdate(ReviewVO rvo) {
		int result = 0;
		
		log.info(rvo.toString());
		
		result = reviewService.myReviewUpdate(rvo);
		
		return "redirect:/mypage/reviewDetailView";
	}
	
	
	
	// 유저 마이페이지 삭제 기능
	// 세션 user_no와 리뷰의 user_no가 같은 경우만 삭제 허용
	@PostMapping("/myReviewDelete")
	public String myReviewDelete(@SessionAttribute(name="UserLogin", required = false) UserVO user, ReviewVO rvo, Model model) {
		// 세션 값이 있을 때만 세션 체크하기
		
		String url = "";
		if(user != null) {
			log.info("들어온 값: " + rvo.getUser_no());
			if(user.getUser_no() == (rvo.getUser_no())) {
				//if(user.getUser_no().equals("User1")) {
					log.info("작성자 본인 입니다. 삭제 가능" + user.getUser_no() + " : " + rvo.getUser_no());
					// 로그인 세션 user_no와 리뷰 user_no가 같으면
					reviewService.myReviewDelete(rvo);
					
					url="/mypage/reviewDetailView";
			} else {
				log.info("작성자가 아니므로 삭제 불가합니다.");
					url="/mypage/reviewDetailView";
			}
			
			
			
		} else {
			
			log.info("로그인이 필요합니다. 삭제 불가능");
			model.addAttribute("msg", "로그인이 필요합니다.");
			url = "main/main";
		}
		
		return "redirect:"+url;
	}
	
	
	/* ========================= 리뷰 끝 ======================== */
	
	
	
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
