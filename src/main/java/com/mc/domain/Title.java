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
 * Title generated by hbm2java
 */
@Entity
@Table(name = "title", catalog = "micro_course")
public class Title implements java.io.Serializable {

	private Long titleId;
	private String name;
	private String description;
	private Set<User> users = new HashSet<User>(0);

	public Title() {
	}

	public Title(String name) {
		this.name = name;
	}

	public Title(String name, String description, Set<User> users) {
		this.name = name;
		this.description = description;
		this.users = users;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "title_id", unique = true, nullable = false)
	public Long getTitleId() {
		return this.titleId;
	}

	public void setTitleId(Long titleId) {
		this.titleId = titleId;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "title")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
