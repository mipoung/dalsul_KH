package com.dalsul.user.coupon_recive.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dalsul.user.coupon_recive.service.Coupon_reciveService;

import lombok.Setter;

@Controller
@RequestMapping("/Coupon_recive/")
public class Coupon_reciveController {
	
	@Setter(onMethod_ = @Autowired)
	private Coupon_reciveService coupon_reciveService;
	
	@Autowired
	private HttpSession session;
}
