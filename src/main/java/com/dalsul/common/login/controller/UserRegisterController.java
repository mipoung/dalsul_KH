package com.dalsul.common.login.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.common.encryption.service.EncryptionService;
import com.dalsul.common.login.service.UserRegisterService;
import com.dalsul.common.login.vo.UserVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/register/*")
@Slf4j
public class UserRegisterController {
	
	@Setter (onMethod_ = @Autowired)
	private UserRegisterService userRegisterService;
	
	@Setter (onMethod_ = @Autowired)
	private EncryptionService encryptionService;
	
	@Setter (onMethod_ = @Autowired)
	HttpSession session;
	
	// 약관 동의 페이지
	@GetMapping("/termsView")
	public String termsView() {
		log.info("termsView() 메소드 실행...");
		
		return "/account/register/terms";
	}
	
	// 휴대전화번호 인증 페이지
	@PostMapping("/phoneCertification")
	public String phoneCertification() {
		log.info("phoneCertification() 메소드 실행...");
		
		return "/account/register/phoneCertification";
	}

	// 회원가입 페이지
	@PostMapping("/userRegisterView")
	public String userRegisterView(@ModelAttribute("certificationForm") UserVO rvo) {
		log.info("userRegisterView() 메소드 실행...");
		
		
		// 세션에 값 저장 (이름, 생년월일, 핸드폰번호)
		session.setAttribute("regInfo", rvo);
		
		return "account/register/register";
	}
	
	// 중복가입방지(휴대전화번호) 매핑
	@ResponseBody
	@PostMapping("/chkDuplicatedPhone")
	public int chkDuplicatedPhone(@RequestParam("user_phone_num") String phoneNumber) {
		log.info("chkDuplicatedPhone() 메소드 호출");
		int result = userRegisterService.chkDuplicatedPhone(phoneNumber);
		return result;
	}
	
	// 중복가입방지(이메일) 매핑
	@ResponseBody
	@PostMapping("/chkDuplicatedMail")
	public int chkDuplicatedMail(@RequestParam("user_email") String mailAddress) {
		log.info("chkDuplicatedMail() 메소드 호출");
		int result = userRegisterService.chkDuplicatedEmail(mailAddress);
		return result;
	}
	
	// 회원가입
	@PostMapping("/registeringProcess")
	public String UserRegisterProcess(@ModelAttribute("registerForm") UserVO rvo) {
		// 휴대폰 인증 및 이메일 인증 확인
		boolean phoneChk = (boolean)session.getAttribute("phoneStatus");
		boolean emailChk = (boolean)session.getAttribute("emailStatus");
		
		System.out.println("phone : "+phoneChk+", email : "+emailChk);
		
		String url = "";
		
		if(phoneChk && emailChk) {
			int result = userRegisterService.userRegistring(rvo);
			if(result==1) {
				url = "/account/register/regComplate";
			}else {
				url = "/account/register/terms";
			}
		}
		
		return url;
	}
	
}