package com.dalsul.user.pay.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayVO {
	private	int order_no;  //주문번호 시퀀스
	private int user_no;  //회원 일련번호 시퀀스 -> usersVO에서 세션으로 받아옴
	//private int order_use_point;  //사용적립금
	private int order_dlv_fee; //배송비 default=3000
	private int order_total_price;  //총 상품금액
	//private int order_set_point;  //결제 적립금
	private int order_use_coupon; //사용쿠폰
	private String order_delivery_info; //배송지
	private String order_status; //주문상태 default='결제 완료'
	private String order_date; //주문일자 sysdate
	private String order_update_date; //주문수정일자 sysdate
	
	private int order_detail_no; //주문 상세 번호 product_order pk
	private int product_no; //product_order 상품일련번호
	private int quantity; //상품 갯수
	private String product_name; //상품명
	private String product_main_image; //상품이미지
	
	
	
	private Integer isReviewed;
}
