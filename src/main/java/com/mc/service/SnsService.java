package com.mc.service;

import java.util.ArrayList;
import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.CommentOfReply;
import com.mc.domain.Sns;

/**
 * @desc
 * @author yanbaobin@yeah.net
 * Sep 22, 2015 8:57:45 PM
 */
public interface SnsService extends DaoSupport<Sns> {
	
	public static List<CommentOfReply> comments =  new ArrayList<CommentOfReply>();
	
	/**
	 * @desc 计算社交行为的次数，如赞、评论、关注。。。
	 * @param objectId 被操作对象的Id
	 * @param objectType 被操作对象的类型
	 * @param behaviorType 社交行为类型
	 * @return int
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 6:16:54 PM
	 */
	int getSocialBehaviorCountById(long objectId, long objectType, long behaviorType);
	
	/**
	 * @desc 获取指定的sns对象，如某个用户对某个问题的点赞
	 * @param userId 用户Id
	 * @param objectId 被操作对象Id
	 * @param objectType 被操作对象的类型
	 * @param behaviorType 操作行为的类型
	 * @return Sns对象
	 * @author yanbaobin@yeah.net
	 * @date Sep 25, 2015 9:56:25 PM
	 */
	List<Sns> getSpecial(long userId, long objectId, long objectType, long behaviorType);
	
	/**
	 * @desc 获取所有评论
	 * @param snsId 被评论对象
	 * @return 有评论，返回CommentOfReply的集合，否则返回null
	 * @author yanbaobin@yeah.net
	 * @date Sep 27, 2015 9:06:04 AM
	 */
	List<CommentOfReply> getCommentsById(long snsId);
	
	/**
	 * @desc 获取直接评论
	 * @param snsId
	 * @return 有评论，返回Sns的集合，否则返回null
	 * @author yanbaobin@yeah.net
	 * @date Sep 27, 2015 9:26:47 AM
	 */
	List<Sns> getDirectCommentsById(long snsId);
	
	/**
	 * @desc 获取某个对象的特定类型的社交行为对象
	 * @param objectId 被操作对象的ID
	 * @param objectType 被操作对象的类型
	 * @param behaviorType 社交行为类型
	 * @return 社交对象
	 * @author yanbaobin@yeah.net
	 * @date Sep 27, 2015 7:53:58 PM
	 */
	List<Sns> getBehavior(long objectId, long objectType, long behaviorType);
}
