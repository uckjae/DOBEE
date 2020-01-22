package com.dobee.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dobee.vo.Apply;
import com.dobee.vo.ApplyCode;
import com.dobee.vo.member.Attend;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.Break;
import com.dobee.vo.member.BreakManageList;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.dobee.vo.member.UserInfo;
import com.sun.media.jfxmedia.logging.Logger;

public interface UserDao {

    //로그인
    public User getUser(String mail);


    //아이디찾기
    public String findId(String name, String phone);


    //비밀번호재설정
    //public void resetPwd(String mail, String phone, String newPwd);
    
    
    //비밀번호 설정
    public void resetPwd(User user);


    //출근하기 
    public int onWork(String mail);


    //퇴근
    public void offWork(User member);


    //부재
    public void restWork(User member);


    //마이페이지 정보수정
    public void myPage();
    
    //마이페이지 개인 정보 불러오기 
    public User getUserInfo(String mail);


    // Ajax 개인_연차 불러오기
    /* 01.12 게다죽 */
    public List<Break> getVacationInBM(String mail);
    
    
    // 개인_부재일정신청
    /* 01.12 게다죽 */
    public int absApply(Apply apply);
    
    
    // 개인_부재일정 수정	0120 GET			COMPLETE
    public BreakManageList getBMLforEdit(Apply apply);
    

    // 개인_부재일정 수정	0120 POST			COMPLETE
    public int postEditApply(BreakManageList bml); 
    
    
    // 개인_부재일정 삭제	0120 POST			COMPLETE
    public void deleteApply(Integer aplSeq);
    
    
    // Ajax 부재 항목 불러오기
    /* 01.10 게다죽 */
    public List<ApplyCode> getApyCode();
      

    // Ajax 부재 결재자 불러오기
    /* 01.10 게다죽 */
    public ArrayList<User> getApprovalList();

    
    // 개인_연장근무신청
    /* 01.12 게다죽 */
    public int overTimeApply(Apply apply);


    // 개인_부재일정확인 - table 데이터 불러오기
    /* 01.12 게다죽 */
    public List<BreakManageList> absMg(String drafter);
  
    
    // Ajax 개인부재일정확인 - Option - 년도 loading		0113
    public List<Integer> breakYearList(String mail);
    
    
    // Ajax 개인부재일정확인 - 년도별 List 출력		0113
    public List<BreakManageList> getBreakListByYear(String drafter);
    
    
    // Ajax 개인부재일정확인 - Option - 월 loading		0113
    public List<Integer> breakYearMonthList(String drafter);
    
    
    // Ajax 개인부재일정확인 - 년-월별 List 출력		0113
    public List<BreakManageList> getBreakListByYMonth(String drafter);
    
    
    // Ajax 개인부재일정확인 - Option - 부재항목 loading		0113
    public List<ApplyCode> breakEntryList(String drafter);
    
    
    // Ajax 개인부재일정확인 - 부재항목 별 List 출력		0113
    public List<BreakManageList> getBreakListByEntry(String drafter);
    

    // Ajax 개인부재일정확인 - Option - 승인여부 loading		0113
    public List<String> breakIsAuthList(String drafter);
    
    
    // Ajax 개인부재일정확인 - 승인여부 별  List 출력		0113
    public List<BreakManageList> getBreakListByIsAuth(String drafter);

    
    // Ajx 개인_부재일정 신청 - 캘린더 Event 불러오기	(싸그리)		0118	COMPLETE
    public List<Apply> AbsAll(String drafter);
    
    
    // Ajx 개인_연장근무 신청 - 캘린더 Event 불러오기 (싸그리)		0119	COMPLETE		    
    public List<Apply> ExtAll(String drafter);
    
    
    // 개인_근무내역확인
    public List<Attend> workChart();
    
    
    // 개인_근무내역 관리 - 연장근무 신청 내역 불러오기			0121	COMPLETE
    public List<Apply> getExtList(String drafter);
    
    
    // 개인_연장근무 수정/삭제 (GET) - 페이지 데이터 불러오기			0121	COMPLETE
    public Apply getELforEdit(Apply apply);
    
    
    // 개인_연장근무 신청 수정 Page POST		0121 게다죽		COMPLETE
    public int postEditExtApply (Apply apply);
    

    // 개인_연장근무 신청 삭제 POST		0121 게다죽		COMPLETE
    public int postDeleteExtList (Integer aplSeq);
    
    
    // 매니저_부재관리 - 데이터 테이블 출력 (GET)		0114
    public List<BreakManageList> breakListMgr();
    
    
    // 매니저_부재관리 - isAuth update (POST)		0115
    public int absReqHandle(Apply apply);
    
    
    // Ajax 매니저_부재관리 - Option - 부재항목 loading		0114
    public List<ApplyCode> breakEntryListMgr();
    

    // 매니저_연장근무관리 - 데이터 테이블 출력 (GET)		0115
    public List<BreakManageList> extListMgr();
    
    
    // 매니저_연장근무관리 - isAuth update (POST)		0115
    public int extReqHandle(Apply apply);
    
    
    // Ajax 개인_연장근무 년도 불러오기
    /* 01.10 게다죽 */
    public List<Integer> overTimeYearList(String mail);
    
    
    // Ajax 개인_연장근무 월 불러오기
    /* 01.10 게다죽 */
    public List<Integer> overTimeMonthList(String mail);
    
    
    //유저 리스트 가져오기
    /* 01.09 알파카 */
    public List<User> getUserList();
    
    
    //UserInfoList 가져오기
    public List<User> getUserInfoList();
    
    
    //Authority 목록불러오기
    public List<Authority> getAuthority();
    
    
    //TeamList 불러오기
    public List<TeamList> getTeamList();
    

    //사원추가
    public void addUser(User user);
    
    
    //사원정보추가
    public void addUserInfo(User user);
    
    
    //비밀번호 업데이트
    public void updatePassword(String mail, String password);
    
    
    //팀 리스트 조회
    public List<TeamList> teamList();
    
    
    //팀 정보얻기
    public TeamList getTeam(String teamCode);
}
