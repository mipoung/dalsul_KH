package com.dalsul.user.pay.service;

import java.util.Map;

public interface PaymentService {

	String paidCheck(String iD);

	void rePaid(Map<String, Object> map);

	void paid(Map<String, Object> map);

	void paidUpdate(int months);
	
}

