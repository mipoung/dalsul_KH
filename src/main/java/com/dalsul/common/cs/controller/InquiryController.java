/*
 * package com.dalsul.common.cs.controller;
 * 
 * import java.util.List;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.RequestMapping;
 * 
 * import com.dalsul.common.cs.service.InquiryService; import
 * com.dalsul.common.cs.vo.InquiryVO; import com.dalsul.common.vo.PageDTO;
 * 
 * import lombok.Setter;
 * 
 * @Controller
 * 
 * @RequestMapping("/inquiry/*") public class InquiryController {
 * 
 * @Setter(onMethod_ = @Autowired) private InquiryService inquiryService; 실험용
 * 세션부여
 * 
 * @GetMapping("setInquiryAdminSession") public String
 * setAdminSession(HttpSession session) { session.setAttribute("isAdmin", true);
 * return "redirect:/inquiry/InquiryList"; }
 * 
 * inquiry 목록, 페이지네이팅
 * 
 * @GetMapping("/InquiryList") public String InquiryList(@ModelAttribute
 * InquiryVO ivo, Model model) { List<InquiryVO> inquiryList =
 * inquiryService.inquiryList(ivo); model.addAttribute("inquiryList",
 * inquiryList);
 * 
 * int total = inquiryService.inquiryListCnt(ivo);
 * model.addAttribute("pageMaker", new PageDTO(ivo, total));
 * 
 * return "cs/inquiry/inquiryList"; }
 * 
 * 
 * 
 * }
 */