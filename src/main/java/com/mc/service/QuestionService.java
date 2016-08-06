package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.Question;
import com.mc.domain.Section;

public interface QuestionService extends DaoSupport<Question> {

	List<Question> findBySection(Section section);


	
}
