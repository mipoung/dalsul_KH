package com.dalsul.common.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.dao.EditUserDAO;
import com.dalsul.common.login.vo.UserVO;

@Service
public class EditUserServiceImpl implements EditUserService {

	@Autowired
	private EditUserDAO editUserDAO;
	
	@Override
	public int updateUserPassword(UserVO uvo) {
		int result = editUserDAO.updateUserPassword(uvo);
		return result;
	}

	@Override
	public int deleteUserAccount(UserVO uvo) {
		int result = editUserDAO.deleteUserAccount(uvo);
		return result;
	}
	
}
