package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * UserPlanId generated by hbm2java
 */
@Embeddable
public class UserPlanId implements java.io.Serializable {

	private long userId;
	private long planId;

	public UserPlanId() {
	}

	public UserPlanId(long userId, long planId) {
		this.userId = userId;
		this.planId = planId;
	}

	@Column(name = "user_id", nullable = false)
	public long getUserId() {
		return this.userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	@Column(name = "plan_id", nullable = false)
	public long getPlanId() {
		return this.planId;
	}

	public void setPlanId(long planId) {
		this.planId = planId;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof UserPlanId))
			return false;
		UserPlanId castOther = (UserPlanId) other;

		return (this.getUserId() == castOther.getUserId()) && (this.getPlanId() == castOther.getPlanId());
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (int) this.getUserId();
		result = 37 * result + (int) this.getPlanId();
		return result;
	}

}
