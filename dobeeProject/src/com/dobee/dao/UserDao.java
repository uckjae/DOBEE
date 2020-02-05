package com.dobee.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dobee.vo.Apply;
import com.dobee.vo.ApplyCode;
import com.dobee.vo.member.Attend;
import com.dobee.vo.member.Authority;
import com.dobee.vo.member.Break;
import com.dobee.vo.member.BreakManageList;
import com.dobee.vo.member.ChartData;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.dobee.vo.member.UserInfo;

public interface UserDao {

    //로그인
    public User getUser(String mail);


    //아이디찾기
    public String findId(String name, String phone);
    
    //비밀번호찾기
    public String findPassWord2(String mail);
    
    //메일값 확인
    public String mailCheck(String mail);
    
    //비밀번호 업데이트
    public String passwordChange(String password, String mail);


    //비밀번호재설정
    //public void resetPwd(String mail, String phone, String newPwd);
    ;
    
    
    //비밀번호 설정
    public void resetPwd(User user);


    // 출퇴근 여부 확인 (0퇴근, 1출근)		0126 게다죽  ~ing			
    public String isWork(String mail);	
    	
    	
    // 출근하기	
    public int onWork(String mail);	
	
    	
    // 퇴근하기	
    public int offWork(Integer attSeq);	
    
    
    //자신을 제외하고 출근한 팀원 가져오기
    public List<User> getOnWorkTeamMember(User user);
	
	
    //부재		일단 남겨놓고	
    public void restWork(User member);
    
    
    //마이페이지 개인 정보 불러오기
    /* 01.22 알파카 */
    public User getUserInfo(String mail);
    
    //마이페이지 정보수정
    /* 01.22 알파카 */
    public int mypageModify(User user);


    // Ajax 개인_연차 불러오기
    /* 01.12 게다죽 */
    public List<Break> getVacationInBM(String mail);
    
    
    // Ajax 개인_월 근무시간 불러오기
    /* 02.05 게다죽 */
    public List<Integer> getWorkHour(String mail, String ym);
    
    
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
    
    
    // Ajx 개인_부재일정 신청 - 캘린더 Event 불러오기	(싸그리)		0118	COMPLETE		//////////////////////////////////////////////////////////////
    public List<Apply> Calendar();
    
    
    // Ajx 개인_연장근무 신청 - 캘린더 Event 불러오기 (싸그리)		0119	COMPLETE		    
    public List<Apply> ExtAll(String drafter);
    
    
    // 개인_근무내역확인
    public List<Attend> workChart();
    
    
    // 개인_근무내역 관리 - 연장근무 신청 내역 불러오기			0121	COMPLETE
    public List<Apply> getExtList(String drafter);
    
    
	// 개인_근무내역 확인 차트 데이터 불러오기          0129    COMPLETE
    public List<ChartData> getChartData(String mail, String ym);
    
    
    // 개인_연장근무 수정/삭제 (GET) - 페이지 데이터 불러오기			0121	COMPLETE
    public Apply getELforEdit(Apply apply);
    
    
    // 개인_연장근무 신청 수정 Page POST		0121 게다죽		COMPLETE
    public int postEditExtApply (Apply apply);
    

    // 개인_연장근무 신청 삭제 POST		0121 게다죽		COMPLETE
    public int postDeleteExtList (Integer aplSeq);
    
    
    // 매니저_부재관리 - 데이터 테이블 출력 (GET)		0114
    public List<BreakManageList> breakListMgr(Integer teamCode);
    
    
    // 매니저_부재관리 - isAuth update (POST)		0115
    public int absReqHandle(Apply apply);
    
    
    // Ajax 매니저_부재관리 - Option - 부재항목 loading		0114
    public List<ApplyCode> breakEntryListMgr();
    

    // 매니저_연장근무관리 - 데이터 테이블 출력 (GET)		0115
    public List<BreakManageList> extListMgr(Integer teamCode);
    
    
    // 매니저_연장근무관리 - isAuth update (POST)		0115
    public int extReqHandle(Apply apply);
    
    
    // Ajax 개인_연장근무 년도 불러오기
    /* 01.10 게다죽 */
    public List<Integer> overTimeYearList(String mail);
    
    
    // Ajax 개인_연장근무 월 불러오기
    /* 01.10 게다죽 */
    public List<Integer> overTimeMonthList(String mail);
    
    
    // Ajax 개인_근무 차트 년월 Option 불러오기     0129 COMPLETE
    public List<Integer> overTimeYearMonthList(String mail);
    
    
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
    public int addUser(User user);
    
    
    //사원정보추가
    public int addUserInfo(User user);
    
    //사원 정보 수정 --01.23 알파카
    public int modifyUser(User user);
    
    //사원 삭제 --01.23 알파카
    public int deleteUser(String mail);
    
    
    //비밀번호 업데이트
    public void updatePassword(String mail, String password);
    
    
    //팀 리스트 조회
    public List<TeamList> teamList();
    
    
    //팀 정보얻기
    public TeamList getTeam(String teamCode);
    
    
    //팀 코드 수정하기-성호
    public int modifyTeamCode(HashMap team);
    
    
    //팀 코드 삭제하기-성호
    public int delTeamCode(int teamCode);
    
    
    //팀 코드 등록하기-성호
    public int addTeamList(TeamList tl);
    
    
    //사원 등록 이메일 중복 확인 - 성호
    public ArrayList<UserInfo> checkEmail(String mail);
    
}
