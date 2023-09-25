package com.dalsul.user.cart.vo;

import com.dalsul.user.main.vo.ProductVO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CartVO {
	
	
	 // 생성자를 통한 변환
    public CartVO(ProductVO productVO) {
        this.product_no = productVO.getProduct_no();
        this.product_name = productVO.getProduct_name();
        this.product_price = productVO.getProduct_price();
        this.quantity = 1; // 예: 장바구니에 추가될 때 기본 수량은 1로 설정
    }
	
	private int cart_id;
	private int product_no;
	private int product_price;
	private int quantity;
	private int total;
	
	
	private String product_name;
		
}
