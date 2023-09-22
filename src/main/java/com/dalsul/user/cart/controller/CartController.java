package com.dalsul.user.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.user.cart.service.CartService;
import com.dalsul.user.cart.vo.CartVO;

import lombok.Setter;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Setter(onMethod_ = @Autowired)
	private CartService cartService;
	
	@Autowired
	private HttpSession session;
	
     List<Product> cart = new ArrayList<>();
     
	
		 
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
     
    //장바구니 페이지 조회
    @GetMapping("cartList")
    public String cartPage(@SessionAttribute(value = "userLogin", required = false) UserVO uvo ,Model model) {
        // required = 세션값이 필수인지 물어보는 속성. 기본값 :true -> 세션이 없으면 error
    	// 로그인을 하지 않았을 경우
    	if(uvo==null) {
    		return "login/userLoginView";
    	}
    	//System.out.println(uvo.toString());
    	
    	List<CartVO>cartList = cartService.cartList(uvo);
    	model.addAttribute("cartList", cartList);
        
        return "cart/cart";
    }
    
    
    //장바구니 추가
    @GetMapping("/cartInsert")
    public void cartInsert(CartVO cvo)throws Exception {
    	cartService.cartInsert(cvo);
     
    }
    
    
    //장바구니 개수 추가(+)
    @ResponseBody
    @GetMapping("/cartPlus")
    public int cartPlus(@SessionAttribute(value = "userLogin", required = false) UserVO uvo, CartVO cvo) {
    	System.out.println(uvo.getUser_no());
    	cvo.setCart_id(uvo.getUser_no());
    	int result = cartService.cartPlus(cvo);
    	return result;
    }
    
    //장바구니 개수 빼기(-)
    @ResponseBody
    @GetMapping("/cartMinus")
    public int cartMinus(@SessionAttribute(value = "userLogin", required = false) UserVO uvo,CartVO cvo) {
    	System.out.println(uvo.getUser_no());
    	cvo.setCart_id(uvo.getUser_no());
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


    
    @GetMapping("/orderList")
    public String orderList(@SessionAttribute(value = "userLogin", required = false) UserVO uvo ,Model model) {
    	if(uvo==null) {
    		return "login/userLoginView";
    	}
    	// System.out.println(uvo.toString());
    	
    	UserVO userInfo = cartService.getUserInfo(uvo);
    	System.out.println(userInfo.toString());
    	
    	List<CartVO>cartList = cartService.cartList(uvo);
    	model.addAttribute("cartList", cartList);
    	model.addAttribute("userInfo", userInfo);
        
        return "cart/orderList";
    }
    }

