package com.dobee.dao;

import java.util.ArrayList;
import java.util.List;

import com.dobee.vo.Apply;
import com.dobee.vo.CostCode;
import com.dobee.vo.CostList;
import com.dobee.vo.Debit;

public interface PaymentDao {

	//카드 등록
	public int addDebit(Debit debit);
	
	
    //카드목록조회
    public ArrayList<Debit> listDebit();
    

    //비용현황
    public List<CostList> payChart();


    //비용정산신청
    public void paymentApply();


    //비용처리 리스트
    public List<Apply> paymentApplyList();

    
    //비용코드 불러다주기 
    public ArrayList<CostCode> debitCode();
    
    
    //비용신청 등록하기
    public int addCostApply(CostList cost);
 

    //비용신청 리스트 불러오기 
    //public ArrayList<CostList> 
}
