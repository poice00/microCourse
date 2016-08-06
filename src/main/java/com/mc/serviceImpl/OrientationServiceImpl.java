package com.mc.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Classify;
import com.mc.domain.Orientation;
import com.mc.service.OrientationService;

@Service
@Transactional
public class OrientationServiceImpl extends DaoSupportImpl<Orientation> implements OrientationService {

	public Long findByName(String classifyName) {
		System.out.println(classifyName);
		Orientation orientation=(Orientation) getSession().createSQLQuery(
				"select * from orientation where hrefName = ?")
				.addEntity(Orientation.class)
				.setParameter(0, classifyName)
				.uniqueResult();
		Long i=orientation.getOrientationId();
		return i;
	}	
}
