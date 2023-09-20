package com.dalsul.user.coupon_recive.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Coupon_reciveVO extends CommonVO {

	private int coupon_recive_no; //발급받은 쿠폰 하나의 아이디 시퀀스
	private int user_no;	//발급받은 사용자가 누구인지 알수있는 user_no 참조키
	private int coupon_no;	// 발급받은 쿠폰이 무엇인지 알수있는 coupon_no 참조키
	private String coupon_recive_date;	//발급받은 날짜를 알수있는 날짜
	private int coupon_recive_status;	// 발급받은 쿠폰을 사용했는지 알수있는 coupon_recive_status
}
