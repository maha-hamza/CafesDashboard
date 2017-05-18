package com.websystique.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class IndexController {


//	@RequestMapping(value = "login", method = RequestMethod.GET)
//	public String getIndexPage() {
//		System.out.println("me me me");
//		return "login";
//	}

	@RequestMapping(method = RequestMethod.GET)
	public String getIndex() {
		return "index";
	}

	

}