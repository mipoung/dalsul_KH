package com.dalsul.user.mypage.service;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.pay.vo.PayVO;

public interface MyPageService {
	public UserVO getUserInfo(int user_no);
	public int updateOrderStatusToCancel(int order_no);
}
