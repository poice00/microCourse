package com.mc.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Course;
import com.mc.domain.Section;
import com.mc.service.SectionService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class SectionServiceImpl extends DaoSupportImpl<Section>implements SectionService {

	
	public List<Section> findByCourse(Long courseId) {
		
		
		List<Section> sections=getSession()
				.createSQLQuery("select * from section where chapter_id in (select chapter_id from chapter where course_id = ?) order by section_id")
				.addEntity(Section.class)
				.setParameter(0, courseId)
				.list();
		return sections;
	}


	
}
