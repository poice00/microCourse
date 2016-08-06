package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;

public interface ChapterService extends DaoSupport<Chapter> {

	List<Chapter> findByCourseId(Long courseId);

	List<Chapter> getByCourse(Course course);

	
}
