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


    // 개인_부재일정신청	POST		0101
    public String absApply(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	userDao.absApply(apply);
    	
    	return "병신새끼야! 고운말 합시다";
    }


    // 개인_연장근무신청	POST		0101
    public String overtimeApply(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int results = userDao.overTimeApply(apply);
    	
    	return "병신아! 그래! 병신아! ㅜㅠ";
    }


    // 개인_부재일정관리			0101
    public List<BreakManageList> absMg(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
        List<BreakManageList> results = userDao.absMg(apply);
        
        return results;
    }


    //근무내역확인
    public List<Attend> workChart(){
        return null;
    }

    
    // 매니저_부재관리 - 데이터 테이블 출력 (GET)		0115		추가 필요 &&&&&&&& 근데 이거 팀별로 조회하는거니까 조회 가능해야지?
    public List<BreakManageList> breakListMgr() {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<BreakManageList> results = userDao.breakListMgr();
    	
    	return results;
    }
    
    
    // 매니저_부재관리 - isAuth update (POST)		0115
    public void absReqHandle(Apply apply) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int results = userDao.absReqHandle(apply);
    	
    	// System.out.println("results 확인 : " + results);
    }
    


    // 매니저_연장근무관리 - 데이터 테이블 출력 (GET)		0115
    public List<BreakManageList> extListMgr(){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<BreakManageList> results = userDao.extListMgr();
    	
        return results;
    }
    
    
    // 매니저_연장근무관리 - 승인/반려/미승인 (POST)		0115
    public void extReqHandle(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int results = userDao.extReqHandle(apply);
    	
    	// System.out.println("results 확인 : " + results);
    }


}
