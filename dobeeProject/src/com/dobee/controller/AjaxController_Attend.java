package com.dobee.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.AttendService;
import com.dobee.vo.member.Attend;

@RestController
public class AjaxController_Attend {
	
	@Autowired
	AttendService attendService;
	
	@RequestMapping(value = "attend.do", method = RequestMethod.POST)
	public String attendButton(@RequestParam(value="mail") String mail) {
		String responseData = "";
		int result = attendService.onWork(mail);
		if(result > 0 ) {
			responseData = "success";
		}
		return responseData;
	}
}
