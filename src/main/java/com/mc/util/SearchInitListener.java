package com.mc.util;

import java.io.File;
import java.io.IOException;
/**
 * 建立索引
 * Spring容器启动加载

 */
import java.util.Collection;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.mc.domain.Course;
import com.mc.domain.Privilege;
import com.mc.service.CourseService;
import com.mc.service.PrivilegeService;



public class SearchInitListener implements ServletContextListener {
	

	private static String indexPath;			//索引路径
	private Directory dir;  
	  
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}

	public void contextInitialized(ServletContextEvent sce) {
		//获取容器与相关的Service对象
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
		CourseService courseService = (CourseService) ac.getBean("courseServiceImpl");
		
		System.out.println("root: " + System.getProperty("root"));
		String rootPath = System.getProperty("root"); //根目录
		indexPath = rootPath + "course" ;
		File file = new File(indexPath.toString());
		if(!file.exists()){
			try {
				createIndex(courseService,file);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

		/*//准备顶级权限数据
		List<Privilege> topPrivilegeList = privilegeService.findTopList();
		sce.getServletContext().setAttribute("topPrivilegeList", topPrivilegeList);*/
	}
	
	/**
	 * @throws Exception 
	 * @desc 创建索引
	 * 
	 */
	public  void createIndex(CourseService courseService,File dirFile) throws Exception{ 
		 
			dir=FSDirectory.open(dirFile);  
			IndexWriter writer=getWriter(); 
			
			List<Course> courseList =  courseService.findAll();
			for (Course course : courseList) {
				
				Document doc = new Document();			
				doc.add(new StringField("courseId", course.getCourseId().toString(), Store.YES));  
	            doc.add(new TextField("name", course.getName(), Store.YES));  
	            doc.add(new TextField("description", course.getDescription(), Store.YES));  
	            doc.add(new TextField("logo", course.getLogo(), Store.YES));  
	            System.out.println("正在索引：" + course.getName() + ";"+ course.getDescription());
				writer.addDocument(doc);
				
			}
			System.out.println("=====================建立索引完毕======================");
			writer.close();
			

	}
	/** 
     * 获得IndexWriter对象 
     * @return 
     * @throws Exception 
     */  
    public IndexWriter getWriter() throws Exception {  
//        Analyzer analyzer=new StandardAnalyzer(Version.LUCENE_4_9);  
    	//实例化IKAnalyzer分词器
    	Analyzer analyzer = new IKAnalyzer();
        IndexWriterConfig iwc=new IndexWriterConfig(Version.LUCENE_4_9, analyzer); 
        iwc.setOpenMode(OpenMode.CREATE_OR_APPEND);
        return new IndexWriter(dir, iwc);  
    }  
	

}
