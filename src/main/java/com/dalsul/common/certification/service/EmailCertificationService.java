package com.dalsul.common.certification.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

public interface EmailCertificationService {
	
	public String createCertificationCode();
	public MimeMessage createEmailForm(String email) throws MessagingException, UnsupportedEncodingException;
	public String sendEmail(String email) throws MessagingException, UnsupportedEncodingException;
	public String testsendEmail(String email) throws MessagingException, UnsupportedEncodingException;
}