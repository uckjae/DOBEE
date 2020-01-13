package com.dobee.dao;

import com.dobee.vo.project.CheckList;
import com.dobee.vo.project.Project;
import com.dobee.vo.project.Task;
import com.dobee.vo.project.TaskDetail;
import com.dobee.vo.schedule.Schedule;

import java.util.List;

public interface ProjectDao {


    //프로젝트 생성
    public void mkPjt();


    //프로젝트 목록
    public List<Project> getPjt(Project project);


    //업무리스트
    public List<Task> taskList();


    //업무추가 - PM
    public void addPMTask();


    //업무추가 - 담당자
    public void addTask();


    //상세업무 리스트
    public List<TaskDetail> taskDetailList();


    //상세업무추가
    public void addTaskDetail();


    //체크리스트 조회
    public List<CheckList> checkList();


    //체크리슨트 추가
    public void addCheckList();


    //프로젝트 캘린더
    public List<Schedule> pjtSchedule();



}
