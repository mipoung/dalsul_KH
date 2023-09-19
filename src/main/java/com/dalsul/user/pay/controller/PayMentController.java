package com.dalsul.user.pay.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.user.pay.service.PaymentService;
import com.dalsul.user.pay.vo.PayVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/order/*")
@Slf4j
public class PayMentController {
	
		@Autowired
	    private PaymentService paymentService;

	   
	    
	  
//	    public String insertOrder(PayVO pvo) {
//	    	log.info("insert호출 성공");
//	    	paymentService.orderInsert(pvo);
//	       
//	    	return "order/success"; // 결제 완료 페이지로 이동
//	    }
	     @PostMapping("/insertOrder")
	    public String insertOrder(PayVO pvo,Model model) {

//	        // 여기서 PayVO 객체를 받아서 결제 정보를 처리하고 데이터베이스에 저장
//	        int result = paymentService.orderInsert(pvo);
//	        log.info("insert호출 성공");
//	        if (result > 0) {
//	            // 결제 성공 처리
//	            return "order/success";
//	        } else {
//	            // 결제 실패 처리
//	            return "cart/cartList";
//	        }
	    	PayVO payList = paymentService.orderInsert(pvo);
	    	
	    	System.out.println(payList.toString());
	    	model.addAttribute("payList",payList);
	    	
	    	return "order/success";
	    	
	    }    
	    
	}
	
