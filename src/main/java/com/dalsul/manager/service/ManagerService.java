package com.dalsul.manager.service;

import java.util.List;

import org.springframework.ui.Model;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.pay.vo.PayVO;

public interface ManagerService {
	public List<UserVO> getUserList(UserVO uvo);
	public int userListCnt(UserVO uvo);
	public int dropUsers(List<Integer> user_no);
	public int appointManager(List<Integer> user_no);
	public List<PayVO> orderListViewM(PayVO pvo);
}
