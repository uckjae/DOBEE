package com.dobee.services;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.User;

@Service
public class AttendService {
	
	 @Autowired
	 SqlSession sqlSession;
	 
	 // 출/퇴근 여부 확인 		0126 게다죽	COMPLETE
	 public String isWork (String mail) {
		 String attSeq;
		 UserDao userDao = sqlSession.getMapper(UserDao.class);
		 attSeq = userDao.isWork(mail);
		 
		 if ( attSeq == null) {
			 return "off";
		 } else {
			 return "on";
		 }
	 }
	 
	 
	 //출근하기 --01.17 알파카
	 public int onWork(String mail, HttpSession session) {
		 int result = 0;
		 UserDao userDao = sqlSession.getMapper(UserDao.class);
		 result = userDao.onWork(mail);
		 String attSeq = userDao.isWork(mail);
		
		 // 세션 isWork 값 업데이트 해줌
		 User user = userDao.getUser(mail);
		 user.setIsWork(attSeq);
		 session.setAttribute("user", user);
		 		 
		 return result;
	 }
	 
	 
	 // 퇴근하기	0127 게다죽	COMPLETE
	 public int offWork(String mail, Integer attSeq, HttpSession session) {
		 int result = 0;
		 UserDao userDao = sqlSession.getMapper(UserDao.class);
		 result = userDao.offWork(attSeq);
		
		 // 세션 isWork 값 업데이트 해줌
		 User user = userDao.getUser(mail);
		 user.setIsWork(null);
		 session.setAttribute("user", user);
		
		 return result;
	 }

}
