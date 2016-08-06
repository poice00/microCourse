package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Course;
import com.mc.domain.Plan;
import com.mc.domain.Section;
import com.mc.domain.Stage;
import com.mc.domain.Step;
import com.mc.service.PlanService;

@Service
@Transactional
@SuppressWarnings("unchecked")
public class PlanServiceImpl<Scholar> extends DaoSupportImpl<Plan>implements PlanService {

	public List<Stage> findAllStage(Long id) {
		List<Stage> stages=getSession()
				.createSQLQuery("select * from stage where plan_id = ?")
				.setParameter(0, id)
				.list();
		return stages;
	}

	
	public int learned(Long user, Long plan) {
		return (int) getSession()
				.createSQLQuery("select count(*) from user_plan where plan_id=? and user_id=?")
				.setParameter(0, plan)
				.setParameter(0, user)
				.list()
				.size();
	}


	public List<Section> findplanCompleteProcess(Long sectionId) {
		// TODO Auto-generated method stub
		return null;
	}


	public List<Section> findlearnCount(Long userId, Long planId) {
		// TODO Auto-generated method stub
		return null;
	}

	/*public List<Step> findStepByStageId(long stageId) {
		return getSession().createSQLQuery(
				"SELECT * FROM step WHERE stage_id = ?")
				.setParameter(0, stageId)
				.list();
	}*/

	
	/*public List<Plan> findAll(){
		return null;
		List<Scholar> scholars=getSession()
				.createSQLQuery("select plan_id from stage where stage_id in"
						+ "(select stage_id from step where step_id in"
						+ "(select step_id from step_course where course_id in"
						+ "(select course_id from chapter where chapter_id in"
						+ "(select chapter_id from section where section_id in"
						+ "(select section_id from study_progress where user_id=?)))))")
				.setParameter(ranking,section,avatar,nickname)
				"select count(section)"
		return getSession()
			.createQuery(//
				"FROM " + clazz.getSimpleName())//
				.list();
	}*/


	public List<Step> findStepByStageId(long stageId) {
		// TODO Auto-generated method stub
		return null;
	}
}
