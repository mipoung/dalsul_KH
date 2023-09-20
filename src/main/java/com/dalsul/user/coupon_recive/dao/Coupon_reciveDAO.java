package com.dalsul.user.coupon_recive.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dalsul.user.coupon_recive.vo.Coupon_reciveVO;

@Mapper
public interface Coupon_reciveDAO {
	
	//사용자 발급쿠폰 조회, 검색포함 발급 쿠폰 목록 구현 메소드
	public List<Coupon_reciveVO> couponList(Coupon_reciveVO cvo);
	
	//사용자 발급쿠폰 조회에 사용할 페이징네이션 값 뽑는 메솓,
	public int couponListCnt(Coupon_reciveVO cvo);
	
}
