package com.dobee.services;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.ProjectDao;
import com.dobee.vo.project.GoogleDrive;

@Service
public class TimeLineService {
	
	@Autowired
	SqlSession sqlSession;
	
	//성호 - 타임라인 불러오기 아작스 서비스 
	public List<GoogleDrive> loadTimeline(int pjtSeq) {
		ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
		List<GoogleDrive> list = projectdao.loadTimeline(pjtSeq);
		
		return list;
	}
	
	
	//성호 - 타임라인 디비 등록
	public int addGoogleTag(GoogleDrive gd) {
		int result = 0;
		ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
		result = projectdao.addGoogleTag(gd);
		
		return result;
	}
	
	
	//타임라인 검색
	public List<GoogleDrive> gdSearch(Map data){
		ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
		List<GoogleDrive> list = projectdao.gdSearch(data);
		
		return list;
	}
	
}
