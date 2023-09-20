package com.dalsul.user.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;

@Mapper
public interface MyPageDAO {

	public UserVO getUserInfo(int user_no);
	
}
