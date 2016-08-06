package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/activity")
public class ActivityController  {
	
	/*活动列表*/
	@RequestMapping
	 public String list(){
		 return "/activity/list";
	 }
	 
	 /*活动详情*/
	@RequestMapping("/detail")
	public String view(){
		return "/activity/detail";
	}
	
}
