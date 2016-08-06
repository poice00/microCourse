package com.mc.util;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.mc.domain.Privilege;
import com.mc.service.PrivilegeService;



public class InitListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		//获取容器与相关的Service对象
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		PrivilegeService privilegeService = (PrivilegeService) ac.getBean("privilegeServiceImpl");

		//准备顶级权限数据
		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		sce.getServletContext().setAttribute("topPrivilegeList", topPrivilegeList);
		System.out.println("---------------> 已准备顶级权限数据 <----------------");
		
		//准备子权限数据
		List<Privilege> allPrivilegeList = privilegeService.allPrivilegeList();
		sce.getServletContext().setAttribute("allPrivilegeList", allPrivilegeList);
		System.out.println("---------------> 已准备子权限数据<----------------");
		//准备url数据
		List<Privilege> allPrivilegeUrls = privilegeService.allPrivilegeUrls();
		sce.getServletContext().setAttribute("allPrivilegeUrls", allPrivilegeUrls);
		System.out.println("---------------> 已准备子url数据<----------------");
	}

	
	

}
