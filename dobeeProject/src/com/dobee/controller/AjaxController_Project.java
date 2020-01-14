package com.dobee.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.ProjectDao;
import com.dobee.vo.project.Task;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("projectDetail.do")
	public String getProjectList(int seq){
		ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
		List<Task> projectList = projectDao.getProject(seq);
		return "project/kanban";
	}
}