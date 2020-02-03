package com.dobee.services;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.TeamList;
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

    


    //비밀번호재설정
    public void resetPwd(User user){
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	userDao.resetPwd(user);
    }

    //출근한 팀원 목록 가져오기 02.02 알파카
    public List<User> getOnWorkTeamMember(User user){
    	List<User> onWorkTeamMemberList = null;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	onWorkTeamMemberList = userDao.getOnWorkTeamMember(user);
    	return onWorkTeamMemberList;
    }

    /* 01.23 알파카 */
    //회원수정 
    public int modifyUser(User user){
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.modifyUser(user);
    	return result;
    }


    //회원삭제
    public void delMember(){

    }
    
    
    /* 01.11 알파카 */
    //회원 목록 가져오기
    public List<User> getUserList() {
    	UserDao userdao = sqlSession.getMapper(UserDao.class);
    	List<User> result = userdao.getUserList();
    	return result;
    }
    
    
    /* 01.13 알파카 */
    //User 정보 가져오기
    public User getUser(String mail) {
    	UserDao userdao = sqlSession.getMapper(UserDao.class);
    	User user = userdao.getUser(mail);
    	return user;
    }
    
    /* 01.22 알파카 */
    //마이페이지 User 정보 가져오기
    public User getUserInfo(String mail) {
    	UserDao userdao = sqlSession.getMapper(UserDao.class);
    	User user = userdao.getUserInfo(mail);
    	System.out.println("유저 가져옴?"+user.toString());
    	return user;
    }
    
    //User 등록
    @Transactional
    public int addUser(User user) {
    	int result = 0;
    	System.out.println("MemberService addUser() in!!");
    	try {
    		UserDao userDao = sqlSession.getMapper(UserDao.class);
    		userDao.addUser(user);
    		userDao.addUserInfo(user);
    	}catch(Exception e) {
    		System.out.println("Transaction 예외발생 : " +e.getMessage());
    		throw e;
    	}
    	if(result > 0) {
    		System.out.println("멤버 추가 서비스 addUser 완료");
    	}
    	return result;
    }
    
    
    //비밀번호 업데이트
    public void updatePassword(String mail, String password) {
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	userDao.updatePassword(mail, password);
    }

    
    
    //팀 리스트 불러오기
    public List<TeamList> teamList() {
    	System.out.println("MemberService teamList()");
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	List<TeamList> teamList = userDao.teamList();
    	
    	return teamList;
    }
    
    //팀 불러오기
    public TeamList getTeam(String teamCode) {
    	System.out.println("MemberService getTeam()");
    	System.out.println(teamCode);
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	TeamList team = userDao.getTeam(teamCode);
    	System.out.println(team.toString());
    	return team;
    }
    
    
    //사원 마이페이지 수정
    public int mypageModify(User user) {
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.mypageModify(user);
    	return result;
    }
    
    //사원 삭제
    public int deleteModify(String mail) {
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.deleteUser(mail);
    	return result;
    }
    
    
    
    //팀 코드 수정 - 성호
    public int modifyTeamCode(HashMap team) {
    	int result = 0;
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.modifyTeamCode(team);
    	return result;
    }
    
    
    //팀 코드 삭제 - 성호
    public int delTeamCode(int teamCode) {
    	int result = 0 ; 
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.delTeamCode(teamCode);
    	
    	return result;
    }
    
    
    //팀 코드 등록 -성호
    public int addTeamList(TeamList tl) {
    	int result = 0; 
    	UserDao userDao = sqlSession.getMapper(UserDao.class);
    	result = userDao.addTeamList(tl);
    	
    	return result;
    }
}
