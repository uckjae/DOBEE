package com.dobee.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.ProjectDao;
import com.dobee.services.ProjectService;
import com.dobee.vo.member.User;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	ProjectService projectService;
	
	
	//프로젝트 추가 --01.15 알파카
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(Project project, @RequestParam(value="mail[]") List<String> pjtMembersMail){
		
		System.out.println("추가할 때 메일 가져오니?"+pjtMembersMail.toString());
		String responseData = "";
		int result = 0;
		int result2 = 0;
		//프로젝트 생성시 진행 상태를 미완료로 하기
		project.setPjtProgress("미완료"); 
		
		//프로젝트 DB 저장
		result = projectService.addProject(project);
		
		String pjtName = project.getPjtName();
		
		if(result > 0) {
			//프로젝트 멤버 DB 저장
			result2 = projectService.addProjectMember(pjtName, pjtMembersMail);
			responseData = "success";
		}
    	return responseData;
    }
	
	//프로젝트 삭제 --01.15 알파카 (아직 완전 구현xxxx)
	@RequestMapping(value="pjtDelete.do", method=RequestMethod.POST)
	public String deleteProject(@RequestParam(value="pjtSeq") String pjtSeq) {
		String responseData = "";
		int result = 0;
		result = projectService.delProject(Integer.parseInt(pjtSeq));
		if(result > 0 ) {
			responseData = "success";
		} else {
			responseData = "failure";
		}
		return responseData;
	}
	
	
	//프로젝트 수정 --01.15 알파카
	@RequestMapping(value="pjtUpdate.do", method=RequestMethod.POST)
	public String updateProject(@RequestParam(value="pjtSeq") String pjtSeq) {
		return null;
	}
	
	//특정 프로젝트 가져오기
	@RequestMapping(value="getPjt.do", method=RequestMethod.POST)
	public Project getProject(@RequestParam(value="pjtSeq") String pjtSeq) {
		Project project = null;
		project = projectService.getProject(Integer.parseInt(pjtSeq));
		return project;
	}
	
	//특정 프로젝트 멤버가져오기
	@RequestMapping(value="getPjtMember.do", method=RequestMethod.POST)
	public List<User> getPjtMember(@RequestParam(value="pjtSeq") String pjtSeq) {
		System.out.println("AjaxContorller_Project getPjtMember() in!!");
		List<User> pjtMember = null;
		pjtMember = projectService.getPjtMember(Integer.parseInt(pjtSeq));
		return pjtMember;
	}
	
	
	//특적 업무 가져오기
	@RequestMapping("getTask.do")
	public Task getTask(int tskSeq) {
		System.out.println("AjaxController_Project getTask() in");
		Task task = new Task();
		task = projectService.getTask(tskSeq);
		System.out.println(task.toString());
		return task;
		
	}
	
	
	
}