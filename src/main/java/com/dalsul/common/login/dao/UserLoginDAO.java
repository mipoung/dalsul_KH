package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserRegisterVO;

@Mapper
public interface UserLoginDAO {
	public String getSalt(UserRegisterVO uvo);
	public String passwordVerification(UserRegisterVO uvo);
	public String getPassword(UserRegisterVO uvo);
	public UserRegisterVO getUserInfo(UserRegisterVO uvo);
}
