package com.dobee.dao;

import java.util.List;

import com.dobee.vo.Apply;
import com.dobee.vo.CostCode;
import com.dobee.vo.CostList;
import com.dobee.vo.Debit;
import com.dobee.vo.ItemsCostChart;

public interface PaymentDao {

	//카드 등록
	public int addDebit(Debit debit);
	
	
    //카드목록조회
    public List<Debit> listDebit();
    

    //비용현황
    public List<CostList> payChart();


    //비용정산신청
    public void paymentApply();


    //비용처리 리스트
    public List<Apply> paymentApplyList();

    
    //비용코드 불러다주기 
    public List<CostCode> debitCode();
    
    
    //비용신청 등록하기
    public int addCostApply(CostList cost);
 

    //비용신청 리스트(=영수증 등록) 불러오기 
    public List<CostList> listReceipt();
    
    
    //관리자 법인카드 수정하기
    public int AdminEditDebit(Debit debit);
    
    
    //관리자 법인카드 삭제하기
    public int adminDelDebit(String cardNum);
    
    
    //비용데이터 불러오기  항목 차트
    public List<ItemsCostChart> paymentChart();
    
    
    //비용 연도만 가져오기 
    public List<ItemsCostChart> paymentYYYY();
    
    
    //비용 차트 연도에 해당되는 것만 가져오기
    public List<ItemsCostChart> chartByYYYY(String usedate);
    
    
    //비용 차트 연도와 월에 해당하는 것만 가져오기
    public List<ItemsCostChart> chartByYYYYAndMonth(String useDate);
    
    
    //비용 월 셀렉트 받아오기
    public List<ItemsCostChart> giveMeMonth(String yyyy);
    
    
    //법인 카드 수정시, 중복카드번호 검사
    public int checkEditDupleCardNum(String cardNum);
    
}
