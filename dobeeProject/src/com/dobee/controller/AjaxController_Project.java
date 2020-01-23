package com.dobee.controller;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.ProjectService;
import com.dobee.vo.member.User;
import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	ProjectService projectService;
	
	
	//프로젝트 추가 --01.15 알파카
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(Project project, @RequestParam(value="mail[]") List<String> pjtMembersMail){
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
	
	//특정업무의 TaskDetailList
	@RequestMapping("getTaskDetailList.do")
	public List<TaskDetail> getTaskDetailList(int tskSeq){
		System.out.println("AjaxController_Project getTaskDetailList() in");
		List<TaskDetail> taskDetailList = projectService.getTaskDetailList(tskSeq); 
		System.out.println(taskDetailList);
		return taskDetailList;
	}
	
	
	//TaskDetail 추가
	@RequestMapping("addTaskDetail.do")
	public int addTaskDetail(TaskDetail taskDetail,HttpServletRequest req) {
		System.out.println("AjaxController_Project addTaskDetail() in");
		System.out.println(taskDetail);
		Enumeration enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			System.out.println("while!!");
			System.out.println(enu.nextElement());
		}
		projectService.addTaskDetail(taskDetail);
		return 0;
	}
	
	//TaskDetailEdit
	@RequestMapping("taskDetailEdit.do")
	public int taskDetailEdit(TaskDetail taskDetail) {
		System.out.println("AjaxController_Project taskDetailEdit() in!!");
		System.out.println(taskDetail);
		int tdSeq = taskDetail.getTdSeq();
		int tskSeq = taskDetail.getTskSeq();
		int result = projectService.taskDetailEdit(taskDetail);
		if(result<=0) {
			System.out.println("taskDetailEdit() 에러");
		}
		return tskSeq;
	}
	
	
	//업무상세 제거
	@RequestMapping("taskDetailDelete.do")
	public int taskDetailDelete(TaskDetail taskDetail,HttpServletRequest req) {
		System.out.println("AjaxController_Project taskDetailDelete() in!!");
		Enumeration<String> enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			System.out.println("while문");
			System.out.println(enu.nextElement());
		}
		int result = projectService.taskDetailDelete(taskDetail);
		
		return 0;
	}
	
	
	//체크리스트 추가
	@RequestMapping("addTaskCheckList")
	public int addTaskCheckList(CheckList checkList) {
		System.out.println("AjaxController_Project addTaskCheckList() in!!");
		int result = projectService.addTaskCheckList(checkList);
		return result;
	}
	
	
	//특정업무의 체크리스트 가져오기
	@RequestMapping("getTaskCheckList.do")
	public List<CheckList> getTaskCheckList(int tskSeq){
		System.out.println("AjaxController_Project getTaskCheckList() in!!");
		List<CheckList> taskCheckList = projectService.getTaskCheckList(tskSeq);
		System.out.println(taskCheckList);
		return taskCheckList;
	}
	
	//체크리스트 수정
	@RequestMapping("taskCheckListEdit")
	public int taskCheckListEdit(CheckList checkList,HttpServletRequest req) {
		System.out.println("AjaxControll_Project taskCheckListEdit() in!!");
		if(req.getParameter("isCheck").equals("0")) {
			checkList.setCheck(false);
		}else {
			checkList.setCheck(true);
		}
		Enumeration<String> enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			System.out.println("while돈다!!");
			System.out.println(enu.nextElement());
		}
		int result = projectService.taskCheckListEdit(checkList);
		return result;
	}
	
	
	//업무상세 제거
		@RequestMapping("taskCheckListDelete.do")
		public int taskDetailDelete(CheckList checkList) {
			System.out.println("AjaxController_Project taskDetailDelete() in!!");
			
			int result = projectService.taskCheckListDelete(checkList);
			
			return result;
		}
	
	
}