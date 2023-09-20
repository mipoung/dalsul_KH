package com.dalsul.user.coupon_recive.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.user.coupon_recive.service.Coupon_reciveService;
import com.dalsul.user.coupon_recive.vo.Coupon_reciveVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/Coupon_recive/")
@Slf4j
public class Coupon_reciveController {
	
	@Setter(onMethod_ = @Autowired)
	private Coupon_reciveService coupon_reciveService;
	
	/*검색기능과 페이징 처리가 된 쿠폰발급 리스트 조회*/
	@GetMapping("/couponList")
	public String couponList(@ModelAttribute @SessionAttribute(name = "userLogin") Coupon_reciveVO cvo, Model model) {
		log.info("couponList() 호출");
		System.out.println(cvo.toString());
		
		//전체레코드에 세션에서 받은 user_no값을 설정해 쿼리문으로전달, 특정유저의 발급받은 쿠폰만 조회
		List<Coupon_reciveVO> list = coupon_reciveService.couponList(cvo);
		model.addAttribute("list",list);
		
		//전체 레코드수 반환
		int total  = coupon_reciveService.couponListCnt(cvo);
		//페이징 처리
		model.addAttribute("pageMaker", new PageDTO(cvo, total));
		//new PageDTO(CommonVO 또는 CommonVO 하위 클래스의 인스턴스 (Coupon_reciveVO), 총 레코드수)
		
		return "mypage/userCouponInfo"; //  WEB-INF/views/mypage/userAddrInfo.jsp;
		
	}
}
