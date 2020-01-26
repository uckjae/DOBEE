package com.dobee.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.dobee.services.PaymentChartService;
import com.dobee.vo.CostList;
import com.dobee.vo.ItemsCostChart;

@RestController
public class AjaxController_paymentChart {

	@Autowired
	PaymentChartService paymentChartService;

	
	//차트 뷰단에 데이터 보내기
	@RequestMapping(value="paymentAjaxChart.do", method=RequestMethod.POST)
	public ArrayList<ItemsCostChart> paymentChartOK() {
		System.out.println("다정아??");
		ArrayList<ItemsCostChart> list = paymentChartService.itemsCost();
		return list;
	}
	
	
	//아작스로 비용 연도만 있는 거 불러오기
	@RequestMapping("comeHereYYYY.do")
	public ArrayList<ItemsCostChart> giveMeYYYY() {
		System.out.println("다정아??여기 타니 다정아?");
		ArrayList<ItemsCostChart> list = paymentChartService.giveYYYY();
		return list;
	}
	
	
	
}
