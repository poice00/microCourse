package com.mc.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;
import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthSpinnerUI;
import org.hibernate.SessionFactory;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import com.mc.domain.Chapter;
import com.mc.domain.Classify;
import com.mc.domain.Course;
import com.mc.domain.Orientation;
import com.mc.service.CourseService;
import com.mc.serviceImpl.CourseServiceImpl;

public class CourseDataGet {
	
	   
	public static String getHtmlResource(String url, String encoding) {
		StringBuffer buffer=new StringBuffer();
		URL urlObj=null;
		URLConnection uc=null;
		InputStreamReader in=null;
		BufferedReader reader=null;
		try{
			urlObj=new URL(url);
			uc=urlObj.openConnection();
			in=new InputStreamReader(uc.getInputStream(),encoding);
			reader=new BufferedReader(in);
			String temp=null;
			while((temp=reader.readLine())!=null){
				buffer.append(temp+"\n");
			}
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("网络连接失败");
		}finally{
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return buffer.toString();
	}
	
	public static void main(String[] args) throws Exception {
		String url,html;
		String encoding="utf-8";
		url="http://www.imooc.com/course/list";
		html=getHtmlResource(url,encoding);
		Document doc=Jsoup.parse(html);
		Elements elements=doc.getElementsByClass("bd").get(0).getElementsByTag("li");
		System.out.println(elements.size()+"方向数");
		int m=elements.size();
		for (int i = 1; i < m; i++) {
			String str=elements.get(i).getElementsByTag("a").get(0).attr("href");
			String orientationstr=elements.get(i).getElementsByTag("a").get(0).text();
			String orientationstr2=elements.get(i).getElementsByTag("a").attr("data-ct");
			Orientation orientation=new Orientation();
			orientation.setName(orientationstr);
			orientation.setHrefName(orientationstr2);
			CourseDataGetService courseDataGetService=new CourseDataGetService(); 
			courseDataGetService.saveOrientation(orientation);
			url="http://www.imooc.com"+str;
			html=getHtmlResource(url,encoding);			
			doc=Jsoup.parse(html);
			Elements elements2=doc.getElementsByClass("bd").get(1).getElementsByTag("li");
			System.out.println(elements2.size()+"分类数");
			for (int j = 1; j < elements2.size(); j++) {								
				String str1=elements2.get(j).getElementsByTag("a").get(0).text();
				Classify classify=new Classify();
				classify.setName(str1);				
				classify.setOrientation(orientation);
				String str2=elements2.get(j).getElementsByTag("a").get(0).attr("href");
				String[] classifystrarray=str2.split("=");
				String classifystr1=classifystrarray[1];
				classify.setHrefName(classifystr1);
				courseDataGetService.saveClassify(classify);
				System.out.println(classifystr1);
				classify.setHrefName(classifystr1);
			    url="http://www.imooc.com"+str2;
			    html=getHtmlResource(url,encoding);			
				doc=Jsoup.parse(html);				
				Elements elementspageNum=doc.getElementsByClass("pager-total");
				int pageNum=Integer.parseInt(elementspageNum.get(0).text());
				System.out.println(str1+"++++++++共有++++"+pageNum);
				for (int p = 1; p < pageNum+1; p++) {
					url="http://www.imooc.com"+str2+"&page="+p;
					html=getHtmlResource(url,encoding);			
					doc=Jsoup.parse(html);
					Elements elements3=doc.getElementsByClass("course-one");
					System.out.println(elements3.size()+"本页有的数据数");
					for (int n = 0; n < elements3.size(); n++) {
						System.out.println(str1+"第"+n+"个课程");
						Course course=new Course();
						course.setClassify(classify);
						String coursename=elements3.get(n).getElementsByTag("img").get(0).attr("alt");
						course.setName(coursename);
						String imgsrc=elements3.get(n).getElementsByTag("img").get(0).attr("src");
						URL imgUrl = new URL(imgsrc);
						InputStream in = imgUrl.openStream();
						imgsrc=imgsrc.replace("http://img.mukewang.com/", "");
						FileOutputStream fo = new FileOutputStream(new File("src//main//webapp//resources//images//course//"+imgsrc));  
			            byte[] buf = new byte[1024]; 
			            int length = 0;  
			            while ((length = in.read(buf, 0, buf.length)) != -1) {  
			                fo.write(buf, 0, length);  
			            }  
			            in.close();  
			            fo.close();  
						imgsrc=imgsrc.replace("http://img.mukewang.com/", "");
			            imgsrc="resources/images/course/"+imgsrc;
			            course.setLogo(imgsrc);
						String courseSlogan=elements3.get(n).getElementsByTag("p").get(0).text();
						course.setSlogan(courseSlogan);
						String coursestr2=elements3.get(n).getElementsByTag("span").get(1).text();
						course.setStatus(coursestr2);
						String coursestr3=elements3.get(n).getElementsByTag("span").get(2).text();
						String[] strarray3=coursestr3.split(" 人");
						course.setLearnCount(Integer.parseInt(strarray3[0]));
						String str4=elements3.get(n).getElementsByTag("span").get(3).text();
						String[] strarray4=str4.split(" | ");
						course.setDuration(strarray4[0]);
						course.setLevel(strarray4[2]);
						url="http://www.imooc.com"+elements3.get(n).getElementsByTag("a").get(0).attr("href");
						html=getHtmlResource(url,encoding);
						doc=Jsoup.parse(html);
						Elements elements4=doc.getElementsByClass("course-brief");
						String coursestr5=elements4.get(0).getElementsByTag("p").get(0).text();
						course.setDescription(coursestr5);
						Elements elements5=doc.getElementsByClass("course-info-tip");
						if (elements5.size()!=0) {
							elements5=doc.getElementsByClass("course-info-tip").get(0).getElementsByTag("dd");
							if (elements5.size()==2) {
								String str6=elements5.get(0).text();
								String str7=elements5.get(1).text();
								str6=str6.replaceAll(" ", "<br/>");
								course.setInfo(str6);						
								str7=str7.replaceAll(" ", "<br/>");
								course.setLearnthing(str7);
							} else if (elements5.size()==1) {
								String str6=elements5.get(0).text();
								str6=str6.replaceAll(" ", "<br/>");
								course.setInfo(str6);
							}{
								
							}
						} 
						Elements elements6=doc.getElementsByClass("course-outline");
						String str8=elements6.get(0).getElementsByTag("li").get(0).text();
						String[] strarray8=str8.split("视");
						str8=strarray8[0];
						course.setVideoCount(Integer.parseInt(str8));
						String str9=elements6.get(0).getElementsByTag("li").get(1).text();
						String[] strarray9=str9.split("练");
						str9=strarray9[0];
						course.setExerciseCount(Integer.parseInt(str9));
						String str10=elements6.get(0).getElementsByTag("li").get(2).text();
						String[] strarray10=str10.split("编");
						str10=strarray10[0];
						course.setPracticeCount(Integer.parseInt(str10));
						course.setTeacherId("1");
						courseDataGetService.saveCourse(course);
						Elements elements7=doc.getElementsByClass("outline-list").get(0).getElementsByTag("li");
						for (int k = 0; k < elements7.size(); k++) {
						String str11=elements7.get(k).getElementsByTag("h5").get(0).text();
						String str12=elements7.get(k).getElementsByTag("p").get(0).text();
						Chapter chapter=new Chapter();
						chapter.setName(str11);
						chapter.setChapbrief(str12);
						chapter.setCourse(course);
						courseDataGetService.saveChapter(chapter);
						}
					   }
				}			
			}
		}
	}
}
