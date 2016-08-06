package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.StudyProgress;
import com.mc.domain.StudyStatus;

public interface StudyStatusService extends DaoSupport<StudyStatus> {

	StudyStatus findByCourIdAndUserId(Long courseId, Long userId);

	boolean checkExit(Long courseId, Long userId);


	
}
