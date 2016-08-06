package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/opus")
public class OpusController  {
	
	/*问答列表*/
	@RequestMapping
	 public String list(){
		 return "/opus/list";
	 }
	 
	 /*问答详情*/
	@RequestMapping("/detail")
	public String view(){
		return "/opus/detail";
	}
	
}
