package com.mc.domain;
// Generated 2015-9-15 12:29:23 by Hibernate Tools 4.0.0

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * OpusGuide generated by hbm2java
 */
@Entity
@Table(name = "opus_guide", catalog = "micro_course")
public class OpusGuide implements java.io.Serializable {

	private Long opusGuideId;
	private Opus opus;
	private int step;
	private String content;

	public OpusGuide() {
	}

	public OpusGuide(Opus opus, int step) {
		this.opus = opus;
		this.step = step;
	}

	public OpusGuide(Opus opus, int step, String content) {
		this.opus = opus;
		this.step = step;
		this.content = content;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "opus_guide_id", unique = true, nullable = false)
	public Long getOpusGuideId() {
		return this.opusGuideId;
	}

	public void setOpusGuideId(Long opusGuideId) {
		this.opusGuideId = opusGuideId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "opus_id", nullable = false)
	public Opus getOpus() {
		return this.opus;
	}

	public void setOpus(Opus opus) {
		this.opus = opus;
	}

	@Column(name = "step", nullable = false)
	public int getStep() {
		return this.step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	@Column(name = "content", length = 20)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
