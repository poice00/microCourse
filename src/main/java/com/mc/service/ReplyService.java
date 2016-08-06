package com.mc.service;

import java.util.List;

import com.mc.base.DaoSupport;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.Question;
import com.mc.domain.Reply;

public interface ReplyService extends DaoSupport<Reply> {

	List<Reply> findByQuestion(Question question);

	Reply newestReply(Question question);

}
