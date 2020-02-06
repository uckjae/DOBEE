package com.dobee.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<GoogleDrive> getMemberTaskChart(@RequestParam(value="pjtSeq") int pjtSeq){
		List<GoogleDrive> list = timelineService.loadTimeline(pjtSeq);
		
		return list;
	}
	
	
	//구글 드라이브 자료 등록
	@RequestMapping("addGoogleTag.do")
	public int addGoogleTag(@RequestParam(value="pjtseq") int pjtSeq,
			@RequestParam(value="gddate") Date gdDate,
			@RequestParam(value="gdurl") String gdUrl,
			@RequestParam(value="mail") String mail,
			@RequestParam(value="filename") String fileName){
		
		GoogleDrive gd = new GoogleDrive();
		gd.setFileName(fileName);
		gd.setGdDate(gdDate);
		gd.setGdUrl(gdUrl);
		gd.setMail(mail);
		gd.setPjtSeq(pjtSeq);
		
		int result = 0 ;
		result = timelineService.addGoogleTag(gd);
		if(result > 0 ) {
			System.out.println("구글 태그 등록 완료");
		}else {
			System.out.println("구글 태그 등록 실패");
		}
		
		return result;
	}
	
	
	
	//검색
	@RequestMapping("gdSearch.do")
	public List<GoogleDrive> searchGd(@RequestParam(value="option") String option,
			@RequestParam(value="searchText") String searchText,
			@RequestParam(value="pjtSeq") int pjtSeq){
		
		Map data = new HashMap();
		data.put("option", option);
		data.put("searchText", searchText);
		data.put("pjtSeq", pjtSeq);
		
		List<GoogleDrive> result = timelineService.gdSearch(data);
		
		if(result != null ) {
		}else {
		}
		
		return result;
	}
	
}
