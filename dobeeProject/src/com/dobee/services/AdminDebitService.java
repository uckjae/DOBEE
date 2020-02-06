package com.dobee.services;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.PaymentDao;
import com.dobee.vo.Debit;

@Service
public class AdminDebitService {

	  @Autowired
	  SqlSession sqlSession;
	  
	  public AdminDebitService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	//관리자 법인카드 수정  
	public int updateDebit(Debit debit) {
		  int result = 0;
		  
		  PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		  try {
			  paymentDao.AdminEditDebit(debit);
			  result=1;
			} catch (Exception e) {
				result=0;
			}
		  return result;
	  }
	  
	
	//관리자 법인카드 삭제하기
	public int deleteDebit(String cardNum) {
		int result = 0 ; 
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		result = paymentDao.adminDelDebit(cardNum);
		
		return result;
	}
	
	
	
	//법인 카드 수정시 중복카드 검색
	public int checkEditDupleCardNum(String cardNum) {
		int result = 0 ;
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		result = paymentDao.checkEditDupleCardNum(cardNum);
		
		return result;
	}
}
