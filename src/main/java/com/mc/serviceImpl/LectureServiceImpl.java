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
import com.mc.domain.Lecture;
import com.mc.domain.Orientation;
import com.mc.domain.User;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.LectureService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class LectureServiceImpl extends DaoSupportImpl<Lecture>implements LectureService {

	public Lecture getByUser(User user) {
		return (Lecture) getSession().createQuery(//
				"From Lecture l where l.user=? ORDER BY l.lectureId DESC")//
				.setFirstResult(0)//
				.setMaxResults(1)//
				.setParameter(0, user)//
				.uniqueResult();
	}

	
}
