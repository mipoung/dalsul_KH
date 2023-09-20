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
		System.out.println("생성된 salt 값 : "+result);
		return result;
	}

	@Override
	public String hashingPassword(String salt, String password) {
		// 비밀번호 문자열 앞에 slat값 붙이기
		String saltingPassword = salt+password;
		System.out.println("salt+password 값 : "+saltingPassword);
		// Bcrypt로 암호화한 뒤 salt값과 해싱값 vo에 저장 
		String hashingValue = encoder.encode(saltingPassword);
				//new BCryptPasswordEncoder(10).encode(saltingPassword);
		
		System.out.println("해싱 값 : "+hashingValue);
		
		return hashingValue;
	}
		
}
