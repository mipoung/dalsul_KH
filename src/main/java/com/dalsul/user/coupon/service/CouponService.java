package com.dalsul.user.coupon.service;

import java.util.List;

import com.dalsul.user.coupon.vo.CouponVO;

public interface CouponService {
	
	public int insertCoupon(CouponVO cvo);
	
	public List<CouponVO> couponList(CouponVO cvo);
	public int couponListCnt(CouponVO cvo); 
	
}
