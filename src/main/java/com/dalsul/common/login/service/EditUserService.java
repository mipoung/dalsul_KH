package com.dalsul.common.login.service;

import com.dalsul.common.login.vo.UserVO;

public interface EditUserService {
	
	public int updateUserPassword(UserVO uvo);
	public int deleteUserAccount(UserVO uvo);
}
