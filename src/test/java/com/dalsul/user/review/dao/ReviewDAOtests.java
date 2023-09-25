package com.dalsul.user.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.dalsul.user.pay.service.PaymentService;
import com.dalsul.user.pay.vo.PayVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ReviewDAOtests {

	@Setter(onMethod_ = @Autowired)
	private ReviewDAO reviewDAO;
	
	@Setter(onMethod_ = @Autowired)
	private PaymentService paymentService;
	
	@Test
	public void isReviewedTest() {
		PayVO pvo = new PayVO();
		pvo.setOrder_no(1);
		
		
		/* 여기서 주문 상세 테이블로 보내는 값을 불러옴 */
		log.info("orderlistDetailList() 메소드 실행");
		log.info("주문번호 : " + pvo.getOrder_no());
		
		List<PayVO> orderListDetail = paymentService.orderListDetail(pvo);
		log.info("주문상세 데이터 : " + orderListDetail.toString());
		
		// 제품 넘버가 있어야 아래 코드 실행 가능.
		List<PayVO> isReviewResults = reviewDAO.isReviewed(pvo);
		

		// 제품 번호를 기반으로 리뷰 작성 여부를 Map에 저장
	    Map<Integer, Integer> productReviewMap = new HashMap<>();
	    for (PayVO result : isReviewResults) {
	        productReviewMap.put(result.getProduct_no(), result.getIsReviewed());
	    }
	    
	    // 결과 확인
	    for (Integer key : productReviewMap.keySet()) {
	        log.info("Product_no: " + key + " | isReviewed: " + productReviewMap.get(key));
	    }
		
	
		
		
		/* 여기서 주문상세페이지 해당 제품에 리뷰가 있는지 확인 */
		//List<PayVO> result = reviewDAO.isReviewed(pvo);
		//log.info("주문 상세 리뷰여부 데이터 :" + result);
		
		
		
	}
	
	
	
}
