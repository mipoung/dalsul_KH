package com.dalsul.user.coupon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.coupon.vo.CouponVO;

@Mapper
public interface CouponDAO {

	public int insertCoupon(CouponVO cvo); //관리자 쿠폰 정보 추가
	
	public List<CouponVO> couponList(CouponVO cvo); /*검색포함 글목록 구현 메소드*/
	public int couponListCnt(CouponVO cvo); /*페이징 처리 메소드*/
}
