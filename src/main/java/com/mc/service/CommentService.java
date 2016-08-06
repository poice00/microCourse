package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Comment;
import com.mc.domain.Section;

public interface CommentService extends DaoSupport<Comment> {

	List<Comment> findBySection(Section section);
	
}
