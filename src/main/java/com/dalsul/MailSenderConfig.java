package com.dalsul;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailSenderConfig {
	// 장용훈만 갖고있는 내용1
	@Bean
    public JavaMailSender MailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setDefaultEncoding("UTF-8"); // 인코딩 설정
        mailSender.setHost("smtp.gmail.com"); // SMTP 호스트 설정
        mailSender.setPort(587); // 포트 번호 설정
        mailSender.setUsername("yonghun0404@gmail.com"); // 사용자 이름 설정
        mailSender.setPassword("qdkvqouzsyewmfoh"); // 비밀번호 설정
        // 마스터만 갖고있는 내용
        // 추가적인 SMTP 프로퍼티 설정
        Properties properties = new Properties();
        properties.setProperty("mail.smtp.timeout", "5000");
        properties.setProperty("mail.smtp.auth", "true");
        properties.setProperty("mail.smtp.starttls.enable", "true");
        
        mailSender.setJavaMailProperties(properties);

        return mailSender;

     // 장용훈만 갖고있는 내용2
    }
	
}
