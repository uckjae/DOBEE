package com.dobee.services;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.PaymentDao;
import com.dobee.vo.CostList;
import com.dobee.vo.ItemsCostChart;

@Service
public class PaymentChartService {

	@Autowired
	SqlSession sqlSession;
	
	
	// 비용 차트 데이터 불러오기 서비스
	public ArrayList<ItemsCostChart> itemsCost() {
		ArrayList<ItemsCostChart> list = new ArrayList<>();
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		list = paymentDao.paymentChart();
		
		return list;
	}
	
	
	//비용 차트 연도만 불러오기 서비스 
	public ArrayList<ItemsCostChart> giveYYYY() {
		ArrayList<ItemsCostChart> list = new ArrayList<>();
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		list = paymentDao.paymentYYYY();
		
		return list;
	}
	
	

}
