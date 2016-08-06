package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.ObjectTag;
import com.mc.domain.Sns;
import com.mc.domain.Topic;

/**
 * @desc
 * @author yanbaobin@yeah.net
 * Sep 22, 2015 8:57:45 PM
 */
public interface TopicService extends DaoSupport<Topic> {
	
	/**
	 * @desc 保存话题的标签
	 * @param tagId 标签ID
	 * @param objectId 对象ID
	 * @param objectType 对象类型
	 * @author yanbaobin@yeah.net
	 * @date Sep 22, 2015 10:25:56 AM
	 */
	void saveTag(long tagId, long objectId, long objectType);
	
	/**
	 * @desc 查询指定topic的回复数
	 * @param topicId 问答Id
	 * @return int 回复数
	 * @author yanbaobin@yeah.net
	 * @date Sep 22, 2015 8:57:52 PM
	 */
	int replyCount(long topicId);
	
	/**
	 * @desc 查询问题的所有直接回复
	 * @param topicId 问题Id
	 * @return Sns对象集合
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 4:27:50 PM
	 */
	List<Sns> findAllReplyById(long topicId);
	
	/**
	 * @desc 根据关键字搜索类似问题
	 * @param keyword 关键字 
	 * @return Topic对象的集合
	 * @author yanbaobin@yeah.net
	 * @date Sep 29, 2015 8:47:28 AM
	 */
	List<Topic> findSimilar(String keyword);
}
