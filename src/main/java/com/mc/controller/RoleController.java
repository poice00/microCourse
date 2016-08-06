package com.mc.controller;

import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mc.annotation.SystemControllerLog;
import com.mc.domain.Privilege;
import com.mc.domain.Role;
import com.mc.service.PrivilegeService;
import com.mc.service.RoleService;

@Controller
@RequestMapping("/admin/role")
public class RoleController  {
	
	@Resource
	private RoleService roleService;
	@Resource
	private PrivilegeService privilegeService;
	
	
	
	
	/** 列表 */
	@RequestMapping("/list")
	@SystemControllerLog(description = "角色列表") 
	public String list(Model model) throws Exception {
		List<Role> roleList = roleService.findAll();
		model.addAttribute("roleList", roleList);
		return "/role/list";
	}

	/** 删除 */
	@RequestMapping(value = "/delete")
	@SystemControllerLog(description = "角色删除") 
	public String delete(Long id) throws Exception {
		System.out.println("=================" + id);
		roleService.delete(id);
		return "redirect:list";
	}

	/** 添加页面 */
	@RequestMapping("/addUI")
	public String addUI(Model model) throws Exception {
		List<Privilege> privilegeList = this.privilegeService.findAll();
		model.addAttribute("privilegeList", privilegeList);
		return "/role/addUI";
	}

	/** 添加 */
	/** 切入不进去？？*/
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	@SystemControllerLog(description = "新建角色")  
	public String add(Role role,RedirectAttributes redirectAttributes,Long[] privilegeIds) throws Exception {
		List<Privilege> privilegeList = privilegeService.getByIds(privilegeIds);
		role.setPrivilege(new HashSet<Privilege>(privilegeList));
		
		System.out.println(role.getName() + "-" + role.getDescription());
		this.roleService.save(role);
		return "redirect:list";	
	}

	/** 修改页面 */
	@RequestMapping("/editUI")
	public String editUI(Long id,Model model,Long[] privilegeIds) throws Exception {
		Role role = roleService.getById(id);
		model.addAttribute("role", role);
		
		if(role.getPrivilege()!=null){
			privilegeIds = new Long[role.getPrivilege().size()];
			int index = 0 ;
			for(Privilege privilege:role.getPrivilege()){
				privilegeIds[index++] = privilege.getId();
			}
		}
		
		List<Privilege> privilegeList = this.privilegeService.findAll(); 
		model.addAttribute("privilegeList", privilegeList);
		model.addAttribute("privilegeIds", privilegeIds);
		
		return "/role/editUI";
	}

	/** 修改 */
	//此处为记录AOP拦截Controller记录用户操作  
	@RequestMapping(value = "/edit")
	@SystemControllerLog(description = "角色修改")  
	public String edit(Long id,Role role,Long[] privilegeIds) throws Exception {
		Role r = roleService.getById(id);
		
		r.setName(role.getName());
		r.setDescription(role.getDescription());
		
		List<Privilege> privilegeList = privilegeService.getByIds(privilegeIds);
		r.setPrivilege(new HashSet<Privilege>(privilegeList));
		
		roleService.update(r);
		return "redirect:list";
	}
	
	
}
