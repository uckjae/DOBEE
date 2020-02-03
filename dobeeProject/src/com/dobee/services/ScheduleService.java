package com.dobee.services;
import com.dobee.dao.ScheduleDao;
import com.dobee.vo.schedule.ProjectSchedule;
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
    
    //프로젝트 일정 등록 -- 02.01 알파카
    public int addPjtSchedule(int pjtSeq, int schSeq) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	int result = 0;
    	result = scheduledao.addPjtSchedule(pjtSeq, schSeq);
    	return result;
    }
        
    //프로젝트 업무 일정 등록 -- 02.01 알파카
    public int addTaskSchedule(int pjtSeq, int schSeq, int tskSeq) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	int result = 0;
    	result = scheduledao.addTaskSchedule(pjtSeq, schSeq, tskSeq);
    	return result;
    }
    
    //프로젝트 업무 일정 있는지 없는지 체크 --02.02 알파카
    public boolean getTsSeq(int tskSeq) {
    	boolean checkTsseq = false;
    	int tsseq = 0;
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	tsseq = scheduledao.getTsSeq(tskSeq);
    	if(tsseq > 0 ) { //기존에 등록된 업무 일정 번호가 있다면
    		checkTsseq = true;
    	}
    	return checkTsseq;
    	
    }
    
    //프로젝트 일정 가져오기 --02.02 알파카
    public Schedule getPjtSchedule(int pjtSeq) {
    	ScheduleDao scheduledao = sqlSession.getMapper(ScheduleDao.class);
    	Schedule sc = scheduledao.getPjtSchedule(pjtSeq);
    	return sc;
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