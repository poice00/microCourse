package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Course;
import com.mc.domain.Orientation;

public interface CourseService extends DaoSupport<Course> {

	List<Course> findByOrientation(Long id);

	List<Course> findByClassify(Long classifyId);

	List<Course> findBylevel(String levelname);

	List<Course> findByClassifyAndLevel(Long classifyId, String levelname);

	List<Course> findByOrientationAndLevel(Long orientationId, String levelname);

	List<Course> findByUserId(Long teacherId);

	List<Course> findTop20();

	boolean checkLearned(Long courseId, Long userId);
	
}
