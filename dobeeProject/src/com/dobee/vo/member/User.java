package com.dobee.vo.member;


import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
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
   
      
}
