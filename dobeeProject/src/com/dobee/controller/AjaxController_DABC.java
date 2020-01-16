package com.dobee.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

import com.dobee.dao.UserDao;
import com.dobee.vo.Apply;
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
	
	// 개인_부재신청 부재항목 불러오기	COMPLETE
	@RequestMapping("getApyCode.do")
	public View brkApyCat (Model map){
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<ApplyCode> results = userDao.getApyCode();
		map.addAttribute("apyCode", results);
		
		return jsonview;
	}
	
	
	// 개인_부재/연장신청 결재자 불러오기		COMPLETE
	@RequestMapping("getApprovalList.do")
	public View getRenewedList (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		ArrayList<User> results = userDao.getApprovalList();
		map.addAttribute("renewedList", results);
		
		return jsonview;
	}
	
	
	// Ajax 개인_부재일정확인 - Option - 년도 loading		0113	COMPLETE
	@RequestMapping("breakYearList.do")
	public View breakYearList (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.breakYearList(auth.getName());
		map.addAttribute("breakYearList", results);
		
		return jsonview;
	}
	
	// Ajax 개인_부재일정확인 - 년도별 List 출력		0113		~ing
	@RequestMapping("getBreakListByYear.do")
	public View getBreakListByYear (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByYear(auth.getName());
		map.addAttribute("byYear", results);
		
		return jsonview;
	}
	
	
    // Ajax 개인_부재일정확인 - Option - 월 loading		0113	COMPLETE
	@RequestMapping("breakYearMonthList.do")
	public View breakYearMonthList (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.breakYearMonthList(auth.getName());
		map.addAttribute("breakYearMonthList", results);
		
		return jsonview;
	}
	
	// Ajax 개인_부재일정확인 - 년-월별 List 출력		0113		~ing
	@RequestMapping("getBreakYearMonthList.do")
	public View getBreakYearMonthList (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByYMonth(auth.getName());
		map.addAttribute("byYMonth", results);
		
		return jsonview;
	}
	

    // Ajax 개인_부재일정확인 - Option - 부재항목 loading		0113		COMPLETE
	@RequestMapping("breakEntryList.do")
    public View breakEntryList (Model map, Authentication auth) {
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<ApplyCode> results= userDao.breakEntryList(auth.getName());
    	map.addAttribute("breakEntryList", results);
    	
    	return jsonview;
    }
	
	
	// Ajax 개인_부재일정확인 - 부재항목 별 List 출력		0113			~ing
	@RequestMapping("getBreakListByEntry.do")
	public View getBreakListByEntry (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByEntry(auth.getName());
		map.addAttribute("byEntry", results);
		
		return jsonview;
	}
	

    // Ajax 개인_부재일정확인 - Option - 승인여부 loading		0113		COMPLETE
	@RequestMapping("breakIsAuthList.do")
    public View breakIsAuthList (Model map, Authentication auth) {
    	UserDao userDao = sqlsession.getMapper(UserDao.class);
    	List<String> results= userDao.breakIsAuthList(auth.getName());
    	map.addAttribute("breakIsAuthList", results);
    	
    	return jsonview;
    }
	
	
	// Ajax 개인_부재일정확인 - 승인여부 별  List 출력		0113			~ing
	@RequestMapping("getBreakListByIsAuth.do")
	public View getBreakListByIsAuth (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<BreakManageList> results = userDao.getBreakListByIsAuth(auth.getName());
		map.addAttribute("byIsAuth", results);
		
		return jsonview;
	}
	
	
	// Ajx 개인_연장근무 신청 - 캘린더 Event 불러오기			0116			~ing
	@RequestMapping("getExtList.do")
	public View getExtListToCalendar (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Apply> results = userDao.getExtListToCalendar(auth.getName());
		System.out.println("결과, getExtListToCalendar : "+ results);
		map.addAttribute("ExtListTC", results);
		
		return jsonview;
		
	}
	
	
	// 개인_근무내역 확인 년도 불러오기			COMPLETE
	@RequestMapping("overTimeYearList.do")
	public View overTimeYearList (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.overTimeYearList(auth.getName());
		map.addAttribute("OTYList", results);
		
		return jsonview;
	}
	
	
	// 개인_근무내역 확인 월 불러오기			COMPLETE
	@RequestMapping("overTimeMonthList.do")
	public View overTimeMonthList (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Integer> results = userDao.overTimeMonthList(auth.getName());
		map.addAttribute("OTMList", results);
		
		return jsonview;
	}
	
	
	// 개인_남은/사용 연차 불러오기				COMPLETE
	@RequestMapping("getVacationInBM.do")
	public View getVacationInBM (Model map, Authentication auth) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<Break> results = userDao.getVacationInBM(auth.getName());
		map.addAttribute("totalVacation", results);
		
		return jsonview;
	}
	
	
	////////// 매니저 ///////////////////////////
    
	// Ajax 매니저_부재일정확인 - Option - 부재항목 loading		0115			팀별 확인 세션에서 팀 코드 출력해서 조회하는걸로
	@RequestMapping("breakEntryListMgr.do")
	public View breakEntryListMgr (Model map) {
		UserDao userDao = sqlsession.getMapper(UserDao.class);
		List<ApplyCode> result = userDao.breakEntryListMgr();
		map.addAttribute("breakEntryListMgr", result);
		
		return jsonview;
	}
	
	
}