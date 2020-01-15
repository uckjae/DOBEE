package com.dobee.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.ProjectDao;
import com.dobee.services.ProjectService;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	ProjectService projectService;
	
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(Project project, ProjectMember member){
		System.out.println("이거 타니??");
		
		System.out.println("프로제긑"+project);
		System.out.println("메메메멤ㅁ"+member);
		//projectService.addProject(project);
    	return null;
    	
    }
	/*
	@RequestMapping("projectDetail.do")
	public String getProjectList(int seq){
		ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
		List<Task> projectList = projectDao.getProject(seq);
		return "project/kanban";
	}

	
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(@RequestParam(value="pjtName") String pjtName, @RequestParam(value="pjtStartAt") String pjtStartAt, @RequestParam(value="pjtEndAt") String pjtEndAt, @RequestParam(value="pjtUserList[]") List<String> pjtUserList){
		System.out.println("컨트롤러로 값 넘어오니?" + pjtName +"/"+pjtStartAt+"/"+pjtEndAt);
		System.out.println("참여자들 넘어오니?"+pjtUserList.toString());
		
		//projectService.addProject(project);
    	return null;
    	
    }
	*/
	
}