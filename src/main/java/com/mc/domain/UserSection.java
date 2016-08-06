package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Activity generated by hbm2java
 */
@Entity
@Table(name = "UserSection", catalog = "micro_course")
public class UserSection implements java.io.Serializable {

	private Long id;
	private int type;
	private Date lastLearnTime;
	private int lastPlayTime;
	private User user;
	private Section section;
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getLastLearnTime() {
		return lastLearnTime;
	}
	public void setLastLearnTime(Date lastLearnTime) {
		this.lastLearnTime = lastLearnTime;
	}
	@ManyToOne
	@JoinColumn(name="userId")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	@JoinColumn(name="sectionId")
	public Section getSection() {
		return section;
	}
	public void setSection(Section section) {
		this.section = section;
	}
	public int getLastPlayTime() {
		return lastPlayTime;
	}
	public void setLastPlayTime(int lastPlayTime) {
		this.lastPlayTime = lastPlayTime;
	}
	
	

}