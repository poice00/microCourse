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
import com.mc.domain.UserSection;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.UserSectionService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class UserSectionServiceImpl extends DaoSupportImpl<UserSection>implements UserSectionService {



	public UserSection findByUserSection(Long userId, Long sectionId) {
		String sql="select * from usersection where userId = "+userId+" and sectionId = "+sectionId;
		List<UserSection> userSections=getSession().createSQLQuery(sql).addEntity(UserSection.class).list();
		return userSections.get(0);
	}

	public boolean checkUSexit(Long userId, Long sectionId) {
		String sql="select * from usersection where userId = "+userId+" and sectionId = "+sectionId;
		List<UserSection> userSections=getSession().createSQLQuery(sql).addEntity(UserSection.class).list();
		if (userSections.size()==0) {
			return false;
		} else {
			return true;
		}
		
	}


	
}
