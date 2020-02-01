package com.dobee.dao;

import java.util.List;

import com.dobee.vo.project.Project;
import com.dobee.vo.schedule.MainSchedule;
import com.dobee.vo.schedule.Schedule;

public interface ScheduleDao {

    //일정 등록 -- 01.21 알파카 수정
    public int addSchedule(Schedule sc);
    
    //일정 가져오기  -- 01.21 알파카 수정
    public Schedule getSchedule(int schSeq);
    
    //일정 수정하기 -- 01.22 알파카
    public int scheduleModify(Schedule sc);
    
    //프로젝트 일정 추가하기 --02.01 알파카
    public int addPjtSchedule(int pjtSeq, int schSeq);

    // 공지사항,업무,프로젝트 일정 캘린더 병합		0130	게다죽		COMPELTE
    public List<MainSchedule> ntpToCalendar(String mail);
    
}
