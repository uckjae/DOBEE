package com.dobee.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.User;

@RestController
public class AjaxController_alpaca {
	
	private SqlSession sqlsession;

	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
		this.sqlsession = sqlsession;
	}
	
	//회원 목록 가져오기
    @RequestMapping(value="getUserList.do", method=RequestMethod.POST)
    public List<User> getUserList() {
    	System.out.println("여기타??");
    	UserDao userdao = sqlsession.getMapper(UserDao.class);
    	List<User> results = userdao.getUserList();
    	return results;
    }
    
}
