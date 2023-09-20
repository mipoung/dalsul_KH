package com.dalsul.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.support.SessionStatus;

import com.dalsul.common.login.service.UserLoginService;
import com.dalsul.common.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/login/*")
public class UserLoginController {
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@Setter(onMethod_ = @Autowired)
	private UserLoginService loginService;
	
	// 로그인 페이지 이동 요청이 들어오면 현재 페이지의 정보를 저장하여 로그인 view로 이동한다.
	// 로그인 페이지에서 로그인에 성공하면 저장한 페이지 정보로 이동한다
	// 예) 제품 상세 -> 주문버튼 클릭 -> 로그인 -> 제품 상세
	@GetMapping("/userLoginView")
	public String userLoginView(@SessionAttribute(name = "userLogin", required = false) UserVO uvo) {
		log.info("userLoginView() 호출");
		String returnURL = "";
		
		if(uvo != null) {
			// session에 회원 정보가 존재한다면 메인페이지로 return
			returnURL = "/";
		} else {
			// session에 회원 정보가 존재하지 않다면 로그인 페이지로 이동
			returnURL = "/account/login/loginForm";
		}
		
		return returnURL;
	}
	
	@PostMapping("/userLoginProcess")
	@ResponseBody
	public String userLoginProcess(UserVO uvo) {
		log.info("userLoginProcess() 호출");
		System.out.println("uvo 값 : "+uvo.toString());
		
		// 솔트값에 비밀번호 붙이기
		String salt = loginService.getSalt(uvo);
		System.out.println("salt 값 : "+salt);
		
		// 솔트값을 못찾으면 = 입력한 이메일과 일치하는 salt 값이 없다면 로그인 실패
		if(salt==null) {
			return "FAIL";
		}
		
		// 비밀번호 암호화 후 이메일과 대조하여 로그인 검증
		uvo.setUser_salt(salt);
		UserVO userInfo = loginService.passwordVerification(uvo);
		System.out.println("userInfo 값 : "+userInfo);
		
		if(userInfo != null) {
			session.setAttribute("userLogin", userInfo);
			return "SUCCESS";
		}
		
		return "FAIL";
	}
	
	@GetMapping("/userLogout")
	public String userLogoutProcess(HttpSession sessionStatus) {
		log.info("userLogoutProcess() 호출");
		String returnURL = "";
		System.out.println(sessionStatus);
		if(sessionStatus != null) {
			// session이 존재한다면 logout
			sessionStatus.invalidate();
			returnURL = "/account/login/loginForm";
		} else {
			// session이 존재하지 않는다면
			returnURL = "/account/login/loginForm";
		}
		
		return returnURL;
	}
	
}
