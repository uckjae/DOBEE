package com.dobee.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("*.do")
public class DoController {

    @Autowired
    private SqlSession sqlSession;


    //로그인


    //아이디찾기


    //비밀번호재설정


    //메인페이지


    //회사 일정등록


    //출근/퇴근버튼


    //마이페이지


    //공지사항리스트


    //공지사항상세보기


    //공지사항글쓰기


    //공지사항수정하기


    //
}
