package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.UserRegisterVO;

public interface UserRegisterService {
	public int userRegistring(UserRegisterVO rvo);
	public int chkDuplicatedPhone(String phoneNumber);
	public int chkDuplicatedEmail(String mailAddress);
}
