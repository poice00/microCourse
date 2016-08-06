package com.mc.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Role;
import com.mc.domain.SearchContent;
import com.mc.domain.SearchHistory;
import com.mc.domain.User;
import com.mc.service.RoleService;
import com.mc.service.SearchContentService;
import com.mc.service.SearchHistoryService;


@Service
@Transactional
public class SearchHistoryServiceImpl extends DaoSupportImpl<SearchHistory> implements SearchHistoryService {

	@SuppressWarnings("unchecked")
	public List<SearchHistory> getByUser(String loginName) {

		
		return getSession().createQuery(//
					"From SearchHistory sh where sh.user.loginName=? ORDER BY sh.searchDate DESC") //
					.setParameter(0, loginName)//
					.setFirstResult(0)//
					.setMaxResults(5)//
					.list();
	}



}
