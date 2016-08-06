package com.mc.serviceImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.mc.base.DaoSupportImpl;
import com.mc.domain.Chapter;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.domain.Question;
import com.mc.domain.Reply;
import com.mc.service.ChapterService;
import com.mc.service.CourseService;
import com.mc.service.ReplyService;
@SuppressWarnings("unchecked")
@Service
@Transactional
public class ReplyServiceImpl extends DaoSupportImpl<Reply>implements ReplyService {

	public List<Reply> findByQuestion(Question question) {
		List<Reply> replies=getSession().createSQLQuery("select * from reply where question_id = ?")
				.addEntity(Reply.class)
				.setParameter(0,question.getQuestionId())
				.list();
		return replies;
	}

	public Reply newestReply(Question question) {
		List<Reply> replies=getSession().createSQLQuery
				("select * from reply where question_id = ? order by post_time desc")
				.addEntity(Reply.class)
				.setParameter(0, question.getQuestionId())
				.list();
		return replies.get(0);
	}


	
}
