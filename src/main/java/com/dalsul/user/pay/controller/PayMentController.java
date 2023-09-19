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
public String orderInsert(@RequestBody PayVO pvo,
						  @RequestParam("product_no") List<String> product_no,
						  @RequestParam("quantity") List<Integer> quantity,
						  @SessionAttribute(name = "userLogin") UserVO uvo) {
	log.info("호출 성공");
	
	String result = "FAIL";
	
	System.out.println(pvo.toString());
	System.out.println(uvo.toString());
	System.out.println(product_no.toString());
	System.out.println(quantity.toString());
	
	pvo.setUser_no(uvo.getUser_no());
	int orderInsertCnt = paymentService.orderInsert(pvo); // 주문 테이블에 레코드 insert
	System.out.println(orderInsertCnt);
	if(orderInsertCnt != 1) {
		return result;
	}
	
	
	pvo.setOrder_no(paymentService.getOrderNo(pvo));
	
	for(int i=0 ; i<quantity.size() ; i++) {
		pvo.setProduct_no(result);
		pvo.setQuantity(i);
		int orderDetailCnt = paymentService.orderDetail(pvo); // 주문 상세 테이블에 레코드 insert
		System.out.println(orderDetailCnt);
		if(orderDetailCnt != 1) {
			return result;
		}
	}
	
	CartVO cartVO = new CartVO();
    cartVO.setCart_id(uvo.getUser_no());
    // cart_id를 사용하여 삭제 작업 수행
    int cartDeleteCnt = paymentService.cartDelete(cartVO); // 현재 접속중인 사용자의 장바구니 상세 레코드 삭제
	System.out.println(cartDeleteCnt);
    if(cartDeleteCnt != 1) {
		return result;
	}else {
		result = "SUCCESS";
	}
	
	return result;
};


/*
 * @GetMapping("/orderDetail") public String orderDetail(@ModelAttribute PayVO
 * pvo) { log.info("detail 호출 성공"); paymentService.orderDetail(pvo);
 * 
 * return "redirect:/cartDelete"; };
 * 
 * @GetMapping("/cartDelete") public String cartDelete(@RequestParam("cart_id")
 * int cartId){ //, RedirectAttributes redirectAttributes)
 * 
 * CartVO cartVO = new CartVO(); cartVO.setCart_id(cartId); // cart_id를 사용하여 삭제
 * 작업 수행 paymentService.cartDelete(cartVO);
 * 
 * // if (deleted) { // // 삭제가 성공한 경우 메시지를 Flash 속성으로 추가 //
 * redirectAttributes.addFlashAttribute("message", "성공"); // } else { // // 삭제가
 * 실패한 경우 메시지를 Flash 속성으로 추가 // redirectAttributes.addFlashAttribute("message",
 * "실패"); // }
 * 
 * return "cart/success"; }
 */
}    
	    