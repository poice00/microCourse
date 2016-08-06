package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.ObjectTag;
import com.mc.domain.Tag;

/**
 * @desc
 * @author yanbaobin@yeah.net
 * Sep 23, 2015 8:05:48 PM
 */
public interface ObjectTagService extends DaoSupport<ObjectTag> {
	
	/**
	 * @desc 查找对象的标签
	 * @param objectId
	 * @param objectType
	 * @return Tag集合
	 * @author yanbaobin@yeah.net
	 * @date Sep 23, 2015 4:33:30 PM
	 */
	List<Tag> findTagsByObject(long objectId, long objectType);
	
	
	/**
	 * @desc 查询使用次数前20的标签
	 * @return 标签的list集合
	 * @author yanbaobin@yeah.net
	 * @date Sep 23, 2015 6:33:08 PM
	 */
	List<Tag> findTop20Tag();
	
	/**
	 * @desc 查询所有的标签
	 * @return
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 9:00:44 AM
	 */
	List<Tag> findAllTag();
	
	/**
	 * @desc 给标签的使用次数加1
	 * @param tagId
	 * @author yanbaobin@yeah.net
	 * @date Sep 23, 2015 8:05:56 PM
	 */
	void addTagUsedTimesByOne(long tagId);
}
