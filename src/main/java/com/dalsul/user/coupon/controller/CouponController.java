package com.dalsul.user.coupon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dalsul.user.coupon.service.CouponService;

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
		return "/coupon/coupon";
	}

}
