package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.UserSection;

public interface UserSectionService extends DaoSupport<UserSection> {

	UserSection findByUserSection(Long userId, Long sectionId);

	boolean checkUSexit(Long userId, Long sectionId);
}
