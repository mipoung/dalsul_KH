package com.dalsul.common.certification.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.common.certification.service.EmailCertificationService;
import com.dalsul.common.login.vo.CommonValidationResult;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/emailCheck/*")
public class EmailCertificationController {
	
	@Autowired
	private EmailCertificationService emailService;
	
	@Autowired
	private HttpSession session;
	//
	@ResponseBody
	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam("emailAddr") String emailAddr) throws Exception{
		String result = "fail";
		
		// 이메일 정규식
		final String regex = "^[_a-z0-9-]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$";
		
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(emailAddr);
		// 이메일 주소 유효성 검사
		if (!m.matches()) {
            // 유효하지 않은 이메일 주소일 경우
            return result;
        }
		
		String code = emailService.sendEmail(emailAddr);
        log.info("인증번호 코드 : "+code);
        session.setAttribute("certificationCode", code);
        
		result = "success";
		
        return result;
	}
	
	// 인증번호 인증
    @ResponseBody
	@PostMapping("/checkCode")
	public CommonValidationResult checkCode(@RequestParam("requestCode") String requestCode) {		
		log.info("checkCode() 메소드 실행...");
		
		String certificationCode = (String)session.getAttribute("certificationCode");
		String replaceCode = requestCode.replaceAll("\\s", "");
		
		log.info("발급한 이메일 인증번호 : "+certificationCode);
		log.info("사용자가 입력한 인증번호 : "+replaceCode);
		
		if(certificationCode != null && certificationCode.equals(replaceCode)) {
			session.removeAttribute("certificationCode"); // 세션에 저장된 certificationValue값 삭제
			session.setAttribute("emailStatus", true);
			return new CommonValidationResult(true, "인증이 정상적으로 완료되었습니다."); // 인증성공
		} else if(certificationCode == "") {
			return new CommonValidationResult(false, "발송된 인증번호가 없습니다<br>인증메일발송을 먼저 진행해주세요"); // 발급된 인증번호가 없음
		} else if(!replaceCode.matches("^[0-9]{6}$")) {
			return new CommonValidationResult(false, "잘못된 인증번호 형식입니다<br>인증번호를 다시 입력해 주세요"); // 인증번호 형식이 잘못됨
		} else if(certificationCode != null && (!certificationCode.equals(replaceCode))) {
			return new  CommonValidationResult(false, "잘못된 인증번호 입니다<br>인증번호를 다시 입력해 주세요"); // 인증번호가 맞지 않음
		} else {
			return new CommonValidationResult(false, "시스템 오류입니다<br>다시 시도해 주세요"); // 시스템 오류
		}
		
	}
	
	
}