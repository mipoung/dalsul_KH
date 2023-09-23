package com.dalsul.user.pay.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.vo.CartVO;
import com.dalsul.user.pay.service.PaymentService;
import com.dalsul.user.pay.vo.PayDTO;
import com.dalsul.user.pay.vo.PayVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class PayMentController {
	
@Autowired
private PaymentService paymentService;



@ResponseBody
@PostMapping("/orderInsert")
public String orderInsert(@RequestBody PayDTO payDTO, @SessionAttribute(name = "userLogin") UserVO uvo) {
	log.info("호출 성공");
	
	String result = "FAIL";
	
	System.out.println(payDTO.toString());
	
	PayVO pvo = new PayVO();
	pvo.setOrder_delivery_info(payDTO.getOrder_delivery_info());
	pvo.setOrder_total_price(payDTO.getOrder_total_price());
	pvo.setOrder_use_coupon(payDTO.getOrder_use_coupon());
	
	System.out.println(pvo.toString());
	System.out.println(uvo.toString());
	
	pvo.setUser_no(uvo.getUser_no());
	int orderInsertCnt = paymentService.orderInsert(pvo); // 주문 테이블에 레코드 insert
	System.out.println(orderInsertCnt);
	if(orderInsertCnt != 1) {
		return result;
	}
	System.out.println("orderInsert성공");
	
	pvo.setOrder_no(paymentService.getOrderNo(pvo));

	//주문이 완료된 후 그 값을 참조해서 배송지 테이블에 배송정보를 담은 레코드 추가 (uvo에서 가져올 정보 , user_no, oreder_no)
	log.info(pvo.toString());
	
	for(int i=0 ; i<payDTO.getProduct_no().size() ; i++) {
		pvo.setProduct_no(payDTO.getProduct_no().get(i));
		pvo.setQuantity(payDTO.getQuantity().get(i));
		int orderDetailCnt = paymentService.orderDetail(pvo); // 주문 상세 테이블에 레코드 insert
		System.out.println(orderDetailCnt);
		if(orderDetailCnt != 1) {
			return result;
		}
	}
	System.out.println("orderDetail 성공");
	
	CartVO cartVO = new CartVO();
    cartVO.setCart_id(uvo.getUser_no());
    // cart_id를 사용하여 삭제 작업 수행
    int cartDeleteCnt = paymentService.cartDelete(cartVO); // 현재 접속중인 사용자의 장바구니 상세 레코드 삭제
	System.out.println(cartDeleteCnt);
    if(cartDeleteCnt == 0) {
		return result;
	}else {
		result = "SUCCESS";
	}
    System.out.println("cartDelete 성공");
    
	return result;
};

//결제완료 페이지 조회
	@GetMapping("/success")
	public String cartPage(@SessionAttribute(value = "userLogin", required = false) UserVO uvo,Model model) {
	if(uvo==null) {
		return "login/userLoginView";
			
	}
	
	List<PayVO> payList = paymentService.payList(uvo);
	model.addAttribute("payList", payList);
	
    
	
    return "cart/success";
}




}    
	    