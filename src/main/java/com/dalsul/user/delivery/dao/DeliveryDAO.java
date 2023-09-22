package com.dalsul.user.delivery.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.delivery.vo.DeliveryVO;
import com.dalsul.user.pay.vo.PayVO;

@Mapper
public interface DeliveryDAO {

	public DeliveryVO insertDelivery(PayVO pvo);
}
