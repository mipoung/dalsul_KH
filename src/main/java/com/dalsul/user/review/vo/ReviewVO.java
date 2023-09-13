package com.dalsul.user.review.vo;

import com.dalsul.common.vo.CommonVO;

import lombok.Data;



@Data
public class ReviewVO extends CommonVO {
	private int review_no = 0;
	private int user_no = 0; // 이미 UserVO가 갖고있으니 가져와서 사용하는거로 변경 예정
	private String review_content = "";
	private int review_rating = 0;
	private int review_like_count= 0;
	private String review_image = "";
	private String review_date;
	private int product_no = 0;
	
	// productVO에도 있음
	private String product_name="";
	private String product_alcohol;
	
	private ProductVO pvo;
	
	
	/*
	public String getProduct_name() {
        if (pvo != null) {
            return pvo.getProduct_name();
        }
        return "";
    }
	*/
	
	
	
	

	
	

}
