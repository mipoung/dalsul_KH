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
	
	//조인을 통해 coupon 정보도 같이 옴겨야 하므로 coupon vo 의 필드 선언
	//쿠폰테이블에서 필요한 정보를 일단 다뽑아온다. coupon no는 이미 리시브에 있어서 생략
	private String coupon_name;		//해당 쿠폰 이름
	private int coupon_discount;	//해당 쿠폰 할인 가격
	private String coupon_date;		//해당쿠폰 관리자 생성일자
	private int coupon_limit;		//해당 쿠폰 발급량
	private int coupon_status;		//해당 쿠폰 발급 가능 여부(디폴트=1, 사용가능)(0, 사용불가능)
}
