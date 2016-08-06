package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

/**
 * Settings generated by hbm2java
 */
@Entity
@Table(name = "settings", catalog = "micro_course")
public class Settings implements java.io.Serializable {

	private long userId;
	private User user;
	private String clarity;
	private String speed;
	private int volume;
	private String defaultPlayer;
	private int autonext;

	public Settings() {
	}

	public Settings(User user, int volume, int autonext) {
		this.user = user;
		this.volume = volume;
		this.autonext = autonext;
	}

	public Settings(User user, String clarity, String speed, int volume, String defaultPlayer, int autonext) {
		this.user = user;
		this.clarity = clarity;
		this.speed = speed;
		this.volume = volume;
		this.defaultPlayer = defaultPlayer;
		this.autonext = autonext;
	}

	@GenericGenerator(name = "generator", strategy = "foreign", parameters = @Parameter(name = "property", value = "user") )
	@Id
	@GeneratedValue(generator = "generator")

	@Column(name = "user_id", unique = true, nullable = false)
	public long getUserId() {
		return this.userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "clarity", length = 20)
	public String getClarity() {
		return this.clarity;
	}

	public void setClarity(String clarity) {
		this.clarity = clarity;
	}

	@Column(name = "speed", length = 20)
	public String getSpeed() {
		return this.speed;
	}

	public void setSpeed(String speed) {
		this.speed = speed;
	}

	@Column(name = "volume", nullable = false)
	public int getVolume() {
		return this.volume;
	}

	public void setVolume(int volume) {
		this.volume = volume;
	}

	@Column(name = "default_player", length = 20)
	public String getDefaultPlayer() {
		return this.defaultPlayer;
	}

	public void setDefaultPlayer(String defaultPlayer) {
		this.defaultPlayer = defaultPlayer;
	}

	@Column(name = "autonext", nullable = false)
	public int getAutonext() {
		return this.autonext;
	}

	public void setAutonext(int autonext) {
		this.autonext = autonext;
	}

}
