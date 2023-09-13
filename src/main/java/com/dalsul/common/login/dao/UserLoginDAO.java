package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;


@Mapper
public interface UserLoginDAO {
	public String getSalt(UserVO uvo);
	public String passwordVerification(UserVO uvo);
	public String getPassword(UserVO uvo);
	public UserVO getUserInfo(UserVO uvo);
}
