package com.dobee.controller;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("*.do")
public class DoController {

    @Autowired
    private SqlSession sqlSession;


    //로그인
    @RequestMapping
    public String login(){
        return null;
    }

    //아이디찾기
    public String fidId(){
        return null;
    }


    public String fidIdResult(){
        return null;
    }

    //비밀번호재설정
    public String resetPwd(){
        return null;
    }


    public String resetPwdResult(){
        return null;
    }


    //메인페이지(로그인후)
    @RequestMapping(value="", method = RequestMethod.GET)
    public String main(){
        return null;
    }


    //회사 일정등록
    @RequestMapping(value = "", method = RequestMethod.POST)
    public String addSchedule(){
        return null;
    }


    //출근/퇴근버튼
    public String attendButton(){
        return null;
    }


    //마이페이지
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String mypage(){
        return null;
    }


    @RequestMapping(value = "", method = RequestMethod.POST)
    public String mypageModi(){
        return null;
    }


    //공지사항리스트
    public String noticeList(){
        return null;
    }


    //공지사항상세보기
    public String noticeDetail(){
        return null;
    }


    //공지사항글쓰기
    public String noticeWrite(){
        return null;
    }


    //공지사항수정하기
    public String noticeModi(){
        return null;
    }


    //공지사항삭제하기
    public String noticeDelte(){
        return null;
    }


    //부재일정신청
    public String absApply(){
        return null;
    }


    //연장근무신청
    public String overTiemApply(){
        return null;
    }


    //부재일정관리
    public String absMg(){
        return null;
    }


    //근무내역확인
    public String workChart(){
        return null;
    }


    //부재관리
    public String absSign(){
        return null;
    }


    //연장근무관리 리스트
    public String overtiemSignList(){
        return null;
    }


    //연장근무관리 승인
    public String overtimeSingApprov(){
        return null;
    }


    //연장근무관리 거절
    public String overtimeSignReject(){
        return null;
    }


    //카드관리 리스트
    public String debitList(){
        return null;
    }


    //카드관리 카드추가
    public String addDebit(){
        return null;
    }


    //비용현황
    public String paymentChart(){
    	return null;
    }


    //비용정산신청
    public String receipt() {
    	return null;
    }


    //프로젝트메인


    //프로젝트생성


    //칸반보드


    //업무생성


    //업무삭제


    //업무상세정보입력


    //상세업무조회


    //상세업무 입력


    //상세업무수정


    //상세업무 삭제


    //체크리스트조회


    //체크리스트 입력


    //체크리스트 수정정


    //체크리스트삭


    //프로젝트 캘린더


    //프로젝트 분석


    //채팅
}
