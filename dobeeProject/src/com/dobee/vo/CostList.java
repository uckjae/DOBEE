package com.dobee.vo;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class CostList {
    private int costSeq;
    private Date regDate;
    private Date useDate;
    private String useAt;
    private int cost;
    private String detail;
    private int code;
    private int cardNum;
    private int mail;
}
