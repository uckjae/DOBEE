package com.dobee.services;

import com.dobee.vo.Apply;
import com.dobee.vo.member.Attend;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyService {

    @Autowired
    SqlSession sqlSession;


    //부재일정신청
    public void absApply(){

    }


    //연장근무신청
    public void overtimeApply(){

    }


    //부재일정관리
    public List<Apply> absMg(){
        return null;
    }


    //근무내역확인
    public List<Attend> workChart(){
        return null;
    }


    //부재관리_PM
    public List<Apply> absSign(){
        return null;
    }


    //부재관리_승인
    public void absSignApprov(){

    }


    //연장근무관리_PM
    public List<Apply> overtimeSign(){
        return null;
    }


    //연장근무관리_승인
    public void overtiemSignApprov(){

    }


}
