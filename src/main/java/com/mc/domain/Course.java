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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Course generated by hbm2java
 */
@Entity
@Table(name = "course", catalog = "micro_course")
public class Course implements java.io.Serializable {

	private Long courseId;
	private User user;
	private Classify classify;
	private String name;
	private String description;
	private String level;
	private String teacherId;
	private String logo;
	private String duration;
	private int learnCount;
	private int updateTime;
	private int videoCount;
	private int exerciseCount;
	private int practiceCount;
	private String slogan;
	private String info;
	private String learnthing;
	private String status;
	private int inspectState;//审核情况 0：审核中 1：审核通过 2：审核失败
	private String inspectResult;//审核结果原因
	private Set<UserCourse> userCourses = new HashSet<UserCourse>(0);
	private Set<Step> steps = new HashSet<Step>(0);
	private Set<Chapter> chapters = new HashSet<Chapter>(0);
	private Set<StudyProgress> studyProgresses = new HashSet<StudyProgress>(0);
	private Set<StudyStatus> studyStatus = new HashSet<StudyStatus>(0);
	public Course() {
	}

	public Course(Classify classify, String name, String description, String level, String teacherId, int learnCount,
			int updateTime, int videoCount, int exerciseCount, int practiceCount, String status) {
		this.classify = classify;
		this.name = name;
		this.description = description;
		this.level = level;
		this.teacherId = teacherId;
		this.learnCount = learnCount;
		this.updateTime = updateTime;
		this.videoCount = videoCount;
		this.exerciseCount = exerciseCount;
		this.practiceCount = practiceCount;
		this.status = status;
	}

	public Course(User user, Classify classify, String name, String description, String level, String teacherId,
			String logo, String duration, int learnCount, int updateTime, int videoCount, int exerciseCount,
			int practiceCount, String slogan, String status, Set<UserCourse> userCourses, Set<Step> steps,
			Set<Chapter> chapters) {
		this.user = user;
		this.classify = classify;
		this.name = name;
		this.description = description;
		this.level = level;
		this.teacherId = teacherId;
		this.logo = logo;
		this.duration = duration;
		this.learnCount = learnCount;
		this.updateTime = updateTime;
		this.videoCount = videoCount;
		this.exerciseCount = exerciseCount;
		this.practiceCount = practiceCount;
		this.slogan = slogan;
		this.status = status;
		this.userCourses = userCourses;
		this.steps = steps;
		this.chapters = chapters;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "course_id", unique = true, nullable = false)
	public Long getCourseId() {
		return this.courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "classify_id", nullable = false)
	public Classify getClassify() {
		return this.classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	@Column(name = "name", nullable = false, length = 100)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description", nullable = false, length = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "level", nullable = false)
	public String getLevel() {
		return this.level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	@Column(name = "teacher_id", nullable = false, length = 20)
	public String getTeacherId() {
		return this.teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	@Column(name = "logo", length = 20)
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Column(name = "duration", length = 20)
	public String getDuration() {
		return this.duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	@Column(name = "learn_count", nullable = false)
	public int getLearnCount() {
		return this.learnCount;
	}

	public void setLearnCount(int learnCount) {
		this.learnCount = learnCount;
	}

	@Column(name = "update_time", nullable = false)
	public int getUpdateTime() {
		return this.updateTime;
	}

	public void setUpdateTime(int updateTime) {
		this.updateTime = updateTime;
	}

	@Column(name = "video_count", nullable = false)
	public int getVideoCount() {
		return this.videoCount;
	}

	public void setVideoCount(int videoCount) {
		this.videoCount = videoCount;
	}

	@Column(name = "exercise_count", nullable = false)
	public int getExerciseCount() {
		return this.exerciseCount;
	}

	public void setExerciseCount(int exerciseCount) {
		this.exerciseCount = exerciseCount;
	}

	@Column(name = "practice_count", nullable = false)
	public int getPracticeCount() {
		return this.practiceCount;
	}

	public void setPracticeCount(int practiceCount) {
		this.practiceCount = practiceCount;
	}

	@Column(name = "slogan", length = 20)
	public String getSlogan() {
		return this.slogan;
	}

	public void setSlogan(String slogan) {
		this.slogan = slogan;
	}

	@Column(name = "status", nullable = false)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	public Set<UserCourse> getUserCourses() {
		return this.userCourses;
	}

	public void setUserCourses(Set<UserCourse> userCourses) {
		this.userCourses = userCourses;
	}

	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "courses")
	public Set<Step> getSteps() {
		return this.steps;
	}

	public void setSteps(Set<Step> steps) {
		this.steps = steps;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	public Set<Chapter> getChapters() {
		return this.chapters;
	}

	public void setChapters(Set<Chapter> chapters) {
		this.chapters = chapters;
	}
	@Column(name = "info", length = 100)
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	@Column(name = "learnthing", length = 100)
	public String getLearnthing() {
		return learnthing;
	}

	public void setLearnthing(String learnthing) {
		this.learnthing = learnthing;
	}

	public int getInspectState() {
		return inspectState;
	}

	public void setInspectState(int inspectState) {
		this.inspectState = inspectState;
	}

	public String getInspectResult() {
		return inspectResult;
	}

	public void setInspectResult(String inspectResult) {
		this.inspectResult = inspectResult;
	}
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	public Set<StudyProgress> getStudyProgresses() {
		return studyProgresses;
	}

	public void setStudyProgresses(Set<StudyProgress> studyProgresses) {
		this.studyProgresses = studyProgresses;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "course")
	public Set<StudyStatus> getStudyStatus() {
		return studyStatus;
	}

	public void setStudyStatus(Set<StudyStatus> studyStatus) {
		this.studyStatus = studyStatus;
	}

}
