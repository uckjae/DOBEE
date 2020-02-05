package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.ApplyService;
import com.dobee.vo.Apply;
import com.dobee.vo.member.BreakManageList;

@RestController
@RequestMapping("ajax/apply/**")
public class AjaxController_Work {
	
	@Autowired
	ApplyService applyService;
	
	// 개인_부재일정신청 POST 0112          게다죽	COMPLETE
	@RequestMapping(value="breakApply.do", method=RequestMethod.POST)
	public String absApply(Apply apply, Authentication auth) {
		// System.out.println("값 가져와?"+apply.toString()+"/"+auth.toString());
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
	
	// 개인_부재일정신청 수정 POST
	@RequestMapping(value="breakEditApply.do", method=RequestMethod.POST)
	public String absEditApply(BreakManageList bml, Integer aplSeq, Authentication auth) {
		// System.out.println("값 가져와?"+apply.toString()+"/"+auth.toString());
		String responseData = "";
		int result = 0;
		bml.setDrafter(auth.getName());
		bml.setAplSeq(aplSeq);
        result = applyService.postEditApply(bml);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        System.out.println("수정 데이터?"+responseData);
		return responseData;
	}
	
	/*

    @RequestMapping(value="breakApply.do", method=RequestMethod.POST)
    public String absApplyPost(Apply apply, Authentication auth){
        apply.setDrafter(auth.getName());
        String result = applyService.absApply(apply);
        // System.out.println("봐봐  : " + result);
        
        return "redirect: breakApply.do";
    }
	 */
	
	// 개인_연장근무신청 POST           0112 게다죽
	@RequestMapping(value="extendApply.do", method=RequestMethod.POST)
	public String extendApply(Apply apply, Authentication auth) {
		// System.out.println("값 가져와?"+apply.toString());
		String responseData = "";
		int result = 0;
		apply.setDrafter(auth.getName());
        result = applyService.overtimeApply(apply);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        System.out.println("연장 신청 : "+responseData);
		return responseData;
	}
	
	// 개인_연장근무신청 수정 POST           0112 게다죽
	@RequestMapping(value="extEditApply.do", method=RequestMethod.POST)
	public String extendEditApply(Apply apply, Integer aplSeq, Authentication auth) {
		// System.out.println("값 가져와?"+apply.toString());
		String responseData = "";
		int result = 0;
		apply.setAplSeq(aplSeq);
		apply.setDrafter(auth.getName());
        result = applyService.postEditExtApply(apply);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        System.out.println("연장 신청 수정 : "+responseData);
		return responseData;
	}
	
	/*
	 // 개인_연장근무신청 POST           0112 게다죽
    @RequestMapping(value="extendApply.do", method = RequestMethod.POST)
    public String extendApplyPost(Apply apply) {
        String result = applyService.overtimeApply(apply);
        // System.out.println("봐봐 이," + result);

        return "redirect: extendApply.do";
    }
	 */
	
}
