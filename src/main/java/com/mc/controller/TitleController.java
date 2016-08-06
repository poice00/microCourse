package com.mc.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mc.annotation.SystemControllerLog;
import com.mc.domain.Log;
import com.mc.domain.PageBean;
import com.mc.domain.Privilege;
import com.mc.domain.Role;
import com.mc.domain.Title;
import com.mc.domain.User;
import com.mc.service.LogService;
import com.mc.service.RoleService;
import com.mc.service.TitleService;
import com.mc.util.QueryHelper;

@Controller
@RequestMapping("/admin/title")
public class TitleController  {
	
	@Resource
	private TitleService titleService;
	
	

	/** 列表 */
	@SystemControllerLog(description = "职位列表") 
	@RequestMapping("/list")
	public String list(Model model) throws Exception {
		List<Title> titleList = titleService.findAll();
		model.addAttribute("titleList", titleList);
		return "/title/list";
	}

	/** 删除 */
	@SystemControllerLog(description = "职位删除") 
	@RequestMapping(value = "/delete")
	public String delete(Long id) throws Exception {
		System.out.println("=================" + id);
		titleService.delete(id);
		return "redirect:list";
	}

	/** 添加页面 */
	@RequestMapping("/addUI")
	public String addUI(Model model) throws Exception {
		return "/title/addUI";
	}

	/** 添加 */
	@SystemControllerLog(description = "职位添加") 
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Title title) throws Exception {
		this.titleService.save(title);
		return "redirect:list";	
	}

	/** 修改页面 */
	@RequestMapping("/editUI")
	public String editUI(Model model,Long id) throws Exception {
		Title title = titleService.getById(id);
		model.addAttribute("title", title);
		return "/title/editUI";
	}

	/** 修改 */
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "职位修改")  
	@RequestMapping(value = "/edit")
	public String edit(Long id,Title title) throws Exception {
		Title t = titleService.getById(id);
		
		t.setName(title.getName());
		t.setDescription(title.getDescription());
		
		
		titleService.update(t);
		return "redirect:list";
	}

	
	
	
}
