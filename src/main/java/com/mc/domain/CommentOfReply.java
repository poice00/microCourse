package com.mc.domain;

/**
 * @desc 对问题的回答的回复
 * @author yanbaobin@yeah.net
 * Sep 27, 2015 8:52:46 AM
 */
public class CommentOfReply {
	
	private long snsId;				//sns表中的序号
	private String fromAvatar;		//回复人的头像
	private long fromUserId;   		//回复人的Id
	private String fromNickname;	//回复人的昵称
	private long toUserId;			//被回复人的Id
	private String toNickname;		//被回复人的昵称
	private String content;			//回复内容
	private String elapse;			//回复时间
	private int floor;				//所在楼层
	
	
	public long getSnsId() {
		return snsId;
	}
	public void setSnsId(long snsId) {
		this.snsId = snsId;
	}
	public String getFromAvatar() {
		return fromAvatar;
	}
	public void setFromAvatar(String fromAvatar) {
		this.fromAvatar = fromAvatar;
	}
	public long getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(long fromUserId) {
		this.fromUserId = fromUserId;
	}
	public String getFromNickname() {
		return fromNickname;
	}
	public void setFromNickname(String fromNickname) {
		this.fromNickname = fromNickname;
	}
	public long getToUserId() {
		return toUserId;
	}
	public void setToUserId(long toUserId) {
		this.toUserId = toUserId;
	}
	public String getToNickname() {
		return toNickname;
	}
	public void setToNickname(String toNickname) {
		this.toNickname = toNickname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getElapse() {
		return elapse;
	}
	public void setElapse(String elapse) {
		this.elapse = elapse;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
}
