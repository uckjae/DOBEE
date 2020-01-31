package com.dobee.dao;

import java.util.ArrayList;
import java.util.List;

import com.dobee.vo.member.User;
import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.GoogleDrive;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.ProjectMember;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;
import com.dobee.vo.project.UpcomingTask;
import com.dobee.vo.schedule.Schedule;

public interface ProjectDao {


    //프로젝트 생성
    public int mkPjt(Project project);
    
    //프로젝트 생성시 참여 멤버 추가 --01.15.알파카
    public int mkPjtMember(ProjectMember pjtMember);

    //모든 프로젝트 목록 가져오기 pm 회원용  --01.23.알파카
    public List<Project> getAllPjtList();
    
    //특정 회원이 속한 프로젝트 목록 가져오기
    public List<Project> getPjtList(String mail);
    
    //특정 프로젝트 가져오기
    public Project getPjt(int pjtSeq);
    
    //특정 프로젝트멤버 가져오기
    public List<User> getPjtMember(int pjtSeq);

    //프로젝트 삭제 -- 1.13 추가
    public int deletePjt(int pjtSeq); 
    
    //프로젝트 그룹 삭제 --01.15.알파카
    public int deletePjtMember(int pjtSeq);
    
    
    // 프로젝트 가져오기 --1.14 추가
 	public List<Task> getProject(int seq);
 	
 	
    //업무리스트
    public List<Task> taskList(int pjtSeq);

    
    //특정업무조회
    public Task getTask(int tskSeq);
    
    
    //업무추가 - PM 01.24 알파카 수정
    public int addPMTask(Task task);


    //업무추가 - 담당자
    public void addTask();
    
    
    //업무 삭제 -PM
    public int pmTaskDelete(int tskSeq);


    //상세업무 리스트
    public List<TaskDetail> getTaskDetailList(int tskSeq);


    //상세업무추가
    public int addTaskDetail(TaskDetail taskDetail);
    
    
    //상세업무삭제
    public int taskDetailDelete(int tdSeq);


    //체크리스트 조회
    public List<CheckList> getTaskCheckList(int tskSeq);


    //체크리스트 추가
    public int addTaskCheckList(CheckList checkList);
    
    
    //체크리스트 내용 수정
    public int taskCheckListEditContent(CheckList checkList);
    
    //체크리스트 체크 여부 수정
    public int taskCheckListIsCheck(CheckList checkList);
    
    //체크리스트 삭제
    public int taskCheckListDelete(CheckList checkList);

    //프로젝트 캘린더
    public List<Schedule> pjtSchedule();


    //상세업무수정
    public int taskDetailEdit(TaskDetail taskDetail);
    
    //업무수정
    public int editTask(Task task);
    
    //특정 프로젝트에서 특정인의 업무량 가져오기
    public int getMemberTaskCount(int pjtSeq, String mail);
    
    //특정 프로젝트의 개인 업무 가져오기
    public List<Task> getMemberTask(int pjtSeq, String mail);
    
    //특정 프로젝트의 개인의 완료된 업무 가져오기
    public List<Task> getCompletedTaskList(int pjtSeq, String mail);
    
    
    //특정 프로젝트의 구글 드라이브 리스트 가져오기
    public ArrayList<GoogleDrive> loadTimeline(int pjtSeq);
    
    
    //특정 프로젝트 구글 드라이브 업로드
    public int addGoogleTag(GoogleDrive gd);
    
    
	// 마감임박 업무 리스트 GET			0131 게다죽 	COMPLETE
    public List<UpcomingTask> getUpcomingTask(String mail);

}
