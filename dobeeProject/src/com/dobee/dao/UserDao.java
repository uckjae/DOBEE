package com.dobee.dao;

import java.util.ArrayList;
import java.util.List;

import com.dobee.vo.Apply;
import com.dobee.vo.ApplyCode;
import com.dobee.vo.member.Attend;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.Break;
import com.dobee.vo.member.BreakManageList;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.dobee.vo.member.UserInfo;

public interface UserDao {

    //로그인
    public User getUser(String mail);


    //아이디찾기
    public String findId(String name, String mail);


    //비밀번호재설정
    //public void resetPwd(String mail, String phone, String newPwd);
    
    
    //비밀번호 설정
    public void resetPwd(User user);


    //출근
    public void onWork(User member);


    //퇴근
    public void offWork(User member);


    //부재
    public void restWork(User member);


    //파이페이지 정보수정
    public void myPage();


    // Ajax 개인_연차 불러오기
    /* 01.12 게다죽 */
    public List<Break> getVacationInBM(String mail);
    
    
    // 개인_부재일정신청
    /* 01.12 게다죽 */
    public int absApply(Apply apply);
    
    
    // 부재 항목 불러오기
    /* 01.10 게다죽 */
    public List<ApplyCode> getApyCode();
      

    // 부재 결재자 불러오기
    /* 01.10 게다죽 */
    public ArrayList<User> getApprovalList();

    
    // 개인_연장근무신청
    /* 01.12 게다죽 */
    public int overTimeApply(Apply apply);


    // 개인_부재일정확인 - table 데이터 불러오기
    /* 01.12 게다죽 */
    public List<BreakManageList> absMg(Apply apply);

    
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
    
        
    //개인근무내역확인
    public List<Attend> workChart();


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
    public List<UserInfo> getUserInfoList();
    
    
    //Authority 목록불러오기
    public List<Authority> getAuthority();
    
    
    //TeamList 불러오기
    public List<TeamList> getTeamList();
    

    //사원추가
    public void addUser(User user);
    
    
    //사원정보추가
    public void addUserInfo(UserInfo userInfo);
    
    
    //비밀번호 업데이트
    public void updatePassword(String mail, String password);
    
    
    //팀 리스트 조회
    public List<TeamList> teamList();
}
