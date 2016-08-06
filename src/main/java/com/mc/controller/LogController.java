package com.mc.controller;

import java.io.File;
import java.io.IOException;
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
import com.mc.domain.Role;
import com.mc.domain.User;
import com.mc.service.LogService;
import com.mc.service.RoleService;
import com.mc.util.QueryHelper;

@Controller
@RequestMapping("/admin/log")
public class LogController  {
	
	@Resource
	private LogService logService;
	
	// =========分页用的参数=============
	protected int currentPage = 1;
	protected int pageSize = 20;
	
	
	/** 列表 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/list")
	@SystemControllerLog(description = "日志列表") 
	public String list(Model model,HttpServletRequest httpRequest,String loginName) throws Exception {
		System.out.println("=================== " + loginName);
		List<Log> logList = logService.findAll();
		model.addAttribute("logList", logList);
		model.addAttribute("loginName", loginName);
		QueryHelper qh = null ;
		if(loginName==null||loginName.equals("")){
		qh =  new QueryHelper(Log.class, "l")
				.addOrderProperty("l.createDate", false);
		}else{
			qh =  new QueryHelper(Log.class, "l")
					.addCondition("l.createBy.loginName=?", loginName)
					.addOrderProperty("l.createDate", false);
		}
		String currentPage = httpRequest.getParameter("currentPage");
		System.out.println("*************"+currentPage+"********************");
		PageBean pageBean = null;
		if(currentPage==null){
			pageBean = logService.getPageBean(1, pageSize, qh);
		}else{
			int page = Integer.parseInt(currentPage);
			pageBean = logService.getPageBean(page, pageSize, qh);
		}
		model.addAttribute("pageBean", pageBean);
		return "/log/list";
	}

	/** 删除 */
	@RequestMapping(value = "/delete")
	@SystemControllerLog(description = "日志删除") 
	public String delete(Long id) throws Exception {
		logService.delete(id);
		return "redirect:list";
	}

	
	
	
}
