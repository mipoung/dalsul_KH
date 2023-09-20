package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;

@Mapper
public interface EditUserDAO {
	public int updateUserPassword(UserVO uvo);
	public int deleteUserAccount(UserVO uvo);
}
