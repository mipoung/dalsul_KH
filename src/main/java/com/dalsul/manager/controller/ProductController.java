package com.dalsul.manager.controller;

import java.util.List;
import java.util.Map;

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

import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.manager.service.ProductService;
import com.dalsul.user.main.vo.ProductVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/product/*")
public class ProductController {
	
	@Setter(onMethod_ = @Autowired)
	private ProductService productService;
	
	@GetMapping("/productListView")
	public String productListView(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, @ModelAttribute ProductVO pvo, Model model) {
		log.info("productListView() 실행");
		if(mvo==null) {
			return "/manager/managerLoginView";
		}
		// 한 페이지당 15개 데이터 노출
		pvo.setAmount(15);
		
		List<ProductVO> productList = productService.getProductList(pvo);
		
		model.addAttribute("productList", productList);
		
		// 전체 레코드 수 반환
		int total = productService.getProductListCnt(pvo);
		// 페이징 처리

		model.addAttribute("pageMaker", new PageDTO(pvo, total));
		
		return "/manager/product/managerProduct";
	}
	
	@GetMapping("/productRegForm")
	public String productRegForm() {
		
		return "/manager/product/productRegForm";
	}
	
	
	@ResponseBody
	@PostMapping("/productRegProcess")
	public String productRegProcess(@ModelAttribute ProductVO pvo) {
		String response = "FAIL";
		
		int result = productService.productRegProcess(pvo);
		if(result != 1) {
			return response;
		}else {
			return response = "SUCCESS";
		}
	}

	@GetMapping("/productUpdateForm")
	public String productUpdateForm(@RequestParam("selectedItems") List<Integer> product_no, Model model) {
		
		List<ProductVO> updateList = productService.productUpdateList(product_no);
		
		model.addAttribute("updateList", updateList);
		
		return "/manager/product/productUpdateForm";
	}
	
	@ResponseBody
	@PostMapping("/productUpdateProcess")
	public String productUpdateProcess(@RequestBody List<Map<String, String>> formDataList) {
	    try {
	        // formDataList에는 여러 개의 폼 데이터가 리스트로 들어옵니다.
	        
	        for (Map<String, String> formData : formDataList) {
	            // 각 폼 데이터를 처리하는 로직을 작성
	            String productNo = formData.get("product_no[0]");
	            String productPrice = formData.get("product_price[0]");
	            String productStock = formData.get("product_stock[0]");
	            String productSaleStatus = formData.get("product_sale_status[0]");
	            
	            System.out.println(productNo+productPrice+productStock+productSaleStatus);
	            
	            /*ProductVO pvo = new ProductVO();
	            
	            pvo.setProduct_no(Integer.parseInt(productNo));
	            pvo.setProduct_price(Integer.parseInt(productPrice));
	            pvo.setProduct_stock(Integer.parseInt(productStock));
	            pvo.setProduct_sale_status(Integer.parseInt(productSaleStatus));
	            
	            int result = productService.productUpdate(pvo);
	            
	            if(result !=1 ) {
	            	return "FAIL";
	            }*/
	        }

	        return "SUCCESS";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "FAIL";
	    }
	}
	
	@ResponseBody
	@PostMapping("/productDelete")
	public String productDelete(@RequestParam("selectedItems") List<Integer> product_no) {
		String response = "FAIL";
		
		int result = productService.productDelete(product_no);
		System.out.println(result);
		if(result == 0) {
			return response;
		}else {
			return response = "SUCCESS";
		}
	}
	
}
