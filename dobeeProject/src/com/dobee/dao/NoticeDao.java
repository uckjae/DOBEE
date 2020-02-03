package com.dobee.dao;

import com.dobee.vo.notice.Notice;
import com.dobee.vo.notice.NoticeFile;
import com.dobee.vo.schedule.MainSchedule;
import com.dobee.vo.schedule.NotSchedule;
import com.dobee.vo.schedule.Schedule;

import java.util.List;

public interface NoticeDao {

    //공지사항목록
    public List<Notice> noticeList(Notice notice);

    //공지사항 작성
    public int noticeWrite(Notice n);
    
    //공지사항 파일 작성 --01.21 알파카
    public int noticeFileWrite(NoticeFile nf);
    
    //공지사항 일정 추가 --01.21 알파카
    public int notshceduleWrite(NotSchedule ns);
        
    //공지사항 글 가져오기 --01.21 알파카
    public Notice getNotice(int notSeq);
    
    //공지사항 파일 가져오기 --01.21 알파카
    public NoticeFile getNoticeFile(int notSeq);
    
    //공지사항 일정 가져오기 --01.21 알파카
    public NotSchedule getNotSchedule(int notSeq);
    
    //공지사항 글 수정 --01.22 알파카
    public int noticeModify(Notice notice);
    
    //공지사항 파일 수정 --01.22 알파카
    public int noticeFileModify(NoticeFile nf);
    
    //공지사항 일정 수정 --01.22 알파카
    public int notshceduleModify(NotSchedule ns);
        
    //공지사항 삭제 --01.21 알파카
    public int delNotice(int notSeq);
    
    //공지사항 조회수 --01.21 알파카
    public int noticeCount(int notSeq);
    
    //공지사항 최신글 가져오기 (메인용) --02.03 알파카 getRecentNotice
    public List<Notice> getRecentNotice();
    
}
