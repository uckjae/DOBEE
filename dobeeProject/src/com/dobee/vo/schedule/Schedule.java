package com.dobee.vo.schedule;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Schedule {
    private int schSeq;
    private Date startTime;
    private Date endTime;
    
    
    public void setStartTime(String startTime) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			this.startTime = sdf.parse(startTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    
    public void setEndTime(String endTime) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
    		this.endTime = sdf.parse(endTime);
    	} catch (ParseException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
    	
    }
}
