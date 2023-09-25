package com.dalsul.common.encryption.service;

import java.security.SecureRandom;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class EncryptionServiceImpl implements EncryptionService {
	
	@Autowired
	private PasswordEncoder encoder;
	
	public String createSalt() {
		String result = "";
		byte[] salt = new byte[24];
		new SecureRandom().nextBytes(salt);
		result = salt.toString();
		return result;
	}

	@Override
	public String hashingPassword(String salt, String password) {
		// 비밀번호 문자열 앞에 slat값 붙이기
		String saltingPassword = salt+password;
		// Bcrypt로 암호화한 뒤 salt값과 해싱값 vo에 저장 
		String hashingValue = encoder.encode(saltingPassword);
		
		return hashingValue;
	}
		
}