package com.dalsul.common.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.dalsul.common.encryption.service.EncryptionService;
import com.dalsul.common.login.dao.UserLoginDAO;
import com.dalsul.common.login.vo.UserRegisterVO;

import lombok.Setter;

@Service
public class UserLoginServiceImpl implements UserLoginService{

	@Setter(onMethod_ = @Autowired)
	private UserLoginDAO loginDAO;
	
	@Setter(onMethod_ = @Autowired)
	private EncryptionService encryptionService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public String getSalt(UserRegisterVO uvo) {
		String result = loginDAO.getSalt(uvo);
		return result;
	}

	@Override
	public UserRegisterVO passwordVerification(UserRegisterVO uvo) {
		
		UserRegisterVO result = null;
		String rawPassword = uvo.getUser_salt()+uvo.getUser_password();
		String encodedPassword = loginDAO.getPassword(uvo);
		
		
		if(encoder.matches(rawPassword, encodedPassword) == true) {
			result = loginDAO.getUserInfo(uvo);
		}
		
		
		//String password = encryptionService.hashingPassword(uvo.getUser_salt(), uvo.getUser_password());
		//System.out.println("로그인(salt+pwd) 값 : "+password);
		
		//uvo.setUser_password(password);
		//String result = loginDAO.passwordVerification(uvo);
		return result;
	}
	
}
