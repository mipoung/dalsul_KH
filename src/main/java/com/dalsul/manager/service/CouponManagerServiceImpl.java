package com.dalsul.manager.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.manager.dao.CouponManagerDAO;
import com.dalsul.user.coupon.vo.CouponVO;

import lombok.Setter;

@Service
public class CouponManagerServiceImpl implements CouponManagerService {
	
	@Setter(onMethod_ = @Autowired)
	private CouponManagerDAO couponManagerDAO;
	
	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	
	public int insertCoupon(CouponVO cvo) {
		int result =0;
		
		result =  couponManagerDAO.insertCoupon(cvo);
		if(result !=0) {
			System.out.println("추가에 성공하였습니다.");
		}else {
			System.out.println("추가에 실패하였습니다");
		}
		return result;
	}
	
	/*쿠폰목룍 구현*/
	public List<CouponVO> couponList(CouponVO cvo) {
		List<CouponVO> list =null;
		list = couponManagerDAO.couponList(cvo);
		return list;
	}
	
	/*페이징 구현*/
	public int couponListCnt(CouponVO cvo) {
		return couponManagerDAO.couponListCnt(cvo);
	}
}
