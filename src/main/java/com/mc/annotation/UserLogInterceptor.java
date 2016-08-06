package com.mc.annotation;
/**
 * 用户日志记录
 * 
 */
import java.lang.reflect.Method;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.mc.domain.Log;
import com.mc.domain.User;
import com.mc.service.LogService;
import com.mc.service.UserService;
import com.mc.util.SpringContextHolder;


@Aspect
@Component
@Transactional
public class UserLogInterceptor  {
	
	 //注入Service用于把日志保存数据库  
    @Resource  
     private LogService logService;  
    
    
    //Controller层切点    
    @Pointcut("@annotation(com.mc.annotation.UserControllerLog)")    
    public  void userControllerAspect() {    
    
    }  
    
    
	public UserLogInterceptor() {
		System.out.println("初始化切面用户日志记录...");
	}
	
	
//	 @Before("execution(* com.ssy.controller.*.*(..))")
	 @After("userControllerAspect()")
	    public void afterMethod(JoinPoint point) {
		 	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
	        HttpSession session = request.getSession(); 
	        //读取session中的用户  
	        if(session.getAttribute("currentUser")!=null){
		        User user = (User) session.getAttribute("currentUser");   
		        System.out.println("++++++++++++ : " + user.getLoginName());
	        //请求的IP  
	        String ip = request.getRemoteAddr();  
	         try {  
	            //*========控制台输出=========*//  
	        	String className = point.getTarget().getClass().getName();
	        	String methodName = point.getSignature().getName();
	        	Object[] arguments = point.getArgs(); 
	        	String opContent = userOptionContent(arguments);
	            System.out.println("=====前置通知开始=====");  
	            System.out.println("请求方法:" + (className + "." + methodName + "()")); 
	            System.out.println("方法描述：" + getControllerMethodDescription(point));
	            System.out.println("请求人:" + user.getLoginName());  
	            System.out.println("请求IP:" + ip);  
	            System.out.println("请求内容:" + opContent);  
	            //*========数据库日志=========*//  
	            Log log = new Log();  
				log.setDescription(getControllerMethodDescription(point));
	            log.setMethod((className + "." + methodName + "()"));  
	            log.setType("1");  
	            log.setRequestIp(ip);  
	            log.setExceptionCode( null);  
	            log.setExceptionDetail( null);  
	            log.setParams(opContent);  
	            log.setCreateBy(user);  
	            log.setCreateDate(new Date());  
	            //保存数据库  
	            logService.save(log);  
	            System.out.println("=====前置通知结束=====");  
	        }  catch (Exception e) {  
	            //记录本地异常日志  
	        	System.out.println("=========异常信息=============");
	        }  
	        }
	   }
	 /** 
	     * 获取注解中对方法的描述信息 用于Controller层注解 
	     * 
	     * @param joinPoint 切点 
	     * @return 方法描述 
	     * @throws Exception 
	     */  
	     public  static String getControllerMethodDescription(JoinPoint joinPoint)  throws Exception {  
	        String targetName = joinPoint.getTarget().getClass().getName();  
	        String methodName = joinPoint.getSignature().getName();  
	        Object[] arguments = joinPoint.getArgs();  
	        Class targetClass = Class.forName(targetName);  
	        Method[] methods = targetClass.getMethods();  
	        String description = "";  
	         for (Method method : methods) {  
	             if (method.getName().equals(methodName)) {  
	                Class[] clazzs = method.getParameterTypes();  
	                 if (clazzs.length == arguments.length) {  
	                    description = method.getAnnotation(UserControllerLog. class).description();  
	                     break;  
	                }  
	            }  
	        }  
	         return description;  
	    }  
	     /* 使用Java反射来获取被拦截方法(insert、update)的参数值， 
	        * 将参数值拼接为操作内容
	      * @param args
	      * @param mName
	      * @return
	      */
	     public static String userOptionContent(Object[] args){
	       if(args == null){
	         return null;
	       }
	       StringBuffer rs = new StringBuffer();
	       String className = null;
	       //遍历参数对象 
	       for(Object info : args){
	         //获取对象类型
	         className = info.getClass().getName();
	         if(className.contains("com.mc.domain")){
		         className = className.substring(className.lastIndexOf(".") + 1);
		         //获取对象的所有方法
		         Method[] methods = info.getClass().getDeclaredMethods();
		         // 遍历方法，判断get方法 
		         for(Method method : methods){
		           String methodName = method.getName();
		           // 判断是不是get方法
		           if(methodName.indexOf("get") == -1){//不是get方法 
		             continue;//不处理
		           }
		           String dataName = methodName.substring(methodName.lastIndexOf("get") +3,4).toLowerCase()
		        		   + methodName.substring(methodName.lastIndexOf("get") +4);
		           Object rsValue = null;
		           try{
		             // 调用get方法，获取返回值
		             rsValue = method.invoke(info);
		           }catch (Exception e) {
		             continue;
		           }
		           //将值加入内容中
		           if(rsValue!=null){
				          // rs.append("类型:" + className + "\t");
				           //rs.append("方法:" + methodName + "\t");
				           rs.append(dataName + ":" + rsValue + ";");
		           }
		         }
	         }
	       }
	       return rs.toString();
	     }
}
