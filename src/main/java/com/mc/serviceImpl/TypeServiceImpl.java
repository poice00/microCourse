package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Type;
import com.mc.service.TypeService;

@Service
@Transactional
public class TypeServiceImpl extends DaoSupportImpl<Type> implements TypeService {

	public Type getByName(String name) {
		return (Type) getSession().createQuery(
				"FROM Type WHERE name = ?")
				.setParameter(0, name)
				.uniqueResult();
	}
	
}
