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


//	     @PostMapping("/insertOrder")
//	    public String insertOrder(@RequestBody PayVO pvo,Model model) {
//	    	 log.info("insert호출 성공");
//	    	paymentService.orderInsert(pvo);
//	       
//		    	return "order/success"; // 결제 완료 페이지로 이동
//		    }

	    }    
	    