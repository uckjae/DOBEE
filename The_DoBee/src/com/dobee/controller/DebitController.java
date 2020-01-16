package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.services.DebitService;

@Controller
public class DebitController {
	
	@Autowired
	DebitService debitService;
	
	//영수증 등록_ 디비에 최종적으로 영수증신청등록하기
    @RequestMapping("addFinalReceipt.do")
    public String addReceipt() {
    	System.out.println("비용신청 컨트롤단 요청받음! ");
    	int result = debitService.addDebit();
    	
    	if(result != -1) {
    		System.out.println("컨트롤단 : 비용신청 성공");
    	}else {
    		System.out.println("컨트롤단 : 비용신청 실패");
    		return null;
    	}
    	return "redirect:viewDebitList.do";
    }
    
    
    //비용신청 현황 뷰단 가기
    @RequestMapping("viewDebitList.do")
    public String viewDebit() {
    	return "payment/debitList";
    }
	
	
	
	
}
