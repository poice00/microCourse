package com.mc.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.Sns;
import com.mc.domain.Topic;
import com.mc.service.TopicService;
import com.mc.service.TypeService;
import com.sun.org.apache.bcel.internal.generic.ReturnaddressType;

@Service
@Transactional
public class TopicServiceImpl extends DaoSupportImpl<Topic> implements TopicService {
	
	@Resource
	private TypeService typeService;

	public void saveTag(long tagId, long objectId, long objectType) {
		getSession().createSQLQuery(
			"INSERT INTO object_tag(tag_id,object_id,object_type) VALUES(?,?,?)")
			.setParameter(0, tagId)
			.setParameter(1, objectId)
			.setParameter(2, objectType)
			.executeUpdate();
	}

	public int replyCount(long topicId) {
		List count = getSession().createSQLQuery(
				"SELECT COUNT(*) FROM sns WHERE object_type = ? AND behavior_type = ? AND object_id = ?")
				.setParameter(0, typeService.getByName("问题").getTypeId())
				.setParameter(1, typeService.getByName("回复").getTypeId())
				.setParameter(2, topicId). 
				list();							//即使list的大小始终为1，即使count（*）为0
		
		return Integer.parseInt(count.get(0).toString());
		
	}

	@SuppressWarnings("unchecked")
	public List<Sns> findAllReplyById(long topicId) {
		return getSession().createQuery(
				"FROM Sns WHERE objectType = ? AND behaviorType = ? AND objectId = ?")
				.setParameter(0, typeService.getByName("问题").getTypeId())
				.setParameter(1, typeService.getByName("回复").getTypeId())
				.setParameter(2, topicId)
				.list();
	}

	@SuppressWarnings("unchecked")
	public List<Topic> findSimilar(String keyword) {
		
		if(keyword.length() == 0)
			return null;
		
		/*生成模糊字符串*/
		StringBuilder sb = new StringBuilder("%");
		
		for (int i = 0; i < keyword.length(); i++)
			sb.append(keyword.charAt(i)).append("%");
		
		return getSession().createQuery(
				"FROM Topic WHERE title LIKE ?")
				.setParameter(0, sb.toString())
				.list();
	}
	
}
