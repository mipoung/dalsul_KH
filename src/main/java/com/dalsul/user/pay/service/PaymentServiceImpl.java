package com.dalsul.user.pay.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.pay.dao.PayDAO;
import com.dalsul.user.pay.vo.PayVO;

import lombok.Setter;


@Service
public class PaymentServiceImpl implements PaymentService {
	@Setter(onMethod_ =@Autowired )
	private PayDAO payDao;

	@Override
	public PayVO orderInsert(PayVO pvo) {
		PayVO result =payDao.orderInsert(pvo);
		return result;
	}
	
}
