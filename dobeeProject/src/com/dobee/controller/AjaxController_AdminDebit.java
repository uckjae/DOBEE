package com.dobee.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dobee.services.AdminDebitService;
import com.dobee.vo.Debit;

@Controller
@RequestMapping("ajax/adminDebit/**")
public class AjaxController_AdminDebit {

	@Autowired
	AdminDebitService adminDebitService;
	
	//관리자 법인카드 수정
	@RequestMapping("editAdminDebitList.do")
	@ResponseBody
	public void adminDebitUpdate(@RequestParam HashMap paramMap) {
		
		int result = 0;
		String cardNum = (String) paramMap.get("cardNum");
		String corp = (String)paramMap.get("corp");
		String name = (String)paramMap.get("name");
		String nickName = (String)paramMap.get("nickName");
		String entry = (String)paramMap.get("entry");
		String valDate = (String)paramMap.get("valDate");
		

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
	}
	
	
	//관리자 법인카드 삭제
	@RequestMapping("adminDelDebit.do")
	@ResponseBody
	public int adminDelDebit(@RequestParam(value="cardNum") String cardNum) {
		
		int result = 0 ; 
		result = adminDebitService.deleteDebit(cardNum);
		if(result > 0 ) {
			System.out.println("법인카드 삭제 완료되었습니다.");
		}else {
			System.out.println("법인카드 삭제 실패");
		}
		return result;
	}
	
	
	//법인 카드 수정시, 카드 넘버 중복검사
	@RequestMapping("checkEditDupleCardNum.do")
	@ResponseBody
	public int checkEditDupleCardNum(@RequestParam(value="cardNum") String cardNum) {
		int result = 0;
		result = adminDebitService.checkEditDupleCardNum(cardNum);
		if(result > 0) {
			System.out.println("법인카드 수정 : 중복된 카드번호 발견");
		}else {
			System.out.println("법인카드 수정 : 중복된 카드 없음");
		}
		
		return result;
	}
	
}
