package com.dalsul.common.cs.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.dalsul.common.cs.service.NoticeService;
import com.dalsul.common.cs.vo.NoticeVO;
import com.dalsul.common.vo.PageDTO;

import lombok.Setter;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeService noticeService;
	/*실험용 세션부여*/
	@GetMapping("setNoticeAdminSession")
	public String setAdminSession(HttpSession session) {
		session.setAttribute("isAdmin", true);
		return "redirect:/notice/noticeList";
	}
	
	/*inquiry 목록, 페이지네이팅*/
	@GetMapping("/noticeList")
	public String noticeList(@ModelAttribute NoticeVO nvo, Model model) {
		List<NoticeVO> inquiryList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", inquiryList);
		
		int total = noticeService.noticeListCnt(nvo);
		model.addAttribute("pageMaker", new PageDTO(nvo, total));
		
		return "cs/notice/noticeList";
	}
	
	/*관리자가 사용하는 공지사항 글쓰기 폼/ 작성하기 폼*/
	@GetMapping(value="/adminNoticeWriteForm")
	public String adminNoticeWriteForm(HttpSession session) {
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		if(isAdmin != null && isAdmin) {
			return "cs/notice/adminNoticeWriteForm";
		} else {
			return "redirect:/notice/noticeList"; //관리자가 아닐경우
		}
	}
	
	/*관리자가 사용하는 공지사항 글쓰기*/
	@PostMapping("/adminNoticeInsert")
	public String adminNoticeInsert(NoticeVO nvo, Model model, HttpSession session) throws Exception{
		int result = 0;
		String url = "";
		// 관리자 권한 확인
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		if(isAdmin != null && isAdmin) {
			result = noticeService.adminNoticeInsert(nvo);
			if(result == 1) {
				url = "redirect:/notice/noticeList";
			} else {
				url = "redirect:/notice/adminNoticeWriteForm";
			}
		} else {
			url = "redirect:/notice/noticeList"; //관리자가 아닐경우 리스트로 돌려보냄
		}
		return url;
	}
	/*공지사항 글을 눌렀을때 글 상세보기*/
	@GetMapping("/noticeDetail")
	public String noticeDetail(@ModelAttribute NoticeVO nvo, Model model) {
		NoticeVO detail = noticeService.noticeDetail(nvo);
		
		model.addAttribute("detail", detail);
		
		return "cs/notice/noticeDetail";
	}
	/*관리자가 사용하는 공지사항 글 수정 폼 / 업데이트 폼*/
	@GetMapping(value="/adminNoticeUpdateForm")
	public String adminNoticeUpdateForm(@ModelAttribute NoticeVO nvo, Model model, HttpSession session) {
		
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		
		if(isAdmin != null && isAdmin) {
			NoticeVO updateData = noticeService.adminNoticeUpdateForm(nvo);
			model.addAttribute("updateData", updateData);
			return "cs/notice/adminNoticeUpdateForm";
		} else {
			return "redirect:/notice/noticeList";
		}
	}
	@PostMapping("/adminNoticeUpdate")
	public String adminNoticeUpdate(@ModelAttribute NoticeVO nvo, HttpSession session) {
		
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		
		if(isAdmin != null && isAdmin) {
			int result = noticeService.adminNoticeUpdate(nvo);
			if(result == 1) {
				return "redirect:/notice/noticeDetail?notice_no=" + nvo.getNotice_no();
			} else {
				return "redirect:/notice/adminNoticeUpdateForm?notice_no=" + nvo.getNotice_no();
			}
		} else {
			return "redirect:/notice/noticeList";
		}
	}
	@GetMapping(value = "/adminNoticeDelete")
	public String adminNoticeDelete(@ModelAttribute NoticeVO nvo, HttpSession session) throws Exception{
		
		Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
		
		if(isAdmin != null && isAdmin) {
			int result = noticeService.adminNoticeDelete(nvo);
			if(result == 1) {
				return "redirect:/notice/noticeList";
			} else {
				return "redirect:/noticeDetail?notice_no=" + nvo.getNotice_no();
			}
		}
		return "redirect:/notice/noticeList";
	}

}