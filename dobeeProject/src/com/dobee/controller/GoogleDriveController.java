package com.dobee.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dobee.services.GoogleDriveApiService;

@Controller
public class GoogleDriveController {
	@Autowired
	GoogleDriveApiService googleDriveApiService;
	
	public GoogleDriveController() {
		System.out.println("구글 드라이브 API 시작합니다");
	}

	@RequestMapping("googleDrive.do")
	public String doDrvie() throws IOException, GeneralSecurityException {
		System.out.println("구글 드라이브 컨트롤단 :  일단 맵핑 함수 도착");
		googleDriveApiService.googleDrive();
		System.out.println("구글 드라이브 컨트롤단 : 구글 드라이브 함수 실행 이후까지 왔음");
		
		return "payment/googleDrive";
	}
	
	
	@RequestMapping("googleDrivePicker.do")
	public String doDrviePicker() {
		System.out.println("구글 드라이브 컨트롤단 피커!!! :  일단 맵핑 함수 도착");
		
		return "payment/helloworld";
	}
	
	
}
