package com.dobee.vo.member;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
public class UserInfo {
    private String mail;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regDate;
    private String serve;
    private String emp;
    private String position;
    private String phone;
    
    
	/*
	 * public void setRegDate(String regDate) { System.out.println("setter탄다!!!");
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); Date date = new
	 * Date(); try { date = sdf.parse(regDate); } catch (ParseException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } this.regDate = date; }
	 * 
	 * 
	 * 
	 * public UserInfo(String mail, String regDate, String serve, String emp, String
	 * position, String phone) { System.out.println("constructor!!!");
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); Date date = new
	 * Date(); try { date = sdf.parse(regDate); } catch (ParseException e) { // TODO
	 * Auto-generated catch block e.printStackTrace(); } this.regDate = date;
	 * this.mail = mail; this.serve = serve; this.emp = emp; this.position =
	 * position; this.phone = phone; }
	 */

}
