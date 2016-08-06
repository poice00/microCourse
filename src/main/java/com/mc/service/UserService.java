package com.mc.service;


import com.mc.base.DaoSupport;
import com.mc.domain.User;


public interface UserService extends DaoSupport<User> {
	User getByName(String name);

	boolean findUserBy(String name);

	boolean findUserBy(String loginName, String password);
	
}
