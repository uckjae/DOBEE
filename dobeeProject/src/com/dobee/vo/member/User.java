package com.dobee.vo.member;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.ToString;

@Data @ToString
public class User {

    private String mail; 
    private String password;
    private String name; 
    private byte[] myPic;
    private int authCode;
    private int teamCode;
    private MultipartFile multiFile;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regitDate;
    private String serve;
    private String emp;
    private String position; 
    private String phone;
    private String teamName;
    
	
    private User() {}

	public User(String mail, String password, String name, byte[] myPic, int authCode, int teamCode,
			MultipartFile multiFile) {
		
		System.out.println("User constructor in!!!");
		this.mail = mail;
		this.password = password;
		this.name = name;
		this.myPic = myPic;
		this.authCode = authCode;
		this.teamCode = teamCode;
		this.multiFile = multiFile;
	}
	
	
	public void setRegitDate(String regitDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	try {
			this.regitDate = sdf.parse(regitDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
   
      
}
