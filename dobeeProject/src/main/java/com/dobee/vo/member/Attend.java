package com.dobee.vo.member;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Getter @Setter
public class Attend {
    private int seq;
    private int atTime;
    private String mail;
    private int attSeq;
}
