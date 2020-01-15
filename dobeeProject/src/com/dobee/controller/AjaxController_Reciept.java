package com.dobee.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.services.DebitService;
import com.dobee.services.ReceiptService;

@Controller
public class AjaxController_Reciept {
	
	@Autowired
	private ReceiptService receiptService;
	
	@Autowired
	private DebitService debitService;
	
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.POST)
	public ModelAndView fileUploadAjax(MultipartHttpServletRequest mRequest) throws UnsupportedEncodingException {
		System.out.println("컨트롤단/boardControlelr.java :  fileUploadAjax.do 요청들어왔다 ");
		ArrayList<String> arrayList = new ArrayList<>();

		ModelAndView mav = new ModelAndView();
		arrayList = receiptService.fileUpload(mRequest);
		try {
			System.out.println("컨트롤단/boardControlelr.java :try 구문 시작");
			if(arrayList.get(0).equals("true")) {
				mav.addObject("result", "success");
				mav.addObject("uploadPath", arrayList.get(1));
				mav.addObject("saveFileName", arrayList.get(2));
			} else {
				System.out.println("try 구문 else 에 빠짐 ");
				mav.addObject("result", "fail");
				
			}
			mav.setViewName("jsonView");
			
		}catch (Exception e) {
			System.out.println(e);
			System.out.println("컨트롤단/boardControlelr.java :  try 문에서 예외발생");
		}
		
		return mav;
	}
	
	
	  //영수증 등록_현재 사용자 이메일 불러오기
   	@RequestMapping("nowEmpEmail.do") 
   	@ResponseBody 
   	public String currentEmpEmail(Principal principal) { 
   		return principal.getName(); 
   	}
   	
    //영수증등록_현재 법인카드 목록 아작스로 불러다주기
    @RequestMapping(value="cardListtoReceipt.do", method=RequestMethod.POST)
    @ResponseBody
    public ArrayList cardList() {
    	ArrayList debitList = debitService.listDebit();
    	return debitList;
    }
	
}
