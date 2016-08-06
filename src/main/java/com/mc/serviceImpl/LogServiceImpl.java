package com.mc.serviceImpl;



import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Log;
import com.mc.service.LogService;



@Service
@Transactional
public class LogServiceImpl extends DaoSupportImpl<Log> implements LogService {
	
}
