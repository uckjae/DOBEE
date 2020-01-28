package com.dobee.controller;

import java.security.Principal;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.AttendService;



@RestController
public class AjaxController_Attend {
	
	@Autowired
	AttendService attendService;
	
	// 처리를 해야 하는게 출근 처리를 하면 출근 했다는 것을 세션에서 가지고 있어야 하고 세션을 업데이트 해줘야함
	// 그리고 페이지를 리다이렉트 하던가 무튼 해당 페이지를 다시 받아와야지 main.do 인가 그거 받아아와야 함.
	
	// 출근 처리
	@RequestMapping(value = "attend.do", method = RequestMethod.POST)
	public String attendButton(Authentication auth, HttpServletRequest req) {
		String responseData = "";
		int result = attendService.onWork(auth.getName(), req.getSession());
		String attSeq = attendService.isWork(auth.getName());
		
		if(result > 0 ) {
			// System.out.println("찍어봐 찍어봐1~ " + req.getAttribute("isWork"));
			responseData = "success";
		}
		
		return responseData;
	}
	
	// 퇴근 처리		0127 게다죽		 ~ing
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
