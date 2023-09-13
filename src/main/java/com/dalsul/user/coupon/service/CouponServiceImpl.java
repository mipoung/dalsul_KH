package com.dalsul.user.coupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dalsul.user.coupon.dao.CouponDAO;
import com.dalsul.user.coupon.vo.CouponVO;

import lombok.Setter;

@Service
public class CouponServiceImpl implements CouponService {

	@Setter(onMethod_ = @Autowired)
	private CouponDAO couponDAO;
	
	/*쿼리문을 실행하고 성공과 실패여부를 1과 0으로 반환받음, 그결과를 확인하기위해 console에서 확인*/
	@Override
	public int couponInsert(CouponVO cvo) {
		int result =0;
		
		result =  couponDAO.couponInsert(cvo);
		if(result !=0) {
			System.out.println("추가에 성공하였습니다.");
		}else {
			System.out.println("추가에 실패하였습니다");
		}
		return result;
	}
	
}
