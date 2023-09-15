package com.dalsul.user.coupon.dao;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.coupon.vo.CouponVO;

@Mapper
public interface CouponDAO {

	public int insertCoupon(CouponVO cvo); //관리자 쿠폰 정보 추가

}
