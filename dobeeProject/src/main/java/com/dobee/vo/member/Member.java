package com.dobee.vo.member;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Setter @Getter
public class Member {

    private String mail;
    private String password;
    private String name;
    private String myPic;
    private int authCode;
    private int tCode;
}
