package com.dobee.services;

import com.dobee.vo.schedule.Schedule;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleService {


    @Autowired
    private SqlSession sqlSession;


    //로그인후 Main
    public List<Schedule> mainSchedule(){
        return null;
    }


    //회사일정등록
    public void addSchedule(){

    }


    //회사일정수정
    public void modiSchedule(){

    }


    //회사일정 삭제
    public void delSchedule(){

    }


    //프로젝트일정
    public void projectSchedule(){

    }
}