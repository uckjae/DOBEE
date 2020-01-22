package com.dobee.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dobee.services.AdminDebitService;
import com.dobee.vo.Debit;

@Controller
public class AjaxController_AdminDebit {

	@Autowired
	AdminDebitService adminDebitService;
	
	@RequestMapping("editAdminDebitList.do")
	@ResponseBody
	public String adminDebitUpdate(@RequestParam HashMap paramMap) {
		
		//여기서 법인카드수정
		int result = 0;
		String cardNum = (String) paramMap.get("cardNum");
		String corp = (String)paramMap.get("corp");
		String name = (String)paramMap.get("name");
		String nickName = (String)paramMap.get("nickName");
		String entry = (String)paramMap.get("entry");
		String tempDate = (String)paramMap.get("valDate");
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date valDate = null;
		try {
			valDate = transFormat.parse(tempDate);
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("String to Date Error");
		}
		
		System.out.println("잘 바뀌었는지? " + valDate);
		Debit debit = new Debit();
		debit.setCardNum(cardNum);
		debit.setCorp(corp);
		debit.setName(name);
		debit.setEntry(entry);
		debit.setNickName(nickName);
		debit.setValDate(valDate);
		
		result = adminDebitService.updateDebit(debit);
		if(result > 0) {
			System.out.println("업데이트 완료");
		}else {
			System.out.println("업데이트 실패");
		}
		
		return null;
		//return "redirect:ListDebit.do";
	}
	
	
}
