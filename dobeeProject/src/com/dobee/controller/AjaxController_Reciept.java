package com.dobee.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.services.ReceiptService;

@Controller
public class AjaxController_Reciept {
	
	@Autowired
	private ReceiptService receiptService;
	
	
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.GET)
	public ModelAndView fileUploadAjaxForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/fileUpload_ajax");
		
		return mav;
	}
	
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.POST)
	public ModelAndView fileUploadAjax(MultipartHttpServletRequest mRequest) {
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
	
	
}
