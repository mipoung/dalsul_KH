package com.dalsul.user.cart.controller;

import java.util.ArrayList;
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

import com.dalsul.user.cart.service.CartService;
import com.dalsul.user.cart.vo.CartVO;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Setter;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
     List<Product> cart = new ArrayList<>();
     
		/*
		 * @GetMapping("/") public String index() { return "/cart"; }
		 */
 	
    //장바구니 페이지 조회
    @GetMapping("/")
    public String cartPage(Model model) {
        List<CartVO>cartList = cartService.cartList();
    	model.addAttribute("cartList", cartList);
        
        return "cart";
    }
    
    //장바구니 추가
    @GetMapping("/cartInsert")
    public void cartInsert(CartVO cvo)throws Exception {
    	cartService.cartInsert(cvo);
     
    }
    
    
    //장바구니 개수 추가(+)
    @ResponseBody
    @GetMapping("/cartPlus")
    public int cartPlus(CartVO cvo) {
    	int result = cartService.cartPlus(cvo);
    	return result;
    }
    
    //장바구니 개수 빼기(-)
    @ResponseBody
    @GetMapping("/cartMinus")
    public int cartMinus(CartVO cvo) {
    	int result = cartService.cartMinus(cvo);
    	System.out.println(result);
    	return result;
    }
    
    
    //장바구니 삭제
    @ResponseBody
    @GetMapping("/cartDelete")
    public String cartDelete(@ModelAttribute CartVO cvo) throws Exception{
    	cartService.cartDelete(cvo);
    
    return "redirect:/cart";
}

/*    //결제 주문 화면
    @PostMapping("/orderList")
    public String orderList(Model model, @RequestBody List<CartVO> orderData) {
        model.addAttribute("orderData", orderData);
        return "cart/orderList";
    }
*/
  //결제 주문 화면
    @GetMapping("/orderList")
    public String orderList(Model model,CartVO cvo) {
    	 List<CartVO>cartList = cartService.cartList();
     	model.addAttribute("cartList", cartList);
         
        return "cart/orderList";
    }
}
