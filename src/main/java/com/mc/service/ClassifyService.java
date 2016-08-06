package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Course;
import com.mc.domain.Orientation;

public interface ClassifyService extends DaoSupport<Classify> {

	List<Classify> findByOrientation(Long orientationId);

	boolean checkClassifyExit(String classifyName);

	Long findByName(String classifyName);
	
}
