package com.dalsul.common.certification.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.common.login.vo.CommonValidationResult;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
@RequestMapping("/phoneCheck/*")
public class PhoneCertificationController {
	
	// CoolSMS API Service
	final DefaultMessageService messageService;

	// Session
	@Autowired
	private HttpSession session;
	
	// CoolSMS API key
    public PhoneCertificationController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSILSFB4S82UYB5", "XQ595OASFGV4ZAVA4ABGKYRPEFKHHFAP", "https://api.coolsms.co.kr");
    }
    
    // 인증번호 발급
    @ResponseBody
	@PostMapping("/sendSMS")
	public String sendSMS(@RequestParam("phoneNumber") String phoneNumber) {
		log.info("sendSMS() 메소드 실행...");
		log.info("수신자 번호 : "+phoneNumber);
		String result = "fail";
		
		// 수신자 번호 유효성 검사
		if (!phoneNumber.matches("^010[0-9]{8}$")) {
            // 유효하지 않은 휴대전화번호일 경우 
            return result;
        }
        
		// 인증번호 발급 무작위 6자리
		Random random  = new Random();
        StringBuffer numStrBuf = new StringBuffer();
        
        for(int i=1; i<=6; i++) {
            int ran = random.nextInt(10);
            numStrBuf.append(ran);
        }
		
        // 발급된 인증번호
        String certificationValue = numStrBuf.toString();
        log.info("인증 번호 : "+certificationValue);
        
        //실사용 및 테스트 시 주석 해제
/*        Message message = new Message();
        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01023118052"); // 발신번호 고정
        message.setTo(phoneNumber); // 수신번호
        message.setText("달술 본인확인 인증번호는["+numStrBuf.toString()+"]입니다.\n※타인 노출 금지");
      
        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        log.info(response.toString());
*/     
        // 발급된 인증번호 값을 세션에 저장
        session.setAttribute("certificationValue", certificationValue);
        result = "success";
        
        return result;
	}
	
	// 인증번호 인증
    @ResponseBody
	@PostMapping("/checkNumber")
	public CommonValidationResult checkNumber(@RequestParam("requestNumber") String requestNumber) {
		log.info("checkNumber() 메소드 실행...");
		
		String certificationValue = (String)session.getAttribute("certificationValue");
		String replaceNumber = requestNumber.replaceAll("\\s", "");
		
		log.info("발급한 휴대폰 인증번호 : "+certificationValue);
		log.info("사용자가 입력한 인증번호 : "+replaceNumber);
		
		if(certificationValue != null && certificationValue.equals(replaceNumber)) {
			session.removeAttribute("certificationValue"); // 세션에 저장된 certificationValue값 삭제
			session.setAttribute("phoneStatus", true);
			return new CommonValidationResult(true, "인증이 정상적으로 완료되었습니다."); // 인증성공
		} else if(certificationValue == "") {
			return new CommonValidationResult(false, "발급된 인증번호가 없습니다<br>인증번호발송을 먼저 진행해주세요"); // 발급된 인증번호가 없음
		} else if(!replaceNumber.matches("^[0-9]{6}$")) {
			return new CommonValidationResult(false, "잘못된 인증번호 형식입니다<br>인증번호를 다시 입력해 주세요"); // 인증번호 형식이 잘못됨
		} else if(certificationValue != null && (!certificationValue.equals(replaceNumber))) {
			return new  CommonValidationResult(false, "잘못된 인증번호 입니다<br>인증번호를 다시 입력해 주세요"); // 인증번호가 맞지 않음
		} else {
			return new CommonValidationResult(false, "시스템 오류입니다<br>다시 시도해 주세요"); // 시스템 오류
		}
		
	}
	
}