package com.dalsul.user.main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.service.CartService;
import com.dalsul.user.cart.vo.CartVO;
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
		private HttpSession session;
	  	
	    @Autowired
	    public MainController(MainService mainService) {
	        this.mainService = mainService;
	    }
	    
	    @Setter(onMethod_ = @Autowired)
	    private ReviewService reviewService;
	    
	    
		/* 시작화면 호출 */
	  	@GetMapping("/")
	  	@PostMapping("/")
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
	    
	    /* 전체페이지로 이동 
	    @GetMapping("/total")
	    public String totalPage(Model model) {
	    	
	    	log.info("전체페이지 호출 성공");
	    	
	    	List<ProductVO> total = mainService.getTotalPageProducts();
	    	model.addAttribute("total", total);
	    	
	    	log.info("상품개수 : "+total.size());
	    	return "main/total";
	    }*/
	    
	    @GetMapping("/total")
	    public String totalPage(@RequestParam(value = "selectedValue", required = false) String selectedValue, Model model) {
	        if (selectedValue != null && !selectedValue.isEmpty()) {
	            // 사용자가 선택한 값(selectedValue)에 따라 서비스에서 필요한 쿼리를 실행
	            List<ProductVO> total = null;
	            
	            if ("rating".equals(selectedValue)) {
	                // "평점순" 옵션 선택 시 실행할 쿼리
	                total = mainService.getProductsOrderByRating();
	            } else if ("star_count".equals(selectedValue)) {
	                // "리뷰 많은 순" 옵션 선택 시 실행할 쿼리
	                total = mainService.getProductsOrderByReviewCount();
	            } else if ("price_high".equals(selectedValue)) {
	                // "높은 가격순" 옵션 선택 시 실행할 쿼리
	                total = mainService.getProductsOrderByPriceHigh();
	            } else if ("price_low".equals(selectedValue)) {
	                // "낮은 가격순" 옵션 선택 시 실행할 쿼리
	                total = mainService.getProductsOrderByPriceLow();
	            }
	            model.addAttribute("total", total);
	            model.addAttribute("selectedValue",selectedValue);
	            
	            return "/main/total";
	        } else {
	            // 선택된 값이 없을 경우 기본 페이지 표시
	            List<ProductVO> total = mainService.getTotalPageProducts();
	            model.addAttribute("total", total);
	            return "/main/total";
	        }
	    } 
	    /*
	    @GetMapping("/total")
	    public String totalPage(@RequestParam(value = "selectedValue", required = false) String selectedValue, Model model) {
	        if (selectedValue != null && !selectedValue.isEmpty()) {
	            // 사용자가 선택한 값(selectedValue)에 따라 리다이렉션 처리
	        	
	            if ("rating".equals(selectedValue)) {
	                // "평점순" 옵션 선택 시 평점순 페이지로 리다이렉션
	            	
	                return "redirect:/total?orderBy=rating";
	            } else if ("star_count".equals(selectedValue)) {
	                // "리뷰 많은 순" 옵션 선택 시 리뷰 많은 순 페이지로 리다이렉션
	                return "redirect:/total?orderBy=star_count";
	            } else if ("price_high".equals(selectedValue)) {
	                // "높은 가격순" 옵션 선택 시 높은 가격순 페이지로 리다이렉션
	                return "redirect:/total?orderBy=price_high";
	            } else if ("price_low".equals(selectedValue)) {
	                // "낮은 가격순" 옵션 선택 시 낮은 가격순 페이지로 리다이렉션
	                return "redirect:/total?orderBy=price_low";
	            } else {
	                // 선택된 값이 없을 경우 기본 페이지 표시
	                List<ProductVO> total = mainService.getTotalPageProducts();
	                model.addAttribute("total", total);
	                return "main/total";
	            }
	        } else {
	            // 선택된 값이 없을 경우 기본 페이지 표시
	            List<ProductVO> total = mainService.getTotalPageProducts();
	            model.addAttribute("total", total);
	            return "main/total";
	        }
	    } */

	  
	    
	    /* 전체페이지 데이터 분류
	    @GetMapping(value="/filtering", produces=MediaType.APPLICATION_JSON_VALUE) 
	    @ResponseBody
	    public List<ProductVO> filteringProduct(@RequestParam("product") String product) {
	    	List<ProductVO> products = mainService.getTotalResult(product);
	    	
	    	log.info("products" + products);
	    	
	    	return products;	    	
	    } */
	    
	    /* 전체페이지 데이터 정렬 
	    @GetMapping(value="/selecting", produces=MediaType.APPLICATION_JSON_VALUE)
	    @ResponseBody
	    public List<ProductVO> selectingProduct(@RequestParam("selectedValue") String selectedValue) {
	    	List<ProductVO> select = mainService.getSelectResult(selectedValue);
	    	    	
	    	log.info("select" + select);
	    	
	    	return select;
	    	
	    }*/
	    
	    
	    /* 상세페이지로 이동 */
	    @GetMapping("/detail")
	    public String detailPage(ProductVO vo, Model model) {
	    	
	    	log.info("상세페이지 호출 성공");
	    	
	    	ProductVO detail = mainService.getDetailPageProducts(vo);
	    	log.info("제품넘버" + vo.getProduct_no());
	    	
	    	List<ReviewVO> review = reviewService.detailReviewList(vo);	
	    	
	    	List<ReviewVO> bestReview = reviewService.detailReviewListBest(vo);
			model.addAttribute("bestReview", bestReview);
	    	
	    	model.addAttribute("detail", detail);
	    	model.addAttribute("reviewList", review);
	    	
	    	log.info("review" + review);
	 
	    	return "main/detail"; // detail.jsp 페이지로 이동
	    }
	    
	    //로그인 세션 받아오기
	    @GetMapping("/login")
	     public String getSession() {
	 		UserVO uvo = new UserVO();
	 		uvo.setUser_no(3);
	 		uvo.setUser_name("김지연");
	 		//uvo.setUser_no(2);
	 		//uvo.setUser_no(1);
	    	 session.setAttribute("userLogin", uvo);
	    	return "cart/test";
	     }
	 
	    
	 
}
