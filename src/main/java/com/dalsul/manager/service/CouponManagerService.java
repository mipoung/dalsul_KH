package com.dalsul.manager.service;

import java.util.List;

import com.dalsul.user.coupon.vo.CouponVO;

public interface CouponManagerService {

	public List<CouponVO> couponList(CouponVO cvo); /*검색포함 글목록 구현 메소드*/
	public int couponListCnt(CouponVO cvo); /*페이징 처리 메소드*/
	public int insertCoupon(CouponVO cvo);
}
