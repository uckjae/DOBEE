package com.dobee.dao;

import com.dobee.vo.notice.Notice;
import com.dobee.vo.notice.NoticeFile;
import com.dobee.vo.schedule.NotSchedule;
import com.dobee.vo.schedule.Schedule;

import java.util.List;

public interface NoticeDao {


    //공지사항목록
    public List<Notice> noticeList(Notice notice);

    //공지사항작성
    public int noticeWrite(Notice n);
    
    //공지사항 파일 --01.21 알파카
    public int noticeFileWrite(NoticeFile nf);
    
    //공지사항 일정 추가 --01.21 알파카
    public int notshceduleWrite(NotSchedule ns);
        
    //공지사항 수정
    public void noticeModify(Notice notice);

    //공지사항상세보기
    public Notice noticeDetail(int notSeq);

    //공지사항 삭제
    public int noticeDel(int notSeq);
    
    //공지사항 조회수
    public int noticeCount(int notSeq);
}
