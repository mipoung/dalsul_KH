package com.dalsul.user.subscription.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dalsul.user.subscription.service.SubscriptionService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/subscription/*")
public class SubscriptionController {

	@Setter(onMethod_ = @Autowired)
	private SubscriptionService subscriptionService;
	
	
	
	// 구독 신청 
	@GetMapping("subscriptionInsert")
	public String subscriptionInsert() {
		
		return "";
	}
	
	
	// 구독 신청 폼
	@GetMapping("subscriptionInsertForm")
	public String subscriptionInsertForm() {
		
		return "subscription/subscriptionInsertForm";
	}
	
	// 구독 조회
	@GetMapping("subscriptionList")
	public String subscriptionList() {
		
		return "";
	}
	
	// 구독 삭제
	@GetMapping("subscriptionDelete")
	public int subscriptionDelete() {
		int result = 0;
		
		return result;
	}
	
	
	
	
}
