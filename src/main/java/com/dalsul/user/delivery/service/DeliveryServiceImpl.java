package com.dalsul.user.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.delivery.dao.DeliveryDAO;
import com.dalsul.user.delivery.vo.DeliveryVO;
import com.dalsul.user.pay.vo.PayVO;

import lombok.Setter;


@Service
public class DeliveryServiceImpl implements DeliveryService {
	
	@Setter(onMethod_ =@Autowired )
	private DeliveryDAO deleveryDAO;
	
	
	@Override
	public DeliveryVO insertDelivery(PayVO pvo) {
	
		DeliveryVO result = null;
		
		result = deleveryDAO.insertDelivery(pvo);
		if(result !=null) {
			System.out.println("추가성공");
		}else {
			System.out.println("추가실패");
		}
		
		return result;
	}
	
	
}
