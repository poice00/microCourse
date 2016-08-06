package com.mc.serviceImpl;



import java.util.Collection;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Privilege;
import com.mc.service.PrivilegeService;



@Service
@Transactional
@SuppressWarnings("unchecked")
public class PrivilegeServiceImpl extends DaoSupportImpl<Privilege> implements PrivilegeService {

	public List<Privilege> findTopList() {
		return sessionFactory.getCurrentSession().createQuery( //
				"from Privilege p where p.parent is null") //
				.list(); //
	}

	public List<Privilege> allPrivilegeUrls() {
		// TODO Auto-generated method stub
				return this.getSession().createQuery( //
						"select p.url from Privilege p where p.url is not null") //
						.list();
	}
	public List<Privilege> allPrivilegeList() {
		// TODO Auto-generated method stub
				return this.getSession().createQuery( //
						"from Privilege p where p.parent is not null") //
						.list();
	}
	
}
