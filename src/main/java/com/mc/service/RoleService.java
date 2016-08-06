package com.mc.service;

import com.mc.base.DaoSupport;
import com.mc.domain.Role;

public interface RoleService extends DaoSupport<Role> {

	Role getByName(String name);

	
	
}
