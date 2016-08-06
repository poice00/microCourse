package com.mc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mc.domain.Plan;
import com.mc.domain.Stage;
import com.mc.domain.User;
import com.mc.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanController  {
	@Resource
	private PlanService planService;
	
	/*学习计划列表*/
	@RequestMapping
	public String list(Model model,HttpSession session){
		List<Plan> planList=planService.findAll();
		
		model.addAttribute("planList", planList);
		User user=(User) session.getAttribute("currentUser");
		
		
//			int learned=0;
//			if (user!=null){
//			}
//			model.addAttribute("learned", learned);
	 return "/plan/list";
	 }
	 
	/*计划详情*/
	@RequestMapping("/detail/{PlanId}")
    public String view(@PathVariable("PlanId")Long PlanId,Model model,HttpSession session) throws Exception{
		Plan plan=planService.getById(PlanId);
		model.addAttribute("plan", plan);
//		List<Plan> planslist=planService.findAll();
//		model.addAttribute("planslist", planslist);
		/*阶段*/
		List<Stage> stageslist=planService.findAllStage(PlanId);
		model.addAttribute("stageslist", stageslist);
		
		//List<Chapter> chapterslist=chapterService.findByCourseId(course.getCourseId());
		//model.addAttribute("chapterslist", chapterslist);
			
		/*User user=(User) session.getAttribute("currentUser");
			
			
		int learned=0;
		if (user!=null){
				
			learned =planService.learned(user.getUserId(), plan.getPlanId());
			model.addAttribute("learned", learned);
				
		}*/
		
		/*分割知识点*/
		
		/*步骤*/
		/*List<Stage> stageList=planService.findAllStage(PlanId);
		for (Stage stage : stageList) {
			List<Step> step = planService.findStepByStageId(stage.getStageId());
			model.addAttribute("stepslist", step);
			
			for (Step s : step) {
				
				String[] koowledgePoint = s.getKnowledgePoint().split(",");
				
				List<String> knowledgePointList = new ArrayList<String>();
				for (String string : koowledgePoint) {
					knowledgePointList.add(string);
				}
				model.addAttribute("knowledgePointList",knowledgePointList);
				
				@SuppressWarnings("unchecked")
				List<Course> courseList = (List<Course>) s.getCourses();
				
			}
			List<ArrayList<ArrayList<Course>>> Course = null;
		}*/
		List<Stage> stepslist=planService.findAllStage(PlanId);
		model.addAttribute("stepslist", stepslist);
		
		//排行榜
		
		
		
		return "/plan/detail";
	}
	
	@RequestMapping("/detail/5")
	public String cpp(){
		return "/plan/cpp";
	}
}
