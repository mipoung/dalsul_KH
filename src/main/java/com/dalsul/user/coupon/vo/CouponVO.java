package com.dalsul.user.coupon.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponVO {
	private int coupon_no;			//쿠폰 고유 번호
	private String coupon_name;		//쿠폰 이름
	private int coupon_discount;	//쿠폰 할인 가격
	private String coupon_date;		//쿠폰 생성일자
	private int coupon_limit;		//쿠폰 발급량
	private int coupon_status;		//쿠폰 발급 가능 여부(디폴트=1, 사용가능)(0, 사용불가능)
}
