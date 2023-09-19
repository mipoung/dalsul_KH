package com.dalsul.user.pay.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.pay.vo.PayVO;

@Mapper
public interface PayDAO {

	
	//public List<PayVO> orderInsert(PayVO payVO);
	public PayVO orderInsert(PayVO payVO);
}
