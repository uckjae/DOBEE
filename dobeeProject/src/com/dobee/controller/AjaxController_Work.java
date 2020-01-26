package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.ApplyService;
import com.dobee.vo.Apply;

@RestController
@RequestMapping("ajax/apply/**")
public class AjaxController_Work {
	
	@Autowired
	ApplyService applyService;
	
	@RequestMapping(value="breakApply.do", method=RequestMethod.POST)
	public String absApplyPos(Apply apply, Authentication auth) {
		System.out.println("값 가져와?"+apply.toString()+"/"+auth.toString());
		String responseData = "";
		int result = 0;
		apply.setDrafter(auth.getName());
        result = applyService.absApply(apply);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        System.out.println("데이터?"+responseData);
		return responseData;
	}
	
	/*
	 // 개인_부재일정신청 POST 0112          게다죽
    @RequestMapping(value="breakApply.do", method=RequestMethod.POST)
    public String absApplyPost(Apply apply, Authentication auth){
        apply.setDrafter(auth.getName());
        String result = applyService.absApply(apply);
        // System.out.println("봐봐  : " + result);
        
        return "redirect: breakApply.do";
    }
	 */
	
}
