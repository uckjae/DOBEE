package com.dobee.services;

import java.util.List;

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
    	try {
    		
    		int result = paymentDao.addDebit(debit);
    		if(result == -1 ) {
        		check = false;
        	}else {
        		check = true;
        	}
		} catch (Exception e) {
			check = false;
		}
    
    	return check;
    }
	
    
    //법인 카드 목록 불러오기
    public List<Debit> listDebit(){
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	List<Debit> listDebit = paymentDao.listDebit();
    	return listDebit;
    }
	
    
    //비용코드 디비에서 불러다주기 
    public List listCode() {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	List costCode = paymentDao.debitCode();
    	
    	return costCode;
    }
    
    
    //비용 신청 디비에 등록하기 
    public int applyDebit(CostList cost) {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	int result = paymentDao.addCostApply(cost);
    	
    	return result;
    }
    
    
    //비용 신청(=영수증 등록) 목록 보여주기 
    public List<CostList> listReceipt() {
    	PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
    	List<CostList> list = paymentDao.listReceipt();
    	
    	return list;
    }
    
    
}
