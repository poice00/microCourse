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
import com.mc.domain.Note;
import com.mc.domain.Orientation;
import com.mc.domain.Question;
import com.mc.domain.Section;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.NoteService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class NoteServiceImpl extends DaoSupportImpl<Note>implements NoteService {

	public List<Note> findBySection(Section section) {
		List<Note> notes=getSession()
				.createSQLQuery("select * from note where section_id = ? order by post_time desc")
				.addEntity(Note.class)
				.setParameter(0, section.getSectionId())
				.list();
		return notes;
	}
}
