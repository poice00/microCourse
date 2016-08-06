package com.mc.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mc.domain.User;


public class PrivilegeInterceptor extends HandlerInterceptorAdapter {
	@SuppressWarnings("unused")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        System.out.println("==============执行拦截器================");    
        String requestUri = request.getRequestURI();  
        String contextPath = request.getContextPath();  
        String url = requestUri.substring(contextPath.length());  
        
        System.out.println("requestUri:"+requestUri);    
        System.out.println("contextPath:"+contextPath);    
        System.out.println("url:"+url);    
         
        /*设置模块和页面，供Sea.js生成 入口js模块 */
        request.getSession().setAttribute("config", getModuleAndPage(url));
        
        User user =  (User)request.getSession().getAttribute("currentUser");
    	if(user == null){ //如果未登录
    		
    		request.getSession().setAttribute("userInfo", "notlogin");		//供js判断用户是否登录

    		if(url.equals("/user/login")||url.equals("/user/register")||url.equals("/user/validate")||url.equals("/user/checkCode")||url.equals("/user/ImageCode") || url.startsWith("/wenda")){ //如果是去登陆
    			System.out.println("正在登陆......");
    			return true;
    		}else{
            	System.out.println("Interceptor：跳转到login页面！");  
                request.getRequestDispatcher("/").forward(request, response);  //请求转发
                return false;  
    		}
    	}else{ //如果已登录
    		
    		request.getSession().setAttribute("userInfo", "userInfo");	//供js判断用户是否登录
    		
        	//如果有权限，就放行
			if(user.hasPrivilegeByUrl(url)){ 
				return true;
			}
			//如果没有权限，就转到提示页面
			else{
				request.getRequestDispatcher("/WEB-INF/jsps/noPrivilegeError.jsp").forward(request, response);  //请求转发
				return false;
			}
        	
        }
          
	}

	/**
	 * @desc 获取url中的模块和页面
	 * @param url
	 * @return Map<String,String>K1:module,K2:page
	 * @author yanbaobin@yeah.net
	 * @date Sep 19, 2015 10:59:16 AM
	 */
	private Map<String, String> getModuleAndPage(String url) {
		Map<String, String> config = new HashMap<String, String>();
		
		StringBuilder module = new StringBuilder();
		StringBuilder page = new StringBuilder();
		
		int index2 = url.indexOf("/",1);			//正向数，第二个斜杠的序号
		
		/*形如/course,只有一个斜杠,或者/course/*/
		if(-1 == index2 || url.length() - 1 == index2){
			if(-1 == index2)
				module =  new StringBuilder(url.substring(1));
			else
				module = new StringBuilder(url.substring(1, index2));
			
			page = new StringBuilder("index");
		}
		else{
			module = new StringBuilder(url.substring(1, index2));
			
			int index3 = url.indexOf("/",index2 + 1);	//正向数，第三个斜杠的序号
			
			/*形如/plan/detail*/
			if(-1 == index3)
				page = new StringBuilder(url.substring(index2 + 1));
			
			/*形如/course/view/ 或者 /course/view/876*/
			else
				page = new StringBuilder(url.substring(index2 + 1, index3));
		}
		
		config.put("module", module.toString());
		config.put("page", page.toString());
		
		return config;
	}
}
