package com.dobee.services;

import com.dobee.dao.ProjectDao;
import com.dobee.vo.member.User;
import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;
import com.dobee.vo.project.UpcomingTask;
import com.dobee.vo.schedule.ProjectSchedule;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProjectService {


    @Autowired
    private SqlSession sqlSession;


    //특정 회원 프로젝트 리스트 가져오기
    public List<Project> projectList(String mail){
    	List<Project> pjtList = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	pjtList = projectdao.getPjtList(mail);    	
        return pjtList;
    }
    
    
    //특정 회원의 진행중인 프로젝트 리스트 가져오기
    public List<Project> getInProgressPjtList(String mail){
    	List<Project> pjtList = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	pjtList = projectdao.getInProgressPjtList(mail);
        return pjtList;
    }
    


    //프로젝트추가
    public int addProject(Project project){
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	result = projectdao.mkPjt(project);
    	return result;
    }
   
    
    //프로젝트 멤버 추가
    public int addProjectMember(List<ProjectMember> pjtMemberList) {
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	for (int i = 0; i<pjtMemberList.size(); i ++) {
    		result = projectdao.mkPjtMember(pjtMemberList.get(i));
    	}
    	return result;
    }

    
    //모든 프로젝트 가져오기
    public List<Project> getAllPjtList() {
    	List<Project>list = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	list = projectdao.getAllPjtList();
    	return list;
    }
    
    //특정 프로젝트 가져오기
    public Project getProject(int pjtSeq) {
    	Project project = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	project = projectdao.getPjt(pjtSeq);
    	return project;
    }
    
    //특정 프로젝트 멤버 정보(메일, 이름) 가져오기
    public List<User> getPjtMember(int pjtSeq) {
    	List<User> pjtMember = null;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	pjtMember = projectdao.getPjtMember(pjtSeq);
    	return pjtMember;
    }
    
    //프로젝트삭제
    @Transactional
    public int delProject(int pjtSeq){
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	result = projectdao.deletePjt(pjtSeq);
    	return result;
    }
    
    //프로젝트 수정
    public int updatePjt(Project project) {
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	result = projectdao.updatePjt(project);
    	return result;
    }
    
    
    //프로젝트 멤버 수정 
    public int deletePjtMember(int pjtSeq) {
    	int result = 0;
    	ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
    	result = projectdao.deletePjtMember(pjtSeq);
    	return result;
    }
  
    
    

    //업무리스트
    public List<Task> taskList(int pjtSeq){
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<Task> taskList = projectDao.taskList(pjtSeq);
    	return taskList;
    }


    //업무추가_PM
    public int addPMTask(Task task){
    	int result = 0;
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	result = projectDao.addPMTask(task);
    	//프로젝트 추가 후 tskSeq 반환함
    	
    	return result;
    }
    
    
    //특정업무 조회
    public Task getTask(int tskSeq) {
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	Task task = projectDao.getTask(tskSeq);
    	return task;
    }
    
    //특정업무 & 업무 일정 조회
    public Task getTaskAndSchedule(int tskSeq) {
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	Task task = projectDao.getTaskAndSchedule(tskSeq);
    	return task;
    }

    //업무추가
    public void addTask(){

    }


    //업무수정_PM
    public void modiTaskPM(){

    }


    //업무수정 --01.28 알파카 수정
    public int editTask(Task task){
    	int result = 0;
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	result = projectDao.editTask(task);
    	return result;
    }


    //업무삭제
    public int pmTaskDelete(int tskSeq){
    	System.out.println("ProjectService pmTaskDelete() in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.pmTaskDelete(tskSeq);
    	System.out.println(result);
    	return result;
    }


    //상세업무조회
    public List<TaskDetail> getTaskDetailList(int tskSeq){
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<TaskDetail> taskDetailList = projectDao.getTaskDetailList(tskSeq);
    	return taskDetailList;
    }


    // 상세업무입력
    public int addTaskDetail(TaskDetail taskDetail){
    	int result = 0;
    	int tdSeq = 0;
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	result = projectDao.addTaskDetail(taskDetail);
    	System.out.println("상세 업무 저장 완료");
    	System.out.println("저장된 tdSeq는?"+taskDetail.getTdSeq());
    	if(result > 0) {
        	tdSeq = taskDetail.getTdSeq();
    	} else {
    		tdSeq = 0;
    	}
    	return tdSeq;
    }


    //상세업무수정
    public int taskDetailEdit(TaskDetail taskDetail){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskDetailEdit(taskDetail);
    	return result;
    }


    //상세업무삭제 -- 01.28 알파카 수정
    public int taskDetailDelete(int tdSeq){
    	System.out.println("ProjectService taskDetailDelete in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskDetailDelete(tdSeq);
    	return result;
    }


    //체크리스트추가
    public int addTaskCheckList(CheckList checkList){
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.addTaskCheckList(checkList);
    	return result;
    }


    //체크리스트삭제
    public void delCheckList(){

    }


    //체크리스트 조회
    public List<CheckList> getTaskCheckList(int tskSeq){
        System.out.println("ProjectService getTaskCheckList() in");
        ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
        List<CheckList> taskCheckList = projectDao.getTaskCheckList(tskSeq);
    	return taskCheckList;
    }
    
    //체크리스트 내용 수정
    public int taskCheckListEditContent(CheckList checkList) {
    	System.out.println("ProjectService taskCheckListEdit() in");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskCheckListEditContent(checkList);
    	return result;
    }
    
    //체크리스트 체크 여부 수정
    public int taskCheckListIsCheck(CheckList checkList) {
    	int result = 0;
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	result = projectDao.taskCheckListIsCheck(checkList);
    	return result; 
    }
    
    
    //체크리스트 삭제
    public int taskCheckListDelete(CheckList checkList) {
    	System.out.println("ProjectService taskCheckListDelete() in!!");
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	int result = projectDao.taskCheckListDelete(checkList);
    	return result;
    }


    //프로젝트 분석
    public List<Task> projectChart(){
        return null;
    }
    
    //특정 프로젝트에서 특정인의 업무량 가져오기
    public int getMemberTaskCount(int pjtSeq, String mail) {
    	int result = 0;
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	result = projectDao.getMemberTaskCount(pjtSeq, mail);
    	return result;
    }
    
    //특정 프로젝트의 개인 업무 가져오기
    public List<Task> getMemberTask(int pjtSeq, String mail){
    	List<Task> taskList = new ArrayList<Task>();
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	taskList = projectDao.getMemberTask(pjtSeq, mail);
    	return taskList;
    }
    
    //특정 프로젝트의 개인의 완료일이 지난 업무 가져오기
    public List<Task> getOverdueTask(int pjtSeq, String mail){
    	List<Task> taskOverdueList = new ArrayList<Task>();
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	taskOverdueList = projectDao.getOverdueTask(pjtSeq, mail);
    	return taskOverdueList;
    }
    
    //특정 프로젝트의 개인의 오늘까지 남은 업무 가져오기
    public List<Task> getDeadlineTask(int pjtSeq, String mail){
    	List<Task> deadlineTaskList = new ArrayList<Task>();
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	deadlineTaskList = projectDao.getDeadlineTask(pjtSeq, mail);
    	return deadlineTaskList;
    }
    
    //특정 프로젝트의 개인의 남은 업무 가져오기
    
    public List<Task> getOtherTask(int pjtSeq, String mail){
    	List<Task> otherTaskList = new ArrayList<Task>();
    	ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
    	otherTaskList = projectDao.getOtherTask(pjtSeq, mail);
    	return otherTaskList;
    }

    
    
    
	
	 //특정 프로젝트의 개인의 완료된 업무 가져오기 
	 public List<Task> getCompletedTaskList(int pjtSeq, String mail){ 
		 List<Task> taskList = new ArrayList<Task>(); 
		 ProjectDao projectDao = sqlSession.getMapper(ProjectDao.class);
		 taskList = projectDao.getCompletedTaskList(pjtSeq, mail);
		 return taskList;

	 }
	 
	 // 마감임박 업무 리스트 GET			0131 게다죽 	COMPLETE
	 public List<UpcomingTask> getUpcomingTask(String mail) {
		 ProjectDao pDao = sqlSession.getMapper(ProjectDao.class);
		 List<UpcomingTask> utList = pDao.getUpcomingTask(mail);
		 
		 return utList;
	 }
}