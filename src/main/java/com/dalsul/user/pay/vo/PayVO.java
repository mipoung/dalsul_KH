package com.dalsul.user.pay.vo;

import lombok.Data;

@Data
public class PayVO {
	private int	order_no;  //주문번호 시퀀스
	private int user_no;  //회원 일련번호 시퀀스
	private int order_use_point;  //사용적립금
	private int order_dlv_fee; //배송비
	private int order_total_product_price;  //총 상품금액
	private int order_set_point;  //결제 적립금
	private int order_use_coupon;
	private String order_delivery_info;
}
