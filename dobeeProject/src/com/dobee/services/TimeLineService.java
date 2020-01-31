package com.dobee.services;

import java.util.ArrayList;

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
	public ArrayList<GoogleDrive> loadTimeline(int pjtSeq) {
		ProjectDao projectdao = sqlSession.getMapper(ProjectDao.class);
		ArrayList<GoogleDrive> list = new ArrayList<>(); 
		list = projectdao.loadTimeline(pjtSeq);
		
		return null;
	}
	
}
