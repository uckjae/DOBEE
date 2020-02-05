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


    // 개인_부재일정신청	POST		0101 / 01.26 알파카 수정
    public int absApply(Apply apply){
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.absApply(apply);
    	return result;
    }


    // 개인_연장근무신청	POST		0101
    public int overtimeApply(Apply apply){
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.overTimeApply(apply);
    	return result;
    }
    
    
    // 개인_부재일정 수정/삭제 GET				0120	COMPLETE
    public BreakManageList getBMLforEdit(Apply apply) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	BreakManageList result = userDao.getBMLforEdit(apply);
    	
    	return result;
    }
    
    
    // 개인_부재일정 수정 POST 			0120	COMPLETE
    public int postEditApply(BreakManageList bml) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int result = userDao.postEditApply(bml);
    	
    	return result;
    }
    
    
    // 개인 부재일정 삭제 POST 			0120 	COMPLETE
    public void deleteApply (Integer aplSeq) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	userDao.deleteApply(aplSeq);
    }

    
    // 개인_부재일정관리			0101	COMPLETE
    public List<BreakManageList> absMg(String drafter){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
        List<BreakManageList> results = userDao.absMg(drafter);
        
        return results;
    }


    // 개인_근무내역확인/관리	(GET)	0121		COMPLETE
    public List<Apply> getExtList(String drafter) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<Apply> results = userDao.getExtList(drafter);

    	return results;
    }
    
    
    // 개인_연장근무 일정 수정/삭제 (GET)		0121	COMPLETE
    public Apply getELforEdit (Apply apply) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	Apply results = userDao.getELforEdit(apply);
    	
    	return results;
    }
    
    
    // 개인_연장근무 신청 수정 Page POST		0121 게다죽		COMPLETE
    public int postEditExtApply(Apply apply) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int result = userDao.postEditExtApply(apply);
    	
    	return result;
    }
    
    
    // 개인_연장근무 신청 삭제 POST		0121 게다죽		COMPLETE
    public int postDeleteExtList (Integer aplSeq) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int result = userDao.postDeleteExtList(aplSeq);
    	
    	return result;
    }
    
    
    // 근무내역확인
    public List<Attend> workChart(){
        return null;
    }

    
    // 매니저_부재관리 - 데이터 테이블 출력 (GET)		0115		추가 필요 &&&&&&&& 근데 이거 팀별로 조회하는거니까 조회 가능해야지?
    public List<BreakManageList> breakListMgr(Integer teamCode) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<BreakManageList> results = userDao.breakListMgr(teamCode);
    	
    	return results;
    }
    
    
    // 매니저_부재관리 - isAuth update (POST)		0115
    public int absReqHandle(Apply apply) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int result = userDao.absReqHandle(apply);
    	System.out.println("results 확인 : " + result);
    	return result;
    }
    


    // 매니저_연장근무관리 - 데이터 테이블 출력 (GET)		0115
    public List<BreakManageList> extListMgr(Integer teamCode){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<BreakManageList> results = userDao.extListMgr(teamCode);
    	
        return results;
    }
    
    
    // 매니저_연장근무관리 - 승인/반려/미승인 (POST)		0115
    public void extReqHandle(Apply apply){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	int results = userDao.extReqHandle(apply);
    	
    	// System.out.println("results 확인 : " + results);
    }


}
