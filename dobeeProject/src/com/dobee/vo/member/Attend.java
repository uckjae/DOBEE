package com.dobee.vo.member;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Data
public class Attend {
    private int attSeq;
    private int attTime;
    private String mail;
    private int attCode;
}
