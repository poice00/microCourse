package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Lecture;
import com.mc.domain.Orientation;
import com.mc.domain.User;

public interface LectureService extends DaoSupport<Lecture> {

	Lecture getByUser(User user);

}
