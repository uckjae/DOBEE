package com.dobee.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.dobee.dao.UserDao;

@Controller
public class AjaxController_DABC {
	
	@Autowired
	private View jsonview;
	
	@Autowired
	private SqlSession sqlsession;
	
	// 부재신청 항목 불러오기
	@RequestMapping("getApyCode.do")
	public View brkApyCat (Model map) {
		
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<String> results = userDao.getApyCode();
		System.out.println("코드를 한번 보시오 : " + results);
		
		map.addAttribute("apyCode", results);
		
		return jsonview;
	}
	
	// 부재신청 결재자 불러오기
	@RequestMapping("getApprovalList.do")
	public View getApprovalList (Model map) {
		
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<String> results = userDao.getApprovalList();
		System.out.println("사람 목록들 한번 보시오 : " + results);
		
		map.addAttribute("approvalList", results);
		
		return jsonview;
	}
	
}
