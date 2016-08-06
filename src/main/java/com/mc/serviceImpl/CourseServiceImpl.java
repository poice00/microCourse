package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.UserSection;
import com.mc.service.CourseService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class CourseServiceImpl extends DaoSupportImpl<Course>implements CourseService {

	public List<Course> findByOrientation(Long id) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where classify_id in ( select classify_id from classify where orientation_id = ?)")
				.addEntity(Course.class)
				.setParameter(0, id)
				.list();
		return courses;
	}

	public List<Course> findByClassify(Long classifyId) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where classify_id = ?")
				.addEntity(Course.class)
				.setParameter(0, classifyId)
				.list();
		return courses;
	}

	public List<Course> findBylevel(String levelname) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where level = ?")
				.addEntity(Course.class)
				.setParameter(0, levelname)
				.list();
		return courses;
	}

	public List<Course> findByClassifyAndLevel(Long classifyId,String levelname) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where classify_id = ? and level = ?")
				.addEntity(Course.class)
				.setParameter(0, classifyId)
				.setParameter(1, levelname)
				.list();
		return courses;
	}

	public List<Course> findByOrientationAndLevel(Long orientationId, String levelname) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where classify_id in (select classify_id from classify where orientation_id = ?) and level = ?")
				.addEntity(Course.class)
				.setParameter(0, orientationId)
				.setParameter(1, levelname)
				.list();
		return courses;
	}

	public List<Course> findByUserId(Long teacherId) {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course where user_id = ?")
				.addEntity(Course.class)
				.setParameter(0, teacherId)
				.list();
		return courses;
	}

	public List<Course> findTop20() {
		List<Course> courses=getSession()
				.createSQLQuery("select * from course")
				.addEntity(Course.class)
				.setMaxResults(20)
				.list();
		return courses;
	}

	public boolean checkLearned(Long courseId, Long userId) {
		String sql="select * from usersection where userId = "+userId+" and sectionId in (select section_id from section where chapter_id in (select chapter_id from chapter where course_id = "+courseId+"))";
		List<UserSection> userSectionsu=getSession()
				.createSQLQuery(sql)
				.addEntity(UserSection.class)
				.list();
		if (userSectionsu.size()>0) {
			return true;
		} else {
			return false;
		}
	}
	
}
