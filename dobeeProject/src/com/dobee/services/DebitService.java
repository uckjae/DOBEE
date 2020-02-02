package com.dobee.services;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.PaymentDao;
import com.dobee.vo.CostList;
import com.dobee.vo.Debit;

@Service
public class DebitService {
	
	@Autowired
    private SqlSession sqlSession;

	   
    //법인 카드 등록
    public boolean addDebit(Debit debit) {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	boolean check = false;
    	System.out.println("서비스단 : 받은 데이터 : " + debit);
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
    public ArrayList<Debit> listDebit(){
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	ArrayList<Debit> listDebit = new ArrayList<>();
    	listDebit = paymentDao.listDebit();
    	return listDebit;
    }
	
    
    //비용코드 디비에서 불러다주기 
    public ArrayList listCode() {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	ArrayList costCode = paymentDao.debitCode();
    	
    	return costCode;
    }
    
    
    //비용 신청 디비에 등록하기 
    public int applyDebit(CostList cost) {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	int result = paymentDao.addCostApply(cost);
    	if(result != -1) {
    		System.out.println("서비스단 : 비용 신청 성공 ");
    	}else {
    		System.out.println("서비스단 : 비용신청 실패");
    	}
    	
    	return result;
    }
    
    
    //비용 신청(=영수증 등록) 목록 보여주기 
    public ArrayList<CostList> listReceipt() {
    	ArrayList<CostList> list = new ArrayList<>();
    	System.out.println("영수증 목록보기 서비스단 시작");
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	list = paymentDao.listReceipt();
    	System.out.println("영수증 목록보기 서비스단 일 다하고 리턴 전 ");
    	return list;
    }
    
    
}
