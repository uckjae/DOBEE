package com.dobee.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.dobee.dao.UserDao;
import com.dobee.vo.ApplyCode;
import com.dobee.vo.member.Break;
import com.dobee.vo.member.BreakManageList;
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
	
	
	// Ajax 개인부재일정확인 - Option - 년도 loading		0113
	@RequestMapping("breakYearList.do")
	public View breakYearList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.breakYearList();
		map.addAttribute("breakYearList", results);
		
		return jsonview;
	}
	
	// Ajax 개인부재일정확인 - 년도별 List 출력		0113			&&&&&&&&&&&& 나중에 값 붙이고 값은 출력됨
	@RequestMapping("getBreakListByYear.do")
	public View getBreakListByYear (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByYear();
		System.out.println("ajax contr ListByYear : " + results);		// &&&&&&&&&&&&&&&&&&
		map.addAttribute("byYear", results);
		
		return jsonview;
	}
	
	
    // Ajax 개인부재일정확인 - Option - 월 loading		0113
	@RequestMapping("breakYearMonthList.do")
	public View breakYearMonthList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.breakYearMonthList();
		map.addAttribute("breakYearMonthList", results);
		
		return jsonview;
	}
	
	// Ajax 개인부재일정확인 - 년-월별 List 출력		0113			&&&&&&&&&&&& 나중에 값 붙이고 값은 출력됨
	@RequestMapping("getBreakYearMonthList.do")
	public View getBreakYearMonthList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByYMonth();
		System.out.println("ajax contr ListByYearMonth : " + results);		// &&&&&&&&&&&&&&&&&&
		map.addAttribute("byYMonth", results);
		return jsonview;
	}
	

    // Ajax 개인부재일정확인 - Option - 부재항목 loading		0113
	@RequestMapping("breakEntryList.do")
    public View breakEntryList (Model map) {
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<ApplyCode> results= userDao.breakEntryList();
    	map.addAttribute("breakEntryList", results);
    	
    	return jsonview;
    }
	
	
	// Ajax 개인부재일정확인 - 부재항목 별 List 출력		0113			&&&&&&&&&&&& 나중에 값 붙이고 값은 출력됨
	@RequestMapping("getBreakListByEntry.do")
	public View getBreakListByEntry (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByYMonth();
		System.out.println("ajax contr ListByEntry : " + results);		// &&&&&&&&&&&&&&&&&&
		map.addAttribute("byEntry", results);
		
		return jsonview;
	}
	

    // Ajax 개인부재일정확인 - Option - 승인여부 loading		0113
	@RequestMapping("breakIsAuthList.do")
    public View breakIsAuthList (Model map) {
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<String> results= userDao.breakIsAuthList();
    	map.addAttribute("breakIsAuthList", results);
    	
    	return jsonview;
    }
	
	
	// Ajax 개인부재일정확인 - 승인여부 별  List 출력		0113			&&&&&&&&&&&& 나중에 값 붙이고 값은 출력됨
	@RequestMapping("getBreakListByIsAuth.do")
	public View getBreakListByIsAuth (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByIsAuth();
		System.out.println("ajax contr ListByIsAuth : " + results);		// &&&&&&&&&&&&&&&&&&
		map.addAttribute("byIsAuth", results);
		
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
	
	
	// 남은/사용 연차 불러오기
	@RequestMapping("getVacationInBM.do")
	public View getVactionInBM (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Break> results = userDao.getVacationInBM();
		map.addAttribute("totalVacation", results);
		
		return jsonview;
	}
	
}
