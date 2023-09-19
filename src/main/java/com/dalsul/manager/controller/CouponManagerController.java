package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.common.vo.PageDTO;
import com.dalsul.manager.service.CouponManagerService;
import com.dalsul.user.coupon.vo.CouponVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/coupon/*")
public class CouponManagerController {
	
	@Setter(onMethod_ =@Autowired)
	private CouponManagerService couponManagerService;
	
	/*쿠폰 리스트 조회 페이지로 이동시키는 메소드*/
	@GetMapping("managerCoupon")
	public String managerCoupon() {
		return "manager/coupon/managerCoupon";
	}
	
	/*검색기능과 페이징 처리가 된 쿠폰리스트 목록조회*/
	@GetMapping("/couponList")
	public String couponList(@ModelAttribute CouponVO cvo, Model model) {
		log.info("couponList() 메소드 호출...");
		
		//전체 레코드 조회
		List<CouponVO> couponList = couponManagerService.couponList(cvo);
		model.addAttribute("couponList" , couponList);
		
		//전체 레코드수 반환
		int total = couponManagerService.couponListCnt(cvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(cvo, total));
		//new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스 (BoardVO), 총 레코드수)
		
		return "/coupon/couponList"; //WEB-INF/views/coupon/couponList.jsp;
		
	}
	
	@GetMapping("/managerCouponInsertForm")
	public String couponInsertForm() {
		return "/coupon/CouponInsertForm"; 
	}
	
	//쿠폰 정보 추가하는 메소드
	@ResponseBody
	@PostMapping(value =  "/insertCoupon" , produces =  "text/plain; charset=UTF-8")
	public String insertCoupon(CouponVO cvo) {
		log.info("쿠폰 인서트메서드 호출");
		log.info(cvo.toString());
		
		int result =  couponManagerService.insertCoupon(cvo);
		
		if(result ==1) {
			return "쿠폰추가성공";
		}else {
			return "쿠폰추가실패";
		}
		
	}
} 
