package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.User;
import com.mc.service.UserService;

@Service
@Transactional
public class UserServiceImpl extends DaoSupportImpl<User>implements UserService {
	public boolean findUserBy(String name) {
		long count = (Long) getSession().createQuery(
				"SELECT COUNT(*) FROM User WHERE loginName = ?")//
				.setParameter(0, name)//
				.uniqueResult();
		
		if(count > 0)
			return true;
		
		return false;
	}
	public User getByName(String name) {
		return (User) getSession()
				.createQuery(//
						"From User u where u.loginName=?")//
				.setParameter(0, name)//
				.uniqueResult();
	}
	public boolean findUserBy(String loginName, String password) {
		long count = (Long) getSession().createQuery(
				"SELECT COUNT(*) FROM User WHERE loginName = ? AND password=?")//
				.setParameter(0, loginName)//
				.setParameter(1, password)//
				.uniqueResult();
		if(count > 0)
			return true;
		
		return false;
	}

}
