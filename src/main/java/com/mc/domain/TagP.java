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
 * 
 * @author tyg
 * 
 */
@Entity
public class TagP implements Serializable{
	private long id;
	private String name;
	private String description;
	private Set<Plan> plans = new HashSet<Plan>();

	
	@Id
	@GeneratedValue
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
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
	@ManyToMany
	@JoinTable(name="plan_tagP",
			joinColumns={@JoinColumn(name="tagId")},
			inverseJoinColumns={@JoinColumn(name="planId")}
				)
	public Set<Plan> getPlans() {
		return plans;
	}

	public void setPlans(Set<Plan> plans) {
		this.plans = plans;
	}

	
	
	

}
