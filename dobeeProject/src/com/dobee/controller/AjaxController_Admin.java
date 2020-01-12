package com.dobee.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.vo.member.User;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@RestController
public class AjaxController_Admin {
	@Autowired
	private SqlSession sqlSession;
	
	
	//AuthCode List
	@RequestMapping(value="getAuthCode.ajax")
    @JsonManagedReference
    public List<User> getAuthCode() {
    	
    	
    	return null;
    }
}
