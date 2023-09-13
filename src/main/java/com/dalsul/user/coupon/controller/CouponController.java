package com.dalsul.user.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dalsul.user.coupon.service.CouponService;
import com.dalsul.user.coupon.vo.CouponVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/coupon/")
@Slf4j
public class CouponController {
	
	@Setter(onMethod_ =@Autowired)
	private CouponService couponService;
	
	//입시로 테스트하는 coupon 레이아웃을 가는 매핑
	@GetMapping("/couponView")
	public String couponTest() {
		return "/coupon/couponView";
	}
	
	//쿠폰 정보 추가하는 메소드
	@PostMapping("/couponInsert")
	public String couponInsert(CouponVO cvo) {
		log.info("쿠폰 인서트메서드 호출");
		String result = "";
		result = couponService.couponInsert(cvo);
		log.info(result);
		
		return result;
	}
}
