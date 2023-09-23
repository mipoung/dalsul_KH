package com.dalsul.manager.controller;

import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dalsul.common.cs.service.FAQService;
import com.dalsul.common.cs.service.InquiryService;
import com.dalsul.common.cs.service.NoticeService;
//import com.dalsul.common.cs.service.ReplyService;
import com.dalsul.common.cs.vo.FAQVO;
import com.dalsul.common.cs.vo.InquiryVO;
import com.dalsul.common.cs.vo.NoticeVO;
import com.dalsul.common.login.vo.ManagerVO;
//import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.CommonVO;
import com.dalsul.common.vo.PageDTO;

import lombok.Setter;

@Controller

@RequestMapping("/manager/cs/*")
public class CsManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private FAQService faqService;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService noticeService;
	
	@Setter(onMethod_ = @Autowired)
	private InquiryService inquiryService;
	
	//@Setter(onMethod_ = @Autowired)
	//private ReplyService replyService;
	
	
	/*@GetMapping("/setManagerSession") // 임의의 URL로 관리자 세션을 설정
    public String setManagerSession(HttpSession session) {
        // 여기에서 관리자로 로그인한 사용자를 세션에 설정
        ManagerVO managerUser = new ManagerVO();
        managerUser.setManager_no(1); // 관리자 사용자 번호
        managerUser.setManager_name("Manager"); 
        
        session.setAttribute("managerLogin", managerUser); 

        return "redirect:/manager/cs/managerFAQList";
    }*/

	
	
	
	
	/*
	 * FAQ
	 */
	
	
	
	/*FAQ목록 , 페이지네이팅 */
	@GetMapping("/managerFAQList")
	public String managerFAQList(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, CommonVO cvo, FAQVO fvo, Model model) {

		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		List<FAQVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		int total = faqService.faqListCnt(fvo);
		model.addAttribute("pageMaker", new PageDTO(fvo, total));
		
		return "manager/cs/managerFAQList";

	}
	
	//관리자가 사용하는 faq 글쓰기 폼/ 작성하기 폼
	@GetMapping("/managerFAQWriteForm")
	public String managerFAQWriteForm(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, Model model) {
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		return "manager/cs/managerFAQWriteForm";
		
	}
	
	/*관리자가 사용하는 faq 글쓰기*/
	@PostMapping("/managerFAQInsert")
	public String managerFAQInsert(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, FAQVO fvo, Model model) {

	
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		faqService.managerFAQInsert(fvo);
		
		return "redirect:/manager/cs/managerFAQList";
	}
	
	/*faq 글을 눌렀을때 글 상세보기*/
    @GetMapping("/managerFAQDetail")
    public String managerFAQDetail(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, FAQVO fvo, Model model) {
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
        FAQVO detail = faqService.faqDetail(fvo);
        
        model.addAttribute("detail", detail);
        
        return "manager/cs/managerFAQDetail";
        
    }
	
	/*관리자가 사용하는 faq글 수정 폼/ 업데이트 폼*/
	@GetMapping("/managerFAQUpdateForm")
	public String managerFAQUpdateForm(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo,  FAQVO fvo, Model model) {
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		 FAQVO updateData = faqService.managerFAQUpdateForm(fvo);
         model.addAttribute("updateData", updateData);
         return "manager/cs/managerFAQUpdateForm";
		
	}
	
	/*관리자가 사용하는 faq글 수정 / 업데이트*/
    @PostMapping("/managerFAQUpdate")
    public String managerFAQUpdate(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo,  FAQVO fvo, Model model) {
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
    	faqService.managerFAQUpdate(fvo);
    	
    	return "redirect:/manager/cs/managerFAQDetail?faq_no=" + fvo.getFaq_no();
    }
    
    /*관리자가 사용하는 faq글 삭제*/
    @GetMapping(value = "/managerFAQDelete")
    public String managerFAQDelete(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo,  FAQVO fvo, Model model) throws Exception{
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
    	faqService.managerFAQDelete(fvo);
    	
    	return "redirect:/manager/cs/managerFAQList";
    }
    
    
    
    /*
     * Notice(공지사항)
     */
    
    
    
    /*Notice(공지사항)목록 , 페이지네이팅 */
	@GetMapping("/managerNoticeList")
	public String managerNoticeList(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, CommonVO cvo, NoticeVO nvo, Model model) {

		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		int total = noticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "manager/cs/managerNoticeList";

	}
	
	 //관리자가 사용하는 Notice(공지사항) 글쓰기 폼/ 작성하기 폼
	@GetMapping("/managerNoticeWriteForm")
	public String managerNoticeWriteForm(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, Model model) {
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		return "manager/cs/managerNoticeWriteForm";
		
	}
	
	/*관리자가 사용하는 Notice(공지사항) 글쓰기*/
	@PostMapping("/managerNoticeInsert")
	public String managerNoticeInsert(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, NoticeVO nvo, Model model) {

	
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		noticeService.managerNoticeInsert(nvo);
		
		return "redirect:/manager/cs/managerNoticeList";
	}
	
	/*관리자가 공지사항 글을 눌렀을때 글 상세보기*/
	@GetMapping("/managerNoticeDetail")
	public String noticeDetail(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, NoticeVO nvo, Model model) {
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		
		model.addAttribute("detail", detail);
		
		return "manager/cs/managerNoticeDetail";
	}
	
	/*관리자가 사용하는 Notice(공지사항) 글 수정 폼/ 업데이트 폼*/
	@GetMapping("/managerNoticeUpdateForm")
	public String managerNoticeUpdateForm(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, NoticeVO nvo, Model model) {
		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
		NoticeVO updateData = noticeService.managerNoticeUpdateForm(nvo);
         model.addAttribute("updateData", updateData);
         return "manager/cs/managerNoticeUpdateForm";
		
	}
	
	/*관리자가 사용하는 Notice(공지사항) 글 수정 / 업데이트*/
    @PostMapping("/managerNoticeUpdate")
    public String managerNoticeUpdate(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo,  NoticeVO nvo, Model model) {
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
    	noticeService.managerNoticeUpdate(nvo);
    	
    	return "redirect:/manager/cs/managerNoticeDetail?notice_no=" + nvo.getNotice_no();
    }
    
    /*관리자가 사용하는 Notice(공지사항) 글 삭제*/
    @GetMapping(value = "/managerNoticeDelete")
    public String managerNoticeDelete(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo,  NoticeVO nvo, Model model) throws Exception{
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
    	noticeService.managerNoticeDelete(nvo);
    	
    	return "redirect:/manager/cs/managerNoticeList";
    }

	
	
	/*
	 * Inquiry(문의사항)
	 */
	
    
    
	/*Inquiry(문의사항) 목록 , 페이지네이팅 */
	@GetMapping("/managerInquiryList")
	public String managerinquiryList(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, CommonVO cvo, InquiryVO ivo, Model model) {

		if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common/error";
		}
		List<InquiryVO> inquiryList = inquiryService.inquiryList(ivo);
		model.addAttribute("inquiryList", inquiryList);
		
		int total = inquiryService.inquiryListCnt(ivo);
		model.addAttribute("pageMaker", new PageDTO(ivo, total));
		
		return "manager/cs/managerInquiryList";

	}
	
	/*faq 글을 눌렀을때 글 상세보기*/
    @GetMapping("/managerInquiryDetail")
    public String managerInquiryDetail(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, InquiryVO ivo, Model model) {
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
        InquiryVO detail = inquiryService.inquiryDetail(ivo);
        
        model.addAttribute("detail", detail);
        
        return "manager/cs/managerInquiryDetail";
        
    }
	
	/*관리자가 사용하는 Inquiry(문의사항)글 삭제*/
    @GetMapping(value = "/managerInquiryDelete")
    public String managerInquiryDelete(@SessionAttribute(name = "managerLogin", required = false) ManagerVO mvo, InquiryVO ivo, Model model, RedirectAttributes ras) throws Exception{
    	if (mvo == null || !(mvo.getManager_no() == 1)) {
			model.addAttribute("msg", "관리자가 아닙니다.");
			return "common.error";
		}
    	inquiryService.inquiryDelete(ivo);
    	ras.addFlashAttribute("InquiryVO", ivo);
    	
    	return "redirect:/manager/cs/managerInquiryList";
    }
    
    
    
}
