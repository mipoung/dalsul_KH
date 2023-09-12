package com.dalsul.common.login.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.encryption.service.EncryptionService;
import com.dalsul.common.login.dao.UserRegisterDAO;
import com.dalsul.common.login.vo.UserRegisterVO;

import lombok.Setter;

@Service
public class UserRegisterServiceImpl implements UserRegisterService{

	@Setter(onMethod_ = @Autowired)
	private UserRegisterDAO userRegisterDAO;

	@Setter(onMethod_ = @Autowired)
	private EncryptionService encryptionService;
	
	@Setter(onMethod_ = @Autowired)
	private HttpSession session;
	
	@Override
	public int userRegistring(UserRegisterVO rvo) {
		
		// 세션에 저장된 값 가져오기()
		UserRegisterVO uvo = (UserRegisterVO)session.getAttribute("regInfo");
		// 폼으로 전달받은 이메일 저장
		uvo.setUser_email(rvo.getUser_email());
		// 솔트값 저장
		uvo.setUser_salt(encryptionService.createSalt());
		// 비밀번호 저장
		uvo.setUser_password(
				encryptionService.hashingPassword(
						uvo.getUser_salt(), rvo.getUser_password()
				)
		);
		
		System.out.println("INSERT가 준비된 uvo의 값 : "+uvo.toString());
		
		int result = userRegisterDAO.userRegistring(uvo);
		
		return result;
	}

	@Override
	public int chkDuplicatedPhone(String phoneNumber) {
		int result = userRegisterDAO.chkDuplicatedPhone(phoneNumber);
		return result;
	}

	@Override
	public int chkDuplicatedEmail(String mailAddress) {
		int result = userRegisterDAO.chkDuplicatedEmail(mailAddress);
		return result;
	}
	
	

}