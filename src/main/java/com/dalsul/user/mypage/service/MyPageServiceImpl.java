package com.dalsul.user.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.mypage.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private MyPageDAO mypageDAO;
	
	@Override
	public UserVO getUserInfo(int user_no) {
		UserVO uvo = mypageDAO.getUserInfo(user_no);
		return uvo;
	}
	
}
