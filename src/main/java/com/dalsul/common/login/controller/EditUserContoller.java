package com.dalsul.common.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.encryption.service.EncryptionService;
import com.dalsul.common.login.service.EditUserService;
import com.dalsul.common.login.service.UserLoginService;
import com.dalsul.common.login.vo.UserVO;

@Controller
@RequestMapping("/edit/*")
public class EditUserContoller {
	
	@Autowired
	private UserLoginService loginService;
	
	@Autowired
	private EncryptionService encryptionService;
	
	@Autowired
	private EditUserService editUserService;
	
	@ResponseBody
	@PostMapping("/updatePasswordchk")
	public String updateUserPasswordChk(@SessionAttribute("userLogin") UserVO uvo,@RequestParam("userPassword") String pwd, @RequestParam("changePassword") String changePwd){
		String result = "FAIL";

		// 솔트값에 비밀번호 붙이기
		String salt = loginService.getSalt(uvo);
		System.out.println("salt 값 : "+salt);
		
		// 솔트값을 못찾으면 = 입력한 이메일과 일치하는 salt 값이 없다면 로그인 실패
		if(salt==null) {
			return result;
		}
		
		// 비밀번호 암호화 후 이메일과 대조하여 로그인 검증
		uvo.setUser_salt(salt);
		uvo.setUser_password(pwd);
		UserVO userInfo = loginService.passwordVerification(uvo);
		System.out.println("userInfo 값 : "+userInfo);
		
		if(userInfo == null) {
			return result;
		}
		
		String newSalt = encryptionService.createSalt();
		String newPwd = encryptionService.hashingPassword(newSalt, changePwd);
		
		UserVO vo = new UserVO();
		vo.setUser_no(uvo.getUser_no());
		vo.setUser_email(uvo.getUser_email());
		vo.setUser_salt(newSalt);
		vo.setUser_password(newPwd);
		
		int updateResult = editUserService.updateUserPassword(vo);
		if(updateResult == 0) {
			return result;
		}else {
			result = "SUCCESS";
		}

		return result;
	}
	
	@ResponseBody
	@PostMapping("/deleteUserAccount")
	public String deleteUserAccount(@SessionAttribute("userLogin") UserVO uvo){
		String result = "FAIL";

		int delete_result = editUserService.deleteUserAccount(uvo);
		if(delete_result == 1) {
			result = "SUCCESS";
		}

		return result;
	}
	
}
