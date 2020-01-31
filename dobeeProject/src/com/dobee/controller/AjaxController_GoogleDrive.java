package com.dobee.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.TimeLineService;
import com.dobee.vo.project.GoogleDrive;

@RestController
@RequestMapping("ajax/googleDrive/**")
public class AjaxController_GoogleDrive {
	
	@Autowired
	TimeLineService timelineService;
	

	//프로젝트 마다 해당 구글 드라이브 아작스로 불러와서 데이터 넘겨주는 함수
	@RequestMapping("loadTimeLine.do")
	public ArrayList<GoogleDrive> getMemberTaskChart(@RequestParam(value="pjtSeq") int pjtSeq){
		ArrayList<GoogleDrive> list = new ArrayList<>();
		list = timelineService.loadTimeline(pjtSeq);
		
		return list;
	}
}
