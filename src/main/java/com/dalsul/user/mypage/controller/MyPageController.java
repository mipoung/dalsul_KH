package com.dalsul.user.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dalsul.user.addr.service.AddrService;
import com.dalsul.user.addr.vo.AddrVO;
import com.dalsul.user.mypage.service.MyPageService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@Setter(onMethod_ = @Autowired)
    private AddrService addrService;

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
	
	
	/*========================== 배송지 시작 =======================*/
	
	/*내가 추가한 기본 배송지 정보 전체 조회하는 매핑*/
	@GetMapping("/userAddrInfo")
	public String userAddrInfo(@SessionAttribute(name = "userLogin") UserVO uvo, Model model) {
		log.info("userAddrInfo() 매소드 호출...");
		log.info(uvo.toString());
		   
		List<AddrVO> result = addrService.userAddrInfo(uvo);
		log.info(result.toString());
		model.addAttribute("addr", result);
		return "/mypage/userAddrInfo";
	}
	
	 /* 기본 배송지 테이블에 새로운 배송지 추가 메소드 컨트롤러 */
    @ResponseBody
    @PostMapping(value = "/insertAddr", produces = "text/plain; charset=UTF-8")
    public String insertAddr(@SessionAttribute(name = "userLogin") UserVO uvo, @ModelAttribute AddrVO avo) {
        log.info("insertAddr () 메소드 호출...");
        log.info("avo =" + avo.toString());
        log.info("uvo =" + uvo.toString());
        
        log.info("chkUserAddr 메소드 호출..");
        System.out.println(avo.toString());
        //사용자가 이미 입력한 배송지가 5개일경우 를 찾는 메소드
        String chkUserAddrCount = addrService.chkUserAddr(uvo);
        
        log.info("chkUserAddrCount = " + chkUserAddrCount);
        
        if (chkUserAddrCount.equals("true")) {
        	return "배송지는 최대 5개까지 입력할 수 있습니다.";
        }// 5개 이하일경우 insert 실행 
        else {
        	avo.setUser_no(uvo.getUser_no());
        	int result = addrService.insertAddr(avo);
        
        	if(result == 1) {
        		return "추가성공";
        	} else {
        		return "정상적인 입력값이 아닙니다";
        	}
        }
    }
	
    /*내가 추가한 기본배송지 정보 조회하고 그 배송지의 정보를 업데이트하는 매핑*/
    /*
    @GetMapping(value = "/updateAddrForm")
    public String updateAddrForm(AddrVO bvo, Model model) {
 	   log.info("updateAddrForm() 매소드 호출...");
 	   log.info("selectAddr() 매소드 호출...");
 	   log.info(bvo.toString());
 	   
 	   AddrVO result = addrService.userAddrInfo(bvo);
 	   model.addAttribute("addr", result);
 	  
 	   
 	   return "/addr/addrUpdateView";
    }
    */
    
    /* 기본 배송지 테이블에 새로운 배송지 정보 업데이트 메소드 컨트롤러 */
    @ResponseBody
    @PostMapping(value = "/updateAddr", produces = "text/plain; charset=UTF-8")
    public String updateAddr(AddrVO bvo) {
        log.info("updateAddr () 메소드 호출...");
        log.info(bvo.toString());
        
        int result = addrService.updateAddr(bvo);
        
        if(result == 1) {
        	return "수정성공";
        } else {
        	return "수정실패";
        }
    }
    
    /* 기본 배송지 테이블에 입력받은 배송지입력번호를 기준으로 삭제하는 삭제 메소드 컨트롤러 */
    @ResponseBody
    @PostMapping(value = "/deleteAddr", produces = "text/plain; charset=UTF-8")
    public String deleteAddr(AddrVO bvo) {
 	   log.info("deleteAddr () 메소드 호출...");
        log.info(bvo.toString());
        
        int result = addrService.deleteAddr(bvo);
        
        if(result == 1) {
        	return "삭제성공";
        } else {
        	return "삭제실패";
        }
    }
    
    /*====================배송지 종료===========================*/
	
    @ResponseBody
	@PostMapping("/getUserInfo")
	public UserVO getUserInfo(@RequestParam("user_no") int user_no) {
		
		UserVO userInfo = mypageService.getUserInfo(user_no);
		
		return userInfo;
	}
	
}
