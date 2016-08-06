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
import com.mc.domain.Exercise;
import com.mc.domain.Orientation;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.ExerciseService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class ExerciseServiceImpl extends DaoSupportImpl<Exercise>implements ExerciseService {

	public boolean checkAnswer(String answer, Long exerciseId) {
		return false;
	}

	
	
}
