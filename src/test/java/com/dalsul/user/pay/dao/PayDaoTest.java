package com.dalsul.user.pay.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.dalsul.user.pay.vo.PayVO;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Transactional
@Rollback
@Slf4j
	public class PayDaoTest {

	    @Autowired
	    private PayDAO payDao;
/******
	    @Test
	    public void testOrderInsert() {
	        PayVO pvo = new PayVO();

	        // 필요한 데이터 설정
	        pvo.setUser_no(3);
	        pvo.setOrder_use_coupon(1000);
	        pvo.setOrder_dlv_fee(3000);
	        pvo.setOrder_total_price(30000);
	        pvo.setOrder_delivery_info("서");
	        
	       int result=payDao.orderInsert(pvo); 
	       log.info("주문 테이블 성공해라: " + result);
	       log.info(pvo.toString());
	        
	       // assertNotNull(pay); // 유효한 PayVO 객체가 반환되는지 확인
	        //assertEquals(4, pay.getUser_no()); // user_no가 예상 값과 일치하는지 확인
	        // 필요한 다른 필드에 대한 어서션을 추가하세요
	    }
*****************/
	    
/*********************
@Test
public void testOrderDetail() {
	PayVO pvo = new PayVO();
	
	pvo.setOrder_no(61);
	pvo.setProduct_no(4);
	pvo.setUser_no(3);
	pvo.setQuantity(2);

	int result=payDao.orderDetail(pvo); 
    log.info("주문상세 테이블 성공 기원 " + result);
    log.info(pvo.toString());
}
***********************/
	    
//@Test
//public void testCartDelete() {
//	//PayVO pvo=new PayVO();
//	CartVO cvo = new CartVO();
//
//	log.info("삭제된 것 : " + payDao.cartDelete(cvo));
//	
//}
@Test
 public void testDetailList() {
	 PayVO pvo = new PayVO();
	 
	 pvo.setOrder_no(121);
	 List<PayVO> list =   payDao.orderListDetail(pvo); 
	 
     log.info(list.toString());
 }

}

