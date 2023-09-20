package com.dalsul.user.pay.service;

import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.vo.PayVO;

public interface PaymentService {

	public int orderInsert(PayVO pvo);
	public int orderDetail(PayVO pvo);
	public int cartDelete(CartVO cvo);
	public int getOrderNo(PayVO pvo);
}