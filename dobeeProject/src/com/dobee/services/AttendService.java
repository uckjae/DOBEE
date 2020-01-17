package com.dobee.services;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.UserDao;

@Service
public class AttendService {
	
	 @Autowired
	 SqlSession sqlSession;
	 
	 //출근하기 --01.17 알파카
	 public int onWork(String mail) {
		 int result = 0;
		 UserDao userDao = sqlSession.getMapper(UserDao.class);
		 result = userDao.onWork(mail);
		 
		 return result;
	 }

}
