package com.dobee.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.MemberService;
import com.dobee.services.ProjectService;
import com.dobee.services.ScheduleService;
import com.dobee.services.TimeLineService;
import com.dobee.vo.member.User;
import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.GoogleDrive;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;
import com.dobee.vo.schedule.Schedule;
import com.google.common.net.MediaType;



@RestController
@RequestMapping("ajax/project/**")
public class AjaxController_Project {
	
	@Autowired
	ProjectService projectService;
	@Autowired
	MemberService memberService;
	@Autowired
	TimeLineService timelineService;
	@Autowired
	ScheduleService scheduleService;
	
	
	//프로젝트 추가 --01.15 알파카
	@RequestMapping(value="pjtAdd.do", method=RequestMethod.POST)
    public String addProject(Project project, Schedule sc){
		String responseData = "";
		String result = "";
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int pjtSeq = 0;
		
		//프로젝트 DB 저장
		result1 = projectService.addProject(project);
		
		//일정 추가
		result2 = scheduleService.addSchedule(sc);
		
		if(result1 > 0 && result2 > 0) {
			//플젝 seq 가져오기
			pjtSeq = project.getPjtSeq();
			int schSeq = sc.getSchSeq();
						
			//프로젝트 일정 추가
			result3 = scheduleService.addPjtSchedule(pjtSeq, schSeq);
			if(result3 > 0) {
				responseData = Integer.toString(pjtSeq);
			}
			
		} else {
			responseData = "ajax fail";
		}
				
    	return responseData; //ajax 통신 성공시 pjtSeq를 던져줌
    }
	
	//프로젝트 참여자 추가
	@RequestMapping(value="addPjtMember.do", method=RequestMethod.POST)
	public String addPjtMember(@RequestParam(value="pjtMembers[]") List<String> pjtMembers, @RequestParam(value="pjtSeq") String pjtSeq) {
		int result = 0;
		String responseData = "";
		//들어온 메일 개수만큼 vo 객체 만들어주기
		List<ProjectMember> pjtMemberList = new ArrayList<ProjectMember>();
		for (int i = 0; i < pjtMembers.size(); i ++) {
			ProjectMember pjtMember = new ProjectMember();
			pjtMember.setPjtSeq(Integer.parseInt(pjtSeq));
			pjtMember.setMail(pjtMembers.get(i));
			pjtMemberList.add(pjtMember);
		}
		result = projectService.addProjectMember(pjtMemberList);
		
		if(result > 0 ) {
			responseData = "success";
			
		} else {
			responseData = "fail";
		}
		return responseData;
		
	}
	
	
	//프로젝트 삭제 --01.15 알파카
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
	public String updateProject(Project project,  Schedule sc) {
		System.out.println("플젝 어케 나와?"+project.toString());
		String responseData = "";
		//프로젝트 수정
		int result1 = projectService.updatePjt(project);
		//일정 수정
		int result2 = scheduleService.scheduleModify(sc);
		
		if(result1 > 0 && result2 > 0 ) {
			responseData = "success";
		} else {
			responseData = "failure";
		}
		return responseData;
	}
	
	//프로젝트 수정 -> 참여자 수정
	@RequestMapping(value="updatePjtMember.do", method=RequestMethod.POST)
	public String updatePjtMember(@RequestParam(value="pjtMembers[]") List<String> pjtMembers, @RequestParam(value="pjtSeq") String pjtSeq) {
		int result1 = 0;
		int result2 = 0;
		String responseData = "";
		
		//일단 원래 있던 projectmember 테이블의 컬럼 삭제하기
		result1 = projectService.deletePjtMember(Integer.parseInt(pjtSeq));
		
		if(result1 > 0) {
			//들어온 메일 개수만큼 vo 객체 만들어주기
			List<ProjectMember> pjtMemberList = new ArrayList<ProjectMember>();
			for (int i = 0; i < pjtMembers.size(); i ++) {
				ProjectMember pjtMember = new ProjectMember();
				pjtMember.setPjtSeq(Integer.parseInt(pjtSeq));
				pjtMember.setMail(pjtMembers.get(i));
				pjtMemberList.add(pjtMember);
			}
			result2 = projectService.addProjectMember(pjtMemberList);
		}
		
		
		System.out.println("서비스는?"+result2);
		
		if(result2 > 0 ) {
			responseData = "success";
			
		} else {
			responseData = "failure";
		}
		
		return responseData;
		
	}
	
	
	
	
	//특정 프로젝트 가져오기
	@RequestMapping(value="getPjt.do", method=RequestMethod.POST)
	public Project getProject(@RequestParam(value="pjtSeq") String pjtSeq) {
		System.out.println("이거 타????");
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
	
	//특정 프로젝트 & 멤버 가져오기 getPjtAndMember.do
	@RequestMapping(value="getPjtAndUser.do", method=RequestMethod.POST)
	public Map<String, Object> getPjtAndMember(@RequestParam(value="pjtSeq") String pjtSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//프로젝트 정보 가져오기
		Project project = projectService.getProject(Integer.parseInt(pjtSeq));
		map.put("project", project);
		
		//프로젝트에 속한 멤버 정보 가져오기
		List<User> user = projectService.getPjtMember(Integer.parseInt(pjtSeq));
		map.put("user", user);
		
		Schedule sc = scheduleService.getPjtSchedule(Integer.parseInt(pjtSeq));
		System.out.println("스케쥴은 가져오니?"+sc.toString());
		map.put("schedule", sc);
		
		System.out.println(map.toString());
		
		return map;
	}
	
	//특정 업무 가져오기
	@RequestMapping("getTask.do")
	public Task getTask(int tskSeq) {
		System.out.println("AjaxController_Project getTask() in");
		Task task = new Task();
		
		boolean checkTsseq = scheduleService.getTsSeq(tskSeq); //업무 일정 번호가 있는지 없는지 체크
		System.out.println("업무 일정 번호 있니?"+checkTsseq);
		if(checkTsseq) { //업무 일정 번호가 있다면
			task = projectService.getTaskAndSchedule(tskSeq);
		} else {
			task = projectService.getTask(tskSeq);
		}
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
	public String taskCheckListEdit(CheckList checkList) {
		System.out.println("AjaxControll_Project taskCheckListEdit() in!!");
		String responseData = "";
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
	public String taskDetailDelete(CheckList checkList) {
		System.out.println("AjaxController_Project taskDetailDelete() in!!");
		System.out.println("체크 리스트 번호 가져와?"+checkList.toString());
		String responseData = "";
		int result = projectService.taskCheckListDelete(checkList);
		if(result > 0) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		return responseData;
	}
	
	
	//멤버 가져오기
	@RequestMapping("getUserList.do")
	public List<Map<String, String>> getUserList() { 
		
		
		Map<String, String> map = new HashMap<String, String> ();
		List<Map<String, String>> jsonList = new ArrayList<Map<String, String>>(); 
		
		List<User> users = memberService.getUserList();
		//List<String> id = new ArrayList<String>();
		//List<String> text = new ArrayList<String>();
		for(int i = 0; i < users.size(); i++) {
			System.out.println("메일??"+users.get(i).getMail());
			map.put("id", users.get(i).getMail());
			map.put("text", users.get(i).getName());
			jsonList.add(map);
		}
		System.out.println("데이터!!!!"+map.toString());
		
		
		System.out.println("jsonlist"+jsonList.toString());
    	
		return jsonList;
	}
	
	/*차트*/
	
	//프로젝트 전체 진행률 차트 getPjtProgressChart
	
	@RequestMapping("getPjtProgressChart.do")
	public List<Task> getPjtProgressChart(@RequestParam(value="pjtSeq") String pjtSeq, HttpServletRequest request) {
		//프로젝트의 전체 업무 가져오기
		List<Task> taskList = projectService.taskList(Integer.parseInt(pjtSeq));
		return taskList;
	}
	
	
	//프로젝트 담당자별 업무 진행도 차트
	@RequestMapping("getMembersTaskChart.do")
	public Map<String, Integer> getMembersTaskChart(@RequestParam(value="pjtSeq") String pjtSeq, HttpServletRequest request){
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		//프로젝트 참여자 가져오기
		List<User> pjtMember = projectService.getPjtMember(Integer.parseInt(pjtSeq));
		
		//각 참여자의 task 가져오기
		for(int i = 0; i<pjtMember.size(); i++) {
			String mail = pjtMember.get(i).getMail();
			String name = pjtMember.get(i).getName();
			//각 참여자의 할당된 모든 task 가져오기
			List<Task> taskList = projectService.getMemberTask(Integer.parseInt(pjtSeq), mail);
			//각 참여자의 완료된 task 가져오기
			List<Task> completedTaskList = projectService.getCompletedTaskList(Integer.parseInt(pjtSeq), mail);
			
			//전체 할당된 업무 중 완료된 task의 퍼센트 계산하기
			int result = (completedTaskList.size()*100/taskList.size());		// 이거 try catch 걸어야 할것 같습니다. size() null 인경우 터짐
			map.put(name, result);
		}
				
		return map;
		
	}
	
	//프로젝트 업무 할당 차트
	@RequestMapping("getTaskAssignmentChart.do")
	public Map<String, Integer> getTaskAssignmentChart(@RequestParam(value="pjtSeq") String pjtSeq, HttpServletRequest request) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		//프로젝트에 속한 멤버 정보 가져오기
		List<User> pjtMember = projectService.getPjtMember(Integer.parseInt(pjtSeq));
		//특정 참여자의 업무량 가져오기
		for(int i = 0;i<pjtMember.size(); i++) {
			String pjtMemberName = pjtMember.get(i).getName();
			String pjtMemberMail = pjtMember.get(i).getMail();
			int result = projectService.getMemberTaskCount(Integer.parseInt(pjtSeq), pjtMemberMail);
			map.put(pjtMemberName, result);
		}
		return map;
	}
	
	//개인별 업무 달성도 차트 >> 개인의 task 가져오기
	@RequestMapping("getMemberTaskChart.do")
	public List<Task> getMemberTaskChart(@RequestParam(value="pjtSeq") String pjtSeq, Principal principal, HttpServletRequest request){
		String mail = principal.getName();
		List<Task> taskList = projectService.getMemberTask(Integer.parseInt(pjtSeq), mail);
		return taskList;
	}
	
	//내 업무 현황
	@RequestMapping("getMyTask.do")
	public Map<String, List<Task>> getMyTask(@RequestParam(value="pjtSeq") String pjtSeq, Principal principal, HttpServletRequest request){
		String mail = principal.getName();
		Map<String, List<Task>> map = new HashMap<String, List<Task>>();
				
		//완료일 지남
		List<Task> overdueTaskList = projectService.getOverdueTask(Integer.parseInt(pjtSeq), mail);
		map.put("overdueTaskList", overdueTaskList);
		
		//3일 남음
		List<Task> deadlineTaskList = projectService.getDeadlineTask(Integer.parseInt(pjtSeq), mail);
		map.put("deadlineTaskList", deadlineTaskList);
		
		
		//나머지 리스트
		List<Task> otherTaskList = projectService.getOtherTask(Integer.parseInt(pjtSeq), mail);
		map.put("otherTaskList", otherTaskList);
		
		//JSONArray jsonArray = new JSONArray();
    	//jsonArray.addAll(taskList);
		
		
		return map;
	}
	
	
	
	
	
	
}