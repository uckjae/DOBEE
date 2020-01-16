package com.dobee.dao;

import com.dobee.vo.notice.Notice;

import java.util.List;

public interface NoticeDao {


    //공지사항목록
    public List<Notice> noticeList(Notice notice);

    //공지사항작성
    public void noticeWrite(Notice n);
    
    //공지사항 수정
    public void noticeModify(Notice notice);

    //공지사항상세보기
    public Notice noticeDetail(int notSeq);

    //공지사항 삭제
    public int noticeDel(int notSeq);
    
    //공지사항 조회수
    public int noticeCount(int notSeq);
}
