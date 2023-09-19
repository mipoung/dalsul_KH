package com.dalsul.user.pay.service;

import java.util.List;

import com.dalsul.user.pay.vo.PayVO;

public interface PaymentService {

	//public List<PayVO> orderInsert(PayVO payVO);
	public PayVO orderInsert(PayVO pvo);
	
}