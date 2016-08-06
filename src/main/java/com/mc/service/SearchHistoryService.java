package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Role;
import com.mc.domain.SearchHistory;
import com.mc.domain.User;

public interface SearchHistoryService extends DaoSupport<SearchHistory> {

	List<SearchHistory> getByUser(String loginName);

	
	
}
