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

import com.dobee.services.GoogleVisionService;
import com.google.cloud.vision.v1.AnnotateImageResponse;

@Controller
@RequestMapping("ajax/googleVision/**")
public class AjaxController_GoogleVision {

	// 구글 비전을 사용하기 위해 쓰이는 서비스단
	@Autowired
	private GoogleVisionService googleVisionService;
	
	// 구글 비전 요청시 해당 이미지의 경로를 받아 이미지에 접근
	@RequestMapping(value="/goGoogleAjax.do", method=RequestMethod.POST)
	public @ResponseBody JSONObject visionApi(HttpServletRequest req, @RequestParam String uploadPath,
			@RequestParam String saveFileName) 
			throws Exception{
		//@RequestBody을 이용하여 paramData 스트링값으로 파라미터값을 가져온다
		
		String uPath = uploadPath;
		String sFileName = saveFileName;
		
		
		JSONObject result = googleVisionService.goGoogle(uPath+sFileName);
		
		return result;
	}
}
