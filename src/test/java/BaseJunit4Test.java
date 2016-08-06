import java.util.List;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mc.domain.Topic;
import com.mc.service.ObjectTagService;
import com.mc.service.PlanService;
import com.mc.service.SnsService;
import com.mc.service.TopicService;
import com.mc.service.TypeService;

import net.sf.json.JSONArray;

/**
 * Spring的单元测试
 * @author sys
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试  
@ContextConfiguration
(locations = { "classpath*:applicationContext.xml", "classpath*:spring-context.xml" }) 
 //加载配置文件  
//-
public class BaseJunit4Test {
	@Resource
    ApplicationContext ac;
	
	@Test
	public void testSessionFactory() throws Exception {
		SessionFactory sf = (SessionFactory) ac.getBean("sessionFactory");
//		System.out.println(sf);
		
	}
	@Test
	public void testBeans() throws Exception {
//		UserController userController = (UserController) ac.getBean("userController");
//		System.out.println(userController);
		
//		UserService userService = (UserService) ac.getBean("userServiceImpl");
//		System.out.println(userService);
		
		ObjectTagService objectTagService = (ObjectTagService) ac.getBean("objectTagServiceImpl");
		TypeService typeService = (TypeService) ac.getBean("typeServiceImpl");
		TopicService topicService = (TopicService) ac.getBean("topicServiceImpl");
		SnsService snsService = (SnsService) ac.getBean("snsServiceImpl");
		PlanService planService = (PlanService) ac.getBean("planServiceImpl");
		
		
		/*List<Tag> tags = objectTagService.findAllTag();
		for (Tag tag : tags) {
			System.out.println(tag.getTagId() + "===" + tag.getName());
		}*/
		
		/*测试标签使用次数加1
		objectTagService.addTagUsedTimesByOne(2);*/
		
		/*选择使用次数前20的tag
		List<Tag> tags = objectTagService.findTop20Tag();
		for (Tag tag : tags) {
			System.out.println(tag.getTagId() + "===" + tag.getName());
		}*/
		
		/*查询问题的回复
		List<Sns> sns = topicService.findAllReplyById(13);
		for (Sns s : sns) {
			System.out.println(s.getContent());
		}*/
		
		/*查询如评论、点赞、浏览等次数
		System.out.println("===次数" + snsService.getSocialBehaviorCountById(13, 1, 11));*/
		
		/*获取指定sns对象*/
		/*List<Sns> snsList = snsService.getSpecial(14, 20, 1, typeService.getByName("关注").getTypeId());
		for (Sns sns : snsList) {
			System.out.println(sns.getUserId());
		}*/
		
		/*查询所有回复*/
		/*List<CommentOfReply> corList = snsService.getCommentsById(11);
		
		for (CommentOfReply cor : corList) {
			System.out.println(JSONObject.fromObject("{'result':0,reples:" + JSONObject.fromObject(cor) + "}"));
		}*/
		
		/*搜索类似问题*/
		/*List<Topic> similarTopics = topicService.findSimilar("闫宝彬");
		for (Topic topic : similarTopics) {
			System.out.println("id:" + topic.getTopicId() + "title:" + topic.getTitle() + "content:" + topic.getContent());
		}
		
		System.out.println(JSONArray.fromObject(similarTopics).toString());*/
		
		System.out.println(planService.findAll());
	}
	
}
