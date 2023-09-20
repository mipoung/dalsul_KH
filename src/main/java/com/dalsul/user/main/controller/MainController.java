package com.dalsul.user.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.main.service.MainService;
import com.dalsul.user.main.vo.ProductVO;
import com.dalsul.user.review.service.ReviewService;
import com.dalsul.user.review.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class MainController {
		
	  	private final MainService mainService;

	    @Autowired
	    public MainController(MainService mainService) {
	        this.mainService = mainService;
	    }
	    
	    @Setter(onMethod_ = @Autowired)
	    private ReviewService reviewService;
	    
	    
		/* 시작화면 호출 */
	  	@GetMapping("/")
	    public String main(@SessionAttribute(name="userLogin", required = false) UserVO uvo, Model model) {
	    	
	  		List<ProductVO> products = mainService.getMainPageProducts();
	    	model.addAttribute("products", products);
	    	model.addAttribute("userLogin", uvo);
	    	log.info("메인페이지로 이동");
	    	log.info("상품개수 : "+products.size());
	        
	    	return "main/main"; 
	    }
	  	
	  	/* 검색페이지 이동 */
	    @GetMapping("/search")
	    public String searchPage() {
	          	
	    	return "main/search"; // search.jsp 페이지로 이동
	    }
	    
	    /* 검색페이지에서 필요한 데이터 찾아오기 */
	    @GetMapping(value="/searching", produces=MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public List<ProductVO> searchResult(@RequestParam("keyword") String keyword) {
	        List<ProductVO> result = mainService.getSearchResult(keyword);
	        
	        log.info("result" + result);
	        
	        return result;
	    }
	    
	    /* 전체페이지로 이동 */
	    @GetMapping("/total")
	    public String totalPage(Model model) {
	    	
	    	log.info("전체페이지 호출 성공");
	    	
	    	List<ProductVO> total = mainService.getTotalPageProducts();
	    	model.addAttribute("total", total);
	    	
	    	log.info("상품개수 : "+total.size());
	    	return "main/total";
	    }
	    
	    /* 상세페이지로 이동 */
	    @GetMapping("/detail")
	    public String detailPage(ProductVO vo, Model model) {
	    	
	    	log.info("상세페이지 호출 성공");
	    	
	    	ProductVO detail = mainService.getDetailPageProducts(vo);
	    	
	    	List<ReviewVO> review = reviewService.detailReviewList(vo);	
	    	List<ReviewVO> bestReview = reviewService.detailReviewListBest(vo);
				    	
	    	model.addAttribute("detail", detail);
	    	model.addAttribute("reviewList", review);
	    	model.addAttribute("bestReview", bestReview);
	    	
	    	log.info("review" + review);
	 
	    	return "main/detail"; // detail.jsp 페이지로 이동
	    }

	  
	 

}
