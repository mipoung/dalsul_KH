package com.dalsul.common.cs.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dalsul.common.cs.service.ReplyService;
import com.dalsul.common.cs.vo.ReplyVO;

import lombok.Setter;

@RestController
@RequestMapping("/replies/*")

public class ReplyController {
	@Setter(onMethod_ = @Autowired)
	private ReplyService replyService;
	
	/*실험용 세션부여*/
	@GetMapping("setRepliesAdminSession")
	public String setAdminSession(HttpSession session) {
		session.setAttribute("isAdmin", true);
		return "redirect:/inquiry/inquiryList";
	}
	
	@GetMapping(value = "/all/{inquiry_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("inquiry_no") Integer inquiry_no, ReplyVO rvo){
		
	}

}
