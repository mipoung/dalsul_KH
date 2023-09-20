package com.dalsul.manager.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.ManagerVO;

@Controller
public class CommonManagerController {

	// 관리자페이지 메인으로 이동
		@GetMapping("/manager/managerMain")
		public String managerMain(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo,  Model model) {
			
			if(mvo==null) {
				return "account/login/managerLoginForm";
			}
			
			return "/manager/managerMain";
		}
	
}
