package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Role;
import com.mc.domain.User;
import com.mc.service.RoleService;


@Service
@Transactional
public class RoleServiceImpl extends DaoSupportImpl<Role>implements RoleService {

	public Role getByName(String name) {
		return (Role) getSession()
				.createQuery(//
						"From Role r where r.name=?")//
				.setParameter(0, name)//
				.uniqueResult();
	}


}
