package com.dobee.vo.member;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString @Data
public class UserInfo {
    private String mail;
    private Date regDate;
    private String serve;
    private String emp;
    private String position;
    private String phone;
}
