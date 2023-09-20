package com.dalsul.common.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.dalsul.common.encryption.service.EncryptionService;
import com.dalsul.common.login.dao.ManagerLoginDAO;
import com.dalsul.common.login.dao.UserLoginDAO;
import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.common.login.vo.UserVO;

import lombok.Setter;

@Service
public class ManagerLoginServiceImpl implements ManagerLoginService{

	@Setter(onMethod_ = @Autowired)
	private ManagerLoginDAO managerLoginDAO;
	
	@Setter(onMethod_ = @Autowired)
	private EncryptionService encryptionService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Override
	public String getSalt(ManagerVO mvo) {
		String result = managerLoginDAO.getSalt(mvo);
		return result;
	}

	@Override
	public ManagerVO passwordVerification(ManagerVO mvo) {
		
		ManagerVO result = null;
		String rawPassword = mvo.getManager_salt()+mvo.getManager_password();
		String encodedPassword = managerLoginDAO.getPassword(mvo);
		
		if(encoder.matches(rawPassword, encodedPassword) == true) {
			result = managerLoginDAO.getManagerInfo(mvo);
		}
		
		return result;
	}
	
}
