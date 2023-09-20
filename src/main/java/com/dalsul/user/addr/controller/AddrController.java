package com.dalsul.user.addr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dalsul.user.addr.service.AddrService;
import com.dalsul.user.addr.vo.AddrVO;
//import com.dalsul.users.vo.UsersVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/addr/*")
@Slf4j
public class AddrController {
    
    @Setter(onMethod_ = @Autowired)
    private AddrService addrService;
    
    //임시로 테스트하는 main 레이아웃을 가는 매핑
    @GetMapping("/addrView")
    public String mainLayout() {
    	return "/addr/addrTest";
    }
    
    
    
    /* 기본 배송지 테이블에 새로운 배송지 추가 메소드 컨트롤러 */
    @ResponseBody
    @PostMapping(value = "/insertAddr", produces = "text/plain; charset=UTF-8")
    public String insertAddr(AddrVO bvo ) {
        log.info("insertAddr () 메소드 호출...");
        log.info(bvo.toString());
        
        log.info("chkUserAddr 메소드 호출..");
        
        //사용자가 이미 입력한 배송지가 5개일경우 를 찾는 메소드
        String chkUserAddrCount = addrService.chkUserAddr(bvo);
        
        log.info("chkUserAddrCount = " + chkUserAddrCount);
        
        if (chkUserAddrCount.equals("true")) {
        	return "배송지는 최대 5개까지 입력할 수 있습니다.";
        }// 5개 이하일경우 insert 실행 
        else {
        	int result = addrService.insertAddr(bvo );
        
        	if(result == 1) {
        		return "추가성공";
        	} else {
        		return "정상적인 입력값이 아닙니다";
        	}
        }
    }
    
    /*내가 추가한 기본배송지 정보 전체 조회하는 매핑*/
    /*
   @GetMapping(value = "/selectAddr")
   public String selectAddr(AddrVO bvo, Model model) {
	   log.info("selectAddr() 매소드 호출...");
	   log.info(bvo.toString());
	   
	   AddrVO result = addrService.userAddrInfo(bvo);
	   model.addAttribute("addr", result);
	  
	   
	   return "/addr/addrInfoView";
   }
   */
   
   /*내가 추가한 기본배송지 정보 조회하고 그 배송지의 정보를 업데이트하는 매핑*/
   /*
    @GetMapping(value = "/updateAddrForm")
   public String updateAddrForm(AddrVO bvo, Model model) {
	   log.info("updateAddrForm() 매소드 호출...");
	   log.info("selectAddr() 매소드 호출...");
	   log.info(bvo.toString());
	   
	   AddrVO result = addrService.userAddrInfo(bvo);
	   model.addAttribute("addr", result);
	  
	   
	   return "/addr/addrUpdateView";
   }
   */
   
   /* 기본 배송지 테이블에 새로운 배송지 정보 업데이트 메소드 컨트롤러 */
   @ResponseBody
   @PostMapping(value = "/updateAddr", produces = "text/plain; charset=UTF-8")
   public String updateAddr(AddrVO bvo) {
       log.info("updateAddr () 메소드 호출...");
       log.info(bvo.toString());
       
       int result = addrService.updateAddr(bvo);
       
       if(result == 1) {
       	return "수정성공";
       } else {
       	return "수정실패";
       }
   }
   
   /* 기본 배송지 테이블에 입력받은 배송지입력번호를 기준으로 삭제하는 삭제 메소드 컨트롤러 */
   @ResponseBody
   @PostMapping(value = "/deleteAddr", produces = "text/plain; charset=UTF-8")
   public String deleteAddr(AddrVO bvo) {
	   log.info("deleteAddr () 메소드 호출...");
       log.info(bvo.toString());
       
       int result = addrService.deleteAddr(bvo);
       
       if(result == 1) {
       	return "삭제성공";
       } else {
       	return "삭제실패";
       }
   }
   
}
