package com.dobee.services;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.vo.member.User;

@Service
public class MemberService {


	@Autowired
    private SqlSession sqlSession;


    //로그인
    public User getMember(){
        return null;
    }


    //아이디찾기


    //비밀번호재설정정
    public void updateMember(){

    }


    //출근
    public void onWork(){

    }


    //퇴근
    public void offWork(){

    }


    //회원수정
    public void modiMember(){

    }


    //회원삭제
    public void delMember(){

    }



}
