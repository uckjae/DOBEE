package com.dobee.services;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.NoticeDao;
import com.dobee.vo.notice.Notice;
import com.dobee.vo.notice.NoticeFile;
import com.dobee.vo.schedule.NotSchedule;
import com.dobee.vo.schedule.Schedule;

@Service
public class NoticeService {


	@Autowired
	   private SqlSession sqlSession;
	    
	   public void setSqlsession(SqlSession sqlSession) {
	    this.sqlSession = sqlSession;
	}


    //공지사항리스트
    public List<Notice> noticeList(){
        return null;
    }

    //공지사항 글 작성 --01.21 알파카
    public int noticeWrite(Notice n){
    	int result = 0;
    	NoticeDao noticedao =sqlSession.getMapper(NoticeDao.class);
    	result = noticedao.noticeWrite(n);
    	if(result > 0) { //DB에 insert 성공하면
    		result = n.getNotSeq(); //seq 리턴함 >> setter로 주입!!
    	} else { //DB에 insert 실패
    		result = 0; 
    	}
    	
    	return result;

    }
    
    //공지사항 글 작성시 파일 업로드 --01.21 알파카
    public int noticeFileWrite(NoticeFile nf){
    	int result = 0;
    	NoticeDao noticedao =sqlSession.getMapper(NoticeDao.class);
    	result = noticedao.noticeFileWrite(nf);
    	return result;

    }
    
    //공지사항 일정 등록 --01.21 알파카
    public int addNotSchedule(NotSchedule ns) {
    	int result = 0;
    	NoticeDao noticedao =sqlSession.getMapper(NoticeDao.class);
    	result = noticedao.notshceduleWrite(ns);
    	return result;
    }

    //공지사항수정
    public void noticeModi(){

    }


    //공지사항삭제
    public void noticeDel(){

    }


    //공지사항 글 상세 가져오기 --01.21 알파카
    public Notice getNotice(int notSeq){
    	Notice notice = null;
    	NoticeDao noticedao = sqlSession.getMapper(NoticeDao.class);
    	notice = noticedao.getNotice(notSeq);
        return notice;
    }
    
    //공지사항 파일 가져오기 --01.21 알파카
    public NoticeFile getNoticeFile(int notSeq) {
    	NoticeFile nf = null;
    	NoticeDao noticedao = sqlSession.getMapper(NoticeDao.class);
    	nf = noticedao.getNoticeFile(notSeq);
    	return nf;
    }
    
    //공지사항 일정 가져오기 --01.21 알파카
    public NotSchedule getNotSchedule(int notSeq) {
    	NotSchedule ns = null;
    	NoticeDao noticedao = sqlSession.getMapper(NoticeDao.class);
    	ns = noticedao.getNotSchedule(notSeq);
    	return ns;
    }
    
    
    //공지사항 조회수 올리기 --01.21 알파카
    public int updateNoticeCount(int notSeq) {
    	int result = 0;
    	NoticeDao noticedao =sqlSession.getMapper(NoticeDao.class);
    	result = noticedao.noticeCount(notSeq);    	
    	return result;
    }
    
    
}
