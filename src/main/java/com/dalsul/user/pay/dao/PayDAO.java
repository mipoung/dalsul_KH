package com.dalsul.user.pay.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.vo.PayVO;

@Mapper
public interface PayDAO {
	
	public int orderInsert(PayVO payVO);
	public int orderDetail(PayVO payVO);
	public int cartDelete(CartVO cvo);
	public int getOrderNo(PayVO pvo);
}
