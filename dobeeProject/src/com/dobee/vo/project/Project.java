package com.dobee.vo.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Project {
    private int pjtSeq;
    private String pjtName;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pjtStartAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pjtEndAt;
    private String pjtProgress;
    

	public void setPjtStartAt(String pjtStartAt) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
    		this.pjtStartAt = sdf.parse(pjtStartAt);
    	} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void setPjtEndAt(String pjtEndAt) {
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
    		this.pjtEndAt = sdf.parse(pjtEndAt);
    	} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    
}
