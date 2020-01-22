package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.MemberService;
import com.dobee.vo.member.User;

@RestController
@RequestMapping("ajax/mypage/**")
public class AjaxController_Mypage {
	
	@Autowired
	MemberService memberService;
	
	//마이페이지 수정 ajax
    @RequestMapping(value = "modify.do", method = RequestMethod.POST)
    public String mypageModify(User user){
    	String responseData = "";
    	int result = 0;
    	result = memberService.mypageModify(user);
    	if(result > 0 ) { //수정 완료
    		System.out.println("수정됨");
			responseData = "success";
			System.out.println("성공함");
		}
        return responseData;
    }

}
