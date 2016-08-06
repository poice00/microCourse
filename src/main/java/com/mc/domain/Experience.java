package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Experience generated by hbm2java
 */
@Entity
@Table(name = "experience", catalog = "micro_course")
public class Experience implements java.io.Serializable {

	private Long experienceId;
	private User user;
	private String item;
	private int number;
	private Date time;
	private Integer yesterdayRank;

	public Experience() {
	}

	public Experience(User user, String item, int number, Date time) {
		this.user = user;
		this.item = item;
		this.number = number;
		this.time = time;
	}

	public Experience(User user, String item, int number, Date time, Integer yesterdayRank) {
		this.user = user;
		this.item = item;
		this.number = number;
		this.time = time;
		this.yesterdayRank = yesterdayRank;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "experience_id", unique = true, nullable = false)
	public Long getExperienceId() {
		return this.experienceId;
	}

	public void setExperienceId(Long experienceId) {
		this.experienceId = experienceId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "item", nullable = false, length = 20)
	public String getItem() {
		return this.item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	@Column(name = "number", nullable = false, length = 18)
	public int getNumber() {
		return this.number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "time", nullable = false, length = 19)
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	@Column(name = "yesterday_rank")
	public Integer getYesterdayRank() {
		return this.yesterdayRank;
	}

	public void setYesterdayRank(Integer yesterdayRank) {
		this.yesterdayRank = yesterdayRank;
	}

}