package com.mc.domain;

public class SimilarQuestion {
	
//	id:208236, title:177, description:hleo, finished:1,last_t_id:1,answers:9}
	private long id;
	private String title;
	private String description;
	private int finished;
	private int last_t_id;
	private int answers;
	
	/**
	 * @desc
	 * @param id
	 * @param title
	 * @param description
	 * @param finished
	 * @param last_t_id
	 * @param answers
	 * @author yanbaobin@yeah.net
	 * Sep 29, 2015 9:27:30 AM
	 */
	public SimilarQuestion(long id, String title, String description, int finished, int last_t_id, int answers) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.finished = finished;
		this.last_t_id = last_t_id;
		this.answers = answers;
	}
	
	public SimilarQuestion() {
		// TODO Auto-generated constructor stub
	}

	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getdescription() {
		return description;
	}
	public void setdescription(String description) {
		this.description = description;
	}
	public int getFinished() {
		return finished;
	}
	public void setFinished(int finished) {
		this.finished = finished;
	}
	public int getLast_t_id() {
		return last_t_id;
	}
	public void setLast_t_id(int last_t_id) {
		this.last_t_id = last_t_id;
	}
	public int getAnswers() {
		return answers;
	}
	public void setAnswers(int answers) {
		this.answers = answers;
	}
}
