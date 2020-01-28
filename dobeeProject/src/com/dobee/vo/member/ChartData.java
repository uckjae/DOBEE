package com.dobee.vo.member;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString @Data
public class ChartData {
    private int days;
    private String attTime;
    private String offTime;
    private String mail;
    private String entry;
}
