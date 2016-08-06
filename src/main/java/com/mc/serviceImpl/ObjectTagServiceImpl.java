package com.mc.serviceImpl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.ObjectTag;
import com.mc.domain.Tag;
import com.mc.service.ObjectTagService;

@Service
@Transactional
public class ObjectTagServiceImpl extends DaoSupportImpl<ObjectTag> implements ObjectTagService {

	@SuppressWarnings("unchecked")
	public List<Tag> findTagsByObject(long objectId, long objectType) {
		List<ObjectTag> ot = getSession().createQuery(
				"FROM ObjectTag WHERE objectType = ? AND objectId = ?")
				.setParameter(0, objectType)
				.setParameter(1, objectId)
				.list();
	
		List<Tag> tags = new ArrayList<Tag>();
		for (ObjectTag objectTag : ot)
			tags.add(objectTag.getTag());
		
		return tags;
	}

	@SuppressWarnings("unchecked")
	public List<Tag> findTop20Tag() {
		 return getSession().createQuery(
				"FROM Tag t ORDER BY t.usedTimes DESC")
				.setMaxResults(20)
				.list();
	}

	public void addTagUsedTimesByOne(long tagId) {
		getSession().createSQLQuery(
			"UPDATE tag SET used_times = used_times + 1 WHERE tag_id = ?")
			.setParameter(0, tagId)
			.executeUpdate();
		
	}

	@SuppressWarnings("unchecked")
	public List<Tag> findAllTag() {
		return getSession().createQuery(
				"FROM Tag")
				.list();
	}
	
}
