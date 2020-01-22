package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.NoticeService;

@RestController
public class AjaxController_Notice {
	
	@Autowired
	private NoticeService noticeService;
	
	//글 삭제
	@RequestMapping(value="noticeDel.do", method=RequestMethod.POST)
	public String NoticeDel(@RequestParam(value="notSeq") String notSeq) {
		String responseData = "";
		int result = 0;
    	result = noticeService.delNotice(Integer.parseInt(notSeq));
    	if(result > 0) {
    		responseData = "success";
    		System.out.println("성공함");
    	}
		return responseData;
	}
}
