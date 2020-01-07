package com.dobee.vo.member;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString @Getter @Setter
public class MemberInfo {
    private String mail;
    private Date regDate;
    private String serve;
    private String emp;
    private String position;
    private String phone;
}
