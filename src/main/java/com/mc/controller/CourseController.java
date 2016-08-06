package com.mc.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.channels.ScatteringByteChannel;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.jws.WebParam.Mode;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Comment;
import com.mc.domain.Course;
import com.mc.domain.Exercise;
import com.mc.domain.Lecture;
import com.mc.domain.Note;
import com.mc.domain.Orientation;
import com.mc.domain.Practice;
import com.mc.domain.Question;
import com.mc.domain.Reply;
import com.mc.domain.Section;
import com.mc.domain.Sns;
import com.mc.domain.StudyProgress;
import com.mc.domain.StudyStatus;
import com.mc.domain.Tag;
import com.mc.domain.Topic;
import com.mc.domain.Type;
import com.mc.domain.User;
import com.mc.domain.UserSection;
import com.mc.service.ChapterService;
import com.mc.service.ClassifyService;
import com.mc.service.CommentService;
import com.mc.service.CourseService;
import com.mc.service.ExerciseService;
import com.mc.service.LectureService;
import com.mc.service.NoteService;
import com.mc.service.OrientationService;
import com.mc.service.PracticeService;
import com.mc.service.QuestionService;
import com.mc.service.ReplyService;
import com.mc.service.SectionService;
import com.mc.service.StudyStatusService;
import com.mc.service.UserSectionService;
import com.mc.service.UserService;
import com.mc.util.CompileAndRun;
import com.mc.util.TextSummary;
import com.mchange.v2.c3p0.impl.NewProxyDatabaseMetaData;
import com.mysql.fabric.xmlrpc.base.Data;
import com.sun.net.httpserver.HttpsConfigurator;
import com.sun.org.apache.bcel.internal.util.SecuritySupport;
import com.sun.xml.internal.messaging.saaj.packaging.mime.util.QEncoderStream;

import net.sf.json.JSONObject;
import sun.misc.BASE64Decoder;

@Controller
@RequestMapping("/course")
public class CourseController  {
	
	@Resource
	private CourseService courseService;
	@Resource
	private ChapterService chapterService;
	@Resource
	private OrientationService orientationService;
	@Resource
	private ClassifyService classifyService;
	@Resource
	private UserService userService;
	@Resource
	private PracticeService praticeService;
	@Resource
	private SectionService sectionService;
	@Resource
	private CommentService commentService;
	@Resource
	private NoteService noteService;
	@Resource
	private QuestionService questionService;
	@Resource
	private ReplyService replyService;
	@Resource
	private LectureService lectureService;
	@Resource
	private UserSectionService userSectionService;
	@Resource
	private StudyStatusService studyStatusService;
	@Resource
	private ExerciseService exerciseService;
	
	/*所有课程列表初始页面*/
	@RequestMapping
	public String courselist(Model model,HttpSession session) throws Exception{
		int is_easy=0;
		Long orientationId=(long) 0;
		Long classifyId=(long) 0;
		String classifyRealName=null;
		String orientationName=null;
		int pageTotleNum=1;
		int pageSize=20;
		int currentPage=1;
		User user=(User) session.getAttribute("currentUser");
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("is_easy", is_easy);
		model.addAttribute("orientationId", orientationId);
		model.addAttribute("classifyId", classifyId);
		model.addAttribute("classifyRealName", classifyRealName);
		model.addAttribute("orientationName", orientationName);
		List<Course> courseslist=courseService.findAll();
		List<Orientation> orientationslist=orientationService.findAll();
		model.addAttribute("orientationslist", orientationslist);
		List<Classify> classifieslist=classifyService.findAll();
		model.addAttribute("classifieslist", classifieslist);
		int courseNumber=courseslist.size();
		if (courseNumber<=20) {
			pageTotleNum=1;
		} else {
			pageTotleNum=(int) Math.ceil(((double)courseNumber)/pageSize);
		}
		List<Course> coursesinitList=courseService.findTop20();
		model.addAttribute("coursesinitList", coursesinitList);
		String html="";
		if (coursesinitList.size()==0) {
			html+="<p class='no-course-helper' style='text-align: center'>";
			html+="<span>精彩课程制作中，敬请期待！</span></p>";
		} else {
            for (int i = 0; i < coursesinitList.size(); i++) {
            	boolean learned=courseService.checkLearned(coursesinitList.get(i).getCourseId(),user.getUserId());
            	html+="<li class='course-one'>";
            	if (learned) {
            		html+="<a href='/microCourse/course/learn/"+coursesinitList.get(i).getCourseId()+"'";
				} else {
					html+="<a href='/microCourse/course/view/"+coursesinitList.get(i).getCourseId()+"'";
				}
            	html+="target='_self'><div class='course-list-img'>";
            	html+="<img width='240' height='135' alt='"+coursesinitList.get(i).getName()+"'";
            	html+="src='/microCourse/"+coursesinitList.get(i).getLogo()+"'>";
            	html+="</div><h5>";
            	if (learned) {
					html+="<i class='learned'>已学</i>";
				}
            	html+="<span>"+coursesinitList.get(i).getName()+"</span>";
            	html+="</h5><div class='tips'>";
            	html+="<p class='text-ellipsis'>"+coursesinitList.get(i).getSlogan()+"</p>";
            	html+="<span class='l'>"+coursesinitList.get(i).getStatus()+"</span> <span class='l ml20'>"+coursesinitList.get(i).getLearnCount()+" 人学习</span>";
            	html+="</div> <span class='time-label'>"+coursesinitList.get(i).getDuration()+"</span> ";
            	html+="<b class='follow-label'>跟我学</b>";
            	html+="</a></li>";		
			}
		}
		String str="";
		str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
		str+="<a href='javascript:void(0)' class='active'>1</a>";
		for (int i = 2; i < pageTotleNum+1; i++) {
			str+="<a href='/microCourse/course/list?page="+i+"'>"+i+"</a>";
		}
		str+="<a href='/microCourse/course/list?page=2'>下一页</a>";
		str+="<a href='/microCourse/course/list?page="+pageTotleNum+"'>尾页</a>共"+pageTotleNum+"页";
		model.addAttribute("pageInfo", str);
		model.addAttribute("courselist", html);
		System.out.println(str);
		return "/course/list";
	}
		
	/*课程列表，其他有点击事件时发生的*/
	@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model,HttpSession session) throws Exception{
		User user=(User) session.getAttribute("currentUser");
		List<Orientation> orientationslist=orientationService.findAll();
		model.addAttribute("orientationslist", orientationslist); //方向信息
		int is_easy=0;
		Long orientationId=(long) 0;
		Long classifyId=(long) 0;
		String classifyRealName=null;
		String orientationName=null;
		//int pageNum=ServletRequestUtils.getIntParameter(request, "pageNum",1);
		if(ServletRequestUtils.getIntParameter(request,"is_easy")== null){
			is_easy=0;
		}else
		{
			is_easy=ServletRequestUtils.getIntParameter(request, "is_easy");
		}
		String classifyName=null;
		if(ServletRequestUtils.getStringParameter(request,"c")== null){
			classifyName=null;
		}else
		{
			classifyName=ServletRequestUtils.getStringParameter(request, "c");
			System.out.println(classifyName);
		}
		int pageNum=1;
		if(ServletRequestUtils.getIntParameter(request,"page")== null){
			pageNum=1;
		}else
		{
			pageNum=ServletRequestUtils.getIntParameter(request, "page");
		}
		String levelname="全部";
		switch (is_easy) {
		case 1:
			levelname="初级";
			break;
		case 2:
			levelname="中级";
			break;
		case 3:
			levelname="高级";
			break;
		default:
			levelname="全部";
			break;
		}
		int pageTotleNum=1;
		int pageSize=20;
		/*String classifyName=ServletRequestUtils.getStringParameter(request, "c"); //方向和类别
		classifyName = new String(classifyName.getBytes("iso-8859-1"), "UTF-8");
		int page=ServletRequestUtils.getRequiredIntParameter(request, "page");  //页码
*/		System.out.println(levelname+classifyName+pageNum);
        String str="";
        String html="";
		if (is_easy!=0&&classifyName!=null) {
			boolean is_classify=classifyService.checkClassifyExit(classifyName);
			if (is_classify) {
			classifyRealName=classifyName;
			classifyId=classifyService.findByName(classifyName);
			List<Course> courseslist=courseService.findByClassifyAndLevel(classifyId,levelname);
			pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
			System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
			if (pageNum==1) {  //首先判定页码是否为1
				if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
					model.addAttribute("coursesinitList", courseslist);
					if (courseslist.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courseslist.size(); i++) {
			            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courseslist.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
					str="";
				} else {  //页面为1且有分页，则显示分页信息
					str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
					str+="<a href='javascript:void(0)' class='active'>1</a>";
					for (int i = 2; i < pageTotleNum+1; i++) {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+i+"'>"+i+"</a>";	
					}
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page=2'>下一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+pageTotleNum+"'>尾页</a>";
					List<Course> courses=courseslist.subList(0, 20);
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courses.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				}
			} else {
                if (pageNum==pageTotleNum) {
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page=1'>首页</a>";
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+(pageNum-1)+"'>上一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page=1'>1</a>";
					for (int i = 2; i < pageTotleNum; i++) {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+i+"'>"+i+"</a>";	
					}
					str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
					str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
					List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				} else {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page=1'>首页</a>";
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+(pageNum-1)+"'>上一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page=1'>1</a>";
					for (int i = 2; i < pageTotleNum+1; i++) {
						if (i==pageNum) {
							str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
						} else {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+i+"'>"+i+"</a>";
						}
						}
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+(pageNum+1)+"'>下一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyRealName+"&page="+pageTotleNum+"'>尾页</a>";
					List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				}
			}
			Classify classify=classifyService.getById(classifyId);
			orientationId=classify.getOrientation().getOrientationId();
			orientationName=classify.getOrientation().getHrefName();
			List<Classify> classifieslist=classifyService.findByOrientation(orientationId);
			model.addAttribute("classifieslist", classifieslist); //分类信息
			}else {
			orientationId=orientationService.findByName(classifyName);
			orientationName=orientationService.getById(orientationId).getHrefName();
			List<Course> courseslist=courseService.findByOrientationAndLevel(orientationId,levelname);
			pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
			System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
			if (pageNum==1) {  //首先判定页码是否为1
				if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
					model.addAttribute("coursesinitList", courseslist);
					if (courseslist.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courseslist.size(); i++) {
			            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courseslist.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
					str="";
				} else {  //页面为1且有分页，则显示分页信息
					str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
					str+="<a href='javascript:void(0)' class='active'>1</a>";
					for (int i = 2; i < pageTotleNum+1; i++) {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
					}
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=2'>下一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
					List<Course> courses=courseslist.subList(0, 20);
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				}
			} else {
                if (pageNum==pageTotleNum) {
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
					for (int i = 2; i < pageTotleNum; i++) {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
					}
					str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
					str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
					List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				} else {
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
					for (int i = 2; i < pageTotleNum+1; i++) {
						if (i==pageNum) {
							str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
						} else {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";
						}
						}
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum+1)+"'>下一页</a>";
					str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
					List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);
					model.addAttribute("coursesinitList", courses);
					if (courses.size()==0) {
						html+="<p class='no-course-helper' style='text-align: center'>";
						html+="<span>精彩课程制作中，敬请期待！</span></p>";
					} else {
			            for (int i = 0; i < courses.size(); i++) {
			            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
			            	html+="<li class='course-one'>";
			            	if (learned) {
			            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
							} else {
								html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
							}
			            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
			            	html+="target='_self'><div class='course-list-img'>";
			            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
			            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
			            	html+="</div><h5>";
			            	if (learned) {
								html+="<i class='learned'>已学</i>";
							}
			            	html+="<span>"+courses.get(i).getName()+"</span>";
			            	html+="</h5><div class='tips'>";
			            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
			            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
			            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
			            	html+="<b class='follow-label'>跟我学</b>";
			            	html+="</a></li>";		
						}
					}
				}
			}
			List<Classify> classifieslist=classifyService.findByOrientation(orientationId);
			model.addAttribute("classifieslist", classifieslist); //分类信息
			   }
		    }
			else if (is_easy==0&&classifyName!=null) {
				boolean is_classify=classifyService.checkClassifyExit(classifyName);
				if (is_classify) {
					classifyRealName=classifyName;
					classifyId=classifyService.findByName(classifyName);
					List<Course> courseslist=courseService.findByClassify(classifyId);
					pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
					System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
					if (pageNum==1) {  //首先判定页码是否为1
						if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
							model.addAttribute("coursesinitList", courseslist);
							if (courseslist.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courseslist.size(); i++) {
					            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courseslist.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
							str="";
						} else {  //页面为1且有分页，则显示分页信息
							str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
							str+="<a href='javascript:void(0)' class='active'>1</a>";
							for (int i = 2; i < pageTotleNum+1; i++) {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
							}
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=2'>下一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
							List<Course> courses=courseslist.subList(0, 20);
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						}
					} else {
		                if (pageNum==pageTotleNum) {
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
							for (int i = 2; i < pageTotleNum; i++) {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
							}
							str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
							str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
							List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						} else {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
							for (int i = 2; i < pageTotleNum+1; i++) {
								if (i==pageNum) {
									str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
								} else {
									str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";
								}
								}
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum+1)+"'>下一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
							List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						}
					}
					Classify classify=classifyService.getById(classifyId);
					orientationId=classify.getOrientation().getOrientationId();
					orientationName=classify.getOrientation().getHrefName();
					List<Classify> classifieslist=classifyService.findByOrientation(orientationId);
					model.addAttribute("classifieslist", classifieslist); //分类信息
					}else {
					orientationId=orientationService.findByName(classifyName);
					orientationName=orientationService.getById(orientationId).getHrefName();
					List<Course> courseslist=courseService.findByOrientation(orientationId);
					pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
					System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
					if (pageNum==1) {  //首先判定页码是否为1
						if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
							model.addAttribute("coursesinitList", courseslist);
							if (courseslist.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courseslist.size(); i++) {
					            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courseslist.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
							str="";
						} else {  //页面为1且有分页，则显示分页信息
							str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
							str+="<a href='javascript:void(0)' class='active'>1</a>";
							for (int i = 2; i < pageTotleNum+1; i++) {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
							}
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=2'>下一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
							List<Course> courses=courseslist.subList(0, 20);
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						}
					} else {
		                if (pageNum==pageTotleNum) {
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
							for (int i = 2; i < pageTotleNum; i++) {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";	
							}
							str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
							str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
							List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						} else {
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>首页</a>";
		                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum-1)+"'>上一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page=1'>1</a>";
							for (int i = 2; i < pageTotleNum+1; i++) {
								if (i==pageNum) {
									str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
								} else {
									str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+i+"'>"+i+"</a>";
								}
								}
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+(pageNum+1)+"'>下一页</a>";
							str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&c="+classifyName+"&page="+pageTotleNum+"'>尾页</a>";
							List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);
							model.addAttribute("coursesinitList", courses);
							if (courses.size()==0) {
								html+="<p class='no-course-helper' style='text-align: center'>";
								html+="<span>精彩课程制作中，敬请期待！</span></p>";
							} else {
					            for (int i = 0; i < courses.size(); i++) {
					            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
					            	html+="<li class='course-one'>";
					            	if (learned) {
					            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
									} else {
										html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
									}
					            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
					            	html+="target='_self'><div class='course-list-img'>";
					            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
					            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
					            	html+="</div><h5>";
					            	if (learned) {
										html+="<i class='learned'>已学</i>";
									}
					            	html+="<span>"+courses.get(i).getName()+"</span>";
					            	html+="</h5><div class='tips'>";
					            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
					            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
					            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
					            	html+="<b class='follow-label'>跟我学</b>";
					            	html+="</a></li>";		
								}
							}
						}
					}
					List<Classify> classifieslist=classifyService.findByOrientation(orientationId);
					model.addAttribute("classifieslist", classifieslist); //分类信息
			      }		
			} else if (is_easy!=0&&classifyName==null) {
				List<Classify> classifieslist=classifyService.findAll();
				model.addAttribute("classifieslist", classifieslist); //分类信息
				List<Course> courseslist=courseService.findBylevel(levelname);
				pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
				System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
				if (pageNum==1) {  //首先判定页码是否为1
					if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
						model.addAttribute("coursesinitList", courseslist);
						if (courseslist.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courseslist.size(); i++) {
				            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courseslist.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
						str="";
					} else {  //页面为1且有分页，则显示分页信息
						str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
						str+="<a href='javascript:void(0)' class='active'>1</a>";
						for (int i = 2; i < pageTotleNum+1; i++) {
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+i+"'>"+i+"</a>";	
						}
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=2'>下一页</a>";
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+pageTotleNum+"'>尾页</a>";
						List<Course> courses=courseslist.subList(0, 20);
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					}
				} else {
	                if (pageNum==pageTotleNum) {
	                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=1'>首页</a>";
	                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+(pageNum-1)+"'>上一页</a>";
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=1'>1</a>";
						for (int i = 2; i < pageTotleNum; i++) {
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+i+"'>"+i+"</a>";	
						}
						str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
						str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
						List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					} else {
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=1'>首页</a>";
	                	str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+(pageNum-1)+"'>上一页</a>";
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=1'>1</a>";
						for (int i = 2; i < pageTotleNum+1; i++) {
							if (i==pageNum) {
								str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
							} else {
								str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+i+"'>"+i+"</a>";
							}
							}
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+(pageNum+1)+"'>下一页</a>";
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+pageTotleNum+"'>尾页</a>";
						List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					}
				}
			} else {
				List<Classify> classifieslist=classifyService.findAll();
				model.addAttribute("classifieslist", classifieslist); //分类信息
				List<Course> courseslist=courseService.findAll();
				pageTotleNum=(int) Math.ceil(((double)courseslist.size())/20);
				System.out.println(courseslist.size()+"courListSize"+pageNum+"pageNum"+"pageTotalNUm"+pageTotleNum);
				if (pageNum==1) {  //首先判定页码是否为1
					if (pageTotleNum<=1) {  //页码为1且只有一页，则不显示分页信息
						model.addAttribute("coursesinitList", courseslist);
						if (courseslist.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courseslist.size(); i++) {
				            	boolean learned=courseService.checkLearned(courseslist.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courseslist.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courseslist.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courseslist.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courseslist.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courseslist.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courseslist.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courseslist.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courseslist.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
						str="";
					} else {  //页面为1且有分页，则显示分页信息
						str+="<span class='disabled_page'>首页</span><span class='disabled_page'>上一页</span>";
						str+="<a href='javascript:void(0)' class='active'>1</a>";
						for (int i = 2; i < pageTotleNum+1; i++) {
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+i+"'>"+i+"</a>";	
						}
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page=2'>下一页</a>";
						str+="<a href='/microCourse/course/list?is_easy="+is_easy+"&page="+pageTotleNum+"'>尾页</a>";
						List<Course> courses=courseslist.subList(0, 20);
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					}
				} else {
	                if (pageNum==pageTotleNum) { //总页数不为1，且请求页面等于总页码
	                	str+="<a href='/microCourse/course/list?page=1'>首页</a>";
	                	str+="<a href='/microCourse/course/list?page="+(pageNum-1)+"'>上一页</a>";
						str+="<a href='/microCourse/course/list?page=1'>1</a>";
						for (int i = 2; i < pageTotleNum; i++) {
						str+="<a href='/microCourse/course/list?page="+i+"'>"+i+"</a>";	
						}
						str+="<a href='javascript:void(0)' class='active'>"+pageTotleNum+"</a>";	
						str+="<span class='disabled_page'>下一页</span><span class='disabled_page'>尾页</span>";
						List<Course> courses=courseslist.subList((pageNum-1)*20, courseslist.size());
						System.out.println((pageNum-1)*20+"ssss"+courseslist.size());
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					} else { //总页数不为1，且请求页面不等于总页码
						str+="<a href='/microCourse/course/list?page=1'>首页</a>";
	                	str+="<a href='/microCourse/course/list?page="+(pageNum-1)+"'>上一页</a>";
						str+="<a href='/microCourse/course/list?page=1'>1</a>";
						for (int i = 2; i < pageTotleNum+1; i++) {
							if (i==pageNum) {
								str+="<a href='javascript:void(0)' class='active'>"+pageNum+"</a>";
							} else {
								str+="<a href='/microCourse/course/list?page="+i+"'>"+i+"</a>";
							}
							}
						str+="<a href='/microCourse/course/list?page="+(pageNum+1)+"'>下一页</a>";
						str+="<a href='/microCourse/course/list?page="+pageTotleNum+"'>尾页</a>";
						List<Course> courses=courseslist.subList((pageNum-1)*20, pageNum*20);						
						model.addAttribute("coursesinitList", courses);
						if (courses.size()==0) {
							html+="<p class='no-course-helper' style='text-align: center'>";
							html+="<span>精彩课程制作中，敬请期待！</span></p>";
						} else {
				            for (int i = 0; i < courses.size(); i++) {
				            	boolean learned=courseService.checkLearned(courses.get(i).getCourseId(),user.getUserId());
				            	html+="<li class='course-one'>";
				            	if (learned) {
				            		html+="<a href='/microCourse/course/learn/"+courses.get(i).getCourseId()+"'";
								} else {
									html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
								}
				            	html+="<a href='/microCourse/course/view/"+courses.get(i).getCourseId()+"'";
				            	html+="target='_self'><div class='course-list-img'>";
				            	html+="<img width='240' height='135' alt='"+courses.get(i).getName()+"'";
				            	html+="src='/microCourse/"+courses.get(i).getLogo()+"'>";
				            	html+="</div><h5>";
				            	if (learned) {
									html+="<i class='learned'>已学</i>";
								}
				            	html+="<span>"+courses.get(i).getName()+"</span>";
				            	html+="</h5><div class='tips'>";
				            	html+="<p class='text-ellipsis'>"+courses.get(i).getSlogan()+"</p>";
				            	html+="<span class='l'>"+courses.get(i).getStatus()+"</span> <span class='l ml20'>"+courseslist.get(i).getLearnCount()+" 人学习</span>";
				            	html+="</div> <span class='time-label'>"+courses.get(i).getDuration()+"</span> ";
				            	html+="<b class='follow-label'>跟我学</b>";
				            	html+="</a></li>";		
							}
						}
					}
				}
			}
		model.addAttribute("is_easy", is_easy);
		model.addAttribute("orientationId", orientationId);
		model.addAttribute("classifyId", classifyId);
		model.addAttribute("classifyRealName", classifyRealName);
		model.addAttribute("orientationName", orientationName);
		model.addAttribute("pageInfo", str);
		model.addAttribute("courselist", html);
		return "/course/list";
	}
	
	/*单方向课程列表*/
	/*单方向数据准备*/
	@RequestMapping("/orientation")
	public String orientationlist(HttpServletRequest request,Model model) throws Exception{
		Long id = ServletRequestUtils.getLongParameter(request, "is_easy");		
		List<Course> courseslist=courseService.findByOrientation(id);
		model.addAttribute("courseslist", courseslist);
		List<Classify> classifieslist=classifyService.findByOrientation(id);
		model.addAttribute("classifieslist", classifieslist);
		List<Orientation> orientationslist=orientationService.findAll();
		model.addAttribute("orientationslist", orientationslist);
		return "/course/list";
	 }
	/*课程界面数据准备*/
	/*单类别课程列表*/
	@RequestMapping("/classify/{classifyId}")
	 public String classifylist(@PathVariable("classifyId")Long classifyId,Model model) throws Exception{
		List<Course> courseslist=courseService.findByClassify(classifyId);
		model.addAttribute("courseslist", courseslist);
		List<Orientation> orientationslist=orientationService.findAll();
		model.addAttribute("orientationslist", orientationslist);
		List<Classify> classifieslist=classifyService.findByOrientation(classifyService.getById(classifyId).getOrientation().getOrientationId());
		model.addAttribute("classifieslist", classifieslist);
		return "/course/list";
	 }
	/*难度列表*/
	@RequestMapping("/level/{levelId}")
	 public String levellist(@PathVariable("levelId")int levelId,Model model) throws Exception{
		System.out.println(levelId);
		String levelname="全部";
		switch (levelId) {
		case 0:
			levelname="初级";
			break;
		case 1:
			levelname="中级";
			break;
		case 2:
			levelname="高级";
			break;
		default:
			levelname="全部";
			break;
		}
		System.out.println(levelname);
		if (levelname.contains("全部")) {
			List<Course> courseslist=courseService.findAll();
			model.addAttribute("courseslist", courseslist);
		} else {
			List<Course> courseslist=courseService.findBylevel(levelname);
			model.addAttribute("courseslist", courseslist);
		}
		List<Orientation> orientationslist=orientationService.findAll();
		model.addAttribute("orientationslist", orientationslist);
		List<Classify> classifieslist=classifyService.findAll();
		model.addAttribute("classifieslist", classifieslist);
		return "/course/list";
	 }
	 /*单个课程详细介绍*/
	@RequestMapping("/view/{CourseId}")
	public String view(@PathVariable("CourseId")Long CourseId,Model model,HttpSession session) throws Exception{
		Course course=courseService.getById(CourseId);
		model.addAttribute("course", course);
		List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		model.addAttribute("chapterslist", chapterslist);
		return "/course/view";
	}
	/*学习界面数据准备*/
	
	/*课程学习*/
	@RequestMapping("/learn/{CourseId}")
	public String learn(@PathVariable("CourseId")Long CourseId,StudyStatus studyStatus,Model model,HttpSession session) throws Exception{
		Course course=courseService.getById(CourseId);
		model.addAttribute("course", course);
		List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		model.addAttribute("chapterslist", chapterslist);
		String statu="learnOn";
		model.addAttribute("statu", statu);
		User user=(User) session.getAttribute("currentUser");
		boolean checked=studyStatusService.checkExit(course.getCourseId(),user.getUserId());
		if (!checked) {
			studyStatus.setCourse(course);
			studyStatus.setUser(user);
			studyStatus.setLearnchapterNum(0);
			studyStatus.setLearnedLength(0);
			studyStatus.setStartTime(new Date());
			studyStatusService.save(studyStatus);
		} 
		studyStatus=studyStatusService.findByCourIdAndUserId(course.getCourseId(), user.getUserId());
		List<Section> sections=sectionService.findByCourse(course.getCourseId());
		int progress=0;
		if (sections.size()==0) {
			progress=0;
		} else {
			progress=(int) Math.ceil(((double)studyStatus.getLearnchapterNum())/sections.size()*100);
		}
		System.out.println(((double)studyStatus.getLearnchapterNum())/sections.size());
		int learnTime=studyStatus.getLearnedLength();
		String str="";
		if (learnTime>=60) {
			int mm=(int) Math.floor((double)learnTime/60);
			int nn=learnTime-mm*60;
			str=mm+"小时"+nn+"分钟";
		} else {
			str=learnTime+"分钟";
		}
		model.addAttribute("leartTime", str);
		model.addAttribute("progress", progress);
		model.addAttribute("studyProgress",studyStatus);
		return "/course/learn";
	}
	/*学习界面评论数据准备*/
	/*课程学习界面的评论*/
	@RequestMapping("/comment/{courseId}")
	public String comment(@PathVariable("courseId")Long courseId,Model model,HttpSession session) throws Exception{
		Course course=courseService.getById(courseId);
		model.addAttribute("course", course);
		List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		model.addAttribute("chapterslist", chapterslist);
		User user=(User) session.getAttribute("currentUser");
        StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(course.getCourseId(), user.getUserId());
        int progress=0;
        List<Section> sections=sectionService.findByCourse(course.getCourseId());
		if (sections.size()==0) {
			progress=0;
		} else {
			progress=(int) Math.ceil(((double)studyStatus.getLearnchapterNum())/sections.size()*100);
		}
		System.out.println(((double)studyStatus.getLearnchapterNum())/sections.size());
		int learnTime=studyStatus.getLearnedLength();
		String str="";
		if (learnTime>=60) {
			int mm=(int) Math.floor((double)learnTime/60);
			int nn=learnTime-mm*60;
			str=mm+"小时"+nn+"分钟";
		} else {
			str=learnTime+"分钟";
		}
		model.addAttribute("leartTime", str);
		model.addAttribute("progress", progress);
		model.addAttribute("studyProgress",studyStatus);
		String statu="commentOn";
		model.addAttribute("statu", statu);
//		TextSummary textSummary=new TextSummary();
//		String summary=textSummary.summaryAuto();
//		model.addAttribute("summary", "ames_yuan 讲的很好");
//		model.addAttribute("summary", summary);
 		return "/course/learn";
	}
	/*学习界面问答数据准备*/
	/*课程学习界面的问答*/
	@RequestMapping("/wenda/{courseId}")
	public String wenda(@PathVariable("courseId")Long courseId,Model model,HttpSession session) throws Exception{
		Course course=courseService.getById(courseId);
		model.addAttribute("course", course);
		List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		model.addAttribute("chapterslist", chapterslist);
		User user=(User) session.getAttribute("currentUser");
        StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(course.getCourseId(), user.getUserId());
        int progress=0;
        List<Section> sections=sectionService.findByCourse(course.getCourseId());
		if (sections.size()==0) {
			progress=0;
		} else {
			progress=(int) Math.ceil(((double)studyStatus.getLearnchapterNum())/sections.size()*100);
		}
		System.out.println(((double)studyStatus.getLearnchapterNum())/sections.size());
		int learnTime=studyStatus.getLearnedLength();
		String str="";
		if (learnTime>=60) {
			int mm=(int) Math.floor((double)learnTime/60);
			int nn=learnTime-mm*60;
			str=mm+"小时"+nn+"分钟";
		} else {
			str=learnTime+"分钟";
		}
		model.addAttribute("leartTime", str);
		model.addAttribute("progress", progress);
		model.addAttribute("studyProgress",studyStatus);
		String statu="wendaOn";
		model.addAttribute("statu", statu);
 		return "/course/learn";
	}
	/*学习界面笔记数据准备*/
	/*课程学习界面的笔记*/
	@RequestMapping("/note/{courseId}")
	public String note(@PathVariable("courseId")Long courseId,Model model,HttpSession session) throws Exception{
		Course course=courseService.getById(courseId);
		model.addAttribute("course", course);
		List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		model.addAttribute("chapterslist", chapterslist);
		User user=(User) session.getAttribute("currentUser");
        StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(course.getCourseId(), user.getUserId());
        int progress=0;
        List<Section> sections=sectionService.findByCourse(course.getCourseId());
		if (sections.size()==0) {
			progress=0;
		} else {
			progress=(int) Math.ceil(((double)studyStatus.getLearnchapterNum())/sections.size()*100);
		}
		System.out.println(((double)studyStatus.getLearnchapterNum())/sections.size());
		int learnTime=studyStatus.getLearnedLength();
		String str="";
		if (learnTime>=60) {
			int mm=(int) Math.floor((double)learnTime/60);
			int nn=learnTime-mm*60;
			str=mm+"小时"+nn+"分钟";
		} else {
			str=learnTime+"分钟";
		}
		model.addAttribute("leartTime", str);
		model.addAttribute("progress", progress);
		model.addAttribute("studyProgress",studyStatus);
		String statu="noteOn";
		model.addAttribute("statu", statu);
		User auother=course.getUser();
		model.addAttribute("auother", auother);
 		return "/course/learn";
	}
	/*视频播放界面问答添加*/
	
	
	/*视频播放页面*/
	@RequestMapping("/video/{sectionId}")
	public String video(@PathVariable("sectionId")Long sectionId,HttpSession session,Model model,UserSection userSection) throws Exception{
		Section section=sectionService.getById(sectionId);
		section.setPlayCount(section.getPlayCount()+1);
		sectionService.update(section);
		Chapter chapter=section.getChapter();
		Course course=chapter.getCourse();
		List<Chapter> chaptersList=chapterService.getByCourse(course);
		List<Comment> commentsList=commentService.findBySection(section);
		model.addAttribute("course", course);
		model.addAttribute("chaptersList", chaptersList);
		model.addAttribute("commentsList", commentsList);		
		model.addAttribute("section", section);
		List<Section> sections=sectionService.findByCourse(course.getCourseId());
		int m=0;
		Long nextSectionId;
		String status=null;
		for (int i = 0; i < sections.size(); i++) {
			if (sectionId==sections.get(i).getSectionId()) {
				m=i;
			}
		}
		if (m<sections.size()-1) {
			nextSectionId=sections.get(m+1).getSectionId();
			Section nextSection=sectionService.getById(nextSectionId);
			model.addAttribute("nextSection", nextSection);
			status="haveNext";
			
		} else {
            status="lastSection";
		}
		model.addAttribute("status", status);
		String str="";
		str+="<div class='pl-container'>";
		if (commentsList.size()==0) {
			str+="<p class='pl-none'>";
			str+="<span class='icon-chat'></span>此节暂无同学评论";
			str+="</p></div>";
		} else {
			str+="<ul>";
			for (int i = 0; i < commentsList.size(); i++) {
				str+="<li class='pl-list clearfix'>";
				str+="<div class='pl-list-avator'>";
				str+="<a href='/microCourse/user/course' target='_blank'><img width='40' height='40' src='"+commentsList.get(i).getUser().getAvatar()+"' title='"+commentsList.get(i).getUser().getNickname()+"'></a>";
				str+="</div>";
				str+="<div class='pl-list-main'>";
				str+="<div class='pl-list-nick'>";
				str+="<a href='/space/u/uid/1932860' target='_blank'>"+commentsList.get(i).getUser().getNickname()+"</a>";
				str+="</div>";
				str+="<div class='pl-list-content'>"+commentsList.get(i).getContent()+"</div>";
				str+="<div class='pl-list-btm clearfix'>";
				str+="<span class='pl-list-time l'>"+commentsList.get(i).getPostTime()+"</span>";
				str+="<a title='赞' href='javascript:;' class='js-pl-praise list-praise r' data-id='113692'><i class='icon-thumb'></i> <span>1</span></a>";
				str+="</div></div></li>";
			}
			str+="</ul></div>";
		}		
		model.addAttribute("commentstatus", str);
		User user=(User) session.getAttribute("currentUser");
		userSection.setUser(user);
		boolean checkUs=userSectionService.checkUSexit(user.getUserId(),section.getSectionId());
		int currentTime=0;
		if (checkUs) {
			userSection=userSectionService.findByUserSection(user.getUserId(), section.getSectionId());
			currentTime=userSection.getLastPlayTime();
			userSection.setLastLearnTime(new Date());
			userSectionService.update(userSection);
		} else {
			userSection.setSection(section);
			userSection.setType(0);
			userSection.setLastPlayTime(0);
			userSection.setLastLearnTime(new Date());
			userSectionService.save(userSection);
		}
		model.addAttribute("lastPlayTime", currentTime);
		return "/course/video";
	}
	
	/*视频播放评论添加*/
	@RequestMapping("/videoCommentAddAjax")
	public void videoCommentAdd(HttpServletRequest request,Comment comment,HttpSession session,HttpServletResponse hsr) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		String content=ServletRequestUtils.getStringParameter(request, "content");
		Section section=sectionService.getById(sectionId);
		comment.setSection(section);
		comment.setContent(content);
		comment.setPostTime(new Date());
		comment.setUser((User) session.getAttribute("currentUser"));
		commentService.save(comment);
		List<Comment> commentsList=commentService.findBySection(section);
		String str="";
		str+="<div class='pl-container'>";
		if (commentsList.size()==0) {
			str+="<p class='pl-none'>";
			str+="<span class='icon-chat'></span>此节暂无同学评论";
			str+="</p></div>";
		} else {
			str+="<ul>";
			for (int i = 0; i < commentsList.size(); i++) {
				str+="<li class='pl-list clearfix'>";
				str+="<div class='pl-list-avator'>";
				str+="<a href='/microCourse/user/course' target='_blank'><img width='40' height='40' src='"+commentsList.get(i).getUser().getAvatar()+"' title='"+commentsList.get(i).getUser().getNickname()+"'></a>";
				str+="</div>";
				str+="<div class='pl-list-main'>";
				str+="<div class='pl-list-nick'>";
				str+="<a href='/space/u/uid/1932860' target='_blank'>"+commentsList.get(i).getUser().getNickname()+"</a>";
				str+="</div>";
				str+="<div class='pl-list-content'>"+commentsList.get(i).getContent()+"</div>";
				str+="<div class='pl-list-btm clearfix'>";
				str+="<span class='pl-list-time l'>"+commentsList.get(i).getPostTime()+"</span>";
				str+="<a title='赞' href='javascript:;' class='js-pl-praise list-praise r' data-id='113692'><i class='icon-thumb'></i> <span>1</span></a>";
				str+="</div></div></li>";
			}
			str+="</ul></div>";
		}
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(str);
		return;
	}
	/*视频播放评论查看*/
	@RequestMapping("/videoCommentView")
	public void videoCommentView(HttpServletRequest request,HttpServletResponse hsr) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		Section section=sectionService.getById(sectionId);
		List<Comment> commentsList=commentService.findBySection(section);
		String str="";
		str+="<div class='pl-container'>";
		if (commentsList.size()==0) {
			str+="<p class='pl-none'>";
			str+="<span class='icon-chat'></span>此节暂无同学评论";
			str+="</p></div>";
		} else {
			str+="<ul>";
			for (int i = 0; i < commentsList.size(); i++) {
				str+="<li class='pl-list clearfix'>";
				str+="<div class='pl-list-avator'>";
				str+="<a href='/microCourse/user/course' target='_blank'><img width='40' height='40' src='"+commentsList.get(i).getUser().getAvatar()+"' title='"+commentsList.get(i).getUser().getNickname()+"'></a>";
				str+="</div>";
				str+="<div class='pl-list-main'>";
				str+="<div class='pl-list-nick'>";
				str+="<a href='/space/u/uid/1932860' target='_blank'>"+commentsList.get(i).getUser().getNickname()+"</a>";
				str+="</div>";
				str+="<div class='pl-list-content'>"+commentsList.get(i).getContent()+"</div>";
				str+="<div class='pl-list-btm clearfix'>";
				str+="<span class='pl-list-time l'>"+commentsList.get(i).getPostTime()+"</span>";
				str+="<a title='赞' href='javascript:;' class='js-pl-praise list-praise r' data-id='113692'><i class='icon-thumb'></i> <span>1</span></a>";
				str+="</div></div></li>";
			}
			str+="</ul></div>";
		}		
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(str);
		return ;
	}
	/*视频播放问答查看*/
	@RequestMapping("/videoWendaView")
	public void videoWendaView(HttpServletRequest request,HttpServletResponse hsr) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		Section section=sectionService.getById(sectionId);
		List<Question> questions=questionService.findBySection(section);
		String str="";
		str+="<div class='answertabcon'>";
		if (questions.size()==0) {
			str+="<p class='unquestion'><span class='icon-ques'></span>此节暂无同学的问答</p>";
			
		} else {
			for (int i = 0; i < questions.size(); i++) {
				str+="<div class='wenda-listcon clearfix' style='top:20px'>";
				str+="<div class='headslider'>";
				str+="<a href='/space/u/uid/2203462' class='wenda-head' target='_blank'";
				str+="title='"+questions.get(i).getUser().getNickname()+"'> <img";
				str+="src='"+questions.get(i).getUser().getAvatar()+"'";
				str+="alt='"+questions.get(i).getUser().getNickname()+"' width='40'>";
				str+="</a> <a href='/space/u/uid/2203462' target='_blank' title='"+questions.get(i).getUser().getNickname()+"'";
				str+="class='wenda-nickname'>"+questions.get(i).getUser().getNickname()+"</a>";
				str+="</div>";
				str+="<div class='wendaslider'>";
				str+="<a href='/qadetail/93709' target='_blank'";
				str+="class='replynumber hasanswernum'>";
				str+="<div class='ys'>";
				str+="<div class='number padAjust'>";
				str+="<b class='numShow'>"+questions.get(i).getAnswerCount()+"</b>";
				str+="</div>";
				str+="<div class='number'>回答</div>";
				str+="</div>";
				str+="<div class='browsenum'>";
				str+="<div class='number padAjust'>";
				str+="<b class='numShow'>"+questions.get(i).getReadCount()+"</b>";
				str+="</div>";
				str+="<div class='number'>浏览</div>";
				str+="</div></a>";
				str+="<h2 class='wendaquetitle'>";
				str+="<i class='icon-ques-revert'></i>";
				str+="<div class='wendatitlecon'>";
				str+="<a href='/qadetail/93709' target='_blank' class='wendatitle'>"+questions.get(i).getTitle()+"</a>";
				str+="</div></h2>";
				str+="<div class='replycont clearfix'>";
				str+="<i class='icon-msg-revert'></i>";
				str+="<div class='fl replydes'>";
				if (questions.get(i).getReplies().size()==0) {
					str+="<span class='replydet'>嗯～～，这个提问大家都在考虑......</span>";
					str+="</div></div>";
					str+="<div class='replymegfooter'>";
					str+="<div class='wenda-time'>";
					str+="<em>"+questions.get(i).getPostTime()+"</em>";
					str+="</div></div></div></div>";
				} else {
					Reply reply=replyService.newestReply(questions.get(i));
					str+="<span class='replysign praise'>[最新回答]</span> <a";
					str+="href='/space/u/uid/1056008' target='_blank' title='boul'";
					str+="class='replyuserhead'><img";
					str+="src='"+reply.getUser().getAvatar()+"'";
					str+="alt='boul' width='20'> </a> <a href='/space/u/uid/1056008'";
					str+="target='_blank' title='boul' class='nickname'>"+reply.getUser().getNickname()+"</a> <span";
					str+="class='replydet'>"+reply.getContent()+"</span>";
					str+="</div>";
					str+="</div>";
					str+="<div class='replymegfooter'>";
					str+="<div class='wenda-time'>";
					str+="<em>"+questions.get(i).getPostTime()+"</em>";
					str+="</div></div></div></div>";
				}	
			}
		}
		str+="</div>";
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(str);
		return ;
	}
	/*视频播放问答添加*/
	@RequestMapping("/videoWendaAdd")
	public void videoWendaAdd(HttpServletRequest request,Question question,HttpServletResponse hsr,HttpSession session) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");	
		String content=ServletRequestUtils.getStringParameter(request, "content");
		String title=ServletRequestUtils.getStringParameter(request, "title");
		String img=ServletRequestUtils.getStringParameter(request, "img");
		double videoTime=ServletRequestUtils.getDoubleParameter(request, "videoTime");
		videoTime=(int)videoTime;
		User user=(User) session.getAttribute("currentUser");
		question.setUser(user);
		Section section=sectionService.getById(sectionId);
		question.setSection(section);
		question.setContent(content);
		question.setTitle(title);
		question.setPostTime(new Date());
		System.out.println(new Date());
		if (img=="") {
			question.setScreenshort(img);
		} else {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String screenshort = formatter.format(new Date());
			String path=request.getSession().getServletContext().getRealPath("resources/video");
			File file=new File(path+"/"+screenshort+".png");
			FileOutputStream fo = new FileOutputStream(file);
			BASE64Decoder dec = new BASE64Decoder();
			byte[] bytes = dec.decodeBuffer(img);  
			fo.write(bytes, 0, bytes.length);
			fo.flush();
			fo.close();
		    screenshort="src//main//webapp//resources//video//"+user.getLoginName()+screenshort+".png";
		    question.setScreenshort(screenshort);
		}
	    question.setType(String.valueOf(1));
	    questionService.save(question);
		return;
	}
	/*问答详情*/
	@RequestMapping("/detail/{questionId}")
	public String detail(@PathVariable("questionId")Long questionId, Model model, HttpSession session){
			Question question = questionService.getById(questionId);
			question.setReadCount(question.getReadCount() + 1);		//浏览次数加1
			model.addAttribute("question", question);
			return "/course/wenda";
		}
	/*视频播放笔记添加*/
	@RequestMapping("/videoNoteAdd")
	public void videoNoteAdd(HttpServletRequest request,Note note,HttpSession session,HttpServletResponse hsr) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");	
		String content=ServletRequestUtils.getStringParameter(request, "content");
		String type=ServletRequestUtils.getStringParameter(request, "type");
		String img=ServletRequestUtils.getStringParameter(request, "img");
		double videoTime=ServletRequestUtils.getDoubleParameter(request, "videoTime");
		videoTime=(int)videoTime;
		User user=(User) session.getAttribute("currentUser");
		note.setUser(user);
		Section section=sectionService.getById(sectionId);
		note.setSection(section);
		note.setPostTime(new Date());
		note.setContent(content);
		note.setType(type);
		if (img=="") {
			note.setScreenshort(img);
			note.setVideoTime(null);
		} else {
			String vTime="";
			if (videoTime>60) {
				vTime=String.valueOf((int)(Math.floor((double)videoTime/60)))+":"+String.valueOf(videoTime-(int)(Math.floor((double)videoTime/60))*60);
			} else {
				vTime=String.valueOf(videoTime);
			}
			note.setVideoTime(vTime);
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
			String screenshort = formatter.format(new Date());
			String path=request.getSession().getServletContext().getRealPath("resources/video");
			File file=new File(path+"/"+screenshort+".png");
			FileOutputStream fo = new FileOutputStream(file);
			BASE64Decoder dec = new BASE64Decoder();
			byte[] bytes = dec.decodeBuffer(img);  
			fo.write(bytes, 0, bytes.length);
			fo.flush();
			fo.close();
		    screenshort="/microCourse/resources/video/"+screenshort+".png";
			note.setScreenshort(screenshort);
		}
		noteService.save(note);
		return;
	}
	/*视频播放笔记查看*/
	@RequestMapping("/videoNoteView")
	public void videoNoteView(HttpServletRequest request,HttpSession session,HttpServletResponse hsr) throws Exception{
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");	
		Section section=sectionService.getById(sectionId);
		String str="";
		List<Note> notes=noteService.findBySection(section);
		if (notes.size()==0) {
			str+="<div id='course_note' class='course_note'>";
			str+="<div class='unnote'>";
			str+="<span class='icon-note'></span>";
			str+="<p>此节暂无同学记录过笔记</p>";
			str+="</div></div>";
		} else {
			str+="<div id='course_note' class='course_note'>";
			str+="<ul>";
			for (int i = 0; i < notes.size(); i++) {
				str+="<li>";
				str+="<div class='notelist_headpic'>";
				str+="<a href='/space/u/uid/2344583' target='_blank'> <img";
				str+="src='"+notes.get(i).getUser().getAvatar()+"'";
				str+="width='40' height='40'>";
				str+="</a></div>";
				str+="<div class='notelist_content'>";
				str+="<div class='u_name'>";
				str+="<a href='/space/u/uid/2344583' target='_blank'>"+notes.get(i).getUser().getNickname()+"</a>";
				str+="</div>";
				str+="<div class='js-notelist-content notelist-content'>";
				str+="<p>"+notes.get(i).getContent()+"</p>";
				str+="<div class='notelist-content-more'>";
				str+="</div></div>";
                if (notes.get(i).getScreenshort()==null) {
                	str+="<div class='notelist-bottom clearfix'>";
                	str+="<span title='1443153063' class='l timeago'>"+notes.get(i).getPostTime()+"</span>";
                	str+="<div class='notelist-actions'>";
                	str+="<a title='采集' href='javascript:;' class='Jcollect list-praise '";
                	str+="data-id='"+notes.get(i).getNoteId()+"|"+notes.get(i).getUser().getUserId()+"'><span class='icon-star'></span><i>采集</i><em>0</em></a>";
                	str+="<a title='赞' href='javascript:;' class='Jpraise list-praise '";
                	str+="data-id='"+notes.get(i).getNoteId()+"'><span class='icon-thumb'></span> <em>0</em></a>";
                	str+="</div></div>";
                	str+="</div></li>"; 	
				} else {
					str+="<div class='answercon'>";
					str+="<span class='answerImg ansmallPic' id='ansmallPic'> <img ";
					str+="src='"+notes.get(i).getScreenshort()+"'";
					str+="width='156' height='88'> <i>05:41</i> <span";
					str+="class='intertime playtime_AS clearfix'> <a ";
					str+="href='javascript:;' onclick='return false' target='_blank'";
					str+="class='seepic'>看截图</a> <a href='/microCourse/course/video/"+notes.get(i).getSection().getSectionId()+"' target='_blank'";
					str+="class='seevideo'>看视频</a>";
					str+="</span>";
					str+="</span> <span class='answerImg anbigPic' id='anbigPic'";
					str+="style='display: none;'> <img ";
					str+="src='"+notes.get(i).getScreenshort()+"'";
					str+="width='500' height='284'>";
					str+="</span></div>";
					str+="<div class='notelist-bottom clearfix'>";
                	str+="<span title='1443153063' class='l timeago'>"+notes.get(i).getPostTime()+"</span>";
                	str+="<div class='notelist-actions'>";
                	str+="<a title='采集' href='javascript:;' class='Jcollect list-praise '";
                	str+="data-id='"+notes.get(i).getNoteId()+"|"+notes.get(i).getUser().getUserId()+"'><span class='icon-star'></span><i>采集</i><em>0</em></a>";
                	str+="<a title='赞' href='javascript:;' class='Jpraise list-praise '";
                	str+="data-id='"+notes.get(i).getNoteId()+"'><span class='icon-thumb'></span> <em>0</em></a>";
                	str+="</div></div>";
                	str+="</div></li>";
				}
			}		
		}
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(str);
		return;
	}
	/*视频播放完毕触发事件*/
	@RequestMapping("/videoComplete")
	public void videoComplete(HttpServletRequest request,HttpSession session,HttpServletResponse hsr) throws Exception{
		User user=(User) session.getAttribute("currentUser");
		int experience=ServletRequestUtils.getIntParameter(request,"experience");
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		user.setExperience(user.getExperience()+experience);
		userService.update(user);
		hsr.setContentType("test/html;charset=UTF-8");
		String ex=String.valueOf(experience);
		UserSection userSection=userSectionService.findByUserSection(user.getUserId(), sectionId);
        if (userSectionService.findByUserSection(user.getUserId(), sectionId).getType()==0) {
        	userSection.setType(1);
        	StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(sectionService.getById(sectionId).getChapter().getCourse().getCourseId(),user.getUserId());
        	studyStatus.setLearnchapterNum(studyStatus.getLearnchapterNum()+1);
        	studyStatusService.update(studyStatus);
		} 
		userSection.setLastLearnTime(new Date());
		userSection.setLastPlayTime(0);
		userSectionService.update(userSection);
		hsr.getWriter().write(ex);
		return;
	}
	/*视频页面关闭触发事件*/
	@RequestMapping("/videoClose")
	public void videoClose(HttpServletRequest request,HttpServletResponse hsr) throws Exception{
		Long userId=ServletRequestUtils.getLongParameter(request, "userId");
		double currentTime=ServletRequestUtils.getDoubleParameter(request,"currentTime");
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
        UserSection userSection=userSectionService.findByUserSection(userId,sectionId);
        Date date=new Date();
        Long leartTime=date.getTime()-userSection.getLastLearnTime().getTime();
        long mins =  leartTime/ 1000 / 60;
        System.out.println(mins);
        StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(sectionService.getById(sectionId).getChapter().getCourse().getCourseId(), userId);
        studyStatus.setLearnedLength(studyStatus.getLearnedLength()+(int)mins);
        studyStatusService.update(studyStatus);
		userSection.setLastLearnTime(new Date());
		userSection.setType(0); //没有学完
		int lastPlayTime=(int) Math.floor(currentTime);
		userSection.setLastPlayTime(lastPlayTime);
		userSectionService.update(userSection);
		return;
	}
	/*代码编辑页面*/
	@RequestMapping("/code/{sectionId}")
	public String code(@PathVariable("sectionId")Long sectionId,UserSection userSection,HttpSession session,Model model) throws Exception{
		User user=(User) session.getAttribute("currentUser");
		Section section=sectionService.getById(sectionId);
		model.addAttribute("section", section);
		Practice practice=section.getPractice();
		model.addAttribute("practice", practice);
		boolean checkUs=userSectionService.checkUSexit(user.getUserId(),section.getSectionId());
		if (checkUs) {
			userSection=userSectionService.findByUserSection(user.getUserId(), section.getSectionId());
			userSection.setLastLearnTime(new Date());
			userSectionService.update(userSection);
		} else {
			userSection.setSection(section);
			userSection.setType(0);
			userSection.setLastLearnTime(new Date());
			userSection.setUser(user);
			userSectionService.save(userSection);
		}
		Course course=section.getChapter().getCourse();
		model.addAttribute("course", course);
		return "/course/code";
	}
	/*代码编辑显示结果*/
	@RequestMapping("/codeResult")
	public void codeResult(HttpServletRequest request,String code,HttpServletResponse hsr,Model model) throws Exception{
		CompileAndRun compile=new CompileAndRun();
		String path=request.getSession().getServletContext().getRealPath("resources/video");
		String result=compile.codeAndRun(code,path);
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(result);
		model.addAttribute("result", result);
	}
	/*代码编辑重置*/
	@RequestMapping("/codeReset")
	public void codeReset(HttpServletRequest request,HttpServletResponse hsr,Model model) throws Exception{
        Long practiceId=ServletRequestUtils.getLongParameter(request, "practiceId");
        String code=praticeService.getById(practiceId).getInitCode();
		hsr.setContentType("test/html;charset=UTF-8");
		hsr.getWriter().write(code);
	}
	/*代码编辑提交*/
	@RequestMapping("/codeCommit")
	public void codeCommit(HttpServletRequest request,HttpServletResponse hsr,Model model) throws Exception{
		String code=ServletRequestUtils.getStringParameter(request, "code");
		CompileAndRun compile=new CompileAndRun();		
		int res=compile.codeAndRunRes(code);
		if (res==0) {
			hsr.setContentType("test/html;charset=UTF-8");
			hsr.getWriter().write("代码仍有错误，请确认正确后再提交！！！");
			return;
		} else {
		    Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		    Long userId=ServletRequestUtils.getLongParameter(request, "userId");
		    UserSection userSection=userSectionService.findByUserSection(userId, sectionId);
            Long courseId=sectionService.getById(sectionId).getChapter().getCourse().getCourseId();
            StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(courseId, userId);
            Date date=new Date();
            Long leartTime=date.getTime()-userSection.getLastLearnTime().getTime();
            long mins =  leartTime/ 1000 / 60;
            studyStatus.setLearnedLength(studyStatus.getLearnedLength()+(int)mins);
            studyStatus.setLearnchapterNum(studyStatus.getLearnchapterNum()+1);
		    studyStatusService.update(studyStatus); //更新用户进度表，学习完成的章节数+1，同时更新学习总时间
		    userSection.setLastLearnTime(new Date());
		    userSection.setType(1);
		    userSectionService.update(userSection); //更新用户章节表，将学习状态改成已完成，同时修改最后学习时间
		    hsr.setContentType("test/html;charset=UTF-8");
		    String exString=String.valueOf(sectionService.getById(sectionId).getExperience());
			hsr.getWriter().write("提交成功!"+"经验值+"+exString+"!，恭喜你又学完了一节！");
			User user=userService.getById(userId);
			user.setExperience(user.getExperience()+sectionService.getById(sectionId).getExperience());
			userService.update(user);
			return;
		}
	}
	/*练习题*/
	@RequestMapping("/exercise/{sectionId}")
	public String exercise(@PathVariable("sectionId")Long sectionId,UserSection userSection,HttpSession session,Model model) throws Exception{
		User user=(User) session.getAttribute("currentUser");
		Section section=sectionService.getById(sectionId);
		Exercise exercise=section.getExercise();
		model.addAttribute("exercise", exercise);
		boolean checkUs=userSectionService.checkUSexit(user.getUserId(),section.getSectionId());
		if (checkUs) {
			userSection=userSectionService.findByUserSection(user.getUserId(), section.getSectionId());
			userSection.setLastLearnTime(new Date());
			userSectionService.update(userSection);
		} else {
			userSection.setSection(section);
			userSection.setType(0);
			userSection.setLastLearnTime(new Date());
			userSection.setUser(user);
			userSectionService.save(userSection);
		}
		Course course=section.getChapter().getCourse();
		model.addAttribute("course", course);
		return "/course/exercise";
	}
	/*练习答案提交*/
	@RequestMapping("/exerciseCommit")
	public void exerciseCommit(HttpServletRequest request,HttpServletResponse hsr,Model model) throws Exception{
		String answer=ServletRequestUtils.getStringParameter(request, "answer");
		Long exerciseId=ServletRequestUtils.getLongParameter(request, "exerciseId");
		Exercise exercise=exerciseService.getById(exerciseId);
		Long sectionId=ServletRequestUtils.getLongParameter(request, "sectionId");
		Long userId=ServletRequestUtils.getLongParameter(request, "userId");
		if (exercise.getAnswer().contains(answer)) {
			 UserSection userSection=userSectionService.findByUserSection(userId, sectionId);
	            Long courseId=sectionService.getById(sectionId).getChapter().getCourse().getCourseId();
	            StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(courseId, userId);
	            Date date=new Date();
	            Long leartTime=date.getTime()-userSection.getLastLearnTime().getTime();
	            long mins =  leartTime/ 1000 / 60;
	            studyStatus.setLearnedLength(studyStatus.getLearnedLength()+(int)mins);
	            studyStatus.setLearnchapterNum(studyStatus.getLearnchapterNum()+1);
			    studyStatusService.update(studyStatus); //更新用户进度表，学习完成的章节数+1，同时更新学习总时间
			    userSection.setLastLearnTime(new Date());
			    userSection.setType(1);
			    userSectionService.update(userSection); //更新用户章节表，将学习状态改成已完成，同时修改最后学习时间
			    String exString=String.valueOf(sectionService.getById(sectionId).getExperience());
				User user=userService.getById(userId);
				user.setExperience(user.getExperience()+sectionService.getById(sectionId).getExperience());
				userService.update(user);
				String answ="你的答案是"+answer+",正确";
				Map<String,String> m=new HashMap<String, String>();
				m.put("answ", answ);
				String jiexi="此为正确答案！";
				m.put("jiexi", jiexi);
				JSONObject jo=JSONObject.fromObject(m);
				hsr.setContentType("test/html;charset=UTF-8");
			    hsr.getWriter().write(jo.toString());
			    return;
		} else {
			   
			    UserSection userSection=userSectionService.findByUserSection(userId, sectionId);
	            Long courseId=sectionService.getById(sectionId).getChapter().getCourse().getCourseId();
	            StudyStatus studyStatus=studyStatusService.findByCourIdAndUserId(courseId, userId);
	            Date date=new Date();
	            Long leartTime=date.getTime()-userSection.getLastLearnTime().getTime();
	            long mins =  leartTime/ 1000 / 60;
	            studyStatus.setLearnedLength(studyStatus.getLearnedLength()+(int)mins);
	            studyStatus.setLearnchapterNum(studyStatus.getLearnchapterNum()+1);
			    studyStatusService.update(studyStatus); //更新用户进度表，学习完成的章节数+1，同时更新学习总时间
			    userSection.setLastLearnTime(new Date());
			    userSection.setType(1);
			    userSectionService.update(userSection); //更新用户章节表，将学习状态改成已完成，同时修改最后学习时间
			    String exString=String.valueOf(sectionService.getById(sectionId).getExperience());
				User user=userService.getById(userId);
				user.setExperience(user.getExperience()+sectionService.getById(sectionId).getExperience());
				userService.update(user);
				String answ="你的答案是"+answer+",不正确";
				Map<String,String> m=new HashMap<String, String>();
				m.put("answ", answ);
				String jiexi=exercise.getJiexi();
				m.put("jiexi", jiexi);
				JSONObject jo=JSONObject.fromObject(m);
				hsr.setContentType("test/html;charset=UTF-8");
			    hsr.getWriter().write(jo.toString());
				return;
		}
	}
	/*教师界面*/
	@RequestMapping("/teacher/{teacherId}")
	public String teacher(@PathVariable("teacherId")Long teacherId,Model model) throws Exception{
		List<Course> coursesList=courseService.findByUserId(teacherId);
		model.addAttribute("coursesList", coursesList);
		User teacher=userService.getById(teacherId);
		model.addAttribute("teacher", teacher);
 		return "/course/teacher";
	}
	/*应聘讲师*/
	@RequestMapping("/teacherApply")
	public void teacherApply(Lecture lecture,HttpSession session,HttpServletResponse hsr,HttpServletRequest request) throws Exception{
	     User user=(User) session.getAttribute("currentUser");
	     String description=ServletRequestUtils.getStringParameter(request, "description");
	     String tureName=ServletRequestUtils.getStringParameter(request, "tureName");
	     String phoneNum=ServletRequestUtils.getStringParameter(request, "phoneNum");
	     String videoUrl=ServletRequestUtils.getStringParameter(request, "videoUrl");
	     String str="";
	     if (user.getApplyTutor()==1) {
	    	str="你的申请正在等待审核，请不要重复申请";
	    	hsr.setContentType("test/html;charset=UTF-8");
	 		hsr.getWriter().write(str);
	 		return;
		} 
	     else {
			lecture.setDescription(description);
			lecture.setPhoneNum(phoneNum);
			lecture.setTureName(tureName);
			lecture.setVideoUrl(videoUrl);
		    user.setApplyTutor(1);
			lecture.setUser(user);
			userService.update(user);
		    lectureService.save(lecture);
		    return;
		}		
	}
	/*课程创建*/
	@RequestMapping("/courseCreate")
	public String courseCreate(Course course,HttpSession session) throws Exception{
		course.setUser((User) session.getAttribute("currentUser"));
		courseService.save(course);
 		return "/user/course";
	}
	/*章创建*/
	@RequestMapping("/chapterCreate/{courseId}")
	public String chapterCreate(Chapter chapter,@PathVariable("courseId")Long courseId) throws Exception{
		Course course=courseService.getById(courseId);
		chapter.setCourse(course);
 		return "/user/course";
	}
	/*视频节创建*/
	@RequestMapping("/videoCreate")
	public String videoCreate() throws Exception{
 		return "/user/course";
	}
	/*练习题节创建*/
	@RequestMapping("/practiceCreate")
	public String practiceCreate() throws Exception{
 		return "/user/course";
	}
	/*编码练习节创建*/
	@RequestMapping("/codeCreate")
	public String codeCreate() throws Exception{
 		return "/user/course";
	}
}
