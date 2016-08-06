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
 * Tag generated by hbm2java
 */
@Entity
@Table(name = "tag", catalog = "micro_course")
public class Tag implements java.io.Serializable {

	private Long tagId;
	private String name;
	private long usedTimes;
	private Set<ObjectTag> objectTags = new HashSet<ObjectTag>(0);

	public Tag() {
	}

	public Tag(String name) {
		this.name = name;
	}

	public Tag(String name, Set<ObjectTag> objectTags) {
		this.name = name;
		this.objectTags = objectTags;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "tag_id", unique = true, nullable = false)
	public Long getTagId() {
		return this.tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	@Column(name = "name", nullable = false, length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tag")
	public Set<ObjectTag> getObjectTags() {
		return this.objectTags;
	}

	public void setObjectTags(Set<ObjectTag> objectTags) {
		this.objectTags = objectTags;
	}
	
	@Column(name="used_times")
	public long getusedTimes() {
		return usedTimes;
	}

	public void setUsedTimes(long usedTimes) {
		this.usedTimes = usedTimes;
	}

}
