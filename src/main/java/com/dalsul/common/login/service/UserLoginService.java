package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.UserVO;

public interface UserLoginService {
	public String getSalt(UserVO uvo);
	public UserVO passwordVerification(UserVO uvo);
}
