package com.dobee.services;

import com.dobee.dao.UserDao;
import com.dobee.vo.Apply;
import com.dobee.vo.member.Attend;
import com.dobee.vo.member.BreakManageList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyService {

    @Autowired
    SqlSession sqlSession;


    // 개인_부재일정신청			0101
    public String absApply(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	userDao.absApply(apply);
    	
    	return "병신새끼야! 고운말 합시다";
    }


    // 개인_연장근무신청			0101
    public String overtimeApply(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int results = userDao.overTimeApply(apply);
    	
    	return "병신아! 그래! 병신아!";
    }


    // 개인_부재일정관리			0101
    public List<BreakManageList> absMg(){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
        List<BreakManageList> results = userDao.absMg();
        
        return results;
    }


    //근무내역확인
    public List<Attend> workChart(){
        return null;
    }


    //부재관리_PM
    public List<Apply> absSign(){
        return null;
    }

    
    // 매니저_부재관리 - 데이터 테이블 출력 (GET)		0114
    public List<BreakManageList> breakListMgr() {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<BreakManageList> results = userDao.breakListMgr();
    	
    	return results;
    }
    
    
    // 매니저_부재관리 - isAuth update (POST)		0114 게다죽
    public String absReqHandle() {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	System.out.println("result 서비스1 : ");
    	String result = userDao.absReqHandle();
    	System.out.println("result 서비스 : " + result);
    	return result;
    }
    

    //부재관리_승인
    public void absSignApprov(){

    }


    //연장근무관리_PM
    public List<Apply> overtimeSign(){
        return null;
    }


    //연장근무관리_승인
    public void overtiemSignApprov(){

    }


}
