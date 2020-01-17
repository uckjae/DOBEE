package com.dobee.controller;

import java.security.Principal;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.vo.member.Attend;

@RestController
public class AjaxController_Attend {
	
	@RequestMapping(value = "attend.do", method = RequestMethod.GET)
	public String attendButton(@RequestParam(value="mail") String mail) {
		System.out.println("컨틀롤러 타니?");
		System.out.println("유저 정보 가져오니?"+principal.getName());
		
		return null;
	}
}
