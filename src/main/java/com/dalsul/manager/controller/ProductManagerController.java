package com.dalsul.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/product/*")
public class ProductManagerController {
	@GetMapping("managerProduct")
	public String managerCoupon() {
		return "manager/product/managerProduct";
	}
}
