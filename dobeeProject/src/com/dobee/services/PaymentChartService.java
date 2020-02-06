package com.dobee.services;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dobee.dao.PaymentDao;
import com.dobee.vo.ItemsCostChart;

@Service
public class PaymentChartService {

	@Autowired
	SqlSession sqlSession;
	
	
	// 비용 차트 데이터 불러오기 서비스
	public List<ItemsCostChart> itemsCost() {
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		List<ItemsCostChart> list = paymentDao.paymentChart();
		
		return list;
	}
	
	
	//비용 차트 연도만 불러오기 서비스 
	public List<ItemsCostChart> giveYYYY() {
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		List<ItemsCostChart> list = paymentDao.paymentYYYY();
		
		return list;
	}
	
	
	//아작스 연도 선택하면 그에 해당하는 비용 데이터 보내주기
	public List<ItemsCostChart> chartByYYYY(String usedate){
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		List<ItemsCostChart> list = paymentDao.chartByYYYY(usedate);
		
		return list;
	}
		
		
		
	//아작스 월 선택하면 그에 해당하는 비용 데이터 보내주기
	public List<ItemsCostChart> changeYYYYAndMonth(String usedate){
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		List<ItemsCostChart> list = paymentDao.chartByYYYYAndMonth(usedate);
		
		return list;
	}
	
	
	
	//아작스 연도 셀렉트 선택하면 그해에 데이터가 있는 월 데이터 받아서보내주기
	public List<ItemsCostChart> giveMeMonth(String yyyy){
		PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
		List<ItemsCostChart> list = paymentDao.giveMeMonth(yyyy);
		
		return list;
	}
	
	
	
	
}
