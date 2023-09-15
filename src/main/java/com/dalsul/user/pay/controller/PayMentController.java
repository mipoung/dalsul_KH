package com.dalsul.user.pay.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.user.pay.service.PaymentService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PayMentController {
	
	@Autowired
	PaymentService paymentService;

	private IamportClient api;
	
	public PayMentController(){		
		//토큰 발급
		this.api = new IamportClient("4378877825703427","iOrrrpWxSQZj0tME1FgKheJPQPs1WMsoQs8ogtYbgD49poRYZ2qoNB8QhkAmGbkUxJn51oguG7ddRBoS");
	}
	
}