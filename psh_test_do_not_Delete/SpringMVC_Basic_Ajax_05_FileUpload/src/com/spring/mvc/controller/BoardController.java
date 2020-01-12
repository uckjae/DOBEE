package com.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.mvc.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
//	/* ���� ���ε� ȭ�� �̵� */
//	@RequestMapping(value="/fileUpload.do", method=RequestMethod.GET)
//	public ModelAndView fileUploadForm() {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		mav.setViewName("board/fileUpload_submit");
//		
//		return mav;
//	}
//	
//	/* ���� ���ε� ó�� */
//	@RequestMapping(value="/fileUpload.do", method=RequestMethod.POST)
//	public ModelAndView fileUpload(MultipartHttpServletRequest mRequest) {
//		
//		ModelAndView mav = new ModelAndView();
//		
//		if(boardService.fileUpload(mRequest)) {
//			mav.addObject("result", "SUCCESS");
//		} else {
//			mav.addObject("result", "FAIL");
//		}
//		
//		mav.setViewName("board/fileUpload_result");
//		
//		return mav;
//	}
	
	/* ���� ���ε� ȭ�� �̵� */
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.GET)
	public ModelAndView fileUploadAjaxForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/fileUpload_ajax");
		
		return mav;
	}
	
	/* ���� ���ε� ó�� */
	@RequestMapping(value="/fileUploadAjax.do", method=RequestMethod.POST)
	public ModelAndView fileUploadAjax(MultipartHttpServletRequest mRequest) {
		//System.out.println("dd");
		ModelAndView mav = new ModelAndView();
		if(boardService.fileUpload(mRequest)) {
			mav.addObject("result", "success");
		} else {
			mav.addObject("result", "fail");
		}
		mav.setViewName("JSON"); //view �̸� : json ���
		return mav;
	}
	
}





