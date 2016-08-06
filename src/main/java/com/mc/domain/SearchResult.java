package com.mc.domain;


import java.io.Serializable;

import org.hibernate.annotations.Type;

public class SearchResult implements Serializable {
	
	private String courseId;
	private String name;
	private String logo;
	private String description;
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
    
    
	
	
	
    
}
