package com.mc.serviceImpl;

import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mc.base.DaoSupportImpl;
import com.mc.domain.CommentOfReply;
import com.mc.domain.Sns;
import com.mc.domain.User;
import com.mc.service.SnsService;
import com.mc.service.TypeService;
import com.mc.service.UserService;
import com.mc.util.Compute;

@Service
@Transactional
public class SnsServiceImpl extends DaoSupportImpl<Sns> implements SnsService{
	
	@Resource
	private TypeService typeService;
	@Resource
	private UserService userService;
	
	public int getSocialBehaviorCountById(long objectId, long objectType, long behaviorType) {
		return getSession().createQuery(
				"FROM Sns WHERE objectId = ? AND objectType = ? AND behaviorType = ?")
				.setParameter(0, objectId)
				.setParameter(1, objectType)
				.setParameter(2, behaviorType)
				.list()
				.size();
	}

	@SuppressWarnings("unchecked")
	public List<Sns> getSpecial(long userId, long objectId, long objectType, long behaviorType) {
		return (List<Sns>) getSession().createQuery(
				"FROM Sns WHERE userId = ? AND objectId = ? AND objectType = ? AND  behaviorType = ?")
				.setParameter(0, userId)
				.setParameter(1, objectId)
				.setParameter(2, objectType)
				.setParameter(3, behaviorType)
				.list();
	}

	public List<CommentOfReply> getCommentsById(long snsId) {
		
		comments.clear();		//这个成员变量的生命周期？？？
		
		findChildren(snsId, 0);
			
		return comments;
	}
	

	@SuppressWarnings("unchecked")
	public List<Sns> getDirectCommentsById(long snsId) {
		return (List<Sns>) getSession().createQuery(
				"FROM Sns WHERE behaviorType = ? AND objectType = ? AND objectId = ?")
				.setParameter(0, typeService.getByName("回复").getTypeId())
				.setParameter(1, typeService.getByName("sns").getTypeId())
				.setParameter(2, snsId)
				.list();
	}
	
	
	/**
	 * @desc 查找话题的所有回复，查找结果存入comments
	 * @param snsId 话题id
	 * @param depth 递归深度
	 * @author yanbaobin@yeah.net
	 * @date Sep 27, 2015 9:36:54 AM
	 */
	public  void findChildren(long snsId, int depth){
		List<Sns> snsList = getDirectCommentsById(snsId);
		
		if(0 == snsList.size())
			return;
		
		for (Sns sns : snsList) {
			CommentOfReply cor = new CommentOfReply();
			cor.setSnsId(sns.getSnsId());
			
			User fromUser = userService.getById(sns.getUserId());
			
			/*截取用户头像路径中的昵称，防止直接用路径时出现转义字符的干扰*/
			String avatar = fromUser.getAvatar();
			if(avatar == null)
				avatar = "default";
			else{
				int index1 = avatar.indexOf("upload");								
				int index2 = avatar.lastIndexOf('.');
				avatar = avatar.substring(index1 + 7, index2 - 7);		//upload/XXX/avatar.jpg,正好加7，减7
			}
			
			cor.setFromAvatar(avatar);
			cor.setFromUserId(fromUser.getUserId());
			cor.setFromNickname(fromUser.getNickname());
			cor.setToUserId(0);
			cor.setToNickname("");
			cor.setContent(sns.getContent());
			cor.setElapse(Compute.timeDiff(sns.getTime()));			//应该有一个统一的时间来作为标准，考虑到计算机运行速度很快，就不在意这细微的差别了
			cor.setFloor(0);
			
			/*如果不是直接回复,需要提供对谁评论*/
			if(0 != depth){
				Sns toSns = getById(sns.getObjectId());
				User toUser = userService.getById(toSns.getUserId());
				cor.setToUserId(toUser.getUserId());
				cor.setToNickname(toUser.getNickname());
			}
			
			comments.add(cor);
			findChildren(sns.getSnsId(), depth + 1);		//depth++ 和 depth + 1是不一样的
		}
		
		/* 将结果按照时间从前到后排序，
		 * 这里按snsID从小到大排序，效果是一样的
		 * 这个比较器是咋工作的还不太懂
		 */
		/*comments.sort(new Comparator<CommentOfReply>() {

			public int compare(CommentOfReply o1, CommentOfReply o2) {
				return (int) (o1.getSnsId() - o2.getSnsId());
			}
			
		});
		*/
		/*设置楼层*/
		for (int i = 0; i < comments.size(); i++) {
			comments.get(i).setFloor(i + 1);
		}
	}

	@SuppressWarnings("unchecked")
	public List<Sns> getBehavior(long objectId, long objectType, long behaviorType) {
		return (List<Sns>) getSession().createQuery(
				"FROM Sns WHERE objectId = ? AND objectType = ? AND behaviorType = ?")
				.setParameter(0, objectId)
				.setParameter(1, objectType)
				.setParameter(2, behaviorType)
				.list();
	}
}
