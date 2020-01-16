package com.dobee.services;

import com.dobee.vo.CostCode;
import com.dobee.vo.CostList;
import com.dobee.vo.Debit;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {

    @Autowired
    SqlSession sqlSession;


    //카드목록조회
    public List<Debit> debitList(){
    	
        return null;
    }


    //카드추가
    public void addDebit(){

    }


    //비용현황
    public List<CostList> paymentChart(){
        return null;
    }


    //비용정산신청 사용목적리스트
    public List<CostCode> getCostCodes(){
        return null;
    }


    //비용정산신청_영수증등록
    public void regRecipt(){

    }


    //
}