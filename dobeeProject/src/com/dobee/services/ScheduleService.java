package com.dobee.services;

import com.dobee.dao.NoticeDao;
import com.dobee.dao.ScheduleDao;
import com.dobee.vo.schedule.Schedule;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.ScheduledAnnotationBeanPostProcessor;
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
    
    
    //일정 추가
    public int addSchedule(Schedule sc) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	int result = 0;
    	result = scheduledao.addSchedule(sc);
    	if(result > 0) { //DB에 insert 성공하면
    		result = sc.getSchSeq();//seq 리턴함
    	} else { //DB에 insert 실패
    		result = 0; 
    	}
    	
    	return result;
    }
    
    //일정 가져오기
    public Schedule getSchedule(int schSeq) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	Schedule sc = null;
    	sc = scheduledao.getSchedule(schSeq);
    	return sc;
    }
    
    //일정 수정하기
    public int scheduleModify(Schedule sc) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	int result = 0;
    	result = scheduledao.scheduleModify(sc);
    	return result;
    }
    
    //회사일정등록
    public void addCorpSchedule(){

    }


    //회사일정수정
    public void modiCorpSchedule(){

    }


    //회사일정 삭제
    public void delSchedule(){

    }


    //프로젝트일정
    public void projectSchedule(){

    }
    
    
}