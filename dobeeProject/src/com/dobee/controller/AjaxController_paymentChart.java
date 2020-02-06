package com.dobee.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.PaymentChartService;
import com.dobee.vo.ItemsCostChart;

@RestController
@RequestMapping("ajax/paymentChart/**")
public class AjaxController_paymentChart {

	@Autowired
	PaymentChartService paymentChartService;


	
	//아작스로 비용 연도만 있는 거 불러오기
	@RequestMapping("comeHereYYYY.do")
	public List<ItemsCostChart> giveMeYYYY() {
		List<ItemsCostChart> list = paymentChartService.giveYYYY();
		return list;
	}
	
	
	//아작스 연도 선택하면 그에 해당하는 비용 데이터 보내주기
	@RequestMapping("changeYYYYSelect.do")
	public List<ItemsCostChart> paymentSelectYYYY(@RequestParam(value="usedate") String usedate ){
		List<ItemsCostChart> list = paymentChartService.chartByYYYY(usedate);
		
		return list;
	}
	
	
	//아작스 월이 없음이 아니라 월이 선택되어있다면, 선택하면 그에 해당하는 비용 데이터 보내주기
	@RequestMapping("changeYYYYAndMonth.do")
	public List<ItemsCostChart> paymentSelectYYYYAndMonth(@RequestParam(value="yyyy") String yyyy,
			@RequestParam(value="month") String month){
		// 여기에서 연도랑 월 같이 스트링으로 만들어줘서 서비스단으로 보내기
		String useDate = yyyy + "-" + month;
		List<ItemsCostChart> list = paymentChartService.changeYYYYAndMonth(useDate);
		
		return list;
	}
	
	
	//아작스 연도 셀렉트의 연도 받아와서 그해에 있는 데이터가있는 월 데이터만 받아서 월셀렉트에 붙여넣기
	@RequestMapping("giveMeMonth.do")
	public List<ItemsCostChart> giveMeMonth(@RequestParam(value="usedate") String yyyy){
		List<ItemsCostChart> list = paymentChartService.giveMeMonth(yyyy);
		
		return list;
	}
	
}
