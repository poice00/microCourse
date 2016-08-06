package com.mc.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.FuzzyQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.mc.annotation.SystemControllerLog;
import com.mc.annotation.UserControllerLog;
import com.mc.domain.Course;
import com.mc.domain.Lecture;
import com.mc.domain.PageBeanAjax;
import com.mc.domain.Privilege;
import com.mc.domain.Role;
import com.mc.domain.SearchContent;
import com.mc.domain.SearchHistory;
import com.mc.domain.SearchResult;
import com.mc.domain.Title;
import com.mc.domain.User;
import com.mc.service.LectureService;
import com.mc.service.RoleService;
import com.mc.service.SearchHistoryService;
import com.mc.service.TitleService;
import com.mc.service.UserService;
import com.mc.util.SpringContextHolder;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

@SuppressWarnings("unchecked")
@Controller
@RequestMapping("/user")
public class UserController  {
	 private int width = 90;//定义图片的width
	  private int height = 20;//定义图片的height
	  private int codeCount = 4;//定义图片上显示验证码的个数
	  private int xx = 15;
	  private int fontHeight = 18;
	  private int codeY = 16;
	  char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
	      'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
	      'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
	      'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w',
	      'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

	
	@Resource
	private UserService userService;
	
	@Resource
	private TitleService titleService;
	@Resource
	private RoleService roleService;
	@Resource
	private SearchHistoryService searchHistoryService;
	@Resource
	private LectureService lectureService;
	
	/** 注册 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user) throws Exception {
		user.setRegistTime(new Date());
		Role role = roleService.getByName("普通用户");
		user.setRole(role);
		this.userService.save(user);
		return "redirect:/";	
	}

	
	/** aa */
	@RequestMapping(value = "/index")
	public String index() throws Exception {
		return "/user/index";
	}
	/** 注销 */
	@RequestMapping("/logout")
	@UserControllerLog(description = "退出系统")
	public String logout(HttpSession session, HttpServletResponse response) throws Exception {
		session.removeAttribute("currentUser");
		
		/*删除登录状态cookie*/
		Cookie cookie = new Cookie("login_state", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		
		return "/user/logout";
	}
	
	/** 登陆 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/login")
	@UserControllerLog(description = "登陆系统")
	public String login(User user,HttpSession session,Model model, HttpServletResponse response) throws Exception {
			User currentUser = userService.getByName(user.getLoginName());
			session.setAttribute("currentUser", currentUser);
			
			User u = userService.getById(currentUser.getUserId());
			model.addAttribute("user", u);
			
    		session.setAttribute("userInfo", "userInfo");	//登录成功后跳转到首页，而首页不会进入拦截器，首页需要加上这句
			
			/*创建cookie，保存用户登录状态*/
			Cookie cookie = new Cookie("login_state","1");
			cookie.setMaxAge(60 * 30);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			return "redirect:/";
		
	}
	
	/** 验证用户名是否存在 */
	@RequestMapping("/validate")
	public void validate(String name,HttpServletResponse response) throws Exception {
		PrintWriter out= response.getWriter();
		boolean result=userService.findUserBy(name);
		if(result) {
			out.write("exist");
		}
	}
	/** 验证用密码是否正确 */
	@RequestMapping("/validateOldPass")
	public void validateOldPass(String password,HttpServletResponse response,HttpSession session) throws Exception {
		PrintWriter out= response.getWriter();
		User u = (User) session.getAttribute("currentUser");
		if(!u.getPassword().equals(password)) {
			out.write("not");
		}
	}
	/** 验证登陆：用户名密码是否匹配 */
	@RequestMapping("/validateLogin")
	public void validateLogin(String loginName,String password,HttpServletResponse response) throws Exception {
		if(userService.findUserBy(loginName)){
			User user = userService.getByName(loginName);
			PrintWriter out= response.getWriter();
			boolean result=userService.findUserBy(loginName,password);
			if(user.getRole()!=null){
				if(result&&!user.getRole().getName().equals("普通管理员")) {
					out.write("ok");
				}
			}
		}
	}
	/** 比对验证码 */
	@RequestMapping("/checkCode")
	public void checkCode(String input_code,HttpServletResponse response,HttpSession session) throws Exception {
		PrintWriter out= response.getWriter();
		if(!input_code.toLowerCase().equals(session.getAttribute("code"))) {
			out.write("fail");
		}
	}
	/** 验证码 */
	@RequestMapping("/ImageCode")
	  public void getCode(HttpServletRequest req, HttpServletResponse resp)
		      throws IOException {
		    // 定义图像buffer
		    BufferedImage buffImg = new BufferedImage(width, height,
		        BufferedImage.TYPE_INT_RGB);
//				Graphics2D gd = buffImg.createGraphics();
		    //Graphics2D gd = (Graphics2D) buffImg.getGraphics();
		    Graphics gd = buffImg.getGraphics();
		    // 创建一个随机数生成器类
		    Random random = new Random();
		    // 将图像填充为白色
		    gd.setColor(Color.WHITE);
		    gd.fillRect(0, 0, width, height);
		    // 创建字体，字体的大小应该根据图片的高度来定。
		    Font font = new Font("Fixedsys", Font.BOLD, fontHeight);
		    // 设置字体。
		    gd.setFont(font);
		    // 画边框。
		    gd.setColor(Color.BLACK);
		    gd.drawRect(0, 0, width - 1, height - 1);
		    // 随机产生40条干扰线，使图象中的认证码不易被其它程序探测到。
		    gd.setColor(Color.BLACK);
		    for (int i = 0; i < 40; i++) {
		      int x = random.nextInt(width);
		      int y = random.nextInt(height);
		      int xl = random.nextInt(12);
		      int yl = random.nextInt(12);
		      gd.drawLine(x, y, x + xl, y + yl);
		    }
		    // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
		    StringBuffer randomCode = new StringBuffer();
		    int red = 0, green = 0, blue = 0;
		    // 随机产生codeCount数字的验证码。
		    for (int i = 0; i < codeCount; i++) {
		      // 得到随机产生的验证码数字。
		      String code = String.valueOf(codeSequence[random.nextInt(36)]);
		      // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。
		      red = random.nextInt(255);
		      green = random.nextInt(255);
		      blue = random.nextInt(255);
		      // 用随机产生的颜色将验证码绘制到图像中。
		      gd.setColor(new Color(red, green, blue));
		      gd.drawString(code, (i + 1) * xx, codeY);
		      // 将产生的四个随机数组合在一起。
		      randomCode.append(code);
		    }
		    // 将四位数字的验证码保存到Session中。
		    HttpSession session = req.getSession();
//		    System.out.println("======生成的验证码====="+randomCode);
		    session.setAttribute("code", randomCode.toString().toLowerCase());
		    // 禁止图像缓存。
		    resp.setHeader("Pragma", "no-cache");
		    resp.setHeader("Cache-Control", "no-cache");
		    resp.setDateHeader("Expires", 0);
		    resp.setContentType("image/jpeg");
		    // 将图像输出到Servlet输出流中。
		    ServletOutputStream sos = resp.getOutputStream();
		    ImageIO.write(buffImg, "jpeg", sos);
		    sos.close();
		  }
		
		/** 上传图片
		 * @throws IOException */
		@RequestMapping("/postpic")
		@UserControllerLog(description = "修改头像")
		public String postpic(@RequestParam("myPhoto") MultipartFile myPhoto,HttpServletRequest request,HttpSession session,Model model) throws IOException{
			// 文件保存目录路径  
            String savePath = request.getServletContext().getRealPath("/")  
                    + "upload/";  
            System.out.println("===save" + savePath);
            // 文件保存目录URL  
            String saveUrl = request.getContextPath()  
                    + "/upload/";  
            //登陆用户
            User user = (User) session.getAttribute("currentUser");
            //保存服务器路径
            File dirFile = new File(savePath+user.getLoginName());  
            if (!dirFile.exists()) {  
                dirFile.mkdirs();  
            } 
            //保存数据库路径
            File saveFile = new File(saveUrl+user.getLoginName());  
            if (!saveFile.exists()) {  
            	saveFile.mkdirs();  
            } 
            //创建文件
            File avatar = new File(dirFile, "avatar"+ "." + myPhoto.getOriginalFilename().substring(myPhoto.getOriginalFilename().lastIndexOf(".")+1));
            if(!myPhoto.isEmpty()){
            	FileUtils.copyInputStreamToFile(myPhoto.getInputStream(), avatar);
            }
            String url = saveFile + "\\" + "avatar"+ "." + myPhoto.getOriginalFilename().substring(myPhoto.getOriginalFilename().lastIndexOf(".")+1);
    		User u = userService.getById(user.getUserId());
            u.setAvatar(url);
            userService.update(u);
			return "redirect:/";
		}
		
		
		/*用户课程*/
		@RequestMapping("/course")
		public String course(){
			return "/user/course";
		}
		/*我的课程*/
		@RequestMapping("/mycourse")
		@UserControllerLog(description = "查看我的课程")
		public String mycourse(Model model,HttpSession session){
			User u = (User) session.getAttribute("currentUser");
			User user = userService.getById(u.getUserId());
			model.addAttribute("user", user);
			return "/user/mycourse";
		}
		
		/*用户经验值*/
		@RequestMapping("/experience")
		public String experience(){
			return "/user/experience";
		}
		
		/*个人资料页面*/
		@RequestMapping("/profile")
		@UserControllerLog(description = "查看个人资料")
		public String profile(Model model,HttpSession session){
			List<Title> titleList = titleService.findAll();
			model.addAttribute("titleList", titleList);
			User u = (User) session.getAttribute("currentUser");
			User user = userService.getById(u.getUserId());
			model.addAttribute("user", user);
			return "/user/profile";
		}
		/*个人修改*/
		@RequestMapping("/changeProfile")
		@UserControllerLog(description = "个人资料修改")
		public String changeProfile(Long id,User user,Long titleId,Model model){
			System.out.println(user.getNickname()+"-" +user.getGender() + "-" +user.getIntroduction());
			System.out.println("id:"+ id);
			Title title = titleService.getById(titleId);
			User u = userService.getById(id);
			u.setNickname(user.getNickname());
			u.setGender(user.getGender());
			u.setIntroduction(user.getIntroduction());
			u.setTitle(title);
			System.out.println("name:"+ title.getName());
			
			userService.update(u);
			
			return "redirect:/";
		}
		/*密码修改*/
		@RequestMapping("/changePassowrd")
		@UserControllerLog(description = "密码修改")
		public String changePassowrd(String newpass,Long id,HttpSession session){
			System.out.println("newpass-" +newpass);
			User user = userService.getById(id);
			user.setPassword(newpass);
			session.removeAttribute("currentUser");
			userService.update(user);
			return "redirect:/";
		}
		
		/*聊天*/
		@RequestMapping("/message")
		public String message(){
			return "/user/message";
		}
		
		/*头像*/
		@RequestMapping("/avatar")
		public String avatar(Model model,HttpSession session){
			User u = (User) session.getAttribute("currentUser");
			User user = userService.getById(u.getUserId());
			model.addAttribute("user", user);
			return "/user/avatar";
		}
		
		/*邮箱*/
		@RequestMapping("/email")
		public String email(){
			return "/user/email";
		}
		
		/*密码*/
		@RequestMapping("/password")
		public String password(){
			return "/user/password";
		}
		
		/*密码*/
		@RequestMapping("/bindsns")
		public String bindSns(){
			return "/user/bindsns";
		}
		
		/*模糊匹配*/
		@RequestMapping("/showFuzzySearch")
		public void showFuzzySearch(String content,HttpServletResponse response,HttpSession session) throws IOException, ParseException, InvalidTokenOffsetsException{
			System.out.println("搜索的内容为： " + content);
			PrintWriter out= response.getWriter();
			
			String rootPath = System.getProperty("root"); //根目录
			System.out.println(rootPath);
			String indexPath = rootPath + "course" ;//索引存放位置
			File file = new File(indexPath.toString());
			Directory dir=FSDirectory.open(file);  //读取索引
			
			//实例化IKAnalyzer分词器 
			//Analyzer analyzer = new IKAnalyzer(true);
			IndexReader indexReader = DirectoryReader.open(FSDirectory.open(new File(indexPath)));
			IndexSearcher searcher = new IndexSearcher(indexReader);
			
			//解析输入
			Term name = new Term("name",content);
			Query nameQuery = new FuzzyQuery(name);
			
			//搜索相似度最高的5条记录
			TopDocs topNameDocs =  searcher.search(nameQuery,5);
			
			System.out.println("在课程名中找到【"+topNameDocs.totalHits+"】个：");
			//在课程中
			List<SearchResult> resultList = new ArrayList<SearchResult>();
			SearchResult sr =  null;
			for (int i = 0; i < topNameDocs.scoreDocs.length; i++) {
				int docId = topNameDocs.scoreDocs[i].doc;
				Document document = searcher.doc(docId);
				
				String courseId = document.get("courseId");
				String nameResult = document.get("name");
				System.out.println("课程名："+courseId+ "|" +nameResult);
				sr = new SearchResult();
				sr.setName(nameResult);
				resultList.add(sr);
			}
			
			out.write(JSONArray.fromObject(resultList).toString());
			
		}
		/*搜索历史*/
		@RequestMapping("/findHistory")
		public void findHistory(HttpServletResponse response,HttpSession session) throws IOException, ParseException, InvalidTokenOffsetsException{
			PrintWriter out= response.getWriter();
			User user = (User) session.getAttribute("currentUser");
			List<SearchHistory> temptList = searchHistoryService.getByUser(user.getLoginName());
			List<SearchResult> resultList = new ArrayList<SearchResult>();
			SearchResult sr = null;
			for (SearchHistory temp : temptList) {
				sr = new SearchResult();
				sr.setName(temp.getName());
				resultList.add(sr);
				
			}
			out.write(JSONArray.fromObject(resultList).toString());
			
		}
		/*搜索*/
		@RequestMapping("/searchIn")
		@SystemControllerLog(description = "用户搜索")
		public void search(String content,HttpServletResponse response,HttpSession session,Integer currentPage) throws IOException, ParseException, InvalidTokenOffsetsException{
			//List<Privilege> topPrivilegeList = (List<Privilege>) SpringContextHolder.getServletContext().getAttribute("topPrivilegeList");
			System.out.println("搜索的内容为： " + content);
			PrintWriter out= response.getWriter();
			
			String rootPath = System.getProperty("root"); //根目录
			System.out.println(rootPath);
			String indexPath = rootPath + "course" ;//索引存放位置
			File file = new File(indexPath.toString());
	        Directory dir=FSDirectory.open(file);  //读取索引
	        
	        //实例化IKAnalyzer分词器 
			Analyzer analyzer = new IKAnalyzer(true);
			IndexReader indexReader = DirectoryReader.open(FSDirectory.open(new File(indexPath)));
			IndexSearcher searcher = new IndexSearcher(indexReader);
			
			
			StringReader reader=new StringReader(content); 
			//分词  
	        TokenStream ts=analyzer.tokenStream("", reader);  
	        CharTermAttribute term=ts.getAttribute(CharTermAttribute.class);  
	        ts.reset();
	        
	        //遍历分词数据  
	        System.out.print("==========分词结果为=========：" );
	        while(ts.incrementToken()){  
	            System.out.print(term.toString()+"|");  
	        }  
	        System.out.println();
	        ts.close();
	        reader.close();  
			
			//解析输入
			QueryParser nameParser = new QueryParser(Version.LUCENE_4_9, "name", analyzer);
			nameParser.setDefaultOperator(QueryParser.AND_OPERATOR);  
			Query nameQuery = nameParser.parse(content);
			
			QueryParser descriptionParser = new QueryParser(Version.LUCENE_4_9, "description", analyzer);
			descriptionParser.setDefaultOperator(QueryParser.AND_OPERATOR);  
			Query descriptionQuery = descriptionParser.parse(content);
	        
			//搜索相似度最高的5条记录
			TopDocs topNameDocs =  searcher.search(nameQuery,100);
			TopDocs topDecDocs =  searcher.search(descriptionQuery, null,1000);
			
			System.out.println("在课程名中找到【"+topNameDocs.totalHits+"】个：");
			System.out.println("在课程描述中找到【"+topDecDocs.totalHits+"】个：");
			//在课程中
			 // 关键字高亮显示的html标签
			// 分页，高亮显示
			List<SearchResult> nameList =  higherIndex(analyzer, searcher, nameQuery, topNameDocs);
			
		     System.out.println("----------------------------------------------");
		     
		     //在内容中
		     // 关键字高亮显示的html标签
			// 分页，高亮显示
		     List<SearchResult> descriptionList = higherIndex(analyzer, searcher, descriptionQuery, topDecDocs);
		     //合并后的数组jc
		     List<SearchResult> resultList = new ArrayList<SearchResult>();
		     
		     List<SearchResult> falseList = new ArrayList<SearchResult>();//重复的
		     List<SearchResult> numList = new ArrayList<SearchResult>();//排序的结果的
		     resultList.addAll(nameList);
		     for (SearchResult description : descriptionList) {
		    	 for (SearchResult name : nameList) {
						if(description.getCourseId().equals(name.getCourseId()))
							falseList.add(description);
							break;
					}	
		     }	 
		     descriptionList.removeAll(falseList);
		     resultList.addAll(descriptionList);
		     
		     System.out.println("----------------------------------------------");
		     int begin = (currentPage-1) * 10  ;
		     int end = currentPage * 10 -1 ;
		     if(resultList.size()<end) end = resultList.size();
		     if(resultList.size()<10){
		    	 numList.addAll(resultList);
		     }else{
	    		 for (int i = begin; i < end; i++) {
	    			 numList.add(resultList.get(i));
				 };
		     }
		     System.out.println("currentPage: " + currentPage);
			 PageBeanAjax pba = new PageBeanAjax(10, currentPage, resultList.size(), numList);
			 System.out.println("当前页： " +pba.getCurrentPage());
			 System.out.println("每页显示： " +pba.getPageSize());
			 System.out.println("总页数： " +pba.getPageCount());
			 for (SearchResult searchResult : pba.getRecordList()) {
				
				 System.out.println("记录Id： " +searchResult.getCourseId());
			}
			 
		     System.out.println("----------------------------------------------");
		     out.write(JSONObject.fromObject(pba).toString());
		    	// out.write(description.toString());
		     User user = (User) session.getAttribute("currentUser");
		     SearchHistory sh = new SearchHistory();
		     sh.setName(content);
		     sh.setUser(user);
		     sh.setSearchDate(new Date());
		     searchHistoryService.save(sh);
		     
		}
		/**
		  * 高亮显示
		  * 
		  * @param analyzer
		  * @param isearcher
		  * @param query
		  * @param topDocs
		  * @throws IOException
		  * @throws InvalidTokenOffsetsException
		  */
		 public List<SearchResult> higherIndex(Analyzer analyzer, IndexSearcher isearcher, Query query, TopDocs topDocs)
		         throws IOException, InvalidTokenOffsetsException {
			 List<SearchResult> srList = new ArrayList<SearchResult>();
			 SearchResult sr =  null;
//			 TopScoreDocCollector results = TopScoreDocCollector.create(topDocs.totalHits, false);
//		     isearcher.search(query, results);
		     // 分页取出指定的doc(开始条数, 取几条)
//		     ScoreDoc[] docs = results.topDocs(0, 2).scoreDocs;
			 
			 
		     // 关键字高亮显示的html标签
		     SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<font color='red'>", "</font>");
		     Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query));
		     for (int i = 0; i < topDocs.scoreDocs.length; i++) {
		         Document doc = isearcher.doc(topDocs.scoreDocs[i].doc);
		         // 标题增加高亮显示
		         TokenStream tokenStream1 = analyzer.tokenStream("name", new StringReader(doc.get("name")));
		         String name = highlighter.getBestFragment(tokenStream1, doc.get("name"));
		         if("".equals(name)||name==null){
		        	 name= doc.get("name");
		         }
		       
		         // 内容增加高亮显示
		         TokenStream tokenStream2 = analyzer.tokenStream("description", new StringReader(doc.get("description")));
		         String description = highlighter.getBestFragment(tokenStream2, doc.get("description"));
		         if("".equals(description)||description==null){
		        	 description= doc.get("description");
		         }
		         sr = new SearchResult();
		         sr.setCourseId(doc.get("courseId"));
		         sr.setLogo(doc.get("logo"));
		         sr.setName(name);
		         sr.setDescription(description);
		         srList.add(sr);
		     }
		    // System.out.println(jo.toString());
		     return srList;
		 }
		
		/*搜索页面*/
		@RequestMapping("/search")
		public String search(){
			return "/user/search";
		}
		
		/*加入讲师团*/
		@RequestMapping("/join_lecture")
		public String joinLecture(){
			return "/user/join_lecture";
		}
		
		/*应聘讲师*/
		@RequestMapping("/apply")
		public String apply(){
			return "/user/application";
		}
		
		
		
	}
