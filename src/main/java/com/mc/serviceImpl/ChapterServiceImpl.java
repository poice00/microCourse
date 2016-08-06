package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class ChapterServiceImpl extends DaoSupportImpl<Chapter>implements ChapterService {

	
	public List<Chapter> findByCourseId(Long courseId) {
		List<Chapter> chapters=getSession()
				.createSQLQuery("select * from chapter where course_id = ? order by chapter_id asc")
				.addEntity(Chapter.class)
				.setParameter(0, courseId)
				.list();
		return chapters;
	}

	public List<Chapter> getByCourse(Course course) {
		List<Chapter> chapters=getSession()
				.createQuery("FROM Chapter c where c.course = ? order by chapter_id asc")
				.setParameter(0, course)
				.list();
		return chapters;
	}
	
}
