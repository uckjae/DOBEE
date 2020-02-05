package com.dobee.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.AttendService;


@RestController
@RequestMapping("ajax/attend/**")
public class AjaxController_Attend {
	
	@Autowired
	AttendService attendService;

	
	// 출근 처리
	@RequestMapping(value = "attend.do", method = RequestMethod.POST)
	public String attendButton(Authentication auth, HttpServletRequest req) {
		String responseData = "";
		int result = attendService.onWork(auth.getName(), req.getSession());
		
		if(result > 0 ) {
			String attSeq = attendService.isWork(auth.getName());
			System.out.println(attSeq + ", AjaxCont_Attend -출근 처리");
			responseData = "success";
		}
		
		return responseData;
	}
	
	
	// 퇴근 처리		0127 게다죽		COMPLETE
	@RequestMapping(value = "leave.do", method = RequestMethod.POST)
	public String leaveButton(Authentication auth, Integer attSeq, HttpServletRequest req) {
		String responseData = "";
		int result = attendService.offWork(auth.getName(), attSeq, req.getSession());
		
		if(result > 0) {
			responseData = "success";
		}
		
		return responseData;
	}
	
}
