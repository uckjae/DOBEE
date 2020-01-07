package com.dobee.dao;

import com.dobee.vo.Apply;
import com.dobee.vo.member.Attend;
import com.dobee.vo.member.Member;

import java.util.List;

public interface MemberDao {

    //로그인
    public String login(String mail);


    //아이디찾기
    public String findId(String name, String mail);


    //비밀번호재설정
    public void resetPwd(String mail, String phone, String newPwd);


    //출근
    public void onWork(Member member);


    //퇴근
    public void offWork(Member member);


    //부재
    public void restWork(Member member);


    //파이페이지 정보수정
    public void myPage();


    //부재일정신청
    public void absApply();


    //연장근무신청
    public void overTimeApply();


    //개인부재일정관리
    public List<Apply> absMg();


    //개인근무내역확인
    public List<Attend> workChart();


    //부재관리(팀장)
    public List<Apply> absSign();


    //연장근무관리
    public List<Apply> overTimeSign();





}
