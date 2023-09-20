package com.dalsul.common.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;


@Mapper
public interface UserRegisterDAO {
	public int userRegistring(UserVO uvo);
	public int chkDuplicatedPhone(String PhoneNumber);
	public int chkDuplicatedEmail(String mailAddress);
	public int userCreateCart(UserVO uvo);
}
