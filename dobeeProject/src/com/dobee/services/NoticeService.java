package com.dobee.services;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.vo.notice.Notice;

@Service
public class NoticeService {


	 @Autowired
	    private SqlSession sqlsession;
	    
	    public void setSqlsession(SqlSession sqlsession) {
	    	this.sqlsession = sqlsession;
	    }


    //공지사항리스트
    public List<Notice> noticeList(){
        return null;
    }


    //공지사항작성
    public void noticeWrite(){

    }


    //공지사항수정
    public void noticeModi(){

    }


    //공지사항삭제
    public void noticeDel(){

    }


    //공지사항 상세보기
    public Notice getNotice(){
        return null;
    }


    //
}
