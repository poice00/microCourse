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
import com.mc.domain.Section;
import com.mc.service.ChapterService;
import com.mc.service.CommentService;
import com.mc.service.CourseService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class CommentServiceImpl extends DaoSupportImpl<Comment>implements CommentService {

	public List<Comment> findBySection(Section section) {
		
		List<Comment> comments=getSession()
				.createSQLQuery("select * from comment where section_id = ? order by post_time desc")
				.addEntity(Comment.class)
				.setParameter(0, section.getSectionId())
				.list();
		return comments;
	}

}
