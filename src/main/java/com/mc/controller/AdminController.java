package com.mc.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mc.annotation.SystemControllerLog;
import com.mc.domain.Course;
import com.mc.domain.Lecture;
import com.mc.domain.Log;
import com.mc.domain.PageBean;
import com.mc.domain.Privilege;
import com.mc.domain.Role;
import com.mc.domain.User;
import com.mc.service.CourseService;
import com.mc.service.LectureService;
import com.mc.service.RoleService;
import com.mc.service.UserService;
import com.mc.util.QueryHelper;
import com.mc.util.SpringContextHolder;

@SuppressWarnings("unchecked")
@Controller
@RequestMapping("/admin")
public class AdminController  {

	
	@Resource
	private UserService userService;
	
	@Resource
	private RoleService roleService;
	
	@Resource
	private CourseService courseService;
	
	@Resource
	private LectureService lectureService;
	
	// =========分页用的参数=============
		protected int currentPage = 1;
		protected int pageSize = 20;
	
	//============================课程管理================================
	/** 课程列表 */
	@RequestMapping("/course/list")
	@SystemControllerLog(description = "课程列表")
	public String courseList(Model model,HttpServletRequest httpRequest,String teacherName,Long courseId) throws Exception {
		//model.addAttribute("teacherName", teacherName);
		model.addAttribute("courseId", courseId);
		QueryHelper qh = null ;
		if(courseId==null){
			qh =  new QueryHelper(Course.class, "c");
			}else{
				qh =  new QueryHelper(Course.class, "c")
						.addCondition("c.courseId=?", courseId);
			}
		
		String currentPage = httpRequest.getParameter("currentPage");
		System.out.println("*************"+currentPage+"********************");
		PageBean pageBean = null;
		if(currentPage==null){
			pageBean = courseService.getPageBean(1, pageSize, qh);
		}else{
			int page = Integer.parseInt(currentPage);
			pageBean = courseService.getPageBean(page, pageSize, qh);
		}
		model.addAttribute("pageBean", pageBean);
		return "/admin/course/list";
	}

	/** 课程删除 */
	@RequestMapping(value = "/course/delete")
	@SystemControllerLog(description = "课程删除")
	public String courseDelete(Long id) throws Exception {
		System.out.println("=================" + id);
		courseService.delete(id);
		return "redirect:/admin/course/list";
	}
	/** 课程修改页面 */
	@RequestMapping("/course/inspectUI")
	public String courseEditUI(Long id,Model model) throws Exception {
		
		Course course = courseService.getById(id);
		model.addAttribute("course", course);
		return "/admin/course/inspectUI";
	}

	/** 课程修改 */
	@RequestMapping(value = "/course/inspect")
	@SystemControllerLog(description = "课程修改")
	public String courseEdit(Long id,Integer inspectState,String inspectResult) throws Exception {
		Course course = courseService.getById(id);
		course.setInspectState(inspectState);
		if(inspectState==2){
			course.setInspectResult(inspectResult);
		}
		courseService.update(course);
		
		return "redirect:/admin/course/list";
	}

	/** 课程添加页面 */
	@RequestMapping("/course/addUI")
	public String courseAddUI(Model model) throws Exception {
		return "/course/addUI";
	}

	/** 课程添加 */
	@SystemControllerLog(description = "用户添加")
	@RequestMapping(value = "/course/add", method = RequestMethod.POST)
	public String courseAdd() throws Exception {
		return "redirect:/admin/course/list";	
	}
	
	
	//============================用户管理================================
	/** 用户列表 */
	@RequestMapping("/user/list")
	@SystemControllerLog(description = "用户列表")    
	public String list(Model model,HttpServletRequest httpRequest) throws Exception {
//		List<User> userList = userService.findAll();
//		model.addAttribute("userList", userList);
		
		QueryHelper qh=  new QueryHelper(User.class, "u") ;
		String currentPage = httpRequest.getParameter("currentPage");
		System.out.println("*************"+currentPage+"********************");
		PageBean pageBean = null;
		if(currentPage==null){
			pageBean = courseService.getPageBean(1, pageSize, qh);
		}else{
			int page = Integer.parseInt(currentPage);
			pageBean = courseService.getPageBean(page, pageSize, qh);
		}
		model.addAttribute("pageBean", pageBean);
		return "/user/list";
	}

	/** 用户删除 */
	@RequestMapping(value = "/user/delete")
	@SystemControllerLog(description = "用户删除")
	public String delete(Long id) throws Exception {
		System.out.println("=================" + id);
		userService.delete(id);
		return "redirect:/admin/user/list";
	}
	/** 用户修改页面 */
	@RequestMapping("/user/editUI")
	public String editUI(Long id,Model model) throws Exception {
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		
		User user = userService.getById(id);
		model.addAttribute("user", user);
		return "/user/editUI";
	}

	/** 用户修改 */
	@SystemControllerLog(description = "用户修改")
	@RequestMapping(value = "/user/edit")
	public String edit(Long id,User user,Long roleId) throws Exception {
		User u = userService.getById(id);
		
		Role role = roleService.getById(roleId);
		System.out.println("====" + role.getName()+"-" +user.getPassword());
		u.setPassword(user.getPassword());
		u.setNickname(user.getNickname());
		u.setRole(role);
		userService.update(u);
		
		return "redirect:/admin/user/list";
	}

	/** 用户添加页面 */
	@RequestMapping("/user/addUI")
	public String addUI(Model model) throws Exception {
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "/user/addUI";
	}

	/** 用户添加 */
	@SystemControllerLog(description = "用户添加")
	@RequestMapping(value = "/user/add", method = RequestMethod.POST)
	public String add(User user,Long roleId) throws Exception {
		Role role = roleService.getById(roleId);
		user.setRole(role);
		user.setRegistTime(new Date());
		System.out.println("loginName: " + user.getLoginName() + "-" + user.getPassword() + "-" + user.getNickname());
		this.userService.save(user);
		return "redirect:/admin/user/list";	
	}
	
	/** 登陆界面 */
	
	@RequestMapping("/show")
	public String loginUI() throws Exception {
		return "/admin/show";
	}
	
	/** 验证登陆：用户名密码是否匹配 */
	@RequestMapping("/validateL")
	public void validateL(String username,String password,HttpServletResponse response) throws Exception {
		System.out.println("====username=====" + username);
		System.out.println("====password=====" + password);
		if(userService.findUserBy(username)){
			User user = userService.getByName(username);
			PrintWriter out= response.getWriter();
			boolean result=userService.findUserBy(username,password);
			
			if("admin".equals(username)&&result){
				System.out.println("===ok===");
				out.write("ok");
			}else if(user.getRole()!=null){
				if(result&&!user.getRole().getName().equals("普通用户")) {
					System.out.println("===ok===");
					out.write("ok");
				}
			}
		}
	}
	/** 登陆*/
	@RequestMapping("/login")
	@SystemControllerLog(description = "登陆系统")
	public String login(User user,HttpSession session) throws Exception {
		System.out.println("=====当前登陆用户======="+ user.getLoginName()+"=========");
			User currentAdmin = userService.getByName(user.getLoginName());
			session.setAttribute("currentAdmin", currentAdmin);
			return "redirect:/admin/index";
	}
	
	/** 注销 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception {
		session.removeAttribute("currentAdmin");
		return "redirect:/";
	}
	
	/** 首页 */
	@RequestMapping("/index")
	public String index(Model model,HttpSession session) throws Exception {
		
		if(session.getAttribute("currentAdmin")!=null){
			List<Privilege> childernPrivilege = new ArrayList<Privilege>();
			List<Privilege> topPrivilege= new ArrayList<Privilege>();
			List<Privilege> topPrivilegeList = (List<Privilege>) SpringContextHolder.getServletContext().getAttribute("topPrivilegeList");
			User currentAdmin= (User) session.getAttribute("currentAdmin");

			if(currentAdmin.getLoginName().equals("admin")){//如果是超级管理员，现实全部权限
				for (Privilege privilege : topPrivilegeList){
					for (Privilege p : privilege.getChildren()){
						childernPrivilege.add(p);
					}
				}
				model.addAttribute("topPrivilege", topPrivilegeList);
				model.addAttribute("childernPrivilege", childernPrivilege);
			}else{
				if(currentAdmin.getRole()!=null){
					if(currentAdmin.getRole().getPrivilege()!=null){
						//准备当前用户顶级权限
						for (Privilege privilege : topPrivilegeList) {
							for (Privilege p : currentAdmin.getRole().getPrivilege()) {
								if(privilege.getName().equals(p.getName())){
									topPrivilege.add(p);
								}
							}
						}
						model.addAttribute("topPrivilege", topPrivilege);
						//准备当前用户二级权限
						List<Privilege> allPrivilegeList = (List<Privilege>) SpringContextHolder.getServletContext().getAttribute("allPrivilegeList");
						for (Privilege privilege : allPrivilegeList) {
							for (Privilege p : currentAdmin.getRole().getPrivilege()) {
								if(privilege.getName().equals(p.getName())&&!privilege.getChildren().isEmpty()){
									childernPrivilege.add(p);
								}
							}
						}
						model.addAttribute("childernPrivilege", childernPrivilege);
					}
				}
			}
		}
		return "/admin/index";
	}
	
	/* 导师审核页面 */
	@RequestMapping("/user/inspectUI")
	public String inspectUI(Long id,Model model) throws Exception {
		
		User user = userService.getById(id);
		model.addAttribute("user", user);
		
		Lecture lecture = lectureService.getByUser(user);
		model.addAttribute("lecture", lecture);
		return "/user/inspectUI";
	}
	
	/** 导师审核 */
	@RequestMapping(value = "/user/inspect")
	@SystemControllerLog(description = "导师审核")
	public String inspect(Long id,Integer inspectState,String inspectResult) throws Exception {
		User user = userService.getById(id);
		Role role = roleService.getByName("导师");
		user.setApplyTutor(inspectState);
		if(inspectState==3){
			user.setRole(role);
			user.setInspectResult(inspectResult);
		}
		userService.update(user);
		
		return "redirect:/admin/user/list";
	}

	
	

}
