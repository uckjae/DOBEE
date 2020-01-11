package com.dobee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.dobee.services.ReceiptService;

@RestController
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
		
		ModelAndView mav = new ModelAndView();
		
		try {
			if(receiptService.fileUpload(mRequest)) {
				mav.addObject("result", "success");
			} else {
				mav.addObject("result", "fail");
			}
			mav.setViewName("JSON");
			
		}catch (Exception e) {
			System.out.println("컨트롤단/boardControlelr.java :  try 문에서 예외발생");
		}
		
		return mav;
	}
	
	
}
