package com.dalsul.user.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.pay.vo.PayVO;

@Mapper
public interface MyPageDAO {

	public UserVO getUserInfo(int user_no);
	public int updateOrderStatusToCancel(int order_no);
}
