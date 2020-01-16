package com.dobee.services;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.TeamList;
import com.dobee.vo.member.User;
import com.dobee.vo.member.UserInfo;

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
    
    
    //User 등록
    @Transactional
    public void addUser(User user, UserInfo userInfo) {
    	System.out.println("MemberService addUser() in!!");
    	try {
			user.setMyPic(user.getMultiFile().getBytes());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			System.out.println("MemberService addUser() 파일바이트변환 에러");
		}
    	
    	
    	try {
    		UserDao userDao = sqlSession.getMapper(UserDao.class);
    		userDao.addUser(user);
    		userDao.addUserInfo(userInfo);
    	}catch(Exception e) {
    		System.out.println("Transaction 예외발생 : " +e.getMessage());
    		throw e;
    	}
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

}
