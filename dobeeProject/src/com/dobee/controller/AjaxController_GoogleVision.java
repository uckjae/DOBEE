package com.dobee.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dobee.services.googleVisionService;
import com.google.cloud.vision.v1.AnnotateImageResponse;

@Controller
public class AjaxController_GoogleVision {

	@Autowired
	private googleVisionService googleVisionService;
	
	
	
	@RequestMapping(value="/goGoogleAjax.do", method=RequestMethod.POST)
	public @ResponseBody JSONObject visionApi(HttpServletRequest req, @RequestParam String uploadPath,
			@RequestParam String saveFileName) 
			throws Exception{
		//@RequestBody을 이용하여 paramData 스트링값으로 파라미터값을 가져온다
		System.out.println("컨트롤단/googleVision  :  goGoogle.do 요청들어왔다 ");
		
		String uPath = uploadPath;
		String sFileName = saveFileName;
		
		
		System.out.println(" 컨트롤단 도착했고 파라미터값왔는지 확인하자 : uPath " +  uPath);
		System.out.println(" 컨트롤단 도착했고 파라미터값왔는지 확인하자 : sFileName " +  sFileName);
		
		JSONObject result = googleVisionService.goGoogle(uPath+sFileName);
		
		return result;
	}
	
	
	
	
}
