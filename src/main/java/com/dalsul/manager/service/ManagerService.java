package com.dalsul.manager.service;

import java.util.List;

import com.dalsul.common.login.vo.UserVO;

public interface ManagerService {
	public List<UserVO> getUserList(UserVO uvo);
	public int userListCnt(UserVO uvo);
	public int dropUsers(List<Integer> user_no);
	public int appointManager(List<Integer> user_no);
}
