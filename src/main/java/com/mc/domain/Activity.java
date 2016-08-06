package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Activity generated by hbm2java
 */
@Entity
@Table(name = "activity", catalog = "micro_course")
public class Activity implements java.io.Serializable {

	private Long activityId;
	private String name;
	private String description;
	private String content;
	private Date startTime;
	private Date endTime;
	private int hot;
	private String logo;

	public Activity() {
	}

	public Activity(String name, String content, Date startTime, Date endTime, int hot) {
		this.name = name;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hot = hot;
	}

	public Activity(String name, String description, String content, Date startTime, Date endTime, int hot,
			String logo) {
		this.name = name;
		this.description = description;
		this.content = content;
		this.startTime = startTime;
		this.endTime = endTime;
		this.hot = hot;
		this.logo = logo;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "activity_id", unique = true, nullable = false)
	public Long getActivityId() {
		return this.activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", length = 20)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "content", nullable = false, length = 20)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "start_time", nullable = false, length = 19)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "end_time", nullable = false, length = 19)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "hot", nullable = false)
	public int getHot() {
		return this.hot;
	}

	public void setHot(int hot) {
		this.hot = hot;
	}

	@Column(name = "logo", length = 20)
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}