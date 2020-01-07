package com.dobee.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@ToString
@Getter
@Setter
public class CostList {
    private int cSeq;
    private Date regDate;
    private Date useDate;
    private String useAt;
    private int cost;
    private String detail;
    private int code;
    private int cardNum;
    private int mail;
}
