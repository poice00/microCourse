package com.mc.domain;

import java.util.List;

public class Wenda {
	
	/*
	 * topic类不包括回答数、标签、最赞回答
	 * 发布时间需要处理
	 */
	private Topic question;
	private int answerCount;
	private String elapse;
	private List<Tag> tags;
	private int status;			//0:没有人回答，1:已采纳答案，2:最赞回答，3:最新回答
	private User statusUser;    //对应着某种状态的用户和回答
	private Sns statusSns;
	
	/**
	 * @desc
	 * @param question
	 * @param answerCount
	 * @param elapse
	 * @param thumbsUpReply
	 * @author yanbaobin@yeah.net
	 * Sep 28, 2015 5:07:21 PM
	 */
	public Wenda(Topic question, int answerCount, String elapse, List<Tag> tags, int status) {
		super();
		this.question = question;
		this.answerCount = answerCount;
		this.elapse = elapse;
		this.tags = tags;
		this.status = status;
	}
	
	public Topic getQuestion() {
		return question;
	}
	public void setQuestion(Topic question) {
		this.question = question;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public String getElapse() {
		return elapse;
	}
	public void setElapse(String elapse) {
		this.elapse = elapse;
	}

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public User getStatusUser() {
		return statusUser;
	}

	public void setStatusUser(User statusUser) {
		this.statusUser = statusUser;
	}

	public Sns getStatusSns() {
		return statusSns;
	}

	public void setStatusSns(Sns statusSns) {
		this.statusSns = statusSns;
	}
}
