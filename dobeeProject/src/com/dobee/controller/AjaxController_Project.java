package com.dobee.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	ProjectService projectService;
	
	
	//프로젝트 추가 --01.15 알파카
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(@RequestParam(value="pjtName") String pjtName,@RequestParam(value="pjtStartAt") String pjtStartAt, @RequestParam(value="pjtEndAt") String pjtEndAt,@RequestParam(value="pjtMembers[]") List<String> pjtMembers ){
		System.out.println("플젝 이름"+pjtName);
		System.out.println("플젝11"+pjtStartAt);
		System.out.println("플젝22"+pjtEndAt);
		System.out.println("플젝33"+pjtMembers.toString());
		
		//vo 객체 주입
		Project project = new Project();
		project.setPjtName(pjtName);
		project.setPjtStartAt(pjtStartAt);
		project.setPjtEndAt(pjtEndAt);
		//프로젝트 생성시 진행 상태를 미완료로 하기
		project.setPjtProgress("미완료"); 
		String responseData = "";
		int result = 0;
		int result2 = 0;
		
		//프로젝트 DB 저장
		result = projectService.addProject(project);
	
		
		if(result > 0) {
			//플젝 seq 가져오기
			int pjtSeq = project.getPjtSeq();
			//프로젝트 멤버 DB 저장
			
			//들어온 메일 개수만큼 vo 객체 만들어주기
			List<ProjectMember> pjtMemberList = new ArrayList<ProjectMember>();
			for (int i = 0; i < pjtMembers.size(); i ++) {
				ProjectMember pjtMember = new ProjectMember();
				pjtMember.setPjtSeq(pjtSeq);
				pjtMember.setMail(pjtMembers.get(i));
				pjtMemberList.add(pjtMember);
			}
			result2 = projectService.addProjectMember(pjtMemberList);
			
			if(result2 > 0 ) {
				responseData = "success";				
			}
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
	
	
	//특정 업무 가져오기
	@RequestMapping("getTask.do")
	public Task getTask(int tskSeq) {
		System.out.println("AjaxController_Project getTask() in");
		Task task = new Task();
		task = projectService.getTask(tskSeq);
		System.out.println(task.toString());
		return task;
		
	}
	
	//업무 삭제 --01.23 알파카
	@RequestMapping("PMTaskDelete.do")
	public String pmTaskDelete(@RequestParam(value="tskSeq")String tskSeq) {
		String responseData = "";
		int result = projectService.pmTaskDelete(Integer.parseInt(tskSeq));
		if( result > 0 ) {
			responseData = "success";
		}
		return responseData;
		
		
	}
	
	//특정업무의 TaskDetailList
	@RequestMapping("getTaskDetailList.do")
	public List<TaskDetail> getTaskDetailList(int tskSeq){
		System.out.println("AjaxController_Project getTaskDetailList() in");
		List<TaskDetail> taskDetailList = projectService.getTaskDetailList(tskSeq); 
		System.out.println(taskDetailList);
		return taskDetailList;
	}
	
	
	//TaskDetail 추가 -- 01.26 알파카
	@RequestMapping("addTaskDetail.do")
	public Map<String, String> addTaskDetail(TaskDetail taskDetail, HttpServletRequest req) {
		System.out.println("상세 업무 가져와?"+taskDetail.toString());
		Map<String, String> map = new HashMap<String, String>();
		int tdSeq = 0;
		tdSeq = projectService.addTaskDetail(taskDetail);
		if(tdSeq > 0) {
			map.put("result", "success");
			map.put("tdSeq", Integer.toString(tdSeq));
		}
		return map;
	}
	/*
	
	//TaskDetail 추가
	@RequestMapping("addTaskDetail.do")
	public int addTaskDetail(TaskDetail taskDetail,HttpServletRequest req) {
		System.out.println("AjaxController_Project addTaskDetail() in");
		System.out.println(taskDetail.toString());
		Enumeration enu = req.getParameterNames();
		while(enu.hasMoreElements()) {
			System.out.println("while!!");
			System.out.println(enu.nextElement());
		}
		projectService.addTaskDetail(taskDetail);
		return 0;
	}
	*/
	//TaskDetailEdit
	@RequestMapping("taskDetailEdit.do")
	public String taskDetailEdit(TaskDetail taskDetail) {
		System.out.println("AjaxController_Project taskDetailEdit() in!!");
		String responseData = "";
		int result = projectService.taskDetailEdit(taskDetail);
		if(result>0) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
	
	//업무상세 제거
	@RequestMapping("taskDetailDelete.do")
	public String taskDetailDelete(@RequestParam(value="tdSeq") String tdSeq, HttpServletRequest req) {
		System.out.println("AjaxController_Project taskDetailDelete() in!!");
		System.out.println("tdSeq 가져오니?"+tdSeq);
		String responseData = "";
		int result = projectService.taskDetailDelete(Integer.parseInt(tdSeq));
		if(result > 0 ) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
	//체크리스트 추가
	@RequestMapping("addTaskCheckList")
	public Map<String, String> addTaskCheckList(CheckList checkList) {
		int result = 0;
		Map<String, String> map = new HashMap<String, String>();
		
		System.out.println("AjaxController_Project addTaskCheckList() in!!");
		System.out.println("체크리스트 가져오니?"+checkList.toString());
		result = projectService.addTaskCheckList(checkList);
		if(result > 0 ) {
			map.put("result", "success");
			map.put("chkSeq", Integer.toString(checkList.getChkSeq()));
		} else {
			map.put("result", "fail");
		}
		return map;
	}
	
	
	//특정업무의 체크리스트 가져오기
	@RequestMapping("getTaskCheckList.do")
	public List<CheckList> getTaskCheckList(int tskSeq){
		System.out.println("AjaxController_Project getTaskCheckList() in!!");
		List<CheckList> taskCheckList = projectService.getTaskCheckList(tskSeq);
		System.out.println(taskCheckList);
		return taskCheckList;
	}
	
	//체크리스트 내용만 수정
	@RequestMapping("taskCheckListEdit")
	public String taskCheckListEdit(@RequestParam(value="chkSeq") String chkSeq, @RequestParam(value="content") String content, HttpServletRequest req) {
		System.out.println("AjaxControll_Project taskCheckListEdit() in!!");
		String responseData = "";
		//vo 객체 주입 {'chkSeq' : chkSeq, 'content' : content }
		CheckList checkList = new CheckList();
		checkList.setChkSeq(Integer.parseInt(chkSeq));
		checkList.setContent(content);
		System.out.println("값이 오니?" + checkList.toString());
		
		int result = projectService.taskCheckListEditContent(checkList);
		if(result > 0) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
	//체크리스트 체크 여부 수정
	@RequestMapping("taskCheckListIsCheck")
	public String taskCheckListIsCheck(CheckList checkList, HttpServletRequest request) {
		if(request.getParameter("isCheck") == "0") {
			checkList.setCheck(false);
		} else {
			checkList.setCheck(true);
		}
		String responseData = "";
		int result = projectService.taskCheckListIsCheck(checkList);
		if(result > 0) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
	//업무 체크리스트 제거
	@RequestMapping("taskCheckListDelete.do")
	public String taskDetailDelete(@RequestParam(value="chkSeq") String chkSeq) {
		System.out.println("AjaxController_Project taskDetailDelete() in!!");
		System.out.println("체크 리스트 번호 가져와?"+chkSeq);
		String responseData = "";
		int result = projectService.taskCheckListDelete(Integer.parseInt(chkSeq));
		if(result > 0) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
}