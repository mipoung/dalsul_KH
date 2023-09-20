package com.dalsul.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.dalsul.common.login.vo.ManagerVO;
import com.dalsul.common.login.vo.UserVO;
import com.dalsul.common.vo.PageDTO;
import com.dalsul.manager.service.ManagerService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/user/*")
public class UserManagerController {
	
	@Setter(onMethod_ = @Autowired)
	private ManagerService managerService;
	
	// 회원 정보 조회
	@GetMapping("/userManagement")
	public String userManagement(@SessionAttribute(name="managerLogin", required = false) ManagerVO mvo, @ModelAttribute UserVO uvo, Model model) {
		if(mvo==null) {
			return "account/login/managerLoginForm";
		}
		
		List<UserVO> userList = managerService.getUserList(uvo);
		model.addAttribute("user", userList);
		
		// 전체 레코드 수 반환
		int total = managerService.userListCnt(uvo);
		System.out.println(total);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(uvo, total));
		
		return "/manager/user/userManagement";
	}
	
	@ResponseBody
	@PostMapping("/dropUsers")
	public String dropUsers(@RequestParam("selectedItems") List<Integer> user_no) {
		String result = "FAIL";
		
		int success = managerService.dropUsers(user_no);
		
		if(success >= 1) { result = "SUCCESS"; }
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/appointManager")
	public String appointManager(@RequestParam("selectedItems") List<Integer> user_no) {
		String result = "FAIL";
		
		int success = managerService.appointManager(user_no);
		
		if(success >= 1) { result = "SUCCESS"; }
		
		return result;
	}
}
