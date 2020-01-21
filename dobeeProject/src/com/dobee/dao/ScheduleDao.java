package com.dobee.dao;

import com.dobee.vo.schedule.Schedule;

public interface ScheduleDao {

    //일정 등록 -- 01.21 알파카 수정
    public int addSchedule(Schedule sc);
    
    //일정 가져오기  -- 01.21 알파카 수정
    public Schedule getSchedule(int schSeq);
    
}
