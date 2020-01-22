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
		  System.out.println(debit.getCardNum());
		  System.out.println(debit.getCorp());
		  System.out.println(debit.getEntry());
		  System.out.println(debit.getName());
		  System.out.println(debit.getNickName());
		  System.out.println(debit.getValDate());
		  
		  PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		  try {
			  paymentDao.AdminEditDebit(debit);
			  result=1;
			} catch (Exception e) {
				System.out.println("DB업데이트 하다가 BD 에서 오류 났네요");
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
	
}
