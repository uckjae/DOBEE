package com.dobee.vo.member;


import lombok.Data;
import lombok.ToString;

@Data @ToString
public class Member {

    private String mail;
    private String password;
    private String name;
    private String myPic;
    private int authCode;
    private int tCode;
}
