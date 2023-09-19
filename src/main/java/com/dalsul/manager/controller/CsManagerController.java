package com.dalsul.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/cs/*")
public class CsManagerController {
	
	@GetMapping("managerFaq")
	public String managerCs() {
		return "manager/cs/managerFAQ";
	}

}
