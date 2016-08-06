package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.service.ChapterService;
import com.mc.service.ClassifyService;
import com.mc.service.CourseService;

@Service
@Transactional
public class ClassifyServiceImpl extends DaoSupportImpl<Classify>implements ClassifyService {

	public List<Classify> findByOrientation(Long orientationId) {
		List<Classify> Classifies=getSession()
				.createSQLQuery("select * from classify where orientation_id = ?")
				.addEntity(Classify.class)
				.setParameter(0, orientationId)
				.list();
		return Classifies;
	}

	public boolean checkClassifyExit(String classifyName) {
		List<Classify> Classifies=getSession()
				.createSQLQuery("select * from classify where hrefName = ?")
				.addEntity(Classify.class)
				.setParameter(0, classifyName)
				.list();
		if (Classifies.size()!=0) {
			return true;
		} else {
			return false;
		}		
	}

	public Classify findByCName(String classifyName) {
		Classify Classify=(com.mc.domain.Classify) getSession().createSQLQuery
				("select * from classify where name = ?")
				.addEntity(Classify.class)
				.setParameter(0, classifyName)
				.uniqueResult();
		Long i=(Long) getSession().createSQLQuery(
				"select classifyId from classify where name = ?")
				.setParameter(0, classifyName)
				.uniqueResult();
		return Classify;
	}
	public Long findByName(String classifyName) {
		Classify classify=(Classify) getSession().createSQLQuery(
				"select * from classify where hrefName = ?")
				.addEntity(Classify.class)
				.setParameter(0,classifyName)
				.uniqueResult();
		Long i=classify.getClassifyId();
		return i;
	}
	
}
