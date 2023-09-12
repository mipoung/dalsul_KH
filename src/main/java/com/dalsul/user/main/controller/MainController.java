package com.dalsul.user.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.dalsul.user.main.service.MainService;
import com.dalsul.user.main.vo.ProductVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
		
	  	private final MainService mainService;

	    @Autowired
	    public MainController(MainService mainService) {
	        this.mainService = mainService;
	    }
	    
		/* 시작화면 호출 */
	  	@GetMapping("/")
	    public String main(Model model) {
	    	
	  		List<ProductVO> products = mainService.getMainPageProducts();
	    	model.addAttribute("products", products);

	    	log.info("메인페이지로 이동");
	    	log.info("상품개수 : "+products.size());
	        
	    	return "main/main"; 
	    }
	  	
	  	/* 검색페이지 이동 */
	    @GetMapping("/search")
	    public String searchPage() {
	        
	    	
	    	return "main/search"; // search.jsp 페이지로 이동
	    }
	  	

}
