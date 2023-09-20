package com.dalsul.common.cs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CsListController {
	@GetMapping("/cs/csList")
	public String csList() {
		return "cs/csList";
	}

}
