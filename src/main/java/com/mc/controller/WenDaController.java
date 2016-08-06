package com.mc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mc.domain.CommentOfReply;
import com.mc.domain.Experience;
import com.mc.domain.SimilarQuestion;
import com.mc.domain.Sns;
import com.mc.domain.Tag;
import com.mc.domain.Topic;
import com.mc.domain.Type;
import com.mc.domain.User;
import com.mc.domain.Wenda;
import com.mc.service.ExperienceService;
import com.mc.service.ObjectTagService;
import com.mc.service.SnsService;
import com.mc.service.TopicService;
import com.mc.service.TypeService;
import com.mc.service.UserService;
import com.mc.util.Compute;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/wenda")
public class WenDaController  {
	@Resource
	private UserService userService;
	@Resource
	private TopicService topicService;
	@Resource
	private TypeService typeService;
	@Resource
	private ObjectTagService objectTagService;
	@Resource
	private SnsService snsService;
	@Resource
	private ExperienceService experienceService;
	
	/*问答列表*/
	@RequestMapping("/{pageNumber}")
	public String list(@PathVariable("pageNumber")int page, Model model){
		
		/* 
		 * 需要准备的数据
		 * 题主头像，昵称，ID
		 * 是否置顶，是否有人回答，是否采纳答案
		 * 标题、回答数、浏览数、
		 * 提问时间、标签
		 * 最赞回答的头像、昵称、回复内容
		 */
		List<Topic> topicList = topicService.findAll();
		List<Wenda> wendaList = new ArrayList<Wenda>();		//所有问题
		List<Wenda> topWenda = new ArrayList<Wenda>();		//保存被置顶的问题,最后插在所有问题的前面
		
		for (Topic topic : topicList) {
		 
			/*问题信息*/
			long topicId = topic.getTopicId();
			String title = topic.getTitle();
			int browseCount = topic.getBrowseCount();
			int answerCount = topicService.replyCount(topicId);
			boolean isTop = topic.isTop();
			long betsAnswer = topic.getBestAnswer() == null ? 0 : topic.getBestAnswer();
			String elapse = Compute.timeDiff(topic.getInitiatingTime());
			 
			/*问题的标签*/
			List<Tag> tags = objectTagService.findTagsByObject(topicId, typeService.getByName("问题").getTypeId());
			 
//			/*最赞回答*/
//			Sns snsThumbsUp =new Sns();		//空指针异常，唉
//			if(0 < answerCount){
//				List<Sns> replies = topicService.findAllReplyById(topicId);
//				snsThumbsUp = replies.get(0);
//			    replies.remove(0);
//				 
//				long typeOfSns = typeService.getByName("sns").getTypeId();
//				long typeOfThumbsUP = typeService.getByName("赞").getTypeId();
//				int thumbsUpCount = snsService.getSocialBehaviorCountById(snsThumbsUp.getSnsId(), typeOfSns, typeOfThumbsUP);
//				int count = 0;
//				 
//				for (Sns sns : replies) {
//					count = snsService.getSocialBehaviorCountById(sns.getSnsId(), typeOfSns, typeOfThumbsUP);
//					if(count > thumbsUpCount)
//						snsThumbsUp = sns;
//				}
//			}
//			  
//			/*题主*/
//			User tiZhu = topic.getUser();
//			long tiZhuId = tiZhu.getUserId();
//			String nickname = tiZhu.getNickname();
//			String avatar = tiZhu.getAvatar();
			 
			/*============================================上面的写法太挫了====================================================*/
			User statusUser = new User();
			Sns statusSns = new Sns();
			
			/*判断属于那种状态*/
			int status = 0;			//没有回答
			if(0 != betsAnswer){
				status = 1;			//已采纳答案
				statusSns = snsService.getById(topic.getBestAnswer());
			}
			else{
				int thumbsUpCount = 0;
				List<Sns> snsList = topicService.findAllReplyById(topic.getTopicId());
				 
				long typeOfSns = typeService.getByName("sns").getTypeId();   
				long typeOfThumbsUP = typeService.getByName("赞").getTypeId();
				int count = 0;
				 
				for (Sns sns : snsList) {
					count = snsService.getSocialBehaviorCountById(sns.getSnsId(), typeOfSns, typeOfThumbsUP);
					
					if(count != 0 && count >= thumbsUpCount){		//等号，表示如果两个点赞次数相同，则选择较新的那个
						thumbsUpCount = count;
						statusSns = sns;
					}
				}
				
				if(thumbsUpCount > 0)
					status = 2;											//最赞回答
				else if(answerCount > 0){
					status = 3;											//最新回答
					statusSns = snsList.get(snsList.size() - 1);
				}
			}
			
			Wenda wenda = new Wenda(topic, answerCount, elapse, tags, status);
			if(0 != status){
				statusUser = userService.getById(statusSns.getUserId());
				
				//去掉p标签
				String content = statusSns.getContent();
				int index = content.indexOf("<p>");
				if(-1 != index){
					content = content.substring(3, content.length() - 4);
					statusSns.setContent(content);
				}
				
				wenda.setStatusSns(statusSns);
				wenda.setStatusUser(statusUser);
			}
			
			if(topic.isTop())
				topWenda.add(wenda);
			else
				wendaList.add(wenda);
		}
		
		//反转wendaList，使其按时间从降序排序
		Collections.reverse(wendaList);
		
		/*把置顶的问题补插在所有问题的前面*/
		for (Wenda wenda : topWenda)
			wendaList.add(0, wenda);
		
		/*分页信息*/
		int pageCount = wendaList.size() / 10 + (wendaList.size() % 10 == 0 ? 0 : 1);
		if(page > pageCount - 1)
			return "/common/not_found";
		
		List<Wenda> show = new ArrayList<Wenda>();
		int count = 0,i = page * 10;
		while(count < 10 && i < wendaList.size()){
			show.add(wendaList.get(i));
			count++;
			i++;
		}
		
		model.addAttribute("wendaList", show);
		model.addAttribute("page",pageCount);
		
		/*热门标签*/
		List<Tag> top20Tag = objectTagService.findTop20Tag();
		model.addAttribute("top20Tag", top20Tag);
		 
		return "/wenda/list";
	}
	 
	 /*问题详情*/
	@RequestMapping("/detail/{topicId}")
	public String detail(@PathVariable("topicId")Long topicId, Model model, HttpSession session){
		Topic topic = topicService.getById(topicId);
		
		if(topic == null)
			return "/common/not_found";
		
		topic.setBrowseCount(topic.getBrowseCount() + 1);		//浏览次数加1
		model.addAttribute("topic", topic);
		
		/*String test = "{'id':1,'name':'ybb'}";
		JSONObject json = JSONObject.fromObject(test);
		JSONObject json1 = JSONObject.fromObject(test);				//尝试用list保存json
		List<JSONObject> ts = new ArrayList<JSONObject>();
		ts.add(json);
		ts.add(json1);
		model.addAttribute("t",ts);*/
		
		
		/*===========================================================设置状态位=============================================*/
		
		int replyCount = topicService.replyCount(topic.getTopicId());
		long bestReplyId = topic.getBestAnswer() == null ? 0 : topic.getBestAnswer();
		
		User tizhu = topic.getUser();
		User currentUser = (User)session.getAttribute("currentUser");		//细节问题，空指针异常
		
		boolean currentUserIsTizhu = (currentUser == null) ? false : tizhu.getUserId().equals(currentUser.getUserId());
		
		/*关注状态*/
		String follow = "添加关注";
		
		if(null != currentUser){
			long typeOfQuestion = typeService.getByName("问题").getTypeId();
			long typeOfFollow = typeService.getByName("关注").getTypeId();
			
			List<Sns> snsList = snsService.getSpecial(currentUser.getUserId(), topicId, typeOfQuestion, typeOfFollow);
			
			if(0 < snsList.size())
				follow = "取消关注";
		}
		
		/*当前页所在位置*/
		Type t = typeService.getById(Long.parseLong(topic.getSource()));
		String location = t.getName();
		
		Map<String, String> status = new HashMap<String, String>();
		status.put("replyCount", replyCount + "");						//回复数，强制转换成string
		status.put("bestReplyId", bestReplyId + "");					//是否设置了最佳答案
		status.put("currentUserIsTizhu", currentUserIsTizhu + "");      //当前用户是否是题主
		status.put("tizhuAvatar", tizhu.getAvatar());					//题主头像
		status.put("tizhuNickName", tizhu.getNickname());				//题主昵称
		status.put("elapse", timeDiff(topic.getInitiatingTime()));		//发布时间，形如xx秒前、xx小时前、xx分钟前。。。
		status.put("location", location);								//页面导航，技术分享or技术问答
		status.put("follow", follow);									//添加关注or取消关注
		
		model.addAttribute("status", status);
		
		/*查询问题的标签*/
		List<Tag> tags = objectTagService.findTagsByObject(topicId, typeService.getByName("问题").getTypeId());
		model.addAttribute("tags", tags);
		
		/* ================================================查询问题的所有回复==================================================
		 * 用json保存
		 * 格式avatar、nickname、content、点赞个数、发布时间
		 */
		List<Sns> snsList = topicService.findAllReplyById(topicId);
		
		List<JSONObject> replyList = new ArrayList<JSONObject>();
		JSONObject bestAnswer = new JSONObject();					//保存最佳答案
		
		StringBuilder sb = new StringBuilder("{");
		for (Sns sns : snsList) {
			
			sb.append("'snsId':").append(sns.getSnsId()).append(",");
			
			User replyUser = userService.getById(sns.getUserId());
			
			/*处理头像字符串，截取其中的用户名，防止转义字符(如u)影响json的解析*/
			String avatar = replyUser.getAvatar();
			if(avatar == null)
				avatar = "default";
			else{
				int index1 = avatar.indexOf("upload");								
				int index2 = avatar.lastIndexOf('.');
				avatar = avatar.substring(index1 + 7, index2 - 7);		//upload/XXX/avatar.jpg,正好加7，减7
			}
			
			/*回复人ID,头像和昵称*/
			sb.append("'userId':").append(sns.getUserId()).append(",")
			.append("'avatar':'").append(avatar).append("',")
			.append("'nickname':'").append(replyUser.getNickname()).append("',");
			
			long typeOfSns= typeService.getByName("sns").getTypeId();
			long typeOfThumbsUp = typeService.getByName("赞").getTypeId();
			
			/*内容、发布时间、点赞次数、是否是题主*/
			sb.append("'content':'").append(sns.getContent()).append("',")
			.append("'elapse':'").append(timeDiff(sns.getTime())).append("',")
			.append("'thumbUps':").append(snsService.getSocialBehaviorCountById(sns.getSnsId(), typeOfSns, typeOfThumbsUp)).append(",")
			.append("'isTizhu':").append(currentUser == null ? false : replyUser.getUserId().equals(currentUser.getUserId())).append(",");
			
			/*当前用户对该回复是否点过赞*/
			int hasThumbsUp = 0;
			if(null != currentUser)
				hasThumbsUp = snsService.getSpecial(currentUser.getUserId(), sns.getSnsId(), typeOfSns, typeOfThumbsUp).size();
			
			sb.append("'hasThumbsUp':").append(hasThumbsUp).append(",");
			
			/*回复*/
			List<CommentOfReply> corList = snsService.getCommentsById(sns.getSnsId());
			int countOfReplies = corList.size();
			
			if(countOfReplies > 3)
				while(corList.size() > 3)
					corList.remove(3);
			
			sb.append("'replies':").append(JSONArray.fromObject(corList)).append(",")		//可以直接生成json格式的数据，即使有双引号
			  .append("'countOfReplies':").append(countOfReplies)
			  .append("}");
			
			/* 判断是不是最佳答案
			 * 最佳答案需要第一个保存
			 * 这里的思路是遇到最佳答案，先不加入list，
			 * list赋值完成后，在list的0号位置加上该答案
			 */
			if(bestReplyId == sns.getSnsId())
				bestAnswer = JSONObject.fromObject(sb.toString());
			else
				replyList.add(JSONObject.fromObject(sb.toString()));
			
			System.out.println(sb.toString());
			
			sb.replace(1, sb.length(), "");
			
		}
		
		/*最佳答案保存在list的第一个*/
		if(0 != bestReplyId)
			replyList.add(0, bestAnswer);
		
		model.addAttribute("replyList", replyList);
		
		/*=====================================================热门标签=====================================================*/
		
		List<Tag> top20Tag = objectTagService.findTop20Tag();
		model.addAttribute("top20Tag", top20Tag);
		
		return "/wenda/detail";
		
	}
	
	/*发问题*/
	@RequestMapping("/publish")
	public String publish(Model model){
		List<Tag> tagList = objectTagService.findAllTag();
		List<Tag> top20Tag = objectTagService.findTop20Tag();
		
		model.addAttribute("tagList",tagList);
		model.addAttribute("top20Tag",top20Tag);
		
		return "/wenda/publish";
	}
	
	/*关注问题*/
	@RequestMapping("/follow")
	public void follow(String id, String act, HttpSession session, HttpServletResponse response){
		long typeOfQuestion = typeService.getByName("问题").getTypeId();
		long typeOfFollow = typeService.getByName("关注").getTypeId();
		
		User currentUser = (User)session.getAttribute("currentUser");
		long userId = currentUser.getUserId();
		
		/*添加关注*/
		if(("add").equals(act)){
			Sns sns = new Sns(userId, Long.parseLong(id), new Date(), typeOfFollow, typeOfQuestion);
			snsService.save(sns);
		}
		
		/*取消关注*/
		else{
			List<Sns> snsList = snsService.getSpecial(userId, Long.parseLong(id), typeOfQuestion, typeOfFollow);
			if(snsList.size() > 0){
				Sns sns = snsList.get(0);
				snsService.delete(sns.getSnsId());
			}
		}
		
		try {
			response.getWriter().write(JSONObject.fromObject("{'result':0}").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*修改原问题*/
	@RequestMapping("/edit_wenda")
	public void editQuestion(String title, String content, long id, HttpServletResponse response){
		Topic topic = topicService.getById(id);
		topic.setTitle(title);
		topic.setContent(content);
		
		topicService.update(topic);
		
		try {
			response.getWriter().write(JSONObject.fromObject("{'result':0}").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*采纳答案*/
	@RequestMapping("/adopt_reply")
	public void adoptReply(HttpServletRequest request,HttpServletResponse response){
		JSONObject json = JSONObject.fromObject(request.getParameter("data"));
		
		Topic topic = topicService.getById(json.getLong("ques_id"));
		topic.setBestAnswer(json.getLong("reply_id"));
		
		topicService.update(topic);
		
		/*加经验值*/
		Sns sns = snsService.getById(json.getLong("reply_id"));
		User user = userService.getById(sns.getUserId());
		long typeOfAdopt = typeService.getByName("回答被采纳为最佳答案").getTypeId();
		
		Experience experience = new Experience(user, typeOfAdopt + ":" + sns.getSnsId(), 20, new Date());
		experienceService.save(experience);
		
		try {
			response.getWriter().write(JSONObject.fromObject("{'result':0}").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*保存发布的问题*/
	@RequestMapping("/save")
	public void save(HttpSession session,HttpServletRequest request,HttpServletResponse response){
		
		JSONObject jsonRqueset = JSONObject.fromObject(request.getParameter("topic"));
		
		String code = (String) jsonRqueset.get("verify");
		String captcha = (String) session.getAttribute("code");
		
		StringBuilder sb = new StringBuilder("{'result':");
		
		if(!code.toLowerCase().equals(captcha))
			sb.append("-103002,'msg':'验证码错误'}");
		else{
			/*存储话题到数据库*/
			long userId = (long)Integer.parseInt(jsonRqueset.get("user_id").toString());
			User user = userService.getById(userId);
			
			String title = jsonRqueset.get("title").toString();
			String content = jsonRqueset.get("content").toString();
			String source = jsonRqueset.get("cat_id").toString();
			
			Topic topic = new Topic(user,title,content,new Date(),source,0,false);
			topicService.save(topic);
			
			
			/*存储话题的标签*/
			String[] tags = jsonRqueset.get("label_ids").toString().split(",");
			long topicId = topic.getTopicId();
			long objectType = typeService.getByName("问题").getTypeId();
			
			for (String string : tags){
				objectTagService.addTagUsedTimesByOne((long)Integer.parseInt(string));
				topicService.saveTag((long)Integer.parseInt(string), topicId, objectType);
			}
			
			sb.append("0,'id':" + topic.getTopicId() + "}");
		}
		
		JSONObject jsonResponse = JSONObject.fromObject(sb.toString());
		try {
			response.getWriter().write(jsonResponse.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/*成功发布问题*/
	@RequestMapping("/publish_success/{topicId}")
	public String success(@PathVariable("topicId")long topicId, Model model){
		
		model.addAttribute("topicId", topicId);
		
		return "/wenda/publish_success";
	}
	
	/*我的问答*/
	@RequestMapping("/question")
	public String question(Model model,HttpSession session){
		User u = (User) session.getAttribute("currentUser");
		User user = userService.getById(u.getUserId());
		model.addAttribute("user", user);
		return "/wenda/question";
	}

	/**
	 * @desc 计算时间差，表示成X天，X小时前。。。
	 * @param date 发布时间
	 * @return String 
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 10:29:31 AM
	 */
	public static String timeDiff(Date date){
		
//		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		long diff = new Date().getTime() - date.getTime();
		
		long years = diff / (60 * 60 * 24 * 30 * 365 * 1000);
		diff %= (60 * 60 * 24 * 30 * 365 * 1000);
		long months = diff / (60 * 60 * 24 * 30 * 1000);
		diff %= (60 * 60 * 24 * 30 * 1000);
		long days = diff / (60 * 60 * 24 * 1000);
		diff %= (60 * 60 * 24 * 1000);
		long hours = diff / (60 * 60 * 1000);
		diff %= (60 * 60 * 1000);
		long minutes = diff / (60 * 1000);
		diff %= (60 * 1000);
		long seconds = diff / 1000;
		
		String elapse;
		if(0 != years)
			elapse = years + "年";
		else if(0 != months)
			elapse = months + "个月";
		else if(0 != days)
			elapse = days + "天";
		else if(0 != hours)
			elapse = hours + "小时";
		else if(0 != minutes)
			elapse = minutes + "分钟";
		else
			elapse = seconds + "秒";
		
		return elapse;
	}
	
	/**
	 * @desc 保存对问题的直接回复
	 * @param request
	 * @param response
	 * @author yanbaobin@yeah.net
	 * @date Sep 24, 2015 4:44:56 PM
	 */
	@RequestMapping("/save_reply")
	public void saveReply(HttpServletRequest request, HttpServletResponse response){
		String reply = request.getParameter("reply");
		JSONObject jsonReply = JSONObject.fromObject(reply);
		
		/*需要保存用户Id、问题Id、问题的类型号、回复的类型号*/
		long userId = jsonReply.getLong("user_id");
		long topicId = jsonReply.getLong("ques_id");
		String content = jsonReply.getString("content");
		long behaviorType = typeService.getByName("回复").getTypeId();
		long objectType = typeService.getByName("问题").getTypeId();
		
		Sns sns = new Sns(userId, topicId, content, new Date(), behaviorType, objectType);
		snsService.save(sns);
		
		JSONObject result = JSONObject.fromObject("{'result':0}");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*对问题的回答的回复*/
	@RequestMapping("/save_reply_comment")
	public void saveReplyComment(HttpServletRequest request, HttpServletResponse response, HttpSession session){
		String replyOfComment = request.getParameter("data");
		JSONObject json = JSONObject.fromObject(replyOfComment);
		System.out.println(json.toString());
		User user = (User) session.getAttribute("currentUser");
		if(user == null){
			
			try {
				response.getWriter().write("您离开时间太长，请重新登录");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		}
		
		long userId = user.getUserId();
		
		long commentId = json.getLong("reply_id");
		long typeOfSns = typeService.getByName("sns").getTypeId();
		long typeOfReply = typeService.getByName("回复").getTypeId();
		String content = json.getString("description");
		
		Sns sns = new Sns(userId, commentId, content, new Date(), typeOfReply, typeOfSns);
		snsService.save(sns);
		
		/*返回数据的格式
		 * create_time: "0秒前"
		 * description: "的确是的"
		 * from_pic: "http://img.mukewang.com/user/5333a1a90001c8d802000200-40-40.jpg"
		 * from_uid: 1226216
		 * from_username: "monkey_92"
		 * from_usertype: "1"
		 * to_pic: ""
		 * to_uid: 0
		 * to_username: ""
		 * to_usertype: ""
		 * msg: "成功"
		 * result: 0
		 */
		StringBuilder sb = new StringBuilder("{'data':{'create_time':'0秒前'");
		sb.append(",'description':'").append(content).append("'")
		  .append(",'from_pic':'").append(Compute.getLoignNameFromAvatarPath(userService.getById(userId).getAvatar())).append("'")
		  .append(",'from_uid':").append(userId)
		  .append(",'from_username':'").append(userService.getById(userId).getNickname()).append("'")
		  .append(",'from_usertype':1")
		  .append(",'to_pic':''");
		
		if(1 == json.getInt("level"))
			sb.append(",'to_uid':0").append(",'to_username':''");
		else
			sb.append(",'to_uid':").append(json.getInt("to_user_id"))
			  .append(",'to_username':'").append(json.getString("to_username")).append("'");
		
		sb.append(",'to_usertype':''")
		  .append("}")
		  .append(",'msg':'\u6210\u529f'")
		  .append(",'result':0}");
		
		try {
			response.getWriter().write(JSONObject.fromObject(sb.toString()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*点赞*/
	@RequestMapping("/support_reply")
	public void supportReply(HttpServletRequest request, HttpServletResponse response){
		String data = request.getParameter("data");
		JSONObject json = JSONObject.fromObject(data);
		
		long userId = json.getLong("user_id");
		long replyId = json.getLong("reply_id");
		long typeOfSns = typeService.getByName("sns").getTypeId();
		long typeOfThumbsUp = typeService.getByName("赞").getTypeId();
		
		Sns sns = new Sns(userId, replyId, new Date(), typeOfThumbsUp, typeOfSns);
		snsService.save(sns);
		
		try {
			response.getWriter().write(JSONObject.fromObject("{'result':0}").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*获取点赞人的头像和id*/
	@RequestMapping("/get_supply_nickname")
	public void getSupplyNickname(String id, HttpServletResponse response){
		long snsId = Long.parseLong(id);
		long typeOfSns = typeService.getByName("sns").getTypeId();
		long typeOfThumbsUp = typeService.getByName("赞").getTypeId();
				
		/*
		 * 响应数据格式
		 * "result":0,
		 * "data":[{"uid":"1226216","img":"http:\/\/img.mukewang.com\/5333a1a90001c8d802000200-100-100.jpg"}],
		 * "msg":"\u6210\u529f"
		*/
		StringBuilder sb = new StringBuilder("{'result':0,'msg':'\u6210\u529f','data':[");
		
		List<Sns> snsList = snsService.getBehavior(snsId, typeOfSns, typeOfThumbsUp);
		for (Sns sns : snsList) {
			User user = userService.getById(sns.getUserId());
			long uid = user.getUserId();
			String nickname = user.getNickname();
			String avatar = Compute.getLoignNameFromAvatarPath(user.getAvatar());
			
			sb.append("{'uid':").append(uid)
			  .append(",'nickname':'").append(nickname).append("'")
			  .append(",'img':'").append(avatar).append("'")
			  .append("},");
		}
		
		if(snsList.size() > 0)
			sb.replace(sb.length() - 1, sb.length(), "");	//去掉找最后一个多余的逗号
		sb.append("]}");
		
		
		System.out.println(sb.toString());
		
		try {
			response.getWriter().write(JSONObject.fromObject(sb.toString()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/*展开剩余回复*/
	@RequestMapping("/get_comment")
	public void getComment(String reply_id, HttpServletResponse response){
		List<CommentOfReply> snsComments = snsService.getCommentsById(Long.parseLong(reply_id));
		
//		响应数据格式
//		<div class="qa-reply-item" data-rid="94986">
//		    <a class="qa-reply-item-author" href="/myclub/otherquestion?uid=1090974" title="Lang0029">
//				<img src='http://img.mukewang.com/user/55d84a0c0001a9bc09600800-40-40.jpg' width='40' height='40' />
//			</a>
//		    <div class="qa-reply-item-inner">
//		        <p>
//	            	<a href="/myclub/otherquestion?uid=1090974" class="qa-reply-nick">Lang0029</a>
//					回复 <a href="/myclub/otherquestion?uid=2248061" class="qa-reply-nick">无动于衷丶碎冰</a>：
//		        </p>
//		        <p class="q-reply-item-c">就是，赞同</p>
//		        <div class="qa-reply-item-foot clearfix">
//		            <span class="reply-item-index r">#5</span>
//		            <span>2015-09-17 10:05:16</span>
//		            <span class="qa-reply-item-reply js-reply-item-reply" data-uid="1090974|Lang0029">
//						<i class="icon-resp"></i>回复
//					</span>
//		        </div>
//		    </div>
//	    </div>
		
		StringBuilder sb = new StringBuilder();
		
		for (int i =3; i < snsComments.size(); i++) {
			CommentOfReply cor = snsComments.get(i);
			
			sb.append("<div class='qa-reply-item' data-rid='").append(reply_id).append("'>")
			  .append("    <a class='qa-reply-item-author' href='/microCourse/wenda/question/").append(cor.getFromUserId()).append("' title='").append(cor.getFromNickname()).append("'>")
			  .append("    	   <img src='/microCourse/upload/").append(cor.getFromAvatar()).append("/avatar.jpg' width='40' height='40' />")
			  .append("    </a>")
			  .append("    <div class='qa-reply-item-inner'>")
			  .append("        <p>")
			  .append("            <a href='/microCourse/wenda/question/").append(cor.getFromUserId()).append("' class='qa-reply-nick'>").append(cor.getFromNickname()).append("</a>");
			
			if(!"".equals(cor.getToNickname()))
				sb.append(" 回复 <a href='/microCourse/wenda/question/").append(cor.getToUserId()).append("' class='qa-reply-nick'>").append(cor.getToNickname()).append("</a>：");
			
			sb.append("        </p>")
			  .append("        <p class='q-reply-item-c'>").append(cor.getContent()).append("</p>")
			  .append("        <div class='qa-reply-item-foot clearfix'>")
			  .append("            <span class='reply-item-index r'>#").append(cor.getFloor()).append("</span>")
			  .append("            <span>").append(cor.getElapse()).append("前</span>")
			  .append("            <span class='qa-reply-item-reply js-reply-item-reply' data-uid='").append(cor.getFromUserId()).append("|").append(cor.getFromNickname()).append("' data-cid='").append(cor.getSnsId()).append("'>")
			  .append("                <i class='icon-resp'></i>回复")
			  .append("			   </span>")
			  .append("        </div>")
			  .append("    </div>")
			  .append("</div><br>");
		}
		
		System.out.println(sb.toString());
		
		try {
			response.getWriter().write(sb.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*通过慕课网的登录框登录*/
	@RequestMapping("/sign_in")
	public void signIn(String username, String password, HttpServletResponse response, HttpSession session, Model model){
		boolean isRegist = userService.findUserBy(username.trim());
		
		if(!isRegist)
			try {
				response.getWriter().write(JSONObject.fromObject("{'status':3,'msg':'未注册'}").toString());
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		boolean isPwdCorrect = userService.findUserBy(username.trim(), password.trim());
		if(!isPwdCorrect)
			try {
				response.getWriter().write(JSONObject.fromObject("{'status':4,'msg':'密码错误'}").toString());
				return;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		User currentUser = userService.getByName(username.trim());
		session.setAttribute("currentUser", currentUser);
		model.addAttribute("user", currentUser);
		
		session.setAttribute("userInfo", "userInfo");		//登录成功后跳转到首页，而首页不会进入拦截器，首页需要加上这句
		
		/*创建cookie，保存用户登录状态*/
		Cookie cookie = new Cookie("login_state","1");
		cookie.setMaxAge(60 * 60 * 24);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		try {
			response.getWriter().write(JSONObject.fromObject("{'status':1,'msg':'登录成功'}").toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/*发问题，在输标题时，提示类似问题*/
	@RequestMapping("/search_similar_question")
	public void searchSimilarQuestion(String words, HttpServletResponse response){
		List<Topic> similarTopics = topicService.findSimilar(words);
		
		/*
		 * 响应数据格式
		 * data: {data:[{id:208236, title:177, description:hleo, finished:1,last_t_id:1,answers:9},…]}
		 * msg: "成功"
		 * result: 0
		 */
		List<SimilarQuestion> ques = new ArrayList<SimilarQuestion>();
		for (Topic topic : similarTopics) {
			SimilarQuestion sq = new SimilarQuestion();
			sq.setId(topic.getTopicId());
			sq.setTitle(topic.getTitle());
			sq.setdescription(topic.getContent());
			sq.setLast_t_id(0);
			sq.setFinished((int) (topic.getBestAnswer() == null ? 0 : topic.getBestAnswer()));		//是否已采纳答案
			
			List<Sns> answers = topicService.findAllReplyById(topic.getTopicId());
			sq.setAnswers(answers.size());
			
			/*是否有老师回答*/
			if(answers.size() > 0){
				for (Sns sns : answers) {
					User replyer = userService.getById(sns.getUserId());
					
					/*如果不是学生*/
					if(12 != replyer.getTitle().getTitleId()){
						sq.setLast_t_id(1);
						break;
					}
				}
			}
			
			ques.add(sq);
		}
		
		StringBuilder sb = new StringBuilder("{'resutl':0,'msg':'成功','data':{'data':");
		sb.append(JSONArray.fromObject(ques))
		  .append("}}");
		
		try {
			response.getWriter().write(JSONObject.fromObject(sb.toString()).toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
