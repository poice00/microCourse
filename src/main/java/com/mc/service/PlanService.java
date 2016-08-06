package com.mc.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupport;
import com.mc.domain.Plan;
import com.mc.domain.Section;
import com.mc.domain.Stage;
import com.mc.domain.Step;

@Service
@Transactional
public interface PlanService extends DaoSupport<Plan> {

	int learned(Long user,Long plan);
	
	List<Stage> findAllStage(Long id);

	List<Section> findplanCompleteProcess(Long sectionId);
	
	List<Step> findStepByStageId(long stageId);

	List<Section> findlearnCount(Long userId, Long planId);
}
