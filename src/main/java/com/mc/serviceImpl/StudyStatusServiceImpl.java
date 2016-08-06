package com.mc.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.StudyStatus;
import com.mc.service.StudyStatusService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class StudyStatusServiceImpl extends DaoSupportImpl<StudyStatus>implements StudyStatusService {

	public StudyStatus findByCourIdAndUserId(Long courseId, Long userId) {
		String sql="select * from studystatus where courseId = "+courseId+" and userId = "+userId;
		List<StudyStatus> studyStatus=getSession().createSQLQuery(sql).
				addEntity(StudyStatus.class).list();
		return studyStatus.get(0);
	}

	public boolean checkExit(Long courseId, Long userId) {
		String sql="select * from studystatus where courseId = "+courseId+" and userId = "+userId;
		List<StudyStatus> studyStatus=getSession().createSQLQuery(sql).
				addEntity(StudyStatus.class).list();
		if (studyStatus.size()>0) {
			return true;
		} else {
			return false;
		}
		
	}
}
