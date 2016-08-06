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
import com.mc.domain.Orientation;
import com.mc.domain.Practice;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.PracticeService;

@Service
@Transactional
public class PracticeServiceImpl extends DaoSupportImpl<Practice>implements PracticeService {

}
