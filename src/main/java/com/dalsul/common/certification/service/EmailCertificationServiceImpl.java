package com.dalsul.common.certification.service;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailCertificationServiceImpl implements EmailCertificationService{

	@Autowired
	private JavaMailSender mailSender;
	
	private String code; //인증번호
	
	@Override
	public String createCertificationCode() {
		// 랜덤 인증 번호를 발급하여 StringBuffer에 담는다. 
		Random random  = new Random();
		StringBuffer numStrBuf = new StringBuffer();
		
		for(int i=1; i<=6; i++) {
		    int ran = random.nextInt(10);
		    numStrBuf.append(ran);
		}
		
		return numStrBuf.toString();
	}

	@Override
	public MimeMessage createEmailForm(String email) throws MessagingException, UnsupportedEncodingException {
        this.code = createCertificationCode();
        String setFrom = "yonghun0404@gmail.com";// 발신인(달술admin)
        String toEmail = email;					 // 수신자
        String title = "[달술] 본인확인 이메일 인증번호"; // 메일 제목

        MimeMessage message = mailSender.createMimeMessage();
        
        message.addRecipients(MimeMessage.RecipientType.TO, toEmail);	// 받는 사람 설정
        message.setSubject(title);		// 제목 설정

        // 메일 내용 설정
        String msgOfEmail="";
        msgOfEmail += "<div style='margin:20px;'>";
        msgOfEmail += "<h1> 달술 본인인증 </h1>";
        msgOfEmail += "<br>";
        msgOfEmail += "<p>아래 코드를 입력해주세요<p>";
        msgOfEmail += "<br>";
        msgOfEmail += "<div align='center' style='border:1px solid black; font-family:verdana';>";
        msgOfEmail += "<h3'>인증코드 : "+code+"</h3>";
        msgOfEmail += "</div>";
        msgOfEmail += "</div>";

        message.setFrom(setFrom);		// 보내는 사람 설정
        // 위 String으로 받은 내용을 아래에 넣어 내용을 설정합니다.
        message.setText(msgOfEmail, "utf-8", "html");

        return message;
	}

	public String testsendEmail(String email) throws MessagingException, UnsupportedEncodingException{
		//메일전송에 필요한 정보 설정
		this.code = createCertificationCode();
        //실제 메일 전송
        
        return code;
	}
	
	@Override
	public String sendEmail(String email) throws MessagingException, UnsupportedEncodingException {

		//메일전송에 필요한 정보 설정
        MimeMessage emailForm = createEmailForm(email);
        //실제 메일 전송
        mailSender.send(emailForm);
		
        return code; //인증 코드 반환
	}


}
