package com.dalsul.user.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.dao.PayDAO;
import com.dalsul.user.pay.vo.PayVO;

import lombok.Setter;


@Service
public class PaymentServiceImpl implements PaymentService {
	@Setter(onMethod_ =@Autowired )
	private PayDAO payDao;

	@Override
	public int orderInsert(PayVO pvo) {
		int orderInsertCnt = payDao.orderInsert(pvo);
		return orderInsertCnt;
	}

	@Override
	public int orderDetail(PayVO pvo) {
		int orderDetailCnt = payDao.orderDetail(pvo);
		return orderDetailCnt;
	}

	@Override
	public int cartDelete(CartVO cvo) {
		int cartDeleteCnt = payDao.cartDelete(cvo);
		return cartDeleteCnt;
	}

	@Override
	public int getOrderNo(PayVO pvo) {
		int result = payDao.getOrderNo(pvo);
		return result;
	}

	}
	

