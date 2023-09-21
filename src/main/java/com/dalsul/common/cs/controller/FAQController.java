package com.dalsul.common.cs.controller;

import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.dalsul.common.cs.service.FAQService;
import com.dalsul.common.cs.vo.FAQVO;
import com.dalsul.common.vo.PageDTO;

import lombok.Setter;


@Controller
@RequestMapping("/faq/*")
public class FAQController {
    
    @Setter(onMethod_ = @Autowired)
    private FAQService faqService;
    
    /*실험용 세션부여*/
    /*@GetMapping("/setFAQmanagerSession")
    public String setmanagerSession(HttpSession session) {
        // 세션에 ismanager 속성을 true로 설정
        session.setAttribute("ismanager", true);
        return "redirect:/faq/FAQList"; // FAQ 목록 페이지로 리다이렉트
    }*/
    
    /*FAQ목록 , 페이지네이팅 */
    @GetMapping("/FAQList")
    public String FAQList(@ModelAttribute FAQVO fvo, Model model) {

        List<FAQVO> faqList = faqService.faqList(fvo);
        model.addAttribute("faqList", faqList);

        int total = faqService.faqListCnt(fvo);
        model.addAttribute("pageMaker", new PageDTO(fvo, total));

        return "cs/faq/FAQList";
    }
 

    //관리자가 사용하는 faq 글쓰기 폼/ 작성하기 폼 
    /*@GetMapping(value="/managerFAQWriteForm")
    public String managerFAQWriteForm(HttpSession session) {
    	// 관리자 권한 확인
        Boolean ismanager = (Boolean) session.getAttribute("ismanager");
        if (ismanager != null && ismanager) {
            return "cs/faq/managerFAQWriteForm";
        } else {
            // 관리자가 아닌 경우
            return "redirect:/faq/FAQList";
        }
    }*/
    
    /*관리자가 사용하는 faq 글쓰기*/
    /*@PostMapping("/managerFAQInsert")
    public String managerFAQInsert(FAQVO fvo, Model model, HttpSession session) throws Exception {
        int result = 0;
        String url = "";
    
        // 세션에서 ismanager 속성을 가져옴
        Boolean ismanager = (Boolean) session.getAttribute("ismanager");
    
        // 관리자 권한 확인
        if (ismanager != null && ismanager) {
            result = faqService.managerFAQInsert(fvo);
            if (result == 1) {
                url = "redirect:/faq/FAQList";
            } else {
            	url = "redirect:/faq/managerFAQWriteForm";
            }
        } else {
            // 관리자가 아닌 경우에 대한 처리
            url = "redirect:/faq/FAQList"; // 혹은 다른 적절한 URL로 리다이렉트
        }
    
        return  url;
    }*/
    
    /*faq 글을 눌렀을때 글 상세보기*/
    @GetMapping("/FAQDetail")
    public String FAQDetail(@ModelAttribute FAQVO fvo, Model model) {
        FAQVO detail = faqService.faqDetail(fvo);
        
        model.addAttribute("detail", detail);
        
        return "cs/faq/FAQDetail";
        
    }
    
    /*관리자가 사용하는 faq글 수정 폼/ 업데이트 폼*/
    /*@GetMapping(value="/managerFAQUpdateForm")
    public String managerFAQUpdateForm(@ModelAttribute FAQVO fvo, Model model, HttpSession session) {

    
        // 세션에서 ismanager 속성을 가져옴
        Boolean ismanager = (Boolean) session.getAttribute("ismanager");
    
        // 관리자 권한 확인
        if (ismanager != null && ismanager) {
            FAQVO updateData = faqService.managerFAQUpdateForm(fvo);
            model.addAttribute("updateData", updateData);
            return "cs/faq/managerFAQUpdateForm";
        } else {
            // 관리자가 아닌 경우에 대한 처리
          
            return "redirect:/faq/FAQList";
        }
    }*/
    
    /*관리자가 사용하는 글 수정 / 업데이트*/
    /*@PostMapping("/managerFAQUpdate")
    public String managerFAQUpdate(@ModelAttribute FAQVO fvo, HttpSession session) {
        
        // 세션에서 ismanager 속성을 가져옴
        Boolean ismanager = (Boolean) session.getAttribute("ismanager");
    
        // 관리자 권한 확인
        if (ismanager != null && ismanager) {
            int result = faqService.managerFAQUpdate(fvo);
            if (result == 1) {
                return "redirect:/faq/FAQDetail?faq_no=" + fvo.getFaq_no();
            } else {
                return "redirect:/faq/managerFAQUpdateForm?faq_no=" + fvo.getFaq_no();
            }
        } else {
            // 관리자가 아닌 경우에 대한 처리
            return "redirect:/faq/FAQList"; 
        }
    }*/
    
    /*관리자가 사용하는 글 삭제*/
    /*@GetMapping(value = "/managerFAQDelete")
    public String managerFAQDelete(@ModelAttribute FAQVO fvo, HttpSession session) throws Exception {

    
        Boolean ismanager = (Boolean) session.getAttribute("ismanager");
    
        if (ismanager != null && ismanager) {
            int result = faqService.managerFAQDelete(fvo);
            if (result == 1) {
                return "redirect:/faq/FAQList";
            } else {
                return "redirect:/faq/FAQDetail?faq_no=" + fvo.getFaq_no();
            }
        }
    
        // 관리자가 아닌 경우에도 FAQ 목록 페이지로 리다이렉트
        return "redirect:/faq/FAQList";
    }*/
}
