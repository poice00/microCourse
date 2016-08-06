package com.mc.util;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import com.mc.domain.User;


public class PrivilegeTag extends TagSupport {
	private static final long serialVersionUID = -532517444654109642L;
    private String operateID;
    private String roleID;
    private String mark;
    public void setMark(String mark) {
        this.mark = mark;
    }
    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }
    public void setOperateID(String operateID) {
        this.operateID = operateID;
    } 
    public int doStartTag() throws JspException {
    	User currentAdmin = (User) pageContext.getSession().getAttribute("currentAdmin") ;
    	User currentUser = (User) pageContext.getSession().getAttribute("currentUser") ;
	    if(currentAdmin!=null){
	    	//当前准备显示链接的Url
	    	String priUrl = operateID;
	    	//判断权限
	    	if(currentAdmin.hasPrivilegeByUrl(priUrl)){
	    		return EVAL_BODY_INCLUDE; //正常显示
	    	}else{
	    		return SKIP_BODY;  //不显示
	    	}
    	}
	    else{
	    	//当前准备显示链接的Url
	    	String priUrl = operateID;
	    	//判断权限
	    	if(currentUser.hasPrivilegeByUrl(priUrl)){
	    		return EVAL_BODY_INCLUDE; //正常显示
	    	}else{
	    		return SKIP_BODY;  //不显示
	    	}
	    }
    } 
}
