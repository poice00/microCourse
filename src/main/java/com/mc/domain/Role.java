package com.mc.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

import org.springframework.core.annotation.Order;
/**
 * 角色
 * 
 * @author tyg
 * 
 */
@Entity
public class Role implements Serializable{
	private long roleId;
	private String name;
	private String description;
	private Set<User> users = new HashSet<User>();

	private Set<Privilege> privileges = new HashSet<Privilege>();
	
	@Id
	@GeneratedValue
	public long getRoleId() {
		return roleId;
	}

	public void setRoleId(long roleId) {
		this.roleId = roleId;
	}

	@OneToMany(mappedBy="role")
	public Set<User> getUsers() {
		return users;
	}

	

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public String getName() {
		return name;
	}

	
	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	@ManyToMany(fetch=FetchType.EAGER)
	@OrderBy("id ASC")
	@JoinTable(name="role_privilege",
			joinColumns={@JoinColumn(name="roleId")},
			inverseJoinColumns={@JoinColumn(name="privilegerId")}
				)
	public Set<Privilege> getPrivilege() {
		return privileges;
	}

	public void setPrivilege(Set<Privilege> privileges) {
		this.privileges = privileges;
	}

	
	

}
