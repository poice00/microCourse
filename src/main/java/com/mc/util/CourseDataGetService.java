package com.mc.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Course;
import com.mc.domain.Orientation;

public class CourseDataGetService {
	@SuppressWarnings("deprecation")
	public void saveCourse(Course course) {
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(course);
		session.getTransaction().commit();
	}
	@SuppressWarnings("deprecation")
	public void saveOrientation(Orientation orientation) {
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(orientation);
		session.getTransaction().commit();
	}
	public void saveClassify(Classify classify) {
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(classify);
		session.getTransaction().commit();
	}
	public void saveChapter(Chapter chapter) {
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.save(chapter);
		session.getTransaction().commit();
	}
}
