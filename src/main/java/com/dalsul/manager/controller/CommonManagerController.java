package com.dalsul.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonManagerController {

	// 관리자페이지 메인으로 이동
		@GetMapping("/manager/managerMain")
		public String managerMain() {
			
			return "manager/managerMain";
		}
	
}
