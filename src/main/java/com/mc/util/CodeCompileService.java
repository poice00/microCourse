package com.mc.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class CodeCompileService {
	public String findCode() {
		@SuppressWarnings("deprecation")
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		String str="select init_code from practice where practice_id = 1";
		Object object=session.createSQLQuery(str).list().get(0);
		str=object.toString();
		session.getTransaction().commit();
		return str;
	}
}
