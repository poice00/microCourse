package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.Section;

public interface SectionService extends DaoSupport<Section> {

	List<Section> findByCourse(Long courseId);
	
}
