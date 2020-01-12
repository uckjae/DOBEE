package com.dobee.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.dobee.dao.UserDao;
import com.dobee.vo.ApplyCode;
import com.dobee.vo.member.User;

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
		List<ApplyCode> results = userDao.getApyCode();
		map.addAttribute("apyCode", results);
		
		return jsonview;
	}
	
	
	// 부재신청 결재자 불러오기
	@RequestMapping("getApprovalList.do")
	public View getRenewedList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		ArrayList<User> results = userDao.getApprovalList();
		map.addAttribute("renewedList", results);
		
		return jsonview;
	}
	
	
	// 근무내역 확인 년도 불러오기
	@RequestMapping("overTimeYearList.do")
	public View overTimeYearList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.overTimeYearList();
		map.addAttribute("OTYList", results);
		
		return jsonview;
		
	}
	
	
	// 근무내역 확인 월 불러오기
	@RequestMapping("overTimeMonthList.do")
	public View overTimeMonthList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.overTimeMonthList();
		map.addAttribute("OTMList", results);
		
		return jsonview;
	}
	
	
}
