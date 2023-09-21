package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.manager.service.ProductService;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;

@Controller
@RequestMapping("/manager/product/*")
public class ProductController {
	/*
	@Setter(onMethod_ = @Autowired)
	private ProductService productService;
	
	@GetMapping("/productListView")
	public String productListView(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, Model model) {
	
		if(mvo==null) {
			return "/manager/managerLoginView";
		}
		
		List<ProductVO> productList = productService.getProductList();
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 반환
		int total = productService.getProductListCnt();
		System.out.println(total);
		// 페이징 처리
		//model.addAttribute("pageMaker", new PageDTO(uvo, total));
		
		return "/manager/product/managerProduct";
	}
	
	@GetMapping("/productRegForm")
	public String productRegForm() {
		
		return "/manager/product/productRegForm";
	}
	
	@ResponseBody
	@GetMapping("/productRegProcess")
	public String productRegProcess(@ModelAttribute ProductVO pvo) {
		String response = "FAIL";
		
		int result = productService.productRegProcess(pvo);
		if(result != 1) {
			return response;
		}else {
			return response = "SUCCESS";
		}
		
		return response;
	}
	
	@ResponseBody
	@GetMapping("/productPriceUpdate")
	public String productPriceUpdate(@ModelAttribute ProductVO pvo) {
		String response = "FAIL";
		
		int result = productService.productPriceUpdate(pvo);
		if(result != 1) {
			return response;
		}else {
			return response = "SUCCESS";
		}
		
		return response;
	}
	
	@ResponseBody
	@GetMapping("/productDelete")
	public String productDelete(@RequestParam ProductVO pvo) {
		String response = "FAIL";
		
		int result = productService.productDelete(pvo);
		if(result != 1) {
			return response;
		}else {
			return response = "SUCCESS";
		}
		
		return response;
	}
	*/
}
