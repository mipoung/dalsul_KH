package com.dalsul.user.coupon.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.coupon.vo.CouponVO;

@Mapper
public interface CouponDAO {

	public int couponInsert(CouponVO cvo);

}
