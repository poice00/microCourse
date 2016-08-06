package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Role;
import com.mc.domain.Title;
import com.mc.service.RoleService;
import com.mc.service.TitleService;


@Service
@Transactional
public class TitleServiceImpl extends DaoSupportImpl<Title>implements TitleService {


}
