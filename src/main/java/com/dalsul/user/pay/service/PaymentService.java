package com.dalsul.user.pay.service;

import java.util.List;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.vo.PayVO;

public interface PaymentService {

	public int orderInsert(PayVO pvo);
	public int orderDetail(PayVO pvo);
	public int cartDelete(CartVO cvo);
	public int getOrderNo(PayVO pvo);
	public List<PayVO> payList(UserVO uvo);
	public List<PayVO> orderList(UserVO uvo);
	public List<PayVO> orderListDetail(PayVO pvo);
	public int updateProductStock (PayVO pvo);
	public List<PayVO> refundDetailList(UserVO uvo);
	//public List<PayVO> getProductQuantity(PayVO pvo);
}