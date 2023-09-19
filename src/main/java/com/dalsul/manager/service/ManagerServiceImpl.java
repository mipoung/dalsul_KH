package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.manager.dao.ManagerDAO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDAO;
	
	@Override
	public List<UserVO> getUserList(UserVO uvo) {
		List<UserVO> result = managerDAO.getUserList(uvo);
		return result;
	}

}
