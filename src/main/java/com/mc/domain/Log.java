package com.mc.domain;

import static javax.persistence.GenerationType.IDENTITY;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Type;

@Entity
public class Log implements Serializable {
	
	private long id ;
	private String description;
    private String method;
    private String type;
    private String requestIp;
    private String ExceptionCode;
    private String ExceptionDetail;
    private String params;
    
    private Date createDate;
    private User createBy;
    
    
    @Id
    @GeneratedValue(strategy = IDENTITY)
    public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRequestIp() {
		return requestIp;
	}
	public void setRequestIp(String requestIp) {
		this.requestIp = requestIp;
	}
	public String getExceptionCode() {
		return ExceptionCode;
	}
	public void setExceptionCode(String exceptionCode) {
		ExceptionCode = exceptionCode;
	}
	public String getExceptionDetail() {
		return ExceptionDetail;
	}
	public void setExceptionDetail(String exceptionDetail) {
		ExceptionDetail = exceptionDetail;
	}
	@Type(type="text")
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	@ManyToOne
	@JoinColumn(name="userId")
	public User getCreateBy() {
		return createBy;
	}
	public void setCreateBy(User createBy) {
		this.createBy = createBy;
	}
	
	
	
    
}
