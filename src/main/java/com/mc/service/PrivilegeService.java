package com.mc.service;


import java.util.Collection;
import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Privilege;



public interface PrivilegeService extends DaoSupport<Privilege> {

	List<Privilege> findTopList();

	List<Privilege> allPrivilegeList();
	List<Privilege> allPrivilegeUrls();

}
