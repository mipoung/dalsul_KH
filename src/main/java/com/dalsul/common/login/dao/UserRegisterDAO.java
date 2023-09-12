package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserRegisterVO;

@Mapper
public interface UserRegisterDAO {
	public int userRegistring(UserRegisterVO uvo);
	public int chkDuplicatedPhone(String PhoneNumber);
	public int chkDuplicatedEmail(String mailAddress);
}
