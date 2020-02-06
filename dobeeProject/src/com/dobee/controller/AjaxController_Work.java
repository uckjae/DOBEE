package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.View;

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
		String responseData = "";
		int result = 0;
		apply.setDrafter(auth.getName());
        result = applyService.absApply(apply);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        
		return responseData;
	}
	
	
	// 개인_부재일정신청 수정 POST
	@RequestMapping(value="breakEditApply.do", method=RequestMethod.POST)
	public String absEditApply(BreakManageList bml, Integer aplSeq, Authentication auth) {
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
        
		return responseData;
	}
	

	// 매니저_부재관리_부재 isAuth 		02.05 게다죽
	@RequestMapping(value="absManage.do", method=RequestMethod.POST)
    public String absReqHandle(Model map, Apply apply, Authentication auth) {
		String responseData = "";
        apply.setApproval(auth.getName());
        int result = applyService.absReqHandle(apply);
        if(result > 0 ) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        
        return responseData;
    }
	
	
	// 개인_연장근무신청 POST           0112 게다죽
	@RequestMapping(value="extendApply.do", method=RequestMethod.POST)
	public String extendApply(Apply apply, Authentication auth) {
		String responseData = "";
		int result = 0;
		apply.setDrafter(auth.getName());
        result = applyService.overtimeApply(apply);
        if(result > 0) {
        	responseData = "success";
        } else {
        	responseData = "fail";
        }
        
		return responseData;
	}
	
	
	// 개인_연장근무신청 수정 POST           0112 게다죽
	@RequestMapping(value="extEditApply.do", method=RequestMethod.POST)
	public String extendEditApply(Apply apply, Integer aplSeq, Authentication auth) {
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
        
		return responseData;
	}
	
	
	// 매니저_연장근무관리 리스트 - isAuth update POST          0115 게다죽
	@RequestMapping(value="extManage.do", method=RequestMethod.POST)
    public String extReqHandle(Model map, Apply apply, Authentication auth){
		String responseData = "";
		apply.setApproval(auth.getName());
		int result = applyService.extReqHandle(apply);
		if (result > 0 ) {
			responseData = "success";
		} else {
			responseData = "fail";
		}
		
		return responseData;
	}
	
	
}
