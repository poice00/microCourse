package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;

import java.util.Date;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


/**
 * Topic generated by hbm2java
 */
@Entity
@Table(name = "topic", catalog = "micro_course")
public class Topic implements java.io.Serializable {

	private Long topicId;
	private User user;
	private String title; 
	private String content;
	private Date initiatingTime;
	private String source;
	private int browseCount;
	private Long bestAnswer;
	private boolean top;

	public Topic() {
	}

	public Topic(int browseCount) {
		this.browseCount = browseCount;
	}

	public Topic(User user, String title, String content, Date initiatingTime, String source, int browseCount, boolean top) {
		this.user = user;
		this.title = title;
		this.content = content;
		this.initiatingTime = initiatingTime;
		this.source = source;
		this.browseCount = browseCount;
		this.top = top;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "topic_id", unique = true, nullable = false)
	public Long getTopicId() {
		return this.topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "title", length = 200)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "content", length = 20000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "initiating_time", length = 20)
	public Date getInitiatingTime() {
		return this.initiatingTime;
	}

	public void setInitiatingTime(Date initiatingTime) {
		this.initiatingTime = initiatingTime;
	}

	@Column(name = "source", length = 200)
	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	@Column(name = "browse_count", nullable = false)
	public int getBrowseCount() {
		return this.browseCount;
	}

	public void setBrowseCount(int browseCount) {
		this.browseCount = browseCount;
	}

	@Column(name="top", nullable = false)
	public boolean isTop() {
		return this.top;
	}

	public void setTop(boolean top) {
		this.top = top;
	}
	
	@Column(name="best_answer")
	public Long getBestAnswer() {
		return bestAnswer;
	}

	public void setBestAnswer(Long bestAnswer) {
		this.bestAnswer = bestAnswer;
	}

}
