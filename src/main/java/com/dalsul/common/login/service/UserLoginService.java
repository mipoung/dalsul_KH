package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.UserRegisterVO;

public interface UserLoginService {
	public String getSalt(UserRegisterVO uvo);
	public UserRegisterVO passwordVerification(UserRegisterVO uvo);
}
