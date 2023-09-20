package com.dalsul.common.cs.controller;


import java.util.List;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	/*@GetMapping("setRepliesAdminSession")
	public String setAdminSession(HttpSession session) {
		session.setAttribute("isAdmin", true);
		return "redirect:/inquiry/inquiryList";
	}*/
	
	
	/*댓글 글목록*/
	@GetMapping(value = "/all/{inquiry_no}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("inquiry_no") Integer inquiry_no, ReplyVO rvo){
		List<ReplyVO> entity = null;
		entity = replyService.replyList(rvo);
		
		return entity;
	}
	
	/*댓글 글쓰기*/
	@PostMapping(value = "/replyInsert", consumes = "application/json",  produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyInsert(@RequestBody ReplyVO rvo) {
		int result = 0;
		
		result = replyService.replyInsert(rvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
		
	}
	
	/*댓글 수정*/
	@PutMapping(value = "/{reply_no}", consumes = "application/json",  produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyUpdate(@PathVariable("reply_no") int reply_no, @RequestBody ReplyVO rvo) {
		rvo.setReply_no(reply_no);
		int result = replyService.replyUpdate(rvo);
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}
	
	/*댓글 삭제*/
	@DeleteMapping(value = "/{reply_no}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String replyDelete(@PathVariable("reply_no") int reply_no) {
		int result = replyService.replyDelete(reply_no);
		
		return (result == 1) ? "SUCCESS" : "FAILURE";
	}

}
