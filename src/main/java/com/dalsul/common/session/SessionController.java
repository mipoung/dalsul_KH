package com.dalsul.common.session;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.dalsul.common.login.vo.UserVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("UserLogin")
public class SessionController {
	
	// 테스트용 리뷰 세션 생성
	// 관리자는 1번, 유저는 2번
	@GetMapping("/userSession")
	public String setSession(Model model) {
		UserVO user = new UserVO();
		user.setUser_no(1); // 1번 유저
		model.addAttribute("UserLogin", user);
		log.info("세션값:" + model.getAttribute("UserLogin"));
		return "/reviewBoard/test";
		
	}
	

}
