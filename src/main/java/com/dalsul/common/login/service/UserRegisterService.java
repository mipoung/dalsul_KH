package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.UserVO;

public interface UserRegisterService {
	public int userRegistring(UserVO rvo);
	public int chkDuplicatedPhone(String phoneNumber);
	public int chkDuplicatedEmail(String mailAddress);
}
