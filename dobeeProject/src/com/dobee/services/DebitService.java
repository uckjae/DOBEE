package com.dobee.services;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Service;

import com.dobee.dao.PaymentDao;
import com.dobee.vo.Debit;

@Service
public class DebitService {
	
	@Autowired
    private SqlSession sqlSession;
	
    public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	   
    //법인 카드 등록
    public boolean addDebit(Debit debit) {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	boolean check = false;
    	try {
    		
    		int result = paymentDao.addDebit(debit);
    		if(result == -1 ) {
        		System.out.println("카드등록 서비스단 : 카드 등록 인서트안됨");
        		check = false;
        	}else {
        		System.out.println("카드등록 서비스단 : 카드등록 성공");
        		check = true;
        	}
		} catch (Exception e) {
			System.out.println("서비스단 : 디비에 데이터 넣다가 오류났습니다 ");
		}
    
    	return check;
    }
	
    
    //법인 카드 목록 불러오기
    
	
}
