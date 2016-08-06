package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Orientation generated by hbm2java
 */
@Entity
@Table(name = "orientation", catalog = "micro_course")
public class Orientation implements java.io.Serializable {

	private Long orientationId;
	private String name;
	private String hrefName;
	private Set<Classify> classifies = new HashSet<Classify>(0);

	public Orientation() {
	}

	public Orientation(String name) {
		this.name = name;
	}

	public Orientation(String name, Set<Classify> classifies) {
		this.name = name;
		this.classifies = classifies;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "orientation_id", unique = true, nullable = false)
	public Long getOrientationId() {
		return this.orientationId;
	}

	public void setOrientationId(Long orientationId) {
		this.orientationId = orientationId;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "orientation")
	public Set<Classify> getClassifies() {
		return this.classifies;
	}

	public void setClassifies(Set<Classify> classifies) {
		this.classifies = classifies;
	}

	public String getHrefName() {
		return hrefName;
	}

	public void setHrefName(String hrefName) {
		this.hrefName = hrefName;
	}

}