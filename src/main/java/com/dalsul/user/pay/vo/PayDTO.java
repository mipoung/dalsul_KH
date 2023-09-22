package com.dalsul.user.pay.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PayDTO {
	private int order_total_price;  //총 상품금액
	private int order_use_coupon; //사용쿠폰
	private String order_delivery_info; //배송지
	private List<Integer> product_no; //product_order 상품일련번호
	private List<Integer> quantity; //상품 갯수
}
