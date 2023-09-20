package com.dalsul.user.coupon_recive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.coupon_recive.dao.Coupon_reciveDAO;
import com.dalsul.user.coupon_recive.vo.Coupon_reciveVO;

import lombok.Setter;

@Service
public class Coupon_reciveServiceImpl implements Coupon_reciveService {

	@Setter(onMethod_ = @Autowired)
	private Coupon_reciveDAO coupon_reciveDAO;
	
	@Override
	public List<Coupon_reciveVO> couponList(Coupon_reciveVO cvo) {
		List<Coupon_reciveVO> list =null;
		list = coupon_reciveDAO.couponList(cvo);
		return list;
	}
	
	@Override
	public int couponListCnt(Coupon_reciveVO cvo) {
		return coupon_reciveDAO.couponListCnt(cvo);
	}
}
