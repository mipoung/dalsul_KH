package com.dalsul.user.pay.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.dalsul.user.pay.dao.PayDAO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Override
	public String paidCheck(String iD) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void rePaid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void paid(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void paidUpdate(int months) {
		// TODO Auto-generated method stub
		
	}
//	PayDAO padDao;
//	
//	//ServiceImpl
//	@Override
//	public void paid(Map<String, Object> map) {
//		padDao.paid(map);
//	}
//
//	@Override
//	public void rePaid(Map<String, Object> map) {
//		padDao.rePaid(map);		
//	}
//
//	@Override
//	public String paidCheck(String ID) {
//	    return padDao.paidCheck(ID);
//	}
//	@Override
//	public void paidUpdate(int months) {
//		// TODO Auto-generated method stub
//		
//	}

}
