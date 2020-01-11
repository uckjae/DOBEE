package com.dobee.services;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.UserDao;
import com.dobee.vo.member.User;

@Service
public class MemberService {


	@Autowired
    private SqlSession sqlSession;
	
    public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	//로그인
    public User getMember(){
        return null;
    }


    //아이디찾기


    //비밀번호재설정
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
    
    
    /* 01.11 알파카 */
    //회원 목록 가져오기
    public List<User> getUserList() {
    	UserDao userdao = sqlSession.getMapper(UserDao.class);
    	List<User> result = userdao.getUserList();
    	System.out.println("유저리스트"+result.toString());
    	System.out.println("유저리스트 갯수"+result.size());
    	return result;
    }
    

}
