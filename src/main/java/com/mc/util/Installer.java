package com.mc.util;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.mc.domain.Privilege;
import com.mc.domain.User;



@Component
public class Installer {
	
	@Resource
	private SessionFactory sessionFactory;
	
	/**
	 * 执行安装
	 */
	@Transactional
	public void install(){
		Session session = sessionFactory.getCurrentSession();
		
		//===========================================
		//保存超级管理员用户
		/*User user = new User();
		user.setLoginName("admin");
		user.setPassword("admin");
		session.save(user);*/
		
		//===========================================
		//保存权限数据
		//-----------------------------------------------
		
		
	/*	Privilege menu0,menu,menu1,menu2,menu3,menu4,menu5;
		menu0 = new Privilege("应聘岗位",null,null);
		menu = new Privilege("职位管理","/title/list",menu0);
		menu1 = new Privilege("职位列表","/title/list",menu);
		menu2 = new Privilege("职位删除","/title/delete",menu);
		menu3 = new Privilege("职位添加","/title/add",menu);
		menu4 = new Privilege("职位修改","/title/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);*/
		
		Privilege menu0,menu,menu1,menu2,menu3,menu4,menu5;
		menu0 = new Privilege("视频学习",null,null);
		menu = new Privilege("课程管理","/course/list",menu0);
		menu1 = new Privilege("课程列表","/course/list",menu);
		menu2 = new Privilege("课程删除","/course/delete",menu);
		menu3 = new Privilege("课程添加","/course/add",menu);
		menu4 = new Privilege("课程修改","/course/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		
		
		/*menu0 = new Privilege("系统管理",null,null);
		menu = new Privilege("角色管理","/role/list",menu0);
		menu1 = new Privilege("角色列表","/role/list",menu);
		menu2 = new Privilege("角色删除","/role/delete",menu);
		menu3 = new Privilege("角色添加","/role/add",menu);
		menu4 = new Privilege("角色修改","/role/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		
		
		
		//-----------------------------------------------
		menu = new Privilege("用户管理","/user/list",menu0);
		menu1 = new Privilege("用户列表","/user/list",menu);
		menu2 = new Privilege("用户删除","/user/delete",menu);
		menu3 = new Privilege("用户添加","/user/add",menu);
		menu4 = new Privilege("用户修改","/user/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		
		//------------------------------------------------
		menu = new Privilege("日志管理","/log/list",menu0);
		menu1 = new Privilege("日志列表","/log/list",menu);
		menu2 = new Privilege("日志删除","/log/delete",menu);
		menu3 = new Privilege("日志添加","/log/add",menu);
		menu4 = new Privilege("日志修改","/log/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);
		
		//------------------------------------------------
		menu = new Privilege("课程管理","/log/list",menu0);
		menu1 = new Privilege("课程列表","/log/list",menu);
		menu2 = new Privilege("课程删除","/log/delete",menu);
		menu3 = new Privilege("课程添加","/log/add",menu);
		menu4 = new Privilege("课程修改","/log/edit",menu);
		session.save(menu0);
		session.save(menu);
		session.save(menu1);
		session.save(menu2);
		session.save(menu3);
		session.save(menu4);*/
	}
	
	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		Installer installer  = (Installer) ac.getBean("installer");
		installer.install();
	}
}
