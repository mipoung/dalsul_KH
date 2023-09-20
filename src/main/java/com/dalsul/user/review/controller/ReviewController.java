package com.dalsul.user.review.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.user.main.vo.ProductVO;
import com.dalsul.user.review.dao.ReviewDAO;

import com.dalsul.common.vo.PageDTO;

import com.dalsul.user.review.service.ReviewService;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


/* 필요한 기능 : 추천(좋아요), 별점, 회원 세션 값 체크
 * 불필요한 기능 : 조회수(상세 페이지로 이동 안함), 상세페이지 매핑
 * */


@Slf4j
@Controller
@RequestMapping("/review/*")
public class ReviewController {

	@Setter(onMethod_ = @Autowired)
	private ReviewService reviewService;
	
	@GetMapping("managerPage")
	public String managerPage() {
		
		return "reviewBoard/managerPage";
	}
	
	
	
	// 리뷰 조회
	/* 상세페이지 리뷰 조회는 모든 사람이 가능해야 한다.
	 * 마이페이지 리뷰 조회는 자신이 작성한 글만 조회 가능해야 한다.
	 * 관리자페이지 리뷰 조회는 모든 글을 조회 가능해야 한다.
	 * 
	 * 각각 다른 매핑을 주기
	*/
	
	
	/*********** 완성 **********/
	@GetMapping("detailReviewList")
	public String detailReviewList(Model model, ProductVO pvo) {
		
			log.info("detailReviewList() 메서드 호출");
			//rvo.setPackage_product_no(1);
			log.info("뷰에서 받아온 값: " + pvo.toString());
			List<ReviewVO> reviewList = reviewService.detailReviewList(pvo);
			log.info("담긴 값:" + reviewList.toString());
			
			model.addAttribute("reviewList", reviewList);
			
			
			List<ReviewVO> bestReview = reviewService.detailReviewListBest(pvo);
			model.addAttribute("bestReview", bestReview);
			
	
			return "reviewBoard/reviewList";
	}
	
	
	
	/*********** 완성 **********/
	// 마이페이지에서 보여주기
	@GetMapping("myReviewList") 
	public String myReviewList(@SessionAttribute(name="UserLogin", required = false) UserVO user, Model model) {
		// 세션 값이 없으면 메인으로 리다이렉트 or 경고문 출력
		
		
		
		if(user == null) {
			
			model.addAttribute("msg", "로그인해주세요");
			return "common/error";
		}
		
		log.info("유저넘버 : "+user.getUser_no());
		
		
		
		// 세션 값이 있으면 값 받아와서 보여주기
		List<ReviewVO> reviewList = reviewService.myReviewList(user);
		log.info("담긴 값 : " + reviewList.toString());
		model.addAttribute("reviewList", reviewList);
		
		return "reviewBoard/reviewList";
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
		
		
		return "reviewBoard/managerReviewList";
	}
	
	
	
	/*********** 완성 **********/
	// 작성 폼
		@GetMapping("reviewWriteForm")
		public String reviewWriteForm(@SessionAttribute(name="UserLogin", required = false) UserVO user, Model model) {
			// 회원이 아니면 로그인 페이지로 보냄
			if(user == null) {
				// msg에 경고 담아 보내기 => 로그인 페이지 위에 띄우면 좋겠음
				model.addAttribute("msg", "로그인 해주세요");
				
				return "common/error";
			}
			return "reviewBoard/reviewWriteForm";
		}
	
		
	
	// 리뷰 작성
	/*
	 * 리뷰 작성은 조건이 여러개임
	 * 1. user_no 을 세션에서 가져와서 로그인한 사람인지 확인
	 * 2. 자신이 구매한 제품일 것
	 * 3. 구매한 제품의 주문 1건당 1개의 리뷰만 허용
	 * 
	 *  로그인 세션에서 user_no을 가져와 회원 확인 and 
	 *  주문 테이블 조회해서 해당 상품을 구매한 기록이 있는지 확인 and
	 *  리뷰 작성시 주문 번호도 함께 기록(동일한 상품이라도 주문번호가 다르면 별개로 취급) and
	 *  리뷰 데이터베이스를 조회해 해당 상품에 이미 리뷰를 작성했는지 확인
	 */
		
		
		
	/*********** 완성(조건 설정 추가 필요) **********/
	// 리뷰작성은 마이페이지에 주문내역에서만 가능
	// 세션이 있고 주문내역이 있는 사람만 작성 가능
	@PostMapping("myReviewInsert")
	public String myReviewInsert(@SessionAttribute(name="UserLogin", required = false) UserVO user, ReviewVO rvo, Model model) {
		log.info("=== myReviewInsert() 호출 성공 ===");
		int result = 0;
		String url = "";
		
		// 회원이 아니면 로그인으로 보냄
		if(user == null) {
			model.addAttribute("msg", "회원이 아닙니다.");
			url = "/common/error";
			
		};
		
		// 작성한 유저 넘버 가져오기
		rvo.setUser_no(user.getUser_no());
		
		log.info("===============================================");
		log.info("user_no : "+rvo.getUser_no());
		log.info("review_content : "+rvo.getReview_content());
		log.info("review_rating :" + rvo.getReview_rating());
		log.info("===============================================");
		
		// 회원이면 입력작업 실시
		result = reviewService.myReviewInsert(rvo);
		
		if(result == 1) {
			log.info("작성성공");
			return "/reviewBoard/test";
		} else {
			return "/common/error";
		}
		
		
	}
	
	
	
	
	
	/*********** 완성(필요없음) **********/
	// 관리자 페이지 리뷰 작성
	@PostMapping("managerReviewInsert")
	public String managerReviewInsert(@SessionAttribute(name="UserLogin", required = false) UserVO user, ReviewVO rvo, Model model) {
		log.info("=== managerReviewInsert() 호출 성공 ===");
		int result = 0;
		String url = "";
		
		// 세션이 없거나 관리자 계정이 아니면
		if(user == null || !(user.getUser_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			url = "/common/error";
		}
		
		// 관리자면 입력작업 실시
		result = reviewService.myReviewInsert(rvo);
		
			if(result == 1) {
				url = "/reviewBoard/reviewList";
			} else {
				url = "/reviewBoard/reviewWriteForm";
			}
		
		
		return "redirect:" + url;
	}
	
	
	
	
	
	/* 수정 폼 
	@PostMapping("reviewUpdateForm")
	public String reviewUpdateForm() {
		
		return "reviewBoard/reviewUpdateForm";
	}
	*/
	
	
	
	
	// 리뷰 수정
	@PostMapping("reviewUpdate")
	public String reviewUpdate(ReviewVO rvo) {
		int result = 0;
		
		log.info(rvo.toString());
		
		result = reviewService.myReviewUpdate(rvo);
		
		return "redirect:/mypage/reviewDetailView";
	}
	
	
	
	
	
	
	/*********** 완성 **********/
	// 유저 마이페이지 삭제 기능
	// 세션 user_no와 리뷰의 user_no가 같은 경우만 삭제 허용
	@PostMapping("myReviewDelete")
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
					
					url="myReviewList";
			} else {
				log.info("작성자가 아니므로 삭제 불가합니다.");
					url="myReviewList";
			}
			
			
			
		} else {
			
			log.info("로그인이 필요합니다. 삭제 불가능");
			model.addAttribute("msg", "로그인이 필요합니다.");
			url = "common/error";
		}
		
		return "redirect:"+url;
	}
	
	
	
	
	
	
	
	// 관리자 삭제 기능 (완료)
	// 관리자 세션을 가진 사람만 삭제 가능
	@PostMapping("managerReviewDelete")
	public String managerReviewDelete(@SessionAttribute(name="UserLogin", required = false) UserVO user, ReviewVO rvo) {
		
		// 로그인하지 않은 사용자이거 관리자가 아니면 
		if(user == null || !(user.getUser_no() == 1)) {
			log.info("로그인하지 않았거나 관리자가 아닙니다.");
			return "common/error";
		}
			
			log.info("관리자입니다.");
			reviewService.myReviewDelete(rvo);

		return "redirect:/review/managerReviewList";
	}
	
	
	
	@ResponseBody
	@GetMapping(value = "likePlus", produces = "text/plain; charset=UTF-8")
	public String likePlus(@SessionAttribute(name="UserLogin", required = false) UserVO user, @ModelAttribute ReviewVO rvo, Model model) {
		log.info("likePlus 실행" + rvo.toString() + user.getUser_no());
		
		
		//reviewService.reviewLikePlus(rvo, user); // 1 증가
		
		int reviewCount = reviewService.reviewLikeCountPlus(rvo); // 증가된 후 리뷰 개수 조회해서 반환
		
		log.info("값 :"+reviewCount);
		return String.valueOf(reviewCount);
		
		
	}
	
	
	
	
	
	
	
	
	
}
