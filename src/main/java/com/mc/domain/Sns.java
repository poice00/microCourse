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
 * Sns generated by hbm2java
 */
@Entity
@Table(name = "sns", catalog = "micro_course")
public class Sns implements java.io.Serializable {

	private long snsId; 
	private long userId;
	private long objectId;
	private String content;
	private Date time;
	private long behaviorType;
	private long objectType;

	public Sns() {
	}

	public Sns(long userId, long objectId, Date time, long behaviorType, long objectType) {
		this.userId = userId;
		this.objectId = objectId;
		this.time = time;
		this.behaviorType = behaviorType;
		this.objectType = objectType;
	}

	public Sns(long userId, long objectId, String content, Date time, long behaviorType, long objectType) {
		this.userId = userId;
		this.objectId = objectId;
		this.content = content;
		this.time = time;
		this.behaviorType = behaviorType;
		this.objectType = objectType;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "sns_id", unique = true, nullable = false)
	public Long getSnsId() {
		return this.snsId;
	}

	public void setSnsId(Long snsId) {
		this.snsId = snsId;
	}

	@Column(name = "user_id", nullable = false, length = 20)
	public long getUserId() {
		return this.userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	@Column(name = "object_id", nullable = false, length = 20)
	public long getObjectId() {
		return this.objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}

	@Column(name = "content", length = 16777215)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", nullable = false, length = 19)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "behavior_type", nullable = false, length = 20)
	public long getBehaviorType() {
		return this.behaviorType;
	}

	public void setBehaviorType(long behaviorType) {
		this.behaviorType = behaviorType;
	}

	@Column(name = "object_type", nullable = false, length = 20)
	public long getObjectType() {
		return this.objectType;
	}

	public void setObjectType(long objectType) {
		this.objectType = objectType;
	}

}
