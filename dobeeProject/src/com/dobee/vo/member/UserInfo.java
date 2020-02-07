package com.dobee.vo.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class UserInfo {
    private String mail;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regitDate;
    private String serve;
    private String emp;
    private String position;
    private String phone;
    
	public Date getregitDate() {
		return this.regitDate;
	}
    
	 

}
