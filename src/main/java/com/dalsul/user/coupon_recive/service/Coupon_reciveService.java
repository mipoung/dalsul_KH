package com.dalsul.user.coupon_recive.service;

import java.util.List;

import com.dalsul.user.coupon_recive.vo.Coupon_reciveVO;

public interface Coupon_reciveService {
	//검색 포함 사용가능 쿠폰목록 구현 메소드
	public List<Coupon_reciveVO> couponList(Coupon_reciveVO cvo);
	//페이징 처리
	public int couponListCnt(Coupon_reciveVO cvo);

}
