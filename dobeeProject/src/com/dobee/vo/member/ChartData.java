package com.dobee.vo.member;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Data
public class ChartData {
    private int attSeq;
    private String attTime;
    private String mail;
    private int attCode;
}
