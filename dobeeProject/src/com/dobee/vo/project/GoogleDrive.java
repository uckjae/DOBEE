package com.dobee.vo.project;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class GoogleDrive {
	private int gdSeq;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date gdDate;
	private String gdContent;
	private String gdUrl; 
	private String mail;
	private String pjtSeq;
	
}
