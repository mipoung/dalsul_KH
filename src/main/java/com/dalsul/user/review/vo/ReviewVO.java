package com.dalsul.user.review.vo;

import com.dalsul.common.session.UserVO;

import lombok.Data;

/*
 *     REVIEW_NO NUMBER NOT NULL,
    ORDER_NO NUMBER NOT NULL,
    USER_NO NUMBER NOT NULL,
    REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
    REVIEW_RATING NUMBER NOT NULL,
    REVIEW_LIKE NUMBER NULL,
    REVIEW_IMAGE VARCHAR2(512),
    REVIEW_DATE DATE DEFAULT SYSDATE,
 */

@Data
public class ReviewVO extends OrdersVO {
	private int review_no = 0;
	private int user_no = 0; // 이미 UserVO가 갖고있으니 가져와서 사용하는거로 변경 예정
	private String review_content = "";
	private int review_rating = 0;
	private int review_like_count= 0;
	private String review_image = "";
	private String review_date;
	
	// 회원 정보를 가짐
	private UserVO user;
	
	
	
	

}
