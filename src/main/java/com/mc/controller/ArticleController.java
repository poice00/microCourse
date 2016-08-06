package com.mc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/article")
public class ArticleController  {
	
	/*文章列表*/
	@RequestMapping
	 public String list(){
		 return "/article/list";
	 }
	 
	 /*文章详情*/
	@RequestMapping("/detail")
	public String view(){
		return "/article/detail";
	}
	
}
