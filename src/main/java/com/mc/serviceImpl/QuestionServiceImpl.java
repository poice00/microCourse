package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Chapter;
import com.mc.domain.Comment;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.Question;
import com.mc.domain.Section;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.QuestionService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class QuestionServiceImpl extends DaoSupportImpl<Question>implements QuestionService {

	public List<Question> findBySection(Section section) {

		List<Question> questions=getSession()
				.createSQLQuery("select * from question where section_id = ? order by post_time desc")
				.addEntity(Question.class)
				.setParameter(0, section.getSectionId())
				.list();
		return questions;
	}

	
}
