package com.dobee.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class CostList {
    private int costSeq;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date regitReceiptDate;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date useDate;
    
    private String useAt;
    private int cost;
    private String detail;
    private int costCode;
    private String cardNum;
    private String mail;
}
