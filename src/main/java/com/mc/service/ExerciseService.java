package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Exercise;
import com.mc.domain.Orientation;

public interface ExerciseService extends DaoSupport<Exercise> {

	boolean checkAnswer(String answer, Long exerciseId);

}
