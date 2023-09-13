package com.dalsul.common.cs.controller;

import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dalsul.common.cs.service.InquiryService;
import com.dalsul.common.cs.vo.InquiryVO;
import com.dalsul.common.vo.PageDTO;

import lombok.Setter;

@Controller

@RequestMapping("/inquiry/*")
public class InquiryController {

	@Setter(onMethod_ = @Autowired)
	private InquiryService inquiryService; 

	/*@GetMapping("setInquiryAdminSession") // 실험용 세션부여
	public String setAdminSession(HttpSession session) {
		session.setAttribute("isAdmin", true);
		return "redirect:/inquiry/inquiryList";
	}*/


	// inquiry 목록, 페이지네이팅

	@GetMapping("/inquiryList")
	public String InquiryList(@ModelAttribute InquiryVO ivo, Model model) {
		List<InquiryVO> inquiryList = inquiryService.inquiryList(ivo);
		model.addAttribute("inquiryList", inquiryList);

		int total = inquiryService.inquiryListCnt(ivo);
		model.addAttribute("pageMaker", new PageDTO(ivo, total));

		return "cs/inquiry/inquiryList";
	}
	//글쓰기 , 작성하기 폼
	@GetMapping("/inquiryWriteForm")
	public String inquiryWriteForm() {
		return "cs/inquiry/writeForm";
	}
	//글쓰기, 작성하기
	@PostMapping("/inquiryInsert")
	public String inquiryInsert(/*@SessionAttribute("userLogin") UserRegInfo rvo,*/InquiryVO ivo, Model model) throws Exception{
		
		int result = 0;
		String url = "";
		
		result = inquiryService.inquiryInsert(ivo);
		if(result == 1) {
			url = "redirect:/inquiry/inquiryList";
		} else {
			url = "redirect:/inquiry/inquiryWriteForm";
		}
		return "redirect" + url;
	}
	
	//글 클릭하였을때 상세보기
	@GetMapping("/inquiryDetail")
	public String inquiryDetail(InquiryVO ivo, Model model) {
		InquiryVO detail = inquiryService.inquiryDetail(ivo);
		
		model.addAttribute("detail", detail);
		
		return "cs/inquiry/inquiryDetail";
	}
	
	//글에대한 비밀번호
	@ResponseBody
	@PostMapping(value = "/pwdConfirm", produces = "text/plain; charset=UTF-8")
	public String pwdConfirm(InquiryVO ivo) {
		String value = "";
		
		int result = inquiryService.pwdConfirm(ivo);
		if(result == 1) {
			value = "성공!"; //추후수정
		} else {
			value = "실패!"; //추후수정
		}
		return value;
		
	}
	
	//글 수정 폼
	@GetMapping("/inquiryUpdateForm")
	public String inquiryUpdateForm(@ModelAttribute InquiryVO ivo, Model model) {
		
		InquiryVO updateData = inquiryService.inquiryUpdateForm(ivo);
		
		model.addAttribute("updateData", updateData);
		
		return "cs/inquiry/inquiryUpdateForm";
	}
	
	//글 수정
	@PostMapping("/inquiryUpdate")
	public String inquiryupdate(@ModelAttribute InquiryVO ivo) {
		int result = 0;
		String url = "";
		
		result = inquiryService.inquiryUpdate(ivo);
		
		if(result == 1) {
			url = "redirect:/inquiry/inquiryDetail?inquiry_no=" + ivo.getInquiry_no();
		} else {
			url = "redirect:/inquiry/inquiryUpdateForm?inquiry_no=" + ivo.getInquiry_no();
		}
		return "redirect:" + url;
	}
	@PostMapping("/inquiryDelete")
	public String inquiryDelete(@ModelAttribute InquiryVO ivo, RedirectAttributes ras) throws Exception{
		int result = 0;
		String url = "";
		
		result = inquiryService.inquiryDelete(ivo);
		ras.addFlashAttribute("InquiryVO", ivo);
		
		if(result == 1) {
			url = "redirect:/inquiry/inquiryList";
		} else {
			url = "redirect:/inquiry/inquiryDetail?inquiry_no=" + ivo.getInquiry_no();
		}
		return "redirect:" + url;
	}
	

}
