package com.dobee.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class ItemsCostChart {
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date usedate;
	
	private int cost;
	private int costcode;
	private String entry;
	
}
