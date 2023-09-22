package com.dalsul.user.delivery.service;

import java.util.List;

import com.dalsul.user.delivery.vo.DeliveryVO;
import com.dalsul.user.pay.vo.PayVO;

public interface DeliveryService {
	
	public DeliveryVO insertDelivery (PayVO pvo);
}
