package com.dobee.vo.member;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Data;
import lombok.ToString;

@Data @ToString
public class User {

    private String mail; 
    private String password;
    private String name; 
    private String myPic; //사원 사진 저장 이름
    private int authCode;
    private int teamCode;
    private CommonsMultipartFile file;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regitDate;
    private String serve;
    private String emp;
    private String position; 
    private String phone;
    private String teamName;
    private String isWork;
    
	
    private User() {}

	public void setRegitDate(String regitDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			this.regitDate = sdf.parse(regitDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

	public User(String mail, String password, String name, String myPic, int authCode, int teamCode,
			CommonsMultipartFile file, Date regitDate, String serve, String emp, String position, String phone,
			String teamName, String isWork) {
		super();
		this.mail = mail;
		this.password = password;
		this.name = name;
		this.myPic = myPic;
		this.authCode = authCode;
		this.teamCode = teamCode;
		this.file = file;
		this.regitDate = regitDate;
		this.serve = serve;
		this.emp = emp;
		this.position = position;
		this.phone = phone;
		this.teamName = teamName;
		this.isWork = isWork;
	}
   
      
}
