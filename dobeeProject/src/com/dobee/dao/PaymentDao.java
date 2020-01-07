package com.dobee.dao;

import com.dobee.vo.Apply;
import com.dobee.vo.CostList;
import com.dobee.vo.Debit;

import java.util.List;

public interface PaymentDao {


    //카드목록조회
    public List<Debit> debitList();


    //비용현황
    public List<CostList> payChart();


    //비용정산신청
    public void paymentApply();


    //비용처리 리스트
    public List<Apply> paymentApplyList();



}
