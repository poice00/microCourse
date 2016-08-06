package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Role;
import com.mc.domain.SearchContent;
import com.mc.domain.User;
import com.mc.service.RoleService;
import com.mc.service.SearchContentService;


@Service
@Transactional
public class SearchServiceImpl extends DaoSupportImpl<SearchContent> implements SearchContentService {



}
