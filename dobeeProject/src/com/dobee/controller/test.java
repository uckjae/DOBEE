package com.dobee.controller;

import org.mortbay.util.ajax.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class test {

	@RequestMapping("test.do")
	public String test() {
		System.out.println("테스트 컨트롤 탐");
		return "admin/ListDebit2";
	}
}
