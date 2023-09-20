package com.dalsul.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;

import com.dalsul.common.login.service.ManagerLoginService;
import com.dalsul.common.login.service.UserLoginService;
import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.common.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("manager/*")
public class ManagerLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@Setter(onMethod_ = @Autowired)
	private ManagerLoginService loginService;
	
	@GetMapping("/managerLoginView")
	public String managerLoginView(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo) {
		log.info("managerLoginView() 호출");
		String returnURL = "";
		
		if(mvo != null) {
			// session에 회원 정보가 존재한다면 메인페이지로 return
			returnURL = "/manager/managerMain";
		} else {
			// session에 회원 정보가 존재하지 않다면 로그인 페이지로 이동
			returnURL = "/account/login/managerLoginForm";
		}
		
		return returnURL;
	}
	
	
	@PostMapping("/managerLoginProcess")
	@ResponseBody
	public String managerLoginProcess(ManagerVO mvo) {
		log.info("managerLoginProcess() 호출");
		System.out.println("mvo 값 : "+mvo.toString());
		
		// 솔트값에 비밀번호 붙이기
		String salt = loginService.getSalt(mvo);
		
		// 솔트값을 못찾으면 = 입력한 이메일과 일치하는 salt 값이 없다면 로그인 실패
		if(salt==null) {
			return "FAIL";
		}
		
		// 비밀번호 암호화 후 이메일과 대조하여 로그인 검증
		mvo.setManager_salt(salt);
		ManagerVO managerInfo = loginService.passwordVerification(mvo);
		
		if(managerInfo != null) {
			session.setAttribute("managerLogin", managerInfo);
			return "SUCCESS";
		}
		
		return "FAIL";
	}
	
	@GetMapping("/managerLogout")
	public String managerLogoutProcess(SessionStatus sessionStatus) {
		log.info("managerLogoutProcess() 호출");
		String returnURL = "";
		
		if(sessionStatus != null) {
			// session이 존재한다면 logout
			sessionStatus.setComplete();
			returnURL = "/account/login/managerLoginForm";
		} else {
			// session이 존재하지 않는다면
			returnURL = "/account/login/managerLoginForm";
		}
		
		return returnURL;
	}
	
}
