package com.dobee.dao;

import com.dobee.vo.notice.Notice;

import java.util.List;

public interface NoticeDao {


    //공지사항목록
    public List<Notice> noticeList(Notice notice);


    //공지사항작성
    public void noticeWrite();


    //공지사항상세보기
    public Notice noticeDetail();


    //
}
