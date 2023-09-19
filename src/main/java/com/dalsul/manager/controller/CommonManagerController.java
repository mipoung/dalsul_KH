package com.dalsul.manager.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dalsul.manager.service.ManagerService;

import lombok.Setter;

@Controller
public class CommonManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerService managerService;
	
	// 관리자페이지 메인으로 이동
		@GetMapping("/manager/managerMain")
		public String managerMain(Model model) {
			
			return "manager/managerMain";
		}
	
}
