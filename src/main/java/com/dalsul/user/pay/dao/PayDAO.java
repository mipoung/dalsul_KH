package com.dalsul.user.pay.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.vo.PayVO;

@Mapper
public interface PayDAO {
	
	public int orderInsert(PayVO payVO);
	public int orderDetail(PayVO payVO);
	public int cartDelete(CartVO cvo);
	public int getOrderNo(PayVO pvo);
	public List<PayVO> payList(UserVO uvo);
	public List<PayVO> orderList(UserVO uvo);
	public List<PayVO> orderListDetail(PayVO pvo);
	public int updateQuantity (PayVO pvo);
}
